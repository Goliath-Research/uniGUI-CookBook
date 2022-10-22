unit oe_rel_on_pktkt_chk;

interface

uses
  Winapi.Windows,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  Mask,
  Vcl.Menus,
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
  System.Classes,
  uniMainMenu, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, uniGUIBaseClasses;

type
  TFrmReleaseOnPkTicketException = class(TFrmStatusException)
    PopupMenu1: TUniPopupMenu;
    JumpToPickTicket1: TUniMenuItem;
    procedure JumpToPickTicket1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckReleaseOnPickTicket( ARelease_ID: Real );

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.WebVcl.Jump,
  IQMS.Common.JumpConstants;

procedure CheckReleaseOnPickTicket( ARelease_ID: Real );
var
  LFrmReleaseOnPkTicketException : TFrmReleaseOnPkTicketException;
begin
  if SelectValueFmtAsFloat('select 1 from ps_ticket_dtl where release_id = %f', [ ARelease_ID ]) = 1 then
     LFrmReleaseOnPkTicketException := TFrmReleaseOnPkTicketException.Create(UniGUIApplication.UniApplication);
     with LFrmReleaseOnPkTicketException do
     begin
       rcusto_ID := ARelease_ID;
       if not (ShowModal = mrOK) then
          raise TIQNotAuthorizedException.Create;
     end;
end;


procedure TFrmReleaseOnPkTicketException.JumpToPickTicket1Click(
  Sender: TObject);
begin
  inherited; // n
  JumpDirect( iq_JumpToPickTicket, Query1.FieldByName('PS_TICKET_ID').asInteger );  // IQMS.WebVcl.Jump.pas
end;

end.
