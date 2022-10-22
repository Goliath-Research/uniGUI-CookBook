unit WC_8171;

interface

implementation

uses
  System.SysUtils,
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  Q_WrkSht;

procedure TestGetQPartWeightFromWorkSheet;
var
  LWeight: Real;
  LAVol: Real;
  LQinvt_ID: Real;
  LAQuote_ID: Real;
begin
  if GetQPartWeightFromWorkSheet(100266,//AQinvt_Mat_ID: Real;
                                 LWeight,//var AWeight:
                                 LAVol,//AVol
                                 LQinvt_ID,//Real; AQinvt_ID,
                                 LAQuote_ID//AQuote_ID: Real
                                 ) then
  begin
    ShowMessage('Weight: ' + FloatToStr(LWeight) +
                'Vol: ' + FloatToStr(LAVol) +
                'Qinvt_ID: ' + FloatToStr(LQinvt_ID) +
                'AQuote_ID: ' + FloatToStr(LAQuote_ID));
  end;
end;

initialization

TTestRepo.RegisterTest('WC-8171', 'Quote', 'FrmWeightWorkSheet',
  'GetQPartWeightFromWorkSheet', TestGetQPartWeightFromWorkSheet);

end.
