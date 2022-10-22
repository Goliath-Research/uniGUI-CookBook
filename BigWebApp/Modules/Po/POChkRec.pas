unit POChkRec;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
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
  uniDBEdit, uniLabel, uniPageControl, uniGUIBaseClasses, uniGUIApplication;

type
  TFrmReceivedPOExcep = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckPO_IfReceived( APO_ID:Real );
procedure CheckPODetail_IfReceived( APODETAIL_ID, APO_ID:Real );

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib;

procedure CheckPODetail_IfReceived( APODETAIL_ID, APO_ID:Real );
var
  LFrmReceivedPOExcep : TFrmReceivedPOExcep;
begin
  if SelectValueFmtAsFloat('select count(id) from po_receipts v where po_detail_id = %f',
               [ APODETAIL_ID ]) > 0 then
  begin
    LFrmReceivedPOExcep := TFrmReceivedPOExcep.Create( uniGUIApplication.UniApplication );
    LFrmReceivedPOExcep.rcusto_ID := APO_ID;
    if not (LFrmReceivedPOExcep.ShowModal = mrOK) then
       raise TIQNotAuthorizedException.Create;
  end;
end;

procedure CheckPO_IfReceived( APO_ID:Real );
var
  LFrmReceivedPOExcep : TFrmReceivedPOExcep;
begin
  if SelectValueFmtAsFloat('select count(v.id) from po_receipts v, po_detail p where v.po_detail_id = p.id and p.po_id = %f', [ APO_ID ]) > 0 then
  begin
    LFrmReceivedPOExcep := TFrmReceivedPOExcep.Create( uniGUIApplication.UniApplication );
    LFrmReceivedPOExcep.rcusto_ID := APO_ID;
    if not (LFrmReceivedPOExcep.ShowModal = mrOK) then
       raise TIQNotAuthorizedException.Create;
  end;
end;

end.
