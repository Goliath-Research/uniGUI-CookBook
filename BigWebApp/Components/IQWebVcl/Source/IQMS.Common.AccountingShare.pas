unit IQMS.Common.AccountingShare;

interface
uses
  System.SysUtils, Winapi.Windows, System.Classes, Vcl.Forms,
  FireDAC.Comp.Client, FireDAC.Phys;

function CheckForOpenPeriod(AField:string; AId:Real):Boolean;
function GetFXAccountID(AGLAcctID:Real):Real;


implementation
uses IQMS.Common.DataLib, IQMS.Common.NLS, IQMS.Common.ResStrings, IQMS.Common.DataConst;

function CheckForOpenPeriod(AField:String; AId:Real):Boolean;
begin
  Result := True;
  if SelectValueFmtAsString('select %s from glperiods where id = %f',
    [AField, AId]) <> 'OPEN' then
  begin
    Result := False;
    {'Cannot post to a closed period.'#13 +
     'Use ''Define Periods'' option in the ''GL/Account Maintenance'''#13 +
     'form to change the period status'}
    raise Exception.Create ( IQMS.Common.ResStrings.cTXT0000071 );
  end;
end;

function GetFXAccountID(AGLAcctID:Real):Real;
var
  AId:Real;
begin
  Result := 0;
  AId := SelectValueFmtAsFloat('select gl_subacct_type_id from glacct where id = %f', [AGLAcctID]);
  with TFDQuery.Create(Application) do
  try
    ConnectionName:= cnstFDConnectionName;
    Sql.Add(IQFormat('select glacct_id_fx ' +
                     'from GLSUB_ACCT_TYPE ' +
                     'start with id = %f ' +
                     'connect by id = prior parent_id', [AId]));
    Open;
    while not eof do
    begin
      if FieldByName('glacct_id_fx').AsFloat <> 0 then
      begin
        Result := FieldByName('glacct_id_fx').AsFloat;
        Result := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_ep_gl(%f, ''acct_id_fx'', misc.geteplantid) from dual', [Result]);
        Exit;
      end;
      Next;
    end;
    Result := SelectValueAsFloat('select plugins.get_glacct_id(''acct_id_fx'') from dual');
  finally
    Free;
  end;
end;




end.

