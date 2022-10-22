unit wo_chk_intransit;

interface

uses
  Winapi.Windows,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
//  Mask,
  FireDAC.Comp.DataSet,
  uniGUIApplication, //UniApplication
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.SecurityRegister, Data.DB,
  FireDAC.Comp.Client, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, System.Classes, uniGUIBaseClasses;

type
  TFrmWorkorderInTransitException = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckWorkorderInTransit( AWorkorder_ID:Real );

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;

procedure CheckWorkorderInTransit( AWorkorder_ID:Real );
var
  frm: TFrmWorkorderInTransitException;
begin
  frm := TFrmWorkorderInTransitException.Create(uniGUIApplication.UniApplication);

  if SelectValueFmtAsFloat('select 1 from fgmulti where in_transit_workorder_id = %f and nvl(onhand,0) <> 0', [ AWorkorder_ID ]) = 1 then
  begin
    frm.rcusto_ID := AWorkorder_ID;
    if not (frm.ShowModal = mrOK) then
      //raise Exception.Create('Status exception has not been authorized - unable to proceed');
      raise TIQNotAuthorizedException.Create;
  end;

end;

end.

