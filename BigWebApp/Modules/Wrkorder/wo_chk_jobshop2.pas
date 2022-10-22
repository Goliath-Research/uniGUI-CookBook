unit wo_chk_jobshop2;

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
  TFrmWorkorderInJobshopException = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckWorkorderInJobshop2(AWorkorder_ID: Real);

implementation

{$R *.dfm}


uses
  IQMS.Common.DataLib;

procedure CheckWorkorderInJobshop2(AWorkorder_ID: Real);
var
  frm : TFrmWorkorderInJobshopException;
begin
  if SelectValueFmtAsInteger(
    'select 1 from jobshop_rfq where workorder_id = %f and rownum < 2',
    [AWorkorder_ID]) = 1 then
    begin
      frm := TFrmWorkorderInJobshopException.Create(uniGUIApplication.UniApplication);
      frm.rcusto_ID := AWorkorder_ID;
      if not (frm.ShowModal = mrOK) then
        raise TIQNotAuthorizedException.Create;
    end;
end;

end.
