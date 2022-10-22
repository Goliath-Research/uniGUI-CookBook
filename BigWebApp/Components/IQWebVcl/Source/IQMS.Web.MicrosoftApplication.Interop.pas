unit IQMS.Web.MicrosoftApplication.Interop;

interface

uses
  Winapi.Windows, System.Classes, System.SysUtils, System.Variants,
  IQMS.Web.MicrosoftApplication;

type
  TMicrosoftApplicationInterop = class(TInterfacedObject, IMicrosoftApplication)
  strict private
    FConnected: Boolean;
    FApplication: OLEVariant;
    procedure CheckServerNameProvided(var AServerName: string);
  strict protected
    function TryConnectRunning: Boolean;
    function TryConnect(var AAlreadyRunning: Boolean): Boolean;
  protected
    ///<summary> Returns the server name required to establish a connection.
    ///For example, for Microsoft Word, the function would return:
    ///'Word.Application'
    ///</summary>
    function GetServerName: string; virtual; abstract;
    procedure SetConnected(const Value: Boolean); virtual;
  public
    function Connect: Boolean; virtual;
    function IsConnected: Boolean; virtual;
    function IsInstalled: Boolean; virtual;
    procedure Disconnect; virtual;
    function Application: OLEVariant; virtual;
    ///<summary> Determine the application version. </summary>
    function Version: Integer; virtual; abstract;
  end;

resourcestring
  cRsc001 = 'Could not connect to Microsoft office application.';
  cRsc003 = 'Microsoft office application is not installed.';
  cRsc004 = 'Cannot find file, %s.';

implementation

uses
  //IQMS.Common.Registry,
  //IQString,
  System.Win.ComObj,
  System.Win.Registry;

{ TMicrosoftWordInterop }

function TMicrosoftApplicationInterop.Application: OLEVariant;
begin
  Result := Unassigned;
  if IsConnected then
    Result := FApplication;
end;

procedure TMicrosoftApplicationInterop.CheckServerNameProvided(var AServerName: string);
begin
  AServerName := GetServerName;

  //If the calling class did not provide a server name
  //(which of course is highly unlikely), then inform
  //the programmer.
  if AServerName = '' then
    raise Exception.Create(
      'Application Error:  Descendent class has provided an empty server name.  ' +
      'Cannot connect to Microsoft application.');
end;

function TMicrosoftApplicationInterop.Connect: Boolean;
begin
  Result := IsInstalled;
  if Result then
  begin
    SetConnected(True);
    Result := IsConnected;
  end;
end;

procedure TMicrosoftApplicationInterop.Disconnect;
begin
  if IsConnected then
  begin
    FApplication.Quit;
    FApplication := Unassigned;
  end;
  FConnected := False;
end;

function TMicrosoftApplicationInterop.IsConnected: Boolean;
begin
  Result := FConnected and not System.Variants.VarIsNull(FApplication);
end;

function TMicrosoftApplicationInterop.IsInstalled: Boolean;
begin
  Result := Version > 0;
end;

procedure TMicrosoftApplicationInterop.SetConnected(const Value: Boolean);
var
  AAlreadyRunning: Boolean;
begin
  if Value then
    TryConnect(AAlreadyRunning)
  else
    Disconnect;
end;

function TMicrosoftApplicationInterop.TryConnect(var AAlreadyRunning: Boolean): Boolean;
var
  AServerName: string;
begin
  Result := False; //initial
  CheckServerNameProvided(AServerName);
  try
    AAlreadyRunning := TryConnectRunning;
    Result := AAlreadyRunning; //pass true if already open
    if not AAlreadyRunning then
      try
        FApplication := System.Win.ComObj.CreateOleObject(
          AServerName);
        Result := not System.Variants.VarIsNull(FApplication);
      except
        on E: EOLESysError do
        begin
          Result := False;
          //cRsc001 = 'Could not connect to Microsoft office application.'
          raise Exception.Create(cRsc001);
        end
        else
          raise;
      end;
  finally
    //Set value for use by property
    FConnected := Result;
  end;
end;

function TMicrosoftApplicationInterop.TryConnectRunning: Boolean;
var
  AServerName: string;
begin
  CheckServerNameProvided(AServerName);
  try
    FApplication := System.Win.ComObj.GetActiveOleObject(
      AServerName);
    Result := not System.Variants.VarIsNull(FApplication);
  except
    on E: EOLESysError do
      Result := False
    else
      raise;
  end;
end;

end.
