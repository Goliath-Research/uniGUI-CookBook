unit AP1099;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.Menus,
  Data.DB,
  DbCtrls,
  Mask,
  IQMS.WebVcl.Hpick,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
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
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniGroupBox,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniPageControl,
  uniMainMenu, IQUniGrid, uniGUIFrame, uniComboBox, uniDBComboBox;

type
  TFrm1099 = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Print2: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    nav1099: TUniDBNavigator;
    Splitter2: TUniSplitter;
    Panel5: TUniPanel;
    PC: TUniPageControl;
    tabForm: TUniTabSheet;
    TabGrid: TUniTabSheet;
    SBGridView: TUniSpeedButton;
    Panel6: TUniPanel;
    navInv: TUniDBNavigator;
    SrcYear: TDataSource;
    TblYear: TFDTable;
    Src1099: TDataSource;
    Tbl1099: TFDTable;
    SrcInv: TDataSource;
    QryInv: TFDQuery;
    Tbl1099ID: TBCDField;
    Tbl1099AP1099_YEARS_ID: TBCDField;
    Tbl1099VENDOR_VENDORNO: TStringField;
    Tbl1099VENDOR_COMPANY: TStringField;
    Tbl1099VENDOR_ATTN: TStringField;
    Tbl1099VENDOR_CITY: TStringField;
    Tbl1099VENDOR_ZIP: TStringField;
    Tbl1099VENDOR_FED_TAX_ID: TStringField;
    Tbl1099PAYERS_NAME: TStringField;
    Tbl1099PAYERS_CITY: TStringField;
    Tbl1099PAYERS_ZIP: TStringField;
    Tbl1099PAYERS_PHONE_NUMBER: TStringField;
    Tbl1099PAYERS_FED_TAX_ID: TStringField;
    Tbl1099FIELD1: TBCDField;
    Tbl1099FIELD2: TBCDField;
    Tbl1099FIELD3: TBCDField;
    Tbl1099FIELD4: TBCDField;
    Tbl1099FIELD5: TBCDField;
    Tbl1099FIELD6: TBCDField;
    Tbl1099FIELD7: TBCDField;
    Tbl1099FIELD8: TBCDField;
    Tbl1099FIELD9: TStringField;
    Tbl1099FIELD10: TBCDField;
    Tbl1099FIELD11: TBCDField;
    Tbl1099FIELD12: TStringField;
    Tbl1099FIELD13: TStringField;
    Tbl1099YEAR: TStringField;
    Tbl1099VENDOR_ID: TBCDField;
    Panel7: TUniPanel;
    Splitter3: TUniSplitter;
    Panel8: TUniPanel;
    GroupBox1: TUniGroupBox;
    GroupBox2: TUniGroupBox;
    pName: TUniDBEdit;
    pAddr1: TUniDBEdit;
    pAddr2: TUniDBEdit;
    pCity: TUniDBEdit;
    pState: TUniDBEdit;
    pZip: TUniDBEdit;
    pPhone: TUniDBEdit;
    pFed: TUniDBEdit;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    Label8: TUniLabel;
    pComp: TUniDBEdit;
    cAddr1: TUniDBEdit;
    cAddr2: TUniDBEdit;
    cCity: TUniDBEdit;
    cState: TUniDBEdit;
    cZip: TUniDBEdit;
    cFed: TUniDBEdit;
    Label9: TUniLabel;
    Label10: TUniLabel;
    Label11: TUniLabel;
    Label12: TUniLabel;
    Label13: TUniLabel;
    Label14: TUniLabel;
    Label16: TUniLabel;
    ed1: TUniDBEdit;
    ed2: TUniDBEdit;
    ed3: TUniDBEdit;
    ed4: TUniDBEdit;
    ed5: TUniDBEdit;
    ed6: TUniDBEdit;
    ed7: TUniDBEdit;
    ed8: TUniDBEdit;
    ed10: TUniDBEdit;
    ed11: TUniDBEdit;
    ed12: TUniDBEdit;
    ed13: TUniDBEdit;
    Label15: TUniLabel;
    Label17: TUniLabel;
    Label18: TUniLabel;
    Label19: TUniLabel;
    Label20: TUniLabel;
    Label21: TUniLabel;
    Label22: TUniLabel;
    Label23: TUniLabel;
    Label25: TUniLabel;
    Label26: TUniLabel;
    Label27: TUniLabel;
    Label28: TUniLabel;
    vAttn: TUniDBEdit;
    vVendNo: TUniDBEdit;
    Label29: TUniLabel;
    Label30: TUniLabel;
    Label31: TUniLabel;
    vAddr3: TUniDBEdit;
    cbYear: TUniDBLookupComboBox;
    navYear: TUniDBNavigator;
    PkYear: TIQWebHPick;
    PkYearID: TBCDField;
    PkYearYEAR: TStringField;
    PkYearDESCRIPTION: TStringField;
    spSearchyear: TUniSpeedButton;
    QryInvVENDOR_ID: TBCDField;
    QryInvINVOICE_AMOUNT: TBCDField;
    QryInvINVOICE_NO: TStringField;
    QryInvREFERENCE: TStringField;
    QryInvINCLUDE_IN_1099: TStringField;
    QryInvAMOUNT_PAID: TFMTBCDField;
    QryInvDISCOUNT_TAKEN: TFMTBCDField;
    ed9: TUniDBCheckBox;
    gridInv: TIQUniGridControl;
    grid1099: TIQUniGridControl;
    UpdateSQL1: TFDUpdateSQL;
    QryInvID: TBCDField;
    sbRecalc: TUniSpeedButton;
    QryTotal: TFDQuery;
    IQAbout1: TIQWebAbout;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    N1: TUniMenuItem;
    Recalculate1: TUniMenuItem;
    N2: TUniMenuItem;
    ToggleGridForm1: TUniMenuItem;
    SearchYear1: TUniMenuItem;
    TblYearID: TBCDField;
    TblYearYEAR: TStringField;
    TblYearDESCRIP: TStringField;
    Contents1: TUniMenuItem;
    PKVendors: TIQWebHPick;
    SBVendor: TUniSpeedButton;
    PKVendorsID: TBCDField;
    PKVendorsAP1099_YEARS_ID: TBCDField;
    PKVendorsVENDOR_VENDORNO: TStringField;
    PKVendorsVENDOR_COMPANY: TStringField;
    PKVendorsVENDOR_ATTN: TStringField;
    PKVendorsVENDOR_ADDR1: TStringField;
    PKVendorsVENDOR_ADDR2: TStringField;
    PKVendorsVENDOR_ADDR3: TStringField;
    PKVendorsVENDOR_CITY: TStringField;
    PKVendorsVENDOR_STATE: TStringField;
    PKVendorsVENDOR_ZIP: TStringField;
    PKVendorsVENDOR_FED_TAX_ID: TStringField;
    Tbl1099EPP: TBCDField;
    Tbl1099ATTORNEY: TBCDField;
    Tbl1099STATE1INCOME: TBCDField;
    Tbl1099STATE2NO: TStringField;
    Tbl1099STATE2TAX: TBCDField;
    Tbl1099STATE2INCOME: TBCDField;
    Label24: TUniLabel;
    DBEpp: TUniDBEdit;
    Label32: TUniLabel;
    DBAttorney: TUniDBEdit;
    Label33: TUniLabel;
    DBState1Income: TUniDBEdit;
    Label34: TUniLabel;
    DBState2No: TUniDBEdit;
    Label35: TUniLabel;
    DBState2tax: TUniDBEdit;
    Label36: TUniLabel;
    DBState2Income: TUniDBEdit;
    TblYearYearDesc: TStringField;
    QryInvEIN_ID: TBCDField;
    TblYearEIN_ID: TBCDField;
    Tbl1099VENDOR_STATE: TStringField;
    Tbl1099PAYERS_STATE: TStringField;
    Tbl1099VENDOR_ADDR1: TStringField;
    Tbl1099VENDOR_ADDR2: TStringField;
    Tbl1099VENDOR_ADDR3: TStringField;
    Tbl1099PAYERS_ADDR1: TStringField;
    Tbl1099PAYERS_ADDR2: TStringField;
    PkYearEIN_DESCRIP: TStringField;
    SR: TIQWebSecurityRegister;
    UniLabel1: TUniLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure SBGridViewClick(Sender: TObject);
    procedure navYearBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure spSearchyearClick(Sender: TObject);
    procedure PkYearIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure QryInvAfterPost(DataSet: TDataSet);
    procedure sbRecalcClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Print2Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure Tbl1099NewRecord(DataSet: TDataSet);
    procedure Tbl1099BeforePost(DataSet: TDataSet);
    procedure Src1099DataChange(Sender: TObject; Field: TField);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure Tbl1099AfterPost(DataSet: TDataSet);
    procedure SBVendorClick(Sender: TObject);
    procedure PKVendorsBeforeOpen(DataSet: TDataSet);
    procedure TblYearCalcFields(DataSet: TDataSet);
    procedure TblYearAfterScroll(DataSet: TDataSet);
    procedure TblYearFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  private
    { Private declarations }
    FID:Real;
    FEplantId:Real;
    procedure ResetDropDownBox(AId:Real);
  public
    { Public declarations }
    //constructor Create(AOwner:TComponent);override;
  end;

procedure Do1099;

var
  Frm1099: TFrm1099;

implementation

{$R *.DFM}

uses
  ap_rscstr,
  AP1099NY,
  IQMS.Common.DataConst,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager;

procedure Do1099;
var
  Form :  TFrm1099;
begin
  Form := TFrm1099.Create(uniGUIApplication.UniApplication);

  with Form do
  begin
     // IQRegFormRead( Form, [Form, Panel3, GridInv, Grid1099]);
      grid1099.DataSource := nil;
      PC.ActivePage := TabForm;

      FEplantId := 0;
//      if SecurityManager.EPlantsExist then
//      begin
//        if SecurityManager.EPlant_ID <> 'NULL' then
//           FEplantId := StrToFloat(SecurityManager.EPlant_ID)
//      end;

      try
       // spSearchYearClick(NIL) ;      // activate search speed button
      except on E:EAbort do
        begin
        //  PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
         // System.SysUtils.ABORT;
        end;
      end;
  end;

  Form.ShowModal;
end;

procedure TFrm1099.FormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
end;

procedure TFrm1099.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 // IQRegFormWrite( self, [self, Panel3, GridInv, Grid1099]);
 // Action:= caFree;
end;

procedure TFrm1099.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm1099.SBGridViewClick(Sender: TObject);
begin
  if (PC.ActivePage = TabGrid) or (Sender = NIL) then
  begin
    grid1099.DataSource:= NIL;
    PC.ActivePage := TabForm;
  end
  else
  begin
    grid1099.DataSource  := Src1099;
    PC.ActivePage := TabGrid;
  end;
end;

procedure TFrm1099.navYearBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
var
  nId:Real;
begin
  if Button = nbInsert then
  begin
    nId := DoGetNew1099Year; {in AP1099NY.pas}
    if nId <> 0 then
    begin
      ResetDropDownBox(nId);
      TblYear.Refresh;
      TblYear.Locate('ID', nId, []);
    end;
  end
  else
  begin
    if IqConfirmYN(ap_rscstr.cTXT0000003 {'Delete the 1099 year?'}) then
    begin
      TblYear.Delete;
      TblYear.Refresh;
      cbYear.Refresh;
      cbYear.ListSource := nil;
      cbYear.ListSource := SrcYear;
//      ResetDropDownBox(0);
    end;
  end;
  Abort;
end;

procedure TFrm1099.ResetDropDownBox(AId:Real);
begin
  TblYear.Refresh;
  TblYear.Locate('ID', AId, []);
  cbYear.KeyValue := AId;
end;


procedure TFrm1099.spSearchyearClick(Sender: TObject);
var
  nId:Real;
begin
  with PkYear do
    if Execute then
    begin
      nId := GetValue('ID');
      if nID > 0 then
        ResetDropDownBox(nId);
    end
    else System.SysUtils.Abort;
end;

procedure TFrm1099.PkYearIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  ResultValue := DoGetNew1099Year;
  if ResultValue <> 0 then
    Action     := mrOK
  else Action     := mrCancel;
end;

procedure TFrm1099.QryInvAfterPost(DataSet: TDataSet);
begin
//  if Assigned(DataSet) then with DataSet as TFDRDBMSDataSet do
//  begin
//    ApplyUpdates;
//    CommitUpdates;
//  end;
end;

procedure TFrm1099.sbRecalcClick(Sender: TObject);
begin
  with Tbl1099 do
  begin
    ExecuteCommandFmt('begin ap.Populate_AP1099_Detil_Vend(''%s'', %f, %f, %f); end;',
    [TblYearYEAR.asString, TblYearEIN_ID.AsFloat, Tbl1099VENDOR_ID.AsFloat, Tbl1099ID.asFloat]);
    Tbl1099.Refresh;
  end
end;

procedure TFrm1099.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrm1099.Print2Click(Sender: TObject);
begin
//  IQRepDef1.Execute;
end;

procedure TFrm1099.PrinterSetup1Click(Sender: TObject);
begin
//  PrinterSetupDialog1.Execute;
end;

procedure TFrm1099.Tbl1099NewRecord(DataSet: TDataSet);
var
  a_loggedin_eplant:real;

begin
  with TFDQuery.Create(self) do
  try
    Connection := FDManager.FindConnection(cnstFDConnectionName) as TFDConnection;  // IQMS.Common.DataConst

    a_loggedin_eplant := SelectValueAsFloat('select NVL(misc.GetEplantId, 0) from dual');
    if a_loggedin_eplant > 0 then
    begin
      Sql.Add('select company, ' +
                     'addr1 as address1, ' +
                     'addr2 as address2, ' +
                     'city, ' +
                     'state, ' +
                     'zip ' +
                     ' from ein ' +
                     ' where id = (select ein_id from eplant where id = misc.geteplantid)');
       Open;
       Tbl1099.FieldByName('payers_name').AsString         := FieldByName('company').AsString;
       Tbl1099.FieldByName('payers_addr1').AsString        := FieldByName('address1').AsString;
       Tbl1099.FieldByName('payers_addr2').AsString        := FieldByName('address2').AsString;
       Tbl1099.FieldByName('payers_city').AsString         := FieldByName('city').AsString;
       Tbl1099.FieldByName('payers_state').AsString        := FieldByName('state').AsString;
       Tbl1099.FieldByName('payers_zip').AsString          := FieldByName('zip').AsString;

       if TblYearEIN_ID.asFloat <> 0 then
         Tbl1099.FieldByName('payers_fed_tax_id').AsString   := SelectValueFmtAsString('select descrip from ein where id = %f',
           [TblYearEIN_ID.asFloat]);

    end
    else
    begin
      Sql.Add('select company, ' +
                     'address1, ' +
                     'address2, ' +
                     'city, ' +
                     'state, ' +
                     'zip, ' +
                     'phone, ' +
                     'fed_id from iqsys');
       Open;
       Tbl1099.FieldByName('payers_name').AsString         := FieldByName('company').AsString;
       Tbl1099.FieldByName('payers_addr1').AsString        := FieldByName('address1').AsString;
       Tbl1099.FieldByName('payers_addr2').AsString        := FieldByName('address2').AsString;
       Tbl1099.FieldByName('payers_city').AsString         := FieldByName('city').AsString;
       Tbl1099.FieldByName('payers_state').AsString        := FieldByName('state').AsString;
       Tbl1099.FieldByName('payers_zip').AsString          := FieldByName('zip').AsString;
       Tbl1099.FieldByName('payers_phone_number').AsString := FieldByName('phone').AsString;
       if TblYearEIN_ID.asFloat <> 0 then
         Tbl1099.FieldByName('payers_fed_tax_id').AsString   := SelectValueFmtAsString('select descrip from ein where id = %f',
           [TblYearEIN_ID.asFloat])
       else
         Tbl1099.FieldByName('payers_fed_tax_id').AsString   := FieldByName('fed_id').AsString;

     end;
  finally
    Free;
  end;
end;

procedure TFrm1099.Tbl1099BeforePost(DataSet: TDataSet);
begin
  if Tbl1099VENDOR_FED_TAX_ID.asString = '' then
    raise exception.create(ap_rscstr.cTXT0000004 {'Please enter a Vendor Federal Tax ID.'});
  Tbl1099.FieldByName('YEAR').asString := TblYear.FieldByName('YEAR').asString;

  IQAssignIDBeforePost(DataSet); {in IQlib}
  FID := Tbl1099ID.asFloat;
end;

procedure TFrm1099.Src1099DataChange(Sender: TObject; Field: TField);
begin
  //gridInv.ReadOnly := (Tbl1099.FieldByName('VENDOR_ID').asFloat = 0);
  //gridInv.Enabled  := (Tbl1099.FieldByName('VENDOR_ID').asFloat = 0);
  sbRecalc.Enabled := (Tbl1099.FieldByName('VENDOR_ID').asFloat <> 0);
end;

procedure TFrm1099.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmAP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrm1099.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1011150 );
end;

procedure TFrm1099.Tbl1099AfterPost(DataSet: TDataSet);
begin
  Tbl1099.Locate('ID', FID, []);
end;

procedure TFrm1099.SBVendorClick(Sender: TObject);
var
  AId:Real;
begin
  with PKVendors do
  if Execute then
  begin
    AId := GetValue('ID');
    Tbl1099.Locate('ID', AId, []);
  end;
end;

//  with PKVendors do
//    if Execute then
//    begin
//      if not (Tbl1099.State in [dsEdit, dsInsert]) then Tbl1099.Edit;
//      Tbl1099VENDOR_VENDORNO.asString   := GetValue('VENDORNO');
//      Tbl1099VENDOR_COMPANY.asString    := GetValue('COMPANY');
//      Tbl1099VENDOR_ATTN.asString       := GetValue('ATTN');
//      Tbl1099VENDOR_ADDR1.asString      := GetValue('ADDR1');
//      Tbl1099VENDOR_ADDR2.asString      := GetValue('ADDR2');
//      Tbl1099VENDOR_ADDR3.asString      := GetValue('ADDR3');
//      Tbl1099VENDOR_CITY.asString       := GetValue('CITY');
//      Tbl1099VENDOR_STATE.asString      := GetValue('STATE');
//      Tbl1099VENDOR_ZIP.asString        := GetValue('ZIP');
//      Tbl1099VENDOR_FED_TAX_ID.asString := GetValue('FED_TAX_ID');
//    end;


procedure TFrm1099.PKVendorsBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'AID', TblYearID.asFloat);
//  TFDQuery(DataSet).ParamByName('AID').Value := TblYearID.asFloat;
end;

procedure TFrm1099.TblYearCalcFields(DataSet: TDataSet);
begin
  TblYearYearDesc.AsString := Format('%s [%s]', [TblYearYEAR.asString, Trim(TblYearDESCRIP.asString)]);
end;

procedure TFrm1099.TblYearAfterScroll(DataSet: TDataSet);
begin
  if TblYearEIN_ID.AsFloat <> 0 then
  begin
    QryInv.Filter := Format('EIN_ID=%d', [TblYearEIN_ID.AsInteger]);
    QryInv.Filtered := True;
  end
  else
    QryInv.Filtered := False;
end;

procedure TFrm1099.TblYearFilterRecord(DataSet: TDataSet; var Accept: Boolean);
var
  AEinId:Real;
begin
  accept := True;
  if FEplantId = 0 then
    Exit;

  AEinId := SelectValueFmtAsFloat('select ein_id from eplant where id = %f', [FEplantId]);

  if AEinId <> TFDTable(DataSet).FieldByName('EIN_ID').asFloat then
    accept := False;
end;

end.
