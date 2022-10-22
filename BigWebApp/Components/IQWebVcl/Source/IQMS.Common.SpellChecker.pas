unit IQMS.Common.SpellChecker;

interface


function CheckSpelling( var AText:String; AIsRTFFormat:Boolean = false ):Boolean;

implementation

uses
  IQMS.Common.DotNetCOMInterOp,
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
  FireDAC.UI.Intf,
  IQMS.Common.PanelMsg;

function CheckSpelling( var AText:String; AIsRTFFormat:Boolean = false ):Boolean;
const
  DOTNETDLL = 'IQMS.SpellChecker';
  DOTNETCOMTYPE = 'IQMS.Utilities.IQSpellChecker';
var
  ADotNetObject: Variant;
  CW: Word;
  h:TPanelMesg;
begin
  DisableFPUExceptions( CW );
  try
    h:= hPleaseWait( 'Loading Dictionary. Please Wait...' );
    try
      CreateDNetCOM( ADotNetObject, DOTNETDLL, DOTNETCOMTYPE );
    finally
      if Assigned( h ) then h.Free;
    end;
    try
      if AIsRTFFormat
      then ADotNetObject.RTFText:= AText
      else ADotNetObject.Text:= AText;

      Result:= ADotNetObject.CheckSpelling = 1;
      if Result then
      begin
        if AIsRTFFormat
        then AText:= ADotNetObject.RTFText
        else AText:= ADotNetObject.Text;
      end;
    finally
      FreeDNetObject( ADotNetObject );
    end;

  finally
    RestoreFPU( CW );
  end;
end;

end.

