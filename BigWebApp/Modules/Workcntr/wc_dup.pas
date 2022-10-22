unit wc_dup;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  Vcl.Menus,
  IQMS.WebVcl.Jump,
  //WEBCONVERT IQMS.Common.UserMessages,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniImageList,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniTreeView,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Graphics, uniImage;

type
  TTreeCargo = class
    WORK_CENTER_ID: Real;
    PMEQMT_ID: Real;
    constructor Create(AWorkCenterID, APMEqmtID: Real);
  end;

type
  TFrmWCDupPm = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    PnlPrompt: TUniPanel;
    PnlTreeView: TUniPanel;
    Label1: TUniLabel;
    tv: TUniTreeView;
    btnClose: TUniBitBtn;
    btnViewWorkCenter: TUniBitBtn;
    SrcData: TDataSource;
    QryData: TFDQuery;
    QryDataID: TBCDField;
    QryDataPMEQMT_ID: TBCDField;
    QryDataEQNO: TStringField;
    QryDataMFGCELL: TStringField;
    QryDataMFG_TYPE: TStringField;
    QryDataCNTR_DESC: TStringField;
    ImageList1: TUniImageList;
    QryDataPM_EQNO: TStringField;
    QryDataPM_DESCRIP: TStringField;
    QryDataPM_CLASS: TStringField;
    PMain: TUniPopupMenu;
    JumptoWorkCenter1: TUniMenuItem;
    Panel1: TUniPanel;
    Image1: TUniImage;
    N1: TUniMenuItem;
    JumptoPreventativeMaintenance1: TUniMenuItem;
    ChangePreventativeMaintenanceReference1: TUniMenuItem;
    btnChangePM: TUniBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure JumptoWorkCenter1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure JumptoPreventativeMaintenance1Click(Sender: TObject);
    procedure PMainPopup(Sender: TObject);
    procedure ChangePreventativeMaintenanceReference1Click(
      Sender: TObject);
    procedure tvChange(Sender: TObject; Node: TUniTreeNode);
  private
    { Private declarations }
    procedure RefreshData;
    procedure LoadTree;
    procedure SetButtons;

    function GetSelectedWorkCenterID: Real;
    function GetSelectedPMEqmtID: Real;
    procedure SetSelectedPMEqmtID(const Value: Real);
    procedure SetSelectedWorkCenterID(const Value: Real);

  public
    { Public declarations }
    function HasDuplicates: Boolean;
  published
    { Published declarations }
    property SelectedWorkCenterID: Real read GetSelectedWorkCenterID write
      SetSelectedWorkCenterID;
    property SelectedPMEqmtID: Real read GetSelectedPMEqmtID write
      SetSelectedPMEqmtID;
  end;

procedure WorkCenterHasDuplicatePM; overload;
function WorkCenterHasDuplicatePM(AWorkCenterID, APMEqmtID: Real)
  : Boolean; overload;

implementation

{$R *.dfm}


uses
  IQMS.Common.Applications,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.WebVcl.SecurityManager,
  { TODO -oathite -cWebConvert : Depends on src_wrkc
  src_wrkc, }
  { TODO -oathite -cWebConvert : Depends on wc_pm
  wc_pm, }
  workcntr_rscstr;

procedure WorkCenterHasDuplicatePM;
var
  LFrmWCDupPm : TFrmWCDupPm;
begin
  LFrmWCDupPm := TFrmWCDupPm.Create(uniGUIApplication.UniApplication);
  with LFrmWCDupPm do
    begin
      if HasDuplicates then
        Show
      else
        Free;
    end;
end;

function WorkCenterHasDuplicatePM(AWorkCenterID,
  APMEqmtID: Real): Boolean; overload;
begin
  Result := False;

  if (AWorkCenterID = 0) or (APMEqmtID = 0) then
    Exit;

  Result := SelectValueFmtAsFloat(
    'select a.id'#13 +
    'from work_center a,'#13 +
    '     (select pmeqmt_id, count(pmeqmt_id) as cnt'#13 +
    '        from work_center'#13 +
    '       where frame_set_id is null'#13 +
    '       group by pmeqmt_id) b,'#13 +
    '     pmeqmt c'#13 +
    'where b.pmeqmt_id = a.pmeqmt_id'#13 +
    ' and c.id = a.pmeqmt_id'#13 +
    ' and b.cnt > 1'#13 +
    ' and a.pmeqmt_id = %.0f and a.id = %.0f',
    [APMEqmtID, AWorkCenterID]) > 0;
end;

{ TTreeCargo }

constructor TTreeCargo.Create(AWorkCenterID, APMEqmtID: Real);
begin
  WORK_CENTER_ID := AWorkCenterID;
  PMEQMT_ID := APMEqmtID;
end;

{ TFrmWCDupPm }

procedure TFrmWCDupPm.FormCreate(Sender: TObject);
begin
  // open dataset
  RefreshData;
end;

procedure TFrmWCDupPm.FormShow(Sender: TObject);
begin
  Beep;
  SetButtons;
end;

function TFrmWCDupPm.HasDuplicates: Boolean;
begin
  if not QryData.Active then
    RefreshData;
  Result := QryData.Active and not (QryData.Bof and QryData.Eof);
end;

procedure TFrmWCDupPm.RefreshData;
begin
  ReOpen(QryData); // pas
  LoadTree;
end;

procedure TFrmWCDupPm.LoadTree;

  function _AddEquipment(ACaption: String; APMEqmtID: Real): TUniTreeNode;
  begin
    { TODO -oathite -cWebConvert : Undeclared identifier: 'AddChildObject'
    Result := tv.Items.AddChildObject(NIL, ACaption,
      TTreeCargo.Create(0, APMEqmtID));
    with Result do
      begin
        ImageIndex := 0;
        SelectedIndex := 0;
      end; }
  end;

  procedure _AddWorkCenter(AParentNode: TUniTreeNode; ACaption: String;
    AWorkCenterID, APMEqmtID: Real);
  var
    AChildNode: TUniTreeNode; // temporarily holds reference to child node
  begin
    { TODO -oathite -cWebConvert : Undeclared identifier: 'AddChildObject'
    AChildNode := tv.Items.AddChildObject(AParentNode, ACaption,
      TTreeCargo.Create(AWorkCenterID, APMEqmtID));
    with AChildNode do
      begin
        ImageIndex := 1;
        SelectedIndex := 1;
      end;  }
  end;

var
  APmCaption, AWcCaption, AWcClass: String;
  APMEqmtID, AWorkCenterID: Real;
  ANode: TUniTreeNode;
  { TODO -oathite -cWebConvert : Undeclared identifier: 'TTVChangedEvent'
  ev: TTVChangedEvent; }
begin

  // Initialization
  APMEqmtID := 0;
  AWorkCenterID := 0;
  ANode := NIL;

  // Prepare the tree view
  tv.Items.BeginUpdate;
  try
    { TODO -oathite -cWebConvert : Undeclared identifier: 'TTVChangedEvent'
    ev := tv.OnChange; }
    try
      tv.OnChange := NIL;
      tv.Items.Clear;
      QryData.First;

      // Cycle the data and add nodes to the tree view
      while not QryData.Eof do
        begin
          // Fill values that will be used for display
          APmCaption := Format('%s - %s [%s]',
            [QryDataPM_EQNO.AsString, QryDataPM_DESCRIP.AsString,
            QryDataPM_CLASS.AsString]);
          AWorkCenterID := QryDataID.AsFloat;
          AWcClass := IQMS.Common.Numbers.sIIf(QryDataMFGCELL.AsString > '',
            Format('[Cell: %s]', [QryDataMFGCELL.AsString]),
            Format('[MFG Type: %s]', [QryDataMFG_TYPE.AsString]));
          AWcCaption := Format('%s - %s %s', [QryDataEQNO.AsString,
            QryDataCNTR_DESC.AsString, AWcClass]);

          // Check to see if we are working with the same PMEQMT_ID.  If the value
          // is zero (0), then we are just starting (see initialization above).
          // If the current field value is the same as the variable, then we are
          // still working with the same equipment, and we need just to add
          // a Work Center child node.
          // 1.) Not the same?  Add a new parent node for MRO Equipment
          if (APMEqmtID = 0) or (APMEqmtID <> QryDataPMEQMT_ID.AsFloat) then
            begin
              // set the new value
              APMEqmtID := QryDataPMEQMT_ID.AsFloat;
              // add the parent node
              ANode := _AddEquipment(APmCaption, APMEqmtID);
              // add the child node
              _AddWorkCenter(ANode, AWcCaption, AWorkCenterID, APMEqmtID);
            end
            // 2.) Same MRO Equipment?  Add a Work Center child.
          else if ANode <> NIL then
            _AddWorkCenter(ANode, AWcCaption, AWorkCenterID, APMEqmtID);

          // Next record in the query
          QryData.Next;
        end;

      tv.FullExpand;
      { TODO -oathite -cWebConvert : Undeclared identifier: 'TopItem'
      if (tv.Items.Count > 0) and
        (tv.TopItem <> NIL) then
        begin
          tv.Selected := tv.TopItem;
          if tv.Selected <> NIL then
            tv.Selected.MakeVisible;
        end; }

      SetButtons;

    finally
      tv.Items.EndUpdate;
    end;
  finally
    { TODO -oathite -cWebConvert : Undeclared identifier: 'TTVChangedEvent'
    tv.OnChange := ev; }
  end;
end;

procedure TFrmWCDupPm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmWCDupPm.JumptoWorkCenter1Click(Sender: TObject);
var
  AWorkCenterID: Real;
  AFound: Boolean;
begin
  // Go to the selected work center
  AFound := False;
  if (tv.Selected <> NIL) and Assigned(tv.Selected.Data) then
    begin
      AWorkCenterID := TTreeCargo(tv.Selected.Data).WORK_CENTER_ID;
      { TODO -oathite -cWebConvert : Depends on Src_wrkc
      if (AWorkCenterID > 0) and (Owner is TFrmWorkCenter) then
        with TFrmWorkCenter(Owner) do
          AFound := LocateWorkCenter(AWorkCenterID);     }
    end;
end;

procedure TFrmWCDupPm.JumptoPreventativeMaintenance1Click(Sender: TObject);
var
  APMEqmtID: Real;
begin
  // Go to the selected work center
  if (tv.Selected <> NIL) and Assigned(tv.Selected.Data) then
    begin
      APMEqmtID := TTreeCargo(tv.Selected.Data).PMEQMT_ID;
      { TODO -oathite -cWebConvert : Undeclared identifier: 'iq_JumpToPM'
      if (APMEqmtID > 0) then
        // Com_Exec( 'IQPM', [pm_const.PM_SHOW_ALL, APMEqmtID]); // IQComExe.pas

        IQMS.WebVcl.Jump.JumpDirect(iq_JumpToPM, Trunc(APMEqmtID)); }
    end;
end;

procedure TFrmWCDupPm.PMainPopup(Sender: TObject);
var
  AEnabled: Boolean;
begin
  AEnabled := (tv.Selected <> NIL) and Assigned(tv.Selected.Data);
  JumptoWorkCenter1.Enabled := AEnabled and
    (TTreeCargo(tv.Selected.Data).WORK_CENTER_ID > 0);
  JumptoPreventativeMaintenance1.Enabled := AEnabled and
    (TTreeCargo(tv.Selected.Data).PMEQMT_ID > 0) and
    SecurityManager.IsModuleLicensed(IQAppsNames[apPM]); // iqapps
end;

procedure TFrmWCDupPm.ChangePreventativeMaintenanceReference1Click(
  Sender: TObject);
var
  AWorkCenterID, APMEqmtID: Real;
begin
  AWorkCenterID := SelectedWorkCenterID;
  APMEqmtID := SelectedPMEqmtID;

  if (AWorkCenterID = 0) then
    // workcntr_rscstr.cTXT0000042 = 'Please select a Work Center.';
    raise Exception.Create(workcntr_rscstr.cTXT0000042);

  if (APMEqmtID = 0) then
    // workcntr_rscstr.cTXT0000043 = 'Please select a MRO Equipment reference.';
    raise Exception.Create(workcntr_rscstr.cTXT0000043);

  { TODO -oathite -cWebConvert : Depends on wc_pm
  if DoWorkCenterPMInfoEx(Self, APMEqmtID) then // wc_pm.pas
    begin
      ExecuteCommandFmt(
        'update work_center set pmeqmt_id = %.0f where id = %.0f',
        [APMEqmtID, AWorkCenterID]);
      SelectedPMEqmtID := APMEqmtID;
      if Assigned(Owner) and (Owner is TFrmWorkCenter) then
        with TFrmWorkCenter(Owner) do
          RefreshDataSets;
    end;   }

end;

function TFrmWCDupPm.GetSelectedPMEqmtID: Real;
begin
  Result := 0;
  if (tv.Selected <> NIL) and Assigned(tv.Selected.Data) then
    Result := TTreeCargo(tv.Selected.Data).PMEQMT_ID;
end;

function TFrmWCDupPm.GetSelectedWorkCenterID: Real;
begin
  Result := 0;
  if (tv.Selected <> NIL) and Assigned(tv.Selected.Data) then
    Result := TTreeCargo(tv.Selected.Data).WORK_CENTER_ID;
end;

procedure TFrmWCDupPm.SetSelectedPMEqmtID(const Value: Real);
begin
  if (tv.Selected <> NIL) and Assigned(tv.Selected.Data) then
    TTreeCargo(tv.Selected.Data).PMEQMT_ID := Value;
end;

procedure TFrmWCDupPm.SetSelectedWorkCenterID(const Value: Real);
begin
  if (tv.Selected <> NIL) and Assigned(tv.Selected.Data) then
    TTreeCargo(tv.Selected.Data).WORK_CENTER_ID := Value;
end;

procedure TFrmWCDupPm.SetButtons;
begin
  if not Self.Showing then
    Exit;

  btnChangePM.Enabled := (SelectedPMEqmtID > 0) and
    (SelectedWorkCenterID > 0);
end;

procedure TFrmWCDupPm.tvChange(Sender: TObject; Node: TUniTreeNode);
begin
  SetButtons;
end;

end.
