unit crm_signal_errors;

interface

uses
  System.SysUtils,
  System.Generics.Collections;

procedure CheckCRMSignalErrorsCreated;
procedure CheckFreeCRMSignalErrors;

type
  TSignalError = class
    ServerTimeStamp: TDateTime;
    MachineTimeStamp: TDateTime;
    ExceptionStr: string;
    Details: string;
    Caption: string;
    constructor Create(ACaption, AExceptionStr, ADetails: string);
  end;

//type
//  TCRMSignalErrors = class
//  private
//    procedure CreateListView;
//  public
//    Errors: TStringList;
//    HasErrors: Boolean;
//    constructor Create;
//    destructor Destroy; override;
//    procedure AddError(ACaption, AException, ADetails: String);
//    function GetErrorMessage(AIndex: Integer): String;
//    function GetErrorDetails(AIndex: Integer): String;
//    function GetErrorServerTimeStamp(AIndex: Integer): TDateTime;
//    function GetErrorMachineTimeStamp(AIndex: Integer): TDateTime;
//  end;

var
  CRMSignalErrors: TObjectList<TSignalError>;

implementation

uses
  IQMS.Common.Dates,
  IQMS.Common.Dialogs;

procedure CheckCRMSignalErrorsCreated;
begin
  if not Assigned(CRMSignalErrors) then
    CRMSignalErrors := TObjectList<TSignalError>.Create;
  CRMSignalErrors.OwnsObjects := True;
end;

procedure CheckFreeCRMSignalErrors;
begin
  if Assigned(CRMSignalErrors) then
    FreeAndNil(CRMSignalErrors);
end;

{
constructor TCRMSignalErrors.Create;
begin
  inherited Create;
  CreateListView;
  HasErrors := FALSE;
end;

procedure TCRMSignalErrors.CreateListView;
begin
  if not Assigned(Errors) then
    Errors := TStringList.Create;
end;

destructor TCRMSignalErrors.Destroy;
begin
  iqctrl.ClearStringListOfObjects(Errors);
  if Assigned(Errors) then
    FreeAndNil(Errors);
  inherited Destroy;
end;

procedure TCRMSignalErrors.AddError(ACaption, AException, ADetails: String);
var
  S: String;
begin
  if not Assigned(Errors) then
    CreateListView;
  Errors.AddObject(ACaption, TSignalError.Create(AException, ADetails));
  HasErrors := TRUE;
end;

function TCRMSignalErrors.GetErrorDetails(AIndex: Integer): String;
begin
  Result := TSignalError(Errors.Objects[AIndex]).ExceptionStr;
end;

function TCRMSignalErrors.GetErrorMessage(AIndex: Integer): String;
begin
  Result := TSignalError(Errors.Objects[AIndex]).Details;
end;

function TCRMSignalErrors.GetErrorMachineTimeStamp(
  AIndex: Integer): TDateTime;
begin
  Result := TSignalError(Errors.Objects[AIndex]).MachineTimeStamp;
end;

function TCRMSignalErrors.GetErrorServerTimeStamp(
  AIndex: Integer): TDateTime;
begin
  Result := TSignalError(Errors.Objects[AIndex]).ServerTimeStamp;
end;
}

{ TSignalError }

constructor TSignalError.Create(ACaption, AExceptionStr, ADetails: String);
begin
  ServerTimeStamp := IQOracleAdjustedDateTime;
  MachineTimeStamp := Now;
  ExceptionStr := AExceptionStr;
  Details := ADetails;
  Caption := ACaption;
end;

end.
