unit VMI_OnHand_Chk;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
//  Mask,
  uniGUIApplication, //UniApplication
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
  TFrmVMIOverOnHandException = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckVMIExceededOnHand( AFGMulti_ID, AQty: Real );


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;

procedure CheckVMIExceededOnHand( AFGMulti_ID, AQty: Real );
var
  A: Variant;
  frm: TFrmVMIOverOnHandException;
begin
  A:= SelectValueArrayFmt( 'select onhand from fgmulti where id = %f', [ AFGMulti_ID ]);
  if (VarArrayDimCount( A ) > 0) and (AQty > A[ 0 ]) then
  begin
    if not IsConsole then
    begin
      frm := TFrmVMIOverOnHandException.Create(uniGUIApplication.UniApplication);
      frm.rcusto_ID := AFGMulti_ID;
      if not (frm.ShowModal = mrOK) then
        raise TIQNotAuthorizedException.Create;
    end else
      raise TIQNotAuthorizedException .Create;
  end;

end;

end.

