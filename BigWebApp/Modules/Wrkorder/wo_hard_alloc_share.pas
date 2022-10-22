unit wo_hard_alloc_share;

interface

function GetHardAllocTransReason_A( AWorkorder_BOM_ID: Real ): string;
function GetHardAllocTransReason_B( AWorkorder_ID: Real ): string;
function GetMtoAllocTransReason( AOrd_Detail_ID: Real ): string;
procedure CheckDeleteDispoDesignatorAfterDeallocate( AWorkorder_ID, AFGMulti_ID: Real );

implementation

uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  wo_rscstr,
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
  MainModule;

function GetHardAllocTransReason_A( AWorkorder_BOM_ID: Real ): string;
var
  AWorkorder_ID: Real;
begin
  AWorkorder_ID:= SelectValueByID('workorder_id', 'workorder_bom', AWorkorder_BOM_ID );
  Result:= GetHardAllocTransReason_B( AWorkorder_ID );
end;

function GetHardAllocTransReason_B( AWorkorder_ID: Real ): string;
var
  AOrderNo: string;
begin
  AOrderNo:= SelectValueFmtAsString('select r.orderno from ptorder_rel r, ptorder p where p.workorder_id = %f and p.id = r.ptorder_id', [ AWorkorder_ID ]);
  // wo_rscstr.cTXT0000036 = 'HARD MATERIAL ALLOCATION, SO # %s';
  Result:= Format(wo_rscstr.cTXT0000036, [ IQMS.Common.StringUtils.FixStr(AOrderNo) ]);
end;

function GetMtoAllocTransReason( AOrd_Detail_ID: Real ): string;
var
  AOrderNo: string;
begin
  AOrderNo:= SelectValueFmtAsString('select o.orderno from ord_detail d, orders o where d.id = %f and d.orders_id = o.id', [ AOrd_Detail_ID ]);
  // wo_rscstr.cTXT0000035 = 'MTO ALLOCATION, SO # %s';
  Result:= Format(wo_rscstr.cTXT0000035, [ IQMS.Common.StringUtils.FixStr(AOrderNo) ]);
end;

procedure CheckDeleteDispoDesignatorAfterDeallocate( AWorkorder_ID, AFGMulti_ID: Real );
var
  AStandard_ID: Real;
begin
  if SelectValueFmtAsFloat( 'select 1 from v_fgmulti_allocated where fgmulti_id = %f and rownum < 2', [ AFGMulti_ID ]) = 1 then
     EXIT;

  AStandard_ID:= SelectValueByID('standard_id', 'workorder', AWorkorder_ID);

  if SelectValueByID('auto_dispo_standard_id', 'fgmulti', AFGMulti_ID ) = AStandard_ID then
  begin
    ExecuteCommandFmt( 'update fgmulti set auto_dispo_standard_id = null, auto_dispo_default_loc = ''N'' where id = %f',
               [ AFGMulti_ID ]);
    ExecuteCommandFmt( 'delete from fgmulti_dispo_bom where fgmulti_id = %f',
               [ AFGMulti_ID ]);
  end;
end;

end.

