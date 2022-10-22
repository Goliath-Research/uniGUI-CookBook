unit Prod_Share;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ComCtrls;

type
  TProdCargo = record
    ProdDate: TDateTime;
    Shift   : Integer;
    MfgCell : string
  end;

procedure UpdatePM( ADayProd_ID: Real );

implementation

uses
  IQMS.Common.DataLib;

procedure UpdatePM( ADayProd_ID: Real );
begin
  if ADayProd_ID = 0 then EXIT;

  if SelectValueFmtAsFloat('select 1 from day_part where dayprod_id = %f and nvl(dispo, ''N'') <> ''Y'' and rownum < 2', [ ADayProd_ID ]) = 0 then
     ExecuteCommandFmt('begin prod_rep.update_pm( %f ); end;', [ ADayProd_ID ]);

end;

end.


