unit wo_chk_assy_pit_pending;

interface

uses
  Winapi.Windows,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
//  Mask,
  FireDAC.Comp.DataSet,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.SecurityRegister, Data.DB,
  FireDAC.Comp.Client, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, System.Classes, uniGUIBaseClasses, uniGUIApplication;

type
  TFrmAssyWorkorderPITPendingException = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckAssyPendingProcessingInPIT(AWorkorder_ID: Real);


implementation

{$R *.dfm}


uses
  IQMS.Common.DataLib;

procedure CheckAssyPendingProcessingInPIT(AWorkorder_ID: Real);
var
  AStandard_ID: Real;
  frm: TFrmAssyWorkorderPITPendingException;
begin
  AStandard_ID := SelectValueByID('standard_id', 'workorder', AWorkorder_ID);
  if SelectValueFmtAsFloat
    ('select workorder_misc.is_assy1_pit_pending(%f, %f) from dual',
    [AStandard_ID, AWorkorder_ID]) = 1 then
  begin
   frm := TFrmAssyWorkorderPITPendingException.Create(uniGUIApplication.UniApplication);
   frm.rcusto_ID := AWorkorder_ID;
   if not (frm.ShowModal = mrOK) then
     raise TIQNotAuthorizedException.Create;
  end;

end;

end.
