unit oc_check_pktkt_exists;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  IQMS.Common.StatChk,
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
  FireDAC.Comp.Client, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, Vcl.Forms, uniGUIBaseClasses, uniGUIApplication;

type
  TFrmOutsource_CheckPickTicketExists = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShowModal(AList: TStringList);
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;

class procedure TFrmOutsource_CheckPickTicketExists.DoShowModal(AList: TStringList);
var
  I: Integer;
  AOrd_Detail_ID: Real;
  frm: TFrmOutsource_CheckPickTicketExists;
begin
  for I := 0 to AList.Count - 1 do
  begin
    AOrd_Detail_ID := StrToFloat(AList[I]);
    if SelectValueFmtAsInteger('select count(*) from ps_ticket_dtl where ord_detail_id = %f', [AOrd_Detail_ID]) > 0 then
    begin
      frm := TFrmOutsource_CheckPickTicketExists.Create(uniGUIApplication.UniApplication);
      if not(frm.ShowModal = mrOK) then
        raise TIQNotAuthorizedException.Create;
    end;
  end;
end;

end.
