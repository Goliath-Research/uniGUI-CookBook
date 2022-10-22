unit TariffCodes;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.About,
  Vcl.Menus,
  IQMS.WebVcl.Search,
  Data.DB,
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
  TFrmTariffCode = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    IQSearch1: TIQUniGridControl;
    SrcTrariff: TDataSource;
    QryTariff: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    QryTariffID: TBCDField;
    QryTariffCODE: TStringField;
    QryTariffDESCRIP: TStringField;
    Content1: TUniMenuItem;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryTariffAfterPost(DataSet: TDataSet);
{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
    procedure NavBeforeAction(Sender: TObject; Button: TNavigateBtn);   }
    procedure QryTariffBeforePost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure Content1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

procedure DoTariffCodes ;

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook;
{$R *.dfm}

procedure DoTariffCodes;
var
  LFrmTariffCode : TFrmTariffCode;
begin
  LFrmTariffCode :=  TFrmTariffCode.Create(UniGUIApplication.UniApplication);
  LFrmTariffCode.Show;
end;

procedure TFrmTariffCode.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmTariffCode.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmTariffCode.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmTariffCode.QryTariffAfterPost(DataSet: TDataSet);
begin
{
  try
    QryTariff.DataBase.ApplyUpdates( [ QryTariff ]);
  except on E:Exception do
    begin
      Application.ShowException(E);
      QryTariff.Close;
      QryTariff.Open;
      System.SysUtils.ABORT;
    end;
  end;
}
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmTariffCode.NavBeforeAction(Sender: TObject;  Button: TNavigateBtn);
var
  AId:Real;
begin
  if Button = nbRefresh then
  begin
    AId := QryTariffID.asFloat;
    QryTariff.Close;
    QryTariff.Open;
    QryTariff.Locate('ID', AID, []);
    Abort;
  end;
end;   }

procedure TFrmTariffCode.QryTariffBeforePost(DataSet: TDataSet);
begin
  if QryTariffID.asFloat = 0 then
    QryTariffID.asFloat := GetNextID('TARIFF_CODE');
end;

procedure TFrmTariffCode.UniFormCreate(Sender: TObject);
begin
  QryTariff.Open;
  IQRegFormRead( self, [self]);
end;

procedure TFrmTariffCode.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmSETUP{HTM} )  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmTariffCode.Content1Click(Sender: TObject);
begin
 IQHelp.HelpContext( 16278 );
end;

end.
