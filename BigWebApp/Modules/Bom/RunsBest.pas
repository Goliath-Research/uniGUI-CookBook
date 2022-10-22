unit RunsBest;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  Mask,
  Vcl.Menus,
  IQMS.WebVcl.DropDownButton,
  IQMS.WebVcl.About,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.UDEmbeddedForm,
  VclTee.TeeGDIPlus,
  VCLTee.TeEngine,
  VCLTee.Series,
  VCLTee.TeeProcs,
  VCLTee.Chart,
  VCLTee.DBChart,
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
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMainMenu,
  uniLabel,
  uniPageControl, Vcl.ExtCtrls, uniComboBox, uniDBComboBox, IQUniGrid,
  uniGUIFrame, uniDateTimePicker, uniDBDateTimePicker;

type
  TFrmRunsTheBest = class(TUniForm)
    Panel3: TUniPanel;
    Panel2: TUniPanel;
    btnCopy: TUniButton;
    Splitter1: TUniSplitter;
    btnLog: TUniButton;
    procCalc_Mfg_Performance: TFDStoredProc;
    Label1: TUniLabel;
    wwdbTmPkFromDate: TUniDBDateTimePicker;
    btnRecalc: TIQWebDropDownButton;
    PopupMenu1: TUniPopupMenu;
    RecalcthisBOM1: TUniMenuItem;
    RecalcRollAllBOMs1: TUniMenuItem;
    QryMfgs: TFDQuery;
    QryMfgsID: TBCDField;
    QryMfgsMFGNO: TStringField;
    QryMfgsEPLANT_ID: TBCDField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    wwSrcRuns_Best: TDataSource;
    wwQryRuns_Best: TFDQuery;
    wwQryRuns_BestID: TBCDField;
    wwQryRuns_BestWORK_CENTER_ID_CALC: TBCDField;
    wwQryRuns_BestSEQ: TBCDField;
    wwQryRuns_BestPERFORMANCE: TBCDField;
    wwQryRuns_BestCAPACITY: TBCDField;
    wwQryRuns_BestCNTR_TYPE: TStringField;
    wwQryRuns_BestEQNO_CALC: TStringField;
    IQSearch1: TIQUniGridControl;
    wwQryRuns_BestCNTR_DESC_CALC: TStringField;
    wwQryWorkCenter: TFDQuery;
    wwQryWorkCenterID: TBCDField;
    wwQryWorkCenterEQNO: TStringField;
    wwQryWorkCenterCNTR_DESC: TStringField;
    wwQryWorkCenterCNTR_TYPE: TStringField;
    wwQryWorkCenterCAPACITY: TBCDField;
    UpdateSQL1: TFDUpdateSQL;
    wwQryWorkCenterEPLANT_ID: TBCDField;
    wwQryRuns_BestSTANDARD_ID: TBCDField;
    wwQryRuns_BestWORK_CENTER_ID_ACT: TBCDField;
    wwDBLookupComboWorkCenter: TUniDBLookupComboBox;
    wwQryRuns_BestCNTR_DESC_ACT: TStringField;
    wwQryRuns_BestEQNO_ACT: TStringField;
    SecurityRegister1: TIQWebSecurityRegister;
    Contents1: TUniMenuItem;
    SrcLocalStandard: TDataSource;
    TblLocalStandard: TFDTable;
    wwQryRuns_BestCOMMENT1: TStringField;
    PageControl1: TUniPageControl;
    tabGraph: TUniTabSheet;
    tabUDForm: TUniTabSheet;
    Panel4: TUniPanel;
    IQUDEmbeddedForm1: TIQWebUDEmbeddedForm;
    wwQryRuns_BestEXCLUDE_AUTOLOAD: TStringField;
    RecalcRollAllBOMsSetFromDate1: TUniMenuItem;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    SrcWorkCenter: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PostParentsBeforeEdit(DataSet: TDataSet);
    procedure btnLogClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnRecalcClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AssignEplantFilter(DataSet: TDataSet);
    procedure RecalcRollAllBOMs1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure wwDBLookupComboWorkCenterCloseUp(Sender: TObject;
      LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure wwQryRuns_BestAfterPost(DataSet: TDataSet);
    { TODO -oathite -cWebConvert : Undeclared identifier: 'TGridDrawState'
    procedure IQSearch1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush); }
    procedure wwQryRuns_BestNewRecord(DataSet: TDataSet);
    procedure wwDBLookupComboWorkCenterDropDown(Sender: TObject);
    procedure wwQryRuns_BestBeforePost(DataSet: TDataSet);
    procedure wwQryRuns_BestBeforeDelete(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure QryMfgsBeforeOpen(DataSet: TDataSet);
    procedure IQSearch1UserBtn1OnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure RecalcRollAllBOMsSetFromDate1Click(Sender: TObject);
  private
    { Private declarations }
    FRuns_BestID: Real;
    FMfgcell_ID: Real;
    FADataSource: TDataSource;
    FRunsBest_ID: Real;
    procedure SetCaption;
    procedure RecalcBOM( AStandard_ID: Real );
    procedure RecalcRollBOMs( AFromDate: TDateTime = 0);
    procedure RollRunsTheBestCalc( AStandard_ID: Real );
    { TODO -oathite -cWebConvert : Undeclared identifier: 'TNavigateBtn'
    procedure IQSearchDBNavBeforeAction(Sender: TObject; Button: TNavigateBtn); }
    procedure StartUp;
    procedure RefreshDatasets;
    procedure SetADataSource(const Value: TDataSource);
    procedure SetRunsBest_ID(const Value: Real);
    procedure SetStandard_ID(const Value: Real);
  public
    { Public declarations }
    procedure DoCreateEx( AStandard_ID, ARunsBest_ID: Real );

    property ADataSource:TDataSource write SetADataSource;
  end;

procedure DoRunsTheBest( ADataSource:TDataSource );
procedure DoRunsTheBestEx( AStandard_ID: Real );
procedure DoRunsTheBestExA( ARunsBest_ID: Real );

implementation

{$R *.DFM}

uses
  bom_rscstr,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQLog,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  { TODO -cWebConvert : Dependent on IQSecIns
  IQSecIns,}
  IQMS.Common.PanelMsg,
  runs_best_docs,
  select_mfgcell;

//procedure DoRunsTheBestEx( AOwner:TComponent; ADataSource:TDataSource; const PKFieldName:string );
//begin
//  TFrmRunsTheBest.Create( AOwner, ADataSource, PKFieldName ).Show;
//end;

procedure DoRunsTheBest( ADataSource:TDataSource );
var
  LFrmRunsTheBest : TFrmRunsTheBest;
begin
  LFrmRunsTheBest := TFrmRunsTheBest.Create( uniGUIApplication.UniApplication );
  LFrmRunsTheBest.ADataSource := ADataSource;
  LFrmRunsTheBest.StartUp;
  LFrmRunsTheBest.ShowModal;
end;

procedure DoRunsTheBestEx( AStandard_ID: Real );
var
  LFrmRunsTheBest : TFrmRunsTheBest;
begin
  LFrmRunsTheBest := TFrmRunsTheBest.Create( uniGUIApplication.UniApplication );
  LFrmRunsTheBest.DoCreateEx( AStandard_ID, 0 );
  LFrmRunsTheBest.Show;
end;

procedure DoRunsTheBestExA( ARunsBest_ID: Real);
var
  AStandard_ID: Real;
  LFrmRunsTheBest : TFrmRunsTheBest;
begin
  AStandard_ID := SelectValueByID( 'standard_id', 'runs_best', ARunsBest_ID);

  LFrmRunsTheBest := TFrmRunsTheBest.Create( uniGUIApplication.UniApplication );
  LFrmRunsTheBest.DoCreateEx( AStandard_ID, ARunsBest_ID );
  LFrmRunsTheBest.Show;
end;


procedure TFrmRunsTheBest.StartUp;
begin
  IQRegFormRead( self, [ self, IQSearch1 ]);
  FormStyle:= fsNormal;

  IQSetTablesActive( TRUE, self );

  { TODO -oathite -cWebConvert : showing Undeclared identifier for all buttons
  IQSearch1.DBNavigator.VisibleButtons:= [ nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh ]; }
  IQSearch1.DBNavigator.Width:= 182;
  { TODO -oathite -cWebConvert : Undeclared identifier: Before action
  IQSearch1.DBNavigator.BeforeAction  := IQSearchDBNavBeforeAction;   }
  { TODO -oathite -cWebConvert : Undeclared identifier: SetControlType
  IQSearch1.DBGrid.SetControlType('EqNo_Act', fctCustom, 'wwDBLookupComboWorkCenter'); }
  IQSearch1.DBGrid.Color:= clBtnFace;

  with wwdbTmPkFromDate do
  begin
    DataSource:= wwQryRuns_Best.DataSource;
    DataField := 'RUNS_BEST_FROM_DATE';
  end;

  SetCaption;
  DBChart1.RefreshData;
end;

procedure TFrmRunsTheBest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  wwQryRuns_Best.CheckBrowseMode;
  if Assigned(wwQryRuns_Best.DataSource) then
  try
     wwQryRuns_Best.DataSource.DataSet.CheckBrowseMode;
  except on E: Exception do
     if wwQryRuns_Best.DataSource.DataSet.State = dsEdit then
        wwQryRuns_Best.DataSource.DataSet.Cancel;
  end;
  IQRegFormWrite( self, [ self, IQSearch1 ]);
  Action:= caFree;
end;

procedure TFrmRunsTheBest.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex:= 0;
end;

{ TODO -oathite -cWebConvert :  Undeclared identifier: 'IQSearchDBNavBeforeAction'
procedure TFrmRunsTheBest.IQSearchDBNavBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    Reopen( wwQryRuns_Best );
    DBChart1.RefreshData;
    ABORT;
  end;
end; }


procedure TFrmRunsTheBest.PageControl1Change(Sender: TObject);
begin
  IQUDEmbeddedForm1.Active:= (PageControl1.ActivePage = tabUDForm);
end;

procedure TFrmRunsTheBest.PostParentsBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit(DataSet);
end;

procedure TFrmRunsTheBest.btnLogClick(Sender: TObject);
begin
  if Assigned(wwQryRuns_Best.DataSource) then
     wwQryRuns_Best.DataSource.DataSet.CheckBrowseMode;
  DoIQLogModal( [ wwQryRuns_BestWORK_CENTER_ID_ACT.asInteger,  {IQLog.pas}
                        wwQryRuns_BestSTANDARD_ID.asInteger ] );
end;

procedure TFrmRunsTheBest.btnCopyClick(Sender: TObject);
begin
  if Assigned(wwQryRuns_Best.DataSource) then
     wwQryRuns_Best.DataSource.DataSet.CheckBrowseMode;
  RollRunsTheBestCalc( wwQryRuns_BestSTANDARD_ID.asFloat  );
  RefreshDataSetByID( wwQryRuns_Best );
end;

procedure TFrmRunsTheBest.btnRecalcClick(Sender: TObject);
var
  AStandard_ID: Real;
begin
  if Assigned(wwQryRuns_Best.DataSource) then
     wwQryRuns_Best.DataSource.DataSet.CheckBrowseMode;

  AStandard_ID:= wwQryRuns_Best.DataSource.DataSet.FieldByName( 'ID' ).asFloat;

  RecalcBOM( AStandard_ID );

  // RefreshDataSetByID( wwQryRuns_Best );
  // DBChart1.RefreshData;
  RefreshDatasets;
end;

procedure TFrmRunsTheBest.SetADataSource(const Value: TDataSource);
begin
  wwQryRuns_Best.DataSource := Value;
end;

procedure TFrmRunsTheBest.SetCaption;
var
  AField:TField;
begin
  if Assigned(wwQryRuns_Best.DataSource) then
  begin
     AField:= wwQryRuns_Best.DataSource.DataSet.FindField('MFGNO');
     if Assigned(AField) then
        Caption:= Format('Runs The Best List for %s', [ AField.asString ]);
  end;
end;


procedure TFrmRunsTheBest.SetRunsBest_ID(const Value: Real);
begin
  FRunsBest_ID := Value;
end;

procedure TFrmRunsTheBest.SetStandard_ID(const Value: Real);
begin
  FStandard_ID := Value;
end;

procedure TFrmRunsTheBest.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmBOM{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmRunsTheBest.AssignEplantFilter(DataSet: TDataSet);
begin
  IQAssignEplantFilter( DataSet );
end;

procedure TFrmRunsTheBest.RecalcBOM( AStandard_ID: Real );
begin
  with procCalc_Mfg_Performance do
  begin
    Close;
    ParamByName('v_standard_id').Value := AStandard_ID;
    ExecProc;
  end;
end;

procedure TFrmRunsTheBest.RollRunsTheBestCalc( AStandard_ID: Real );
begin
  ExecuteCommandFmt('update runs_best set work_center_id_act = work_center_id_calc '+
            'where standard_id = %f and work_center_id_calc is not null',
            [ AStandard_ID ]);
end;

procedure TFrmRunsTheBest.RecalcRollBOMs( AFromDate: TDateTime = 0);
var
  hMsg: TPanelMesg;
begin
  with QryMfgs do
  try
    hMsg:= hPleaseWait('');
    Reopen( QryMfgs );
    while not Eof do
    begin
      hMsg.Mesg:= Format('Processing %s...', [ Trim(QryMfgsMFGNO.asString) ]);
      Application.ProcessMessages;

      if AFromDate > 0 then
         ExecuteCommandFmt('update standard set runs_best_from_date = to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss'') where id = %f',
                   [ FormatDateTime( 'mm/dd/yyyy hh:nn:ss', AFromDate ),
                     QryMfgsID.asFloat ]);

      RecalcBOM( QryMfgsID.asFloat );
      RollRunsTheBestCalc( QryMfgsID.asFloat );

      Next;
    end;
  finally
     hMsg.Free;
  end;
end;

procedure TFrmRunsTheBest.RecalcRollAllBOMsSetFromDate1Click(Sender: TObject);
var
  AFromDate: TDateTime;
begin
  if not Assigned(wwQryRuns_Best.DataSource) then
     EXIT;

  wwQryRuns_Best.DataSource.DataSet.CheckBrowseMode;

  AFromDate:= wwQryRuns_Best.DataSource.DataSet.FieldByName('RUNS_BEST_FROM_DATE').asDateTime;
  IQAssert( AFromDate > 0, '''From Date'' is not assigned - operation aborted');

  if IQConfirmYN('This option assigns the ''From Date'', recalculates Runs the Best for all BOMS and rolls the results over.'#13#13'Continue?') then
     if TFrmSelectMfgCell.DoShowModal( FMfgcell_ID ) then {select_mfgcell.pas}
     begin
       RecalcRollBOMs( AFromDate );
       RefreshDatasets;
     end;
end;


procedure TFrmRunsTheBest.RecalcRollAllBOMs1Click(Sender: TObject);
begin
  if IQConfirmYN('This option recalculates Runs the Best for all BOMS and rolls the results over.'#13#13'Continue?') then
     if TFrmSelectMfgCell.DoShowModal( FMfgcell_ID ) then {select_mfgcell.pas}
     begin
       RecalcRollBOMs;
       RefreshDatasets;
     end;
end;


procedure TFrmRunsTheBest.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmRunsTheBest.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmRunsTheBest.wwDBLookupComboWorkCenterDropDown( Sender: TObject);
begin
  { TODO -oathite -cWebConvert :  Undeclared identifier: 'PerformSearch'
  wwDBLookupComboWorkCenter.PerformSearch; }
end;

procedure TFrmRunsTheBest.wwDBLookupComboWorkCenterCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  wwQryRuns_Best.Edit;
  wwQryRuns_BestWORK_CENTER_ID_ACT.asFloat:= wwQryWorkCenterID.asFloat;

  {Lookup/jointed fields in the query - assign them here}
  wwQryRuns_BestEQNO_ACT.asString     := wwQryWorkCenterEQNO.asString;
  wwQryRuns_BestCNTR_DESC_ACT.asString:= wwQryWorkCenterCNTR_DESC.asString;

  {Text gets blanked out - restore it here}
  wwDBLookupComboWorkCenter.Text:= wwQryRuns_BestEQNO_ACT.asString;
end;

procedure TFrmRunsTheBest.wwQryRuns_BestAfterPost(DataSet: TDataSet);
begin
  // try
  //   wwQryRuns_Best.DataBase.ApplyUpdates( [ wwQryRuns_Best ]);
  //   {After posting the pointer jumps BOF - put it back where it s/b}
  //   if FRuns_BestID > 0 then
  //      wwQryRuns_Best.Locate('ID', FRuns_BestID, []);
  // except on E:Exception do
  //   begin
  //     Application.ShowException( E );
  //     Reopen( wwQryRuns_Best );
  //     System.SysUtils.ABORT;
  //   end;
  // end;

  if FRuns_BestID > 0 then
     wwQryRuns_Best.Locate('ID', FRuns_BestID, []);
end;

{ TODO -oathite -cWebConvert :  Undeclared identifier: 'IQSearch1CalcCellColors'
procedure TFrmRunsTheBest.IQSearch1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if not Highlight and not Field.ReadOnly then
     ABrush.Color:= clWIndow
end; }

procedure TFrmRunsTheBest.wwQryRuns_BestNewRecord(DataSet: TDataSet);
begin
  wwQryRuns_BestSTANDARD_ID.asFloat:= wwQryRuns_Best.DataSource.DataSet.FieldByName( 'ID' ).asFloat;
  wwQryRuns_BestID.asFloat:= GetNextID( 'RUNS_BEST' );
end;

procedure TFrmRunsTheBest.wwQryRuns_BestBeforePost(DataSet: TDataSet);
begin
  //EIQ-6037 Runs Best – add Unique Constraint message CRM # 1172363 Seitz
  //Prevents user from assigning one that has been calculated on another row
  //and lets them assign actual = calc after it has been unassigned then reassigned.

  if ( 1 = SelectValueFmtAsFloat('select 1 from runs_best where work_center_id_calc = %f and standard_id = %f',
               [ wwQryWorkCenterID.asFloat, wwQryRuns_BestSTANDARD_ID.asFloat ]) )
  and not ( wwQryRuns_BestWORK_CENTER_ID_ACT.asFloat = wwQryRuns_BestWORK_CENTER_ID_CALC.asFloat )
  then
  begin
    //Actual work center selected was found among already calculated runs best records for this BOM.'#13#13'Operation aborted!
    IQError( bom_rscstr.cTXT0000035 );
    Reopen( wwQryRuns_Best );
    System.SysUtils.ABORT;
  end;

  FRuns_BestID:= wwQryRuns_BestID.asFloat;
end;

procedure TFrmRunsTheBest.wwQryRuns_BestBeforeDelete(DataSet: TDataSet);
begin
  FRuns_BestID:= 0;
end;

procedure TFrmRunsTheBest.FormShow(Sender: TObject);
begin
{ TODO -cWebConvert : Dependent on IQSecIns
  EnsureSecurityInspectorOnTopOf( self );   }
end;

procedure TFrmRunsTheBest.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1167945 );
end;

procedure TFrmRunsTheBest.DoCreateEx(AStandard_ID, ARunsBest_ID: Real);
begin
  TblLocalStandard.Open;
  if not TblLocalStandard.Locate('ID', AStandard_ID, []) then
     IQWarning(Format('Unable to locate standard_id = %.0f', [ AStandard_ID ]));
  wwQryRuns_Best.DataSource:= SrcLocalStandard;

  StartUp;

  if ARunsBest_ID > 0 then
    wwQryRuns_Best.Locate('ID', ARunsBest_ID, []);
end;

procedure TFrmRunsTheBest.QryMfgsBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  //   ParamByName('mfgcell_id').Value := FMfgcell_ID;
  AssignQueryParamValue(DataSet, 'mfgcell_id', FMfgcell_ID);

  IQAssignEplantFilter( DataSet );
end;

procedure TFrmRunsTheBest.RefreshDatasets;
begin
  RefreshDataSetByID( wwQryRuns_Best );
  DBChart1.RefreshData;
end;

procedure TFrmRunsTheBest.IQSearch1UserBtn1OnClick(Sender: TObject);
begin
  TFrmRunsTheBestDocs.DoShow;  // runs_best_docs.pas
end;

end.
