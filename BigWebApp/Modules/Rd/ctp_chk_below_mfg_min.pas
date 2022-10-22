unit ctp_chk_below_mfg_min;

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
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, uniGUIBaseClasses,uniGUIApplication;

type
  TFrmCTPBelowMfgMinQtyException = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckCTPBelowMfgMinQty( AArinvt_ID, ACTP_Request_Qty: Real );

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;

procedure CheckCTPBelowMfgMinQty( AArinvt_ID, ACTP_Request_Qty: Real );
var
  A: Variant;
  frm: TFrmCTPBelowMfgMinQtyException;
begin
  A:= SelectValueArrayFmt( 'select mfg_min_qty from arinvt where id = %f', [ AArinvt_ID ]);
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  if (A[ 0 ] > 0) and (ACTP_Request_Qty > 0) and (ACTP_Request_Qty < A[ 0 ]) then
  begin
    frm := TFrmCTPBelowMfgMinQtyException.Create(uniGUIApplication.UniApplication);
    frm.rcusto_ID := ACTP_Request_Qty;
    if not (frm.ShowModal = mrOK) then
       raise TIQNotAuthorizedException.Create;
  end;

end;


end.

