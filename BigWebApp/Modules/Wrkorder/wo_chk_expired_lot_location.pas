unit wo_chk_expired_lot_location;

interface

uses
  Winapi.Windows,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  IQMS.WebVcl.SecurityRegister, Data.DB, uniButton, uniCheckBox, uniPanel,UniGuiApplication,
  uniGUIClasses, uniEdit, uniDBEdit, uniLabel, uniPageControl, System.Classes,
  uniGUIBaseClasses;

type
  TFrmLotExpiredException = class(TFrmStatusException)
  private
    { Private declarations }
    procedure PrepareQuery( AID: Real ); override;
  public
    { Public declarations }
  end;

procedure CheckExpiredLotLocation(const AFGMulti_ID: Int64);

resourcestring
  cRsc_001 = 'Lot location expired.';


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;

procedure CheckExpiredLotLocation(const AFGMulti_ID: Int64);
var
   LFrmLotExpiredException : TFrmLotExpiredException;
begin
  if SelectValueFmtAsInteger(
    'select iqms.arinvt_misc.is_lot_expired(arinvt_id, lotno) from fgmulti where id = %d',
    [AFGMulti_ID]) = 1 then
    begin
       LFrmLotExpiredException := TFrmLotExpiredException.create(UniGuiApplication.UniApplication);
       LFrmLotExpiredException.rcusto_ID:= AFGMulti_ID;
      if not (LFrmLotExpiredException.ShowModal = mrOK) then
         raise TIQNotAuthorizedException.Create;
    end;



    {
    with TFrmLotExpiredException.Create(Application, AFGMulti_ID) do
      try
        if not (ShowModal = mrOK) then
          raise TIQNotAuthorizedException.Create;
      finally
        Release;
      end;
    }


end;

procedure TFrmLotExpiredException.PrepareQuery(AID: Real);
begin
  Query1.Close;
  AssignQueryParamValue(Query1, 'ID', Trunc(AID));
  AssignQueryParamValue(Query1, 'MESSAGE_TEXT', cRsc_001);
  Query1.Open;
end;

end.
