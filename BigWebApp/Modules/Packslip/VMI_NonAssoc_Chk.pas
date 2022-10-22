unit VMI_NonAssoc_Chk;

interface

uses
  Winapi.Windows,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  Mask,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIApplication, // UniApplication
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
  FireDAC.Comp.Client,
  System.Classes, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, uniGUIBaseClasses;

type
  TFrmVMINotAssociatedLocationException = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckVMINotAssociatedLocation(ASelectedFGMulti_ID, AAssociatedFGMulti_ID, AShipment_Dtl_ID: Real);

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;

procedure CheckVMINotAssociatedLocation(ASelectedFGMulti_ID, AAssociatedFGMulti_ID, AShipment_Dtl_ID: Real);
var
  frm: TFrmVMINotAssociatedLocationException;
begin

  if ASelectedFGMulti_ID = AAssociatedFGMulti_ID then
    EXIT;

  if SelectValueFmtAsFloat('select 1 from shipment_releases where shipment_dtl_id = %f and vmi_fgmulti_id = %f', [AShipment_Dtl_ID, ASelectedFGMulti_ID]) = 1 then
    EXIT;

  if not IsConsole then
  begin
    frm := TFrmVMINotAssociatedLocationException.Create(uniGUIApplication.UniApplication);
    frm.rcusto_ID := ASelectedFGMulti_ID;
    if not(frm.ShowModal = mrOK) then
      raise TIQNotAuthorizedException.Create;
  end
  else
    raise TIQNotAuthorizedException.Create;

end;

end.
