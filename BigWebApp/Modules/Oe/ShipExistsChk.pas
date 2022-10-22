unit ShipExistsChk;

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
  FireDAC.Comp.Client,
  System.Classes,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel, uniButton, uniCheckBox, uniPanel, uniEdit, uniDBEdit, uniPageControl;

type
  TFrmShipExistsException = class(TFrmStatusException)
    Label4: TUniLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckShipmentsExists( AOrder_ID: Real );

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib, uniGUIApplication;

procedure CheckShipmentsExists( AOrder_ID: Real );
var
  LFrmShipExistsException : TFrmShipExistsException;
begin
  if SelectValueFmtAsInteger(
    'select 1 from c_ship_hist where orders_id = %f and qtyshipped > 0 and rownum < 2',
    [ AOrder_ID ]) = 0 then
    EXIT;

  LFrmShipExistsException := TFrmShipExistsException.Create(UniGUIApplication.UniApplication);
  with LFrmShipExistsException do
  begin
    rcusto_ID := AOrder_ID;
    if not (ShowModal = mrOK) then
       raise TIQNotAuthorizedException.Create;
  end;
end;


end.
