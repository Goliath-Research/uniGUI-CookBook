unit IQMS.Common.ComBase;

interface

uses
  System.Win.ComObj,
  Winapi.Windows,
  Vcl.Forms,
  System.SysUtils;

type
  { TIQComBase }
  { Simple automation server }
  TIQComBase = class(TAutoObject)
  private
    FServer_ID: string;
  protected
    { Protected declarations }
    procedure Execute(APacket: OleVariant); safecall;
    function SomeFormVisible: Integer; safecall;
    function Get_Server_ID: WideString; safecall;
    procedure Set_Server_ID(const Value: WideString); safecall;
    procedure EnsureLocalStartInFolder;
  public
    procedure OnExecute( APacket: OleVariant ); virtual; abstract;
  end;

implementation

uses
  IQMS.Common.ApplicationSet,
  IQMS.Common.Controls,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Dialogs,
  IQMS.Common.ResStrings;

{ TIQComBase }

procedure TIQComBase.EnsureLocalStartInFolder;
var
   APath: String;
begin
  // Local Home Path
  APath := IQMS.Common.Miscellaneous.IQGetLocalHomePath;
  // Switch directory
  if not SetCurrentDir(APath) then
     // 'Unable to change directory to %s. ErrCode = %d.'#13#13'Program execution will continue in %s.'
     IQWarning(Format(IQMS.Common.ResStrings.cTXT0000079,
      [APath, GetLastError, GetCurrentDir]));
end;

procedure TIQComBase.Execute(APacket: OleVariant);
begin
  // IQMS.Common.ApplicationSet.pas. AppType is used in the IQMisc to check if invoked localy.
  AppType:= atCom;
  IQMS.Common.ApplicationSet.IsAutoShutInProgress:= FALSE;
  EnsureLocalStartInFolder;
  AssignApplicationSettings(Application);  // IQMS.Common.ApplicationSet.pas
  OnExecute( APacket );   // Must be implemented
  IQMS.Common.Controls.ForceForegroundWindowB( Application.Handle );
end;

function TIQComBase.Get_Server_ID: WideString;
begin
  if FServer_ID = '' then
     FServer_ID:= IntToStr(Application.Handle);
  Result:= FServer_ID;
end;

procedure TIQComBase.Set_Server_ID(const Value: WideString);
begin
  FServer_ID:= Value;
end;

function TIQComBase.SomeFormVisible: Integer;
begin
  case Screen.FormCount of
    0: Result:= 0;
    1: begin
         //Result:= 0;
         //if Assigned(IQComSrvList) and (IQComSrvList.CountVisible > 0) then  // IQComSrv.pas
             Result:= 1;
       end;
  else
       Result:= 1;
  end;
end;

end.
