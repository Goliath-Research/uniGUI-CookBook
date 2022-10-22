unit AssyTrack_BOM_Details;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.wwDataInspector,
  Data.DB,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  MainModule,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, Vcl.Grids;

type
  TFrmAssyTrack_BomDetails = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    SrcProcessInfo: TDataSource;
    QryProcessInfo: TFDQuery;
    QryProcessInfoOPNO: TStringField;
    QryProcessInfoOPDESC: TStringField;
    QryProcessInfoOPSEQ: TBCDField;
    QryProcessInfoWORKORDER_ID: TFMTBCDField;
    QryProcessInfoITEMNO: TStringField;
    QryProcessInfoDESCRIP: TStringField;
    QryProcessInfoCLASS: TStringField;
    QryProcessInfoREV: TStringField;
    QryProcessInfoDESCRIP2: TStringField;
    QryProcessInfoOVERLAP_PROCESS: TStringField;
    QryProcessInfoMULTIPLES: TBCDField;
    QryProcessInfoUOM: TStringField;
    QryProcessInfoCYCLETM_DISP: TBCDField;
    QryProcessInfoSCRAP_DISP: TBCDField;
    UpdateSQLPtOper: TFDUpdateSQL;
    QryProcessInfoROWID: TStringField;
    QryProcessInfoMOVE_SIZE: TFMTBCDField;
    QryProcessInfoMOVE_TIME: TFMTBCDField;
    UpdateSQLSndOp: TFDUpdateSQL;
    QryProcessInfoSETUPHRS: TBCDField;
    QryProcessInfoSETUPHRS2: TBCDField;
    QryProcessInfoID: TBCDField;
    wwDataInspector1: TwwDataInspector;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryProcessInfoBeforeOpen(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure QryProcessInfoUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FWorkorder_ID: Real;
    FPartno_ID   : Real;
    FSndop_ID    : Real;
    FPtoper_ID   : Real;
    procedure SetPartno_ID(const Value: Real);
    procedure SetPtoper_ID(const Value: Real);
    procedure SetSndop_ID(const Value: Real);
    procedure SetWorkorder_ID(const Value: Real);
  public
    { Public declarations }
    property Workorder_ID : Real write SetWorkorder_ID;
    property Partno_ID : Real write SetPartno_ID;
    property Sndop_ID : Real write SetSndop_ID;
    property Ptoper_ID : Real write SetPtoper_ID;
    class procedure DoShowModal(AWorkorder_ID, APartno_ID, ASndop_ID, APtoper_ID: Real);
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs;


{ TFrmAssyTrack_BomDetails }

class procedure TFrmAssyTrack_BomDetails.DoShowModal(AWorkorder_ID, APartno_ID, ASndop_ID, APtoper_ID: Real);
var
  LFrmAssyTrack_BomDetails : TFrmAssyTrack_BomDetails;
begin
  LFrmAssyTrack_BomDetails := TFrmAssyTrack_BomDetails.Create( UniGUIApplication.UniApplication );
  with LFrmAssyTrack_BomDetails do
  begin
    Workorder_ID:= AWorkorder_ID;
    Partno_ID   := APartno_ID;
    Sndop_ID    := ASndop_ID;
    Ptoper_ID   := APtoper_ID;
    ShowModal;
  end;
end;

procedure TFrmAssyTrack_BomDetails.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmAssyTrack_BomDetails.QryProcessInfoBeforeOpen(DataSet: TDataSet);
begin
  //with DataSet as TFDQuery do
  //begin
  //  ParamByName('workorder_id').Value := FWorkorder_ID;
  //  ParamByName('partno_id').Value := FPartno_ID;
  //  ParamByName('sndop_id').Value := FSndop_ID;
  //  ParamByName('ptoper_id').Value := FPtoper_ID;
  //end;
  AssignQueryParamValue(DataSet, 'workorder_id', FWorkorder_ID );
  AssignQueryParamValue(DataSet, 'partno_id',    FPartno_ID );
  AssignQueryParamValue(DataSet, 'sndop_id',     FSndop_ID );
  AssignQueryParamValue(DataSet, 'ptoper_id',    FPtoper_ID );
end;

procedure TFrmAssyTrack_BomDetails.btnOKClick(Sender: TObject);
begin
  if QryProcessInfo.State = dsEdit then
     QryProcessInfo.Post;
  ModalResult:= mrOK;
end;

procedure TFrmAssyTrack_BomDetails.btnCancelClick(Sender: TObject);
begin
  if (QryProcessInfo.State = dsEdit) and IQConfirmYN('Save changes before exiting?') then
    QryProcessInfo.Post;

  ModalResult:= mrCancel;
end;

procedure TFrmAssyTrack_BomDetails.QryProcessInfoUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  if ARequest = arUpdate then
  begin
    UpdateSQLPtOper.DataSet:= QryProcessInfo;
    UpdateSQLPtOper.Apply(ARequest, AAction, AOptions);

    UpdateSQLSndOp.DataSet:= QryProcessInfo;
    UpdateSQLSndOp.Apply(ARequest, AAction, AOptions);
  end;
  AAction := eaApplied;
end;


procedure TFrmAssyTrack_BomDetails.SetPartno_ID(const Value: Real);
begin
  FPartno_ID := Value;
end;

procedure TFrmAssyTrack_BomDetails.SetPtoper_ID(const Value: Real);
begin
  FPtoper_ID := Value;
end;

procedure TFrmAssyTrack_BomDetails.SetSndop_ID(const Value: Real);
begin
  FSndop_ID := Value;
end;

procedure TFrmAssyTrack_BomDetails.SetWorkorder_ID(const Value: Real);
begin
  FWorkorder_ID := Value;
end;

procedure TFrmAssyTrack_BomDetails.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead(self, [ self ]);
end;

end.
