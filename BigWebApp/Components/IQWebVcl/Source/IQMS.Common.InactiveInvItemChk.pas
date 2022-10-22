unit IQMS.Common.InactiveInvItemChk;

interface

uses
  Winapi.Windows,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk, uniGUIApplication,
  FireDAC.Comp.DataSet, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  IQMS.WebVcl.SecurityRegister, Data.DB, FireDAC.Comp.Client, uniButton,
  uniCheckBox, uniPanel, uniGUIClasses, uniEdit, uniDBEdit, uniLabel,
  uniPageControl, System.Classes, uniGUIBaseClasses;

type
  TFrmInactiveInventoryItemException = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckInventoryItemInactive( AArinvt_ID: Real );

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;

procedure CheckInventoryItemInactive( AArinvt_ID: Real );
begin
  if SelectValueFmtAsString('select pk_hide from arinvt where id = %f', [ AArinvt_ID ]) = 'Y' then
     with TFrmInactiveInventoryItemException.Create( uniGUIApplication.UniApplication ) do
     begin
       rcusto_ID:=AArinvt_ID;
       if not (ShowModal = mrOK) then
          //raise Exception.Create('Status exception has not been authorized - unable to proceed');
          raise TIQNotAuthorizedException.Create;
     end;
end;


end.

