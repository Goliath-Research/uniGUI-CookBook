unit wo_chk_shelf_life;

interface

uses
  Winapi.Windows,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  Mask,
  FireDAC.Comp.DataSet,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.SecurityRegister, Data.DB,
  FireDAC.Comp.Client, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, System.Classes, uniGUIBaseClasses, UniGuiApplication;

type
  TFrmShelfLifeException = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckShelfLifeExpired(AFGMulti_ID: Real);


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;

procedure CheckShelfLifeExpired(AFGMulti_ID: Real);
var
  frm: TFrmShelfLifeException;
begin
  if SelectValueFmtAsInteger(
    'select iqms.inv_misc.shelf_life_expired(id) from fgmulti where id = %d',
    [Trunc(AFGMulti_ID)]) = 1 then
    begin
      frm:= TFrmShelfLifeException.Create(UniGuiApplication.UniApplication);
      frm.rcusto_ID:= AFGMulti_ID;
      if not (frm.ShowModal = mrOK) then
         raise TIQNotAuthorizedException.Create;
    end;
end;

end.
