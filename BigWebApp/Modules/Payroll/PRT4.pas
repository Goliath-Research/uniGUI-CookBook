unit PRT4;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.Buttons,
  Data.DB,
  IQMS.WebVcl.About,
  IQMS.WebVcl.RepDef,
  Vcl.Wwdatsrc,
  Mask,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, vcl.wwdbgrid, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmT4 = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Recalculate1: TUniMenuItem;
    RecalculateYear1: TUniMenuItem;
    N1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrintSetUp1: TUniMenuItem;
    Help1: TUniMenuItem;
    Contents1: TUniMenuItem;
    About1: TUniMenuItem;
    PnlDtl: TUniPanel;
    Splitter1: TUniSplitter;
    PnlHdr: TUniPanel;
    Panel3: TUniPanel;
    SBSearch: TUniSpeedButton;
    Panel1: TUniPanel;
    SBSearchEmp: TUniSpeedButton;
    NavDtl: TUniDBNavigator;
    SrcHeader: TDataSource;
    tblHeader: TFDTable;
    tblHeaderID: TBCDField;
    tblHeaderPR_YEAR: TDateTimeField;
    tblHeaderDESCRIP: TStringField;
    tblHeaderPR_YEAR_STRING: TStringField;
    tblHeaderPR_ACCOUNT_NO: TStringField;
    tblHeaderEIN_ID: TBCDField;
    tblHeaderNAME: TStringField;
    tblHeaderPHONE: TStringField;
    tblHeaderPHONE_EXT: TStringField;
    tblHeaderAREA_CODE: TStringField;
    tblHeaderPOSTAL_CODE: TStringField;
    tblHeaderPROVINCE_CODE: TStringField;
    tblHeaderCOUNTRY: TStringField;
    tblHeaderADDR1: TStringField;
    tblHeaderADDR2: TStringField;
    tblHeaderCITY: TStringField;
    tblHeaderCONTACT_NAME: TStringField;
    tblHeaderREPORT_TYPE: TStringField;
    tblHeaderACCESS_CODE: TStringField;
    IQAbout1: TIQWebAbout;
    PrinterSetupDialog1: TPrinterSetupDialog;
    IQRepDef1: TIQWebRepDef;
    GridHdr: TIQUniGridControl;
    Panel2: TUniPanel;
    Splitter2: TUniSplitter;
    Panel4: TUniPanel;
    Splitter3: TUniSplitter;
    Panel5: TUniPanel;
    SrcDtl: TDataSource;
    TblDtl: TFDTable;
    TblDtlID: TBCDField;
    TblDtlPRT4_HEADER_ID: TBCDField;
    TblDtlPR_EMP_ID: TBCDField;
    TblDtlSSNMBR: TStringField;
    TblDtlFIRST_NAME: TStringField;
    TblDtlMIDDLE_NAME: TStringField;
    TblDtlLAST_NAME: TStringField;
    TblDtlADDR1: TStringField;
    TblDtlADDR2: TStringField;
    TblDtlCITY: TStringField;
    TblDtlPROV: TStringField;
    TblDtlPOSTAL_CODE: TStringField;
    TblDtlPROV_CODE: TStringField;
    TblDtlEXEMPT_CPP_QPP: TStringField;
    TblDtlEXEMPT_EI: TStringField;
    TblDtlEXEMPT_PPIP: TStringField;
    TblDtlEMPL_CODE: TStringField;
    TblDtlGROSS_PAY: TBCDField;
    TblDtlTOTALFED: TBCDField;
    TblDtlCPP_WITHHELD: TBCDField;
    TblDtlQPP_WITHHELD: TBCDField;
    TblDtlEI_WITHHELD: TBCDField;
    TblDtlEI_GROSSTOTAX: TBCDField;
    TblDtlRPP_WITHHELD: TBCDField;
    TblDtlCPP_QPP_EARNINGS: TBCDField;
    TblDtlUNION_DUES: TBCDField;
    TblDtlCHARITABLE: TBCDField;
    TblDtlRPP_DPSP_NO: TStringField;
    TblDtlPENSION_ADJ: TBCDField;
    TblDtlPPIP_WITHHELD: TBCDField;
    TblDtlPPIP_GROSSTOTAX: TBCDField;
    TblDtlCOUNTRY: TStringField;
    GroupBox3: TUniGroupBox;
    DBExemptCppQpp: TUniDBCheckBox;
    DBExemptEI: TUniDBCheckBox;
    DBExemptPPIP: TUniDBCheckBox;
    Edit4: TUniEdit;
    Label13: TUniLabel;
    Label14: TUniLabel;
    Label15: TUniLabel;
    DBCPPCont: TUniDBEdit;
    DBQPPCont: TUniDBEdit;
    DBEI: TUniDBEdit;
    DBRPP: TUniDBEdit;
    DBIncome: TUniDBEdit;
    DBPensionAdj: TUniDBEdit;
    DBPPIPPrem: TUniDBEdit;
    Label16: TUniLabel;
    Label17: TUniLabel;
    Edit5: TUniEdit;
    Label18: TUniLabel;
    Label19: TUniLabel;
    Label20: TUniLabel;
    Label21: TUniLabel;
    Label22: TUniLabel;
    Edit6: TUniEdit;
    Edit7: TUniEdit;
    Edit8: TUniEdit;
    Edit9: TUniEdit;
    Edit10: TUniEdit;
    Edit11: TUniEdit;
    DBEIEarn: TUniDBEdit;
    DBCPPQPPEarn: TUniDBEdit;
    DBUnion: TUniDBEdit;
    DBCharity: TUniDBEdit;
    DBTax: TUniDBEdit;
    DBRPPDPSPNO: TUniDBEdit;
    DBPPIPEARN: TUniDBEdit;
    Label23: TUniLabel;
    Label24: TUniLabel;
    Edit12: TUniEdit;
    Label25: TUniLabel;
    Label26: TUniLabel;
    Label27: TUniLabel;
    Label28: TUniLabel;
    Label29: TUniLabel;
    Edit13: TUniEdit;
    Edit14: TUniEdit;
    Edit15: TUniEdit;
    Edit16: TUniEdit;
    Edit17: TUniEdit;
    Edit18: TUniEdit;
    Panel6: TUniPanel;
    GroupBox2: TUniGroupBox;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    Label8: TUniLabel;
    Label9: TUniLabel;
    Label10: TUniLabel;
    Label11: TUniLabel;
    Label12: TUniLabel;
    DBSIN: TUniDBEdit;
    Edit1: TUniEdit;
    edEmplProv: TUniDBComboBox;
    Edit2: TUniEdit;
    DBEmplCode: TUniDBEdit;
    Edit3: TUniEdit;
    DBFirst: TUniDBEdit;
    DBMiddle: TUniDBEdit;
    DBLast: TUniDBEdit;
    DBAddr1: TUniDBEdit;
    DBAddr2: TUniDBEdit;
    DBCity: TUniDBEdit;
    DBPostalCode: TUniDBEdit;
    DBCountry: TUniDBEdit;
    DBProv: TUniDBComboBox;
    SrcCodes: TDataSource;
    wwTblCodes: TFDTable;
    wwTblCodesID: TBCDField;
    wwTblCodesPRT4_DETAIL_ID: TBCDField;
    wwTblCodesCODE: TStringField;
    wwTblCodesAMOUNT: TBCDField;
    PKYear: TIQWebHPick;
    PKYearYEAR: TStringField;
    PKYearEin: TIQWebHPick;
    StringField1: TStringField;
    PKYearEinFED_TAX_ID: TStringField;
    PKYearEinEIN_ID: TBCDField;
    Splitter4: TUniSplitter;
    Panel7: TUniPanel;
    Panel8: TUniPanel;
    GridCodes: TIQUniGridControl;
    SR: TIQWebSecurityRegister;
    PKT4: TIQWebHPick;
    PKT4ID: TBCDField;
    PKT4YEAR: TStringField;
    PKT4DESCRIP: TStringField;
    PkEmp: TIQWebHPick;
    PkEmpID: TBCDField;
    PkEmpSSNMBR: TStringField;
    PkEmpFIRST_NAME: TStringField;
    PkEmpMIDDLE_INIT: TStringField;
    PkEmpLAST_NAME: TStringField;
    PkEmpEMP_ADDR1: TStringField;
    PkEmpEMP_ADDR2: TStringField;
    PkEmpEMP_CITY: TStringField;
    PkEmpEMP_STATE: TStringField;
    PkEmpEMP_ZIP: TStringField;
    tblHeaderPROPRIETOR_1: TStringField;
    tblHeaderPROPRIETOR_2: TStringField;
    wwDBComboBox1: TUniDBComboBox;
    SBXML: TUniSpeedButton;
    SaveDialog1: TSaveDialog;
    wwMemoDialog1: TwwMemoDialog;
    tblHeaderTRANMITTER: TStringField;
    tblHeaderEMAIL: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrintSetUp1Click(Sender: TObject);
    procedure tblHeaderBeforePost(DataSet: TDataSet);
    procedure TblDtlBeforePost(DataSet: TDataSet);
    procedure TblDtlBeforeEdit(DataSet: TDataSet);
    procedure wwTblCodesBeforePost(DataSet: TDataSet);
    procedure wwTblCodesBeforeEdit(DataSet: TDataSet);
    procedure tblHeaderAfterInsert(DataSet: TDataSet);
    procedure Recalculate1Click(Sender: TObject);
    procedure RecalculateYear1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure SBSearchClick(Sender: TObject);
    procedure SBSearchEmpClick(Sender: TObject);
    procedure PkEmpBeforeOpen(DataSet: TDataSet);
    procedure SBXMLClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FUseEid     :Boolean;
    procedure RepopulateTables;
    procedure CMDialogKey(Var Msg: TWMKey); message CM_DIALOGKEY;
    procedure InsertDetailRecords;
  public
    { Public declarations }
  end;

procedure DoPRT4;


implementation
uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.Common.PanelMsg,
  MainModule;
{$R *.dfm}

procedure DoPRT4;
var
  FrmT4: TFrmT4;
begin
  FrmT4 := TFrmT4.Create(uniGUIApplication.uniApplication);
  FrmT4.Show;
end;

procedure TFrmT4.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [self, PnlDtl, GridHdr, GroupBox2, Panel4, GridCodes, Panel2]);
end;

procedure TFrmT4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, PnlDtl, GridHdr, GroupBox2, Panel4, GridCodes, Panel2]);
end;

procedure TFrmT4.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmT4.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmT4.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmT4.PrintSetUp1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmT4.tblHeaderBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TFrmT4.TblDtlBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
  TblDtlPRT4_HEADER_ID.asFloat := tblHeaderID.asFloat;
end;

procedure TFrmT4.TblDtlBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TFrmT4.wwTblCodesBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
  wwTblCodesPRT4_DETAIL_ID.asFloat := TblDtlID.asFloat;
end;

procedure TFrmT4.wwTblCodesBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TFrmT4.tblHeaderAfterInsert(DataSet: TDataSet);
var
  APk:TIQWebHPick;
  AEinId:Real;
begin
  tblHeader.Cancel;
  if SelectValueAsString('select NVL(separate_pr_ecompany, ''N'') from iqsys where rownum < 2') = 'Y' then
    APk := PKYearEin
  else
    APk := PKYear;

  FUseEid := (APk = PkYearEin);

  if APk.Execute then
  try
    tblHeader.AfterInsert := nil;
    tblHeader.Insert;
    tblHeader.FieldByName('PR_YEAR').asDateTime      := APk.GetValue('THIS_YEAR');
    tblHeader.FieldByName('PR_YEAR_STRING').asString := APk.GetValue('YEAR');
    if APk = PkYearEin then
    begin
      AEinId := APk.GetValue('EIN_ID');
      tblHeader.FieldByName('EIN_ID').asFloat := AEinId;
      tblHeaderPR_ACCOUNT_NO.asString := APk.GetValue('FED_TAX_ID');
      tblHeaderNAME.AsString  := SelectValueFmtAsString('select company from ein where id = %f',        [AEinId]);
      tblHeaderADDR1.AsString  := SelectValueFmtAsString('select addr1 from ein where id = %f',         [AEinId]);
      tblHeaderADDR2.AsString  := SelectValueFmtAsString('select addr2 from ein where id = %f',         [AEinId]);
      tblHeaderCITY.AsString  := SelectValueFmtAsString('select city from ein where id = %f',           [AEinId]);
      tblHeaderPROVINCE_CODE.AsString  := SelectValueFmtAsString('select state from ein where id = %f', [AEinId]);
      tblHeaderPOSTAL_CODE.AsString  := SelectValueFmtAsString('select zip from ein where id = %f',     [AEinId]);

    end;
    with TFDQuery.Create(self) do
    try
      Connection := UniMainModule.FDConnection1;
      Sql.Add('select company, phone, email from iqsys where rownum < 2');
      Open;
      if not (APk = PkYearEin) then
        tblHeaderNAME.AsString  := FieldByName('company').asString;
      tblHeaderPHONE.asString := FieldByName('phone').asString;
    finally
      Free;
    end;
    tblHeader.Post;
    RepopulateTables;
    InsertDetailRecords;
  finally;
    tblHeader.AfterInsert := tblHeaderAfterInsert;
  end;

end;

procedure TFrmT4.RepopulateTables;
var
  HMsg:TPanelMesg;
  AView:String;
begin
  try
    HMsg:= hPleaseWait( 'Truncating tables...' );

    if FUseEid and  (tblHeaderEIN_ID.asFloat <> 0) then
      AView := IqFormat(' for v in (select * from v_emp_hist_check where ein_id = %f) ', [tblHeaderEIN_ID.asFloat])
    else
      AView := ' for v in (select * from v_emp_hist_check) ';



    ExecuteCommand('truncate table C_EMP_HIST_CHECK');
    ExecuteCommand('truncate table C_EMP_DISTINCT_EMP_YEAR');
    ExecuteCommand('truncate table C_PR_CHECK_DEDUCTIONS');

    HMsg.Mesg:= 'Populating C_EMP_HIST_CHECK';

    ExecuteCommand('begin                                                ' +
           AView +
           ' loop                                                ' +
           '   insert into C_EMP_HIST_CHECK (ID             ,    ' +
           '                                 PR_EMP_ID      ,    ' +
           '                                 CHECK_DATE     ,    ' +
           '                                 CHECK_STATUS   ,    ' +
           '                                 THIS_YEAR      ,    ' +
           '                                 PR_EMP_ID_YEAR ,    ' +
           '                                 THIS_MONTH     ,    ' +
           '                                 QUARTER)            ' +
           '                         values (V.ID           ,    ' +
           '                                 V.PR_EMP_ID      ,  ' +
           '                                 V.CHECK_DATE     ,  ' +
           '                                 V.CHECK_STATUS   ,  ' +
           '                                 V.THIS_YEAR      ,  ' +
           '                                 V.PR_EMP_ID_YEAR ,  ' +
           '                                 V.THIS_MONTH     ,  ' +
           '                                 V.QUARTER);         ' +
           '   commit;                                           ' +
           ' end loop;                                           ' +
           'end;                                                 ');


    if FUseEid and  (tblHeaderEIN_ID.asFloat <> 0) then
      AView := IqFormat(' for v in (select * from V_EMP_DISTINCT_EMP_YEAR where ein_id = %f) ', [tblHeaderEIN_ID.asFloat])
    else
      AView := ' for v in (select * from V_EMP_DISTINCT_EMP_YEAR) ';




    HMsg.Mesg:= 'Populating C_EMP_DISTINCT_EMP_YEAR';

    ExecuteCommand('begin                                                                        ' +
           AView +
           ' loop                                                                        ' +
           '   insert into C_EMP_DISTINCT_EMP_YEAR (ID             ,                     ' +
           '                                        THIS_YEAR      ,                     ' +
           '                                        PR_EMP_ID_YEAR ,                     ' +
           '                                        PR_EMP_ID)                           ' +
           '                                values (s_C_EMP_DISTINCT_EMP_YEAR.nextval,   ' +
           '                                        V.THIS_YEAR      ,                   ' +
           '                                        V.PR_EMP_ID_YEAR ,                   ' +
           '                                        V.PR_EMP_ID);                        ' +
           '   commit;                                                                   ' +
           'end loop;                                                                    ' +
           'end;                                                                         ');


    HMsg.Mesg:= 'Populating C_PR_CHECK_DEDUCTIONS';


    if FUseEid and  (tblHeaderEIN_ID.asFloat <> 0) then
      AView := IqFormat(' for v in (select sum(NVL(a.amount, 0)) + sum(NVL(a.BACK_DED_AMOUNT, 0)) as totaldeductions, ' +
               '                  a.pr_check_hist_id,                                                  ' +
               '                  RTrim(a.t4_code) as t4_code                                          ' +
               '             from PR_CHECK_DEDUCTIONS a, pr_check_hist b                               ' +
               '            where a.pr_check_hist_id = b.id                                            ' +
               '              and b.ein_id = %f                                                        ' +
               '         group by a.pr_check_hist_id, RTrim(a.t4_code)) ', [tblHeaderEIN_ID.asFloat])
    else
      AView := ' for v in (select sum(NVL(amount, 0)) + sum(NVL(BACK_DED_AMOUNT, 0)) as totaldeductions, ' +
               '                  pr_check_hist_id,                                                  ' +
               '                  RTrim(t4_code) as t4_code                                          ' +
               '             from PR_CHECK_DEDUCTIONS                                                ' +
               '         group by pr_check_hist_id, RTrim(t4_code))                                         ';



    ExecuteCommand('begin                                                                                ' +
            AView +
           ' loop                                                                                ' +
           '   insert into C_PR_CHECK_DEDUCTIONS (ID              ,                              ' +
           '                                      PR_CHECK_HIST_ID,                              ' +
           '                                      T4_CODE         ,                              ' +
           '                                      TOTALDEDUCTIONS)                               ' +
           '                              values (s_C_PR_CHECK_DEDUCTIONS.nextval,               ' +
           '                                      V.PR_CHECK_HIST_ID,                            ' +
           '                                      V.T4_CODE         ,                            ' +
           '                                      V.TOTALDEDUCTIONS);                            ' +
           '   commit;                                                                           ' +
           ' end loop;                                                                           ' +
           ' end;                                                                                ');




  finally
    HMsg.Free;
  end;
end;

procedure TFrmT4.InsertDetailRecords;
var
  HMsg:TPanelMesg;
  AUseEin:String;
begin
  try
    HMsg:= hPleaseWait( 'Processing Details...' );
    if FUseEid and  (tblHeaderEIN_ID.asFloat <> 0) then
      AUseEin := 'Y'
    else
      AUseEin := 'N';

    ExecuteCommandFmt('begin PR_CAN_GOVT.InsertDetails(%f, %f, To_Date(''%s'', ''MM/DD/RRRR''), ''%s''); end;',
              [tblHeaderID.asFloat,
               tblHeaderEIN_ID.asFloat,
               FormatDateTime('mm/dd/yyyy', tblHeaderPR_YEAR.asDateTime),
               AUseEin]);

    TblDtl.Close;
    TblDtl.Open;
  finally
    HMsg.Free;
  end;
end;

procedure TFrmT4.CMDialogKey(Var Msg: TWMKey);
begin
  if (ActiveControl = DBCountry) and (Msg.Charcode = VK_TAB ) then
  begin
    DBExemptCppQpp.SetFocus;
    Msg.Charcode:= 0;  // eat the tab key!
    EXIT;
  end
  else
  if (ActiveControl = DBPPIPEARN) and (Msg.Charcode = VK_TAB ) then
  begin
    GridCodes.SetFocus;
    Msg.Charcode:= 0;  // eat the tab key!
    EXIT;
  end;
  inherited;
end;



procedure TFrmT4.Recalculate1Click(Sender: TObject);
var
  nEmpId, nId, PrTaxId:Real;
  AQry:TFDQuery;
begin
  with TblDtl do
  begin
    if eof and bof then Exit;
    if not IqConfirmYN('Do you wish to recalculate employee? (Current record will be deleted)') then Exit;
    nEmpId  := FieldByName('PR_EMP_ID').asFloat;
    Delete;
    ExecuteCommandFmt('begin PR_CAN_GOVT.InsertEmployee(%f, %f, To_Date(''%s'', ''MM/DD/RRRR'')); end;',
              [tblHeaderID.asFloat,
               nEmpId,
               FormatDateTime('mm/dd/yyyy', tblHeaderPR_YEAR.asDateTime)]);
    Refresh;
    if not Locate('PR_EMP_ID', nEmpId, [])
      then Exit;
  end;
end;

procedure TFrmT4.RecalculateYear1Click(Sender: TObject);
begin
  if tblHeader.eof and tblHeader.bof then Exit;
  if not IqConfirmYN('Do you wish to recalculate the whole year? (Current records will be deleted)') then Exit;
  ExecuteCommandFmt('delete from prt4_detail where prt4_header_id = %f', [tblHeader.FieldByName('ID').asFloat]);
  InsertDetailRecords;
end;

procedure TFrmT4.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmPAYROLL{CHM}, iqhtmPAYROLL_TX{HTM} )  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmT4.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 14448 );

end;

procedure TFrmT4.SBSearchClick(Sender: TObject);
begin
  if PKT4.Execute then
    tblHeader.Locate('ID', PKT4.GetValue('ID'), []);
end;

procedure TFrmT4.SBSearchEmpClick(Sender: TObject);
begin
  with PKEmp do
  if Execute then
    tblDtl.Locate('ID', GetValue('ID'), []);
end;

procedure TFrmT4.SBXMLClick(Sender: TObject);
var
  AQry:TFDQuery;
begin
  SaveDialog1.FileName := Format('T4_Year_%s.xml', [tblHeaderPR_YEAR_STRING.asString]);
  if SaveDialog1.Execute then
  begin
    ExecuteCommandFmt('begin pr_can_govt.create_xml(%f); end;', [tblHeaderID.asFloat]);
    AQry := TFDQuery.Create(nil);
    try
      AQry.Connection := UniMainModule.FDConnection1;
      AQry.Sql.Add(IqFormat('select xml_output from prt4_header where id = %f', [tblHeaderID.asFloat]));
      AQry.Open;
      if not (AQry.eof and AQry.bof) then
      begin
        wwMemoDialog1.Lines.Clear;
        wwMemoDialog1.Lines.Add(AQry.FieldByName('XML_OUTPUT').asString);
        wwMemoDialog1.Lines.SaveToFile(SaveDialog1.FileName);
      end;
    finally
      AQry.Free;
    end;
    IQInformation(Format('%s file created', [SaveDialog1.FileName]));
  end;

end;

procedure TFrmT4.PkEmpBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'nId', tblHeader.FieldByName('ID').asFloat);
//  TFDQuery(DataSet).ParamByName('nId').Value := tblHeader.FieldByName('ID').asFloat;
end;

end.
