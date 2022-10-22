unit AssyTrack_CheckTotalAboveWO;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  Mask,
  FireDAC.Comp.Client,
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
  Data.DB, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit, uniDBEdit,
  uniLabel, uniPageControl, uniGUIBaseClasses,UniGUIApplication;

type
  TFrmAssyTrackCheckAboveException = class(TFrmStatusException)
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
    //constructor Create(AOwner:TComponent; AWorkorder_ID, ASndop_ID, APtoper_ID :Real );
    class procedure DoShowModal( AWorkorder_ID, ASndOp_ID, APtoper_ID,
      APartno_ID, AThisTransGoodParts: Real );
      Property Workorder_ID :Real write SetWorkorder_ID;
      property Sndop_ID :Real write SetSndop_ID;
      property Ptoper_ID:Real write SetPtoper_ID;
  end;


implementation

{$R *.dfm}

uses
  //assy_share,AssyTrack_Main { TODO : Dependency }
  IQMS.Common.DataLib
  ;

{ TFrmAssyTrackCheckAboveException }
class procedure TFrmAssyTrackCheckAboveException.DoShowModal(AWorkorder_ID,
  ASndOp_ID, APtoper_ID, APartno_ID, AThisTransGoodParts: Real);
var
  ATotalGoodParts  : Real;
  AOutstandingParts: Real;
  APtOrder_ID      : Real;
  LFrmAssyTrackCheckAboveException : TFrmAssyTrackCheckAboveException;
begin
  // APtOrder_ID:= SelectValueFmtAsFloat('select id from ptorder where workorder_id = %f', [ AWorkorder_ID ]);
   { TODO : Dependency }
//  if assy_share.IsUsePercentComplete( AWorkorder_ID ) then
//     ATotalGoodParts:= TFrmAssyTrackMain.CalcWorkOrderOrigQtyEx( AWorkorder_ID ) * AThisTransGoodParts / 100
//  else
//     ATotalGoodParts:= assy_share.get_process_total_good_parts( AWorkorder_ID, APtoper_ID ) + AThisTransGoodParts;
//
//  AOutstandingParts:= assy_share.get_outstanding_workorder_parts( AWorkorder_ID, APartno_ID );

  if ATotalGoodParts <= AOutstandingParts then
     EXIT;
  LFrmAssyTrackCheckAboveException := TFrmAssyTrackCheckAboveException.Create(UniGUIApplication.UniApplication);
  with LFrmAssyTrackCheckAboveException do
  Begin
    FOpNo:= SelectValueByID('opno', 'sndop', ASndop_ID );
    FPtoper_ID:= APtoper_ID;
    if not (ShowModal = mrOK) then
       //raise Exception.Create('Status exception has not been authorized - unable to proceed');
       raise TIQNotAuthorizedException.Create;
  end;
end;

procedure TFrmAssyTrackCheckAboveException.PrepareQuery(AID: Real);
begin
  inherited;

  with Query1 do
    ParamByName('opno').asString:= FOpno;
end;

procedure TFrmAssyTrackCheckAboveException.SetPtoper_ID(const Value: Real);
begin
  FPtoper_ID := Value;
end;

procedure TFrmAssyTrackCheckAboveException.SetSndop_ID(const Value: Real);
begin
  FSndop_ID := Value;
end;

procedure TFrmAssyTrackCheckAboveException.SetWorkorder_ID(const Value: Real);
begin
  FWorkorder_ID := Value;
end;

end.
