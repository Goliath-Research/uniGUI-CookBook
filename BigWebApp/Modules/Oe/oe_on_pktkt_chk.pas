unit oe_on_pktkt_chk;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  Vcl.Menus,
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
  FireDAC.Comp.Client,
  uniGUIApplication,
  uniMainMenu, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, uniGUIBaseClasses;

type
  TFrmOrderOnPkTicketException = class(TFrmStatusException)
    PopupMenu1: TUniPopupMenu;
    JumpToPickTicket1: TUniMenuItem;
    procedure JumpToPickTicket1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShowModal( AOrders_ID: Real );
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.WebVcl.Jump,
  IQMS.Common.JumpConstants;

class procedure TFrmOrderOnPkTicketException.DoShowModal( AOrders_ID: Real );
var
  AOrd_Detail_ID: Real;
  LFrmOrderOnPkTicketException : TFrmOrderOnPkTicketException;
begin
  AOrd_Detail_ID:= SelectValueFmtAsFloat('select ord_detail_id from ps_ticket_dtl where ord_detail_id in (select id from ord_detail where orders_id = %f) and rownum < 2',
                             [ AOrders_ID ]);
  if AOrd_Detail_ID > 0 then
  begin
     LFrmOrderOnPkTicketException := TFrmOrderOnPkTicketException.Create( uniGUIApplication.UniApplication );
     LFrmOrderOnPkTicketException.rcusto_ID := AOrd_Detail_ID;
     if not (LFrmOrderOnPkTicketException.ShowModal = mrOK) then
        raise TIQNotAuthorizedException.Create;
  end;
end;


procedure TFrmOrderOnPkTicketException.JumpToPickTicket1Click(Sender: TObject);
begin
  inherited;  // n
  JumpDirect( iq_JumpToPickTicket, Query1.FieldByName('PS_TICKET_ID').asInteger );  // IQMS.WebVcl.Jump.pas
end;

end.
