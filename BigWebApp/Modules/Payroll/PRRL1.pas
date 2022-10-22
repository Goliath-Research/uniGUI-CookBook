unit PRRL1;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.Menus,
  Data.DB,
  vcl.wwdatsrc,
  IQMS.WebVcl.Hpick,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
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
  TFrmPrRl = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Recalculate1: TUniMenuItem;
    N1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrintSetUp1: TUniMenuItem;
    Help1: TUniMenuItem;
    Contents1: TUniMenuItem;
    About1: TUniMenuItem;
    PnlDtl: TUniPanel;
    Panel1: TUniPanel;
    SBSearchEmp: TUniSpeedButton;
    NavDtl: TUniDBNavigator;
    Panel2: TUniPanel;
    Splitter2: TUniSplitter;
    Splitter3: TUniSplitter;
    Panel4: TUniPanel;
    Label16: TUniLabel;
    Label17: TUniLabel;
    Label18: TUniLabel;
    label55: TUniLabel;
    Label20: TUniLabel;
    Label21: TUniLabel;
    Label22: TUniLabel;
    DBB: TUniDBEdit;
    DBC: TUniDBEdit;
    DBD: TUniDBEdit;
    DBE: TUniDBEdit;
    DBA: TUniDBEdit;
    DBF: TUniDBEdit;
    DBG: TUniDBEdit;
    Edit5: TUniEdit;
    Edit6: TUniEdit;
    Edit7: TUniEdit;
    Edit8: TUniEdit;
    Edit9: TUniEdit;
    Edit10: TUniEdit;
    Edit11: TUniEdit;
    Panel5: TUniPanel;
    Label23: TUniLabel;
    Label24: TUniLabel;
    Label25: TUniLabel;
    Label26: TUniLabel;
    Label27: TUniLabel;
    Label28: TUniLabel;
    Label29: TUniLabel;
    DBN: TUniDBEdit;
    DBO: TUniDBEdit;
    DBP: TUniDBEdit;
    DBQ: TUniDBEdit;
    DBM: TUniDBEdit;
    DBR: TUniDBEdit;
    DBS: TUniDBEdit;
    Edit12: TUniEdit;
    Edit13: TUniEdit;
    Edit14: TUniEdit;
    Edit15: TUniEdit;
    Edit16: TUniEdit;
    Edit17: TUniEdit;
    Edit18: TUniEdit;
    Panel6: TUniPanel;
    Splitter4: TUniSplitter;
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
    edEmplProv: TUniDBComboBox;
    DBEmplCode: TUniDBEdit;
    DBFirst: TUniDBEdit;
    DBMiddle: TUniDBEdit;
    DBLast: TUniDBEdit;
    DBAddr1: TUniDBEdit;
    DBAddr2: TUniDBEdit;
    DBCity: TUniDBEdit;
    DBPostalCode: TUniDBEdit;
    DBCountry: TUniDBEdit;
    DBProv: TUniDBComboBox;
    Panel7: TUniPanel;
    Panel8: TUniPanel;
    GridCodes: TIQUniGridControl;
    Splitter1: TUniSplitter;
    PnlHdr: TUniPanel;
    Panel3: TUniPanel;
    SBSearch: TUniSpeedButton;
    GridHdr: TIQUniGridControl;
    DBEditCode: TUniDBEdit;
    Label13: TUniLabel;
    Label14: TUniLabel;
    DBEditLastTransNumber: TUniDBEdit;
    Label15: TUniLabel;
    DBEditSequenceNo: TUniDBEdit;
    Edit1: TUniEdit;
    DBH: TUniDBEdit;
    Edit2: TUniEdit;
    DBI: TUniDBEdit;
    DBJ: TUniDBEdit;
    Edit3: TUniEdit;
    Edit4: TUniEdit;
    DBK: TUniDBEdit;
    DBL: TUniDBEdit;
    Edit19: TUniEdit;
    Label19: TUniLabel;
    Label30: TUniLabel;
    Label31: TUniLabel;
    Label32: TUniLabel;
    Label33: TUniLabel;
    Edit20: TUniEdit;
    DBT: TUniDBEdit;
    Edit21: TUniEdit;
    DBU: TUniDBEdit;
    DBV: TUniDBEdit;
    Edit22: TUniEdit;
    Edit23: TUniEdit;
    DBW: TUniDBEdit;
    DBCode: TUniDBEdit;
    Label34: TUniLabel;
    Label35: TUniLabel;
    Label36: TUniLabel;
    Label37: TUniLabel;
    Label38: TUniLabel;
    SrcHeader: TDataSource;
    tblHeader: TFDTable;
    tblHeaderDESCRIP: TStringField;
    tblHeaderPR_YEAR_STRING: TStringField;
    tblHeaderPR_ACCOUNT_NO: TStringField;
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
    tblHeaderEIN_ID: TBCDField;
    tblHeaderPR_YEAR: TDateTimeField;
    tblHeaderID: TBCDField;
    tblHeaderPRT4_HEADER_ID: TBCDField;
    tblHeaderTRANSMITTER_NO: TStringField;
    tblHeaderFILE_NO: TStringField;
    tblHeaderNEQ: TStringField;
    tblHeaderBEGIN_SEQUENCE_NO: TStringField;
    tblHeaderPACKAGE_TYPE_CODE: TStringField;
    SrcDtl: TDataSource;
    TblDtl: TFDTable;
    TblDtlID: TBCDField;
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
    TblDtlPRRL_HEADER_ID: TBCDField;
    TblDtlPRT4_DETAIL_ID: TBCDField;
    TblDtlSUBMISSION_CODE: TStringField;
    TblDtlSEQUENCE_NO: TStringField;
    TblDtlORG_RL_SLIP_NO: TStringField;
    TblDtlORG_RL_SLIP_ID: TBCDField;
    TblDtlEXEMPT_QPIP: TStringField;
    TblDtlTOTALPRO: TBCDField;
    TblDtlHEALTH_SERVICES: TBCDField;
    TblDtlREMOTE_AREA: TBCDField;
    TblDtlOTHER_BENEFITS: TBCDField;
    TblDtlCOMMISSIONS: TBCDField;
    TblDtlARINVOICE_COMM_ID: TBCDField;
    TblDtlOTHER_INCOME: TBCDField;
    TblDtlMULTI_EMPLOYER: TBCDField;
    TblDtlDEFERRED_WAGES: TBCDField;
    TblDtlINDIAN_RESERVE: TBCDField;
    TblDtlTIPS: TBCDField;
    TblDtlALLOCATED_TIPS: TBCDField;
    TblDtlPHASED_RETIRE: TBCDField;
    TblDtlMEALS_LODGING: TBCDField;
    TblDtlMOTOR_VEHICLE: TBCDField;
    TblDtlCODE_O: TStringField;
    TblDtlQPIP_WITHHELD: TBCDField;
    TblDtlQPIP_GROSSTOTAX: TBCDField;
    PKYearEin: TIQWebHPick;
    StringField1: TStringField;
    PKYearEinFED_TAX_ID: TStringField;
    PKYearEinEIN_ID: TBCDField;
    PKYear: TIQWebHPick;
    PKYearYEAR: TStringField;
    wwTblCodes: TFDTable;
    wwTblCodesCODE: TStringField;
    wwTblCodesAMOUNT: TBCDField;
    wwTblCodesID: TBCDField;
    SrcCodes: TDataSource;
    wwTblCodesPRRL_DETAIL_ID: TBCDField;
    PrinterSetupDialog1: TPrinterSetupDialog;
    IQAbout1: TIQWebAbout;
    IQRepDef1: TIQWebRepDef;
    PKRL: TIQWebHPick;
    PKRLID: TBCDField;
    PKRLYEAR: TStringField;
    PKRLDESCRIP: TStringField;
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
    PKT4: TIQWebHPick;
    PKT4ID: TBCDField;
    PKT4YEAR: TStringField;
    PKT4DESCRIP: TStringField;
    PKT4EIN_ID: TBCDField;
    PKT4PR_YEAR: TDateTimeField;
    PkEmpT4: TIQWebHPick;
    PkEmpT4ID: TBCDField;
    PkEmpT4SSNMBR: TStringField;
    PkEmpT4FIRST_NAME: TStringField;
    PkEmpT4MIDDLE_INIT: TStringField;
    PkEmpT4LAST_NAME: TStringField;
    PkEmpT4EMP_ADDR1: TStringField;
    PkEmpT4EMP_ADDR2: TStringField;
    PkEmpT4EMP_CITY: TStringField;
    PkEmpT4EMP_STATE: TStringField;
    PkEmpT4EMP_ZIP: TStringField;
    N2: TUniMenuItem;
    CreateOutputXMLFile1: TUniMenuItem;
    SaveDialog1: TSaveDialog;
    wwMemoDialog1: TwwMemoDialog;
    SR: TIQWebSecurityRegister;
    procedure Exit1Click(Sender: TObject);
    procedure tblHeaderAfterInsert(DataSet: TDataSet);
    procedure Print1Click(Sender: TObject);
    procedure PrintSetUp1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure PkEmpBeforeOpen(DataSet: TDataSet);
    procedure SBSearchClick(Sender: TObject);
    procedure SBSearchEmpClick(Sender: TObject);
    procedure Recalculate1Click(Sender: TObject);
    procedure wwTblCodesBeforeEdit(DataSet: TDataSet);
    procedure wwTblCodesBeforePost(DataSet: TDataSet);
    procedure TblDtlAfterInsert(DataSet: TDataSet);
    procedure PkEmpT4BeforeOpen(DataSet: TDataSet);
    procedure CreateOutputXMLFile1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoPRRL;


implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.Common.PanelMsg;
{$R *.dfm}

procedure DoPRRL;
var
  FrmPrRl: TFrmPrRl;
begin
  FrmPrRl := TFrmPrRl.Create(uniGUIApplication.uniApplication);
  FrmPrRl.Show;
end;

procedure TFrmPrRl.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [self, PnlDtl, GridHdr, GroupBox2, Panel4, GridCodes, Panel2]);
end;


procedure TFrmPrRl.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmPrRl.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrRl.tblHeaderAfterInsert(DataSet: TDataSet);
var
  APk:TIQWebHPick;
  AEinId:Real;
  APrT4HeadertId, APrRlHeaderId:Real;
  APrYear:TDateTime;
  AUseEin:String;
begin
  tblHeader.Cancel;
  if PKT4.Execute then
  begin
    APrT4HeadertId := PKT4.GetValue('ID');
    AEinId         := PKT4.GetValue('EIN_ID');
    APrYear        := PKT4.GetValue('PR_YEAR');
  end
  else
    Exit;

  APrRlHeaderId := GetNextID('prrl_header');

  ExecuteCommandFmt('begin pr_can_govt.InsertPrRL_Header(%f, %f); end;', [APrRlHeaderId, APrT4HeadertId]);


  AUseEin := SelectValueAsString('select NVL(separate_pr_ecompany, ''N'') from iqsys where rownum < 2');

  try
    ExecuteCommandFmt('begin pr_can_govt.InsertPRRL1Details(%f, %f, %f, To_Date(''%s'', ''MM/DD/RRRR''), ''%s''); end;',
    [APrT4HeadertId, APrRlHeaderId, AEinId, FormatDateTime('mm/dd/yyyy', APrYear), AUseEin]);
  finally;
    tblHeader.AfterInsert := tblHeaderAfterInsert;
  end;
  tblHeader.Refresh;
end;

procedure TFrmPrRl.wwTblCodesBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TFrmPrRl.wwTblCodesBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
  wwTblCodesPRRL_DETAIL_ID.asFloat := TblDtlID.asFloat;
end;

procedure TFrmPrRl.PkEmpBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'nId', tblHeader.FieldByName('ID').asFloat);
//  TFDQuery(DataSet).ParamByName('nId').Value := tblHeader.FieldByName('ID').asFloat;
end;

procedure TFrmPrRl.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmPrRl.PrintSetUp1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmPrRl.SBSearchClick(Sender: TObject);
begin
  if PKRl.Execute then
    tblHeader.Locate('ID', PKRl.GetValue('ID'), []);
end;

procedure TFrmPrRl.SBSearchEmpClick(Sender: TObject);
begin
  with PKEmp do
  if Execute then
    tblDtl.Locate('ID', GetValue('ID'), []);
end;

procedure TFrmPrRl.Recalculate1Click(Sender: TObject);
var
  APrT4DetailId:Real;
  APrT4HeadertId, APrRlHeaderId:Real;
  APrYear:TDateTime;
  AUseEin:String;
  AEinId:Real;
  AId:Real;
begin
  if TblDtlID.asFloat = 0 then exit;
  APrT4DetailId := TblDtlPRT4_DETAIL_ID.asFloat;
  if SelectValueFmtAsFloat('select id from PRT4_DETAIL where id = %f', [APrT4DetailId]) = 0 then
    raise exception.create('No corresponding record found in the PRT4_DETAIL table.');

  AEinId := SelectValueFmtAsFloat('select ein_id from prrl_header where id = %f', [tblHeaderID.asFloat]);
  APrYear := SelectValueFmtAsFloat('select pr_year from prrl_header where id = %f', [tblHeaderID.asFloat]);
  AUseEin := SelectValueAsString('select NVL(separate_pr_ecompany, ''N'') from iqsys where rownum < 2');

  AId := TblDtlID.asFloat;

  ExecuteCommandFmt('delete from PRRL_DETAIL where id = %f', [AId]);
  AId := GetNextID('prrl_detail');

  ExecuteCommandFmt('begin pr_can_govt.InsertPRRL1Detail(%f, %f, %f, To_Date(''%s'', ''MM/DD/RRRR''), ''%s'', %f); end;',
    [APrT4DetailId, tblHeaderID.asFloat, AEinId, FormatDateTime('mm/dd/yyyy', APrYear), AUseEin, AId]);

  TblDtl.Refresh;
  TblDtl.Locate('ID', AId, []);

end;

procedure TFrmPrRl.TblDtlAfterInsert(DataSet: TDataSet);
var
  APrT4DetailId ,AId:Real;
  APrYear:TDateTime;
  AUseEin:String;
  AEinId:Real;
begin
  tblDtl.Cancel;
  if PkEmpT4.Execute then
  begin
    APrT4DetailId := PkEmpT4.GetValue('ID');
  end
  else
    Abort;

  AEinId := SelectValueFmtAsFloat('select ein_id from prrl_header where id = %f', [tblHeaderID.asFloat]);
  APrYear := SelectValueFmtAsFloat('select pr_year from prrl_header where id = %f', [tblHeaderID.asFloat]);
  AUseEin := SelectValueAsString('select NVL(separate_pr_ecompany, ''N'') from iqsys where rownum < 2');
  AId := GetNextID('prrl_detail');
  try
    ExecuteCommandFmt('begin pr_can_govt.InsertPRRL1Detail(%f, %f, %f, To_Date(''%s'', ''MM/DD/RRRR''), ''%s'', %f); end;',
      [APrT4DetailId, tblHeaderID.asFloat, AEinId, FormatDateTime('mm/dd/yyyy', APrYear), AUseEin, AId]);
  finally;
    tblDtl.AfterInsert := tblDtlAfterInsert;
  end;
  TblDtl.Refresh;
  TblDtl.Locate('ID', AId, []);

end;

procedure TFrmPrRl.PkEmpT4BeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'nId', tblHeaderPRT4_HEADER_ID.asFloat);
//  TFDQuery(DataSet).ParamByName('nId').Value := tblHeaderPRT4_HEADER_ID.asFloat;
end;

procedure TFrmPrRl.CreateOutputXMLFile1Click(Sender: TObject);
var
  AStr:String;
begin
  if SaveDialog1.Execute then
  begin
    ExecuteCommandFmt('begin payroll_rl1xml.CreateXMLFile(''%s'', %f); end;', [SaveDialog1.FileName, tblHeaderID.asFloat]);
    AStr := SelectValueAsString('select payroll_rl1xml.Get_xml_clob from dual');
    wwMemoDialog1.Lines.Clear;
    wwMemoDialog1.Lines.Add(AStr);
    wwMemoDialog1.Lines.SaveToFile(SaveDialog1.FileName);
    IqInformation(Format('File %s Created', [SaveDialog1.FileName]));



  end;
//  CreateRL1XML(tblHeaderID.asFloat); {PrRL1XML.pas}
end;



end.
