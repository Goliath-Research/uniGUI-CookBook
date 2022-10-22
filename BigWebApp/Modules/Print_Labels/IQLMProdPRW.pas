unit IQLMProdPRW;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  IQLMProd,
  Mask,
  Vcl.Buttons,
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
  FireDAC.Comp.Client,
  IQMS.WebVcl.Hpick,
  Data.DB,
  FireDAC.Comp.DataSet,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.UserDefinedLabel,
  Vcl.Forms,
  Vcl.Controls,
  IQMS.WebVcl.UDComboBox,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton, uniMainMenu, uniSplitter, uniScrollBox, IQUniGrid,
  uniGUIFrame, uniDBNavigator, uniComboBox, uniDBComboBox, uniDateTimePicker,
  uniDBDateTimePicker, uniMultiItem, uniDBLookupComboBox, uniEdit,
  uniPageControl, uniPanel, uniLabel;

type
  TFrmLM_ProdPRW = class(TFrmLM_Prod)
    sbtnCalcWeightVolume: TUniSpeedButton;
    procedure sbtnCalcWeightVolumeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AssignDefaultCustomer;
    constructor Create( AOwner:TComponent; AArinvt_ID: Real ); override;
  end;

var
  FrmLM_ProdPRW: TFrmLM_ProdPRW;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.PrintLabels.LabelMatrix,
  prw_rscstr,
  IQMS.WebVcl.ResourceStrings,
  wo_misc;

constructor TFrmLM_ProdPRW.Create(AOwner: TComponent; AArinvt_ID: Real);
var
  ADimUom: string;
begin
  inherited;

  Label16.Caption:= Format('(%s)', [SelectValueAsString('select lower(nvl(params.weight_uom, ''lbs'')) from params')]);

  ADimUom:= SelectValueAsString('select lower(case_dim_uom) from params');
  if ADimUom > '' then
     Label17.Caption:= Format(prw_rscstr.cTXT0000021, [ ADimUom ]); // '(cu.%s)';
end;

procedure TFrmLM_ProdPRW.sbtnCalcWeightVolumeClick(Sender: TObject);
var
  AHasWorkorderBOM: Boolean;
  AWeight         : Real;
  AVolume         : Real;
begin
  inherited;  // n

  with TIQWebLMBase(self.Owner) do
  begin
    DM.CalculateTotalWeight( Standard_ID,
                             Arinvt_ID,
                             Workorder_ID,
                             StrToFloat(EditBox.Text),  // label qty
                             wo_misc.IsWorkorderHardAlloc( Workorder_ID ) = 1,
                             AWeight,
                             AVolume );

    self.editVolume.Text:= FloatToStr( AVolume );
    self.editWeight.Text:= FloatToStr( AWeight );
  end;
end;


procedure TFrmLM_ProdPRW.AssignDefaultCustomer;
var
  ACompany: string;
begin
  DM.DoNotDefaultArcusto:= True;
  AssignCustomerLookupParams;
  ACompany:= DM.wwQryCustomerCOMPANY.AsString;
  wwDBLookupComboCustomer.DataSource.DataSet.FieldByName(wwDBLookupComboCustomer.DataField).AsString:= SelectValueFmtAsString('select a.company from arcusto a where a.id = %f', [ TIQWebLMBase(self.Owner).Arcusto_ID ]);
  if wwDBLookupComboCustomer.DataSource.DataSet.FieldByName(wwDBLookupComboCustomer.DataField).AsString = '' then
     wwDBLookupComboCustomer.DataSource.DataSet.FieldByName(wwDBLookupComboCustomer.DataField).AsString:= ACompany;
  wwDBLookupComboCustomerChange( NIL );  {refresh manually bill-to and labels}
end;

end.
