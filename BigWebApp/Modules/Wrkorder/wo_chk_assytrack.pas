unit wo_chk_assytrack;

interface

uses
  Winapi.Windows,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
//  Mask,
  uniGUIApplication, //UniApplication
  FireDAC.Comp.DataSet,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.SecurityRegister, Data.DB,
  FireDAC.Comp.Client, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, System.Classes, uniGUIBaseClasses;

type
  TFrmWorkorderInAssyTrackException = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckWorkorderInAssyTrack( AWorkorder_ID:Real );


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;

procedure CheckWorkorderInAssyTrack( AWorkorder_ID:Real );
var
  frm: TFrmWorkorderInAssyTrackException;
begin

  if SelectValueFmtAsFloat('select 1 from workorder where id = %f and assy_run = ''Y''', [ AWorkorder_ID ]) = 1 then
  begin
    frm := TFrmWorkorderInAssyTrackException.Create(uniGUIApplication.UniApplication);
    frm.rcusto_ID := AWorkorder_ID;
    if not (frm.ShowModal = mrOK) then
      raise TIQNotAuthorizedException.Create;  //raise Exception.Create('Status exception has not been authorized - unable to proceed');
  end;

end;

end.

