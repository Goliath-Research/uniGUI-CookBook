unit crmword_edit;

interface

uses
  Winapi.Windows,
  generics.collections,
  System.SysUtils,
  System.Classes,
  System.StrUtils,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.FileCtrl,
  Vcl.Buttons,
  Data.DB,
  Vcl.Wwdatsrc,
  Mask,
  dm_crmword,
  IQMS.WebVcl.About,
  MaskUtils,
  IQMS.WebVcl.CaptionPanel,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  System.ImageList,
  FireDAC.Stan.Intf,
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
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniImageList,
  uniRadioButton,
  uniMultiItem,
  uniListBox,
  uniTreeView,
  uniComboBox,
  uniPanel,
  uniSplitter,
  uniGroupBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniDBComboBox,
  uniPageControl,
  uniImage,
  IQUniGrid,
  uniGUIFrame,
  uniDBGrid,
  uniGUIFont;

type
  TLVCargo = class
    TableName: string;
    FieldName: string;
    DisplayLabel: string;
    constructor Create(ATableName, AFieldName, ADisplayLabel: string);
  end;

  TTVCargo = class
    Step: Integer;
    Completed: Boolean;
    constructor Create(AStep: Integer; ACompleted: Boolean);
  end;

  TWizardBtn = (wbPrior, wbNext, wbFinish);

  TFrmCRMWordEdit = class(TUniForm)
    PnlCarrier: TUniPanel;
    PnlPageControlCarrier: TUniPanel;
    pcMain: TUniPageControl;
    TabFields: TUniTabSheet;
    SaveDialog: TSaveDialog;
    TabCriteria: TUniTabSheet;
    PnlSelectionCriteria: TUniPanel;
    QryColInfo: TFDQuery;
    IQAbout1: TIQWebAbout;
    QryFields: TFDQuery;
    QryFieldsCOLUMN_NAME: TStringField;
    TabName: TUniTabSheet;
    PnlMergeRecordName: TUniPanel;
    TabFileName: TUniTabSheet;
    OpenTemplate: TOpenDialog;
    TabFinish: TUniTabSheet;
    TabDataSet: TUniTabSheet;
    TabTemplate: TUniTabSheet;
    PnlControls: TUniPanel;
    Panel1: TUniPanel;
    btnCancel: TUniBitBtn;
    btnBack: TUniBitBtn;
    btnNext: TUniBitBtn;
    btnFinish: TUniBitBtn;
    PnlGridSelectionCriteria: TUniPanel;
    PnlSelectionCriteriaGrid: TUniPanel;
    GridSelectionCriteria: TIQUniGridControl;
    PnlSelectionCriteriaToolbar: TUniPanel;
    sbtnClear: TUniSpeedButton;
    sbtnPreview: TUniSpeedButton;
    NavSelectionCriteria: TUniDBNavigator;
    Bevel6: TUniPanel;
    PnlMenu: TUniPanel;
    Panel6: TUniPanel;
    Panel8: TUniPanel;
    SplitterMenu: TUniSplitter;
    Bevel2: TUniPanel;
    Panel13: TUniPanel;
    Panel14: TUniPanel;
    sbtnHideMenu: TUniSpeedButton;
    ImageList1: TUniImageList;
    tvMenu: TUniTreeView;
    Panel15: TUniPanel;
    sbtnMenuPrior: TUniSpeedButton;
    sbtnMenuNext: TUniSpeedButton;
    TabSorting: TUniTabSheet;
    PnlMergeDataset: TUniPanel;
    Label2: TUniLabel;
    PnlMergeFields: TUniPanel;
    PnlFieldSelection: TUniPanel;
    Splitter1: TUniSplitter;
    Bevel4: TUniPanel;
    Bevel1: TUniPanel;
    Bevel3: TUniPanel;
    PnlFieldSelection01: TUniPanel;
    lstAvailableFields: TUniListBox;
    PnlMergeFieldsAvailBar: TUniPanel;
    Label40: TUniLabel;
    Panel7: TUniPanel;
    PnlSelectionControls: TUniPanel;
    Panel4: TUniPanel;
    sbtnInclude: TUniSpeedButton;
    sbtnIncludeAll: TUniSpeedButton;
    sbtnExclude: TUniSpeedButton;
    sbtnExcludeAll: TUniSpeedButton;
    PnlFieldSelection02: TUniPanel;
    lstSelectedFields: TUniListBox;
    PnlMergeFieldsSelBar: TUniPanel;
    Label20: TUniLabel;
    PnlMoveUpDownControls: TUniPanel;
    Panel9: TUniPanel;
    sbtnMoveUp: TUniSpeedButton;
    sbtnMoveUpAll: TUniSpeedButton;
    sbtnMoveDown: TUniSpeedButton;
    sbtnMoveDownAll: TUniSpeedButton;
    CaptionPanel1: TIQWebCaptionPanel;
    CaptionPanel2: TIQWebCaptionPanel;
    PnlSortBy: TUniPanel;
    CaptionPanel3: TIQWebCaptionPanel;
    PnlSortColumns: TUniPanel;
    Label3: TUniLabel;
    Label8: TUniLabel;
    Label12: TUniLabel;
    Label13: TUniLabel;
    Label14: TUniLabel;
    Label16: TUniLabel;
    Label18: TUniLabel;
    sbtnClearSortField1: TUniSpeedButton;
    sbtnClearSortField2: TUniSpeedButton;
    sbtnClearSortField3: TUniSpeedButton;
    sbtnClearSortField4: TUniSpeedButton;
    sbtnClearSortField5: TUniSpeedButton;
    sbtnClearSortField6: TUniSpeedButton;
    sbtnClearSortField7: TUniSpeedButton;
    cmbSortType1: TUniComboBox;
    cmbSortType2: TUniComboBox;
    cmbSortType3: TUniComboBox;
    cmbSortType4: TUniComboBox;
    cmbSortType5: TUniComboBox;
    cmbSortType6: TUniComboBox;
    cmbSortType7: TUniComboBox;
    cmbSortFields1: TUniComboBox;
    cmbSortFields2: TUniComboBox;
    cmbSortFields3: TUniComboBox;
    cmbSortFields4: TUniComboBox;
    cmbSortFields5: TUniComboBox;
    cmbSortFields6: TUniComboBox;
    cmbSortFields7: TUniComboBox;
    CaptionPanel4: TIQWebCaptionPanel;
    PnlDocumentName: TUniPanel;
    CaptionPanel5: TIQWebCaptionPanel;
    chkOverwriteDocument: TUniCheckBox;
    Label10: TUniLabel;
    dbeDocument: TUniDBEdit;
    sbtnSelectDocument: TUniSpeedButton;
    PnlTemplateName: TUniPanel;
    CaptionPanel6: TIQWebCaptionPanel;
    gbTemplate: TUniGroupBox;
    sbtnBrowseTemplate: TUniSpeedButton;
    rbTemplate_Blank: TUniRadioButton;
    rbTemplate_UD: TUniRadioButton;
    cmbTemplate: TUniDBComboBox;
    PnlMergeRecordNameInner: TUniPanel;
    Label4: TUniLabel;
    dbeName: TUniDBEdit;
    Label5: TUniLabel;
    dbeDescrip: TUniDBEdit;
    chkPublished: TUniDBCheckBox;
    PnlFinish: TUniPanel;
    PnlSummary: TUniPanel;
    gbSummary: TUniGroupBox;
    PnlSummaryInner: TUniPanel;
    lblMergeDatasetLabel: TUniLabel;
    lblMailMergeDocumentLabel: TUniLabel;
    lblMicrosoftWordTemplateLabel: TUniLabel;
    lblMicrosoftAccessDatabaseLabel: TUniLabel;
    lblMicrosoftAccessTableLabel: TUniLabel;
    lblMergeDatasetSummary: TUniEdit;
    lblMailMergeDocumentSummary: TUniEdit;
    lblMicrosoftWordTemplateSummary: TUniEdit;
    lblMicrosoftAccessDatabaseSummary: TUniEdit;
    lblMicrosoftAccessTableSummary: TUniEdit;
    lblFieldSelectedLabel: TUniLabel;
    lblFieldSelectedSummary: TUniLabel;
    lblMergeDatasetImage: TUniImage;
    lblMailMergeDocumentImage: TUniImage;
    lblMicrosoftWordTemplateImage: TUniImage;
    lblFieldSelectedImage: TUniImage;
    PnlSummaryBar: TUniPanel;
    lblSummary: TUniLabel;
    cpFinish: TIQWebCaptionPanel;
    Bevel5: TUniPanel;
    CaptionPanel7: TIQWebCaptionPanel;
    PnlCampaign2: TUniPanel;
    PnlCampaignControls: TUniPanel;
    PnlCampaignLeft01: TUniPanel;
    Label19: TUniLabel;
    Label11: TUniLabel;
    Label32: TUniLabel;
    PnlCampaignClient01: TUniPanel;
    cmbCampaign: TUniDBLookupComboBox;
    dbeCampaignCode: TUniDBEdit;
    dbeCampaignDescription: TUniDBEdit;
    chkAssocCampaign: TUniCheckBox;
    cmbQueries: TUniComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbQueries1Change(Sender: TObject);
    procedure MoveSelected(List: TUniListBox; Items: TStrings);
    function GetFirstSelection(List: TUniListBox): Integer;
    procedure SetButtons;
    procedure ButtonBackClick(Sender: TObject);
    procedure ButtonNextClick(Sender: TObject);
    procedure SetItem(List: TUniListBox; Index: Integer);
    procedure sbtnIncludeClick(Sender: TObject);
    procedure sbtnIncludeAllClick(Sender: TObject);
    procedure sbtnExcludeClick(Sender: TObject);
    procedure sbtnExcludeAllClick(Sender: TObject);
    procedure lstSelectedFieldsDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure lstSelectedFieldsDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure PnlFieldSelectionResize(Sender: TObject);
    procedure dbeNameChange(Sender: TObject);
    procedure cmbQueries1DropDown(Sender: TObject);
    procedure btnCancel1Click(Sender: TObject);
    procedure GridSelectionCriteriaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridSelectionCriteriaCalcCellColors( Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure btnFinish1Click(Sender: TObject);
    procedure sbtnMoveUpClick(Sender: TObject);
    procedure sbtnMoveUpAllClick(Sender: TObject);
    procedure sbtnMoveDownClick(Sender: TObject);
    procedure sbtnMoveDownAllClick(Sender: TObject);
    procedure lstAvailableFieldsDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lstAvailableFieldsDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure lstSelectedFieldsMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Close1Click(Sender: TObject);
    procedure sbtnClearClick(Sender: TObject);
    procedure QryFieldsBeforeOpen(DataSet: TDataSet);
    procedure sbtnPreviewClick(Sender: TObject);
    procedure sbtnBrowseTemplateClick(Sender: TObject);
    procedure rbTemplate_BlankClick(Sender: TObject);
    procedure rbTemplate_UDClick(Sender: TObject);
    procedure sbtnSelectDocumentClick(Sender: TObject);
    procedure cmbTemplateDropDown(Sender: TObject);
    procedure sbtnHideMenuClick(Sender: TObject);
    procedure tvMenuGetImageIndex(Sender: TObject; Node: TUniTreeNode);
    procedure tvMenuClick(Sender: TObject);
    procedure sbtnMenuPriorClick(Sender: TObject);
    procedure sbtnMenuNextClick(Sender: TObject);
    procedure dbeNameKeyPress(Sender: TObject; var Key: Char);
    procedure dbeDocumentCheckValue(Sender: TObject;
      PassesPictureTest: Boolean);
    procedure sbtnRefreshFilterClick(Sender: TObject);
    procedure DoSortByFieldChange(Sender: TObject);
    procedure cmbSortFields1CloseUp(Sender: TObject);
    procedure cmbSortFields2CloseUp(Sender: TObject);
    procedure cmbSortFields3CloseUp(Sender: TObject);
    procedure cmbSortFields4CloseUp(Sender: TObject);
    procedure cmbSortFields5CloseUp(Sender: TObject);
    procedure cmbSortFields6CloseUp(Sender: TObject);
    procedure cmbSortFields7CloseUp(Sender: TObject);
    procedure sbtnClearSortField1Click(Sender: TObject);
    procedure sbtnClearSortField2Click(Sender: TObject);
    procedure sbtnClearSortField3Click(Sender: TObject);
    procedure sbtnClearSortField4Click(Sender: TObject);
    procedure sbtnClearSortField5Click(Sender: TObject);
    procedure sbtnClearSortField6Click(Sender: TObject);
    procedure sbtnClearSortField7Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmbCampaignCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure chkAssocCampaignClick(Sender: TObject);
    procedure cmbQueriesChange(Sender: TObject);
    procedure cmbQueriesDropDown(Sender: TObject);
    procedure GridSelectionCriteriacmbColumnCloseUp(Sender: TObject);
    function GetComboBoxComponent(ComboBoxName:String):TUniComboBox;
    function cmbQueriesValue:Integer;
  private
    { Private declarations }
    FSelectedFieldsModified: Boolean;
    FSortByFieldsModified: Boolean;
    FCampaignModified: Boolean;
    FCreatingNew: Boolean;
    FHasSelectionCriteria: Boolean;
    function GetTableName: string;

    procedure GetColumnList(var AStrings: TStrings);
    procedure LoadAvailableFields;
    procedure LoadSelectedFields;
    procedure SaveSelectedFields; //Loads query
    procedure UpdateSelectionCriteriaList; //updates combo box
    procedure LoadSortFields;
    procedure SaveSortFields;
    procedure SaveCampaignID;
    function HasSortFields: Boolean;

    procedure DoButtonClick(AWizardButton: TWizardBtn);
    function PreparePageBeforeLeaving(ACurrentPageIndex: Integer; AWizardButton: TWizardBtn)
      : Boolean; //returns False if cannot show page
    function PreparePageBeforeEntering(ATargetPageIndex: Integer): Boolean;
    //returns False if cannot show page
    procedure SelectTreeNodeByStep(AStep: Integer);

    procedure DoFinishAction; //Basic method for the finish button
    procedure DoSimpleSaveAction; //Just saves records, does not create doc

    //Updates the summary fields on the Finish screen
    procedure UpdateSummaryDisplay;

    //Shows or hides the tree view
    procedure ShowHideMenu(AShow: Boolean);
    procedure BuildMenu;

    function GetHasSelectionCriteria: Boolean;
    //raises error if user has not entered selection criteria
    function VerifySelectionCriteriaScreen: Boolean;

    //Returns information for the item
    function GetListItemInfo(AListBox: TUniListBox; AItemIndex: Integer;
      var ATableName: string; var AFieldName: string;
      var ADisplayLabel: string): Boolean; //returns True if valid item

    function ValidFileName(AFileName: string; AShowErrors: Boolean = True): Boolean;
    procedure cmbColumn1CloseUp(Sender: TObject);
    //filename and path

    property SQLTableName: string read GetTableName;

  public
    { Public declarations }
    DM: TCRMWORD_DM;
  end;

function DoCRMWordEdit( var AID: Real; var AOverwriteDoc: Boolean): Boolean;

//var
//FrmCRMWordEdit: TFrmCRMWordEdit;

implementation

{$R *.DFM}


uses
  crm_rscstr,
  //crmword_query,
  crmword_share,
  crmword_types,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.Registry,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg,
  IQMS.Common.DataConst;

function DoCRMWordEdit( var AID: Real; var AOverwriteDoc: Boolean): Boolean;
var
  FrmCRMWordEdit: TFrmCRMWordEdit;
begin
  FrmCRMWordEdit := TFrmCRMWordEdit.Create(uniGUIApplication.UniApplication);
  FrmCRMWordEdit.DM := TCRMWORD_DM.Create(nil);
  FrmCRMWordEdit.DM.Name := '';
  IQSetTablesActiveEx(True, FrmCRMWordEdit.DM, '');
//  CenterForm(Self); //iqctrl; must be called before IQRegFormRead()
//
//  AdjustPageControlToParent(pcMain); //iqctrl
  FrmCRMWordEdit.GetComboBoxComponent('cmbUniaryOperator').Visible := False;
  FrmCRMWordEdit.GetComboBoxComponent('cmbBinaryOperator').Visible := False;
  if AID > 0 then
  begin
    FrmCRMWordEdit.FCreatingNew := False;
    if FrmCRMWordEdit.DM.TblCRMWordDoc.Locate('ID', AID, []) then
    begin
      if not (FrmCRMWordEdit.DM.TblCRMWordDoc.State in [dsEdit, dsInsert]) then
      begin
        FrmCRMWordEdit.DM.TblCRMWordDoc.Refresh;
        FrmCRMWordEdit.DM.TblCRMWordDoc.Edit;
      end;
      FrmCRMWordEdit.Caption := crm_rscstr.cTXT0000754; //'Edit Merge Document'
      FrmCRMWordEdit.BuildMenu;
      FrmCRMWordEdit.ShowHideMenu(True);
      FrmCRMWordEdit.LoadAvailableFields;
      FrmCRMWordEdit.LoadSelectedFields;
      FrmCRMWordEdit.LoadSortFields;
      FrmCRMWordEdit.GetHasSelectionCriteria;
    end
    else
      raise Exception.Create(crm_rscstr.cTXT0000344 {'Could not locate the selected record.'});
  end
  else
  begin
    FrmCRMWordEdit.FCreatingNew := True;
    FrmCRMWordEdit.DM.TblCRMWordDoc.Insert;
    FrmCRMWordEdit.Caption := crm_rscstr.cTXT0000755; //'New Merge Document'
    FrmCRMWordEdit.ShowHideMenu(False);
  end;

  FrmCRMWordEdit.chkOverwriteDocument.Visible := ((FrmCRMWordEdit.DM.TblCRMWordDocFILENAME.AsString > '') and
    FileExists(FrmCRMWordEdit.DM.TblCRMWordDocFILENAME.AsString));
    FrmCRMWordEdit.chkOverwriteDocument.Checked := False;

   //01/11/2011 Apply saved campaign ID
  FrmCRMWordEdit.chkAssocCampaign.Checked := FrmCRMWordEdit.DM.TblCRMWordDocCAMPAIGN_ID.AsFloat > 0;
  if FrmCRMWordEdit.chkAssocCampaign.Checked then
  begin
    FrmCRMWordEdit.DM.QryCampaign.Locate('ID', FrmCRMWordEdit.DM.TblCRMWordDocCAMPAIGN_ID.AsFloat, []);

//    FrmCRMWordEdit.cmbCampaign.KeyValueStr := FrmCRMWordEdit.DM.QryCampaignCAMPAIGN_NO.AsString;
    //FrmCRMWordEdit.cmbCampaign.PerformSearch;
  end;

  //'Check this option if you want all CRM users '#13'to view and use this Mail Merge record';
  FrmCRMWordEdit.chkPublished.Hint := crm_rscstr.cTXT0001200;
  Result := FrmCRMWordEdit.ShowModal = mrOK;
  AID := FrmCRMWordEdit.DM.TblCRMWordDocID.AsFloat;
      AOverwriteDoc := not FrmCRMWordEdit.chkOverwriteDocument.Visible or
        (FrmCRMWordEdit.chkOverwriteDocument.Visible and FrmCRMWordEdit.chkOverwriteDocument.Checked);
end;

{$REGION 'TLVCargo' }


constructor TLVCargo.Create(ATableName, AFieldName, ADisplayLabel: string);
begin
  TableName := ATableName;
  FieldName := AFieldName;
  DisplayLabel := ADisplayLabel;
end;

{$ENDREGION 'TLVCargo' }

{$REGION 'TTVCargo' }


constructor TTVCargo.Create(AStep: Integer; ACompleted: Boolean);
begin
  Step := AStep;
  Completed := ACompleted;
end;

{$ENDREGION 'TTVCargo' }

{ TFrmCRMWordEdit }


procedure TFrmCRMWordEdit.FormShow(Sender: TObject);
begin
 // IQRegFormRead(Self, [Self, GridSelectionCriteria]); //IQMS.Common.RegFrm.pas
  SetButtons;
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlDocumentName);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlMergeRecordName);
end;

procedure TFrmCRMWordEdit.FormActivate(Sender: TObject);
begin
  if not (DM.TblCRMWordDoc.State in [dsEdit, dsInsert]) then
    DM.TblCRMWordDoc.Refresh;
end;

procedure TFrmCRMWordEdit.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//  CanClose := True;

  if IsEmpty(DM.TblCRMWordDocFILENAME.AsString) then
    // crm_rscstr.cTXT0000756 =
    // 'The Mail Merge document has not been created.'#13 +
    // 'Are you sure you want to Exit?'
    CanClose := IQConfirmYN(crm_rscstr.cTXT0000756);
end;

procedure TFrmCRMWordEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;

  if FSelectedFieldsModified or
    FSortByFieldsModified or
    ((DM.TblCRMWordDoc.State in [dsEdit, dsInsert]) and
    (lstSelectedFields.Items.Count > 0)) then
    //crm_rscstr.cTXT0000350 = 'Save changes?'
    if IQConfirmYN(crm_rscstr.cTXT0000350) then
    begin
      //Save all pending edits
      if (DM.TblCRMWordDoc.State in [dsEdit, dsInsert]) then
        DM.TblCRMWordDoc.Post;

      //Save the query
      if FSelectedFieldsModified then
        SaveSelectedFields; //local
      if FSortByFieldsModified then
        SaveSortFields;
    end;
  //IQRegFormWrite(Self, [Self, GridSelectionCriteria]); //IQMS.Common.RegFrm.pas
end;

procedure TFrmCRMWordEdit.cmbQueries1Change(Sender: TObject);
begin
  if not Self.Showing then
    Exit;

  //07/10/2006 This compensates for a bug in Infopower TwwDBComboBox. Bug was
  //reported by Dawn.
  //
  //When you select an item in the combo box list, the field value does
  //not change.  So, regardless of what you select, the value remains
  //the same (Customers and Prospects).  We set it here to ensure the
  //value changes.  If we don't set it here, then as soon as the focus
  //exits the combo box, it will revert back to the default value.
  if (DM.TblCRMWordDoc.State in [dsEdit, dsInsert]) then
     DM.TblCRMWordDocDATASET_INDEX.AsInteger := cmbQueriesValue;

  LoadAvailableFields;
  lstSelectedFields.Clear;
  SetButtons;
end;

procedure TFrmCRMWordEdit.MoveSelected(List: TUniListBox;
  Items: TStrings);
var
  i: Integer;
begin
  for i := List.Items.Count - 1 downto 0 do
    if List.Selected[i] then
    begin
      Items.AddObject(List.Items[i], List.Items.Objects[i]);
      List.Items.Delete(i);
    end;
end;

procedure TFrmCRMWordEdit.SetButtons;
var
  ASrcEmpty, ADstEmpty: Boolean;
  AMoreThanOne: Boolean;
  AShowFinish: Boolean;
begin
  //Get values
  ASrcEmpty := lstAvailableFields.Items.Count = 0;
  ADstEmpty := lstSelectedFields.Items.Count = 0;
  AMoreThanOne := lstSelectedFields.Items.Count > 1;

  //Listbox Add/remove Vcl.Buttons
  sbtnInclude.Enabled := not ASrcEmpty;
  sbtnIncludeAll.Enabled := not ASrcEmpty;
  sbtnExclude.Enabled := not ADstEmpty;
  sbtnExcludeAll.Enabled := not ADstEmpty;

  //Listbox Move up/down Vcl.Buttons
  sbtnMoveUp.Enabled := AMoreThanOne;
  sbtnMoveUpAll.Enabled := AMoreThanOne;
  sbtnMoveDown.Enabled := AMoreThanOne;
  sbtnMoveDownAll.Enabled := AMoreThanOne;

  AShowFinish := not ADstEmpty and (DM.TblCRMWordDocFILENAME.AsString > '')
    and (DM.TblCRMWordDocNAME.AsString > '');
  if FCreatingNew then
    btnFinish.Enabled := AShowFinish and (pcMain.ActivePage = TabFinish)
  else
    btnFinish.Enabled := AShowFinish;

  btnBack.Enabled := (pcMain.ActivePageIndex > 0);

  if pcMain.ActivePage = TabFields then
    btnNext.Enabled := not ADstEmpty
  else if pcMain.ActivePage = TabFileName then
    btnNext.Enabled := (DM.TblCRMWordDocFILENAME.AsString > '') and
      ValidFileName(DM.TblCRMWordDocFILENAME.AsString, False)
  else if pcMain.ActivePage = TabName then
    btnNext.Enabled := (DM.TblCRMWordDocNAME.AsString > '')
  else
    btnNext.Enabled := (pcMain.ActivePageIndex < (pcMain.PageCount - 1));

  //Templates
  rbTemplate_UD.Checked := (DM.TblCRMWordDocTEMPLATENAME.AsString > '');
  rbTemplate_Blank.Checked := not rbTemplate_UD.Checked;
  sbtnBrowseTemplate.Enabled := rbTemplate_UD.Checked;
end;

function TFrmCRMWordEdit.GetFirstSelection(List: TUniListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then
      Exit;
  Result := LB_ERR;
end;

procedure TFrmCRMWordEdit.sbtnIncludeClick(Sender: TObject);
var
  Index: Integer;
begin
  index := GetFirstSelection(lstAvailableFields);
  MoveSelected(lstAvailableFields, lstSelectedFields.Items);
  SetItem(lstAvailableFields, index);
end;

procedure TFrmCRMWordEdit.sbtnIncludeAllClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to lstAvailableFields.Items.Count - 1 do
    lstSelectedFields.Items.AddObject(
      lstAvailableFields.Items[i],
      lstAvailableFields.Items.Objects[i]);
  lstAvailableFields.Items.Clear;
  SetItem(lstAvailableFields, 0);
end;

procedure TFrmCRMWordEdit.sbtnExcludeClick(Sender: TObject);
var
  AIndex: Integer;
begin
  AIndex := GetFirstSelection(lstSelectedFields);
  MoveSelected(lstSelectedFields, lstAvailableFields.Items);
  SetItem(lstSelectedFields, AIndex);
end;

procedure TFrmCRMWordEdit.sbtnExcludeAllClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to lstSelectedFields.Items.Count - 1 do
    lstAvailableFields.Items.AddObject(
      lstSelectedFields.Items[i],
      lstSelectedFields.Items.Objects[i]);
  lstSelectedFields.Items.Clear;
  SetItem(lstSelectedFields, 0);
end;

procedure TFrmCRMWordEdit.SetItem(List: TUniListBox; Index: Integer);
var
  AMaxIndex: Integer;
begin
  //Used by Available and Selected Field lists
  with List do
  begin
    SetFocus;
    AMaxIndex := List.Items.Count - 1;
    if index = LB_ERR then
      index := 0
    else if index > AMaxIndex then
      index := AMaxIndex;
    Selected[index] := True;
  end;
  SetButtons;
  FSelectedFieldsModified := True;
end;

procedure TFrmCRMWordEdit.DoFinishAction;
var
  i: Integer;
  ADocFileName: string;
  ADataFileName: string;
  ATemplate: string;
  ADir: string;
  AQuery: TFDQuery;
  ASuccess: Boolean;
begin
  //Initialization
  AQuery := nil;
  ASuccess := False;

  //Post any pending changes
  if (DM.TblCRMWordCriteria.State in [dsEdit, dsInsert]) then
    DM.TblCRMWordCriteria.Post;

  //Save the template name
  if not rbTemplate_UD.Checked then
  begin
    if (DM.TblCRMWordDoc.State in [dsEdit, dsInsert]) then
      DM.TblCRMWordDoc.Post;
    ExecuteCommandFmt(
      'update crm_word_doc set templatename = NULL where id = %d',
      [DM.TblCRMWordDocID.AsLargeInt]);
    DM.TblCRMWordDoc.Refresh;
  end;

  //User is finishing early, just save the query
  if (pcMain.ActivePageIndex < 3) and
    (chkOverwriteDocument.Visible and //there is an existing document
    not chkOverwriteDocument.Checked) then //user does not want to overwrite it
  begin
    DoSimpleSaveAction;
    Exit;
  end;

  //Document names
  ADocFileName := DM.TblCRMWordDocFILENAME.AsString;
  ATemplate := DM.TblCRMWordDocTEMPLATENAME.AsString;

  //Validation
  if lstSelectedFields.Items.Count = 0 then
  begin
    pcMain.ActivePage := TabFields;
    SetButtons;
    ModalResult := mrNone;
    //crm_rscstr.cTXT0000757 =
    //'The "Selected Fields" list is empty.  Please select fields.'
    raise Exception.Create(crm_rscstr.cTXT0000757);
  end;

  //Has the user entered selection criteria?
  if not VerifySelectionCriteriaScreen then
    Exit;

  //Has the user selected a mail merge document?
  if IsEmpty(ADocFileName) then
    //crm_rscstr.cTXT0000758 =
    //'You have not specified a mail merge document.  ' +
    //'Do you want to Exit without creating a document?'
    if IQConfirmYN(crm_rscstr.cTXT0000758) then
    begin
      //The user doesn't want to create a new document.
      //Just save changes and Exit.
      DoSimpleSaveAction;
      Exit;
    end
    else
      sbtnSelectDocumentClick(nil);

  //Save the query
  try
    if FSelectedFieldsModified then
      SaveSelectedFields; //local method.
    if FSortByFieldsModified then
      SaveSortFields;
    if FCampaignModified then
      SaveCampaignID;
    ASuccess := True;
  finally
    FSelectedFieldsModified := False;
    FSortByFieldsModified := False;
  end;

  if ASuccess then
    ModalResult := mrOk;
end;

procedure TFrmCRMWordEdit.DoSimpleSaveAction;
begin
  //Save all pending edits
  if DM.TblCRMWordDoc.State in [dsEdit, dsInsert] then
    DM.TblCRMWordDoc.Post;

  FSelectedFieldsModified := False;

  if FSortByFieldsModified then
    SaveSortFields;

  if (lstSelectedFields.Items.Count > 0) and
    (FSelectedFieldsModified = True) then
    SaveSelectedFields; //local
  //01/11/2011 Save campaign ID
  SaveCampaignID;
end;

procedure TFrmCRMWordEdit.lstSelectedFieldsDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var
  APoint: TPoint;
  AIndex: Integer;
begin
  Accept := (Source = lstAvailableFields) or
    (Source = lstSelectedFields);
  if (Source = lstSelectedFields) then
  begin
    APoint.X := X;
    APoint.Y := Y;
//    AIndex := lstSelectedFields.ItemAtPos(APoint, True);
    Invalidate;
//    lstSelectedFields.Canvas.DrawFocusRect(lstSelectedFields.ItemRect(AIndex));
//    lstSelectedFields.Update;
  end;
end;

procedure TFrmCRMWordEdit.lstSelectedFieldsDragDrop(Sender,
  Source: TObject; X, Y: Integer);
var
  APoint: TPoint;
  ANew: Integer;
begin
  APoint.X := X;
  APoint.Y := Y;

  if Source = lstAvailableFields then
    sbtnIncludeClick(nil);
  if (Source = lstSelectedFields) then
  begin
//    ANew := lstSelectedFields.ItemAtPos(APoint, True);
    lstSelectedFields.Items.Move(lstSelectedFields.ItemIndex, ANew);
    SetItem(lstSelectedFields, ANew);
    FSelectedFieldsModified := True;
  end;
end;

procedure TFrmCRMWordEdit.PnlFieldSelectionResize(Sender: TObject);
var
  AWidth: Integer;
begin
  AWidth := Round(
    (PnlFieldSelection.ClientWidth -
    (PnlSelectionControls.Width + PnlMoveUpDownControls.Width + 9))
    / 2);
  PnlFieldSelection01.Width := AWidth;
end;

procedure TFrmCRMWordEdit.cmbQueriesChange(Sender: TObject);
begin
//  if not Self.Showing then
//    Exit;

  if (DM.TblCRMWordDoc.State in [dsEdit, dsInsert]) then
    DM.TblCRMWordDocDATASET_INDEX.AsInteger := cmbQueriesValue;

  LoadAvailableFields;
  lstSelectedFields.Clear;
  SetButtons;
end;

procedure TFrmCRMWordEdit.cmbQueriesDropDown(Sender: TObject);
begin
if not (DM.TblCRMWordDoc.State in [dsEdit, dsInsert]) then
  begin
    DM.TblCRMWordDoc.Refresh;
    DM.TblCRMWordDoc.Edit;
  end;
end;

function TFrmCRMWordEdit.cmbQueriesValue: Integer;
var
    aValue:Integer;
begin
    case AnsiIndexStr(cmbQueries.Text, ['Applicants',
         'Contacts','CRM Group','Customers and Prospects','Employees',
         'Partner Contacts','Partners','Vendor Contacts','Vendors']) of
       0 : aValue:=9;
       1 : aValue:=2;
       2 : aValue:=8;
       3 : aValue:=9;
       4 : aValue:=7;
       5 : aValue:=6;
       6 : aValue:=5;
       7 : aValue:=4;
       8 : aValue:=3;
    end;
    Result:=aValue;
end;

procedure TFrmCRMWordEdit.UpdateSelectionCriteriaList;
  procedure FillComboBox(AControl: TUniCustomComboBox; AFieldNames: TStrings);
  var
    i: Integer;
    ACaption, AFieldName, ALineText: string;
  begin
    with AControl do
    begin
      Items.BeginUpdate;
      try
        Items.Clear;

        for i := 0 to AFieldNames.Count - 1 do
        begin
          AFieldName := AFieldNames[i];
          ACaption := FieldDisplayLabel(AFieldName); //crmword_share.pas
          //requires a MapList ww combo box
          ALineText := Format('%s'#9'%s',
            [ACaption,
            AFieldName]);
          AControl.Items.Add(ALineText);
        end;
      finally
        Items.EndUpdate;
      end;
    end;
  end;
var
  ACols: TStrings;
begin
  ACols := TStringList.Create;
  try
    GetColumnList(ACols);
    FillComboBox(GetComboBoxComponent('cmbColumn'), ACols);
    FillComboBox(cmbSortFields1, ACols);
    FillComboBox(cmbSortFields2, ACols);
    FillComboBox(cmbSortFields3, ACols);
    FillComboBox(cmbSortFields4, ACols);
    FillComboBox(cmbSortFields5, ACols);
    FillComboBox(cmbSortFields6, ACols);
    FillComboBox(cmbSortFields7, ACols);
  finally
    FreeAndNil(ACols);
  end;
end;

procedure TFrmCRMWordEdit.LoadAvailableFields;
var
  ACols: TStrings;
  ATableName, AFieldName, ADisplayLabel: string;
  i: Integer;
begin
  lstAvailableFields.Items.Clear;
  ATableName := SQLTableName;
  ACols := TStringList.Create;
  try
    GetColumnList(ACols);
    for i := 0 to ACols.Count - 1 do
    begin
      AFieldName := ACols.Strings[i];
      ADisplayLabel := FieldDisplayLabel(AFieldName); //crmword_share.pas
      if not IsForbidden(ACols.Strings[i]) then
        lstAvailableFields.Items.AddObject(
          ADisplayLabel,
          TLVCargo.Create(ATableName,
          AFieldName,
          ADisplayLabel));
    end;
  finally
    FreeAndNil(ACols);
  end;
end;

procedure TFrmCRMWordEdit.SaveSelectedFields;
var
  ACRMWordDocID: Int64; //current Master ID
  i: Integer;
  ATableName, AFieldName: string;
begin
  //Saves selected fields to the CRM_WORD_SQL table
  //Get the current Master ID
  ACRMWordDocID := DM.TblCRMWordDocID.AsLargeInt;
  ATableName := SQLTableName;
  //Remove old data
  ExecuteCommandFmt(
    'delete from crm_word_sql where crm_word_doc_id = %d and NVL(sort_field, ''N'') <> ''Y'' ',
    [ACRMWordDocID]);
  for i := 0 to lstSelectedFields.Items.Count - 1 do
  begin
    AFieldName := TLVCargo(lstSelectedFields.Items.Objects[i]).FieldName;
    AFieldName := Trim(UpperCase(AFieldName));
    ExecuteCommandFmt(
      'insert into crm_word_sql ' +
      '(id,crm_word_doc_id, seq, text, sort_field) ' +
      'values (s_crm_word_sql.nextval, %d, %d, ''%s'', ''N'')',
      [ACRMWordDocID, (i + 1), AFieldName]);
  end;
  FSelectedFieldsModified := False;
end;

procedure TFrmCRMWordEdit.dbeNameChange(Sender: TObject);
begin
  if not Self.Showing then
    Exit;
  btnNext.Enabled := (DM.TblCRMWordDocNAME.AsString > '');
end;

procedure TFrmCRMWordEdit.dbeNameKeyPress(Sender: TObject; var Key: Char);
begin
  if not (DM.TblCRMWordDoc.State in [dsEdit, dsInsert]) then
    DM.TblCRMWordDoc.Edit;
end;

procedure TFrmCRMWordEdit.cmbQueries1DropDown(Sender: TObject);
begin
  if not (DM.TblCRMWordDoc.State in [dsEdit, dsInsert]) then
  begin
    DM.TblCRMWordDoc.Refresh;
    DM.TblCRMWordDoc.Edit;
  end;
end;

procedure TFrmCRMWordEdit.btnCancel1Click(Sender: TObject);
begin
  DM.TblCRMWordDoc.Cancel;
end;

procedure TFrmCRMWordEdit.GridSelectionCriteriaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  GridSelectionCriteria.DataSource.DataSet.Edit;
end;

procedure TFrmCRMWordEdit.GridSelectionCriteriaCalcCellColors(
    Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn;
  Attribs: TUniCellAttribs);
begin
  if (UpperCase(Column.FieldName) = 'UNARY_OPERATOR') then
  begin
    Attribs.Font.Color := clNavy;
    Attribs.Font.Style := [fsBold];
  end;

  if (UpperCase(Column.FieldName) = 'BINARY_OPERATOR') then
  begin
    Attribs.Font.Color := clMaroon;
    Attribs.Font.Style := [fsBold];
  end;
end;


procedure TFrmCRMWordEdit.GridSelectionCriteriacmbColumnCloseUp(
  Sender: TObject);
var
  AFieldName: string;
begin
//  AFieldName :=  cmbColumn.
  DM.AutoFillCriteriaLabel(AFieldName);
end;

procedure TFrmCRMWordEdit.LoadSelectedFields;
var
  i: Integer; //counter for cycling the Available Fields list
  S: string;
  hMsg: TPanelMesg;
  AFieldName: string;
begin
  //Gets the selected field list from a previously created dataset
  hMsg := hPleaseWait(crm_rscstr.cTXT0000760 {'Retrieving field list.'});
  try
    lstSelectedFields.Items.Clear;

    //Get the list of selected fields
    with TFDQuery.Create(nil) do
      try
        ConnectionName := cnstFDConnectionName;  // IQMS.Common.DataConst
        SQL.Add(IQFormat(
          'select * from crm_word_sql ' +
          'where nvl(sort_field, ''N'') <> ''Y'' and ' +
          'crm_word_doc_id = %d order by seq',
          [DM.TblCRMWordDocID.AsLargeInt]));
        Open;
        First; //the select statement
        while not EOF do
        begin
          //Get the field name from the dataset
          S := Trim(UpperCase(StrTran(FieldByName('TEXT').AsString, ',', ''))); //iqstring

          if (S = 'SELECT') or
            (S = 'ID') then
          begin
            Next; //skip over these fields (for display only)
            CONTINUE; //but continue the loop
          end;
          if S = 'FROM' then
            Break; //done with the loop if we hit "from" key word

          //Otherwise, remove it from the list
          for i := 0 to lstAvailableFields.Items.Count - 1 do
          begin
            AFieldName := TLVCargo(lstAvailableFields.Items.Objects[i]).FieldName;
            if Trim(AFieldName) = S then
            begin
              //Add the object to the selected list.  Doing it this way also
              //adds the object data, which includes table name and field name information.
              lstSelectedFields.Items.AddObject(
                lstAvailableFields.Items[i],
                lstAvailableFields.Items.Objects[i]);
              lstAvailableFields.Items.Delete(i); //remove the item from the "available" list
              Break; //Done cycling the records; end the loop early
            end;
          end;
          Next; //Next record in the temporary query
        end;
      finally
        SetButtons;
        Free;
      end;
  finally
    FreeAndNil(hMsg);
  end;
end;

procedure TFrmCRMWordEdit.btnFinish1Click(Sender: TObject);
begin
  DoButtonClick(wbFinish);
end;

procedure TFrmCRMWordEdit.sbtnMoveUpClick(Sender: TObject);
var
  ACurIndex, ANewIndex: Integer;
begin
  ACurIndex := GetFirstSelection(lstSelectedFields);
  ANewIndex := ACurIndex - 1;
  if ANewIndex >= 0 then
  begin
    lstSelectedFields.Items.Move(ACurIndex, ANewIndex);
    SetItem(lstSelectedFields, ANewIndex);
  end
  else
    SetItem(lstSelectedFields, ACurIndex);
  FSelectedFieldsModified := True;
end;

procedure TFrmCRMWordEdit.sbtnMoveUpAllClick(Sender: TObject);
begin
  lstSelectedFields.Items.Move(GetFirstSelection(lstSelectedFields), 0);
  SetItem(lstSelectedFields, GetFirstSelection(lstSelectedFields));
  FSelectedFieldsModified := True;
end;

procedure TFrmCRMWordEdit.sbtnMoveDownClick(Sender: TObject);
var
  ACurIndex, ANewIndex: Integer;
begin
  ACurIndex := GetFirstSelection(lstSelectedFields);
  ANewIndex := ACurIndex + 1;

  if ANewIndex <= (lstSelectedFields.Items.Count - 1) then
  begin
    lstSelectedFields.Items.Move(ACurIndex, ANewIndex);
    SetItem(lstSelectedFields, ANewIndex);
  end
  else
    SetItem(lstSelectedFields, ACurIndex);
  FSelectedFieldsModified := True;
end;

procedure TFrmCRMWordEdit.sbtnMoveDownAllClick(Sender: TObject);
begin
  lstSelectedFields.Items.Move(GetFirstSelection(lstSelectedFields),
    (lstSelectedFields.Items.Count - 1));
  SetItem(lstSelectedFields, GetFirstSelection(lstSelectedFields));
  FSelectedFieldsModified := True;
end;

procedure TFrmCRMWordEdit.lstAvailableFieldsDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  sbtnExcludeClick(nil);
end;

procedure TFrmCRMWordEdit.lstAvailableFieldsDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source = lstSelectedFields;
end;

procedure TFrmCRMWordEdit.lstSelectedFieldsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  with lstSelectedFields do
    BeginDrag(True, 15);
end;

procedure TFrmCRMWordEdit.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCRMWordEdit.sbtnClearClick(Sender: TObject);
begin
  //crm_rscstr.cTXT0000761 =
  //'Clear the "To" and "From" values?'
  if IQConfirmYNChk(crm_rscstr.cTXT0000761,
    'CRM Mail Merge Clear Filter') then
  begin
    ExecuteCommandFmt(
      'update crm_word_criteria set range_start = null, ' +
      ' range_end = null where crm_word_doc_id = %d',
      [DM.TblCRMWordDocID.AsLargeInt]);
    DM.TblCRMWordCriteria.Refresh;
  end;
end;

procedure TFrmCRMWordEdit.QryFieldsBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'name', SQLTableName);
end;

procedure TFrmCRMWordEdit.GetColumnList(var AStrings: TStrings);
begin
  with QryFields do
  begin
    Close;
    Open;
    First;
    while not EOF do
    begin
      if not IsForbidden(QryFieldsCOLUMN_NAME.AsString) then
        AStrings.Add(QryFieldsCOLUMN_NAME.AsString);
      Next;
    end;
  end;
end;

function TFrmCRMWordEdit.GetComboBoxComponent(
  ComboBoxName: String): TUniComboBox;
var
  i : Integer;
begin
  Result:=nil;
  for i :=0 to GridSelectionCriteria.IQControls.Count-1 do
     if TUniControl(GridSelectionCriteria.IQControls.Items[i]).Name=ComboBoxName then
        Result:=TUniComboBox(GridSelectionCriteria.IQControls.Items[i]);
end;

procedure TFrmCRMWordEdit.ButtonBackClick(Sender: TObject);
begin
  DoButtonClick(wbPrior);
end;

procedure TFrmCRMWordEdit.ButtonNextClick(Sender: TObject);
begin
  DoButtonClick(wbNext);
end;

procedure TFrmCRMWordEdit.sbtnPreviewClick(Sender: TObject);
begin
  if FSelectedFieldsModified then
    SaveSelectedFields;
  if FSortByFieldsModified then
    SaveSortFields;
//  crmword_query.PreviewSQL(
//    Self,
//    DM.TblCRMWordDocID.AsLargeInt);
end;

function TFrmCRMWordEdit.GetTableName: string;
begin
  Result := MailMergeViewNameEx(DM.TblCRMWordDocID.AsLargeInt); //crmword_share.pas
end;

procedure TFrmCRMWordEdit.sbtnBrowseTemplateClick(Sender: TObject);
var
  S, ADir, ARegDir: string;
begin
  ADir := GetSpecialPath(evTemplates);
  if IQRegStringScalarRead(Self, 'Templates', S) and
    (DirectoryExists(S)) then
    ADir := S; //Iqregfrm

  with OpenTemplate do
  begin
    InitialDir := ADir;
    Title := crm_rscstr.cTXT0000762; //'Select Template'
    if Execute then
    begin
      if not (DM.TblCRMWordDoc.State in [dsEdit, dsInsert]) then
      begin
        DM.TblCRMWordDoc.Refresh;
        DM.TblCRMWordDoc.Edit;
      end;
      DM.TblCRMWordDocTEMPLATENAME.AsString := FileName;
      IQRegStringScalarWrite(Self, 'Templates', ExtractFilePath(FileName));
    end;
  end;
end;

procedure TFrmCRMWordEdit.rbTemplate_BlankClick(Sender: TObject);
begin
  rbTemplate_UD.Checked := False;
  if not (DM.TblCRMWordDoc.State in [dsEdit, dsInsert]) then
  begin
    DM.TblCRMWordDoc.Refresh;
    DM.TblCRMWordDoc.Edit;
  end;
  DM.TblCRMWordDocTEMPLATENAME.Clear;
  sbtnBrowseTemplate.Enabled := False;
  cmbTemplate.Enabled := False;
end;

procedure TFrmCRMWordEdit.rbTemplate_UDClick(Sender: TObject);
begin
  rbTemplate_Blank.Checked := False;
  sbtnBrowseTemplate.Enabled := True;
  cmbTemplate.Enabled := True;
end;

function TFrmCRMWordEdit.GetListItemInfo(AListBox: TUniListBox;
  AItemIndex: Integer; var ATableName, AFieldName, ADisplayLabel: string): Boolean;
var
  AMax: Integer;
begin
  Result := False;
  if AListBox = nil then
    Exit;
  AMax := AListBox.Items.Count;
  if (AItemIndex > - 1) and (AItemIndex < AMax) then
  begin
    ATableName := TLVCargo(AListBox.Items.Objects[AItemIndex]).TableName;
    AFieldName := TLVCargo(AListBox.Items.Objects[AItemIndex]).FieldName;
    ADisplayLabel := AListBox.Items.Strings[AItemIndex];
    Result := True;
  end;
end;

function TFrmCRMWordEdit.VerifySelectionCriteriaScreen: Boolean;
var
  ACount: Integer;
begin
  if (DM.TblCRMWordCriteria.State in [dsEdit, dsInsert]) then
    DM.TblCRMWordCriteria.Post;

  //NOTE: First, are there records in the table?  If not, then the user has
  //not setup any filtering.
  if not GetHasSelectionCriteria then
  begin
    //crm_rscstr.cTXT0000763=
    //'You have not added filtering options.  ' +
    //'Filtering allows you to specify which records you want to see. ' +
    //'Without setting a filter, all records will be displayed (not recommended).'#13#13 +
    //'Do you want to add filtering options now?'
    if IQWarningYN(crm_rscstr.cTXT0000763) then
    begin
      pcMain.ActivePage := TabCriteria;
      ModalResult := mrNone;
      Result := False;
    end
    else
      Result := True; //pass True if the user doesn't care
    SetButtons;
    Exit; //Exit now, since the next lines are irrelevant
  end
  else
    Result := True;

  //NOTE: Second, there are records, but the user has not specified any
  //values for them.
  ACount := SelectValueFmtAsInteger(
    'select count(*) from CRM_WORD_CRITERIA where CRM_WORD_DOC_ID = %d ' +
    'and (range_start is not null or range_end is not null) ',
    [DM.TblCRMWordDocID.AsLargeInt]);
  Result := ACount > 0; //True = Yes, has selection criteria
  if not Result then
    //crm_rscstr.cTXT0000764 =
    //'You have not specified any starting or ending values for your selection criteria.  ' +
    //'Currently, all records will be displayed (not recommended).'#13#13 +
    //'Do you want to specify selection criteria now?'
    if IQWarningYN(crm_rscstr.cTXT0000764) then
    begin
      pcMain.ActivePage := TabCriteria;
      ModalResult := mrNone;
      SetButtons;
    end
    else
      Result := True; //pass True if the user doesn't care
end;

procedure TFrmCRMWordEdit.sbtnSelectDocumentClick(Sender: TObject);
var
  S, ADir: string;
begin
  //Prompt for the location of the file.  We know where
  //the datafile is, but we need to remember the location of the form letter,
  //or whatever it is, so we can show it in the list.

  //Initial values before reading Registry for last directory
  if DM.TblCRMWordDocFILENAME.AsString > '' then
    ADir := ExtractFilePath(DM.TblCRMWordDocFILENAME.AsString)
  else
    ADir := GetSpecialPath(evPersonal); //iqmisc

  if IQRegStringScalarRead(Self, 'Document Directory', S) and
    (DirectoryExists(S)) then
    ADir := S;

  with SaveDialog do
  begin
    Title := crm_rscstr.cTXT0000765; //'Save Document'

    //Set default directory
    if FileExists(DM.TblCRMWordDocFILENAME.AsString) then
      FileName := DM.TblCRMWordDocFILENAME.AsString
    else
      InitialDir := ADir;

    if Execute then
    begin
      if not ValidFileName(FileName) then
        Exit;
      if not (DM.TblCRMWordDoc.State in [dsEdit, dsInsert]) then
        DM.TblCRMWordDoc.Edit;
      DM.TblCRMWordDocFILENAME.AsString := FileName;
      IQRegStringScalarWrite(Self, 'Document Directory', ExtractFilePath(FileName));
      DM.TblCRMWordDoc.Post;
      SetButtons;
    end;
  end;
end;

procedure TFrmCRMWordEdit.DoButtonClick(AWizardButton: TWizardBtn);
var
  ACurIndex, AMaxIndex: Integer;
begin
  //Post changes
  if DM.TblCRMWordDoc.State in [dsEdit, dsInsert] then
    DM.TblCRMWordDoc.Post;

  ACurIndex := pcMain.ActivePageIndex;
  AMaxIndex := pcMain.PageCount - 1;

  //Button Click action
  case AWizardButton of
    wbPrior: //What happens when user clicks the Back button?
      begin
        if (ACurIndex > 0) then
        begin
          //For "Back," we raise errors, but we allow going back
          if not PreparePageBeforeLeaving(ACurIndex, wbPrior) then
            Exit;
          if PreparePageBeforeEntering(ACurIndex - 1) then
          begin
            pcMain.ActivePageIndex := ACurIndex - 1;
            SelectTreeNodeByStep(pcMain.ActivePageIndex);
          end;
        end;
        SetButtons;
      end;
    wbNext: //What happens when user clicks the Next button?
      begin
        if PreparePageBeforeLeaving(ACurIndex, wbNext) and
          (ACurIndex < AMaxIndex) then
        begin
          PreparePageBeforeEntering(ACurIndex + 1);
          pcMain.ActivePageIndex := ACurIndex + 1;
          SelectTreeNodeByStep(pcMain.ActivePageIndex);
        end;

        SetButtons;

      end;
    wbFinish:
      DoFinishAction;
  end;
end;

function TFrmCRMWordEdit.PreparePageBeforeLeaving(ACurrentPageIndex: Integer;
  AWizardButton:
  TWizardBtn): Boolean;
begin
  Result := True; //default is True
  //Post changes
  if DM.TblCRMWordDoc.State in [dsEdit, dsInsert] then
    DM.TblCRMWordDoc.Post;

  if pcMain.Pages[ACurrentPageIndex] = TabFields then
  begin
    if FSelectedFieldsModified then
      SaveSelectedFields;
    if AWizardButton = wbNext then
      Result := lstSelectedFields.Items.Count > 0;

    if not Result and (AWizardButton = wbNext) then
      IQError(crm_rscstr.
        cTXT0000766 {'Merge fields are required.  Please select one or more fields to merge.'});
  end
  else if pcMain.Pages[ACurrentPageIndex] = TabSorting then
  begin
    if FSortByFieldsModified then
      SaveSortFields;
  end
  else if pcMain.Pages[ACurrentPageIndex] = TabCriteria then
    //raises error if user has not entered selection criteria
    Result := VerifySelectionCriteriaScreen
  else if pcMain.Pages[ACurrentPageIndex] = TabFileName then
  begin
    //No document specified
    if (DM.TblCRMWordDocFILENAME.AsString = '') then
    begin
      //crm_rscstr.cTXT0000767=
      //'You have not specified a Microsoft Word document.  ' +
      //'Do you want to continue anyway?'
      Result := IQWarningYNChk(
        crm_rscstr.cTXT0000767,
        'CRM_MAIL_MERGE_NODOCUMENTSPECIFIED');
    end
    else //file name text supplied
    begin
      Result := ValidFileName(DM.TblCRMWordDocFILENAME.AsString);
      if Result and (FileExists(DM.TblCRMWordDocFILENAME.AsString)) and
        (chkOverwriteDocument.Checked = True) then
      begin
        //crm_rscstr.cTXT0000759 =
        //Overwrite existing document?
        //'The Microsoft Word document already exists. Overwrite the current document?'
        Result := IQWarningYNChk(
          crm_rscstr.cTXT0000759,
          'CRM_MAIL_MERGE_OVERWRITEDOCUMENT');
      end;
    end;
  end;
end;

function TFrmCRMWordEdit.PreparePageBeforeEntering(
  ATargetPageIndex: Integer): Boolean;
var
  AEnabled: Boolean;
begin
  Result := True;
  if pcMain.Pages[ATargetPageIndex] = TabFields then
  begin
    //Update the selected fields only if necessary
    if (lstSelectedFields.Items.Count = 0) and
      not FSelectedFieldsModified then
    begin
      LoadAvailableFields;
      LoadSelectedFields;
    end;
  end
  else if pcMain.Pages[ATargetPageIndex] = TabSorting then
  begin
    ReOpen(DM.QrySortBy);
    UpdateSelectionCriteriaList;
    LoadSortFields;
  end
  else if pcMain.Pages[ATargetPageIndex] = TabCriteria then
  begin
    UpdateSelectionCriteriaList;
  end
  else if pcMain.Pages[ATargetPageIndex] = TabTemplate then
  begin
    AEnabled := DM.TblCRMWordDocFILENAME.AsString > '';
    IQEnableControl(rbTemplate_Blank, AEnabled); //IQMS.Common.Controls.pas
    IQEnableControl(rbTemplate_UD, AEnabled); //IQMS.Common.Controls.pas
    IQEnableControl(cmbTemplate, AEnabled); //IQMS.Common.Controls.pas
    IQEnableControl(sbtnBrowseTemplate, AEnabled); //IQMS.Common.Controls.pas
  end
  else if pcMain.Pages[ATargetPageIndex] = TabFinish then
    UpdateSummaryDisplay;

end;

procedure TFrmCRMWordEdit.UpdateSummaryDisplay;

  function _ApplyLabelFont(ALabel: TUniLabel;
    ACondition:
    Boolean;
    AFirstFont:
    TUniFont;
    ASecondFont:
    TUniFont;
    AWarningCaption:
    string = ''): Boolean;
  begin
    Result := ACondition;
    if ACondition then
      ALabel.Font := AFirstFont
    else
      ALabel.Font := ASecondFont;
    //If condition is not met, then apply the warning caption if supplied
    if not Result and (AWarningCaption > '') then
      ALabel.Caption := AWarningCaption;
  end;

var
  AID: Real;
  ASelectedCount: Integer;
  AWarningFont: TUniFont;
  ALabelFont: TUniFont;
  ADataFont: TUniFont;
  ATemplateValid, ACondition, AHasErrors: Boolean; //are there any errors?
  ACRMMergeDocumentRecord: TCRMMergeDocumentRecord;
begin
  AID := DM.TblCRMWordDocID.AsLargeInt;

  //Ensure the database file name and the table name are correct
  UpdateDatabaseAndTableName(AID);
  //Get all values from the dataset
  GetCRMMergeDocumentRecord(AID, ACRMMergeDocumentRecord);
  //How many fields are selected?
  ASelectedCount := lstSelectedFields.Items.Count;

  //Create runtime Font objects
  AWarningFont := TUniFont.Create;
  try
    //Apply Font options
    with AWarningFont do
    begin
      name := 'Tahoma';
      Color := clRed;
      Style := [fsBold];
    end;

    ALabelFont := TUniFont.Create;
    try
      with ALabelFont do
      begin
        name := 'Tahoma';
        Color := clBlack;
        Style := [fsBold];
      end;

      ADataFont := TUniFont.Create;
      try
        with ADataFont do
        begin
          name := 'Tahoma';
          Color := clBlack;
          Style := [];
        end;

        AHasErrors := False; //initial

        lblMergeDatasetSummary.Text := cmbQueries.Text;
        lblMailMergeDocumentSummary.Text := ACRMMergeDocumentRecord.FileName;
        //optional, but see ATemplateValid below
        lblMicrosoftWordTemplateSummary.Text := sIIf(
          ACRMMergeDocumentRecord.TemplateName = '',
          crm_rscstr.cTXT0001191 {'<Default>'},
          ACRMMergeDocumentRecord.TemplateName);
        lblMicrosoftAccessDatabaseSummary.Text := ACRMMergeDocumentRecord.DataFileName;
        lblMicrosoftAccessTableSummary.Text := ACRMMergeDocumentRecord.DataTableName;
        lblFieldSelectedSummary.Caption := IntToStr(ASelectedCount);

        if rbTemplate_UD.Checked then
          ATemplateValid := FileExists(ACRMMergeDocumentRecord.TemplateName)
        else
          ATemplateValid := True;

        //Dataset assigned?
        ACondition := _ApplyLabelFont(
          lblMergeDatasetLabel,
          cmbQueries.Text > '',
          ALabelFont,
          AWarningFont);

        if not ACondition then
          AHasErrors := True;
        lblMergeDatasetImage.Visible := not ACondition;

        //Document assigned?
        ACondition := _ApplyLabelFont(lblMailMergeDocumentLabel,
          ACRMMergeDocumentRecord.FileName > '', ALabelFont, AWarningFont);

        if not ACondition then
          AHasErrors := True;

        lblMailMergeDocumentImage.Visible := not ACondition;

        //Document may be assigned, but is the file name valid?
        if ACondition then
        begin
          ACondition := _ApplyLabelFont(
            lblMailMergeDocumentLabel,
            ValidFileName(ACRMMergeDocumentRecord.FileName, False),
            ALabelFont,
            AWarningFont);

          if not ACondition then
            AHasErrors := True;

          lblMailMergeDocumentImage.Visible := not ACondition;
        end;

        //Template valid?
        ACondition := _ApplyLabelFont(
          lblMicrosoftWordTemplateLabel,
          ATemplateValid,
          ALabelFont,
          AWarningFont);

        if not ACondition then
          AHasErrors := True;

        lblMicrosoftWordTemplateImage.Visible := not ACondition;

        //Merge fields selected?
        ACondition := _ApplyLabelFont(
          lblFieldSelectedLabel,
          ASelectedCount > 0,
          ALabelFont,
          AWarningFont);

        //crm_rscstr.cTXT0001195 =
        //'<No merge fields selected>'
        _ApplyLabelFont(
          lblFieldSelectedSummary,
          ASelectedCount > 0,
          ADataFont,
          AWarningFont,
          crm_rscstr.cTXT0001195);

        if not ACondition then
          AHasErrors := True;

        lblFieldSelectedImage.Visible := not ACondition;

        //Modify which labels display on the Finish screen.
        //crm_rscstr.cTXT0001549 =
        //'There are errors.  Please see the red items listed in the summary.';
        //crm_rscstr.cTXT0001548 =
        //'That is all the information required to create the mail merge document.';
        cpFinish.Text := IQMS.Common.Numbers.sIIf(
          AHasErrors,
          crm_rscstr.cTXT0001549,
          crm_rscstr.cTXT0001548);

      finally
        if Assigned(ADataFont) then
          FreeAndNil(ADataFont);
      end;
    finally
      if Assigned(ALabelFont) then
        FreeAndNil(ALabelFont);
    end;
  finally
    if Assigned(AWarningFont) then
      FreeAndNil(AWarningFont);
  end;
end;

procedure TFrmCRMWordEdit.cmbColumn1CloseUp(Sender: TObject);
var
  AFieldName: string;
begin
  AFieldName := GetComboBoxComponent('cmbColumn').Text;
  DM.AutoFillCriteriaLabel(AFieldName);
end;

procedure TFrmCRMWordEdit.cmbTemplateDropDown(Sender: TObject);
const
  REG_PATH = '\Software\Microsoft\Office\10.0\Word\Recent Templates';
var
  AKey, AValue: string;
  AValues: TStringList;
  i: Integer;
begin
//  cmbTemplate.Items.BeginUpdate;
//  try
//    cmbTemplate.Items.Clear;
//    with TWebIQRegistry.CreateRO do //iqrgstry
//      try
//        AValues := TStringList.Create;
//        try
//          RootKey := HKEY_CURRENT_USER;
//          if OpenKey(REG_PATH, False) then
//          begin
//            AValues.Sorted := True;
//            GetValueNames(AValues);
//            AValues.Sort;
//            for i := 0 to AValues.Count - 1 do
//            begin
//              AKey := Format('Template%d', [i + 1]); //Template1, Template2, etc.
//              if ValueExists(AKey) then
//              begin
//                AValue := Trim(ReadString(AKey));
//                if FileExists(AValue) and
//                  (UpperCase(ExtractFileExt(AValue)) = '.DOT') then
//                  cmbTemplate.Items.Add(AValue);
//              end;
//            end;
//          end;
//        finally
//          if Assigned(AValues) then
//            FreeAndNil(AValues);
//        end;
//      finally
//        Free;
//      end;
//  finally
//    cmbTemplate.Items.EndUpdate;
//  end;
end;

procedure TFrmCRMWordEdit.ShowHideMenu(AShow: Boolean);
begin
  PnlMenu.Visible := AShow;
  SplitterMenu.Visible := AShow;
  if AShow then
    SplitterMenu.Left := PnlMenu.Left + PnlMenu.Width + 1;
  PnlFieldSelectionResize(nil);
  Update;
end;

procedure TFrmCRMWordEdit.sbtnHideMenuClick(Sender: TObject);
begin
  ShowHideMenu(False);
end;

procedure TFrmCRMWordEdit.BuildMenu;

  procedure _addchildnode(AParent: TUniTreeNode;
    S:
    string;
    AStep:
    Integer);
  begin
    tvMenu.Items.AddChild( AParent, S ).Data:=TTVCargo.Create(AStep, False);
  end;

var
  AParentNode: TUniTreeNode;
begin
  //Adds items to the tree menu.
  //
  tvMenu.Items.BeginUpdate;
  try
    tvMenu.Items.Clear;
    {
     + Dataset Information
     - Which dataset do you want to merge?
     - Which fields do you want to display?
     - How do you want the data filtered?

     + Microsoft Word Document Information
     - Document File Name:  What do you want to name the mail merge document?
     - Document Template:  Which template do you want to use? (should it be based on a template?)

     + Record Information
     Future Reference:  What do you want to name your document record?
     (so you can easily refer to it later)
    }

    //Captions are taken from the tabsheet and the "step" is the page index
    //crm_rscstr.cTXT0000768 = 'Select Data'
    AParentNode := tvMenu.Items.Add(
      nil,
      crm_rscstr.cTXT0000768);
    AParentNode.Data := TTVCargo.Create( - 1, False);

    _addchildnode(AParentNode, pcMain.Pages[0].Caption, 0);
    _addchildnode(AParentNode, pcMain.Pages[1].Caption, 1);
    _addchildnode(AParentNode, pcMain.Pages[2].Caption, 2);
    _addchildnode(AParentNode, pcMain.Pages[3].Caption, 3);

    //crm_rscstr.cTXT0000769 = 'Mail Merge Document'
    AParentNode := tvMenu.Items.Add(
      nil,
      crm_rscstr.cTXT0000769);
    AParentNode.Data:=TTVCargo.Create( - 1, False);


    _addchildnode(AParentNode, pcMain.Pages[4].Caption, 4);
    _addchildnode(AParentNode, pcMain.Pages[5].Caption, 5);

    //crm_rscstr.cTXT0000770 = 'Finalization'
    AParentNode := tvMenu.Items.Add(
      nil,
      crm_rscstr.cTXT0000770);
      AParentNode.Data:= TTVCargo.Create( - 1, False);


    _addchildnode(AParentNode, pcMain.Pages[6].Caption, 6);
    _addchildnode(AParentNode, pcMain.Pages[7].Caption, 7);

    tvMenu.FullExpand;
    tvMenu.Selected := tvMenu.Items[1];
  finally
    tvMenu.Items.EndUpdate;
  end;
end;

procedure TFrmCRMWordEdit.SaveCampaignID;
begin
  if chkAssocCampaign.Checked and (DM.QryCampaignID.AsFloat > 0) then
    ExecuteCommandFmt(
      'UPDATE crm_word_doc SET campaign_id = %d WHERE id = %d',
      [DM.QryCampaignID.AsLargeInt,
      DM.TblCRMWordDocID.AsLargeInt])
  else
    ExecuteCommandFmt(
      'UPDATE crm_word_doc SET campaign_id = NULL WHERE id = %d',
      [DM.TblCRMWordDocID.AsLargeInt]);
end;

procedure TFrmCRMWordEdit.tvMenuGetImageIndex(Sender: TObject;
  Node:
  TUniTreeNode);
var
  AStep, AIndex: Integer;
begin
  if (Node <> nil) and (Node.Data <> nil) then
    AStep := TTVCargo(Node.Data).Step
  else
    Exit;

  with Node do
    case AStep of
      - 1:
        begin
          ImageIndex := 3;
          SelectedIndex := 4;
        end;
      0: //dataset type
        begin
          //ACompleted := ;
          ImageIndex := 1;
          SelectedIndex := 1;
        end;
      1: //selected fields
        begin
          AIndex := Integer(lstSelectedFields.Items.Count > 0);
          ImageIndex := AIndex;
          SelectedIndex := AIndex;
        end;
      2: //sort by
        begin
          AIndex := Integer(HasSortFields);
          ImageIndex := AIndex;
          SelectedIndex := AIndex;
        end;
      3: //filtering
        begin
          AIndex := Integer(FHasSelectionCriteria);
          ImageIndex := AIndex;
          SelectedIndex := AIndex;
        end;
      4: //document name
        begin
          AIndex := Integer(DM.TblCRMWordDocFILENAME.AsString > '');
          ImageIndex := AIndex;
          SelectedIndex := AIndex;
        end;
      5: //template name
        begin
          AIndex := iIIf(
            (DM.TblCRMWordDocFILENAME.AsString = '') or
            (DM.TblCRMWordDocTEMPLATENAME.IsNull),
            2 {NULL},
            1 {Checked});
          if AIndex <> 2 then //not NULL
            AIndex := iIIf((rbTemplate_UD.Checked) and
              (DM.TblCRMWordDocTEMPLATENAME.AsString = ''),
              0 {Unchecked},
              1 {Checked});
          ImageIndex := AIndex;
          SelectedIndex := AIndex;
        end;
      6: //record name
        begin
          AIndex := Integer(DM.TblCRMWordDocNAME.AsString > '');
          ImageIndex := AIndex;
          SelectedIndex := AIndex;
        end;
      7:
        begin
          ImageIndex := 5;
          SelectedIndex := 5;
        end;
    end;
end;

procedure TFrmCRMWordEdit.tvMenuClick(Sender: TObject);
var
  AStep: Integer;
  ABtn: TWizardBtn;
begin
  if (tvMenu.Selected <> nil) and (tvMenu.Selected.Data <> nil) then
    AStep := TTVCargo(tvMenu.Selected.Data).Step
  else
    Exit;

  if (AStep < 0) then
    Exit;

  //Which way are we attempting to go?
  if (AStep > pcMain.ActivePageIndex) then
    ABtn := wbNext
  else
    ABtn := wbPrior;

  if PreparePageBeforeLeaving(pcMain.ActivePageIndex, ABtn) then
  begin
    PreparePageBeforeEntering(AStep);
    pcMain.ActivePageIndex := AStep;
  end
  else
    SelectTreeNodeByStep(pcMain.ActivePageIndex);
end;

procedure TFrmCRMWordEdit.sbtnMenuPriorClick(Sender: TObject);
var
  AItem: TUniTreeNode;
begin
  AItem := tvMenu.Selected; //GetPrev;
  if AItem <> nil then
  begin
    tvMenu.Selected := AItem;
    tvMenuClick(nil);
  end;
end;

procedure TFrmCRMWordEdit.sbtnMenuNextClick(Sender: TObject);
var
  AItem: TUniTreeNode;
begin
  AItem := tvMenu.Selected; //GetNext;
  if AItem <> nil then
  begin
    tvMenu.Selected := AItem;
    tvMenuClick(nil);
  end;
end;

procedure TFrmCRMWordEdit.SelectTreeNodeByStep(AStep: Integer);
var
  i: Integer;
begin
  for i := 0 to tvMenu.Items.Count - 1 do
    if TTVCargo(tvMenu.Items[i].Data).Step = AStep then
    begin
      tvMenu.Selected := tvMenu.Items[i];
      Break;
    end;
end;

function TFrmCRMWordEdit.GetHasSelectionCriteria: Boolean;
begin
  Result := HasSelectionCriteria(DM.TblCRMWordDocID.AsLargeInt); //crmword_share.pas
  FHasSelectionCriteria := Result;
end;

function TFrmCRMWordEdit.ValidFileName(AFileName: string;
  AShowErrors:
  Boolean = True): Boolean;
const
  cInvalidChar: array [0 .. 8] of Char = ('\', '/', ':', '*', '?', '"', '<', '>', '|');
var
  APath: string;
  AName: string;
  i: Integer;
  P: PChar;
begin
  Result := Trim(AFileName) > '';
  if not Result then
    Exit;

  APath := ExtractFilePath(AFileName);
  AName := ExtractFileName(AFileName);
  Result := DirectoryExists(APath);

  if not Result then //does directory exist?  If not, show error
  begin
    if AShowErrors then
      //crm_rscstr.cTXT0000771 =
      //'The directory does not exist:'#13#13'%s'
      IQError(Format(crm_rscstr.cTXT0000771, [APath]));
  end
  else //directory exists, so check file name
  begin
    P := @cInvalidChar;
    P[high(cInvalidChar) + 1] := #0;

    for i := 0 to high(cInvalidChar) do
    begin
      Result := Pos(cInvalidChar[i], AName) = 0;
      if not Result then //Invalid character found, show error
      begin
        if AShowErrors then
          //crm_rscstr.cTXT0000772 =
          //'A file name cannot contain any of the following characters:'#13#13'%s'
          IQError(Format(crm_rscstr.cTXT0000772, [P]));
        Break;
      end;
    end;
  end;
end;

procedure TFrmCRMWordEdit.dbeDocumentCheckValue(Sender: TObject;
  PassesPictureTest:
  Boolean);
begin
  btnNext.Enabled := (dbeDocument.Text > '') and ValidFileName(dbeDocument.Text, False);
end;

procedure TFrmCRMWordEdit.sbtnRefreshFilterClick(Sender: TObject);
begin
  RefreshDataSetByID(DM.QrySortBy); //iqlib
end;

procedure TFrmCRMWordEdit.LoadSortFields;
var
  S: string;
  AAsc: Boolean;
  ASeq: Integer;
begin
  with TFDQuery.Create(nil) do
    try
      ConnectionName := cnstFDConnectionName;  // IQMS.Common.DataConst
      SQL.Add(IQFormat(
        'select * from crm_word_sql where nvl(sort_field, ''N'') = ''Y'' and ' +
        'crm_word_doc_id = %d order by seq',
        [DM.TblCRMWordDocID.AsLargeInt]));
      Open;
      First; //the select statement
      ASeq := 1;

      //Reset all fields first (but after we open dataset)
      //Sort Field combo box
      cmbSortFields1.Text := '';
      cmbSortFields2.Text := '';
      cmbSortFields3.Text := '';
      cmbSortFields4.Text := '';
      cmbSortFields5.Text := '';
      cmbSortFields6.Text := '';
      cmbSortFields7.Text := '';
      //Sort type combo box
      cmbSortType1.ItemIndex := - 1;
      cmbSortType2.ItemIndex := - 1;
      cmbSortType3.ItemIndex := - 1;
      cmbSortType4.ItemIndex := - 1;
      cmbSortType5.ItemIndex := - 1;
      cmbSortType6.ItemIndex := - 1;
      cmbSortType7.ItemIndex := - 1;

      while not EOF do
      begin
        //Get the field name from the dataset
        S := Trim(UpperCase(StrTran(FieldByName('TEXT').AsString, ',', ''))); //iqstring
        //AAsc := Occurances(' DESC', S) = 0;
        AAsc := GetToken(S, #32, 2) <> 'DESC';
        S := GetToken(S, #32, 1);
        S := FieldDisplayLabel(S);
        case ASeq of //OLD:  FieldByName('SEQ').AsInteger
          1:
            begin
              cmbSortFields1.Text := S;
              cmbSortType1.ItemIndex := Integer(not AAsc);

            end;
          2:
            begin
              cmbSortFields2.Text := S;
              cmbSortType2.ItemIndex := Integer(not AAsc);
            end;
          3:
            begin
              cmbSortFields3.Text := S;
              cmbSortType3.ItemIndex := Integer(not AAsc);
            end;
          4:
            begin
              cmbSortFields4.Text := S;
              cmbSortType4.ItemIndex := Integer(not AAsc);
            end;
          5:
            begin
              cmbSortFields5.Text := S;
              cmbSortType5.ItemIndex := Integer(not AAsc);
            end;
          6:
            begin
              cmbSortFields6.Text := S;
              cmbSortType6.ItemIndex := Integer(not AAsc);
            end;
          7:
            begin
              cmbSortFields7.Text := S;
              cmbSortType7.ItemIndex := Integer(not AAsc);
            end;
        end;

        Inc(ASeq);
        Next;

      end;
    finally
      Free;
    end;
end;

procedure TFrmCRMWordEdit.SaveSortFields;

  procedure _saveValue(AFieldName: string;
    ASeq:
    Integer;
    AAsc:
    Boolean);
  var
    AText: string;
  begin
    if AAsc then
      AText := Format('%s ASC', [AFieldName])
    else
      AText := Format('%s DESC', [AFieldName]);
    ExecuteCommandFmt(
      'insert into crm_word_sql (id, crm_word_doc_id, seq, text, sort_field) ' +
      'values (s_crm_word_sql.nextval, %d, %d, ''%s'', ''Y'') ',
      [DM.TblCRMWordDocID.AsLargeInt, ASeq, AText]);
  end;

begin
  //Remove old data
  ExecuteCommandFmt(
    'delete from crm_word_sql where crm_word_doc_id = %d and NVL(sort_field, ''N'') = ''Y'' ',
    [DM.TblCRMWordDocID.AsLargeInt]);

  //Add new data
  if cmbSortFields1.Text > '' then
    _saveValue(cmbSortFields1.Text, 1, cmbSortType1.ItemIndex = 0);
  if cmbSortFields2.Text > '' then
    _saveValue(cmbSortFields2.Text, 2, cmbSortType2.ItemIndex = 0);
  if cmbSortFields3.Text > '' then
    _saveValue(cmbSortFields3.Text, 3, cmbSortType3.ItemIndex = 0);
  if cmbSortFields4.Text > '' then
    _saveValue(cmbSortFields4.Text, 4, cmbSortType4.ItemIndex = 0);
  if cmbSortFields5.Text > '' then
    _saveValue(cmbSortFields5.Text, 5, cmbSortType5.ItemIndex = 0);
  if cmbSortFields6.Text > '' then
    _saveValue(cmbSortFields6.Text, 6, cmbSortType6.ItemIndex = 0);
  if cmbSortFields7.Text > '' then
    _saveValue(cmbSortFields7.Text, 7, cmbSortType7.ItemIndex = 0);
  FSortByFieldsModified := False;
end;

function TFrmCRMWordEdit.HasSortFields: Boolean;
begin
  Result := (SelectValueFmtAsInteger(
    'SELECT 1 FROM crm_word_sql '#13 +
    'WHERE crm_word_doc_id = %d AND '#13 +
    '      NVL(sort_field, ''N'') = ''Y'' AND'#13 +
    '      ROWNUM < 2',
    [DM.TblCRMWordDocID.AsLargeInt]) > 0) or
    FSortByFieldsModified;
end;

procedure TFrmCRMWordEdit.DoSortByFieldChange(Sender: TObject);
begin
  if not Self.Showing then
    Exit;
  FSortByFieldsModified := True;
end;

procedure TFrmCRMWordEdit.cmbSortFields1CloseUp(Sender: TObject);
begin
  with cmbSortType1 do
    if (ItemIndex = - 1) and (cmbSortFields1.Text > '') then
      ItemIndex := 0;
end;

procedure TFrmCRMWordEdit.cmbSortFields2CloseUp(Sender: TObject);
begin
  with cmbSortType2 do
    if (ItemIndex = - 1) and (cmbSortFields2.Text > '') then
      ItemIndex := 0;
end;

procedure TFrmCRMWordEdit.cmbSortFields3CloseUp(Sender: TObject);
begin
  with cmbSortType3 do
    if (ItemIndex = - 1) and (cmbSortFields3.Text > '') then
      ItemIndex := 0;
end;

procedure TFrmCRMWordEdit.cmbSortFields4CloseUp(Sender: TObject);
begin
  with cmbSortType4 do
    if (ItemIndex = - 1) and (cmbSortFields4.Text > '') then
      ItemIndex := 0;
end;

procedure TFrmCRMWordEdit.cmbSortFields5CloseUp(Sender: TObject);
begin
  with cmbSortType5 do
    if (ItemIndex = - 1) and (cmbSortFields5.Text > '') then
      ItemIndex := 0;
end;

procedure TFrmCRMWordEdit.cmbSortFields6CloseUp(Sender: TObject);
begin
  with cmbSortType6 do
    if (ItemIndex = - 1) and (cmbSortFields6.Text > '') then
      ItemIndex := 0;
end;

procedure TFrmCRMWordEdit.cmbSortFields7CloseUp(Sender: TObject);
begin
  with cmbSortType7 do
    if (ItemIndex = - 1) and (cmbSortFields7.Text > '') then
      ItemIndex := 0;
end;

procedure TFrmCRMWordEdit.sbtnClearSortField1Click(Sender: TObject);
begin
  cmbSortFields1.Clear;
  cmbSortType1.ItemIndex := - 1;
end;

procedure TFrmCRMWordEdit.sbtnClearSortField2Click(Sender: TObject);
begin
  cmbSortFields2.Clear;
  cmbSortType2.ItemIndex := - 1;
end;

procedure TFrmCRMWordEdit.sbtnClearSortField3Click(Sender: TObject);
begin
  cmbSortFields3.Clear;
  cmbSortType3.ItemIndex := - 1;
end;

procedure TFrmCRMWordEdit.sbtnClearSortField4Click(Sender: TObject);
begin
  cmbSortFields4.Clear;
  cmbSortType4.ItemIndex := - 1;
end;

procedure TFrmCRMWordEdit.sbtnClearSortField5Click(Sender: TObject);
begin
  cmbSortFields5.Clear;
  cmbSortType5.ItemIndex := - 1;
end;

procedure TFrmCRMWordEdit.sbtnClearSortField6Click(Sender: TObject);
begin
  cmbSortFields6.Clear;
  cmbSortType6.ItemIndex := - 1;
end;

procedure TFrmCRMWordEdit.sbtnClearSortField7Click(Sender: TObject);
begin
  cmbSortFields7.Clear;
  cmbSortType7.ItemIndex := - 1;
end;

procedure TFrmCRMWordEdit.cmbCampaignCloseUp(Sender: TObject;
  LookupTable,
  FillTable: TDataSet;
  modified:
  Boolean);
begin
  Application.ProcessMessages;
  chkAssocCampaign.Checked := DM.QryCampaignID.AsLargeInt > 0;
  FCampaignModified := True;
end;

procedure TFrmCRMWordEdit.chkAssocCampaignClick(Sender: TObject);
begin
  Application.ProcessMessages;
  FCampaignModified := True;
end;

end.
