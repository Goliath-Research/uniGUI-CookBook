unit price_break_sum;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniPageControl, IQUniGrid, uniGUIFrame;

type
  TFrmCrmPriceBreaksSummary = class(TUniForm)
    SrcBreaks: TDataSource;
    QryArinvtBreaks: TFDQuery;
    QryQinvtBreaks: TFDQuery;
    QryArinvtBreaksQUAN: TBCDField;
    QryArinvtBreaksQPRICE: TFMTBCDField;
    QryArinvtBreaksPRICE_DATE: TDateTimeField;
    QryArinvtBreaksEFFECT_DATE: TDateTimeField;
    QryArinvtBreaksDEACTIVE_DATE: TDateTimeField;
    QryQinvtBreaksQUAN: TBCDField;
    QryQinvtBreaksQPRICE: TFMTBCDField;
    QryQinvtBreaksPRICE_DATE: TDateTimeField;
    QryQinvtBreaksEFFECT_DATE: TDateTimeField;
    QryQinvtBreaksDEACTIVE_DATE: TDateTimeField;
    QryAkaBreaks: TFDQuery;
    QryAkaBreaksQUAN: TBCDField;
    QryAkaBreaksQPRICE: TFMTBCDField;
    QryAkaBreaksPRICE_DATE: TDateTimeField;
    QryAkaBreaksEFFECT_DATE: TDateTimeField;
    QryAkaBreaksDEACTIVE_DATE: TDateTimeField;
    PageControl1: TUniPageControl;
    TabBreaks: TUniTabSheet;
    TabTiers: TUniTabSheet;
    Panel1: TUniPanel;
    Grid: TIQUniGridControl;
    Panel2: TUniPanel;
    GridTiers: TIQUniGridControl;
    SrcTiers: TDataSource;
    QryTiers: TFDQuery;
    QryTiersQUAN: TBCDField;
    QryTiersDISCOUNT: TFMTBCDField;
    QryArinvtBreaksValid: TBooleanField;
    QryAkaBreaksValid: TBooleanField;
    QryQinvtBreaksValid: TBooleanField;
    QryArinvtBreaksCURRENCY_DESCRIP: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DatasetBeforeOpen(DataSet: TDataSet);
    procedure DataSetAfterOpen(DataSet: TDataSet);
    { TODO -oSanketG -cWebConvert : Need to revisit ,
    [dcc32 Error] price_break_sum.pas(77): E2003 Undeclared identifier: 'TGridDrawState'}
    {procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);}
    procedure QryArinvtBreaksCalcFields(DataSet: TDataSet);
    procedure QryTiersAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FID: Real;
    FArcustoID: Real;
    function UseTeirBreaks(AArcustoID, AArinvtID: Real): Boolean;
    procedure CreateArinvtBreaks(AArcustoID, AArinvtID: Real);
    procedure CreateAkaBreaks(AArcustoID, AAkaID: Real);
    procedure CreateQinvtBreaks(QinvtID: Real);
    procedure OpenDatasets();
    procedure SetAkaBreaksDataset();
    procedure SetArinvtBreaksDataset();
    procedure ProcessAKABreaks(AAka_ID:Real);
  public
    { Public declarations }
  end;

procedure DoArinvtBreaksSummary(AArcustoID, AArinvtID: Real);
procedure DoAKABreaksSummary(AArcustoID, AAkaID: Real);
procedure DoQinvtBreaksSummary(AQinvtID: Real);



implementation

{$R *.DFM}


uses
  crm_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.Dates,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;

procedure DoArinvtBreaksSummary(AArcustoID, AArinvtID: Real);//CreateArinvtBreaks
var
  FrmCrmPriceBreaksSummary: TFrmCrmPriceBreaksSummary;
begin
  FrmCrmPriceBreaksSummary := TFrmCrmPriceBreaksSummary.Create(uniGUIApplication.UniApplication);
  with FrmCrmPriceBreaksSummary do
  begin
    CreateArinvtBreaks(AArcustoID, AArinvtID);
    Show;
  end;
end;

procedure DoAKABreaksSummary(AArcustoID, AAkaID: Real);//CreateAkaBreaks
var
  FrmCrmPriceBreaksSummary: TFrmCrmPriceBreaksSummary;
begin
  FrmCrmPriceBreaksSummary := TFrmCrmPriceBreaksSummary.Create(uniGUIApplication.UniApplication);
  with FrmCrmPriceBreaksSummary do
  begin
    CreateAkaBreaks(AArcustoID, AAkaID);
    Show;
  end;
end;

procedure DoQinvtBreaksSummary( AQinvtID: Real);//CreateQinvtBreaks
var
  FrmCrmPriceBreaksSummary: TFrmCrmPriceBreaksSummary;
begin
  FrmCrmPriceBreaksSummary := TFrmCrmPriceBreaksSummary.Create(uniGUIApplication.UniApplication);
  FrmCrmPriceBreaksSummary.CreateQinvtBreaks(AQinvtID);
  FrmCrmPriceBreaksSummary.Show;
end;

{ TFrmCrmPriceBreaksSummary }

procedure TFrmCrmPriceBreaksSummary.CreateArinvtBreaks( AArcustoID, AArinvtID: Real);
var
  AAKA_ID: Real;
begin
  FID := AArinvtID;
  FArcustoID := AArcustoID;

  // Determine Source - Arinvt or AKA
  AAKA_ID := SelectValueFmtAsFloat(
    'select id from aka where arcusto_id = %.0f and arinvt_id = %.0f',
    [AArcustoID, AArinvtID]);

  // show tiers?
  TabTiers.TabVisible := UseTeirBreaks(AArcustoID, AArinvtID);

  //Set Appropriate Dataset
  ProcessAKABreaks(AAKA_ID);

  // Open appropriate datasets
  OpenDatasets;
end;

procedure TFrmCrmPriceBreaksSummary.CreateAkaBreaks( AArcustoID, AAkaID: Real);
var
  AArinvtID: Real;
begin
  //FID := AAkaID;
  FArcustoID := AArcustoID;
  AArinvtID := SelectValueFmtAsFloat(
    'SELECT arinvt_id FROM aka WHERE id = %.0f', [AAkaID]);

  {QryAkaBreaks checks arinvt_id from table aka with given parameter ID}
  FID := AArinvtID;
  // show tiers?
  TabTiers.TabVisible := UseTeirBreaks(AArcustoID, AArinvtID);

  //Set Appropriate Dataset
  ProcessAKABreaks(AAkaID);

  // Open appropriate datasets
  OpenDatasets;
end;

procedure TFrmCrmPriceBreaksSummary.CreateQinvtBreaks( QinvtID: Real);
begin
  FID := QinvtID;
  SrcBreaks.DataSet := QryQinvtBreaks;
  QryQinvtBreaks.Open;
  TabTiers.TabVisible := FALSE;
  Caption := crm_rscstr.cTXT0000664;
end;

procedure TFrmCrmPriceBreaksSummary.FormCreate(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit ,
  [dcc32 Error] price_break_sum.pas(229): E2010 Incompatible types: 'TForm' and 'TFrmCrmPriceBreaksSummary'}
  //CenterForm(Self); // iqctrl; must be called before IQRegFormRead()
end;

procedure TFrmCrmPriceBreaksSummary.FormShow(Sender: TObject);
begin
  IQRegFormRead(Self, [Self, Grid]); // IQMS.Common.RegFrm.pas
end;

procedure TFrmCrmPriceBreaksSummary.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self, Grid]); // IQMS.Common.RegFrm.pas
  QryArinvtBreaks.Close;
  QryQinvtBreaks.Close;
end;

procedure TFrmCrmPriceBreaksSummary.DatasetBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', FID);
  AssignQueryParamValue(DataSet, 'ARCUSTO_ID', FArcustoID);
end;

procedure TFrmCrmPriceBreaksSummary.DataSetAfterOpen(DataSet: TDataSet);
begin
  Grid.Visible := not (DataSet.BOF and DataSet.EOF);
  // ( DataSet.FieldByName( 'QUAN' ).AsFloat > 0 );
end;

procedure TFrmCrmPriceBreaksSummary.QryTiersAfterOpen(DataSet: TDataSet);
begin
  GridTiers.Visible := not (DataSet.BOF and DataSet.EOF);
end;

procedure TFrmCrmPriceBreaksSummary.OpenDatasets;
begin
  // Open appropriate datasets
  if Assigned(SrcBreaks.DataSet) then
    ReOpen(SrcBreaks.DataSet);
  if TabTiers.TabVisible then
    ReOpen(QryTiers);
end;

procedure TFrmCrmPriceBreaksSummary.ProcessAKABreaks(AAka_ID: Real);
begin
  if (AAka_ID <> 0) and (SelectValueFmtAsFloat(
    'select aka_id from aka_breaks where aka_id = %.0f',
    [AAka_ID]) <> 0) then
  begin
    SetAkaBreaksDataset;
  end
  else
  begin
    SetArinvtBreaksDataset;
  end;
end;

procedure TFrmCrmPriceBreaksSummary.SetAkaBreaksDataset;
begin
  SrcBreaks.DataSet := QryAkaBreaks;
  TabBreaks.Caption := crm_rscstr.cTXT0000661;
  Caption := crm_rscstr.cTXT0000662;
end;

procedure TFrmCrmPriceBreaksSummary.SetArinvtBreaksDataset;
begin
  SrcBreaks.DataSet := QryArinvtBreaks;
  TabBreaks.Caption := crm_rscstr.cTXT0000660;
  Caption := crm_rscstr.cTXT0000663;
end;

{ TODO -oSanketG -cWebConvert : Need to revisit ,
[dcc32 Error] price_break_sum.pas(300): E2003 Undeclared identifier: 'GridCalcCellColors'}
{procedure TFrmCrmPriceBreaksSummary.GridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if SrcBreaks.DataSet.FieldByName('Valid').AsBoolean = FALSE then
    if not Highlight then
      ABrush.Color := clBtnFace;
end;}

function TFrmCrmPriceBreaksSummary.UseTeirBreaks(AArcustoID,
  AArinvtID: Real): Boolean;
begin
  Result := FALSE;
  Result := IsFoundFmt(
    'select NVL(tiers.BASED_ON_STD_PRICE, ''N'') as BASED_ON_STD_PRICE ' +
    '  from ar_discount_tiers tiers,                                   ' +
    '       arinvt,                                                    ' +
    '       arcusto                                                    ' +
    ' where arinvt.id = %f                                             ' +
    '   and arcusto.id = %f                                            ' +
    '   and NVL(tiers.AGGREGATE, ''N'') = ''N''                        ' +
    '   and arcusto.cust_type_id = tiers.cust_type_id                  ' +
    '   and arinvt.item_type_id  = tiers.item_type_id(+)               ',
    [AArinvtID, AArcustoID]);

end;

procedure TFrmCrmPriceBreaksSummary.QryArinvtBreaksCalcFields(
  DataSet: TDataSet);
var
  AStartDate, AEndDate: TDateTime;
begin
  with DataSet do
  begin
    if (Trunc(SrcBreaks.DataSet.FieldByName('DEACTIVE_DATE').AsDateTime) > 0) and
      (Trunc(SrcBreaks.DataSet.FieldByName('DEACTIVE_DATE').AsDateTime) < IQOracleAdjustedDate) then
      FieldByName('Valid').AsBoolean := FALSE
    else
      FieldByName('Valid').AsBoolean := TRUE;
  end;
end;

end.
