unit LotTrack;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  IQMS.WebVcl.Search,
  Vcl.Menus,
  IQMS.common.RepDef,  // IQRepDef,
  IQMS.WebVcl.About,
  Vcl.Buttons,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.DocumentsExternal,
  Mask,
  IQMS.WebVcl.UserDefinedLabel,
  wwdbdatetimepicker,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
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
  uniSplitter,
  uniEdit,
  uniDBEdit,
  uniLabel,
  uniPageControl,
  uniPanel,
  uniScrollBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniButton,
  uniBitBtn,
  uniSpeedButton, IQMS.WebVcl.RepDef, uniDateTimePicker, uniDBDateTimePicker,
  IQUniGrid, uniGUIFrame;

const cQryDtlOneLot = 'select /*+ INDEX( translog ix_translog_trunc_fg_lotno ) */   ' +
                    '       arinvt_id,                                            ' +
                    '       class,                                                ' +
                    '       itemno,                                               ' +
                    '       descrip,                                              ' +
                    '       rev,                                                  ' +
                    '       unit,                                                 ' +
                    '       trans_quan,                                           ' +
                    '       rg_quan,                                              ' +
                    '       lotno                                                 ' +
                    '  from translog                                              ' +
                    ' where fg_lotno = ''ZZZ''                                    ' +
                    '   and rtrim(fg_lotno) is not null                           ' +
                    '   and itemno is not null                                    ' +
                    '   and batch in (select distinct batch                       ' +
                    '                   from translog                             ' +
                    '                  where fg_lotno = ''ZZZ''                   ' +
                    '                    and RTrim(fg_lotno) is not null          ' +
                    '                    and parent_arinvt_id = 9999999           ' +
                    '                    and itemno is not null)                  ';

const cQryDtlAllLots = 'select /*+ INDEX( translog ix_translog_trunc_fg_lotno ) */   ' +
                    '       arinvt_id,                                            ' +
                    '       class,                                                ' +
                    '       itemno,                                               ' +
                    '       descrip,                                              ' +
                    '       rev,                                                  ' +
                    '       unit,                                                 ' +
                    '       trans_quan,                                           ' +
                    '       rg_quan,                                              ' +
                    '       lotno                                                 ' +
                    '  from translog                                              ' +
                    ' where rtrim(fg_lotno) is not null                           ' +
                    '   and itemno is not null                                    ' +
                    '   and batch in (select distinct batch                       ' +
                    '                   from translog                             ' +
                    '                  where RTrim(fg_lotno) is not null          ' +
                    '                    and parent_arinvt_id = 9999999           ' +
                    '                    and itemno is not null)                  ';


const cQryArchivedOneLot = 'select                                               ' +
                           '      arinvt_id,                                     ' +
                           '      class,                                         ' +
                           '      itemno,                                        ' +
                           '      descrip,                                       ' +
                           '      rev,                                           ' +
                           '      unit,                                          ' +
                           '      trans_quan,                                    ' +
                           '      rg_quan,                                       ' +
                           '      lotno                                          ' +
                           ' from hist_translog                                  ' +
                           'where fg_lotno = ''ZZZ''                             ' +
                           '  and rtrim(fg_lotno) is not null                    ' +
                           '  and itemno is not null                             ' +
                           '  and batch in (select distinct batch                ' +
                           '                  from hist_translog                 ' +
                           '                 where fg_lotno = ''ZZZ''            ' +
                           '                   and RTrim(fg_lotno) is not null   ' +
                           '                   and parent_arinvt_id = 9999999    ' +
                           '                   and itemno is not null)           ';


const cQryArchivedAllLots = 'select                                               ' +
                           '      arinvt_id,                                     ' +
                           '      class,                                         ' +
                           '      itemno,                                        ' +
                           '      descrip,                                       ' +
                           '      rev,                                           ' +
                           '      unit,                                          ' +
                           '      trans_quan,                                    ' +
                           '      rg_quan,                                       ' +
                           '      lotno                                          ' +
                           ' from hist_translog                                  ' +
                           'where rtrim(fg_lotno) is not null                    ' +
                           '  and itemno is not null                             ' +
                           '  and batch in (select distinct batch                ' +
                           '                  from hist_translog                 ' +
                           '                 where RTrim(fg_lotno) is not null   ' +
                           '                   and parent_arinvt_id = 9999999    ' +
                           '                   and itemno is not null)           ';




type
  TFrmLotTracking = class(TUniForm)
    Splitter1: TUniSplitter;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Filter1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel3: TUniPanel;
    sbFilter: TUniSpeedButton;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    IQAbout1: TIQWebAbout;
    IQRepDef1: TIQWebRepDef;
    SrcTransLog: TDataSource;
    QryTransLog: TFDQuery;
    QryTransLogSUM_TRANS_QUAN: TFMTBCDField;
    QryTransLogITEMNO: TStringField;
    QryTransLogCLASS: TStringField;
    QryTransLogREV: TStringField;
    QryTransLogDESCRIPTION: TStringField;
    QryTransLogUNIT: TStringField;
    QryTransLogLOTNO: TStringField;
    SrcDetail: TDataSource;
    QryDtl: TFDQuery;
    QryDtlCLASS: TStringField;
    QryDtlITEMNO: TStringField;
    QryDtlDESCRIP: TStringField;
    QryDtlREV: TStringField;
    QryDtlUNIT: TStringField;
    QryDtlTRANS_QUAN: TFMTBCDField;
    QryDtlRG_QUAN: TFMTBCDField;
    PopupMenu1: TUniPopupMenu;
    ShowDetails1: TUniMenuItem;
    QryDtlLOTNO: TStringField;
    PopupMenu2: TUniPopupMenu;
    DrillDown1: TUniMenuItem;
    QryDtlARINVT_ID: TBCDField;
    DrillDown2: TUniMenuItem;
    QryTransLogARINVT_ID: TBCDField;
    LotTree1: TUniMenuItem;
    RevLotTree1: TUniMenuItem;
    LotTree2: TUniMenuItem;
    RevLotTree2: TUniMenuItem;
    N1: TUniMenuItem;
    JumptoInventory1: TUniMenuItem;
    N2: TUniMenuItem;
    JumptoInventory2: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    Contents1: TUniMenuItem;
    pgctrlHeader: TUniPageControl;
    TabHeader: TUniTabSheet;
    TabLotDocsHeader: TUniTabSheet;
    pgctrlDependent: TUniPageControl;
    TabDependednt: TUniTabSheet;
    TabLotDocsDependent: TUniTabSheet;
    SrcArinvtLotDocsHeader: TDataSource;
    QryArinvtLotDocsHeader: TFDQuery;
    QryArinvtLotDocsHeaderID: TBCDField;
    QryArinvtLotDocsHeaderCOUNTRY: TStringField;
    SrcArinvtLotDocsDetail: TDataSource;
    QryArinvtLotDocsDetail: TFDQuery;
    QryArinvtLotDocsDetailID: TBCDField;
    QryArinvtLotDocsDetailCOUNTRY: TStringField;
    ScrollBox1: TUniScrollBox;
    IQExtDocLotDocsHeader: TIQWebExtDoc;
    CountryOfOrigin1: TUniMenuItem;
    CountryOfOrigin2: TUniMenuItem;
    tabLotControl: TUniTabSheet;
    QryArinvtLotDocsHeaderCUSER1: TStringField;
    QryArinvtLotDocsHeaderCUSER2: TStringField;
    QryArinvtLotDocsHeaderCUSER3: TStringField;
    QryArinvtLotDocsHeaderCUSER4: TStringField;
    QryArinvtLotDocsHeaderCUSER5: TStringField;
    ScrollBox3: TUniScrollBox;
    Panel2: TUniPanel;
    Splitter2: TUniSplitter;
    Panel4: TUniPanel;
    IQUserDefLabelLotControl1: TIQWebUserDefLabel;
    IQUserDefLabelLotControl2: TIQWebUserDefLabel;
    IQUserDefLabelLotControl3: TIQWebUserDefLabel;
    IQUserDefLabelLotControl4: TIQWebUserDefLabel;
    IQUserDefLabelLotControl5: TIQWebUserDefLabel;
    Panel5: TUniPanel;
    DBEdit1: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    DBEdit3: TUniDBEdit;
    DBEdit4: TUniDBEdit;
    DBEdit5: TUniDBEdit;
    QryArinvtLotDocsHeaderNUSER1: TFMTBCDField;
    QryArinvtLotDocsHeaderNUSER2: TFMTBCDField;
    QryArinvtLotDocsHeaderNUSER3: TFMTBCDField;
    QryArinvtLotDocsHeaderNUSER4: TFMTBCDField;
    QryArinvtLotDocsHeaderNUSER5: TFMTBCDField;
    IQUserDefLabelLotControlN1: TIQWebUserDefLabel;
    IQUserDefLabelLotControlN2: TIQWebUserDefLabel;
    IQUserDefLabelLotControlN3: TIQWebUserDefLabel;
    IQUserDefLabelLotControlN4: TIQWebUserDefLabel;
    IQUserDefLabelLotControlN5: TIQWebUserDefLabel;
    DBEdit6: TUniDBEdit;
    DBEdit7: TUniDBEdit;
    DBEdit8: TUniDBEdit;
    DBEdit9: TUniDBEdit;
    DBEdit10: TUniDBEdit;
    pnlDetails: TUniPanel;
    Panel6: TUniPanel;
    IQSearch2: TIQUniGridControl;
    spliDetailsArchived: TUniSplitter;
    pnlDetailsArchived: TUniPanel;
    IQSearch3: TIQUniGridControl;
    SrcDetailsArchived: TDataSource;
    QryDetailsArchived: TFDQuery;
    QryDetailsArchivedCLASS: TStringField;
    QryDetailsArchivedITEMNO: TStringField;
    QryDetailsArchivedDESCRIP: TStringField;
    QryDetailsArchivedREV: TStringField;
    QryDetailsArchivedUNIT: TStringField;
    QryDetailsArchivedRG_QUAN: TFMTBCDField;
    QryDetailsArchivedTRANS_QUAN: TFMTBCDField;
    QryDetailsArchivedLOTNO: TStringField;
    QryDetailsArchivedARINVT_ID: TBCDField;
    PopupMenu3: TUniPopupMenu;
    JumpToInventory3: TUniMenuItem;
    bvlDetailsCurrentLeft: TUniPanel;
    bvlDetailsArchivedLeft: TUniPanel;
    pnlTransHeader: TUniPanel;
    IQSearch1: TIQUniGridControl;
    TransactionDetail1: TUniMenuItem;
    pnlLotDocs: TUniPanel;
    pnlLotDocsTop: TUniPanel;
    IQExtDocLotDocsDependent: TIQWebExtDoc;
    bvlLotDocsCurrentLeft: TUniPanel;
    Splitter3: TUniSplitter;
    pnlLotDocsArchived: TUniPanel;
    bvlLotDocsArchivedLeft: TUniPanel;
    IQExtDocLotDocsDependentArchived: TIQWebExtDoc;
    SrcArinvtLotDocsDetailArchived: TDataSource;
    QryArinvtLotDocsDetailArchived: TFDQuery;
    QryArinvtLotDocsDetailArchivedID: TBCDField;
    QryArinvtLotDocsDetailArchivedCOUNTRY: TStringField;
    N3: TUniMenuItem;
    CountryOfOrigin3: TUniMenuItem;
    IQUserDefLabelLotControlD1: TIQWebUserDefLabel;
    IQUserDefLabelLotControlD2: TIQWebUserDefLabel;
    IQUserDefLabelLotControlD3: TIQWebUserDefLabel;
    IQUserDefLabelLotControlD4: TIQWebUserDefLabel;
    IQUserDefLabelLotControlD5: TIQWebUserDefLabel;
    wwDBDateTimePicker1: TUniDBDateTimePicker;
    wwDBDateTimePicker2: TUniDBDateTimePicker;
    wwDBDateTimePicker3: TUniDBDateTimePicker;
    wwDBDateTimePicker4: TUniDBDateTimePicker;
    wwDBDateTimePicker5: TUniDBDateTimePicker;
    QryArinvtLotDocsHeaderDUSER1: TDateTimeField;
    QryArinvtLotDocsHeaderDUSER2: TDateTimeField;
    QryArinvtLotDocsHeaderDUSER3: TDateTimeField;
    QryArinvtLotDocsHeaderDUSER4: TDateTimeField;
    QryArinvtLotDocsHeaderDUSER5: TDateTimeField;
    pnlDetailsCurrentTop: TUniPanel;
    lblCaption: TUniLabel;
    pnlDetailsArchivedTop: TUniPanel;
    Label1: TUniLabel;
    pnlLotDocsCurrentTop: TUniPanel;
    Label2: TUniLabel;
    pnlLotDocsArchivedTop: TUniPanel;
    Label3: TUniLabel;
    procedure Exit1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbFilterClick(Sender: TObject);
    procedure ShowDetails1Click(Sender: TObject);
    procedure QryTransLogAfterScroll(DataSet: TDataSet);
    procedure DrillDown1Click(Sender: TObject);
    procedure DrillDown2Click(Sender: TObject);
    procedure LotTree1Click(Sender: TObject);
    procedure RevLotTree1Click(Sender: TObject);
    procedure LotTree2Click(Sender: TObject);
    procedure RevLotTree2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure JumptoInventory1Click(Sender: TObject);
    procedure JumptoInventory2Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure CountryOfOrigin1Click(Sender: TObject);
    procedure CountryOfOrigin2Click(Sender: TObject);
    procedure IQExtDocLotDocsHeaderBeforeInsert(DataSet: TDataSet);
    procedure IQExtDocLotDocsDependentBeforeInsert(DataSet: TDataSet);
    procedure IQUserDefLabelLotControl1GetOwnerName(Sender: TObject;
      var AOwnerName: String);
    procedure pgctrlHeaderChange(Sender: TObject);
    procedure JumpToInventory3Click(Sender: TObject);
    procedure TransactionDetail1Click(Sender: TObject);
    procedure IQExtDocLotDocsDependentArchivedBeforeInsert(
      DataSet: TDataSet);
    procedure CountryOfOrigin3Click(Sender: TObject);
  private
    { Private declarations }
    FIncludeArchived: Boolean;
    FSql:String;
    FSqlArchived:String;
    FFilterEplant: Boolean;
    procedure PopulateCompositTables;
    procedure ShowCountryOfOrigin(ACountry: string);
    procedure EnsureArinvtLotDocsExists(AArinvtLotDocsDataSet: TDataSet;
      AArinvt_ID: Real; ALotNo: string);
    procedure CheckAdjustScreenToIncludeArchived;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);
    constructor Create2(AOwner:TComponent; AStr:TStrings; AIncludeArchived, AFilterEplant: Boolean; aAllLots: Boolean  );
    constructor CreateML(AOwner:TComponent; ALotNo:String; AArinvtId:Real);
    constructor CreateDirect(AOwner:TComponent; ALotNo:String; AArinvtId:Real; AIncludeArchived: Boolean = FALSE; AFilterEplant: Boolean = FALSE);
  end;

procedure DoLotTrackingDirect(AOwner:TComponent; ALotNo:String; AArinvtId:Real; AIncludeArchived: Boolean = FALSE; AFilterEplant: Boolean = FALSE);
procedure DoLotTrackingMasterLabel(AOwner:TComponent; ALotNo:String; AArinvtId:Real);
procedure DoLotTracking(AOwner:TComponent);
procedure DoLotTracking2(AOwner:TComponent; AStr:TStrings; AIncludeArchived: Boolean = FALSE; AFilterEplant: Boolean = FALSE; aAllLots: Boolean = FALSE );

var
  FrmLotTracking: TFrmLotTracking;

implementation

uses
  InvtShel,
  IQMS.WebVcl.DocumentsCoordinator,
  IQMS.Common.Cursor,  //  IQCursor,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Mesg,  //  IqMesg,
  IQMS.Common.Miscellaneous,  //  IQMisc,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.Regfrm,
  IQMS.Common.Secman, //IqSecman,
  IQMS.Common.StringUtils,
  LotDrlDn,
  LotFilt,
  LotTree,
  RevTree,
  trans_rscstr;

{$R *.DFM}

procedure DoLotTracking(AOwner:TComponent);
var
  AStr:TStrings;
  AIncludeArchived, AFilterEplant: Boolean;
begin
  DoGetTrackingFilterBlank(AStr, AIncludeArchived, AFilterEplant);
//  with TFrmLotTracking.Create(AOwner) do Show;
end;

procedure DoLotTracking2(AOwner:TComponent; AStr:TStrings; AIncludeArchived: Boolean = FALSE; AFilterEplant: Boolean = FALSE; aAllLots: Boolean = FALSE  );
begin
  with TFrmLotTracking.Create2(AOwner, AStr, AIncludeArchived, AFilterEplant, aAllLots) do Show;
end;


procedure DoLotTrackingMasterLabel(AOwner:TComponent; ALotNo:String; AArinvtId:Real);
begin
  with TFrmLotTracking.CreateML(AOwner, ALotNo, AArinvtId) do Show;
end;

constructor TFrmLotTracking.CreateML(AOwner:TComponent; ALotNo:String; AArinvtId:Real);
begin
  inherited Create(AOwner);
  FSql := QryDtl.SQL.Text;
  FSqlArchived := QryDetailsArchived.SQL.Text;
  SrcDetailsArchived.DataSet := QryDetailsArchived;
  SrcDetail.DataSet := QryDtl;
  IQRegFormRead( self, [self, pnlTransHeader ]);
  if not DoGetTrackingFilterML(AOwner, QryTransLog.Sql, ALotno, AArinvtId, FIncludeArchived, FFilterEplant) then
    PostMessage( Handle, wm_Command, Exit1.Command, 0 )   { Call "Exit" }
   else
    QryTransLog.Open;
end;

procedure DoLotTrackingDirect(AOwner:TComponent; ALotNo:String; AArinvtId:Real; AIncludeArchived: Boolean = FALSE; AFilterEplant: Boolean = FALSE);
begin
  with TFrmLotTracking.CreateDirect(AOwner, ALotNo, AArinvtId, AIncludeArchived, AFilterEplant) do Show;
end;

constructor TFrmLotTracking.CreateDirect(AOwner:TComponent; ALotNo:String; AArinvtId:Real; AIncludeArchived: Boolean = FALSE; AFilterEplant: Boolean = FALSE);
var
  ATranslogTableName: string;
begin
  FIncludeArchived:= AIncludeArchived;
  FFilterEplant := AFilterEplant;
  inherited Create(AOwner);
  FSql := QryDtl.SQL.Text;
  FSqlArchived := QryDetailsArchived.SQL.Text;
  SrcDetailsArchived.DataSet := QryDetailsArchived;
  SrcDetail.DataSet := QryDtl;
  IQRegFormRead( self, [self, pnlTransHeader]);

  ATranslogTableName:= IIf( FIncludeArchived, 'v_translog_tracking', 'translog' );
  QryTransLog.Close;
  with QryTransLog.Sql do
  begin
    Clear;
    Add(         'select sum(trans_quan) as sum_trans_quan, unit, lotno,');
    Add(         '       itemno,');
    Add(         '       class,');
    Add(         '       descrip as description,');
    Add(         '       rev, ');
    Add(         '       arinvt_id');
    Add(IQFormat('  from %s', [ ATranslogTableName ]));   // v_translog_tracking or translog
    Add(         ' where TRANS_IN_OUT = ''IN''');
    Add(         '   and lotno is not null');
    Add(         '   and trans_type in (''DISPOSITION'', ''PO'', ''PHYSICAL INVENTORY'', ''MANUAL'', ''MANUAL/ASSOCIATED'', ''MANUAL/BACKFLUSH'', ''FINISH PROCESS WIP'')');
    Add(IQFormat('   and arinvt_id = %f', [AArinvtId]));
//    if FFilterEplant then
//      Add(IQFormat('   and (select NVL(eplant_id, -1) from arinvt where id = %f) = misc.geteplantid', [AArinvtId]));
    Add(IQFormat('   and lotno = ''%s''', [StrTran(ALotNo, '''', '''''')]));
    Add(         'group by lotno, unit, itemno, class, rev, arinvt_id, descrip');
  end;

  QryTransLog.Open;
end;

constructor TFrmLotTracking.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  FSql := QryDtl.SQL.Text;
  FSqlArchived := QryDetailsArchived.SQL.Text;
  SrcDetailsArchived.DataSet := QryDetailsArchived;
  SrcDetail.DataSet := QryDtl;
  IQRegFormRead( self, [self, pnlTransHeader]);
  try
    sbFilterClick(NIL) ;      // activate search speed button
  except on E:EAbort do
    begin
      PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
     // System.SysUtils.ABORT;
    end;
  end;
end;

constructor TFrmLotTracking.Create2(AOwner:TComponent; AStr:TStrings; AIncludeArchived, AFilterEplant: Boolean; aAllLots: Boolean);
begin
  FIncludeArchived:= AIncludeArchived;
  FFilterEplant:= AFilterEplant;

  inherited Create(AOwner);
  if aAllLots then
  begin
    QryDtl.SQL.Text := cQryDtlAllLots;
    QryDetailsArchived.SQL.Text := cQryArchivedAllLots;
  end
  else
  begin
    QryDtl.SQL.Text := cQryDtlOneLot;
    QryDetailsArchived.SQL.Text := cQryArchivedOneLot;
  end;

  FSql := QryDtl.SQL.Text;
  FSqlArchived := QryDetailsArchived.SQL.Text;
  SrcDetailsArchived.DataSet := QryDetailsArchived;
  SrcDetail.DataSet := QryDtl;
  IQRegFormRead( self, [self, pnlTransHeader]);
  sbFilter.Visible := false;
  Filter1.Visible := false;

  QryTransLog.Close;
  // QryTransLog.Sql := AStr;
  QryTransLog.Sql.Assign(AStr);
  QryTransLog.Open;
end;

procedure TFrmLotTracking.CheckAdjustScreenToIncludeArchived;
begin
  if not FIncludeArchived then
     begin
       // Dependent Transactions tab
       pnlDetailsArchived.Visible   := FALSE;
       spliDetailsArchived.Visible  := FALSE;
       bvlDetailsCurrentLeft.Visible:= FALSE;
       pnlDetailsCurrentTop.Visible := FALSE;
       Panel6.Align:= alClient;

       // Lot Docs tab
       pnlLotDocsCurrentTop.Visible  := FALSE;
       bvlLotDocsCurrentLeft.Visible := FALSE;
       pnlLotDocsArchivedTop.Visible := FALSE;
       bvlLotDocsArchivedLeft.Visible:= FALSE;
       pnlLotDocsArchived.Visible:= FALSE;
       pnlLotDocsTop.Align:= alClient;
     end
  else
     begin
        Panel6.Height:= TabDependednt.Height div 2;
        pnlLotDocsTop.Height:= TabLotDocsDependent.Height div 2;
     end;
end;

procedure TFrmLotTracking.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmLotTracking.Print1Click(Sender: TObject);
begin
  PopulateCompositTables;
  IQRepDef1.Execute;
end;

procedure TFrmLotTracking.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmLotTracking.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmLotTracking.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, pnlTransHeader]);
  Action := caFree;
end;

procedure TFrmLotTracking.sbFilterClick(Sender: TObject);
var
  AStr:String;
begin
//  QryTransLog.Close;
  if not DoGetTrackingFilter(self, QryTransLog.Sql, FIncludeArchived, FFilterEplant)  {in LotFilt.pas} then
    Abort;
  QryTransLog.Open;
end;

procedure TFrmLotTracking.ShowDetails1Click(Sender: TObject);
var
  AImageIndex:Integer;

  procedure AssignParamsTo( AQuery: TFDQuery );
  begin
    with AQuery do
    begin
      Close;
      Sql.Clear;
      if UpperCase(AQuery.Name) = 'QRYDTL' then
        Sql.Text := FSql
      else
        Sql.Text := FSqlArchived;
      AQuery.Sql.Text := StrTran(AQuery.Sql.Text, 'ZZZ', StrTran(Trim(QryTransLogLOTNO.asString), '''', ''''''));
//      ParamByName('alotno').asString := Trim(QryTransLogLOTNO.asString);
//      ParamByName('alotno2').asString := Trim(QryTransLogLOTNO.asString);
      AQuery.Sql.Text := StrTran(AQuery.Sql.Text, 'parent_arinvt_id = 9999999', 'parent_arinvt_id = ' + IntToStr(Trunc(QryTransLogARINVT_ID.asFloat)));
//      ParamByName('aid').Value := QryTransLogARINVT_ID.asFloat;
      Open;
    end;
  end;

begin
  AssignParamsTo( QryDtl );
  AImageIndex := TabLotDocsDependent.ImageIndex;

  if FIncludeArchived or FFilterEplant then
     AssignParamsTo( QryDetailsArchived );

  if (AImageIndex > -1) and (TabLotDocsDependent.ImageIndex < 0) then
    TabLotDocsDependent.ImageIndex := AImageIndex;
end;

procedure TFrmLotTracking.QryTransLogAfterScroll(DataSet: TDataSet);
begin
  QryDtl.Close;
  QryDetailsArchived.Close;
end;

procedure TFrmLotTracking.DrillDown1Click(Sender: TObject);
begin
  if not (QryDtl.bof and QryDtl.eof) then
    DoLotTrackingDirect(self, QryDtlLOTNO.asString, QryDtlARINVT_ID.asFloat, FIncludeArchived, FFilterEplant);
end;

procedure TFrmLotTracking.DrillDown2Click(Sender: TObject);
begin
  DoLotNumberDrillDown(self, QryTransLogARINVT_ID.asFloat, QryTransLogLOTNO.asString); {in LotDrlDn.pas}
end;

procedure TFrmLotTracking.LotTree1Click(Sender: TObject);
var
  ATransLogId:Real;
begin
  ATransLogId := SelectValueFmtAsFloat('select id from translog where arinvt_id = %f and lotno = ''%s''',
                           [QryTransLogARINVT_ID.asFloat,
                            StrTran(QryTransLogLOTNO.AsString, '''', '''''')]);
  if ATransLogId = 0 then
    raise Exception.Create('No Translog records found');
  DoLotTree(self, ATransLogId); {in LotTree.pas}
end;

procedure TFrmLotTracking.RevLotTree1Click(Sender: TObject);
var
  ATransLogId:Real;
begin
  ATransLogId := SelectValueFmtAsFloat('select id from translog where arinvt_id = %f and lotno = ''%s''',
                           [QryTransLogARINVT_ID.asFloat,
                            StrTran(QryTransLogLOTNO.AsString, '''', '''''')]);
  if ATransLogId = 0 then
    raise Exception.Create('No Translog records found');
  DoRevLotTree(self, ATransLogId); {in RevTree.pas}
end;

procedure TFrmLotTracking.LotTree2Click(Sender: TObject);
var
  ATransLogId:Real;
begin
  ATransLogId := SelectValueFmtAsFloat('select id from translog where arinvt_id = %f and lotno = ''%s''',
                           [QryDtlARINVT_ID.asFloat,
                            StrTran(QryDtlLOTNO.AsString, '''', '''''')]);
  if ATransLogId = 0 then
    raise Exception.Create('No Translog records found');
  DoLotTree(self, ATransLogId); {in LotTree.pas}
end;

procedure TFrmLotTracking.RevLotTree2Click(Sender: TObject);
var
  ATransLogId:Real;
begin
  ATransLogId := SelectValueFmtAsFloat('select id from translog where arinvt_id = %f and lotno = ''%s''',
                           [QryDtlARINVT_ID.asFloat,
                            StrTran(QryDtlLOTNO.AsString, '''', '''''')]);
  if ATransLogId = 0 then
    raise Exception.Create('No Translog records found');
  DoRevLotTree(self, ATransLogId); {in RevTree.pas}
end;

procedure TFrmLotTracking.FormCreate(Sender: TObject);
begin
  IQSearch1.wwDbGrid.Cursor:= crJumpDrill;
  IQSearch2.wwDbGrid.Cursor:= crJumpDrill;

  pgctrlHeader.ActivePageIndex:= 0;
  pgctrlDependent.ActivePageIndex:= 0;

  QryArinvtLotDocsHeader.Open;
  QryArinvtLotDocsDetail.Open;

  if FIncludeArchived or FFilterEplant then
  begin
    QryArinvtLotDocsDetail.Open;
    QryArinvtLotDocsDetailArchived.Open;
  end;

  CheckAdjustScreenToIncludeArchived;

  TAttachedDocumentsCoordinator.Create( self ).RegisterDocuments( TabLotDocsHeader,     [ IQExtDocLotDocsHeader    ]);  // IQAttachedDocumentsCoordinator.pas
  TAttachedDocumentsCoordinator.Create( self ).RegisterDocuments( TabLotDocsDependent,  [ IQExtDocLotDocsDependent, IQExtDocLotDocsDependentArchived ]);  // IQAttachedDocumentsCoordinator.pas
end;

procedure TFrmLotTracking.JumptoInventory1Click(Sender: TObject);
begin
  DoIQJumpToInv( self, QryTransLogARINVT_ID.asFloat); {in InvtShel.pas}
end;

procedure TFrmLotTracking.JumptoInventory2Click(Sender: TObject);
begin
  DoIQJumpToInv( self, QryDtlARINVT_ID.asFloat); {in InvtShel.pas}
end;

procedure TFrmLotTracking.PopulateCompositTables;
var
  AId:Real;
begin
  if not IqConfirmYN(Format('Do you wish to populate the composite tables with the current data?'#13 +
                 'Previous entries in the composite table for the %s user will be deleted.', [SecurityManager.UserName])) then Exit;

  ExecuteCommandFmt('delete from C_LOTTRACKING_HDR where userid = ''%s''', [SecurityManager.UserName]);
  QryTransLog.First;
  while not QryTransLog.eof do
  begin
    AId := GetNextID('C_LOTTRACKING_HDR');
    ExecuteCommandFmt('insert into C_LOTTRACKING_HDR (id,         ' +
                                             'userid,     ' +
                                             'arinvt_id,  ' +
                                             'class,      ' +
                                             'itemno,     ' +
                                             'rev,        ' +
                                             'descrip,    ' +
                                             'unit,       ' +
                                             'trans_quan, ' +
                                             'lotno)      ' +
                                     'values (%f, ''%s'', %f, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', %f, ''%s'')',
                                     [AId,
                                      SecurityManager.UserName,
                                      QryTransLogARINVT_ID.asFloat,
                                      QryTransLogCLASS.asString,
                                      IQString.FixStr(QryTransLogITEMNO.asString),
                                      IQString.FixStr(QryTransLogREV.asString),
                                      IQString.FixStr(QryTransLogDESCRIPTION.asString),
                                      QryTransLogUNIT.asString,
                                      QryTransLogSUM_TRANS_QUAN.asFloat,
                                      IQString.FixStr(QryTransLogLOTNO.asString)]);
    ShowDetails1Click(nil);
    QryDtl.First;
    while not QryDtl.Eof do
    begin
      ExecuteCommandFmt('insert into C_LOTTRACKING_DTL (C_LOTTRACKING_HDR_ID, ' +
                                               'arinvt_id,            ' +
                                               'class,                ' +
                                               'itemno,               ' +
                                               'rev,                  ' +
                                               'descrip,              ' +
                                               'unit,                 ' +
                                               'trans_quan,           ' +
                                               'rg_quan,              ' +
                                               'lotno)                ' +
                                     'values (%f, %f, ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', %f, %f, ''%s'')',
                                     [AId,
                                      QryDtlARINVT_ID.asFloat,
                                      QryDtlCLASS.asString,
                                      IQString.FixStr(QryDtlITEMNO.asString),
                                      IQString.FixStr(QryDtlREV.asString),
                                      IQString.FixStr(QryDtlDESCRIP.asString),
                                      QryDtlUNIT.asString,
                                      QryDtlTRANS_QUAN.asFloat,
                                      QryDtlRG_QUAN.asFloat,
                                      IQString.FixStr(QryDtlLOTNO.asString)]);
      QryDtl.Next;
    end;
    QryTransLog.Next;
  end;
//  IqConfirm('Composit tables populated.');
end;

procedure TFrmLotTracking.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmLotTracking.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQHelpHk.pas}
end;

procedure TFrmLotTracking.PopupMenu1Popup(Sender: TObject);
begin
  CountryOfOrigin1.Enabled:= Trim(QryTransLogLOTNO.asString) > '';
end;

procedure TFrmLotTracking.PopupMenu2Popup(Sender: TObject);
begin
  CountryOfOrigin2.Enabled:= Trim(QryDtlLOTNO.asString) > '';
end;

procedure TFrmLotTracking.CountryOfOrigin1Click(Sender: TObject);
begin
  ShowCountryOfOrigin( QryArinvtLotDocsHeaderCOUNTRY.asString );
end;

procedure TFrmLotTracking.CountryOfOrigin2Click(Sender: TObject);
begin
  ShowCountryOfOrigin( QryArinvtLotDocsDetailCOUNTRY.asString );
end;

procedure TFrmLotTracking.ShowCountryOfOrigin( ACountry: string );
begin
  IQInformation( Format( trans_rscstr.cTXT0000043 {'Country of Origin: %s'}, [ ACountry ]))
end;

procedure TFrmLotTracking.IQExtDocLotDocsHeaderBeforeInsert(DataSet: TDataSet);
begin
  EnsureArinvtLotDocsExists( QryArinvtLotDocsHeader, QryTransLogARINVT_ID.asFloat, QryTransLogLOTNO.asString );
end;

procedure TFrmLotTracking.IQExtDocLotDocsDependentBeforeInsert(DataSet: TDataSet);
begin
  EnsureArinvtLotDocsExists( QryArinvtLotDocsDetail, QryDtlARINVT_ID.asFloat, QryDtlLOTNO.asString );
end;

procedure TFrmLotTracking.EnsureArinvtLotDocsExists( AArinvtLotDocsDataSet: TDataSet; AArinvt_ID: Real; ALotNo: string );
var
  AArinvt_Lot_Docs_ID: Real;
begin
  if not AArinvtLotDocsDataSet.Eof then
     EXIT;

  if (AArinvt_ID = 0) then
     EXIT;

  AArinvt_Lot_Docs_ID:= GetNextID('arinvt_lot_docs');
  ExecuteCommandFmt('insert into arinvt_lot_docs(id, arinvt_id, lotno) values( %f, %f, ''%s'')',
            [AArinvt_Lot_Docs_ID, AArinvt_ID, ALotNo ]);

  Reopen( AArinvtLotDocsDataSet );
  IQAssert( AArinvtLotDocsDataSet.Locate('id', AArinvt_Lot_Docs_ID, []), Format('Unable to locate ID = %.0f in ARINVT_LOT_DOCS', [ AArinvt_Lot_Docs_ID ]));
end;


procedure TFrmLotTracking.IQUserDefLabelLotControl1GetOwnerName(
  Sender: TObject; var AOwnerName: String);
begin
  if QryTransLogCLASS.asString = 'PL' then
     AOwnerName:= 'TransPL'
  else
     AOwnerName:= 'TransCustom'
end;

procedure TFrmLotTracking.pgctrlHeaderChange(Sender: TObject);
begin
  if pgctrlHeader.ActivePage = tabLotControl then
  begin
    IQUserDefLabelLotControl1.AssignFromTable;
    IQUserDefLabelLotControl2.AssignFromTable;
    IQUserDefLabelLotControl3.AssignFromTable;
    IQUserDefLabelLotControl4.AssignFromTable;
    IQUserDefLabelLotControl5.AssignFromTable;
    IQUserDefLabelLotControlN1.AssignFromTable;
    IQUserDefLabelLotControlN2.AssignFromTable;
    IQUserDefLabelLotControlN3.AssignFromTable;
    IQUserDefLabelLotControlN4.AssignFromTable;
    IQUserDefLabelLotControlN5.AssignFromTable;
    IQUserDefLabelLotControlD1.AssignFromTable;
    IQUserDefLabelLotControlD2.AssignFromTable;
    IQUserDefLabelLotControlD3.AssignFromTable;
    IQUserDefLabelLotControlD4.AssignFromTable;
    IQUserDefLabelLotControlD5.AssignFromTable;
  end;
end;

procedure TFrmLotTracking.JumpToInventory3Click(Sender: TObject);
begin
  if QryDetailsArchivedARINVT_ID.asFloat > 0 then
     DoIQJumpToInv( self, QryDetailsArchivedARINVT_ID.asFloat); {in InvtShel.pas}
end;

procedure TFrmLotTracking.TransactionDetail1Click(Sender: TObject);
begin
  if not (QryDetailsArchived.bof and QryDetailsArchived.eof) then
     DoLotTrackingDirect(self, QryDetailsArchivedLOTNO.asString, QryDetailsArchivedARINVT_ID.asFloat, FIncludeArchived, FFilterEplant);
end;

procedure TFrmLotTracking.IQExtDocLotDocsDependentArchivedBeforeInsert(
  DataSet: TDataSet);
begin
  EnsureArinvtLotDocsExists( QryArinvtLotDocsDetailArchived, QryDetailsArchivedARINVT_ID.asFloat, QryDetailsArchivedLOTNO.asString );
end;

procedure TFrmLotTracking.CountryOfOrigin3Click(Sender: TObject);
begin
  ShowCountryOfOrigin( QryArinvtLotDocsDetailArchivedCOUNTRY.asString );
end;

end.
