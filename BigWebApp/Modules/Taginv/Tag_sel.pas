unit Tag_Sel;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Spin,
  Data.DB,
  Vcl.Menus,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  Vcl.Buttons,
  IQMS.WebVcl.About,
  Mask,
  Tag_Share,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniSpinEdit,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniRadioButton,
  uniMultiItem,
  uniListBox,
  uniPanel,
  uniSplitter,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, uniComboBox,
  uniDBComboBox;

const
  cInsertSql = 'insert into xfgmulti   ' + '     ( fgmulti_id,     ' +
    '       non_conform_id, ' + '       arinvt_id,      ' +
    '       quan,           ' + '       rg_quan,        ' +
    '       lotno,          ' + '       loc_desc,       ' +
    '       newrec,         ' + '       eplant_id,      ' +
    '       taghead_id )    ';

const
  cSelectSQL = ' select f.id,             ' + 'f.non_conform_id,  ' +
    'a.id as arinvt_id, ' + 'f.onhand,          ' + 'f.rg_onhand,       ' +
    'f.lotno,           ' + 'l.loc_desc,        ' + '''N'',             ' +
    'decode(a.eplant_id, null, 0, a.eplant_id), ' + '%f ';
  // <------ NOTE we need to assign TAGHEAD_ID during ExecuteCommand!!!

const
  cInsertPlusSelectSql = cInsertSql + cSelectSQL;

const
  cFullInvSQLFrom = Tag_Share.cTAG_SELECT_FROM_START_MARK +
    ' from fgmulti f, locations l, arinvt a   ' +
    ' where l.id(+) = f.loc_id                 ' +
    ' and NVL(l.vmi, ''N'') = ''N''         ' +
    ' and a.id = f.arinvt_id(+)                ' +
    ' and nvl(f.in_transit_origin, 0) = 0 ' +
    ' and NVL(a.non_material, ''N'') <> ''Y''  ' +
    ' and misc.eplant_filter( a.eplant_id ) = 1 ' +
    ' and (NVL(a.pk_hide, ''N'') = ''N'' or (NVL(a.pk_hide, ''N'') = ''Y'' and inv_misc.GetFgmultiCount(NVL(a.id, 0)) <> 0))';

  // 10/15/2015 (Byron, EIQ-9023) Modified SQL below:
  // - If count_per_year = 0, then do not include it.
  // - If count_per_year is null, then always include it.
  // - Otherwise, calculate based on the date.
const
  cCycleCountCodeSQLFrom = Tag_Share.cTAG_SELECT_FROM_START_MARK +
    ' from fgmulti f, locations l, arinvt a, cycle_count c ' +
    'where l.id(+) = f.loc_id                              ' +
    '  and a.id = f.arinvt_id                              ' +
    '  and NVL(a.non_material, ''N'') <> ''Y''             ' +
    '  and a.cycle_count_id = c.id                         ' +
    '  and ( 1 = %f or c.code = ''%s'')                    ' +
    '  and nvl(count_per_year, -1) <> 0                    ' +
    '  and (count_per_year is null or                      ' +
    '    Trunc(NVL(a.cycle_count_date, sysdate-1000)) +    ' +
    '    trunc( 365 / decode( nvl(count_per_year,0), 0, 366, count_per_year )) <= Trunc(sysdate))   '
    + '  and NVL(l.vmi, ''N'') = ''N''                       ' +
    '  and nvl(f.in_transit_origin, 0) = 0                 ' +
    '  and misc.eplant_filter( a.eplant_id ) = 1           ';

const
  cSelectedCycleCountCodeSQLFrom = Tag_Share.cTAG_SELECT_FROM_START_MARK +
    ' from fgmulti f, locations l, arinvt a, cycle_count c ' +
    'where l.id(+) = f.loc_id                              ' +
    '  and a.id = f.arinvt_id                              ' +
    '  and NVL(a.non_material, ''N'') <> ''Y''             ' +
    '  and a.cycle_count_id = c.id                         ' +
    '  and nvl(count_per_year, -1) <> 0                    ' +
    '  and (count_per_year is null or                      ' +
    '  Trunc(NVL(a.cycle_count_date, sysdate-1000)) +      ' +
    '  trunc( 365 / decode( nvl(count_per_year,0), 0, 366, count_per_year )) <= Trunc(sysdate)) '
    + '  and NVL(l.vmi, ''N'') = ''N''                       ' +
    '  and nvl(f.in_transit_origin, 0) = 0                 ' +
    '  and misc.eplant_filter( a.eplant_id ) = 1           ';

const
  cProdSQLFrom = Tag_Share.cTAG_SELECT_FROM_START_MARK +
    ' from fgmulti f, locations l, arinvt a ' +
    'where l.id(+) = f.loc_id               ' +
    '  and NVL(l.vmi, ''N'') = ''N''        ' +
    ' and NVL(a.non_material, ''N'') <> ''Y''  ' +
    '  and a.id = f.arinvt_id(+)            ' +
    '  and a.id in ( select arinvt_id       ' +
    '                from day_use_total d   ' +
    '               where trunc(d.prod_date) between trunc(sysdate) and trunc(sysdate) + %d) '
    + '  and nvl(f.in_transit_origin, 0) = 0 ' +
    '  and misc.eplant_filter( a.eplant_id ) = 1 ';

const
  cClassSQLFrom = Tag_Share.cTAG_SELECT_FROM_START_MARK +
    ' from fgmulti f, locations l, arinvt a ' + 'where l.id(+) = f.loc_id  ' +
    '  and NVL(l.vmi, ''N'') = ''N''        ' +
    ' and NVL(a.non_material, ''N'') <> ''Y''  ' + '  and a.id = f.arinvt_id  '
    + '  and a.class in (select class from GTT_taginv_class ) ' +
    '  and (f.loc_id in ( select loc_id from GTT_taginv_location )) ' +
    '  and nvl(f.in_transit_origin, 0) = 0 ' +
    '  and Misc.Eplant_Filter( a.eplant_id ) = 1 ';

const
  cItemSQLFrom = Tag_Share.cTAG_SELECT_FROM_START_MARK +
    ' from fgmulti f, locations l, arinvt a ' + 'where l.id(+) = f.loc_id  ' +
    '  and NVL(l.vmi, ''N'') = ''N''        ' +
    ' and NVL(a.non_material, ''N'') <> ''Y''  ' + '  and a.id = f.arinvt_id  '
    + '  and a.id in (select arinvt_id from GTT_taginv_item ) ' +
    '  and (f.loc_id in ( select loc_id from GTT_taginv_location )) ' +
    '  and nvl(f.in_transit_origin, 0) = 0 ' +
    '  and Misc.Eplant_Filter( a.eplant_id ) = 1 ';

const
  cCycleCountSQLFrom = Tag_Share.cTAG_SELECT_FROM_START_MARK +
    ' from fgmulti f, locations l, arinvt a ' + 'where l.id(+) = f.loc_id  ' +
    '  and NVL(l.vmi, ''N'') = ''N''        ' +
    ' and NVL(a.non_material, ''N'') <> ''Y''  ' + '  and a.id = f.arinvt_id  '
    + '  and a.cycle_count_id in ( select cycle_count_id from GTT_taginv_cycle_count) '
    + '  and (f.loc_id in ( select loc_id from GTT_taginv_location )) ' +
    '  and nvl(f.in_transit_origin, 0) = 0 ' +
    '  and Misc.Eplant_Filter( a.eplant_id ) = 1 ';

const
  cCycleCountRequiringSQLFrom = Tag_Share.cTAG_SELECT_FROM_START_MARK +
    ' from fgmulti f, locations l, arinvt a, cycle_count c ' +
    'where l.id(+) = f.loc_id  ' + '  and NVL(l.vmi, ''N'') = ''N''        ' +
    ' and NVL(a.non_material, ''N'') <> ''Y''  ' + '  and a.id = f.arinvt_id  '
    + '  and a.cycle_count_id in ( select cycle_count_id from GTT_taginv_cycle_count) '
    +

    '  and a.cycle_count_id = c.id                       ' +
    '  and nvl(c.count_per_year, 0) > 0                  ' +
    '  and ( trunc(nvl(f.cycle_count_date, sysdate-1000)) + trunc( 365 / iqmisc.no_zero(count_per_year) )) <= Trunc(sysdate) '
    +

    '  and (f.loc_id in ( select loc_id from GTT_taginv_location )) ' +
    '  and nvl(f.in_transit_origin, 0) = 0 ' +
    '  and Misc.Eplant_Filter( a.eplant_id ) = 1 ';

const
  cLocationSQLFrom = Tag_Share.cTAG_SELECT_FROM_START_MARK +
    ' from fgmulti f, locations l, arinvt a ' + 'where l.id(+) = f.loc_id  ' +
    '  and NVL(l.vmi, ''N'') = ''N''        ' +
    ' and NVL(a.non_material, ''N'') <> ''Y''  ' + '  and a.id = f.arinvt_id  '
    + '  and (f.loc_id in ( select loc_id from GTT_taginv_location )) ' +
    '  and nvl(f.in_transit_origin, 0) = 0 ' +
    '  and misc.eplant_filter( a.eplant_id ) = 1 ';

type
  TFrmTagSelect = class(TUniForm)
    tblLocations: TFDTable;
    pmSelect: TUniPopupMenu;
    SelectAll2: TUniMenuItem;
    DeselectAll2: TUniMenuItem;
    InvertSelection1: TUniMenuItem;
    pmLoc: TUniPopupMenu;
    SelectAll3: TUniMenuItem;
    DeselectAll3: TUniMenuItem;
    InvertSelection2: TUniMenuItem;
    SrcClass: TDataSource;
    QryClass: TFDQuery;
    QryCycleCountCode: TFDQuery;
    tblLocationsEPLANT_ID: TBCDField;
    tblLocationsID: TBCDField;
    tblLocationsLOC_DESC: TStringField;
    tblLocationsSTART_ROW: TBCDField;
    tblLocationsSTART_COL: TBCDField;
    tblLocationsEND_ROW: TBCDField;
    tblLocationsEND_COL: TBCDField;
    tblLocationsSTATUS: TStringField;
    tblLocationsDIVISION_ID: TBCDField;
    tblLocationsDESCRIP: TStringField;
    tblLocationsVMI: TStringField;
    QryClassCLASS: TStringField;
    QryCycleCountCodeID: TBCDField;
    QryCycleCountCodeCODE: TStringField;
    QryCycleCountCodeDESCRIP: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    Splitter3: TUniSplitter;
    Label5: TUniLabel;
    Bevel4: TUniPanel;
    lblDivision: TUniLabel;
    Bevel5: TUniPanel;
    Panel15: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    QryDivision: TFDQuery;
    QryDivisionID: TFMTBCDField;
    QryDivisionNAME: TStringField;
    QryDivisionDESCRIP: TStringField;
    wwDBLookupDivision: TUniDBLookupComboBox;
    Bevel6: TUniPanel;
    cbDoNotAutoCreatetags: TUniCheckBox;
    QryCycleCountCodeGrid: TFDQuery;
    SrcCycleCountCodeGrid: TDataSource;
    QryCycleCountCodeGridID: TBCDField;
    QryCycleCountCodeGridCODE: TStringField;
    QryCycleCountCodeGridDESCRIP: TStringField;
    chkRequireAlLCounted: TUniCheckBox;
    Panel20: TUniPanel;
    Panel21: TUniPanel;
    Splitter5: TUniSplitter;
    rbFullInv: TUniRadioButton;
    RBCycleCountCode: TUniRadioButton;
    rbProduction: TUniRadioButton;
    rbClass: TUniRadioButton;
    Label6: TUniLabel;
    SrcArinvt: TDataSource;
    QryArinvt: TFDQuery;
    QryArinvtITEMNO: TStringField;
    QryArinvtDESCRIP: TStringField;
    QryArinvtREV: TStringField;
    QryArinvtCLASS: TStringField;
    QryArinvtDESCRIP2: TStringField;
    QryArinvtID: TBCDField;
    pnlMainClient: TUniPanel;
    pnlMain: TUniPanel;
    pgctrlMain: TUniPageControl;
    tabBasedFullInv: TUniTabSheet;
    Panel3: TUniPanel;
    tabBasedCycleCount: TUniTabSheet;
    Panel23: TUniPanel;
    Label3: TUniLabel;
    chkbAllCycleCountCodes: TUniCheckBox;
    dbCycleCountCode: TUniDBLookupComboBox;
    chkbSelectedCycleCountCodes: TUniCheckBox;
    chkbOneCycleCountCode: TUniCheckBox;
    Panel4: TUniPanel;
    Bevel1: TUniPanel;
    IQSearch2: TIQUniGridControl;
    tabBasedProd: TUniTabSheet;
    Panel24: TUniPanel;
    Label1: TUniLabel;
    seScope: TUniSpinEdit;
    tabBasedLocation: TUniTabSheet;
    Panel25: TUniPanel;
    Splitter6: TUniSplitter;
    pgctrlLocation: TUniPageControl;
    tabClass: TUniTabSheet;
    IQSearch1: TIQUniGridControl;
    tabItem: TUniTabSheet;
    IQSearchItem: TIQUniGridControl;
    Panel26: TUniPanel;
    Splitter1: TUniSplitter;
    pnlAvailableLocations: TUniPanel;
    Panel10: TUniPanel;
    Panel13: TUniPanel;
    sbtnRefreshLocations: TUniSpeedButton;
    lbSelect: TUniListBox;
    Panel18: TUniPanel;
    BtnRight: TUniButton;
    BtnAllRight: TUniButton;
    BtnAllLeft: TUniButton;
    BtnLeft: TUniButton;
    Panel8: TUniPanel;
    Panel9: TUniPanel;
    lbLoc: TUniListBox;
    pnlTitle: TUniPanel;
    Bevel2: TUniPanel;
    Bevel3: TUniPanel;
    tabCycleCount: TUniTabSheet;
    Panel2: TUniPanel;
    IQSearchCycleCount: TIQUniGridControl;
    SrcDivision: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnRightClick(Sender: TObject);
    procedure BtnAllRightClick(Sender: TObject);
    procedure BtnAllLeftClick(Sender: TObject);
    procedure BtnLeftClick(Sender: TObject);
    procedure lbLocDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbSelectDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbLocDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lbSelectDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure SelectAll3Click(Sender: TObject);
    procedure DeselectAll3Click(Sender: TObject);
    procedure InvertSelection2Click(Sender: TObject);
    procedure SelectAll2Click(Sender: TObject);
    procedure DeselectAll2Click(Sender: TObject);
    procedure InvertSelection1Click(Sender: TObject);
    procedure rbClassClick(Sender: TObject);
    procedure rbFullInvClick(Sender: TObject);
    procedure rbProductionClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RBCycleCountCodeClick(Sender: TObject);
    procedure tblLocationsBeforeOpen(DataSet: TDataSet);
    procedure sbtnRefreshLocationsClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure chkCycleCountCodesClick(Sender: TObject);
    procedure cbDoNotAutoCreatetagsClick(Sender: TObject);
    procedure chkRequireAlLCountedClick(Sender: TObject);
    procedure pgctrlLocationChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure LoadListBox;
    procedure AddItemToAList(ListBox: TUniListBox; Location: String;
      nId: Integer);
    procedure DeleteItemFromAList(ListBox: TUniListBox; nItem: Integer);
    procedure SelectAll(ListBox: TUniListBox);
    procedure InvertSelection(ListBox: TUniListBox);
    procedure ClearListBox(ListBox: TUniListBox);
    procedure EnableDisableClass(ED: Boolean);
    procedure CheckLocationsNotEmpty;
    // function  GetLocationsNextRange( AFrom, N: Integer ):string;  // obsolete
    // function SelectedClassesToStr: string;
    procedure CheckAddAdditionalCriteria;

    procedure LoadSelectedLocationsIntoGTT;
    function LoadSelectedClassesIntoGTT: Boolean;
    function LoadSelectedItemsIntoGTT: Boolean;
    procedure UpdateTitle(Sender: TObject);
    procedure CheckLocationsFrozen;
    function LoadSelectedCycleCountIntoGTT: Boolean;
  public
    { Public declarations }
    FSql: String;
    FMethodAttribute: string;
    class procedure RecordSelectedLocationsInXFgmulti_Params(ATagHead_ID: Real);
  end;

function GetSelectionCriteria(var ACriteria: TTagInvSelectionCritera): Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.SysShare,
  taginv_rscstr;

function GetSelectionCriteria(var ACriteria: TTagInvSelectionCritera): Boolean;
var
  FrmTagSelect: TFrmTagSelect;
begin
  // show the form
  FrmTagSelect := TFrmTagSelect.Create(uniGUIApplication.uniApplication);
  with FrmTagSelect do
    try
      Result := (ShowModal = mrOK) and (FSql > '');
      if Result then
      begin
        ACriteria.SQL := FSql;
        if rbFullInv.Checked then
          ACriteria.Method := cTAG_WORKSHEET_FULL { defined in Tag_Share.pas }
        else if RBCycleCountCode.Checked then
          ACriteria.Method := cTAG_WORKSHEET_CYCLE
        else if rbProduction.Checked then
          ACriteria.Method := cTAG_WORKSHEET_PROD
        else if rbClass.Checked then
          ACriteria.Method := cTAG_WORKSHEET_CLASS
        else
          ACriteria.Method := cTAG_WORKSHEET_UNKNOWN; { s/n happen }

        ACriteria.DoNotAutoCreateTags := cbDoNotAutoCreatetags.Checked;
        ACriteria.RequireAllCounted := chkRequireAlLCounted.Checked;

        if QryDivisionID.asFloat > -1 then
          ACriteria.Division_ID := QryDivisionID.asFloat;

        ACriteria.MethodAttribute := FMethodAttribute;
      end;
    finally
      // Free;
    end;
end;

procedure TFrmTagSelect.FormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);

  FSql := '';

  IQMS.Common.Controls.AdjustPageControlToParent(pgctrlMain);
  pgctrlLocation.ActivePageIndex := 0;

  LoadListBox;
  rbClassClick(rbClass);
  chkCycleCountCodesClick(chkbAllCycleCountCodes);

  seScope.Value := Trunc(SelectValueAsFloat('select sched_scope from params'));
  with lblDivision do
    Caption := CheckReplaceDivisionCaption(Caption);
  { IQMS.Common.SysShare.pas }

  { TODO -oSanketG -cWC : Need to find alternative for UserBtn1  in TIQUniGridControl }
  { IQSearchCycleCount.UserBtn1.GroupIndex:= 1;
    IQSearchCycleCount.UserBtn1.AllowAllUp:= TRUE; }
  IQRegFormRead(self, [self, pnlAvailableLocations]);

  CheckVistaAdjustSize([dbCycleCountCode]);
end;

procedure TFrmTagSelect.FormShow(Sender: TObject);
begin
  IQMS.Common.Controls.ResizeCheckBoxes(self, cbDoNotAutoCreatetags);
  IQMS.Common.Controls.ResizeCheckBoxes(self, chkRequireAlLCounted);
  IQMS.Common.Controls.ResizeCheckBoxes(self, chkbAllCycleCountCodes);
  IQMS.Common.Controls.ResizeCheckBoxes(self, chkbOneCycleCountCode);
  IQMS.Common.Controls.ResizeCheckBoxes(self, chkbSelectedCycleCountCodes);
end;

procedure TFrmTagSelect.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, pnlAvailableLocations]);
end;

procedure TFrmTagSelect.LoadListBox;
begin
  lbSelect.Items.Clear;

  tblLocations.First;
  with tblLocations do
    while not eof do
    begin
      AddItemToAList(lbSelect, FieldByName('LOC_DESC').asString,
        FieldByName('ID').asInteger);
      Next;
    end;
end;

procedure TFrmTagSelect.AddItemToAList(ListBox: TUniListBox; Location: String;
  nId: Integer);
begin
  ListBox.Items.Add(Location);
  { instead of using an object to store the ID, we are putting the ID in the pointer to an object of the TStrings }
  ListBox.Items.Objects[ListBox.Items.Count - 1] := Pointer(nId);
end;

procedure TFrmTagSelect.DeleteItemFromAList(ListBox: TUniListBox;
  nItem: Integer);
begin
  ListBox.Items.Delete(nItem);
end;

procedure TFrmTagSelect.SelectAll(ListBox: TUniListBox);
var
  i: Integer;
begin
  with ListBox do
    for i := 0 to Items.Count - 1 do
      Selected[i] := TRUE;
end;

procedure TFrmTagSelect.InvertSelection(ListBox: TUniListBox);
var
  i: Integer;
begin
  with ListBox do
    for i := 0 to Items.Count - 1 do
      if Selected[i] then
        Selected[i] := False
      else
        Selected[i] := TRUE;
end;

procedure TFrmTagSelect.BtnRightClick(Sender: TObject);
var
  i, nItems, nId, nSelected: Integer;
begin
  with lbSelect do
  begin
    nSelected := SelCount;
    if (Items.Count = 0) or (nSelected = 0) then
      Exit;
    nItems := Items.Count - 1;
    for i := nItems downto 0 do
    begin
      if Selected[i] then
      begin
        nId := LongInt(Items.Objects[i]);
        AddItemToAList(lbLoc, Items[i], nId);
        DeleteItemFromAList(lbSelect, i);
      end;
    end;
  end;
end;

procedure TFrmTagSelect.BtnAllRightClick(Sender: TObject);
var
  i, nItems, nId: Integer;
begin
  with lbSelect do
  begin
    if Items.Count = 0 then
      Exit;
    nItems := Items.Count - 1;
    for i := nItems downto 0 do
    begin
      nId := LongInt(Items.Objects[i]);
      AddItemToAList(lbLoc, Items[i], nId);
      DeleteItemFromAList(lbSelect, i);
    end;
  end;
end;

procedure TFrmTagSelect.BtnAllLeftClick(Sender: TObject);
var
  i, nItems, nId: Integer;
begin
  with lbLoc do
  begin
    if Items.Count = 0 then
      Exit;
    nItems := Items.Count - 1;
    for i := nItems downto 0 do
    begin
      nId := LongInt(Items.Objects[i]);
      AddItemToAList(lbSelect, Items[i], nId);
      DeleteItemFromAList(lbLoc, i);
    end;
  end;
end;

procedure TFrmTagSelect.BtnLeftClick(Sender: TObject);
var
  i, nItems, nId, nSelected: Integer;
begin
  with lbLoc do
  begin
    nSelected := SelCount;
    if (Items.Count = 0) or (nSelected = 0) then
      Exit;
    nItems := Items.Count - 1;
    for i := nItems downto 0 do
    begin
      if Selected[i] then
      begin
        nId := LongInt(Items.Objects[i]);
        AddItemToAList(lbSelect, Items[i], nId);
        DeleteItemFromAList(lbLoc, i);
      end;
    end;
  end;
end;

procedure TFrmTagSelect.ClearListBox(ListBox: TUniListBox);
var
  i: Integer;
begin
  with ListBox do
    for i := 0 to Items.Count - 1 do
      if Selected[i] then
        Selected[i] := False;
end;

procedure TFrmTagSelect.lbLocDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := Source = lbSelect;
end;

procedure TFrmTagSelect.lbSelectDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := Source = lbLoc;
end;

procedure TFrmTagSelect.lbLocDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  BtnRight.Click;
end;

procedure TFrmTagSelect.lbSelectDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  BtnLeft.Click;
end;

procedure TFrmTagSelect.SelectAll3Click(Sender: TObject);
begin
  SelectAll(lbLoc);
end;

procedure TFrmTagSelect.DeselectAll3Click(Sender: TObject);
begin
  ClearListBox(lbLoc);
end;

procedure TFrmTagSelect.InvertSelection2Click(Sender: TObject);
begin
  InvertSelection(lbLoc);
end;

procedure TFrmTagSelect.SelectAll2Click(Sender: TObject);
begin
  SelectAll(lbSelect);
end;

procedure TFrmTagSelect.DeselectAll2Click(Sender: TObject);
begin
  ClearListBox(lbSelect);
end;

procedure TFrmTagSelect.InvertSelection1Click(Sender: TObject);
begin
  InvertSelection(lbSelect);
end;

procedure TFrmTagSelect.RBCycleCountCodeClick(Sender: TObject);
begin
  pgctrlMain.ActivePage := tabBasedCycleCount;
  UpdateTitle(Sender);
end;

procedure TFrmTagSelect.chkCycleCountCodesClick(Sender: TObject);
begin
  chkbAllCycleCountCodes.OnClick := nil;
  chkbOneCycleCountCode.OnClick := nil;
  chkbSelectedCycleCountCodes.OnClick := nil;
  try
    chkbAllCycleCountCodes.Checked := Sender = chkbAllCycleCountCodes;
    chkbOneCycleCountCode.Checked := Sender = chkbOneCycleCountCode;
    chkbSelectedCycleCountCodes.Checked := Sender = chkbSelectedCycleCountCodes;
  finally
    chkbAllCycleCountCodes.OnClick := chkCycleCountCodesClick;
    chkbOneCycleCountCode.OnClick := chkCycleCountCodesClick;
    chkbSelectedCycleCountCodes.OnClick := chkCycleCountCodesClick;
  end;

  IQEnableControl(dbCycleCountCode, chkbOneCycleCountCode.Checked);
  IQEnableControl(IQSearch2, chkbSelectedCycleCountCodes.Checked);
end;

procedure TFrmTagSelect.UpdateTitle(Sender: TObject);
begin
  if Sender is TUniRadioButton then
    pnlTitle.Caption := Format('  %s', [TUniRadioButton(Sender).Caption])
  else
    pnlTitle.Caption := '';
end;

procedure TFrmTagSelect.rbClassClick(Sender: TObject);
begin
  pgctrlMain.ActivePage := tabBasedLocation;
  UpdateTitle(Sender);
end;

procedure TFrmTagSelect.rbFullInvClick(Sender: TObject);
begin
  pgctrlMain.ActivePage := tabBasedFullInv;
  UpdateTitle(Sender);
end;

procedure TFrmTagSelect.rbProductionClick(Sender: TObject);
begin
  pgctrlMain.ActivePage := tabBasedProd;
  UpdateTitle(Sender);
end;

procedure TFrmTagSelect.EnableDisableClass(ED: Boolean);
begin
  // -- lbSelect.Enabled    := ED;
  // -- lbLoc.Enabled       := ED;
  // -- IQSearch1.Enabled   := ED;
  // -- IQSearch1.wwDBGrid.Enabled:= ED;
  // -- btnRight.Enabled    := ED;
  // -- btnAllRight.Enabled := ED;
  // -- btnLeft.Enabled     := ED;
  // -- btnAllLeft.Enabled  := ED;
  // --
  // -- if not IQSearch1.Enabled then
  // --    IQSearch1.wwDBGrid.Font.Color:= clSilver
  // -- else
  // --    IQSearch1.wwDBGrid.Font.Color:= clBlack;
end;

procedure TFrmTagSelect.btnOkClick(Sender: TObject);
// -- const
// -- CHUNK_SIZE = 250;  {Oracle limit is 254}
var
  ALocs: string;
  ACycles: string;

  // ---------------------------------------------------------------------------
  procedure _FullPhysical;
  begin
    FSql := cInsertPlusSelectSql + cFullInvSQLFrom;
  end;

// ---------------------------------------------------------------------------
  procedure _ProdNeed;
  begin
    FSql := cInsertPlusSelectSql + Format(cProdSQLFrom, [seScope.Value]);
  end;

// ---------------------------------------------------------------------------
  procedure _CycleCount(IQSearch: TIQUniGridControl);
  var
    i: Integer;
  begin
    if chkbOneCycleCountCode.Checked and (Trim(dbCycleCountCode.Text) = '') then
      raise Exception.Create
        (taginv_rscstr.cTXT0000045 { 'Please enter a Cycle Count Code.' } );

    if chkbSelectedCycleCountCodes.Checked then
    begin
      { TODO -oSanketG -cWC : Need to find alternative for wwDBGrid  in TIQUniGridControl }
      (* if IQMS.WebVcl.Search.wwDBGrid.SelectedList.Count = 0 then
        raise Exception.Create(taginv_rscstr.cTXT0000053 {'No Cycle Codes records selected.'}); *)

      FSql := cInsertPlusSelectSql + cSelectedCycleCountCodeSQLFrom + ' and (';

      { TODO -oSanketG -cWC : Need to find alternative for wwDBGrid  in TIQUniGridControl }
      { with IQMS.WebVcl.Search.wwDBGrid, IQMS.WebVcl.Search.wwDBGrid.Datasource.Dataset do
        for I:= 0 to SelectedList.Count-1 do
        begin
        GotoBookmark(SelectedList.items[I]);
        if I = SelectedList.Count - 1 then
        FSql:= FSql + Format('c.code = ''%s'') ', [FieldByName('CODE').asString])
        else
        FSql:= FSql + Format('c.code = ''%s'' or ', [FieldByName('CODE').asString]);
        end;
      }
    end
    else
      FSql := cInsertPlusSelectSql + IQFormat(cCycleCountCodeSQLFrom,
        [DtoF(IIf(chkbAllCycleCountCodes.Checked, 1, 0)),
        dbCycleCountCode.Text]);
  end;

// ---------------------------------------------------------------------------
  procedure _LocationBased;
  var
    i: Integer;
  begin
    CheckLocationsNotEmpty;

    i := 0;
    FSql := cInsertSql;

    LoadSelectedLocationsIntoGTT;
    CheckLocationsFrozen;

    case pgctrlLocation.ActivePageIndex of
      // class
      0:
        begin
          if not LoadSelectedClassesIntoGTT() then
          // no System.Classes - just locations
            FSql := FSql + cSelectSQL + cLocationSQLFrom
          else
            FSql := FSql + cSelectSQL + cClassSQLFrom;
          // System.Classes and locations
          FMethodAttribute := Tag_Share.cTAG_ATTRIBUTE_CLASS;
        end;

      // item
      1:
        begin
          if not LoadSelectedItemsIntoGTT() then // no items - just locations
            FSql := FSql + cSelectSQL + cLocationSQLFrom
          else
            FSql := FSql + cSelectSQL + cItemSQLFrom;
          FMethodAttribute := Tag_Share.cTAG_ATTRIBUTE_ITEM;
        end;

      // cycle count
      2:
        begin
          if not LoadSelectedCycleCountIntoGTT() then
          // no cycles - just locations
            FSql := FSql + cSelectSQL + cLocationSQLFrom
            { TODO -oSanketG -cWC : Need to find alternative for UserBtn1 in TIQUniGridControl }
            { else if not IQSearchCycleCount.UserBtn1.Down then
              begin
              FSQL:= FSQL + cSelectSQL + cCycleCountSQLFrom;
              FMethodAttribute:= tag_share.cTAG_ATTRIBUTE_CYCLE_COUNT;
              end
              else
              begin
              FSQL:= FSQL + cSelectSQL + cCycleCountRequiringSQLFrom;
              FMethodAttribute:= tag_share.cTAG_ATTRIBUTE_REQUIRING_CYCLE_COUNT;
              end; }
        end;
    end;
  end;

// -----------------------------------------------------------------------------
begin
  if rbFullInv.Checked then
    _FullPhysical

  else if rbProduction.Checked then
    _ProdNeed

  else if RBCycleCountCode.Checked then
    _CycleCount(IQSearch2)

  else
    _LocationBased;
  // 02-02-2015 moved to TagInv after we establish TAGHEAD_ID
  // RecordSelectedLocationsInXFgmulti_Params;

  CheckAddAdditionalCriteria;

  ModalResult := mrOK;
end;

procedure TFrmTagSelect.CheckLocationsNotEmpty;
begin
  with lbLoc do
    if Items.Count = 0 then
      raise Exception.Create
        (taginv_rscstr.cTXT0000046 { 'Please select locations.' } );
end;

procedure TFrmTagSelect.CheckAddAdditionalCriteria;
begin
  if QryDivisionID.asFloat > -1 then
    FSql := IQFormat('%s and f.division_id = %f',
      [FSql, QryDivisionID.asFloat]);

  if chkRequireAlLCounted.Checked then
    FSql := Format('%s and nvl(a.is_linked_to_serial, ''N'') <> ''Y''', [FSql]);
end;

procedure TFrmTagSelect.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmMFG { CHM } , iqhtmINVENTORY { HTM } );
  { IQMS.Common.HelpHook.pas }
end;

procedure TFrmTagSelect.tblLocationsBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter(DataSet); { pas }
end;

procedure TFrmTagSelect.sbtnRefreshLocationsClick(Sender: TObject);
var
  i, J: Integer;
begin
  { full locations list }
  LoadListBox;

  { get rid of selected }
  for i := 0 to lbLoc.Items.Count - 1 do
  begin
    J := lbSelect.Items.IndexOf(lbLoc.Items[i]);
    if J > -1 then
      lbSelect.Items.Delete(J);
  end;
end;

procedure TFrmTagSelect.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmTagSelect.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

class procedure TFrmTagSelect.RecordSelectedLocationsInXFgmulti_Params
  (ATagHead_ID: Real);
var
  i: Integer;
begin
  ExecuteCommandFmt('delete from xfgmulti_param where taghead_id = %f',
    [ATagHead_ID]);

  ExecuteCommandFmt('insert into xfgmulti_param                     ' +
    '     ( eplant_id, source, nvalue, taghead_id ) ' +
    'select %f,                                     ' + // eplant_id
    '       ''LOCATIONS'',                          ' +
    '       loc_id,                                 ' +
    '       %f                                      ' + // taghead_id
    '  from gtt_taginv_location                     ',
    [SecurityManager.EPlant_ID_AsFloat, ATagHead_ID]);

  // if SecurityManager.EPlantsExist then
  // ExecuteCommandFmt('delete from xfgmulti_param where eplant_id = %f', [ SecurityManager.EPlant_ID_AsFloat ])
  // else
  // ExecuteCommand('delete from xfgmulti_param');
  //
  // with lbLoc do
  // for I:= 0 to lbLoc.Count - 1 do
  // ExecuteCommandFmt('insert into xfgmulti_param( eplant_id, source, nvalue, taghead_id ) values (%f, ''LOCATIONS'', %d, %f)',
  // [ SecurityManager.EPlant_ID_AsFloat,
  // LongInt(Items.Objects[ I ]),
  // ATagHead_ID ]);
end;

procedure TFrmTagSelect.cbDoNotAutoCreatetagsClick(Sender: TObject);
begin
  IQMS.Common.Controls.IQEnableControl(chkRequireAlLCounted,
    not cbDoNotAutoCreatetags.Checked);
end;

procedure TFrmTagSelect.chkRequireAlLCountedClick(Sender: TObject);
begin
  IQMS.Common.Controls.IQEnableControl(cbDoNotAutoCreatetags,
    not chkRequireAlLCounted.Checked);
end;

procedure TFrmTagSelect.LoadSelectedLocationsIntoGTT;
var
  i: Integer;
begin
  ExecuteCommand('delete from gtt_taginv_location');

  for i := 0 to lbLoc.Count - 1 do
    if LongInt(lbLoc.Items.Objects[i]) > 0 then // precaution
      ExecuteCommandFmt
        ('insert into gtt_taginv_location( loc_id ) values( %d )',
        [LongInt(lbLoc.Items.Objects[i])]);
end;

procedure TFrmTagSelect.pgctrlLocationChange(Sender: TObject);
begin
  if pgctrlLocation.ActivePage = tabItem then
    QryArinvt.Open;
end;

function TFrmTagSelect.LoadSelectedClassesIntoGTT: Boolean;
var
  i: Integer;
begin
  ExecuteCommand('delete from gtt_taginv_class');
  { TODO -oSanketG -cWC : Need to find alternative for wwDBGrid  in TIQUniGridControl }
  { with IQSearch1 do
    for I:= 0 to wwDBGrid.SelectedList.Count - 1 do
    begin
    DataSet.GotoBookmark( wwDBGrid.SelectedList.Items[ I ]);
    ExecuteCommandFmt('insert into gtt_taginv_class( class ) values( ''%s'' )', [ DataSet.FieldByName('CLASS').asString ]);
    end;
    IQSearch1.wwDBGrid.UnselectAll; }

  Result := SelectValueAsFloat('select count(*) from gtt_taginv_class') > 0;
end;

function TFrmTagSelect.LoadSelectedItemsIntoGTT: Boolean;
var
  i: Integer;
begin
  ExecuteCommand('delete from gtt_taginv_item');
  { TODO -oSanketG -cWC : Need to find alternative for wwDBGrid  in TIQUniGridControl }
  { with IQSearchItem do
    for I:= 0 to wwDBGrid.SelectedList.Count - 1 do
    begin
    DataSet.GotoBookmark( wwDBGrid.SelectedList.Items[ I ]);
    ExecuteCommandFmt('insert into gtt_taginv_item( arinvt_id ) values( %f )', [ DataSet.FieldByName('id').asFloat ]);
    end;
    IQSearchItem.wwDBGrid.UnselectAll; }

  Result := SelectValueAsFloat('select count(*) from gtt_taginv_item') > 0;
end;

function TFrmTagSelect.LoadSelectedCycleCountIntoGTT: Boolean;
var
  i: Integer;
begin
  ExecuteCommand('delete from gtt_taginv_cycle_count');
  { TODO -oSanketG -cWC : Need to find alternative for wwDBGrid  in TIQUniGridControl }
  { with IQSearchCycleCount do
    for I:= 0 to wwDBGrid.SelectedList.Count - 1 do
    begin
    DataSet.GotoBookmark( wwDBGrid.SelectedList.Items[ I ]);
    ExecuteCommandFmt('insert into gtt_taginv_cycle_count( cycle_count_id ) values( %f )', [ DataSet.FieldByName('id').asFloat ]);
    end;
    IQSearchCycleCount.wwDBGrid.UnselectAll; }

  Result := SelectValueAsFloat
    ('select count(*) from gtt_taginv_cycle_count') > 0;
end;

procedure TFrmTagSelect.CheckLocationsFrozen;
var
  ALoc_ID: Real;
  ALoc_Desc: string;
begin
  if SelectValueAsString('select taginv_freeze_worksheet_locs from params') <> 'Y'
  then
    Exit;

  ALoc_ID := SelectValueAsFloat
    ('select loc_id                                   ' +
    '  from ps_ticket_rel r,                         ' +
    '       fgmulti f                                ' +
    ' where r.fgmulti_id = f.id                      ' +
    '   and f.loc_id in                              ' +
    '       (select loc_id from gtt_taginv_location) ' +
    '   and rownum < 2                               ');
  if ALoc_ID = 0 then
    Exit;

  ALoc_Desc := SelectValueByID('rtrim(loc_desc)', 'locations', ALoc_ID);

  if not IQMS.Common.Dialogs.IQConfirmYNWithSecurity
    (Format(cTXT0000068, [ALoc_Desc]),
    // 'Location %s is associated to a pick ticket. Are you sure you want to continue?';
    'TFrmTagSelect_ValidateLocations', False) then
    ABORT;
end;

end.
