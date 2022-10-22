unit IQMS.Common.Dart_STA;

interface

uses
  System.SysUtils,
  IQMS.Common.RecMMap;

type
  TDartStatus = class( TRecMemMapFile )
  private
    function GetNodeName             : string;
    function GetMachineName          : string;
    function GetMoldName             : string;
    function GetChangeCounter        : Integer;
    function GetJobStatus            : Integer;
    function GetAlarmStatus          : Integer;
    function GetLastCycleTime        : Real;
    function GetAvgCycleTime         : Real;
    function GetTotalCycles          : Integer;
    function GetRejectCycles         : Integer;
    function GetPartsToGo            : Integer;
    function GetGoodParts            : Integer;
    function GetGoodCyclesSinceAlarm : Integer;
    function GetRunTime              : Integer;
    function GetTimeToGo             : Integer;
    function GetDownTime             : Integer;
    function GetDownSince            : string;
    function GetAlarmChangeCounter   : Integer;
    function GetTimeLoadPercent      : Integer;
    function GetSummaryFileName      : string;
    function GetReplayRate           : Integer;
    function GetShiftNo              : Integer;
    function GetExceedingSTDcounter  : Integer;

    function GetNodeNameEmpty        : Boolean;
    function GetMachineNameEmpty     : Boolean;

  protected
    function GetRecSize: Longint; override;
    procedure AssignHeader; override;
  public
    {Fields}
    property NodeName             : string  read GetNodeName              ;
    property MachineName          : string  read GetMachineName           ;
    property MoldName             : string  read GetMoldName              ;
    property ChangeCounter        : Integer read GetChangeCounter         ;
    property JobStatus            : Integer read GetJobStatus             ;
    property AlarmStatus          : Integer read GetAlarmStatus           ;
    property LastCycleTime        : Real    read GetLastCycleTime         ;
    property AvgCycleTime         : Real    read GetAvgCycleTime          ;
    property TotalCycles          : Integer read GetTotalCycles           ;
    property RejectCycles         : Integer read GetRejectCycles          ;
    property PartsToGo            : Integer read GetPartsToGo             ;
    property GoodParts            : Integer read GetGoodParts             ;
    property GoodCyclesSinceAlarm : Integer read GetGoodCyclesSinceAlarm  ;
    property RunTime              : Integer read GetRunTime               ;
    property TimeToGo             : Integer read GetTimeToGo              ;
    property DownTime             : Integer read GetDownTime              ;
    property DownSince            : string  read GetDownSince             ;
    property AlarmChangeCounter   : Integer read GetAlarmChangeCounter    ;
    property TimeLoadPercent      : Integer read GetTimeLoadPercent       ;
    property SummaryFileName      : string  read GetSummaryFileName       ;
    property ReplayRate           : Integer read GetReplayRate            ;
    property ShiftNo              : Integer read GetShiftNo               ;
    property ExceedingSTDcounter  : Integer read GetExceedingSTDcounter   ;

    {Misc}
    property NodeNameEmpty        : Boolean read GetNodeNameEmpty         ;
    property MachineNameEmpty     : Boolean read GetMachineNameEmpty      ;
  end;

procedure CreateDartStatus( const AFileName : string; var DartStatus : TDartStatus );

implementation

procedure CreateDartStatus( const AFileName : string; var DartStatus : TDartStatus );
begin
  if Assigned(DartStatus) then
    DartStatus.Free;
  DartStatus:= TDartStatus.Create( AFileName, fmOpenRead, TRUE );
  DartStatus.CheckError;
end;

procedure TDartStatus.AssignHeader;
begin
  HeaderSize:= 6 + SmallInt( Pointer( LongInt(Data) + 4 )^ );
end;

function TDartStatus.GetRecSize: Longint;
begin
  Result:= SmallInt( Pointer( LongInt(Data) + 2 )^ )
end;

function TDartStatus.GetNodeName : string;
begin
  Result:= PChar( FieldAt[ 0 ])
end;

function TDartStatus.GetMachineName: string;
begin
  Result:= PChar( FieldAt[ 9 ])
end;

function TDartStatus.GetMoldName: string;
begin
  Result:= PChar( FieldAt[ 30 ])               {13}
end;

function TDartStatus.GetChangeCounter: Integer;
begin
  Result:= Word( FieldAt[ 57 ]^ );             {22}
end;

function TDartStatus.GetJobStatus: Integer;
begin
  Result:= SmallInt( FieldAt[ 59 ]^ )          {24}
end;

function TDartStatus.GetAlarmStatus: Integer;
begin
  Result:= SmallInt( FieldAt[ 61 ]^ )          {26}
end;

function TDartStatus.GetLastCycleTime: Real;
begin
  Result:= SmallInt( FieldAt[ 63 ]^ ) / 100;   {28}
end;

function TDartStatus.GetAvgCycleTime: Real;
begin
  Result:= SmallInt( FieldAt[ 65 ]^ ) / 100;   {30}
end;

function TDartStatus.GetTotalCycles: Integer;
begin
  Result:= LongInt( FieldAt[ 67 ]^ )           {32}
end;

function TDartStatus.GetRejectCycles: Integer;
begin
  Result:= LongInt( FieldAt[ 71 ]^ )           {36}
end;

function TDartStatus.GetPartsToGo: Integer;
begin
  Result:= LongInt( FieldAt[ 75 ]^ )           {40}
end;

function TDartStatus.GetGoodParts: Integer;
begin
  Result:= LongInt( FieldAt[ 79 ]^ )           {44}
end;

function TDartStatus.GetGoodCyclesSinceAlarm: Integer;
begin
  Result:= LongInt( FieldAt[ 83 ]^ )           {48}
end;

function TDartStatus.GetRunTime: Integer;
begin
  Result:= LongInt( FieldAt[ 87 ]^ )           {52}
end;

function TDartStatus.GetTimeToGo: Integer;
begin
  Result:= LongInt( FieldAt[ 91 ]^ )           {56}
end;

function TDartStatus.GetDownTime: Integer;
begin
  Result:= LongInt( FieldAt[ 95 ]^ )           {60}
end;

function TDartStatus.GetDownSince : string;
begin
  Result:= PChar( FieldAt[ 99 ] )              {64}
end;

function TDartStatus.GetAlarmChangeCounter : Integer;
begin
  Result:= Word( FieldAt[ 132]^ )              {97}
end;

function TDartStatus.GetTimeLoadPercent: Integer;
begin
  Result:= SmallInt( FieldAt[ 134]^ )          {99}
end;

function TDartStatus.GetSummaryFileName: string;
begin
  Result:= PChar( FieldAt[ 136 ])              {101}
end;

function TDartStatus.GetReplayRate: Integer;
begin
  Result:= Word( FieldAt[ 145 ]^ )             {110}
end;

function TDartStatus.GetShiftNo: Integer;
begin
  Result:= SmallInt( FieldAt[ 147 ]^ )         {112}
end;

function TDartStatus.GetExceedingSTDcounter: Integer;
begin
  Result:= LongInt( FieldAt[ 149 ]^ )          {114}
end;

function TDartStatus.GetNodeNameEmpty : Boolean;
begin
  Result:= (Trim(NodeName) = '') or ( Copy( NodeName, 1, 8 ) = '--------' );
end;

function TDartStatus.GetMachineNameEmpty : Boolean;
begin
  Result:= (Trim(MachineName) = '') or ( Copy( MachineName, 1, 3 ) = '---' );
end;

end.

