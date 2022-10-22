unit NoShipChk;

interface

uses
  Winapi.Windows,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  NonConfChk,
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
  System.Classes, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, uniGUIBaseClasses;

type
  TFrmNoShipException = class(TFrmNonConformException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckLocationForNoShip(AFGMulti_ID: Real);


implementation

{$R *.dfm}


uses
  IQMS.Common.DataLib,
  uniGUIApplication;

procedure CheckLocationForNoShip(AFGMulti_ID: Real);
var
  LFrmNoShipException : TFrmNoShipException;
begin
  if SelectValueFmtAsString(
    'select nvl(nvl(f.no_ship, l.no_ship), ''N'') ' +
    'from fgmulti f, locations l where f.id = %f and f.loc_id = l.id',
    [AFGMulti_ID]) = 'Y' then
    begin
      LFrmNoShipException := TFrmNoShipException.Create(uniGUIApplication.UniApplication);
      with LFrmNoShipException do
      begin
        rcusto_ID := AFGMulti_ID;
        if not (ShowModal = mrOK) then
          raise TIQNotAuthorizedException.Create;
      end;
    end;
end;

end.
