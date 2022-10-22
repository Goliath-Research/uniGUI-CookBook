unit IQMS.Common.DebugSQL;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Buttons,
  Vcl.DBGrids,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Controls, uniMemo;

type
  TFrmIQDebugSessionSQL = class(TUniForm)
    memSQL: TUniMemo;
    DBGrid1: TUniDBGrid;
    Splitter1: TUniSplitter;
    PnlToolbar: TUniPanel;
    sbtnExecute: TUniSpeedButton;
    SrcData: TDataSource;
    QryData: TFDQuery;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    ExecuteSQL1: TUniMenuItem;
    Close1: TUniMenuItem;
    sbtnClear: TUniSpeedButton;
    ClearSQLWindow1: TUniMenuItem;
    N2: TUniMenuItem;
    UniButton1: TUniButton;
    btnCopyToClipboard: TUniButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure ExecuteSQL1Click(Sender: TObject);
    procedure ClearSQLWindow1Click(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
    FDeveloperPasswordSucceeded: Boolean;
    function CheckDeveloperPasswordSucceeded: Boolean;
  public
    { Public declarations }
    class procedure DoShow;
    class procedure DoShowModal;
  end;

  /// <summary>Determine if key press event should display a window
  /// to debug session SQL.
  /// </summary>
procedure CheckShowDebugSQL(var Key: Word;
  Shift: TShiftState);


implementation

{$R *.dfm}


uses
  IQMS.DBTrans.dbtshare,
  IQMS.Common.GetPassword,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils;

procedure CheckShowDebugSQL( var Key: Word;
  Shift: TShiftState);
begin
  if not ((Key = VK_F9) and (ssAlt in Shift)) then
    Exit;

  // Only show if running in IDE
  if DebugHook = 0 then
    Exit;

  if (CompareText(SecurityManager.UserName, 'IQMS') <> 0) and
    not SecurityManager.IsUserDBA then
    Exit;

  TFrmIQDebugSessionSQL.DoShow;
end;

{ TFrmIQDebugSessionSQL }

class procedure TFrmIQDebugSessionSQL.DoShow;
begin
  if (CompareText(SecurityManager.UserName, 'IQMS') = 0) and
    SecurityManager.IsUserDBA then
    TFrmIQDebugSessionSQL.Create(uniGUIApplication.UniApplication).Show;
end;

class procedure TFrmIQDebugSessionSQL.DoShowModal;
begin
  if (CompareText(SecurityManager.UserName, 'IQMS') = 0) and
    SecurityManager.IsUserDBA then
    TFrmIQDebugSessionSQL.Create(uniGUIApplication.UniApplication).ShowModal;
end;

procedure TFrmIQDebugSessionSQL.FormCreate(Sender: TObject);
begin
  memSQL.Clear;

  btnCopyToClipboard.ClientEvents.ExtEvents.Values['click']:='function click(sender, e, eOpts) '+
      ' { '+
      ' var textarea = document.getElementById("'+memSQL.JSName+'_id-inputEl"); '+
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

procedure TFrmIQDebugSessionSQL.FormShow(Sender: TObject);
begin
  if (CompareText(SecurityManager.UserName, 'IQMS') <> 0) and
    not SecurityManager.IsUserDBA then
    begin
      IQMS.Common.Dialogs.IQError('Access denied.');
      Self.Close;
//      PostMessage(Handle, WM_Command, Close1.Command, 0);
    end;
end;

procedure TFrmIQDebugSessionSQL.ClearSQLWindow1Click(Sender: TObject);
begin
  memSQL.Clear;
end;

procedure TFrmIQDebugSessionSQL.Close1Click(Sender: TObject);
begin
  Close;
end;

function TFrmIQDebugSessionSQL.CheckDeveloperPasswordSucceeded: Boolean;
var
  AValue: string;
begin
  if FDeveloperPasswordSucceeded then
    Exit(True);

  if IQMS.Common.GetPassword.GetIQSysPasswordEx(
    'Password Required', 'Enter your user password:', AValue) then
    Result := CompareText(AValue, SecurityManager.Password) = 0;

  FDeveloperPasswordSucceeded := Result;
end;

procedure TFrmIQDebugSessionSQL.ExecuteSQL1Click(Sender: TObject);
var
  ASQL: string;
begin
  if (CompareText(SecurityManager.UserName, 'IQMS') <> 0) then
    raise Exception.Create
      ('You must log in as the user, IQMS, to run SQL in this window.');

  if not SecurityManager.IsUserDBA then
    raise Exception.Create
      ('DBA rights are required to run SQL in this window.');

  // If the developer has selected text, use that as the SQL.
  // otherwise, grab everything (of course)

//  if memSQL.SelLength > 1 then
//    ASQL := memSQL.SelText
//  else
    ASQL := memSQL.Lines.Text;

  if IsActionQuery(ASQL) then
    raise Exception.Create(
     'Action queries are not permitted in this window.  ' +
     'You cannot update data or alter Oracle objects.');

//  if Pos('PR_EMP', UpperCase(ASQL)) > 0 then
//    raise Exception.Create
//      ('Queries against Employee Maintenance or Payroll are not permitted in this window.');

  if CheckDeveloperPasswordSucceeded then
    try
      QryData.DisableControls;
      QryData.Close;
      QryData.SQL.Text := ASQL;
      QryData.Open;
    finally
      QryData.EnableControls;
    end;
end;

procedure TFrmIQDebugSessionSQL.UniButton1Click(Sender: TObject);
begin
    UniSession.AddJS(' var textarea = document.getElementById("'+memSQL.JSName+'_id-inputEl"); '+
                   ' textarea.select(); ');
end;

end.
