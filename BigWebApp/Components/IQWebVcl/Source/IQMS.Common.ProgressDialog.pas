{ This dialog box provides a wrapper for the windows animated dialog box. The
  animation may be modified by selecting from the CommonAvi property. The
  MaxProgress and MinProgress will allow to determine a range. The caption of
  the dialog box can also be modified by using the Caption property.

  To increment the progress bar or modify the status labels, you can use the
  UpdateProgress procedure. This procedure takes three params, the first one is
  the current progress ID, the other are sting param which indicates which are
  used for the status ID. }

unit IQMS.Common.ProgressDialog;

interface

{ Displays a form with a Windows style progress bar, and a Cancel button }

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, IQMS.Common.TaskBarProgress,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Phys, uniGUIBaseClasses,
  uniGUIClasses,
  uniGUITypes, UniButton, UniLabel,Uniprogressbar,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

type
  TIQWebProgressDialog = class(TComponent)
    procedure DoCancelBtnClick(Sender: TObject);
    procedure DoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FrmIQProgressDlg: TUniForm;
    FOnCancel: TNotifyEvent;
    FPosition: Integer;
    StatusText1: TUniLabel;
    StatusText2: TUniLabel;
    FCaption: string;
    FMaxProgress: Integer;
    FMinProgress: Integer;
    FStatus1: string;
    FStatus2: string;
    Progress: Integer;
    FAbort: Boolean;
    FAbortPromptText: string;
    FMarquee: Boolean;
    FCancelBtnEnabled: Boolean;
    FShowTaskBarProgress: Boolean;
    function GetActiveState: Boolean;
    function GetCaption: string;
    function GetStatus1: string;
    function GetStatus2: string;
    function GetMaxProgress: Integer;
    function GetMinProgress: Integer;
    procedure SetCaption(const Value: string);
    procedure SetStatus1(const Value: string);
    procedure SetStatus2(const Value: string);
    procedure SetMaxProgress(const Value: Integer);
    procedure SetMinProgress(const Value: Integer);
    procedure OnFormClose(Sender: TObject; var Action: TCloseAction);
    function GetPosition: Integer;
    procedure SetPosition(const Value: Integer);
    procedure SetMarquee(const Value: Boolean);
    function GetCancelBtnEnabled: Boolean;
    procedure SetCancelBtnEnabled(const Value: Boolean);
    procedure SetShowTaskBarProgress(const Value: Boolean);
  protected
    { Protected declarations }
    FWinTaskBarProg: TTaskBarProgress;
  public
    { Public declarations }
    ProgressBar: TUniProgressBar;
    CancelBtn: TUniButton;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Execute;
    procedure UpdateProgress(Progress: Integer; Status1, Status2: string);
    procedure StepProgress;

    function CheckProgressAborted: Boolean;

    procedure Hide;
    procedure Show;

    {Attribute Properties}
    property Active: Boolean
      read GetActiveState;
    property Aborted: Boolean
      read FAbort
      write FAbort;
    property Caption: string
      read GetCaption
      write SetCaption;
    property Status1: string
      read GetStatus1
      write SetStatus1;
    property Status2: string
      read GetStatus2
      write SetStatus2;
    property MaxProgress: Integer
      read GetMaxProgress
      write SetMaxProgress
      default 100;
    property MinProgress: Integer
      read GetMinProgress
      write SetMinProgress
      default 0;
    property AbortPromptText: string
      read FAbortPromptText
      write FAbortPromptText;
    property Position: Integer
      read GetPosition
      write SetPosition;
    property Marquee: Boolean
      read FMarquee
      write SetMarquee;
    property CancelBtnEnabled: Boolean
      read GetCancelBtnEnabled
      write SetCancelBtnEnabled;
    property ShowTaskBarProgress: Boolean
      read FShowTaskBarProgress
      write SetShowTaskBarProgress default True;

    {Event properties}
    property OnCancelButtonClick: TNotifyEvent
      read FOnCancel
      write FOnCancel;

  end;

  (* ** Progress Bar Dialog ***

    The progress bar dialog can be used an executed by calling a series
    of three methods:

    hProgressDlg         = Displays the progress dialog
    CheckProgressAborted = Checks to see if user pressed Cancel btn
    StepProgress         = Increment the progress bar

    Example:

    var
    hPrg: TProgressDialog; // in isprogressdlg.pas
    i, AMax: Integer;

    begin
    try
    // Create the Progress Dialog box
    hPrg := hProgressDlg(Self, AMax {Max Value},
    'Exporting...' {Status Text});

    // Cycle
    for i := 0 to AMax do
    begin
    // Check to see if user pressed Cancel button
    if hPrg.CheckProgressAborted then
    Break;

    // Some actions to be taken ...
    // ...

    // Step progress bar
    hPrg.StepProgress;

    end;
    finally
    // Free the Progress Dialog box
    if Assigned(hPrg) then FreeAndNil(hPrg);
    end;

  *)

  // Create and display the Progress Dialog box
function hProgressDlg( AMax: Integer; AStatus1: string = '';
  AStatus2: string = ''; AFormCaption: string = 'Progress';
  ACancelBtnClick: TNotifyEvent = nil): TIQWebProgressDialog;

// Check to see if the user pressed the Cancel button
function CheckProcessAborted(const AProgressDialog: TIQWebProgressDialog;
  var AAborted: Boolean): Boolean;

resourcestring
  cPromptText = 'Abort operation?';

implementation

uses
  IQMS.Common.Controls,
  IQMS.Common.Dialogs,
  IQMS.Common.SysInfo;

function hProgressDlg( AMax: Integer; AStatus1: string = '';
  AStatus2: string = ''; AFormCaption: string = 'Progress';
  ACancelBtnClick: TNotifyEvent = nil): TIQWebProgressDialog;
begin
  Result := TIQWebProgressDialog.Create(uniGUIApplication.UniApplication);
  with Result do
    begin
      MinProgress := 0;
      MaxProgress := AMax;
      Caption := AFormCaption;
      Execute;
      OnCancelButtonClick := ACancelBtnClick;
      Status1 := AStatus1;
      Status2 := AStatus2;
    end;
end;

function CheckProcessAborted(const AProgressDialog: TIQWebProgressDialog;
  var AAborted: Boolean): Boolean;
begin
  Result := AAborted;
  if AAborted then
    try
      if Assigned(AProgressDialog) then
        AProgressDialog.Hide;
      Result := IQConfirmYN(cPromptText);
      if not Result then
        AAborted := FALSE; // reset; user changed mind
    finally
      if not Result and Assigned(AProgressDialog) then
        AProgressDialog.Show;
    end;
end;

{ TProgressDialog }

constructor TIQWebProgressDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FPosition := 0;
  Caption := '';
  Status1 := '';
  Status2 := '';
  Progress := 0;
  FCancelBtnEnabled := True;
  OnCancelButtonClick := nil;
  ShowTaskBarProgress := True;
end;

destructor TIQWebProgressDialog.Destroy;
begin
  if Assigned(FWinTaskBarProg) then
    FWinTaskBarProg.Free;
  if Assigned(FrmIQProgressDlg) then
    FreeAndNil(FrmIQProgressDlg);
  inherited;
end;

procedure TIQWebProgressDialog.Execute;
var
  AOwnerForm: TUniForm;
begin
  AOwnerForm := IQMS.Common.Controls.GetOwnerForm(Self);
  FrmIQProgressDlg := TUniForm.Create(uniGUIApplication.UniApplication);
  with FrmIQProgressDlg do
    begin
      name := 'FrmIQProgressDlg';
      BorderStyle := bsDialog;
      BorderIcons := []; // 09/18/2006
      ClientHeight := 100;
      ClientWidth := 450;
      // 02/20/2013 Does not work on dual monitor
      // Position := poScreenCenter;
      FormStyle := fsStayOnTop;
      OnClose := OnFormClose;
      Caption := Self.Caption;
      FAbort := FALSE;
      FAbortPromptText := cPromptText;
      KeyPreview := True;
      OnKeyDown := DoKeyDown;

      // 02/20/2012 Center the form on the owner.
//      IQMS.Common.Controls.CenterForm(FrmIQProgressDlg, True);

      ProgressBar := TUniProgressBar.Create(FrmIQProgressDlg);
      with ProgressBar do
        begin
          Parent := FrmIQProgressDlg;
          name := 'ProgressBar';
          Left := 8;
          Top := 48;
          Width := 345;
          Height := 16;
          Min := MinProgress;
          Max := MaxProgress;
          Position := FPosition;
          Visible := True;
        end;

      CancelBtn := TUniButton.Create(FrmIQProgressDlg);
      with CancelBtn do
        begin
          Parent := FrmIQProgressDlg;
          name := 'CancelBtn';
          Left := 365;
          Top := 48;
          Width := 75;
          Height := 25;
          Caption := 'Cancel';
          ModalResult := 2;
          TabOrder := 1;
          OnClick := DoCancelBtnClick;
        end;

      StatusText1 := TUniLabel.Create(FrmIQProgressDlg);
      with StatusText1 do
        begin
          Parent := FrmIQProgressDlg;
          name := 'StatusText1';
          AutoSize := FALSE;
          Anchors := [akLeft, akTop, akRight];
          Caption := Self.Status1;
          Left := 9;
          Top := 8;
          Width := FrmIQProgressDlg.ClientWidth - 2;
          Height := 13;
        end;

      StatusText2 := TUniLabel.Create(FrmIQProgressDlg);
      with StatusText2 do
        begin
          Parent := FrmIQProgressDlg;
          name := 'StatusText2';
          AutoSize := FALSE;
          Anchors := [akLeft, akTop, akRight];
          Caption := Self.Status2;
          Left := 9;
          Top := 27;
          Width := FrmIQProgressDlg.ClientWidth - 2;
          Height := 13;
        end;

      Show;

//      if FMarquee then
//        ProgressBar.Style := pbstMarquee
//      else
//        ProgressBar.Style := pbstNormal;
    end;
end;

procedure TIQWebProgressDialog.OnFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  // Free the form and dereference the pointer...
  Action := caFree;
  FrmIQProgressDlg := nil;
end;

function TIQWebProgressDialog.GetCaption: string;
begin
  Result := FCaption;
end;

function TIQWebProgressDialog.GetMaxProgress: Integer;
begin
  Result := FMaxProgress;
end;

function TIQWebProgressDialog.GetMinProgress: Integer;
begin
  Result := FMinProgress;
end;

function TIQWebProgressDialog.GetStatus1: string;
begin
  Result := FStatus1;
end;

function TIQWebProgressDialog.GetStatus2: string;
begin
  Result := FStatus2;
end;

procedure TIQWebProgressDialog.SetCaption(const Value: string);
begin
  if (FCaption <> Value) then
    begin
      FCaption := Value;
      if Assigned(FrmIQProgressDlg) then
        FrmIQProgressDlg.Caption := Value;
    end;
end;

procedure TIQWebProgressDialog.SetMaxProgress(const Value: Integer);
begin
  if (FMaxProgress <> Value) then
    FMaxProgress := Value;

  if Assigned(FrmIQProgressDlg) then
    with FrmIQProgressDlg do
      if Assigned(ProgressBar) then
          ProgressBar.Max := Value;

  if FShowTaskBarProgress and Assigned(FWinTaskBarProg) then
    FWinTaskBarProg.Max := Value;
end;

procedure TIQWebProgressDialog.SetMinProgress(const Value: Integer);
begin
  if (FMinProgress <> Value) then
    FMinProgress := Value;

  if Assigned(FrmIQProgressDlg) then
    with FrmIQProgressDlg do
      if Assigned(ProgressBar) then
        ProgressBar.Min := Value;
end;

procedure TIQWebProgressDialog.SetShowTaskBarProgress(const Value: Boolean);
begin
  // Check OS.  This only applies to Windows 7 and above.
  if IQMS.Common.SysInfo.IsWin7Up then
    begin
      FShowTaskBarProgress := Value;
      if Value then
        begin
          if not Assigned(FWinTaskBarProg) then
            FWinTaskBarProg := TTaskBarProgress.Create;
          FWinTaskBarProg.Max := Self.MaxProgress;
          FWinTaskBarProg.Position := Self.Position;
          FWinTaskBarProg.Visible := TRUE;
        end;
    end
  else FShowTaskBarProgress := False;
end;

procedure TIQWebProgressDialog.SetStatus1(const Value: string);
begin
  if (FStatus1 <> Value) then
    FStatus1 := Value;
  if (FrmIQProgressDlg <> nil) then
    begin
      StatusText1.Caption := Value;
      StatusText1.Invalidate;
      FrmIQProgressDlg.Invalidate;
    end;
end;

procedure TIQWebProgressDialog.SetStatus2(const Value: string);
begin
  if (FStatus2 <> Value) then
    FStatus2 := Value;
  if Assigned(FrmIQProgressDlg) then
    begin
      StatusText2.Caption := Value;
      StatusText2.Invalidate;
      FrmIQProgressDlg.Invalidate;
    end;
end;

procedure TIQWebProgressDialog.UpdateProgress(Progress: Integer;
  Status1, Status2: string);
begin
  Application.ProcessMessages;

  // Before modifying any visual aspect first check if the form is still around...
  if Assigned(FrmIQProgressDlg) then
    with FrmIQProgressDlg do
      begin
        ProgressBar.Position := Progress;
        StatusText1.Caption := Status1;
        StatusText2.Caption := Status2;

        // Check if progress meter has reached the end...
        if (ProgressBar.Max <= ProgressBar.Position) then
          Close
        else
          begin
            StatusText1.Update;
            StatusText2.Update;
            FrmIQProgressDlg.Invalidate;
          end;
      end;
end;

function TIQWebProgressDialog.GetActiveState: Boolean;
begin
  Result := not (FrmIQProgressDlg = nil);
end;

procedure TIQWebProgressDialog.StepProgress;
begin
  if not (FrmIQProgressDlg = nil) then
    with FrmIQProgressDlg do
      begin
        if ProgressBar.Position + 1 >= ProgressBar.Max then
          SetPosition(ProgressBar.Max)
        else
          SetPosition(ProgressBar.Position + 1);
      end;
end;

procedure TIQWebProgressDialog.Hide;
begin
  if Assigned(FrmIQProgressDlg) then
    FrmIQProgressDlg.Hide;
end;

procedure TIQWebProgressDialog.Show;
begin
  if Assigned(FrmIQProgressDlg) then
    begin
      FrmIQProgressDlg.Show;
      if Assigned(CancelBtn) then
        CancelBtn.Enabled := FCancelBtnEnabled;
    end;
end;

procedure TIQWebProgressDialog.DoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key in [VK_ESCAPE, VK_CANCEL, VK_PAUSE]) then
    begin
      Key := 0;
      DoCancelBtnClick(Sender);
    end;
end;

procedure TIQWebProgressDialog.DoCancelBtnClick(Sender: TObject);
begin
  if not CancelBtn.Enabled then
    Exit;
  FAbort := True;
  if Assigned(FOnCancel) then
    FOnCancel(Sender);
end;

function TIQWebProgressDialog.CheckProgressAborted: Boolean;
var
  S: string;
begin
  Result := FAbort;

  if Trim(FAbortPromptText) > '' then
    S := FAbortPromptText
  else
    S := cPromptText;

  if FAbort then
    try
      Hide;
      Result := IQMS.Common.Dialogs.IQConfirmYN(S);
      if not Result then
        FAbort := FALSE; // reset; user changed mind
    finally
      if not Result then
        Show;
    end;
end;

function TIQWebProgressDialog.GetPosition: Integer;
begin
  if Assigned(ProgressBar) then
    Result := ProgressBar.Position
  else
    Result := FPosition;
end;

procedure TIQWebProgressDialog.SetPosition(const Value: Integer);
begin
  FPosition := Value;
  if Assigned(ProgressBar) then
    begin
      ProgressBar.Position := Value;
      // This is a "feature" of the common control:
      // it doesn't update unless you do this.
      ProgressBar.Position := ProgressBar.Position - 1;
      ProgressBar.Position := ProgressBar.Position + 1;
      ProgressBar.Invalidate;
      if Assigned(FrmIQProgressDlg) then
        FrmIQProgressDlg.Invalidate;
      if FShowTaskBarProgress and Assigned(FWinTaskBarProg) then
        FWinTaskBarProg.Position := Value;
    end;
end;

procedure TIQWebProgressDialog.SetMarquee(const Value: Boolean);
begin
  FMarquee := Value;
//  if FMarquee then
//    ProgressBar.Style := pbstMarquee
//  else
//    ProgressBar.Style := pbstNormal;
  if Assigned(FrmIQProgressDlg) then
    begin
      ProgressBar.Invalidate;
      if Assigned(FrmIQProgressDlg) then
        FrmIQProgressDlg.Invalidate;
      if Assigned(FWinTaskBarProg) then
        begin
          if Value then
            FWinTaskBarProg.Style := tbpsIndeterminate
          else
            FWinTaskBarProg.Style := tbpsNormal;
        end;
    end;
end;

function TIQWebProgressDialog.GetCancelBtnEnabled: Boolean;
begin
  if Assigned(FrmIQProgressDlg) and Assigned(CancelBtn) then
    Result := CancelBtn.Enabled;
end;

procedure TIQWebProgressDialog.SetCancelBtnEnabled(const Value: Boolean);
begin
  FCancelBtnEnabled := Value;
  if Assigned(FrmIQProgressDlg) and Assigned(CancelBtn) then
    CancelBtn.Enabled := Value;
end;

end.
