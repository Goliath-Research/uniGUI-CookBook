unit XMLSetUp;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.About,
  Vcl.Menus,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Wwdatsrc,
  Mask,
  IQMS.WebVcl.Hpick,
  Vcl.Buttons,
  Vcl.wwMemo,
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
  IQMS.WebVcl.TextStream,
  uniMemo,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.wwdbgrid, IQUniGrid, uniGUIFrame,
  Vcl.Controls;

type
  TFrmXMLSetup = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Options1: TUniMenuItem;
    StoreXSLTtodatabase1: TUniMenuItem;
    ExtractXSLTRtofile1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    SR: TIQWebSecurityRegister;
    SrcHdr: TDataSource;
    QryHdr: TFDQuery;
    SrcDtl: TDataSource;
    QryDtl: TFDQuery;
    QryHdrID: TBCDField;
    QryHdrDESCRIP: TStringField;
    QryHdrPARTNER_NO: TStringField;
    QryHdrPARTNER_TYPE: TStringField;
    QryHdrPARTNER_ID: TBCDField;
    QryDtlID: TBCDField;
    QryDtlXML_HDR_ID: TBCDField;
    QryDtlDESCRIP: TStringField;
    QryDtlSCHEMA_NO: TStringField;
    QryDtlEXECUTE_PROC: TStringField;
    QryHdrPARTNERNO: TStringField;
    QryHdrPARTNER: TStringField;
    PkVendor: TIQWebHPick;
    PkVendorID: TBCDField;
    PkVendorCOMPANY: TStringField;
    PkVendorADDR1: TStringField;
    PkVendorADDR2: TStringField;
    PkVendorCITY: TStringField;
    PkVendorSTATE: TStringField;
    PkVendorZIP: TStringField;
    PkVendorVENDORNO: TStringField;
    PkVendorPK_HIDE: TStringField;
    UpdateSQLHdr: TFDUpdateSQL;
    UpdateSQLDtl: TFDUpdateSQL;
    PkProcs: TIQWebHPick;
    PkProcsOBJECT_NAME: TStringField;
    PkCustomer: TIQWebHPick;
    PkCustomerCUSTNO: TStringField;
    PkCustomerCOMPANY: TStringField;
    PkCustomerADDR1: TStringField;
    PkCustomerADDR2: TStringField;
    PkCustomerADDR3: TStringField;
    PkCustomerCITY: TStringField;
    PkCustomerSTATE: TStringField;
    PkCustomerZIP: TStringField;
    PkCustomerID: TBCDField;
    PkCustomerTERMS_ID: TBCDField;
    PkCustomerSTATUS: TStringField;
    PkCustomerPK_HIDE: TStringField;
    PopupMenu1: TUniPopupMenu;
    StoreXSLTtodatabase2: TUniMenuItem;
    ExtractXSLTtofile2: TUniMenuItem;
    ViewXSLTR1: TUniMenuItem;
    ViewXSLT2: TUniMenuItem;
    OpenDialog1: TOpenDialog;
    wwMemoDialog1: TwwMemoDialog;
    ProcessXML1: TUniMenuItem;
    ProcessXML2: TUniMenuItem;
    OpenDialog2: TOpenDialog;
    QryDtlXSLT_FILE_NAME: TStringField;
    QryDtlXSLTAssigned: TStringField;
    PC: TUniPageControl;
    TabData: TUniTabSheet;
    TabSet: TUniTabSheet;
    IQSearchDtl: TIQUniGridControl;
    DBProc: TUniEdit;
    Panel1: TUniPanel;
    NavHdr: TUniDBNavigator;
    IQSearchHdr: TIQUniGridControl;
    DBPartnerType: TUniDBComboBox;
    DBPartner: TUniEdit;
    Splitter1: TUniSplitter;
    Panel2: TUniPanel;
    NavDtl: TUniDBNavigator;
    Panel7: TUniPanel;
    Splitter2: TUniSplitter;
    Panel9: TUniPanel;
    SpeedButton1: TUniSpeedButton;
    EditUNCPath: TUniEdit;
    Panel10: TUniPanel;
    Panel11: TUniPanel;
    Splitter3: TUniSplitter;
    Panel12: TUniPanel;
    SpeedButton2: TUniSpeedButton;
    EditLocalPath: TUniEdit;
    Panel13: TUniPanel;
    N1: TUniMenuItem;
    Deletefileafterprocess1: TUniMenuItem;
    QryDtlDATE_PROCESSED: TDateTimeField;
    DisplayoutputXML1: TUniMenuItem;
    QryDtlDOM_OUT: TMemoField;
    N2: TUniMenuItem;
    DisplayoutputXML2: TUniMenuItem;
    N3: TUniMenuItem;
    SBStoreToDataBase: TUniSpeedButton;
    SBExtractToFile: TUniSpeedButton;
    SBViewXSL: TUniSpeedButton;
    SBViewXML: TUniSpeedButton;
    SBProcessXML: TUniSpeedButton;
    QryDtlSCHEMA_TYPE: TStringField;
    N4: TUniMenuItem;
    AssignPickList1: TUniMenuItem;
    ViewEditPickList1: TUniMenuItem;
    OpenDialog3: TOpenDialog;
    wwMemoDialog2: TwwMemoDialog;
    PickList: TIQWebHPick;
    Memo1: TUniMemo;
    Contents1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure DBPartnerCustomDlg(Sender: TObject);
    procedure QryHdrBeforePost(DataSet: TDataSet);
    procedure QryHdrAfterPost(DataSet: TDataSet);
    { TODO -omugdha -cWEBIQ : Dependancy on TNavigateBtn
    procedure NavHdrBeforeAction(Sender: TObject; Button: TNavigateBtn);}
    procedure DBProcCustomDlg(Sender: TObject);
    procedure QryDtlBeforeEdit(DataSet: TDataSet);
    procedure QryDtlBeforePost(DataSet: TDataSet);
    procedure QryDtlAfterPost(DataSet: TDataSet);
     { TODO -omugdha -cWEBIQ : Dependancy on TNavigateBtn
    procedure NavDtlBeforeAction(Sender: TObject; Button: TNavigateBtn); }
    procedure QryDtlCalcFields(DataSet: TDataSet);
    procedure StoreXSLTtodatabase1Click(Sender: TObject);
    procedure ExtractXSLTRtofile1Click(Sender: TObject);
    procedure ViewXSLTR1Click(Sender: TObject);
    procedure ProcessXML1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Deletefileafterprocess1Click(Sender: TObject);
    procedure DisplayoutputXML1Click(Sender: TObject);
    procedure AssignPickList1Click(Sender: TObject);
    procedure ViewEditPickList1Click(Sender: TObject);
    procedure wwMemoDialog2CloseDialog(Dialog: TwwMemoDlg);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    function GetPickListId: Real;
  public
    { Public declarations }
  end;

procedure DoXMLSetUp();
procedure DoAutoXML(AFileName: String; ASchemaID, AId: Real; ArchDir: String);

implementation

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  {TODO -omugdha -cWEBIQ : Dependancy on IqTxStrm
    IqTxStrm,}
  IQMS.Common.StringUtils,
  IQMS.Common.NLS,
  {TODO -omugdha -cWEBIQ : Dependancy on IqDir
    IqDir,}
  ImpShare,
  IQMS.Common.Miscellaneous,
  IQMS.Common.HelpHook;
{$R *.dfm}

procedure DoXMLSetUp();
var
  LFrmXMLSetup: TFrmXMLSetup;
begin
  LFrmXMLSetup := TFrmXMLSetup.Create(uniGUIApplication.UniApplication);
end;

procedure DoAutoXML(AFileName: String; ASchemaID, AId: Real; ArchDir: String);
var
  ADir: String;
begin
  ProcessAutoXML(AFileName, ASchemaID, AId);

  if ArchDir <> '' then
  begin
    ADir := ArchDir;
    if not FindHistDirectory(ADir) then
      if not CreateDir(ADir) then
      begin
        if not FindHistDirectory(IQGetLocalHomePath + '\xmlimp_hist') then
          if not CreateDir(IQGetLocalHomePath + '\xmlimp_hist') then
            exit;
        ADir := IQGetLocalHomePath + '\xmlimp_hist';
      end;
    if not CopyFile(PChar(AFileName),
      PChar(ADir + '\' + ExtractFileName(AFileName)), FALSE) then
      exit;
  end
  else
  begin
    if not DirectoryExists(IQGetLocalHomePath + '\xmlimp_hist') then
      if not CreateDir(IQGetLocalHomePath + '\xmlimp_hist') then
        exit;

    if not CopyFile(PChar(AFileName),
      PChar(IQGetLocalHomePath + '\xmlimp_hist\' + ExtractFileName(AFileName)),
      FALSE) then
      exit;
  end;
  DeleteFile(AFileName);

end;

procedure TFrmXMLSetup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmXMLSetup.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmXMLSetup.Exit1Click(Sender: TObject);
begin
  Close
end;

procedure TFrmXMLSetup.DBPartnerCustomDlg(Sender: TObject);
var
  APk: TIQWebHPick;
begin
  if QryHdrPARTNER_TYPE.AsString = '' then
    raise Exception.Create('Please specify Partner Type');

  if QryHdrPARTNER_TYPE.AsString = 'VENDOR' then
    APk := PkVendor
  else
    APk := PkCustomer;

  with APk do
    if Execute then
    begin
      if not(QryHdr.State in [dsEdit, dsInsert]) then
        QryHdr.Edit;
      QryHdrPARTNER_ID.asFloat := GetValue('ID');
      if QryHdrPARTNER_TYPE.AsString = 'VENDOR' then
      begin
        QryHdrPARTNERNO.AsString := GetValue('VENDORNO');
        QryHdrPARTNER.AsString := GetValue('COMPANY');
      end
      else
      begin
        QryHdrPARTNERNO.AsString := GetValue('CUSTNO');
        QryHdrPARTNER.AsString := GetValue('COMPANY');
      end;

    end;

end;

procedure TFrmXMLSetup.QryHdrBeforePost(DataSet: TDataSet);
begin
  if QryHdrID.asFloat = 0 then
    QryHdrID.asFloat := GetNextID('XML_HDR');
end;

procedure TFrmXMLSetup.QryHdrAfterPost(DataSet: TDataSet);
begin
  {
    try
    QryHdr.DataBase.ApplyUpdates( [ QryHdr ]);
    except on E:Exception do
    begin
    Application.ShowException(E);
    QryHdr.Close;
    QryHdr.Open;
    System.SysUtils.ABORT;
    end;
    end;
  }
end;
 { TODO -omugdha -cWEBIQ : Dependancy on TNavigateBtn
procedure TFrmXMLSetup.NavHdrBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
var
  AId: Real;
begin
  if Button = nbRefresh then
  begin
    AId := QryHdrID.asFloat;
    QryHdr.Close;
    QryHdr.Open;
    QryHdr.Locate('ID', AId, []);
    System.SysUtils.ABORT;
  end;
end; }

procedure TFrmXMLSetup.DBProcCustomDlg(Sender: TObject);
begin
  with PkProcs do
    if Execute then
    begin
      if not(QryDtl.State in [dsEdit, dsInsert]) then
        QryDtl.Edit;
      QryDtlEXECUTE_PROC.AsString := GetValue('OBJECT_NAME');
      if Pos('XML_IMP', QryDtlEXECUTE_PROC.AsString) <> 0 then
        QryDtlSCHEMA_TYPE.AsString := 'IMPORT'
      else
        QryDtlSCHEMA_TYPE.AsString := 'EXPORT';
    end;
end;

procedure TFrmXMLSetup.QryDtlBeforeEdit(DataSet: TDataSet);
begin
  QryHdr.CheckBrowseMode;
  if QryHdrID.asFloat = 0 then
    ABORT;
end;

procedure TFrmXMLSetup.QryDtlBeforePost(DataSet: TDataSet);
begin
  QryDtlXML_HDR_ID.asFloat := QryHdrID.asFloat;
  if QryDtlID.asFloat = 0 then
    QryDtlID.asFloat := GetNextID('XML_SCHEMA');
  if SelectValueFmtAsFloat
    ('select id from XML_SCHEMA where XML_HDR_ID = %f and schema_no = RTrim(''%s'') and id <> %f',
    [QryDtlXML_HDR_ID.asFloat, QryDtlSCHEMA_NO.AsString, QryDtlID.asFloat]) <> 0
  then
    raise Exception.Create('Schema# not unique.');
end;

procedure TFrmXMLSetup.QryDtlAfterPost(DataSet: TDataSet);
begin
  {
    try
    QryDtl.DataBase.ApplyUpdates( [ QryDtl ]);
    except on E:Exception do
    begin
    Application.ShowException(E);
    QryDtl.Close;
    QryDtl.Open;
    System.SysUtils.ABORT;
    end;
    end;
  }
end;
 { TODO -omugdha -cWEBIQ : Dependancy on TNavigateBtn
procedure TFrmXMLSetup.NavDtlBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
var
  AId: Real;
begin
  if Button = nbRefresh then
  begin
    AId := QryDtlID.asFloat;
    QryDtl.Close;
    QryDtl.Open;
    QryDtl.Locate('ID', AId, []);
    System.SysUtils.ABORT;
  end;
end;  }

procedure TFrmXMLSetup.QryDtlCalcFields(DataSet: TDataSet);
begin
  if SelectValueFmtAsFloat
    ('select count(id) from XML_SCHEMA_DTL where XML_SCHEMA_ID = %f',
    [QryDtlID.asFloat]) = 0 then
    QryDtlXSLTAssigned.AsString := 'XSLT NOT Assigned'
  else
    QryDtlXSLTAssigned.AsString := 'XSLT Assigned';
end;

procedure TFrmXMLSetup.StoreXSLTtodatabase1Click(Sender: TObject);
var
  AStream: TTextStream;
  ABuffer, APart: String;
  ASeq: integer;
  AId: Real;
begin
  QryDtl.CheckBrowseMode;
  if QryDtlXSLTAssigned.AsString = 'XSLT Assigned' then
    if not IqConfirmYN('Do you wish to override the stored XSLT?') then
      exit;
  if OpenDialog1.Execute then
  begin
    AStream := TTextStream.Create(OpenDialog1.FileName, tfmRead);
    ExecuteCommandFmt('delete from XML_SCHEMA_DTL where XML_SCHEMA_ID = %f',
      [QryDtlID.asFloat]);
    try
      ASeq := 0;
      while not AStream.EOF do
      begin
        ABuffer := '';
        AStream.ReadLn(ABuffer);
        if Length(ABuffer) > 2000 then
        begin
          while Length(ABuffer) > 2000 do
          begin
            APart := Copy(ABuffer, 1, 1000);
            AId := GetNextID('XML_SCHEMA_DTL');
            Inc(ASeq);
            ExecuteCommandFmt
              ('insert into XML_SCHEMA_DTL (ID, XML_SCHEMA_ID, SEQ, xslt_record, PARTIAL) '
              + ' values(%f, %f, %d, ''%s'', ''Y'')',
              [AId, QryDtlID.asFloat, ASeq, StrTran(StrTran(APart, '"', '""'),
              '''', '''''')]);
            ExecuteCommandFmt
              ('update XML_SCHEMA_DTL set xslt_record = Replace(xslt_record, ''""'', ''"'') where id = %f',
              [AId]);
            ABuffer := Copy(ABuffer, 1001, Length(ABuffer));
          end;
          AId := GetNextID('XML_SCHEMA_DTL');
          Inc(ASeq);
          ExecuteCommandFmt
            ('insert into XML_SCHEMA_DTL (ID, XML_SCHEMA_ID, SEQ, xslt_record, PARTIAL) '
            + ' values(%f, %f, %d, ''%s'', ''Y'')',
            [AId, QryDtlID.asFloat, ASeq, StrTran(StrTran(ABuffer, '"', '""'),
            '''', '''''')]);
          ExecuteCommandFmt
            ('update XML_SCHEMA_DTL set xslt_record = Replace(xslt_record, ''""'', ''"'') where id = %f',
            [AId]);
        end
        else
        begin
          AId := GetNextID('XML_SCHEMA_DTL');
          Inc(ASeq);
          ExecuteCommandFmt
            ('insert into XML_SCHEMA_DTL (ID, XML_SCHEMA_ID, SEQ, xslt_record, PARTIAL) '
            + ' values(%f, %f, %d, ''%s'', ''N'')',
            [AId, QryDtlID.asFloat, ASeq, StrTran(StrTran(ABuffer, '"', '""'),
            '''', '''''')]);
          ExecuteCommandFmt
            ('update XML_SCHEMA_DTL set xslt_record = Replace(xslt_record, ''""'', ''"'') where id = %f',
            [AId]);
        end;

      end;
      ExecuteCommandFmt
        ('update XML_SCHEMA set xslt_file_name = ''%s'' where id = %f',
        [OpenDialog1.FileName, QryDtlID.asFloat]);
        { TODO -omugdha -cWEBIQ : Undeclared identifier: 'NavDtlBeforeAction'
      NavDtlBeforeAction(nil, nbRefresh);}
    finally
      AStream.Free;
    end;
  end;

end;

procedure TFrmXMLSetup.UniFormCreate(Sender: TObject);
var
  AType: integer;
begin
  DBPartner.Parent := IQSearchHdr.dbgrid;
  DBPartnerType.Parent := IQSearchHdr.dbgrid;
  DBPartner.Visible := FALSE;
  DBPartnerType.Visible := FALSE;

  DBProc.Parent := IQSearchDtl.dbgrid;
  DBProc.Visible := FALSE;
  EditUNCPath.Text := SelectValueAsString
    ('select edi_unc_collector_dir from iqsys where rownum < 2');
  EditLocalPath.Text := SelectValueAsString
    ('select edi_local_collector_dir from iqsys where rownum < 2');
  PC.ActivePage := TabData;

  AType := 0;
  if IQRegIntegerScalarRead(nil, 'XML_DELETE_FILE_AFTER_PROCESS', AType) then
  begin
    if AType = 0 then
      Deletefileafterprocess1.Checked := FALSE
    else
      Deletefileafterprocess1.Checked := True;
  end
  else
  begin
    Deletefileafterprocess1.Checked := True;
    IQRegIntegerScalarWrite(nil, 'XML_DELETE_FILE_AFTER_PROCESS', 1);
  end;

  QryHdr.Open;
  QryDtl.Open;
  IQRegFormRead(self, [self]);
end;

procedure TFrmXMLSetup.ExtractXSLTRtofile1Click(Sender: TObject);
begin
  if QryDtlXSLTAssigned.AsString = 'XSLT NOT Assigned' then
    exit;
  if OpenDialog1.Execute then
  begin
    if FileExists(OpenDialog1.FileName) then
      if not IqConfirmYN(Format('%s exists. Do you wish to override it?',
        [OpenDialog1.FileName])) then
        exit;
    ExtractToFile(OpenDialog1.FileName, QryDtlID.asFloat);
    IQInformation('XSLT Extracted');
  end;
end;

procedure TFrmXMLSetup.ViewXSLTR1Click(Sender: TObject);
var
  ABuffer: String;
begin
  if QryDtlXSLTAssigned.AsString = 'XSLT NOT Assigned' then
    exit;
  with TFDQuery.Create(nil) do
    try
      wwMemoDialog1.Lines.Clear;
      wwMemoDialog1.Caption := 'XSLT';
      Connection := uniMainModule.FDConnection1;
      // DataBaseName:= 'IQ';
      Sql.Add(IqFormat
        ('select xslt_record from XML_SCHEMA_DTL where XML_SCHEMA_ID = %f order by seq',
        [QryDtlID.asFloat]));
      Open;
      while not EOF do
      begin
        ABuffer := FieldByName('xslt_record').AsString;
        wwMemoDialog1.Lines.Add(ABuffer);
        next;
      end;
      wwMemoDialog1.Execute;
    finally
      Free;
    end;

end;

procedure TFrmXMLSetup.ProcessXML1Click(Sender: TObject);
var
  AXMLFile_IN, AXMLFile_Out, AXSLTFile: String;
  ADir: String;
  AId, APickListID: Real;
begin
  if QryDtlXSLTAssigned.AsString = 'XSLT NOT Assigned' then
    exit;
  if QryDtlEXECUTE_PROC.AsString = '' then
    exit;
  if OpenDialog2.Execute then
  begin
    ADir := SelectValueAsString
      ('select edi_unc_collector_dir from iqsys where rownum < 2');
    ForceDirectories(ADir);
    AXMLFile_IN := OpenDialog2.FileName;
    if (QryDtlSCHEMA_TYPE.AsString = 'IMPORT') and not FileExists(AXMLFile_IN)
    then
      raise Exception.Create(Format('File %s does not exist', [AXMLFile_IN]));

    if (QryDtlSCHEMA_TYPE.AsString = 'EXPORT') and FileExists(AXMLFile_IN) then
      if not IqConfirmYN(Format('File %s exists, do you wish to override it?',
        [AXMLFile_IN])) then
        exit;

    AXMLFile_Out := ADir + '\' + QryDtlID.AsString + '_' +
      QryDtlSCHEMA_NO.AsString + FormatDateTime('mm_dd_yyyy', Date) + '_' +
      FormatDateTime('hh_nn_ss', Time) + '_' + ExtractFileName(AXMLFile_IN);

    AXSLTFile := ADir + '\' + QryDtlID.AsString + '_' + QryDtlSCHEMA_NO.AsString
      + FormatDateTime('mm_dd_yyyy', Date) + '_' + FormatDateTime('hh_nn_ss',
      Time) + '.XSL';
    try
      IqCopyFile(AXMLFile_IN, AXMLFile_Out);
    except
      on E: Exception do
        raise Exception.Create
          (Format('%s. Probable cause: Invalid Collector Dir. UNC Path or Collector Dir. Local Path',
          [E.Message]));
    end;

    ExtractToFile(AXSLTFile, QryDtlID.asFloat);

    APickListID := GetPickListId;

    try
      ProcessXML(AXMLFile_Out, AXSLTFile, QryDtlEXECUTE_PROC.AsString,
        QryDtlID.asFloat, AXMLFile_IN, APickListID);
    except
      on E: Exception do
        raise Exception.Create
          (Format('%s. Probable cause: Invalid Collector Dir. UNC Path or Collector Dir. Local Path',
          [E.Message]));
    end;

    AId := QryDtlID.asFloat;
    QryDtl.Close;
    QryDtl.Open;
    QryDtl.Locate('ID', AId, []);

    IQInformation('XML Processed');
  end;
end;

function TFrmXMLSetup.GetPickListId: Real;
var
  APos: integer;
  AStr, ASubStr: String;
begin
  Result := 0;
  if SelectValueFmtAsFloat
    ('select length(pick_list) from xml_schema where id = %f',
    [QryDtlID.asFloat]) <> 0 then
  begin
    PickList.Sql.Clear;
    AStr := SelectValueFmtAsString
      ('select pick_list from xml_schema where id = %f', [QryDtlID.asFloat]);
    APos := Pos(#10, AStr);
    repeat
      ASubStr := Copy(AStr, 1, APos - 1);
      PickList.Sql.Add(ASubStr);
      AStr := Copy(AStr, APos + 1, Length(AStr));
      APos := Pos(#10, AStr);
    until APos = 0;
    PickList.Sql.Add(AStr);
    if PickList.Execute then
      Result := PickList.GetValue('ID');
  end;
end;

procedure TFrmXMLSetup.SpeedButton1Click(Sender: TObject);
var
  ADir: String;
begin
  ADir := SelectValueAsString
    ('select edi_unc_collector_dir from iqsys where rownum < 2');
    { TODO -omugdha -cWEBIQ :  Undeclared identifier: 'DirBrowse'
  if DirBrowse(ADir, 'Collector Dir. UNC Path') then
    ExecuteCommandFmt
      ('update iqsys set edi_unc_collector_dir  = ''%s''', [ADir]); }

  EditUNCPath.Text := ADir;
end;

procedure TFrmXMLSetup.SpeedButton2Click(Sender: TObject);
begin
  ExecuteCommandFmt('update iqsys set edi_local_collector_dir  = ''%s''',
    [EditLocalPath.Text]);
end;

procedure TFrmXMLSetup.Deletefileafterprocess1Click(Sender: TObject);
begin
  if Deletefileafterprocess1.Checked then
  begin
    IQRegIntegerScalarWrite(nil, 'XML_DELETE_FILE_AFTER_PROCESS', 0);
    Deletefileafterprocess1.Checked := FALSE;
  end
  else
  begin
    IQRegIntegerScalarWrite(nil, 'XML_DELETE_FILE_AFTER_PROCESS', 1);
    Deletefileafterprocess1.Checked := True;
  end;
end;

procedure TFrmXMLSetup.DisplayoutputXML1Click(Sender: TObject);
begin
  wwMemoDialog1.Lines.Clear;
  wwMemoDialog1.Caption := 'XML output';
  wwMemoDialog1.Lines.Add
    (SelectValueFmtAsString('select dom_out from xml_schema where id = %f',
    [QryDtlID.asFloat]));
  wwMemoDialog1.Execute;
end;

procedure TFrmXMLSetup.AssignPickList1Click(Sender: TObject);
var
  AStream: TTextStream;
  ABuffer: String;
  AStr: String;
begin
  if SelectValueFmtAsFloat
    ('select length(pick_list) from xml_schema where id = %f',
    [QryDtlID.asFloat]) <> 0 then
    if not IqConfirmYN('Do you wish to override the stored Pick List?') then
      exit;
  if OpenDialog3.Execute then
  begin
    AStream := TTextStream.Create(OpenDialog3.FileName, tfmRead);
    try
      AStr := '';
      while not AStream.EOF do
      begin
        ABuffer := '';
        AStream.ReadLn(ABuffer);
        AStr := AStr + ABuffer + #10;
      end;
      AStr := Copy(AStr, 1, Length(AStr) - 1);
      ExecuteCommandFmt
        ('update xml_schema set pick_list = ''%s'' where id = %f',
        [AStr, QryDtlID.asFloat]);
    finally
      AStream.Free;
    end;
  end;
end;

procedure TFrmXMLSetup.ViewEditPickList1Click(Sender: TObject);
var
  AStr, ASubStr: String;
  APos: integer;
begin
  wwMemoDialog2.Lines.Clear;
  if SelectValueFmtAsFloat
    ('select length(pick_list) from xml_schema where id = %f',
    [QryDtlID.asFloat]) <> 0 then
  begin
    wwMemoDialog2.Lines.Clear;
    wwMemoDialog2.Caption := 'Pick List';
    AStr := SelectValueFmtAsString
      ('select pick_list from xml_schema where id = %f', [QryDtlID.asFloat]);
    APos := Pos(#10, AStr);
    repeat
      ASubStr := Copy(AStr, 1, APos - 1);
      wwMemoDialog2.Lines.Add(ASubStr);
      AStr := Copy(AStr, APos + 1, Length(AStr));
      APos := Pos(#10, AStr);
    until APos = 0;
    wwMemoDialog2.Lines.Add(AStr);
  end;
  wwMemoDialog2.Execute;
end;

procedure TFrmXMLSetup.wwMemoDialog2CloseDialog(Dialog: TwwMemoDlg);
var
  AStr: string;
  i: integer;
begin
  if Dialog.OKBtn.Enabled then
  begin
    if SelectValueFmtAsFloat
      ('select length(pick_list) from xml_schema where id = %f',
      [QryDtlID.asFloat]) <> 0 then
      if not IqConfirmYN('Do you wish to override the stored Pick List?') then
        exit;

    AStr := '';

    for i := 0 to Dialog.Memo.Lines.Count - 1 do
    begin
      AStr := AStr + Dialog.Memo.Lines[i] + #10;
    end;
    ExecuteCommandFmt('update xml_schema set pick_list = ''%s'' where id = %f',
      [AStr, QryDtlID.asFloat]);
  end;
end;

procedure TFrmXMLSetup.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmEDI { CHM } , iqhtmEDI { HTM } )
  { IQMS.Common.HelpHook.pas }
end;

procedure TFrmXMLSetup.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext(HelpContext);
end;

end.
