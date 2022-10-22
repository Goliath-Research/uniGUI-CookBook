unit pm_select_equp;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Search,
  Vcl.Buttons,
  IQMS.WebVcl.LargeOptionControls,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  MainModule,
  Vcl.DBCtrls, // TNavigateBtn
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, IQUniGrid, uniGUIFrame;

type
  { TAddMROTaskOption }
  TAddMROTaskOption = (mroAddMisc, mroAddJobTask, mroShowExisting);

  { TAddMROTaskSelection }
  TAddMROTaskSelection = packed record
    PMEQMT_ID: Integer;
    Option: TAddMROTaskOption;
  end;

  { TFrmPmSelectEquip }
  TFrmPmSelectEquip = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    Panel1: TUniPanel;
    SrcData: TDataSource;
    QryDataAssoc: TFDQuery;
    QryDataAssocID: TBCDField;
    QryDataAssocEQNO: TStringField;
    QryDataAssocDESCRIP: TStringField;
    QryDataAssocCLASS: TStringField;
    Grid: TIQUniGridControl;
    QryDataAll: TFDQuery;
    QryDataAllID: TBCDField;
    QryDataAllEQNO: TStringField;
    QryDataAllDESCRIP: TStringField;
    QryDataAllCLASS: TStringField;
    chkShowExistingWorkOrders: TUniCheckBox;
    PnlToolbar: TUniPanel;
    sbtnMisc: TUniSpeedButton;
    procedure QryDataAssocBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridUserBtn1OnClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure NavBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure chkShowExistingWorkOrdersTouchScreenClick(Sender: TObject);
    procedure EmptyUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FStandardID, FWorkCenterID: Real;
    FShowAll: Boolean;
    procedure RefreshData;
    { TODO -oLema : Dependent on touchscrn }
    // procedure ApplyTouchScreen;
    function GetID: Int64;
    function GetOption: TAddMROTaskOption;
    // function GetShowWorkOrders: Boolean;
    procedure SetStandardID(const Value: Real);
    procedure SetWorkCenterID(const Value: Real);
  public
    { Public declarations }

    property StandardID: Real write SetStandardID;
    property WorkCenterID: Real write SetWorkCenterID;
    property PMEquipmentID: Int64 read GetID;
    // property ShowExistingWorkOrders: Boolean read GetShowWorkOrders;
    property SelectedOption: TAddMROTaskOption read GetOption;
  end;

  // function DoSelectEquipment(AOwner: TComponent; AStandardID, AWorkCenterID: Real;
  // var APMEqmtID: Real; var AShowExistingWorkOrders: Boolean): Boolean;
function DoSelectEquipment(AStandardID, AWorkCenterID: Real; var ASelection: TAddMROTaskSelection): Boolean;

implementation

{$R *.dfm}

uses
  IQMS.Common.ApplicationSet,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.Screen,
  pm_rscstr;
{ TODO -oLema : Dependent on touchscrn }
// touchscrn;

function DoSelectEquipment(AStandardID, AWorkCenterID: Real; var ASelection: TAddMROTaskSelection): Boolean;
var
  frm: TFrmPmSelectEquip;
begin
  ASelection.PMEQMT_ID := 0;
  ASelection.Option := TAddMROTaskOption(0);

  frm := TFrmPmSelectEquip.Create(uniGUIApplication.UniApplication);
  frm.StandardID := AStandardID;
  frm.WorkCenterID := AWorkCenterID;

  Result := (frm.ShowModal = mrOk);
  if Result then
  begin
    ASelection.PMEQMT_ID := frm.PMEquipmentID;
    ASelection.Option := frm.SelectedOption;
  end;

end;

{$REGION 'TFrmPmSelectEquip'}

procedure TFrmPmSelectEquip.UniFormCreate(Sender: TObject);
begin
  FShowAll := False;
end;

procedure TFrmPmSelectEquip.UniFormShow(Sender: TObject);
begin
  RefreshData;

  if IQMS.Common.ApplicationSet.IsTouchScreen then
  begin
    // ApplyTouchScreen;
  end
  else
  begin
    IQMS.Common.Screen.ApplySystemFont(Self);
    IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, sbtnMisc]);
  end;

  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlButtons);

end;

procedure TFrmPmSelectEquip.EmptyUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  AAction := eaExitFailure;
end;

procedure TFrmPmSelectEquip.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Action := caFree;
  if not IQMS.Common.ApplicationSet.IsTouchScreen then
    IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self, sbtnMisc]);
end;

function TFrmPmSelectEquip.GetID: Int64;
begin
  Result := SrcData.DataSet.FieldByName('ID').AsLargeInt;
end;

function TFrmPmSelectEquip.GetOption: TAddMROTaskOption;
begin
  // 05/13/2014
  if PnlToolbar.Visible and sbtnMisc.Down then
    Result := mroAddMisc
  else if chkShowExistingWorkOrders.Visible and chkShowExistingWorkOrders.Checked then
    Result := mroShowExisting
//  else if chkShowExistingWorkOrdersTouchScreen.Visible and chkShowExistingWorkOrdersTouchScreen.Checked then
//    Result := mroShowExisting
  else
    Result := mroAddJobTask;
end;

procedure TFrmPmSelectEquip.GridUserBtn1OnClick(Sender: TObject);
begin
  Application.ProcessMessages;
  FShowAll := not FShowAll;
  RefreshData;
end;

procedure TFrmPmSelectEquip.NavBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    RefreshData;
    System.SysUtils.Abort;
  end;
end;

procedure TFrmPmSelectEquip.QryDataAssocBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'STANDARD_ID', Trunc(FStandardID));
  AssignQueryParamValue(DataSet, 'WORK_CENTER_ID', Trunc(FWorkCenterID));
end;

procedure TFrmPmSelectEquip.RefreshData;
begin
  try
    Grid.Visible := False;
    SrcData.DataSet.Close;
    if FShowAll then
    begin
      SrcData.DataSet := QryDataAll;
      // pm_rscstr.cTXT0000351 = 'Select from All Equipment';
      Self.Caption := pm_rscstr.cTXT0000351;
      // pm_rscstr.cTXT0000353 = 'Showing all equipment.  Click to show associated equipment.';
      // Grid.UserBtn1Hint := pm_rscstr.cTXT0000353;
    end
    else
    begin
      SrcData.DataSet := QryDataAssoc;
      // pm_rscstr.cTXT0000352 = 'Select from Associated Equipment';
      Self.Caption := pm_rscstr.cTXT0000352;
      // pm_rscstr.cTXT0000354 = 'Showing associated equipment.  Click to show all equipment.';
      // Grid.UserBtn1Hint := pm_rscstr.cTXT0000354;
    end;
    SrcData.DataSet.Open;
    // 06/04/2014 Ensure the sort is applied (Byron, for EIQ-3329)
    // Grid.AssignSearchField;
  finally
    Grid.Visible := True;
  end;
end;

procedure TFrmPmSelectEquip.SetStandardID(const Value: Real);
begin
  FStandardID := Value;
end;

procedure TFrmPmSelectEquip.SetWorkCenterID(const Value: Real);
begin
  FWorkCenterID := Value;
end;

{ TODO -oLema : Dependent on touchscrn }
(*
  procedure TFrmPmSelectEquip.ApplyTouchScreen;
  begin
  // Form
  touchscrn.ApplyTouchscreenFont(Self);
  Height := 600;
  Width := 800;
  // Toolbar and controls
  PnlToolbar.Height := 60;
  sbtnMisc.Width := 60;
  sbtnMisc.Height := 60;
  IQMS.Common.Controls.AutoSizeNavBar(Nav);
  // Grid
  Grid.RowHeightPercent := 200;
  // Modal buttons
  PnlButtons.Height := 60;
  btnOk.Width := 120;
  btnOk.Height := 40;
  btnCancel.Width := 120;
  btnCancel.Height := 40;
  btnOk.Left := 0;
  btnOk.Top := 8;
  btnCancel.Left := btnOk.Left + btnOk.Width + 8;
  btnCancel.Top := 8;
  PnlButtonsInner.Width := btnOk.Width + btnCancel.Width + 16;
  // Center the form
  CenterForm(Self, True);
  chkShowExistingWorkOrders.Visible := False;
  chkShowExistingWorkOrdersTouchScreen.Visible := True;
  PnlToolbar.Visible := False;
  sbtnMisc.Down := True;
  end;
*)

procedure TFrmPmSelectEquip.btnOkClick(Sender: TObject);
begin
  // pm_rscstr.cTXT0000355 = 'Please select MRO Equipment.'
  IQMS.Common.Miscellaneous.IQAssert(Self.PMEquipmentID > 0, pm_rscstr.cTXT0000355);
  ModalResult := mrOk;
end;

procedure TFrmPmSelectEquip.chkShowExistingWorkOrdersTouchScreenClick(Sender: TObject);
begin
//  Application.ProcessMessages;
//  chkShowExistingWorkOrders.Checked := chkShowExistingWorkOrdersTouchScreen.Checked;
end;

{$ENDREGION 'TFrmPmSelectEquip'}

end.
