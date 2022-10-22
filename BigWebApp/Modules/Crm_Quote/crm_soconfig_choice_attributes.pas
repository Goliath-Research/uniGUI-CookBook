unit crm_soconfig_choice_attributes;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Menus,
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
  uniDBNavigator,
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmSalesConfigChoiceAttributes = class(TUniForm)
    wwDBGrid1: TIQUniGridControl;
    SrcSAlesChoiceAttribute: TDataSource;
    QrySalesChoiceAttribute: TFDQuery;
    QrySalesChoiceAttributeID: TBCDField;
    QrySalesChoiceAttributeSALES_OPTION_CHOICE_ID: TBCDField;
    QrySalesChoiceAttributeSALES_ATTRIBUTE_ID: TBCDField;
    QrySalesChoiceAttributeSEQ: TBCDField;
    QrySalesChoiceAttributeDESCRIP: TStringField;
    QrySalesChoiceAttributeRANGE_START: TFMTBCDField;
    QrySalesChoiceAttributeRANGE_END: TFMTBCDField;
    QrySalesChoiceAttributeUOM: TStringField;
    SR: TIQWebSecurityRegister;
    PopupMenu1: TUniPopupMenu;
    AssignDefaultAttributes1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QrySalesChoiceAttributeBeforeOpen(DataSet: TDataSet);
    { TODO -oSanketG -cWebConvert : Need to revisit ,
    [dcc32 Error] crm_soconfig_choice_attributes.pas(56): E2003 Undeclared identifier: 'TGridDrawState'}
    {procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);}
    procedure AssignDefaultAttributes1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FSales_Option_Choice_ID: Integer;
    procedure SetSales_Option_Choice_ID(const Value: Integer);
  public
    { Public declarations }
    class procedure DoShowModal( ASales_Option_Choice_ID: Integer);
    property Sales_Option_Choice_ID: Integer write SetSales_Option_Choice_ID;
  end;



implementation

{$R *.dfm}

uses
  IQMS.Common.RegFrm,
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //IQSecIns,
  IQMS.Common.DataLib;


{ TFrmSalesConfigChoiceAttributes }


class procedure TFrmSalesConfigChoiceAttributes.DoShowModal( ASales_Option_Choice_ID: Integer);
var
  FrmSalesConfigChoiceAttributes: TFrmSalesConfigChoiceAttributes;
begin
  FrmSalesConfigChoiceAttributes := self.Create(uniGUIApplication.UniApplication);
  FrmSalesConfigChoiceAttributes.FSales_Option_Choice_ID:= ASales_Option_Choice_ID;
  FrmSalesConfigChoiceAttributes.ShowModal;
end;

procedure TFrmSalesConfigChoiceAttributes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmSalesConfigChoiceAttributes.QrySalesChoiceAttributeBeforeOpen(
  DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'sales_option_choice_id', FSales_Option_Choice_ID);
end;

procedure TFrmSalesConfigChoiceAttributes.SetSales_Option_Choice_ID(
  const Value: Integer);
begin
  FSales_Option_Choice_ID := Value;
end;

procedure TFrmSalesConfigChoiceAttributes.UniFormCreate(Sender: TObject);
begin


  IQRegFormRead( self, [ self, wwDBGrid1 ]);
  IQSetTablesActive( TRUE, self );
end;

{ TODO -oSanketG -cWebConvert : Need to revisit ,
[dcc32 Error] crm_soconfig_choice_attributes.pas(115): E2005 'TGridDrawState' is not a type identifier}
{procedure TFrmSalesConfigChoiceAttributes.wwDBGrid1CalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean;
  AFont: TFont; ABrush: TBrush);
begin
  if Highlight then EXIT;

  if Field.ReadOnly then
     ABrush.Color:= clBtnFace;
end;}

procedure TFrmSalesConfigChoiceAttributes.AssignDefaultAttributes1Click(Sender: TObject);
begin
  ExecuteCommandFmt('begin crm_quote_misc.add_to_sales_choice_attribute( %d ); end;',
            [ FSales_Option_Choice_ID ]);
  QrySalesChoiceAttribute.Refresh;
end;


procedure TFrmSalesConfigChoiceAttributes.FormShow(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit, dependent on IQSecIns }
  //EnsureSecurityInspectorOnTopOf( self );
end;


end.
