unit cdallinv;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Buttons,
  CD_Main,
  IQMS.WebVcl.Search,
  Vcl.Menus,
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel, IQUniGrid, uniGUIFrame;

type
  TFrmCDAllInv = class(TUniForm)
    Panel1: TUniPanel;
    NavInv: TUniDBNavigator;
    Panel2: TUniPanel;
    BtnAssign: TUniBitBtn;
    SrcAllInv: TDataSource;
    QryAllInv: TFDQuery;
    QryAllInvON_HOLD: TStringField;
    QryAllInvINVOICE_NO: TStringField;
    QryAllInvINVOICE_DATE: TDateTimeField;
    QryAllInvDUE_DATE: TDateTimeField;
    QryAllInvDISC_DATE: TDateTimeField;
    QryAllInvREMIT_TO_ATTN: TStringField;
    QryAllInvCURR_CODE: TStringField;
    QryAllInvCURRENCY_DESCRIP: TStringField;
    QryAllInvCOMPANY: TStringField;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    sbFilter: TUniSpeedButton;
    sbClear: TUniSpeedButton;
    IQSearch1: TIQUniGridControl;
    btnCancel: TUniButton;
    Panel5: TUniPanel;
    SBPrint: TUniBitBtn;
    Panel6: TUniPanel;
    lblBankBalance: TUniLabel;
    lblTotalCheck: TUniLabel;
    lblAdjustedBalance: TUniLabel;
    Label2: TUniLabel;
    edAcctBal: TUniEdit;
    edRunTot: TUniEdit;
    edRunBal: TUniEdit;
    edDiscTot: TUniEdit;
    sbNoCal: TUniSpeedButton;
    lblMinus: TUniLabel;
    lblEquals: TUniLabel;
    Label1: TUniLabel;
    EdTotalBal: TUniEdit;
    PopupMenu1: TUniPopupMenu;
    VendorTotal1: TUniMenuItem;
    Label3: TUniLabel;
    sbRunTot: TUniSpeedButton;
    QryAllInvINVOICE_AMOUNT: TBCDField;
    QryAllInvAMOUNT_PAID: TFMTBCDField;
    QryAllInvDISCOUNT_TAKEN: TFMTBCDField;
    QryAllInvAMOUNT_TO_PAY: TFMTBCDField;
    QryAllInvCURRENT_DISCOUNT: TFMTBCDField;
    QryAllInvACTUAL_AMT_TO_PAY: TFMTBCDField;
    QryAllInvACTUAL_DISCOUNT: TFMTBCDField;
    QryAllInvEPLANT_ID: TBCDField;
    QryAllInvID: TBCDField;
    QryAllInvVENDOR_ID: TBCDField;
    QryAllInvTERMS_ID: TBCDField;
    QryAllInvDISCOUNT_DAYS: TFMTBCDField;
    QryAllInvDISCOUNT: TFMTBCDField;
    QryAllInvREMIT_TO_ID: TBCDField;
    QryAllInvCURRENCY_ID: TBCDField;
    QryAllInvACCT_ID_APDISC: TFMTBCDField;
    {
    procedure GridInvCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    }
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryAllInvUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure BtnAssignClick(Sender: TObject);
    procedure sbRunTotClick(Sender: TObject);
    procedure sbFilterClick(Sender: TObject);
    procedure sbClearClick(Sender: TObject);
    procedure QryAllInvBeforeOpen(DataSet: TDataSet);
    procedure btnCancelClick(Sender: TObject);
    procedure SBPrintClick(Sender: TObject);
    procedure sbNoCalClick(Sender: TObject);
    procedure IQSearch1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure IQSearch1AfterUnSelectAll(Sender: TObject);
    procedure IQSearch1AfterSelectAll(Sender: TObject);
    procedure IQSearch1AfterToggleSelection(Sender: TObject);
    procedure IQSearch1TitleButtonClick(Sender: TObject);
    procedure IQSearch1AfterSortChange(Sender: TObject);
    procedure VendorTotal1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    Fsql :String;
    FP_Sql :String;
    FP_SqlNodate :String;
    FPrint:Boolean;
    FBatchSeq:Real;
    FCdPrepostIds:TStringList;
    FIdList:TStringList;
    FASql: String;
    FASqlNoDate: String;

    procedure AppendVendors;
    function  VendorFound(AVendors:TStringList; AID:String):Boolean;
    function  RemitToFound(ARemitTo:TStringList; AID:String):Boolean;
    procedure AssignChecks;
    procedure CallPrintForm;
    procedure wwDBGridMultiSelectRecord(Grid: TIQUniGridControl; Selecting: Boolean; var Accept: Boolean);
    procedure CalculateTotalBalance;
    procedure SetASql(const Value: String);
    procedure SetASqlNoDate(const Value: String);
  public
    { Public declarations }
    //constructor Create(AOwner:TComponent; ASql, ASqlNoDate:String);

  end;

procedure DoCDAllInvoices(ASql, ASqlNoDate:String);


implementation

{$R *.DFM}

uses
  cd_rscstr,
  cdConfEFT,
  CDPrint,
  CDVendorAging,
  edbadord,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Sequence,
  IQMS.Common.StringUtils,
  ta_rscstr,
  VStatChk;

procedure DoCDAllInvoices(ASql, ASqlNoDate:String);
var
  LFrmCDAllInv : TFrmCDAllInv;
begin
  LFrmCDAllInv := TFrmCDAllInv.Create(uniGUIApplication.UniApplication);
  with LFrmCDAllInv do
  begin
    FP_Sql := ASql;
    FP_SqlNoDate := ASqlNoDate;
    sbRunTot.Visible := false;
  end;
end;

(*
constructor TFrmCDAllInv.Create(AOwner:TComponent; ASql, ASqlNoDate:String);
begin
  inherited Create(Aowner);
  FP_Sql := ASql;
  FP_SqlNoDate := ASqlNoDate;
  sbRunTot.Visible := false;

  {'When button is down, all invoices are displayed regardless of date.'#13 +
   'When button is up, invoices are displayed within the specified date range.'}
  sbNoCal.Hint := cd_rscstr.cTXT0000068;

  sbNoCalClick(nil);
//  with QryAllInv do
//  begin
//    Close;
//    Sql.Clear;
//    Sql.Add(ASql);
//    if SelectValueAsString('select NVL(multicurrency, ''N'') from iqsys') = 'Y' then
//      Sql.Add(Format('and NVL(v.currency_id, 0) = %f',
//      [TFrmCD(AOwner).DM.TblPrePostCtrl.FieldByName('CURRENCY_ID').asFloat]));
//    FSql := Sql.Text;
//    Sql.Add('order by v.invoice_date');
//    ParamByName('nDate').Value :=
//      FormatDateTime('mm/dd/yyyy', TFrmCD(AOwner).DM.TblPrePostCtrl.FieldByName('CHECK_DATE').asDateTime);
//    Open;
//  end;

  IQSetTablesActiveEx( True, self, cd_rscstr.cTXT0000075 {'Accessing database.  Please wait.'} );
  IQRegFormRead( self, [self]);
  edAcctBal.Text := Format('%m', [SelectValueFmtAsFloat('select total_balance from v_glacct_current_balance where glacct_id = %f',

                               [TFrmCD(AOwner).DM.TblPrePostCtrl.FieldByName('GlAcct_Id_Cash').asFloat])]);
  {IqSearch1.wwDBGrid.Color := clbtnFace;
  IqSearch1.wwDBGrid.Ctl3D := False;
  IqSearch1.wwDBGrid.EditControlOptions := [ecoSearchOwnerForm, ecoDisableDateTimePicker];
  IqSearch1.wwDBGrid.OnMultiSelectRecord := wwDBGridMultiSelectRecord;
  }
end;
*)
procedure TFrmCDAllInv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Screen.Cursor := crDefault;
   IQRegFormWrite( self, []);
end;
{
procedure TFrmCDAllInv.GridInvCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if (UpperCase(Field.FieldName) = 'ACTUAL_AMT_TO_PAY')
     or (UpperCase(Field.FieldName) = 'ACTUAL_DISCOUNT')
    then if (not Highlight) then ABrush.Color := clWindow;

end;
}

procedure TFrmCDAllInv.QryAllInvUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
//
end;

procedure TFrmCDAllInv.BtnAssignClick(Sender: TObject);
begin
  if QryAllInv.Eof and QryAllInv.Bof then
    Exit;
  FPrint := False;
  AssignChecks;
  Close;
end;

function TFrmCDAllInv.VendorFound(AVendors:TStringList; AID:String):Boolean;
var
  i:Integer;
begin
  Result := False;
  for i := 0 to AVendors.Count - 1 do
    if AVendors[i] = AID then
    begin
      Result := True;
      Exit;
    end;
  AVendors.Add(AID);
end;

function TFrmCDAllInv.RemitToFound(ARemitTo:TStringList; AID:String):Boolean;
var
  i:Integer;
begin
  Result := False;
  for i := 0 to ARemitTo.Count - 1 do
    if ARemitTo[i] = AID then
    begin
      Result := True;
      Exit;
    end;
  ARemitTo.Add(AID);
end;

procedure TFrmCDAllInv.AppendVendors;
var
  AVendors:TStringList;
  ARemitTo:TStringList;
  i:Integer;
  ABadVendors:TStringList;
  ASeq:Integer;
  AId:Real;
  ASpotRate:Real;
  Anative_curr, ACurr_Code:String;
  ACurrId:Real;
  AOldSpotRate:Real;
begin
  with IqSearch1.DBGrid, IqSearch1.DBGrid.datasource.dataset do
  try
    ARemitTo := TStringList.Create;
    AVendors := TStringList.Create;
    ABadVendors := TStringList.Create;
    if FPrint then
      FBatchSeq := GetNextSequenceNumber('S_CDPREPOST_CD_PRINT_BATCH')
    else
      FBatchSeq := 0;


    ASeq := 0;
    for i:= 0 to SelectedRows.Count-1 do
    begin
      GotoBookmark(SelectedRows.items[i]);
      if QryAllInvON_HOLD.AsString = 'N' then
      begin

        if RemitToFound(ARemitTo, FieldByName('REMIT_TO_ID').asString) then Continue;
        if not VendorFound(AVendors, FieldByName('VENDOR_ID').asString) then
        try
          CheckVendStatusFor( FieldByName('VENDOR_ID').asFloat,
                            ['Payment Hold', 'Not Active'] );  {in VStatChk.pas}
        except
          on E:Exception do
          begin
            IqConfirm(E.Message);
            Continue;
          end;
        end;

        if SelectValueAsFloat(IQFormat('select count(c.id) from cdprepost c, cdprepost_control d where c.cdprepost_control_id = d.id and c.vendor_id = %f ' +
                           ' and c.remit_to_id = %f and NVL(d.eplant_id, 0) = %f',
                         [FieldByName('VENDOR_ID').asFloat,
                          FieldByName('REMIT_TO_ID').asFloat,
                          TFrmCD(self.Owner).DM.TblPrePostCtrl.FieldByName('EPLANT_ID').asFloat])) <> 0 then
        begin
          ABadVendors.Add(Padr(FieldByName('COMPANY').asString, 30) +
           ' ' + cd_rscstr.cTXT0000069 {(Exists in the prepost table)'});
          Continue;
        end;

//        if TFrmCD(self.Owner).FMultiCurrency and (FieldByName('CURRENCY_ID').asFloat <> 0) and
//           (FieldByName('CURRENCY_ID').asFloat <> TFrmCD(self.Owner).DM.TblPrePostCtrl.FieldByName('CURRENCY_ID').asFloat)
//          then
//          begin
//            ABadVendors.Add(Padr(FieldByName('COMPANY').asString, 30) + ' (Has different currency)');
//            Continue;
//          end;

        if FPrint then
          Inc(ASeq)
        else
          ASeq := 0;

        AId := GetNextID('CDPREPOST');
        FCDPrepostIds.Add(IntToStr(Trunc(AId)));


        ExecuteCommandFmt('insert into cdprepost (id, cdprepost_control_id, vendor_id, remit_to_id, print, ' +
                                         'check_type, order_seq, CD_PRINT_BATCH, currency_id) ' +
                  'values (%f, %f, %f, Decode(%f, 0, null, %f), ''Y'', ''AP'', %d, %f, Decode(%f, 0, null, %f))',
                  [AId,
                   TFrmCD(self.Owner).DM.TblPrePostCtrl.FieldByName('ID').asFloat,
                   FieldByName('VENDOR_ID').asFloat,
                   FieldByName('REMIT_TO_ID').asFloat,
                   FieldByName('REMIT_TO_ID').asFloat,
                   ASeq,
                   FBatchSeq,
                   FieldByName('CURRENCY_ID').asFloat,
                   FieldByName('CURRENCY_ID').asFloat]);

       if TFrmCD(self.Owner).DM.TblPrePostCtrlEPLANT_ID.asFloat <> 0 then
         ExecuteCommandFmt('update cdprepost set eplant_id = %f where id = %f',
                   [TFrmCD(self.Owner).DM.TblPrePostCtrlEPLANT_ID.asFloat, AId]);



         if (FieldByName('CURRENCY_ID').asFloat <> 0) and
            (TFrmCD(self.Owner).DM.TblPrePostCtrl.FieldByName('CURRENCY_ID').asFloat <> 0) then
         begin


            Anative_curr := SelectValueFmtAsString('select curr_code from currency where id = %f',
            [TFrmCD(self.Owner).DM.TblPrePostCtrl.FieldByName('CURRENCY_ID').asFloat]);

            Acurr_code := SelectValueFmtAsString('select curr_code from currency where id = %f',
            [FieldByName('CURRENCY_ID').asFloat]);


            ACurrId := SelectValueFmtAsFloat('select id from currency where native_curr = ''%s'' and curr_code = ''%s''',
            [Anative_curr, Acurr_code]);

            ASpotrate := SelectValueFmtAsFloat('select balsheet_rate from currencypost where currency_id = %f and glperiods_id = %f',
                         [ACurrId,
                          TFrmCD(self.Owner).DM.TblPrePostCtrl.FieldByName('GLPERIODS_ID').asFloat]);

            if ASpotrate = 0 then
            begin
              AOldSpotRate := ASpotRate;


              if SelectValueFmtAsString('select NVL(use_daily_rate, ''N'') from currency where id = %f', [ACurrId]) = 'Y' then
              begin
                ASpotRate := SelectValueFmtAsFloat('select min(spot_rate) ' +
                                       '     from currency_rate_hist ' +
                                       '    where currency_id = %f   ' +
                                       '      and effective_date <= (select check_date from cdprepost_control h, cdprepost d  ' +
                                                                       ' where d.id = %f and d.cdprepost_control_id = h.id) ' +
                                       '      and effective_date = (select max(effective_date) ' +
                                       '                              from currency_rate_hist  ' +
                                       '                             where currency_id = %f    ' +
                                       '                               and effective_date <= (select check_date from cdprepost_control h, cdprepost d  ' +
                                                                       ' where d.id = %f and d.cdprepost_control_id = h.id))',

                                       [ACurrId,
                                        AId,
                                        ACurrId,
                                        AId]);
              if ASpotrate = 0 then
                ASpotRate := AOldSpotRate;
              end;

            end;

            if ASpotrate = 0 then
              ASpotrate := SelectValueFmtAsFloat('select spot_rate from currency where id = %f',
                                      [ACurrId]);


            if ASpotrate <> 0 then
              ExecuteCommandFmt('update cdprepost set exchange_rate = %.6f, currency_id = decode(%f, 0, null, %f) where id = %f',
                        [ASpotRate, ACurrId , ACurrId , AId]);





{           ASpotRate := SelectValueFmtAsFloat('select spot_rate from currency where id = %f',
                                  [FieldByName('CURRENCY_ID').asFloat]);
           ExecuteCommandFmt('update cdprepost set exchange_rate = %.6f where id = %f',
                     [ASpotrate/TFrmCD(self.Owner).DM.TblPrePostCtrl.FieldByName('SPOTRATE').asFloat, AId])  }
         end;
      end;

    end;
    if ABadVendors.Count <> 0 then
      DoShowCDErrors( ABadVendors, cd_rscstr.cTXT0000016 {'Rejected Vendors'} );    {in edbadord.pas (EDI)}
  finally
    ARemitTo.Free;
    AVendors.Free;
    ABadVendors.Free;
  end;


end;


procedure TFrmCDAllInv.sbRunTotClick(Sender: TObject);
var
  i: integer;
  ABal :Real;
  AId:Real;
begin

  AId := QryAllInvID.asFloat;
  try
    IqSearch1.DBGrid.DataSource.Dataset.DisableControls;
    if QryAllInv.Eof and QryAllInv.Bof then
    begin
      edRunTot.Text  := '';
      edDiscTot.Text := '';
      edRunBal.Text  := '';
      Exit;
    end;

    edDiscTot.Text := '0';
    edRunTot.Text  := '0';
    ABal :=  SelectValueFmtAsFloat('select total_balance from v_glacct_current_balance where glacct_id = %f',
                                 [TFrmCD(Owner).DM.TblPrePostCtrl.FieldByName('GlAcct_Id_Cash').asFloat]);

    with IqSearch1.DBGrid, IqSearch1.DBGrid.datasource.dataset do
    for i:= 0 to SelectedRows.Count-1 do
    begin
      GotoBookmark(SelectedRows.items[i]);
      ABal := ABal - FieldByName('ACTUAL_AMT_TO_PAY').asFloat - FieldByName('ACTUAL_DISCOUNT').asFloat;
      edRunTot.Text  := FloatToStr(StrToFloat(edRunTot.Text) + FieldByName('ACTUAL_AMT_TO_PAY').asFloat);
      edDiscTot.Text := FloatToStr(StrToFloat(edDiscTot.Text) + FieldByName('ACTUAL_DISCOUNT').asFloat);
    end;
    edRunTot.Text  := Format('%m', [StrToFloat(edRunTot.Text)]);
    edDiscTot.Text := Format('%m', [StrToFloat(edDiscTot.Text)]);
    edRunBal.Text  := Format('%m', [ABal]);
//    if IqSearch1.wwDBGrid.SelectedList.Count > 0 then
//      IqSearch1.wwDBGrid.DataSource.Dataset.GotoBookmark(IqSearch1.wwDBGrid.SelectedList.items[0])
//    else
      QryAllInv.Locate('ID', AId, []);
  finally
    IqSearch1.DBGrid.DataSource.Dataset.EnableControls;
  end;

end;

procedure TFrmCDAllInv.SetASql(const Value: String);
begin
  FASql := Value;
end;

procedure TFrmCDAllInv.SetASqlNoDate(const Value: String);
begin
  FASqlNoDate := Value;
end;

procedure TFrmCDAllInv.UniFormCreate(Sender: TObject);
begin
  {IqSearch1.DBGrid.Color := clbtnFace;
  IqSearch1.DBGrid.Ctl3D := False;
  IqSearch1.DBGrid.EditControlOptions := [ecoSearchOwnerForm, ecoDisableDateTimePicker];
  IqSearch1.DBGrid.OnMultiSelectRecord := wwDBGridMultiSelectRecord;
  }

end;

procedure TFrmCDAllInv.UniFormShow(Sender: TObject);
begin
  sbNoCal.Hint := cd_rscstr.cTXT0000068;
  IQSetTablesActiveEx( True, self, cd_rscstr.cTXT0000075 {'Accessing database.  Please wait.'} );
  IQRegFormRead( self, [self]);
  edAcctBal.Text := Format('%m', [SelectValueFmtAsFloat('select total_balance from v_glacct_current_balance where glacct_id = %f',

                               [TFrmCD(uniGUIApplication.UniApplication).DM.TblPrePostCtrl.FieldByName('GlAcct_Id_Cash').asFloat])]);
   sbNoCalClick(nil);
end;

procedure TFrmCDAllInv.sbFilterClick(Sender: TObject);
var
  i: integer;
  AIDS:String;
  AorderBy:String;
begin

  if IqSearch1.DBGrid.SelectedRows.Count = 0 then
     // 'Please select one or more records.'
     raise Exception.Create(cd_rscstr.cTXT0000070);

  with IqSearch1.DBGrid, IqSearch1.DBGrid.datasource.dataset do
  for i:= 0 to SelectedRows.Count-1 do
  begin
    GotoBookmark(SelectedRows.items[i]);
    AIDS := FieldByName('ID').asString + ', ' + AIDS;
  end;
  if Trim(AIDS) <> '' then
  with QryAllinv do
  begin
    Aorderby := StrTran(StrTran(Copy(Sql.Text, Pos('ORDER BY', Uppercase(Sql.Text)), length(Sql.Text)), #13, ' '), #10, ' ');
    IQRegFormWrite( self, [self]);
    Close;
    Sql.Text := Fsql;
    Sql.Add(Format(' and v.id in (%s)', [Copy(AIDS, 1, Length(AIDS) - 2)]));
    if Aorderby  = '' then
      Sql.Add('order by v.invoice_date ')
    else
      Sql.Add(Aorderby);
//    Sql.Add('order by v.invoice_date');
    Open;
    //IqSearch1.DBGrid.UnSelectAll;
    IQRegFormRead( self, [self]);
    //IqSearch1.DBGrid.SelectAll;
  end;
end;

procedure TFrmCDAllInv.sbClearClick(Sender: TObject);
var
  AorderBy:String;
begin
  AorderBy := '';
  with QryAllinv do
  begin
    Aorderby := StrTran(StrTran(Copy(Sql.Text, Pos('ORDER BY', Uppercase(Sql.Text)), length(Sql.Text)), #13, ' '), #10, ' ');
    IQRegFormWrite( self, [self]);
    Close;
    Sql.Text := Fsql;
    if Aorderby  = '' then
      Sql.Add('order by v.invoice_date ')
    else
      Sql.Add(Aorderby);
//    Sql.Add('order by v.invoice_date');
    Open;
    { TODO -ombaral -cWEBIQ : Resolve dependency
    IqSearch1.wDBGrid.UnSelectAll;
    }
    IQRegFormRead( self, [IqSearch1.DBGrid]);

  end;
end;

procedure TFrmCDAllInv.AssignChecks;
var
  i:integer;
  APrepostId:Real;
  ASql:String;
  aSeq:Real;
  AEft:String;
  AConfirm:Integer;
  AAmount, AVendorId:Real;
  AVendor:String;
begin

  AConfirm := 10;
  FCdPrepostIds := TStringList.Create;
  try
    if IqSearch1.DBGrid.SelectedRows.Count = 0 then
    begin
      // 'No records selected.  Do you want to process all?'
      if not IqConfirmYN(cd_rscstr.cTXT0000071) then Exit
      else
         // IqSearch1.DBGrid.SelectAll;
  //    begin
  //      QryAllInv.First;
  //      while not QryAllInv.Eof do
  //      begin
  //        IqSearch1.wwDBGrid.SelectRecord;
  //        Next;
  //      end;
  //    end;
    end;

    AppendVendors;

    with IqSearch1.DBGrid, IqSearch1.DBGrid.datasource.dataset do
    for i:= 0 to SelectedRows.Count-1 do
    begin
      GotoBookmark(SelectedRows.items[i]);
      if QryAllInvON_HOLD.AsString = 'N' then
      begin

        APrepostId := SelectValueFmtAsFloat('select id from cdprepost where cdprepost_control_id = %f ' +
                                'and vendor_id = %f and remit_to_id = %f ' +
  //                              'and vendor_id = %f and remit_to_id = %f and NVL(currency_id, 0) = %f ' +
                                ' and NVL(check_no, 0) = 0 ',
                                [TFrmCD(self.Owner).DM.TblPrePostCtrl.FieldByName('ID').asFloat,
                                 FieldByName('VENDOR_ID').asFloat,
                                 FieldByName('REMIT_TO_ID').asFloat]);
  //                               FieldByName('CURRENCY_ID').asFloat]);
        if APrepostId = 0 then Continue;

        if SelectValueAsFloat(IQFormat('select count(id) from cdprepost_detail where apinvoice_id = %f and cdprepost_id = %f',
                         [FieldByName('ID').asFloat,
                          APrepostId])) <> 0
           then Continue;

        if FPrint then
          ASeq := GetNextSequenceNumber('S_CDPREPOST_DETAIL_ORDER_SEQ')
        else
          ASeq := 0;


        ASql := 'insert into cdprepost_detail (cdprepost_id,                                                         ' +
                '                               amount_paid,                                                         ' +
                '                               apinvoice_id,                                                        ' +
                '                               ORDER_SEQ,                                                           ' +
                '                               ap_discount_taken,                                                   ' +
                '                               glacct_id_ap_disc)                                                   ' +
                ' values(%f, ' +
                '        %f, ' +
                '        %f, ' +
                '        %f, ' +
                '        %f, ' +
                ' Decode(%f, 0, null, %f))';

        ASql := IQFormat(ASql,
                       [APrepostId,
                        FieldByName('ACTUAL_AMT_TO_PAY').asFloat,
                        FieldByName('ID').asFloat,
                        ASeq,
                        FieldByName('ACTUAL_DISCOUNT').asFloat,
                        FieldByName('ACTUAL_DISCOUNT').asFloat,
                        FieldByName('acct_id_apdisc').asFloat]);
{
        if (FieldByName('ACTUAL_AMT_TO_PAY').asFloat < 0) then
        begin
          if SelectValueFmtAsString('select NVL(eft, ''N'') from cdprepost_control where id = %f',
             [TFrmCD(self.Owner).DM.TblPrePostCtrl.FieldByName('ID').asFloat]) = 'Y' then
          begin
            if AConfirm = 0 then Continue
            else if AConfirm <> 1 then
            begin
              AConfirm := IQDialogChkEx( TFrmCDConfEFT, cd_rscstr.cTXT0000088, 'CD_ConfirmEFT' );
              if AConfirm <> 1 then
                Continue;
            end
          end
        end;
}
        ExecuteCommand(ASql);


      end;
    end;

    if SelectValueFmtAsString('select NVL(eft, ''N'') from cdprepost_control where id = %f',
    [TFrmCD(self.Owner).DM.TblPrePostCtrl.FieldByName('ID').asFloat]) = 'Y' then
      for I := 0 to FCDPrepostIds.Count - 1 do
      begin
        AAmount := SelectValueFmtAsFloat('select sum(amount_paid) from cdprepost_detail where cdprepost_id = %s', [FCDPrepostIds[I]]);
        if AAmount <= 0 then
        begin
          AVendorId := SelectValueFmtAsFloat('select vendor_id from cdprepost where id = %s', [FCDPrepostIds[I]]);
          AVendor := SelectValueFmtAsString('select company || '' ('' || trim(vendorno) || '')'' from vendor where id = %f', [AVendorId]);
          (*  TODO -ombaral -cWEBIQ : Resolve dependency
          AConfirm := IQDialogChkEx( TFrmCDConfEFT, IqFormat(cd_rscstr.cTXT0000090, [AVendor]), 'CD_ConfirmEFT' );
          if AConfirm <> 1 then
            ExecuteCommandFmt('delete from cdprepost where id = %s', [FCDPrepostIds[I]]);
          *)
        end;
      end;

  finally
    FCdPrepostIds.Free;
  end;
  TFrmCD(Owner).DM.QryPrePost.Close;
  TFrmCD(Owner).DM.QryPrePost.Open;
  TFrmCD(Owner).DM.TblPrePost.Refresh;
  TFrmCD(Owner).DM.QryPrepostDtl.Close;
  TFrmCD(Owner).DM.QryPrepostDtl.Open;
  TFrmCD(Owner).QryPrePostAfterScroll(nil);
end;


procedure TFrmCDAllInv.CallPrintForm;
begin
  with TFrmCD(Owner).DM.QryPrePostPr do
  begin
    Close;
    Sql.Clear;
    Sql.Add(IQFormat(TFrmCD(self.Owner).FPrintSql + ' and c.CD_PRINT_BATCH = %f', [FBatchSeq]));
    Open;
  end;
  DOCDPrint(TFrmCD(Owner), 'ORDER_SEQ');         {CDPrint.pas}
end;

procedure TFrmCDAllInv.QryAllInvBeforeOpen(DataSet: TDataSet);
begin
  if TFrmCd(Self.Owner).DM.TblPrePostCtrl.FieldByName('EPLANT_ID').asFloat <> 0 then
    IQAssignEPlantFilterParam( DataSet,
                               FloatToStr(TFrmCd(Owner).DM.TblPrePostCtrl.FieldByName('EPLANT_ID').asFloat),
                               SecurityManager.EPlant_Include_Nulls)
  else
    IQAssignEPlantFilter( DataSet );  {pas}
end;

procedure TFrmCDAllInv.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCDAllInv.SBPrintClick(Sender: TObject);
begin
  if QryAllInv.Eof and QryAllInv.Bof then
    Exit;
  FPrint := True;
  AssignChecks;
  CallPrintForm;
  Close;
end;

procedure TFrmCDAllInv.sbNoCalClick(Sender: TObject);
var
  AorderBy:String;
begin
 AorderBy := '';
  with QryAllInv do
  try
    Aorderby := StrTran(StrTran(Copy(Sql.Text, Pos('ORDER BY', Uppercase(Sql.Text)), length(Sql.Text)), #13, ' '), #10, ' ');
    Close;
    Sql.Clear;
    if sbNoCal.Down then
      Sql.Add(FP_SqlNoDate)
    else
      Sql.Add(FP_Sql);
    CalculateTotalBalance;

//    if SelectValueAsString('select NVL(multicurrency, ''N'') from iqsys') = 'Y' then
//      Sql.Add(Format('and NVL(v.currency_id, 0) = %f',
//      [TFrmCD(self.Owner).DM.TblPrePostCtrl.FieldByName('CURRENCY_ID').asFloat]));
    FSql := Sql.Text;
    if Aorderby  = '' then
      Sql.Add('order by v.invoice_date ')
    else
      Sql.Add(Aorderby);
    ParamByName('nDate').Value :=
      FormatDateTime('mm/dd/yyyy', TFrmCD(self.Owner).DM.TblPrePostCtrl.FieldByName('CHECK_DATE').asDateTime);
  finally
    Open;
  end;
end;

procedure TFrmCDAllInv.wwDBGridMultiSelectRecord(Grid: TIQUniGridControl; Selecting: Boolean; var Accept: Boolean);
begin
  if (Selecting and (QryAllInvON_HOLD.AsString = 'Y')) then
    Accept := False;
end;

procedure TFrmCDAllInv.CalculateTotalBalance;
var
  aStr:String;
  aDatStr:String;
begin
  aDatStr := Format('''%s''', [FormatDateTime('mm/dd/yyyy', TFrmCD(self.Owner).DM.TblPrePostCtrl.FieldByName('CHECK_DATE').asDateTime)]);
  aStr := StrTran(QryAllInv.Sql.Text, ':nDate', aDatStr);
  EdTotalBal.Text := Format('%m', [SelectValueFmtAsFloat('select sum(amount_to_pay) from (%s) where misc.eplant_filter(eplant_id) = 1 ', [aStr])]);
end;

procedure TFrmCDAllInv.IQSearch1AfterSelectAll(Sender: TObject);
begin
  sbRunTotClick(nil);
end;

procedure TFrmCDAllInv.IQSearch1AfterToggleSelection(Sender: TObject);
begin
  sbRunTotClick(nil);
end;

procedure TFrmCDAllInv.IQSearch1AfterUnSelectAll(Sender: TObject);
begin
  sbRunTotClick(nil);
end;

procedure TFrmCDAllInv.IQSearch1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  sbRunTotClick(nil);
end;

procedure TFrmCDAllInv.IQSearch1TitleButtonClick(Sender: TObject);
var
  i: integer;
begin
  if IqSearch1.DBGrid.SelectedRows.Count= 0 then exit;
  if FIdList = nil then
    FIdList := TStringList.Create
  else
    FIdList.Clear;
  try
    IqSearch1.DBGrid.DataSource.Dataset.DisableControls;
    with IqSearch1.DBGrid, IqSearch1.DBGrid.datasource.dataset do
    for i:= 0 to SelectedRows.Count-1 do
    begin
      GotoBookmark(SelectedRows.items[i]);
      FIdList.Add(IntToStr(Trunc(QryAllInvID.asFloat)));
    end;
  finally
    IqSearch1.DBGrid.DataSource.Dataset.EnableControls;
  end;
end;

procedure TFrmCDAllInv.IQSearch1AfterSortChange(Sender: TObject);
var
  i:integer;
  AId:Real;
begin
  if (FIdList <> nil) and (FIdList.Count <> 0) then
  begin
    for i := 0 to FIdList.Count - 1 do
    begin
      AId := StrToFloat(FIdList[I]);
      if QryAllInv.Locate('ID', AId, []) then
        IqSearch1.DBGrid.SelectedRows.Items[0];
    end;
  end;
end;

procedure TFrmCDAllInv.VendorTotal1Click(Sender: TObject);
begin
  DoCdVendorAging(QryAllInvVENDOR_ID.asFloat); {CDVendorAging.pas}
end;



end.
