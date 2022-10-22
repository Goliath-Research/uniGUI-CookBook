unit crm_soconfig_option_attributes;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  IQMS.WebVcl.Hpick,
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, IQUniGrid, uniGUIFrame;

type
  TFrmSalesConfigOptionAttributes = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    sbtnAttributes: TUniSpeedButton;
    SrcSalesOptionAttributes: TDataSource;
    QrySalesOptionAttributes: TFDQuery;
    QrySalesOptionAttributesID: TBCDField;
    QrySalesOptionAttributesSALES_OPTION_ID: TBCDField;
    QrySalesOptionAttributesSALES_ATTRIBUTE_ID: TBCDField;
    QrySalesOptionAttributesSEQ: TBCDField;
    QrySalesOptionAttributesSalesAttribute: TStringField;
    wwDBComboDlgAttribute: TUniEdit;
    PkAttribute: TIQWebHPick;
    PkAttributeID: TBCDField;
    PkAttributeDESCRIP: TStringField;
    PkAttributeUOM: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QrySalesOptionAttributesNewRecord(DataSet: TDataSet);
    procedure QrySalesOptionAttributesBeforeOpen(DataSet: TDataSet);
    procedure QrySalesOptionAttributesBeforePost(DataSet: TDataSet);
    procedure QrySalesOptionAttributesCalcFields(DataSet: TDataSet);
    procedure wwDBComboDlgAttributeCustomDlg(Sender: TObject);
    procedure sbtnAttributesClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FSales_Option_ID: Integer;
    procedure SetSales_Option_ID(const Value: Integer);
  public
    { Public declarations }
    property Sales_Option_ID: Integer write SetSales_Option_ID;
    class procedure DoShowModal(ASales_Option_ID: Integer);
  end;



implementation

{$R *.dfm}

uses
  crm_soconfig_attributes,
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib;

{ TFrmSalesConfigOptionAttributes }
class procedure TFrmSalesConfigOptionAttributes.DoShowModal(ASales_Option_ID: Integer);
var
  FrmSalesConfigOptionAttributes: TFrmSalesConfigOptionAttributes;
begin
  FrmSalesConfigOptionAttributes := self.Create(uniGUIApplication.UniApplication);
  FrmSalesConfigOptionAttributes.Sales_Option_ID:= ASales_Option_ID;
  FrmSalesConfigOptionAttributes.Show;
end;

procedure TFrmSalesConfigOptionAttributes.UniFormShow(Sender: TObject);
begin
  //IQRegFormRead( self, [ self ]);
  IQSetTablesActive( TRUE, self );
end;

procedure TFrmSalesConfigOptionAttributes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmSalesConfigOptionAttributes.QrySalesOptionAttributesBeforeOpen(
  DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'sales_option_id', FSales_Option_ID);
end;

procedure TFrmSalesConfigOptionAttributes.QrySalesOptionAttributesBeforePost(
  DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'sales_attribute' );
end;

procedure TFrmSalesConfigOptionAttributes.QrySalesOptionAttributesCalcFields(
  DataSet: TDataSet);
begin
  QrySalesOptionAttributesSalesAttribute.asString:= SelectValueByID('descrip', 'sales_attribute', QrySalesOptionAttributesSALES_ATTRIBUTE_ID.asInteger);
end;

procedure TFrmSalesConfigOptionAttributes.QrySalesOptionAttributesNewRecord(
  DataSet: TDataSet);
begin
  QrySalesOptionAttributesID.asInteger:= 0;
  QrySalesOptionAttributesSEQ.asInteger:= 1 + SelectValueFmtAsInteger('select max(seq) from sales_option_attribute where sales_option_id = %d',
                                                                      [ FSales_Option_ID ]);
  // Prompt with pick list
  wwDBComboDlgAttributeCustomDlg(wwDBComboDlgAttribute);
end;

procedure TFrmSalesConfigOptionAttributes.sbtnAttributesClick(Sender: TObject);
begin
  TFrmSalesConfigAttributes.DoShow( );   // crm_soconfig_attributes.pas
end;

procedure TFrmSalesConfigOptionAttributes.SetSales_Option_ID(
  const Value: Integer);
begin
  FSales_Option_ID := Value;
end;

procedure TFrmSalesConfigOptionAttributes.wwDBComboDlgAttributeCustomDlg(
  Sender: TObject);
var
  I: Integer;
  procedure _CheckAddAttribute( ASalesAttribute_ID: Integer );
  begin
    if SelectValueFmtAsInteger('select 1 from sales_option_attribute where sales_option_id = %d and sales_attribute_id = %d',
                               [ FSales_Option_ID,
                                 ASalesAttribute_ID ]) = 0 then
    begin
      QrySalesOptionAttributes.Edit;
      QrySalesOptionAttributesSALES_OPTION_ID.asInteger   := FSales_Option_ID;
      QrySalesOptionAttributesSALES_ATTRIBUTE_ID.asInteger:= ASalesAttribute_ID;
      QrySalesOptionAttributes.Post;
    end;
  end;

begin
  with PkAttribute do
    if Execute then
       _CheckAddAttribute( GetValue('id'))
end;

end.
