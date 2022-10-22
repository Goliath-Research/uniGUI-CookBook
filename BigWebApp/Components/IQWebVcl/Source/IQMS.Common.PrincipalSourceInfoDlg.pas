unit IQMS.Common.PrincipalSourceInfoDlg;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  System.StrUtils,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.Common.PrincipalSourceTypes,
  System.ImageList,
  uniGUIBaseClasses,
  uniImageList,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu, uniMemo, uniDBMemo, uniButton;

type
  { TFrmPrincipalSourceInfoDlg }
  TFrmPrincipalSourceInfoDlg = class(TUniForm)
    Panel1: TUniPanel;
    PopupMenu1: TUniPopupMenu;
    SelectAll1: TUniMenuItem;
    Copy1: TUniMenuItem;
    CopyAll1: TUniMenuItem;
    N1: TUniMenuItem;
    SendMail1: TUniMenuItem;
    GoToWebSite1: TUniMenuItem;
    Memo: TUniDBHtmlMemo;
    imgMenus: TUniImageList;
    UniPanel1: TUniPanel;
    btnSelectAll: TUniButton;
    btnCopyToClipboard: TUniButton;
    btnWeb: TUniButton;
    btnEmail: TUniButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSelectAllClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure btnWebClick(Sender: TObject);
  strict private
    { Private declarations }
    function GetText: String;
    procedure SetText(const Value: String);
    procedure SetCaption;
    function DoMailTo: Boolean;
    procedure UpdateRTFDisplay;
    function DoWebSiteURL: Boolean;
    procedure FormatText(var ARTF: TUniDBHtmlMemo; AText: String;
      const AStyle: TFontStyles; AStartPos: Integer);
  public
    { Public declarations }
    FFormActive: Boolean;
    FSource: String;
    FSourceID: Real;
    FContactID: Real;
    class procedure DoShow(ASource: String; ASourceID, AContactID: Real);
    property Text: String read GetText write SetText;
  end;


implementation

{$R *.DFM}


uses
  IQMS.Common.EmailUtils,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.ResStrings;

{ TFrmEditMemo }

class procedure TFrmPrincipalSourceInfoDlg.DoShow(ASource: String; ASourceID, AContactID: Real);
var
  FrmPrincipalSourceInfoDlg: TFrmPrincipalSourceInfoDlg;
begin
  FrmPrincipalSourceInfoDlg:= TFrmPrincipalSourceInfoDlg.Create(uniGUIApplication.UniApplication);
  with FrmPrincipalSourceInfoDlg do
   begin
      FFormActive := FALSE;
      FSource := ASource;
      FSourceID := ASourceID;
      FContactID := AContactID;
      SetCaption;
      UpdateRTFDisplay;
      Show;
   end;
end;

procedure TFrmPrincipalSourceInfoDlg.FormShow(Sender: TObject);
begin
  IQRegFormRead(Self, [Self]); // iqregfrm
  FFormActive := TRUE;
end;

procedure TFrmPrincipalSourceInfoDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FFormActive := FALSE;
  IQRegFormWrite(Self, [Self]); // iqregfrm
end;
function TFrmPrincipalSourceInfoDlg.GetText: String;
begin
  Result := Memo.Text;
end;

procedure TFrmPrincipalSourceInfoDlg.SetCaption;
begin
  // IQMS.Common.ResStrings.cTXT0000452 = 'Customer Summary';
  if (CompareText(FSource, 'ARCUSTO') = 0) then
    Caption := IQMS.Common.ResStrings.cTXT0000452
  else if (CompareText(FSource, 'VENDOR') = 0) then
    // IQMS.Common.ResStrings.cTXT0000453 = 'Vendor Summary';
    Caption := IQMS.Common.ResStrings.cTXT0000453
  else if (CompareText(FSource, 'PARTNER') = 0) then
    // IQMS.Common.ResStrings.cTXT0000454 = 'Partner Summary';
    Caption := IQMS.Common.ResStrings.cTXT0000454
  else if (CompareText(FSource, 'PR_EMP') = 0) then
    // IQMS.Common.ResStrings.cTXT0000455 = 'Employee Summary';
    Caption := IQMS.Common.ResStrings.cTXT0000455
  else
    // IQMS.Common.ResStrings.cTXT0000456 = 'Summary';
    Caption := IQMS.Common.ResStrings.cTXT0000456;
end;

procedure TFrmPrincipalSourceInfoDlg.SetText(const Value: String);
begin
  Memo.Text := Value;
  Memo.Update;
end;

function TFrmPrincipalSourceInfoDlg.DoMailTo: Boolean;
var
  AEMailAddress: string;
begin
  // Get the valid email address
  AEMailAddress := GetEmailAddress(FSource, FSourceID, FContactID);
  Result := AEMailAddress > '';
  if Result then
    IQMS.Common.EmailUtils.IQSendMailA(AEMailAddress, // Recipient
      '', // Subject
      '', // BodyText
      nil, // Attachments
      FALSE); // SendNow
end;

function TFrmPrincipalSourceInfoDlg.DoWebSiteURL: Boolean;
var
  AURL: string;
begin
  if GetWebSiteURL(FSource, FSourceID, AURL) then
    UniSession.BrowserWindow(AURL, 0, 0, '_blank');
end;

procedure TFrmPrincipalSourceInfoDlg.FormatText(var ARTF: TUniDBHtmlMemo;
  AText: String; const AStyle: TFontStyles; AStartPos: Integer);
begin
  ARTF.Text:=StringReplace(ARTF.Text,AText, '<b>'+AText+'</b>',[rfReplaceAll]);
end;

procedure TFrmPrincipalSourceInfoDlg.btnEmailClick(Sender: TObject);
begin
  DoMailTo;
end;

procedure TFrmPrincipalSourceInfoDlg.btnSelectAllClick(Sender: TObject);
begin
    UniSession.AddJS(' var textarea = document.getElementById("'+Memo.JSName+'_id-inputEl"); '+
                   ' textarea.select(); ');
end;

procedure TFrmPrincipalSourceInfoDlg.btnWebClick(Sender: TObject);
begin
  DoWebSiteURL;
end;

procedure TFrmPrincipalSourceInfoDlg.UniFormCreate(Sender: TObject);
var
  AURL: string;
begin
  btnCopyToClipboard.ClientEvents.ExtEvents.Values['click']:='function click(sender, e, eOpts) '+
      ' { '+
      ' var textarea = document.getElementById("'+Memo.JSName+'_id-inputEl"); '+
      ' textarea.select(); '+
      ' try { '+
      ' var successful = document.execCommand(''copy''); '+
      ' if(successful) console.log(''Copied!''); '+
      ' else console.log(''Unable to copy!''); '+
      ' } catch (err) { '+
      ' console.log(''Unsupported Browser!''); '+
      ' } '+
      ' }';
  btnEmail.Enabled := GetEmailAddress(FSource, FSourceID, FContactID) > '';
  btnWeb.Enabled := GetWebSiteURL(FSource, FSourceID, AURL);
end;

procedure TFrmPrincipalSourceInfoDlg.UpdateRTFDisplay;
var
  AFirstLine: String;
  i: Integer;
  AList: TStringList;
  o: TPrincipalDisplayRec;

  procedure _Eval(ACaption: String);
  begin
    FormatText(Memo, Trim(ACaption), [fsBold], 0);
  end;

begin
  if Memo = NIL then
    Exit;
  AList := TStringList.Create;
  try
    Memo.Lines.BeginUpdate;
    Memo.Clear;
    o.Update(FSource, FSourceID, FContactID);
    o.GetLongDisplay(AList);
    Memo.Lines.AddStrings(AList);
    AFirstLine := Memo.Lines[0];
    // IQMS.Common.ResStrings.cTXT0000457 = 'Web Site URL:';
    _Eval(IQMS.Common.ResStrings.cTXT0000457);
    // IQMS.Common.ResStrings.cTXT0000458 = 'Company Telephone:';
    _Eval(IQMS.Common.ResStrings.cTXT0000458);
    // IQMS.Common.ResStrings.cTXT0000459 = 'Company Extension:';
    _Eval(IQMS.Common.ResStrings.cTXT0000459);
    // IQMS.Common.ResStrings.cTXT0000460 = 'Company Fax:';
    _Eval(IQMS.Common.ResStrings.cTXT0000460);
    // IQMS.Common.ResStrings.cTXT0000467 = 'Contact Title:';
    _Eval(IQMS.Common.ResStrings.cTXT0000467);
    // IQMS.Common.ResStrings.cTXT0000462 = 'Contact Telephone:';
    _Eval(IQMS.Common.ResStrings.cTXT0000462);
    // IQMS.Common.ResStrings.cTXT0000463 = 'Contact Extension:';
    _Eval(IQMS.Common.ResStrings.cTXT0000463);
    // IQMS.Common.ResStrings.cTXT0000461 = 'Contact Cell Telephone:';
    _Eval(IQMS.Common.ResStrings.cTXT0000461);
    // IQMS.Common.ResStrings.cTXT0000468 = 'Contact Pager:';
    _Eval(IQMS.Common.ResStrings.cTXT0000468);
    // IQMS.Common.ResStrings.cTXT0000465 = 'Contact Fax:';
    _Eval(IQMS.Common.ResStrings.cTXT0000465);
    // IQMS.Common.ResStrings.cTXT0000466 = 'Contact Email:';
    _Eval(IQMS.Common.ResStrings.cTXT0000466);
  finally
    Memo.Lines.EndUpdate;
  end;
end;

end.
