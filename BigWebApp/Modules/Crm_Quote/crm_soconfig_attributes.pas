unit crm_soconfig_attributes;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Data.DB,
  FireDAC.Comp.Client,
  vcl.wwdblook,
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
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniComboBox,
  uniDBComboBox, IQUniGrid, uniGUIFrame;

type
  TFrmSalesConfigAttributes = class(TUniForm)
    IQSearch1: TIQUniGridControl;
    SrcSalesAttribute: TDataSource;
    QrySalesAttribute: TFDQuery;
    QrySalesAttributeID: TBCDField;
    QrySalesAttributeDESCRIP: TStringField;
    QrySalesAttributeUOM: TStringField;
    QryArinvtUom: TFDQuery;
    QryArinvtUomID: TBCDField;
    QryArinvtUomUOM: TStringField;
    wwDBLookupComboUOM: TUniDBLookupComboBox;
    wwDBComboBoxType: TUniDBComboBox;
    QrySalesAttributeTYPE: TStringField;
    SrcArinvtUom: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QrySalesAttributeNewRecord(DataSet: TDataSet);
    procedure QrySalesAttributeBeforePost(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShow();
  end;



implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;


{ TFrmSalesConfigAttribute }
class procedure TFrmSalesConfigAttributes.DoShow();
var
  FrmSalesConfigAttributes: TFrmSalesConfigAttributes;
begin
  FrmSalesConfigAttributes := TFrmSalesConfigAttributes.Create(uniGUIApplication.UniApplication);
  FrmSalesConfigAttributes.Show;
end;

procedure TFrmSalesConfigAttributes.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
  IQSetTablesActive( TRUE, self );
end;

procedure TFrmSalesConfigAttributes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmSalesConfigAttributes.QrySalesAttributeBeforePost(
  DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'sales_attribute' );
end;

procedure TFrmSalesConfigAttributes.QrySalesAttributeNewRecord(
  DataSet: TDataSet);
begin
  QrySalesAttributeID.asInteger:= 0;
end;

end.
