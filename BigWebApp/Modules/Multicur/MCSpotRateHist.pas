unit MCSpotRateHist;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.About,
  Vcl.Menus,
  IQMS.WebVcl.Search,
{ TODO -oGPatil -cWebConvert : Dependency on Files
  MCRates, }
  Data.DB,
  Vcl.Wwquery,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmSpotRateHist = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    SR: TIQWebSecurityRegister;
    IQSearch1: TIQUniGridControl;
    SrcSpotRate: TDataSource;
    QrySpotRate: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    QrySpotRateID: TBCDField;
    QrySpotRateCURRENCY_ID: TBCDField;
    QrySpotRateEFFECTIVE_DATE: TDateTimeField;
    QrySpotRateSPOT_RATE: TFMTBCDField;
    QrySpotRateTIMESTAMP: TDateTimeField;
    QrySpotRateUSERID: TStringField;
    N1: TUniMenuItem;
    Contents1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure QrySpotRateBeforePost(DataSet: TDataSet);
{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
    procedure navBeforeAction(Sender: TObject; Button: TNavigateBtn); }
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoHistSpotRate;

implementation

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Mcshare;

{$R *.dfm}

procedure DoHistSpotRate;
var
  LFrmSpotRateHist : TFrmSpotRateHist;
begin
  LFrmSpotRateHist := TFrmSpotRateHist.Create(UniGUIApplication.UniApplication);
  LFrmSpotRateHist.Show;
end;

procedure TFrmSpotRateHist.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
  Action := caFree;
end;

procedure TFrmSpotRateHist.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmSpotRateHist.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmSpotRateHist.QrySpotRateBeforePost(DataSet: TDataSet);
begin
  QrySpotRateCURRENCY_ID.asFloat := QrySpotRate.DataSource.DataSet.FieldByName('ID').asFloat;
  if QrySpotRateID.asFloat = 0 then
    QrySpotRateID.asFloat := GetNextID('currency_rate_hist');
  try
    QrySpotRateUSERID.ReadOnly := False;
    QrySpotRateTIMESTAMP.ReadOnly := False;
    if QrySpotRateUSERID.asString = '' then
      QrySpotRateUSERID.asString := SecurityManager.UserName;

    QrySpotRateTIMESTAMP.asDateTime := SelectValueAsFloat('select sysdate from dual');
  finally
    QrySpotRateUSERID.ReadOnly := True;
    QrySpotRateTIMESTAMP.ReadOnly := True;
  end;
end;

procedure TFrmSpotRateHist.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
//  QrySpotRate.DataSource := TFrmMCrates(AOwner).SrcCurrency;
  QrySpotRate.Open;
{ TODO -oGPatil -cWebConvert :  Incompatible types: 'TDBNavigator' and 'TUniDBNavigator'
  IQMS.Common.Controls.ResizeNavBar(nav);  }
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmSpotRateHist.navBeforeAction(Sender: TObject; Button: TNavigateBtn);
var
  AId:Real;
begin
  if Button = nbRefresh then
  begin
    AId := QrySpotRateID.asFloat;
    QrySpotRate.Close;
    QrySpotRate.Open;
    QrySpotRate.Locate('ID', AId, []);
    Abort;
  end;
end; }

procedure TFrmSpotRateHist.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmSETUP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmSpotRateHist.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1111719 );
end;

end.
