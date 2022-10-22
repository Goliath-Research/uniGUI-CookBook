unit TariffHistory;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  vcl.wwdatsrc,
  IQMS.WebVcl.Search,
  //Bas_invt, { TODO : Dependency }
  Vcl.Menus,
  IQMS.WebVcl.About,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmTariffHistory = class(TUniForm)
    IQSearch2: TIQUniGridControl;
    SrcTariffHist: TDataSource;
    QryTariffHist: TFDQuery;
    QryTariffHistID: TBCDField;
    QryTariffHistOLD_TARIFF_CODE_ID: TBCDField;
    QryTariffHistDATE_REVIEWED: TDateTimeField;
    QryTariffHistREASON: TStringField;
    QryTariffHistDATE_CHANGED: TDateTimeField;
    QryTariffHistARINVT_ID: TBCDField;
    QryTariffHistUSERID: TStringField;
    QryTariffHistNEW_TARIFF_CODE_ID: TBCDField;
    QryTariffHistOLD_CODE: TStringField;
    QryTariffHistNEW_CODE: TStringField;
    QryTariffHistOLD_DESCRIP: TStringField;
    QryTariffHistNEW_DESCRIP: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowTariffHist(AOwner:TComponent);


implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
{$R *.dfm}

procedure ShowTariffHist(AOwner:TComponent);
Var
  LFrmTariffHistory : TFrmTariffHistory;
begin
  LFrmTariffHistory := TFrmTariffHistory.create(UniGUIApplication.UniApplication);
  with LFrmTariffHistory do
  begin
    //QryTariffHist.DataSource := TBas_Inv(LFrmTariffHistory).DM.SrcArinvt;
      Show;
  end;

end;

procedure TFrmTariffHistory.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmTariffHistory.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmTariffHistory.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
  Action := caFree;
end;

procedure TFrmTariffHistory.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
  QryTariffHist.Open;
end;

end.
