unit cc_charge_progress;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniProgressBar,
  uniMainMenu,
  uniPanel,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, uniMemo;

type
  { TFrmCCChargeProgress }
  TFrmCCChargeProgress = class(TUniForm)
    PnlStatus: TUniPanel;
    PnlClient: TUniPanel;
    Panel1: TUniPanel;
    lblStatusLabel: TUniLabel;
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    lblStatus: TUniLabel;
    bvTopBuffer: TUniPanel;
    bvLeftBuffer: TUniPanel;
    bvRightBuffer: TUniPanel;
    bvBottomBuffer: TUniPanel;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnClose: TUniButton;
    ProgressBar: TUniProgressBar;
    Panel2: TUniPanel;
    lblErrorsLabel: TUniLabel;
    Bevel3: TUniPanel;
    Bevel4: TUniPanel;
    lblErrorCount: TUniLabel;
    Bevel5: TUniPanel;
    Panel3: TUniPanel;
    lblProcessedLabel: TUniLabel;
    Bevel6: TUniPanel;
    Bevel7: TUniPanel;
    lblCount: TUniLabel;
    Bevel8: TUniPanel;
    rtfStatus: TUniMemo;
    btnCopySelected: TUniButton;
    btnCopyAll: TUniButton;
    UniButton1: TUniButton;
    procedure btnCloseClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
    FCount: Integer;
    FErrorCount: Integer;
    FMax: Integer;
    function GetDone: Boolean;
    function GetStatus: string;
    procedure SetCount(const Value: Integer);
    procedure SetDone(const Value: Boolean);
    procedure SetErrorCount(const Value: Integer);
    procedure SetStatus(const Value: string);
    function GetProgress: Integer;
    procedure SetProgress(const Value: Integer);
  public
    { Public declarations }
    procedure Clear;
    procedure AddText(const S: string);
    procedure StepProgress;
    procedure IncCount;
    procedure IncErrorCount;
  published
    { Published declarations }
    property Status: string read GetStatus write SetStatus;
    property Count: Integer read FCount write SetCount;
    property ErrorCount: Integer read FErrorCount write SetErrorCount;
    property Done: Boolean read GetDone write SetDone;
    property Max: Integer read FMax write FMax;
    property Progress: Integer read GetProgress write SetProgress;
  end;

procedure ShowChargeProgress;
procedure FreeChargeProgress;

implementation

{$R *.dfm}
uses
MainModule;

var
  FrmCCChargeProgress : TFrmCCChargeProgress;

procedure ShowChargeProgress;
begin
  FrmCCChargeProgress := TFrmCCChargeProgress.Create(uniGUIApplication.UniApplication);
   with FrmCCChargeProgress do
    begin
      FCount := 0;
      FErrorCount := 0;
      rtfStatus.Lines.Clear;
      {$IFDEF DEBUG}
        // If we are debugging, then don't make the form StayOnTop.
        // It just gets in the way.
        FormStyle := fsNormal;
      {$ENDIF}
     Show;
    end;
end;

procedure FreeChargeProgress;
begin
  if Assigned(FrmCCChargeProgress) then
    FrmCCChargeProgress.Close;
end;

{ TFrmCCChargeList }

procedure TFrmCCChargeProgress.AddText(const S: string);
begin
  rtfStatus.Lines.Add(S);
end;

procedure TFrmCCChargeProgress.Clear;
begin
  Status := 'Idle';
  Count := 0;
  ErrorCount := 0;
  rtfStatus.Lines.Clear;
  ProgressBar.Position := 0;
  Done := False;
end;

function TFrmCCChargeProgress.GetDone: Boolean;
begin
  Result := btnClose.Enabled;
end;

function TFrmCCChargeProgress.GetStatus: string;
begin
  Result := lblStatus.Caption;
end;

procedure TFrmCCChargeProgress.SetCount(const Value: Integer);
begin
  FCount := Value;
  lblCount.Caption := IntToStr(Value);
end;

procedure TFrmCCChargeProgress.SetDone(const Value: Boolean);
begin
  btnClose.Enabled := Value;
end;

procedure TFrmCCChargeProgress.SetErrorCount(const Value: Integer);
begin
  FErrorCount := Value;
  lblErrorCount.Caption := IntToStr(Value);
end;

procedure TFrmCCChargeProgress.SetStatus(const Value: string);
begin
  lblStatus.Caption := Value;
end;

function TFrmCCChargeProgress.GetProgress: Integer;
begin
  Result := ProgressBar.Position;
end;

procedure TFrmCCChargeProgress.SetProgress(const Value: Integer);
begin
  ProgressBar.Max := FMax;
  ProgressBar.Position := Value;
end;

procedure TFrmCCChargeProgress.StepProgress;
begin
  ProgressBar.Max := FMax;
  ProgressBar.Position:=ProgressBar.Position+1;;
end;

procedure TFrmCCChargeProgress.UniButton1Click(Sender: TObject);
var
  S : TStringStream;
begin
  S := TStringStream.Create(rtfStatus.Lines.Text);
    try
      UniSession.SendStream(S, 'Status.txt');
    finally
      S.Free;
    end;
end;

procedure TFrmCCChargeProgress.UniFormCreate(Sender: TObject);
begin
  btnCopySelected.ClientEvents.ExtEvents.Values['click']:='function click(sender, e, eOpts) '+
      ' { '+
      ' var textarea = document.getElementById("'+rtfStatus.JSName+'_id-inputEl"); '+
//      ' textarea.select(); '+
      ' try { '+
      ' var successful = document.execCommand(''copy''); '+
      ' if(successful) console.log(''Copied!''); '+
      ' else console.log(''Unable to copy!''); '+
      ' } catch (err) { '+
      ' console.log(''Unsupported Browser!''); '+
      ' } '+
      ' }';
  btnCopyAll.ClientEvents.ExtEvents.Values['click']:='function click(sender, e, eOpts) '+
      ' { '+
      ' var textarea = document.getElementById("'+rtfStatus.JSName+'_id-inputEl"); '+
      ' textarea.select(); '+
      ' try { '+
      ' var successful = document.execCommand(''copy''); '+
      ' if(successful) console.log(''Copied!''); '+
      ' else console.log(''Unable to copy!''); '+
      ' } catch (err) { '+
      ' console.log(''Unsupported Browser!''); '+
      ' } '+
      ' }';
end;

procedure TFrmCCChargeProgress.IncCount;
begin
  Count := Count + 1;
end;

procedure TFrmCCChargeProgress.IncErrorCount;
begin
  ErrorCount := ErrorCount + 1;
end;

procedure TFrmCCChargeProgress.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
