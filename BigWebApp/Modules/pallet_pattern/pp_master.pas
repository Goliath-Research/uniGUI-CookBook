unit pp_master;

interface

uses
  FireDAC.Comp.Client,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  IQUniGrid,
  uniGUIFrame,
  Vcl.Forms,
  System.Classes,
  Vcl.Controls,
  Data.DB;

type
  TFrmPP_Master = class(TUniForm)
    Panel1: TUniPanel;
    DataSource1: TDataSource;
    Table1: TFDTable;
    wwDBGrid1: TIQUniGridControl;
    Table1ID: TBCDField;
    Table1DESCRIP: TStringField;
    Table1LAYERS: TBCDField;
    Table1LAYER_SIZE_FACTOR: TBCDField;
    Table1DOUBLE_STACKED: TStringField;
    Table1PALLET_TYPE: TBCDField;
    Table1CASES_PER_PALLET: TBCDField;
    DBNavigator1: TUniDBNavigator;
    Table1FORCETOFULLPALLET: TStringField;
    Table1PATTERN_KEY: TBCDField;
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShowModal;
  end;

var
  FrmPP_Master: TFrmPP_Master;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;
//  IQRegFrm;

procedure TFrmPP_Master.FormCreate(Sender: TObject);
begin
  //IQRegFormRead(self, [self, wwDBGrid1]);
  IQSetTablesActive( TRUE, self );
end;

procedure TFrmPP_Master.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 // IQRegFormWrite(self, [self, wwDBGrid1]);
end;

procedure TFrmPP_Master.Table1BeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );
end;

class procedure TFrmPP_Master.DoShowModal;
var
  frm : TFrmPP_Master;
begin

  frm := TFrmPP_Master.Create(uniGUIApplication.UniApplication);
  frm.ShowModal;

end;

end.
