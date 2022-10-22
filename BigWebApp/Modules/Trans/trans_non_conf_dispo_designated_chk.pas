unit trans_non_conf_dispo_designated_chk;

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
  uniDBEdit, uniLabel, uniPageControl, System.Classes, uniGUIBaseClasses,
  uniGUIApplication;

type
  TToggleNonConformType = (tntUnknown, tntLocationToNonConform, tntLocationToDispoDesignated );

  TFrmNonConformDispoDesignatedException = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckLocationNonConformDispoDesignated( AFGMulti_ID: Real; AToggleType: TToggleNonConformType );

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;

procedure CheckLocationNonConformDispoDesignated( AFGMulti_ID: Real; AToggleType: TToggleNonConformType );
var
  LFrmNonConformDispoDesignatedException : TFrmNonConformDispoDesignatedException;
begin
  case AToggleType of
    tntLocationToNonConform:
      if SelectValueFmtAsFloat('select decode(auto_dispo_standard_id, null, 0, 1) + decode( auto_dispo_default_loc, null, 0, ''Y'', 1, 0) '+
                   '  from fgmulti where id = %f ', [ AFGMulti_ID ]) = 0 then
         EXIT;

    tntLocationToDispoDesignated:
      if SelectValueFmtAsFloat('select non_conform_id from fgmulti where id = %f', [ AFGMulti_ID ]) = 0 then
         EXIT;

  else
    EXIT;
  end;

  LFrmNonConformDispoDesignatedException :=  TFrmNonConformDispoDesignatedException.Create( uniGUIApplication.UniApplication );
  LFrmNonConformDispoDesignatedException.rcusto_ID := AFGMulti_ID;

  if not (LFrmNonConformDispoDesignatedException.ShowModal = mrOK) then
     //raise Exception.Create('Status exception has not been authorized - unable to proceed');
     raise TIQNotAuthorizedException.Create;

end;

end.

