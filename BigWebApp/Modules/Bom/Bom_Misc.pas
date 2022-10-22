unit Bom_Misc;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Mask,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  Vcl.wwDataInspector,
  IQMS.WebVcl.Hpick,
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
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  uniPageControl, Vcl.Grids;

type
  TFrmBomMiscParam = class(TUniForm)
    DataSource1: TDataSource;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    TabSheet2: TUniTabSheet;
    SrcParams: TDataSource;
    TblParams: TFDTable;
    TblParamsSCHED_SCOPE: TBCDField;
    TblParamsMFG_SCOPE: TBCDField;
    TblParamsEFF_FACTOR: TBCDField;
    TabSheet3: TUniTabSheet;
    TblParamsPLANNING_FENCE: TBCDField;
    PnlLaborRate: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLaborRateLeft: TUniPanel;
    PnlLaborRateClient: TUniPanel;
    Label1: TUniLabel;
    dbeLaborRate: TUniDBEdit;
    btnDefaultLabor: TUniButton;
    PkAlternateItemCode: TIQWebHPick;
    PkAlternateItemCodeID: TBCDField;
    PkAlternateItemCodeCODE: TStringField;
    PkAlternateItemCodeDESCRIP: TStringField;
    Label2: TUniLabel;
    dbeFutureRate: TUniDBEdit;
    Label3: TUniLabel;
    Label4: TUniLabel;
    dbeBudgetRate: TUniDBEdit;
    dbeForecastRate: TUniDBEdit;
    TblParamsID: TBCDField;
    SR: TIQWebSecurityRegister;
    wwDataInspector1: TwwDataInspector;
    wwDataInspector2: TwwDataInspector;
    wwDBComboDlgAlternateItemCode: TUniEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnDefaultLaborClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure wwDBComboDlgAlternateItemCodeCustomDlg(Sender: TObject);
    procedure wwDBComboDlgAlternateItemCodeKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
  private
    FTable: TFDTable;
    { Private declarations }
     procedure ValidateScopes( RunScope, SchedScope : Real );
    procedure SetTable(const Value: TFDTable);
  public
    { Public declarations }
    property Table:TFDTable write SetTable;

  end;

procedure DoBomMiscParam(ATable:TFDTable );

implementation

{$R *.DFM}

uses
  bom_rscstr,
  heijunka_share,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
{ TODO -oGPatil -cWebConvert : Dependency on IQSecins.pas File
  IQSecIns,  }
  IQMS.Common.StringUtils,
  IQMS.Common.MfgShare,
  System.Variants;

procedure DoBomMiscParam(ATable:TFDTable );
var
  LFrmBomMiscParam : TFrmBomMiscParam;
begin
  LFrmBomMiscParam := TFrmBomMiscParam.Create(UniGUIApplication.UniApplication);
  LFrmBomMiscParam.Table:=ATable;
  LFrmBomMiscParam.ShowModal;
end;

procedure TFrmBomMiscParam.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, PnlLaborRateLeft]);
end;

procedure TFrmBomMiscParam.btnCancelClick(Sender: TObject);
begin
  if Assigned(DataSource1.DataSet) then with DataSource1.DataSet do
     if State <> dsBrowse then Cancel;

  if TblParams.State in [dsEdit, dsInsert] then TblParams.Cancel;

  Close;
end;

procedure TFrmBomMiscParam.btnDefaultLaborClick(Sender: TObject);
var
  A: Variant;
  B: Variant;

  function _get_not_zero( A, B: Variant; I: Integer ): Real;
  begin
    Result:= 0;
    if VarArrayDimCount( A ) > 0 then
       Result:= A[ I ];

     if (Result = 0) and (VarArrayDimCount( B ) > 0) then
       Result:= B[ I ];
  end;

begin
  if Assigned(DataSource1.DataSet) then with DataSource1.DataSet do
  begin
    // FieldByName('LABOR_RATE').asFloat:= SelectValueFmtAsFloat('select labor_rate from mfgtype where mfgtype = ''%s''',
    //                                               [ FieldByName('mfg_type').asString ]);
    A:= SelectValueArrayFmt( 'select labor_rate, future_labor_rate, budget_labor_rate, forecast_labor_rate '+
                        '  from mfgcell where rtrim(mfgcell) = ''%s''',
                        [ FixStr(Trim(FieldByName('mfgcell').asString)) ]);
    B:= SelectValueArrayFmt( 'select labor_rate, future_labor_rate, budget_labor_rate, forecast_labor_rate '+
                        '  from mfgtype where mfgtype = ''%s''',
                        [ FixStr(Trim(FieldByName('mfg_type').asString)) ]);
    Edit;
    FieldByName('LABOR_RATE').asFloat         := _get_not_zero( A, B, 0 );
    FieldByName('FUTURE_LABOR_RATE').asFloat  := _get_not_zero( A, B, 1 );
    FieldByName('BUDGET_LABOR_RATE').asFloat  := _get_not_zero( A, B, 2 );
    FieldByName('FORECAST_LABOR_RATE').asFloat:= _get_not_zero( A, B, 3 );
  end;
end;

procedure TFrmBomMiscParam.btnOKClick(Sender: TObject);
begin
  if TblParams.State in [dsEdit, dsInsert] then
  try
     ValidateScopes( TblParamsMFG_SCOPE.asFloat, TblParamsSCHED_SCOPE.asFloat );
     TblParams.Post;
  except on E:Exception do
     {'Invalid Default Scheduling Scopes'}
     raise Exception.Create(bom_rscstr.cTXT0000005 + #13#13 + FixFireDACErrorMessage( E ));
  end;

  if Assigned(DataSource1.DataSet) and (DataSource1.DataSet.State in [dsEdit, dsInsert]) then
  try
    if DataSource1.DataSet.FieldByName('RUNSCOPE').asFloat > 0 then
       ValidateScopes( DataSource1.DataSet.FieldByName('RUNSCOPE').asFloat, TblParamsSCHED_SCOPE.asFloat );
    DataSource1.DataSet.Post;
  except on E:Exception do
    {'Invalid Manufacturing Run Size'}
    raise Exception.Create(bom_rscstr.cTXT0000006 + #13#13 + FixFireDACErrorMessage( E ));
  end;

  Close;
end;

procedure TFrmBomMiscParam.ValidateScopes( RunScope, SchedScope : Real );
begin
  if SchedScope = 0 then
     {'This Scheduling Scope (Time Horizon) must be greater than zero for the
      system to function.'}
     raise Exception.Create(bom_rscstr.cTXT0000007)

  else if (SchedScope < 90) and (SchedScope <> 0) then
     {'The Scheduling Scope (Time Horizon) should be at least as long as the longest raw material leadtime. '+
                'Sales release dates past the horizon will NOT be evaluated!  IQMS suggests at least 120 days.'}
     IQWarning(bom_rscstr.cTXT0000008)

  else if RunScope < 2 then
     {'The Run Size Scope must be greater than one for the sytem to function properly. '+
               'IQMS suggests between 5 and 15 days for the Run Size Scope.'}
     IQWarning(bom_rscstr.cTXT0000009)

  else if RunScope > 30 then
     {'The Run Size Scope should usually be less than 30 days. '+
      'The Run Size Scope is used to group sales releases together in one Manufacturing Run based on scope days. '+
      'The shorter the time the more setups - the longer time the more finished goods inventory you will build. '+
      'IQMS suggests between 5 and 15 days for the Run Size Scope.'}
     IQWarning(bom_rscstr.cTXT0000010)

  else if (SchedScope = RunScope) and (RunScope <> 0) then
     {'The Schedule Scope (Time Horizon) and the Run Size Scope '+
      'should not be equal. The Scheduling Scope (Time Horizon) should be at least as long as the longest raw material leadtime. '+
      'Sales release dates past the horizon will not be evaluated!  IQMS suggests at least 120 days. '+
      'The Run Size Scope is used to group sales releases together in one Manufacturing Run based on scope days. '+
      'The shorter the time the more setups - the longer time the more finished goods inventory you will build. '+
      'IQMS suggests between 5 and 15 days for the Run Size Scope.'}
     IQWarning(bom_rscstr.cTXT0000011)

  else if SchedScope < RunScope then
     {'The Schedule Scope (Time Horizon) should not be less than the Run Size Scope. '+
      'The Scheduling Scope (Time Horizon) should be at least as long as the longest raw material leadtime. '+
      'Sales release dates past the horizon will not be evaluated!  IQMS suggests at least 120 days. '+
      'The Run Size Scope is used to group sales releases together in one Manufacturing Run based on scope days. '+
      'The shorter the time the more setups - the longer time the more finished goods inventory you will build. '+
      'IQMS suggests between 5 and 15 days for the Run Size Scope.'}
     raise Exception.Create(bom_rscstr.cTXT0000012)
end;

procedure TFrmBomMiscParam.wwDBComboDlgAlternateItemCodeCustomDlg(
  Sender: TObject);
begin
  with PkAlternateItemCode do
    if Execute then
    begin
      DataSource1.DataSet.Edit;
      DataSource1.DataSet.FieldByName('alternate_item_code_id').asFloat:= GetValue('id');
    end;
end;

procedure TFrmBomMiscParam.wwDBComboDlgAlternateItemCodeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    DataSource1.DataSet.Edit;
    DataSource1.DataSet.FieldByName('alternate_item_code_id').Clear;
    wwDBComboDlgAlternateItemCode.Text:= '';
    Key:= 0;
  end;
end;

procedure TFrmBomMiscParam.FormShow(Sender: TObject);
var
  AItem: TwwInspectorItem;
  AMfgtype_Lookup: string;

begin
{ TODO -oGPatil -cWebConvert : Dependency on IQSecins.pas File
  EnsureSecurityInspectorOnTopOf( self );  }

  PageControl1.ActivePageIndex:= 0;
  try
    //DataSource1.DataSet:= FTable;
    if Assigned( FTable ) then with FTable do
    begin
      DataSource1.DataSet.CheckBrowseMode;
      {'Miscellaneous Parameters for %s'}
      Caption:= Format(bom_rscstr.cTXT0000004, [DataSource1.DataSet.FieldByName('MFGNO').asString]);
    end;
    IQSetTablesActiveEx( TRUE, self, '' );

   if Assigned(wwDataInspector1) then
    begin
    { TODO -oGPatil -cWebConvert : AssignDataInspectorItemVisible is commented in IQMS.WebVcl.SecurityRegister
      IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'SCHED_SCOPE',    TblParamsSCHED_SCOPE.Name, SR );
      IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'MFG_SCOPE',      TblParamsMFG_SCOPE.Name, SR );
      IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'EFF_FACTOR',     TblParamsEFF_FACTOR.Name, SR );
      IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PLANNING_FENCE', TblParamsPLANNING_FENCE.Name, SR );

      if Assigned(DataSource1.DataSet) then
      begin
        IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PLANNING_FENCE', DataSource1.DataSet.FieldByName('PLANNING_FENCE').Name, SR );
        IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'RUNSCOPE',       DataSource1.DataSet.FieldByName('RUNSCOPE').Name, SR );
        IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'START_MAT_QTY',  DataSource1.DataSet.FieldByName('START_MAT_QTY').Name, SR );
        IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'INCLUDE_START_MAT_IN_STD_COST',DataSource1.DataSet.FieldByName('INCLUDE_START_MAT_IN_STD_COST').Name, SR );
        IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'AlternateItemCode',  DataSource1.DataSet.FieldByName('AlternateItemCode').Name, SR );
      end;    }
    end;

    // Enable/Disable CheckAvailRegrind
   with wwDataInspector2 do
    begin
      // in case of RIM hide this node
      AMfgtype_Lookup:= IQMS.Common.MfgShare.Lookup_MfgType( DataSource1.DataSet.FieldByName('mfg_type').asString );
      AItem:= GetItemByTagString('Check_Available_Regrind');
      if Assigned(AItem) then
      begin
        if StrInList( AMfgtype_Lookup, [ 'BLOWMOLD', 'DIECAST', 'EXTRUSION', 'EXTRUSION2', 'EXTRUSION3', 'INJECTION', 'ROTATIONAL', 'SFOAM' ]) then
           begin
             AItem.Visible:= True;
             AItem.Caption:= bom_rscstr.cTXT0000030; {'Check Available Regrind % in lbs/k Calc'}
           end
        else if StrInList( AMfgtype_Lookup, [ 'STAMPING' ]) then
           begin
             AItem.Visible:= True;
             AItem.Caption:= bom_rscstr.cTXT0000031; {'Check Available Waste % in lbs/k Calc'}
           end
        else
           AItem.Visible:= False;
      end;

      // hide the parent node if no children is found
      AItem:= GetItemByTagString('Switches');
      if Assigned(AItem) then
         AItem.Visible:= Assigned(AItem.GetFirstChild());
    end;

    if heijunka_share.BOMBelongsToHeijunka(DataSource1.DataSet.FieldByName('ID').asFloat ) then
      wwDataInspector1.GetItemByTagString('MFG_RUNSCOPE').ReadOnly:= TRUE;  // runscope is updated from heijunka box

  except on E:Exception do
    Application.ShowException( E );
  end;
  IQRegFormRead( self, [self, PnlLaborRateLeft]);
end;

procedure TFrmBomMiscParam.SetTable(const Value: TFDTable);
begin
  FTable := Value;
  Datasource1.DataSet:=Value;
end;

procedure TFrmBomMiscParam.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmBOM{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.

