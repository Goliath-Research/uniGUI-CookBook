unit GJFX;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Menus,
  Vcl.Buttons,
  IQMS.WebVcl.About,
  Data.DB,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, uniDateTimePicker,
  uniDBDateTimePicker, Vcl.Controls;

type
  TFrmGJFX = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnRecalc: TUniButton;
    BtnOk: TUniButton;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    Splitter1: TUniSplitter;
    Panel5: TUniPanel;
    Splitter2: TUniSplitter;
    Label6: TUniLabel;
    EdCreditFrom: TUniEdit;
    EdCreditTo: TUniEdit;
    EdCreditFx: TUniEdit;
    Panel6: TUniPanel;
    Label5: TUniLabel;
    edDebitFrom: TUniEdit;
    EdDebitTo: TUniEdit;
    EdDebitFx: TUniEdit;
    Panel7: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    EdAcctFrom: TUniEdit;
    EdAcctTo: TUniEdit;
    EdAcctFx: TUniEdit;
    SBSearchFrom: TUniSpeedButton;
    SBSearchTo: TUniSpeedButton;
    Splitter3: TUniSplitter;
    Panel8: TUniPanel;
    Label7: TUniLabel;
    EdCurrFrom: TUniEdit;
    EdCurrTo: TUniEdit;
    IQAbout1: TIQWebAbout;
    Label8: TUniLabel;
    EdFxRate: TUniEdit;
    PkAcct: TIQWebHPick;
    PkAcctID: TBCDField;
    PkAcctACCT: TStringField;
    PkAcctDESCRIP: TStringField;
    PkAcctTYPE: TStringField;
    PkAcctEPLANT_ID: TBCDField;
    PkAcctGLACCT_ID_FX: TBCDField;
    BtnCancel: TUniButton;
    edDate: TUniDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure EdFxRateExit(Sender: TObject);
    procedure edDebitFromExit(Sender: TObject);
    procedure EdCreditFromExit(Sender: TObject);
    procedure SBSearchFromClick(Sender: TObject);
    procedure SBSearchToClick(Sender: TObject);
    procedure BtnRecalcClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure edDebitFromEnter(Sender: TObject);
    procedure EdCreditFromEnter(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FFX_TRANS_GROUP:Real;
    FPrepost_CycleID:Real;
    FResult:Boolean;

    FGlacct_id_From   :Real;
    FDate             :TDateTime;
    FDebitFrom        :Real;
    FCreditFrom       :Real;
    FFx_Rate          :Real;
    FGlacct_id_To     :Real;
    FDebitTo          :Real;
    FCreditTo         :Real;
    FGlacct_id_fx     :Real;
    FDebitFx          :Real;
    FCreditFx         :Real;
    FCurrency_id_From :Real;
    FCurrency_id_To   :Real;
    FCurrency_id      :Real;
    FDebitEnterText   :String;
    FCreditEnterText  :String;


    procedure InitPopulate;
    procedure PopulateFields;
    procedure AssignAccountFrom;
    procedure AssignAccountTo;
    procedure AssignCurrency;
    procedure AssignCurrency_No_Fx_Rate;
    procedure AssignAccountFx;
    procedure AssignFxAmounts(AValue:Real; aType:String);
    procedure Reset_To_and_FX_Values;
    procedure Populate_GLPrepost_Detail;

  public
    { Public declarations }
  end;

function DoGJFX(APrepost_CycleID:Real; var AFX_TRANS_GROUP:Real):boolean;

implementation
uses
  IQMS.Common.DataConst,
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.NLS;
{$R *.dfm}

function DoGJFX(APrepost_CycleID:Real; var AFX_TRANS_GROUP:Real):boolean;
var
  frm: TFrmGJFX;
begin
  frm := TFrmGJFX.Create(uniGUIApplication.UniApplication);
  frm.FPrepost_CycleID := APrepost_CycleID;
  frm.FFX_TRANS_GROUP  := AFX_TRANS_GROUP;
  frm.InitPopulate;
  frm.ShowModal;
  Result := frm.FResult;
end;

procedure TFrmGJFX.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmGJFX.UniFormCreate(Sender: TObject);
begin
  FResult := False;
  IQRegFormRead( self, [ self, Panel7, Panel4, Panel5 ]);
end;

procedure TFrmGJFX.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmGJFX.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, Panel7, Panel4, Panel5 ]);
end;

procedure TFrmGJFX.InitPopulate;
var
  aQry:TFDQuery;
begin
  Reset_To_and_FX_Values;
  FGlacct_id_From   := 0;
  FDate             := 0;
  FDebitFrom        := 0;
  FCreditFrom       := 0;
  FFx_Rate          := 0;
  FGlacct_id_To     := 0;
  FDebitTo          := 0;
  FCreditTo         := 0;
  FGlacct_id_fx     := 0;
  FDebitFx          := 0;
  FCreditFx         := 0;
  FCurrency_id_From := 0;
  FCurrency_id_To   := 0;
  FCurrency_id      := 0;

  aQry := TFDQuery.Create(nil);
  if (FFX_TRANS_GROUP <> 0) then
  begin
    try
      aQry.ConnectionName := cnstFDConnectionName;
      aQry.Sql.Add(IqFormat('select * from glprepost_detail ' +
                             ' where glprepost_cycle_id = %f and fx_trans_group = %f',
                             [FPrepost_CycleID, FFX_TRANS_GROUP]));
      aQry.Open;
      while not aQry.eof do
      begin
        if aQry.FieldByName('glacct_id_from').asFloat <> 0 then
        begin
          FGlacct_id_From := aQry.FieldByName('glacct_id_from').asFloat;
          FDate           := aQry.FieldByName('detail_date').asDateTime;
          FDebitFrom      := aQry.FieldByName('debit').asFloat;
          FCreditFrom     := aQry.FieldByName('credit').asFloat;
          FFx_Rate        := aQry.FieldByName('fx_rate').asFloat;
        end
        else if aQry.FieldByName('glacct_id_to').asFloat <> 0 then
        begin
          FGlacct_id_To := aQry.FieldByName('glacct_id_to').asFloat;
          FDebitTo      := aQry.FieldByName('debit').asFloat;
          FCreditTo     := aQry.FieldByName('credit').asFloat;
        end
        else if aQry.FieldByName('glacct_id_fx').asFloat <> 0 then
        begin
          FGlacct_id_fx := aQry.FieldByName('glacct_id_fx').asFloat;
          FDebitFx      := aQry.FieldByName('debit').asFloat;
          FCreditFx     := aQry.FieldByName('credit').asFloat;
        end;
        aQry.Next;
      end;
    finally
      aQry.Free;
    end;
  end
  else
  begin
    FDate := Date;
    FFx_Rate := 1;
  end;
  PopulateFields;
end;

procedure TFrmGJFX.PopulateFields;
begin
  edDate.DateTime := FDate;

  if FGlacct_id_From <> 0 then
    AssignAccountFrom;

  if FGlacct_id_To <> 0 then
    AssignAccountTo;

  AssignCurrency_No_Fx_Rate;

  if FGlacct_id_Fx <> 0 then
    AssignAccountFx;

  edDebitFrom.Text  := FloatToStr(FDebitFrom);
  edCreditFrom.Text := FloatToStr(FCreditFrom);
  edDebitTo.Text    := FloatToStr(FDebitTo);
  edCreditTo.Text   := FloatToStr(FCreditTo);
  edDebitFx.Text    := FloatToStr(FDebitFx);
  edCreditFx.Text   := FloatToStr(FCreditFx);
  EdFxRateExit(nil);
end;


procedure TFrmGJFX.EdFxRateExit(Sender: TObject);
var
  AValue:Real;
begin
  if EdFxRate.Text = '' then
    AValue := 0
  else
  try
    AValue := StrToFloat(EdFxRate.Text);
  except
    EdFxRate.Text := '1';
    FFx_Rate := 1;
    raise;
  end;

 if AValue = 0 then
 begin
   EdFxRate.Text := '1';
   FFx_Rate := 1;
   raise Exception.Create('Fx Rate cannot be 0.');
 end;
 Reset_To_and_FX_Values;
 FFx_Rate := AValue;
 if edDebitFrom.Text <> '0' then
 begin
   AValue := StrToFloat(edDebitFrom.Text);
   EdCreditTo.Text := RoundToStr(AValue * FFx_Rate, 2);
   AssignFxAmounts(AValue, 'DEBIT');
 end
 else
 begin
   AValue := StrToFloat(edCreditFrom.Text);
   EdDebitTo.Text := RoundToStr(AValue * FFx_Rate, 2);
   AssignFxAmounts(AValue, 'CREDIT');
 end;
end;

procedure TFrmGJFX.edDebitFromExit(Sender: TObject);
var
  AValue:Real;
begin
 if FDebitEnterText = edDebitFrom.Text then exit;
  if edDebitFrom.Text = '' then
    AValue := 0
  else
  try
    AValue := StrToFloat(edDebitFrom.Text);
  except
    edDebitFrom.Text := '0';
    raise;
  end;
  if AValue < 0 then
  begin
    edDebitFrom.Text := '0';
    raise Exception.Create('Amount must be greater than 0.');
  end;
  Reset_To_and_FX_Values;
  if AValue <> 0 then
  begin
    edDebitFrom.Text := RoundToStr(AValue, 2);
    EdCreditFrom.Text := '0';
    EdCreditTo.Text := RoundToStr(AValue * FFx_Rate, 2);
    AssignFxAmounts(AValue, 'DEBIT');
  end;
end;

procedure TFrmGJFX.EdCreditFromExit(Sender: TObject);
var
  AValue:Real;
begin
 if FCreditEnterText = edCreditFrom.Text then exit;

  if edCreditFrom.Text = '' then
    AValue := 0
  else
  try
    AValue := StrToFloat(edCreditFrom.Text);
  except
    edCreditFrom.Text := '0';
    raise;
  end;
  if AValue < 0 then
  begin
    edDebitFrom.Text := '0';
    raise Exception.Create('Amount must be greater than 0.');
  end;
  Reset_To_and_FX_Values;
  if AValue <> 0 then
  begin
    edCreditFrom.Text := RoundToStr(AValue, 2);
    edDebitFrom.Text := '0';
    EdDebitTo.Text := RoundToStr(AValue * FFx_Rate, 2);
    AssignFxAmounts(AValue, 'CREDIT');
  end;
end;

procedure TFrmGJFX.SBSearchFromClick(Sender: TObject);
begin
  with PkAcct do
  if execute then
  begin
    FGlacct_id_From := GetValue('ID');
    AssignAccountFrom;
    AssignCurrency;
    EdFxRateExit(nil);
  end;
end;

procedure TFrmGJFX.SBSearchToClick(Sender: TObject);
begin
  with PkAcct do
  if execute then
  begin
    FGlacct_id_To := GetValue('ID');
    AssignAccountTo;
    FGlacct_id_Fx := SelectValueFmtAsFloat('select glacct_id_fx from bankinfo_dtl where glacct_id_cash = %f', [FGlacct_id_To]);
    if FGlacct_id_Fx = 0 then
      FGlacct_id_Fx := GetValue('GLACCT_ID_FX');
//    FGlacct_id_Fx  := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_ep_gl(%f, ''acct_id_fx'', misc.geteplantid ) from dual', [FGlacct_id_Fx]);
    AssignAccountFx;
    AssignCurrency;
    EdFxRateExit(nil);
  end;
end;

procedure TFrmGJFX.AssignAccountFrom;
var
  ACurrPlug:String;
begin
  EdAcctFrom.ReadOnly := false;
  EdAcctFrom.Text := SelectValueFmtAsString('select acct from glacct where id = %f', [FGlacct_id_From]);
  EdAcctFrom.ReadOnly := True;
  ACurrPlug := SelectValueFmtAsString('select currency from v_glacct where id = %f', [FGlacct_id_From]);
  FCurrency_id_From := SelectValueFmtAsFloat('select id from currency where glvalue = ''%s'' and native_curr = curr_code', [ACurrPlug]);
  EdCurrFrom.ReadOnly := false;
  EdCurrFrom.Text := SelectValueFmtAsString('select curr_code from currency where id = %f', [FCurrency_id_From]);
  EdCurrFrom.ReadOnly := True;
end;

procedure TFrmGJFX.AssignAccountTo;
var
  ACurrPlug:String;
begin
  EdAcctTo.ReadOnly := false;
  EdAcctTo.Text := SelectValueFmtAsString('select acct from glacct where id = %f', [FGlacct_id_To]);
  EdAcctTo.ReadOnly := True;
  ACurrPlug := SelectValueFmtAsString('select currency from v_glacct where id = %f', [FGlacct_id_To]);
  FCurrency_id_To := SelectValueFmtAsFloat('select id from currency where glvalue = ''%s'' and native_curr = curr_code', [ACurrPlug]);
  EdCurrTo.ReadOnly := false;
  EdCurrTo.Text := SelectValueFmtAsString('select curr_code from currency where id = %f', [FCurrency_id_To]);
  EdCurrTo.ReadOnly := True;
end;

procedure TFrmGJFX.AssignCurrency_No_Fx_Rate;
begin
  FCurrency_id := SelectValueFmtAsFloat('select id from currency ' +
                            ' where native_curr = ''%s'' and curr_code = ''%s''', [EdCurrFrom.Text, EdCurrTo.Text]);
  EdFxRate.Text     := FloatToStr(FFx_Rate);
end;

procedure TFrmGJFX.AssignCurrency;
var
  AFxRate:Real;
begin
  FCurrency_id := SelectValueFmtAsFloat('select id from currency ' +
                            ' where native_curr = ''%s'' and curr_code = ''%s''', [EdCurrFrom.Text, EdCurrTo.Text]);

  AFxRate := SelectValueFmtAsFloat('select gl_misc.GetFxRate_Daily(''%s'', ''%s'', sysdate) from dual', [EdCurrFrom.Text, EdCurrTo.Text]);
//  if (FFx_Rate = 1) and (FFx_Rate <> AFxRate) then
    FFx_Rate := AFxRate;
  EdFxRate.Text     := FloatToStr(FFx_Rate);
end;

procedure TFrmGJFX.AssignAccountFx;
begin
  EdAcctFx.ReadOnly := false;
  EdAcctFx.Text := SelectValueFmtAsString('select acct from glacct where id = %f', [FGlacct_id_Fx]);
  EdAcctFx.ReadOnly := True;
end;

procedure TFrmGJFX.AssignFxAmounts(AValue:Real; AType:String);
var
  aVal:Real;
begin
  if AType = 'DEBIT' then
  begin
    if AValue * FFx_Rate >= AValue then
    begin
      aVal := AValue * FFx_Rate - AValue;
      edDebitFx.Text := RoundToStr(AVal, 2);
    end
    else
    begin
      AVal := AValue - AValue * FFx_Rate;
      edCreditFx.Text := RoundToStr(AVal, 2);
    end;
  end
  else
  begin
    if AValue * FFx_Rate >= AValue then
    begin
      aVal := AValue * FFx_Rate - AValue;
      edCreditFx.Text := RoundToStr(AVal, 2);
    end
    else
    begin
      AVal := AValue - AValue * FFx_Rate;
      edDebitFx.Text := RoundToStr(AVal, 2);
    end;
  end;
end;

procedure TFrmGJFX.BtnRecalcClick(Sender: TObject);
begin
  EdFxRateExit(nil);
end;

procedure TFrmGJFX.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmGJFX.BtnOkClick(Sender: TObject);
begin
  FResult := True;
  Populate_GLPrepost_Detail;

  Close;
end;

procedure TFrmGJFX.Reset_To_and_FX_Values;
begin
  edDebitTo.Text    := '0';
  edCreditTo.Text   := '0';
  edDebitFx.Text    := '0';
  edCreditFx.Text   := '0';
end;

procedure TFrmGJFX.Populate_GLPrepost_Detail;
var
  ASeq:Real;
begin
  if (edDebitFrom.text = '0') and (edCreditFrom.Text = '0') then
    raise Exception.Create('From Credit or From Debit must be greater than 0.');
  if FFx_Rate = 1 then
    raise Exception.Create('FX Rate = 1. Nothing to Process.');


  if FFX_TRANS_GROUP = 0 then
    FFX_TRANS_GROUP := SelectValueFmtAsFloat('select max(FX_TRANS_GROUP) from glprepost_detail ' +
                                 ' where glprepost_cycle_id = %f', [FPrepost_CycleID]) + 1
  else
    ExecuteCommandFmt('delete from glprepost_detail ' +
              ' where glprepost_cycle_id = %f and FX_TRANS_GROUP = %f', [FPrepost_CycleID, FFX_TRANS_GROUP]);

  ASeq := SelectValueFmtAsFloat('select max(seq) from glprepost_detail where glprepost_cycle_id = %f', [FPrepost_CycleID]) + 1;

  ExecuteCommandFmt('insert into glprepost_detail ' +
            ' (glprepost_cycle_id, seq, credit, debit, glacct_id_from, currency_id, fx_rate, detail_date, FX_TRANS_GROUP, glacct_id) ' +
            ' values (%f, %f, %f, %f, %f, %f, %.6f, To_Date(''%s'', ''MM/DD/RRRR''), %f, %f)',
            [FPrepost_CycleID,
             ASeq,
             IQRound(StrToFloat(edCreditFrom.text), 2),
             IQRound(StrToFloat(edDebitFrom.text), 2),
             FGlacct_id_From,
             FCurrency_id_From,
             FFx_Rate,
             FormatDateTime('mm/dd/yyyy', edDate.DateTime),
             FFX_TRANS_GROUP,
             FGlacct_id_From]);
  ASeq := ASeq + 1;
  ExecuteCommandFmt('insert into glprepost_detail ' +
            ' (glprepost_cycle_id, seq, credit, debit, glacct_id_to, currency_id, fx_rate, detail_date, FX_TRANS_GROUP, glacct_id) ' +
            ' values (%f, %f, %f, %f, %f, %f, %.6f, To_Date(''%s'', ''MM/DD/RRRR''), %f, %f)',
            [FPrepost_CycleID,
             ASeq,
             IQRound(StrToFloat(edCreditTo.text), 2),
             IQRound(StrToFloat(edDebitTo.text), 2),
             FGlacct_id_To,
             FCurrency_id_To,
             FFx_Rate,
             FormatDateTime('mm/dd/yyyy', edDate.DateTime),
             FFX_TRANS_GROUP,
             FGlacct_id_To]);
  ASeq := ASeq + 1;
  ExecuteCommandFmt('insert into glprepost_detail ' +
            ' (glprepost_cycle_id, seq, credit, debit, glacct_id_fx, currency_id, fx_rate, detail_date, FX_TRANS_GROUP, glacct_id) ' +
            ' values (%f, %f, %f, %f, %f, %f, %.6f, To_Date(''%s'', ''MM/DD/RRRR''), %f, %f)',
            [FPrepost_CycleID,
             ASeq,
             IQRound(StrToFloat(edCreditFx.text), 2),
             IQRound(StrToFloat(edDebitFx.text), 2),
             FGlacct_id_Fx,
             FCurrency_id,
             FFx_Rate,
             FormatDateTime('mm/dd/yyyy', edDate.DateTime),
             FFX_TRANS_GROUP,
             FGlacct_id_Fx]);

end;

procedure TFrmGJFX.edDebitFromEnter(Sender: TObject);
begin
  FDebitEnterText := edDebitFrom.Text;
end;

procedure TFrmGJFX.EdCreditFromEnter(Sender: TObject);
begin
  FCreditEnterText := edCreditFrom.Text;
end;


end.
