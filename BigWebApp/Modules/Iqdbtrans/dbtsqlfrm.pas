unit dbtsqlfrm;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ComCtrls,
  ExtCtrls,
  Menus,
  Buttons,
  Grids,
  DBGrids,
  Data.DB,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniMemo,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu, uniDBMemo, IQMS.WebVcl.TinyMCE;

type
  TFrmDBTMsgFrm = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnClose: TUniButton;
    PnlMain: TUniPanel;
    PnlToolbar: TUniPanel;
    SaveDialog1: TSaveDialog;
    sbtnSave: TUniSpeedButton;
    PMain: TUniPopupMenu;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    SavetoFile1: TUniMenuItem;
    N1: TUniMenuItem;
    sbtnRun: TUniSpeedButton;
    PnlScriptExecution: TUniPanel;
    Grid: TUniDBGrid;
    memExecSQL: TUniMemo;
    sbtnHideScriptResults: TUniSpeedButton;
    sbtnCopyAll: TUniSpeedButton;
    CopyAll1: TUniMenuItem;
    SavetoFile2: TUniMenuItem;
    CopyAll2: TUniMenuItem;
    Bevel2: TUniPanel;
    RTF: TIQWebTinyMCE;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure SavetoFile1Click(Sender: TObject);
    procedure sbtnRunClick(Sender: TObject);
    procedure sbtnHideScriptResultsClick(Sender: TObject);
    procedure RTFMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FModal: Boolean;
    function GetText: String;
    procedure SetText(const Value: String);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ASQL: String);
    procedure LoadFromFile(const AFileName: String);
  published
    { Published declarations }
    property Text: String read GetText write SetText;
  end;

procedure DoShowSQL(const AOwner: TComponent; const ASQL: String;
  const ACaption: String = 'SQL');
procedure DoShowSQLModal(const AOwner: TComponent; const ASQL: String;
  const ACaption: String = 'SQL');

var
  FrmDBTMsgFrm: TFrmDBTMsgFrm;

implementation

{$R *.dfm}


uses
  IQMS.Common.Controls,
  IQMS.Common.Miscellaneous,
  dbtformat;

procedure DoShowSQL(const AOwner: TComponent; const ASQL: String;
  const ACaption: String);
begin
  with TFrmDBTMsgFrm.Create(AOwner, ASQL) do
    begin
      Caption := ACaption;
      Show;
    end;
end;

procedure DoShowSQLModal(const AOwner: TComponent; const ASQL: String;
  const ACaption: String);
begin
  with TFrmDBTMsgFrm.Create(AOwner, ASQL) do
    try
      FModal := True;
      Caption := ACaption;
      ShowModal;
    finally
      Free;
    end;
end;

{ TFrmDBTMsgFrm }

constructor TFrmDBTMsgFrm.Create(AOwner: TComponent; ASQL: String);
begin
  FModal := False;
  inherited Create(AOwner);
  Text := ASQL;

  // Hide these controls.  For the moment, running the SQL is
  // not supported.  Do we want the wrapper to pass an
  // SQLConnection object?
  sbtnRun.Visible := False;
  sbtnHideScriptResults.Visible := False;
end;

procedure TFrmDBTMsgFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not FModal then
    Action := caFree;
end;

function TFrmDBTMsgFrm.GetText: String;
begin
  Result := RTF.Text;
end;

procedure TFrmDBTMsgFrm.RTFMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if button=mbright then
    pmain.popup(x,y,sender);
end;

procedure TFrmDBTMsgFrm.SetText(const Value: String);
begin
  RTF.Text := Value;
//  FormatEditor(RTF);
  // sbtnRun.Visible := IsActionQuery(Value);
end;

procedure TFrmDBTMsgFrm.LoadFromFile(const AFileName: String);
begin
  RTF.Clear;
  if (AFileName > '') and FileExists(AFileName) then
    RTF.Lines.LoadFromFile(AFileName);
end;

procedure TFrmDBTMsgFrm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmDBTMsgFrm.SavetoFile1Click(Sender: TObject);
var
  sl: TStringList;
begin
  with SaveDialog1 do
    if Execute then
      begin
        sl := TStringList.Create;
        try
          sl.Text := RTF.Text; // converts it to plain text
          sl.SaveToFile(FileName);
          if FileExists(FileName) then
            IQMS.Common.Miscellaneous.ExecuteProgram(FileName);
        finally
          if Assigned(sl) then
            FreeAndNil(sl);
        end;
      end;
end;

procedure TFrmDBTMsgFrm.sbtnRunClick(Sender: TObject);
var
  AErrorCount: Integer;
  ASQLTime: TDateTime;
begin
  // Run script
  (*
    // Prompt: 'Run script?'
    if not iqmesg.IQConfirmYN(dbtrscstr.cTXT0000188) then Exit;

    memExecSQL.Clear;
    PnlScriptExecution.Visible := True;
    with TProcessScriptOracle.Create do
    try
    StopOnError := TRUE;
    ShowErrorMessages := TRUE;
    AssociatedMemo := memExecSQL;
    ScriptLines.Text := ASQL;
    RunScript;
    AErrorCount := ErrorCount;
    ASQLTime := ( Now - StartDateTime ) * 86400;
    sbtnHideScriptResults.Visible := True;
    finally
    Free;
    end; *)
end;

procedure TFrmDBTMsgFrm.sbtnHideScriptResultsClick(Sender: TObject);
begin
  PnlScriptExecution.Visible := not PnlScriptExecution.Visible;
end;

end.
