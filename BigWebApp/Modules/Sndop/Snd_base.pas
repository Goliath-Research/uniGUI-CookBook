unit Snd_Base;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.Menus,
  Mask,
  Vcl.DBGrids,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Snd_DM,
  IQMS.WebVcl.About,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.Documents,
  Snd_Link,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.DocumentsExternal,
  IQMS.WebVcl.Jump,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniPageControl, IQUniGrid, uniGUIFrame, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt;

const
  PredefinedSndClasses = '_OP_OV_BL_IN_PK_FB_AS_';
  constPICK_REPLACE_ARINVT = 10;

type
  TSndBase = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    N2: TUniMenuItem;
    Save1: TUniMenuItem;
    New1: TUniMenuItem;
    Edit1: TUniMenuItem;
    Delete1: TUniMenuItem;
    Cancel1: TUniMenuItem;
    N3: TUniMenuItem;
    Search1: TUniMenuItem;
    View1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Contents1: TUniMenuItem;
    Blends1: TUniMenuItem;
    AttachedComponents1: TUniMenuItem;
    AttachedPackaging1: TUniMenuItem;
    Options1: TUniMenuItem;
    OperationCost1: TUniMenuItem;
    Equipment1: TUniMenuItem;
    QtyPriceBreaks1: TUniMenuItem;
    ToggleTableForm1: TUniMenuItem;
    N4: TUniMenuItem;
    PageControlHeader: TUniPageControl;
    TabSheetForm: TUniTabSheet;
    TabSheetTable: TUniTabSheet;
    Splitter1: TUniSplitter;
    PageControlDetails: TUniPageControl;
    TabSheetOpInfo: TUniTabSheet;
    TabSheetMaterials: TUniTabSheet;
    pnlToolBar: TUniPanel;
    sbtnSearch: TUniSpeedButton;
    sbtnTableForm: TUniSpeedButton;
    sbtnOpCost: TUniSpeedButton;
    sbtnEquip: TUniSpeedButton;
    sbtnQtyPrice: TUniSpeedButton;
    NavMain: TUniDBNavigator;
    pnlMaterials: TUniPanel;
    GridMaterials: TUniDBGrid;
    Splitter2: TUniSplitter;
    navMaterials: TUniDBNavigator;
    dbgOperHeader: TIQUniGridControl;
    SearchAll1: TUniMenuItem;
    Misc1: TUniMenuItem;
    LaborRates1: TUniMenuItem;
    pnlMatQPB: TUniPanel;
    GridQtyBreaks: TUniDBGrid;
    Panel2: TUniPanel;
    navMatQPB: TUniDBNavigator;
    IQAbout1: TIQWebAbout;
    IQRepDef1: TIQWebRepDef;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrintSetup1: TUniMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    TabSheet1: TUniTabSheet;
    Generic1: TUniMenuItem;
    PageControl1: TUniPageControl;
    tabDocInternal: TUniTabSheet;
    tabDocExternal: TUniTabSheet;
    IQExtDoc1: TIQWebExtDoc;
    popmMaterials: TUniPopupMenu;
    JumptoInventory1: TUniMenuItem;
    IQJumpInv: TIQWebJump;
    PnlHeader01: TUniPanel;
    SplitterHeader01: TUniSplitter;
    PnlHeaderLeft01: TUniPanel;
    PnlHeaderClient01: TUniPanel;
    Label2: TUniLabel;
    dbeOpNo: TUniDBEdit;
    Label7: TUniLabel;
    dbeClass: TUniDBEdit;
    dbeOpDesc: TUniDBEdit;
    Label1: TUniLabel;
    bvToolbarBreak1: TUniPanel;
    bbtnRouteNote: TUniSpeedButton;
    dbchkPkHide: TUniDBCheckBox;
    WhereUsed1: TUniMenuItem;
    dbchkSupermarket: TUniDBCheckBox;
    IQWebSecurityRegister1: TIQWebSecurityRegister;
    IQDocs1: TIQWebDocs;
    SR: TIQWebSecurityRegister;
    procedure Exit1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnTableFormClick(Sender: TObject);
    procedure QtyPriceBreaks1Click(Sender: TObject);
    procedure Equipment1Click(Sender: TObject);
    procedure OperationCost1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnSearchClick(Sender: TObject);
    procedure SearchAll1Click(Sender: TObject);
    procedure LaborRates1Click(Sender: TObject);
    procedure Standard1Click(Sender: TObject);
    procedure GridMaterialsEditButtonClick(Sender: TObject); virtual;
    procedure FormDestroy(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    {
      procedure NavMainBeforeAction(Sender: TObject; Button: TUniNavigateBtn);
      procedure GridQtyBreaksDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    }
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure JumptoInventory1Click(Sender: TObject);
    procedure bbtnRouteNoteClick(Sender: TObject);
    procedure WhereUsed1Click(Sender: TObject);
  private
    procedure CheckProcessTurnsInactiveWhileInUse(ASndOp_ID: Real;
      ANewPK_Hide: string);
    { Private declarations }
  protected
    { Protected declarations }
    // function  GetDM: TDataModule;                   virtual;
    procedure AssignNames(var cOpMatName, cSndOpName,
      cSndOpIDName: string); virtual;
    procedure SetDataModule; virtual;
    function GetTblSndOp: TFDQuery; virtual;
    function GetTblOpMat: TFDTable; virtual;
    function GetTblLabor_Rates: TFDTable; virtual;
    function GetTblSndOp_Qty_Breaks: TFDTable; virtual;
    function GetTblArinvt: TFDTable; virtual;
    function GetSrcSndOp: TDataSource; virtual;
    function GetSrcOpMat: TDataSource; virtual;
    function GetSrcArinvt_Breaks: TDataSource; virtual;
    function GetSrcBlendArinvt_Breaks: TDataSource; virtual;
    function GetPkSndOp: TIQWebHpick; virtual;
    function GetPkSndOp_All: TIQWebHpick; virtual;
    function GetPkVendor: TIQWebHpick; virtual;
    function GetPkArinvt: TIQWebHpick; virtual;
    function GetPkCntrType: TIQWebHpick; virtual;
    // procedure TblSndOpNewRecord(DataSet: TDataSet); virtual;
    procedure TblSndOpAfterInsert(DataSet: TDataSet); virtual;
    procedure TblSndOpBeforePost(DataSet: TDataSet); virtual;
    procedure SrcSndOpStateChange(Sender: TObject); virtual;
    procedure EnableButtons(DataSet: TDataSet); virtual;
    procedure AfterDeleteEnableButtons(DataSet: TDataSet); virtual;
    procedure TblOpMatAfterInsert(DataSet: TDataSet); virtual;

    procedure sbtnCenterTypeClick(Sender: TObject); virtual;
    procedure sbtnGetVendorClick(Sender: TObject); virtual;
    procedure bbtnEditBlendInvClick(Sender: TObject); virtual;

    procedure FieldChange(AField: TField);

    procedure PkArinvtBeforeOpen(DataSet: TDataSet);
    procedure AddFilterEplantExpr(ASQL: TStrings; AOpClass: string); virtual;

  protected
    FExistingSndopAfterPost: TDataSetNotifyEvent;
    procedure LocalDataChange(Sender: TObject; Field: TField); virtual;
    procedure LocalSndopAfterPost(DataSet: TDataSet);
    procedure IQNotify(var Msg: TMessage); message iq_Notify;
    procedure HandleOnNotify(Msg: TMessage); virtual;

  public
    { Public declarations }
    DM: TDataModule;
    OpClass: string;

    NextSndOp: string;
    GetNextID: Real;
    ModalState: TModalState;

    fDataChange: TDataChangeEvent;
    fFieldChange: TFieldNotifyEvent;
    fFormStarted: Boolean;

    // property DM                 : TDataModule  read GetDM;
    property SrcSndOp: TDataSource read GetSrcSndOp;
    property SrcOpMat: TDataSource read GetSrcOpMat;
    property SrcArinvt_Breaks: TDataSource read GetSrcArinvt_Breaks;
    property SrcBlendArinvt_Breaks: TDataSource read GetSrcBlendArinvt_Breaks;
    property TblSndOp: TFDQuery read GetTblSndOp;
    property TblOpMat: TFDTable read GetTblOpMat;
    property TblLabor_Rates: TFDTable read GetTblLabor_Rates;
    property TblSndOp_Qty_Breaks: TFDTable read GetTblSndOp_Qty_Breaks;
    property TblArinvt: TFDTable read GetTblArinvt;

    property PkSndOp: TIQWebHpick read GetPkSndOp;
    property PkSndOp_All: TIQWebHpick read GetPkSndOp_All;
    property PkVendor: TIQWebHpick read GetPkVendor;
    property PkArinvt: TIQWebHpick read GetPkArinvt;
    property PkCntrType: TIQWebHpick read GetPkCntrType;

    // constructor Create( AOwner:TComponent ); override;

    procedure LocateSndOp(nID: Real); virtual;
    procedure DoShowSndOper(const cClass: string; nID: Real); virtual;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.EditMemoStr,
  invblend,
  IQMS.WebVcl.DocumentsCoordinator,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.MsgFrm,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  { TODO -ombaral -cWebIQ : Need to check dependency
    iqsecins,
  }
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  lab_rate,
  IQMS.Common.QC_Pkbase,
  snd_cost,
  snd_qpb,
  snd_where_used,
  sndop_rscstr,
  System.Variants;

{ Quote SndOp that inherits from Snd_OP (and the rest) needs probably to override these methods }
// -----------------------------------------------------------------------------
// function  TSndBase.GetDM: TDataModule;                begin result:= TSndDM(FDM)                    end;
function TSndBase.GetTblSndOp: TFDQuery;
begin
  result := TSndDM(DM).TblSndOp
end;

function TSndBase.GetTblOpMat: TFDTable;
begin
  result := TSndDM(DM).TblOpMat
end;

function TSndBase.GetTblArinvt: TFDTable;
begin
  result := TSndDM(DM).TblArinvt
end;

function TSndBase.GetTblLabor_Rates: TFDTable;
begin
  result := TSndDM(DM).TblLabor_Rates
end;

function TSndBase.GetTblSndOp_Qty_Breaks: TFDTable;
begin
  result := TSndDM(DM).TblSndOp_Qty_Breaks
end;

function TSndBase.GetSrcSndOp: TDataSource;
begin
  result := TSndDM(DM).SrcSndOp
end;

function TSndBase.GetSrcOpMat: TDataSource;
begin
  result := TSndDM(DM).SrcOpMat
end;

function TSndBase.GetSrcArinvt_Breaks: TDataSource;
begin
  result := TSndDM(DM).SrcArinvt_Breaks
end;

function TSndBase.GetSrcBlendArinvt_Breaks: TDataSource;
begin
  result := TSndDM(DM).SrcBlendArinvt_Breaks
end;

function TSndBase.GetPkSndOp: TIQWebHpick;
begin
  result := TSndDM(DM).PkSndOp
end;

function TSndBase.GetPkSndOp_All: TIQWebHpick;
begin
  result := TSndDM(DM).PkSndOp_All
end;

function TSndBase.GetPkVendor: TIQWebHpick;
begin
  result := TSndDM(DM).PkVendor
end;

function TSndBase.GetPkArinvt: TIQWebHpick;
begin
  result := TSndDM(DM).PkArinvt
end;

function TSndBase.GetPkCntrType: TIQWebHpick;
begin
  result := TSndDM(DM).PkCntrType
end;

procedure TSndBase.SetDataModule;
begin
  DM := TSndDM.Create(self)
end;

procedure TSndBase.DoShowSndOper(const cClass: string; nID: Real);
begin
  if ModalState = msModel then
  begin
    NextSndOp := cClass;
    GetNextID := nID;
    ModalResult := mrOK;
  end
  else
  begin
    Close;
    ShowSndOperModaless(nID, cClass);
  end;
end;
// -----------------------------------------------------------------------------

procedure TSndBase.FormCreate(Sender: TObject);
begin
  SetDataModule;
  inherited;
  DM.Name := '';

  NextSndOp := '';
  GetNextID := 0;
  ModalState := msModel;
  fDataChange := TFDTable(GridMaterials.DataSource.DataSet)
    .MasterSource.OnDataChange;
  fFieldChange := TFDTable(GridMaterials.DataSource.DataSet)
    .FieldByName('PTSPER_DISP').OnChange;

  TFDTable(GridMaterials.DataSource.DataSet).MasterSource.OnDataChange :=
    LocalDataChange;
  GridMaterials.DataSource.DataSet.FieldByName('PTSPER_DISP').OnChange :=
    self.FieldChange;

  PkArinvt.BeforeOpen := PkArinvtBeforeOpen;

  { TODO -ombaral -cWebIQ : Need to check dependency
   TAttachedDocumentsCoordinator.Create( self ).RegisterDocuments( TabSheet1, [ IQDocs1, IQExtDoc1 ]); // IQMS.WebVcl.DocumentsCoordinator.pas
  }
  fFormStarted := False;

  { Open Tables }
  if Assigned(DM) then
    IQSetTablesActiveEx(TRUE, DM,
      sndop_rscstr.cTXT0000050 { 'Accessing database.  Please wait.' } )
  else
    raise Exception.Create
      (sndop_rscstr.
      cTXT0000003 { 'Application Error:  Data Module is not initiated.' } );

  // 02-16-2016 FireDAC conversion
  if DM is TSndDM then
    with TSndDM(DM).TblArinvt do
    begin
      UpdateOptions.RequestLive := False;
      Open;
      UpdateOptions.RequestLive := TRUE;
    end;

  { For some reason Some of the DB aware components declared in ancestor are loosin their datasource }
  dbeClass.DataSource := SrcSndOp;
  dbeOpNo.DataSource := SrcSndOp;
  dbeOpDesc.DataSource := SrcSndOp;
  NavMain.DataSource := SrcSndOp;
  GridMaterials.DataSource := SrcOpMat;
  navMaterials.DataSource := SrcOpMat;
  GridQtyBreaks.DataSource := SrcArinvt_Breaks;
  navMatQPB.DataSource := SrcArinvt_Breaks;
  IQDocs1.MasterSource := SrcSndOp;

  SrcArinvt_Breaks.DataSet.Open;
  SrcBlendArinvt_Breaks.DataSet.Open;

  if Pos(OpClass, PredefinedSndClasses) > 0 then
  begin
    try
      // TblSndOp.SetRange( [ OpClass ], [ OpClass ] );
      // no need to Reopen(TblSndOp);
      if DM is TSndDM then
        TSndDM(DM).FRangeSet := TRUE;
    except
      ShowMessage
        (Format(sndop_rscstr.cTXT0000004 { 'Cannot set range to class, %s.' } ,
        [OpClass]));
      raise;
    end;
  end;

  // Local Changes to DataModule
  SrcSndOp.OnStateChange := SrcSndOpStateChange;
  // TblSndOp.OnNewRecord  := TblSndOpNewRecord;
  TblSndOp.AfterInsert := TblSndOpAfterInsert;
  TblSndOp.BeforePost := TblSndOpBeforePost;

  // TblSndOp.AfterPost    := EnableButtons;
  if Assigned(TblSndOp.AfterPost) then
    FExistingSndopAfterPost := TblSndOp.AfterPost;
  TblSndOp.AfterPost := LocalSndopAfterPost;

  TblSndOp.AfterCancel := EnableButtons;
  TblSndOp.AfterDelete := AfterDeleteEnableButtons;
  TblOpMat.AfterDelete := TblOpMatAfterInsert;

  // if OpClass = 'OP'      then Standard1.Checked:= TRUE
  // else if OpClass = 'OV' then OutVendor1.Checked:= TRUE
  if OpClass = 'BL' then
    Blends1.Checked := TRUE
  else if OpClass = 'IN' then
    AttachedComponents1.Checked := TRUE
  else if OpClass = 'PK' then
    AttachedPackaging1.Checked := TRUE
  else if OpClass = 'OP' then
    Generic1.Checked := TRUE
  else if OpClass = 'AS' then
    Generic1.Checked := TRUE
  else if OpClass = 'FB' then
    Generic1.Checked := TRUE;

  { Start with a form view }
  PageControlHeader.ActivePage := TabSheetForm;
  PageControlDetails.ActivePage := TabSheetOpInfo;

  { Header Grid DataSource must be NIL to avoid Out Of Index error }
  dbgOperHeader.DataSource := NIL;

  IQRegFormRead(self, [self, GridMaterials, PnlHeaderLeft01, pnlMatQPB,
    GridQtyBreaks]); // iqregfrm

  // ensure navigation bar Vcl.Buttons are 25x25 (after security)
  { TODO -ombaral -cWebIQ : Need to check dependency IQMS.Common.Controls
   IQMS.Common.Controls.ResizeNavBar(NavMain);
   IQMS.Common.Controls.ResizeNavBar(navMaterials);
   IQMS.Common.Controls.ResizeNavBar(navMatQPB);
   }
  EnableButtons(NIL);
end;

procedure TSndBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TFDTable(GridMaterials.DataSource.DataSet).CheckBrowseMode;
  LocalDataChange(nil, nil);
  IQRegFormWrite(self, [self, GridMaterials, PnlHeaderLeft01, pnlMatQPB,
    GridQtyBreaks]); // iqregfrm
  TFDTable(GridMaterials.DataSource.DataSet).MasterSource.OnDataChange :=
    fDataChange;
  TFDTable(GridMaterials.DataSource.DataSet).FieldByName('PTSPER_DISP').OnChange
    := fFieldChange;
  try
    // if DM <> NIL then
    // IQSetTablesActive( FALSE, DM );
  finally
    Action := caFree;
  end;
  // if Owner is TForm then
  // PostMessage( TForm(Owner).Handle, iq_RefreshDataSets , 0, 0 );
end;

procedure TSndBase.FormDestroy(Sender: TObject);
begin
  // DM.Free;     // owner will free DM
end;

procedure TSndBase.TblSndOpBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); { in IQlib }

  if (OpClass = 'BL') and ((TblSndOp.State = dsInsert) or
    (SelectValueFmtAsFloat('select id from opmat where id = %f and rownum < 2',
    [TblSndOp.FieldByName('ID').asFloat]) = 0)) then
    if TblSndOp.FindField('use_let_down_ratio') <> NIL then
      IQRegStringScalarWrite(self, 'use_let_down_ratio',
        TblSndOp.FieldByName('use_let_down_ratio').asString); // iqregfrm

  CheckProcessTurnsInactiveWhileInUse(TblSndOp.FieldByName('id').asFloat,
    TblSndOp.FieldByName('pk_hide').asString);
end;

procedure TSndBase.AfterDeleteEnableButtons(DataSet: TDataSet);
begin
  EnableButtons(NIL);
end;

procedure TSndBase.Exit1Click(Sender: TObject);
begin
  Close;
end;

{ Sync menu options with Navigator }
procedure TSndBase.SrcSndOpStateChange(Sender: TObject);
begin
  // New1.Visible   := navMain.Controls[ Ord(nbInsert) ].Enabled and navMain.Controls[ Ord(nbInsert) ].Visible ;
  // Edit1.Visible  := navMain.Controls[ Ord(nbEdit) ].Enabled   and navMain.Controls[ Ord(nbEdit) ].Visible   ;
  // Delete1.Visible:= navMain.Controls[ Ord(nbDelete) ].Enabled and navMain.Controls[ Ord(nbDelete) ].Visible ;
  // Save1.Visible  := navMain.Controls[ Ord(nbPost) ].Enabled   and navMain.Controls[ Ord(nbPost) ].Visible   ;
  // Cancel1.Visible:= navMain.Controls[ Ord(nbCancel) ].Enabled and navMain.Controls[ Ord(nbCancel) ].Visible ;
end;

procedure TSndBase.EnableButtons(DataSet: TDataSet);
var
  Value: Boolean;
begin
  Value := not(TblSndOp.Eof and TblSndOp.Bof);
  sbtnOpCost.Enabled := Value;
  sbtnEquip.Enabled := Value;
  sbtnQtyPrice.Enabled := Value;
  sbtnSearch.Enabled := Value;
  sbtnTableForm.Enabled := Value;
end;

{ Menu Click }
procedure TSndBase.Edit1Click(Sender: TObject);
var
  cName: String;
begin
  cName := UpperCase((Sender as TUniMenuItem).Name);
  {
    if cName = 'NEW1'         then  navMain.BtnClick(nbInsert)
    else if cName = 'EDIT1'   then  navMain.BtnClick(nbEdit)
    else if cName = 'DELETE1' then  navMain.BtnClick(nbDelete)
    else if cName = 'SAVE1'   then  navMain.BtnClick(nbPost)
    else if cName = 'CANCEL1' then  navMain.BtnClick(nbCancel);
  }
end;

procedure TSndBase.sbtnTableFormClick(Sender: TObject);
begin
  if PageControlHeader.ActivePage = TabSheetForm then
  begin
    dbgOperHeader.DataSource := NavMain.DataSource;
    PageControlHeader.ActivePage := TabSheetTable;
  end
  else
  begin
    dbgOperHeader.DataSource := NIL;
    PageControlHeader.ActivePage := TabSheetForm;
  end;
end;

procedure TSndBase.QtyPriceBreaks1Click(Sender: TObject);
var
  o: TSndQPB;
begin
  o := TSndQPB.Create(self);
  o.DataSource1.DataSet := TblSndOp_Qty_Breaks;
  o.ShowModal;
end;

procedure TSndBase.Equipment1Click(Sender: TObject);
begin
  // ShowMessage('Option Not Ready');
end;

procedure TSndBase.OperationCost1Click(Sender: TObject);
var
  o: TSndCost;
begin
  TblSndOp.CheckBrowseMode;
  o := TSndCost.Create(self);
  o.SndID := TblSndOp.FieldByName('ID').asFloat;
  o.Qty := 1;
  o.ShowModal;
end;

procedure TSndBase.AddFilterEplantExpr(ASQL: TStrings; AOpClass: string);
begin
  if AOpClass = 'BL' then
    ASQL.Add(' and decode(s.arinvt_id, null, 1, MISC.Eplant_Filter(a.eplant_id)) = 1');
  if AOpClass = 'FB' then
    ASQL.Add(' and MISC.Eplant_Filter( s.eplant_id ) = 1');
  if AOpClass = 'AS' then
    ASQL.Add(' and MISC.Eplant_Filter( s.eplant_id ) = 1');
end;

procedure TSndBase.sbtnSearchClick(Sender: TObject);
var
  SaveSQL: TStringList;
begin
  with DM, PkSndOp do
    try
      SaveSQL := TStringList.Create;
      SaveSQL.Assign(SQL);
      SQL.Add(Format(' and s.op_class = %s', [#39 + OpClass + #39]));

      if Assigned(FindField('EPLANT_ID')) then
        FieldByName('EPLANT_ID').visible := OpClass = 'BL';

      AddFilterEplantExpr(SQL, OpClass);
      { overwritten in Qsnd_Bas. This is ARINVT eplant_id }

      if Assigned(FindField('PROCESS_EPLANT_ID')) then
        FieldByName('PROCESS_EPLANT_ID').visible := OpClass = 'FB';

      if Execute then
        LocateSndOp(GetValue('ID'))
      else
        ABORT;
    finally
      Close;
      SQL.Assign(SaveSQL);
      SaveSQL.Free;
    end
end;

procedure TSndBase.LocateSndOp(nID: Real);
// SndOp is indexed by Op_Class + OPNO. Here we locate by ID
var
  SaveIndexFieldNames: string;
  Bk: TBookMark;
begin
  if nID > 0 then
    TblSndOp.Locate('ID', nID, []);
end;

procedure TSndBase.SearchAll1Click(Sender: TObject);
begin
  with DM do
    if PkSndOp_All.Execute then
      DoShowSndOper(PkSndOp_All.GetValue('OP_CLASS'),
        PkSndOp_All.GetValue('ID'));
end;

procedure TSndBase.TblSndOpAfterInsert(DataSet: TDataSet);
var
  AValue: string;
begin
  TblSndOp.FieldByName('OP_CLASS').Value := OpClass;
  TblSndOp.FieldByName('ATPRESS').asString := 'N';

  { Assign ID and OPNO so they have default opno and desc }
  IQAssignIDBeforePost(TblSndOp);
  TblSndOp.FieldByName('OPNO').asString := TblSndOp.FieldByName('ID').asString;
  if OpClass = 'IN' then
    TblSndOp.FieldByName('OPDESC').asString := sndop_rscstr.cTXT0000007
    // 'Attached Inv Items'
  else if OpClass = 'PK' then
    TblSndOp.FieldByName('OPDESC').asString := sndop_rscstr.cTXT0000008
    // 'Attached Pkg Items'
  else if OpClass = 'BL' then
    TblSndOp.FieldByName('OPDESC').asString := sndop_rscstr.cTXT0000009
    // 'Blend Operation'
  else if OpClass = 'OP' then
    TblSndOp.FieldByName('OPDESC').asString := ''
  else if OpClass = 'PR' then
    TblSndOp.FieldByName('OPDESC').asString := sndop_rscstr.cTXT0000010
    // 'Attached process'
  else if OpClass = 'FB' then
    TblSndOp.FieldByName('OPDESC').asString := ''
  else if OpClass = 'AS' then
    TblSndOp.FieldByName('OPDESC').asString := ''
  else
    TblSndOp.FieldByName('OPDESC').asString := sndop_rscstr.cTXT0000011;
  // 'Attached Items'

  if SecurityManager.EPlant_ID_AsFloat > 0 then
    TblSndOp.FieldByName('EPLANT_ID').asFloat :=
      SecurityManager.EPlant_ID_AsFloat;

  if IQRegStringScalarRead(self, 'use_let_down_ratio', AValue) then
    if TblSndOp.FindField('use_let_down_ratio') <> NIL then
      TblSndOp.FieldByName('use_let_down_ratio').asString :=
        IIf(AValue = 'Y', 'Y', 'N');
end;

procedure TSndBase.LaborRates1Click(Sender: TObject);
var
  o: TLabRates;
begin
  inherited; // nothing
    o := TLabRates.Create(self);
    o.DataSource1.DataSet := TblLabor_Rates;
    o.ShowModal;
end;

procedure TSndBase.Standard1Click(Sender: TObject);
var
  cClass: string;
begin
  if Sender = Generic1 then
    cClass := 'OP'
    // else if Sender = OutVendor1          then cClass:= 'OV'
  else if Sender = Blends1 then
    cClass := 'BL'
  else if Sender = AttachedComponents1 then
    cClass := 'IN'
  else if Sender = AttachedPackaging1 then
    cClass := 'PK'
  else
    EXIT;

  DoShowSndOper(cClass, 0); // 0 passed - will start form the Top
end;

procedure TSndBase.GridMaterialsEditButtonClick(Sender: TObject);
var
  cClass, cSql: string;
begin
  { cSql := 'select itemno, class, descrip, rev, id from arinvt';
    cClass := '';
    if dbeClass.DataSource.DataSet.FieldByName(dbeClass.DataField).asString = 'BL' then cClass := 'PL' ;
    if dbeClass.DataSource.DataSet.FieldByName(dbeClass.DataField).asString = 'PK' then cClass := 'PK' ;

    if not Empty(cClass) then cSql := cSql + Format(' where class = ''%s''', [cClass]);
    pkArinvt.Sql.Clear;
    pkArinvt.Sql.Add(cSql); }

    (* TODO -ombaral -cWebIQ : Need to check behavior
    if GridMaterials.SelectedField.FieldName = 'ItemNo' then
    begin
    {BoM?}
    if TblOpMat.FindField('ARINVT_ID') <> NIL then
    begin
    // 11-24-2014 EIQ-5094: Additional pick list surfacing when adding material
    if (TblOpMat.Eof and TblOpMat.Bof) and (TblOpMat.State = dsBrowse) then
    TblOpMat.Insert  // will generate call to a picklist - see OnNewRecord
    else
    IQPickAndReplace( TblOpMat.FieldByName('ARINVT_ID'), PkArinvt, 'ID' )
    end
    else
    {Quote}
    if TblOpMat.FindField('QINVT_ID') <> NIL then
    IQPickAndReplace( TblOpMat.FieldByName('QINVT_ID'), PkArinvt, 'ID' );
    end;
    *)
end;

procedure TSndBase.sbtnCenterTypeClick(Sender: TObject);
var
  SaveState: TDataSetState;
begin
  if IQPickAndReplace(TblSndOp.FieldByName('CNTR_TYPE'), PkCntrType, 'CNTR_TYPE')
  then
  begin

    // if MessageDlg(sndop_rscstr.cTXT0000005 {'Copy Center Rate and Setup Hours to the Operation information page?'}, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    with TblSndOp do
      try
        SaveState := State;

        if SaveState = dsBrowse then
        begin
          if Eof and Bof then
          begin
            Insert;
            SaveState := dsInsert;
          end
          else
            Edit;
        end // was in browse
        else if not(SaveState in [dsInsert, dsEdit]) then
          raise Exception.Create
            (sndop_rscstr.
            cTXT0000006 { 'The operation table is unvailable.' } );

        FieldByName('CNTR_RATE').Value := PkCntrType.GetValue('CNTR_RATE');
        FieldByName('SETUPHRS').Value := PkCntrType.GetValue('SET_UP');

      finally
        if SaveState = dsBrowse then
          TblSndOp.CheckBrowseMode; // iqCommitTable( TblSndOp );
      end; // Assign Customer

    Screen.Cursor := crDefault;
  end; // Picked something
end;

procedure TSndBase.sbtnGetVendorClick(Sender: TObject);
begin
  IQPickAndReplace(TblSndOp.FieldByName('VENDOR_ID'), PkVendor, 'ID');
end;

procedure TSndBase.bbtnEditBlendInvClick(Sender: TObject);
var
  o: TInvBlendEdit;
  Arinvt_IDfield: string;
begin
  inherited; // nothing

  if TblSndOp.State in [dsInsert, dsEdit] then
    TblSndOp.Post;

  if TblSndOp.Eof and TblSndOp.Bof then
    EXIT;

    o := TInvBlendEdit.Create(self);
    o.SrcArinvt.DataSet := TblArinvt;

    if TblSndOp.FindField('ARINVT_ID') <> NIL then
      Arinvt_IDfield := 'ARINVT_ID'
    else
      Arinvt_IDfield := 'QINVT_ID';

    if TblSndOp.FieldByName(Arinvt_IDfield).Value > 0 then
      o.ArinvtID := TblSndOp.FieldByName(Arinvt_IDfield).Value;

    if o.ShowModal = mrOK then
      with TblSndOp do
      begin
        if State = dsBrowse then
          Edit;
        FieldByName(Arinvt_IDfield).Value := o.ArinvtID;
        Post;
      end
end;

procedure TSndBase.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TSndBase.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TSndBase.PrintSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute
end;

procedure TSndBase.LocalDataChange(Sender: TObject; Field: TField);
var
  cOpMatName: string;
  cSndOpName: string;
  cSndOpIDFKName: string;
  SndOpQuery: TFDQuery;
  Qry: TFDQuery;
  AOpNo: string;
begin
  if fFormStarted and (OpClass = 'BL') then
    try
      { for Blends Only! }
      SndOpQuery := TFDTable(GridMaterials.DataSource.DataSet)
        .MasterSource.DataSet as TFDQuery;
      TFDTable(GridMaterials.DataSource.DataSet)
        .MasterSource.OnDataChange := nil;

      AssignNames(cOpMatName, cSndOpName, cSndOpIDFKName);
      Qry := TFDQuery.Create(self);
      with Qry do
        try
          Connection := UniMainModule.FDConnection1;
          SQL.Add('select Sum(NVL(ptsper_disp,0)) as total,');
          SQL.Add(Format('%s.id', [cSndOpName]));
          SQL.Add(Format('from %s, %s', [cOpMatName, cSndOpName]));
          SQL.Add(Format('where %s.%s(+) = %s.id', [cOpMatName, cSndOpIDFKName,
            cSndOpName]));
          SQL.Add('and op_class = ''BL'' ');
          SQL.Add(Format('group by %s.id', [cSndOpName]));
          SQL.Add('having Abs(Sum(NVL(ptsper_disp,0)) - 100) > 0.000001');
          Open;

          if not Eof then
          begin
            AOpNo := SelectValueFmtAsString('select opno from %s where id = %f',
              [cSndOpName, FieldByName('ID').asFloat]);
            try
              SndOpQuery.Locate('ID', FieldByName('ID').asFloat, []);
            except
              on E: Exception do
                { Sometimes Locate gave us in the begining of the table... }

                { 'Please check Blend Operation, %s.'#13#13+
                  'The total percentage of the materials must be 100.' }
                raise Exception.CreateFmt(sndop_rscstr.cTXT0000012, [AOpNo]);
            end;
            // raise Exception.Create(sndop_rscstr.cTXT0000013 {'The total percentage of the materials must be 100.'});
            raise Exception.CreateFmt(sndop_rscstr.cTXT0000057, [AOpNo]);
            { 'The total percentage of the materials must be 100. Check process/operation# %s' }
          end;

          fFormStarted := False;
        finally
          Free;
        end;
    finally
      TFDTable(GridMaterials.DataSource.DataSet).MasterSource.OnDataChange :=
        LocalDataChange;
    end;

  // PostMessage( Handle, iq_Notify, 1, 0);    {IQMS.Common.JumpConstants.pas}
end;

procedure TSndBase.AssignNames(var cOpMatName, cSndOpName,
  cSndOpIDName: string);
begin
  cOpMatName := 'OPMAT';
  cSndOpName := 'SNDOP';
  cSndOpIDName := 'SNDOP_ID';
end;

procedure TSndBase.FieldChange(AField: TField);
begin
  fFormStarted := TRUE;
end;

procedure TSndBase.TblOpMatAfterInsert(DataSet: TDataSet);
begin
  fFormStarted := TRUE;
end;

procedure TSndBase.PkArinvtBeforeOpen(DataSet: TDataSet);
var
  cClass: String;
  cSql: String;
begin
  cClass := '';

  // if dbeClass.DataSource.DataSet.FieldByName(dbeClass.DataField).asString = 'BL' then cClass := 'PL' ;
  if dbeClass.DataSource.DataSet.FieldByName(dbeClass.DataField).asString = 'PK'
  then
    cClass := 'PK';

  if Empty(cClass) then
  begin
    // TFDQuery(DataSet).ParamByName('cClass').asString := ' ';
    // TFDQuery(DataSet).ParamByName('nAllClasses').asInteger := 1;
    AssignQueryParamValue(DataSet, 'cClass', ' ');
    AssignQueryParamValue(DataSet, 'nAllClasses', 1);
  end
  else
  begin
    // TFDQuery(DataSet).ParamByName('cClass').asString := cClass;
    // TFDQuery(DataSet).ParamByName('nAllClasses').asInteger := 0;
    AssignQueryParamValue(DataSet, 'cClass', cClass);
    AssignQueryParamValue(DataSet, 'nAllClasses', 0);
  end;

  IQAssignEPlantFilter(DataSet); { pas }
end;

procedure TSndBase.FormShow(Sender: TObject);
begin
  // EnsureSecurityInspectorOnTopOf( self );  {IQSecIns.pas}
end;

(*
  procedure TSndBase.NavMainBeforeAction(Sender: TObject;  Button: TNavigateBtn);
  var
  ADataSet: TDataSet;
  begin
  if (Button = nbDelete) then
  begin
  ADataSet:= (Sender as TUniDBNavigator).DataSource.DataSet; {share sndop with sndop_rbom that introduced TFDQuery instead of ttable}
  if IQWarningYN(Format(sndop_rscstr.cTXT0000014 {'Are you sure you want to delete operation, %s %s?'},
  [ ADataSet.FieldByName('OPNO').asString, ADataSet.FieldByName('OPDESC').asString])) then
  with TblOpMat do
  repeat
  First;
  if not (Eof and Bof) then
  Delete;
  until Eof and Bof
  else
  ABORT;
  end;
  end;

  procedure TSndBase.GridQtyBreaksDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
  begin
  with TUniDBGrid(Sender).DataSource.DataSet, TUniDBGrid(Sender).Canvas do
  if Assigned(FindField('EFFECT_DATE')) and Assigned(FindField('DEACTIVE_DATE')) then
  begin
  if ((Date >= FieldByName('EFFECT_DATE').asDateTime) and
  (Date <= FieldByName('DEACTIVE_DATE').asDateTime)) or (FieldByName('DEACTIVE_DATE').asString = '') then
  begin
  Brush.Color := clWhite;
  Font.Color := clBlack;
  end
  else
  begin
  Brush.Color:= clBtnFace;
  Font.Color := clBlack;
  end;
  end;

  if gdSelected in State then
  begin
  TUniDBGrid(Sender).Canvas.Brush.Color:= clBlue;
  TUniDBGrid(Sender).Canvas.Font.Color := clWhite;
  end;

  TUniDBGrid(Sender).DefaultDrawColumnCell( Rect, DataCol, Column, State );
  end;
*)
procedure TSndBase.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmMFG { CHM } , iqhtmBOM { HTM } );
  { IQMS.Common.HelpHook.pas }
end;

procedure TSndBase.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext(self.HelpContext);
end;

procedure TSndBase.JumptoInventory1Click(Sender: TObject);
begin
  IQJumpInv.Execute;
end;

procedure TSndBase.bbtnRouteNoteClick(Sender: TObject);
var
  S: string;
begin
  S := TblSndOp.FieldByName('note1').asString;
    if DoEditMemoStr(S, 2000, 'Routing Notes' ) then                       {EditMemoStr.pas}
    begin
    TblSndOp.Edit;
    TblSndOp.FieldByName('note1').asString:= S;
    end;

end;

procedure TSndBase.CheckProcessTurnsInactiveWhileInUse(ASndOp_ID: Real;
  ANewPK_Hide: string);
var
  A: Variant;
  AList: TStringList;
  S: string;
begin
  // not being toggled to inactive - nothing to check - leave
  if ANewPK_Hide <> 'Y' then
    EXIT;

  A := SelectValueArrayFmt('select pk_hide from sndop where id = %f',
    [ASndOp_ID]);

  // doesnt exist yet - leave
  if VarArrayDimCount(A) = 0 then
    EXIT;

  // already toggled to inactive - leave
  if A[0] = 'Y' then
    EXIT;

  AList := TStringList.Create;
  try
    LoadColumnValueIntoStringList(AList,
      Format('select s.mfgno from ptoper, partno p, standard s ' +
      ' where ptoper.sndop_id = %0.f                    ' +
      '   and ptoper.partno_id = p.id                   ' +
      '   and p.standard_id = s.id                      ' +
      '   and nvl(s.pk_hide, ''N'') <> ''Y''            ', [ASndOp_ID]));
    if AList.Count = 0 then
      EXIT;

    S := Format
      ('Unable to toggle process # %s to inactive due to the following BOM(s) currently using it:'#13,
      [SelectValueByID('opno', 'sndop', ASndOp_ID)]);
    S := S + AList.Text;

    // TFrmShowStr.DoShowModal( self, 'Error', S, mtError );  {IQMsgFrm.pas}

    ABORT;
  finally
    AList.Free;
  end;
end;

procedure TSndBase.WhereUsed1Click(Sender: TObject);
begin
  // TFrmSndWhereUsed.DoShowModal( self, TblSndOp.FieldByName('id').asFloat);   // snd_where_used.pas
end;

procedure TSndBase.LocalSndopAfterPost(DataSet: TDataSet);
begin
  EnableButtons(DataSet);
  if Assigned(FExistingSndopAfterPost) then
    FExistingSndopAfterPost(DataSet);
end;

procedure TSndBase.IQNotify(var Msg: TMessage);
begin
  HandleOnNotify(Msg);
end;

procedure TSndBase.HandleOnNotify(Msg: TMessage);
begin
  case Msg.WParam of
    constPICK_REPLACE_ARINVT:
      begin
        if TblOpMat.FindField('ARINVT_ID') <> NIL then
          IQPickAndReplace(TblOpMat.FieldByName('ARINVT_ID'), PkArinvt, 'ID')
      end;
  end;
end;

end.
