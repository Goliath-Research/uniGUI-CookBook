unit crm_activities_frame;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.wwdatsrc,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  IQMS.WebVcl.OptionDialog,
  Vcl.Menus,
  IQMS.WebVcl.Search,
  Vcl.wwdblook,
  Vcl.Buttons,
  MainModule,
  DM_CRM,
  DM_CRMPK,
  DM_CRMIMG,
  IQMS.Common.JumpConstants,
  crm_types,
  crm_context,
  FireDAC.UI.Intf,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniDBNavigator,
  uniMainMenu, IQUniGrid, uniGUIFrame, uniComboBox, uniDBComboBox;

type
  TFrmCRMActivitiesFrame = class(TFrame)
    QryActivities: TFDQuery;
    QryActivitiesImageIndex: TIntegerField;
    QryActivitiesTYPE: TBCDField;
    QryActivitiesID: TBCDField;
    QryActivitiesPRIORITY_STRING: TStringField;
    QryActivitiesSTARTDATE: TDateTimeField;
    QryActivitiesFINISHDATE: TDateTimeField;
    QryActivitiesSUBJECT: TStringField;
    QryActivitiesCONTACT: TStringField;
    QryActivitiesCOMPANY: TStringField;
    QryActivitiesTYPE_STRING: TStringField;
    QryActivitiesARCHIVED: TStringField;
    QryActivitiesASSIGNEDTO: TStringField;
    QryActivitiesQUEUE_NAME: TStringField;
    QryActivitiesSUBQUEUE_NAME: TStringField;
    QryActivitiesPUBLISH: TStringField;
    QryActivitiesISSUE_NUMBER: TFMTBCDField;
    QryActivitiesSETALARM: TStringField;
    QryActivitiesPRIORITY: TBCDField;
    QryActivitiesEPLANT_ID: TBCDField;
    QryActivitiesMASTER_ID: TBCDField;
    QryActivitiesCHILD_ID: TBCDField;
    QryActivitiesPRINCIPLE_CONTACT_PHONE: TStringField;
    QryActivitiesPRINCIPLE_CONTACT_EXT: TStringField;
    QryActivitiesPRINCIPLE_CONTACT_EMAIL: TStringField;
    QryActivitiesSOURCE: TStringField;
    QryActivitiesSOURCE_ID: TBCDField;
    QryActivitiesSOURCE_DISPLAY: TStringField;
    SrcActivities: TDataSource;
    PnlActivitiesCarrier: TUniPanel;
    IQOptionDialog1: TIQWebOptionDialog;
    PActivity: TUniPopupMenu;
    JumptoActivity1: TUniMenuItem;
    ViewSummary1: TUniMenuItem;
    PnlToolbarActivities: TUniPanel;
    sbtnActivityFilter: TUniSpeedButton;
    sbtnJumpToActivity: TUniSpeedButton;
    NavActivities: TUniDBNavigator;
    PnlLegend: TUniPanel;
    shpHistory: TUniPanel;
    cmbAssignedTo: TUniDBLookupComboBox;
    PnlActivitiesGrid: TUniPanel;
    PnlActivitiesDisplay: TUniPanel;
    GridActivities: TIQUniGridControl;
    procedure JumptoActivity1Click(Sender: TObject);
    procedure ViewSummary1Click(Sender: TObject);
    procedure QryActivitiesAfterOpen(DataSet: TDataSet);
    procedure QryActivitiesBeforeClose(DataSet: TDataSet);
    procedure QryActivitiesBeforeOpen(DataSet: TDataSet);
    procedure QryActivitiesCalcFields(DataSet: TDataSet);
    procedure NavActivitiesBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure cmbAssignedToBeforeDropDown(Sender: TObject);
    procedure cmbAssignedToChange(Sender: TObject);
    procedure sbtnActivityFilterClick(Sender: TObject);
    procedure PActivityPopup(Sender: TObject);
  private
    { Private declarations }
    FSource: string;
    FSourceID: Int64;
    FStarted: Boolean;
    DM: TCRM_DM;
    DMPK: TCRMPK_DM;
    DMIMG: TCRMIMG_DM;
    FLocalAssignedToFilter: TAssignmentContext;
    procedure IQAfterShowMessage(var Msg: TMessage);
      message iq_AfterShowMessage;
    procedure SetControls;
  public
    { Public declarations }
    procedure CreateWnd; override;
    procedure Start;
    procedure Finalize;
    procedure CheckDataSetActive;
    procedure RefreshData;
    procedure CheckAndRefresh;

    property Started: Boolean read FStarted;
    property Source: string read FSource write FSource;
    property SourceID: Int64 read FSourceID write FSourceID;
    function ActivityID: Int64;
  end;

implementation

{$R *.dfm}


uses
  crm_activity_dnet,
  crm_jumps,
  crm_rscstr,
  crmsuprt,
  crmsuprtsumhtml,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.JumpDispatcher,
  QC_Const,
  wf_main,
  wwMemo,
  crm_activity_delete;

{ TFrame1 }

procedure TFrmCRMActivitiesFrame.CreateWnd;
begin
  FStarted := False;
  FLocalAssignedToFilter := nil;
  inherited;

  DM := TCRM_DM.Create(TComponent(Self) as TFrame);
  DM.Name := '';

  DMPK := TCRMPK_DM.Create(TComponent(Self) as TFrame);
  DMPK.Name := '';

  DMIMG := TCRMIMG_DM.Create(TComponent(Self) as TFrame);
  DMIMG.Name := '';

  PnlActivitiesCarrier.Visible := False;

end;

procedure TFrmCRMActivitiesFrame.Start;
begin
  // 10/19/2009 Initialize the filter record object (declared in crm_types).
  // It contains "assignment" filtering for the local Activity dataset.
  // This is required because allow the user to override the assignment
  // filter.  Requested by a customer, approved by Randy (SCR # 579).
  FLocalAssignedToFilter := TAssignmentContext.Create;
  FLocalAssignedToFilter.AssignedTo := CRMContext.AssignmentContext.AssignedTo;
  FLocalAssignedToFilter.ApplyToGlobalSettings := False;
  // don't save to Registry
  if IQOptionDialog1.SelectedIndexes = [] then
    IQOptionDialog1.SelectedIndexesStr := '0,1,2,3,4,5,6';
  sbtnActivityFilter.Hint := IQOptionDialog1.HintText;

  // Now, show the Vcl.Controls.  The Visible property is set to False
  // in the CreateWnd method above.
  PnlActivitiesCarrier.Visible := True;
  FStarted := True;

end;

procedure TFrmCRMActivitiesFrame.Finalize;
begin
  // nothing
end;

procedure TFrmCRMActivitiesFrame.IQAfterShowMessage(var Msg: TMessage);
begin
  // Update control type strings

end;

function TFrmCRMActivitiesFrame.ActivityID: Int64;
begin
  Result := QryActivitiesID.AsLargeInt;
end;

procedure TFrmCRMActivitiesFrame.CheckAndRefresh;
begin
  if (ActivityID > 0) and
    (SelectValueFmtAsFloat
    ('SELECT 1 FROM crm_activity WHERE id = %d AND ROWNUM < 2',
    [ActivityID]
    ) = 0) then
    RefreshData;
end;

procedure TFrmCRMActivitiesFrame.CheckDataSetActive;
begin
  if Started and not QryActivities.Active then
    QryActivities.Open;
end;

procedure TFrmCRMActivitiesFrame.RefreshData;
begin
  RefreshDataSetByID(QryActivities);
end;

procedure TFrmCRMActivitiesFrame.cmbAssignedToBeforeDropDown(Sender: TObject);
begin
  if (Sender is TUniDBLookupComboBox) then
    with (Sender as TUniDBLookupComboBox) do
      if Assigned(LookupTable) then
        begin
          if not LookupTable.Active then
            LookupTable.Open
          else
            ReOpen(LookupTable);
        end;
end;

procedure TFrmCRMActivitiesFrame.cmbAssignedToChange(Sender: TObject);
var
  ev: TNotifyEvent;
begin
  if (Self <> nil) and Self.Showing and Assigned(FLocalAssignedToFilter) and
    Assigned(cmbAssignedTo.LookupTable) then
    try
      ev := cmbAssignedTo.OnChange;
      cmbAssignedTo.OnChange := nil;
      cmbAssignedTo.LookupTable.DisableControls;
      FLocalAssignedToFilter.AssignedTo := cmbAssignedTo.LookupTable.FieldByName
        ('USER_NAME').AsString;
      if FLocalAssignedToFilter.AssignedTo = crm_rscstr.
        cTXT0000198 { '<Show All>' } then
        FLocalAssignedToFilter.AssignedTo := '';
      // Refresh activity dataset
      RefreshDataSetByID(QryActivities);
      Application.ProcessMessages;
    finally
      cmbAssignedTo.OnChange := ev;
      cmbAssignedTo.LookupTable.EnableControls;
    end;
end;

procedure TFrmCRMActivitiesFrame.sbtnActivityFilterClick(Sender: TObject);
begin
  if IQOptionDialog1.Execute then
    begin
      sbtnActivityFilter.Hint := IQOptionDialog1.HintText;
      RefreshDataSetByID(QryActivities);
    end;
end;

procedure TFrmCRMActivitiesFrame.JumptoActivity1Click(Sender: TObject);
var
  AID: Int64;
  AType: TActivityType;
  AKind: string;
begin
  AID := QryActivitiesID.AsLargeInt;
  if AID > 0 then
    begin
      AType := TActivityType(QryActivitiesTYPE.AsInteger);

      // TActivityType = (atNone, atCall, atTask, atMeeting, atSupport, atNote,
      // atSalesStage, atHistory);
      case AType of
        atCall, atTask, atMeeting, atNote, atSalesStage:
          DoCRMActivityDNet(AID); // crm_activity_dnet
        atSupport:
          DoCRMSupport(Application, AID); // crmsuprt.pas
        atHistory:
          begin
            if CompareText(QryActivitiesSOURCE.AsString, 'APQP') = 0 then
              begin
                AKind := SelectValueFmtAsString(
                  'SELECT kind FROM apqp WHERE id = %d',
                  [QryActivitiesSOURCE_ID.AsLargeInt]);
                if CompareText(AKind, 'PROC_PQ') = 0 then
                  IQMS.Common.JumpDispatcher.DoCOMJump('IQQC', [QC_Const.QC_PROC_PQ_MAINT,
                    QryActivitiesSOURCE_ID.AsLargeInt])
                else
                  IQMS.Common.JumpDispatcher.DoCOMJump('IQQC', [QC_Const.QC_APQP_MAINT,
                    QryActivitiesSOURCE_ID.AsLargeInt]);
              end
            else if CompareText(QryActivitiesSOURCE.AsString, 'CAR') = 0 then
              begin
                AKind := SelectValueFmtAsString(
                  'SELECT kind FROM car WHERE id = %d',
                  [QryActivitiesSOURCE_ID.AsLargeInt]);
                if CompareText(AKind, 'CAPA') = 0 then
                  IQMS.Common.JumpDispatcher.DoCOMJump('IQQC', [QC_Const.QC_CAPA_MAINT,
                    QryActivitiesSOURCE_ID.AsLargeInt])
                else
                  IQMS.Common.JumpDispatcher.DoCOMJump('IQQC', [QC_Const.QC_CAR_MAINT,
                    QryActivitiesSOURCE_ID.AsLargeInt]);
              end
            else if CompareText(QryActivitiesSOURCE.AsString, 'ECO') = 0 then
              IQMS.Common.JumpDispatcher.DoCOMJump('IQQC', [QC_Const.QC_ECO_MAINT,
                QryActivitiesSOURCE_ID.AsLargeInt])
            else if CompareText(QryActivitiesSOURCE.AsString, 'PPAP') = 0 then
              begin
                AKind := SelectValueFmtAsString(
                  'SELECT kind FROM ppap WHERE id = %d',
                  [QryActivitiesSOURCE_ID.AsLargeInt]);
                if CompareText(AKind, 'PROD_PQ') = 0 then
                  IQMS.Common.JumpDispatcher.DoCOMJump('IQQC', [QC_Const.QC_PROD_PQ_MAINT,
                    QryActivitiesSOURCE_ID.AsLargeInt])
                else
                  IQMS.Common.JumpDispatcher.DoCOMJump('IQQC', [QC_Const.QC_PPAP_MAINT,
                    QryActivitiesSOURCE_ID.AsLargeInt]);
              end
            else if CompareText(QryActivitiesSOURCE.AsString, 'RMA') = 0 then
              crm_jumps.DoCRMJumpToRMAHeader(QryActivitiesSOURCE_ID.AsLargeInt)
            else if CompareText(QryActivitiesSOURCE.AsString, 'WF_HEADER') = 0
            then
              wf_main.JumpToWorkFlow(QryActivitiesSOURCE_ID.AsLargeInt);
          end;
      end;
    end;
end;

procedure TFrmCRMActivitiesFrame.NavActivitiesBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
  if Button = nbDelete then
    begin
      // Delete the activity - prompt, delete the record, and then delete from
      // the BDE query instance.
      if crm_activity_delete.DeleteActivity(Self, QryActivitiesID.AsFloat) then
        QryActivities.Delete;
      System.SysUtils.Abort;
    end;
end;

procedure TFrmCRMActivitiesFrame.PActivityPopup(Sender: TObject);
begin
  GridActivities.MenuVisible(ViewSummary1, QryActivitiesTYPE.AsInteger = 4);
end;

procedure TFrmCRMActivitiesFrame.ViewSummary1Click(Sender: TObject);
begin
  // display the Support Issue Summary
  crmsuprtsumhtml.ShowSupportSummaryHTML(QryActivitiesID.AsFloat);
end;

procedure TFrmCRMActivitiesFrame.SetControls;
begin
  if not FStarted then
    Exit;

  // In case no activities show because of the filter
  if (IQOptionDialog1.SelectedCount = IQOptionDialog1.Items.Count) then
    PnlActivitiesDisplay.Caption := crm_rscstr.cTXT0001542
    // 'There are no activities linked to this customer.'
  else
    PnlActivitiesDisplay.Caption := crm_rscstr.cTXT0001545;
  // 'There are no activities to display for this filter.'

  sbtnJumpToActivity.Enabled := QryActivities.Active and
    not (QryActivities.BOF and QryActivities.EOF);
end;

procedure TFrmCRMActivitiesFrame.QryActivitiesAfterOpen(DataSet: TDataSet);
begin
  GridActivities.ReadGrid;
  SetControls;
end;

procedure TFrmCRMActivitiesFrame.QryActivitiesBeforeClose(DataSet: TDataSet);
begin
  GridActivities.WriteGrid;
end;

procedure TFrmCRMActivitiesFrame.QryActivitiesBeforeOpen(DataSet: TDataSet);
var
  ATypeStr: string;
begin
  if (FLocalAssignedToFilter = nil) then
    Exit;

  // Build the type string
  ATypeStr := '_';
  // calls
  ATypeStr := ATypeStr + sIIf(0 in IQOptionDialog1.SelectedIndexes, '1_', '');
  // tasks
  ATypeStr := ATypeStr + sIIf(1 in IQOptionDialog1.SelectedIndexes, '2_', '');
  // meetings
  ATypeStr := ATypeStr + sIIf(2 in IQOptionDialog1.SelectedIndexes, '3_', '');
  // support
  ATypeStr := ATypeStr + sIIf(3 in IQOptionDialog1.SelectedIndexes, '4_', '');
  // notes
  ATypeStr := ATypeStr + sIIf(4 in IQOptionDialog1.SelectedIndexes, '5_', '');
  // sales stage
  ATypeStr := ATypeStr + sIIf(6 in IQOptionDialog1.SelectedIndexes, '6_', '');
  // historical events
  ATypeStr := ATypeStr + sIIf(7 in IQOptionDialog1.SelectedIndexes, '7_', '');

  AssignQueryParamValue(DataSet, 'source', FSource);
  AssignQueryParamValue(DataSet, 'source_id', FSourceID);
  AssignQueryParamValue(DataSet, 'type', ATypeStr);
  AssignQueryParamValue(DataSet, 'include_archived',
    iIIf(5 in IQOptionDialog1.SelectedIndexes, 1, 0));
  AssignQueryParamValue(DataSet, 'assignedto',
    FLocalAssignedToFilter.AssignedTo);
  AssignQueryParamValue(DataSet, 'show_all_users',
    iIIf(FLocalAssignedToFilter.Index = 0, 1, 0));

  // Do not sort on TYPE
  QryActivitiesTYPE.Origin := '';

  // Adjust the TwwGrid
  with GridActivities do
    begin
      // The TYPE field is now fixed.  If the user sorted on TYPE in a previous
      // version, and Registry settings are still intact, then we reset it here.
      if SearchField = 'TYPE' then
        SearchField := 'ID';
      // Configure the grid
      wwdbgrid.ImageList := DMIMG.ACTIVITY_TYPE_IMAGES;
      wwdbgrid.MemoAttributes := [mGridShow, mDisableDialog]; // wwMemo.pas
      wwdbgrid.RowHeightPercent := 118;
      wwdbgrid.FixedCols := 1;
    end;

end;

procedure TFrmCRMActivitiesFrame.QryActivitiesCalcFields(DataSet: TDataSet);
begin
  QryActivitiesImageIndex.AsInteger := QryActivitiesTYPE.AsInteger;
end;

end.
