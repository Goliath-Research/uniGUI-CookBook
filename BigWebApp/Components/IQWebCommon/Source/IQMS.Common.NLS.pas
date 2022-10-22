unit IQMS.Common.NLS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, System.SyncObjs, IQMS.Common.ResStrings;

  function IQFormat(const S: string; const Args: array of const): string;
  function IQStrToFloat( const S: string ): Real;
  function IQStrToDate( const S: string ): TDateTime;
  function IQStrToDateTime( const S: string ): TDateTime;
  function IQMonthStrToMonth( mmm: string ): Integer;
  function IQDayStrToDay( ddd: string ): Integer;
  function IQEnglishMonth( I: Integer ): string;
  function IQFloatToStrF(Value: Extended; Format: TFloatFormat; Precision, Digits: Integer): string;
  function IQDateTimeToStrEnglish( ADate: TDateTime ): string;

var
  CS_IQFormat: TCriticalSection;

implementation

type
  TIQFormat = class
    private
      _CurrencyString: string;
      _CurrencyFormat: Byte;
      _NegCurrFormat: Byte;
      _ThousandSeparator: Char;
      _DecimalSeparator: Char;
      _CurrencyDecimals: Byte;
      _DateSeparator: Char;
      _ShortDateFormat: string;
      _LongDateFormat: string;
      _TimeSeparator: Char;
      _TimeAMString: string;
      _TimePMString: string;
      _ShortTimeFormat: string;
      _LongTimeFormat: string;
      _ShortMonthNames: array[1..12] of string;
      _LongMonthNames: array[1..12] of string;
      _ShortDayNames: array[1..7] of string;
      _LongDayNames: array[1..7] of string;
      _SysLocale: TSysLocale;
      _EraNames: array[1..7] of string;
      _EraYearOffsets: array[1..7] of Integer;
      _TwoDigitYearCenturyWindow: Word;
      _ListSeparator: Char;
    protected
      procedure SaveFormats;
      procedure RestoreFormats;
      procedure AssignNorthAmericanFormat;
    public
      constructor Create;
      destructor Destroy; override;
  end;

{Wrappers}

function IQFormat(const S: string; const Args: array of const): string;
begin
  CS_IQFormat.Acquire;
  try
    with TIQFormat.Create do             {Save current formats and load North American instead}
    try
      Result:= Format( S, Args );
    finally
      Free;                              {Reload original formats}
    end;
  finally
    CS_IQFormat.Release;
  end;
end;

function IQStrToFloat( const S: string ): Real;
begin
  with TIQFormat.Create do
  try
    Result:= StrToFloat( S );
  finally
    Free;
  end;
end;


function IQStrToDate( const S: string ): TDateTime;
begin
  try
     with TIQFormat.Create do
     try
         {Attempt to convert using default delphi StrToDate.
          Unfortunately it will bomb if format is dd-MMM-yy.
          Resort to wwStrToDateVal}

         Result:= StrToDate( S );
     finally
       Free;
     end;
  except on E: Exception do
     // must be called outside TIQFormat
     Result := StrToDate(S);// wwSystem.wwStrToDateVal(S);
  end;
end;

function IQStrToDateTime( const S: string ): TDateTime;
var
   ABreak: Integer;
   ADatePart,
   ATimePart: String;
begin
  try
     with TIQFormat.Create do
     try
         {Attempt to convert using default delphi StrToDate.
          Unfortunately it will bomb if format is dd-MMM-yy.
          Resort to wwStrToDateVal}


         ADatePart := S;  // initial
         ATimePart := ''; // initial
         ABreak    := Pos(' ', S); // space between date and time
         if ABreak > 0 then
            begin
              ADatePart := Trim(Copy(S,1,ABreak));
              ATimePart := Trim(Copy(S,ABreak+1,Length(S)));
            end;

         // Depending on format, StrToDateTime may not work; so we evaluate
         // each part of the string separately.
         if ATimePart > '' then
            Result := StrToDate(ADatePart) + StrToTime(ATimePart)
         else
            Result := StrToDate(ADatePart);

     finally
       Free;
     end;
  except on E: Exception do
     // must be called outside TIQFormat or it will not work
//     Result := wwSystem.wwStrToDateVal(ADatePart) +  wwSystem.wwStrToTimeVal(ATimePart);
  end;
end;

{ Ex: IQMonthStrToMonth( 'mei' ) returns 5 }
function IQMonthStrToMonth( mmm: string ): Integer;
var
//  AMonths: string;
//  ADate  : TDateTime;
  I      : Integer;
begin
  // {First build 'JAN-FEB-MAR-APR-MAY-JUN-JUL-AUG-SEP-OCT-NOV-DEC' string }
  // AMonths:= '';
  // for I:= 1 to 12 do
  // begin
  //   ADate  := EncodeDate( 2000, I, 1);
  //   AMonths:= AMonths + '-' + FormatDateTime( 'mmm', ADate );
  // end;
  // AMonths:= Copy( UpperCase(AMonths), 2, 255); {Get rid of leading '-'}
  //
  // Result:= ( AnsiPos(AnsiUpperCase(mmm), AMonths) - 1) div 4 + 1;

  for I:= 1 to 12 do
    if AnsiCompareText( mmm, FormatSettings.ShortMonthNames[ I ]) = 0 then
    begin
      Result:= I;
      EXIT;
    end;
  raise Exception.CreateFmt( IQMS.Common.ResStrings.cTXT0000330 {'Unable to determine month number of %s'}, [ mmm ]);
end;


function IQDayStrToDay( ddd: string ): Integer;
var
  ADays: string;
  ADate: TDateTime;
  I    : Integer;
  ADivisor: Integer;
begin
  ADivisor:= Length(ddd) + 1;

  {First build 'MON-TUE-...-SUN' string }
  ADays:= '';
  for I:= 1 to 7 do
  begin
    {Pick a day such as May 13 2001 Sunday and work down}
    ADate:= EncodeDate( 2001, 5, 13 + I - 1);
    ADays:= ADays + '-' + FormatDateTime( 'ddd', ADate );
  end;
  ADays:= Copy( UpperCase( ADays ), 2, 255); {Get rid of leading '-'}

  Result:= (Pos(UpperCase(ddd), ADays) - 1) div ADivisor + 1;
end;


function IQEnglishMonth( I: Integer ): string;
begin
  Result:= Copy('JAN-FEB-MAR-APR-MAY-JUN-JUL-AUG-SEP-OCT-NOV-DEC', (I-1)*4+1, 3);
end;

function IQFloatToStrF(Value: Extended; Format: TFloatFormat; Precision, Digits: Integer): string;
begin
  with TIQFormat.Create do
  try
    Result:= FloatToStrF( Value, Format, Precision, Digits );
  finally
    Free;
  end;
end;

function IQDateTimeToStrEnglish( ADate: TDateTime ): string;
begin
  with TIQFormat.Create do
  try
    Result:= DateTimeToStr( ADate );
  finally
    Free;
  end;
end;


{ TIQFormat }

constructor TIQFormat.Create;
begin
  inherited;
  SaveFormats;
  AssignNorthAmericanFormat;
end;

destructor TIQFormat.Destroy;
begin
  RestoreFormats;
  inherited;
end;

procedure TIQFormat.SaveFormats;
begin
    _CurrencyString           := FormatSettings.CurrencyString;
    _CurrencyFormat           := FormatSettings.CurrencyFormat;
    _NegCurrFormat            := FormatSettings.NegCurrFormat;
    _ThousandSeparator        := FormatSettings.ThousandSeparator;
    _DecimalSeparator         := FormatSettings.DecimalSeparator;
    _CurrencyDecimals         := FormatSettings.CurrencyDecimals;
    _DateSeparator            := FormatSettings.DateSeparator;
    _ShortDateFormat          := FormatSettings.ShortDateFormat;
    _LongDateFormat           := FormatSettings.LongDateFormat;
    _TimeSeparator            := FormatSettings.TimeSeparator;
    _TimeAMString             := FormatSettings.TimeAMString;
    _TimePMString             := FormatSettings.TimePMString;
    _ShortTimeFormat          := FormatSettings.ShortTimeFormat;
    _LongTimeFormat           := FormatSettings.LongTimeFormat;
    _SysLocale                := System.SysUtils.SysLocale;
    _ListSeparator            := FormatSettings.ListSeparator;
    _TwoDigitYearCenturyWindow:= FormatSettings.TwoDigitYearCenturyWindow;
end;


procedure TIQFormat.RestoreFormats;
begin
  FormatSettings.CurrencyString           := _CurrencyString;
  FormatSettings.CurrencyFormat           := _CurrencyFormat;
  FormatSettings.NegCurrFormat            := _NegCurrFormat;
  FormatSettings.ThousandSeparator        := _ThousandSeparator;
  FormatSettings.DecimalSeparator         := _DecimalSeparator;
  FormatSettings.CurrencyDecimals         := _CurrencyDecimals;
  FormatSettings.DateSeparator            := _DateSeparator;
  FormatSettings.ShortDateFormat          := _ShortDateFormat;
  FormatSettings.LongDateFormat           := _LongDateFormat;
  FormatSettings.TimeSeparator            := _TimeSeparator;
  FormatSettings.TimeAMString             := _TimeAMString;
  FormatSettings.TimePMString             := _TimePMString;
  FormatSettings.ShortTimeFormat          := _ShortTimeFormat;
  FormatSettings.LongTimeFormat           := _LongTimeFormat;
  System.SysUtils.SysLocale               := _SysLocale;
  FormatSettings.ListSeparator            := _ListSeparator;
  FormatSettings.TwoDigitYearCenturyWindow:= _TwoDigitYearCenturyWindow;
end;

procedure TIQFormat.AssignNorthAmericanFormat;
begin
  FormatSettings.CurrencyString           := '$';
  FormatSettings.CurrencyFormat           := 0;
  FormatSettings.NegCurrFormat            := 0;
  FormatSettings.ThousandSeparator        := ',';
  FormatSettings.DecimalSeparator         := '.';
  FormatSettings.CurrencyDecimals         := 2;
  FormatSettings.DateSeparator            := '/';
  FormatSettings.ShortDateFormat          := 'MM/dd/yyyy';
  FormatSettings.LongDateFormat           := 'dddd, MMMM dd, yyyy';
  FormatSettings.TimeSeparator            := ':';
  FormatSettings.TimeAMString             := 'AM';
  FormatSettings.TimePMString             := 'PM';
  FormatSettings.ShortTimeFormat          := 'h:mm AMPM';
  FormatSettings.LongTimeFormat           := 'h:mm:ss AMPM';
  FormatSettings.ListSeparator            := ',';
  FormatSettings.TwoDigitYearCenturyWindow:= 0;
end;


initialization
  CS_IQFormat:= TCriticalSection.Create;

finalization
  CS_IQFormat.Free;


end.
