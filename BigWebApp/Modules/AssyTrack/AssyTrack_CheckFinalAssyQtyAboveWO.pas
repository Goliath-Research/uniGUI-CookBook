unit AssyTrack_CheckFinalAssyQtyAboveWO;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  Mask,
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
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, uniGUIBaseClasses,UniGUIApplication;

type
  TFrmAssyTrackChkFinalAssyAbovWO = class(TFrmStatusException)
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShowModal( AWorkorder_ID, AThisTransGoodParts: Real );
  end;

implementation

{$R *.dfm}

uses
  //AssyTrack_Main,  { TODO : Dependency }
  IQMS.Common.DataLib;

{ TFrmAssyTrackChkFinalAssyAbovWO }
class procedure TFrmAssyTrackChkFinalAssyAbovWO.DoShowModal(AWorkorder_ID,  AThisTransGoodParts: Real);
var
  ATotalGoodParts: Real;
  APtorder_ID: Real;
  AQtySinceSched: Real;
  LFrmAssyTrackChkFinalAssyAbovWO :TFrmAssyTrackChkFinalAssyAbovWO;
begin
LFrmAssyTrackChkFinalAssyAbovWO := TFrmAssyTrackChkFinalAssyAbovWO.Create(UniGUIApplication.UniApplication);
  APtorder_ID   := SelectValueFmtAsFloat('select id from ptorder where workorder_id = %f', [ AWorkorder_ID ]);
  AQtySinceSched:= SelectValueFmtAsFloat('select qty_since_sched from ptorder where workorder_id = %f', [ AWorkorder_ID ]);

  //ATotalGoodParts:= TFrmAssyTrackMain.CalcWorkOrderQty( APtorder_ID, AQtySinceSched );
  if ATotalGoodParts >= AThisTransGoodParts then
     EXIT;


  with LFrmAssyTrackChkFinalAssyAbovWO do
  begin
    if not (ShowModal = mrOK) then
       //raise Exception.Create('Status exception has not been authorized - unable to proceed');
       raise TIQNotAuthorizedException.Create;
  end;
end;


end.
