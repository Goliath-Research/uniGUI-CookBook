unit PrW2;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Mask,
  Vcl.DBGrids,
  Vcl.Menus,
  IQMS.WebVcl.RepDef,
  Vcl.Buttons,
  IQMS.WebVcl.About,
  Data.DB,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.Time,
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
  IQMS.Common.StringUtils,
  Vcl.Controls,
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
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniMemo,
  uniDBMemo,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel, IQMS.WebVcl.Strings, uniMainMenu;

type
  TFrmW2 = class(TUniForm)
    Panel1: TUniPanel;
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    Bevel3: TUniPanel;
    Bevel4: TUniPanel;
    Bevel5: TUniPanel;
    Bevel6: TUniPanel;
    Bevel7: TUniPanel;
    Bevel8: TUniPanel;
    Bevel9: TUniPanel;
    Bevel10: TUniPanel;
    Bevel11: TUniPanel;
    Bevel12: TUniPanel;
    Bevel13: TUniPanel;
    Bevel14: TUniPanel;
    Bevel16: TUniPanel;
    Bevel18: TUniPanel;
    Bevel20: TUniPanel;
    Bevel22: TUniPanel;
    Bevel24: TUniPanel;
    Bevel26: TUniPanel;
    Label1: TUniLabel;
    edControlnumber: TUniDBEdit;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    editVoid: TUniDBCheckBox;
    Label8: TUniLabel;
    Bevel30: TUniPanel;
    Bevel31: TUniPanel;
    Bevel32: TUniPanel;
    Bevel33: TUniPanel;
    Bevel34: TUniPanel;
    Label9: TUniLabel;
    Label10: TUniLabel;
    Label11: TUniLabel;
    Label12: TUniLabel;
    Label13: TUniLabel;
    Label14: TUniLabel;
    Label15: TUniLabel;
    Label16: TUniLabel;
    Label17: TUniLabel;
    Label18: TUniLabel;
    Bevel36: TUniPanel;
    Label20: TUniLabel;
    Label21: TUniLabel;
    ed15a: TUniDBCheckBox;
    ed15c: TUniDBCheckBox;
    ed15d: TUniDBCheckBox;
    Label23: TUniLabel;
    Label24: TUniLabel;
    Label25: TUniLabel;
    Label26: TUniLabel;
    Label27: TUniLabel;
    edEIN: TUniDBEdit;
    editAddr1: TUniDBEdit;
    editAddr2: TUniDBEdit;
    editCity: TUniDBEdit;
    editState: TUniDBEdit;
    editZip: TUniDBEdit;
    editFName: TUniDBEdit;
    editMName: TUniDBEdit;
    editLName: TUniDBEdit;
    Bevel28: TUniPanel;
    Label28: TUniLabel;
    edEmpAddr1: TUniDBEdit;
    edEmpAddr2: TUniDBEdit;
    edEmpCity: TUniDBEdit;
    edEmpState: TUniDBEdit;
    edEmpZip: TUniDBEdit;
    edEmpName: TUniDBEdit;
    editSSN: TUniDBEdit;
    ed1: TUniDBEdit;
    ed2: TUniDBEdit;
    ed3: TUniDBEdit;
    ed4: TUniDBEdit;
    ed5: TUniDBEdit;
    ed6: TUniDBEdit;
    ed7: TUniDBEdit;
    ed8: TUniDBEdit;
    ed9: TUniDBEdit;
    ed10: TUniDBEdit;
    ed11: TUniDBEdit;
    ed16state: TUniDBEdit;
    ed17: TUniDBEdit;
    ed18: TUniDBEdit;
    ed19: TUniDBEdit;
    ed20: TUniDBEdit;
    ed21: TUniDBEdit;
    ed14: TUniDBMemo;
    grid13: TUniDBGrid;
    ed16id: TUniDBEdit;
    NavDetail: TUniDBNavigator;
    Splitter1: TUniSplitter;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    gridHeader: TUniDBGrid;
    DBNavigator1: TUniDBNavigator;
    SBSearch: TUniSpeedButton;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrintSetUp1: TUniMenuItem;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    tblHeader: TFDTable;
    SrcHeader: TDataSource;
    tblHeaderID: TBCDField;
    tblHeaderPRW2_YEAR: TDateTimeField;
    tblHeaderDESCRIP: TStringField;
    tblHeaderPRW2_YEAR_STRING: TStringField;
    SrcDetail: TDataSource;
    tblDetail: TFDTable;
    SrcBox13: TDataSource;
    tblBox13: TFDTable;
    PKYear: TIQWebHPick;
    PKW2: TIQWebHPick;
    PKW2ID: TBCDField;
    PKW2YEAR: TStringField;
    PKW2DESCRIP: TStringField;
    N1: TUniMenuItem;
    Recalculate1: TUniMenuItem;
    sbSearchEmp: TUniSpeedButton;
    PkEmp: TIQWebHPick;
    QryInsertDetails: TFDQuery;
    tblDetailID: TBCDField;
    tblDetailPRW2_HEADER_ID: TBCDField;
    tblDetailPR_EMP_ID: TBCDField;
    tblDetailCONTROL_NO: TStringField;
    tblDetailVOID: TStringField;
    tblDetailEMPLOYERS_NAME: TStringField;
    tblDetailEMPLOYERS_ADDR1: TStringField;
    tblDetailEMPLOYERS_ADDR2: TStringField;
    tblDetailEMPLOYERS_CITY: TStringField;
    tblDetailEMPLOYERS_STATE: TStringField;
    tblDetailEMPLOYERS_ZIP: TStringField;
    tblDetailSSNMBR: TStringField;
    tblDetailFIRST_NAME: TStringField;
    tblDetailMIDDLE_INIT: TStringField;
    tblDetailLAST_NAME: TStringField;
    tblDetailEMP_ADDR1: TStringField;
    tblDetailEMP_ADDR2: TStringField;
    tblDetailEMP_CITY: TStringField;
    tblDetailEMP_STATE: TStringField;
    tblDetailEMP_ZIP: TStringField;
    tblDetailBOX1: TBCDField;
    tblDetailBOX2: TBCDField;
    tblDetailBOX3: TBCDField;
    tblDetailBOX4: TBCDField;
    tblDetailBOX5: TBCDField;
    tblDetailBOX6: TBCDField;
    tblDetailBOX7: TBCDField;
    tblDetailBOX8: TBCDField;
    tblDetailBOX9: TBCDField;
    tblDetailBOX10: TBCDField;
    tblDetailBOX11: TBCDField;
    tblDetailBOX12: TBCDField;
    tblDetailBOX14: TStringField;
    tblDetailBOX15A: TStringField;
    tblDetailBOX15B: TStringField;
    tblDetailBOX15C: TStringField;
    tblDetailBOX15D: TStringField;
    tblDetailBOX15E: TStringField;
    tblDetailBOX16_STATE: TStringField;
    tblDetailBOX17: TBCDField;
    tblDetailBOX18: TBCDField;
    tblDetailBOX19: TStringField;
    tblDetailBOX20: TBCDField;
    tblDetailBOX21: TBCDField;
    tblBox13ID: TBCDField;
    tblBox13PRW2_DETAIL_ID: TBCDField;
    tblBox13BOX13_N: TBCDField;
    PKYearYEAR: TStringField;
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
    RecalculateYear1: TUniMenuItem;
    QryInsertDetailsEmp: TFDQuery;
    N2: TUniMenuItem;
    CreateW2reportfile1: TUniMenuItem;
    SaveDialog1: TSaveDialog;
    Contents1: TUniMenuItem;
    Debug1: TUniMenuItem;
    Show1: TUniMenuItem;
    Clear1: TUniMenuItem;
    IQTiming1: TIQWebTiming;
    tblDetailEIN: TStringField;
    tblDetailBOX16_ID: TStringField;
    PKYearEin: TIQWebHPick;
    StringField1: TStringField;
    PKYearEinFED_TAX_ID: TStringField;
    PKYearEinEIN_ID: TBCDField;
    tblHeaderEIN_ID: TBCDField;
    QryInsertDetailsEin: TFDQuery;
    QryEin: TFDQuery;
    tblHeaderEin: TStringField;
    tblHeaderFedTaxId: TStringField;
    Bevel15: TUniPanel;
    Label19: TUniLabel;
    tblHeaderPIN: TStringField;
    tblHeaderNAME: TStringField;
    tblHeaderPHONE: TStringField;
    tblHeaderPHONE_EXT: TStringField;
    tblHeaderEMAIL: TStringField;
    tblHeaderNOTIFICATION: TStringField;
    tblHeaderINCL_STATE_RS: TStringField;
    tblHeaderTLCN: TStringField;
    tblDetailPR_TAX_ID: TBCDField;
    tblBox13BOX13_C: TStringField;
    W2reportfile1: TUniMenuItem;
    CustomSqlScript1: TUniMenuItem;
    ClearCustomSqlScript1: TUniMenuItem;
    OpenDialogScript: TOpenDialog;
    tblDetailSUFFIX: TStringField;
    DBSuffix: TUniDBEdit;
    PkRSState: TIQWebHPick;
    PkRSStateSTATE: TStringField;
    N3: TUniMenuItem;
    QuickAddEditBenefit1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrintSetUp1Click(Sender: TObject);
    procedure tblHeaderAfterInsert(DataSet: TDataSet);
    procedure SBSearchClick(Sender: TObject);
    procedure tblDetailBeforePost(DataSet: TDataSet);
    procedure tblHeaderBeforePost(DataSet: TDataSet);
    procedure tblDetailBeforeEdit(DataSet: TDataSet);
    procedure PkEmpBeforeOpen(DataSet: TDataSet);
    procedure sbSearchEmpClick(Sender: TObject);
    procedure grid13Enter(Sender: TObject);
    procedure RecalculateYear1Click(Sender: TObject);
    procedure Recalculate1Click(Sender: TObject);
    { TODO -oathite -cWebConvert : beforeaction event action is not available
    procedure NavDetailBeforeAction(Sender: TObject; Button: TNavigateBtn); }
    procedure CreateW2reportfile1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure Show1Click(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure tblHeaderCalcFields(DataSet: TDataSet);
    procedure CustomSqlScript1Click(Sender: TObject);
    procedure ClearCustomSqlScript1Click(Sender: TObject);
    procedure PkRSStateBeforeOpen(DataSet: TDataSet);
    procedure QuickAddEditBenefit1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FW2File:String;
    FTextFile:TextFile;
    FEmpCity, FEmpState, FEmpZip1, FEmpZip2:String;
    FEmployeeCity, FEmployeeState, FEmployeeZip1, FEmployeeZip2, FSSN:String;
    FStatutoryEmployee:String;
    FA_GROSS    :Real;
    FA_SSwages  :Real;
    FA_FEDwh    :Real;
    FA_SStax    :Real;
    FA_MCwages  :Real;
    FA_MCtax    :Real;
    FA_CodeC    :Real;
    FA_deferred :Real;
    FA_Box12    :Real;
    FA_depcare  :Real;
    FA_nonqual  :Real;
    FA_eic      :Real;
    FA_Box13_D  :Real;
    FA_Box13_E  :Real;
    FA_Box13_F  :Real;
    FA_Box13_G  :Real;
    FA_Box13_H  :Real;
    FA_Box13_C  :Real;
    FA_Box13_V  :Real;
    FA_Box13_W  :Real;
    FA_Box13_A  :Real;
    FA_Box13_R  :Real;
    FA_Box13_S  :Real;
    FA_Box13_T  :Real;
    FA_Box13_M  :Real;
    FA_Box13_N  :Real;
    FA_Box13_Q  :Real;
    FA_Box13_Y  :Real;
    FA_Box13_Z  :Real;
    FA_Box13_CC :Real;
    FA_Box13_AA :Real;
    FA_Box13_BB :Real;

    FS_GROSS    :Real;
    FS_SSwages  :Real;
    FS_FEDwh    :Real;
    FS_SStax    :Real;
    FS_MCwages  :Real;
    FS_MCtax    :Real;
    FS_CodeC    :Real;
    FS_deferred :Real;
    FS_Box12    :Real;
    FS_depcare  :Real;
    FS_nonqual  :Real;
    FS_eic      :Real;

    F_BOX8      :Real;

    FUseEid     :Boolean;

    FEmployees:Integer;
    FIds:TStringList;
    FSTIds:TStringList;

    FEIN:String;

    FEmployeeCountry:String;
    FEmployeeZip    :String;
    ForeignEmployee :Boolean;
    FRecords:Integer;
    FRo:Integer;

    FW2Script:String;
    FRSState:String;
    procedure InsertDetailRecords;
    procedure AssignBox16;
    procedure AssignBox13;
    procedure AssignBox13Emp;
    procedure AssignBox15;

    procedure AssignBox10;
    procedure AssignBox14;
    procedure AssignBox13_Reimb;
    procedure AssignBox13_Hire;
    procedure AssignBox13_HSA;
    procedure AssignBox13_Health;
    procedure AssignBox13_Deduction;

    procedure CreateW2OutputFile;
    procedure Write1A;    //Transmitter Records
    procedure Write2A;    //Transmitter Records
    procedure Write1B;    //Basic Information Records
    procedure Write2B;    //Basic Information Records
    procedure Write1E;    //Employer Records
    procedure Write2E;    //Employer Records
    procedure Write1W;    //Employee Wage Records
    procedure Write2W;    //Employee Wage Records
    procedure Write3W;    //Employee Wage Records
    procedure Write1S;    //Supplemental Records (Optional)
    procedure Write2S;    //Supplemental Records (Optional)
    procedure Write1I;    //Intermediate Total Records
    procedure Write2I;    //Intermediate Total Records
    procedure Write1T;    //Total Records
    procedure Write2T;    //Total Records
    procedure Write1F;    //Final Record

    procedure WriteRA;
    procedure WriteRE;
    procedure WriteRW;
    procedure WriteRO;
    procedure WriteRS;
    procedure WriteRT;
    procedure WriteRU;
    procedure WriteRF;

    function  GetNumericCharactersOnly(AStr:String):String;
    function  EmployersForeignAddressIndicator:String;
    function  EmployeesForeignAddressIndicator(AId:Real):String;

    procedure GetEmployersAddress;
    procedure GetEmployeesAddress;
    function  W2Money(AMoney:Real; ALen:Integer):String;
    procedure RepopulateTables;
    procedure EliminateDuplicates(AHeaderId:Real);
    procedure CheckCustomSqlScript1Caption;
    procedure CreateCustomSQL;
  public
    { Public declarations }
  end;

procedure DoPRW2;

implementation
{$R *.DFM}
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs,
  IQMS.Common.PanelMsg,
  IQMS.Common.HelpHook,
  IQMS.Common.NLS,
  PRW2Custom,
  PrEmplBenefits;

procedure DoPRW2;
var
  LFrmW2 : TFrmW2;
begin
  LFrmW2 := TFrmW2.Create(uniGUIApplication.UniApplication);
  LFrmW2.FW2Script := SelectValueAsString('select PRW2_SQL_SCRIP_FILE from iqsys where rownum < 2');
  LFrmW2.Show;
end;

procedure TFrmW2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmW2.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmW2.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmW2.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmW2.PrintSetUp1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmW2.tblHeaderAfterInsert(DataSet: TDataSet);
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
    tblHeader.FieldByName('PRW2_YEAR').asDateTime      := APk.GetValue('THIS_YEAR');
    tblHeader.FieldByName('PRW2_YEAR_STRING').asString := APk.GetValue('YEAR');
    if APk = PkYearEin then
    begin
      AEinId := APk.GetValue('EIN_ID');
      tblHeader.FieldByName('EIN_ID').asFloat := AEinId;
    end;
    with TFDQuery.Create(self) do
    try
      Connection := UniMainModule.FDConnection1;
      Sql.Add('select company, phone, email from iqsys where rownum < 2');
      Open;
      tblHeaderNAME.AsString  := FieldByName('company').asString;
      tblHeaderPHONE.asString := FieldByName('phone').asString;
      tblHeaderEMAIL.asString := FieldByName('email').asString;
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

procedure TFrmW2.InsertDetailRecords;
var
  HMsg:TPanelMesg;
  AFedTaxId:String;
begin
  try
//    IQTiming1.Start('QryInsertDetails');
    HMsg:= hPleaseWait( 'Processing Details...' );

    if FUseEid and  (tblHeaderEIN_ID.asFloat <> 0) then
    begin
      AFedTaxId := SelectValueFmtAsString('select descrip from ein where id = %f', [tblHeaderEIN_ID.asFloat]);
      with QryInsertDetailsEin do
      begin
        Close;
        ParamByName('nId').Value := tblHeader.FieldByName('ID').asFloat;
        ParamByName('This_Year').Value := tblHeader.FieldByName('PRW2_YEAR').asDateTime;
        ParamByName('fed_Id').Value := AFedTaxId;
        ParamByName('Aein_id').Value := tblHeaderEIN_ID.asFloat;
        ParamByName('Aein_id2').Value := tblHeaderEIN_ID.asFloat;
        ParamByName('Aein_id3').Value := tblHeaderEIN_ID.asFloat;
        ParamByName('Aein_id4').Value := tblHeaderEIN_ID.asFloat;
        ParamByName('Aein_id5').Value := tblHeaderEIN_ID.asFloat;
        ParamByName('Aein_id6').Value := tblHeaderEIN_ID.asFloat;
        ParamByName('Aein_id7').Value := tblHeaderEIN_ID.asFloat;
        ParamByName('Aein_id8').Value := tblHeaderEIN_ID.asFloat;
        ParamByName('Aein_id9').Value := tblHeaderEIN_ID.asFloat;
        ParamByName('Aein_id10').Value := tblHeaderEIN_ID.asFloat;
        ParamByName('Aein_id11').Value := tblHeaderEIN_ID.asFloat;
        ParamByName('Aein_id12').Value := tblHeaderEIN_ID.asFloat;
//        Prepare;
        ExecSql;
      end;
    end
    else
      with QryInsertDetails do
      begin
        Close;
        ParamByName('nId').Value := tblHeader.FieldByName('ID').asFloat;
        ParamByName('This_Year').Value := tblHeader.FieldByName('PRW2_YEAR').asDateTime;
//        Prepare;
        ExecSql;
      end;

    EliminateDuplicates(tblHeader.FieldByName('ID').asFloat);
//    IQTiming1.Stop('QryInsertDetails');
    tblDetail.Refresh;
    if tblDetail.eof and tblDetail.bof then exit;
    tblDetail.First;
    with tblDetail do
    while not eof do
    begin
      HMsg.Mesg:= IqFormat('Box 16, Emp ID: %d', [Trunc(tblDetail.FieldByName('PR_EMP_ID').asFloat)]);
//      IQTiming1.Start('AssignBox16');
      AssignBox16;
//      IQTiming1.Stop('AssignBox16');
      HMsg.Mesg:= IqFormat('Box 13, Emp ID: %d', [Trunc(tblDetail.FieldByName('PR_EMP_ID').asFloat)]);
//      IQTiming1.Start('AssignBox13');
      AssignBox13;
//      IQTiming1.Stop('AssignBox13');
      HMsg.Mesg:= IqFormat('Box 15, Emp ID: %d', [Trunc(tblDetail.FieldByName('PR_EMP_ID').asFloat)]);
//      IQTiming1.Start('AssignBox15');
      AssignBox15;
//      IQTiming1.Stop('AssignBox15');
      HMsg.Mesg:= IqFormat('Box 10, Emp ID: %d', [Trunc(tblDetail.FieldByName('PR_EMP_ID').asFloat)]);
      AssignBox10;
      HMsg.Mesg:= IqFormat('Box 14, Emp ID: %d', [Trunc(tblDetail.FieldByName('PR_EMP_ID').asFloat)]);
      AssignBox14;
      HMsg.Mesg:= IqFormat('Box 13, Emp ID: %d', [Trunc(tblDetail.FieldByName('PR_EMP_ID').asFloat)]);
      AssignBox13Emp;
      AssignBox13_Hire;
      AssignBox13_Reimb;
      AssignBox13_HSA;
      AssignBox13_Health;
      AssignBox13_Deduction;
      Next;
    end;
    tblDetail.Close;
    tblDetail.Open;

    tblDetail.First;
    tblBox13.Refresh;
  finally
    HMsg.Free;
  end;
end;

procedure TFrmW2.EliminateDuplicates(AHeaderId:Real);
var
  AQry:TFDQuery;
  AMinId:Real;
begin
  AQry := TFDQuery.Create(self);
  with AQry do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IqFormat('select distinct pr_emp_id, NVL(local_pr_tax_id, 0) as local_pr_tax_id from PRW2_DETAIL where PRW2_HEADER_ID = %f', [AHeaderId]));
    Open;
    while not eof do
    begin
      ExecuteCommandFmt('delete from PRW2_DETAIL ' +
                   ' where id in ' +
                   '           (select d.id                  ' +
                   '             from prw2_detail d,         ' +
                   '                  pr_tax t,              ' +
                   '                  pr_tax l               ' +
                   '            where d.box19 is not null    ' +
                   '              and d.PRW2_HEADER_ID = %f  ' +
                   '              and d.pr_emp_id = %f       ' +
                   '              and d.pr_tax_id = t.id     ' +
                   '              and d.local_pr_tax_id = l.id  ' +
                   '              and l.state <> t.state ) ',
                   [AHeaderId, FieldByName('pr_emp_id').asFloat]);


      if SelectValueFmtAsFloat('select count(id) from PRW2_DETAIL where PRW2_HEADER_ID = %f and pr_emp_id = %f and NVL(local_pr_tax_id, 0) = %f',
                   [AHeaderId, FieldByName('pr_emp_id').asFloat, FieldByName('local_pr_tax_id').asFloat]) > 1 then
      begin
        if SelectValueFmtAsFloat('select count(id) from PRW2_DETAIL where PRW2_HEADER_ID = %f and pr_emp_id = %f and pr_tax_id is not null',
                     [AHeaderId, FieldByName('pr_emp_id').asFloat]) <> 0 then
          ExecuteCommandFmt('delete from PRW2_DETAIL where PRW2_HEADER_ID = %f and pr_emp_id = %f and pr_tax_id is null',
                    [AHeaderId, FieldByName('pr_emp_id').asFloat])
        else
        begin
          AMinId := SelectValueFmtAsFloat('select min(id) from PRW2_DETAIL where PRW2_HEADER_ID = %f and pr_emp_id = %f',
                              [AHeaderId, FieldByName('pr_emp_id').asFloat]);
          ExecuteCommandFmt('delete from PRW2_DETAIL where PRW2_HEADER_ID = %f and pr_emp_id = %f and id <> %f',
                    [AHeaderId, FieldByName('pr_emp_id').asFloat, AMinId]);
        end;
      end;
      Next;
    end;
  finally
    Free;
  end;
end;


procedure TFrmW2.AssignBox16;
begin
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IQFormat('select eid_number, state from pr_tax t where t.id = %f',
                   [tblDetail.FieldByName('PR_TAX_ID').asFloat]));
    Open;
    if not eof and bof then
    begin
      tblDetail.CheckBrowseMode;
      tblDetail.Edit;

      tblDetail.FieldByName('Box16_State').AsString := FieldByName('state').asString;
      tblDetail.FieldByName('Box16_ID').AsString := FieldByName('eid_number').asString;
      tblDetail.Post;
    end;
  finally
    Free;
  end;
end;

procedure TFrmW2.AssignBox13_Health;
var
  ASum:Real;
begin
  ASum := SelectValueFmtAsFloat('select sum(NVL(amount, 0))                         ' +
                      '  from c_pr_empl_benefits                        ' +
                      ' where pr_emp_id = %f                            ' +
                      '   and w2_code = ''DD''                          ' +
                      '   and this_year = ''%s''                        ',
                      [tblDetail.FieldByName('PR_EMP_ID').asFloat,
                      FormatDateTime('yyyy', tblHeader.FieldByName('PRW2_YEAR').asDateTime)]);
  if ASum  <> 0 then
  ExecuteCommandFmt('insert into PRW2_BOX13 (PRW2_DETAIL_ID, BOX13_C, BOX13_N) ' +
            'values (%f, ''DD'', %f)',
            [tblDetail.FieldByName('ID').asFloat, ASum]);

end;


procedure TFrmW2.AssignBox13_Hire;
var
  AGrosstotax:Real;
  Aemp_status_id:Real;
begin
  Aemp_status_id := SelectValueAsFloat('select min(id) from emp_status where descrip = ''HIRE ACT''');
  AGrosstotax    := SelectValueFmtAsFloat('select sum(t.grosstotax)                           ' +
                                '  from pr_check_hist h,                          ' +
                                '       pr_check_tax t,                           ' +
                                '       pr_emp p,                                 ' +
                                '       cheque c                                  ' +
                                ' where t.pr_check_hist_id = h.id                 ' +
                                '   and t.tax_code = ''FICA''                     ' +
                                '   and NVL(c.check_status, ''*'') <> ''VOID''    ' +
                                '   and h.pr_emp_id = p.id                        ' +
                                '   and h.cheque_id = c.id                        ' +
                                '   and To_Char(c.check_date, ''RRRR'') = ''%s''  ' +
                                '   and p.emp_status_id = %f                      ' +
                                '   and p.id = %f                                 ',
                                [FormatDateTime('yyyy', tblHeader.FieldByName('PRW2_YEAR').asDateTime),
                                 Aemp_status_id,
                                 tblDetail.FieldByName('PR_EMP_ID').asFloat]);
  if AGrosstotax <> 0 then
  ExecuteCommandFmt('insert into PRW2_BOX13 (PRW2_DETAIL_ID, BOX13_C, BOX13_N) ' +
            'values (%f, ''CC'', %f)',
            [tblDetail.FieldByName('ID').asFloat, AGrosstotax]);

end;


procedure TFrmW2.AssignBox13;
begin
  ExecuteCommandFmt('insert into PRW2_BOX13 (PRW2_DETAIL_ID, BOX13_C, BOX13_N)                            ' +
            'select  %f,                                                                          ' +
            '        w2_code,                                                                     ' +
            '        Sum(NVL(totaldeductions, 0)) as totaldeductions                              ' +
            '  from c_emp_distinct_emp_year v,                                                    ' +
            '       c_emp_hist_check h,                                                           ' +
            '       (select totaldeductions,                                                      ' +
            '               pr_check_hist_id,                                                     ' +
            '               w2_code                                                               ' +
            '          from C_PR_CHECK_DEDUCTIONS ) d                                             ' +
            ' where d.pr_check_hist_id(+) = h.id                                                  ' +
            '   and h.pr_emp_id_year = v.pr_emp_id_year                                           ' +
            '   and NVL(RTrim(w2_code), '' '') <> '' ''                                                  ' +
            '   and v.this_year = To_Date(''%s'', ''MM/DD/RRRR'')                                 ' +
            '   and v.pr_emp_id = %f                                                              ' +
            ' group by w2_code                                                                    ',
            [tblDetail.FieldByName('ID').asFloat,
             FormatDateTime('mm/dd/yyyy', tblHeader.FieldByName('PRW2_YEAR').asDateTime),
             tblDetail.FieldByName('PR_EMP_ID').asFloat]);


//  ExecuteCommandFmt('insert into PRW2_BOX13 (PRW2_DETAIL_ID, BOX13_C, BOX13_N)                            ' +
//            'select  %f,                                                                          ' +
//            '        w2_code,                                                                     ' +
//            '        Sum(NVL(totaldeductions, 0)) as totaldeductions                              ' +
//            '  from v_emp_distinct_emp_year v,                                                    ' +
//            '       v_emp_hist_check h,                                                           ' +
//            '       (select sum(NVL(amount, 0)) as totaldeductions,                               ' +
//            '               pr_check_hist_id,                                                     ' +
//            '               w2_code                                                               ' +
//            '          from PR_CHECK_DEDUCTIONS                                                   ' +
//            '         where NVL(pr_deduction_id, 0) not in (select pr_deduction_id                ' +
//            '                                                 from pr_deduction_tax_exempt e,     ' +
//            '                                                      pr_tax t                       ' +
//            '                                                where e.pr_tax_id = t.id             ' +
//            '                                                  and t.tax_code = ''FWT'')          ' +
//            '         group by pr_check_hist_id, w2_code) d                                       ' +
//            ' where d.pr_check_hist_id(+) = h.id                                                  ' +
//            '   and h.pr_emp_id_year = v.pr_emp_id_year                                           ' +
//            '   and NVL(w2_code, '' '') <> '' ''                                                  ' +
//            '   and v.this_year = To_Date(''%s'', ''MM/DD/RRRR'')                                 ' +
//            '   and v.pr_emp_id = %f                                                              ' +
//            ' group by w2_code                                                                    ',
//            [tblDetail.FieldByName('ID').asFloat,
//             FormatDateTime('mm/dd/yyyy', tblHeader.FieldByName('PRW2_YEAR').asDateTime),
//             tblDetail.FieldByName('PR_EMP_ID').asFloat]);

end;

procedure TFrmW2.AssignBox13Emp;
begin
  ExecuteCommandFmt('insert into PRW2_BOX13 (PRW2_DETAIL_ID, BOX13_C, BOX13_N)                            ' +
            'select  %f,                                                                          ' +
            '        w2_code,                                                                     ' +
            '        Sum(NVL(totaldeductions, 0)) as totaldeductions                              ' +
            '  from v_emp_distinct_emp_year v,                                                    ' +
            '       v_emp_hist_check h,                                                           ' +
            '       (select sum(NVL(amount, 0)) as totaldeductions,                               ' +
            '               pr_check_hist_id,                                                     ' +
            '               w2_code                                                               ' +
            '          from PR_CHECK_DEDUCTIONS                                                   ' +
            '         group by pr_check_hist_id, w2_code) d                                       ' +
            ' where d.pr_check_hist_id(+) = h.id                                                  ' +
            '   and h.pr_emp_id_year = v.pr_emp_id_year                                           ' +
            '   and NVL(RTrim(w2_code), '' '') <> '' ''                                           ' +
            '   and v.this_year = To_Date(''%s'', ''MM/DD/RRRR'')                                 ' +
            '   and v.pr_emp_id = %f                                                              ' +
            ' group by w2_code                                                                    ',
            [tblDetail.FieldByName('ID').asFloat,
             FormatDateTime('mm/dd/yyyy', tblHeader.FieldByName('PRW2_YEAR').asDateTime),
             tblDetail.FieldByName('PR_EMP_ID').asFloat]);

end;


procedure TFrmW2.AssignBox15;
begin
  tblDetail.CheckBrowseMode;
  with tblDetail do
  if SelectValueFmtAsFloat('select count(id) from PRW2_BOX13 where PRW2_DETAIL_ID = %f and ' +
               '(NVL(Rtrim(BOX13_C), '' '') = ''D'' or NVL(Rtrim(BOX13_C), '' '') = ''E'' or ' +
               'NVL(Rtrim(BOX13_C), '' '') = ''F'' or NVL(Rtrim(BOX13_C), '' '') = ''H'' or ' +
               'NVL(Rtrim(BOX13_C), '' '') = ''S'' or NVL(Rtrim(BOX13_C), '' '') = ''G'' or ' +
               'NVL(Rtrim(BOX13_C), '' '') = ''AA'' or NVL(Rtrim(BOX13_C), '' '') = ''BB'' or ' +
               'NVL(Rtrim(BOX13_C), '' '') = ''EE'')',
               [FieldByName('ID').asFloat]) <> 0 then
  begin
    Edit;
    FieldByName('BOX15B').AsString := 'Y';
    FieldByName('BOX15E').AsString := 'Y';
    Post;
  end;
end;

procedure TFrmW2.SBSearchClick(Sender: TObject);
begin
  if PKW2.Execute then
    tblHeader.Locate('ID', PKW2.GetValue('ID'), []);
end;

procedure TFrmW2.tblDetailBeforePost(DataSet: TDataSet);
begin
  with TFDTable(DataSet) do
    if MasterSource <> nil then
      if TFDTable(MasterSource.DataSet).FieldByName('ID').asFloat = 0 then
        raise Exception.Create('Parent record not found, cannot post');
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TFrmW2.tblHeaderBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TFrmW2.tblDetailBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TFrmW2.PkEmpBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'nId', tblHeader.FieldByName('ID').asFloat);
//  TFDQuery(DataSet).ParamByName('nId').Value := tblHeader.FieldByName('ID').asFloat;
end;


procedure TFrmW2.sbSearchEmpClick(Sender: TObject);
begin
  with PKEmp do
  if Execute then
    tblDetail.Locate('ID', GetValue('ID'), []);
end;

procedure TFrmW2.grid13Enter(Sender: TObject);
begin
  if Sender = Grid13
  then NavDetail.DataSource := SrcBox13
  else NavDetail.DataSource := SrcDetail;
end;

procedure TFrmW2.RecalculateYear1Click(Sender: TObject);
begin
  if tblHeader.eof and tblHeader.bof then Exit;
  if not IqConfirmYN('Do you wish to recalculate the whole year? (Current records will be deleted)') then Exit;
  ExecuteCommandFmt('delete from prw2_detail where prw2_header_id = %f', [tblHeader.FieldByName('ID').asFloat]);
  InsertDetailRecords;
end;

procedure TFrmW2.Recalculate1Click(Sender: TObject);
var
  nEmpId, nId, PrTaxId:Real;
  AQry:TFDQuery;
begin
  with tblDetail do
  begin
    if eof and bof then Exit;
    if not IqConfirmYN('Do you wish to recalculate employee? (Current record will be deleted)') then Exit;
    nEmpId  := FieldByName('PR_EMP_ID').asFloat;
    PrTaxId := FieldByName('PR_TAX_ID').asFloat;

    // ExecuteCommandFmt('delete from prw2_detail where id = %f', [FieldByName('ID').asFloat]);
    Delete;

//    nId := GetNextID('PRW2_DETAIL');
    with QryInsertDetailsEmp do
    begin
      Close;
//      ParamByName('nId').Value := nId;
      ParamByName('nHeaderId').Value := tblHeader.FieldByName('ID').asFloat;
      ParamByName('This_Year').Value := tblHeader.FieldByName('PRW2_YEAR').asDateTime;
      ParamByName('nEmpId').Value := nEmpId;
      Prepare;
      ExecSql;
    end;
    Refresh;
    if not Locate('PR_EMP_ID', nEmpId, [])
      then Exit;

    AQry := TFDQuery.Create(Application);

    try
      AQry.Connection := UniMainModule.FDConnection1;
      AQry.Sql.Add(IQFormat('select eid_number, state from pr_tax t where t.id = %f', [PrTaxId]));
      AQry.Open;
      if not AQry.eof and AQry.bof then
      begin

        tblDetail.CheckBrowseMode;
        tblDetail.Edit;

        tblDetail.FieldByName('PR_TAX_ID').asFloat := PrTaxId;

        tblDetail.FieldByName('Box16_State').AsString := AQry.FieldByName('state').asString;
        tblDetail.FieldByName('Box16_ID').AsString := AQry.FieldByName('eid_number').asString;
        tblDetail.Post;
      end;
    finally
      AQry.Free;
    end;





//    AssignBox16;
    AssignBox13Emp;
    AssignBox13_Hire;
    AssignBox15;
    AssignBox10;
    AssignBox14;
    AssignBox13_Reimb;
    AssignBox13_HSA;
    AssignBox13_Health;
    AssignBox13_Deduction;
    Refresh;
    tblBox13.Close;
    tblBox13.Open;

//    tblBox13.Refresh;
  end;
end;

{ TODO -oathite -cWebConvert : beforeaction event action is not available
procedure TFrmW2.NavDetailBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  with NavDetail.DataSource.Dataset do
    if Button = nbLast then
    begin
      Last;
      Refresh;
      Abort;
    end
    else if Button = nbFirst then
    begin
      First;
      Refresh;
      Abort;
    end;
end;  }

procedure TFrmW2.CreateW2reportfile1Click(Sender: TObject);
var
  AState:String;
  ACount:Real;
begin
  Astate := '';
  if SelectValueFmtAsString('select NVL(INCL_STATE_RS, ''N'') from PRW2_HEADER where id = %f', [tblHeaderID.asFloat]) = 'Y' then
  begin
    ACount := SelectValueFmtAsFloat('select count (*) from (select distinct box16_state as state ' +
                        ' from PRW2_DETAIL where box16_state is not null and PRW2_HEADER_ID = %f)', [tblHeaderID.asFloat]);
    if ACount = 1 then
      AState := SelectValueFmtAsString('select box16_state from PRW2_DETAIL where box16_state is not null and PRW2_HEADER_ID = %f', [tblHeaderID.asFloat])
    else if ACount > 1  then
    begin
      with PkRSState do
        if execute then
        begin
          AState := GetValue('STATE');
        end
        else
          exit;
    end;
  end;
  FRSState := AState;
  if ACount <= 1 then
    if not IqconfirmYN('Do you wish to create a W2 output file') then Exit;
  with SaveDialog1 do
    if Execute then FW2File := FileName
    else Exit;
  if FW2Script <> '' then
  begin
    CreateCustomSQL;
    exit;
  end;
  tblDetail.CheckBrowseMode;
  tblDetail.First;
  FA_GROSS    := 0;
  FA_SSwages  := 0;
  FA_FEDwh    := 0;
  FA_SStax    := 0;
  FA_MCwages  := 0;
  FA_MCtax    := 0;
  FA_CodeC    := 0;
  FA_deferred := 0;
  FA_Box12    := 0;
  FA_depcare  := 0;
  FA_nonqual  := 0;
  FA_eic      := 0;

  FA_Box13_D  := 0;
  FA_Box13_E  := 0;
  FA_Box13_F  := 0;
  FA_Box13_G  := 0;
  FA_Box13_H  := 0;
  FA_Box13_C  := 0;
  FA_Box13_V  := 0;
  FA_Box13_W  := 0;
  FA_Box13_A  := 0;
  FA_Box13_R  := 0;
  FA_Box13_S  := 0;
  FA_Box13_T  := 0;
  FA_Box13_M  := 0;
  FA_Box13_N  := 0;
  FA_Box13_Q  := 0;
  FA_Box13_Y  := 0;
  FA_Box13_Z  := 0;
  FA_Box13_CC := 0;
  FA_Box13_AA := 0;
  FA_Box13_BB := 0;




  FS_GROSS    := 0;
  FS_SSwages  := 0;
  FS_FEDwh    := 0;
  FS_SStax    := 0;
  FS_MCwages  := 0;
  FS_MCtax    := 0;
  FS_CodeC    := 0;
  FS_deferred := 0;
  FS_Box12    := 0;
  FS_depcare  := 0;
  FS_nonqual  := 0;
  FS_eic      := 0;
  FRo         := 0;

  F_BOX8      := 0;

  CreateW2OutputFile;
  IqConfirm('W2 report file created.'#13 +
            'This file name must remain W2REPORT, without a file extension.');
end;

procedure TFrmW2.CreateW2OutputFile;
var
  HMsg:TPanelMesg;
begin
  try
    HMsg:= hPleaseWait( 'Creating output file, please wait...' );
    AssignFile(FTextFile, FW2File);
    Rewrite(FTextFile);
    GetEmployersAddress;
    WriteRA;
    WriteRE;
//    Write1A;    //Transmitter Records
//    Write2A;    //Transmitter Records
//    Write1B;    //Basic Information Records
//    Write2B;    //Basic Information Records
//    Write1E;    //Employer Records
//    Write2E;    //Employer Records
    FRecords := 0;
    FEmployees := 0;
    FIds := TstringList.Create;
    FSTIds := TstringList.Create;
    with tblDetail do
    while not eof do
    begin
 //     Inc(FRecords);
      Inc(FEmployees);
      WriteRW;
      WriteRO;
      WriteRS;
//      if ARecords > 41 then
//      begin
//        Write1I;    //Intermediate Total Records
//        Write2I;    //Intermediate Total Records
//        ARecords := 1;
//      end;
//      Write1W;    //Employee Wage Records
//      Write2W;    //Employee Wage Records
//      Write3W;    //Employee Wage Records
      Next;
    end;
    WriteRT;
    if FRo <> 0 then
      WriteRU;
    WriteRF;

//    Write1S;    //Supplemental Records (Optional)
//    Write2S;    //Supplemental Records (Optional)
//    Write1T;    //Total Records
//    Write2T;    //Total Records
//    Write1F;    //Final Record
  finally
    FIds.Free;
    FStIds.Free;
    CloseFile(FTextFile);
    HMsg.Free;
  end;
end;

function TFrmW2.GetNumericCharactersOnly(AStr:String):String;
var
  i:Integer;
begin
  Result := '';
  for i := 1 to length(AStr) do
    if Pos(Copy(AStr, i, 1), '1234567890') <> 0 then
      Result := Result + Copy(AStr, i, 1);
end;

function TFrmW2.EmployersForeignAddressIndicator:String;
begin
  Result := PadR(StrTran(Strtran(SelectValueAsString('select country from iqsys'), ' ', ''), '.', ''), 2);
  if (Result = 'US') or (Result = 'UN') then
    Result := ' '
  else
    Result := 'X';
end;

function TFrmW2.EmployeesForeignAddressIndicator(AId:Real):String;
begin
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(Format('select country, zip from pr_emp where id = %f', [AId]));
    Open;
    FEmployeeCountry :=  StrTran(StrTran(FieldByName('country').asString, ' ', ''), '.', '');
    FEmployeeZip     :=  FieldByName('zip').asString;
    if (Padr(FEmployeeCountry, 2) = 'US') or (Padr(FEmployeeCountry, 2) = 'UN') then
      Result := ' '
    else
      Result := 'X';
    ForeignEmployee := (Result = ' ')
  finally
    Free;
  end;
end;

procedure TFrmW2.GetEmployersAddress;
var
  AZip:String;
begin
  if EmployersForeignAddressIndicator = 'X' then  //Foreign
  begin
    FEmpCity := Trim(tblDetail.FieldByName('EMPLOYERS_CITY').asString + ' ' +
                  tblDetail.FieldByName('EMPLOYERS_STATE').asString + ' ' +
                  SelectValueAsString('select TrimLeft(RTrim(country)) from iqsys'));
    FEmpState := '  ';
    FEmpZip2  := Copy(tblDetail.FieldByName('EMPLOYERS_ZIP').asString, 1, 5);
    FEmpZip1  := Copy(tblDetail.FieldByName('EMPLOYERS_ZIP').asString, 6, 5);
  end
  else
  begin
    FEmpCity  := tblDetail.FieldByName('EMPLOYERS_CITY').asString;
    FEmpState := tblDetail.FieldByName('EMPLOYERS_STATE').asString;
    AZip   := Padr(GetNumericCharactersOnly(tblDetail.FieldByName('EMPLOYERS_ZIP').asString), 9);
    FEmpZip2  := Copy(AZip, 1, 5);
    FEmpZip1  := Copy(AZip, 6, 4);
//    if Trim(FEmpZip1) <> '' then FEmpZip1 := '-' + FEmpZip1;
    if Trim(FEmpZip1) <> '' then FEmpZip1 := LPadZero(FEmpZip1,4);
  end;
end;

procedure TFrmW2.GetEmployeesAddress;
var
  AZip:String;
begin
  with tblDetail do
  begin
    FSSN := GetNumericCharactersOnly(FieldByName('SSNMBR').asString);
    if Pos(FSSN, '000000000_111111111_333333333_123456789') <> 0 then
      raise Exception.Create ('Invalid SSN, cannot continue');
    if Length(FSSN) <> 9 then
      FSSN := 'I        ';
    FEmployeeCity  := FieldByName('EMP_CITY').asString;
    FEmployeeState := FieldByName('EMP_STATE').asString;
    AZip   := Padr(GetNumericCharactersOnly(FieldByName('EMP_ZIP').asString), 9);
    FEmployeeZip2  := Copy(AZip, 1, 5);
    FEmployeeZip1  := Copy(AZip, 6, 4);
//    if Trim(FEmployeeZip1) <> '' then FEmployeeZip1 := '-' + FEmployeeZip1;
    if Trim(FEmployeeZip1) <> '' then FEmployeeZip1 := LPadZero(FEmployeeZip1,4);
    if FieldByName('BOX15A').AsString = 'Y' then
      FStatutoryEmployee := '1'
    else
      FStatutoryEmployee := '0';
  end;
end;

function TFrmW2.W2Money(AMoney:Real; ALen:Integer):String;
var
  AStr:String;
begin
  AStr := '%' + IntToStr(ALen) + 'd';

  Result := StrTran(Format(AStr, [ Round( Abs( AMoney * 100 ))]), ' ', '0');

  //Result := StrTran(Format(AStr, [IntToStr(Trunc(Abs(AMoney * 100)))]), ' ', '0')
end;


procedure TFrmW2.Write1A;    //Transmitter Records
var
  ALine:String;
  AEIN:String;
begin
  AEIN := GetNumericCharactersOnly(tblDetail.FieldByName('EIN').asString);
  if
  //(Pos(Copy(AEIN, 1, 2),
  //       '00_07_08_09_10_17_18_19_20_26_27_28_29_30_40_49_50_60_69_70_78_79_80_89_90') <> 0) or
      (Trim(AEIN) = '') then
    raise Exception.Create ('Company EIN has wrong value, cannot continue');

  ALine := '1A' +
           tblHeader.FieldByName('PRW2_YEAR_STRING').AsString +
           PadR(AEIN, 9) +
           Space(8) +
           EmployersForeignAddressIndicator +
           PadR(Trim(tblDetail.FieldByName('EMPLOYERS_NAME').asString), 50) +
           PadR(Trim(Trim(tblDetail.FieldByName('EMPLOYERS_ADDR1').asString) + ' ' +
                Trim(tblDetail.FieldByName('EMPLOYERS_ADDR2').asString)), 40) +
           Space(14);
  Writeln(FTextFile, UpperCase(ALine));
end;

procedure TFrmW2.Write2A;    //Transmitter Records
var
  ALine:String;
begin
  ALine := '2A' + Padr(FEmpCity, 25) + FEmpState + Space(8) + Padr(FEmpZip1, 5) + Padr(FEmpZip2, 5) + Space(81);
  Writeln(FTextFile, UpperCase(ALine));
end;

procedure TFrmW2.Write1B;    //Basic Information Records
var
  AEIN, ALine:String;
begin
  AEIN := GetNumericCharactersOnly(tblDetail.FieldByName('EIN').asString);
  ALine := '1B' +
           tblHeader.FieldByName('PRW2_YEAR_STRING').AsString +
           PadR(AEIN, 9) +
           'IBM     ' +
           Space(105);
  Writeln(FTextFile, UpperCase(ALine));
end;

procedure TFrmW2.Write2B;    //Basic Information Records
var
  ALine:String;
begin
  ALine := '2B' +
           Space(13) +
           EmployersForeignAddressIndicator +
           PadR(Trim(tblDetail.FieldByName('EMPLOYERS_NAME').asString), 44) +
           PadR(Trim(Trim(tblDetail.FieldByName('EMPLOYERS_ADDR1').asString) + ' ' +
                Trim(tblDetail.FieldByName('EMPLOYERS_ADDR2').asString)), 35) +
           Padr(FEmpCity, 20) + FEmpState + Padr(FEmpZip1, 5) + Padr(FEmpZip2, 5) + Space(1);
  Writeln(FTextFile, UpperCase(ALine));
end;

procedure TFrmW2.Write1E;    //Employer Records
var
  ALine:String;
  AEIN:String;
begin
  AEIN := GetNumericCharactersOnly(tblDetail.FieldByName('EIN').asString);
  ALine := '1E' +
           tblHeader.FieldByName('PRW2_YEAR_STRING').AsString +
           PadR(AEIN, 9) +
           Space(9) +
           PadR(Trim(tblDetail.FieldByName('EMPLOYERS_NAME').asString), 50) +
           PadR(Trim(Trim(tblDetail.FieldByName('EMPLOYERS_ADDR1').asString) + ' ' +
                Trim(tblDetail.FieldByName('EMPLOYERS_ADDR2').asString)), 40) +
           EmployersForeignAddressIndicator +
           Space(13);
  Writeln(FTextFile, UpperCase(ALine));
end;

procedure TFrmW2.Write2E;    //Employer Records
var
  ALine:String;
begin
  ALine := '2E' +
           Padr(FEmpCity, 25) +
           FEmpState +
           Space(8) +
           Padr(FEmpZip1, 5) +
           Padr(FEmpZip2, 5) +
           'F' +
           'R' +
           Space(2) +
           SPace(4) +
           Space(2) +
           SPace(9) +
           SPace(62);
  Writeln(FTextFile, UpperCase(ALine));
end;

procedure TFrmW2.Write1W;    //Employee Wage Records
var
  ALine:String;
begin
  GetEmployeesAddress;
  ALine := '1W' +
           FSSN +
           Padr(Trim(Trim(tblDetail.FieldByName('FIRST_NAME').asString) + ' ' +
           Trim(Trim(tblDetail.FieldByName('MIDDLE_INIT').asString) + ' ' +
           Trim(tblDetail.FieldByName('LAST_NAME').asString))), 27) +
           PadR(Trim(Trim(tblDetail.FieldByName('EMP_ADDR1').asString) + ' ' +
                Trim(tblDetail.FieldByName('EMP_ADDR2').asString)), 40) +
           Padr(FEmployeeCity, 25) +
           Padr(FEmployeeState, 2) +
           Space(8) +
           Padr(FEmployeeZip1, 5) +
           Padr(FEmployeeZip2, 5) +
           FStatutoryEmployee +
           Space(4);
  Writeln(FTextFile, UpperCase(ALine));
end;

procedure TFrmW2.Write2W;    //Employee Wage Records
var
  ALine, APensionPlan, ADeferred:String;
  ABox13Value, ATotDeferred:Real;
begin
  with tblDetail do
  begin
    ABox13Value := SelectValueFmtAsFloat('select Sum(BOX13_N) from PRW2_BOX13 where BOX13_C = ''C'' and PRW2_DETAIL_ID = %f',
                           [FieldByName('ID').asFloat]);

    ATotDeferred :=  SelectValueFmtAsFloat('select Sum(BOX13_N) from PRW2_BOX13 where (BOX13_C = ''D'' or ' +
                                                                          'BOX13_C = ''E'' or ' +
                                                                          'BOX13_C = ''F'' or ' +
                                                                          'BOX13_C = ''G'' or ' +
                                                                          'BOX13_C = ''H'') '   +
                                                                          'and PRW2_DETAIL_ID = %f',
                             [FieldByName('ID').asFloat]);


    if FieldByName('BOX15B').AsString = 'Y' then
      APensionPlan := 'P'
    else
      APensionPlan := ' ';

    if FieldByName('BOX15E').AsString = 'Y' then
      ADeferred := 'D'
    else
      ADeferred := ' ';

    ALine := '2W' +
             W2Money(FieldByName('BOX3').asFloat, 7) +
             Space(1) +
             '0000000' +
             Space(1) +
             W2Money(FieldByName('BOX1').asFloat, 9) +
             Space(1) +
             W2Money(FieldByName('BOX4').asFloat, 6) +
             W2Money(FieldByName('BOX2').asFloat, 9) +
             '000000000' +
             Space(1) +
             W2Money(FieldByName('BOX11').asFloat, 9) +
             Space(7) +
             W2Money(ABox13Value, 7) +
             '0000000' +
             W2Money(FieldByName('BOX9').asFloat, 7) +
             '0000000' +
             W2Money(FieldByName('BOX12').asFloat, 9) +
             Space(1) +
             APensionPlan +
             Space(1) +
             ADeferred +
             Space(1) +
             W2Money(ATotDeferred, 9) +
             Space(1) +
             W2Money(FieldByName('BOX10').asFloat, 7);

    Writeln(FTextFile, UpperCase(ALine));


    if FIds.IndexOf(tblDetail.FieldByname('PR_EMP_ID').asString) < 0 then
    begin
      FA_GROSS    := FA_Gross    + FieldByName('BOX1').asFloat;
      FA_SSwages  := FA_SSwages  + FieldByName('BOX3').asFloat;
      FA_FEDwh    := FA_Fedwh    + FieldByName('BOX2').asFloat;
      FA_SStax    := FA_SStax    + FieldByName('BOX4').asFloat;
      FA_MCwages  := FA_MCwages  + FieldByName('BOX5').asFloat;
      FA_MCtax    := FA_MCtax    + FieldByName('BOX6').asFloat;
      FA_CodeC    := FA_CodeC    + ABox13Value;
      FA_deferred := FA_deferred + ATotDeferred;
      FA_Box12    := FA_Box12    + FieldByName('BOX12').asFloat;
      FA_depcare  := FA_depcare  + FieldByName('BOX10').asFloat;
      FA_nonqual  := FA_nonqual  + FieldByName('BOX11').asFloat;
      FA_eic      := FA_eic      + FieldByName('BOX9').asFloat;

      FS_GROSS    := FS_Gross    + FieldByName('BOX1').asFloat;     // sum to Sub 41 totals
      FS_SSwages  := FS_SSwages  + FieldByName('BOX3').asFloat;
      FS_FEDwh    := FS_Fedwh    + FieldByName('BOX2').asFloat;
      FS_SStax    := FS_SStax    + FieldByName('BOX4').asFloat;
      FS_MCwages  := FS_MCwages  + FieldByName('BOX5').asFloat;
      FS_MCtax    := FS_MCtax    + FieldByName('BOX6').asFloat;
      FS_CodeC    := FS_CodeC    + ABox13Value;
      FS_deferred := FS_deferred + ATotDeferred;
      FS_Box12    := FS_Box12    + FieldByName('BOX12').asFloat;
      FS_depcare  := FS_depcare  + FieldByName('BOX10').asFloat;
      FS_nonqual  := FS_nonqual  + FieldByName('BOX11').asFloat;
      FS_eic      := FS_eic      + FieldByName('BOX9').asFloat;

      F_BOX8      := F_BOX8      + FieldByName('BOX8').asFloat;
      FIds.Add(tblDetail.FieldByname('PR_EMP_ID').asString);
    end;

  end;
end;

procedure TFrmW2.Write3W;    //Employee Wage Records
var
  ALine:String;
begin
  with tblDetail do
  begin
    ALine := '3W' +
             W2Money(FieldByName('BOX5').asFloat, 9) +
             W2Money(FieldByName('BOX6').asFloat, 7) +
             Space(15) +
             '0000000' +
             Space(88);
  end;
  Writeln(FTextFile, UpperCase(ALine));
end;

procedure TFrmW2.Write1S;    //Supplemental Records (Optional)
begin
end;

procedure TFrmW2.Write2S;    //Supplemental Records (Optional)
begin
end;

procedure TFrmW2.Write1I;    //Intermediate Total Records
var
  ALine:String;
begin
  ALine := '1I' +
           W2Money(FS_SSwages, 10) +
           Space(1) +
           '0000000000' +              // SS tips
           Space(1) +
           W2Money(FS_GROSS, 10) +
           Space(1) +
           W2Money(FS_SStax, 10) +
           Space(1) +
           W2Money(FS_FEDwh, 10) +
           Space(7) +
           W2Money(FS_CodeC, 10) +
           '0000000000' +              // uncollected tips = 0
           W2Money(FS_eic, 11) +
           '0000000000' +              // tips = 0
           W2Money(FS_Box12, 10) +      // Fringe Benefits
           Space(1) +
           W2Money(FS_deferred, 10) +
           Space(3);
  Writeln(FTextFile, UpperCase(ALine));
end;

procedure TFrmW2.Write2I;    //Intermediate Total Records
var
  ALine:String;
begin
  ALine := '2I' +
           W2Money(FS_depcare, 10) +
           Space(1) +
           '0000000000' +              // SS tips
           Space(1) +
           W2Money(FS_nonqual, 10) +
           Space(1) +
           W2Money(FS_MCwages, 11) +
           Space(1) +
           W2Money(FS_MCtax, 10) +
           Space(1) +
           Space(12) +
           Space(58);
  Writeln(FTextFile, UpperCase(ALine));

  FS_GROSS    := 0;
  FS_SSwages  := 0;
  FS_FEDwh    := 0;
  FS_SStax    := 0;
  FS_MCwages  := 0;
  FS_MCtax    := 0;
  FS_CodeC    := 0;
  FS_deferred := 0;
  FS_Box12    := 0;
  FS_depcare  := 0;
  FS_nonqual  := 0;
  FS_eic      := 0;
end;

procedure TFrmW2.Write1T;    //Total Records
var
  ALine:String;
begin
  ALine := '1T' +
           StrTran(Format('%7s', [IntToStr(FEmployees)]), ' ', '0') +
           W2Money(FA_SSwages, 13) +
           Space(1) +
           '000000000000' +              // SS tips
           W2Money(FA_GROSS, 13) +
           Space(1) +
           W2Money(FA_SStax, 12) +
           Space(1) +
           W2Money(FA_FEDwh, 12) +
           W2Money(FA_CodeC, 12) +
           '000000000000' +             // uncollected tips = 0
           W2Money(FA_eic, 12) +
           '000000000000' +              // tips = 0
           '000000';
  Writeln(FTextFile, UpperCase(ALine));
end;

procedure TFrmW2.Write2T;    //Total Records
var
  ALine:String;
begin
  ALine := '2T' +
           W2Money(FA_Box12, 12) +     // Fringe Benefits
           Space(1) +
           W2Money(FA_deferred, 13) +
           Space(1) +
           W2Money(FA_depcare, 12) +
           Space(1) +
           '0000000000000' +     // non-qual 457 (Gov't) distrib.
           Space(1) +
           W2Money(FA_nonqual, 13) +
           Space(1) +
           W2Money(FA_MCwages, 13) +
           Space(1) +
           W2Money(FA_MCtax, 12) +
           Space(1) +
           Space(12) +
           Space(1)  +
           Space(12) +
           Space(6);
  Writeln(FTextFile, UpperCase(ALine));
end;

procedure TFrmW2.Write1F;    //Final Record
var
  ALine:String;
begin
  ALine := '1F' +
           StrTran(Format('%7s', [IntToStr(FEmployees)]), ' ', '0') +
           W2Money(FA_SSwages,16) +
           Space(1) +
           '0000000000000000' +             // SS tips
           Space(1) +
           W2Money(FA_GROSS, 16) +
           Space(1) +
           W2Money(FA_SStax, 16) +
           Space(1) +
           W2Money(FA_FEDwh, 16) +
           Space(1) +
           W2Money(FA_eic, 16) +
           Space(18);
  Write(FTextFile, UpperCase(ALine));
end;

procedure TFrmW2.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmPAYROLL{CHM}, iqhtmPAYROLL_TX{HTM} )  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmW2.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1001497 );
end;

procedure TFrmW2.Show1Click(Sender: TObject);
begin
  IQTiming1.Display;
end;

procedure TFrmW2.Clear1Click(Sender: TObject);
begin
  IQTiming1.Clear;
end;

procedure TFrmW2.RepopulateTables;
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



//    IQTiming1.Start('Truncating tables');
    ExecuteCommand('truncate table C_EMP_HIST_CHECK');
    ExecuteCommand('truncate table C_EMP_DISTINCT_EMP_YEAR');
    ExecuteCommand('truncate table C_PR_CHECK_DEDUCTIONS');
//    IQTiming1.Stop('Truncating tables');

//    IQTiming1.Start('Populating C_EMP_HIST_CHECK');
    HMsg.Mesg:= 'Populating C_EMP_HIST_CHECK';

    ExecuteCommand('begin                                                ' +
           AView +
//           ' for v in (select * from v_emp_hist_check)           ' +
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

//    IQTiming1.Stop('Populating C_EMP_HIST_CHECK');


//    IQTiming1.Start('Populating C_EMP_DISTINCT_EMP_YEAR');

    if FUseEid and  (tblHeaderEIN_ID.asFloat <> 0) then
      AView := IqFormat(' for v in (select * from V_EMP_DISTINCT_EMP_YEAR where ein_id = %f) ', [tblHeaderEIN_ID.asFloat])
    else
      AView := ' for v in (select * from V_EMP_DISTINCT_EMP_YEAR) ';




    HMsg.Mesg:= 'Populating C_EMP_DISTINCT_EMP_YEAR';

    ExecuteCommand('begin                                                                        ' +
           AView +
//           ' for v in (select * from V_EMP_DISTINCT_EMP_YEAR)                            ' +
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

//    IQTiming1.Stop('Populating C_EMP_DISTINCT_EMP_YEAR');

//    IQTiming1.Start('Populating C_PR_CHECK_DEDUCTIONS');
    HMsg.Mesg:= 'Populating C_PR_CHECK_DEDUCTIONS';

//    ExecuteCommand('begin                                                                                ' +
//           ' for v in (select sum(NVL(amount, 0)) as totaldeductions,                            ' +
//           '                  pr_check_hist_id,                                                  ' +
//           '                  w2_code                                                            ' +
//           '             from PR_CHECK_DEDUCTIONS                                                ' +
//           '            where NVL(pr_deduction_id, 0) not in (select pr_deduction_id             ' +
//           '                                                    from pr_deduction_tax_exempt e,  ' +
//           '                                                         pr_tax t                    ' +
//           '                                                   where e.pr_tax_id = t.id          ' +
//           '                                                     and t.tax_code = ''FWT'')       ' +
//           '         group by pr_check_hist_id, w2_code)                                         ' +
//           ' loop                                                                                ' +
//           '   insert into C_PR_CHECK_DEDUCTIONS (ID              ,                              ' +
//           '                                      PR_CHECK_HIST_ID,                              ' +
//           '                                      W2_CODE         ,                              ' +
//           '                                      TOTALDEDUCTIONS)                               ' +
//           '                              values (s_C_PR_CHECK_DEDUCTIONS.nextval,               ' +
//           '                                      V.PR_CHECK_HIST_ID,                            ' +
//           '                                      V.W2_CODE         ,                            ' +
//           '                                      V.TOTALDEDUCTIONS);                            ' +
//           '   commit;                                                                           ' +
//           ' end loop;                                                                           ' +
//           ' end;                                                                                ');


    if FUseEid and  (tblHeaderEIN_ID.asFloat <> 0) then
      AView := IqFormat(' for v in (select sum(NVL(a.amount, 0)) + sum(NVL(a.BACK_DED_AMOUNT, 0)) as totaldeductions, ' +
               '                  a.pr_check_hist_id,                                                  ' +
               '                  RTrim(a.w2_code) as w2_code                                          ' +
               '             from PR_CHECK_DEDUCTIONS a, pr_check_hist b                               ' +
               '            where a.pr_check_hist_id = b.id                                            ' +
               '              and b.ein_id = %f                                                        ' +
               '         group by a.pr_check_hist_id, RTrim(a.w2_code)) ', [tblHeaderEIN_ID.asFloat])
    else
      AView := ' for v in (select sum(NVL(amount, 0)) + sum(NVL(BACK_DED_AMOUNT, 0)) as totaldeductions, ' +
               '                  pr_check_hist_id,                                                  ' +
               '                  RTrim(w2_code) as w2_code                                          ' +
               '             from PR_CHECK_DEDUCTIONS                                                ' +
               '         group by pr_check_hist_id, RTrim(w2_code))                                         ';



    ExecuteCommand('begin                                                                                ' +
            AView +
//           ' for v in (select sum(NVL(amount, 0)) + sum(NVL(BACK_DED_AMOUNT, 0)) as totaldeductions, ' +
//           '                  pr_check_hist_id,                                                  ' +
//           '                  w2_code                                                            ' +
//           '             from PR_CHECK_DEDUCTIONS                                                ' +
//           '         group by pr_check_hist_id, w2_code)                                         ' +
           ' loop                                                                                ' +
           '   insert into C_PR_CHECK_DEDUCTIONS (ID              ,                              ' +
           '                                      PR_CHECK_HIST_ID,                              ' +
           '                                      W2_CODE         ,                              ' +
           '                                      TOTALDEDUCTIONS)                               ' +
           '                              values (s_C_PR_CHECK_DEDUCTIONS.nextval,               ' +
           '                                      V.PR_CHECK_HIST_ID,                            ' +
           '                                      V.W2_CODE         ,                            ' +
           '                                      V.TOTALDEDUCTIONS);                            ' +
           '   commit;                                                                           ' +
           ' end loop;                                                                           ' +
           ' end;                                                                                ');




//    IQTiming1.Stop('Populating C_PR_CHECK_DEDUCTIONS');
  finally
    HMsg.Free;
  end;
end;

procedure TFrmW2.AssignBox10;
begin
  ExecuteCommandFmt('update prw2_detail set box10 =                                                       ' +
            '(select sum(r.amount) as totalreimb                                                  ' +
            '  from PR_CHECK_PAYTYPE_REIMB r,                                                     ' +
            '       PR_CHECK_HIST h,                                                              ' +
            '       CHEQUE c                                                                      ' +
            ' where w2_box = ''BOX 10''                                                           ' +
            '   and r.pr_check_hist_id(+) = h.id                                                  ' +
            '   and h.cheque_id = c.id                                                            ' +
            '   and SubStr(NVL(c.check_status, ''    ''), 1, 4) <> ''VOID''                         ' +
            '   and To_Char(c.check_date, ''RRRR'') = To_Char(To_Date(''%s'', ''MM/DD/RRRR''), ''RRRR'') ' +
            '   and h.pr_emp_id = %f)                                                             ' +
            'where id = %f',
            [FormatDateTime('mm/dd/yyyy', tblHeader.FieldByName('PRW2_YEAR').asDateTime),
             tblDetail.FieldByName('PR_EMP_ID').asFloat,
             tblDetail.FieldByName('ID').asFloat]);
end;

procedure TFrmW2.AssignBox14;
var
  AStr:String;
begin
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IQFormat('select sum(r.amount) as totalreimb, r.PR_PAYTYPE_REIMB_ID as ID               ' +
            '  from PR_CHECK_PAYTYPE_REIMB r,                                                     ' +
            '       PR_CHECK_HIST h,                                                              ' +
            '       CHEQUE c                                                                     ' +
            ' where r.w2_box = ''BOX 14''                                                           ' +
            '   and r.pr_check_hist_id(+) = h.id                                                  ' +
            '   and h.cheque_id = c.id                                                            ' +
            '   and SubStr(NVL(c.check_status, ''    ''), 1, 4) <> ''VOID''                         ' +
            '   and To_Char(c.check_date, ''RRRR'') = To_Char(To_Date(''%s'', ''MM/DD/RRRR''), ''RRRR'') ' +
            '   and h.pr_emp_id = %f group by r.PR_PAYTYPE_REIMB_ID                                 ',
            [FormatDateTime('mm/dd/yyyy', tblHeader.FieldByName('PRW2_YEAR').asDateTime),
             tblDetail.FieldByName('PR_EMP_ID').asFloat]));
    Open;
    while not eof do
    begin
      AStr := IqFormat('%s - %f ', [SelectValueFmtAsString('select substr(description, 1, 5) from pr_paytype_reimb where id = %f',
                                 [FieldByName('id').asFloat]), FieldByname('totalreimb').asFloat]) + AStr;
      Next;
    end;
  finally
    Free;
  end;
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IQFormat('select sum(r.quantity * r.payrate) as amount, r.pr_paytype_id as ID      ' +
            '  from PR_CHECK_PAYTYPE r,                                                     ' +
            '       PR_PAYTYPE p,                                                           ' +
            '       PR_CHECK_HIST h,                                                        ' +
            '       CHEQUE c                                                                ' +
            ' where r.pr_check_hist_id(+) = h.id                                            ' +
            '   and h.cheque_id = c.id                                                      ' +
            '   and r.pr_paytype_id = p.id                                                  ' +
            '   and NVL(p.non_cash_benefit,''N'') = ''Y''                                   ' +
            '   and NVL(p.Exclude_W2_Other ,''N'') = ''N''                                  ' +
            '   and SubStr(NVL(c.check_status, ''    ''), 1, 4) <> ''VOID''                 ' +
            '   and To_Char(c.check_date, ''RRRR'') = To_Char(To_Date(''%s'', ''MM/DD/RRRR''), ''RRRR'') ' +
            '   and h.pr_emp_id = %f group by r.pr_paytype_id                                 ',
            [FormatDateTime('mm/dd/yyyy', tblHeader.FieldByName('PRW2_YEAR').asDateTime),
             tblDetail.FieldByName('PR_EMP_ID').asFloat]));
    Open;
    while not eof do
    begin
      AStr := IqFormat('%s - %f ', [SelectValueFmtAsString('select substr(description, 1, 5) from pr_paytype where id = %f',
                                 [FieldByName('id').asFloat]), FieldByname('amount').asFloat]) + AStr;
      Next;
    end;
  finally
    Free;
  end;
  ExecuteCommandFmt('update prw2_detail set box14 = ''%s'' where id = %f',
            [AStr,
             tblDetail.FieldByName('ID').asFloat]);
end;

procedure TFrmW2.AssignBox13_Reimb;
var
  AStr:String;
begin
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IQFormat('select sum(r.amount) as totalreimb, r.W2_CODE                                 ' +
            '  from PR_CHECK_PAYTYPE_REIMB r,                                                     ' +
            '       PR_CHECK_HIST h,                                                              ' +
            '       CHEQUE c                                                                     ' +
            ' where (r.w2_box = ''BOX 13'' or r.w2_box = ''BOX 12'')                              ' +
            '   and r.pr_check_hist_id(+) = h.id                                                  ' +
            '   and h.cheque_id = c.id                                                            ' +
            '   and SubStr(NVL(c.check_status, ''    ''), 1, 4) <> ''VOID''                         ' +
            '   and To_Char(c.check_date, ''RRRR'') = To_Char(To_Date(''%s'', ''MM/DD/RRRR''), ''RRRR'') ' +
            '   and h.pr_emp_id = %f group by r.W2_CODE                                 ',
            [FormatDateTime('mm/dd/yyyy', tblHeader.FieldByName('PRW2_YEAR').asDateTime),
             tblDetail.FieldByName('PR_EMP_ID').asFloat]));
    Open;
    while not eof do
    begin
      ExecuteCommandFmt('insert into PRW2_BOX13 (PRW2_DETAIL_ID, BOX13_C, BOX13_N) ' +
                'values (%f, ''%s'', %f)',
                [tblDetail.FieldByName('ID').asFloat, FieldByName('w2_code').asString, FieldByname('totalreimb').asFloat]);
      Next;
    end;
  finally
    Free;
  end;
end;


procedure TFrmW2.AssignBox13_HSA;
var
  AStr:String;
begin
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IQFormat('select sum(r.payrate * r.quantity) as total_sum, r.W2_CODE                                 ' +
            '  from PR_CHECK_PAYTYPE r,                                                     ' +
            '       PR_CHECK_HIST h,                                                              ' +
            '       CHEQUE c                                                                     ' +
            ' where r.w2_code is not null                                                           ' +
            '   and r.pr_check_hist_id(+) = h.id                                                  ' +
            '   and h.cheque_id = c.id                                                            ' +
            '   and SubStr(NVL(c.check_status, ''    ''), 1, 4) <> ''VOID''                         ' +
            '   and To_Char(c.check_date, ''RRRR'') = To_Char(To_Date(''%s'', ''MM/DD/RRRR''), ''RRRR'') ' +
            '   and h.pr_emp_id = %f group by r.W2_CODE                                 ',
            [FormatDateTime('mm/dd/yyyy', tblHeader.FieldByName('PRW2_YEAR').asDateTime),
             tblDetail.FieldByName('PR_EMP_ID').asFloat]));
    Open;
    while not eof do
    begin
      ExecuteCommandFmt('insert into PRW2_BOX13 (PRW2_DETAIL_ID, BOX13_C, BOX13_N) ' +
                'values (%f, ''%s'', %f)',
                [tblDetail.FieldByName('ID').asFloat, FieldByName('w2_code').asString, FieldByname('total_sum').asFloat]);
      Next;
    end;
  finally
    Free;
  end;
end;
procedure TFrmW2.tblHeaderCalcFields(DataSet: TDataSet);
begin
  if (SelectValueAsString('select NVL(separate_pr_ecompany, ''N'') from iqsys where rownum < 2') = 'Y') and  (tblHeaderEIN_ID.asFloat <> 0) then
    tblHeaderFedTaxId.asString := tblHeaderEin.asString
  else
    tblHeaderFedTaxId.asString := SelectValueAsString('select fed_id from iqsys where rownum < 2');
end;



procedure TFrmW2.UniFormCreate(Sender: TObject);
begin
  Grid13.ParentFont := True;
  CheckCustomSqlScript1Caption;
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [self]);
end;

procedure TFrmW2.WriteRA;
var
  ALine:String;
  ANotification:String;
begin
  FEIN := GetNumericCharactersOnly(tblDetail.FieldByName('EIN').asString);
  if
//   (Pos(Copy(FEIN, 1, 2),
//         '00_07_08_09_10_17_18_19_20_26_27_28_29_30_40_49_50_60_69_70_78_79_80_89_90') <> 0) or
      (Trim(FEIN) = '') then
    raise Exception.Create ('Company EIN is blank, cannot continue');
  ALine := 'RA' +
           PadR(FEIN, 9) +
           PadR(Trim(tblHeaderPIN.AsString), 17);
  if Trim(tblHeaderTLCN.AsString) = '' then
    ALine := ALine + '0      '
  else
    ALine := ALine + '1' + PadR(Trim(tblHeaderTLCN.AsString), 6);
  ALine := ALine + '99' +
           PadR(Trim(tblDetail.FieldByName('EMPLOYERS_NAME').asString), 57) +
           PadR(Trim(tblDetail.FieldByName('EMPLOYERS_ADDR1').asString), 22) +
           PadR(Trim(tblDetail.FieldByName('EMPLOYERS_ADDR2').asString), 22) +
           Padr(FEmpCity, 22) +
           Padr(FEmpState, 2) +
           Padr(FEmpZip2,  5) +
           Padr(FEmpZip1,  4) +
           '     ';
  if EmployersForeignAddressIndicator = 'X' then  //Foreign
    ALine := ALine + Padr(FEmpCity, 23) +
             PadR(FEmpZip1 + FEmpZip2, 15) +
             Copy(SelectValueAsString('select NVL(country, ''  '') from iqsys where rownum < 2'), 1, 2)
  else
    ALine := ALine + Space( 23) + Space(15) + Space(2);

  ALine := ALine +
           PadR(Trim(tblDetail.FieldByName('EMPLOYERS_NAME').asString), 57) +
           PadR(Trim(tblDetail.FieldByName('EMPLOYERS_ADDR1').asString), 22) +
           PadR(Trim(tblDetail.FieldByName('EMPLOYERS_ADDR2').asString), 22) +
           Padr(FEmpCity, 22) +
           Padr(FEmpState, 2) +
           Padr(FEmpZip2,  5) +
           Padr(FEmpZip1,  4) +
           '     ';
  if EmployersForeignAddressIndicator = 'X' then  //Foreign
    ALine := ALine + Padr(FEmpCity, 23) +
             PadR(FEmpZip1 + FEmpZip2, 15) +
             Copy(SelectValueAsString('select NVL(country, ''  '') from iqsys where rownum < 2'), 1, 2)
  else
    ALine := ALine + Space(23) + Space(15) + Space(2);

  if Trim(tblHeaderNOTIFICATION.AsString) = '' then
    ANotification := '1'
  else
    ANotification := Trim(tblHeaderNOTIFICATION.AsString);

  ALine := ALine + PadR(Trim(tblHeaderNAME.asString), 27) +
           PadR(Trim(tblHeaderPHONE.asString), 15) +
           PadR(Trim(tblHeaderPHONE_EXT.AsString), 5) +
           Space(3) +
           PadR(Trim(tblHeaderEMAIL.AsString), 40) +
           Space(3) +
           Padr(SelectValueAsString('select fax from iqsys where rownum < 2'), 10) +
           PadR(ANotification, 1) +
           'L' +
           Space(12);

  Writeln(FTextFile, UpperCase(ALine));
end;

procedure TFrmW2.WriteRE;
var
  ALine:String;
begin
  ALine := 'RE' +
           PadR(Trim(tblHeaderPRW2_YEAR_STRING.asString), 4) + ' ' +
           PadR(FEIN, 9) +
           Space(9) + '0' +
           Space(4) +
           Space(9) +
           PadR(Trim(tblDetail.FieldByName('EMPLOYERS_NAME').asString), 57) +
           PadR(Trim(tblDetail.FieldByName('EMPLOYERS_ADDR1').asString), 22) +
           PadR(Trim(tblDetail.FieldByName('EMPLOYERS_ADDR2').asString), 22) +
           Padr(FEmpCity, 22) +
           Padr(FEmpState, 2) +
           Padr(FEmpZip2,  5) +
           Padr(FEmpZip1,  4) +
           Space(5);
  if EmployersForeignAddressIndicator = 'X' then  //Foreign
    ALine := ALine + Padr(FEmpCity, 23) +
             PadR(FEmpZip1 + FEmpZip2, 15) +
             Copy(SelectValueAsString('select NVL(country, ''  '') from iqsys where rownum < 2'), 1, 2)
  else
    ALine := ALine + Space(23) + Space(15) + Space(2);

  ALine := ALine + 'R' + ' ' + '0' + Space(291);


  Writeln(FTextFile, UpperCase(ALine));
end;

procedure TFrmW2.WriteRW;
var
  ALine:String;
  ABox13:Real;
  APensionPlan:String;
  ASickPay:String;
  ABox13Value, ATotDeferred:Real;

  A_Box13_D :Real;
  A_Box13_E :Real;
  A_Box13_F :Real;
  A_Box13_G :Real;
  A_Box13_H :Real;
  A_Box13_C :Real;
  A_Box13_V :Real;
  A_Box13_W :Real;
  A_Box13_A :Real;
  A_Box13_R :Real;
  A_Box13_S :Real;
  A_Box13_T :Real;
  A_Box13_M :Real;
  A_Box13_N :Real;
  A_Box13_Q :Real;
  A_Box13_Y :Real;
  A_Box13_Z :Real;
  A_Box13_CC :Real;
  A_Box13_AA :Real;
  A_Box13_BB :Real;

begin
  GetEmployeesAddress;
  if FIds.IndexOf(tblDetail.FieldByname('PR_EMP_ID').asString) < 0 then
   begin
  Inc(FRecords);
  ALine := 'RW' +
           FSSN +
           Padr(Trim(tblDetailFIRST_NAME.asString), 15) +
           Padr(Trim(tblDetailMIDDLE_INIT.asString), 15) +
           Padr(Trim(tblDetailLAST_NAME.asString), 20) +
           Padr(Trim(tblDetailSUFFIX.asString), 4) +
//           Space(4) +
           PadR(Trim(tblDetailEMP_ADDR1.asString), 22) +
           Padr(Trim(tblDetailEMP_ADDR2.asString), 22) +
           Padr(FEmployeeCity, 22) +
           Padr(FEmployeeState, 2) +
           Padr(FEmployeeZip2, 5) +
           Padr(FEmployeeZip1, 4) +
           Space(5);
  if EmployeesForeignAddressIndicator(tblDetailPR_EMP_ID.asFloat) = 'X' then
    ALine := ALine + Padr(Trim(FEmployeeCountry), 23) +
                     Padr(Trim(FEmployeeZip), 15) +
                     Padr(Trim(FEmployeeCountry), 2)
  else
    ALine := ALine + Space(23) + Space(15) + Space(2);

  with tblDetail do
  begin
    ALine := ALine + W2Money(FieldByName('BOX1').asFloat,  11) +
                     W2Money(FieldByName('BOX2').asFloat,  11) +
                     W2Money(FieldByName('BOX3').asFloat,  11) +
                     W2Money(FieldByName('BOX4').asFloat,  11) +
                     W2Money(FieldByName('BOX5').asFloat,  11) +
                     W2Money(FieldByName('BOX6').asFloat,  11) +
                     W2Money(FieldByName('BOX7').asFloat,  11) +
                     W2Money(FieldByName('BOX9').asFloat,  11) +
                     W2Money(FieldByName('BOX10').asFloat, 11);
    ABox13 := SelectValueFmtAsFloat('select box13_n from prw2_box13 where prw2_detail_id = %f and box13_c = ''D''',
                        [FieldByName('ID').asFloat]);
    ALine := ALine + W2Money(ABox13, 11);
    ABox13 := SelectValueFmtAsFloat('select box13_n from prw2_box13 where prw2_detail_id = %f and box13_c = ''E''',
                        [FieldByName('ID').asFloat]);
    ALine := ALine + W2Money(ABox13, 11);
    ABox13 := SelectValueFmtAsFloat('select box13_n from prw2_box13 where prw2_detail_id = %f and box13_c = ''F''',
                        [FieldByName('ID').asFloat]);
    ALine := ALine + W2Money(ABox13, 11);
    ABox13 := SelectValueFmtAsFloat('select box13_n from prw2_box13 where prw2_detail_id = %f and box13_c = ''G''',
                        [FieldByName('ID').asFloat]);
    ALine := ALine + W2Money(ABox13, 11);
    ABox13 := SelectValueFmtAsFloat('select box13_n from prw2_box13 where prw2_detail_id = %f and box13_c = ''H''',
                        [FieldByName('ID').asFloat]);
    ALine := ALine + W2Money(ABox13, 11);
    ALine := ALine + '00000000000' +
                     W2Money(FieldByName('BOX11').asFloat, 11);
                     // +
                     //'00000000000';
    ABox13 := SelectValueFmtAsFloat('select box13_n from prw2_box13 where prw2_detail_id = %f and box13_c = ''W''',
                        [FieldByName('ID').asFloat]);
    ALine := ALine + W2Money(ABox13, 11);
    ABox13 := SelectValueFmtAsFloat('select box13_n from prw2_box13 where prw2_detail_id = %f and box13_c = ''G''',
                        [FieldByName('ID').asFloat]);

    ALine := ALine + W2Money(FieldByName('BOX11').asFloat - ABox13, 11);
    ABox13 := SelectValueFmtAsFloat('select box13_n from prw2_box13 where prw2_detail_id = %f and box13_c = ''Q''',
                        [FieldByName('ID').asFloat]);
    ALine := ALine + W2Money(ABox13, 11) + Space(11);
    ABox13 := SelectValueFmtAsFloat('select box13_n from prw2_box13 where prw2_detail_id = %f and box13_c = ''C''',
                        [FieldByName('ID').asFloat]);
    ALine := ALine + W2Money(ABox13, 11);
    ABox13 := SelectValueFmtAsFloat('select box13_n from prw2_box13 where prw2_detail_id = %f and box13_c = ''V''',
                        [FieldByName('ID').asFloat]);
    ALine := ALine + W2Money(ABox13, 11);
     ABox13 := SelectValueFmtAsFloat('select box13_n from prw2_box13 where prw2_detail_id = %f and box13_c = ''Y''',
                        [FieldByName('ID').asFloat]);
    ALine := ALine + W2Money(ABox13, 11);
    ABox13 := SelectValueFmtAsFloat('select box13_n from prw2_box13 where prw2_detail_id = %f and box13_c = ''AA''',
                        [FieldByName('ID').asFloat]);
    ALine := ALine + W2Money(ABox13, 11);
    ABox13 := SelectValueFmtAsFloat('select box13_n from prw2_box13 where prw2_detail_id = %f and box13_c = ''BB''',
                        [FieldByName('ID').asFloat]);
    ALine := ALine + W2Money(ABox13, 11);
    if FieldByName('BOX15B').AsString = 'Y' then
      APensionPlan := '1'
    else
      APensionPlan := '0';

    if FieldByName('BOX15C').AsString = 'Y' then
      ASickPay := '1'
    else
      ASickPay := '0';

    ALine := ALine +
             Space(23) +
             FStatutoryEmployee +
             ' ' +
             APensionPlan +
             ASickPay +
             Space(23);

    ABox13Value := SelectValueFmtAsFloat('select Sum(BOX13_N) from PRW2_BOX13 where BOX13_C = ''C'' and PRW2_DETAIL_ID = %f', [FieldByName('ID').asFloat]);

    A_Box13_D := SelectValueFmtAsFloat('select Sum(BOX13_N) from PRW2_BOX13 where BOX13_C = ''D'' and PRW2_DETAIL_ID = %f', [FieldByName('ID').asFloat]);
    A_Box13_E := SelectValueFmtAsFloat('select Sum(BOX13_N) from PRW2_BOX13 where BOX13_C = ''E'' and PRW2_DETAIL_ID = %f', [FieldByName('ID').asFloat]);
    A_Box13_F := SelectValueFmtAsFloat('select Sum(BOX13_N) from PRW2_BOX13 where BOX13_C = ''F'' and PRW2_DETAIL_ID = %f', [FieldByName('ID').asFloat]);
    A_Box13_G := SelectValueFmtAsFloat('select Sum(BOX13_N) from PRW2_BOX13 where BOX13_C = ''G'' and PRW2_DETAIL_ID = %f', [FieldByName('ID').asFloat]);
    A_Box13_H := SelectValueFmtAsFloat('select Sum(BOX13_N) from PRW2_BOX13 where BOX13_C = ''H'' and PRW2_DETAIL_ID = %f', [FieldByName('ID').asFloat]);
    A_Box13_C := SelectValueFmtAsFloat('select Sum(BOX13_N) from PRW2_BOX13 where BOX13_C = ''C'' and PRW2_DETAIL_ID = %f', [FieldByName('ID').asFloat]);
    A_Box13_V := SelectValueFmtAsFloat('select Sum(BOX13_N) from PRW2_BOX13 where BOX13_C = ''V'' and PRW2_DETAIL_ID = %f', [FieldByName('ID').asFloat]);
    A_Box13_W := SelectValueFmtAsFloat('select Sum(BOX13_N) from PRW2_BOX13 where BOX13_C = ''W'' and PRW2_DETAIL_ID = %f', [FieldByName('ID').asFloat]);
    A_Box13_A := SelectValueFmtAsFloat('select Sum(BOX13_N) from PRW2_BOX13 where BOX13_C = ''A'' and PRW2_DETAIL_ID = %f', [FieldByName('ID').asFloat]);
    A_Box13_R := SelectValueFmtAsFloat('select Sum(BOX13_N) from PRW2_BOX13 where BOX13_C = ''R'' and PRW2_DETAIL_ID = %f', [FieldByName('ID').asFloat]);
    A_Box13_S := SelectValueFmtAsFloat('select Sum(BOX13_N) from PRW2_BOX13 where BOX13_C = ''S'' and PRW2_DETAIL_ID = %f', [FieldByName('ID').asFloat]);
    A_Box13_T := SelectValueFmtAsFloat('select Sum(BOX13_N) from PRW2_BOX13 where BOX13_C = ''T'' and PRW2_DETAIL_ID = %f', [FieldByName('ID').asFloat]);
    A_Box13_M := SelectValueFmtAsFloat('select Sum(BOX13_N) from PRW2_BOX13 where BOX13_C = ''M'' and PRW2_DETAIL_ID = %f', [FieldByName('ID').asFloat]);
    A_Box13_N := SelectValueFmtAsFloat('select Sum(BOX13_N) from PRW2_BOX13 where BOX13_C = ''N'' and PRW2_DETAIL_ID = %f', [FieldByName('ID').asFloat]);
    A_Box13_Q := SelectValueFmtAsFloat('select Sum(BOX13_N) from PRW2_BOX13 where BOX13_C = ''Q'' and PRW2_DETAIL_ID = %f', [FieldByName('ID').asFloat]);
    A_Box13_Y := SelectValueFmtAsFloat('select Sum(BOX13_N) from PRW2_BOX13 where BOX13_C = ''Y'' and PRW2_DETAIL_ID = %f', [FieldByName('ID').asFloat]);
    A_Box13_Z := SelectValueFmtAsFloat('select Sum(BOX13_N) from PRW2_BOX13 where BOX13_C = ''Z'' and PRW2_DETAIL_ID = %f', [FieldByName('ID').asFloat]);
    A_Box13_CC := SelectValueFmtAsFloat('select Sum(BOX13_N) from PRW2_BOX13 where BOX13_C = ''CC'' and PRW2_DETAIL_ID = %f', [FieldByName('ID').asFloat]);
    A_Box13_AA := SelectValueFmtAsFloat('select Sum(BOX13_N) from PRW2_BOX13 where BOX13_C = ''AA'' and PRW2_DETAIL_ID = %f', [FieldByName('ID').asFloat]);
    A_Box13_BB := SelectValueFmtAsFloat('select Sum(BOX13_N) from PRW2_BOX13 where BOX13_C = ''BB'' and PRW2_DETAIL_ID = %f', [FieldByName('ID').asFloat]);
    ATotDeferred :=  SelectValueFmtAsFloat('select Sum(BOX13_N) from PRW2_BOX13 where (BOX13_C = ''D'' or ' +
                                                                          'BOX13_C = ''E'' or ' +
                                                                          'BOX13_C = ''F'' or ' +
                                                                          'BOX13_C = ''G'' or ' +
                                                                          'BOX13_C = ''H'' or ' +
                                                                          'BOX13_C = ''W'') '   +
                                                                          'and PRW2_DETAIL_ID = %f',
                             [FieldByName('ID').asFloat]);


    if FIds.IndexOf(tblDetail.FieldByname('PR_EMP_ID').asString) < 0 then
    begin
      FA_GROSS    := FA_Gross    + FieldByName('BOX1').asFloat;
      FA_SSwages  := FA_SSwages  + FieldByName('BOX3').asFloat;
      FA_FEDwh    := FA_Fedwh    + FieldByName('BOX2').asFloat;
      FA_SStax    := FA_SStax    + FieldByName('BOX4').asFloat;
      FA_MCwages  := FA_MCwages  + FieldByName('BOX5').asFloat;
      FA_MCtax    := FA_MCtax    + FieldByName('BOX6').asFloat;
      FA_CodeC    := FA_CodeC    + ABox13Value;
      FA_deferred := FA_deferred + ATotDeferred;
      FA_Box12    := FA_Box12    + FieldByName('BOX12').asFloat;
      FA_depcare  := FA_depcare  + FieldByName('BOX10').asFloat;
      FA_nonqual  := FA_nonqual  + FieldByName('BOX11').asFloat;
      FA_eic      := FA_eic      + FieldByName('BOX9').asFloat;

      FA_Box13_D  := FA_Box13_D + A_Box13_D;
      FA_Box13_E  := FA_Box13_E + A_Box13_E;
      FA_Box13_F  := FA_Box13_F + A_Box13_F;
      FA_Box13_G  := FA_Box13_G + A_Box13_G;
      FA_Box13_H  := FA_Box13_H + A_Box13_H;
      FA_Box13_C  := FA_Box13_C + A_Box13_C;
      FA_Box13_V  := FA_Box13_V + A_Box13_V;
      FA_Box13_W  := FA_Box13_W + A_Box13_W;
      FA_Box13_A  := FA_Box13_A + A_Box13_A;
      FA_Box13_R  := FA_Box13_R + A_Box13_R;
      FA_Box13_S  := FA_Box13_S + A_Box13_S;
      FA_Box13_T  := FA_Box13_T + A_Box13_T;
      FA_Box13_M  := FA_Box13_M + A_Box13_M;
      FA_Box13_N  := FA_Box13_N + A_Box13_N;
      FA_Box13_Q  := FA_Box13_Q + A_Box13_Q;
      FA_Box13_Y  := FA_Box13_Y + A_Box13_Y;
      FA_Box13_Z  := FA_Box13_Z + A_Box13_Z;
      FA_Box13_CC := FA_Box13_CC + A_Box13_CC;
      FA_Box13_AA := FA_Box13_AA + A_Box13_AA;
      FA_Box13_BB := FA_Box13_BB + A_Box13_BB;

      FS_GROSS    := FS_Gross    + FieldByName('BOX1').asFloat;     // sum to Sub 41 totals
      FS_SSwages  := FS_SSwages  + FieldByName('BOX3').asFloat;
      FS_FEDwh    := FS_Fedwh    + FieldByName('BOX2').asFloat;
      FS_SStax    := FS_SStax    + FieldByName('BOX4').asFloat;
      FS_MCwages  := FS_MCwages  + FieldByName('BOX5').asFloat;
      FS_MCtax    := FS_MCtax    + FieldByName('BOX6').asFloat;
      FS_CodeC    := FS_CodeC    + ABox13Value;
      FS_deferred := FS_deferred + ATotDeferred;
      FS_Box12    := FS_Box12    + FieldByName('BOX12').asFloat;
      FS_depcare  := FS_depcare  + FieldByName('BOX10').asFloat;
      FS_nonqual  := FS_nonqual  + FieldByName('BOX11').asFloat;
      FS_eic      := FS_eic      + FieldByName('BOX9').asFloat;
      FIds.Add(tblDetail.FieldByname('PR_EMP_ID').asString);
    end;


  end;
  Writeln(FTextFile, UpperCase(ALine));

  end;

end;

procedure TFrmW2.WriteRO;
var
  ALine:String;
  ABox13:Real;
  ASum:Real;
begin
  with tblDetail do
  begin
    ASum := 0;
    ALine := 'RO' +
             Space(9) +
             W2Money(FieldByName('BOX8').asFloat, 11);
    ABox13 := SelectValueFmtAsFloat('select box13_n from prw2_box13 where prw2_detail_id = %f and box13_c = ''A''',
                        [FieldByName('ID').asFloat]);
    ASum := ASum + ABox13;
    ALine := ALine + W2Money(ABox13, 11);
    ABox13 := SelectValueFmtAsFloat('select box13_n from prw2_box13 where prw2_detail_id = %f and box13_c = ''R''',
                        [FieldByName('ID').asFloat]);
    ASum := ASum + ABox13;
    ALine := ALine + W2Money(ABox13, 11);
    ABox13 := SelectValueFmtAsFloat('select box13_n from prw2_box13 where prw2_detail_id = %f and box13_c = ''S''',
                        [FieldByName('ID').asFloat]);
    ASum := ASum + ABox13;
    ALine := ALine + W2Money(ABox13, 11);
    ABox13 := SelectValueFmtAsFloat('select box13_n from prw2_box13 where prw2_detail_id = %f and box13_c = ''T''',
                        [FieldByName('ID').asFloat]);
    ASum := ASum + ABox13;
    ALine := ALine + W2Money(ABox13, 11);
    ABox13 := SelectValueFmtAsFloat('select box13_n from prw2_box13 where prw2_detail_id = %f and box13_c = ''M''',
                        [FieldByName('ID').asFloat]);
    ASum := ASum + ABox13;
    ALine := ALine + W2Money(ABox13, 11);
    ABox13 := SelectValueFmtAsFloat('select box13_n from prw2_box13 where prw2_detail_id = %f and box13_c = ''N''',
                        [FieldByName('ID').asFloat]);
    ASum := ASum + ABox13;
    ALine := ALine + W2Money(ABox13, 11);
    ABox13 := SelectValueFmtAsFloat('select box13_n from prw2_box13 where prw2_detail_id = %f and box13_c = ''Z''',
                        [FieldByName('ID').asFloat]);
    ASum := ASum + ABox13;
    ALine := ALine + W2Money(ABox13, 11);
    ABox13 := SelectValueFmtAsFloat('select box13_n from prw2_box13 where prw2_detail_id = %f and box13_c = ''CC''',
                        [FieldByName('ID').asFloat]);
    ASum := ASum + ABox13;
    ALine := ALine + W2Money(ABox13, 11);



    ALine := ALine + Space(164) +
//                     Space(1) +
//                     Space(9) +
                     '00000000000' +
                     '00000000000' +
                     '00000000000' +
                     '00000000000' +
                     '00000000000' +
                     '00000000000' +
                     '00000000000' +
                     Space(11) +
                     '00000000000' +
                     '00000000000' +
                     Space(128);
   end;
   if ASum > 0.001 then
   begin
     Writeln(FTextFile, UpperCase(ALine));
     Inc(FRo);
   end;
end;

procedure TFrmW2.WriteRS;
var
  ALine:String;
  AStLine:String;
  AStateCode:String;
  ADateHired:String;
  ADateTerminated:String;
  ATotalPay:Real;
  ACode:String;
  ASchoolDistrict:String;
  ATaxingEntity:String;
begin
  if tblHeaderINCL_STATE_RS.asString <> 'Y' then Exit;
  if FRSState <> '' then
    if Trim(tblDetail.FieldByName('Box16_State').AsString) <> Trim(FRSState) then Exit;

  ALine := 'RS';
  ATaxingEntity := '     ';
  with tblDetail do
  begin


     if Trim(FieldByName('Box16_State').AsString) = 'AL' then AStateCode := '01'
      else if Trim(FieldByName('Box16_State').AsString) = 'AZ' then AStateCode := '04'
        else if Trim(FieldByName('Box16_State').AsString) = 'AR' then AStateCode := '05'
 else if Trim(FieldByName('Box16_State').AsString) = 'CA' then AStateCode := '06'
 else if Trim(FieldByName('Box16_State').AsString) = 'CO' then AStateCode := '08'
 else if Trim(FieldByName('Box16_State').AsString) = 'CT' then AStateCode := '09'
 else if Trim(FieldByName('Box16_State').AsString) = 'DE' then AStateCode := '10'
 else if Trim(FieldByName('Box16_State').AsString) = 'FL' then AStateCode := '12'
 else if Trim(FieldByName('Box16_State').AsString) = 'GA' then AStateCode := '13'
 else if Trim(FieldByName('Box16_State').AsString) = 'ID' then AStateCode := '16'
 else if Trim(FieldByName('Box16_State').AsString) = 'IL' then AStateCode := '17'
 else if Trim(FieldByName('Box16_State').AsString) = 'IN' then AStateCode := '18'
 else if Trim(FieldByName('Box16_State').AsString) = 'IA' then AStateCode := '19'
 else if Trim(FieldByName('Box16_State').AsString) = 'KS' then AStateCode := '20'
 else if Trim(FieldByName('Box16_State').AsString) = 'KY' then AStateCode := '21'
 else if Trim(FieldByName('Box16_State').AsString) = 'LA' then AStateCode := '22'
 else if Trim(FieldByName('Box16_State').AsString) = 'ME' then AStateCode := '23'
 else if Trim(FieldByName('Box16_State').AsString) = 'MD' then AStateCode := '24'
 else if Trim(FieldByName('Box16_State').AsString) = 'MA' then AStateCode := '25'
 else if Trim(FieldByName('Box16_State').AsString) = 'MI' then AStateCode := '26'
 else if Trim(FieldByName('Box16_State').AsString) = 'MN' then AStateCode := '27'
 else if Trim(FieldByName('Box16_State').AsString) = 'MS' then AStateCode := '28'
 else if Trim(FieldByName('Box16_State').AsString) = 'MO' then AStateCode := '29'
 else if Trim(FieldByName('Box16_State').AsString) = 'MT' then AStateCode := '30'
 else if Trim(FieldByName('Box16_State').AsString) = 'NE' then AStateCode := '31'
 else if Trim(FieldByName('Box16_State').AsString) = 'NV' then AStateCode := '32'
 else if Trim(FieldByName('Box16_State').AsString) = 'NH' then AStateCode := '33'
 else if Trim(FieldByName('Box16_State').AsString) = 'NJ' then AStateCode := '34'
 else if Trim(FieldByName('Box16_State').AsString) = 'NM' then AStateCode := '35'
 else if Trim(FieldByName('Box16_State').AsString) = 'NY' then AStateCode := '36'
 else if Trim(FieldByName('Box16_State').AsString) = 'NC' then AStateCode := '37'
 else if Trim(FieldByName('Box16_State').AsString) = 'ND' then AStateCode := '38'
 else if Trim(FieldByName('Box16_State').AsString) = 'OH' then AStateCode := '39'
 else if Trim(FieldByName('Box16_State').AsString) = 'OK' then AStateCode := '40'
 else if Trim(FieldByName('Box16_State').AsString) = 'OR' then AStateCode := '41'
 else if Trim(FieldByName('Box16_State').AsString) = 'PA' then AStateCode := '42'
 else if Trim(FieldByName('Box16_State').AsString) = 'SC' then AStateCode := '45'
 else if Trim(FieldByName('Box16_State').AsString) = 'SD' then AStateCode := '46'
 else if Trim(FieldByName('Box16_State').AsString) = 'TN' then AStateCode := '47'
 else if Trim(FieldByName('Box16_State').AsString) = 'TX' then AStateCode := '48'
 else if Trim(FieldByName('Box16_State').AsString) = 'UT' then AStateCode := '49'
 else if Trim(FieldByName('Box16_State').AsString) = 'VT' then AStateCode := '50'
 else if Trim(FieldByName('Box16_State').AsString) = 'VA' then AStateCode := '51'
 else if Trim(FieldByName('Box16_State').AsString) = 'WA' then AStateCode := '53'
 else if Trim(FieldByName('Box16_State').AsString) = 'WV' then AStateCode := '54'
 else if Trim(FieldByName('Box16_State').AsString) = 'WI' then AStateCode := '55'
 else if Trim(FieldByName('Box16_State').AsString) = 'WY' then AStateCode := '56'
 else AStateCode := Trim(FieldByName('Box16_State').AsString);

   ALine := ALine + AStateCode + ATaxingEntity ;

  //   begin
  //    ALine := ALine + Padr(Trim(FieldByName('Box16_State').AsString), 2) +
  //                   Padr(Trim(FieldByName('Box16_ID').AsString), 5);
  //    AStateCode :=  FieldByName('Box16_State').AsString;
  //   end;

    ALine := Aline +
             FSSN +
             Padr(Trim(tblDetailFIRST_NAME.asString), 15) +
             Padr(Trim(tblDetailMIDDLE_INIT.asString), 15) +
             Padr(Trim(tblDetailLAST_NAME.asString), 20) +
             Space(4) +
             PadR(Trim(tblDetailEMP_ADDR1.asString), 22) +
             Padr(Trim(tblDetailEMP_ADDR2.asString), 22) +
             Padr(FEmployeeCity, 22) +
             Padr(FEmployeeState, 2) +
             Padr(FEmployeeZip2, 5) +
             Padr(FEmployeeZip1, 4) +
             Space(5);
    if ForeignEmployee then
      ALine := ALine + Padr(Trim(FEmployeeCountry), 23) +
                       Padr(Trim(FEmployeeZip), 15) +
                       Padr(Trim(FEmployeeCountry), 2)
    else
      ALine := ALine + Space(23) + Space(15) + Space(2);

    ALine := ALine + Space(2) +
                     '12' + tblHeaderPRW2_YEAR_STRING.asString +
                     '00000000000' +
                     '00000000000' +
                     Space(2);

  ADateTerminated := SelectValueFmtAsString('select NVL(To_Char(termination_date, ''MMDDRRRR''), ''        '') from pr_emp where id = %f',
                     [tblDetailPR_EMP_ID.asFloat]);

   ADateHired := SelectValueFmtAsString('select NVL(To_Char(date_hired, ''MMDDRRRR''), ''        '') from pr_emp where id = %f',
                 [tblDetailPR_EMP_ID.asFloat]);


    ALine := ALine + ADateHired +
                     ADateTerminated +
                     Space(5) +
                     Padr(Trim(FieldByName('Box16_ID').AsString), 20) +
                     Space(6) +
                     Padr(trim(AStateCode),2);
   //                  Padr(Trim(FieldByName('Box16_State').AsString), 2);

     AStLine :=      W2Money(FieldByName('BOX17').asFloat, 11) +
                     W2Money(FieldByName('BOX18').asFloat, 11) +
                     Space(10) +
                     Space(1) +
                     Space(11) +
                     Space(11) +
                     Space(7) +
                     Space(75) +
                     Space(75) +
                     Space(25);
    if FEmployeeState = 'MI' then
      begin
          AstLine := W2Money(FieldByName('BOX17').asFloat, 11) +
                     W2Money(FieldByName('BOX18').asFloat, 11) +
                     Padr(Trim(FieldByName('Box19').AsString), 10) +
                     'C' +
                     W2Money(FieldByName('BOX20').asFloat, 11) +
                     W2Money(FieldByName('BOX21').asFloat, 11) +
                     Space(7) +
                     Space(75) +
                     Space(75) +
                     Space(25);
      end;
    if FEmployeeState = 'OH' then
      begin
 //      ATotalPay := SelectValueFmtAsFloat('select totalpay from v_emp_w2_report where pr_emp_id = %f', [tblDetailPR_EMP_ID.asFloat]);
       ATotalPay := FieldByName('BOX1').asFloat;
       ACode := SelectValueFmtAsString('select decode(substr(description,1,2),''C-'',''C'',''D-'',''D'',''SD'',''E'',''F'') from pr_tax where tax_code = ''%s''',
       [tblDetailBOX19.asString]);
       if Acode = 'E' then
        ASchoolDistrict := SelectValueFmtAsString('select substr(description,instr(description,''#'')+1,4) from pr_tax where tax_code = ''%s''',  [tblDetailBOX19.asString])
       else
        ASchoolDistrict := space(4);

       if FSTIds.IndexOf(tblDetail.FieldByname('PR_EMP_ID').asString + tblDetail.FieldByname('Box16_State').AsString) < 0 then
        AStLine := W2Money(FieldByName('BOX17').asFloat, 11) +
                    W2Money(FieldByName('BOX18').asFloat, 11) +
                    W2Money(ATotalPay, 10)
        else
           AStLine := '00000000000' +
                   '00000000000' +
                   '0000000000';


        AStLine := AStLine +
                     Acode +
                     W2Money(FieldByName('BOX20').asFloat, 11) +
                     W2Money(FieldByName('BOX21').asFloat, 11) +
                     Space(3) + ASchoolDistrict+
                     Space(75) +
                     Space(75) +
                     Space(25);
      end;
    ALine := ALine + AStLine;
    FSTIds.Add(tblDetail.FieldByname('PR_EMP_ID').asString + tblDetail.FieldByname('Box16_State').asString);
  end;


  Writeln(FTextFile, UpperCase(ALine));

end;

procedure TFrmW2.WriteRT;
var
  ALine:String;
begin
  ALine := 'RT' +
            StrTran(Format('%7s', [IntToStr(FRecords)]), ' ', '0') +
           W2Money(FA_GROSS,   15) +
           W2Money(FA_FedWh,   15) +
           W2Money(FA_SSwages, 15) +
           W2Money(FA_SStax,   15) +
           W2Money(FA_MCwages, 15) +
           W2Money(FA_MCtax,   15) +
           '000000000000000' +              // SS tips
           W2Money(FA_eic,     15) +
           W2Money(FA_depcare, 15) +
           W2Money(FA_Box13_D, 15) +
           W2Money(FA_Box13_E, 15) +
           W2Money(FA_Box13_F, 15) +
           W2Money(FA_Box13_G, 15) +
           W2Money(FA_Box13_H, 15) +
           '000000000000000' +
           W2Money(FA_nonqual, 15) +
 //          '000000000000000' +
           W2Money(FA_Box13_W, 15) +
           W2Money(FA_nonqual - FA_Box13_G, 15) +
           W2Money(FA_Box13_Q, 15) +
           '000000000000000' +
           W2Money(FA_Box13_C, 15) +
           '000000000000000' +
           W2Money(FA_Box13_V, 15) +
           W2Money(FA_Box13_Y, 15) +
           W2Money(FA_Box13_AA, 15) +
           W2Money(FA_Box13_BB, 15) +
           Space(113);
  Writeln(FTextFile, UpperCase(ALine));
end;

procedure TFrmW2.WriteRU;
var
  ALine:String;
begin
  ALine := 'RU' +
            StrTran(Format('%7s', [IntToStr(FRo)]), ' ', '0') +
            W2Money(F_BOX8, 15) +
            W2Money(FA_Box13_A, 15) +
            W2Money(FA_Box13_R, 15) +
            W2Money(FA_Box13_S, 15) +
            W2Money(FA_Box13_T, 15) +
            W2Money(FA_Box13_M, 15) +
            W2Money(FA_Box13_N, 15) +
            W2Money(FA_Box13_Z, 15) +
            W2Money(FA_Box13_CC, 15) +
            Space(210) +
            '000000000000000' +
            '000000000000000' +
            '000000000000000' +
            '000000000000000' +
            '000000000000000' +
            '000000000000000' +
            '000000000000000' +
            '000000000000000' +
            '000000000000000' +
            Space(23);
  Writeln(FTextFile, UpperCase(ALine));
end;

procedure TFrmW2.WriteRF;
var
  ALine:String;
begin
  ALine := 'RF' +
            Space(5) +
            StrTran(Format('%9s', [IntToStr(FRecords)]), ' ', '0') +
            Space(496);
  Writeln(FTextFile, UpperCase(ALine));
end;


procedure TFrmW2.CheckCustomSqlScript1Caption;
begin
  if FW2Script <> '' then
  begin
    CustomSqlScript1.Caption := Format('Custom Sql Script (%s)', [FW2Script]);
    ClearCustomSqlScript1.Visible := true;
  end
  else
  begin
    CustomSqlScript1.Caption := 'Custom Sql Script (Not specified, using default)';
    ClearCustomSqlScript1.Visible := false;
  end;
end;



procedure TFrmW2.CustomSqlScript1Click(Sender: TObject);
begin
  if FW2Script <> '' then
    OpenDialogScript.FileName := FW2Script;

  if OpenDialogScript.Execute then
  begin
    FW2Script := OpenDialogScript.FileName;
    ExecuteCommandFmt('update iqsys set PRW2_SQL_SCRIP_FILE = ''%s''', [FW2Script]);
  end;
  CheckCustomSqlScript1Caption;
end;

procedure TFrmW2.ClearCustomSqlScript1Click(Sender: TObject);
begin
  ExecuteCommand('update iqsys set PRW2_SQL_SCRIP_FILE = null');
  FW2Script := '';
  CheckCustomSqlScript1Caption;
end;

procedure TFrmW2.CreateCustomSQL;
begin
  DoPRW2Custom(tblHeaderID.asfloat, FW2Script, FW2File, FRSState); {in PRW2Custom.pas}
end;


procedure TFrmW2.PkRSStateBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'AID', tblHeaderID.asFloat);
//  TFDQuery(Dataset).ParamByName('AID').Value := tblHeaderID.asFloat;
end;

procedure TFrmW2.QuickAddEditBenefit1Click(Sender: TObject);
begin
  DoQuickAddBenefit; {PrEmplBenefits.pas}
end;

procedure TFrmW2.AssignBox13_Deduction;
begin

  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IQFormat('select sum(NVL(r.employer_amount, 0)) as employer_amount, r.ACA_W2_CODE    ' +
            '  from PR_CHECK_DEDUCTIONS r,                                                       ' +
            '       PR_CHECK_HIST h,                                                             ' +
            '       CHEQUE c                                                                     ' +
            ' where r.ACA_W2_CODE is not null                                                    ' +
            '   and r.pr_check_hist_id(+) = h.id                                                 ' +
            '   and h.cheque_id = c.id                                                            ' +
            '   and SubStr(NVL(c.check_status, ''    ''), 1, 4) <> ''VOID''                         ' +
            '   and To_Char(c.check_date, ''RRRR'') = To_Char(To_Date(''%s'', ''MM/DD/RRRR''), ''RRRR'') ' +
            '   and h.pr_emp_id = %f group by r.ACA_W2_CODE                                      ',
            [FormatDateTime('mm/dd/yyyy', tblHeader.FieldByName('PRW2_YEAR').asDateTime),
             tblDetail.FieldByName('PR_EMP_ID').asFloat]));
    Open;
    while not eof do
    begin
      ExecuteCommandFmt('insert into PRW2_BOX13 (PRW2_DETAIL_ID, BOX13_C, BOX13_N) ' +
                'values (%f, ''%s'', %f)',
                [tblDetail.FieldByName('ID').asFloat, FieldByName('aca_w2_code').asString, FieldByname('employer_amount').asFloat]);
      Next;
    end;
  finally
    Free;
  end;
end;

end.
