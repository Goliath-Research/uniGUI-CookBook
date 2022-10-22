unit ConfForecastRelease;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  System.Variants,
  IQMS.Common.Confbas,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniButton,
  uniLabel, uniCheckBox;

type
  TFrmConfForecastRelease = class(TIQDialogCheckBox)
    Label1: TUniLabel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AssignText(S: string); override;
  end;

procedure CheckReleaseForForecast(AReleases_ID: Real);

implementation

{$R *.DFM}


uses
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  packslip_rscstr,
  IQMS.Common.StatChk;

procedure CheckReleaseForForecast(AReleases_ID: Real);
var
  AData: Variant;
  AMesg: string;
begin
  if SelectValueFmtAsInteger(
    'select 1 from releases where id = %f and forecast = ''Y''',
    [AReleases_ID]) = 0 then
    Exit;

  AData := SelectValueArrayFmt(
    'select o.orderno,                                '#13 +
    '       NVL(a.itemno, d.misc_item) as itemno,     '#13 +
    '       NVL(a.descrip, ''Misc Item'') as descrip, '#13 +
    '       r.request_date,                           '#13 +
    '       r.promise_date,                           '#13 +
    '       r.quan,                                   '#13 +
    '       arcusto.ship_forecast                     '#13 +
    '  from releases r,                               '#13 +
    '       ord_detail d,                             '#13 +
    '       orders o,                                 '#13 +
    '       arinvt a,                                 '#13 +
    '       arcusto                                   '#13 +
    ' where r.id = %f                                 '#13 +
    '   and d.id = r.ord_detail_id                    '#13 +
    '   and d.orders_id = o.id                        '#13 +
    '   and d.arinvt_id = a.id(+)                     '#13 +
    '   and o.arcusto_id = arcusto.id(+)              ',
    [AReleases_ID]);

  // packslip_rscstr.cTXT0000126 = 'Unable to locate release.';
  IQAssert(VarArrayDimCount(AData) > 0, packslip_rscstr.cTXT0000126);

  // ship_forecast. Aug-14-2002
  if AData[6] = 'Y' then
    EXIT;

  // packslip_rscstr.cTXT0000127 =
  // 'The following forecast release needs an authorization: '#13#13 +
  // '   Order #: %s'#13 +
  // '   Item #: %s'#13 +
  // '   Description: %s'#13 +
  // '   Request Date: %s'#13 +
  // '   Promise Date: %s'#13 +
  // '   Release Quantity: %s';
  AMesg := IQFormat(packslip_rscstr.cTXT0000127,
    [System.Variants.VarToStr(AData[0]), // order
    System.Variants.VarToStr(AData[1]), // item
    System.Variants.VarToStr(AData[2]), // descrip
    DateToStr(System.Variants.VarAsType(AData[3], varDate)), // request date
    DateToStr(System.Variants.VarAsType(AData[4], varDate)), // request date
    IntToStr(System.Variants.VarAsType(AData[5], varUInt64))]); // release qty

  // IQDialogChkEx is defined in IQMesg,
  // TFrmConfForecastRelease is in ConfForecastRelease - this unit
  { TODO -oathite -cWebConvert : Incompatible types: 'TFormClass' and 'class of TFrmConfForecastRelease'
  if IQDialogChkEx(TFrmConfForecastRelease, AMesg,
    'FrmConfForecastRelease') = 0 then
    raise IQMS.Common.StatChk.TIQNotAuthorizedException.CreateFmt('%s',
      [packslip_rscstr.cTXT0000128]); }
end;

procedure TFrmConfForecastRelease.AssignText(S: string);
begin
  Label1.Caption := S;
end;

end.
