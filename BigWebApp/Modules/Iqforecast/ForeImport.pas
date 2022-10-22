unit ForeImport;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Dialogs,
  DB,
  Clipbrd,
  DBCtrls,
  Forms,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule;

type
  TExcelRow = record
    Arinvt_ID : Real;
    Arcusto_ID: Real;
    Price     : Real;
    Req_Date  : TDateTime;
    Qty       : Real;
    Note      : string;
    Ship_to_ID: Real;
    Division  : string;
  end;

type
  TIQImportForecastFromExcel = class
  private
    // Property variables
    FExcelFileName : string;
    FDataSheetName : string;
    FFore_Item_ID  : Real;
    FFore_Cust_ID  : Real;
    FBatch_ID      : Real;
    FFore_Head_ID: Real;

    FSuppressToLog: Boolean;
    FOnException: TExceptionEvent;
    FErrorCount: Integer;

    procedure CreateOLEObjects;
    procedure ImportData;
    procedure GroupItemsByCustomer;
//     procedure AssignVars( I: Integer );
    procedure AssignRecords( I: Integer );
    procedure ProcessRecords;
    procedure GetForeItemID(Arinvt_id:Real);
    procedure GetForeCustID(Arcusto_id:Real);
    procedure CleanForeDtl;
    procedure InsertForeDtl(AQry:TFDQuery);
    function ValidVars(AQry:TFDQuery): boolean;
    procedure CloseExcelNoSave;
    function ImportExcelPricing: Boolean;
    procedure SeFore_Head_ID(const Value: Real);

    procedure LocalExceptionHandler(Sender: TObject; E: Exception);
    procedure WriteToLog(S: string);
    procedure ReportError( E: Exception); overload;
    procedure ReportError( S: string; AKind: string = 'I' ); overload;
    procedure ShowFinished;
  protected
  public
    FOwner: TComponent;

    // OLE object variables
    Excel    : variant;
    WorkBook : variant;
    DataSheet: variant;
    FBatch   : Real;

    constructor Create( AOwner: TComponent; AFore_Head_ID: Real );
    procedure Execute;
    property Fore_Head_ID: Real read FFore_Head_ID write SeFore_Head_ID;
  end;

var
  ExcelRow: TExcelRow;

const
  c_semicolon_substitute = chr(1);
  c_CR_LF_substitute     = chr(2);

implementation

uses
  ComObj,
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  ForeMain,
  ForeEdit,
  Variants,
  IQMS.Common.PanelMsg,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  wwSystem
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //IQChkPoint
  ;

constructor TIQImportForecastFromExcel.Create( AOwner: TComponent; AFore_Head_ID: Real );
begin
  inherited Create;
  FOwner         := AOwner;
  FExcelFileName := ForeMain.FExcelForecastFile;
  FDataSheetName := 'Data';
  Fore_Head_ID   := AFore_Head_ID;
  FSuppressToLog := SelectValueAsString('select fr_imp_log_mesg from params') = 'Y';
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //IQChkPoint.CheckPointFileName:= IQGetLocalHomePath + 'ForecastLog.txt';  { IQMisc }
end;

procedure TIQImportForecastFromExcel.Execute;
begin
  FErrorCount:= 0;
  if FSuppressToLog then
  begin
     WriteToLog(' ');
     WriteToLog('Forecast Import Started');
  end;

  FOnException:= Application.OnException;
  try
    Application.OnException:= LocalExceptionHandler;
    try
      CreateOLEObjects;
      ImportData;
      { TODO -oSanketG -cWebConvert : Need to revisit }
      //TFrmForecastMain(FOwner).NavMain.BtnClick( nbRefresh );
    except
      on E: EAbort do;
      on E: Exception do ReportError( E );
    end;
  finally
    Application.OnException:= FOnException;
  end;
end;


procedure TIQImportForecastFromExcel.LocalExceptionHandler( Sender: TObject; E: Exception );
begin
  ReportError( E );
end;

procedure TIQImportForecastFromExcel.CreateOLEObjects;
begin
  try
    Excel:= CreateOLEObject('Excel.Application');
    try
      if FileExists(FExcelFileName) then
      begin
        WorkBook:= Excel.Workbooks.Open(FExcelFileName);
        DataSheet:= WorkBook.Worksheets[FDataSheetName];
      end;
    except on E: Exception do
      begin
        ReportError( E );
        Excel.Quit;
        Abort;
      end;
    end;
  except
    Abort;
  end;
end;


procedure TIQImportForecastFromExcel.ImportData;
var
  I: Integer;
  ACount: Integer;
  hMsg: TPanelMesg;
begin
  try
    GroupItemsByCustomer;

    FBatch := GetNextID('FORE_TMP_IMP_EXCEL');
    // import rows from excel
    hMsg:= hPleaseWait;
    ACount:= DataSheet.UsedRange.Rows.Count;
    try
      for I:= 3 to ACount do
      begin
        hMsg.Mesg:= Format('Reading Excel Data %d/%d ...', [ I-2, ACount-2 ]);
        AssignRecords(I);
      end;
    finally
      hMsg.Free;
    end;

    // populate forecast
    ProcessRecords;

    // finished
    ShowFinished;
  finally
    CloseExcelNoSave;
  end;
end;

procedure TIQImportForecastFromExcel.ProcessRecords;
var
  AQry:TFDQuery;
  Arinvt_id, Arcusto_Id, AShip_To_Id:Real;
  AMonthYear:String;
  AFieldMonthYear:String;
  aFore_Cust_ID:Real;
  AMsg: TPanelMesg;
begin
  aFore_Cust_ID := -1;
  Arinvt_id     := -1;
  Arcusto_Id    := -1;
  AShip_To_Id   := -1;
  AMonthYear    := 'Z';

  AMsg:= hPleaseWait('');
  AQry:= TFDQuery.Create(nil);
  with AQry do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IqFormat('select * from FORE_TMP_IMP_EXCEL where batch = %f order by arcusto_id, arinvt_id, To_Char(req_date, ''MMRRRR''), ship_to_id', [FBatch]));
    Open;
    while not eof do
    begin
      try
        Arinvt_id   := FieldByName('arinvt_id').asFloat;
        AMsg.Mesg:= Format('Processing Item# %s...', [ SelectValueByID( 'itemno', 'arinvt', Arinvt_id )]);
        Arcusto_Id  := FieldByName('arcusto_id').asFloat;
        GetForeItemID(FieldByName('arinvt_id').asFloat);
        GetForeCustID(FieldByName('arcusto_id').asFloat);
        AFieldMonthYear := SelectValueFmtAsString('select To_Char(req_date, ''MMRRRR'') from FORE_TMP_IMP_EXCEL where id = %f', [FieldByName('id').asFloat]);

        if (FFore_Cust_ID <> aFore_Cust_ID) or (FieldByName('ship_to_id').asFloat <> AShip_to_id)  or (AFieldMonthYear <> AMonthYear) then
        begin
          aFore_Cust_ID := FFore_Cust_ID;
          AShip_To_Id := FieldByName('ship_to_id').asFloat;
          AMonthYear  := AFieldMonthYear;

          if AShip_To_Id = 0 then
            ExecuteCommandFmt( 'delete from fore_dtl where fore_cust_id = %f and To_Char(req_date, ''MMRRRR'') = ''%s''',
                    [ FFore_Cust_ID,
                      AMonthYear ])
          else
            ExecuteCommandFmt( 'delete from fore_dtl where fore_cust_id = %f and ship_to_id = %f and To_Char(req_date, ''MMRRRR'') = ''%s''',
                    [ FFore_Cust_ID,
                      AShip_To_Id,
                      AMonthYear ]);
        end;

        if ValidVars(AQry) then
           InsertForeDtl(AQry);

      except on E: Exception do
        ReportError( E );
      end;

      Next;
    end;
  finally
    Free;
    AMsg.free;
    ExecuteCommandFmt('delete from FORE_TMP_IMP_EXCEL where batch = %f', [FBatch]);
  end;
end;


procedure TIQImportForecastFromExcel.SeFore_Head_ID(const Value: Real);
begin
  FFore_Head_ID := Value;
end;

procedure TIQImportForecastFromExcel.GroupItemsByCustomer;
var
  ARngStr: String;
begin
  ARngStr:= 'A3:Z'+IntToStr(DataSheet.UsedRange.Rows.Count);
  DataSheet.Unprotect;
  DataSheet.Range[ARngStr].Sort( Key1:=DataSheet.Range['B3'],  {arinvt_id}
                                 Order1:=1,                    {xlAscending}
                                 Header:=2,                    {xlNo}
                                 OrderCustom:=1,
                                 MatchCase:=False,
                                 Orientation:=1,               {xlTopToBottom}
                                 Key2:=DataSheet.Range['F3'],  {arcusto_id}
                                 Order2:=1 );                  {xlAscending}
  DataSheet.Protect;
  //WorkBook.Save;
end;

// 06-20-2014 seems to be obsolete
// procedure TIQImportForecastFromExcel.AssignVars( I: Integer );
// var
//   J       : Integer;
//   AText   : string;
//   ATmpStr : string;
//
//   ADateStr: string;
//   APrice: Real;
//   ASysDate: TDateTime;
//
// begin
//   with ExcelRow do
//   begin
//     Arinvt_ID := DataSheet.Cells[ I,  2 ].Value;
//     Arcusto_ID:= DataSheet.Cells[ I,  6 ].Value;
//     Price     := DataSheet.Cells[ I,  8 ].Value;
//     Req_Date  := 0;
//     if DataSheet.Cells[ I, 10 ].Value > 0 then
//     begin
//        // Req_Date:= IQStrToDate( DataSheet.Cells[ I, 10 ].Value );  {take english date string and convert to Tdatetime}
//        ADateStr:= DataSheet.Cells[ I, 10 ].Value;
//        {Attempt to convert using default delphi StrToDate. Unfortunately it will bomb if format is dd-MMM-yy. Resort to wwStrToDateVal}
//        try
//          Req_Date:= StrToDate( ADateStr );
//        except on E: Exception do
//          Req_Date:= wwStrToDateVal( ADateStr );  {wwSystem.pas}
//        end;
//     end;
//
//     Qty:= DataSheet.Cells[ I, 11 ].Value;
//
//     ATmpStr   := '';
//     AText     := '';
//
//     for J:= 12 to 19 do
//     begin
//       ATmpStr:= DataSheet.Cells[ I, J ];
//       AText:= AText + ATmpStr;
//     end;
//
//     Note:= StrTran( StrTran( AText, c_semicolon_substitute, ';' ), c_CR_LF_substitute, #13#10 );
//   end;
// end;

procedure TIQImportForecastFromExcel.AssignRecords( I: Integer );
var
  J       : Integer;
  AText   : string;
  ATmpStr : string;

  ADateStr: string;
  APrice: Real;
  ASysDate: TDateTime;

begin
  with ExcelRow do
  try
    Arinvt_ID := DataSheet.Cells[ I,  2 ].Value;
    Arcusto_ID:= DataSheet.Cells[ I,  6 ].Value;
    Price     := DataSheet.Cells[ I,  8 ].Value;
    Ship_To_ID:= DataSheet.Cells[ I,  13 ].Value;
    Division  := DataSheet.Cells[ I,  15 ].Value;
    Req_Date  := 0;
    if DataSheet.Cells[ I, 10 ].Value > 0 then
    begin
       // Req_Date:= IQStrToDate( DataSheet.Cells[ I, 10 ].Value );  {take english date string and convert to Tdatetime}
       ADateStr:= DataSheet.Cells[ I, 10 ].Value;
       {Attempt to convert using default delphi StrToDate. Unfortunately it will bomb if format is dd-MMM-yy. Resort to wwStrToDateVal}
       try
         Req_Date:= StrToDate( ADateStr );
       except on E: Exception do
         Req_Date:= wwStrToDateVal( ADateStr );  {wwSystem.pas}
       end;
    end;

    Qty:= DataSheet.Cells[ I, 11 ].Value;

    ASysDate := Req_Date;
    if ASysDate = 0 then
       ASysDate:= Date;

    // 06-20-2014 this will get executed in InsertForeDtl down the road
    // if not ImportExcelPricing() then
    // begin
    //   TFrmEditForecast.AssignUnitPrice_Ex( Arinvt_ID, ARCUSTO_ID, QTY, APrice, ASysDate, Ship_To_ID); {in ForeEdit.pas}
    //   Price := APrice;
    // end;

    ATmpStr   := '';
    AText     := '';

    for J:= 15 to 22 do
    begin
      ATmpStr:= DataSheet.Cells[ I, J ];
      if ATmpStr > '' then
         AText:= AText + ATmpStr;
    end;

    // 06-20-2014 - seems to be obsolete
    // Note:= StrTran( StrTran( AText, c_semicolon_substitute, ';' ), c_CR_LF_substitute, #13#10 );

    ExecuteCommandFmt('insert into FORE_TMP_IMP_EXCEL (batch,       ' +
                                             '  arinvt_id,   ' +
                                             '  arcusto_id,  ' +
                                             '  price,       ' +
                                             '  req_date,    ' +
                                             '  qty,         ' +
                                             '  note1,       ' +
                                             '  ship_to_id,  ' +
                                             '  division)    ' +
                                             ' values (%f,   ' +
                                             ' %f,           ' +
                                             ' %f,           ' +
                                             ' %.6f,          ' +
                                             ' decode(''%s'', null, null, To_Date(''%s'', ''MM/DD/RRRR'')), ' +
                                             ' %.6f,            ' +
                                             ' ''%s'',          ' +
                                             ' %.f,             ' +
                                             ' ''%s'')          ',
                                             [FBatch,
                                              Arinvt_Id,
                                              Arcusto_Id,
                                              Price,
                                              ADateStr,
                                              FormatDateTime('mm/dd/yyyy', Req_Date),
                                              Qty,
                                              StrTran(Note, '''', ''''''),
                                              Ship_to_ID,
                                              Division]);
  except on E: Exception do
    ReportError( E );
  end;
end;


procedure TIQImportForecastFromExcel.GetForeItemID(Arinvt_Id:Real);
begin
  FFore_Item_ID:= SelectValueFmtAsFloat( 'select id from fore_item where arinvt_id = %f and fore_head_id = %f', [ Arinvt_ID, Fore_Head_ID ]);

  if FFore_Item_ID = 0 then
  begin
    FFore_Item_ID:= GetNextID('fore_item');
    ExecuteCommandFmt('insert into fore_item (id, arinvt_id, fore_head_id ) values (%f, %f, %f)',
              [ FFore_Item_ID, Arinvt_ID, Fore_Head_ID ]);
  end;
end;

procedure TIQImportForecastFromExcel.GetForeCustID(Arcusto_Id:Real);
begin
  if Arcusto_ID = 0 then
     FFore_Cust_ID:= SelectValueFmtAsFloat( 'select id from fore_cust where fore_item_id = %f and arcusto_id is NULL', [ FFore_Item_ID ])
  else
     FFore_Cust_ID:= SelectValueFmtAsFloat( 'select id from fore_cust where fore_item_id = %f and arcusto_id = %f', [ FFore_Item_ID, Arcusto_ID ]);

  if FFore_Cust_ID = 0 then
  begin
    FFore_Cust_ID:= GetNextID('fore_cust');

    ExecuteCommandFmt('insert into fore_cust (id, fore_item_id, arcusto_id) ' +
              'values (%f, %f, decode(%f, 0, null, %f))',
              [ FFore_Cust_ID, FFore_Item_ID, Arcusto_ID, Arcusto_ID]);
  end;
end;

procedure TIQImportForecastFromExcel.CleanForeDtl;
begin
  if FBatch_ID <> FFore_Cust_ID then
  begin
    ExecuteCommandFmt( 'delete from fore_dtl where fore_cust_id = %f', [ FFore_Cust_ID]);
    FBatch_ID:= FFore_Cust_ID;
  end;
end;

function TIQImportForecastFromExcel.ValidVars(AQry:TFDQuery): boolean;
var
  A    : Variant;
  AMsg : string;
begin
  AMsg:= '';
  IQAssert( SelectValueFmtAsFloat('select 1 from arinvt where id = %f',  [ AQry.FieldByName('Arinvt_ID').asFloat ]) = 1, Format('Arinvt ID = %0.f not found', [ AQry.FieldByName('Arinvt_ID').asFloat ]));

  if AQry.FieldByName('Arcusto_ID').asFloat > 0 then
     IQAssert( SelectValueFmtAsFloat('select 1 from arcusto where id = %f', [ AQry.FieldByName('Arcusto_ID').asFloat ]) = 1, Format('Arcusto ID = %0.f not found', [ AQry.FieldByName('Arcusto_ID').asFloat ]));

  if (AQry.FieldByName('Qty').asFloat = 0) and (AQry.FieldByName('Req_Date').asDateTime > 0) then
    AMsg:= Format( 'Missing quantity for customer (arcusto_id = %f) and item (arinvt_id = %f)', [ AQry.FieldByName('Arcusto_ID').asFloat, AQry.FieldByName('Arinvt_ID').asFloat  ]);

  if (AQry.FieldByName('Qty').asFloat > 0) and (AQry.FieldByName('Req_Date').asDateTime = 0) then
    AMsg:= Format( 'Missing required date for customer (arcusto_id = %f) and item (arinvt_id = %f)', [ AQry.FieldByName('Arcusto_ID').asFloat, AQry.FieldByName('Arinvt_ID').asFloat ]);


  Result:= AMsg = '';

  if AMsg > '' then // MessageDlg(AMsg, mtInformation, [mbOk], 0)
     ReportError( AMsg );
end;

procedure TIQImportForecastFromExcel.InsertForeDtl(AQry:TFDQuery);
var
  APrice: Real;
  ADivision_ID: Real;
begin
  try
  if ImportExcelPricing() then
     APrice:= AQry.FieldByName('Price').asFloat
  else
     TFrmEditForecast.AssignUnitPrice_Ex( AQry.FieldByName('Arinvt_ID').asFloat, AQry.FieldByName('Arcusto_ID').asFloat, AQry.FieldByName('Qty').asFloat, APrice ); {ForeEdit.pas}

  if AQry.FieldByName('Division').IsNull then
    ADivision_ID := 0
  else
    ADivision_ID := SelectValueFmtAsFloat('select id from division where upper(name) = ''%s''', [UpperCase(AQry.FieldByName('Division').AsString)]);

  if AQry.FieldByName('Req_Date').asDateTime > 0 then
     ExecuteCommandFmt('insert into fore_dtl (fore_cust_id, qty, price, req_date, note1, ship_to_id, division_id) ' +
               'values (%f, %.6f, %.6f, to_date(''%s'', ''mm/dd/yyyy''), ''%s'', decode(%f, 0, null, %f), decode(%f, 0, null, %f))',
               [ FFore_Cust_ID,
                 AQry.FieldByName('Qty').asFloat,
                 APrice,
                 FormatDateTime('mm/dd/yyyy', AQry.FieldByName('Req_Date').asDateTime),
                 StrTran(AQry.FieldByName('Note1').asString, '''', ''''''),
                 AQry.FieldByName('ship_to_id').asFloat,
                 AQry.FieldByName('ship_to_id').asFloat,
                 ADivision_ID,
                 ADivision_ID]);

  except on E: Exception do
    ReportError( E );
  end;
end;

procedure TIQImportForecastFromExcel.CloseExcelNoSave;
begin
  WorkBook.Close(False);
  Excel.Quit;
end;

function TIQImportForecastFromExcel.ImportExcelPricing: Boolean;
begin
  Result:= SelectValueAsString('select fr_import_excel_price from params') = 'Y';
end;

procedure TIQImportForecastFromExcel.WriteToLog( S: string );
begin
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //TFrmCheckPointList.Add( S );
end;

procedure TIQImportForecastFromExcel.ReportError( S: string; AKind: string = 'I');
begin
  Inc( FErrorCount );

  if FSuppressToLog then
     WriteToLog( S )

  else if AKind = 'E' then
     IQError( S )

  else
     MessageDlg( S, mtInformation, [mbOk], 0)
end;

procedure TIQImportForecastFromExcel.ReportError( E: Exception );
begin
  ReportError( E.Message, 'E' );
end;


procedure TIQImportForecastFromExcel.ShowFinished;
var
  S: string;
begin
  if not FSuppressToLog then
     S:= Format('The data import from %s is finished.',
                [ FExcelFileName ])
  else if FErrorCount = 0 then
     S:= Format('The data import from %s is finished with no errors.',
                [ FExcelFileName ])
  else
     S:= Format('The data import from %s is finished with %d errors.'#13+
                'Would you like to see the log file?',
                [ FExcelFileName, FErrorCount ]);

  if not FSuppressToLog or (FErrorCount = 0) then
     IQInformation( S )
  else if IQConfirmYN( S ) then
     { TODO -oSanketG -cWebConvert : Need to revisit }
     //TFrmCheckPointList.DoShow;
end;

end.



