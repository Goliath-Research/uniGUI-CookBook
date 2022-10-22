unit FR_Gen;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Buttons,
  IQMS.WebVcl.Hpick,
  Db,
  ComCtrls,
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
  uniRadioButton,
  uniEdit,
  uniMultiItem,
  uniComboBox,
  uniGroupBox,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel,
  uniPageControl, uniPanel, uniDBComboBox;

type
  TFR_Gen_Cargo = record
    Fore_Head_ID  : Real;
    Arcusto_ID    : Real;
    Arinvt_ID     : Real;
    FR_Group_ID   : Real;
    Src_Start_Date: TDateTime;
    Src_Start_Act : TDateTime;
    Src_End_Date  : TDateTime;
    Trg_Start_Date: TDateTime;
    Trg_Start_Act : TDateTime;
    Trg_End_Date  : TDateTime;
    PercentChange : Real;
    Kind          : string;
  end;

  TFrmFR_Generate = class(TUniForm)
    wwQryCustomer: TFDQuery;
    wwQryCustomerCUSTNO: TStringField;
    wwQryCustomerCOMPANY: TStringField;
    wwQryCustomerARCUSTO_ID: TBCDField;
    PkArcusto: TIQWebHPick;
    PkArcustoCUSTNO: TStringField;
    PkArcustoCOMPANY: TStringField;
    PkArcustoADDR1: TStringField;
    PkArcustoCITY: TStringField;
    PkArcustoSTATE: TStringField;
    PkArcustoCOUNTRY: TStringField;
    PkArcustoZIP: TStringField;
    PkArcustoPHONE_NUMBER: TStringField;
    PkArcustoPRIME_CONTACT: TStringField;
    PkArcustoID: TBCDField;
    GroupBox2: TUniGroupBox;
    Label6: TUniLabel;
    sbtnSearchCustomer: TUniSpeedButton;
    rbtnAll_Cust: TUniRadioButton;
    rbtnOne_Cust: TUniRadioButton;
    wwcombCustomer: TUniDBLookupComboBox;
    QryFr_Group: TFDQuery;
    QryFr_GroupCODE: TStringField;
    QryFr_GroupDESCRIP: TStringField;
    QryFr_GroupID: TBCDField;
    GroupBox1: TUniGroupBox;
    Label1: TUniLabel;
    wwcombFR_Group: TUniDBLookupComboBox;
    rbtnSel_Item: TUniRadioButton;
    rbtnGroup_Item: TUniRadioButton;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    wwQryGLYear: TFDQuery;
    wwQryGLYearDESCRIP: TStringField;
    wwQryGLYearSTART_DATE: TDateTimeField;
    wwQryGLYearEND_DATE: TDateTimeField;
    wwQryGLYearID: TBCDField;
    procGet_Quarter: TFDStoredProc;
    procGet_Quarter_Dates: TFDStoredProc;
    procBackup: TFDStoredProc;
    procAppend: TFDStoredProc;
    procAdjustDates: TFDStoredProc;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    TabSheet2: TUniTabSheet;
    GroupBox3: TUniGroupBox;
    Label5: TUniLabel;
    Label10: TUniLabel;
    cboxSrcQtr: TUniComboBox;
    wwcomboSrcGLYear: TUniDBLookupComboBox;
    GroupBox4: TUniGroupBox;
    Label9: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    edPrcnt: TUniEdit;
    cboxTrgQtr: TUniComboBox;
    wwcomboTrgGLYear: TUniDBLookupComboBox;
    GroupBox5: TUniGroupBox;
    Label4: TUniLabel;
    Label7: TUniLabel;
    cboxSrcPeriod: TUniComboBox;
    wwcomboSrcGLYearPeriod: TUniDBLookupComboBox;
    GroupBox6: TUniGroupBox;
    Label8: TUniLabel;
    Label11: TUniLabel;
    Label12: TUniLabel;
    edPrcntPeriod: TUniEdit;
    cboxTrgPeriod: TUniComboBox;
    wwcomboTrgGLYearPeriod: TUniDBLookupComboBox;
    PkArcustoPK_HIDE: TStringField;
    TabSheet3: TUniTabSheet;
    chkEvalBest: TUniCheckBox;
    chkApplyBest: TUniCheckBox;
    TabSheet4: TUniTabSheet;
    GroupBox7: TUniGroupBox;
    Label14: TUniLabel;
    wwcomboSrcGLFiscalYear: TUniDBLookupComboBox;
    GroupBox8: TUniGroupBox;
    Label15: TUniLabel;
    Label17: TUniLabel;
    edPrcntFiscalYear: TUniEdit;
    wwcomboTrgGLFiscalYear: TUniDBLookupComboBox;
    SrcwwQryCustomer: TDataSource;
    SrcFr_Group: TDataSource;
    wwSrcGLYear: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnSearchCustomerClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure wwcombFR_GroupChange(Sender: TObject);
    procedure rbtnOne_CustClick(Sender: TObject);
    procedure rbtnGroup_ItemClick(Sender: TObject);
    procedure cboxSrcPeriodDropDown(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FArinvt_ID_In: Real;
    FCurrQuarter : Integer;
    FCurrPeriod  : Integer;
    FForecastType: string;
    FFore_Head_ID: Real;
    FParams: Variant;
    procedure Validate;
    procedure InitializeFormVars( AParams: Variant );
    procedure AssignYear( AGLYear_ID: Real; wwcomboGLYear: TUniDBLookupComboBox );
    procedure Get_Quarter_Dates( AGLYear_ID: Real; AQuarter: Integer; var AQtr_Start_Date, AQtr_End_Date: TDateTime );
    procedure Get_FiscalYear_Dates( AGLYear_ID: Real; var AStart_Date, AEnd_Date: TDateTime );
    procedure ConfirmGenerate( ACargo: TFR_Gen_Cargo );
    procedure Backup( ACargo: TFR_Gen_Cargo );
    procedure Delete( ACargo: TFR_Gen_Cargo );
    procedure Append(  ACargo: TFR_Gen_Cargo );
    procedure ConstructParameters( var ACargo: TFR_Gen_Cargo );
    function StrToFloat0( const S: string ): Real;
    procedure PopulatePeriodsBasedYear( wwLookupCombo: TUniDBLookupComboBox; ComboBox: TUniComboBox );
    procedure SpecificParametersForQuarter( var ACargo: TFR_Gen_Cargo );
    procedure SpecificParametersForFiscalYear( var ACargo: TFR_Gen_Cargo );
    procedure SpecificParametersForPeriod( var ACargo: TFR_Gen_Cargo );
    function GetByPeriod: Boolean;
    function GetByQuarter: Boolean;
    function GetByFiscalYear: Boolean;
    procedure SpecificParametersForFormula(var ACargo: TFR_Gen_Cargo);
    function GetByFormula: Boolean;
    procedure SetParams(const Value: Variant);
  public
    { Public declarations }
    procedure GenerateForecast( ACargo: TFR_Gen_Cargo );
    property ByPeriod: Boolean read GetByPeriod;
    property ByQuarter: Boolean read GetByQuarter;
    property ByFiscalYear: Boolean read GetByFiscalYear;
    property ByFormula: Boolean read GetByFormula;
    property Params: Variant write SetParams;
  end;

procedure DoForecastGenerate( AParams: Variant );



implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.PanelMsg,
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs,
  IQMS.Common.Controls,
  IQMS.Common.NLS,
  IQMS.Common.HelpHook,
  Variants,
  //ForeMain,
  Fore_rscstr;

procedure DoForecastGenerate(AParams: Variant );
var
  FrmFR_Generate: TFrmFR_Generate;
begin
  FrmFR_Generate := TFrmFR_Generate.Create(uniGUIApplication.uniApplication);
  FrmFR_Generate.ShowModal;
end;

procedure TFrmFR_Generate.UniFormCreate(Sender: TObject);
var
  APrcnt : Real;
begin
  {Restore settings}
  APrcnt:= 0;
  IQRegFloatScalarRead( self, 'PercentChange', APrcnt );
  edPrcnt.Text      := FloatToStr(APrcnt);
  edPrcntPeriod.Text:= FloatToStr(APrcnt);
end;

procedure TFrmFR_Generate.UniFormShow(Sender: TObject);
var
  AOne_Cust  : Boolean;
  AArcusto_ID: Real;
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self ]);

  InitializeFormVars( FParams );

  if FParams[ 0 ] = 0 then
  begin
    AOne_Cust  := FALSE;
    AArcusto_ID:= 0;
    if IQRegBooleanScalarRead( self, 'OneCustomer', AOne_Cust ) then
    begin
       rbtnOne_Cust.Checked:= AOne_Cust;
       if rbtnOne_Cust.Checked and IQRegFloatScalarRead( self, 'OneCustomerID', AArcusto_ID ) and (AArcusto_ID > 0) then
       begin
         { TODO -oSanketG -cWebConvert : Need to find alternative for LookupValue,PerformSearch in TUniDBLookupComboBox}
         {wwcombCustomer.LookupValue:= FloatToStr( AArcusto_ID );
         wwcombCustomer.PerformSearch;}
       end;
    end;
  end;

  rbtnOne_CustClick( NIL );
  rbtnGroup_ItemClick( NIL );
end;

procedure TFrmFR_Generate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
  IQRegFloatScalarWrite( self, 'PercentChange', StrToFloat0( edPrcnt.Text ));

  IQRegBooleanScalarWrite( self, 'OneCustomer', rbtnOne_Cust.Checked );
  if rbtnOne_Cust.Checked then
     { TODO -oSanketG -cWebConvert : Need to find alternative for LookupValue in TUniDBLookupComboBox}
     //IQRegFloatScalarWrite( self, 'OneCustomerID', StrToFloat( wwcombCustomer.LookupValue ) );

end;

procedure TFrmFR_Generate.sbtnSearchCustomerClick(Sender: TObject);
begin
  with PkArcusto do
    if Execute then
    begin
      { TODO -oSanketG -cWebConvert : Need to find alternative for LookupValue,PerformSearch in TUniDBLookupComboBox}
      {wwcombCustomer.LookupValue:= FloatToStr(GetValue('id'));
      wwcombCustomer.PerformSearch;}
    end;
end;

procedure TFrmFR_Generate.InitializeFormVars( AParams: Variant );
var
  AGLYear_ID: Real;
begin
  {Arcusto_ID}
  if AParams[ 0 ] = 0 then
     rbtnAll_Cust.Checked:= TRUE
  else
     begin
       rbtnOne_Cust.Checked:= TRUE;
       { TODO -oSanketG -cWebConvert : Need to find alternative for LookupValue,PerformSearch in TUniDBLookupComboBox}
       {wwcombCustomer.LookupValue:= FloatToStr( DtoF( AParams[ 0 ]) );
       wwcombCustomer.PerformSearch;}
     end;

  {Target year}
  AGLYear_ID:= SelectValueFmtAsFloat( 'select id from glyear where to_date(''%s'', ''MM/DD/YYYY'') between start_date and end_date', [ FormatDateTime('MM/DD/YYYY', Date )]);
  IQAssert(AGLYear_ID > 0 , 'Undefined GL year - unable to continue.');
  if AGLYear_ID > 0 then
  begin
     { TODO -oSanketG -cWebConvert : Need to find alternative for LookupValue,PerformSearch in TUniDBLookupComboBox}
     {wwcomboTrgGLYear.LookupValue:= FloatToStr(AGLYear_ID);
     wwcomboTrgGLYear.PerformSearch;

     wwcomboTrgGLFiscalYear.LookupValue:= FloatToStr(AGLYear_ID);
     wwcomboTrgGLFiscalYear.PerformSearch;

     wwcomboTrgGLYearPeriod.LookupValue:= FloatToStr(AGLYear_ID);
     wwcomboTrgGLYearPeriod.PerformSearch;}
  end;

  {Target quarter}
  with procGet_Quarter do
  begin
    ParamByName('v_date').asDateTime:= Date;
    ExecProc;
    FCurrQuarter:= ParamByName('v_quarter').asInteger;
    with cboxTrgQtr do
      ItemIndex:= FCurrQuarter - 1;
  end;

  {Target Period}
  PopulatePeriodsBasedYear( wwcomboTrgGLYearPeriod, cboxTrgPeriod );
  FCurrPeriod:= Trunc(SelectValueAsFloat('select period from glperiods where sysdate between start_date and end_date'));
  with cboxTrgPeriod do
      ItemIndex:= Items.IndexOf( IntToStr( FCurrPeriod ));

  {Selected Arinvt_ID}
  FArinvt_ID_In:= AParams[ 1 ];

  {Forecast Type}
  FForecastType:= AParams[ 2 ];

  {Fore_Head_ID}
  FFore_Head_ID:= AParams[ 3 ];

  {PageControl}
  PageControl1.ActivePageIndex:= 0;
end;

procedure TFrmFR_Generate.AssignYear( AGLYear_ID: Real; wwcomboGLYear: TUniDBLookupComboBox );
var
  OnChange1: TNotifyEvent;
  OnChange2: TNotifyEvent;
begin
  OnChange1:= wwcomboGLYear.OnChange;
  wwcomboGLYear.OnChange:= NIL;
  try
    if AGLYear_ID = 0 then
       wwcomboGLYear.Clear;
  finally
    wwcomboGLYear.OnChange:= OnChange1;
  end;
end;

procedure TFrmFR_Generate.wwcombFR_GroupChange(Sender: TObject);
var
  A: Variant;
begin
  {By Quarter}
  A:= SelectValueArrayFmt( 'select glyear_id, quarter, prcnt_change from fr_group_dtl '+
                      ' where fr_group_id = %f and seq = %d', [ QryFr_GroupID.asFloat, FCurrQuarter ]);
  if VarArrayDimCount( A ) > 0 then
  begin
     { TODO -oSanketG -cWebConvert : Need to find alternative for LookupValue in TUniDBLookupComboBox}
     //wwcomboSrcGLYear.LookupValue:= FloatToStr(A[ 0 ]);  {glyear}
     with cboxSrcQtr do
       ItemIndex:= Trunc(A[ 1 ]) - 1;                    {quarter}
     edPrcnt.Text:= FloatToStr( A[ 2 ]);                 {percent}
  end;

  {By Period}
  A:= SelectValueArrayFmt( 'select glyear_id, period_src, prcnt_change from fr_group_dtl_period '+
                      ' where fr_group_id = %f and period_trg = %d', [ QryFr_GroupID.asFloat, FCurrPeriod ]);
  if VarArrayDimCount( A ) > 0 then
  begin
     { TODO -oSanketG -cWebConvert : Need to find alternative for LookupValue in TUniDBLookupComboBox}
     //wwcomboSrcGLYearPeriod.LookupValue:= FloatToStr(A[ 0 ]);  {glyear }
     PopulatePeriodsBasedYear( wwcomboSrcGLYearPeriod, cboxSrcPeriod );
     with cboxSrcPeriod do
       ItemIndex:= Items.IndexOf( IntToStr( Trunc(A[ 1 ]) ));  {period }
     edPrcntPeriod.Text:= FloatToStr( A[ 2 ]);                 {percent}
  end
end;


procedure TFrmFR_Generate.rbtnOne_CustClick(Sender: TObject);
begin
  IQEnableControl( wwcombCustomer,     rbtnOne_Cust.Checked );
  IQEnableControl( sbtnSearchCustomer, rbtnOne_Cust.Checked );
end;


procedure TFrmFR_Generate.rbtnGroup_ItemClick(Sender: TObject);
begin
  IQEnableControl( wwcombFR_Group, rbtnGroup_Item.Checked );
end;

function TFrmFR_Generate.GetByPeriod: Boolean;
begin
 Result:= PageControl1.ActivePage = TabSheet1;
end;

procedure TFrmFR_Generate.btnOKClick(Sender: TObject);
var
  ACargo: TFR_Gen_Cargo;
begin
  Validate;
  ConstructParameters( ACargo );
  GenerateForecast( ACargo );
  ModalResult:= mrOK;
end;

procedure TFrmFR_Generate.Validate;
begin
  { TODO -oSanketG -cWebConvert : Need to find alternative for LookupValue in TUniDBLookupComboBox}
  {IQAssert( not rbtnOne_Cust.Checked    or (wwcombCustomer.LookupValue > ''), 'Customer is not assigned'   );
  IQAssert( not rbtnGroup_Item.Checked  or (wwcombFR_Group.LookupValue > ''), 'No Forecast Group selected' );}

  if ByPeriod then
    begin
      IQAssert( wwcomboSrcGLYearPeriod.Text <> '', 'Source Year not selected' );
      IQAssert( wwcomboTrgGLYearPeriod.Text <> '', 'Target Year not selected' );

      IQAssert( cboxSrcPeriod.Text <> '', 'Source Period not selected' );
      IQAssert( cboxTrgPeriod.Text <> '', 'Target Period not selected' );
    end
  else if ByQuarter then
    begin
      IQAssert( wwcomboSrcGLYear.Text <> '', 'Source Year not selected' );
      IQAssert( wwcomboTrgGLYear.Text <> '', 'Target Year not selected' );

      IQAssert( cboxSrcQtr.Text <> '', 'Source quarter not selected' );
      IQAssert( cboxTrgQtr.Text <> '', 'Target quarter not selected' );
    end
  else if ByFiscalYear then
    begin
      IQAssert( wwcomboSrcGLFiscalYear.Text <> '', 'Source Fiscal Year not selected' );
      IQAssert( wwcomboTrgGLFiscalYear.Text <> '', 'Target Fiscal Year not selected' );
    end
  else
      IQAssert( chkEvalBest.Checked or chkApplyBest.Checked, 'No action is selected')
end;

function TFrmFR_Generate.StrToFloat0( const S: string ): Real;
begin
  try
    Result:= StrToFloat( S );
  except
    Result:= 0;
  end;
end;

procedure TFrmFR_Generate.ConstructParameters( var ACargo: TFR_Gen_Cargo );
begin
  with ACargo do
  begin
    if rbtnOne_Cust.Checked then
       { TODO -oSanketG -cWebConvert : Need to find alternative for LookupValue in TUniDBLookupComboBox}
       //Arcusto_ID:= StrToFloat( wwcombCustomer.LookupValue )
    else
       Arcusto_ID:= 0;

    if rbtnSel_Item.Checked then
       Arinvt_ID := FArinvt_ID_In
    else
       Arinvt_ID:= 0;

    if rbtnGroup_Item.Checked then
       { TODO -oSanketG -cWebConvert : Need to find alternative for LookupValue in TUniDBLookupComboBox}
       //FR_Group_ID:= StrToFloat( wwcombFR_Group.LookupValue )
    else
       FR_Group_ID:= 0;

    if ByPeriod then
       SpecificParametersForPeriod( ACargo )
    else if ByQuarter then
       SpecificParametersForQuarter( ACargo )
    else if ByFiscalYear then
       SpecificParametersForFiscalYear( ACargo )
    else
       SpecificParametersForFormula( ACargo );

    IQAssert( Trg_End_Date >= Date, 'Forecast can be generated for current or future years/quarters/periods only' );

    {Adjust start dates if Today falls between start and end. Otherwise start dates are as quarter start dates}
    if ByPeriod or ByQuarter or ByFiscalYear then
       with procAdjustDates do
       begin
         ParamByName('v_src_start_date').asDateTime:= Src_Start_Date;
         ParamByName('v_src_end_date')  .asDateTime:= Src_End_Date;
         ParamByName('v_trg_start_date').asDateTime:= Trg_Start_Date;
         ParamByName('v_trg_end_date')  .asDateTime:= Trg_End_Date;
//         AssignQueryParamValue(procAdjustDates, 'v_src_start_date', Src_Start_Date);
//         AssignQueryParamValue(procAdjustDates, 'v_src_end_date'  , Src_End_Date  );
//         AssignQueryParamValue(procAdjustDates, 'v_trg_start_date', Trg_Start_Date);
//         AssignQueryParamValue(procAdjustDates, 'v_trg_end_date'  , Trg_End_Date  );
         ExecProc;

         Src_Start_Act:= ParamByName('v_src_start_act').asDateTime;
         Trg_Start_Act:= ParamByName('v_trg_start_act').asDateTime;
       end
    else
      {By formula. Src_Start_Act is not used}
      Trg_Start_Act:= Trg_Start_Date;

    Kind:= FForecastType;

    Fore_Head_ID:= FFore_Head_ID;
  end;
end;


procedure TFrmFR_Generate.SpecificParametersForQuarter( var ACargo: TFR_Gen_Cargo );
begin
  with ACargo do
  begin
    PercentChange := StrToFloat( edPrcnt.Text );
    { TODO -oSanketG -cWebConvert : Need to find alternative for LookupValue in TUniDBLookupComboBox}
    {Get_Quarter_Dates( IIf( wwcomboSrcGLYear.Text > '', StrToFloat0( wwcomboSrcGLYear.LookupValue ), 0 ), // AGLYear_ID
                       cboxSrcQtr.ItemIndex + 1,                                                          // AQuarter
                       Src_Start_Date,                                                                    // AQtr_Start_Date
                       Src_End_Date );                                                                    // AQtr_End_Date

    Get_Quarter_Dates( IIf( wwcomboTrgGLYear.Text > '', StrToFloat0( wwcomboTrgGLYear.LookupValue ), 0 ), // AGLYear_ID
                       cboxTrgQtr.ItemIndex + 1,                                                          // AQuarter
                       Trg_Start_Date,                                                                    // AQtr_Start_Date
                       Trg_End_Date );                                                                    // AQtr_End_Date
    }
  end;
end;


procedure TFrmFR_Generate.SetParams(const Value: Variant);
begin
  FParams := Value;
end;

procedure TFrmFR_Generate.SpecificParametersForFiscalYear( var ACargo: TFR_Gen_Cargo);
begin
  with ACargo do
  begin
    PercentChange := StrToFloat( edPrcntFiscalYear.Text );
    { TODO -oSanketG -cWebConvert : Need to find alternative for LookupValue in TUniDBLookupComboBox}
    {Get_FiscalYear_Dates( IIf( wwcomboSrcGLFiscalYear.Text > '', StrToFloat0( wwcomboSrcGLFiscalYear.LookupValue ), 0 ), // AGLYear_ID
                       Src_Start_Date,                                                                    // AQtr_Start_Date
                       Src_End_Date );                                                                    // AQtr_End_Date

    Get_FiscalYear_Dates( IIf( wwcomboTrgGLFiscalYear.Text > '', StrToFloat0( wwcomboTrgGLFiscalYear.LookupValue ), 0 ), // AGLYear_ID
                       Trg_Start_Date,                                                                    // AQtr_Start_Date
                       Trg_End_Date );                                                                    // AQtr_End_Date
    }
  end;
end;

procedure TFrmFR_Generate.SpecificParametersForFormula( var ACargo: TFR_Gen_Cargo );
begin
  with ACargo do
  begin
    PercentChange := StrToFloat( edPrcnt.Text );

    {Src_Start_Date and Src_End_Date are not in use}

    {Target dates}
    Trg_Start_Date:= Date;
    { TODO -oSanketG -cWebConvert : Need to revisit, dependent on foremain }
    //Trg_End_Date  := TFrmForecastMain(self.Owner).ToDate;  {ForeMain.pas}
  end;
end;


procedure TFrmFR_Generate.SpecificParametersForPeriod( var ACargo: TFR_Gen_Cargo );
  procedure AssignDates( AGLYear_ID, APeriod: string; var Date1, Date2: TDateTime );
  var
    A: Variant;
  begin
    A:= SelectValueArrayFmt( 'select start_date, end_date from glperiods where glyear_id = %s and period = %s', [ AGLYear_ID, APeriod ]);
    IQAssert( VarArrayDimCount( A ) > 0, Format('Unable to locate GLPeriod for GLYear = %s and Period = %s', [ AGLYear_ID, APeriod ]));
    Date1:= A[ 0 ];
    Date2:= A[ 1 ];
  end;
begin
  with ACargo do
  begin
    PercentChange := StrToFloat( edPrcntPeriod.Text );
    { TODO -oSanketG -cWebConvert : Need to find alternative for LookupValue in TUniDBLookupComboBox}
    {AssignDates( wwcomboSrcGLYearPeriod.LookupValue, cboxSrcPeriod.Text, Src_Start_Date, Src_End_Date );
    AssignDates( wwcomboTrgGLYearPeriod.LookupValue, cboxTrgPeriod.Text, Trg_Start_Date, Trg_End_Date );}
  end;
end;

procedure TFrmFR_Generate.Get_Quarter_Dates( AGLYear_ID: Real; AQuarter: Integer; var AQtr_Start_Date, AQtr_End_Date: TDateTime );
var
  AYr_start_date: TDateTime;
  AYr_end_date  : TDateTime;
  A: Variant;
begin
  {Determine Fiscal Year Start-End}
  A:= SelectValueArrayFmt( 'select start_date, end_date from glyear where id = %f', [ AGLYear_ID ]);
  if VarArrayDimCount( A ) > 0 then
  begin
    AYr_start_date:= A[ 0 ];
    AYr_end_date  := A[ 1 ];
  end;

  {Now find out the quarter dates}
  with procGet_Quarter_Dates do
  begin
     ParamByName('v_yr_start_date' ).asDateTime:= AYr_start_date;
     ParamByName('v_yr_end_date'   ).asDateTime:= AYr_end_date;
     ParamByName('v_quarter'       ).Value     := AQuarter;
//     AssignQueryParamValue(procGet_Quarter_Dates, 'v_yr_start_date', AYr_start_date);
//     AssignQueryParamValue(procGet_Quarter_Dates, 'v_yr_end_date'  , AYr_end_date);
//     AssignQueryParamValue(procGet_Quarter_Dates, 'v_quarter'      , AQuarter);
     ExecProc;

     AQtr_Start_Date:= ParamByName('v_qtr_start_date').asDateTime;
     AQtr_End_Date  := ParamByName('v_qtr_end_date'  ).asDateTime;
  end;
end;

procedure TFrmFR_Generate.Get_FiscalYear_Dates(AGLYear_ID: Real; var AStart_Date, AEnd_Date: TDateTime);
var
  A: Variant;
begin
  {Determine Fiscal Year Start-End}
  A:= SelectValueArrayFmt( 'select start_date, end_date from glyear where id = %f', [ AGLYear_ID ]);
  if VarArrayDimCount( A ) > 0 then
  begin
    AStart_Date := A[ 0 ];
    AEnd_Date   := A[ 1 ];
  end;
end;

procedure TFrmFR_Generate.GenerateForecast( ACargo: TFR_Gen_Cargo );
var
 h: TPanelMesg;
begin
  ConfirmGenerate( ACargo );

  h:= hPleaseWait('Generating Forecast ...');
  try
    // h.Mesg:= 'Backup existing forecast ...';
    // Backup( ACargo );  Clone and Archive?

    if not ByFormula or chkApplyBest.Checked then
    begin
      h.Mesg:= 'Delete existing forecast ...';
      Delete( ACargo );
    end;

    h.Mesg:= 'Append new forecast ...';
    Append( ACargo );

  finally
    h.Free;
  end;
end;

procedure TFrmFR_Generate.ConfirmGenerate( ACargo: TFR_Gen_Cargo );
var
  S: string;
begin
  with ACargo do
  begin
    S:=     Format( 'Customer : %s'#13#13, [ IIf( Arcusto_ID = 0, 'ALL',
                                            SelectValueFmtAsString('select company from arcusto where id = %f', [ Arcusto_ID ]))]);

    S:= S + Format( 'Item(s) : %s'#13#13,  [ IIf( Arinvt_ID > 0 ,
                                            SelectValueFmtAsString( 'select itemno from arinvt where id = %f', [ Arinvt_ID ]),
                                            SelectValueFmtAsString( 'select ''In Forecast Group = '' || code from fr_group where id = %f', [ FR_Group_ID ]))]);

    if ByPeriod or ByQuarter or ByFiscalYear then
    begin
      if Src_Start_Date <> Src_Start_Act then
        S:= S + Format( 'Source Date Range : %s - %s (adjusted)'#13#13, [ FormatDateTime('MM/DD/YYYY', Src_Start_Act), FormatDateTime('MM/DD/YYYY', Src_End_Date)])
      else
        S:= S + Format( 'Source Date Range : %s - %s'#13#13, [ FormatDateTime('MM/DD/YYYY', Src_Start_Date), FormatDateTime('MM/DD/YYYY', Src_End_Date)]);
    end;

    if Trg_Start_Date <> Trg_Start_Act then
      S:= S + Format( 'Target Date Range : %s - %s (adjusted)'#13#13, [ FormatDateTime('MM/DD/YYYY', Trg_Start_Act), FormatDateTime('MM/DD/YYYY', Trg_End_Date)])
    else
      S:= S + Format( 'Target Date Range : %s - %s'#13#13, [ FormatDateTime('MM/DD/YYYY', Trg_Start_Date), FormatDateTime('MM/DD/YYYY', Trg_End_Date)]);

    if ByPeriod or ByQuarter or ByFiscalYear then
       S:= S + Format( 'Percent Change : %.6f'#13#13, [ PercentChange ])
    else
       begin
         if chkEvalBest.Checked then
            S:= S + 'Evaluate best forecast formula.'#13;
         if chkApplyBest.Checked then
            S:= S + 'Generate forecast applying most recent best forecast formula.'#13#13;
       end;
  end;

  if not IQConfirmYN( S + #13'About to proceed based on the above information. '#13'Continue?' ) then
     ABORT;
end;

procedure TFrmFR_Generate.Backup( ACargo: TFR_Gen_Cargo );
begin
  with TFDQuery.Create( Application ) do
  try
    Connection := UniMainModule.FDConnection1;
    if ACargo.Arinvt_ID > 0 then
       SQL.Add(IQFormat('select %.0f as arinvt_id from dual', [ ACargo.Arinvt_ID ]))              {fake for while not eof loop}
    else if ACargo.FR_Group_ID > 0 then
       SQL.Add(IQFormat('select id as arinvt_id from arinvt where fr_group_id = %f', [ ACargo.FR_Group_ID ]))
    else
      raise Exception.Create('Unable to backup forecast - target item(s) is undefined');  {should not happen}
    Open;
    while not Eof do
    begin
      procBackup.ParamByName('v_arinvt_id' ).Value   := FieldByName('arinvt_id').asFloat;
      procBackup.ParamByName('v_arcusto_id').Value   := ACargo.Arcusto_ID;
      procBackup.ParamByName('v_start_date').asDateTime:= ACargo.Trg_Start_Act;
      procBackup.ParamByName('v_end_date'  ).asDateTime:= ACargo.Trg_End_Date;
      procBackup.ParamByName('v_kind'      ).asString  := ACargo.Kind;

//      AssignQueryParamValue(procBackup, 'v_arinvt_id' , FieldByName('arinvt_id').asFloat);
//      AssignQueryParamValue(procBackup, 'v_arcusto_id', ACargo.Arcusto_ID);
//      AssignQueryParamValue(procBackup, 'v_start_date', ACargo.Trg_Start_Act);
//      AssignQueryParamValue(procBackup, 'v_end_date'  , ACargo.Trg_End_Date);
//      AssignQueryParamValue(procBackup, 'v_kind'      , ACargo.Kind);

      procBackup.ExecProc;

      Next;
    end;
  finally
    Free;
  end;
end;


procedure TFrmFR_Generate.Delete( ACargo: TFR_Gen_Cargo );
begin
   ExecuteCommandFmt(' begin                                                                '+
             '  forecast.delete_inactive_items(%f);                                 '+  // delete items arinvt.pk_hide = 'Y'
             '                                                                      '+
             '  delete from fore_dtl                                                '+
             '   where fore_cust_id in ( select cust.id                             '+
             '                             from fore_item item,                     '+
             '                                  fore_cust cust                      '+
             '                            where                                     '+
             '                                  item.fore_head_id = %f              '+
             '                              and ((%f > 0 and item.arinvt_id = %f)   '+
             '                                    or                                '+
             '                                   (%f = 0 and item.arinvt_id in (select id from arinvt where fr_group_id = %f))) '+
             '                              and item.id = cust.fore_item_id         '+
             '                              and (%f = 0 or cust.arcusto_id = %f ))  '+
             '     and req_date between to_date(''%s'', ''MM/DD/RRRR'') and to_date(''%s'', ''MM/DD/RRRR''); '+
             'end;                                                                  ',
             [ ACargo.Fore_Head_ID,
               ACargo.Fore_Head_ID,
               ACargo.Arinvt_ID,
               ACargo.Arinvt_ID,
               ACargo.Arinvt_ID,
               ACargo.FR_Group_ID,
               ACargo.Arcusto_ID,
               ACargo.Arcusto_ID,
               FormatDateTime( 'MM/DD/YYYY', ACargo.Trg_Start_Act ),
               FormatDateTime( 'MM/DD/YYYY', ACargo.Trg_End_Date ) ]);
end;


procedure TFrmFR_Generate.Append(  ACargo: TFR_Gen_Cargo );
begin
  {by period or by quarter}
  if ByPeriod or ByQuarter or ByFiscalYear then
    with procAppend, ACargo do
      begin
       ParamByName('v_fore_head_id').Value     := Fore_Head_ID;
       ParamByName('v_arinvt_id').Value        := Arinvt_ID;
       ParamByName('v_fr_group_id').Value      := FR_Group_ID;
       ParamByName('v_arcusto_id').Value       := Arcusto_ID;
       ParamByName('v_src_start_date').asDateTime:= Src_Start_Act;
       ParamByName('v_src_end_date').asDateTime  := Src_End_Date;
       ParamByName('v_trg_start_date').asDateTime:= Trg_Start_Act;
       ParamByName('v_trg_end_date').asDateTime  := Trg_End_Date;
       ParamByName('v_percent').Value          := PercentChange;

//        AssignQueryParamValue(procAppend, 'v_fore_head_id'  , Fore_Head_ID);
//        AssignQueryParamValue(procAppend, 'v_arinvt_id'     , Arinvt_ID);
//        AssignQueryParamValue(procAppend, 'v_fr_group_id'   , FR_Group_ID);
//        AssignQueryParamValue(procAppend, 'v_arcusto_id'    , Arcusto_ID);
//        AssignQueryParamValue(procAppend, 'v_src_start_date', Src_Start_Act);
//        AssignQueryParamValue(procAppend, 'v_src_end_date'  , Src_End_Date);
//        AssignQueryParamValue(procAppend, 'v_trg_start_date', Trg_Start_Act);
//        AssignQueryParamValue(procAppend, 'v_trg_end_date'  , Trg_End_Date);
//        AssignQueryParamValue(procAppend, 'v_percent'       , PercentChange);

        ExecProc;
      end
  else
  {by formula}
    with ACargo do
      ExecuteCommandFmt('begin                                                                     '+
                '  forecast.append_eval_based_on_formula( %f,                              '+  // v_fore_head_id
                '                                         %f,                              '+  //  v_arinvt_id
                '                                         %f,                              '+  //  v_fr_group_id
                '                                         %f,                              '+  //  v_arcusto_id
                '                                         to_date(''%s'', ''mm/dd/yyyy''), '+  //  v_trg_start_date
                '                                         to_date(''%s'', ''mm/dd/yyyy''), '+  //  v_trg_end_date
                '                                         ''%s'',                          '+  //  v_kind
                '                                         ''%s'',                          '+  //  v_calc
                '                                         ''%s'' );                        '+  //  v_apply
                'end;                                                                      ',
                [ Fore_Head_ID,
                  Arinvt_ID,
                  FR_Group_ID,
                  Arcusto_ID,
                  FormatDateTime( 'mm/dd/yyyy', Trg_Start_Act ),
                  FormatDateTime( 'mm/dd/yyyy', Trg_End_Date  ),
                  Kind,
                  IIf( chkEvalBest.Checked, 'Y', 'N'),
                  IIf( chkApplyBest.Checked, 'Y', 'N') ]);
end;

procedure TFrmFR_Generate.cboxSrcPeriodDropDown(Sender: TObject);
begin
  if Sender = cboxTrgPeriod then
    PopulatePeriodsBasedYear( wwcomboTrgGLYearPeriod, cboxTrgPeriod )
  else
    PopulatePeriodsBasedYear( wwcomboSrcGLYearPeriod, cboxSrcPeriod );
end;

procedure TFrmFR_Generate.PopulatePeriodsBasedYear( wwLookupCombo: TUniDBLookupComboBox; ComboBox: TUniComboBox );
var
  Value: Integer;
begin
  ComboBox.Items.Clear;
   { TODO -oSanketG -cWebConvert : Need to find alternative for LookupValue in TUniDBLookupComboBox}
  //IQAssert(IsStringValidInteger(wwLookupCombo.LookupValue, Value), Fore_rscstr.cRsc0013 {'Please select a Fiscal Year'});
  //wwLookupCombo.PerformSearch;
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    { TODO -oSanketG -cWebConvert : Need to find alternative for LookupValue in TUniDBLookupComboBox}
    //SQL.Add( IQFormat( 'select period from glperiods where glyear_id = %s order by period', [ wwLookupCombo.LookupValue ]));
    Open;
    while not Eof do
    begin
      ComboBox.Items.Add( Fields[ 0 ].asString );
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TFrmFR_Generate.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmForecast{CHM}, iqhtmForecast{HTM} );  {IQMS.Common.HelpHook.pas}
end;

function TFrmFR_Generate.GetByQuarter: Boolean;
begin
 Result:= PageControl1.ActivePage = TabSheet2;
end;

function TFrmFR_Generate.GetByFiscalYear: Boolean;
begin
  Result := PageControl1.ActivePage = TabSheet4;
end;

function TFrmFR_Generate.GetByFormula: Boolean;
begin
  Result:= PageControl1.ActivePage = TabSheet3;
end;

end.
