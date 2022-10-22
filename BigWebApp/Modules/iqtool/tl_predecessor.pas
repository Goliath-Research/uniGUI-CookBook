unit tl_predecessor;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Search,
  DM_TL,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniDBNavigator, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, IQUniGrid, uniGUIFrame, Vcl.Controls;

type
  TFrmTLPredecessor = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    SrcPredecessors: TDataSource;
    QryPredecessors: TFDQuery;
    QryPredecessorsID: TBCDField;
    QryPredecessorsPREDECESSOR_ID: TBCDField;
    QryPredecessorsTASKNO: TStringField;
    QryPredecessorsNAME: TStringField;
    QryPredecessorsOUTLINENUMBER: TStringField;
    QryPredecessorsSTARTDATE: TDateTimeField;
    QryPredecessorsFINISHDATE: TDateTimeField;
    PnlCarrier: TUniPanel;
    PnlToolbar: TUniPanel;
    NavMain: TUniDBNavigator;
    PnlGrid: TUniPanel;
    Grid: TIQUniGridControl;
    procedure QryPredecessorsBeforeOpen(DataSet: TDataSet);
    procedure QryPredecessorsBeforeDelete(DataSet: TDataSet);
    procedure QryPredecessorsBeforeInsert(DataSet: TDataSet);
    procedure QryPredecessorsUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

    procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
    FID: Real;
    procedure RefreshData;
    procedure SetID(const Value: Real);
  public
    { Public declarations }
    DM: TTooling_DM;
    constructor Create(const AOwner: TComponent; AID: Real);
    property ToolTaskInformationID: Real read FID write SetID;
  end;

var
  FrmTLPredecessor: TFrmTLPredecessor;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs;

{ TFrmTLPredecessor }

constructor TFrmTLPredecessor.Create(const AOwner: TComponent; AID: Real);
begin
  DM := TTooling_DM.Create(Self);
  inherited Create(AOwner);
  DM.Name := '';
  ToolTaskInformationID := AID;
end;

procedure TFrmTLPredecessor.QryPredecessorsBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', FID);
end;

procedure TFrmTLPredecessor.QryPredecessorsBeforeDelete(DataSet: TDataSet);
var
   AID: Real;
begin
  AID := QryPredecessorsID.AsFloat;
  if AID > 0 then
     try
        QryPredecessors.DisableControls;
        QryPredecessors.Prior;
        ExecuteCommandFmt('DELETE FROM tool_predecessor WHERE id = %.0f',
         [AID]);
        RefreshData;
     finally
        QryPredecessors.EnableControls;
     end;
  System.SysUtils.Abort;
end;

procedure TFrmTLPredecessor.RefreshData;
begin
  RefreshDataSetByID(QryPredecessors);
end;

procedure TFrmTLPredecessor.QryPredecessorsBeforeInsert(DataSet: TDataSet);
var
   ANewID, APredecessorID: Real;
begin
  with DM.PkTaskInformation do
   if Execute then
      try
         QryPredecessors.DisableControls;
         ANewID := GetNextID('TOOL_PREDECESSOR');
         APredecessorID := GetValue('ID');
         ExecuteCommandFmt(
          'BEGIN '#13 +
          ' iqms.project_predecessor.add_predecessor(%.0f, %.0f, %.0f); '#13 +
          'END;',
          [ANewID, FID, APredecessorID]);
         QryPredecessors.Locate('ID', ANewID, []);
      finally
         QryPredecessors.EnableControls;
      end;
  System.SysUtils.Abort;
end;

procedure TFrmTLPredecessor.SetID(const Value: Real);
begin
  FID := Value;
  ReOpen(QryPredecessors);
end;

procedure TFrmTLPredecessor.QryPredecessorsUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

begin
  AAction := eaApplied;
end;

procedure TFrmTLPredecessor.NavMainBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
     begin
       RefreshDataSetByID(QryPredecessors);
       System.SysUtils.Abort;
     end;
end;

end.
