{NOTE!
FDUpdateSQLMfgType.DeleteSQL property is changed manually
}

unit Mfg_Modi;

interface

uses
  System.SysUtils,
  Winapi.Windows,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  Vcl.DBGrids,
  Vcl.Dialogs,
  Vcl.Buttons,
  Mask,
  IQMS.WebVcl.About,
  Vcl.Menus,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Hpick,
  Vcl.wwDataInspector,
  IQMS.WebVcl.AppDef,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  MainModule,
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
  uniScrollBox,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniRadioButton,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniComboBox,
  uniDBComboBox,
  uniPageControl,
  uniMainMenu,
  IQUniGrid,
  uniGUIFrame, Vcl.Grids, Vcl.ExtCtrls;

type
  TMfgModi = class(TUniForm)
    DBNavigator: TUniDBNavigator;
    Panel1: TUniPanel;
    DataSource1: TDataSource;
    Table1: TFDTable;
    Table1MFGTYPE: TStringField;
    Table1DESCRIP: TStringField;
    Table1LABOR_RATE: TFMTBCDField;
    Table1BOM_REPORT: TStringField;
    Table1WO_REPORT: TStringField;
    OpenDialog1: TOpenDialog;
    SpeedButton1: TUniSpeedButton;
    Table1ELEMENTS_ID: TBCDField;
    QryElementsLabor: TFDQuery;
    Table1Element: TStringField;
    DBGrid1: TUniDBGrid;
    Table1ELEMENTS_ID_OH: TBCDField;
    QryElemOH: TFDQuery;
    Table1OverheadElem: TStringField;
    Shape4: TUniPanel;
    sbtnMfgConv: TUniSpeedButton;
    Table1FLOOR_DISPO_ON_CLOCK_OUT: TStringField;
    ScrollBox1: TUniScrollBox;
    Table1IS_LABOR_BASED_OH: TStringField;
    Table1LABOR_BASED_OH_RATE: TFMTBCDField;
    Table1NON_RT_BACKFLUSH: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    N1: TUniMenuItem;
    AlterLbsKCalculation1: TUniMenuItem;
    Table1LBSK_PERCENT_RUNNER: TFMTBCDField;
    Table1FAB_AUTO_LOGIN: TStringField;
    Contents1: TUniMenuItem;
    Table1FAB_PASSWORD_ON_LOGIN: TStringField;
    SrcMfgtypeEPlantRep: TDataSource;
    QryMfgtypeEPlantRep: TFDQuery;
    QryMfgtypeEPlantRepMFGTYPE: TStringField;
    QryMfgtypeEPlantRepEPLANT_ID: TBCDField;
    Splitter1: TUniSplitter;
    Table1LABOR_POSTED_BY_TA: TStringField;
    Table1STANDARD_MFGTYPE: TStringField;
    PkStandardMfgType: TIQWebHPick;
    PkStandardMfgTypeMFGTYPE: TStringField;
    PkStandardMfgTypeDESCRIP: TStringField;
    Table1RT_COUNT_BASED_ON_SCAN: TStringField;
    Table1ASSY1_FINAL_NO_SUPER_REQUIRED: TStringField;
    pnlDetails: TUniPanel;
    Table1ASSY1_PROCESS_CERTIFICATION: TStringField;
    Table1INCLUDE_SCRAP_IN_BYPRODUCT: TStringField;
    Table1LOCATIONS_ID_IN: TBCDField;
    Table1LOCATIONS_ID_OUT: TBCDField;
    Table1Loc_Desc_IN: TStringField;
    Table1Loc_Desc_OUT: TStringField;
    PkLocation: TIQWebHPick;
    PkLocationID: TBCDField;
    PkLocationLOCATION: TStringField;
    PkLocationDESCRIPTION: TStringField;
    PkLocationDIVISION: TStringField;
    PkLocationEPLANT_ID: TBCDField;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    TabSheet2: TUniTabSheet;
    TabSheet3: TUniTabSheet;
    Panel2: TUniPanel;
    Panel4: TUniPanel;
    Panel3: TUniPanel;
    Panel5: TUniPanel;
    Label6: TUniLabel;
    Panel6: TUniPanel;
    Splitter2: TUniSplitter;
    Panel7: TUniPanel;
    navEplantReports: TUniDBNavigator;
    Label10: TUniLabel;
    gridEPlantReport: TIQUniGridControl;
    wwDBComboDlgEplant: TUniEdit;
    wwDBComboDlgEPlantReportName: TUniEdit;
    wwDataInsReportNames: TwwDataInspector;
    Bevel4: TUniPanel;
    Bevel1: TUniPanel;
    Bevel5: TUniPanel;
    Panel8: TUniPanel;
    Label1: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Bevel2: TUniPanel;
    Label7: TUniLabel;
    Bevel3: TUniPanel;
    Label8: TUniLabel;
    DBEdit1: TUniDBEdit;
    DBLookupComboBox1: TUniDBLookupComboBox;
    DBLookupComboBox2: TUniDBLookupComboBox;
    rbtnWrkCntrOH: TUniRadioButton;
    rbtnLaborOH: TUniRadioButton;
    dbeLaborOHRate: TUniDBEdit;
    dbchkLaborByTA: TUniDBCheckBox;
    BevelGeneral: TUniPanel;
    Label9: TUniLabel;
    lblAssy1ProcessCertification: TUniLabel;
    dbchkFloorDispo: TUniDBCheckBox;
    dbchkNonRTBkFlsh: TUniDBCheckBox;
    dbchkFabAutoLogin: TUniDBCheckBox;
    dbchkFabPasswordOnLogin: TUniDBCheckBox;
    dbchkRTCountScanBased: TUniDBCheckBox;
    dbchkAssy1FinalNoSuperReq: TUniDBCheckBox;
    wwDBComboBoxProcessCertification: TUniDBComboBox;
    dbchkIncludeScrapInByProduct: TUniDBCheckBox;
    pnlDispoLocations: TUniPanel;
    Label12: TUniLabel;
    Label13: TUniLabel;
    wwDBComboDlgDispoLocIN: TUniEdit;
    wwDBComboDlgDispoLocOUT: TUniEdit;
    Table1CR_TA_MSG_REPORT: TStringField;
    Table1ASSY1_DATA_REPORT: TStringField;
    Table1ASSY1_TRAVELER_REPORT: TStringField;
    Table1ASSY1_TOTE_REPORT: TStringField;
    QryMfgtypeEPlantRepREPORT_KIND: TStringField;
    QryMfgtypeEPlantRepREPORT_NAME: TStringField;
    QryMfgtypeEPlantRepFIELD_NAME: TStringField;
    wwDBComboBoxReportKind: TUniDBComboBox;
    Bevel6: TUniPanel;
    Table1FIXED_ELEMENTS_ID_OH: TBCDField;
    Table1FIXED_LABOR_BASED_OH_RATE: TFMTBCDField;
    Label2: TUniLabel;
    DBLookupComboBox3: TUniDBLookupComboBox;
    Label3: TUniLabel;
    Table1FixedOverheadElem: TStringField;
    QryElemFixedOH: TFDQuery;
    Label11: TUniLabel;
    Label14: TUniLabel;
    dbeLaborFixedOHRate: TUniDBEdit;
    Table1ASSY1_USE_PERCENT_COMPLETE: TStringField;
    dbchkAssy1UsePercentComplete: TUniDBCheckBox;
    Table1LOGICAL_WORK_CENTER_SUPPORT: TStringField;
    dbchkLogicalWorkCenterSupport: TUniDBCheckBox;
    dbchkAssy3BackflushProcess: TUniDBCheckBox;
    Table1ASSY3_BACKFLUSH_EACH_PROCESS: TStringField;
    Table1ASSY1_FINAL_ASSY_ON_PROCESS: TStringField;
    dbchkAssy1FinalAssyOnProcess: TUniDBCheckBox;
    dbchkUseYieldOnBOM: TUniDBCheckBox;
    Table1USE_YIELD_ON_BOM: TStringField;
    Table1DONOT_ROUNDUP_DEPENDENT: TStringField;
    dbchkDoNotRoundUpDependent: TUniDBCheckBox;
    pnlShiftBackflushRule: TUniPanel;
    Label15: TUniLabel;
    wwDBComboBoxShiftBackflushRule: TUniDBComboBox;
    Table1SHIFT_BACKFLUSH_RULE: TStringField;
    Table1USE_LABOR_RATE_FOR_ACT_LABOR: TStringField;
    dbchkUseLaborRateActLabor: TUniDBCheckBox;
    dbchkTForm2StdCostBasedPtWt: TUniDBCheckBox;
    Table1TFORM2_STD_COST_BASED_PTWT: TStringField;
    Table1ASSY1_CONSUME_MAT_BY_PROCESS: TStringField;
    dbchkConsumeMaterialByProcess: TUniDBCheckBox;
    pnlDefaultUOM: TUniPanel;
    lblDefaultUOM: TUniLabel;
    wwDBComboBoxDefaultUOM: TUniDBComboBox;
    Table1DEFAULT_UOM: TStringField;
    AppDef1: TIQWebAppDef;
    dbchkAddFloorDispoOut: TUniDBCheckBox;
    Table1PROD_REP_ADD_FLOOR_DISPO_OUT: TStringField;
    Label16: TUniLabel;
    Label17: TUniLabel;
    Label18: TUniLabel;
    dbeFutureRate: TUniDBEdit;
    dbeBudgetRate: TUniDBEdit;
    dbeForecastRate: TUniDBEdit;
    Table1FORECAST_LABOR_RATE: TFMTBCDField;
    Table1BUDGET_LABOR_RATE: TFMTBCDField;
    Table1FUTURE_LABOR_RATE: TFMTBCDField;
    Table1LABELS_CONTROL_MTO_DISPO: TStringField;
    pnlUseSNToControlMTO: TUniPanel;
    Label19: TUniLabel;
    wwDBComboBoxUseSNToControlMTO: TUniDBComboBox;
    FDUpdateSQLMfgType: TFDUpdateSQL;
    Table1OVERHEAD_POSTED_BY_TA: TStringField;
    dbchkOverheadByTA: TUniDBCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    { TODO -oathite -cWebConvert : OnDrwaColumn Having different signature
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState); }
    procedure FormActivate(Sender: TObject);
    procedure sbtnMfgConvClick(Sender: TObject);
    procedure CheckDelKey(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure AssignIsOHLaborBased(Sender: TObject);
    procedure dbchkRTCountScanBasedClick(Sender: TObject);
    procedure dbChkMultiCBsClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure AlterLbsKCalculation1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure Table1BeforePost(DataSet: TDataSet);
    { TODO -oathite -cWebConvert : Undeclared identifier: 'TNavigateBtn'
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn); }
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure QryMfgtypeEPlantRepBeforePost(DataSet: TDataSet);
    procedure QryMfgtypeEPlantRepNewRecord(DataSet: TDataSet);
    procedure wwDBComboDlgEplantCustomDlg(Sender: TObject);
    procedure wwDBComboDlgEPlantReportNameCustomDlg(Sender: TObject);
    procedure wwDBComboDlgStandardMfgTypeCustomDlg(Sender: TObject);
    procedure PkStandardMfgTypeFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure wwDBComboDlgStandardMfgTypeKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Table1BeforeInsert(DataSet: TDataSet);
    procedure Table1CalcFields(DataSet: TDataSet);
    procedure AssignLocation(Sender: TObject);
    procedure CheckDeleteKey(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AssignMfgtypeReport(Sender: TwwDataInspector;
      Item: TwwInspectorItem);
    procedure QryMfgtypeEPlantRepUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure wwDBComboBoxReportKindDropDown(Sender: TObject);
    procedure CheckEplantSpecificDeleteKey(Sender: TObject; var Key: Word;
      Shift: TShiftState);
      { TODO -oathite -cWebConvert : Undeclared identifier: 'TNavigateBtn'
    procedure navEplantReportsBeforeAction(Sender: TObject;
      Button: TNavigateBtn); }
    procedure QryMfgtypeEPlantRepAfterPost(DataSet: TDataSet);
    procedure wwDBComboBoxDefaultUOMDropDown(Sender: TObject);
    procedure wwDBComboBoxDefaultUOMCloseUp(Sender: TUniDBComboBox;
      Select: Boolean);
    procedure Table1BeforeScroll(DataSet: TDataSet);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure dbchkLaborByTAClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure wwDBComboBoxReportKindCloseUp(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { private declarations }
    FDefaultUOM: string;
    bDataChanging: boolean; // EIQ-4687 This is to suppress the warning about clicking dbchkRTCountScanBased
    FFormIsLoaded: Boolean;
    FATable: TDataSet;
    procedure AssignReportNameTo( AField: TField );
    procedure PopulatePredefinedMfgTypeGridDropDownList;
    procedure CheckAssy1ProcessCertificationDefault;
    function ReportKindToFieldName(AReportKind: string): string;
    procedure SetCombBoxUOM;
    procedure StackControls;
    function CanPostOverheadFromTA: Boolean;
    procedure SetATable(const Value: TDataSet);
  public
    { public declarations }
    property ATable:TDataSet read FATable write SetATable;
    class function IsPredefinedMfgType( AMfgType: string ): Boolean;
  end;

procedure DoEditMfgType( ATable:TDataSet );

implementation

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  LbsK_Dlg,
  mfg_add,
  Mfg_Conv,
  IQMS.Common.MfgShare,
  IQMS.COmmon.SetPlant,
  System.Variants;

{$R *.DFM}

procedure DoEditMfgType( ATable:TDataSet );
var
  LMfgModi : TMfgModi;
begin
  LMfgModi := TMfgModi.Create( uniGUIApplication.UniApplication );
  LMfgModi.ATable := ATable;
  LMfgModi.ShowModal;
end;

procedure TMfgModi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, ScrollBox1, gridEPlantReport, DBGrid1 ]);
end;

procedure TMfgModi.FormShow(Sender: TObject);
begin
  FFormIsLoaded:= TRUE;
end;

procedure TMfgModi.PopulatePredefinedMfgTypeGridDropDownList;
var
  AColumn: TUniBaseDBGridColumn;
  I: Integer;
begin
  AColumn:= nil;
  for I:= 0 to DBGrid1.Columns.Count - 1 do
    if DBGrid1.Columns[I].Field =  Table1MFGTYPE then
    begin
      AColumn:= DBGrid1.Columns[I];
      BREAK;
    end;
  if AColumn = nil then
  begin
    IQWarning('Unable to populate predefined MfgType list.');
    EXIT;
  end;

  AColumn.PickList.Clear;
  for I:= 0 to High(IQMS.Common.MfgShare.IQPredefinedMfgType) do
    AColumn.PickList.Add( IQMS.Common.MfgShare.IQPredefinedMfgType[ I ]);
end;


procedure TMfgModi.CheckAssy1ProcessCertificationDefault;
begin
  if SelectValueAsString('select assy1_process_certification from mfgtype where mfgtype = ''ASSY1''') = '' then
     ExecuteCommand('update mfgtype set assy1_process_certification = ''J'' where mfgtype = ''ASSY1''');
  if SelectValueAsString('select assy1_process_certification from mfgtype where mfgtype = ''ASSY2''') = '' then
     ExecuteCommand('update mfgtype set assy1_process_certification = ''J'' where mfgtype = ''ASSY2''');
  if SelectValueAsString('select assy1_process_certification from mfgtype where mfgtype = ''ASSY3''') = '' then
     ExecuteCommand('update mfgtype set assy1_process_certification = ''J'' where mfgtype = ''ASSY3''');
end;

procedure TMfgModi.AssignReportNameTo( AField: TField );
begin
  if Assigned(AField) then
    with OpenDialog1 do
    begin
      InitialDir:= IQGetReportsPath;
      FileName  := AField.asString;
      if Execute then
      begin
         if not Empty( FileName ) and not FileExists( FileName ) then
            raise Exception.Create(Format('File %s not found', [FileName]));
         with AField, DataSet do
         begin
           Edit;
           AsString:= ExtractFileName(FileName);
         end;
      end;
    end;
end;

procedure TMfgModi.SpeedButton1Click(Sender: TObject);
begin
  if IQConfirmYN('Assign default report names?') then
  begin
    ExecuteCommand(  'update mfgtype '                                         +
             ' set WO_REPORT  = decode(rtrim(nvl(standard_mfgtype, mfgtype)), '  +
             '                  ''BLOWMOLD'',   ''BmWrkOrd.rpt'',     ' +
             '                  ''GENERIC'',    ''GnWrkOrd.rpt'',     ' +
             '                  ''INJECTION'',  ''InWrkOrd.rpt'',     ' +
             '                  ''DIECAST'',    ''DCWRKORD.RPT'',     ' +
             '                  ''OUTSOURCE'',  ''OsWrkOrd.rpt'',     ' +
             '                  ''ROTATIONAL'', ''RoWrkOrd.rpt'',     ' +
             '                  ''THERMOSET'',  ''ThWrkOrd.rpt'',     ' +
             '                  ''EXTRUSION'',  ''ExWrkOrd.rpt'',     ' +
             '                  ''EXTRUSION2'', ''Ext2WrkOdr.rpt'',   ' +
             '                  ''EXTRUSION3'', ''Ext3wrkord.rpt'',   ' +
             '                  ''JOBSHOP'',    ''JSwrkord.rpt'',     ' +
             '                  ''MBATCH'',     ''Mbwrkord.rpt'',     ' +
             '                  ''THERMOFORM'', ''Thfrmwrkord.rpt'',  ' +
             '                  ''TFORM2'',     ''Tform2wrkord.rpt'', ' +
             '                  ''ASSY1'',      ''Assy1wrkord.rpt'',  ' +
             '                  ''ASSY2'',      ''Assy1wrkord.rpt'',  ' +
             '                  ''ASSY3'',      ''Assy1wrkord.rpt'',  ' +
             '                  ''SFOAM'',      ''SFoamWrkord.rpt'',  ' +
             '                  ''COMPOUND1'',  ''Compound1Wrkord.rpt'', ' +
             '                  ''GnWrkOrd.rpt''), '                    +
             '     BOM_REPORT = decode(rtrim(nvl(standard_mfgtype, mfgtype)), ' +
             '                  ''BLOWMOLD'',   ''Blw_Cnfg.rpt'',    ' +
             '                  ''GENERIC'',    ''Gen_Cnfg.rpt'',    ' +
             '                  ''INJECTION'',  ''BOM_Cnfg.rpt'',    ' +
             '                  ''DIECAST'',    ''DIE_CNFG.RPT'',    ' +
             '                  ''OUTSOURCE'',  ''Out_Cnfg.rpt'',    ' +
             '                  ''ROTATIONAL'', ''Rot_Cnfg.rpt'',    ' +
             '                  ''THERMOSET'',  ''Ths_Cnfg.rpt'',    ' +
             '                  ''EXTRUSION'',  ''Ext_Cnfg.RPT'',    ' +
             '                  ''EXTRUSION2'', ''Ext_Cnfg2.RPT'',   ' +
             '                  ''EXTRUSION3'', ''EXT3_cnfg.RPT'',   ' +
             '                  ''MBATCH'',     ''Mb_cnfg.rpt'',     ' +
             '                  ''THERMOFORM'', ''Thfrm_cnfg.rpt'',  ' +
             '                  ''TFORM2'',     ''Tform2_cnfg.rpt'', ' +
             '                  ''ASSY1'',      ''ASSY1_cnfg.rpt'',  ' +
             '                  ''ASSY2'',      ''ASSY1_cnfg.rpt'',  ' +
             '                  ''ASSY3'',      ''ASSY1_cnfg.rpt'',  ' +
             '                  ''SFOAM'',      ''SFoam_cnfg.rpt'',  ' +
             '                  ''COMPOUND1'',  ''Compound1_cnfg.rpt'', ' +
             '                  ''Gen_Cnfg.RPT'')' );
    Table1.Refresh;
  end;
end;

   { TODO -oathite -cWebConvert : OnDrwaColumnCell Having different signature
procedure TMfgModi.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  i, j:Integer;
begin
  if Column.Field = Table1STANDARD_MFGTYPE then
     EXIT;

  j := -1;
  for i := 0 to DBGrid1.Columns.Count - 1 do
    if DBGrid1.Columns[i].Field = DBGrid1.DataSource.DataSet.FieldByName('MFGTYPE') then
    begin
      j := i;
      Break;
    end;
  if j < 0 then Exit;
  if DBGrid1.Columns[j].Picklist.IndexOf(DBGrid1.DataSource.DataSet.FieldByName('MFGTYPE').asString) = -1 then
  begin
     if gdSelected in State then
        begin
          (Sender as TUniDBGrid).Canvas.Brush.Color:= clRed;
          (Sender as TUniDBGrid).Canvas.Font.Color := clYellow;
        end
     else
        begin
          (Sender as TUniDBGrid).Canvas.Brush.Color:= clWhite;
          (Sender as TUniDBGrid).Canvas.Font.Color := clRed;
        end;

     (Sender as TUniDBGrid).DefaultDrawColumnCell( Rect, DataCol, Column, State );
  end;
end; }

procedure TMfgModi.FormActivate(Sender: TObject);
begin
//  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch5{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TMfgModi.sbtnMfgConvClick(Sender: TObject);
begin
  DoShowMfgConv( DataSource1 );  {Mfg_Conv}
end;

procedure TMfgModi.CheckDelKey(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Sender is TUniDBLookupComboBox) then
    with Sender as TUniDBLookupComboBox do
    begin
      Key:= 0;
      with DataSource.Dataset do
      begin
        Edit;
        FieldByName( FieldByName( DataField ).KeyFields ).Clear;
      end;
    end;
end;

procedure TMfgModi.DataSource1DataChange(Sender: TObject; Field: TField);
var
  ANotifyEvent: TNotifyEvent;
  ALookupMfgType: string;
begin
  {prevent calling OnClick event of the rbtnLaborOH and rbtnWrkCntrOH radiobuttons}
  ANotifyEvent         := rbtnLaborOH.OnClick;
  rbtnLaborOH.OnClick  := NIL;
  rbtnWrkCntrOH.OnClick:= NIL;
  try
    if Table1IS_LABOR_BASED_OH.asString = 'Y' then
       rbtnLaborOH.Checked:= TRUE
    else
       rbtnWrkCntrOH.Checked:= TRUE
  finally
    rbtnLaborOH.OnClick  := ANotifyEvent;
    rbtnWrkCntrOH.OnClick:= ANotifyEvent;
  end;
  IQEnableControl( dbeLaborOHRate, rbtnLaborOH.Checked );
  IQEnableControl( dbeLaborFixedOHRate, rbtnLaborOH.Checked );
  IQEnableControl( dbchkOverheadByTA, CanPostOverheadFromTA());

  ALookupMfgType:= Nz( Table1STANDARD_MFGTYPE.asString, Table1MFGTYPE.asString );

  {dbchkNonRTBkFlsh}
  dbchkFloorDispo.Visible := not StrInList( ALookupMfgType, ['ASSY1', 'ASSY2', 'ASSY3']);
  dbchkNonRTBkFlsh.Visible:= dbchkFloorDispo.Visible
                             and dbchkFloorDispo.Checked
                             and not StrInList( ALookupMfgType, ['ASSY1', 'ASSY2', 'ASSY3']);

  AlterLbsKCalculation1.Enabled:= StrInList( ALookupMfgType, ['INJECTION', 'DIECAST']);  // Table1MFGTYPE.asString = 'INJECTION';

  dbchkFabAutoLogin.Visible:= ALookupMfgType = 'FAB'; // or (Table1MFGTYPE.asString = 'ASSEMBLY');
  dbchkFabPasswordOnLogin.Visible:= ALookupMfgType = 'FAB';
  dbchkRTCountScanBased.Visible:= not StrInList( ALookupMfgType, ['ASSY1', 'ASSY2', 'ASSY3', 'JOBSHOP', 'OUTSOURCE' ]);
  dbchkAssy1FinalNoSuperReq.Visible:= StrInList( ALookupMfgType, ['ASSY1', 'ASSY2', 'ASSY3']);
  dbchkAssy1FinalAssyOnProcess.Visible:= StrInList( ALookupMfgType, [ 'ASSY1', 'ASSY2' ]);

  // 09-17-2010
  dbchkLogicalWorkCenterSupport.Visible:= ALookupMfgType = 'INJECTION';

  // 01-15-2009
  lblAssy1ProcessCertification.Visible    := StrInList( Table1MFGTYPE.asString, ['ASSY1' ]);
  wwDBComboBoxProcessCertification.Visible:= StrInList( Table1MFGTYPE.asString, ['ASSY1' ]);
  pnlDispoLocations.Visible:= StrInList( ALookupMfgType, ['ASSY1', 'ASSY2', 'ASSY3']);
  dbchkAssy1UsePercentComplete.Visible:= StrInList( ALookupMfgType, ['ASSY1', 'ASSY2']);
  dbchkConsumeMaterialByProcess.Visible:= dbchkAssy1UsePercentComplete.Visible;

  // 04-01-2009
  dbchkIncludeScrapInByProduct.Visible:= Table1MFGTYPE.asString = 'THERMOFORM';

  dbchkAssy3BackflushProcess.Visible:= ALookupMfgType = 'ASSY3';
  dbchkUseYieldOnBOM.Visible:= ALookupMfgType <> 'FAB';
  dbchkDoNotRoundUpDependent.Visible:= not StrInList( ALookupMfgType, ['MBATCH', 'JOBSHOP', 'MBATCH2']);

  pnlShiftBackflushRule.Visible:= StrInList( ALookupMfgType,
                                             ['INJECTION', 'BLOWMOLD', 'EXTRUSION', 'EXTRUSION2', 'EXTRUSION3', 'ROTATIONAL', 'SFOAM', 'STAMPING','THERMOSET', 'DIECAST']);

  pnlDefaultUOM.Visible:= ALookupMfgType = 'SLITTING';

  dbchkTForm2StdCostBasedPtWt.Visible:= ALookupMfgType = 'TFORM2';

  dbchkAddFloorDispoOut.Visible:= not StrInList( ALookupMfgType, ['ASSY1', 'ASSY2', 'ASSY3']);

  StackControls;

  IQMS.Common.Controls.IQEnableControl( rbtnWrkCntrOH, not StrInList( ALookupMfgType, ['ASSY1', 'ASSY2', 'ASSY3']));
  if StrInList( ALookupMfgType, ['ASSY1', 'ASSY2', 'ASSY3']) and (Table1.State in [dsEdit, dsInsert]) and not rbtnLaborOH.Checked then
  begin
    rbtnLaborOH.Checked:= TRUE;
    AssignIsOHLaborBased( nil );
  end;

  pnlDetails.Visible:= ALookupMfgType <> 'PM';

  wwDataInsReportNames.GetItemByTagString( 'CR_TA_MSG_REPORT'      ).Visible:= StrInList( ALookupMfgType, [ 'ASSY1', 'ASSY2', 'ASSY3']);
  wwDataInsReportNames.GetItemByTagString( 'ASSY1_DATA_REPORT'     ).Visible:= StrInList( ALookupMfgType, [ 'ASSY1', 'ASSY2', 'ASSY3']);
  wwDataInsReportNames.GetItemByTagString( 'ASSY1_TRAVELER_REPORT' ).Visible:= StrInList( ALookupMfgType, [ 'ASSY1', 'ASSY2', 'ASSY3']);
  wwDataInsReportNames.GetItemByTagString( 'ASSY1_TOTE_REPORT'     ).Visible:= StrInList( ALookupMfgType, [ 'ASSY1', 'ASSY2', 'ASSY3']);

end;

procedure TMfgModi.StackControls;
begin
  StackUpControlsA( BevelGeneral.Top+7, 17, [ lblAssy1ProcessCertification, wwDBComboBoxProcessCertification,
                                              pnlDispoLocations,
                                              pnlShiftBackflushRule,
                                              pnlDefaultUOM,
                                              dbchkAssy1FinalAssyOnProcess,
                                              dbchkFloorDispo, dbchkNonRTBkFlsh, dbchkFabAutoLogin,
                                              dbchkFabPasswordOnLogin, dbchkRTCountScanBased, dbchkAssy1FinalNoSuperReq,
                                              dbchkIncludeScrapInByProduct, dbchkAssy1UsePercentComplete, dbchkConsumeMaterialByProcess, dbchkLogicalWorkCenterSupport,
                                              dbchkAssy3BackflushProcess,
                                              dbchkUseYieldOnBOM,
                                              dbchkDoNotRoundUpDependent,
                                              dbchkTForm2StdCostBasedPtWt,
                                              dbchkAddFloorDispoOut,
                                              pnlUseSNToControlMTO ]);  {IQCtrl}
end;

procedure TMfgModi.AssignIsOHLaborBased(Sender: TObject);
begin
  with Table1 do
  begin
    {prevent update on the radio button in the OnDatahange event}
    DataSource1.OnDataChange:= NIL;
    try
      Edit;
    finally
      DataSource1.OnDataChange:= DataSource1DataChange;
    end;
    Table1IS_LABOR_BASED_OH.asString:= IIf( rbtnLaborOH.Checked, 'Y', 'N' );
    IQEnableControl( dbeLaborOHRate, rbtnLaborOH.Checked );
    IQEnableControl( dbeLaborFixedOHRate, rbtnLaborOH.Checked );
    IQEnableControl( dbchkOverheadByTA, CanPostOverheadFromTA())
  end;
end;

procedure TMfgModi.dbchkRTCountScanBasedClick(Sender: TObject);
begin
{
  EIQ-4687 Create warning message for 'RT Parts to go based on scans' option – Ferguson Production – CRM# 1080400
  It is necessary for this to distinguish when this method is called by the dbchkRTCountScanBased rather than any
  of the others.  So, I separated this one out and put the error message in this one and the others get to use
  the original version.
}

  { TODO -oathite -cWebConvert : There is no overloaded version of 'MessageDlg' that can be called with these arguments
  if (self.Visible) and (PageControl1.ActivePage = TabSheet3) and (not bDataChanging) then
    MessageDlg('You must close and reopen the RTServer.exe for this to take effect.', mtWarning, [mbOK], 0);  }
  dbChkMultiCBsClick(Sender);
end;

procedure TMfgModi.dbchkLaborByTAClick(Sender: TObject);
begin
  if FFormIsLoaded then
     IQEnableControl( dbchkOverheadByTA, CanPostOverheadFromTA());
end;

procedure TMfgModi.dbChkMultiCBsClick(Sender: TObject);
begin

  // IQEnableControl( dbchkNonRTBkFlsh, dbchkFloorDispo.Checked );
  dbchkNonRTBkFlsh.Visible:= dbchkFloorDispo.Checked;

  StackControls;

end;

procedure TMfgModi.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TMfgModi.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TMfgModi.AlterLbsKCalculation1Click(Sender: TObject);
begin
  AlterLbsKCalculationDialog; {LbsK_Dlg.pas}
end;

procedure TMfgModi.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );  {IQMS.Common.HelpHook.pas}
end;

procedure TMfgModi.Table1BeforePost(DataSet: TDataSet);
begin
  Table1MFGTYPE.asString:= Trim(Table1MFGTYPE.asString);

  if (Table1MFGTYPE.asString = 'MBATCH') and (Table1DESCRIP.asString = '') then
     Table1DESCRIP.asString:= 'MasterBatch';

  if (Table1MFGTYPE.asString = 'MBATCH2') and (Table1DESCRIP.asString = '') then
     Table1DESCRIP.asString:= 'MasterBatch 2';

  if (Table1MFGTYPE.asString = 'TFORM2') and (Table1DESCRIP.asString = '') then
     Table1DESCRIP.asString:= 'Thermoform 2';

  if (Table1MFGTYPE.asString = 'SFOAM') and (Table1DESCRIP.asString = '') then
     Table1DESCRIP.asString:= 'Structural Foam';

  if Table1DESCRIP.asString = '' then
     Table1DESCRIP.asString:= ProperCase(Table1MFGTYPE.asString);

  if (Table1FLOOR_DISPO_ON_CLOCK_OUT.asString <> 'Y') and (Table1NON_RT_BACKFLUSH.asString = 'Y') then
     Table1NON_RT_BACKFLUSH.asString:= 'N';

  if StrInList( Nz( Table1STANDARD_MFGTYPE.asString, Table1MFGTYPE.asString ), ['ASSY1', 'ASSY2', 'ASSY3']) then
     Table1IS_LABOR_BASED_OH.asString:= 'Y';

  if Table1ASSY1_USE_PERCENT_COMPLETE.asString <> 'Y' then
     Table1ASSY1_CONSUME_MAT_BY_PROCESS.asString:= 'N';

  if not CanPostOverheadFromTA() then
     Table1OVERHEAD_POSTED_BY_TA.Clear;
end;

procedure TMfgModi.Table1BeforeScroll(DataSet: TDataSet);
begin
  bDataChanging := true; // EIQ-4687 This is to suppress the warning about clicking dbchkRTCountScanBased

end;

{ TODO -oathite -cWebConvert : 'TNavigateBtn' is not a type identifier
procedure TMfgModi.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end; }

procedure TMfgModi.ApplyUpdates(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
end;

procedure TMfgModi.QryMfgtypeEPlantRepBeforePost(DataSet: TDataSet);

  procedure CheckMfgtypeEplantUniqueReport( AMfgtype_Eplant_Report_ID: Real; AMfgtype: string; AEPlant_ID: Real );
  var
    AID: Real;
  begin
    AID:= SelectValueFmtAsFloat('select id from mfgtype_eplant_report where rtrim(mfgtype) = rtrim(''%s'') and eplant_id = %f',
                  [ AMfgtype,
                    AEPlant_ID ]);
    if (AID > 0) and (AID <> AMfgtype_Eplant_Report_ID) then
       raise Exception.Create('Duplicated mfgtype/eplant entry.');
  end;

begin
  // IQAssignIDBeforePost( DataSet, 'mfgtype_eplant_report' );
  // IQAssert( (QryMfgtypeEPlantRepBOM_REPORT.asString <> '') or (QryMfgtypeEPlantRepWO_REPORT.asString <> ''), 'BOM or Workorder report name must be assigned');
  // CheckMfgtypeEplantUniqueReport( QryMfgtypeEPlantRepID.asFloat, QryMfgtypeEPlantRepMFGTYPE.asString, QryMfgtypeEPlantRepEPLANT_ID.asFloat );

  QryMfgtypeEPlantRepFIELD_NAME.asString:= ReportKindToFieldName( QryMfgtypeEPlantRepREPORT_KIND.asString );
  IQAssert( QryMfgtypeEPlantRepFIELD_NAME.asString > '', 'Invalid Report Kind - operation aborted ...');
end;

function TMfgModi.ReportKindToFieldName( AReportKind: string ): string;
begin
  if      AReportKind =  'BOM Report'           then Result:= 'BOM_REPORT'
  else if AReportKind =  'WO Report'            then Result:= 'WO_REPORT'
  else if AReportKind =  'Assembly Data'        then Result:= 'ASSY1_DATA_REPORT'
  else if AReportKind =  'ASSY1 Traveler'       then Result:= 'ASSY1_TRAVELER_REPORT'
  else if AReportKind =  'ASSY1 Labor Schedule' then Result:= 'CR_TA_MSG_REPORT'
  else if AReportKind =  'ASSY1 Tote Label'     then Result:= 'ASSY1_TOTE_REPORT'
  else Result:= '';
end;

procedure TMfgModi.QryMfgtypeEPlantRepNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('mfgtype').asString:= Table1MFGTYPE.asString;
  if SecurityManager.EPlant_ID_AsFloat > 0 then
  begin
     DataSet.FieldByName('eplant_id').ReadOnly:= FALSE;
     DataSet.FieldByName('eplant_id').asFloat := SecurityManager.EPlant_ID_AsFloat;
     DataSet.FieldByName('eplant_id').ReadOnly:= TRUE;
  end;
end;

procedure TMfgModi.wwDBComboDlgEplantCustomDlg(Sender: TObject);
begin
  DoChangePlantID( QryMfgtypeEPlantRep ); { IQMS.COmmon.SetPlant.pas}
end;

procedure TMfgModi.wwDBComboDlgEPlantReportNameCustomDlg(Sender: TObject);
begin
  AssignReportNameTo( QryMfgtypeEPlantRepREPORT_NAME );
end;

class function TMfgModi.IsPredefinedMfgType(AMfgType: string): Boolean;
begin
  Result:= IQMS.Common.MfgShare.IsPredefinedMfgType(AMfgType);
end;

procedure TMfgModi.wwDBComboDlgStandardMfgTypeCustomDlg(Sender: TObject);
begin
   with PkStandardMfgType do
     if Execute then
     begin
        Table1.Edit;
        Table1STANDARD_MFGTYPE.asString:= Trim(GetValue('mfgtype'));
     end;
end;

procedure TMfgModi.PkStandardMfgTypeFilterRecord(DataSet: TDataSet;  var Accept: Boolean);
begin
  Accept:= IsPredefinedMfgType( DataSet.FieldByName('mfgtype').asString );
end;

procedure TMfgModi.wwDBComboDlgStandardMfgTypeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    Table1.Edit;
    Table1STANDARD_MFGTYPE.Clear;
    Key:= 0;
  end;
end;

procedure TMfgModi.Table1AfterPost(DataSet: TDataSet);
begin
  Table1.Refresh;  // FireDAC displays duplicates
end;

procedure TMfgModi.Table1AfterScroll(DataSet: TDataSet);
begin
  bDataChanging := false; // EIQ-4687 This is to suppress the warning about clicking dbchkRTCountScanBased

end;

procedure TMfgModi.Table1BeforeInsert(DataSet: TDataSet);
var
  AMfgType          : string;
  AMfgType_Standard : string;
  AIs_Labor_Based_OH: string;
  ADescrip          : string;
  AProcCertification: string;
begin
  if not TFrmMfg_Add.DoShowModal( AMfgType, AMfgType_Standard ) then  // mfg_add.pas
     ABORT;

  if  AMfgType = 'MBATCH' then
      ADescrip:= 'MasterBatch'
  else if AMfgType = 'MBATCH2' then
      ADescrip:= 'MasterBatch 2'
  else if AMfgType = 'TFORM2' then
      ADescrip:= 'Thermoform 2'
  else if AMfgType = 'SFOAM' then
      ADescrip:= 'Structural Foam'
  else
      ADescrip:= AMfgType;

  // add mfgtype
  AIs_Labor_Based_OH:= BoolToYN( StrInList( Nz( AMfgType_Standard, AMfgType ), ['ASSY1', 'FAB', 'ASSY2', 'ASSY3']));
  if StrInList( Nz( AMfgType_Standard, AMfgType ), ['ASSY1', 'FAB', 'ASSY2', 'ASSY3']) then
     AProcCertification:= 'J'
  else
     AProcCertification:= '';

  ExecuteCommandFmt('insert into mfgtype( mfgtype, standard_mfgtype, descrip, is_labor_based_oh, assy1_process_certification ) '+
            'values ( ''%s'', ''%s'', ''%s'', ''%s'', ''%s'' )',
            [ AMfgType,
              AMfgType_Standard,
              ADescrip,
              AIs_Labor_Based_OH,
              AProcCertification ]);

  // refresh and locate
  Reopen(Table1);
  Table1.Locate('mfgtype', AMfgType, []);

  // abort the original insert
  ABORT;
end;

procedure TMfgModi.Table1CalcFields(DataSet: TDataSet);
begin
  if Table1LOCATIONS_ID_IN.asFloat > 0 then
     Table1Loc_Desc_IN.asString := SelectValueByID('loc_desc', 'locations', Table1LOCATIONS_ID_IN.asFloat);

  if Table1LOCATIONS_ID_OUT.asFloat > 0 then
     Table1Loc_Desc_OUT.asString:= SelectValueByID('loc_desc', 'locations', Table1LOCATIONS_ID_OUT.asFloat);
end;

procedure TMfgModi.UniFormCreate(Sender: TObject);
begin
  PopulatePredefinedMfgTypeGridDropDownList;
  CheckAssy1ProcessCertificationDefault;

  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, ScrollBox1, gridEPlantReport, DBGrid1 ]);

  PageControl1.ActivePageIndex:= 0;
end;

procedure TMfgModi.AssignLocation(Sender: TObject);
begin
  with PkLocation do
    if Execute then
    begin
      Table1.Edit;
      if Sender = wwDBComboDlgDispoLocIN then
         Table1LOCATIONS_ID_IN.asFloat:= GetValue('ID')
      else if Sender =  wwDBComboDlgDispoLocOUT then
         Table1LOCATIONS_ID_OUT.asFloat:= GetValue('ID');
    end;
end;

procedure TMfgModi.CheckDeleteKey(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    Table1.Edit;
    if Sender = wwDBComboDlgDispoLocIN then
       Table1LOCATIONS_ID_IN.Clear
    else if Sender = wwDBComboDlgDispoLocOUT then
       Table1LOCATIONS_ID_OUT.Clear;
    if Sender is TUniEdit then
       TUniEdit(Sender).Clear;
  end;
end;

procedure TMfgModi.AssignMfgtypeReport(Sender: TwwDataInspector; Item: TwwInspectorItem);
begin
  if Table1.FindField( Item.TagString ) = nil then
     EXIT;

  Table1.CheckBrowseMode;
  AssignReportNameTo( Table1.FieldByName( Item.TagString ));
  Table1.CheckBrowseMode;
end;

procedure TMfgModi.QryMfgtypeEPlantRepUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  case ARequest of
    arInsert:
       if SelectValueFmtAsFloat('select count(*) from mfgtype_eplant_report where mfgtype = ''%s'' and nvl(eplant_id,0) = %f',
                    [ ASender.FieldByName('mfgtype').asString, ASender.FieldByName('eplant_id').asFloat ]) = 0 then
          ExecuteCommandFmt('insert into mfgtype_eplant_report '+
                    '     ( mfgtype,                   '+
                    '       eplant_id,                 '+
                    '       %s )                       '+  // field name like BOM_REPORT
                    'values                            '+
                    '     ( ''%s'',                    '+  // mfgtype
                    '       %f,                        '+  // eplant_id
                    '       ''%s'')                    ',  // field value like the report file name
                    [ ASender.FieldByName('field_name').asString,
                      ASender.FieldByName('mfgtype').asString,
                      ASender.FieldByName('eplant_id').asFloat,
                      ASender.FieldByName('report_name').asString ])
       else
          ExecuteCommandFmt('update mfgtype_eplant_report      '+
                    '   set                            '+
                    '       eplant_id = %f,            '+
                    '       %s = ''%s''                '+  // field name like BOM_REPORT
                    ' where mfgtype = ''%s''           '+
                    '   and nvl(eplant_id,0) = %f      ',
                    [ ASender.FieldByName('eplant_id').asFloat,
                      ASender.FieldByName('field_name').asString,
                      ASender.FieldByName('report_name').asString,
                      ASender.FieldByName('mfgtype').asString,
                      ASender.FieldByName('eplant_id').asFloat ]);

    arUpdate:
       begin
          if ASender.FieldByName('field_name').OldValue > '' then
             ExecuteCommandFmt('update mfgtype_eplant_report      '+
                       '   set %s = null                  '+  // field name like BOM_REPORT
                       ' where mfgtype = ''%s''           '+
                       '   and nvl(eplant_id,0) = %f      ',
                       [ ASender.FieldByName('field_name').OldValue,
                         ASender.FieldByName('mfgtype').OldValue,
                         DtoF(ASender.FieldByName('eplant_id').OldValue) ]);

          ExecuteCommandFmt('update mfgtype_eplant_report      '+
                    '   set                            '+
                    '       eplant_id = %f,            '+
                    '       %s = ''%s''                '+  // field name like BOM_REPORT
                    ' where mfgtype = ''%s''           '+
                    '   and nvl(eplant_id,0) = %f      ',
                    [ ASender.FieldByName('eplant_id').asFloat,
                      ASender.FieldByName('field_name').asString,
                      ASender.FieldByName('report_name').asString,
                      ASender.FieldByName('mfgtype').OldValue,
                      DtoF(ASender.FieldByName('eplant_id').OldValue) ]);
       end;

    arDelete:
       begin
          // nullify the field
          if ASender.FieldByName('field_name').OldValue > '' then
             ExecuteCommandFmt('update mfgtype_eplant_report      '+
                       '   set %s = null                  '+  // field name like BOM_REPORT
                       ' where mfgtype = ''%s''           '+
                       '   and nvl(eplant_id,0) = %f      ',
                       [ ASender.FieldByName('field_name').OldValue,
                         ASender.FieldByName('mfgtype').OldValue,
                         DtoF(ASender.FieldByName('eplant_id').OldValue) ]);

          // if non of the fields filled in - delete it
          if SelectValueFmtAsFloat('select count(*) from mfgtype_eplant_report           '+
                       ' where mfgtype = ''%s''                              '+
                       '   and nvl(eplant_id,0) = %f                         '+
                       '   and ( bom_report is not null                      '+
                       '         or wo_report is not null                    '+
                       '         or cr_ta_msg_report is not null             '+
                       '         or assy1_data_report is not null            '+
                       '         or assy1_traveler_report is not null        '+
                       '         or assy1_tote_report is not null )          ',
                       [ ASender.FieldByName('mfgtype').OldValue,
                         DtoF(ASender.FieldByName('eplant_id').OldValue) ]) = 0 then

             ExecuteCommandFmt('delete from mfgtype_eplant_report where mfgtype = ''%s'' and nvl(eplant_id,0) = %f',
                       [ ASender.FieldByName('mfgtype').OldValue, DtoF(ASender.FieldByName('eplant_id').OldValue) ]);
       end
  end;

  AAction := eaApplied;
end;

procedure TMfgModi.wwDBComboBoxReportKindDropDown(Sender: TObject);
begin
  wwDBComboBoxReportKind.Items.Clear;

  wwDBComboBoxReportKind.Items.Add('BOM Report');
  wwDBComboBoxReportKind.Items.Add('WO Report');

  if StrInList(Nz( Table1STANDARD_MFGTYPE.asString, Table1MFGTYPE.asString ), ['ASSY1', 'ASSY2', 'ASSY3']) then
  begin
    wwDBComboBoxReportKind.Items.Add('Assembly Data');
    wwDBComboBoxReportKind.Items.Add('ASSY1 Traveler');
    wwDBComboBoxReportKind.Items.Add('ASSY1 Labor Schedule');
    wwDBComboBoxReportKind.Items.Add('ASSY1 Tote Label');
  end;
end;

procedure TMfgModi.wwDBComboBoxDefaultUOMCloseUp(Sender: TUniDBComboBox;
  Select: Boolean);
    function _isWeight(AUOM: string): Boolean;
      begin
        if ((AUOM = 'LBS') or (AUOM = 'GR') or (AUOM = 'OZ')) then
          Result := true
        else
          Result := false;
      end;
begin
  if Select then
    begin
      if (wwDBComboBoxDefaultUOM.ItemIndex > -1) and (_isWeight(FDefaultUOM) and
          not _isWeight(wwDBComboBoxDefaultUOM.Items[wwDBComboBoxDefaultUOM.ItemIndex])) then
        if (SelectValueFmtAsFloat('select count(*) from standard where mfg_type = ''%s''',
          [Table1MFGTYPE.asString]) > 0) then
        begin
          wwDBComboBoxDefaultUOM.ItemIndex := wwDBComboBoxDefaultUOM.Items.IndexOf(FDefaultUOM);
          raise Exception.Create('Unable to change this Mfg Type.  BOMs within this Mfg Type with the prior UOM that cannot be converted.');
        end;
    end;
end;

procedure TMfgModi.wwDBComboBoxDefaultUOMDropDown(Sender: TObject);
begin
  if (wwDBComboBoxDefaultUOM.ItemIndex >= 0) then
    FDefaultUOM := wwDBComboBoxDefaultUOM.Items[wwDBComboBoxDefaultUOM.ItemIndex]
  else
    FDefaultUOM := 'LBS';
end;

procedure TMfgModi.wwDBComboBoxReportKindCloseUp(Sender: TObject);
begin
  wwDBComboBoxReportKind.Items.Clear;
  wwDBComboBoxReportKind.Items.Add('BOM Report');
  wwDBComboBoxReportKind.Items.Add('WO Report');
  wwDBComboBoxReportKind.Items.Add('Assembly Data');
  wwDBComboBoxReportKind.Items.Add('ASSY1 Traveler');
  wwDBComboBoxReportKind.Items.Add('ASSY1 Labor Schedule');
  wwDBComboBoxReportKind.Items.Add('ASSY1 Tote Label');
end;

procedure TMfgModi.CheckEplantSpecificDeleteKey(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Sender = wwDBComboDlgEPlantReportName) then
  begin
    QryMfgtypeEPlantRep.Edit;
    QryMfgtypeEPlantRepREPORT_NAME.Clear;
    Key:= 0;
  end;
end;
{ TODO -oathite -cWebConvert : 'TNavigateBtn' is not a type identifier
procedure TMfgModi.navEplantReportsBeforeAction(Sender: TObject;  Button: TNavigateBtn);
var
  AMfgType   : string;
  AEplant_ID : Real;
  AReportKind: string;
begin
  if Button = nbRefresh then
  begin
    AMfgType   := QryMfgtypeEPlantRepMFGTYPE.asString;
    AEplant_ID := QryMfgtypeEPlantRepEPLANT_ID.asFloat;
    AReportKind:= QryMfgtypeEPlantRepREPORT_KIND.asString;
    Reopen(QryMfgtypeEPlantRep);
    QryMfgtypeEPlantRep.Locate('mfgtype;report_kind;eplant_id', VarArrayOf([ AMfgType, AReportKind, AEplant_ID ]), []);
    ABORT;
  end;
end; }

procedure TMfgModi.QryMfgtypeEPlantRepAfterPost(DataSet: TDataSet);
begin
  // IQApplyUpdateToTable(DataSet);
  { TODO -oathite -cWebConvert : Undeclared identifier: 'BtnClick'
  navEplantReports.BtnClick( nbRefresh );  }
end;

procedure TMfgModi.SetATable(const Value: TDataSet);
begin
  if Assigned(Value) then
     DataSource1.DataSet:= Value;
  DataSource1.DataSet.Open;
end;

procedure TMfgModi.SetCombBoxUOM;
var
  S : string;
  I : Integer;
begin
  inherited;
  S:= AppDef1.Execute('Avail_UOM', [ Table1MFGTYPE.asString ]).asString;  {Lbs;Gr;Oz}
  wwDBComboBoxDefaultUOM.Items.Clear;
  i:= Pos( ';', S );
  while i > 0 do
  begin
    wwDBComboBoxDefaultUOM.Items.Add( Copy( S, 1, i-1 ));
    S:= Copy( S, i+1, Length( S ));
    i:= Pos( ';', S );
  end;
  if S <> '' then
     wwDBComboBoxDefaultUOM.Items.Add( S );
end;

function TMfgModi.CanPostOverheadFromTA: Boolean;
begin
  Result:= rbtnLaborOH.Checked
           and
           // (Table1LABOR_POSTED_BY_TA.asString = 'Y')
           dbchkLaborByTA.Checked
           and
           (GetSwitch('act_cost_posting', 'iqsys') <> 'Y');
end;

end.


