unit spc_gage_child_base;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

type
  TFrmSPCGageChildBase = class(TUniForm)
    PnlCarrier: TUniPanel;
    procedure DoApplyUpdates(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FDataSource: TDataSource;
    FSavedDataChange: TDataChangeEvent;
    procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;
    procedure IQRefreshDataSets( var Msg: TMessage ); message iq_RefreshDataSets;
  protected
    { Protected declarations }
    procedure RefreshData; virtual; abstract;
    procedure PostParentDataSet;
    procedure SetDataSource(const Value: TDataSource); virtual;
    function SPCDeviceID: Int64;
    procedure DoDataChange(Sender: TObject; Field: TField); virtual;
  public
    { Public declarations }
    //constructor Create(AOwner: TComponent; ADataSource: TDataSource); dynamic;
    procedure AfterShow; virtual;
  published
    { Published declarations }
    property DataSource: TDataSource read FDataSource write SetDataSource;
  end;

type
  TSPCGageChildClass = class of TFrmSPCGageChildBase;


implementation

{$R *.dfm}

{ TFrmSPCGageChildBase }
(*
constructor TFrmSPCGageChildBase.Create(AOwner: TComponent;
  ADataSource: TDataSource);
begin
  inherited Create(AOwner);

  // Parent datasource is required.  This is the gage/device (SPC_DEVICE)
  // datasource owned by the spc_gage form.
  if not Assigned(ADataSource) then
     raise Exception.Create('Application Error: Parent datasource undefined.');

  // Assign private variable.
  DataSource := ADataSource;

  // Refresh datasets
  RefreshData;

  // Post "after show" message.  This message calls the AfterShow procedure,
  // which can be different among the descendent form System.Classes.
  PostMessage( Handle, iq_AfterShowMessage, 0, 0 );

end;
*)

procedure TFrmSPCGageChildBase.IQAfterShowMessage(var Msg: TMessage);
begin
  // Call after show method.  This method is protected, and may be
  // overridden by descendent form System.Classes.
  AfterShow;
end;

procedure TFrmSPCGageChildBase.IQRefreshDataSets(var Msg: TMessage);
begin
  // Refreshes local datasets
  RefreshData;
end;

procedure TFrmSPCGageChildBase.AfterShow;
begin
  // After show System.Actions.  This method can be overridden by descendent
  // form System.Classes.  Some events can only be executed after the form
  // has finished displaying.  To view which actions are executed,
  // check the AfterShow event in the descendent form unit.  By default,
  // this method is called; so, if AfterShow is not overridden by the
  // descendent, then nothing happens.
end;

procedure TFrmSPCGageChildBase.SetDataSource(const Value: TDataSource);
begin
  // Property method to set the data source.  This is the default action,
  // below:  set the private variable.  But this procedure can also be
  // overridden by descendent form classes so that the MasterSource of
  // local datasets is also set.  The parent dataset must point to the
  // table, SPC_DEVICE.
  FDataSource := Value;
  FSavedDataChange := Value.OnDataChange;
  Value.OnDataChange := DoDataChange;
end;

procedure TFrmSPCGageChildBase.PostParentDataSet;
begin
  // Verify objects exist.  This should never happen.  If it does,
  // then something went wrong.
  if not Assigned(FDataSource) or
     not Assigned(FDataSource.DataSet) then
     Exit;

  // Post the parent dataset (SPC_DEVICE).
  if (FDataSource.DataSet.State in [dsEdit,dsInsert]) then
     FDataSource.DataSet.Post;
end;

procedure TFrmSPCGageChildBase.DoApplyUpdates(DataSet: TDataSet);
begin
  // Generic event to apply cached updates.  This event is available
  // to query objects in descendent form System.Classes.
  with DataSet as TFDRDBMSDataSet do
  begin
    ApplyUpdates;
    CommitUpdates;
  end;
end;

procedure TFrmSPCGageChildBase.DoDataChange(Sender: TObject; Field: TField);
begin
  if Assigned(FSavedDataChange) then
    FSavedDataChange(Sender, Field);
end;

function TFrmSPCGageChildBase.SPCDeviceID: Int64;
begin
  // Returns the parent ID (SPC_DEVICE.ID)
  Result := 0;
  if Assigned(FDataSource) and Assigned(FDataSource.DataSet) then
     Result := FDataSource.DataSet.FieldByName('ID').AsLargeInt;
end;

procedure TFrmSPCGageChildBase.UniFormCreate(Sender: TObject);
begin
     inherited;

  // Parent datasource is required.  This is the gage/device (SPC_DEVICE)
  // datasource owned by the spc_gage form.


  // Refresh datasets
  RefreshData;

  // Post "after show" message.  This message calls the AfterShow procedure,
  // which can be different among the descendent form System.Classes.
  //PostMessage( Handle, iq_AfterShowMessage, 0, 0 );

end;

end.
