unit ps_tracking_req_chk;

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
  UniGUIApplication,
  System.Classes, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, uniGUIBaseClasses;

type
  TFrmTrackingRequiredException = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckTrackingRequired(AShipments_ID: Real);

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;

procedure CheckTrackingRequired(AShipments_ID: Real);
var
  LFrmTrackingRequiredException : TFrmTrackingRequiredException;
begin
  if SelectValueFmtAsFloat(
    'select 1 from shipments s, arcusto a ' +
    'where s.id = %f and s.arcusto_id = a.id and ' +
    'a.tracking_required = ''Y'' and rtrim(s.tracking_num) is null',
    [AShipments_ID]) = 0 then
    EXIT;

  LFrmTrackingRequiredException := TFrmTrackingRequiredException.Create(UniGUIApplication.UniApplication);
  if not (LFrmTrackingRequiredException.ShowModal = mrOK) then
    raise TIQNotAuthorizedException.Create;
end;

end.
