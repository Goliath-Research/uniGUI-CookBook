unit IQMS.Common.InvMisc;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB;

  function LoadUOM( AList:TStrings; AArinvtID:Real ): Boolean;
  function GetKeepLabelBOMInfoInInterplantTrans( AArinvt_ID: Real ): Boolean;
  function GetCalculateNonComitted( AArinvt_ID: Real; ADivision_ID: Real = 0 ): Real;
  function GetCalculateDivisionOnHand( AArinvt_ID, ADivision_ID: Real ): Real;
  function GetLotExpiryDate( AArinvt_ID: Real; ALotNo: string ): TDateTime;
  function GetFamilyLotExpiryDate( AStandard_ID: Real; ALotNo: string ): TDateTime;
  procedure SetLotExpiryDate( AField: TField; AArinvt_ID: Real; ALotNo: string );
  function GetIsLotExpiryDateMandatory( AArinvt_ID: Real ): Boolean;
  procedure PromptUpdateLotExpiryDate( AArinvt_ID: Real; ALotNo: string );

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
//  {$IFDEF IQRF}
//  iqrf_share,
//  {$ENDIF}
  IQMS.Common.StringUtils,
  System.Variants,
  IQMS.Common.TransLotExpDateDlg,
  Vcl.Forms;

function LoadUOM( AList:TStrings; AArinvtID:Real ):Boolean;
var
  AClass: string;
begin
  AClass:= SelectValueFmtAsString('select class from arinvt where id = %f', [ AArinvtID ]);
  Result:= AClass <> '';
  with AList do
  begin
    Clear;
    if Result then
    begin
      if AClass = 'FG'      then Text:= 'EACH'
      else if AClass = 'PL' then Text:= 'LBS'#13'KG'#13'GR'#13'OZ'
      else if AClass = 'PK' then Text:= 'EACH'#13'ROLL'
      else if AClass = 'IN' then Text:= 'EACH'
      else if AClass = 'MT' then Text:= 'EACH'#13'LBS'#13'KG'#13'GR'#13'OZ'#13'GAL'#13'ROLL'
      else if AClass = 'TL' then Text:= 'EACH'#13'LBS'#13'KG'#13'GR'#13'OZ'#13'GAL'#13'ROLL'
      else if AClass = 'UD' then Text:= 'EACH'#13'LBS'#13'KG'#13'GR'#13'OZ'#13'GAL'#13'ROLL'
                            else Text:= 'EACH'#13'LBS'#13'KG'#13'GR'#13'OZ'#13'GAL'#13'ROLL'
    end
    else
      Text:= 'EACH';
  end;
end;


function GetKeepLabelBOMInfoInInterplantTrans( AArinvt_ID: Real ): Boolean;
begin
  Result:= SelectValueByID('keep_label_bom_interplant_tran', 'arinvt', AArinvt_ID) = 'Y';
end;

function GetCalculateNonComitted( AArinvt_ID: Real; ADivision_ID: Real = 0 ): Real;
var
  AVMI: Real;
  A   : Variant;
  AStandard_ID: Real;
  AOnHand: Real;
  AMfgQuan: Real;
begin
  Result:= 0;
  A:= SelectValueArrayFmt('select standard_id, onhand, mfg_quan from arinvt where id = %f', [ AArinvt_ID ]);
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  AStandard_ID:= A[ 0 ];
  AOnHand     := A[ 1 ];
  AMfgQuan    := A[ 2 ];
  AVMI        := SelectValueAsFloat( Where( Format('select sum(f.onhand)          '+
                                       '  from fgmulti f, locations l '+
                                       ' where f.arinvt_id = %.0f     '+
                                       '   and f.loc_id = l.id        '+
                                       '   and l.vmi = ''Y''          ',
                                       [ AArinvt_ID ]),
                                [ 'f.division_id', ADivision_ID ]));

  if ADivision_ID > 0 then
     begin
       AOnHand:= GetCalculateDivisionOnHand( AArinvt_ID, ADivision_ID );
       if AStandard_ID > 0 then
          AMfgQuan:= SelectValueFmtAsFloat('select mfg_quan from sched_arinvt_division where arinvt_id = %f and division_id = %f', [ AArinvt_ID, ADivision_ID ])
                     +
                     SelectValueFmtAsFloat('select irv32.get_fgmulti_onhand_make_to_ord( %f, %f ) from dual', [ AArinvt_ID, ADivision_ID ]);
     end

  else
     begin
       if (SelectValueAsString('select sched_alloc_by_division from params') = 'Y') and (AStandard_ID > 0) then
       begin
          AMfgQuan:= SelectValueFmtAsFloat('select sum(mfg_quan) from sched_arinvt_division where arinvt_id = %f', [ AArinvt_ID ])
                     +
                     SelectValueFmtAsFloat('select sum(mfg_quan) from ord_detail where arinvt_id = %f', [ AArinvt_ID ])
                     +
                     SelectValueFmtAsFloat('select irv32.get_in_transit_by_arinvt_id( 3, %f ) from dual', [ AArinvt_ID ]);   //  exclude awaiting verification 07-31-2015
       end;
     end;

  if AStandard_ID = 0 then
     Result:=  fMax(0, AOnHand
                       - AVMI
                       - SelectValueAsFloat( Where( IQFormat('select nvl(max(cum_mat_qty),0) from day_use_total where arinvt_id = %f', [ AArinvt_ID ]),
                                        [ 'division_id', ADivision_ID ]))
                       - SelectValueAsFloat( Where( IQFormat('select sum(nvl(onhand,0)) from fgmulti where arinvt_id = %f '+
                                                 '  and exists ( select 1 from workorder_bom_mat_loc where fgmulti_id = fgmulti.id )', [ AArinvt_ID ]),
                                        [ 'division_id', ADivision_ID ])))
  else
     Result:= fMax( 0, AOnHand - AMfgQuan - AVMI );
end;


function GetCalculateDivisionOnHand( AArinvt_ID, ADivision_ID: Real ): Real;
begin
  Result:= SelectValueFmtAsFloat('select sum( onhand )                                                                              '+
                     '  from fgmulti                                                                                    '+
                     ' where arinvt_id = %f                                                                             '+
                     '   and division_id = %f                                                                           '+
                     '   and nvl(in_transit_origin,0) <> 3                                                              '+ //  exclude awaiting verification 07-31-2015
                     '   and (non_conform_id is NULL or non_conform_id is not NULL and non_conform_allocatable = ''Y'') ',
                     [ AArinvt_ID, ADivision_ID ]);
end;


function GetIsLotExpiryDateMandatory( AArinvt_ID: Real ): Boolean;
begin
  Result:= SelectValueByID('is_lot_expiry_date_mandatory', 'arinvt', AArinvt_ID) = 'Y';
end;

function GetLotExpiryDate( AArinvt_ID: Real; ALotNo: string ): TDateTime;
begin
  Result:= 0;

  if (AArinvt_ID = 0) or (Trim(ALotNo) = '') then
      EXIT;

  Result:= SelectValueFmtAsFloat('select arinvt_misc.get_lot_expiry_date( %f, ''%s'') from dual', [ AArinvt_ID, StrTran(ALotNo, '''', '''''')]);
end;

function GetFamilyLotExpiryDate( AStandard_ID: Real; ALotNo: string ): TDateTime;
begin
  Result:= 0;

  if (AStandard_ID = 0) or (Trim(ALotNo) = '') then
      EXIT;

  Result:= SelectValueFmtAsFloat('select arinvt_misc.get_family_lot_expiry_date( %f, ''%s'') from dual', [ AStandard_ID, StrTran(ALotNo, '''', '''''') ]);
end;

procedure SetLotExpiryDate( AField: TField; AArinvt_ID: Real; ALotNo: string );
var
  ADate: TDateTime;
begin
  // this procedure can be called for CalcField event or assign value into field
  ADate:= GetLotExpiryDate( AArinvt_ID, ALotNo );
  if ADate > 0 then
     AField.AsDateTime:= ADate
  else
     AField.Clear;
end;


procedure PromptUpdateLotExpiryDate( AArinvt_ID: Real; ALotNo: string );
begin
  if (AArinvt_ID = 0) or (ALotNo = '') then
     EXIT;

//  {$IFDEF IQRF}
//  if IsConsole then
//     iqrf_share.RF_PromptUpdateLotExpiryDate( AArinvt_ID, ALotNo )
//  else
//  {$ENDIF}
     TFrmTransLotExpDateDlg.DoShowModal( AArinvt_ID, ALotNo );    // trans_lot_exp_date_dlg
end;


end.
