unit tl_whiteboard_drilldown;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  FireDAC.Comp.Client,
  IQMS.Common.JumpConstants,
  IQMS.WebVcl.Search,
  FireDAC.UI.Intf,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, IQUniGrid,
  uniGUIFrame, Vcl.Controls;

type
  { TFrmToolingWhiteboardDrillDown }
  TFrmToolingWhiteboardDrillDown = class(TUniForm)
    SrcData: TDataSource;
    QryData: TFDQuery;
    PnlGrid: TUniPanel;
    IQSearch1: TIQUniGridControl;
    QryDataTOOL_RFQ_ID: TBCDField;
    QryDataRFQ: TStringField;
    QryDataPROJECT: TStringField;
    QryDataTOOL_TASK_INFORMATION_ID: TBCDField;
    QryDataTASK_NAME: TStringField;
    QryDataTASK_STARTDATE: TDateTimeField;
    QryDataTASK_FINISHDATE: TDateTimeField;
    QryDataDURATION_DISPLAY: TStringField;
    QryDataPR_EMP_ID: TBCDField;
    QryDataPERCENTAGE: TBCDField;
    QryDataEMPNO: TStringField;
    QryDataFIRST_NAME: TStringField;
    QryDataLAST_NAME: TStringField;
    procedure FormShow(Sender: TObject);
    procedure QryDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FTAShiftID: Int64;
    FPrEmpID: Int64;
    FStartDate,
    FEndDate: TDateTime;
    procedure IQAfterShowMessage(var Msg: TMessage); message iq_AfterShowMessage;
    procedure SetPrEmpID(const Value: Int64);
    procedure SetTAShiftID(const Value: Int64);
    procedure SetEndDate(const Value: TDateTime);
    procedure SetStartDate(const Value: TDateTime);
  public
    { Public declarations }
    class procedure DoShow(APrEmpID, ATAShiftID: Int64;
      AStartDate, AEndDate: TDateTime);
    procedure RefreshData;
    property PrEmpID: Int64 read FPrEmpID write SetPrEmpID;
    property TAShiftID: Int64 read FTAShiftID write SetTAShiftID;
    property StartDate: TDateTime read FStartDate write SetStartDate;
    property EndDate: TDateTime read FEndDate write SetEndDate;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

class procedure TFrmToolingWhiteboardDrillDown.DoShow(APrEmpID, ATAShiftID: Int64; AStartDate, AEndDate: TDateTime);
var
  LFrmToolingWhiteboardDrillDown : TFrmToolingWhiteboardDrillDown;
  i: Integer;

begin
{ TODO -oGPatil -cWebConvert : Incompatible types: 'TForm' and 'TFrmToolingWhiteboardDrillDown'
  for i := 0 to Screen.FormCount - 1 do
    if (Screen.Forms[i] is TFrmToolingWhiteboardDrillDown) and
      (TFrmToolingWhiteboardDrillDown(Screen.Forms[i]).PrEmpID = APrEmpID) and
      (TFrmToolingWhiteboardDrillDown(Screen.Forms[i]).TAShiftID = ATAShiftID) and
      (TFrmToolingWhiteboardDrillDown(Screen.Forms[i]).StartDate = AStartDate) and
      (TFrmToolingWhiteboardDrillDown(Screen.Forms[i]).EndDate = AEndDate) then
      begin
        TFrmToolingWhiteboardDrillDown(Screen.Forms[i]).RefreshData;
        Screen.Forms[i].Show;
        Exit;
      end;  }
  LFrmToolingWhiteboardDrillDown := TFrmToolingWhiteboardDrillDown.Create(UniGUIApplication.UniApplication);
  LFrmToolingWhiteboardDrillDown.PrEmpID := APrEmpID;
  LFrmToolingWhiteboardDrillDown.TAShiftID := ATAShiftID;
  LFrmToolingWhiteboardDrillDown.StartDate := AStartDate;
  LFrmToolingWhiteboardDrillDown.EndDate := AEndDate;
  LFrmToolingWhiteboardDrillDown.RefreshData;
  LFrmToolingWhiteboardDrillDown.Show;
end;

procedure TFrmToolingWhiteboardDrillDown.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self]);
  PostMessage(Handle, iq_AfterShowMessage, 0, 0);
end;

procedure TFrmToolingWhiteboardDrillDown.IQAfterShowMessage(var Msg: TMessage);
begin
  Application.ProcessMessages;
  ForceForegroundWindowB(Application.Handle);
  Self.BringToFront;
end;

procedure TFrmToolingWhiteboardDrillDown.QryDataBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'PR_EMP_ID', FPrEmpID);
  AssignQueryParamValue(DataSet, 'TA_SHIFT_ID', FTAShiftID);
  AssignQueryParamValue(DataSet, 'START_DATE', FStartDate);
  AssignQueryParamValue(DataSet, 'END_DATE', FEndDate);
end;

procedure TFrmToolingWhiteboardDrillDown.RefreshData;
begin
  ReOpen(QryData);
end;

procedure TFrmToolingWhiteboardDrillDown.SetEndDate(const Value: TDateTime);
begin
  FEndDate := Value;
end;

procedure TFrmToolingWhiteboardDrillDown.SetPrEmpID(const Value: Int64);
begin
  FPrEmpID := Value;
end;

procedure TFrmToolingWhiteboardDrillDown.SetStartDate(const Value: TDateTime);
begin
  FStartDate := Value;
end;

procedure TFrmToolingWhiteboardDrillDown.SetTAShiftID(const Value: Int64);
begin
  FTAShiftID := Value;
end;

end.
