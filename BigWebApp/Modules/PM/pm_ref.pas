unit pm_ref;

interface

{ NOTE:  This can be called outside of IQPM.
  Do not declare module-specific units. }

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.RepDef,
  Vcl.Buttons,
  IQMS.WebVcl.Jump,
  IQMS.Common.JumpConstants,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
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
  System.ImageList,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniImageList,
  uniTreeView,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel;

type
  { TTVCargo }
  TTVCargo = class
    // for PMEQMT recs = SourceID; for PMEQMT_LINK recs = Master PMEQMT ID
    Master_PMEQMT_ID: Int64;
    // for PMEQMT recs = SourceID; for PMEQMT_LINK recs = PMEQMT_LINK.PMEQMT_ID_LINKED
    Assoc_PMEQMT_ID: Int64;
    Source: string;
    SourceID: Int64;
    Caption: string;
    Hint: string;
    HasCircularLink: Boolean; // for linked PMEQMT, is it circular
    constructor Create(ACaption, ASource: string; ASourceID, AMaster_PMEQMT_ID,
      AAssoc_PMEQMT_ID: Integer; AHint: string);
  end;

  { TPkFilterRec }
  TPkFilterRec = record
    PMEQMT_ID: Integer;
    PMLINK_ID: Integer;
    Caption: string;
  end;

  { TFrmPMRef }
  TFrmPMRef = class(TUniForm)
    PnlMain: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Search1: TUniMenuItem;
    IQRepDef1: TIQWebRepDef;
    IQAbout1: TIQWebAbout;
    PTreeView: TUniPopupMenu;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PnlTreeView: TUniPanel;
    JumptoPreventativeMaintenance1: TUniMenuItem;
    Options1: TUniMenuItem;
    SortBy1: TUniMenuItem;
    SortByEquipment1: TUniMenuItem;
    SortByDescription1: TUniMenuItem;
    SortByClass1: TUniMenuItem;
    TreeView: TUniTreeView;
    ImageList1: TUniImageList;
    AddEquipment1: TUniMenuItem;
    RemoveEquipment1: TUniMenuItem;
    N1: TUniMenuItem;
    PKEquip: TIQWebHPick;
    PKEquipID: TBCDField;
    PKEquipEQNO: TStringField;
    PKEquipCLASS: TStringField;
    PKEquipDESCRIP: TStringField;
    PKEquipMODEL: TStringField;
    PKEquipSERIALNO: TStringField;
    PKEquipINST_DATE: TDateTimeField;
    PKEquipTOTAL_UNITS: TBCDField;
    PKEquipLOCATION: TStringField;
    PKEquipCOMPANY: TStringField;
    PKEquipUOM: TStringField;
    PKEquipEPLANT_ID: TBCDField;
    PKEquipNAME: TStringField;
    View1: TUniMenuItem;
    RefreshAll1: TUniMenuItem;
    PnlControls: TUniPanel;
    Bevel1: TUniPanel;
    PnlDbCtrls: TUniPanel;
    sbtnInsert: TUniSpeedButton;
    sbtnDelete: TUniSpeedButton;
    RefreshCurrent1: TUniMenuItem;
    N2: TUniMenuItem;
    sbtnRefresh: TUniSpeedButton;
    WhereUsed1: TUniMenuItem;
    PkWhereUsed: TIQWebHPick;
    PkWhereUsedEQNO: TStringField;
    PkWhereUsedCLASS: TStringField;
    PkWhereUsedDESCRIP: TStringField;
    PkWhereUsedMODEL: TStringField;
    PkWhereUsedSERIALNO: TStringField;
    PkWhereUsedCUSTNO: TStringField;
    PkWhereUsedCOMPANY: TStringField;
    PkWhereUsedEPLANT_ID: TBCDField;
    PkWhereUsedPK_HIDE: TStringField;
    PkWhereUsedPMLINK_ID: TBCDField;
    PkWhereUsedPMEQMT_ID: TBCDField;
    WhereUsed2: TUniMenuItem;
    Contents1: TUniMenuItem;
    PnlSort: TUniPanel;
    lblSortBy: TUniLabel;
    cmbSortBy: TUniComboBox;
    Panel2: TUniPanel;
    Bevel2: TUniPanel;
    sbtnExpandTree: TUniSpeedButton;
    sbtnCollapseTree: TUniSpeedButton;
    sbtnWhereUsed: TUniSpeedButton;
    sbtnSearch: TUniSpeedButton;
    Bevel3: TUniPanel;
    Bevel4: TUniPanel;
    SR: TIQWebSecurityRegister;
    PHidden: TUniPopupMenu;
    AllowDragDrop: TUniMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Search1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure AssignID(DataSet: TDataSet);
    procedure JumptoPreventativeMaintenance1Click(Sender: TObject);
    procedure SortFieldClick(Sender: TObject);
    procedure SortBy1Click(Sender: TObject);
    procedure TreeViewExpanding(Sender: TObject; Node: TUniTreeNode;
      var AllowExpansion: Boolean);
    procedure TreeViewChange(Sender: TObject; Node: TUniTreeNode);
    procedure AddEquipment1Click(Sender: TObject);
    procedure TreeViewDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TreeViewDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure RefreshAll1Click(Sender: TObject);
    procedure RemoveEquipment1Click(Sender: TObject);
    procedure PTreeViewPopup(Sender: TObject);
    procedure sbtnExpandTreeClick(Sender: TObject);
    procedure sbtnCollapseTreeClick(Sender: TObject);
    procedure TreeViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RefreshCurrent1Click(Sender: TObject);
    procedure WhereUsed1Click(Sender: TObject);
    procedure PkWhereUsedBeforeOpen(DataSet: TDataSet);
    procedure Options1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure cmbSortByClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure PnlControlsResize(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FSortField: string;
    FTreeLoading: Boolean;
    FClassFilter: string;
    FAbort: Boolean;
    FPkFilterRec: TPkFilterRec;
    FWhereUsedPrompt: Boolean;
    FPMEQMT_ID: Integer;

    // procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;

    procedure SetButtons;
    function CheckCancelClicked: Boolean; // True = Cancel
    // TreeView methods
    procedure ClearTree;
    procedure LoadTree;
    procedure LoadEquipNodes;
    procedure LoadChildNodes(ANode: TUniTreeNode);

    function AddNode(AParentNode: TUniTreeNode; ACaption, ASource: string;
      ASourceID, AMaster_PMEQMT_ID, AAssoc_PMEQMT_ID: Integer; AHint: string)
      : TUniTreeNode;
    function LocateNode(ASource: string; ASourceID: Integer): TUniTreeNode;
    procedure UpdateChildCount(ANode: TUniTreeNode);
    function SearchWhereUsed(AFilter: TPkFilterRec;
      var ACancelled: Boolean): Boolean;

    procedure UpdatePkFilterRec;
    function GetSelectedEquipmentID: Integer;
    function GetSelectedLinkID: Integer;
    function GetSelectedCaption: string;

    // Record operations
    procedure InsertLink;
    procedure RemoveLink; // refers to selected

    function DB_InsertPMLink(AMasterPMEqmtID, ALinkPMEqmtID: Int64;
      var ANewPMLinkID: Int64): Boolean;
    function DB_MovePMLink(APMLinkID: Int64;
      ANew_Master_PMEqmtID: Int64): Boolean;
    function DB_RemovePMLink(APMLinkID: Int64): Boolean;

    function Validate(AMasterPMEqmtID, ALinkPMEqmtID: Integer;
      ARaiseError: Boolean): Boolean;

    procedure SetComboboxSortField(AFieldName: string);
    function GetComboboxSortField: string;
    procedure UpdateClassFilter(const Value: string);

    function NoCircularReferencesExist(APMEqmtID, ALinkPMEqmtID
      : Integer): Boolean;
    // function HasCircularReferences(APMEqmtID: Integer): Boolean;

    procedure UnloadTree;
    procedure SetWhereUsedPrompt(const Value: Boolean);
    procedure SetPMEQMT_ID(const Value: Integer);

  public
    { Public declarations }

    property ClassFilter: string read FClassFilter write UpdateClassFilter;
    property PMEQMT_ID: Integer write SetPMEQMT_ID;
    property WhereUsedPrompt : Boolean write SetWhereUsedPrompt;

  end;

procedure DoPMRef(APMEQMT_ID: Real = 0; AClassFilter: string = '');
procedure DoPMRefWhereUsed(APMEQMT_ID: Real = 0; AClassFilter: string = '');

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.ProgressDialog,
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs,
  IQMS.Common.StringUtils,
  IQMS.Common.DataLib,
  IQMS.Common.PanelMsg,
  pm_rscstr;

procedure DoPMRef(APMEQMT_ID: Real; AClassFilter: string);
var
  FrmPMRef: TFrmPMRef;
begin
  FrmPMRef := TFrmPMRef.Create(uniGUIApplication.uniApplication);
  with FrmPMRef do
  begin
    ClassFilter := AClassFilter;
    PMEQMT_ID := Trunc(APMEQMT_ID);
    WhereUsedPrompt := False;
    Show;
  end;
end;

procedure DoPMRefWhereUsed(APMEQMT_ID: Real; AClassFilter: string);
var
  FrmPMRefWhereUsed: TFrmPMRef;
begin
  FrmPMRefWhereUsed := TFrmPMRef.Create(uniGUIApplication.uniApplication);
  with FrmPMRefWhereUsed do
  begin
    ClassFilter := AClassFilter;
    PMEQMT_ID := Trunc(APMEQMT_ID);
    WhereUsedPrompt := True;
    Show;
  end;
end;

{ TTVCargo }

constructor TTVCargo.Create(ACaption, ASource: string;
  ASourceID, AMaster_PMEQMT_ID, AAssoc_PMEQMT_ID: Integer; AHint: string);
begin
  Caption := ACaption;
  Source := ASource; // i.e., PMEQMT, PMEQMT_LINK
  SourceID := ASourceID; // ID in source table
  Master_PMEQMT_ID := AMaster_PMEQMT_ID; // master PMEQMT.ID
  Assoc_PMEQMT_ID := AAssoc_PMEQMT_ID;
  // associated PMEQMT.ID (what is displayed in tree?)
  Hint := AHint;
end;

{ TFrmPMRef }

procedure TFrmPMRef.FormShow(Sender: TObject);
var
  AFilter: TPkFilterRec;
  ACancelled: Boolean;
begin
  // 07/24/2012 Prompt for where used
  // SER# 03017 - PM - Association Manager - bring visibility to the upper level
  if FWhereUsedPrompt then
  begin
    AFilter.PMEQMT_ID := FPMEQMT_ID;
    AFilter.PMLINK_ID := 0;
    AFilter.Caption := '';
    SearchWhereUsed(AFilter, ACancelled);
  end
  else if (FPMEQMT_ID <> 0) then // prompt
    LocateNode('PMEQMT', FPMEQMT_ID);

  //PostMessage(Handle, iq_AfterShowMessage, 0, 0);
  sbtnInsert.Enabled := SR.Enabled['AddEquipment1'];
  sbtnDelete.Enabled := SR.Enabled['RemoveEquipment1'];
  if not SR.Enabled['AllowDragDrop'] then
    { TODO -oSanketG -cWebConvert : Need to revisit ,
    [dcc32 Error] pm_ref.pas(346): E2362 Cannot access protected symbol TControl.DragMode}
    //TreeView.DragMode := dmManual;
end;

procedure TFrmPMRef.UniFormCreate(Sender: TObject);
var
  AFilter: TPkFilterRec;
  ACancelled: Boolean;
begin
  FSortField := 'EQNO'; // default
  FAbort := False;

  // Set form after datasets are opened
  { TODO -oSanketG -cWebConvert : Need to revisit ,
  [dcc32 Error] pm_ref.pas(358): E2010 Incompatible types: 'TForm' and 'TFrmPMRef'}
  //CenterForm(Self); // iqctrl
  IQRegFormRead(Self, [Self]); // iqregfrm
  if not IQRegStringScalarRead(Self, 'Sort Field', FSortField) then
    FSortField := 'EQNO';
  // Set the combo box "sort by" display
  SetComboboxSortField(FSortField); // local method, see below
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlSort);
  LoadTree;

  // close the form if user aborted
  if FAbort then
    //PostMessage(Handle, WM_COMMAND, Exit1.Command, 0);
  
end;

procedure TFrmPMRef.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  IQRegFormWrite(Self, [Self]); // iqscreen
  if (Trim(FSortField) = '') then
    FSortField := 'EQNO';
  IQRegStringScalarWrite(Self, 'Sort Field', FSortField);
  // IQMS.Common.RegFrm.pas

  if not FAbort then
    UnloadTree;

end;

procedure TFrmPMRef.Search1Click(Sender: TObject);
var
  ANode: TUniTreeNode;
begin
  with PKEquip do
    if Execute then
    begin
      ANode := LocateNode('PMEQMT', GetValue('ID'));
      if (ANode = nil) then
        // pm_rscstr.cTXT0000119 = 'Could not find selected equipment'
        IQError(pm_rscstr.cTXT0000119);
    end
    else
      System.SysUtils.Abort; // for when this is called from constructor
end;

procedure TFrmPMRef.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPMRef.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmPMRef.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmPMRef.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmPMRef.SetButtons;
begin
  sbtnDelete.Enabled := (TreeView.Selected <> nil) and
    (TTVCargo(TreeView.Selected.Data).Source <> 'PMEQMT');
end;

procedure TFrmPMRef.AssignID(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); // iqlib
end;

procedure TFrmPMRef.JumptoPreventativeMaintenance1Click(Sender: TObject);
var
  AID: Integer;
begin
  if (TreeView.Selected <> nil) and (TreeView.Selected.Data <> nil) then
  begin
    AID := TTVCargo(TreeView.Selected.Data).Assoc_PMEQMT_ID;
    IQMS.WebVcl.Jump.JumpDirect(iq_JumpToPM, AID);
  end;
end;

function TFrmPMRef.AddNode(AParentNode: TUniTreeNode; ACaption, ASource: string;
  ASourceID, AMaster_PMEQMT_ID, AAssoc_PMEQMT_ID: Integer; AHint: string)
  : TUniTreeNode;
begin
  { TODO -oSanketG -cWebConvert : Need to find alternative for AddChildObject in TuniTreeNode  }
  {Result := TreeView.Items.AddChildObject(AParentNode, ACaption,
    TTVCargo.Create(ACaption, ASource, ASourceID, AMaster_PMEQMT_ID,
    AAssoc_PMEQMT_ID, AHint));}
end;

procedure TFrmPMRef.UnloadTree;
var
  i: Integer;
  APrg: TIQWebProgressDialog;
begin
  Self.Visible := False;
  try
    TreeView.Items.BeginUpdate;
    TreeView.OnChange := nil;
    { TODO -oSanketG -cWebConvert : Need to find alternative for OnChanging, OnGetImageIndex, OnGetSelectedIndex in TuniTreeView  }
    {TreeView.OnChanging := nil;
    TreeView.OnGetImageIndex := nil;
    TreeView.OnGetSelectedIndex := nil;}
    TreeView.Visible := False;

    APrg := TIQWebProgressDialog.Create(Application);
    // IQMS.Common.ProgressDialog.pas
    APrg.MinProgress := 0;
    APrg.MaxProgress := TreeView.Items.Count;
    APrg.Caption := '';
    APrg.Execute;
    APrg.Status1 := pm_rscstr.cTXT0000183; // 'Unloading Equipment:'
    APrg.CancelBtn.Enabled := False;
    APrg.ProgressBar.Position := TreeView.Items.Count;
    Application.ProcessMessages;

    for i := TreeView.Items.Count - 1 downto 0 do
    begin
      APrg.ProgressBar.Position := i;
      APrg.Status2 := TreeView.Items[i].Text;
      Application.ProcessMessages;
      TTVCargo(TreeView.Items[i].Data).Free;
    end;
    APrg.Status2 := pm_rscstr.cTXT0000184; // 'Please wait...'
    Application.ProcessMessages;
    TreeView.Items.Clear;
  finally
    TreeView.Items.EndUpdate;
    if Assigned(APrg) then
      FreeAndNil(APrg);
  end;
end;

procedure TFrmPMRef.LoadTree;
var
  hMsg: TPanelMesg;
begin
  try
    FTreeLoading := True;
    TreeView.Items.BeginUpdate;
    TreeView.OnChange := nil;
    { TODO -oSanketG -cWebConvert : Need to find alternative for OnExpanding in TuniTreeView  }
    //TreeView.OnExpanding := nil;
    ClearTree;
    LoadEquipNodes;
    TreeView.Visible := (TreeView.Items.Count > 0);
  finally
    TreeView.Items.EndUpdate;
    TreeView.OnChange := TreeViewChange;
    { TODO -oSanketG -cWebConvert : Need to find alternative for OnExpanding in TuniTreeView  }
    //TreeView.OnExpanding := TreeViewExpanding;
    FTreeLoading := False;
  end;

end;

procedure TFrmPMRef.LoadEquipNodes;
var
  ACaption, AHint: string;
  ANode: TUniTreeNode;
  APrg: TIQWebProgressDialog;
  i, APMEqmtID, ALinkCount: Integer;
begin
  APrg := TIQWebProgressDialog.Create(Application);
  // IQMS.Common.ProgressDialog.pas
  try
    APrg.MinProgress := 0;
    APrg.MaxProgress := SelectValueAsInteger
      ('SELECT COUNT(*) FROM v_pmlink_eqmt');
    APrg.Caption := '';
    APrg.Execute;
    APrg.Status1 := pm_rscstr.cTXT0000181; // 'Initializing ...';
    APrg.CancelBtn.OnClick := CancelButtonClick; // cancel button
    Application.ProcessMessages;

    FSortField := GetComboboxSortField;
    if Trim(FSortField) = '' then
      FSortField := 'EQNO';
    with TFDQuery.Create(nil) do
      try
        Connection := UniMainModule.FDConnection1;
        SQL.Add('SELECT id, eqno, descrip, class, link_count');
        SQL.Add('  FROM v_pmlink_eqmt');
        SQL.Add('   WHERE misc.eplant_filter(eplant_id) = 1');
        SQL.Add(Format('ORDER BY %s', [FSortField]));
        Open;
        APrg.Status1 := pm_rscstr.cTXT0000182; // 'Loading Equipment:';
        while not EOF do
        begin
          if CheckCancelClicked then
          begin
            APrg.CancelBtn.Enabled := False;
            BREAK;
          end;

          APMEqmtID := FieldByName('ID').AsLargeInt;
          ALinkCount := FieldByName('LINK_COUNT').AsLargeInt;
          ACaption := Format('%s - %s [%s]', [FieldByName('EQNO').AsString,
            FieldByName('DESCRIP').AsString, FieldByName('CLASS').AsString]);
          APrg.Status2 := ACaption;
          AHint := '';
          ANode := AddNode(nil, ACaption, 'PMEQMT', APMEqmtID, APMEqmtID,
            APMEqmtID, AHint);
          // Add node count
          if (ALinkCount > 0) then
          begin
            ANode.Text := ACaption + Format(' (%d)', [ALinkCount]);
            // Add a blank node to show the [+] symbol
            { TODO -oSanketG -cWebConvert : Need to find alternative for AddChildFirst in TuniTreeNode  }
            //TreeView.Items.AddChildFirst(ANode, '');
          end;

          // Prevent "lock up."  We want users to be able to click around
          // while we update.
          Application.ProcessMessages;

          APrg.StepProgress;

          Next;
        end;
      finally
        Free;
        ANode := nil; // dereference
      end;

    if FAbort then
    begin
      APrg.Status1 := pm_rscstr.cTXT0000183; // 'Unloading Equipment:'
      APrg.Status2 := '';
      APrg.CancelBtn.Enabled := False;
      Application.ProcessMessages;
      TreeView.OnChange := nil;
      { TODO -oSanketG -cWebConvert : Need to find alternative for OnChanging, OnGetImageIndex, OnGetSelectedIndex in TuniTreeView  }
      {TreeView.OnChanging := nil;
      TreeView.OnGetImageIndex := nil;
      TreeView.OnGetSelectedIndex := nil;}
      TreeView.Visible := False;
      for i := TreeView.Items.Count - 1 downto 0 do
      begin
        APrg.ProgressBar.Position := i;
        APrg.Status2 := TreeView.Items[i].Text;
        Application.ProcessMessages;
        TTVCargo(TreeView.Items[i].Data).Free;
      end;
      APrg.Status2 := pm_rscstr.cTXT0000184; // 'Please wait...'
      Application.ProcessMessages;
      TreeView.Items.Clear;
    end;

  finally
    if Assigned(APrg) then
      FreeAndNil(APrg);
  end;
end;

procedure TFrmPMRef.LoadChildNodes(ANode: TUniTreeNode);
var
  ACaption, AHint: string;
  APMEQMT_ID: Int64;
  i: Integer;
  ACursor: Integer;
  AChildNode: TUniTreeNode;
begin
  if FTreeLoading or (ANode = nil) or (ANode.Data = nil) or
    (TTVCargo(ANode.Data).Source <> 'PMEQMT') then
    Exit;

  TreeView.Items.BeginUpdate;
  try

    // We are going to remove the SQL Wait cursor temporarily
    ACursor := Screen.Cursors[crSQLWait];
    Screen.Cursors[crSQLWait] := Screen.Cursors[crArrow];
    try
      // Remove nodes with no captions.  One may be added when the tree is first
      // loaded.  Only applies to equipment with existing links.
      for i := ANode.Count - 1 downto 0 do
        if Trim(ANode.Item[i].Text) = '' then
          { TODO -oSanketG -cWebConvert : Need to find alternative for Delete in TuniTreeNode  }
          //ANode.Item[i].Delete;

      // Exit if there are still children
      if (ANode.HasChildren = True) then
        Exit;

      APMEQMT_ID := TTVCargo(ANode.Data).SourceID;

      with TFDQuery.Create(nil) do
        try
          Connection := UniMainModule.FDConnection1;
          SQL.Add('   SELECT pmlink_id, master_pmeqmt_id, pmeqmt_id_linked,');
          SQL.Add('          eqno, class, descrip');
          SQL.Add('     FROM v_pmlink');
          SQL.Add(Format('    WHERE master_pmeqmt_id = %d', [APMEQMT_ID]));
          SQL.Add(Format(' ORDER BY %s', [FSortField]));
          Open;
          while not EOF do
          begin
            ACaption := Format('%s - %s', [FieldByName('EQNO').AsString,
              FieldByName('DESCRIP').AsString]);
            AHint := '';
            AChildNode := AddNode(ANode, ACaption, 'PMEQMT_LINK',
              FieldByName('PMLINK_ID').AsLargeInt,
              FieldByName('MASTER_PMEQMT_ID').AsLargeInt,
              FieldByName('PMEQMT_ID_LINKED').AsLargeInt, AHint);
            if (AChildNode <> nil) then
            begin
              AChildNode.ImageIndex := 2;
              AChildNode.SelectedIndex := 2;
            end;
            Application.ProcessMessages;
            Next;
          end;
        finally
          Free;
        end;

    finally
      Screen.Cursor := crArrow; // necessary, or SQL wait will appear again
      Screen.Cursors[crSQLWait] := ACursor;
    end;
  finally
    TreeView.Items.EndUpdate;
  end;
end;

procedure TFrmPMRef.ClearTree;
begin
  { TODO -oSanketG -cWebConvert : Need to revisit ,
  [dcc32 Error] pm_ref.pas(696): E2010 Incompatible types: 'TTreeView' and 'TUniTreeView'}
  //IQMS.Common.Controls.ClearTreeView(TreeView);
end;

procedure TFrmPMRef.SortFieldClick(Sender: TObject);
begin
  case TComponent(Sender).Tag of
    1:
      FSortField := 'DESCRIP';
    2:
      FSortField := 'CLASS';
  else
    FSortField := 'EQNO';
  end;
  SetComboboxSortField(FSortField);
end;

procedure TFrmPMRef.SortBy1Click(Sender: TObject);
begin
  if (FSortField = 'DESCRIP') then
    SortByDescription1.Checked := True
  else if (FSortField = 'CLASS') then
    SortByClass1.Checked := True
  else
    SortByEquipment1.Checked := True;
end;

procedure TFrmPMRef.TreeViewChange(Sender: TObject; Node: TUniTreeNode);
begin
  with TreeView do
    if Visible and Assigned(Node) then
    begin
      LoadChildNodes(Node);
      SetButtons;
    end;
end;

procedure TFrmPMRef.TreeViewExpanding(Sender: TObject; Node: TUniTreeNode;
  var AllowExpansion: Boolean);
begin
  with TreeView do
    if Visible and Assigned(Node) then
      LoadChildNodes(Node); // If this a folder - check if it's loaded
end;

procedure TFrmPMRef.AddEquipment1Click(Sender: TObject);
begin
  InsertLink;
end;

procedure TFrmPMRef.RemoveEquipment1Click(Sender: TObject);
begin
  RemoveLink;
end;

procedure TFrmPMRef.RefreshAll1Click(Sender: TObject);
begin
  // Prevents a certain amount of discoloration
  Update;
  Application.ProcessMessages;
  LoadTree;
end;

procedure TFrmPMRef.RefreshCurrent1Click(Sender: TObject);
begin
  if (TreeView.Selected <> nil) then
    with TreeView do
    begin
      Items.BeginUpdate;
      try
        Selected.Collapse(True);
        { TODO -oSanketG -cWebConvert : Need to find alternative for DeleteChildren in TuniTreeNode  }
        //Selected.DeleteChildren;
        LoadChildNodes(Selected);
        Selected.Expand(False);
      finally
        Items.EndUpdate;
      end;
    end
  else
    RefreshAll1Click(Sender);
end;

procedure TFrmPMRef.InsertLink;
var
  AParentNode: TUniTreeNode;
  AMasterID, ALinkID, AID: Int64;
  AEqno, ADescrip, ACaption: string;
begin
  if (TreeView.Selected = nil) or not SR.Enabled['AddEquipment1'] then
    Exit;

  if (TTVCargo(TreeView.Selected.Data).Source <> 'PMEQMT') then
    AParentNode := TreeView.Selected.Parent
  else
    AParentNode := TreeView.Selected;

  if (AParentNode = nil) then
    Exit;

  AMasterID := TTVCargo(AParentNode.Data).Master_PMEQMT_ID;

  with PKEquip do
    if Execute then
    begin
      ALinkID := GetValue('ID'); // ID of equip we will link

      // First, let's validate.  Is this record allowed here?
      if not Validate(AMasterID, ALinkID, True) then
        Exit;

      // Get caption for display purposes only
      AEqno := GetValue('EQNO');
      ADescrip := GetValue('DESCRIP');
      ACaption := Format('%s - %s', [AEqno, ADescrip]);
      // Now add it to database
      if DB_InsertPMLink(AMasterID, ALinkID, AID { var param } ) then
        AddNode(AParentNode, ACaption, 'PMEQMT_LINK', AID, AMasterID,
          ALinkID, '');
      UpdateChildCount(AParentNode);
    end;
end;

procedure TFrmPMRef.RemoveLink;
var
  AID: Int64;
  AParent: TUniTreeNode;
begin
  // Check for NIL
  if (TreeView.Selected = nil) or (TreeView.Selected.Data = nil) or
    not SR.Enabled['RemoveEquipment1'] then
    Exit;
  // We don't remove master equipment records
  if (TTVCargo(TreeView.Selected.Data).Source = 'PMEQMT') then
    Exit;
  AParent := TreeView.Selected.Parent;
  // pm_rscstr.cTXT0000277 = 'Remove the selected link?'
  if IQConfirmYN(pm_rscstr.cTXT0000277) then
  begin
    TreeView.Items.BeginUpdate;
    try
      // Assumes source is PMEQMT_LINK
      AID := TTVCargo(TreeView.Selected.Data).SourceID;
      DB_RemovePMLink(AID);
      { TODO -oSanketG -cWebConvert : Need to find alternative for Delete in TuniTreeNode  }
      //TreeView.Selected.Delete;
      UpdateChildCount(AParent);
    finally
      TreeView.Items.EndUpdate;
    end;
  end;
end;

function TFrmPMRef.DB_InsertPMLink(AMasterPMEqmtID, ALinkPMEqmtID: Int64;
  var ANewPMLinkID: Int64): Boolean;
var
  ASQL: TStringList;
begin
  // NOTE:  This method just updates the database.  It does not change the tree.
  Result := False;
  if (AMasterPMEqmtID = 0) or (ALinkPMEqmtID = 0) then
    Exit;
  ASQL := TStringList.Create;
  try
    ASQL.Add('INSERT INTO pmeqmt_link(id,');
    ASQL.Add('                        pmeqmt_id,');
    ASQL.Add('                        pmeqmt_id_linked,');
    ASQL.Add('                        created,');
    ASQL.Add('                        createdby)');
    ASQL.Add(Format('    VALUES (s_pmeqmt_link.NEXTVAL, %d, %d, ',
      [AMasterPMEqmtID, ALinkPMEqmtID]));
    ASQL.Add('                        SYSDATE, misc.getusername)');
    ExecuteCommand(ASQL.Text);
  finally
    if Assigned(ASQL) then
      FreeAndNil(ASQL);
  end;
  Result := True;
end;

function TFrmPMRef.DB_RemovePMLink(APMLinkID: Int64): Boolean;
begin
  ExecuteCommandFmt('DELETE FROM pmeqmt_link WHERE id = %d', [APMLinkID]);
end;

function TFrmPMRef.DB_MovePMLink(APMLinkID: Int64;
  ANew_Master_PMEqmtID: Int64): Boolean;
begin
  // NOTE:  This method just updates the database.  It does not change the tree.
  Result := False;
  if (ANew_Master_PMEqmtID = 0) or (APMLinkID = 0) then
    Exit;
  // Set the new master.  NOTE:  We do not change the link information.
  ExecuteCommandFmt('UPDATE pmeqmt_link SET pmeqmt_id = %d WHERE id = %d ',
    [ANew_Master_PMEqmtID, APMLinkID]);
  Result := True;
end;

procedure TFrmPMRef.TreeViewDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  AParentNode, ANewNode, Destination: TUniTreeNode;
  AID, APMLinkID, AMaster_PMEqmtID, ALinked_PMEqmtID: Int64;
begin
  AParentNode := nil; // initialize
  Destination := nil; // initialize

  // Get basic node information and valid
  if (TreeView.Selected = nil) or not SR.Enabled['AllowDragDrop'] then
    Exit;
  { TODO -oSanketG -cWebConvert : Need to find alternative for GetNodeAt in TuniTreeView  }
  //Destination := (Sender as TUniTreeView).GetNodeAt(X, Y);
  if (Destination = nil) or (not Assigned(Destination)) then
    Exit;

  // Possible drag operations:
  // PMEQMT to PMEQMT
  // PMEQMT to PMLINK
  // PMEQMT_LINK to PMEQMT
  // PMEQMT_LINK to PMEQMT_LINK

  // Must initialize
  AID := 0;
  APMLinkID := 0;
  AMaster_PMEqmtID := 0;
  ALinked_PMEqmtID := 0;

  if (Sender = Source) then
    try
      TreeView.Items.BeginUpdate;
      // Get the target parent node of the new child record
      if (TTVCargo(Destination.Data).Source = 'PMEQMT') then
        AParentNode := Destination
      else
        AParentNode := Destination.Parent;
      // Get ID values we will insert
      AMaster_PMEqmtID := TTVCargo(Destination.Data).Master_PMEQMT_ID;
      // Master PMEQMT ID
      ALinked_PMEqmtID :=
        iIIf((TTVCargo(TreeView.Selected.Data).Source = 'PMEQMT'),
        TTVCargo(TreeView.Selected.Data).SourceID,
        TTVCargo(TreeView.Selected.Data).Assoc_PMEQMT_ID);
      // ID of equip we will link
      APMLinkID :=
        iIIf((TTVCargo(TreeView.Selected.Data).Source = 'PMEQMT_LINK'),
        TTVCargo(TreeView.Selected.Data).SourceID, 0);

      // Ensure linked PMEQMT value
      if (ALinked_PMEqmtID = 0) then
        Exit;
      // Now, let's validate.  Is this record allowed here?
      if not Validate(AMaster_PMEqmtID, ALinked_PMEqmtID, True) then
        Exit;

      // Update the database
      if (TTVCargo(TreeView.Selected.Data).Source = 'PMEQMT_LINK') then
      begin
        if DB_MovePMLink(APMLinkID, AMaster_PMEqmtID) then
          ANewNode := AddNode(AParentNode, TreeView.Selected.Text,
            'PMEQMT_LINK', AID, AMaster_PMEqmtID, ALinked_PMEqmtID, '');
        { TODO -oSanketG -cWebConvert : Need to find alternative for Delete in TuniTreeNode  }
        //TreeView.Selected.Delete;
      end
      else // We are adding a PMEQMT record
      begin
        if DB_InsertPMLink(AMaster_PMEqmtID, ALinked_PMEqmtID, AID { var param } )
        then
          ANewNode := AddNode(AParentNode, TreeView.Selected.Text,
            'PMEQMT_LINK', AID, AMaster_PMEqmtID, ALinked_PMEqmtID, '');
      end;

      if (ANewNode <> nil) then
      begin
        ANewNode.ImageIndex := 2;
        ANewNode.SelectedIndex := 2;
      end;

      // Fix TreeView refresh problem
      if (AParentNode <> nil) then
      begin
        AParentNode.Collapse(False);
        AParentNode.Expand(False);
      end;

      UpdateChildCount(AParentNode);

    finally
      TreeView.Items.EndUpdate;
    end;
end;

procedure TFrmPMRef.TreeViewDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := (Sender = TreeView) and SR.Enabled['AllowDragDrop'];

  // 08/14/2006 Allows user to drag below or above the last visible node
  if Y < 15 then
    SendMessage(TreeView.Handle, WM_VSCROLL, SB_LINEUP, 0)
  else if TreeView.Height - Y < 15 then
    SendMessage(TreeView.Handle, WM_VSCROLL, SB_LINEDOWN, 0);

  TreeView.Repaint;
end;

procedure TFrmPMRef.PTreeViewPopup(Sender: TObject);
begin
  RemoveEquipment1.Enabled := (TreeView.Selected <> nil) and
    (TTVCargo(TreeView.Selected.Data).Source <> 'PMEQMT');
  WhereUsed1.Enabled := (TreeView.Selected <> nil);
end;

function TFrmPMRef.LocateNode(ASource: string; ASourceID: Integer)
  : TUniTreeNode;
var
  i: Integer;
begin
  Result := nil; // default
  for i := 0 to TreeView.Items.Count - 1 do
    if (Assigned(TreeView.Items[i].Data)) and
      (TTVCargo(TreeView.Items[i].Data).Source = ASource) and
      (TTVCargo(TreeView.Items[i].Data).SourceID = ASourceID) then
    begin
      Result := TreeView.Items[i];
      TreeView.Selected := Result;
      BREAK;
    end;
end;

function TFrmPMRef.Validate(AMasterPMEqmtID, ALinkPMEqmtID: Integer;
  ARaiseError: Boolean): Boolean;
begin
  // We validate insert or move operations here.
  Result := (AMasterPMEqmtID <> ALinkPMEqmtID);
  if not Result and ARaiseError then
  // 'Invalid relationship: same equipment.  Cannot link same equipment.'
  begin
    IQError(pm_rscstr.cTXT0000120);
    Exit;
  end;

  // Is the equipment already in the list?
  Result := SelectValueFmtAsInteger('SELECT 1 FROM pmeqmt_link ' +
    'WHERE pmeqmt_id = %d AND pmeqmt_id_linked = %d AND ROWNUM < 2',
    [AMasterPMEqmtID, ALinkPMEqmtID]) = 0;
  if not Result and ARaiseError then
  begin
    // 'Equipment already in list.  Cannot add.'
    IQError(pm_rscstr.cTXT0000122);
    Exit;
  end;

  // Circular link?  Function returns True if all is well (no circular
  // links), but returns False if there is a problem.
  Result := NoCircularReferencesExist(AMasterPMEqmtID, ALinkPMEqmtID);
  // not False (no circ. lnk found) = True
  if not Result then
  begin
    IQError(pm_rscstr.cTXT0000125);
    Exit;
  end;
end;

procedure TFrmPMRef.sbtnExpandTreeClick(Sender: TObject);
begin
  with TreeView do
    try
      Items.BeginUpdate;
      FullExpand;
    finally
      Items.EndUpdate;
    end;
end;

procedure TFrmPMRef.sbtnCollapseTreeClick(Sender: TObject);
begin
  with TreeView do
    try
      Items.BeginUpdate;
      FullCollapse;
    finally
      Items.EndUpdate;
    end;
end;

function TFrmPMRef.GetComboboxSortField: string;
begin
  // Returns the "sort by" AFieldName based on the combo box index.
  // This is what we use for sorting the tree view (see LoadTree)
  case cmbSortBy.ItemIndex of
    1:
      Result := 'DESCRIP';
    2:
      Result := 'CLASS';
  else // default = 0
    Result := 'EQNO';
  end;
end;

function TFrmPMRef.GetSelectedEquipmentID: Integer;
begin
  Result := 0;
  if (TreeView.Selected <> nil) and (TreeView.Selected.Data <> nil) then
  begin
    if (TTVCargo(TreeView.Selected.Data).Source = 'PMEQMT') then
      Result := TTVCargo(TreeView.Selected.Data).SourceID
    else
      Result := TTVCargo(TreeView.Selected.Data).Assoc_PMEQMT_ID
  end;
end;

function TFrmPMRef.GetSelectedLinkID: Integer;
begin
  Result := 0;
  if (TreeView.Selected <> nil) and (TreeView.Selected.Data <> nil) then
  begin
    if (TTVCargo(TreeView.Selected.Data).Source <> 'PMEQMT') then
      Result := TTVCargo(TreeView.Selected.Data).SourceID;
  end;
end;

function TFrmPMRef.GetSelectedCaption: string;
begin
  Result := '';
  if (TreeView.Selected <> nil) and (TreeView.Selected.Data <> nil) then
    Result := TTVCargo(TreeView.Selected.Data).Caption;
end;

procedure TFrmPMRef.SetComboboxSortField(AFieldName: string);
var
  i: Integer;
begin
  // Sets the combo box display for the AFieldName value
  // This is what we use for sorting the tree view (see LoadTree)
  if (AFieldName = 'DESCRIP') then
    i := 1
  else if (AFieldName = 'CLASS') then
    i := 2
  else
    i := 0;
  cmbSortBy.ItemIndex := i;
end;

procedure TFrmPMRef.SetPMEQMT_ID(const Value: Integer);
begin
  FPMEQMT_ID := Value;
end;

procedure TFrmPMRef.SetWhereUsedPrompt(const Value: Boolean);
begin
  FWhereUsedPrompt := Value;
end;

procedure TFrmPMRef.TreeViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) then
  begin
    Key := 0;
    RemoveEquipment1Click(Sender);
  end;
  if (Key = VK_INSERT) then
  begin
    Key := 0;
    AddEquipment1Click(Sender);
  end;
end;

procedure TFrmPMRef.UpdateClassFilter(const Value: string);
var
  AOldFilter: string;
begin
  AOldFilter := FClassFilter;
  FClassFilter := Value;
  // pm_rscstr.cTXT0000123 = 'Refresh list now?'
  if (AOldFilter <> FClassFilter) and IQConfirmYN(pm_rscstr.cTXT0000123) then
    RefreshAll1Click(nil);
end;

procedure TFrmPMRef.UpdatePkFilterRec;
begin
  // Assign "where used" pick list filter
  FPkFilterRec.PMEQMT_ID := GetSelectedEquipmentID;
  FPkFilterRec.PMLINK_ID := GetSelectedLinkID;
  FPkFilterRec.Caption := GetSelectedCaption;
end;

procedure TFrmPMRef.UpdateChildCount(ANode: TUniTreeNode);
begin
  if (ANode <> nil) and (ANode.Data <> nil) and
    (TTVCargo(ANode.Data).Source = 'PMEQMT') then
  begin
    if (ANode.Count > 0) then
      ANode.Text := Format('%s (%d)', [TTVCargo(ANode.Data).Caption,
        ANode.Count])
    else
      ANode.Text := TTVCargo(ANode.Data).Caption;
  end;
end;

function TFrmPMRef.SearchWhereUsed(AFilter: TPkFilterRec;
  var ACancelled: Boolean): Boolean;
var
  AParent, ANode: TUniTreeNode;
begin
  // Initialization
  Result := False;
  ACancelled := True;
  // Assign pick list filter
  FPkFilterRec.PMEQMT_ID := AFilter.PMEQMT_ID;
  FPkFilterRec.PMLINK_ID := AFilter.PMLINK_ID;
  FPkFilterRec.Caption := AFilter.Caption;
  // Show pick list
  with PkWhereUsed do
  begin
    ACancelled := not Execute;
    if not ACancelled then
    begin
      // Locate the node
      AParent := LocateNode('PMEQMT', GetValue('PMEQMT_ID'));
      if (AParent <> nil) then
        Result := LocateNode('PMEQMT_LINK', GetValue('PMLINK_ID')) <> nil;
    end;
  end;
end;

procedure TFrmPMRef.WhereUsed1Click(Sender: TObject);
var
  AParent, ANode: TUniTreeNode;
  ACancelled: Boolean;
begin
  // Assign "where used" pick list filter
  UpdatePkFilterRec;
  if not SearchWhereUsed(FPkFilterRec, ACancelled) and not ACancelled then
    // pm_rscstr.cTXT0000119 =
    // 'Could not find selected equipment'
    IQError(pm_rscstr.cTXT0000119);
end;

procedure TFrmPMRef.PkWhereUsedBeforeOpen(DataSet: TDataSet);
begin
  // Apply the ID value
  AssignQueryParamValue(DataSet, 'PMEQMT_ID', Trunc(FPkFilterRec.PMEQMT_ID));
  AssignQueryParamValue(DataSet, 'PMLINK_ID', Trunc(FPkFilterRec.PMLINK_ID));
  AssignQueryParamValue(DataSet, 'BY_PMLINK_ID',
    Integer(FPkFilterRec.PMLINK_ID > 0));
  // pm_rscstr.cTXT0000124  = Where Used
  if IQMS.Common.StringUtils.IsEmpty(FPkFilterRec.Caption) then
    PkWhereUsed.Title := pm_rscstr.cTXT0000124
  else
    PkWhereUsed.Title := Format('%s - %s', [pm_rscstr.cTXT0000124,
      FPkFilterRec.Caption]);
end;

procedure TFrmPMRef.Options1Click(Sender: TObject);
begin
  WhereUsed2.Enabled := (TreeView.Selected <> nil);
end;

function TFrmPMRef.NoCircularReferencesExist(APMEqmtID, ALinkPMEqmtID
  : Integer): Boolean;
var
  ASQL: TStringList;
begin
  // APMEqmtID = The host equipment record to which we want to link something (parent)
  // ALinkPMEqmtID = The equipment we want to link (child)
  try
    ASQL := TStringList.Create;
    try
      ASQL.Add('SELECT 1');
      ASQL.Add('  FROM (    SELECT pmeqmt_id_linked AS id');
      ASQL.Add('              FROM pmeqmt_link');
      ASQL.Add(Format('        START WITH pmeqmt_id = %d', [ALinkPMEqmtID]));
      ASQL.Add('        CONNECT BY pmeqmt_id = PRIOR pmeqmt_id_linked) v');
      ASQL.Add(Format(' WHERE v.id = %d AND', [APMEqmtID]));
      ASQL.Add('      ROWNUM < 2');
      Result := SelectValueAsInteger(ASQL.Text) = 0;
    finally
      if Assigned(ASQL) then
        FreeAndNil(ASQL);
    end;
  except
    Result := True;
  end;
end;

procedure TFrmPMRef.Contents1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmPM, iqhtmPM); // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(1013820);
end;

procedure TFrmPMRef.cmbSortByClick(Sender: TObject);
begin
  RefreshAll1Click(nil);
end;

procedure TFrmPMRef.CancelButtonClick(Sender: TObject);
begin
  FAbort := True;
end;

function TFrmPMRef.CheckCancelClicked: Boolean;
begin
  Application.ProcessMessages;
  Result := False;
  if FAbort then
    // 'Abort processing?'
    Result := IQConfirmYN(pm_rscstr.cTXT0000278)
  else
    FAbort := False;
end;

procedure TFrmPMRef.PnlControlsResize(Sender: TObject);
begin
  // 04/15/2010
  IQMS.Common.Controls.RefreshComponentsEx([cmbSortBy], nil);
end;

end.
