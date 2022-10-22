unit prod_labor_ta_setup_chk;

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
  uniDBEdit, uniLabel, uniPageControl, System.Classes, uniGUIBaseClasses;

type
  TFrmProdRepTALaborException = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckMfgtypeLaborPostingSetup( ADayprod_ID: Real );

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  uniGUIApplication;

procedure CheckMfgtypeLaborPostingSetup( ADayprod_ID: Real );
var
  LFrmProdRepTALaborException : TFrmProdRepTALaborException;
begin
   if SelectValueFmtAsString('select labor_posted_by_ta from dayprod d, hist_illum_rt h, mfgtype m where d.id = %f and d.hist_illum_rt_id = h.id and h.mfg_type = m.mfgtype',
                   [ ADayprod_ID ]) = 'Y' then
   begin
     LFrmProdRepTALaborException := TFrmProdRepTALaborException.Create( uniGUIApplication.UniApplication );
     with LFrmProdRepTALaborException  do
     begin
       rcusto_ID := ADayprod_ID;
       if not (ShowModal = mrOK) then
          raise TIQNotAuthorizedException.Create;
      end;
   end;
end;


end.
