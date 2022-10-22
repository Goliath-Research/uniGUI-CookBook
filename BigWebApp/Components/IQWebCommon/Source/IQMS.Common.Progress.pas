unit IQMS.Common.Progress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.ComCtrls, IQMS.Common.TaskBarProgress,
  uniGUIApplication, UniProgressBar, UniStatusBar, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.Phys;

{ Creates a run time progress bar in a status bar panel. }
{ How to use TIQProgressBar:

  1.  Declare IQProg in the unit's "uses" clause.

  2.  To begin using the progress bar, call CreateProgressBar.  This method
  creates the progress bar, using the name of the status bar and the
  index of the panel, and the min and max values that you pass to it.  There
  is nothing else to it.  Now you can start incrementing the values.

  3.  Then, any method in the form can update the progress, by calling
  StepProgressBar.   If the AMax value was set to 4, then one call to
  StepProgressBar would increase the position by 25%.

  4.  Free the progress bar, with FreeProgressBar, when finished.  This
  makes it invisible and frees memory space allocated to the run-time
  component.

  Example:

  CreateProgressBar( StatusBar1, 0, 0, 4 );
  ...                         //Actions taken
  StepProgressBar;            //Step 1
  ...                         //Actions taken
  StepProgressBar;            //Step 2
  ...                         //Actions taken
  StepProgressBar;            //Step 3
  ...                         //Actions taken
  StepProgressBar;            //Step 4
  ...                         //Actions taken
  FreeProgressBar;
}

{ IQProg methods }
{ Creates and initializes the progress bar. }
procedure CreateProgressBar(AStatusBar: TUniStatusBar; APanelIndex: Integer;
  AMin, AMax: Integer);

{ Steps the progress bar by a value of one. }
procedure StepProgressBar(AStep: Integer = 1;
  AAbsolutePosition: Boolean = FALSE);

{ Destroys the run-time progress bar. }
procedure FreeProgressBar;

{ How to use TMarqueeProgressBar:

  1. Ensure XPMan exists in the project.  This will only work
  with XP and above.
  2.  Create the progress bar, and set it active.

  Example:

  with TMarqueeProgressBar.Create(Self) do
  begin
  Parent := Self;
  Left := 50;
  Top := 50;
  Width := 300;
  Active := True;
  end;


}

type
  { TIQTaskBarProgressStyle }
  TIQTaskBarProgressStyle = (qtbpsDefault, qtbpsError, qtbpsPaused,
    qtbpsMarquee);

  { TIQProgressBar }
  TIQProgressBar = class(TUniProgressBar)
  private
    FStatusBar: TUniStatusBar;
    FPanelIndex: Integer;
    FShowTaskBarProgress: Boolean;
    FWinTaskBarProg: TTaskBarProgress;
    FTaskBarProgressStyle: TIQTaskBarProgressStyle;
    procedure CMVisibleChanged(var Message: TMessage); message CM_VISIBLECHANGED;
    procedure SetShowTaskBarProgress(const Value: Boolean);
    procedure SetTaskBarProgressStyle(const Value: TIQTaskBarProgressStyle);
  protected
    procedure SetMax(Value: Integer); override;
    procedure SetPosition(Value: Integer); override;
  public
    constructor Create(AStatusBar: TUniStatusBar; APanelIndex: Integer; AMin, AMax: Integer); reintroduce;
    destructor Destroy; override;

    function LeftPos: Integer;
    procedure StepIt;
    procedure SetMinMax(AMin, AMax: Integer);
    property ShowTaskBarProgress: Boolean read FShowTaskBarProgress
      write SetShowTaskBarProgress default True;
    property TaskBarProgressStyle: TIQTaskBarProgressStyle read
      FTaskBarProgressStyle write SetTaskBarProgressStyle;
  end;

type
  { TMarqueeProgressBar }
  TMarqueeProgressBar = class(TUniProgressBar)
  private
    FActive: Boolean;
    FAnimationSpeed: Integer;
    procedure SetActive(const Value: Boolean);
    procedure SetAnimationSpeed(const Value: Integer);
    procedure UpdateProgressBar;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Active: Boolean read FActive write SetActive;
    property AnimationSpeed: Integer read FAnimationSpeed
      write SetAnimationSpeed;
  end;

const
  PBS_MARQUEE = $08;
  PBM_SETMARQUEE = WM_USER + 10;

var
  ProgressBar: TUniProgressBar;

implementation

uses
  IQMS.Common.SysInfo;

procedure CreateProgressBar(AStatusBar: TUniStatusBar; APanelIndex: Integer;
  AMin, AMax: Integer);
var
  ALeft, i: Integer;
begin
  // Prepare progress bar
  FreeProgressBar;
  ProgressBar := TUniProgressBar.Create(uniGUIApplication.UniApplication);
  ALeft := 1; // initial

  // Get the "Left" value for the progress bar
  if APanelIndex > 0 then
    for i := 0 to APanelIndex - 1 do
      Inc(ALeft, AStatusBar.Panels[i].Width + 3);

  with ProgressBar do
    begin
      Parent := AStatusBar;
      Left := ALeft;
      Top := 4;
      Width := AStatusBar.Panels[APanelIndex].Width - 2;
      Height := AStatusBar.ClientHeight - 6;
      Anchors := [akLeft, akTop, akRight, akBottom];
      Min := AMin;
      Max := AMax;
//      Step := 1;
      Position := 0;
      Visible := TRUE;
      Update;
    end;
end;

procedure StepProgressBar(AStep: Integer = 1;
  AAbsolutePosition: Boolean = FALSE);
begin
  if not Assigned(ProgressBar) then
    EXIT;
  if AAbsolutePosition then
    ProgressBar.Position := AStep
  else
    ProgressBar.position:=ProgressBar.position+AStep;
  ProgressBar.Update;
end;

procedure FreeProgressBar;
begin
  if Assigned(ProgressBar) then
    FreeAndNil(ProgressBar);
end;

{ ============================================================================ }
{ === Begin TIQProgressBar =================================================== }
{ ============================================================================ }
constructor TIQProgressBar.Create(AStatusBar: TUniStatusBar; APanelIndex,
  AMin, AMax: Integer);
begin
  if (AStatusBar = NIL) or (APanelIndex < 0) then
    EXIT;
  FStatusBar := AStatusBar;
  FPanelIndex := APanelIndex;
  inherited Create(uniGUIApplication.UniApplication);
  Parent := AStatusBar;
  Left := LeftPos;
  Top := 2;
  Width := AStatusBar.Panels[APanelIndex].Width - 2;
  Height := AStatusBar.ClientHeight - 4;
  Anchors := [akLeft, akTop, akRight, akBottom];
  Min := AMin;
  Max := AMax;
//  Step := 1;
  Position := 0;
  Visible := TRUE;
  Update;
  FTaskBarProgressStyle := qtbpsDefault;
  // Initialize task bar progress
  ShowTaskBarProgress := True;
end;

destructor TIQProgressBar.Destroy;
begin
  if Assigned(FWinTaskBarProg) then
    FWinTaskBarProg.Free;
  inherited Destroy;
end;

procedure TIQProgressBar.CMVisibleChanged(var Message: TMessage);
begin
  if Assigned(FWinTaskBarProg) then
    FWinTaskBarProg.Visible := Visible;
end;

function TIQProgressBar.LeftPos: Integer;
var
  AResult, i: Integer;
begin
  AResult := 1; // default
  try
    // Ensure index is in bounds
    if not ((FPanelIndex < 0) or (FPanelIndex > FStatusBar.Panels.Count - 1)) then
      // Get the "Left" value for the progress bar
      for i := 0 to FPanelIndex - 1 do
        Inc(AResult, FStatusBar.Panels[i].Width + 2);
  finally
    Result := AResult;
  end;
end;

procedure TIQProgressBar.SetMinMax(AMin, AMax: Integer);
begin
  Min := AMin;
  Max := AMax;
  if Assigned(FWinTaskBarProg) then
    FWinTaskBarProg.Max := Self.Max;
end;

procedure TIQProgressBar.SetMax(Value: Integer);
begin
  inherited;
  if FShowTaskBarProgress and Assigned(FWinTaskBarProg) then
    FWinTaskBarProg.Max := Value;
  Application.ProcessMessages;
end;

procedure TIQProgressBar.SetPosition(Value: Integer);
begin
  inherited;
  if FShowTaskBarProgress and Assigned(FWinTaskBarProg) then
    FWinTaskBarProg.Position := Value;
  Application.ProcessMessages;
end;

procedure TIQProgressBar.SetShowTaskBarProgress(const Value: Boolean);
begin
  // Check OS.  This only applies to Windows 7 and above.
  if IQMS.Common.SysInfo.IsWin7Up then
    begin
      FShowTaskBarProgress := Value;
      if Value then
        begin
          if not Assigned(FWinTaskBarProg) then
            FWinTaskBarProg := TTaskBarProgress.Create;
          SetTaskBarProgressStyle(FTaskBarProgressStyle);
          FWinTaskBarProg.Max := Self.Max;
          FWinTaskBarProg.Position := Self.Position;
          FWinTaskBarProg.Visible := TRUE;
        end;
    end
  else FShowTaskBarProgress := False;
end;

procedure TIQProgressBar.SetTaskBarProgressStyle(
  const Value: TIQTaskBarProgressStyle);
begin
  FTaskBarProgressStyle := Value;
  if Assigned(FWinTaskBarProg) then
    begin
      case Value of
        qtbpsDefault: FWinTaskBarProg.Style := tbpsNormal;
        qtbpsError: FWinTaskBarProg.Style := tbpsError;
        qtbpsPaused: FWinTaskBarProg.Style := tbpsPaused;
        qtbpsMarquee: FWinTaskBarProg.Style := tbpsIndeterminate;
      end;
    end;
end;

procedure TIQProgressBar.StepIt;
begin
  if TProgressBar(Self).Position + 1 >= TProgressBar(Self).Max then
    TProgressBar(Self).Position := TProgressBar(Self).Max
  else
    TProgressBar(Self).StepIt;
  if Assigned(FWinTaskBarProg) then
    FWinTaskBarProg.Position := TProgressBar(Self).Position;
  Application.ProcessMessages;
end;

{ ============================================================================ }
{ === End TIQProgressBar =================================================== }
{ ============================================================================ }

{ TMarqueeProgressBar }

constructor TMarqueeProgressBar.Create(AOwner: TComponent);
begin
  inherited;
  FAnimationSpeed := 60;
end;

procedure TMarqueeProgressBar.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.Style := Params.Style or PBS_MARQUEE;
end;

procedure TMarqueeProgressBar.SetActive(const Value: Boolean);
begin
  FActive := Value;
  UpdateProgressBar;
end;

procedure TMarqueeProgressBar.SetAnimationSpeed(const Value: Integer);
begin
  FAnimationSpeed := Value;
  UpdateProgressBar;
end;

procedure TMarqueeProgressBar.UpdateProgressBar;
begin
  if FActive then
    SendMessage(Self.Handle, PBM_SETMARQUEE, 1, FAnimationSpeed)
  else
    SendMessage(Self.Handle, PBM_SETMARQUEE, 0, 0);
end;

end.
