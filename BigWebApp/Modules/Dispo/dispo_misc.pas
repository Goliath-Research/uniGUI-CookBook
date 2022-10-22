unit dispo_misc;

interface

uses
  Classes,
  SysUtils,
  Windows,
  Forms;

type
  TCheckAccess = procedure( AApp_ID, AComponentName: string );

  TFindFGMultiUsingBusinessRules = class
  private
    procedure AddFGMultiRecord;
    procedure AssignFgMultiApplySameLotRule;
    procedure AssignFgMultiDefault;
    procedure CheckAssignInDate;
    procedure SetCheckAccess(const Value: TCheckAccess);
    procedure DefaultCheckAccess( AApp_ID, AComponentName: string );
    procedure CheckUpdateFGMultiMakeToOrderDetail;
  public
    FGMulti_ID: Real;
    Arinvt_ID: Real;
    Loc_ID: Real;
    LotNo: string;
    Default_Dispo: string;  {Y/N}
    Prompted_FGMulti_ID: Real;
    Non_Conform_ID: Real;
    Make_To_Order_Detail_ID: Real;
    Lot_Date: TDateTime;
    IsUniqueDate: Boolean;
    OnHand: Real;
    FCheckAccess: TCheckAccess;
    constructor Create( AArinvt_ID, ALoc_ID: Real; ALotNo: string );
    function Execute: Real;
    property CheckAccess: TCheckAccess read FCheckAccess write SetCheckAccess;
  end;


implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  iqrf_rscstr,
  IQMS.WebVcl.SecurityManager,
  IQMS.WebVcl.SecurityRegister,
  System.Variants,
  IQMS.WebVcl.ResourceStrings;

{ TFindFGMultiUsingBusinessRules }

constructor TFindFGMultiUsingBusinessRules.Create( AArinvt_ID, ALoc_ID: Real; ALotNo: string );
var
  A: Variant;
begin
  Arinvt_ID:= AArinvt_ID;
  Loc_ID   := ALoc_ID;
  LotNo    := ALotNo;

  A:= SelectValueArrayFmt( 'select NVL(unque_date_in, ''N''), NVL(onhand,0) from arinvt where id = %f', [ Arinvt_ID ] );
  if VarArrayDimCount( A ) = 0 then
     raise Exception.CreateFmt(iqrf_rscstr.cTXT0000219 { 'Unable to locate Arinvt ID = %.0f' }, [ Arinvt_ID ]);

  IsUniqueDate:= A[ 0 ] = 'Y';
  OnHand      := A[ 1 ];
end;

function TFindFGMultiUsingBusinessRules.Execute: Real;
begin
  if IsUniqueDate and (OnHand > 0) then
     AddFGMultiRecord()

  else if Prompted_FGMulti_ID > 0 then
     AssignFgMultiApplySameLotRule

  else
     AssignFgMultiDefault;

  if FGMulti_ID = 0 then
     AddFGMultiRecord();

  CheckAssignInDate;

  Result:= FGMulti_ID;
end;

procedure TFindFGMultiUsingBusinessRules.AddFGMultiRecord;
begin
  if Assigned( CheckAccess ) then
     CheckAccess( 'FrmTranMain', 'CreateNewLocation1')
  else
     DefaultCheckAccess( 'FrmTranMain', 'CreateNewLocation1');

  FGMulti_ID:= GetNextID('FGMULTI');
  ExecuteCommandFmt('insert into fgmulti (id, arinvt_id, loc_id, lotno, auto_dispo_default_loc, non_conform_id, lot_date) values (%f, %f, %f, ''%s'',''%s'', %s, to_date(''%s'', ''mm/dd/yyyy''))',
            [ FGMulti_ID,
              Arinvt_ID,
              Loc_ID,
              LotNo,
              Default_Dispo,
              IIf( Non_Conform_ID = 0, 'null', FloatToStr(Non_Conform_ID)),
              IIf( Lot_Date = 0, '', FormatDateTime('mm/dd/yyyy', Lot_Date)) ]);

  CheckUpdateFGMultiMakeToOrderDetail;
end;


procedure TFindFGMultiUsingBusinessRules.CheckUpdateFGMultiMakeToOrderDetail;
begin
  if Make_To_Order_Detail_ID > 0 then
     ExecuteCommandFmt('update fgmulti set make_to_order_detail_id = %f where id = %f', [ Make_To_Order_Detail_ID, FGMulti_ID ]);
end;


procedure TFindFGMultiUsingBusinessRules.AssignFgMultiApplySameLotRule;
begin
    { Assign and check for different LotNo }
    FGMulti_ID:= Prompted_FGMulti_ID;

    { Try select with the same lotno for passed loc_id. If not found then we will add FGMulti down below }
    if Trim(SelectValueByID( 'lotno', 'fgmulti', Prompted_FGMulti_ID )) <> LotNo then
       FGMulti_ID:= SelectValueFmtAsFloat('select f.id from fgmulti f '+
                              ' where f.arinvt_id = %f '+
                              '   and f.loc_id = %f '+
                              '   and NVL(RTrim(f.lotno), ''@'') = ''%s'' '+
                              '   and nvl(f.make_to_order_detail_id,0) = %f '+
                              '   and (%f = 0 or lot_date = to_date(''%s'', ''mm/dd/yyyy'')) '+
                              ' order by f.in_date, f.id ',
                              [ Arinvt_ID,
                                Loc_ID,
                                sIIf(LotNo = '', '@', LotNo),
                                Make_To_Order_Detail_ID,
                                Lot_Date, FormatDateTime('mm/dd/yyyy', Lot_Date) ]);
end;


procedure TFindFGMultiUsingBusinessRules.AssignFgMultiDefault;
begin
  FGMulti_ID:= SelectValueFmtAsFloat('select f.id from fgmulti f '+
                         ' where f.arinvt_id = %f '+
                         '   and f.loc_id = %f '+
                         '   and NVL(RTrim(f.lotno), ''@'') = ''%s'' '+
                         '   and nvl(f.make_to_order_detail_id,0) = %f '+
                         '   and (%f = 0 or lot_date = to_date(''%s'', ''mm/dd/yyyy'')) '+
                         ' order by f.in_date, f.id ',
                         [ Arinvt_ID,
                           Loc_ID,
                           sIIf( LotNo = '', '@', LotNo),
                           Make_To_Order_Detail_ID,
                           Lot_Date, FormatDateTime('mm/dd/yyyy', Lot_Date) ]);
end;


procedure TFindFGMultiUsingBusinessRules.CheckAssignInDate;
begin
  if SelectValueFmtAsFloat('select onhand from fgmulti where id = %f', [ FGMulti_ID ]) = 0 then
     ExecuteCommandFmt( 'update fgmulti set in_date = to_date(''%s'', ''MM/DD/YY HH24:MI:SS'') where id = %f',
                [ FormatDateTime( 'mm/dd/yy hh:nn:ss', Now ), FGMulti_ID ]);
end;


procedure TFindFGMultiUsingBusinessRules.DefaultCheckAccess( AApp_ID, AComponentName: string );
begin
  if not TSecurityManager.IsSecuredComponentEnabled( AApp_ID, AComponentName ) then
     raise TInsufficientRights.CreateFmt( IQMS.WebVcl.ResourceStrings.cTXT0000180 {'Insufficient rights.  Access denied. [%s]'}, [ AComponentName]);
end;



procedure TFindFGMultiUsingBusinessRules.SetCheckAccess( const Value: TCheckAccess);
begin
  FCheckAccess := Value;
end;


end.

