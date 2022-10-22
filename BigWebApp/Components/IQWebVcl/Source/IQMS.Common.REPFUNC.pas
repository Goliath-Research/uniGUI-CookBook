unit IQMS.Common.RepFunc;

interface
  uses
  Forms,
  SysUtils;

  function REP_DEF_GET_GLPERIOD( var AValue: string ): Boolean;
  function REP_DEF_GET_PR_EMP_EARNINGS_DATE(var ADate:String):Boolean;
    
implementation

uses
  IQMS.Common.Period,
  IQMS.Common.DataLib,
  //DateDlg,
  IQMS.Common.Miscellaneous;

function REP_DEF_GET_GLPERIOD( var AValue: string ): Boolean;
var
  ID   : Real;
  ADate: TDateTime;
//  Year, Month, Day: Word;
begin
  ID:= DoFindPeriod;  { IPeriod.pas }
  Result:= ID > 0;
  if Result then
  begin
    ADate:= StrToDate( SelectValueFmtAsString('select end_date from glperiods where id = %f', [ ID ]));
//    DecodeDate(ADate, Year, Month, Day);
//    AValue:= Format('Date(%d,%d,%d)', [ Year, Month, Day ]);
    AValue := IQGetCRWDate(ADate);
  end;
end;

function REP_DEF_GET_PR_EMP_EARNINGS_DATE(var ADate:String):Boolean;
var
  ADt:TDateTime;
begin
  ADt := Date;
  Result := false; //GetDateDialog( ADt );  {in DateDlg.pas}
  ADate := IQGetCRWDate(ADt);      {in IqMisc.pas}
end;                            

end.
