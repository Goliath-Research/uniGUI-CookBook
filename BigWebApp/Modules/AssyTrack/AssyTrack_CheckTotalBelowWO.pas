unit AssyTrack_CheckTotalBelowWO;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
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
  FireDAC.Comp.Client, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, uniGUIBaseClasses, uniGUIApplication;

type
  TFrmAssyTrackCheckBelowException = class(TFrmStatusException)
  private
    { Private declarations }
    FOpno: string;
    FPtoper_ID: Real;
    FWorkorder_ID: Real;
    FSndop_ID: Real;
    procedure SetWorkorder_ID(const Value: Real);
    procedure SetSndop_ID(const Value: Real);
    procedure SetPtoper_ID(const Value: Real);
  protected
    procedure PrepareQuery( AID: Real ); override;
  public
    { Public declarations }
    class procedure DoShowModal( AWorkorder_ID, ASndOp_ID, APtoper_ID,
      APartno_ID, AThisTransGoodParts: Real );
      property Workorder_ID : Real write SetWorkorder_ID;
      property Sndop_ID : Real write SetSndop_ID;
      property Ptoper_ID:Real write SetPtoper_ID;
  end;


implementation

{$R *.dfm}

uses
  //assy_share, { TODO : Dependency }
  IQMS.Common.DataLib;

{ TFrmTotalBelowWoQtyStatusException }
class procedure TFrmAssyTrackCheckBelowException.DoShowModal(AWorkorder_ID,
  ASndOp_ID, APtoper_ID, APartno_ID, AThisTransGoodParts: Real);
var
  ATotalGoodAndRejects: Real;
  AOutstandingParts   : Real;
  LFrmAssyTrackCheckBelowException : TFrmAssyTrackCheckBelowException;
begin
  //ATotalGoodAndRejects:= assy_share.get_process_total_good_and_rejected_parts( AWorkorder_ID, APtoper_ID) + AThisTransGoodParts;
  //AOutstandingParts   := assy_share.get_outstanding_workorder_parts( AWorkorder_ID, APartno_ID );

  if ATotalGoodAndRejects >= AOutstandingParts then
     EXIT;
  LFrmAssyTrackCheckBelowException := TFrmAssyTrackCheckBelowException.Create(UniGUIApplication.UniApplication);

  with LFrmAssyTrackCheckBelowException do
  begin
      FOpNo:= SelectValueByID('opno', 'sndop', ASndop_ID );
      FPtoper_ID:= APtoper_ID;
    if not (ShowModal = mrOK) then
       //raise Exception.Create('Status exception has not been authorized - unable to proceed');
       raise TIQNotAuthorizedException.Create;
  end;
end;


procedure TFrmAssyTrackCheckBelowException.PrepareQuery(AID: Real);
begin
  inherited;

  AssignQueryParamValue(Query1, 'opno', FOpno);
end;

procedure TFrmAssyTrackCheckBelowException.SetPtoper_ID(const Value: Real);
begin
  FPtoper_ID := Value;
end;

procedure TFrmAssyTrackCheckBelowException.SetSndop_ID(const Value: Real);
begin
  FSndop_ID := Value;
end;

procedure TFrmAssyTrackCheckBelowException.SetWorkorder_ID(const Value: Real);
begin
  FWorkorder_ID := Value;
end;

end.
