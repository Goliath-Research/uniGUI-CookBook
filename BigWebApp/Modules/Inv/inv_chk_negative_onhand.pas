unit inv_chk_negative_onhand;

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
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  IQMS.WebVcl.SecurityRegister,
  Data.DB,
  FireDAC.Comp.Client, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, uniGUIBaseClasses;

type
  TFrmNegativeOnHandTransException = class(TFrmStatusException)
  private
    FFGMulti_ID: Real;
    procedure SetFGMulti_ID(const Value: Real);
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShowModal( AFGMulti_ID, ATrans_Quan: Real );
    property FGMulti_ID : Real write SetFGMulti_ID;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.ApplicationSet,
  IQMS.Common.Miscellaneous,
  IQMS.WebVcl.ResourceStrings, uniGUIApplication;

{ TFrmNegativeOnHandTransException }

class procedure TFrmNegativeOnHandTransException.DoShowModal( AFGMulti_ID, ATrans_Quan: Real);
var
  AOnHand: Real;
  A: Variant;
  AArinvt_ID: Real;
  AInTransitOrigin: Integer;
  LFrmNegativeOnHandTransException : TFrmNegativeOnHandTransException;
begin
  if IsConsole or (IQMS.Common.ApplicationSet.AppType = atCGI) then
     EXIT;

  AOnHand:= SelectValueByID('onhand', 'fgmulti', AFGMulti_ID);
  if (AOnHand < 0) then
     EXIT;
  if AOnHand - ATrans_Quan >= 0 then
     EXIT;

  // 7-28-2016 EIQ-13601 Outsource Central - Returning inventory - Inventory returned to negative in-transit creating new location not altering in-transit location  - CRM#1454107
  AInTransitOrigin:= Round(SelectValueByID('in_transit_origin', 'fgmulti', AFGMulti_ID));
  // 'In Transit Location - negative qty is not allowed. Operation aborted.'
  IQAssert(not (AInTransitOrigin in [1, 2, 3]), IQMS.WebVcl.ResourceStrings.cTXT0000392);

  // 12-09-2014 EIQ-5258 Transaction drives inventory location negative  warning message - excludes phantom MFG items with Drive Phantom Negative unchecked
  AArinvt_ID:= SelectValueByID('arinvt_id', 'fgmulti', AFGMulti_ID);
  A:= SelectValueArrayFmt('select phantom, drive_phantom_negative from arinvt where id = %.0f', [ AArinvt_ID ]);
  if (VarArrayDimCount( A ) = 0)
     or
     ((A[ 0 ] = 'Y') and (A[ 1 ] <> 'Y')) then
    EXIT;

  LFrmNegativeOnHandTransException := TFrmNegativeOnHandTransException.Create(UniGUIApplication.UniApplication);
  with LFrmNegativeOnHandTransException do
  begin
    FGMulti_ID := AFGMulti_ID;
    if not (ShowModal = mrOK) then
       raise TIQNotAuthorizedException.Create;
  end;
end;



procedure TFrmNegativeOnHandTransException.SetFGMulti_ID(const Value: Real);
begin
  FFGMulti_ID := Value;
end;

end.
