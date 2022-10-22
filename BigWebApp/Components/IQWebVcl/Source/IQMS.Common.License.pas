unit IQMS.Common.License;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Forms,
  FireDAC.Comp.Client, FireDAC.Phys;

type
  TUserLoginStats = (ulsNone, ulsRetrived, ulsError);

function IQLicensed: Boolean;

function IQLicensed_RT: Boolean;
function IQLicensed_RT_Scrap: Boolean;

function RT_Licensed_Count: Real;
function RT_Illum_RT_Count: Real;

function RT_Scrap_Licensed_Count: Real;
function RT_Illum_RT_Scrap_Count: Real;

function RT_PCMon_Licensed_Count: Real;
function RT_PCMon_Device_Count: Real;

function EIQMobile_Licensed_Count: Real;
function EIQMobile_Users_Count: Real;

procedure CheckExeName( const ExeName:string );
function GetEPlantLicenseCounts( var ALicensed, ACurrent: Real ): Boolean;
function IsEPlantLicensed: Boolean;
procedure CheckTerminatekExecutionWhenLicenseMethod( AMethod: string );
function GetOrphanSpawnedUsersCount( AExeNameDot: string ): Real;
function GetSpawnedSessionsCount: Real;

function GetUsersLoginStats( var AuthUsersCount,
                                 CurrUsersCount,
                                 OrphanSpawnedUsersCount: Real ): TUserLoginStats;

implementation

uses
  IQMS.Common.Dates,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.ResStrings,
  IQMS.Common.StringUtils,
  System.Variants;

procedure CheckExeName( const ExeName:string );
begin
  if UpperCase(ExeName) <> UpperCase(ExtractFileName( Application.ExeName )) then
  begin
    // 'The name of the executable file, %s, has been altered.  Terminating the program...'
    IQError(Format(IQMS.Common.ResStrings.cTXT0000142, [ ExeName ]));
    Application.Terminate;
    Application.ProcessMessages;
  end;
end;

function GetEPlantLicenseCounts( var ALicensed, ACurrent: Real ): Boolean;
begin
  ACurrent:= SelectValueAsFloat('select count(*) from eplant where nvl(inactive, ''N'') <> ''Y'' ');
  try
    with TFDQuery.Create(NIL) do
    try
      ConnectionName:= 'IQFD';
      SQL.Add('select eplant_count from iqorder2');
      Open;
      if Fields[ 0 ].AsString = '' then
         ALicensed:= 0
      else
         ALicensed:= StrToFloat( Trim( CharXOR( Fields[ 0 ].AsString )));
      Result:= TRUE;
    finally
      Free;
    end;
  except
    ALicensed:= 0;
    Result   := FALSE;
  end;
end;

function IsEPlantLicensed: Boolean;
var
  ALicensed, ACurrent: Real;
begin
  Result := False;
  if GetEPlantLicenseCounts(ALicensed, ACurrent) then
    Result := ALicensed > 0;
end;

function IQLicensed: Boolean;
label
  check_stop_date;
var
  AuthUsersCount : Real;
  StopDate       : TDateTime;
  CurrUsersCount : Real;
  OrphanSpawnedUsersCount: Real;
  EPlantCountLic : Real;
  EPlantCountCurr: Real;

  AppExeName    : string;
  AuthUsersCol  : string;

  AMethod       : string;
begin
  Result:= TRUE;
  case GetUsersLoginStats( AuthUsersCount, CurrUsersCount, OrphanSpawnedUsersCount ) of
    ulsNone    : EXIT (true);
    ulsRetrived: ; // contintue
    ulsError   : EXIT (false);
  end;

  AppExeName:= UpperCase(ExtractFileName( Application.ExeName ));

  try
    with TFDQuery.Create(NIL) do
    try
      ConnectionName:= 'IQFD';
      FormatOptions.StrsTrim:= false;
      SQL.Add('select stop, method from iqorder2');
      Open;
      StopDate:= StrToDateY2K( Trim( CharXOR( Fields[ 0 ].AsString )));
      AMethod := Trim( CharXOR( Fields[ 1 ].AsString ));
    finally
      Free;
    end;

    {09-15-2008 special CRM and Combined license}
    if (CompareText(AppExeName, 'IQCRM.EXE') = 0) and
       (CompareText(AMethod, 'COMBINED') = 0) then
    begin
       Result:= TRUE;
       goto check_stop_date;
    end;

    // add normal users and orphan children
    CurrUsersCount:= CurrUsersCount + OrphanSpawnedUsersCount;

    {Number of users}
    Result:= (AuthUsersCount > 0) and (CurrUsersCount <= AuthUsersCount);

    {EPlants}
    if Result then
       if GetEPlantLicenseCounts( EPlantCountLic, EPlantCountCurr ) then
       begin
         // Just uncomment the line below to replace warning
         // Result:= EPlantCountCurr <= EPlantCountLic;
         if EPlantCountCurr > EPlantCountLic then
         { 'You are licensed to use %0.f EPlants; however, %0.f are found to be in use by the system.'#13#13+
           'To avoid future interruption and continue using the software please contact IQMS, Inc. to ' +
           'verify the license agreement.' }
            IQWarning(Format(IQMS.Common.ResStrings.cTXT0000143,
                             [ EPlantCountLic, EPlantCountCurr ]));
       end;

    check_stop_date:
    {Stop Date}
    if Result then
       if StopDate <> IQStrToDate('10/10/1990') then
          Result:= Result and (StopDate > 0 ) and (Date <= StopDate);

  except
    Application.ShowException( Exception( ExceptObject ));
    Result:= FALSE;
  end
end;


function GetUsersLoginStats( var AuthUsersCount,
                                 CurrUsersCount,
                                 OrphanSpawnedUsersCount: Real ): TUserLoginStats;
var
  AExeName      : string;
  AExeNameDot   : string;
  AppExeName    : string;
  AuthUsersCol  : string;
  ASQL          : string;
begin
  Result:= ulsNone;

  AppExeName := UpperCase(ExtractFileName( Application.ExeName ));
  AExeNameDot:= Copy(AppExeName, 1, Pos( '.EXE', AppExeName ));
  if AppExeName = 'IQWIN32.EXE' then
     AuthUsersCol:= 'auth_users'
  else if AppExeName = 'IQRF.EXE' then
     AuthUsersCol:= 'WMS_Users'
  else if AppExeName = 'SHOPDATA.EXE' then
     AuthUsersCol:= 'SD_Users'
  else if AppExeName = 'ASSYDATA.EXE' then
     AuthUsersCol:= 'SD_Users'
  else if AppExeName = 'PALLETCONSTRUCTOR.EXE' then
     AuthUsersCol:= 'SD_Users'
  else if AppExeName = 'FABDATA.EXE' then
     AuthUsersCol:= 'FD_Users'
  else if AppExeName = 'IQCRM.EXE' then
     AuthUsersCol:= 'CRM_Users'
  else if AppExeName = 'WRKCNTRPLTBLDR.EXE' then
     AuthUsersCol:= 'WC_PLT_BLDR_USERS'
  else
     EXIT;

  try
    with TFDQuery.Create(NIL) do
    try
      ConnectionName:= 'IQFD';
      SQL.Add(Format('select %s from iqorder2', [ AuthUsersCol ]));
      Open;
      AuthUsersCount:= StrToFloat( DefaultToString( Trim( CharXOR( Fields[ 0 ].AsString )), '0'));
    finally
      Free;
    end;

    {Normal Execution}
    ASQL:= 'select count( distinct decode( InStr( process, '':''),                                       '+
           '                               0, process,                                                   '+
           '                               substr( process, 1, InStr( process, '':'') - 1) || machine )) '+
           '  from v$session                                                                             '+
           ' where                                                                                       '+
           '       type = ''USER''                                                                       '+
           '   and STATUS <> ''KILLED''                                                                  '+
           '   and not (username is null)                                                                '+
           // See IQSecMan procedure CheckAssignClientInfo where we assign dbms_application_info.set_client_info ( 'SPAWN' );
           '   and InStr( nvl(client_info, ''*''), ''SPAWN'' ) = 0                                       '+
           // When an exe (iqcrm) is launching a dcom (creditcard) via iqwin32 we dont want to consume a license but we do want to keep track
           // and consume the license if other dcom (iqqc) is being called at later time
           '   and InStr( nvl(client_info, ''*''), ''FREE'' ) = 0                                        '+

           // 02/23/2015 (Byron) Ignore DBExpress and FireDac connections
           '   and InStr( nvl(client_info, ''*''), ''DBEXPRESS'' ) = 0                                   '+
           '   and InStr( nvl(client_info, ''*''), ''FIREDAC'' ) = 0                                     '+

           // 03-03-2016 exclude firedac event alerter                  
           '   and upper(nvl(event, ''*'')) <> ''PIPE GET''                                              ';

    if (AppExeName = 'SHOPDATA.EXE') or (AppExeName = 'ASSYDATA.EXE') then
       ASQL:= ASQL + ' and ( Upper(program) like ''%%SHOPDATA%%'' or Upper(program) like ''%%ASSYDATA%%'') '
    else
       ASQL:= ASQL + Format(' and Upper(program) like ''%%%s%%'' ', [ AExeNameDot ]);

    // how many users currently logged in excluding spawned sessions
    CurrUsersCount:= SelectValueAsFloat( ASQL );

    // how many users currently logged in as spawned sessions without original EIQ session around that launched them
    OrphanSpawnedUsersCount:= GetOrphanSpawnedUsersCount( AExeNameDot );

    // add normal users and orphan children 
    // commented out - the caller is suppose to add CurrUsersCount + OrphanSpawnedUsersCount
    // CurrUsersCount:= CurrUsersCount + OrphanSpawnedUsersCount;

    Result:= ulsRetrived;
  except
    Application.ShowException( Exception( ExceptObject ));
    Result:= ulsError;
  end
end;


function RT_Licensed_Count: Real;
begin
  try
    Result:= StrToFloat( Trim( CharXOR( SelectValueAsString('select rt_addrs from iqorder2'))));
  except
    Application.ShowException( Exception( ExceptObject ));
    Result:= 0;
  end;
end;

function RT_Scrap_Licensed_Count: Real;
begin
  try
    Result:= StrToFloat( Trim( CharXOR( SelectValueAsString('select rt_scrap from iqorder2'))));
  except
    Application.ShowException( Exception( ExceptObject ));
    Result:= 0;
  end;
end;


function RT_Illum_RT_Count: Real;
begin
  Result:= // SelectValueAsFloat('select count(distinct rt_address) from illum_rt where rt_address is not NULL') +

           {count distinct rt_adresses for signaled workcenters}
           SelectValueAsFloat('select count(distinct i.rt_address)               '+
                  '  from illum_rt i, work_center w                  '+
                  ' where i.rt_address is not NULL                   '+
                  '   and nvl(w.is_virtual, ''N'') = ''N''           '+
                  '   and i.work_center_id = w.id                    '+
                  '   and NVL(w.rtserver_not_signaled, ''N'') = ''N''') +

           {count all rt_adresses for non signaled workcenters - they should be unique. 2 even same rt_addresses are counted as 2}
           SelectValueAsFloat('select count(i.rt_address)                        '+
                  '  from illum_rt i, work_center w                  '+
                  ' where i.rt_address is not NULL                   '+
                  '   and i.work_center_id = w.id                    '+
                  '   and NVL(w.rtserver_not_signaled, ''N'') = ''Y''') +

           {Any workcenter in illum_rt with NULL address}
           SelectValueAsFloat('select count(*) from illum_rt where rt_address is NULL');
end;

function RT_Illum_RT_Scrap_Count: Real;
begin
  Result:= SelectValueAsFloat('select count(distinct scrap_address) from illum_rt where scrap_address is not NULL');
end;

function IQLicensed_RT: Boolean;
begin
  try
    Result:= RT_Illum_RT_Count <= RT_Licensed_Count;
  except
    Application.ShowException( Exception( ExceptObject ));
    Result:= FALSE;
  end;
end;

function IQLicensed_RT_Scrap: Boolean;
begin
  try
    Result:= RT_Illum_RT_Scrap_Count <= RT_Scrap_Licensed_Count;
  except
    Application.ShowException( Exception( ExceptObject ));
    Result:= FALSE;
  end;
end;

procedure CheckTerminatekExecutionWhenLicenseMethod( AMethod: string );
var
  ALicenseMethod: string;
begin
  ALicenseMethod:= SelectValueAsString('select method from iqorder2');
  ALicenseMethod:= Trim( CharXOR( ALicenseMethod ));

  if CompareText( ALicenseMethod, AMethod ) = 0 then
  begin
    IQError( IQMS.Common.ResStrings.cTXT0000039 );                    // 'Please contact IQMS, Inc. to verify the license agreement.';
    HALT;
  end;
end;


function GetOrphanSpawnedUsersCount( AExeNameDot: string ): Real;
begin
  Result:= SelectValueFmtAsFloat('select misc.get_orphan_users_spawned_count(''%s'') from dual', [ AExeNameDot ]);
end;

function GetSpawnedSessionsCount: Real;
begin
  try
    Result:= SelectValueAsFloat('select misc.get_spawned_sessions_count() from dual');
  except on E: Exception do
    begin
      IQError( E.Message );
      Result:= 0;
    end;
  end;
end;


function RT_PCMon_Device_Count: Real;
begin
  Result:= SelectValueAsFloat('select count(distinct work_center_id) from pcmon_device where work_center_id is not NULL and NVL(inactive,''N'') <> ''Y''');
end;

function RT_PCMon_Licensed_Count: Real;
begin
  if SelectValueAsFloat('select length(pcmon_devices) from iqorder2') = 0 then
  begin
    Result := 0;
    EXIT;
  end;
  try
    Result:= StrToFloat( Trim( CharXOR( SelectValueAsString('select pcmon_devices from iqorder2'))));
  except
    Application.ShowException( Exception( ExceptObject ));
    Result:= 0;
  end;
end;

function EIQMobile_Licensed_Count: Real;
begin
  if SelectValueAsFloat('select length(mobile_users) from iqorder2') = 0 then
  begin
    Result := 0;
  end
  else
  try
    Result:= StrToFloat( Trim( CharXOR( SelectValueAsString('select mobile_users from iqorder2'))));
  except
    Application.ShowException( Exception( ExceptObject ));
    Result:= 0;
  end;
end;

function EIQMobile_Users_Count: Real;
begin
  Result:= SelectValueAsFloat('select count(*) from v_iqusers_ex  a, s_user_general s where RTrim(a.username) = RTrim(s.user_name) and s.is_mobile_user = ''Y''');
end;


end.
