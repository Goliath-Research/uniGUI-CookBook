unit APAutoInv;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Data.DB,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.SecurityRegister,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniMainMenu, uniGUIFrame, uniDateTimePicker,
  uniDBDateTimePicker, Vcl.Menus, Vcl.Forms, System.Classes, IQUniGrid;


type
  TFrmAPAutoInv = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    CreateInvoices1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    IQSearch1: TIQUniGridControl;
    SrcVendors: TDataSource;
    QryVendors: TFDQuery;
    QryVendorsVENDOR_ID: TBCDField;
    QryVendorsVENDORNO: TStringField;
    QryVendorsCOMPANY: TStringField;
    QryVendorsATTN: TStringField;
    QryVendorsADDR1: TStringField;
    QryVendorsADDR2: TStringField;
    QryVendorsADDR3: TStringField;
    QryVendorsCITY: TStringField;
    QryVendorsSTATE: TStringField;
    QryVendorsCOUNTRY: TStringField;
    QryVendorsZIP: TStringField;
    QryVendorsREMIT_TO_ATTN: TStringField;
    QryVendorsREMIT_TO_ADDR1: TStringField;
    QryVendorsREMIT_TO_ADDR2: TStringField;
    QryVendorsREMIT_TO_ADDR3: TStringField;
    QryVendorsREMIT_TO_CITY: TStringField;
    QryVendorsREMIT_TO_STATE: TStringField;
    QryVendorsREMIT_TO_ZIP: TStringField;
    QryVendorsREMIT_TO_COUNTRY: TStringField;
    IQAbout1: TIQWebAbout;
    SR: TIQWebSecurityRegister;
    Panel3: TUniPanel;
    BtnCreateInv: TUniButton;
    BtnClose: TUniButton;
    QryVendorsREMIT_TO_ID: TFMTBCDField;
    QryPODtls: TFDQuery;
    FloatField1: TBCDField;
    FloatField2: TBCDField;
    FloatField3: TBCDField;
    FloatField4: TFMTBCDField;
    FloatField5: TFMTBCDField;
    FloatField6: TFMTBCDField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField7: TFMTBCDField;
    FloatField8: TFMTBCDField;
    FloatField9: TFMTBCDField;
    FloatField10: TBCDField;
    FloatField11: TFMTBCDField;
    FloatField12: TBCDField;
    FloatField13: TBCDField;
    StringField7: TStringField;
    QryPODtlsCOST_OBJECT_ID: TBCDField;
    QryPODtlsCOST_OBJECT_SOURCE: TStringField;
    QryPODtlsUOM: TStringField;
    QryPODtlsDONT_POST_PPV: TStringField;
    QryPODtlsQTY_REJECTED: TFMTBCDField;
    QryPODtlsPO_DETAIL_UOM: TStringField;
    QryPODtlsADJ_STD_COST: TFMTBCDField;
    QryPODtlsADJ_UNIT_PRICE: TFMTBCDField;
    QryPODtlsTAX_CODE_ID: TFMTBCDField;
    QryPODtlsTAXABLE: TStringField;
    QryPODtlsREF_CODE_ID: TBCDField;
    QryPODtlsEPLANT_ID: TBCDField;
    QryPODtlsFREIGHT_ID: TBCDField;
    QryRec: TFDQuery;
    QryRecRECEIPTNO: TStringField;
    QryRecQTY_RECEIVED: TBCDField;
    QryRecDATE_RECEIVED: TDateTimeField;
    QryRecQTY_REJECTED: TFMTBCDField;
    QryRecQTY_INVOICED: TBCDField;
    QryRecQTY_TO_INVOICE: TFMTBCDField;
    QryRecID: TBCDField;
    QryRecPO_DETAIL_ID: TBCDField;
    QryRecPOSTED: TStringField;
    QryRecECODE: TStringField;
    QryRecEID: TBCDField;
    QryRecEDATE_TIME: TDateTimeField;
    QryRecCOMMENT1: TStringField;
    QryRecECOPY: TStringField;
    QryRecEPLANT_ID: TBCDField;
    QryPO_Recv_vs_AP: TFDQuery;
    QryPO_Recv_vs_APPO_DETAIL_ID: TBCDField;
    QryPO_Recv_vs_APNET_RECEIVED: TFMTBCDField;
    QryPO_Recv_vs_APUNINVOICED: TFMTBCDField;
    Panel4: TUniPanel;
    BtnRefresh: TUniButton;
    Panel5: TUniPanel;
    lblEndDate: TUniLabel;
    wwDate: TUniDBDateTimePicker;
    N1: TUniMenuItem;
    N2: TUniMenuItem;
    OneInvoicePerPO1: TUniMenuItem;
    Contents1: TUniMenuItem;
    procedure QryVendorsFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnRefreshClick(Sender: TObject);
    procedure BtnCreateInvClick(Sender: TObject);
    procedure OneInvoicePerPO1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FAprepostId:Real;
    FDetailId:Real;
    FXrate:Real;
    FMultiCurrency:Boolean;
    FEPlantId:Real;
    procedure InsertAPPrepostRecord(ACounter:integer; APoId:Real=0);
    procedure InsertAPPrepostDetailRecord(APoId:Real);
    procedure InsertDetail(APO_Detail_ID:Real);
    procedure AssignDates(AInvDate:TDateTime; var ADueDate:TDateTime; var ADiscDate:TDateTime; ATermsId:Real);
    function  GetEPlantCurrency:Real;
    procedure CheckCurrencyRate(ACurrencyId, AGLACCT_ID_AP:Real);
    procedure ReplaceGLACCT_ID_AP_with_MC_Account(nCurrencyId:Real; var AGLACCT_ID_AP:Real; var AGLACCT_ID_FX:Real; AEplantId:Real);
    procedure FindRootAccount(ACurrencyId:Real; var AGLACCT_ID_FX:Real; AEPlantId, AGLACCT_ID_AP:Real);
    procedure AssignMCAccount(AID:Real; var Acct:Real);
    function  FindEPlantId(Acct1, APoDtlId:Real):Real;
//    function  GetAccrueAccount(AGlAcctId, ArinvtId, EPlantId:Real):Real;
    function  GetAccrueAccount(AGlAcctId, ArinvtId, EPlantId:Real; AStdCost, ADontPostPPV:String; APoDetailId:Real; APoGtlGlAcct:Real):Real;
    procedure InsertApPrepostTax(AprepostId, APoDetailId:Real);
    procedure CreateOneInvPerPO;
  private
    procedure SetPo_Detail_ID(const Value: integer);
    { Private declarations }
  public
    { Public declarations }

    property Po_Detail_ID : integer write SetPo_Detail_ID;
  end;

function FrmAPAutoInv: TFrmAPAutoInv;
function DoAPAutoInvoice(APo_Detail_ID : integer): TFrmAPAutoInv;

implementation

uses
  ap_rscstr,
  APShare,
  IQMS.Common.AccountingShare,
  IQMS.Common.Dates,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  IQMS.Common.MCShare,
  IQMS.Common.PanelMsg;

{$R *.dfm}

function FrmAPAutoInv: TFrmAPAutoInv;
begin
  Result := TFrmAPAutoInv(UniMainModule.GetFormInstance(TFrmAPAutoInv));
end;

function DoAPAutoInvoice(APo_Detail_ID : integer): TFrmAPAutoInv;
begin
  Result := FrmAPAutoInv;
  Result.Po_Detail_ID := APo_Detail_ID;
  Result.Show;
end;

procedure TFrmAPAutoInv.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmAPAutoInv.QryVendorsFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := False;
  if not assigned(wwDate) or (wwDate = nil) then exit;
 if not QryVendors.Active then Exit;
 try
   Accept := SelectValueFmtAsFloat('select count(p.id) from po p where p.vendor_id = %f and p.po_date <= To_Date(''%s'', ''MM/DD/RRRR'')',
                     [QryVendorsVENDOR_ID.asFloat, FormatDateTime('mm/dd/yyyy', wwDate.DateTime)]) <> 0;
 except
 end;

 if not Accept then exit;

 Accept := SelectValueFmtAsFloat('select count(r.id) from po_receipts r, po_detail d, po p ' +
                     ' where r.po_detail_id = d.id and d.po_id = p.id and NVL(r.posted, ''N'') = ''Y'' ' +
                     ' and p.vendor_id = %f and not exists (select 1 from apprepost_detail where po_receipts_id = r.id) ' +
                     ' and not exists (select 1 from apinvoice_detail where po_receipts_id = r.id)',
                     [QryVendorsVENDOR_ID.asFloat]) <> 0;

end;

procedure TFrmAPAutoInv.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmAPAutoInv.Exit1Click(Sender: TObject);
begin
  Close;
end;


procedure TFrmAPAutoInv.BtnRefreshClick(Sender: TObject);
begin
//  IqSearch1.DBGrid.UnselectAll;
  try
    QryVendors.OnFilterRecord := nil;
    QryVendors.Close;
  finally
    QryVendors.OnFilterRecord := QryVendorsFilterRecord;
  end;
  QryVendors.open;
end;

procedure TFrmAPAutoInv.BtnCreateInvClick(Sender: TObject);
var
  i:Integer;
  ATermsId:Real;
  ADiscount:Real;
  AmountDistr:Real;
  AQry:TFDQuery;
  AQry2:TFDQuery;
  ACounter:integer;
  APoId:Real;
begin
  if not IQConfirmYN(ap_rscstr.cTXT0000058 {'Create invoices now?'}) then Exit;

  //TODO
  with IqSearch1.DBGrid, IqSearch1.DBGrid.datasource.dataset do
  begin
    for i:= 0 to -1 do //SelectedList.Count-1 do
    try
      QryVendors.Filtered := False;
//      GotoBookmark(SelectedList.items[i]);
      if OneInvoicePerPO1.checked then
      begin
        CreateOneInvPerPO;
      end
      else
      begin

        InsertAPPrepostRecord(-1, 0);

        ATermsId := SelectValueFmtAsFloat('select terms_id from apprepost where id = %f', [FAprepostId]);
        ADiscount := 0;

        with TFDQuery.Create(self) do
        try
          Connection := UniMainModule.FDConnection1;
          Sql.Add(IQFormat('select t.days, NVL(t.based_on, ''I'') as based_on, t.description, t.discount_days, t.discount, t.end_of_month, t.day_of_month ' +
                         'from terms t where t.id = %f',
                         [ATermsId]));
          Open;
          if not (eof and bof) then
          begin
            ADiscount := FieldByName('DISCOUNT').asFloat;
          end;
        finally
          Free;
        end;


        if FAprepostId <> 0 then
        begin
          InsertAPPrepostDetailRecord(0);

          AmountDistr := SelectValueFmtAsFloat('select sum(amount_distributed) from apprepost_detail where apprepost_id = %f', [FAprepostId]);
          ExecuteCommandFmt('update apprepost set invoice_amount = %.6f, disc_amount = decode(%.6f, 0, 0, %.6f*%.6f/100) where id = %f',
            [AmountDistr, ADiscount, ADiscount, AmountDistr, FAprepostId]);
          if SelectValueFmtAsFloat('select count(id) from apprepost_detail where apprepost_id = %f', [FAprepostId]) = 0 then
            ExecuteCommandFmt('delete from apprepost where id = %f', [FAprepostId])
        end;


      end;
    finally
      QryVendors.Filtered := True;
    end;
  end;
  BtnRefreshClick(nil);
//  TFrmAp(Owner).QryAPPrePost.Close;
//  TFrmAp(Owner).QryAPPrePost.Open;
  IQInformation(ap_rscstr.cTXT0000059{'Invoices created.'});
end;

procedure TFrmAPAutoInv.CreateOneInvPerPO;
var
  i:Integer;
  ATermsId:Real;
  ADiscount:Real;
  AmountDistr:Real;
  AQry1:TFDQuery;
  AQry2:TFDQuery;
  ACounter:integer;
  APoId:Real;
begin
  ACounter := 0;
  AQry1 := TFDQuery.Create(nil);
  try
    AQry1.Connection := UniMainModule.FDConnection1;


    AQry1.Sql.Add(IqFormat('select distinct p.id as po_id ' +
                     ' from po_receipts r, po_detail d, po p ' +
                     ' where r.po_detail_id = d.id and d.po_id = p.id ' +
                     ' and p.vendor_id = %f ' +
                     ' and misc.eplant_filter(p.eplant_id) = 1 ' +
                     ' and NVL(r.receiptno, ''^^^^****^^^@@@@'') <> ''CUM RECEIPT ADJUSTMENT'' ' +
                     ' and r.date_received <= To_Date(''%s'', ''MM/DD/RRRR'') and NVL(r.posted, ''N'') = ''Y'' ' +
                     ' and not exists (select 1 from apprepost_detail where po_receipts_id = r.id) ' +
                     ' and not exists (select 1 from apinvoice_detail where po_receipts_id = r.id)',
                     [QryVendorsVENDOR_ID.asFloat, FormatDateTime('mm/dd/yyyy', wwDate.DateTime)]));
     AQry1.Open;
     while not AQry1.eof do
     begin
       ACounter := ACounter + 1;

       APoId := AQry1.FieldByName('po_id').asFloat;
       InsertAPPrepostRecord(ACounter, APoId);

       ATermsId := SelectValueFmtAsFloat('select terms_id from po where id = %f', [APoId]);
//       ATermsId := SelectValueFmtAsFloat('select terms_id from apprepost where id = %f', [FAprepostId]);
       ADiscount := 0;

       AQry2 := TFDQuery.Create(nil);
       try
         AQry2.Connection := UniMainModule.FDConnection1;
         AQry2.Sql.Add(IQFormat('select t.days, NVL(t.based_on, ''I'') as based_on, t.description, t.discount_days, t.discount, t.end_of_month, t.day_of_month ' +
                        'from terms t where t.id = %f',
                        [ATermsId]));
         AQry2.Open;
         if not (AQry2.eof and AQry2.bof) then
         begin
           ADiscount := AQry2.FieldByName('DISCOUNT').asFloat;
         end;
       finally
         AQry2.Free;
       end;


       if FAprepostId <> 0 then
       begin
         InsertAPPrepostDetailRecord(APoId);

         AmountDistr := SelectValueFmtAsFloat('select sum(amount_distributed) from apprepost_detail where apprepost_id = %f', [FAprepostId]);
         ExecuteCommandFmt('update apprepost set invoice_amount = %.6f, disc_amount = decode(%.6f, 0, 0, %.6f*%.6f/100) where id = %f',
           [AmountDistr, ADiscount, ADiscount, AmountDistr, FAprepostId]);
         if SelectValueFmtAsFloat('select count(id) from apprepost_detail where apprepost_id = %f', [FAprepostId]) = 0 then
           ExecuteCommandFmt('delete from apprepost where id = %f', [FAprepostId])
       end;




       AQry1.next;
     end;
  finally
    AQry1.Free;
  end;


end;


procedure TFrmAPAutoInv.InsertAPPrepostRecord(ACounter:integer; APoId:Real= 0);
var
  AUserId:String;
  ACurrencyId:Real;
  AVendorId:Real;
  ARemit_to_id:Real;
  ADueDate:TDateTime;
  AInvDate:TDateTime;
  ADiscDate:TDateTime;

  AGLPERIODS_ID_AP:Real;
  ATermsId:Real;

  AGLACCT_ID_AP:Real;
  AGLACCT_ID_FX:Real;
  AInvoiceNo:String;
  h: TPanelMesg;
  AVendorInvcHold: string;
begin
  try
    FAprepostId := 0;

    AUserId     := SecurityManager.UserName;
    ACurrencyId := GetEPlantCurrency;
    AVendorId   := QryVendorsVENDOR_ID.AsFloat;

    ARemit_to_id := QryVendorsREMIT_TO_ID.asFloat;

    AInvDate     := wwDate.DateTime;
    if APoId = 0 then
      ATermsId := SelectValueFmtAsFloat('select terms_id from vendor where id = %f', [AVendorId])
    else
      ATermsId := SelectValueFmtAsFloat('select terms_id from po where id = %f', [APoId]);

    ADueDate := 0;
    ADiscDate := 0;

    AssignDates(AInvDate, ADueDate, ADiscDate, ATermsId);




    AGLPERIODS_ID_AP := SelectValueFmtAsFloat('select id from glperiods where ' +
                           'To_Date(''%s'', ''MM/DD/RRRR'') between start_date and end_date and GL.CheckGLYearEplant(id) = 1',
                           [FormatDateTime('mm/dd/yyyy', AInvDate)]);


    FEPlantId := 0;

    if SecurityManager.EPlantsExist then
    begin
      if SecurityManager.EPlant_ID <> 'NULL' then
        FEPlantId := StrToFloat(SecurityManager.EPlant_ID)
    end;


    AGLACCT_ID_AP := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_ep_gl(ap_glacct_id, ''acct_id_ap'', %f ) from vendor where id = %f',
                           [FEPlantId, AVendorId]);

    if AGLACCT_ID_AP = 0 then
      AGLACCT_ID_AP := SelectValueAsFloat('select plugins.get_glacct_id(''acct_id_ap'') from dual');


    CheckCurrencyRate(ACurrencyId, AGLACCT_ID_AP);
    ReplaceGLACCT_ID_AP_with_MC_Account(ACurrencyId, AGLACCT_ID_AP, AGLACCT_ID_FX, FEPlantId);

    FAprepostId := GetNextID('APPREPOST');
    if ACounter > -1 then
      AInvoiceNo := Format('%s-%s-%d', [StrTran(QryVendorsVENDORNO.asString, '''', ''''''), FormatDateTime('ddddd', wwDate.DateTime), ACounter])
    else
      AInvoiceNo := Format('%s-%s', [StrTran(QryVendorsVENDORNO.asString, '''', ''''''), FormatDateTime('ddddd', wwDate.DateTime)]);
    h:= hPleaseWait(Format(ap_rscstr.cTXT0000060{'Creating invoice %s'}, [AInvoiceNo]));

    AVendorInvcHold:= SelectValueByID('decode( use_vendor_portal_invc, ''N'', NULL, use_vendor_portal_invc ) as use_vendor_portal_invc',
                                 'vendor', AVendorId);

    ExecuteCommandFmt('insert into apprepost ( id,                ' +
                                     '  vendor_id,        ' +
                                     '  invoice_no,       ' +
                                     '  terms_id,         ' +
                                     '  invoice_date,     ' +
                                     '  due_date,         ' +
                                     '  glacct_id_ap,     ' +
                                     '  glperiods_id_ap,  ' +
                                     '  remit_to_id,      ' +
                                     '  prior_entry,      ' +
                                     '  on_hold,          ' +
                                     '  glacct_id_fx,     ' +
                                     '  currency_id,      ' +
                                     '  userid,           ' +
                                     '  eplant_id,        ' +
                                     '  disc_date,        ' +
                                     '  auto_invoice,     ' +
                                     '  on_hold_after_post, ' +
                                     '  VENDOR_PORTAL_INVC_HOLD ) ' +
                               ' values(%f,                                ' +
                               '        %f,                                ' +
                               '        ''%s'',                            ' +
                               '        decode(%f, 0, null, %f),           ' +
                               '        To_Date(''%s'', ''MM/DD/RRRR''),   ' +
                               '        To_Date(''%s'', ''MM/DD/RRRR''),   ' +
                               '        decode(%f, 0, null, %f),           ' +
                               '        decode(%f, 0, null, %f),           ' +
                               '        decode(%f, 0, null, %f),           ' +
                               '        ''N'',                             ' +
                               '        ''N'',                             ' +
                               '        decode(%f, 0, null, %f),           ' +
                               '        decode(%f, 0, null, %f),           ' +
                               '        ''%s'',                            ' +
                               '        decode(%f, 0, null, %f),           ' +
                               '        To_Date(''%s'', ''MM/DD/RRRR''),   ' +
                               '        ''Y'',                            ' +
                               '        ''N'', ' +
                               '        ''%s'') ',
                               [FAprepostId,
                                AVendorId,
                                AInvoiceNo,
                                ATermsId, ATermsId,
                                FormatDateTime('mm/dd/yyyy', AInvDate),
                                FormatDateTime('mm/dd/yyyy', ADueDate),
                                AGLACCT_ID_AP, AGLACCT_ID_AP,
                                AGLPERIODS_ID_AP, AGLPERIODS_ID_AP,
                                ARemit_to_id, ARemit_to_id,
                                AGLACCT_ID_FX, AGLACCT_ID_FX,
                                ACurrencyId, ACurrencyId,
                                AUserId,
                                FEPlantId, FEPlantId,
                                FormatDateTime('mm/dd/yyyy', ADiscDate),
                                AVendorInvcHold ]);
  finally
    h.Free;
  end;
end;

procedure TFrmAPAutoInv.CheckCurrencyRate(ACurrencyId, AGLACCT_ID_AP:Real);
var
  nID:Real;
begin
  if not FMultiCurrency then
  begin
    FXRate := 1;
    Exit;
  end;
  nId := ACurrencyId;
  if nId = 0 then
    nId := GetEplantNativeCurrencyId; {in McShare.pas}
  FXrate := SelectValueFmtAsFloat('select balsheet_rate from currencypost where currency_id = %f and glperiods_id = %f',
                       [nId, AGLACCT_ID_AP]);
  if FXRate = 0 then
    FXrate := SelectValueFmtAsFloat('select spot_rate from currency where id = %f', [nId]);
end;

function TFrmAPAutoInv.GetEPlantCurrency:Real;
var
  AVendorCustomer_Currency_id:Real;
  AVendorCustomer_Curr_code:String;
  AEplantId:Real;
  AIqSysCurrencyId:Real;
  AEplantNativeCurr, AIqsysNativeCurr:String;
  ANativeCurrCode:String;
  ACurrency_id:Real;
  ACurrencyCurrCode:Real;
begin
  Result := 0;
  if SelectValueAsString('select NVL(multicurrency, ''N'') from iqsys where rownum < 2') = 'N' then
  begin
    Result := SelectValueFmtAsFloat('select currency_id from vendor where id = %f', [QryVendorsVENDOR_ID.asFloat]);
    if Result  = 0 then
      Result  := GetEplantNativeCurrencyId;  {in MCShare.pas}
    exit;
  end;
  AEplantId := 0;
  if SecurityManager.EPlantsExist then
    if SecurityManager.EPlant_ID <> 'NULL' then
      AEplantId := StrToFloat(SecurityManager.EPlant_ID);
  if AEplantId = 0 then
  begin
    AIqSysCurrencyId            := SelectValueAsFloat('select currency_id from iqsys where rownum < 2');
    ANativeCurrCode             := SelectValueFmtAsString('select curr_code from currency where id = %f', [AIqSysCurrencyId]);
    AVendorCustomer_Currency_id := SelectValueFmtAsFloat('select currency_id from vendor where id = %f', [QryVendorsVENDOR_ID.asFloat]);
    AVendorCustomer_Curr_code   := SelectValueFmtAsString('select curr_code from currency where id = %f', [AVendorCustomer_Currency_id]);
    ACurrency_id := SelectValueFmtAsFloat('select id from currency where TrimLeft(RTrim(curr_code)) = ''%s'' and native_curr = ''%s''',
                        [AVendorCustomer_Curr_code, ANativeCurrCode]);
    if ACurrency_id <> 0 then
      Result := ACurrency_id
    else
    begin
      ACurrency_id := SelectValueAsFloat('select currency_id from iqsys where rownum < 2');
      if ACurrency_id <> 0 then
        Result := ACurrency_id;
    end;
    Exit;
  end;
  Result := GetEplantNativeCurrencyId;

  AIqSysCurrencyId  := SelectValueAsFloat('select currency_id from iqsys where rownum < 2');
  AEplantNativeCurr := SelectValueFmtAsString('select native_curr from eplant where id = %f', [AEplantId]);
  AIqsysNativeCurr  := SelectValueFmtAsString('select curr_code from currency where id = %f', [AIqSysCurrencyId]);

  if AEplantNativeCurr = '' then
    ANativeCurrCode := AIqsysNativeCurr
  else
    ANativeCurrCode := AEplantNativeCurr;

  if ANativeCurrCode = '' then exit;

  AVendorCustomer_Currency_id := SelectValueFmtAsFloat('select currency_id from vendor where id = %f', [QryVendorsVENDOR_ID.asFloat]);
  AVendorCustomer_Curr_code   := SelectValueFmtAsString('select curr_code from currency where id = %f', [AVendorCustomer_Currency_id]);
  ACurrency_id := SelectValueFmtAsFloat('select id from currency where TrimLeft(RTrim(curr_code)) = ''%s'' and native_curr = ''%s''',
                      [AVendorCustomer_Curr_code, ANativeCurrCode]);


  if ACurrency_id <> 0 then
    Result := ACurrency_id
  else if AVendorCustomer_Currency_id <> 0
    then Result := AVendorCustomer_Currency_id;
end;

procedure TFrmAPAutoInv.AssignDates(AInvDate:TDateTime; var ADueDate:TDateTime; var ADiscDate:TDateTime; ATermsId:Real);
var
  AQry:TFDQuery;
  Adays, Adiscount_days, Aday_of_month:Real;
  Abased_on, Aend_of_month:String;
  YY, MM, DD: word;
  ABadDate:Boolean;
begin
  Adays          := 0;
  Adiscount_days := 0;
  Aday_of_month  := 0;


  AQry :=TFDQuery.Create(nil);
  with AQry do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IqFormat('select id, days, discount_days, based_on, end_of_month, ' +
                    ' day_of_month from terms where id = %f', [ATermsId]));
    Open;
    if not eof and bof then
    begin
      Adays          := FieldByName('days').asFloat;
      Adiscount_days := FieldByName('discount_days').asFloat;
      Aday_of_month  := FieldByName('day_of_month').asFloat;
      Abased_on      := FieldByName('based_on').asString;
      Aend_of_month  := FieldByName('end_of_month').asString;
    end;
  finally
    Free;
  end;

  ADiscDate := AInvDate + Adiscount_days;



  if Abased_on = 'I' then
  begin
    ADueDate := AInvDate + Adays
  end
  else if Abased_on = 'S' then
    ADueDate := GetTermsBasedOnDate('VENDOR', QryVendorsVENDOR_ID.asFloat,
                                    ATermsId,
                                    AInvDate);  {in IQMS.Dates.pas}

  if Aday_of_month > 0 then
  begin
    DecodeDate( ADueDate, YY, MM, DD );

    if Aend_of_month = 'Y' then
    begin
      ADueDate := IQEoM(ADueDate);
      DecodeDate( ADueDate, YY, MM, DD );
    end;

    if Trunc(Aday_of_month) < DD then
    begin
      DD := Trunc(Aday_of_month);
      Inc(MM);
      if MM > 12 then
      begin
        MM := 1;
        Inc(YY);
      end;
      ADueDate := EncodeDate( YY, MM, DD);
    end
    else if Trunc(Aday_of_month) > DD then
    begin
      DD := Trunc(Aday_of_month);
      ABadDate := True;
      while ABadDate do
      try
        ADueDate := EncodeDate( YY, MM, DD);
        ABadDate := False;
      except
        Dec(DD);
      end;
    end;
  end
  else
  if Aend_of_month = 'Y' then
    ADueDate := IQEoM(ADueDate);
end;


procedure TFrmAPAutoInv.ReplaceGLACCT_ID_AP_with_MC_Account(nCurrencyId:Real; var AGLACCT_ID_AP:Real;
                                                            var AGLACCT_ID_FX:Real; AEplantId:Real);
begin
  if not FMultiCurrency then Exit;
  AssignMCAccount(nCurrencyId, AGLACCT_ID_AP);
  FindRootAccount(nCurrencyId, AGLACCT_ID_FX, AEPlantId, AGLACCT_ID_AP);
end;

procedure TFrmAPAutoInv.SetPo_Detail_ID(const Value: integer);
begin
  QryRec.ParamByName('PO_DETAIL_ID').Value := Value;
end;

procedure TFrmAPAutoInv.UniFormCreate(Sender: TObject);
var
  AType:Integer;
begin
 FMultiCurrency := SelectValueAsString('select NVL(multicurrency, ''N'') from iqsys where rownum < 2') = 'Y';

  QryVendors.Close;
  wwDate.DateTime := Date;
  QryVendors.Open;
  IQRegFormRead( self, [self]);

  // compensate for localization; translated text may be longer.
  wwDate.Left := lblEndDate.Left + lblEndDate.Width + 8;

  AType := 0;


  if IQRegIntegerScalarRead( self, 'AP_ONE_INV_PER_PO', AType ) then
  begin
    if AType = 0 then
      OneInvoicePerPO1.Checked := false
    else
      OneInvoicePerPO1.Checked := True;
  end
  else
  begin
    OneInvoicePerPO1.Checked := false;
    IQRegIntegerScalarWrite( self, 'AP_ONE_INV_PER_PO', 0);
  end;

end;

procedure TFrmAPAutoInv.FindRootAccount(ACurrencyId:Real; var AGLACCT_ID_FX:Real; AEPlantId, AGLACCT_ID_AP:Real);
var
  nId:Real;
begin
  nId := GetFXAccountID(AGLACCT_ID_AP);   {in IqAccShr.pas}
  nId := SelectValueFmtAsFloat('select plugins.get_glacct_id_with_ep_gl(%f, ''ACCT_ID_FX'', %f) from dual', [nId, AEplantId]);
  AGLACCT_ID_FX := nId;
  AssignMCAccount(ACurrencyId, AGLACCT_ID_FX);
end;

procedure TFrmAPAutoInv.AssignMCAccount(AID:Real; var Acct:Real);
var
  AGLValue:String;
  AGLAcct, aNewGLAcct:String;
  I, nStart, nLength:Integer;
  nID:Real;
begin
  AGLValue := SelectValueFmtAsString('select glvalue from currency where id = %f', [AId]);
  AGLAcct := SelectValueFmtAsString('select acct from glacct where id = %f', [Acct]);
  aNewGLAcct := AGLAcct;
  nStart  := Trunc(SelectValueAsFloat('select group_start from glacct_def where group_name = ' +
                       '(select FX_SEGMENT_NAME from iqsys)'));
  nLength  := Trunc(SelectValueAsFloat('select group_length from glacct_def where group_name = ' +
                       '(select FX_SEGMENT_NAME from iqsys)'));
  if Length(aNewGLAcct) < (nStart + nLength - 1) then
    ANewGLAcct := AGLAcct
  else
  begin
    try
      for I:= nStart to (nStart + nLength - 1) do
        ANewGLAcct[ I ] := AGLValue[ I - nStart + 1 ];
    except
      ANewGLAcct := AGLAcct;
    end;
  end;
  nID := SelectValueFmtAsFloat('select id from glacct where acct = ''%s''', [ANewGLAcct]);
  if nID = 0 then
  begin
    nID := Acct;
  end;
  Acct := nID;
end;

procedure TFrmAPAutoInv.InsertAPPrepostDetailRecord(APoId:Real);
var
  AQry1:TFDQuery;
  AQry2:TFDQuery;
begin
  AQry1 := TFDQuery.Create(nil);
  try
    AQry1.Connection := UniMainModule.FDConnection1;
    if APoId <> 0 then
      AQry1.Sql.Add(IqFormat('select distinct d.id as po_detail_id ' +
                       ' from po_receipts r, po_detail d, po p ' +
                       ' where r.po_detail_id = d.id and d.po_id = p.id ' +
                       ' and p.vendor_id = %f ' +
                       ' and p.id = %f ' +
                       ' and misc.eplant_filter(p.eplant_id) = 1 ' +
                       ' and NVL(r.receiptno, ''^^^^****^^^@@@@'') <> ''CUM RECEIPT ADJUSTMENT'' ' +
                       ' and r.date_received <= To_Date(''%s'', ''MM/DD/RRRR'') and NVL(r.posted, ''N'') = ''Y'' ' +
                       ' and not exists (select 1 from apprepost_detail where po_receipts_id = r.id) ' +
                       ' and not exists (select 1 from apinvoice_detail where po_receipts_id = r.id)',
                       [QryVendorsVENDOR_ID.asFloat, APoId, FormatDateTime('mm/dd/yyyy', wwDate.DateTime)]))

    else
      AQry1.Sql.Add(IqFormat('select distinct d.id as po_detail_id ' +
                       ' from po_receipts r, po_detail d, po p ' +
                       ' where r.po_detail_id = d.id and d.po_id = p.id ' +
                       ' and p.vendor_id = %f ' +
                       ' and misc.eplant_filter(p.eplant_id) = 1 ' +
                       ' and NVL(r.receiptno, ''^^^^****^^^@@@@'') <> ''CUM RECEIPT ADJUSTMENT'' ' +
                       ' and r.date_received <= To_Date(''%s'', ''MM/DD/RRRR'') and NVL(r.posted, ''N'') = ''Y'' ' +
                       ' and not exists (select 1 from apprepost_detail where po_receipts_id = r.id) ' +
                       ' and not exists (select 1 from apinvoice_detail where po_receipts_id = r.id)',
                       [QryVendorsVENDOR_ID.asFloat, FormatDateTime('mm/dd/yyyy', wwDate.DateTime)]));

     AQry1.open;
     while not AQry1.eof do
     begin
       QryPODtls.Close;
//       QryPODtls.ParamByName('po_detail_id').Value := AQry1.FieldByName('po_detail_id').asFloat;
       AssignQueryParamValue(QryPODtls, 'po_detail_id', AQry1.FieldByName('po_detail_id').asFloat);
       QryPODtls.Open;
       AQry2 := TFDQuery.Create(nil);
       try
         AQry2.Connection := UniMainModule.FDConnection1;
         AQry2.Sql.Add(IqFormat('select r.id as po_receipts_id ' +
                          ' from po_receipts r ' +
                          ' where r.po_detail_id = %f ' +
                          ' and NVL(r.receiptno, ''^^^^****^^^@@@@'') <> ''CUM RECEIPT ADJUSTMENT'' ' +
                          ' and r.date_received <= To_Date(''%s'', ''MM/DD/RRRR'') and NVL(r.posted, ''N'') = ''Y'' ' +
//                          ' and r.receiptno <> ''CUM RECEIPT ADJUSTMENT'' ' +
                          ' and not exists (select 1 from apprepost_detail where po_receipts_id = r.id) ' +
                          ' and not exists (select 1 from apinvoice_detail where po_receipts_id = r.id)',
                          [AQry1.FieldByName('po_detail_id').asFloat, FormatDateTime('mm/dd/yyyy', wwDate.DateTime)]));
          AQry2.open;
          while not AQry2.Eof do
          begin
            QryRec.Close;
//            QryRec.ParamByName('PO_RECEIPTS_ID').Value := AQry2.FieldByName('PO_RECEIPTS_ID').asFloat;
            AssignQueryParamValue(QryRec, 'PO_RECEIPTS_ID', AQry2.FieldByName('PO_RECEIPTS_ID').asFloat);
            QryRec.Open;
            InsertDetail(AQry1.FieldByName('po_detail_id').asFloat);
            AQry2.Next;
          end;
       finally
          AQry2.Free;
       end;
       AQry1.next;
     end;

  finally
    AQry1.Free;
  end;
end;

procedure TFrmAPAutoInv.InsertDetail(APO_Detail_ID:Real);
var
  AStdCost:String;
  Auninvoiced, Anet_received, Adistributed:Real;
  AGlAcctId:Real;
  I:Integer;
  AConfirm:Integer;
  ACost:Real;
  APoId:Real;
  APono:String;
  AUnitPrice:Real;
  AOutSourceCost:Real;
begin
  if SelectValueAsString('select std_cost_posting from iqsys') = 'Y'
  then AStdCost := 'Y'
  else AStdCost := 'N';

  Auninvoiced   := 0;
  Anet_received := 0;


  with QryPO_Recv_vs_AP do
  begin
    Close;
//    ParamByName('po_detail_id').Value := APO_Detail_ID;
    AssignQueryParamValue(QryPO_Recv_vs_AP, 'po_detail_id', APO_Detail_ID);
    Open;
  end;

  with QryPO_Recv_vs_AP do
  begin
    Auninvoiced   := FieldByname('uninvoiced').asFloat;
    Anet_received := FieldByname('net_received').asFloat;
  end;

  Auninvoiced   := QryRecQTY_TO_INVOICE.asFloat;
  Anet_received := QryRecQTY_RECEIVED.asFloat;





  AGlAcctId := SelectValueFmtAsFloat('select decode(''%s'', ''Y'',                                                   ' +
                               ' decode(%f, 0, decode(%f, 0, %f, decode(%f, 0, 0, plugins.get_glacct_no_name(%f, %f)) ), ' +
                               ' decode(%f, 0, 0, decode(%f, 0, %f, plugins.get_glacct_no_name(%f, %f)))), ' +


                               ' decode(%f, 0, decode(%f, 0, %f, plugins.get_glacct_id_with_ep_gl(%f, ''acct_id_holding'', %f)),  ' +
                               ' decode(%f, 0, %f, plugins.get_glacct_id_with_ep_gl(%f, ''acct_id_holding'', %f)))) from dual',
   [AStdCost,
   QryPODtls.FieldByName('ARINVT_ID').asFloat,
   FindEPlantId(FEPlantId, QryPODtls.FieldByName('PO_DETAIL_ID').asFloat),
   QryPODtls.FieldByName('GLACCT_ID_INV').asFloat,
   QryPODtls.FieldByName('GLACCT_ID_INV').asFloat,
   QryPODtls.FieldByName('GLACCT_ID_INV').asFloat,
   FindEPlantId(FEPlantId, QryPODtls.FieldByName('PO_DETAIL_ID').asFloat),
   QryPODtls.FieldByName('GLACCT_ID_INV').asFloat,
   FindEPlantId(FEPlantId, QryPODtls.FieldByName('PO_DETAIL_ID').asFloat),
   QryPODtls.FieldByName('GLACCT_ID_INV').asFloat,
   QryPODtls.FieldByName('GLACCT_ID_INV').asFloat,
   FindEPlantId(FEPlantId, QryPODtls.FieldByName('PO_DETAIL_ID').asFloat),


   QryPODtls.FieldByName('GLACCT_ID_HOLDING').asFloat,
   FindEPlantId(FEPlantId, QryPODtls.FieldByName('PO_DETAIL_ID').asFloat),
   QryPODtls.FieldByName('GLACCT_ID_INV').asFloat,
   QryPODtls.FieldByName('GLACCT_ID_INV').asFloat,
   FindEPlantId(FEPlantId, QryPODtls.FieldByName('PO_DETAIL_ID').asFloat),
   FindEPlantId(FEPlantId, QryPODtls.FieldByName('PO_DETAIL_ID').asFloat),
   QryPODtls.FieldByName('GLACCT_ID_HOLDING').asFloat,
   QryPODtls.FieldByName('GLACCT_ID_HOLDING').asFloat,
   FindEPlantId(FEPlantId, QryPODtls.FieldByName('PO_DETAIL_ID').asFloat)]);


//  if (AStdCost = 'Y') and (QryPODtls.FieldByName('DONT_POST_PPV').asString = 'N') then
    AGlAcctId := GetAccrueAccount(AGlAcctId,
                                  QryPODtls.FieldByName('ARINVT_ID').asFloat,
                                  FindEPlantId(FEPlantId, QryPODtls.FieldByName('PO_DETAIL_ID').asFloat),
                                  AStdCost,
                                  QryPODtls.FieldByName('DONT_POST_PPV').asString,
                                  QryPODtls.FieldByName('ID').asFloat,
                                  QryPODtls.FieldByName('GLACCT_ID_INV').asFloat);


//    AGlAcctId := GetAccrueAccount(AGlAcctId,
//                                  QryPODtls.FieldByName('ARINVT_ID').asFloat,
//                                  FindEPlantId(FEPlantId, QryPODtls.FieldByName('PO_DETAIL_ID').asFloat));



//  ACost := SelectValueFmtAsFloat('select NVL(UOM.IQConvert( d.unit, a.unit, NVL(d.std_cost, -1),  d.arinvt_id, ''Y'' ), -1) as adj_std_cost  ' +
//                    ' from po_detail d,     arinvt a where d.id = %f   and d.arinvt_id = a.id', [APO_Detail_ID]);

  ACost := SelectValueFmtAsFloat('select NVL(UOM.IQConvert( d.unit, a.unit, NVL(r.std_cost, -1),  d.arinvt_id, ''Y'' ), -1) as adj_std_cost  ' +
                    ' from po_detail d, arinvt a, po_receipts r where d.id = r.po_detail_id and d.arinvt_id = a.id and r.id = %f', [QryRecID.asFloat]);


  if ACost = 0 then
    ACost :=  QryPODtls.FieldByName('STD_COST').asFloat;

  if SelectValueFmtAsFloat('select pit_eval_rec.LandedCostExists( %f ) from dual', [QryPODtls.FieldByName('ARINVT_ID').asFloat]) = 1 then
  begin
    ACost := SelectValueFmtAsFloat('select pit_eval_rec.GetCostWithoutLandedCost(%f, %f) from dual', [ACost, QryPODtls.FieldByName('ARINVT_ID').asFloat]);
  end;

  APoId := SelectValueFmtAsFloat('select po_id from po_detail where id = %f', [APO_Detail_ID]);
  if APoId = 0 then
  begin
    APoId := SelectValueFmtAsFloat('select po_id from po_detail_hist where id = %f', [APO_Detail_ID]);
    APono := SelectValueFmtAsString('select pono from po_hist where id = %f', [APoId]);
  end
  else
    APono := SelectValueFmtAsString('select pono from po where id = %f', [APoId]);

  AUnitPrice := SelectValueFmtAsFloat('select NVL(unit_price, -10000000) from  po_receipts where id = %f', [QryRecID.asFloat]);
  if AUnitPrice < -1000000 then
    AUnitPrice := QryPODtls.FieldByName('UNIT_PRICE').asFloat;

  Adistributed  := Auninvoiced * AUnitPrice;


  FDetailId := GetNextID('APPREPOST_DETAIL');
  ExecuteCommandFmt(
  'insert into apprepost_detail (apprepost_id,                                                             ' +
  '                              id,                                                                       ' +
  '                              glacct_id_expense,                                                        ' +
  '                              glacct_id_ppv,                                                            ' +
  '                              qty_invoiced,                                                             ' +
  '                              po_detail_id,                                                             ' +
  '                              po_receipts_id,                                                             ' +
  '                              cost_object_id,                                                           ' +
  '                              cost_object_source,                                                       ' +
  '                              std_cost,                                                                 ' +
  '                              unit_cost,                                                                ' +
  '                              applydisc,                                                                ' +
  '                              post_ppv,                                                                 ' +
  '                              tax_code_id,                                                              ' +
  '                              amount_distributed,                                                       ' +
  '                              ref_code_id,                                                              ' +
  '                              freight_id,                                                               ' +
  '                              po_id,                                                                    ' +
  '                              pono,                                                                     ' +
  '                              amount_before_tax)                                                        ' +
  '                       values (%f,                                                                      ' +
  '                               %f,                                                                      ' +
  '                                decode(%f, 0, null, %f),                                                ' +
  '                                decode(%f, 0, %f, plugins.get_glacct_id_with_ep_gl(%.6f, ''acct_id_ppv'', %f)), ' +
  '                                %f,                                                                     ' +
  '                                decode(%f, 0, null, %f),                                                ' +
  '                                decode(%f, 0, null, %f),                                                ' +
  '                                decode(%f, 0, null, %f),                                                ' +
  '                                ''%s'',                                                                 ' +
  '                                %.6f,                                                                   ' +
  '                                %.6f,                                                                   ' +
  '                                ''N'',                                                                  ' +
//  '                                decode(%f, 0, ''N'', ''Y''), ' +
  '                                decode(NVL(''%s'', ''Y''), ''Y'', ''N'', decode(%.6f, 0, ''N'', ''Y'')), ' +
  '                                decode(%f, 0, null, %f),                                                ' +
  '                                %f, ' +
  '                                decode(%f, 0, null, %f),                                                ' +
  '                                decode(%f, 0, null, %f),                                                ' +
  '                                decode(%f, 0, null, %f),                                                ' +
  '                                ''%s'',                                                                  ' +
  '                                %f)',
  [FAprepostId,
   FDetailId,
   AGlAcctId, AGlAcctId,
   FEPlantId,
   QryPODtls.FieldByName('GLACCT_ID_PPV').asFloat,
   QryPODtls.FieldByName('GLACCT_ID_PPV').asFloat,
   FEPlantId,
   Auninvoiced,
   QryPODtls.FieldByName('PO_DETAIL_ID').asFloat,
   QryPODtls.FieldByName('PO_DETAIL_ID').asFloat,
   QryRec.FieldByName('ID').asFloat,
   QryRec.FieldByName('ID').asFloat,
   QryPODtls.FieldByName('cost_object_id').asFloat,
   QryPODtls.FieldByName('cost_object_id').asFloat,
   QryPODtls.FieldByName('cost_object_source').asString,
   ACost,
//   QryPODtls.FieldByName('ADJ_STD_COST').asFloat,
   AUnitPrice,
//   QryPODtls.FieldByName('UNIT_PRICE').asFloat,
//   0,
//   QryAPPrePost.FieldByName('disc_amount').asFloat,
   QryPODtls.FieldByName('DONT_POST_PPV').asString,
   QryPODtls.FieldByName('STD_COST').asFloat,
   QryPODtlsTAX_Code_id.asFloat,
   QryPODtlsTAX_Code_id.asFloat,
   Adistributed,
   QryPODtlsRef_Code_id.asFloat,
   QryPODtlsRef_Code_id.asFloat,
   QryPODtls.FieldByName('freight_id').asFloat,
   QryPODtls.FieldByName('freight_id').asFloat,
   APoId,
   APoId,
   StrTran(APono, '''', ''''''),
   Adistributed]);

  ExecuteCommandFmt('update apprepost_detail set po_receipts_id = %f, qty_invoiced = %f where id = %f',
            [QryRecID.asFloat, QryRecQTY_TO_INVOICE.asFloat, FDetailId]);

  AOutSourceCost := SelectValueFmtAsFloat('select UOM.IqConvert(po_detail_uom, uom, pit_eval_rec.GetOutsourcedElementStdCost(%f), arinvt_id, ''Y'') ' +
                                   ' from v_po_detail_qk where po_detail_id = %f',
                                    [QryPODtls.FieldByName('ARINVT_ID').asFloat, QryPODtls.FieldByName('PO_DETAIL_ID').asFloat]);

  if AOutSourceCost <> 0 then
    ExecuteCommandFmt('update apprepost_detail set std_cost = %.6f where id = %f',
                  [AOutSourceCost, FDetailId]);


   InsertApPrepostTax(FDetailId, QryPODtls.FieldByName('PO_DETAIL_ID').asFloat);
   InsertAccountSplit(FDetailId, SelectValueFmtAsFloat('select vendor_id from apprepost where id = %f', [FAprepostId]), 'InsertDetail');

end;

function TFrmAPAutoInv.FindEPlantId(Acct1, APoDtlId:Real):Real;
begin
  Result := SelectValueFmtAsFloat('select eplant_id from po_detail where id = %f', [APoDtlId]);
  if Result = 0 then
    Result := Acct1;
end;


function TFrmAPAutoInv.GetAccrueAccount(AGlAcctId, ArinvtId, EPlantId:Real; AStdCost, ADontPostPPV:String; APoDetailId:Real; APoGtlGlAcct:Real):Real;
var
  AId:Real;
  AId2:Real;
begin
  result := SelectValueFmtAsFloat(' select AP.GetAccrueAccount(%f, %f, %f, ''%s'', ''%s'', %f) from dual',
            [AGlAcctId, ArinvtId, EPlantId, AStdCost, ADontPostPPV, APoGtlGlAcct]);
  exit;

  if (AStdCost = 'N') then
  begin
    Result := AGlAcctId;
    exit;
  end;

  if (AStdCost = 'Y') and (ADontPostPPV = 'N') then
  begin
    aId := SelectValueFmtAsFloat('select elements_id from arinvt_elements where arinvt_id = %f and NVL(default_cost_element, ''N'') = ''Y''', [ArinvtId]);
    if aId = 0 then
      aId := SelectValueFmtAsFloat('select min(elements_id) from arinvt_elements where arinvt_id = %f', [ArinvtId]);

    if aId = 0 then
    begin
      if SelectValueAsString('select NVL(Post_Non_Inventory, ''N'') from iqsys') = 'Y' then
      begin
        if ArinvtId = 0 then
        begin
          if SelectValueAsString('select NVL(expense_ppv, ''N'') from iqsys2') = 'Y' then
          begin
            AId2 := SelectValueFmtAsFloat('select glacct_id_inv from po_detail where id = %f', [APoDetailId]);
            if AId2 = 0 then
              Result := SelectValueFmtAsFloat('select plugins.get_glacct_no_name(acct_id_holding, %f)  from iqsys where rownum < 2', [EPlantId])
            else
              Result := SelectValueFmtAsFloat('select plugins.get_glacct_no_name(%f, %f) from dual', [AId2, EPlantId]);
          end
          else
            Result := SelectValueFmtAsFloat('select plugins.get_glacct_no_name(acct_id_holding, %f)  from iqsys where rownum < 2', [EPlantId]);
        end
        else
          Result := SelectValueFmtAsFloat('select plugins.get_glacct_no_name(acct_id_holding, %f)  from iqsys where rownum < 2', [EPlantId]);
        if Result = 0 then
          Result := AGlAcctId;
      end
      else
        Result := AGlAcctId;
      exit;
    end;

    Result := SelectValueFmtAsFloat('select decode(%f, 0, acct_id_accrued_recv, ' +
                        'plugins.get_glacct_id_with_ep_gl(acct_id_accrued_recv, ''acct_id_holding'', %f)) ' +
                        'from elements where id = %f',
                        [EPlantId, EPlantId, AId]);
    if (Result = 0) and (ArinvtId <> 0) then
      Result := SelectValueFmtAsFloat('select plugins.get_glacct_no_name(acct_id_holding, %f)  from iqsys where rownum < 2', [EPlantId]);
    if Result = 0 then
     Result := AGlAcctId;
  end
  else
  begin
    aId := SelectValueFmtAsFloat('select elements_id from arinvt_elements where arinvt_id = %f and NVL(default_cost_element, ''N'') = ''Y''', [ArinvtId]);
    if aId = 0 then
      aId := SelectValueFmtAsFloat('select min(elements_id) from arinvt_elements where arinvt_id = %f', [ArinvtId]);

    if aId = 0 then
    begin
      if SelectValueAsString('select NVL(Post_Non_Inventory, ''N'') from iqsys') = 'Y' then
      begin
        if ArinvtId = 0 then
        begin
          if SelectValueAsString('select NVL(expense_ppv, ''N'') from iqsys2') = 'Y' then
          begin
            AId2 := SelectValueFmtAsFloat('select glacct_id_inv from po_detail where id = %f', [APoDetailId]);
            if AId2 = 0 then
              Result := SelectValueFmtAsFloat('select plugins.get_glacct_no_name(acct_id_holding, %f)  from iqsys where rownum < 2', [EPlantId])
            else
              Result := SelectValueFmtAsFloat('select plugins.get_glacct_no_name(%f, %f) from dual', [AId2, EPlantId]);
          end
          else
            Result := SelectValueFmtAsFloat('select plugins.get_glacct_no_name(acct_id_holding, %f)  from iqsys where rownum < 2', [EPlantId]);
        end
        else
          Result := SelectValueFmtAsFloat('select plugins.get_glacct_no_name(acct_id_holding, %f)  from iqsys where rownum < 2', [EPlantId]);
        if Result = 0 then
          Result := AGlAcctId;
      end
      else
        Result := AGlAcctId;
      exit;
    end;

    Result := SelectValueFmtAsFloat('select decode(%f, 0, acct_id_recv_dispo_inv, ' +
                        'plugins.get_glacct_id_with_ep_gl(acct_id_recv_dispo_inv, ''acct_id_holding'', %f)) ' +
                        'from elements where id = %f',
                        [EPlantId, EPlantId, AId]);
    if (Result = 0) and (ArinvtId <> 0) then
      Result := SelectValueFmtAsFloat('select plugins.get_glacct_no_name(acct_id_fg, %f)  from iqsys where rownum < 2', [EPlantId]);
    if Result = 0 then
     Result := AGlAcctId;
  end;
end;

{
function TFrmAPAutoInv.GetAccrueAccount(AGlAcctId, ArinvtId, EPlantId:Real):Real;
var
  AId:Real;
begin
  aId := SelectValueFmtAsFloat('select elements_id from arinvt_elements where arinvt_id = %f and NVL(default_cost_element, ''N'') = ''Y''', [ArinvtId]);
  if aId = 0 then
    aId := SelectValueFmtAsFloat('select min(elements_id) from arinvt_elements where arinvt_id = %f', [ArinvtId]);

  Result := SelectValueFmtAsFloat('select decode(%f, 0, acct_id_accrued_recv, ' +
                      'plugins.get_glacct_id_with_ep_gl(acct_id_accrued_recv, ''acct_id_holding'', %f)) ' +
                      'from elements where id = %f',
                      [EPlantId, EPlantId, AId]);
  if (Result = 0) and (ArinvtId <> 0) then
    Result := SelectValueFmtAsFloat('select plugins.get_glacct_no_name(acct_id_holding, %f)  from iqsys where rownum < 2', [EPlantId]);
  if Result = 0 then
   Result := AGlAcctId;
end;
}
procedure TFrmAPAutoInv.InsertApPrepostTax(AprepostId, APoDetailId:Real);
var
  ATaxCodeId:Real;
  Amount:Real;
  ASum:Real;
begin
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IQFormat('select NVL(d.taxable, ''N'') as taxable, NVL(p.tax_code_id, 0) as tax_code_id ' +
                            'from po p, po_detail d where d.po_id = p.id and d.id = %f', [APoDetailId]));
    Open;
    if eof and bof then Exit;
    if (FieldByName('taxable').asString = 'N') or (FieldByname('tax_code_id').asFloat = 0) then
    begin
      ExecuteCommandFmt('update apprepost_detail set tax_code_id = null where id = %f', [AprepostId]);
      Exit;
    end;

    Amount := SelectValueFmtAsFloat('select amount_before_tax from apprepost_detail where id = %f', [AprepostId]);

    ExecuteCommandFmt('insert into apprepost_tax (apprepost_detail_id,          ' +
                                          'descrip,                     ' +
                                          'tax_rate,                    ' +
                                          'vat_paid,                    ' +
                                          'glacct_id,                   ' +
                                          'tax_amount)                  ' +
                                   'select %f,                          ' +
                                   '        e.descrip,                  ' +
                                   '        e.tax_rate,                 ' +
                                   '        NVL(l.vat_paid, ''N''),     ' +
                                   '        AP.GetAPTaxGlacctId(%f, l.id, %f), ' +
//                                   '        plugins.get_glacct_id_with_ep_gl(e.glacct_id, ''acct_id_salestax'', %f ), ' +
                                   '        e.tax_rate * %f/100         ' +
                                   '  from tax_elements e,              ' +
                                   '       tax_code_link l,             ' +
                                   '       tax_codes c                  ' +
                                   ' where l.tax_elements_id = e.id(+)  ' +
                                   '   and l.tax_codes_id = c.id        ' +
                                   '   and c.id = %f                    ',
                                   [AprepostId,
                                    AprepostId,
                                    FEPlantId,
                                    Amount,
                                    FieldByname('tax_code_id').asFloat]);
  finally
    Free;
  end;

  ASum := SelectValueFmtAsFloat('select sum(tax_amount) from apprepost_tax where apprepost_detail_id = %f', [AprepostId]);

  if ASum <> 0 then
    ExecuteCommandFmt('update apprepost_detail set amount_distributed = NVL(amount_before_tax, 0) + %f where id = %f',
              [ASum, AprepostId]);

end;

procedure TFrmAPAutoInv.OneInvoicePerPO1Click(Sender: TObject);
begin
  if OneInvoicePerPO1.Checked then
  begin
    IQRegIntegerScalarWrite( self, 'AP_ONE_INV_PER_PO', 0);
    OneInvoicePerPO1.Checked := False;
  end
  else
  begin
    IQRegIntegerScalarWrite( self, 'AP_ONE_INV_PER_PO', 1);
    OneInvoicePerPO1.Checked := True;
  end;
end;

procedure TFrmAPAutoInv.FormShow(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmSETUP{HTM} )  {IQHelpHk.pas}
end;

procedure TFrmAPAutoInv.Contents1Click(Sender: TObject);
begin
 IQHelp.HelpContext( 6667 );
end;

end.
