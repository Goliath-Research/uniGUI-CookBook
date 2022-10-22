unit bom_share;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes;

procedure BOM_UpdateFGLotNo( AStandard_ID: Real; AFGLotNo: string );
function GetBy_Product_Opmat_ID_Of( APartno_ID: Real ): Real;
function GetBy_Product_Opmat_ID_Of_Bom( AStandard_ID: Real ): Real;
function bom_get_fg_lotno( AStandard_ID, APartno_ID: Real; AWorkorder_ID: Real = 0 ): string;
function bom_get_fg_lotno_ex( AStandard_ID, AArinvt_ID: Real; AWorkorder_ID: Real = 0 ): string;
function CheckApplyUniqueLot( ALotNo: String; AArinvt_ID, AStandard_ID: Real ): string;
function GetNextRFQ(aRFQ:String): string;
                                                           
implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.Sequence,
  IQMS.WebVcl.SecurityManager;

procedure BOM_UpdateFGLotNo( AStandard_ID: Real; AFGLotNo: string );
begin
  ExecuteCommand('begin iqmisc.v_disable_change::= ''Y''; end;');    {disable bom control change}
  try
    ExecuteCommandFmt('update standard set fg_lotno = ''%s'' where id = %f', [ AFGLotNo, AStandard_ID ]);
  finally
    ExecuteCommand('begin iqmisc.v_disable_change::= ''N''; end;');  {enable bom control change}
  end;
end;

function bom_get_fg_lotno( AStandard_ID, APartno_ID: Real; AWorkorder_ID: Real = 0 ): string;
begin
  Result:= SelectValueFmtAsString('select bom_misc.get_fg_lotno( %f, %f, %f ) from dual', [ AStandard_ID, APartno_ID, AWorkorder_ID ]);
end;

function bom_get_fg_lotno_ex( AStandard_ID, AArinvt_ID: Real; AWorkorder_ID: Real = 0 ): string;
begin
  Result:= SelectValueFmtAsString('select bom_misc.get_fg_lotno_ex( %f, %f, %f ) from dual', [ AStandard_ID, AArinvt_ID, AWorkorder_ID ]);
end;

function CheckApplyUniqueLot( ALotNo: String; AArinvt_ID, AStandard_ID: Real ): string;
var
  APartno_ID: Real;
begin
  Result:= ALotNo;
  if SelectValueByID('use_unique_lotno', 'standard', AStandard_ID) <> 'Y' then
     EXIT;

  APartno_ID:= SelectValueFmtAsFloat('select id from partno where standard_id = %f and arinvt_id = %f', [ AStandard_ID, AArinvt_ID ]);
  if APartno_ID = 0 then
     EXIT;

  Result:= Format('%s-%.0f', [ Result, APartno_ID ]);
end;

function GetBy_Product_Opmat_ID_Of( APartno_ID: Real ): Real;
begin
  Result:= SelectValueFmtAsFloat('select d.id                   '+
                     '  from ptoper b, sndop c,     '+
                     '       opmat d, arinvt e      '+
                     ' where b.partno_id = %f       '+
                     '   and b.sndop_id = c.id      '+
                     '   and c.op_class = ''IN''    '+
                     '   and c.id = d.sndop_id      '+
                     '   and d.arinvt_id = e.id     '+
                     '   and e.is_by_product = ''Y''',
                     [ APartno_ID ]);
end;


function GetBy_Product_Opmat_ID_Of_Bom( AStandard_ID: Real ): Real;
begin
  Result:= SelectValueFmtAsFloat('select d.id                         '+
                     '  from partno a, ptoper b, sndop c, '+
                     '       opmat d, arinvt e            '+
                     ' where a.standard_id = %f           '+
                     '   and b.partno_id = a.id           '+
                     '   and b.sndop_id = c.id            '+
                     '   and c.op_class = ''IN''          '+
                     '   and c.id = d.sndop_id            '+
                     '   and d.arinvt_id = e.id           '+
                     '   and e.is_by_product = ''Y''      '+
                     ' order by a.id                      ',
                     [ AStandard_ID ]);
end;


function GetNextRFQ(aRFQ:String): string;
var
  aEplantId:String;
  S: string;
begin                                 
  Result := aRFQ;
//  aEplantId := SelectValueAsFloat('select misc.geteplantid from dual');
  aEplantId := SecurityManager.EPlant_ID;
  if SelectValueAsString('select enable_quote_num_gen from iqsys') = 'Y' then
  begin
     {Based on EPlant activate sequence and get next orderno}
     S:= GetEPlantSequenceName( aEplantId, 'RFQ', 'S_RFQ' );
     Result:= FloatToStr( GetNextSequenceNumber( S ));

     {Append Suffix}
     S:= Result;
     IQAppend_EPlant_Suffix( aEplantId, S );
     Result:= S;
  end;

end;


end.
