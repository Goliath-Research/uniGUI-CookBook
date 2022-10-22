unit IQMS.Common.HardAllocatedMaterialChk;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  Mask,
  FireDAC.Comp.DataSet,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,   uniGUIApplication,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.SecurityRegister, Data.DB,
  FireDAC.Comp.Client, uniButton, uniCheckBox, uniPanel, uniPageControl;

type
  TFrmHardAllocatedMaterial = class(TFrmStatusException)
    Label4: TUniLabel;
    DBEdit4: TUniDBEdit;
    Label5: TUniLabel;
    DBEdit5: TUniDBEdit;
  private
    { Private declarations }
    FFab_Lot_ID: Real;
  protected
    procedure PrepareQuery( AID: Real ); override;
  public
    { Public declarations }
    constructor Create(AFGMulti_ID, AFab_Lot_ID: Real);
  end;

procedure CheckHardAllocatedMaterial( AFGMulti_ID, AFab_Lot_ID: Real );


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.WebVcl.ResourceStrings;

procedure CheckHardAllocatedMaterial( AFGMulti_ID, AFab_Lot_ID: Real );
var
  A: Variant;
begin
  if not ((AFGMulti_ID > 0) and ( SelectValueFmtAsFloat('select 1 from fab_lot_mat_loc where fgmulti_id = %f and rownum < 2', [ AFGMulti_ID ]) = 1)) then
     EXIT;

  {hard allocation found}
  A:= SelectValueArrayFmt( 'select f.loc_desc,                    '+
                      '       lot.fab_lot_lotno,             '+
                      '       lot.fab_wo_workorder_id,       '+
                      '       a.itemno                       '+
                      '  from v_fgmulti_locations f,         '+
                      '       v_lot_track_ex lot,            '+
                      '       arinvt a                       '+
                      ' where                                '+
                      '       f.id = %f                      '+
                      '   and f.id = lot.fab_loc_fgmulti_id  '+
                      '   and lot.fab_lot_arinvt_id = a.id(+)'+
                      '   and lot.fab_lot_id <> %f           ',
                      [ AFGMulti_ID,
                        AFab_Lot_ID ]);   {ffab_lot_id is assigned only in FabData logout inventory transaction}

  {the allocation belongs only to passed AFab_Lot_ID - good - get out}
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  if IsConsole then
  begin
    if VarArrayDimCount( A ) > 0 then
       // 'Location ''%s'' is allocated to Lot # %s of Item # %s, WO# %.0f and cannot be part of the transaction.'
       raise Exception.CreateFmt( cTXT0000263, [ A[ 0 ], A[ 1 ], A[ 3 ], DtoF(A[ 2 ])]);
    EXIT;
  end;

  with TFrmHardAllocatedMaterial.Create(  AFGMulti_ID, AFab_Lot_ID ) do
  try
    if not (ShowModal = mrOK) then
       raise TIQNotAuthorizedException.Create;
  finally
    Release;
  end;
end;

{ TFrmHardAllocatedMaterial }
constructor TFrmHardAllocatedMaterial.Create(AFGMulti_ID, AFab_Lot_ID: Real);
begin
  FFab_Lot_ID:= AFab_Lot_ID;
  rcusto_ID := AFGMulti_ID;
  inherited Create( uniGUIApplication.UniApplication );
end;


procedure TFrmHardAllocatedMaterial.PrepareQuery(AID: Real);
begin
  inherited;
  AssignQueryParamValue(Query1, 'fab_lot_id', FFab_Lot_ID);
end;

end.

