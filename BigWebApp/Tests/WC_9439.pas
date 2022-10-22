unit WC_9439;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  IQMS.WebVcl.SecAddItem,
  IQMS.WebVcl.SecurityRegister,
  vendor_rfq_capital_equip_dlg;

procedure TestDoShowModal;
var
    Form: TFrmVendorRFQCapitalEquipment;
    SR  : TIQWebSecurityRegister;
    List: TStringList;
    i   : integer;
    Str:string;

begin
  Form := TFrmVendorRFQCapitalEquipment.Create(uniGUIApplication.UniApplication);
  SR   := TIQWebSecurityRegister.Create(Form);
  List := TStringList.Create;
  TFrmIQWebSecAddItem.DoShowModal( Form, Sr ,List);
  for i := 0 to List.Count-1 do
      Str:=Str+list[i]+' ';
  ShowMessage(Str);
  List.Free;

end;

initialization

  TTestRepo.RegisterTest('WC-9439', 'WebIQ', 'SecAddItem', 'TFrmIQWebSecAddItem.DoShowModal', TestDoShowModal);

end.
