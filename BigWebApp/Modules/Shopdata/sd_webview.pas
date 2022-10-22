unit sd_webview;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  SHDocVw,
  IQMS.WebVcl.About,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, uniMainMenu, Vcl.OleCtrls, Vcl.Controls;

type
  TFrmSDWebView = class(TUniForm)
    PnlCarrier: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    Contents1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    WebBrowser1: TWebBrowser;
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FURL: String;
    function GetWebBrowser: TWebBrowser;
    class procedure CheckSetEmbeddedWebbrowserMode; static;
  public
    { Public declarations }

    procedure Navigate; overload;
    procedure Navigate(const AURL: String); overload;

    property URL: String read FURL write FURL;
    property WebBrowser: TWebBrowser read GetWebBrowser;
  end;

  TIEMode = (iemUnknown, iemIE7, iemIE8, iemIE9, iemIE10);

implementation

{$R *.dfm}

uses
  IQMS.Common.HelpHook,
  IQMS.Common.Numbers,
  IQMS.Common.RegSet,
  IQMS.Common.Registry,
  IQMS.Common.StringUtils;

{ TFrmSDWebView }

procedure TFrmSDWebView.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmSDWebView.FormActivate(Sender: TObject);
begin
 IQHelp.AssignHTMLFile( iqchmRTPM_Monitor{CHM}, iqhtmRTPM_Monitor{HTM} );  {IQMS.Common.HelpHook.pas}
end;

function TFrmSDWebView.GetWebBrowser: TWebBrowser;
begin
{ TODO : TWebBrowser not yet converted }
  Result := Self.WebBrowser1;
end;

procedure TFrmSDWebView.Navigate(const AURL: String);
begin
  FURL := AURL;
  Self.Navigate;
end;

procedure TFrmSDWebView.Navigate;
begin
{ TODO : TWebBrowser not yet converted }
  WebBrowser1.Navigate(FURL);
end;

procedure TFrmSDWebView.UniFormCreate(Sender: TObject);
begin
  FURL := URL;
  Navigate;
end;

procedure TFrmSDWebView.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

class procedure TFrmSDWebView.CheckSetEmbeddedWebbrowserMode;
var
  REG_KEY_CNTRL,
  REG_KEY_INSTALLED_IE,
  installedIEVersion,
  AppName :string;
  installedIEVersionMajor:Integer;
begin
  REG_KEY_CNTRL       := RegPathSoftwareCheckWow6432Node + 'Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION';
  REG_KEY_INSTALLED_IE:= RegPathSoftwareCheckWow6432Node + 'Microsoft\Internet Explorer';
  installedIEVersion  := IQMS.Common.RegSet.ReadSetting_string2(REG_KEY_INSTALLED_IE, 'svcVersion', '');
  if installedIEVersion = '' then
    installedIEVersion:= IQMS.Common.RegSet.ReadSetting_string2(REG_KEY_INSTALLED_IE, 'Version', '');

  installedIEVersion:= IQMS.Common.StringUtils.GetToken(installedIEVersion, '.', 1);
  if IQMS.Common.Numbers.IsStringValidInteger(installedIEVersion, installedIEVersionMajor) and (installedIEVersionMajor <= 7) then
    EXIT;

  AppName := ExtractFileName(Application.ExeName);
  if IQMS.Common.RegSet.ReadSetting_Int2(REG_KEY_CNTRL, AppName, installedIEVersionMajor*1000) = installedIEVersionMajor*1000 then
    EXIT;

  IQMS.Common.RegSet.WriteSetting_Int2(REG_KEY_CNTRL, AppName, installedIEVersionMajor*1000);
end;

procedure TFrmSDWebView.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

initialization
  TFrmSDWebView.CheckSetEmbeddedWebbrowserMode;

end.
