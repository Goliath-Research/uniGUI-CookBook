unit SchdRunsBestChk;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.SecurityRegister, Data.DB,
  uniButton, uniCheckBox, uniPanel, uniPageControl;

type
  TFrmSchedWorkCenterRunsBestException = class(TFrmStatusException)
    Label4: TUniLabel;
    DBEdit4: TUniDBEdit;
  private
    FWork_Center_ID: Real;
    FWorkorder_ID  : Real;
    FSndop_Dispatch_ID: Real;
    procedure SetSndop_Dispatch_ID(const Value: Real);
    procedure SetWork_Center_ID(const Value: Real);
    procedure SetWorkorder_ID(const Value: Real);
  protected
    procedure PrepareQuery( AID: Real {not used}); override;
  public
    property Work_Center_ID: Real write SetWork_Center_ID;
    property Workorder_ID: Real write SetWorkorder_ID;
    property Sndop_Dispatch_ID: Real write SetSndop_Dispatch_ID;
  end;

procedure CheckWorkCenterInRunsTheBest( AWork_Center_ID, AWorkorder_ID: Real; ASndop_Dispatch_ID: Real = 0 );

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  uniGUIApplication;

procedure CheckWorkCenterInRunsTheBest( AWork_Center_ID, AWorkorder_ID: Real; ASndop_Dispatch_ID: Real = 0 );
var
  AIsFound: Boolean;
  AIsAuthorized: Boolean;
  frm : TFrmSchedWorkCenterRunsBestException;
begin
  if (AWorkorder_ID = 0) and (ASndop_Dispatch_ID = 0) then
     EXIT;

  if SelectValueAsString('select sched_chk_runsbest_on_insert from params') <> 'Y' then
     EXIT;

  if ASndop_Dispatch_ID = 0 then
     AIsFound:= SelectValueFmtAsFloat('select 1                                                      '+
                          '  from workorder w,                                           '+
                          '       runs_best b                                            '+
                          ' where                                                        '+
                          '       w.id = %f                                              '+
                          '   and w.standard_id = b.standard_id                          '+
                          '   and NVL( b.work_center_id_act, b.work_center_id_calc ) = %f',
                          [ AWorkorder_ID, AWork_Center_ID ]) = 1
  else
     AIsFound:= SelectValueFmtAsFloat('select 1                                                      '+
                          '  from sndop_dispatch s,                                      '+
                          '       sndop_runs_best b                                      '+
                          ' where                                                        '+
                          '       s.id = %f                                              '+
                          '   and s.sndop_id = b.sndop_id                                '+
                          '   and NVL( b.work_center_id_act, b.work_center_id_calc ) = %f',
                          [ ASndop_Dispatch_ID, AWork_Center_ID ]) = 1;
  if AIsFound then
     EXIT;

  frm := TFrmSchedWorkCenterRunsBestException.Create( UniApplication );

  frm.Work_Center_ID := AWork_Center_ID;
  frm.Workorder_ID := AWorkorder_ID;
  frm.Sndop_Dispatch_ID := ASndop_Dispatch_ID;
  frm.rcusto_ID := -1;

  AIsAuthorized:= frm.ShowModal = mrOK;

  if not AIsAuthorized then
     raise TIQNotAuthorizedException.Create;
end;

procedure TFrmSchedWorkCenterRunsBestException.PrepareQuery( AID: Real {not used});
begin
  // inherited;
  Query1.Close;
  AssignQueryParamValue(Query1, 'workorder_id', FWorkorder_ID);
  AssignQueryParamValue(Query1, 'work_center_id', FWork_Center_ID);
end;

procedure TFrmSchedWorkCenterRunsBestException.SetSndop_Dispatch_ID(
  const Value: Real);
begin
  FSndop_Dispatch_ID := Value;
end;

procedure TFrmSchedWorkCenterRunsBestException.SetWorkorder_ID(
  const Value: Real);
begin
  FWorkorder_ID := Value;
end;

procedure TFrmSchedWorkCenterRunsBestException.SetWork_Center_ID(
  const Value: Real);
begin
  FWork_Center_ID := Value;
end;

end.

