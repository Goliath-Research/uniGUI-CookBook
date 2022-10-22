unit IQMS.Common.Ole;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.DatS,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.UI.Intf;

procedure IQOLEHandleNeeded( var hObj:OLEVariant; const OleAppName: string );
function IQOLEHandleValid( var hObj:OLEVariant; const OleAppName: string ): Boolean;

implementation

uses
  IQMS.Common.PanelMsg,
  System.Win.ComObj,
  IQMS.Common.ResStrings;

function IQOLEHandleValid( var hObj:OLEVariant; const OleAppName: string ): Boolean;
begin
  try
    hObj:= GetActiveOleObject( OleAppName );
    Result:= TRUE;
  except
    Result:= FALSE;
  end;
end;

procedure IQOLEHandleNeeded( var hObj:OLEVariant; const OleAppName: string );
var
  AMesg: TPanelMesg;
begin
  if not IQOLEHandleValid( hObj, OleAppName ) then
  try
    AMesg:= hPleaseWait( Format(IQMS.Common.ResStrings.cTXT0000157 { 'Accessing application, %s ...' }, [ OleAppName ]));
    hObj:= CreateOleObject( OleAppName );
  finally
    AMesg.Free;
  end;
end;

end.
