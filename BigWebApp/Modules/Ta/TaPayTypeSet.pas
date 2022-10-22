unit TaPayTypeSet;

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
  Menus,
  ExtCtrls,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.About,
  DB,
  Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmPayTypeSettings = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Exit1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    IQSearch1: TIQUniGridControl;
    SrcPayType: TDataSource;
    QryPayType: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    QryPayTypeDESCRIPTION: TStringField;
    QryPayTypeTA_OT: TStringField;
    QryPayTypeID: TBCDField;
    procedure QryPayTypeBeforeDelete(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryPayTypeAfterPost(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


procedure EditPayTypeSettings();



implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
{$R *.dfm}


procedure EditPayTypeSettings();
var
  FrmPayTypeSettings: TFrmPayTypeSettings;
begin
  FrmPayTypeSettings := TFrmPayTypeSettings.Create(uniGUIApplication.uniApplication);
  FrmPayTypeSettings.Show;
end;

procedure TFrmPayTypeSettings.QryPayTypeBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

procedure TFrmPayTypeSettings.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
  QryPayType.Open;
end;

procedure TFrmPayTypeSettings.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QryPayType.CheckBrowseMode;
  IQRegFormWrite( self, [self]);
end;

procedure TFrmPayTypeSettings.QryPayTypeAfterPost(DataSet: TDataSet);
begin
  try
    QryPayType.ApplyUpdates;
  except on E:Exception do
    begin
      Application.ShowException(E);
      QryPayType.Close;
      QryPayType.Open;
      SysUtils.ABORT;
    end;
  end;
end;

procedure TFrmPayTypeSettings.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPayTypeSettings.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

end.
