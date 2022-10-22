unit AssyTrack_LaborSched;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  IQMS.WebVcl.About,
  Vcl.Menus,
  Vcl.Buttons,
  IQMS.WebVcl.Search,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Mask,
  Vcl.Wwdatsrc,
  { TODO : IQMS.Common.UserMessages is coded, but still giving an issue }
  //IQMS.Common.UserMessages,
  IQMS.WebVcl.RepDef,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel, uniGUIFrame, IQUniGrid, uniDateTimePicker, uniDBDateTimePicker;

type
  TCargoEmpSched = record
    PR_Emp_ID: Real;
    Total_Avail_Hours: Real;
  end;

  TFrmAssyTrackLaborSched = class(TUniForm)
    pnlLeft01: TUniPanel;
    Panel2: TUniPanel;
    MainMenu1: TUniMainMenu;
    IQAbout1: TIQWebAbout;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel6: TUniPanel;
    Splitter2: TUniSplitter;
    Splitter3: TUniSplitter;
    pnlBottom01: TUniPanel;
    wwDBGridSalesOrders: TIQUniGridControl;
    Panel10: TUniPanel;
    Splitter1: TUniSplitter;
    Splitter4: TUniSplitter;
    Panel3: TUniPanel;
    sbtnUnAssign: TUniSpeedButton;
    Panel5: TUniPanel;
    IQSearchEmp: TIQUniGridControl;
    Panel15: TUniPanel;
    Panel9: TUniPanel;
    IQSearchDispatch: TIQUniGridControl;
    Panel14: TUniPanel;
    pnlRight01: TUniPanel;
    Panel12: TUniPanel;
    NavSched: TUniDBNavigator;
    wwDBGridSched: TIQUniGridControl;
    Panel4: TUniPanel;
    Panel7: TUniPanel;
    sbtnSchedule: TUniSpeedButton;
    PkDepartment: TIQWebHPick;
    PkDepartmentID: TBCDField;
    PkDepartmentDESCRIPTION: TStringField;
    PkDepartmentMFGTYPE: TStringField;
    PkMfgCell: TIQWebHPick;
    PkMfgCellMFGCELL: TStringField;
    PkMfgCellID: TBCDField;
    PkMfgCellMFGTYPE: TStringField;
    PkMfgCellEPLANT_ID: TBCDField;
    SrcSndop_Dispatch: TDataSource;
    QrySndop_Dispatch: TFDQuery;
    QrySndop_DispatchSEQ: TBCDField;
    QrySndop_DispatchWORKORDER_ID: TBCDField;
    QrySndop_DispatchOPNO: TStringField;
    QrySndop_DispatchOPDESC: TStringField;
    QrySndop_DispatchPartsToGo: TFloatField;
    QrySndop_DispatchHoursToGo: TFloatField;
    QrySndop_DispatchID: TBCDField;
    QrySndop_DispatchSNDOP_ID: TBCDField;
    QrySndop_DispatchPARTNO_ID: TBCDField;
    QrySndop_DispatchWORK_CENTER_ID: TBCDField;
    QrySndop_DispatchPTORDER_ID: TFMTBCDField;
    SrcPtOrder: TDataSource;
    QryPtOrder: TFDQuery;
    QryPtOrderORDERNO: TStringField;
    QryPtOrderCOMPANY: TStringField;
    QryPtOrderPONO: TStringField;
    QryPtOrderREL_DATE: TDateTimeField;
    QryPtOrderREL_QUAN_DISP: TFMTBCDField;
    QryPtOrderCLASS: TStringField;
    QryPtOrderITEMNO: TStringField;
    QryPtOrderREV: TStringField;
    QryPtOrderDESCRIP: TStringField;
    QryPtOrderPROMISE_DATE: TDateTimeField;
    QryPtOrderREQUEST_DATE: TDateTimeField;
    QryPtOrderREL_QUAN: TBCDField;
    QryPtOrderPTALLOCATE_ID: TBCDField;
    QryPtOrderARINVT_ID: TBCDField;
    QryPtOrderDESCRIP2: TStringField;
    QryPtOrderUNIT: TStringField;
    QryPtOrderORDERS_ID: TBCDField;
    QryPtOrderSTANDARD_ID: TBCDField;
    QryPtOrderORD_DETAIL_ID: TBCDField;
    QryPtOrderID: TBCDField;
    QryPtOrderWORKORDER_ID: TBCDField;
    QryPtOrderPARTNO_ID: TBCDField;
    QrySndop_DispatchEQNO: TStringField;
    QrySndop_DispatchSTART_TIME: TDateTimeField;
    QrySndop_DispatchOPERATOR: TFMTBCDField;
    QrySndop_DispatchOperator_Hours_Required: TFloatField;
    SrcEmp: TDataSource;
    QryEmp: TFDQuery;
    QryEmpID: TBCDField;
    QryEmpEMPNO: TStringField;
    QryEmpTOTAL_AVAIL_HOURS: TFMTBCDField;
    QrySndop_DispatchPROCESS_PARTS_TO_GO: TFMTBCDField;
    pnlDispatchLegend: TUniPanel;
    Shape4: TUniPanel;
    Panel1: TUniPanel;
    chkMatchProcessToEmployee: TUniCheckBox;
    Panel8: TUniPanel;
    chkMatchEmployeeToProcess: TUniCheckBox;
    SrcSndopSched: TDataSource;
    QrySndopSched: TFDQuery;
    QrySndop_DispatchProd_Date: TDateTimeField;
    QrySndop_DispatchShift: TFloatField;
    QrySndopSchedID: TBCDField;
    QrySndopSchedSNDOP_DISPATCH_ID: TBCDField;
    QrySndopSchedPR_EMP_ID: TBCDField;
    QrySndopSchedPROD_DATE: TDateTimeField;
    QrySndopSchedSHIFT: TBCDField;
    QrySndopSchedEMPNO: TStringField;
    QrySndopSchedPROD_HRS: TFMTBCDField;
    QrySndopSchedOPERATOR_PERCENT: TBCDField;
    UpdateSQLSched: TFDUpdateSQL;
    QryEmpScheduled_Hours: TFloatField;
    QryEmpScheduled_Operators: TFloatField;
    pnlEmpLegend: TUniPanel;
    Shape1: TUniPanel;
    QrySndop_DispatchScheduled_Hours: TFloatField;
    QrySndop_DispatchScheduled_Operators: TFloatField;
    Panel11: TUniPanel;
    Panel17: TUniPanel;
    wwDBGridEmpSched: TIQUniGridControl;
    Splitter5: TUniSplitter;
    SrcEmpSched: TDataSource;
    QryEmpSched: TFDQuery;
    QryEmpProd_Date: TDateTimeField;
    QryEmpShift: TFloatField;
    QryEmpSchedID: TBCDField;
    QryEmpSchedPROD_HRS: TFMTBCDField;
    QryEmpSchedOPERATOR_PERCENT: TBCDField;
    QryEmpSchedWORKORDER_ID: TBCDField;
    QryEmpSchedOPNO: TStringField;
    Panel18: TUniPanel;
    Label4: TUniLabel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    wwDBDateTimePickerProdDate: TUniDBDateTimePicker;
    edShift: TUniEdit;
    wwDBComboDlgDepartment: TUniEdit;
    wwDBComboDlgMfgcell: TUniEdit;
    Panel13: TUniPanel;
    Panel19: TUniPanel;
    Bevel2: TUniPanel;
    Bevel3: TUniPanel;
    Panel16: TUniPanel;
    sbtnApplyCriteria: TUniSpeedButton;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrintSetup1: TUniMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    IQRepDef1: TIQWebRepDef;
    popmDispatch: TUniPopupMenu;
    JumpToProcessMaintenance1: TUniMenuItem;
    JumpToWorkOrder1: TUniMenuItem;
    JumpToWorkCenter1: TUniMenuItem;
    popmSalesOrder: TUniPopupMenu;
    JumpToSalesOrder1: TUniMenuItem;
    JumpToInventory1: TUniMenuItem;
    IQJumpWorkorder: TIQWebJump;
    IQJumpWorkcenter: TIQWebJump;
    IQJumpInv: TIQWebJump;
    IQJumpWoEmpSched: TIQWebJump;
    popmEmpSched: TUniPopupMenu;
    JumpToWorkOrder2: TUniMenuItem;
    JumpToProcessMaintenance2: TUniMenuItem;
    QryEmpSchedSNDOP_ID: TBCDField;
    QryEmpFIRST_NAME: TStringField;
    QryEmpLAST_NAME: TStringField;
    QrySndopSchedFIRST_NAME: TStringField;
    QrySndopSchedLAST_NAME: TStringField;
    Options1: TUniMenuItem;
    TaskMessageParameters1: TUniMenuItem;
    QrySndop_DispatchPTOPER_ID: TBCDField;
    Contents1: TUniMenuItem;
    QryEmpMIDDLE_NAME: TStringField;
    QrySndopSchedMIDDLE_NAME: TStringField;
    SecurityRegister1: TIQWebSecurityRegister;
    QrySndop_DispatchPROD_START_TIME: TDateTimeField;
    QrySndop_DispatchPROD_END_TIME: TDateTimeField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure wwDBComboDlgDepartmentCustomDlg(Sender: TObject);
    procedure CheckDeleteKey(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PkMfgCellBeforeOpen(DataSet: TDataSet);
    procedure wwDBComboDlgMfgcellCustomDlg(Sender: TObject);
    procedure QrySndop_DispatchCalcFields(DataSet: TDataSet);
    procedure QrySndop_DispatchFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure QryEmpBeforeOpen(DataSet: TDataSet);
    procedure chkMatchProcessToEmployeeClick(Sender: TObject);
    procedure chkMatchEmployeeToProcessClick(Sender: TObject);
    procedure QrySndop_DispatchBeforeOpen(DataSet: TDataSet);
    procedure SrcSndop_DispatchDataChange(Sender: TObject; Field: TField);
    procedure SrcEmpDataChange(Sender: TObject; Field: TField);
    procedure ApplyUpdatesToSched(DataSet: TDataSet);
    { TODO : TNavigateBtn not yet converted }
   // procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure QrySndopSchedNewRecord(DataSet: TDataSet);
    procedure sbtnUnAssignClick(Sender: TObject);
    procedure sbtnScheduleClick(Sender: TObject);
    procedure QryEmpCalcFields(DataSet: TDataSet);
    { TODO : TGridDrawState not converted yet }
   { procedure IQSearchEmpCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure IQSearchDispatchCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);    }
    procedure IQSearchEmpUserBtn1OnClick(Sender: TObject);
    procedure IQSearchEmpMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure IQSearchDispatchDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure IQSearchDispatchDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure Print1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure JumpToProcessMaintenance1Click(Sender: TObject);
    procedure JumpToWorkOrder1Click(Sender: TObject);
    procedure JumpToWorkCenter1Click(Sender: TObject);
    procedure JumpToSalesOrder1Click(Sender: TObject);
    procedure JumpToInventory1Click(Sender: TObject);
    procedure JumpToProcessMaintenance2Click(Sender: TObject);
    procedure JumpToWorkOrder2Click(Sender: TObject);
    procedure TaskMessageParameters1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    FDate: TDateTime;
    FShift: Real;
    FPR_Department_ID: Real;
    FMfgcell_ID: Real;
    FStartTime: TDateTime;
    FEndTime: TDateTime;
    FSaveDispatchOnResize: TNotifyEvent;
    FSaveEmployeeOnResize: TNotifyEvent;
    FDragDropPoint: TPoint;
    procedure InitForm;
    procedure SetPR_Department_ID(const Value: Real);
    procedure SetMfgcell_ID(const Value: Real);
    procedure ValidateSelectionCriteria;
    procedure IQAfterShowMessage( var Msg: TMessage );
       { TODO : IQMS.Common.UserMessages is coded, but still giving an issue }
      //message iq_AfterShowMessage;
    procedure RebuildDataSet;
    procedure RefreshDataSets;
    procedure LocalDispatchSearchPanelResize(Sender: TObject);
    procedure LocalEmployeeSearchPanelResize(Sender: TObject);
    procedure PopulateOnFlyGTTTable;
    procedure ScheduleEmployeeBasedOnDispatchList(ACargo: TCargoEmpSched);
    procedure SqueezeInLegend(ALegendPanel: TUniPanel; AIQSearch: TIQUniGridControl; var ASaveOnResize: TNotifyEvent; ALocalOnResize: TNotifyEvent);
    procedure IQNotifyMessage( var Msg: TMessage );
       { TODO : IQMS.Common.UserMessages is coded, but still giving an issue }
      //message iq_Notify;
    procedure DragDropItem;

  protected

    property PR_Department_ID: Real read FPR_Department_ID write SetPR_Department_ID;
    property Mfgcell_ID: Real read FMfgcell_ID write SetMfgcell_ID;
  public
    { Public declarations }
    class procedure DoShow;
  end;

implementation

{$R *.dfm}

uses
  assy_data_share,
  IQMS.Common.JumpConstants,
  AssyTrack_LaborSchedParam,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.MfgShare,
  IQMS.Common.PanelMsg,
  snd_link;

type
   TwwLocalDBGrid = class( TIQUniGridControl )    {so we could surface MouseDown event}
   public
      procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: integer);
   end;

{ TwwLocalDBGrid }
procedure TwwLocalDBGrid.MouseDown(Button: TMouseButton;  Shift: TShiftState; X, Y: integer);
begin
  inherited MouseDown( Button, Shift, X, Y );
end;


{ TFrmAssyTrackLaborSched }

class procedure TFrmAssyTrackLaborSched.DoShow;
var
  LFrmAssyTrackLaborSched : TFrmAssyTrackLaborSched;
begin
  LFrmAssyTrackLaborSched := TFrmAssyTrackLaborSched.Create(UniGUIApplication.UniApplication);
  LFrmAssyTrackLaborSched.Show;
end;


procedure TFrmAssyTrackLaborSched.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmAssyTrackLaborSched.IQAfterShowMessage(var Msg: TMessage);
begin
  RebuildDataSet;
end;

procedure TFrmAssyTrackLaborSched.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmASSY1{CHM}, iqhtmASSY1{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmAssyTrackLaborSched.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, pnlLeft01, pnlRight01, pnlBottom01, wwDBGridSched, wwDBGridSalesOrders ]);
end;

procedure TFrmAssyTrackLaborSched.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmAssyTrackLaborSched.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;


procedure TFrmAssyTrackLaborSched.InitForm;
begin
  // date
  wwDBDateTimePickerProdDate.DateTime:= SelectValueFmtAsFloat('select iqcalendar.prod_date( sysdate, null ) from dual', []);

  // shift
  with TFDStoredProc.Create(nil) do
  try
    Connection := UniMainModule.FDConnection1;
    StoredProcName:= 'IQMS.IQCALENDAR.DATE_TO_SHIFT';
    Prepare;
    ParamByName('V_DATE').Value:= SelectValueAsFloat('select sysdate from dual');
    ExecProc;
    edShift.Text:= ParamByName('v_shift').asString;
    edShift.Update;
  finally
    Free;
  end;

  {Transfer pnlLegend to IQSearch1 panel}
  // pnlDispatchLegend.Parent:= IQSearchDispatch.wwIncSearch.Parent as TPanel;
  // pnlDispatchLegend.Align:= alRight;
  // pnlDispatchLegend.Left:= 0;
  // IQSearchDispatch.wwIncSearch.Width:= IQSearchDispatch.wwIncSearch.Width - pnlDispatchLegend.Width;
  // FSaveDispatchOnResize:= TPanel(IQSearchDispatch.wwIncSearch.Parent).OnResize;
  // TPanel(IQSearchDispatch.wwIncSearch.Parent).OnResize:= LocalDispatchSearchPanelResize;

  SqueezeInLegend( pnlDispatchLegend, IQSearchDispatch, FSaveDispatchOnResize, LocalDispatchSearchPanelResize );
  SqueezeInLegend( pnlEmpLegend, IQSearchEmp, FSaveEmployeeOnResize, LocalEmployeeSearchPanelResize );

  chkMatchEmployeeToProcess.Visible:= (IQMS.Common.MfgShare.GetAssy1ProcessCertification() = 'J');       // Certified Jobs
  chkMatchProcessToEmployee.Visible:= (IQMS.Common.MfgShare.GetAssy1ProcessCertification() = 'J');       // Certified Jobs
end;


procedure TFrmAssyTrackLaborSched.SqueezeInLegend( ALegendPanel: TUniPanel; AIQSearch: TIQUniGridControl; var ASaveOnResize: TNotifyEvent; ALocalOnResize: TNotifyEvent );
begin
{ TODO : TIQUniGridControl does not contain any member TopToolPanel }
 { ALegendPanel.Parent:= AIQSearch.TopToolPanel;
  ALegendPanel.Align:= alRight;
  ALegendPanel.Left:= 0;     }

  //AIQMS.WebVcl.Search.wwIncSearch.Width:= AIQMS.WebVcl.Search.wwIncSearch.Width - ALegendPanel.Width;
  //ASaveOnResize:= TPanel(AIQMS.WebVcl.Search.wwIncSearch.Parent).OnResize;
  //TPanel(AIQMS.WebVcl.Search.wwIncSearch.Parent).OnResize:= ALocalOnResize;
end;


procedure TFrmAssyTrackLaborSched.wwDBComboDlgDepartmentCustomDlg(Sender: TObject);
begin
  with PkDepartment do
    if Execute then
       PR_Department_ID:= GetValue('ID');  // this will also reset mfgcell_id
end;

procedure TFrmAssyTrackLaborSched.SetPR_Department_ID(const Value: Real);
begin
  FPR_Department_ID:= Value;
  wwDBComboDlgDepartment.Text:= SelectValueByID('description', 'pr_department', FPR_Department_ID);
  Mfgcell_ID:= 0;
end;

procedure TFrmAssyTrackLaborSched.SetMfgcell_ID(const Value: Real);
begin
  FMfgcell_ID:= Value;
  wwDBComboDlgMfgcell.Text:= SelectValueByID('mfgcell', 'mfgcell', FMfgcell_ID);
end;

procedure TFrmAssyTrackLaborSched.CheckDeleteKey(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE)  then
  begin
    if Sender = wwDBComboDlgDepartment then
       PR_Department_ID:= 0
    else if Sender = wwDBComboDlgMfgcell then
       Mfgcell_ID:= 0;
    Key:= 0;
  end;
end;

procedure TFrmAssyTrackLaborSched.PkMfgCellBeforeOpen(DataSet: TDataSet);
begin
  if FPR_Department_ID = 0 then
     // TFDQuery(DataSet).ParamByName('MfgType').asString:= '*'
     AssignQueryParamValue(DataSet, 'MfgType', '*')
  else
     // TFDQuery(DataSet).ParamByName('MfgType').asString:= Trim(SelectValueByID('mfgtype', 'pr_department', FPR_Department_ID));
     AssignQueryParamValue(DataSet, 'MfgType', Trim(SelectValueByID('mfgtype', 'pr_department', FPR_Department_ID)));
end;

procedure TFrmAssyTrackLaborSched.wwDBComboDlgMfgcellCustomDlg(
  Sender: TObject);
begin
  with PkMfgCell do
    if Execute then
       Mfgcell_ID:= GetValue('id');
end;

procedure TFrmAssyTrackLaborSched.ValidateSelectionCriteria;
begin
  FDate:= wwDBDateTimePickerProdDate.DateTime;
  IQAssert( FDate > 0, 'Selection criteria error: prod date must be specified' );
  try
    FShift:= StrToFloat(edShift.Text);
  except
    FShift:= 0;
  end;
  IQAssert( FShift > 0, 'Selection criteria error: a valid shift must be specified and be greater than 0' );

  ExecuteCommandFmt('declare                                                            '+
            '  v_mfgcell_id number::= %s;                                       '+
            '  v_shift      number::= %f;                                       '+
            '  v_shifts     number;                                             '+
            'begin                                                              '+
            '  IQCalendar.Get_Shift_By_MfgCell( v_mfgcell_id, v_shifts );       '+
            '  if not ((v_shift > 0) and (v_shift <= v_shifts)) then            '+
            '     raise_application_error(-20500, ''Selection criteria rrror: invalid shift specified. Max number of shifts is '' || v_shifts ); '+
            '  end if;                                                          '+
            'end;                                                               ',
            [ IQMS.Common.StringUtils.FloatToStr0asNull( Mfgcell_ID, 'NULL'),
              FShift ]);

  with TFDStoredProc.Create(nil) do
  try
    Connection := UniMainModule.FDConnection1;
    StoredProcName:= 'IQMS.IQCALENDAR.PROD_DATE_SHIFT_TIMES';
    Prepare;
    ParamByName('V_CALENDAR_DATE').Value:= FDate;
    ParamByName('V_SHIFT').Value:= FShift;
    if MfgCell_ID > 0 then
       ParamByName('V_MFGCELL_ID').Value := MfgCell_ID;
    ParamByName('V_IS_PROD_DATE').Value:= 'Y';
    ExecProc;
    FStartTime:= ParamByName('V_SHIFT_START').asDateTime;
    FEndTime  := ParamByName('V_SHIFT_END').asDateTime;
  finally
    Free;
  end;

end;


procedure TFrmAssyTrackLaborSched.QrySndop_DispatchCalcFields(DataSet: TDataSet);
var
  ATotalReleaseQty  : Real;
  AGoodPartsProduced: Real;
  AProgress         : Real;
  AHoursToGo        : Real;
  ActHrsPart        : Real;
  ARejects          : Real;
  APartsToGo        : Real;
  A                 : Variant;
begin
  // calculate hours, parts to go
  ATotalReleaseQty:= SelectValueFmtAsFloat('select sum(nvl(rel_quan_origin,rel_quan)) from ptorder_rel where ptorder_id = %f',
                               [ QrySndop_DispatchPTORDER_ID.asFloat ]);

  assy_data_share.CalculateProcessProgress( QrySndop_DispatchWORKORDER_ID.asFloat,  // AWorkorder_ID
                                            QrySndop_DispatchPARTNO_ID.asFloat,     // APartno_ID
                                            QrySndop_DispatchSNDOP_ID.asFloat,      // ASndop_ID
                                            QrySndop_DispatchPTOPER_ID.asFloat,     // APtoper_ID
                                            ATotalReleaseQty,                       // ATotalReleaseQty
                                            AGoodPartsProduced,                     // AGoodPartsProduced
                                            ARejects,                               // Rejected Mfg Parts
                                            AProgress,                              // AProgress
                                            AHoursToGo,                             // AHoursToGo
                                            APartsToGo,                             // APartsToGo
                                            ActHrsPart );                           // ActHrsPart

  // Note  QrySndop_DispatchPartsToGo and QrySndop_DispatchPROCESS_PARTS_TO_GO are the same thing.
  // The difference is QrySndop_DispatchPROCESS_PARTS_TO_GO is calculated on the back end so I could use it in the filter
  QrySndop_DispatchHoursToGo.asFloat:= AHoursToGo;
  QrySndop_DispatchPartsToGo.asFloat:= APartsToGo;

  if QrySndop_DispatchOPERATOR.asFloat * QrySndop_DispatchHoursToGo.asFloat > 0 then
     QrySndop_DispatchOperator_Hours_Required.asFloat:= QrySndop_DispatchOPERATOR.asFloat * QrySndop_DispatchHoursToGo.asFloat;

  // this is just to be able to link in child query: QrySched
  QrySndop_DispatchProd_Date.asDateTime:= FDate;
  QrySndop_DispatchShift.asFloat:= FShift;

  // calculate scheduled hours, operators
  A:= SelectValueArrayFmt( 'select sum(prod_hrs * operator_percent/100),      '+
                      '       sum(operator_percent/100)                  '+
                      '  from sndop_sched                                '+
                      ' where sndop_dispatch_id = %f                      '+
                      '   and prod_date = to_date(''%s'',''mm/dd/yyyy'') '+
                      '   and shift = %f                                 ',
                      [ QrySndop_DispatchID.asFloat,
                        FormatDateTime('mm/dd/yyyy', FDate),
                        FShift ]);
 if VarArrayDimCount( A ) = 0 then
    EXIT;
 if A[ 0 ] <> 0 then
    QrySndop_DispatchScheduled_Hours.asFloat:= A[ 0 ];
 if A[ 1 ] <> 0 then
    QrySndop_DispatchScheduled_Operators.asFloat:= A[ 1 ];

end;

procedure TFrmAssyTrackLaborSched.QrySndop_DispatchFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  // Note  QrySndop_DispatchPartsToGo and QrySndop_DispatchPROCESS_PARTS_TO_GO are the same thing.
  // The difference is QrySndop_DispatchPROCESS_PARTS_TO_GO is calculated on the back end so I could use it in the filter
  Accept:= QrySndop_DispatchPROCESS_PARTS_TO_GO.asFloat > 0;
end;

procedure TFrmAssyTrackLaborSched.QryEmpBeforeOpen(DataSet: TDataSet);
begin
  //with DataSet as TFDQuery do
  //begin
  //  // if chkMatchEmployeeToProcess.Checked is checked then filter employees based on cert level
  //  ParamByName('match_certif_level').Value := IIf( chkMatchEmployeeToProcess.Checked, 1, 0);
  //  ParamByName('sndop_id').Value := QrySndop_DispatchSNDOP_ID.asFloat;
  //end;
  AssignQueryParamValue(DataSet, 'match_certif_level', IIf( chkMatchEmployeeToProcess.Checked, 1, 0));
  AssignQueryParamValue(DataSet, 'sndop_id', QrySndop_DispatchSNDOP_ID.asFloat);
end;

procedure TFrmAssyTrackLaborSched.QrySndop_DispatchBeforeOpen(DataSet: TDataSet);
begin
  //with DataSet as TFDQuery do
  //begin
  //  // if chkMatchProcessToEmployee.Checked is checked then filter processes based employees cert level
  //  ParamByName('match_certif_level').Value := IIf( chkMatchProcessToEmployee.Checked, 1, 0);
  //  ParamByName('pr_emp_id').Value := QryEmpID.asFloat;
  //end;
  AssignQueryParamValue(DataSet, 'match_certif_level', IIf( chkMatchProcessToEmployee.Checked, 1, 0));
  AssignQueryParamValue(DataSet, 'sndop_id', QryEmpID.asFloat );
end;


procedure TFrmAssyTrackLaborSched.RebuildDataSet;
var
  hMsg: TPanelMesg;
begin
  hMsg:= hPleaseWait('');
  try
    ValidateSelectionCriteria;

    PopulateOnFlyGTTTable;

    Reopen(QryEmp);
    Reopen(QrySndop_Dispatch);
  finally
    hMsg.Free;
  end;
end;

procedure TFrmAssyTrackLaborSched.LocalDispatchSearchPanelResize(Sender: TObject);
begin
  if Assigned( FSaveDispatchOnResize ) then
     FSaveDispatchOnResize( Sender );
     { TODO : TIQUniGridControl does not contain any member wwIncSearch }
 // IQSearchDispatch.wwIncSearch.Width:= IQSearchDispatch.wwIncSearch.Width - pnlDispatchLegend.Width;
end;

procedure TFrmAssyTrackLaborSched.LocalEmployeeSearchPanelResize(Sender: TObject);
begin
  if Assigned( FSaveEmployeeOnResize ) then
     FSaveEmployeeOnResize ( Sender );
     { TODO : TIQUniGridControl does not contain any member wwIncSearch }
 // IQSearchEmp.wwIncSearch.Width:= IQSearchEmp.wwIncSearch.Width - pnlEmpLegend.Width;
end;

procedure TFrmAssyTrackLaborSched.chkMatchProcessToEmployeeClick(Sender: TObject);
begin
  // employee is driving
  chkMatchEmployeeToProcess.OnClick:= nil;
  try
    chkMatchEmployeeToProcess.Checked:= FALSE;
  finally
    chkMatchEmployeeToProcess.OnClick:= chkMatchEmployeeToProcessClick;
  end;
  RefreshDataSetByID( QryEmp );
  Reopen( QrySndop_Dispatch );
end;

procedure TFrmAssyTrackLaborSched.chkMatchEmployeeToProcessClick(Sender: TObject);
begin
  // process is driving
  chkMatchProcessToEmployee.OnClick:= nil;
  try
    chkMatchProcessToEmployee.Checked:= FALSE;
  finally
    chkMatchProcessToEmployee.OnClick:= chkMatchProcessToEmployeeClick;
  end;
  RefreshDataSetByID( QrySndop_Dispatch );
  Reopen( QryEmp );
end;

procedure TFrmAssyTrackLaborSched.SrcSndop_DispatchDataChange(Sender: TObject; Field: TField);
begin
  if Assigned(QrySndop_Dispatch) and (QrySndop_Dispatch.State = dsBrowse) and chkMatchEmployeeToProcess.Checked then
     Reopen( QryEmp )
end;

procedure TFrmAssyTrackLaborSched.SrcEmpDataChange(Sender: TObject; Field: TField);
begin
  if Assigned(QryEmp) and (QryEmp.State = dsBrowse) and chkMatchProcessToEmployee.Checked then
     Reopen( QrySndop_Dispatch)
end;

procedure TFrmAssyTrackLaborSched.PopulateOnFlyGTTTable;
begin

ExecuteCommandFmt('declare                                                                                                             '+
          '  v_department_id number::= %f;                                                                                     '+
          '  v_mfgcell_id    number::= %f;                                                                                     '+
          '  v_start_time    date::= to_date(''%s'', ''mm/dd/yyyy hh24::mi::ss'');                                             '+
          '  v_end_time      date::= to_date(''%s'', ''mm/dd/yyyy hh24::mi::ss'');                                             '+
          'begin                                                                                                               '+
          '  execute immediate ''truncate table GTT_pr_emp_assy1_labor_schd'';                                                 '+
          '                                                                                                                    '+
          '  insert into GTT_pr_emp_assy1_labor_schd                                                                           '+
          '       ( id, empno, total_avail_hours )                                                                             '+
          '  select e.id,                                                                                                      '+
          '         e.empno,                                                                                                   '+
          '         payroll_misc.GetSchedEmpHrs( e.id, v_start_time, v_end_time ) as total_avail_hours                         '+
          '    from pr_emp e,                                                                                                  '+
          '         pr_paygroup g                                                                                              '+
          '   where                                                                                                            '+
                    // scheduled TA employees
          '         Ta_Misc.GetShiftsID( v_start_time, e.id )                                                                  '+
          '           in                                                                                                       '+
          '         ( select distinct ta_shift_id                                                                              '+
          '             from ta_calendar                                                                                       '+
          '            where ( (start_time >= v_start_time and end_time <= v_end_time)                                         '+
          '                    or                                                                                              '+
          '                    (end_time between v_start_time and v_end_time)                                                  '+
          '                    or                                                                                              '+
          '                    (start_time between v_start_time and v_end_time)                                                '+
          '                    or                                                                                              '+
          '                    (v_start_time between start_time and end_time and v_end_time between start_time and end_time))) '+
          '                                                                                                                    '+
                    // eplant filter
          '     and e.pr_paygroup_id = g.id(+)                                                                                 '+
          '     and misc.eplant_filter_include_nulls(g.eplant_id) = 1                                                          '+
          '     and nvl(e.pk_hide, ''N'') <> ''Y''                                                                             '+
          '                                                                                                                    '+
                    // filter out 0 avail hours
          '     and nvl(payroll_misc.GetSchedEmpHrs( e.id, v_start_time, v_end_time ), 0) > 0                                  '+

                    // department
          '     and (nvl(v_department_id,0) = 0                                                                                '+
          '          or                                                                                                        '+
          '          v_department_id = e.pr_department_id)                                                                     '+
          '                                                                                                                    '+
                     // mfgcell
          '     and (nvl(v_mfgcell_id,0) = 0                                                                                   '+
          '          or                                                                                                        '+
          '          v_mfgcell_id = e.mfgcell_id);                                                                             '+
          'end;                                                                                                                ',
          [ PR_Department_ID,
            Mfgcell_ID,
            FormatDateTime('mm/dd/yyyy hh:nn:ss', FStartTime),
            FormatDateTime('mm/dd/yyyy hh:nn:ss', FEndTime)])

end;


procedure TFrmAssyTrackLaborSched.ApplyUpdatesToSched(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);

  // Refresh Emp and Dispatch Lists to reflect hours and operators scheduled
  RefreshDataSets;
end;

{ TODO : TNavigateBtn not yet converted }
{procedure TFrmAssyTrackLaborSched.CheckRefresh(Sender: TObject;  Button: TNavigateBtn);
begin
 IQCheckRefresh( Sender, Button );
end;    }

procedure TFrmAssyTrackLaborSched.QrySndopSchedNewRecord(DataSet: TDataSet);
begin
  QrySndopSchedID.asFloat:= GetNextID('sndop_sched');
end;

procedure TFrmAssyTrackLaborSched.sbtnUnAssignClick(Sender: TObject);
begin
{ TODO : TUniDBNavigator does not contain any member BtnClick }
 { if NavSched.Controls[Ord(nbDelete)].Enabled then
     NavSched.BtnClick(nbDelete);  }
end;

procedure TFrmAssyTrackLaborSched.sbtnScheduleClick(Sender: TObject);
var
  ACargo: TCargoEmpSched;
begin
  ACargo.PR_Emp_ID:= QryEmpID.asFloat;
  ACargo.Total_Avail_Hours:= QryEmpTOTAL_AVAIL_HOURS.asFloat;

  ScheduleEmployeeBasedOnDispatchList( ACargo );
end;

procedure TFrmAssyTrackLaborSched.ScheduleEmployeeBasedOnDispatchList(ACargo: TCargoEmpSched);
begin
  IQAssert( not( QrySndop_Dispatch.Eof and QrySndop_Dispatch.Bof), 'Dispatch List is empty - operation aborted');
  IQAssert( ACargo.PR_Emp_ID > 0, 'Undefined Employee ID - operation aborted');
  if chkMatchEmployeeToProcess.Checked then
     IQAssert( SelectValueFmtAsFloat('select assy1_misc.is_certif_level_matching( %f, %f) from dual', [ ACargo.PR_Emp_ID, QrySndop_DispatchSNDOP_ID.asFloat ]) = 1,
               'Certification level mismatch - operation aborted');

  QrySndopSched.Append;

  QrySndopSchedSNDOP_DISPATCH_ID.asFloat:= QrySndop_DispatchID.asFloat;
  QrySndopSchedPR_EMP_ID.asFloat        := ACargo.PR_Emp_ID;
  QrySndopSchedPROD_DATE.asDateTime     := QrySndop_DispatchProd_Date.asDateTime;
  QrySndopSchedSHIFT.asFloat            := QrySndop_DispatchShift.asFloat;
  QrySndopSchedEMPNO.asString           := SelectValueByID('empno', 'pr_emp', QrySndopSchedPR_EMP_ID.asFloat);
  QrySndopSchedPROD_HRS.asFloat         := fMin( ACargo.Total_Avail_Hours, QrySndop_DispatchHoursToGo.asFloat );
  QrySndopSchedOPERATOR_PERCENT.asFloat := 100;

  QrySndopSched.Post;    {and post it}
end;

procedure TFrmAssyTrackLaborSched.QryEmpCalcFields(DataSet: TDataSet);
var
  A: Variant;
begin
  A:= SelectValueArrayFmt( 'select sum(prod_hrs * operator_percent/100),      '+
                      '       sum(operator_percent)                      '+
                      '  from sndop_sched                                '+
                      ' where pr_emp_id = %f                             '+
                      '   and prod_date = to_date(''%s'',''mm/dd/yyyy'') '+
                      '   and shift = %f                                 ',
                      [ QryEmpID.asFloat,
                        FormatDateTime('mm/dd/yyyy', FDate),
                        FShift ]);
 if VarArrayDimCount( A ) = 0 then
    EXIT;

 if A[ 0 ] <> 0 then
    QryEmpScheduled_Hours.asFloat:= A[ 0 ];
 if A[ 1 ] <> 0 then
    QryEmpScheduled_Operators.asFloat:= A[ 1 ];

  // this is just to be able to link in child query: QryEmpSched
 QryEmpProd_Date.asDateTime:= FDate;
 QryEmpShift.asFloat:= FShift;
end;


{ TODO : TGridDrawState not converted yet }
{procedure TFrmAssyTrackLaborSched.IQSearchEmpCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if (QryEmpTOTAL_AVAIL_HOURS.asFloat < QryEmpScheduled_Hours.asFloat) or (QryEmpScheduled_Operators.asFloat > 100) then
  begin
    if not Highlight then
      begin
        ABrush.Color:= clWhite;
        AFont.Color := clRed;
      end
    else
      begin
        ABrush.Color:= clBlack;
        AFont.Color := clYellow;
      end;
  end;
end;          }

procedure TFrmAssyTrackLaborSched.RefreshDataSets;

  procedure LocalRefresh( ADataSource: TDataSource );
  var
    H: TDataChangeEvent;
  begin
    H:= ADataSource.OnDataChange;
    try
      ADataSource.OnDataChange:= nil;
      RefreshDataSetByID( ADataSource.DataSet );
    finally
      ADataSource.OnDataChange:= H;
    end;
  end;

begin
  LocalRefresh( SrcEmp );
  LocalRefresh( SrcSndop_Dispatch );
end;

{procedure TFrmAssyTrackLaborSched.IQSearchDispatchCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if (QrySndop_DispatchScheduled_Hours.asFloat > 0)
     and
     (QrySndop_DispatchScheduled_Operators.asFloat > 0)
     and
     (QrySndop_DispatchScheduled_Hours.asFloat - QrySndop_DispatchOperator_Hours_Required.asFloat >= -0.000001)
     and
     (QrySndop_DispatchScheduled_Operators.asFloat - QrySndop_DispatchOPERATOR.asFloat >= -0.000001) then
  begin
    if not Highlight then
      begin
        ABrush.Color:= clMoneyGreen; // clGreen; // clWhite;
        AFont.Color := clBlack; // clWhite; // clGreen;
      end
    else
      begin
        ABrush.Color:= clBlack;
        AFont.Color := clLime;
      end;
  end;
end;      }

procedure TFrmAssyTrackLaborSched.IQSearchEmpUserBtn1OnClick(Sender: TObject);
begin
  RebuildDataSet;
end;

procedure TFrmAssyTrackLaborSched.IQSearchEmpMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
{ TODO : TIQUniGridControl does not contain any member wwDBGrid }
 { if (Shift = [ssLeft]) and not (QryEmp.Eof and QryEmp.Bof) and (Y > IQSearchEmp.wwDBgrid.RowHeights[ 0 ]) then
     IQSearchEmp.BeginDrag(FALSE);    }
end;

procedure TFrmAssyTrackLaborSched.IQSearchDispatchDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
{ TODO : TIQUniGridControl does not contain any member wwDBGrid }
 //  Accept:= (Source = IQSearchEmp) and (Sender = IQSearchDispatch.wwDBGrid) and not (QrySndop_Dispatch.Eof and QrySndop_Dispatch.Bof);
end;

procedure TFrmAssyTrackLaborSched.IQSearchDispatchDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  FDragDropPoint:= Point(X,Y);
  { TODO : IQMS.Common.UserMessages is coded, but still giving an issue }
 // PostMessage( Handle, iq_Notify, 1, 0 );
end;


procedure TFrmAssyTrackLaborSched.IQNotifyMessage(var Msg: TMessage);
begin
  case Msg.WParam of
    1: DragDropItem;
  end;
end;

procedure TFrmAssyTrackLaborSched.DragDropItem;
var
  AOnMouseDown: TMouseEvent;
  ACargo: TCargoEmpSched;
begin
  {save source id}
  ACargo.PR_Emp_ID:= QryEmpID.asFloat;
  ACargo.Total_Avail_Hours:= QryEmpTOTAL_AVAIL_HOURS.asFloat;

  {make to go to the target}
  { TODO : TIQUniGridControl does not contain any member wwDBGrid }
 { IQSearchDispatch.wwDBGrid.OnMouseDown:= NIL;
  AOnMouseDown:= IQSearchDispatch.wwDBGrid.OnMouseDown;
  try
    TwwLocalDBGrid(IQSearchDispatch.wwDBGrid).MouseDown( mbLeft, [ssLeft], FDragDropPoint.X, FDragDropPoint.Y );
  finally
    IQSearchDispatch.wwDBGrid.OnMouseDown:= AOnMouseDown;
  end;         }

  {schedule}
  ScheduleEmployeeBasedOnDispatchList( ACargo );
end;

procedure TFrmAssyTrackLaborSched.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmAssyTrackLaborSched.PrintSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmAssyTrackLaborSched.JumpToProcessMaintenance1Click(
  Sender: TObject);
begin
  ShowSndOperModaless(QrySndop_DispatchSNDOP_ID.asFloat, 'AS' );  {snd_link.pas}
end;

procedure TFrmAssyTrackLaborSched.JumpToWorkOrder1Click(Sender: TObject);
begin
  IQJumpWorkorder.Execute;
end;

procedure TFrmAssyTrackLaborSched.JumpToWorkCenter1Click(Sender: TObject);
begin
  IQJumpWorkcenter.Execute;
end;

procedure TFrmAssyTrackLaborSched.JumpToSalesOrder1Click(Sender: TObject);
var
  AOrders_ID: Real;
begin
  if QryPtOrderORDERS_ID.asFloat > 0 then
     AOrders_ID:= QryPtOrderORDERS_ID.asFloat
  else
     AOrders_ID:= SelectValueFmtAsFloat('select id from orders where orderno = ''%s''', [QryPtOrderORDERNO.asString]);
  JumpDirect( iq_JumpToSalesOrder, Trunc(AOrders_ID));
end;

procedure TFrmAssyTrackLaborSched.JumpToInventory1Click(Sender: TObject);
begin
  IQJumpInv.Execute;
end;

procedure TFrmAssyTrackLaborSched.JumpToProcessMaintenance2Click(
  Sender: TObject);
begin
  ShowSndOperModaless(QryEmpSchedSNDOP_ID.asFloat, 'AS' );  {snd_link.pas}
end;

procedure TFrmAssyTrackLaborSched.JumpToWorkOrder2Click(Sender: TObject);
begin
  IQJumpWoEmpSched.Execute;
end;

procedure TFrmAssyTrackLaborSched.TaskMessageParameters1Click(Sender: TObject);
begin
  TFrmAssyTrackLaborSchedParam.DoShowModal( self );  // AssyTrack_LaborSchedParam;
end;

procedure TFrmAssyTrackLaborSched.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self, pnlLeft01, pnlRight01, pnlBottom01, wwDBGridSched, wwDBGridSalesOrders ]);

  InitForm;
  { TODO : IQMS.Common.UserMessages is coded, but still giving an issue }
 // PostMessage( Handle, iq_AfterShowMessage, 0, 0);  // launch employee query
end;

end.
