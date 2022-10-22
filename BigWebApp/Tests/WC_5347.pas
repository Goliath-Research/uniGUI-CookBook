unit WC_5347;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Bom_ProdRepParam;

procedure TestDoShowModal;
var
  ABOMProdRepParamsCargo: TBOMProdRepParamsCargo;
begin
  ABOMProdRepParamsCargo.IsReuse := true;
  ABOMProdRepParamsCargo.IsReuse_Sprue := false;
  ABOMProdRepParamsCargo.IsRg_Dispo := true;
  ABOMProdRepParamsCargo.LookupMfgtype := 'ASSY1';

  if TFrmBOMProdRepParams.DoShowModal(ABOMProdRepParamsCargo) then
     ShowMessage('mfg type: '+ABOMProdRepParamsCargo.LookupMfgtype);
end;

initialization
  TTestRepo.RegisterTest('WC-5347', 'Bom',  'Bom_ProdRepParam', 'DoShowModal( var ABOMProdRepParamsCargo: TBOMProdRepParamsCargo )', TestDoShowModal);
end.
