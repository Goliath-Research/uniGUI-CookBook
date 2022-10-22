unit PkTktChk;

interface

uses
  Winapi.Windows,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  Mask,
  FireDAC.Comp.DataSet,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  IQMS.WebVcl.SecurityRegister,
  Data.DB,
  uniGUIApplication,
  FireDAC.Comp.Client,
  System.Classes, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, uniGUIBaseClasses;

type
  TFrmOrdOnPkTktException = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure CheckPickTicketExists( AOrd_Detail_ID:Real );
  end;

procedure CheckOrdDetailForPickTicket( OrdDetail_ID:Real );

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;

procedure CheckOrdDetailForPickTicket( OrdDetail_ID:Real );
begin
  TFrmOrdOnPkTktException.CheckPickTicketExists( OrdDetail_ID );  // this unit
end;


{ TFrmOrdOnPkTktException }

class procedure TFrmOrdOnPkTktException.CheckPickTicketExists( AOrd_Detail_ID: Real);
var
  LFrmOrdOnPkTktException : TFrmOrdOnPkTktException;
begin
  if SelectValueFmtAsFloat('select 1 from ps_ticket_dtl where ord_detail_id = %f and rownum < 2', [ AOrd_Detail_ID ]) = 1 then
  begin
    LFrmOrdOnPkTktException :=  TFrmOrdOnPkTktException.Create(UniGUIApplication.UniApplication);
    with LFrmOrdOnPkTktException do
    begin
      rcusto_ID := AOrd_Detail_ID;
      if not (ShowModal = mrOK) then
      //raise Exception.Create('Status exception has not been authorized - unable to proceed');
      raise TIQNotAuthorizedException.Create;
     end;
  end;
end;

end.
