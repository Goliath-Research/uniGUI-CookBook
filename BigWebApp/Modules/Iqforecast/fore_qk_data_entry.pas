unit fore_qk_data_entry;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Menus,
  DBCtrls,
  ComCtrls,
  StdCtrls,
  IQMS.WebVcl.Search,
  ExtCtrls,
  Grids,
  Wwdbigrd,
  Wwdbgrid,
  IQMS.WebVcl.About,
  DB,
  Wwdatsrc,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniSplitter,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniDBNavigator,
  uniLabel, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmForeQuickDataEntry = class(TUniForm)
    pnlLeft01: TUniPanel;
    pnlForecast: TUniPanel;
    Splitter1: TUniSplitter;
    pnlItems: TUniPanel;
    Splitter2: TUniSplitter;
    IQSearchItem: TIQUniGridControl;
    Panel8: TUniPanel;
    Label5: TUniLabel;
    pnlCustomers: TUniPanel;
    Panel5: TUniPanel;
    Label1: TUniLabel;
    StatusBar1: TUniStatusBar;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    SrcArinvt: TDataSource;
    QryArinvt: TFDQuery;
    QryArinvtID: TBCDField;
    QryArinvtITEMNO: TStringField;
    QryArinvtDESCRIP: TStringField;
    QryArinvtCODE: TStringField;
    QryArinvtEPLANT_ID: TBCDField;
    QryArinvtREV: TStringField;
    QryArinvtCLASS: TStringField;
    IQSearchCustomer: TIQUniGridControl;
    SrcCustomer: TDataSource;
    QryCustomer: TFDQuery;
    QryCustomerID: TFMTBCDField;
    QryCustomerCUSTNO: TStringField;
    QryCustomerCOMPANY: TStringField;
    QryCustomerSHIP_TO_ID: TFMTBCDField;
    QryCustomerATTN: TStringField;
    QryCustomerADDR1: TStringField;
    QryCustomerCITY: TStringField;
    QryCustomerSTATE: TStringField;
    QryCustomerCOUNTRY: TStringField;
    QryCustomerZIP: TStringField;
    QryCustomerORIGIN: TStringField;
    Bevel2: TUniPanel;
    QryCustomerSORT_CRITERIA: TStringField;
    pnlForecastGrid: TUniPanel;
    Panel9: TUniPanel;
    NavForecast: TUniDBNavigator;
    gridForecast: TIQUniGridControl;
    Panel6: TUniPanel;
    Label2: TUniLabel;
    pnlForecastInstructions: TUniPanel;
    Label6: TUniLabel;
    Bevel4: TUniPanel;
    Bevel9: TUniPanel;
    Panel2: TUniPanel;
    Panel1: TUniPanel;
    btnApply: TUniButton;
    Panel3: TUniPanel;
    Bevel5: TUniPanel;
    Panel4: TUniPanel;
    Label7: TUniLabel;
    Bevel7: TUniPanel;
    Label8: TUniLabel;
    Bevel8: TUniPanel;
    Label9: TUniLabel;
    Bevel10: TUniPanel;
    SrcForecast: TDataSource;
    QryForecast: TFDQuery;
    QryForecastID: TBCDField;
    QryForecastFORE_DTL_ID: TBCDField;
    QryForecastREQ_DATE: TDateTimeField;
    QryForecastYEAR: TBCDField;
    QryForecastMONTH: TBCDField;
    QryForecastWEEK: TBCDField;
    QryForecastQTY: TFMTBCDField;
    QryForecastMonth_Disp: TStringField;
    QryForecastSUNDAY_OF_WEEK: TDateTimeField;
    QryArinvtDESCRIP2: TStringField;
    QryForecastPRICE: TFMTBCDField;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryArinvtBeforeOpen(DataSet: TDataSet);
    procedure QryCustomerBeforeOpen(DataSet: TDataSet);
    procedure IQSearchCustomerCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure FormShow(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure QryArinvtAfterScroll(DataSet: TDataSet);
    procedure comboForecastTypeChange(Sender: TObject);
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure QryForecastUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

    procedure gridForecastCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure QryForecastCalcFields(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QryForecastBeforePost(DataSet: TDataSet);
    procedure QryForecastBeforeEdit(DataSet: TDataSet);
    procedure QryForecastQTYChange(Sender: TField);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FFromDate  : TDateTime;
    FToDate    : TDateTime;
    FFilter_Arcusto_ID: Real;
    FGroup_ID  : Real;

    FFore_Item_ID: Real;
    FFore_Cust_ID: Real;
    FIsConsumeByMonthly: Boolean;

    FIsForecastRecordExists: Boolean;
    FFore_Head_ID: Real;
    FArinvt_ID: Real;

    procedure BringInstructionsToFront(AValue: Boolean);
    procedure AssignForecastVars;
    function EnsureFore_Cust_Exists: Real;
    function EnsureFore_Item_Exists: Real;
    procedure LoadTempForecastTable;
    function MinDate: TDateTime;
    function MaxDate: TDateTime;
    procedure Validate(DataSet: TDataSet);
    procedure AssignUnitPrice(ADataSet: TDataSet);
    procedure SetFore_Head_ID(const Value: Real);
    procedure SetArinvt_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShowModal(AFore_Head_ID: Real; AArinvt_ID: Real = 0);
    property Fore_Head_ID: Real read FFore_Head_ID write SetFore_Head_ID;
    property Arinvt_ID: Real write SetArinvt_ID;
  end;



implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  ForeMain,
  IQMS.Common.Miscellaneous,
  ForeEdit,
  IQMS.Common.PanelMsg;

{ TFrmForeQuickDataEntry }

class procedure TFrmForeQuickDataEntry.DoShowModal(AFore_Head_ID: Real; AArinvt_ID: Real = 0);
var
  FrmForeQuickDataEntry: TFrmForeQuickDataEntry;
begin
  FrmForeQuickDataEntry := TFrmForeQuickDataEntry.Create(uniGUIApplication.uniApplication);
  with FrmForeQuickDataEntry do
  begin
    FFromDate          := Date;
    FToDate            := TFrmForecastMain(uniGUIApplication.uniApplication).ToDate;
    FGroup_ID          := TFrmForecastMain(uniGUIApplication.uniApplication).Group_ID;
    FFilter_Arcusto_ID := TFrmForecastMain(uniGUIApplication.uniApplication).Arcusto_ID;
    FIsConsumeByMonthly:= SelectValueAsString('select fr_consume_monthly from params') = 'Y';
    Fore_Head_ID      := AFore_Head_ID;
    Arinvt_ID := AArinvt_ID;
    ShowModal;
  end;
end;

procedure TFrmForeQuickDataEntry.UniFormCreate(Sender: TObject);
var
  hMsg: TPanelMesg;
begin
  IQRegFormRead(self, [ self, pnlLeft01, pnlItems, pnlForecast, gridForecast ]);

  BringInstructionsToFront(TRUE);

  if FArinvt_ID > 0 then
  begin
    hMsg:= hPleaseWait('Locating inventory item ...');
    try
      QryArinvt.Locate('id', FArinvt_ID, []);
    finally
      hMsg.Free;
    end;
  end;

  if FFilter_Arcusto_ID > 0 then
  begin
    hMsg:= hPleaseWait('Locating customer ...');
    try
      QryCustomer.Locate('id', FFilter_Arcusto_ID, []);
    finally
      hMsg.Free;
    end;
  end;
end;

procedure TFrmForeQuickDataEntry.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmForeQuickDataEntry.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmForeQuickDataEntry.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self, pnlLeft01, pnlItems, pnlForecast, gridForecast ]);
end;

procedure TFrmForeQuickDataEntry.QryArinvtBeforeOpen(DataSet: TDataSet);
begin
//  with DataSet as TFDQuery do
//    ParamByName('group_id').asFloat:= FGroup_ID;
  AssignQueryParamValue(DataSet, 'group_id', FGroup_ID);
end;

procedure TFrmForeQuickDataEntry.QryCustomerBeforeOpen(DataSet: TDataSet);
begin
//  with DataSet as TFDQuery do
//    ParamByName('arcusto_id').asFloat:= FFilter_Arcusto_ID;
  AssignQueryParamValue(DataSet, 'arcusto_id', FFilter_Arcusto_ID);
end;

procedure TFrmForeQuickDataEntry.IQSearchCustomerCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if (QryCustomerORIGIN.asString = 'ARCUSTO') and (Field = QryCustomerCUSTNO) then
     AFont.Style:= AFont.Style + [fsBold]
end;

procedure TFrmForeQuickDataEntry.FormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //IQSearchCustomer.wwDBGrid.GroupFieldName:= 'CUSTNO'
end;

procedure TFrmForeQuickDataEntry.BringInstructionsToFront( AValue: Boolean );
begin
  pnlForecastInstructions.Visible:= AValue;
  pnlForecastGrid.Visible:= not AValue;
end;

procedure TFrmForeQuickDataEntry.QryArinvtAfterScroll(DataSet: TDataSet);
begin
  BringInstructionsToFront(TRUE);
end;

procedure TFrmForeQuickDataEntry.comboForecastTypeChange(Sender: TObject);
begin
  BringInstructionsToFront(TRUE);
end;

procedure TFrmForeQuickDataEntry.btnApplyClick(Sender: TObject);
begin
  BringInstructionsToFront(FALSE);
  AssignForecastVars;
  LoadTempForecastTable;
end;

procedure TFrmForeQuickDataEntry.AssignForecastVars;
begin
  FFore_Item_ID:= EnsureFore_Item_Exists;
  FFore_Cust_ID:= EnsureFore_Cust_Exists;
end;

function TFrmForeQuickDataEntry.EnsureFore_Item_Exists: Real;
begin
  Result:= SelectValueFmtAsFloat('select id from fore_item where arinvt_id = %f and fore_head_id = %f', [ QryArinvtID.asFloat, FFore_Head_ID ]);
  if Result > 0 then
     EXIT;

  Result:= GetNextID('fore_item');
  ExecuteCommandFmt('insert into fore_item (id, arinvt_id, fore_head_id ) values( %f, %f, %f )', [  Result, QryArinvtID.asFloat, FFore_Head_ID ]);
end;

function TFrmForeQuickDataEntry.EnsureFore_Cust_Exists: Real;
begin
  Result:= SelectValueFmtAsFloat('select id from fore_cust where fore_item_id = %f and nvl(arcusto_id,0) = %f', [ FFore_Item_ID, QryCustomerID.asFloat ]);
  if Result > 0 then
     EXIT;

  Result:= GetNextID('fore_cust');
  ExecuteCommandFmt('insert into fore_cust (id, fore_item_id, arcusto_id ) values( %f, %f, decode(%f, 0, NULL, %f))',
            [ Result, FFore_Item_ID, QryCustomerID.asFloat, QryCustomerID.asFloat ]);
end;


procedure TFrmForeQuickDataEntry.LoadTempForecastTable;
begin
  QryForecast.Close;
  try
    ExecuteCommandFmt('begin                                                                '+
              '  forecast_quick.load_temp_table( %f,                                '+ // v_fore_head_id
              '                                  %f,                                '+ // v_arinvt_id
              '                                  %f,                                '+ // v_arcusto_id
              '                                  %f,                                '+ // v_ship_to_id
              '                                  to_date(''%s'', ''mm/dd/yyyy''),   '+ // v_start_date
              '                                  to_date(''%s'', ''mm/dd/yyyy''));  '+ // v_end_date
              'end;',
              [ FFore_Head_ID,
                QryArinvtID.asFloat,
                QryCustomerID.asFloat,
                QryCustomerSHIP_TO_ID.asFloat,
                FormatDateTime( 'MM/DD/YYYY', FFromDate ),
                FormatDateTime( 'MM/DD/YYYY', FToDate) ]);
  finally
    QryForecast.Open;
  end;
end;

procedure TFrmForeQuickDataEntry.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;

procedure TFrmForeQuickDataEntry.ApplyUpdates(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
end;

procedure TFrmForeQuickDataEntry.gridForecastCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if Highlight then EXIT;

  if (Field = QryForecastMonth_Disp) or (Field = QryForecastWEEK)  then
  begin
     ABrush.Color:= clBtnFace;
     EXIT;
  end;

  if QryForecastFORE_DTL_ID.asFloat = 0 then
     AFont.Color:= clGray;

end;

procedure TFrmForeQuickDataEntry.QryForecastCalcFields(DataSet: TDataSet);
begin
  QryForecastMonth_Disp.asString:= FormatDateTime( 'mmm-yyyy', QryForecastREQ_DATE.asDateTime );
end;

procedure TFrmForeQuickDataEntry.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    QryForecast.CheckBrowseMode;
    QryForecast.Next;
    Key:= 0;
  end;
end;

procedure TFrmForeQuickDataEntry.QryForecastBeforePost(DataSet: TDataSet);
begin
  Validate(DataSet);

  if DataSet.FieldByName('FORE_DTL_ID').asFloat = 0 then
     DataSet.FieldByName('FORE_DTL_ID').asFloat:= GetNextID('fore_dtl');
end;

procedure TFrmForeQuickDataEntry.Validate(DataSet: TDataSet);
var
  DD, MM, YY: Word;
  AYear: Integer;
  AMonth: Integer;
begin
  if not ((MinDate <= DataSet.FieldByName('REQ_DATE').asDateTime) and (DataSet.FieldByName('REQ_DATE').asDateTime <= MaxDate)) then
     raise Exception.CreateFmt('Selected date must be between %s and %s', [ DateToStr(MinDate), DateToStr(MaxDate)]);

  DecodeDate( DataSet.FieldByName('req_date').asDateTime, YY, MM, DD );
  QryForecastMONTH.asFloat:= MM;
  QryForecastYEAR.asFloat:= YY;

  if FIsConsumeByMonthly then
  begin
    AYear := Trunc(SelectValueFmtAsFloat('select IQCalendar.YearOf( to_date(''%s'', ''MM/DD/YYYY'' )) from dual', [ FormatDateTime('MM/DD/YYYY', DataSet.FieldByName('REQ_DATE').asDateTime) ]));
    AMonth:= Trunc(SelectValueFmtAsFloat('select IQCalendar.MonthOf( to_date(''%s'', ''MM/DD/YYYY'' )) from dual', [ FormatDateTime('MM/DD/YYYY', DataSet.FieldByName('REQ_DATE').asDateTime) ]));

    IQAssert((MM = AMonth) and (AYear = YY),
             'Selected date belongs to the next year according to accounting calendar. Back up to the end of the previous week and try again.');

    DataSet.FieldByName('WEEK').asFloat:= SelectValueFmtAsFloat('select IQCalendar.WeekOf( to_date(''%s'', ''MM/DD/YYYY'' )) from dual', [ FormatDateTime('MM/DD/YYYY', DataSet.FieldByName('REQ_DATE').asDateTime) ]);
  end;

  (* I dont think we need to check for uniqueness because above check for correct slot will keep it up automatically
  {enforce uniqueness}
  if FIsConsumeByMonthly then
       {avoid same DAY when consumed monthly}
       IQAssert( SelectValueFmtAsFloat('select 1 from fore_dtl where fore_cust_id = %f and id <> %f  '+
                           '   and req_date = to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss'') '+
                           '   and NVL(kind, ''P'') = ''%s'' '+
                           '   and NVL(ship_to_id,0) = %f',
                           [ FFore_Cust_ID,
                             Dataset.FieldByName('fore_dtl_id').asFloat,
                             FormatDateTime( 'mm/dd/yyyy hh:nn:ss', DataSet.FieldByName('req_date').asDateTime ),
                             GetForecastType,
                             QryCustomerSHIP_TO_ID.asFloat ]) <> 1,
                 'Duplicated ''Required'' date - please choose another date')
  else
       {avoid same WEEK when consumed weekly}
       IQAssert( SelectValueFmtAsFloat('select 1 from fore_dtl where fore_cust_id = %f and id <> %f '+
                           '   and NVL(kind, ''P'') = ''%s'' '+
                           '   and year = %f and week = %f and NVL(ship_to_id,0) = %f',
                           [ FFore_Cust_ID,
                             Dataset.FieldByName('fore_dtl_id').asFloat,
                             GetForecastType,
                             Dataset.FieldByName('year').asFloat,
                             Dataset.FieldByName('week').asFloat,
                             QryCustomerSHIP_TO_ID.asFloat ]) <> 1,
                 'Duplicated week - please choose another date');
  *)
end;

function TFrmForeQuickDataEntry.MaxDate: TDateTime;
begin
  case FIsConsumeByMonthly of
    TRUE:  if QryForecastMONTH.asInteger = 12 then
              Result:= EncodeDate( QryForecastYEAR.asInteger + 1, 1, 1) - 1
           else
              Result:= EncodeDate( QryForecastYEAR.asInteger, QryForecastMONTH.asInteger + 1, 1) - 1;

    FALSE: Result:= QryForecastSUNDAY_OF_WEEK.asDateTime + 7 - 1;
  end;
end;

function TFrmForeQuickDataEntry.MinDate: TDateTime;
begin
  case FIsConsumeByMonthly of
    TRUE:  Result:= EncodeDate( QryForecastYEAR.asInteger, QryForecastMONTH.asInteger, 1);

    FALSE: Result:= QryForecastSUNDAY_OF_WEEK.asDateTime;
  end;
end;

procedure TFrmForeQuickDataEntry.QryForecastUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  if FIsForecastRecordExists then
     begin
       // update temp table
       ExecuteCommandFmt('update GTT_fore_quick_entry                         '+
                 '   set req_date =  to_date(''%s'', ''mm/dd/yyyy''), '+
                 '       year = %f,                                   '+
                 '       month = %f,                                  '+
                 '       qty = %.6f,                                  '+
                 '       price = %.6f                                 '+
                 ' where id = %f                                      ',
                 [ FormatDateTime( 'mm/dd/yyyy', ASender.FieldByName('REQ_DATE').asDateTime ),
                   ASender.FieldByName('YEAR').asFloat,
                   ASender.FieldByName('MONTH').asFloat,
                   ASender.FieldByName('QTY').asFloat,
                   ASender.FieldByName('PRICE').asFloat,
                   ASender.FieldByName('ID').asFloat ]);

       // update fore_dtl table
       ExecuteCommandFmt('update fore_dtl                                     '+
                 '   set req_date =  to_date(''%s'', ''mm/dd/yyyy''), '+
                 '       year = %f,                                   '+
                 '       week = %f,                                   '+
                 '       qty = %.6f,                                  '+
                 '       price = %.6f                                 '+
                 ' where id = %f                                      ',
                 [ FormatDateTime( 'mm/dd/yyyy', ASender.FieldByName('REQ_DATE').asDateTime ),
                   ASender.FieldByName('YEAR').asFloat,
                   ASender.FieldByName('WEEK').asFloat,
                   ASender.FieldByName('QTY').asFloat,
                   ASender.FieldByName('PRICE').asFloat,
                   ASender.FieldByName('FORE_DTL_ID').asFloat ]);
     end
  else
     begin
       // update temp table
       ExecuteCommandFmt('update GTT_fore_quick_entry                         '+
                 '   set req_date =  to_date(''%s'', ''mm/dd/yyyy''), '+
                 '       year = %f,                                   '+
                 '       month = %f,                                  '+
                 '       qty = %.6f,                                  '+
                 '       fore_dtl_id = %f,                            '+
                 '       price = %.6f                                 '+
                 ' where id = %f                                      ',
                 [ FormatDateTime( 'mm/dd/yyyy', ASender.FieldByName('REQ_DATE').asDateTime ),
                   ASender.FieldByName('YEAR').asFloat,
                   ASender.FieldByName('MONTH').asFloat,
                   ASender.FieldByName('QTY').asFloat,
                   ASender.FieldByName('FORE_DTL_ID').asFloat,
                   ASender.FieldByName('PRICE').asFloat,
                   ASender.FieldByName('ID').asFloat ]);

       // insert into fore_dtl
       ExecuteCommandFmt('insert into fore_dtl                          '+
                 '     ( id, fore_cust_id, qty, req_date, week, '+
                 '       year, ship_to_id, kind, price )        '+
                 'values                                        '+
                 '     (%f,                                     '+   // id,
                 '      %f,                                     '+   // fore_cust_id,
                 '      %.6f,                                   '+   // qty,
                 '      to_date(''%s'', ''mm/dd/yyyy''),        '+   // req_date,
                 '      %f,                                     '+   // week,
                 '      %f,                                     '+   // year,
                 '      decode(%f, 0, null, %f),                '+   // ship_to_id,
                 '      ''%s'',                                 '+   // kind
                 '      %.6f )                                  ',   // price
                 [ ASender.FieldByName('FORE_DTL_ID').asFloat,
                   FFore_Cust_ID,
                   ASender.FieldByName('QTY').asFloat,
                   FormatDateTime( 'mm/dd/yyyy', ASender.FieldByName('REQ_DATE').asDateTime ),
                   ASender.FieldByName('WEEK').asFloat,
                   ASender.FieldByName('YEAR').asFloat,
                   QryCustomerSHIP_TO_ID.asFloat,
                   QryCustomerSHIP_TO_ID.asFloat,
                   '',                                       // GetForecastType(),  obsolete
                   ASender.FieldByName('PRICE').asFloat ]);
     end;

  AAction := eaApplied;
end;

procedure TFrmForeQuickDataEntry.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
end;

procedure TFrmForeQuickDataEntry.SetFore_Head_ID(const Value: Real);
begin
  FFore_Head_ID := Value;
end;

procedure TFrmForeQuickDataEntry.QryForecastBeforeEdit(DataSet: TDataSet);
begin
  FIsForecastRecordExists:= DataSet.FieldByName('FORE_DTL_ID').asFloat > 0;
end;


procedure TFrmForeQuickDataEntry.AssignUnitPrice( ADataSet: TDataSet  );
var
  APrice: Real;
  ASysDate: TDateTime;
begin
  ASysDate:= ADataSet.FieldByName('REQ_DATE').asDateTime;
  if ASysDate = 0 then
     EXIT;

  TFrmEditForecast.AssignUnitPrice_Ex( QryArinvtID.asFloat,
                                       QryCustomerID.asFloat,
                                       ADataSet.FieldByName('QTY').asFloat,
                                       APrice,
                                       ASysDate,
                                       QryCustomerSHIP_TO_ID.asFloat );  // ForeEdit.pas
  if ADataSet.State <> dsEdit then
     ADataSet.Edit;
  ADataSet.FieldByName('PRICE').asFloat:= APrice;
end;

procedure TFrmForeQuickDataEntry.QryForecastQTYChange(Sender: TField);
begin
  AssignUnitPrice( Sender.DataSet );
end;

end.


