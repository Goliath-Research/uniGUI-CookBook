unit Lab_Dtl;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.DBGrids,
  FireDAC.Comp.Client,
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
  FireDAC.Comp.DataSet,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator;

type
  TFrmLabor_Details_Base = class(TUniForm)
    Panel1: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    DBGrid1: TUniDBGrid;
    DataSource1: TDataSource;
    Query1: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }

    procedure SetDataSource(ADataSource : TDataSource);
  public
    { Public declarations }
    property ADataSource : TDataSource write SetDataSource;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm;

procedure TFrmLabor_Details_Base.SetDataSource(ADataSource: TDataSource);
begin
  with Query1 do
  begin
    Close;
    DataSource:= ADataSource;
    Open;
  end;
end;

procedure TFrmLabor_Details_Base.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, DBGrid1]);
end;

procedure TFrmLabor_Details_Base.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, DBGrid1]);
end;

end.
