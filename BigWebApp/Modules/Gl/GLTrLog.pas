unit GLTrLog;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Menus,
  IQMS.WebVcl.Search,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.About,
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
  IQMS.WebVcl.Jump,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniBasicGrid,
  uniStringGrid,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniPageControl, IQUniGrid, uniGUIFrame;

type
  TFrmGLTransLog = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Help1: TUniMenuItem;
    Exit1: TUniMenuItem;
    About1: TUniMenuItem;
    QryTransLog: TFDQuery;
    QryTransLogTRANS_DATE: TDateTimeField;
    QryTransLogTRANS_IN_OUT: TStringField;
    QryTransLogTRANS_QUAN: TFMTBCDField;
    QryTransLogRG_QUAN: TFMTBCDField;
    QryTransLogTRANS_TYPE: TStringField;
    QryTransLogLOC_DESC: TStringField;
    QryTransLogLOTNO: TStringField;
    QryTransLogACT_COST: TFMTBCDField;
    QryTransLogTRANS_REASON: TStringField;
    QryTransLogBEGIN_QUAN: TBCDField;
    QryTransLogBEGIN_RG_QUAN: TBCDField;
    QryTransLogSTD_COST: TFMTBCDField;
    QryTransLogFG_LOTNO: TStringField;
    QryTransLogBATCH: TBCDField;
    QryTransLogPARENT_ARINVT_ID: TBCDField;
    QryTransLogARINVT_ID: TBCDField;
    QryTransLogUSERID: TStringField;
    QryTransLogFGMULTI_CUSER1: TStringField;
    QryTransLogFGMULTI_CUSER2: TStringField;
    QryTransLogFGMULTI_CUSER3: TStringField;
    QryTransLogRECEIPTNO: TStringField;
    QryTransLogDIVISION_NAME: TStringField;
    QryTransLogTRANS_CODE: TStringField;
    QryTransLogTRANS_DESCRIP: TStringField;
    QryTransLogLOCATION_DESCRIP: TStringField;
    QryTransLogID: TBCDField;
    QryTransLogEXCLUDE_RPT: TStringField;
    QryTransLogWORKORDER_ID: TBCDField;
    QryTransLogSOURCE: TStringField;
    QryTransLogSOURCE_ID: TBCDField;
    QryTransLogBEGIN_QUAN_TOTAL: TBCDField;
    QryTransLogBEGIN_RG_QUAN_TOTAL: TBCDField;
    SrcTransLog: TDataSource;
    IQAbout1: TIQWebAbout;
    QryTransLogITEMNO: TStringField;
    QryTransLogDESCRIP: TStringField;
    QryTransLogCLASS: TStringField;
    QryTransLogREV: TStringField;
    QryBatch: TFDQuery;
    DateTimeField1: TDateTimeField;
    StringField1: TStringField;
    FloatField1: TFMTBCDField;
    FloatField2: TFMTBCDField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField3: TFMTBCDField;
    StringField5: TStringField;
    FloatField4: TFMTBCDField;
    FloatField5: TFMTBCDField;
    FloatField6: TFMTBCDField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    FloatField7: TFMTBCDField;
    FloatField8: TFMTBCDField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    FloatField9: TBCDField;
    FloatField10: TBCDField;
    FloatField11: TBCDField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    FloatField12: TBCDField;
    StringField20: TStringField;
    FloatField13: TBCDField;
    StringField21: TStringField;
    FloatField14: TBCDField;
    QryJournal: TFDQuery;
    DateTimeField2: TDateTimeField;
    StringField22: TStringField;
    FloatField15: TFMTBCDField;
    FloatField16: TFMTBCDField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    FloatField17: TFMTBCDField;
    StringField26: TStringField;
    FloatField18: TFMTBCDField;
    FloatField19: TFMTBCDField;
    FloatField20: TFMTBCDField;
    StringField27: TStringField;
    StringField28: TStringField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField32: TStringField;
    StringField33: TStringField;
    FloatField21: TFMTBCDField;
    FloatField22: TFMTBCDField;
    StringField34: TStringField;
    StringField35: TStringField;
    StringField36: TStringField;
    StringField37: TStringField;
    FloatField23: TBCDField;
    FloatField24: TBCDField;
    FloatField25: TBCDField;
    StringField38: TStringField;
    StringField39: TStringField;
    StringField40: TStringField;
    FloatField26: TBCDField;
    StringField41: TStringField;
    FloatField27: TBCDField;
    StringField42: TStringField;
    FloatField28: TBCDField;
    QryTransLogDAY_PART_ID: TBCDField;
    PopupMenu1: TUniPopupMenu;
    JumpToProductionReporting1: TUniMenuItem;
    QryBatchDAY_PART_ID: TBCDField;
    QryJournalDAY_PART_ID: TBCDField;
    QryBatchGLACCT_ID: TFMTBCDField;
    Panel1: TUniPanel;
    StringGrid1: TUniStringGrid;
    Splitter1: TUniSplitter;
    JumptoPO1: TUniMenuItem;
    QryBatchPoNumber: TStringField;
    QryBatchReceiptNum: TStringField;
    QryBatchItem: TStringField;
    QryBatchDescription: TStringField;
    QryBatchUser_Id: TStringField;
    QryBatchVendor: TStringField;
    QryBatchLocation: TStringField;
    QryBatchLotNum: TStringField;
    QryBatchDivision: TStringField;
    QryBatchGlAcct: TStringField;
    QryBatchQuantity: TFloatField;
    QryBatchStdCost: TFloatField;
    QryBatchTotalCost: TFloatField;
    QryBatchActCost: TFloatField;
    QryBatchTotalActCost: TFloatField;
    PC: TUniPageControl;
    TabTranlog: TUniTabSheet;
    TabGlBatch: TUniTabSheet;
    IQSearch1: TIQUniGridControl;
    IQSearch2: TIQUniGridControl;
    SrcGlBatch: TDataSource;
    QryBatchBatchCost: TFloatField;
    QryBatchTotalBatchCost: TFloatField;
    PopupMenu2: TUniPopupMenu;
    JumpToProductionReporting2: TUniMenuItem;
    JumptoPO2: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure JumpToProductionReporting1Click(Sender: TObject);
    procedure QryBatchAfterScroll(DataSet: TDataSet);
    procedure JumptoPO1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure QryBatchCalcFields(DataSet: TDataSet);
    procedure JumpToProductionReporting2Click(Sender: TObject);
    procedure JumptoPO2Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FBatchCost:Real;
    FActBatchCost:Real;
    FFieldName: String;
    FId: Real;
    FGlacctId: Real;
    procedure FetchArrayValues;
    procedure SetFieldName(const Value: String);
    procedure SetId(const Value: Real);
    procedure SetGlacctId(const Value: Real);
  public
    { Public declarations }
    procedure DoShow;
    procedure DoShowGlBatch;
    procedure DoShowJournal;

    property FieldName : String write SetFieldName;
    property Id: Real write SetId;
    property GlacctId: Real write SetGlacctId;
  end;

procedure DoShowGLTransLogTransactions(AFieldName:String; AId:Real; AGlacctId:Real = 0);

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.NLS,
  IQMS.Common.UserMessages;
  { TODO -oathite -cWebConvert : Dependent on pomain
  pomain;}

{$R *.DFM}

procedure DoShowGLTransLogTransactions(AFieldName:String; AId:Real; AGlacctId:Real = 0);
var
  LFrmGLTransLog :TFrmGLTransLog;
begin
  if AFieldName = 'GLBATCHID_ID' then
  begin
    LFrmGLTransLog := TFrmGLTransLog.Create(UniApplication);

    LFrmGLTransLog.FieldName := AFieldName;
    LFrmGLTransLog.Id :=  AId;
    LFrmGLTransLog.GlacctId := AGlacctId;

    LFrmGLTransLog.DoShowGlBatch;
    LFrmGLTransLog.ShowModal;
  end
  else
  begin
    LFrmGLTransLog := TFrmGLTransLog.Create(UniApplication);

    LFrmGLTransLog.FieldName := AFieldName;
    LFrmGLTransLog.Id :=  AId;

    LFrmGLTransLog.DoShowJournal;
    LFrmGLTransLog.Show;
  end;
end;

procedure TFrmGLTransLog.DoShow;
var
  AOrderBy:String;
  APos:Integer;
begin
  QryTransLog.Close;
  PC.ActivePage := TabTranlog;

  APos := Pos('ORDER BY', UpperCase(QryTransLog.Sql.Text));
  if APos <> 0 then
  begin
    AOrderBy := Copy (QryTransLog.Sql.Text, APos, Length(QryTransLog.Sql.Text));
    QryTransLog.Sql.Text := Copy(QryTransLog.Sql.Text, 1, (APos - 1));
    QryTransLog.Sql.Text := StrTran(QryTransLog.Sql.Text,
                                    'where g.translog_id = t.id',
                                    IQFormat('where g.translog_id = t.id and %s = %f ', [FFieldName, FId]));

    QryTransLog.Sql.Text := QryTransLog.Sql.Text + ' ' + AOrderBy;
  end
  else
    QryTransLog.Sql.Text := StrTran(QryTransLog.Sql.Text,
                                    'where g.translog_id = t.id',
                                    IQFormat('where g.translog_id = t.id and %s = %f ', [FFieldName, FId]));
  Reopen(QryTransLog);
//  QryTransLog.Open;
end;

procedure TFrmGLTransLog.DoShowGlBatch;
var
  AOrderBy:String;
  APos:Integer;
begin
  { TODO -oathite -cWebConvert : Undeclare identifier UseTFields
  IQSearch1.DBGrid.UseTFields := false; }
  PC.ActivePage := TabGlBatch;

//  SrcTransLog.DataSet := QryBatch;
  QryBatch.Close;
  QryBatch.ParamByName('aId').Value := FId;
  QryBatch.ParamByName('aGlacctId').Value := FGlacctId;
  QryBatch.ParamByName('aGlacctId2').Value := FGlacctId;
  try
    QryBatch.Afterscroll := nil;
    FBatchCost := 0;
    FActBatchCost := 0;
    QryBatch.DisableControls;
    QryBatch.Open;
    QryBatch.First;
    while not QryBatch.eof do
    begin
      FBatchCost := SelectValueFmtAsFloat('select trans_misc.GetTotalCost(%f) from dual', [QryBatch.FieldByName('ID').asFloat]) + FBatchCost;
      FActBatchCost := SelectValueFmtAsFloat('select trans_misc.GetActTotalCost(%f) from dual', [QryBatch.FieldByName('ID').asFloat]) + FActBatchCost;
      QryBatch.Next;
    end;
  finally
    QryBatch.Afterscroll := QryBatchAfterScroll;
    QryBatch.EnableControls;
    QryBatch.Close;
    QryBatch.Open;
  end;
  IQRegFormRead( self, [self, IQSearch1.DBGrid, Panel1]);

//  Reopen(QryBatch);
//  QryTransLog.Open;
end;

procedure TFrmGLTransLog.DoShowJournal;
var
  AOrderBy:String;
  APos:Integer;
begin
  { TODO -oathite -cWebConvert : Undeclare identifier UseTFields
  IQSearch1.DBGrid.UseTFields := false; }
  PC.ActivePage := TabTranlog;
  Panel1.visible := false;
  Splitter1.visible := false;
  IQSearch1.Align := AlClient;
  SrcTransLog.DataSet := QryJournal;
  QryJournal.Close;
  QryJournal.ParamByName('aId').Value := FId;
  IQRegFormRead( self, [self, IQSearch1.DBGrid]);
  QryJournal.Open;
//  Reopen(QryJournal);
//  QryTransLog.Open;
end;


procedure TFrmGLTransLog.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, IQSearch1.DBGrid, Panel1]);
end;

procedure TFrmGLTransLog.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmGLTransLog.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmGLTransLog.JumpToProductionReporting1Click(Sender: TObject);
var
  ADayProd_ID: Integer;
  ADay_Part_ID: Real;
begin
  ADay_Part_ID:= IQSearch1.DataSource.DataSet.FieldByName('DAY_PART_ID').asFloat;
  if ADay_Part_ID = 0 then
     EXIT;

  ADayProd_ID:= Trunc(SelectValueByID('dayprod_id', 'day_part', ADay_Part_ID ));
  if ADayProd_ID = 0 then
     ADayProd_ID:= Trunc(SelectValueByID('dayprod_id', 'pday_part', ADay_Part_ID ));

  IQMS.WebVcl.Jump.JumpDirect( iq_JumpToProdDispo, ADayProd_ID );
end;

procedure TFrmGLTransLog.QryBatchAfterScroll(DataSet: TDataSet);
var
  i:integer;
  aCount:integer;
  AType:String;
  AValue:String;
  Anum:Real;
begin
  { TODO -oathite -cWebConvert : Undeclare identifier Objects
  with StringGrid1 do
  begin
    if Trim(Cells[0, Row]) <> '' then
    begin
      Objects[0, RowCount - 1].Free;

      RowCount := RowCount - 1;
    end;

  end;}
  StringGrid1.Cells[0, 0] := 'Title';
  StringGrid1.Cells[1, 0] := 'Value';
  ExecuteCommandFmt('begin trans_misc.PopulateArrays(%f, %f, ''%s'',''%s''); end;',
           [QryBatch.FieldByName('ID').asFloat,
            QryBatch.FieldByName('GLACCT_ID').asFloat,
            StrTran(QryBatch.FieldByName('TRANS_REASON').asString, '''', ''''''),
            QryBatch.FieldByName('TRANS_TYPE').asString]);
  ACount := Trunc(SelectValueAsFloat('select trans_misc.arr_count from dual'));
  StringGrid1.RowCount := ACount + 1;
  for I := 1 to ACount do
  begin
    AType := SelectValueFmtAsString('select trans_misc.arr_get_type(%d) from dual', [I]);
    StringGrid1.Cells[0, I] := SelectValueFmtAsString('select trans_misc.arr_get_title(%d) from dual', [I]);
    AValue := SelectValueFmtAsString('select trans_misc.arr_get_value(%d) from dual', [I]);
    if AType = 'N' then
      StringGrid1.Cells[1, I] := SelectValueFmtAsString('select LPad(''%s'', 15, '' '') from dual', [StrTran(AValue, '''', '''''')])
    else if AType = 'M' then
    begin
      try
        Anum := StrToFloat(AValue);
      except
        if Pos(',', AValue) <> 0 then
          AValue := StrTran(AValue, ',', '.')
        else
          AValue := StrTran(AValue, '.', ',');
         Anum := StrToFloat(AValue);
      end;

      StringGrid1.Cells[1, I] := SelectValueFmtAsString('select LPad(''%s'', 15, '' '') from dual', [StrTran(IqFormat('%m', [Anum]), '''', '''''')])
    end
    else
      StringGrid1.Cells[1, I] := AValue;
  end;
  ACount := StringGrid1.RowCount + 1;
  StringGrid1.RowCount := ACount;
  StringGrid1.Cells[0, ACount - 1] := 'Batch Total';

  StringGrid1.Cells[1, ACount - 1] := SelectValueFmtAsString('select LPad(''%s'', 15, '' '') from dual', [StrTran(Format('%m', [FBatchCost]), '''', '''''')   ]);

  ACount := StringGrid1.RowCount + 1;
  StringGrid1.RowCount := ACount;
  StringGrid1.Cells[0, ACount - 1] := 'Batch Total Act Cost';

  StringGrid1.Cells[1, ACount - 1] := SelectValueFmtAsString('select LPad(''%s'', 15, '' '') from dual', [StrTran(Format('%m', [FActBatchCost]), '''', '''''') ]);


end;


procedure TFrmGLTransLog.JumptoPO1Click(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : depend on pomain
  DoIQJumpToPo( self,  IQSearch1.DataSet.FieldByName('SOURCE_ID').asFloat ); { pomain.pas}
end;

procedure TFrmGLTransLog.PopupMenu1Popup(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Undeclare identifier MenuEnabled
  IQSearch1.MenuEnabled(JumptoPO1, IQSearch1.DataSource.DataSet.FieldByName('SOURCE').asString = 'PO_DETAIL'); }
end;

procedure TFrmGLTransLog.QryBatchCalcFields(DataSet: TDataSet);
begin
  FetchArrayValues;
end;

procedure TFrmGLTransLog.SetFieldName(const Value: String);
begin
  FFieldName := Value;
end;

procedure TFrmGLTransLog.SetGlacctId(const Value: Real);
begin
 FGlacctId := Value;
end;

procedure TFrmGLTransLog.SetId(const Value: Real);
begin
  FId := Value;
end;

procedure TFrmGLTransLog.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
end;

procedure TFrmGLTransLog.FetchArrayValues;
var
  i:integer;
  aCount:integer;
  AType:String;
  AValue:String;
  Anum:Real;
  ATitle:String;
  AStr:String;
begin
  ExecuteCommandFmt('begin trans_misc.PopulateArrays(%f, %f, ''%s'',''%s''); end;',
           [QryBatch.FieldByName('ID').asFloat,
            QryBatch.FieldByName('GLACCT_ID').asFloat,
            StrTran(QryBatch.FieldByName('TRANS_REASON').asString, '''', ''''''),
            QryBatch.FieldByName('TRANS_TYPE').asString]);
  ACount := Trunc(SelectValueAsFloat('select trans_misc.arr_count from dual'));
  StringGrid1.RowCount := ACount + 1;
  for I := 1 to ACount do
  begin
    AType  := SelectValueFmtAsString('select trans_misc.arr_get_type(%d) from dual', [I]);
    ATitle := SelectValueFmtAsString('select trans_misc.arr_get_title(%d) from dual', [I]);
    AValue := SelectValueFmtAsString('select trans_misc.arr_get_value(%d) from dual', [I]);

    if AType = 'N' then
    begin
      try
        Anum := StrToFloat(AValue);
      except
        if Pos(',', AValue) <> 0 then
          AValue := StrTran(AValue, ',', '.')
        else
          AValue := StrTran(AValue, '.', ',');
         Anum := StrToFloat(AValue);
      end;
    end
    else if AType = 'M' then
    begin
      try
        Anum := StrToFloat(AValue);
      except
        if Pos(',', AValue) <> 0 then
          AValue := StrTran(AValue, ',', '.')
        else
          AValue := StrTran(AValue, '.', ',');
         Anum := StrToFloat(AValue);
      end;
    end
    else
      aStr := AValue;


    if ATitle = 'PO Number'            then QryBatchPoNumber.asString     := AStr
    else if ATitle = 'Receipt#'        then QryBatchReceiptNum.asString   := AStr
    else if ATitle = 'Quantity'        then QryBatchQuantity.asFloat      := Anum
    else if ATitle = 'Std Cost'        then QryBatchStdCost.asFloat       := Anum
    else if ATitle = 'Total Cost'      then QryBatchTotalCost.asFloat     := Anum
    else if ATitle = 'Act Cost'        then QryBatchActCost.asFloat       := Anum
    else if ATitle = 'Total Act Cost'  then QryBatchTotalActCost.asFloat  := Anum
    else if ATitle = 'Item'            then QryBatchItem.asString         := AStr
    else if ATitle = 'Description'     then QryBatchDescription.asString  := AStr
    else if ATitle = 'User ID'         then QryBatchUser_Id.asString      := AStr
    else if ATitle = 'Vendor'          then QryBatchVendor.asString       := AStr
    else if ATitle = 'Location'        then QryBatchLocation.asString     := AStr
    else if ATitle = 'Lot#'            then QryBatchLotNum.asString       := AStr
    else if ATitle = 'Division'        then QryBatchDivision.asString     := AStr
    else if ATitle = 'GL Acct#'        then QryBatchGlAcct.asString       := AStr;
  end;
  QryBatchBatchCost.asFloat      := FBatchCost;
  QryBatchTotalBatchCost.asFloat := FActBatchCost;
end;

procedure TFrmGLTransLog.JumpToProductionReporting2Click(Sender: TObject);
var
  ADayProd_ID: Integer;
  ADay_Part_ID: Real;
begin
  ADay_Part_ID:= IQSearch2.DataSource.DataSet.FieldByName('DAY_PART_ID').asFloat;
  if ADay_Part_ID = 0 then
     EXIT;

  ADayProd_ID:= Trunc(SelectValueByID('dayprod_id', 'day_part', ADay_Part_ID ));
  if ADayProd_ID = 0 then
     ADayProd_ID:= Trunc(SelectValueByID('dayprod_id', 'pday_part', ADay_Part_ID ));

  IQMS.WebVcl.Jump.JumpDirect( iq_JumpToProdDispo, ADayProd_ID );
end;


procedure TFrmGLTransLog.JumptoPO2Click(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Depend on pomain
  DoIQJumpToPo( self,  IQSearch2.DataSource.DataSet.FieldByName('SOURCE_ID').asFloat ); { pomain.pas}
end;

end.
