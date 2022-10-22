unit TaDescr;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.DBGrids,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, uniMainMenu,
  Vcl.Controls;

type
  TFrmTaDescrip = class(TUniForm)
    Panel1: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    DBGrid1: TUniDBGrid;
    DataSource1: TDataSource;
    Table1: TFDTable;
    Table1ID: TBCDField;
    Table1DESCRIP: TStringField;
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoTaPrepDescriptions;

implementation

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib;

{$R *.DFM}

procedure DoTaPrepDescriptions;
var
  LFrmTaDescrip : TFrmTaDescrip;
begin
  LFrmTaDescrip := TFrmTaDescrip.Create(UniGUIApplication.UniApplication);
  LFrmTaDescrip.Show;
end;

procedure TFrmTaDescrip.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmTaDescrip.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, dbGrid1]);
end;

procedure TFrmTaDescrip.Table1BeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TFrmTaDescrip.UniFormCreate(Sender: TObject);
begin
  Table1.Open;
  IQRegFormRead( self, [self, dbGrid1]);
end;

end.
