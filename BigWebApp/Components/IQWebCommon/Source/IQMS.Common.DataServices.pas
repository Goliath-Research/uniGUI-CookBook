unit IQMS.Common.DataServices;

interface

uses
  Classes, Data.DB, FireDAC.Comp.Client, IQMS.Common.DataConst, SysUtils, Math;


//  IQWeb.Server.DataServices,
//  IQWeb.Session.ConnectionServices;

//  function GetDataServices : IIQDataServices;
//  function GetSessionConnection : TCustomConnection;


type
  IIQDataset = interface
  ['{09C499FD-1FA5-418B-A678-6C2C45A5AFFF}']
    function BOF: Boolean;
    function EOF: Boolean;
    function FieldByName(const FieldName: string): TField;
    procedure First;
    function GetFields: TFields;
    function GetFieldValue(const FieldName: string): Variant;
    function GetRecordCount: integer;
    procedure Last;
    procedure Next;
    procedure Prior;

    procedure SetFieldValue(const FieldName: string; Value: Variant);

    property Fields: TFields read GetFields;
    property FieldValues[const FieldName: string]: Variant read GetFieldValue write SetFieldValue; default;
    property RecordCount: Integer read GetRecordCount;
  end;

  IIQConnection = interface
  ['{E14EACD1-8AA3-4762-8D5B-4C2A5C30A051}']
    function GetConnected: Boolean;
    function GetConnectionName: string;
    procedure SetConnected(const Value: Boolean);
    procedure SetConnectionName(const Value: string);

    property Connected: Boolean read GetConnected write SetConnected;
    property ConnectionName: string read GetConnectionName write SetConnectionName;
  end;

  TIQCommonDataServices = class
  strict private
    class procedure EnableFreePass(AValue: Boolean; aConnection: TCustomConnection);
    class procedure ExecuteSql(const aSQL: string; aConnection: TCustomConnection); overload;
  public
    class procedure ExecuteSql(const aSQL: string; aConnectionName: string = cnstFDConnectionName); overload;
    class function  InitQuery(const aSQL: string; aConnectionName: string = cnstFDConnectionName): IIQDataset;
    class function  PooledConnection: IIQConnection;
    class procedure SyncConnection(aConnection: TCustomConnection = nil);
  end;


implementation

type
  TIQDatasetManager = class(TInterfacedObject,IIQDataset)
  private
    FDataset: TDataset;
    function GetFields: TFields;
    function GetFieldValue(const FieldName: string): Variant;
    function GetRecordCount: integer;
    procedure SetFieldValue(const FieldName: string; Value: Variant);
  public
    destructor Destroy; override;

    function BOF: Boolean;
    function EOF: Boolean;
    function FieldByName(const FieldName: string): TField;
    procedure First;
    procedure Last;
    procedure Next;
    procedure Prior;

    property Fields: TFields read GetFields;
    property FieldValues[const FieldName: string]: Variant read GetFieldValue write SetFieldValue; default;
    property RecordCount: Integer read GetRecordCount;
  end;

  TIQConnectionManager = class(TInterfacedObject, IIQConnection)
  private
    FConnection: TFDConnection;
    function GetConnected: Boolean;
    function GetConnectionName: string;
    procedure SetConnected(const Value: Boolean);
    procedure SetConnectionName(const Value: string);
  public
    destructor Destroy; override;

    property Connected: Boolean read GetConnected write SetConnected;
    property ConnectionName: string read GetConnectionName write SetConnectionName;
  end;


{ TIQOnTheFlyDataset }

function TIQDatasetManager.BOF: Boolean;
begin
  Result := FDataset.BOF;
end;

destructor TIQDatasetManager.Destroy;
begin
  if Assigned(FDataset) then
    FDataset.Free;
  inherited;
end;

function TIQDatasetManager.EOF: Boolean;
begin
  Result := FDataset.EOF;
end;

function TIQDatasetManager.FieldByName(const FieldName: string): TField;
begin
  Result := FDataset.FieldByName(FieldName);
end;

procedure TIQDatasetManager.First;
begin
  FDataset.First;
end;

function TIQDatasetManager.GetFields: TFields;
begin
  Result := FDataset.Fields;
end;

function TIQDatasetManager.GetFieldValue(const FieldName: string): Variant;
begin
  Result := FDataset.FieldValues[FieldName];
end;

function TIQDatasetManager.GetRecordCount: integer;
begin
  Result := FDataset.RecordCount;
end;

procedure TIQDatasetManager.Last;
begin
  FDataset.Last;
end;

procedure TIQDatasetManager.Next;
begin
  FDataset.Next;
end;

procedure TIQDatasetManager.Prior;
begin
  FDataset.Prior
end;

procedure TIQDatasetManager.SetFieldValue(const FieldName: string;
  Value: Variant);
begin
  FDataset.FieldValues[FieldName] := Value;
end;

{ TIQConnectionManager }

destructor TIQConnectionManager.Destroy;
begin
  if Assigned(FConnection) then
    FConnection.Free;
  inherited;
end;

function TIQConnectionManager.GetConnected: Boolean;
begin
  Result := FConnection.Connected;
end;

function TIQConnectionManager.GetConnectionName: string;
begin
  Result := FConnection.ConnectionName;
end;

procedure TIQConnectionManager.SetConnected(const Value: Boolean);
begin
  FConnection.Connected := Value;
end;

procedure TIQConnectionManager.SetConnectionName(const Value: string);
begin
  FConnection.ConnectionName := Value;
end;

{TIQCommonDataServices}

class procedure TIQCommonDataServices.EnableFreePass(AValue: Boolean;
  aConnection: TCustomConnection);
begin
  try
    ExecuteSql(Format(
        'declare                                                      '#13 +
        '  v_flag number ::= %d;                                      '#13 +
        'begin                                                        '#13 +
        '  if v_flag = 1 then                                         '#13 +
        '     iqms.misc.update_client_info( ''LOG'', ''FREE'');       '#13 +
        '  else                                                       '#13 +
        '     iqms.misc.delete_client_info( ''LOG'' );                '#13 +
        '  end if;                                                    '#13 +
        '  iqms.misc.update_client_info( ''FIREDAC'', ''TRUE'');      '#13 +
        'end;                                                         ',
        [INTEGER(aValue)]), aConnection);
  except
  end;
end;


class procedure TIQCommonDataServices.ExecuteSql(const aSQL: string; aConnectionName: string = cnstFDConnectionName);
begin
  ExecuteSql(aSQL, FDManager.FindConnection(aConnectionName));
end;

class procedure TIQCommonDataServices.ExecuteSql(const aSQL: string; aConnection: TCustomConnection);
begin
  with TFDCommand.Create(nil) do
  try
    Connection := aConnection as TFDCustomConnection;
    CommandText.Text := aSQL;
    Execute;
  finally
    Free;
  end;
end;

class function TIQCommonDataServices.InitQuery(const aSQL: string; aConnectionName: string = cnstFDConnectionName): IIQDataset;
var
  DatasetManager: TIQDatasetManager;
begin
  DatasetManager := TIQDatasetManager.Create;
  DatasetManager.FDataset := TFDQuery.Create(nil);
  with TFDQuery(DatasetManager.FDataset) do
  begin
    ConnectionName := aConnectionName;
    Sql.Text := aSQL;
    Open;
  end;
  Result := DatasetManager;
end;

class function TIQCommonDataServices.PooledConnection: IIQConnection;
var
  ConnectionManager: TIQConnectionManager;
begin
  ConnectionManager := TIQConnectionManager.Create;
  with ConnectionManager do
  begin
    FConnection := TFDConnection.Create(nil);
    FConnection.ConnectionDefName := FDManager.ConnectionDefs.ConnectionDefByName(cnstFDPooledConnection).Name;
    FConnection.Connected := True;
    SyncConnection(FConnection);
  end;

  Result := ConnectionManager;
end;

class procedure TIQCommonDataServices.SyncConnection(aConnection: TCustomConnection);
var
  ATmp: string;
  ValidConnectionName: string;
begin
  // Assign connection to variable
  if not Assigned(aConnection) then
    aConnection := FDManager.FindConnection(cnstFDConnectionName);

  // TODO -oGabe -cSecurity: SecurityManager no longer is responsible from some of these attributes
//  if (SecurityManager <> nil) then
//    begin
//      // reset
//      try
//        ExecuteSql('BEGIN misc.reset_client_info(); END;', aConnection);
//      except
//      end;
//
//      // user name
//      try
//        ExecuteSql(Format('BEGIN iqms.misc.set_username(''%s''); END;',[SecurityManager.UserName]), aConnection);
//      except
//      end;
//
//      // eplant_id
//      try
//        ExecuteSql(Format(
//              'BEGIN iqms.misc.set_eplant_id(%.0f, ''%s''); END;',
//              [SecurityManager.EPlant_ID_AsFloat, SecurityManager.EPlant_Name]), aConnection);
//      except
//      end;
//
//      // jobshop
//      try
//        ExecuteSql(Format(
//              'BEGIN misc.set_jobshop2_licensed( %d ); END; ',
//              [IfThen(SecurityManager.IsModuleLicensed(
//              IQAppsNames[apJobShop2]), 1, 0)]), aConnection);
//      except
//      end;
//
//      // client info looks like this: <SPAWN=SID-123;SER-123;PRC-123:123>
//      if IQMS.Common.Miscellaneous.ExtractInLineParam('_SPAWNED_SESSION_', ATmp)
//      then { IQMS.Common.Miscellaneous.pas }
//        try
//          ExecuteSql(Format(
//                'BEGIN misc.update_client_info( ''SPAWN'', ''%s''); END;',
//                [ATmp]), aConnection);
//        except
//        end;
//
//      // TODO -oGabe -cDataServices: IsFreePass is set by some functionaltiy that we have not yet migrated
//      EnableFreePass(True {IsFreePass}, AUseThisConnection);
//    end;
end;

end.
