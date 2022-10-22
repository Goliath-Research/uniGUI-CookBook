unit Mat_Stag;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.DBGrids,
  Vcl.Menus,
  Vcl.Buttons,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.About,
  IQMS.WebVcl.RepDef,
//  IQMS.Common.UserMessages,
  IQMS.Common.JumpConstants,
  IQMS.WebVcl.SoftEPlant,
  IQMS.WebVcl.Jump,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
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
  uniPageControl;

type
  TFrmMatStaging = class(TUniForm)
    SrcMatStaging: TDataSource;
    SrcMatStagingDtl: TDataSource;
    QryMatStaging: TFDQuery;
    QryMatStagingDtl: TFDQuery;
    QryMatStagingARINVT_ID: TBCDField;
    QryMatStagingCLASS: TStringField;
    QryMatStagingITEMNO: TStringField;
    QryMatStagingREV: TStringField;
    QryMatStagingDESCRIP: TStringField;
    QryMatStagingQTY: TFMTBCDField;
    QryMatStagingDtlWORKORDER_ID: TBCDField;
    QryMatStagingDtlPROD_DATE: TDateTimeField;
    QryMatStagingDtlFG_ITEMNO: TStringField;
    QryMatStagingDtlTOT_MAT_QTY: TFMTBCDField;
    QryMatStagingDtlMFGNO: TStringField;
    QryMatStagingDtlPROD_HRS: TFMTBCDField;
    QryMatStagingDtlSETUPHRS: TFMTBCDField;
    QryMatStagingDtlEQNO: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    PageControl1: TUniPageControl;
    shByMaterial: TUniTabSheet;
    shByWorkCenter: TUniTabSheet;
    pnlMatStaging: TUniPanel;
    gridMatStaging: TUniDBGrid;
    Splitter1: TUniSplitter;
    gridMatStagingDtl: TUniDBGrid;
    Panel1: TUniPanel;
    SBFilter: TUniSpeedButton;
    NavMain: TUniDBNavigator;
    QryMatStagingProd_Date1: TDateTimeField;
    QryMatStagingProd_Date2: TDateTimeField;
    sbtnSearch: TUniSpeedButton;
    PkArinvt: TIQWebHPick;
    PkArinvtARINVT_ID: TBCDField;
    PkArinvtCLASS: TStringField;
    PkArinvtITEMNO: TStringField;
    PkArinvtREV: TStringField;
    PkArinvtDESCRIP: TStringField;
    Filter1: TUniMenuItem;
    N1: TUniMenuItem;
    IQRepDef1: TIQWebRepDef;
    IQAbout1: TIQWebAbout;
    PrinterSetupDialog1: TPrinterSetupDialog;
    SrcSchdCntrStageDtl: TDataSource;
    QrySchdCntrStageDtl: TFDQuery;
    QrySchdCntrStageDtlARINVT_ID: TBCDField;
    QrySchdCntrStageDtlQTY: TFMTBCDField;
    QrySchdCntrStageDtlCLASS: TStringField;
    QrySchdCntrStageDtlITEMNO: TStringField;
    QrySchdCntrStageDtlREV: TStringField;
    QrySchdCntrStageDtlDESCRIP: TStringField;
    SrcSchedCenters: TDataSource;
    QrySchdCntr: TFDQuery;
    QrySchdCntrEQNO: TStringField;
    QrySchdCntrProd_Date1: TDateTimeField;
    QrySchdCntrProd_Date2: TDateTimeField;
    QrySchdCntrWORK_CENTER_ID: TBCDField;
    pnlWorkCenters: TUniPanel;
    DBGrid1: TUniDBGrid;
    Splitter2: TUniSplitter;
    QrySchdCntrStageDtlWORK_CENTER_ID: TBCDField;
    Panel2: TUniPanel;
    SrcSchdCntrStageDates: TDataSource;
    QrySchdCntrStageDates: TFDQuery;
    QrySchdCntrStageDtlProd_Date1: TDateTimeField;
    QrySchdCntrStageDtlProd_Date2: TDateTimeField;
    QrySchdCntrStageDatesWORK_CENTER_ID: TBCDField;
    QrySchdCntrStageDatesARINVT_ID: TBCDField;
    QrySchdCntrStageDatesPROD_DATE: TDateTimeField;
    QrySchdCntrStageDatesQTY: TFMTBCDField;
    QrySchdCntrStageDatesWORKORDER_ID: TBCDField;
    pnlWrkCntrStageDtl: TUniPanel;
    gridWrkCntrStageDtl: TUniDBGrid;
    Splitter3: TUniSplitter;
    gridWrkCntrStageDates: TUniDBGrid;
    QrySchdCntrStageDatesMFGNO: TStringField;
    QrySchdCntrStageDatesITEMNO: TStringField;
    Recalculate1: TUniMenuItem;
    Contents1: TUniMenuItem;
    QryMatStagingEPLANT_ID: TBCDField;
    QrySchdCntrEPLANT_ID: TBCDField;
    QryMatStagingEPLANT_DESCRIP: TStringField;
    QrySchdCntrEPLANT_DESCRIP: TStringField;
    sbtnEplantView: TUniSpeedButton;
    SoftEPlant1: TIQWebSoftEPlant;
    PkArinvtEPLANT_ID: TBCDField;
    SetEPlantView1: TUniMenuItem;
    PopupMenu1: TUniPopupMenu;
    JumptoInventory1: TUniMenuItem;
    IQJumpInv: TIQWebJump;
    sbtnUpdateSched: TUniSpeedButton;
    QryMatStagingDtlORIGIN: TStringField;
    popmWorkCenter: TUniPopupMenu;
    ByWorkCenter1: TUniMenuItem;
    ByWorkCenterDescription1: TUniMenuItem;
    QrySchdCntrCNTR_DESC: TStringField;
    sbtnPrintStagingReport: TUniSpeedButton;
    Panel3: TUniPanel;
    Panel5: TUniPanel;
    Label2: TUniLabel;
    Panel15: TUniPanel;
    Bevel4: TUniPanel;
    Bevel1: TUniPanel;
    PkArinvtDESCRIP2: TStringField;
    QryMatStagingDESCRIP2: TStringField;
    QrySchdCntrStageDtlDESCRIP2: TStringField;
    SR: TIQWebSecurityRegister;
    PopupMenu2: TUniPopupMenu;
    JumpToInventory2: TUniMenuItem;
    IQJumpInv2: TIQWebJump;
    JumpToLocationsTransactions2: TUniMenuItem;
    JumpToLocationsTransactions1: TUniMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryMatStagingCalcFields(DataSet: TDataSet);
    procedure sbtnSearchClick(Sender: TObject);
    procedure PkArinvtBeforeOpen(DataSet: TDataSet);
    procedure SBFilterClick(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SetNavigatorSource(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Recalculate1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure sbtnEplantViewClick(Sender: TObject);
    procedure AssignEPlantFilter(DataSet: TDataSet);
    procedure JumptoInventory1Click(Sender: TObject);
    procedure sbtnUpdateSchedClick(Sender: TObject);
    procedure gridMatStagingDtlDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure ByWorkCenter1Click(Sender: TObject);
    procedure ByWorkCenterDescription1Click(Sender: TObject);
    procedure sbtnPrintStagingReportClick(Sender: TObject);
    procedure JumpToInventory2Click(Sender: TObject);
    procedure JumpToLocationsTransactions2Click(Sender: TObject);
    procedure JumpToLocationsTransactions1Click(Sender: TObject);
  private
    { Private declarations }
    FDateStart: TDateTime;
    FDateEnd  : TDateTime;
    FHide_Forecast: Boolean;
    FSortFieldName: string;

    procedure PrepareOpenQuery;
    function GetDateEnd:TDateTime;
    procedure IQRefreshDataSets;
    procedure IQAfterShowMessage;
    function GetMasterQuery:TFDQuery;
    function GetDetailQuery:TFDQuery;
    function GetSubDetailQuery:TFDQuery;
    procedure SetSortFieldName( AValue: string );
    procedure CheckChangeSortField( AQuery: TFDQuery );
  public
    { Public declarations }
    property DateEnd: TDateTime read GetDateEnd write FDateEnd;
    property MasterQuery:TFDQuery read GetMasterQuery;
    property DetailQuery:TFDQuery read GetDetailQuery;
    property SubDetailQuery:TFDQuery read GetSubDetailQuery;
    property SortFieldName: string read FSortFieldName write SetSortFieldName;
  end;

procedure DoMatStaging;

implementation

{$R *.DFM}

uses
  CapShare,
  IQMS.Common.DATESDLG,
//  DatesDlg,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IRV_Main;
  { TODO -oLema : Dependent on WC-7895 Print_Dialogs - Prn_Staging }
//  Prn_Staging,

  { TODO -oLema : Dependent on WC-8505 Sched - Sched_mn }
//  Sched_Mn;

procedure DoMatStaging;
var
  frm: TFrmMatStaging;
begin
  frm := TFrmMatStaging.Create(uniGUIApplication.UniApplication);
  frm.Show;
end;

procedure TFrmMatStaging.FormCreate(Sender: TObject);
var
  S: string;
begin
  FDateStart:= Date;
  FHide_Forecast:= SelectValueAsString('select fr_hide from params') = 'Y';

  IQRegFormRead( self, [self, pnlMatStaging, gridMatStaging, gridMatStagingDtl,
                        pnlWorkCenters, pnlWrkCntrStageDtl, gridWrkCntrStageDtl,
                        gridWrkCntrStageDates ]);

  {Restore Sort-By field }
  IQRegStringScalarRead( self, 'SortFieldName', S, TRUE {Permanent});
  if S = '' then
     S:= 'CNTR_DESC';
  SortFieldName:= S;

  PageControl1.ActivePage:= shByMaterial;

  PrepareOpenQuery;

  IQAfterShowMessage;
end;

procedure TFrmMatStaging.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, pnlMatStaging, gridMatStaging, gridMatStagingDtl,
                         pnlWorkCenters, pnlWrkCntrStageDtl, gridWrkCntrStageDtl,
                         gridWrkCntrStageDates ]);
  IQRegStringScalarWrite( self, 'SortFieldName', FSortFieldName, TRUE {Permanent});
end;

procedure TFrmMatStaging.IQAfterShowMessage;
begin
  CheckMatReqRecalc(self);
end;

procedure TFrmMatStaging.IQRefreshDataSets;
begin
  // 02/14/2008 (Byron) Prevent a screen-repaint problem
//  Application.ProcessMessages;
  PrepareOpenQuery;
end;

function TFrmMatStaging.GetDateEnd:TDateTime;
begin
  Result:= fIIf( FDateStart <= FDateEnd, FDateEnd, FDateStart + 3650 );  {if end is NULL then look 10 years ahead}
end;

function TFrmMatStaging.GetMasterQuery:TFDQuery;
begin
  if PageControl1.ActivePage = shByMaterial then
     Result:= QryMatStaging
  else
     Result:= QrySchdCntr;
end;

function TFrmMatStaging.GetDetailQuery:TFDQuery;
begin
  if PageControl1.ActivePage = shByMaterial then
     Result:= QryMatStagingDtl
  else
     Result:= QrySchdCntrStageDtl;
end;

function TFrmMatStaging.GetSubDetailQuery:TFDQuery;
begin
  if PageControl1.ActivePage = shByWorkCenter then
     Result:= QrySchdCntrStageDates
  else
     Result:= NIL;
end;


procedure TFrmMatStaging.PrepareOpenQuery;
var
  S: string;
begin
  S:= IIf( FHide_Forecast, 'Excluding forecast', 'Including forecast' );

  if FDateEnd < FDateStart then
     Caption:= Format('Material Staging Requirements %s from %s', [ S, DateToStr( FDateStart )])
  else
     Caption:= Format('Material Staging Requirements %s from %s to %s', [ S, DateToStr( FDateStart ), DateToStr( FDateEnd )]);

  with MasterQuery do
  begin
    Close;
    ParamByName('prod_date1').asDateTime:= FDateStart;
    ParamByName('prod_date2').asDateTime:= DateEnd;
    Reopen(MasterQuery);
  end;

  Reopen( DetailQuery );

  if Assigned(SubDetailQuery) then
     Reopen( SubDetailQuery )
end;

procedure TFrmMatStaging.QryMatStagingCalcFields(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('prod_date1').asDateTime:= FDateStart;
    FieldByName('prod_date2').asDateTime:= DateEnd;
  end;
end;

procedure TFrmMatStaging.sbtnSearchClick(Sender: TObject);
begin
  with PkArinvt do
    if Execute then
       if PageControl1.ActivePage = shByMaterial then
       begin
          if not QryMatStaging.Locate('ARINVT_ID', GetValue('ARINVT_ID'), []) then
             IQWarning('This item was not found among materials required for the scheduled jobs within selected dates scope')
       end
       else
          if not QrySchdCntrStageDtl.Locate('ARINVT_ID', GetValue('ARINVT_ID'), []) then
             IQWarning('This item was not found among materials required for the scheduled jobs within selected dates scope for selected work center')
end;

procedure TFrmMatStaging.PkArinvtBeforeOpen(DataSet: TDataSet);
begin
  AssignEPlantFilter( DataSet );
  // with DataSet as TFDQuery do
  // begin
  //   ParamByName('prod_date1').asDateTime:= FDateStart;
  //   ParamByName('prod_date2').asDateTime:= DateEnd;
  // end;
  AssignQueryParamValue(DataSet, 'prod_date1', FDateStart);
  AssignQueryParamValue(DataSet, 'prod_date2', DateEnd);
end;

procedure TFrmMatStaging.SBFilterClick(Sender: TObject);
begin
  if TFrmDatesDialog.GetDatesDialog( FDateStart, FDateEnd ) then
     PrepareOpenQuery;
end;

procedure TFrmMatStaging.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute
end;

procedure TFrmMatStaging.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmMatStaging.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmMatStaging.PageControl1Change(Sender: TObject);
begin
  PrepareOpenQuery;
end;

procedure TFrmMatStaging.SetNavigatorSource(Sender: TObject);
begin
  NavMain.DataSource:= (Sender as TUniDBGrid).DataSource;
end;

procedure TFrmMatStaging.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmMatStaging.Recalculate1Click(Sender: TObject);
begin
 // DoDayHrs( self, FALSE );
end;

procedure TFrmMatStaging.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSCHED{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmMatStaging.Contents1Click(Sender: TObject);
begin
  // DoHelp( iqchmMFG, iqhtmSCHED, '1052028' );  {in IQMS.Common.HelpHook.pas}
  IQHelp.HelpContext( 1052028 );
end;

procedure TFrmMatStaging.sbtnEplantViewClick(Sender: TObject);
begin
  if SoftEPlant1.ChangeEPlantView then
    IQRefreshDataSets;
//     PostMessage( Handle, iq_RefreshDataSets, 0, 0 );
end;

procedure TFrmMatStaging.AssignEPlantFilter(DataSet: TDataSet);
begin
  SoftEPlant1.AssignEPlantFilter( DataSet );
end;

procedure TFrmMatStaging.JumptoInventory1Click(Sender: TObject);
begin
  IQJumpInv.Execute;
end;

procedure TFrmMatStaging.sbtnUpdateSchedClick(Sender: TObject);
var
  ALockHandle: string;
begin

{ TODO -oLema : Dependent on WC-8505 Sched - Sched_mn }
(*
  TFrm_MainSched.IncrementIRV32Semaphore( ALockHandle );    {Shared mode}
  try
    DoIRV32( self, ALockHandle ); {IRV_Main}
  finally
    TFrm_MainSched.DecrementIRV32Semaphore( ALockHandle );
  end;
*)
end;

procedure TFrmMatStaging.gridMatStagingDtlDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
//  if QryMatStagingDtlORIGIN.AsString = 'FORECAST' then
//  begin
//    Attribs.Color:= IIf( gdSelected in State, clNavy,   clWhite );
//    Attribs.Font.Color := IIf( gdSelected in State, clYellow, clBlue  );
//  end;

end;


procedure TFrmMatStaging.SetSortFieldName(AValue: string);
begin
  FSortFieldName:= AValue;
  ByWorkCenter1.Checked           := FSortFieldName = 'EQNO';
  ByWorkCenterDescription1.Checked:= FSortFieldName = 'CNTR_DESC';
  CheckChangeSortField( QrySchdCntr );
end;

procedure TFrmMatStaging.ByWorkCenter1Click(Sender: TObject);
begin
  SortFieldName:= 'EQNO';
end;

procedure TFrmMatStaging.ByWorkCenterDescription1Click(Sender: TObject);
begin
  SortFieldName:= 'CNTR_DESC';
end;

procedure TFrmMatStaging.CheckChangeSortField( AQuery: TFDQuery );
var
  I: Integer;
begin
  AQuery.Close;
  try
    I:= Pos( ' order by ', AQuery.SQL.Text );
    if I > 0 then
       AQuery.SQL.Text:= Copy( AQuery.SQL.Text, 1, I-1 );

    AQuery.SQL.Add(' order by ' + FSortFieldName );
  finally
    Reopen( AQuery );
  end;
end;


procedure TFrmMatStaging.sbtnPrintStagingReportClick(Sender: TObject);
var
  AToDate: TDateTime;
begin
  if FDateStart <= FDateEnd then
     AToDate:= FDateEnd
  else
     AToDate:= FDateStart + 90 {days};


  { TODO -oLema : Dependent on WC-7895 Print_Dialogs - Prn_Staging }
//  DoPrintStagingReport(Self, DateToStr( Date        {always pass current date because staging goes by scope in days starting from now} ),
//                        DateToStr( AToDate )); {Prn_Staging.pas}
end;

procedure TFrmMatStaging.JumpToInventory2Click(Sender: TObject);
begin
  IQJumpInv2.Execute;
end;

procedure TFrmMatStaging.JumpToLocationsTransactions2Click(
  Sender: TObject);
begin
  JumpDirect( iq_JumpToInvTransLocs, QrySchdCntrStageDtlARINVT_ID.asInteger );
end;

procedure TFrmMatStaging.JumpToLocationsTransactions1Click(
  Sender: TObject);
begin
  JumpDirect( iq_JumpToInvTransLocs, QryMatStagingARINVT_ID.asInteger );
end;

end.
