unit trans_master_loc_non_conf_dispo_designated_chk;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  trans_non_conf_dispo_designated_chk,
  Mask,
  IQMS.Common.StatChk,
  FireDAC.Comp.DataSet,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.SecurityRegister, Data.DB,
  FireDAC.Comp.Client, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, uniGUIBaseClasses, uniGUIApplication;

type
  TFrmMasterLocNonConfDispoDesgExcp = class(TFrmNonConformDispoDesignatedException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckMasterLocationNonConformDispoDesignated( ALoc_ID: Real );

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;

procedure CheckMasterLocationNonConformDispoDesignated( ALoc_ID: Real );
var
  LFrmMasterLocNonConfDispoDesgExcp : TFrmMasterLocNonConfDispoDesgExcp;
begin
  if SelectValueFmtAsString('select non_conform from locations where id = %f', [ ALoc_ID ]) <> 'Y' then
     EXIT;

  LFrmMasterLocNonConfDispoDesgExcp := TFrmMasterLocNonConfDispoDesgExcp.Create( uniGUIApplication.UniApplication);
  LFrmMasterLocNonConfDispoDesgExcp.rcusto_ID := ALoc_ID;
  if not (LFrmMasterLocNonConfDispoDesgExcp.ShowModal = mrOK) then
     //raise Exception.Create('Status exception has not been authorized - unable to proceed');
     raise TIQNotAuthorizedException.Create;
end;

end.

