unit IQMS.Common.Dartwin;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys;

type
  TDartBase = class
    FDNetWNT            : string;
    FDNetStatusFileName : string;
    FDNetGraphicName    : string;
    FTable              : TDataSet;
    FDartWorkCenter     : string;
  protected
    function GetDartNetStrFromParams( AFieldName : string ) : string;
    function GetDartNetStrFromRegistry( cString : string ) : string;
    function AssignDartParameters( AbortOnException : Boolean ) : Boolean;
    procedure CheckDartWinViewerParameters;
    function GetDNETViewer : string;
    function GetDNetCollectFileName:string;  virtual;
  public
    constructor Create( ATable: TDataSet );
    procedure CheckDartWinViewerRunning;
    procedure OpenFileREQ( var F: TextFile; const AFileName: string );
    procedure WriteToREQ( var F : TextFile ); virtual;
    procedure Execute;

    function GetRTServerPrefix( AWork_Center_ID: Real ):string;
    procedure StripRTServerPrefix( ACntr_ID: Real; var S: string );

    property Table: TDataSet read FTable write FTable;
    property DNetWNT            : string read FDNetWNT             write FDNetWNT;
    property DNetStatusFileName : string read FDNetStatusFileName  write FDNetStatusFileName;
    property DNetGraphicName    : string read FDNetGraphicName     write FDNetGraphicName;
    property DNetViewer         : string read GetDNetViewer;
    property DNetCollectFileName: string read GetDNetCollectFileName;
  end;

  TDartWorkCenter = class( TDartBase )
  protected
    function GetDNetCollectFileName:string; override;
    function GetDartMachineName : string; virtual;
    procedure CheckCollectorName( var S : string ); virtual;
  public
    procedure WriteToREQ( var F : TextFile ); override;
    property DartMachineName : string read GetDartMachineName;
  end;

  TDartRT = class( TDartWorkCenter )
  protected
    function GetDartMachineName : string; override;
  public
    procedure WriteToREQ( var F : TextFile ); override;
  end;

  TDartStopJob = class( TDartWorkCenter )
  private
    FCntrID:Real;
  protected
    function GetDartMachineName : string; override;
    procedure CheckCollectorName( var S : string ); override;
  public
    constructor Create( nCntrID: Real );
    procedure WriteToREQ( var F : TextFile ); override;
  end;

  TDartStartJob = class( TDartStopJob )
  private
    FNextSchedID:Real;
  public
    constructor Create( nCntrID, nNextSchedID : Real );
    procedure WriteToREQ( var F : TextFile ); override;
  end;

  TDartBOM = class( TDartBase )
  protected
    function GetDNetCollectFileName:string; override;
  public
    procedure WriteToREQ( var F : TextFile ); override;
  end;

procedure RunDartWinViewer;
procedure DartWinBOM( TblStandard : TDataSet );
procedure DartWinWorkCenter( TblWork_Center : TDataSet );
procedure DartWinRT( ATable : TDataSet );
procedure DoDartWinStopJob( nCntrID : Real );
procedure DoDartWinStartJob( nCntrID, nNextSchedID : Real );


implementation

uses
  IQMS.Common.Dart_STA,
  IQMS.Common.DartNode,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.Common.ResStrings,
  IQMS.Common.WCProces,
  IQMS.Common.DataConst;

const
  constDNETWNT            = 'DNETWNT';
  constDNETGraphicName    = 'DNETGraphicName';

{ Wraper procedures }

procedure DartWinBOM( TblStandard : TDataSet );
begin
  with TDartBOM.Create( TblStandard ) do try Execute finally Free end;
end;

procedure DartWinWorkCenter( TblWork_Center : TDataSet );
begin
  with TDartWorkCenter.Create( TblWork_Center ) do try Execute finally Free end;
end;

procedure DartWinRT( ATable : TDataSet );
begin
  with TDartRT.Create( ATable ) do try Execute finally Free end;
end;

procedure RunDartWinViewer;
begin
  with TDartBase.Create( NIL ) do
  try
    CheckDartWinViewerParameters;
    CheckDartWinViewerRunning
  finally
    Free
  end;
end;

procedure DoDartWinStopJob( nCntrID : Real );
begin
  with TDartStopJob.Create( nCntrID ) do try Execute finally Free end;
end;

procedure DoDartWinStartJob( nCntrID, nNextSchedID : Real );
begin
  with TDartStartJob.Create( nCntrID, nNextSchedID ) do try Execute finally Free end;
end;


{ TDartBase }

constructor TDartBase.Create( ATable: TDataSet );
begin
  FTable:= ATable;
end;

function TDartBase.GetDartNetStrFromRegistry( cString : string ) : string;
var
  S:string;
begin
  if IQRegStringScalarRead( Application, cString, S ) then
     Result:= S
  else
     Result:= '';
end;

function TDartBase.GetDartNetStrFromParams( AFieldName : string ) : string;
begin
  Result:= SelectValueFmtAsString('select %s from params', [ AFieldName ]);
end;

function TDartBase.GetDNETViewer : string;
var
  I: Integer;
begin
  Result:= '';
  I:= Pos( ' NETVIEW:', UpperCase( DNetWNT ));
  if I > 0 then
  begin
     Result:= UpperCase( Copy( DNetWNT, I+9, 255 ));
     I:= Pos( ' ', Result );
     if I > 0 then
        Result:= UpperCase( Copy( Result, 1, I-1 ));
  end;

  if Result = '' then
     raise Exception.Create(IQMS.Common.ResStrings.cTXT0000017 {'DARTNET Viewer Name is not setup - unable to continue'});
end;

function TDartBase.AssignDartParameters( AbortOnException : Boolean ) : Boolean;
begin
  DNetWNT:= GetDartNetStrFromRegistry( constDNETWNT );                        {Command Line}
  if AbortOnException and (DNetWNT = '') then
     raise Exception.Create( IQMS.Common.ResStrings.cTXT0000018 {'DARTNET command line parameter is not setup - unable to continue'});

  DNetStatusFileName:= GetDartNetStrFromParams( 'dart_status_filename' );     {Status File}
  if AbortOnException and (DNetStatusFileName = '') then
     raise Exception.Create( IQMS.Common.ResStrings.cTXT0000019 {'DARTNET status file parameter is not setup - unable to continue'});

  DNetGraphicName:= GetDartNetStrFromRegistry( constDNETGraphicName);         {Graphic Name}
  if AbortOnException and (DNetGraphicName = '') then
     raise Exception.Create( IQMS.Common.ResStrings.cTXT0000020 {'DARTNET Graphic Name parameter is not setup - unable to continue'});

  Result:= (DNetWNT <> '') and (DNetStatusFileName <> '') and (DNetGraphicName <> '');
end;

procedure TDartBase.CheckDartWinViewerParameters;
begin
  if not AssignDartParameters( FALSE ) then
  begin
     DoGetDartParameters;                                                     {WCProcess.pas}
     AssignDartParameters( TRUE );
  end;
end;

procedure TDartBase.CheckDartWinViewerRunning;
var
  ErrCode: Integer;
  I      : Integer;
begin
  ErrCode:= MutexAppRun( DNetWNT, 'DART VIEWER' );
  if ErrCode <> 0 then
     raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000021 {'Unable to start up %s. Error Code = %d'}, [ DNetWNT, ErrCode ]);
end;

procedure TDartBase.OpenFileREQ( var F: TextFile; const AFileName: string );
begin
  AssignFile( F, AFileName );
  if not FileExists( AFileName ) then
      Rewrite( F )           { Create new file }
  else
      Append( F );           { Add more text onto end }
end;

function TDartBase.GetDNetCollectFileName : string;
begin
end;

procedure TDartBase.WriteToREQ( var F : TextFile );
begin
end;

procedure TDartBase.Execute;
var
  F : TextFile;
  S : string;
begin
  CheckDartWinViewerParameters;
  S:= DNetCollectFileName;
  CheckDartWinViewerRunning;
  OpenFileREQ( F, S );
  try
    WriteToREQ( F );
  finally
    CloseFile( F );
  end;
end;

function TDartBase.GetRTServerPrefix( AWork_Center_ID: Real ):string;
begin
  Result:= SelectValueFmtAsString('select rtserver_prefix from work_center where id = %f', [ AWork_Center_ID ]);
end;

procedure TDartBase.StripRTServerPrefix( ACntr_ID: Real; var S: string );
var
  I      : Integer;
  AEqNo  : string;
  APrefix: string;
begin
  APrefix:= GetRTServerPrefix( ACntr_ID );
  if APrefix > '' then
  begin
    if Copy(S, 1, Length( APrefix )) = APrefix then
       S:= Copy( S, Length( APrefix )+1, Length( S ))
  end;
end;

{ DartWorkCenter }

function TDartWorkCenter.GetDartMachineName : string;
begin
  Result:= SelectValueFmtAsString('select rt_address from illum_rt where work_center_id = %f', [ Table.FieldByName('ID').asFloat ]);

  if Result = '' then
     raise Exception.CreateFmt('Unable to locate work center %s in the RealTime table', [ Table.FieldByName('EQNO').asString ]);

  StripRTServerPrefix( Table.FieldByName('ID').asFloat, Result );
end;

function TDartWorkCenter.GetDNetCollectFileName:string;
var
  DartStatus: TDartStatus;
  AName     : string;
begin
  Result:= '';

  AName:= Trim(DartMachineName);

  DartStatus:= TDartStatus.Create( DNetStatusFileName, fmOpenRead, TRUE );
  with DartStatus do
  try
     DartStatus.CheckError;
     First;
     while not Eof do
     begin
       if ( CompareText( AName, Trim(MachineName) ) = 0 ) and ( NodeName <> '' ) then
       begin
         Result:= NodeName;
         BREAK;
       end;
       Next;
     end;
  finally
     if Assigned( DartStatus ) then
        DartStatus.Free;
  end;

  CheckCollectorName( Result );

  Result:= ExtractFilePath( DNetStatusFileName ) + Result + '.REQ';
end;

procedure TDartWorkCenter.CheckCollectorName( var S : string );
var
  ANodeName:string;
begin
  if Trim( S ) <> '' then EXIT;

  if not IQMS.Common.DartNode.TFrmDartNodes.GetDARTNodeName( S, ExtractFilePath(DNetStatusFileName) ) then  {DartNode.pas}
  begin
     if Assigned(Table) and Assigned(Table.FindField('EQNO')) then
         // 'Unable to establish collector name for work center %s in the DART Status File'
         raise Exception.CreateFmt( IQMS.Common.ResStrings.cTXT0000022, [ Trim(Table.FieldByName('EQNO').asString) ])
     else
         { 'Unable to establish collector name for the work center.'#13#13+
           'Need to add Machine Name = %s to DartNet System. (Use WorkCenter Information)' }
         raise Exception.CreateFmt( IQMS.Common.ResStrings.cTXT0000023, [ Trim(DartMachineName) ]);
  end;
end;

procedure TDartWorkCenter.WriteToREQ( var F : TextFile );
begin
  Writeln( F, Format('IQWIN32,EDIT MACHINE,%s,%s',               // 'IQWIN32,EDIT MACHINE,1,IQ'
                     [ DartMachineName,
                       DNetViewer ]));
end;


{ DartRT }

function TDartRT.GetDartMachineName : string;
begin
  Result:= SelectValueFmtAsString('select rt_address from illum_rt where work_center_id = %f', [ Table.FieldByName('work_center_id').asFloat ]);

  if Result = '' then
     // 'Unable to locate work center %s in the RealTime table'
     raise Exception.CreateFmt( IQMS.Common.ResStrings.cTXT0000024, [ Table.FieldByName('EQNO').asString ]);

  StripRTServerPrefix( Table.FieldByName('work_center_id').asFloat, Result );
end;

procedure TDartRT.WriteToREQ( var F : TextFile );
begin
  Writeln( F, Format('IQWIN32,VIEW DATA,%s,%s,%s',               // 'IQWIN32,VIEW DATA,Press-A01,IQ'
                     [ DartMachineName,
                       DNetViewer,
                       DNetGraphicName ]));
end;

{ TDartStopJob }

constructor TDartStopJob.Create( nCntrID: Real );
begin
  FCntrID:= nCntrID;
end;

function TDartStopJob.GetDartMachineName : string;
begin
  Result:= SelectValueFmtAsString('select rt_address from illum_rt where work_center_id = %f', [ FCntrID ]);

  if Result = '' then
     // 'Unable to locate work center ID = %f in the RealTime table'
     raise Exception.CreateFmt( IQMS.Common.ResStrings.cTXT0000025, [ FCntrID ]);

  StripRTServerPrefix( FCntrID, Result );
end;

procedure TDartStopJob.CheckCollectorName( var S : string );
begin
  if Trim( S ) = '' then
     if Assigned(Table) and Assigned(Table.FindField('EQNO')) then
         // 'Unable to establish collector name for work center %s in the DART Status File'
         raise Exception.CreateFmt( IQMS.Common.ResStrings.cTXT0000026, [ Trim(Table.FieldByName('EQNO').asString) ])
     else
         {'Unable to establish collector name for the work center.'#13#13+
          'Need to add Machine Name = %s to DartNet System. (Use WorkCenter Information)' }
         raise Exception.CreateFmt( IQMS.Common.ResStrings.cTXT0000027, [ Trim(DartMachineName) ]);
end;


procedure TDartStopJob.WriteToREQ( var F : TextFile );
begin
  Writeln( F, Format('IQWIN32,STOP JOB,%s', [ DartMachineName ]));
end;


{ TDartStartJob }

constructor TDartStartJob.Create( nCntrID, nNextSchedID : Real );
begin
  FCntrID     := nCntrID;
  FNextSchedID:= nNextSchedID;
end;

procedure TDartStartJob.WriteToREQ( var F : TextFile );
begin
  with TFDQuery.Create(Application) do
  try
    ConnectionName := cnstFDConnectionName;
    SQL.Add('select standard.mfgno,'                             );
    SQL.Add(       'cntr_sched.workorder_id, '                   );
    SQL.Add(       'workorder.cycles_req,'                       );
    SQL.Add(       'partno.actcav'                               );
    SQL.Add(  'from cntr_sched, workorder, standard, partno'     );
    SQL.Add( IQFormat('where cntr_sched.id = %f', [ FNextSchedID ]));
    SQL.Add(   'and cntr_sched.workorder_id = workorder.id'      );
    SQL.Add(   'and standard.id = workorder.standard_id'         );
    SQL.Add(   'and partno.standard_id = standard.id'            );
    Open;

    {originator, START JOB, machine, mold, job, cycles, cavities}
    Writeln( F, Format('IQWIN32,START JOB,%s,%s,%s,%s,%s', [ DartMachineName,
                                                             FieldByName('mfgno').asString,
                                                             FieldByName('workorder_id').asString,
                                                             FieldByName('cycles_req').asString,
                                                             FieldByName('actcav').asString ]));
  finally
    Free;
  end;
end;


{ DartBOM }

function TDartBOM.GetDNetCollectFileName:string;
var
  DartStatus: TDartStatus;
  AName     : string;
begin
  Result:= '';

  AName:= Trim(Table.FieldByName('MfgNo').asString);

  DartStatus:= TDartStatus.Create( DNetStatusFileName, fmOpenRead, TRUE );
  with DartStatus do
  try
     DartStatus.CheckError;
     First;
     while not Eof do
     begin
       if ( CompareText( AName, Trim(MoldName)) = 0 ) and ( NodeName <> '' ) then
       begin
         Result:= NodeName;
         BREAK;
       end
       else if (Result = '') and not NodeNameEmpty and not MachineNameEmpty then
           Result:= NodeName;
       Next;
     end;
  finally
     if Assigned( DartStatus ) then
        DartStatus.Free;
  end;

  if Trim( Result ) = '' then
     // 'Unable to establish collector name for configuration# %s in the DART Status File'
     raise Exception.CreateFmt( IQMS.Common.ResStrings.cTXT0000028, [ Table.FieldByName('MFGNO').asString ]);

  Result:= ExtractFilePath( DNetStatusFileName ) + Result + '.REQ';
end;

procedure TDartBOM.WriteToREQ( var F : TextFile );
begin
  with TFDQuery.Create(Application) do
  try
    ConnectionName := cnstFDConnectionName;
    SQL.Add(        'select partno.stdcav, arinvt.descrip from partno, arinvt' );
    SQL.Add( IQFormat('where partno.standard_id = %f', [ FTable.FieldByName('ID').asFloat ]));
    SQL.Add(        'and arinvt.id(+) = partno.arinvt_id' );
    Open;

    Writeln( F, Format('IQWIN32,EDIT MOLD,%s,%s,%f,%d,%s',
                       [ FTable.FieldByName('mfgno').asString,
                         DNetViewer,
                         FTable.FieldByName('cycletm').asFloat,
                         FieldByName('stdcav').asInteger,
                         FieldByName('descrip').asString ]));
  finally
    Free;
  end;
end;


end.


