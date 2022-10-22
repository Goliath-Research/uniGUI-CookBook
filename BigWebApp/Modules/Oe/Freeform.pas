unit FreeForm;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Mask,
  Vcl.Buttons,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Vcl.Menus,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.About,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniCheckBox,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, IQUniGrid, uniGUIFrame;

type
  { TFrmFreeFormSource }
  TFrmFreeFormKind = (fscNone, fscPO, fscOrders, fscManualPS);

  { TFrmFreeFormItem }
  TFrmFreeFormItem = packed record
    Source: TFrmFreeFormKind;
    ID: Real; // misc item ID
    Itemno: string;
    Descrip: string;
    Quantity: Real;
    Price: Real;
    UOM: string;
    GLAccountID: Real;
    Note: string;
    c_po_misc_id: Real;
  end;

  { TFrmFreeForm }
  TFrmFreeForm = class(TUniForm)
    pcMain: TUniPageControl;
    TabForm: TUniTabSheet;
    TabGrid: TUniTabSheet;
    PnlMiscItem: TUniPanel;
    Splitter2: TUniSplitter;
    PnlLeft01: TUniPanel;
    lblMiscellaneousItem: TUniLabel;
    lblDescription: TUniLabel;
    lblUnitPrice: TUniLabel;
    lblGLAccount: TUniLabel;
    lblUnit: TUniLabel;
    Panel9: TUniPanel;
    Panel10: TUniPanel;
    sbtnSearchAcct: TUniSpeedButton;
    PnlClient01: TUniPanel;
    dbeUnitPrice: TUniDBEdit;
    dbeGLAccount: TUniDBEdit;
    cmbUOM: TUniDBComboBox;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    PnlToolbar: TUniPanel;
    SBSearch: TUniSpeedButton;
    sbtnToggleTableFormView: TUniSpeedButton;
    Ok1: TUniMenuItem;
    SrcMisc: TDataSource;
    QryMisc: TFDQuery;
    QryMiscID: TBCDField;
    QryMiscMISC_ITEM: TStringField;
    QryMiscMISC_ITEMNO: TStringField;
    QryMiscUNIT_PRICE: TFMTBCDField;
    QryMiscGLACCT_ID_INV: TBCDField;
    QryMiscUNIT: TStringField;
    dbeItemno: TUniDBEdit;
    dbeDescrip: TUniDBEdit;
    QryMiscAcct: TStringField;
    PkAcct: TIQWebHPick;
    PkAcctID: TBCDField;
    PkAcctACCT: TStringField;
    PkAcctDESCRIP: TStringField;
    PkAcctTYPE: TStringField;
    PkAcctEPLANT_ID: TBCDField;
    Nav: TUniDBNavigator;
    UpdateSQL1: TFDUpdateSQL;
    PkMisc: TIQWebHPick;
    PkMiscID: TBCDField;
    PkMiscMISC_ITEM: TStringField;
    PkMiscMISC_ITEMNO: TStringField;
    PkMiscUNIT_PRICE: TFMTBCDField;
    PkMiscGLACCT_ID_INV: TBCDField;
    PkMiscUNIT: TStringField;
    PkMiscACCT: TStringField;
    New1: TUniMenuItem;
    GridMisc: TIQUniGridControl;
    cmbGridGLAccount: TUniEdit;
    IQAbout1: TIQWebAbout;
    PnlModalButtons_General: TUniPanel;
    PnlModalButtonsInner_General: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    QryMiscQUAN: TBCDField;
    PkMiscQUAN: TBCDField;
    dbeQuantity: TUniDBEdit;
    lblQuantity: TUniLabel;
    QryMiscEPLANT_ID: TBCDField;
    PkMiscEPLANT_ID: TBCDField;
    dbeEPlant: TUniDBEdit;
    lblEPlant: TUniLabel;
    QryMiscEplant_name: TStringField;
    sbtnEPlant: TUniSpeedButton;
    cmbGridEPlant: TUniEdit;
    Contents1: TUniMenuItem;
    PnlCarrier: TUniPanel;
    PnlPageControl: TUniPanel;
    Hidden1: TUniMenuItem;
    QryMiscKIND: TStringField;
    SR: TIQWebSecurityRegister;
    PGLAccount: TUniPopupMenu;
    SelectGLAccount1: TUniMenuItem;
    PEPlant: TUniPopupMenu;
    SelectEPlant1: TUniMenuItem;
    TabEdit: TUniTabSheet;
    Panel1: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft02: TUniPanel;
    lblMiscellaneousItem_FreeForm: TUniLabel;
    lblDescription_FreeForm: TUniLabel;
    lblUnitPrice_FreeForm: TUniLabel;
    lblGLAccount_FreeForm: TUniLabel;
    lblUnit_FreeForm: TUniLabel;
    lblQuantity_FreeForm: TUniLabel;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    sbtnSearchAcct_FreeForm: TUniSpeedButton;
    PnlClient02: TUniPanel;
    edtUnitPrice: TUniEdit;
    edtGLAccount: TUniEdit;
    cmbUOMEdit: TUniDBComboBox;
    edtItemno: TUniEdit;
    edtDescrip: TUniEdit;
    edtQuantity: TUniEdit;
    QryMiscNOTE: TStringField;
    lblNote: TUniLabel;
    cmbNote: TUniEdit;
    EditNote1: TUniMenuItem;
    cmbGridNote: TUniEdit;
    lblNote_FreeForm: TUniLabel;
    cmbNote_FreeForm: TUniEdit;
    EditNoteFreeForm1: TUniMenuItem;
    PkMiscNOTE: TStringField;
    cbEdit: TUniCheckBox;
    PkAcctSO: TIQWebHPick;
    FloatField1: TBCDField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField2: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryMiscCalcFields(DataSet: TDataSet);
{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGUi
    procedure NavBeforeAction(Sender: TObject; Button: TNavigateBtn); }
    procedure PkMiscIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure New1Click(Sender: TObject);
    procedure SBSearchClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure sbtnToggleTableFormViewClick(Sender: TObject);
    procedure QryMiscNewRecord(DataSet: TDataSet);
    procedure Contents1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DoBeforeOpen(DataSet: TDataSet);
    procedure SelectGLAccount1Click(Sender: TObject);
    procedure SelectEPlant1Click(Sender: TObject);
    procedure sbtnSearchAcct_FreeFormClick(Sender: TObject);
    procedure EditNote1Click(Sender: TObject);
    procedure EditNoteFreeForm1Click(Sender: TObject);
    procedure QryMiscBeforePost(DataSet: TDataSet);
  strict private
    { Private declarations }
    FId: Real;
    FKind: TFrmFreeFormKind;
    FSingleView: Boolean;
    FEditMode: Boolean;
    FGLAccountID_FreeForm: Integer;
    procedure ExecuteSearch;
    procedure SetKind(const Value: TFrmFreeFormKind);
    function GetKindStr: string;
    procedure SetSingleView(const Value: Boolean);
    procedure LoadArinvtUOMList;
    procedure SetEditMode(const Value: Boolean);
  private
    procedure UpdateFreeFormGLAccountDisplay;
    procedure setFID(const Value: Real);
  public
    { Public declarations }
    class function DoShowModal(AKind: TFrmFreeFormKind;
      var ASelectedID: Real): Boolean;
    ///  <summary>  Populates the item record with values from the screen.
    ///  Used when editing a free form item not stored in the database.
    ///  </summary>
    procedure GetItemValues(var AItem: TFrmFreeFormItem);
    ///  <summary>  Applies values from the item record to the screen controls.
    ///  Used when editing a free form item not stored in the database.
    ///  </summary>
    procedure SetItemValues(const AItem: TFrmFreeFormItem);
    ///  <summary> Required:  Indicates "source" used for filtering the list.
    ///  </summary>
    property Kind: TFrmFreeFormKind read FKind write SetKind;
    ///  <summary> Returns "Kind" as a table name.
    ///  </summary>
    property KindStr: string read GetKindStr;
    ///  <summary> Returns selected C_PO_MISC.ID, if shown modally.
    ///  </summary>
    property SelectedID: Real read FId write setFID;
    ///  <summary> Indicates whether or not the "modal" controls display.
    ///  </summary>
    property SingleView: Boolean read FSingleView write SetSingleView;
    ///  <summary> Indicates whether or not the "modal" controls display.
    ///  </summary>
    property FreeFormEditOnly: Boolean read FEditMode write SetEditMode;
  end;

///  <summary> Show the Miscellaneous Item form.  Shows all items for the
///  given kind.
///  </summary>
procedure DoFreeFormItems(AKind: TFrmFreeFormKind);
///  <summary> Prompt user for a new Miscellaneous item.  This method is
///  designed to be called from the OnIQModify method of a pick list.
///  </summary>
function SelectNewFreeFormItem(AKind: TFrmFreeFormKind;
  var AResultValue: Variant): TModalResult;

// Record methods, used for retrieving misc item data:
///  <summary>  Clear the free form item record.
///  </summary>
procedure ClearFreeFormItem(AItem: TFrmFreeFormItem);
///  <summary>  Populate a record object for the given miscellaneous item (C_PO_MISC.ID)
///  </summary>
function GetMiscItemData(AKind: TFrmFreeFormKind; AMiscID: Real;
  var AItem: TFrmFreeFormItem): Boolean;
///  <summary>  Show the dialog and allow user to edit values.  Changed values
///  are returned in the AResult parameter.
///  </summary>
///  <returns>  Returns true if the user changed the data.
///  </returns>
function EditMiscItemData(AKind: TFrmFreeFormKind;
  var AItem: TFrmFreeFormItem): Boolean;

implementation

{$R *.DFM}


uses
  IQMS.Common.EditMemoStr,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  oe_rscstr,
  IQMS.COmmon.SetPlant,
  System.Variants;
{ TODO -oGPatil -cWebConvert : Dependency on the following Files
  IQSecIns,
  uom_lst;  }

const
  // Insert mode
  INSERTING_NEW: Integer = -1;
  EDITING_FREE_FORM: Integer = -2;
  // Source table name
  SourceKind: array [TFrmFreeFormKind] of String = ('', 'PO', 'ORDERS', 'MANUAL PS');

{$REGION 'Wrapper Implementation'}


procedure DoFreeFormItems(AKind: TFrmFreeFormKind);
var
  LFrmFreeForm : TFrmFreeForm;
begin
   LFrmFreeForm := TFrmFreeForm.Create(UniGUIApplication.UniApplication);
   LFrmFreeForm.Kind := AKind;
   LFrmFreeForm.SelectedID := 0;
   LFrmFreeForm.Show;
end;

function SelectNewFreeFormItem( AKind: TFrmFreeFormKind;
  var AResultValue: Variant): TModalResult;
var
  AID: Real;
begin
  // Initialize return values
  Result := mrCancel;
  AResultValue := 0;
  AID := 0;
  // Get the new miscellaneous item
  if TFrmFreeForm.DoShowModal(AKind, AID) then
    begin
      Result := mrOk;
      AResultValue := AID;
    end;
end;

procedure ClearFreeFormItem(AItem: TFrmFreeFormItem);
begin
  ZeroMemory(@AItem, SizeOf(TFrmFreeFormItem));
end;

function GetMiscItemData(AKind: TFrmFreeFormKind; AMiscID: Real;
  var AItem: TFrmFreeFormItem): Boolean;
begin
  Result := False;
  ClearFreeFormItem(AItem);
  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('SELECT misc_itemno,');
      SQL.Add('       misc_item,');
      SQL.Add('       quan,');
      SQL.Add('       unit_price,');
      SQL.Add('       unit,');
      SQL.Add('       glacct_id_inv,');
      SQL.Add('       note');
      SQL.Add('  FROM c_po_misc');
      SQL.Add(Format(' WHERE id = %.0f', [AMiscID]));
      Open;
      if not(BOF and EOF) then
      begin
        AItem.Source := AKind;
        AItem.ID := AMiscID;
        AItem.Itemno := Fields[0].AsString;
        AItem.Descrip := Fields[1].AsString;
        AItem.Quantity := Fields[2].AsFloat;
        AItem.Price := Fields[3].AsFloat;
        AItem.UOM := Fields[4].AsString;
        AItem.GLAccountID := Fields[5].AsFloat;
        AItem.Note := Fields[6].AsString;
        AItem.c_po_misc_id := AMiscID;
        Result := True; // record founct
      end;
    finally
      Free;
    end;
end;

function EditMiscItemData(AKind: TFrmFreeFormKind; var AItem: TFrmFreeFormItem): Boolean;
var
  LFrmFreeForm : TFrmFreeForm;
begin
  LFrmFreeForm := TFrmFreeForm.Create(UniGUIApplication.UniApplication);
  LFrmFreeForm.FreeFormEditOnly := True;
  LFrmFreeForm.SetItemValues(AItem);
  Result := LFrmFreeForm.ShowModal = mrOk;
    if Result then
      LFrmFreeForm.GetItemValues(AItem);
end;

{$ENDREGION 'Wrapper Implementation'}

{$REGION 'TFrmFreeForm'}

class function TFrmFreeForm.DoShowModal(AKind: TFrmFreeFormKind; var ASelectedID: Real): Boolean;
var
  LFrmFreeForm : TFrmFreeForm;
begin
  LFrmFreeForm := TFrmFreeForm.Create(UniGUIApplication.UniApplication);
  ASelectedID := 0;
  LFrmFreeForm.SingleView := True;
  Result := LFrmFreeForm.ShowModal = mrOK;
  if Result then
    LFrmFreeForm.SelectedID := ASelectedID;
end;

procedure TFrmFreeForm.FormShow(Sender: TObject);
var
  AType:integer;
begin
  // Initialize
  FId := 0;
  FGLAccountID_FreeForm := 0;
  // Base constructor

  AType := 0;

  if IQRegIntegerScalarRead( self, 'FREEFORM_CBEDIT_CHECKED', AType ) then
  begin
    if AType = 0 then
      cbEdit.Checked := False
    else
      cbEdit.Checked := True;
  end
  else
  begin
    cbEdit.Checked := False;
    IQRegIntegerScalarWrite( self, 'FREEFORM_CBEDIT_CHECKED', 0);
  end;

  // Set the Kind
  Kind := FKind;
  // Adjust Vcl.Controls
  IQMS.Common.Controls.AdjustPageControlToParent(Self.pcMain);
  // No, this is not modal, by default.
  SingleView := False;
  // UOM
  LoadArinvtUOMList;
  // Open the dataset
  Nav.DataSource.DataSet.Open;

  if Kind = fscOrders then
    HelpContext := 21215
  else if Kind = fscManualPS then
    HelpContext := 21452;

  if Kind = fscManualPS then
    begin
      // label and dbedit
      lblUnitPrice.Visible:= False;
      dbeUnitPrice.Visible:= False;
      // label, dbedit and speedbutton
      lblGLAccount.Visible:= False;
      dbeGLAccount.Visible:= False;
      sbtnSearchAcct.Visible:= False;
      // 2 fields
      QryMiscUNIT_PRICE.Visible:= FALSE;
      QryMiscAcct.Visible:= FALSE;
      // adjust display
      StackUpControls(PnlClient01.Top+8, 24, [dbeItemno, dbeDescrip,
        dbeUnitPrice, dbeQuantity, cmbUOM, dbeGLAccount, sbtnSearchAcct,
        dbeEPlant]);
      StackUpControls(PnlClient01.Top+8, 24, [lblMiscellaneousItem,
        lblDescription, lblUnitPrice, lblQuantity, lblUnit, lblGLAccount,
        lblEplant]);
      sbtnEPlant.Top:= dbeEPlant.Top;
    end
  else if Kind = fscPO then
    begin
      // 07/25/2014 Modify the "Note" caption for PO.
      // EIQ-3700 SER# 05745 - Receiving note on PO form
      lblNote.Caption := 'Receiving Note';
      lblNote_FreeForm.Caption := lblNote.Caption;
      QryMiscNOTE.DisplayLabel := lblNote.Caption;
{ TODO -oGPatil -cWebConvert : AssignWWColumnTitle commented in iqms.common.controls
      IQMS.Common.Controls.AssignWWColumnTitle(GridMisc, 'NOTE', lblNote.Caption); }
    end;

  // If ID is provided, then locate record
  if FID > 0 then
    Nav.DataSource.DataSet.Locate('ID', FID, [])
    // If ID is zero (0), then show pick list
  else if FID = 0 then
    ExecuteSearch
    // If ID = -1, then insert a new record; this is called as a modal picker.
  else if FID = INSERTING_NEW then
{ TODO -oGPatil -cWebConvert : TUniDBNavigator doer not contain a member named BtnClick
    Nav.BtnClick(nbInsert);   }
  // 04/25/2014
{ TODO -oGPatil -cWebConvert : Dependency on Iqsecins.pas File
  IQSecIns.EnsureSecurityInspectorOnTopOf(Self);  }

  // Set initial control focus
  if dbeItemno.CanFocus then
    dbeItemno.SetFocus;

  // Restore Registry settings
  IQRegFormRead(Self, [Self, GridMisc, PnlLeft01]);

  // Apply security
  IQMS.Common.Controls.IQEnableControl([sbtnSearchAcct], SR.Enabled['SelectGLAccount1']);
{ TODO -oGPatil -cWebConvert : TUNIEdit does not contain member ShowButton
  cmbGridGLAccount.ShowButton := SR.Enabled['SelectGLAccount1']; }

  IQMS.Common.Controls.IQEnableControl([sbtnEPlant], SR.Enabled['SelectEPlant1']);
{ TODO -oGPatil -cWebConvert : TUNIEdit does not contain member ShowButton
  cmbGridEPlant.ShowButton := SR.Enabled['SelectEPlant1']; }
end;

procedure TFrmFreeForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if cbEdit.checked then
    IQRegIntegerScalarWrite( self, 'FREEFORM_CBEDIT_CHECKED', 1)
  else
    IQRegIntegerScalarWrite( self, 'FREEFORM_CBEDIT_CHECKED', 0);

  IQRegFormWrite(Self, [Self, GridMisc, PnlLeft01]);
end;

procedure TFrmFreeForm.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmFreeForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmFreeForm.Contents1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmSETUP { CHM } , iqhtmSETUPch4 { HTM } ); // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(Self.HelpContext);
end;

procedure TFrmFreeForm.SelectEPlant1Click(Sender: TObject);
begin
  if SR.Enabled['SelectEPlant1'] then
    IQMS.COmmon.SetPlant.DoChangePlantID(Nav.DataSource.DataSet, QryMiscEplant_name);
end;

procedure TFrmFreeForm.SelectGLAccount1Click(Sender: TObject);
var
  APk:TIQWebHPick;
begin
  APk := PkAcct;
  if Kind = fscOrders then
    APk := PkAcctSO;
  if SR.Enabled['SelectGLAccount1'] then
    with APk do
      if Execute then
      begin
        if not(Nav.DataSource.DataSet.State in [dsInsert, dsEdit]) then
          Nav.DataSource.DataSet.Edit;
        Nav.DataSource.DataSet.FieldByName('GLACCT_ID_INV').AsFloat :=
          System.Variants.VarAsType(GetValue('ID'), varInteger);
      end;
end;

procedure TFrmFreeForm.SetEditMode(const Value: Boolean);
begin
  FEditMode := Value;
  if FEditMode then
    begin
      SingleView := True;
      pcMain.ActivePage := TabEdit;
      sbtnSearchAcct_FreeForm.Enabled := SR.Enabled['SelectGLAccount1'];
    end
  else
     pcMain.ActivePage := TabForm;
  PnlToolbar.Visible := not FEditMode;
end;

procedure TFrmFreeForm.setFID(const Value: Real);
begin
  FId := Value;
end;

function TFrmFreeForm.GetKindStr: string;
begin
  Result := SourceKind[Kind];
end;

procedure TFrmFreeForm.GetItemValues(var AItem: TFrmFreeFormItem);
begin
  AItem.Source := Self.Kind;
  AItem.ID := 0;
  AItem.Itemno := edtItemno.Text;
  AItem.Descrip := edtDescrip.Text;
  AItem.Quantity := IQMS.Common.Numbers.StoF(edtQuantity.Text);
  AItem.Price := IQMS.Common.Numbers.StoF(edtUnitPrice.Text);
  if cmbUOMEdit.ItemIndex > -1 then
    AItem.UOM := cmbUOMEdit.Items.Strings[cmbUOMEdit.ItemIndex];
  //cmbUOMEdit.Text;
  AItem.GLAccountID := FGLAccountID_FreeForm;
  AItem.Note := cmbNote_FreeForm.Text;

  if cbEdit.checked and cbEdit.visible and (AItem.c_po_misc_id <> 0) then
    ExecuteCommandFmt('update c_po_misc set misc_itemno = ''%s'',  misc_item = ''%s'', ' +
              'quan = %.6f, unit_price = %.6f, unit = ''%s'', glacct_id_inv = %f, note = ''%s'' where id = %f',
              [StrTran(AItem.Itemno, '''', ''''''),
               StrTran(AItem.Descrip, '''', ''''''),
               AItem.Quantity,
               AItem.Price,
               StrTran(AItem.uom, '''', ''''''),
               AItem.GLAccountID,
               StrTran(AItem.Note, '''', ''''''),
               AItem.c_po_misc_id]);

end;

procedure TFrmFreeForm.SetItemValues(const AItem: TFrmFreeFormItem);
var
  i: Integer;
begin
  edtItemno.Text :=  AItem.Itemno;
  edtDescrip.Text := AItem.Descrip;
  edtQuantity.Text := Format('%.2f', [AItem.Quantity]);
  edtUnitPrice.Text := Format('%.6f', [AItem.Price]);
  i := cmbUOMEdit.Items.IndexOf(AItem.UOM);
  cmbUOMEdit.ItemIndex := i;
  cmbUOMEdit.Text := AItem.UOM;
  FGLAccountID_FreeForm := Trunc(AItem.GLAccountID);
  UpdateFreeFormGLAccountDisplay;
  cmbNote_FreeForm.Text := AItem.Note;
  cbEdit.Visible := AItem.c_po_misc_id <> 0;
end;

procedure TFrmFreeForm.UpdateFreeFormGLAccountDisplay;
begin
  edtGLAccount.Text := SelectValueFmtAsString(
   'SELECT acct FROM glacct WHERE id = %d', [FGLAccountID_FreeForm]);
end;

procedure TFrmFreeForm.SetKind(const Value: TFrmFreeFormKind);
begin
  FKind := Value;
//  SR.SecurityCode := 'FRMFREEFORM_' + KindStr;
//  SR.Apply;
end;

procedure TFrmFreeForm.SetSingleView(const Value: Boolean);
begin
  PnlModalButtons_General.Visible := Value;
  PnlToolbar.Visible := not Value;
end;

procedure TFrmFreeForm.LoadArinvtUOMList;
begin
  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('SELECT uom FROM arinvt_uom ORDER BY 1');
      Open;
      if not(BOF and EOF) then
      begin
        cmbUOM.Items.Clear;
        cmbUOMEdit.Items.Clear;
        while not EOF do
        begin
          cmbUOM.Items.Add(Fields[0].AsString);
          cmbUOMEdit.Items.Add(Fields[0].AsString);
          Next;
        end;
      end;
    finally
      Free;
    end;
end;

procedure TFrmFreeForm.sbtnSearchAcct_FreeFormClick(Sender: TObject);
begin
  if SR.Enabled['SelectGLAccount1'] then
    with PkAcct do
      if Execute then
      begin
        FGLAccountID_FreeForm := System.Variants.VarAsType(GetValue('ID'), varInteger);
        UpdateFreeFormGLAccountDisplay;
      end;
end;

procedure TFrmFreeForm.sbtnToggleTableFormViewClick(Sender: TObject);
begin
  // IQMS.Common.Controls.TogglePageControl(pcMain);
  if pcMain.ActivePage = TabForm then
    pcMain.ActivePage := TabGrid
  else
    pcMain.ActivePage := TabForm;
end;

procedure TFrmFreeForm.DoBeforeOpen(DataSet: TDataSet);
begin
  with TFDQuery(DataSet) do
    if Params.FindParam('KIND') <> nil then
      ParamByName('KIND').AsString := KindStr;
end;

procedure TFrmFreeForm.QryMiscCalcFields(DataSet: TDataSet);
begin
  with TFDQuery(DataSet) do
  begin
    if FindField('ACCT') <> nil then
      FieldByName('ACCT').AsString :=
        SelectValueFmtAsString('SELECT acct FROM glacct WHERE id = %.0f',
        [FieldByName('GLACCT_ID_INV').AsFloat]);
    if FindField('EPLANT_NAME') <> nil then
      FieldByName('EPLANT_NAME').AsString :=
        SelectValueFmtAsString('SELECT ''['' || id || '']  '' || name ' +
        'FROM eplant WHERE id = %.0f', [FieldByName('EPLANT_ID').AsFloat]);
  end;
end;

procedure TFrmFreeForm.QryMiscNewRecord(DataSet: TDataSet);
var
  AEplantId, AcctId: Integer;
begin
  // We use the same table (C_PO_MISC) for miscellaneous items in PO and Orders.
  DataSet.FieldByName('ID').AsFloat := GetNextID('C_PO_MISC');
  DataSet.FieldByName('KIND').AsString := KindStr;
  AEplantId := SelectValueAsInteger('SELECT misc.geteplantid FROM DUAL');
  if (AEplantId <> 0) and (TFDQuery(DataSet).FindField('EPLANT_ID') <> nil) then
    TFDQuery(DataSet).FieldByName('EPLANT_ID').AsInteger := AEplantId;

  AcctId := 0;

  case FKind of
    fscPO:
      begin
        AcctId := SelectValueAsInteger(
          'SELECT plugins.get_glacct_id_with_ep_gl(acct_id_misc_po, ' +
          '''acct_id_misc_po'', misc.geteplantid) FROM iqsys2 WHERE ROWNUM < 2');
       end;
    fscOrders:
      begin
        AcctId := SelectValueAsInteger(
          'SELECT plugins.get_glacct_id_with_ep_gl(acct_id_misc_oe, ' +
          '''acct_id_misc_oe'', misc.geteplantid) FROM iqsys2 WHERE ROWNUM < 2');
      end;
  end;

  if AcctId > 0 then
    QryMiscGLACCT_ID_INV.AsInteger := AcctId;
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGUi
procedure TFrmFreeForm.NavBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;      }

procedure TFrmFreeForm.New1Click(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : TUniDBNavigator does not contain  a member named BtnClick
  Nav.BtnClick(nbInsert);  }
end;

procedure TFrmFreeForm.PkMiscIQModify(Sender: TObject;
  var Action: TModalResult;
  var ResultValue: Variant);
begin
  Action := mrOK;
  ResultValue := 0;
  PostMessage(Handle, wm_Command, New1.Command, 0);
end;

procedure TFrmFreeForm.ExecuteSearch;
begin
  try
    SBSearchClick(NIL); // activate search speed button
  except
    on E: EAbort do
    begin
      PostMessage(Handle, wm_Command, Exit1.Command, 0); { Call "Exit" }
    end;
  end;
end;

procedure TFrmFreeForm.SBSearchClick(Sender: TObject);
var
  AID: Real;
  APickList: TIQWebHPick;
begin
  with PkMisc do
    if Execute then
    begin
      AID := System.Variants.VarAsType(GetValue('ID'), varInteger);
      SrcMisc.DataSet.Locate('ID', AID, []);
    end
    else
      System.SysUtils.Abort;
end;

procedure TFrmFreeForm.btnOKClick(Sender: TObject);
begin
  if not FEditMode and (Trim(dbeDescrip.Text) = '') then
    begin
      IQInformation(oe_rscstr.cTXT0000144); //'Miscellaneous item description required.';
      if dbeDescrip.CanFocus then dbeDescrip.SetFocus;
      Exit;
    end
  else if FEditMode and (Trim(edtDescrip.Text) = '') then
    begin
      IQInformation(oe_rscstr.cTXT0000144); //'Miscellaneous item description required.';
      if edtDescrip.CanFocus then edtDescrip.SetFocus;
      Exit;
    end;


  if Nav.DataSource.DataSet.State in [dsInsert, dsEdit] then
    Nav.DataSource.DataSet.Post;
  FId := Nav.DataSource.DataSet.FieldByName('ID').AsFloat;
  ModalResult := mrOK;
end;

procedure TFrmFreeForm.btnCancelClick(Sender: TObject);
begin
  if Nav.DataSource.DataSet.State in [dsInsert] then
    Nav.DataSource.DataSet.Cancel;
  FId := 0;
  Close;
end;

procedure TFrmFreeForm.EditNote1Click(Sender: TObject);
var
  AStringInOut: string;
begin
  // 07/25/2014
  // EIQ-3700 SER# 05745 - Receiving note on PO form
  AStringInOut := QryMiscNOTE.AsString;
  if IQMS.Common.EditMemoStr.DoEditMemoStr({var} AStringInOut, QryMiscNOTE.Size,
    lblNote.Caption) then
    begin
      if not (QryMisc.State in [dsEdit,dsInsert]) then
        QryMisc.Edit;
      QryMiscNOTE.AsString := AStringInOut;
    end;
end;

procedure TFrmFreeForm.EditNoteFreeForm1Click(Sender: TObject);
var
  AStringInOut: string;
begin
  // 07/25/2014
  // EIQ-3700 SER# 05745 - Receiving note on PO form
  AStringInOut := cmbNote_FreeForm.Text;
  if IQMS.Common.EditMemoStr.DoEditMemoStr({var} AStringInOut, QryMiscNOTE.Size,
    lblNote.Caption) then
    begin
      if not (QryMisc.State in [dsEdit,dsInsert]) then
        QryMisc.Edit;
      cmbNote_FreeForm.Text := AStringInOut;
    end;
end;

procedure TFrmFreeForm.QryMiscBeforePost(DataSet: TDataSet);
begin
  if not FEditMode and (Trim(dbeDescrip.Text) = '') then
    begin
      IQInformation(oe_rscstr.cTXT0000144); //'Miscellaneous item description required.';
      if dbeDescrip.CanFocus then dbeDescrip.SetFocus;
      Abort;
    end
  else if FEditMode and (Trim(edtDescrip.Text) = '') then
    begin
      IQInformation(oe_rscstr.cTXT0000144); //'Miscellaneous item description required.';
      if edtDescrip.CanFocus then edtDescrip.SetFocus;
      Abort;
    end;
end;



{$ENDREGION 'TFrmFreeForm'}

end.
