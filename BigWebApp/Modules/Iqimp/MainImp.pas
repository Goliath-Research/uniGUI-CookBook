unit MainImp;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Vcl.Menus,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
  IQMS.Common.PanelMsg,
  Vcl.FileCtrl,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  FireDAC.Stan.Option,
  MainModule,
  IQMS.Common.RollbackManager,
  IQMS.Common.DataConst,
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
  uniDBNavigator,
  uniMainMenu, IQUniGrid, uniGUIFrame, Vcl.ExtCtrls;

type
  TFrmImp = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQSearch1: TIQUniGridControl;
    SrcInput: TDataSource;
    QryInput: TFDQuery;
    QryInputFILENAME: TStringField;
    QryInputLAST_UPDATE: TDateTimeField;
    QryInputDESCRIP: TStringField;
    QryInputTYPE: TStringField;
    QryInputCUSTNO: TStringField;
    QryInputCOMPANY: TStringField;
    QryInputID: TBCDField;
    N1: TUniMenuItem;
    SchemaMaint1: TUniMenuItem;
    ShowErrorsandWarning1: TUniMenuItem;
    QryInputError: TStringField;
    PopupMenu1: TUniPopupMenu;
    ShowErrorsandWarnings1: TUniMenuItem;
    ApplyTemplates1: TUniMenuItem;
    QryInputARCUSTO_SCHEMA_ID: TBCDField;
    N2: TUniMenuItem;
    Abortprocessing1: TUniMenuItem;
    N3: TUniMenuItem;
    CreateOrders1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    SR: TIQWebSecurityRegister;
    Showparsedfile1: TUniMenuItem;
    Contents1: TUniMenuItem;
    Options1: TUniMenuItem;
    Parseonly1: TUniMenuItem;
    Panel1: TUniPanel;
    { TODO -omugdha -cWEBIQ : Dependancy on TNavigateBtn
      procedure NavBeforeAction(Sender: TObject; Button: TNavigateBtn); }
    procedure QryInputUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
      AOptions: TFDUpdateRowOptions);
    procedure SchemaMaint1Click(Sender: TObject);
    procedure ShowErrorsandWarning1Click(Sender: TObject);
    procedure QryInputCalcFields(DataSet: TDataSet);
    procedure ApplyTemplates1Click(Sender: TObject);
    procedure Abortprocessing1Click(Sender: TObject);
    procedure CreateOrders1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Showparsedfile1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Parseonly1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FList: TStringList;
    FAbort: Boolean;
    FBASED_ON_STD_PRICE: String;
    FAR_DISCOUNT_TIERS_ID: Real;
    FDISCOUNT_PRICE: Real;

    FCaption: String;
    RB: TFDRollbackManager;
    HMsg: TPanelMesg;
    FAutoProcess: Boolean;
    FImpFa: Boolean;
    FEdiFileId: Real;
    procedure ProcessTemplates(AId: Real);
    procedure ProcessTemplate(AINPUT_FILE_REC_ID: Real);
    procedure CreateOrders;
    procedure CreateOrderHeader(Aship_to_id: Real);

    function AssignNewOrderNo(AId: Real; var AEplantId: Real): String;
    function CreateNewOrder(ArcustoId, AShipToId: Real; APono: String): Real;
    function CreateNewOrdDetail(AOrdersId, ATotalOrdered, Arinvt_id,
      Aship_to_id, ArcustoId: Real; ASeqNo: Integer): Real;
    procedure AssignUnitPrice(ATotalOrdered, AOrdDetailId, ArcustoId,
      Arinvt_id: Real);
    procedure AssignDefaultCommiss(AOrdDetailId, ArinvtId, AOrdersId: Real);
    function GetTierDiscount(AArcustoID, AArinvtID: Real): Real;
    procedure Process_SafeLight;
    procedure Process_Electrolux;
    procedure Process_Generic;
    procedure Process_XML;
    procedure Process_FA;
    procedure Process_ZIO;
    procedure CreateOrderHeaderZIO(AQry: TFDQuery);
    function CreateNewOrderZIO(ArcustoId: Real; APono: String;
      AQry: TFDQuery): Real;
    procedure CheckParseOnly;

    procedure CreateFA(AQry: TFDQuery);

    procedure ProcessFA_Book(afa_asset_no, afa_descrip, afa_serial_number,
      afa_purchase_date, afa_in_service_date, afa_glacct_id_asset,
      afa_salvage_value, afa_useful_life, afa_acquisition_cost,
      afa_disposal_date, afa_disposal_type, afa_sale_amount: String;
      aFaMainId: Real; afa_macrs_class_life_id: String);

    procedure ProcessFA_DEPR_POSTING(AQry: TFDQuery; AFaBookId: Real;
      afa_asset_no, afa_descrip, afa_serial_number, afa_purchase_date,
      afa_in_service_date, afa_glacct_id_asset, afa_salvage_value,
      afa_useful_life, afa_acquisition_cost, afa_disposal_date,
      afa_disposal_type, afa_sale_amount: String);

    procedure ProcessElectroluxReleases(AId: Real; APono: String;
      Aship_to_id: Real; AItemno, ACuser2, ACuser3, ATrans: String);
    procedure ProcessXMLReleases(AId: Real; APono: String; Aship_to_id: Real;
      AItemno, ATrans: String);
    procedure MatchEdiOrder(AId, ArcustoId, Aship_to_id, Arinvt_id: Real;
      APono: String);
    procedure ProcessCustomSqlScript(AIterCode, ATrSetId: String;
      AEdiFile_Id: Real);
    procedure ProcessGenericReleases(AId: Real; APono: String;
      Aship_to_id: Real; AItemno, Apt_descrip, AUom, ATrans: String);
    procedure CheckRollBackSegment;
    procedure ShowOrders(AEdiFileId: Real);

  public
    { Public declarations }
  end;

procedure DoImpFA();
procedure DoImp();
procedure DoAutoImp(AFileName: String; ASchemaID: Real; ArchDir: String);

implementation

uses
  // edi_share,
  // EdiError,
  // EdiOrds,
  ImpError,
  ImpInput,
  {TODO -omugdha -cWEBIQ : Dependancy on ImpParse
    ImpParse,}
  ImpShare,
  IQMS.Common.CheckPoint,
  IQMS.Common.FileUtils,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Sequence,
  IQMS.Common.StringUtils,
  IQMS.Common.UOM,
  IQMS.Common.Mcshare,
  {TODO -omugdha -cWEBIQ : Dependancy on oe_share and SchemaFA
    oe_share,
    SchemaFA,}
  SchMaint,
  System.StrUtils;
{$R *.DFM}

procedure DoImp();
var
  LFrmImp: TFrmImp;
begin
  // with TFrmImp.Create(AOwner) do Show;
  LFrmImp := TFrmImp.Create(uniGUIApplication.UniApplication);
  with LFrmImp do
  begin
    HelpContext := 5001758;
    Show();
  end;
end;

procedure DoImpFA();
var
  LFrmImp: TFrmImp;
begin
  // with TFrmImp.Create_FA(AOwner) do Show;
  LFrmImp := TFrmImp.Create(uniGUIApplication.UniApplication);
  with LFrmImp do
  begin
    HelpContext := 5000270;
    FImpFa := True;
    Show();
  end;
end;

procedure DoAutoImp(AFileName: String; ASchemaID: Real; ArchDir: String);
var
  AId: Real;
  ADir: String;
  RB: TFDRollbackManager;
  AtmpFile: String;
  ACount, ACount1, ACount2: Real;
  AfterConvScript: String;
  aUnixPath: String;
  aUncPath: String;
  ADriveLetter: String;
  ASize1, ASize2: Integer;
  ADir2: String;
  LFrmImp: TFrmImp;

begin

  SecurityManager.HasUnrestrictedAccess := True;
  // with TFrmImp.Create(Application) do
  LFrmImp := TFrmImp.Create(uniGUIApplication.UniApplication);
  with LFrmImp do
  begin
    try
      HelpContext := 5001758;
      FAutoProcess := True;
      { TODO -omugdha -cWEBIQ : Dependancy on ImpParse
        ProcessAuto(Application, AFileName, ASchemaId, AId, AtmpFile); } { in ImpParse.pas }
      // DeleteFile(AtmpFile);
      QryInput.Close;
      QryInput.Open;
      QryInput.Locate('ID', AId, []);
      CreateOrders;
      if not Parseonly1.Checked then
        try
          { TODO -omugdha -cWEBIQ : Undeclared identifier: 'Create'
            RB:= IQMS.Common.RollbackManager.Create( 'RB_EDI', '', 100, 300); }
          if Assigned(RB) then
            RB.Associate;
          // DoShowEdiOrdersAuto(Format('(%.0f)', [FEdiFileId]), RB);
          AfterConvScript := SelectValueAsString
            ('select NVL(EDI_SQL_AFTER_CONV, ''***'') from iqsys2 where rownum < 2');
          aUnixPath := SelectValueAsString
            ('select EDI_LOCAL_COLLECTOR_DIR from iqsys where rownum < 2');
          aUncPath := SelectValueAsString
            ('select EDI_UNC_COLLECTOR_DIR from iqsys where rownum < 2');
          ADriveLetter := UpperCase(Copy(aUnixPath, 1, 1));

          if Pos(ADriveLetter, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 0 then
          begin
            ADir2 := aUnixPath;
          end
          else
          begin
            ADir2 := aUnixPath;
          end;

          if FileExists(AfterConvScript) then
          begin
            ASize1 := IqGetFileSize(AfterConvScript);
            ASize2 := IqGetFileSize(aUncPath + '\' +
              ExtractFileName(AfterConvScript));
            if (FileExists(aUncPath + '\' + ExtractFileName(AfterConvScript))
              and (ASize1 <> ASize2)) or
              (not FileExists(aUncPath + '\' + ExtractFileName(AfterConvScript)))
            then
            begin
              CopyFile(PChar(AfterConvScript),
                PChar(aUncPath + '\' + ExtractFileName(AfterConvScript)
                ), FALSE);
              AfterConvScript := ADir2 + '\' + ExtractFileName(AfterConvScript);
            end
            else
              AfterConvScript := ADir2 + '\' + ExtractFileName(AfterConvScript);
          end;

          if Pos('/', AFileName) <> 0 then
          begin
            AfterConvScript := StrTran(AfterConvScript, '\', '/');
          end;

          ExecuteCommandFmt
            ('begin edi_convert.ConvertEdiFile1(%f, ''%s''); end;',
            [FEdiFileId, AfterConvScript]);
          ExecuteCommandFmt('begin                                            '
            + '  edi_convert.arr_clear;                         ' +
            '  for v in (select d.id                          ' +
            '              from ord_detail d,                 ' +
            '                   orders o,                     ' +
            '                   edi_ord_detail ed,            ' +
            '                   edi_isa_header i,             ' +
            '                   edi_ts_hdr t                  ' +
            '             where d.orders_id = o.id            ' +
            '               and ed.orders_id = o.id           ' +
            '               and ed.edi_ts_hdr_id = t.id       ' +
            '               and t.edi_isa_header_id = i.id    ' +
            '               and i.edi_file_id = %f)           ' +
            '  loop                                           ' +
            '   edi_convert.arr_add(v.id);                    ' +
            '  end loop;                                      ' + 'end; ',
            [FEdiFileId]);

          { TODO -omugdha -cWEBIQ : Undeclared identifier: 'edi_share'
            edi_share.ProcessDirectShip(cnstFDConnectionName, FEdiFileId); }
          if FEdiFileId <> 0 then
          begin
            ExecuteCommandFmt
              ('update edi_file set comment_line = ''eServer - Parsed '' || to_char(trunc(sysdate), ''YYYY-MON-DD'') where id = %f',
              [FEdiFileId]);
            ACount := SelectValueFmtAsFloat
              ('select count(edi_file_id) from edi_errors where error_type = ''E'' and edi_file_id = %f',
              [FEdiFileId]);

            ACount1 := SelectValueFmtAsFloat
              ('select count(d.id) from edi_ord_detail d, edi_ts_hdr t, edi_isa_header h where d.edi_ts_hdr_id = t.id '
              + ' and t.edi_isa_header_id = h.id and h.edi_file_id = %f',
              [FEdiFileId]);

            ACount2 := SelectValueFmtAsFloat
              ('select count(d.id) from edi_ord_detail d, edi_ts_hdr t, edi_isa_header h where d.edi_ts_hdr_id = t.id '
              + ' and t.edi_isa_header_id = h.id and h.edi_file_id = %f and d.converted_date_time is not null',
              [FEdiFileId]);

            if (ACount = 0) and (ACount1 = ACount2) then
              ExecuteCommandFmt
                ('update edi_file set comment_line = ''eServer - Parsed and Converted '' || to_char(trunc(sysdate), ''YYYY-MON-DD'')  where id = %f',
                [FEdiFileId]);
          end;

        finally
          RB := nil;
        end;

      if ArchDir <> '' then
      begin
        ADir := ArchDir;
        if not FindHistDirectory(ADir) then
          if not CreateDir(ADir) then
          begin
            if not FindHistDirectory(IQGetLocalHomePath + '\oeimp_hist') then
              if not CreateDir(IQGetLocalHomePath + '\oeimp_hist') then
                exit;
            ADir := IQGetLocalHomePath + '\oeimp_hist';
          end;
        if not CopyFile(PChar(AFileName),
          PChar(ADir + '\' + ExtractFileName(AFileName)), FALSE) then
          exit;
      end
      else
      begin
        if not DirectoryExists(IQGetLocalHomePath + '\oeimp_hist') then
          if not CreateDir(IQGetLocalHomePath + '\oeimp_hist') then
            exit;

        if not CopyFile(PChar(AFileName),
          PChar(IQGetLocalHomePath + '\oeimp_hist\' + ExtractFileName(AFileName)
          ), FALSE) then
          exit;
      end;
      DeleteFile(AFileName);

    finally

      Free;
    end;
  end;
end;

procedure TFrmImp.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(True, self);
  IQRegFormRead(self, [self]);
  CheckParseOnly;
end;


procedure TFrmImp.CheckParseOnly;
var
  AType: Integer;
begin
  AType := 0;
  if IQRegIntegerScalarRead(self, 'IQIMP_PARSEONLY', AType) then
    Parseonly1.Checked := AType = 1
  else
  begin
    Parseonly1.Checked := FALSE;
    IQRegIntegerScalarWrite(self, 'IQIMP_PARSEONLY', 0);
  end;
end;

procedure TFrmImp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  IQRegFormWrite(self, [self]);
end;
(* TODO -omugdha -cWEBIQ : dependancy on TNavigateBtn
  procedure TFrmImp.NavBeforeAction(Sender: TObject; Button: TNavigateBtn);
  var
  AID:Real;
  AParse:Boolean;
  AStr:String;
  I:integer;
  begin
  if Button = nbDelete then
  begin
  if IQSearch1.wwDBGrid.SelectedList.Count = 0 then
  IQSearch1.wwDBGrid.SelectRecord;

  if IQSearch1.wwDBGrid.SelectedList.Count = 1 then
  AStr := 'Delete record?'
  else
  AStr := 'Delete selected records?';

  if IqConfirmYN(AStr) then
  begin
  with IqSearch1.wwDBGrid, IqSearch1.wwDBGrid.datasource.dataset do
  for i:= 0 to SelectedList.Count-1 do
  begin
  GotoBookmark(SelectedList.items[i]);
  ExecuteCommandFmt('delete from INPUT_FILE where id = %f', [QryInputID.asFloat]);
  end;
  QryInput.Close;
  QryInput.Open;
  end;

  //    if IqConfirmYN('Delete record?') then
  //    begin
  //      ExecuteCommandFmt('delete from INPUT_FILE where id = %f', [QryInputID.asFloat]);
  //      QryInput.Close;
  //      QryInput.Open;
  //    end;
  //    Abort;
  end
  else if Button = nbRefresh then
  begin
  AID := QryInputID.asFloat;
  QryInput.Close;
  QryInput.Open;
  QryInput.Locate('ID', AID, []);
  Abort;
  end
  else if Button = nbInsert then
  begin
  if FImpFa then
  AParse := ParseInputFileFA(self, AID)
  else
  AParse := ParseInputFile(self, AID);


  if AParse then  {in ImpParse.pas}
  begin
  QryInput.Close;
  QryInput.Open;
  QryInput.Locate('ID', AID, []);
  CreateOrders;
  end;
  Abort;
  end;
  end;
*)

procedure TFrmImp.QryInputUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
  AOptions: TFDUpdateRowOptions);
begin
  //
end;

procedure TFrmImp.SchemaMaint1Click(Sender: TObject);
begin
  if FImpFa then
    (* TODO -omugdha -cWEBIQ : dependancy on SchemaFA
      DoFASchema( self )  {in SchemaFA.pas} *)
  else
    DoArcustoSchema(); { in SchMaint.pas }
end;

procedure TFrmImp.ShowErrorsandWarning1Click(Sender: TObject);
begin
  ShowError(); { in ImpError.pas }
end;

procedure TFrmImp.QryInputCalcFields(DataSet: TDataSet);
begin
  QryInputError.asString := '';
  with TFDQuery.Create(self) do
    try
      Connection := uniMainModule.FDConnection1;
      Sql.Add(IQFormat('select count(l.id) as ids, l.type ' +
        '  from input_file_rec r, ' + '       input_file_log l ' +
        ' where l.input_file_rec_id = r.id and r.input_file_id = %f ' +
        ' group by l.type order by l.type desc', [QryInputID.asFloat]));
      Open;
      while not eof do
      begin
        QryInputError.asString := Format('%s(%d) %s',
          [FieldByName('type').asString, FieldByName('ids').asinteger,
          QryInputError.asString]);
        Next;
      end;
    finally
      Free;
    end;

  QryInputError.asString := Trim(QryInputError.asString);

end;

procedure TFrmImp.ApplyTemplates1Click(Sender: TObject);
begin
  if not IqConfirmYN('Do you wish to Apply/Reapply templates?') then
    exit;
  ProcessTemplates(QryInputID.asFloat);

end;

procedure TFrmImp.ProcessTemplates(AId: Real);
var
  I: Integer;
  ATotal: Integer;
begin
  FList := TStringList.Create;
  try
    FAbort := FALSE;

    with TFDQuery.Create(self) do
      try
        Connection := uniMainModule.FDConnection1;
        Sql.Add(IQFormat
          ('select text from SCHEMA_TEMPLATE where arcusto_schema_id = %f order by seq',
          [QryInputARCUSTO_SCHEMA_ID.asFloat]));
        Open;
        while not eof do
        begin
          FList.Add(FieldByName('text').asString);
          Next;
        end;
      finally
        Free;

      end;

    ATotal := Trunc(SelectValueFmtAsFloat
      ('select count(id) from input_file_rec where input_file_id = %f', [AId]));

    with TFDQuery.Create(self) do
      try
        Connection := uniMainModule.FDConnection1;
        Sql.Add(IQFormat
          ('select id from input_file_rec where input_file_id = %f', [AId]));
        Open;
        I := 0;
        while not eof do
        begin
          Inc(I);
          Panel1.Caption := Format('%d/%d', [I, ATotal]);
          if FAbort then
            exit;
          Application.processmessages;
          ExecuteCommandFmt
            ('delete from INPUT_FILE_LOG where input_file_rec_id = %f',
            [FieldByName('id').asFloat]);
          ProcessTemplate(FieldByName('id').asFloat);
          Next;
        end;
      finally
        Free;
      end;

  finally
    FList.Free;
    FList := nil;
    Panel1.Caption := '';
  end;
  { TODO -omugdha -cWEBIQ : dependancy on NavBeforeAction
    NavBeforeAction(nil, nbRefresh); }
end;

procedure TFrmImp.ProcessTemplate(AINPUT_FILE_REC_ID: Real);
var
  AStr1: String;
  I: Integer;
begin
  for I := 0 to FList.Count - 1 do
    try
      AStr1 := StrTran(UpperCase(FList[I]), ':ID',
        IntToStr(Trunc(AINPUT_FILE_REC_ID)));
      ExecuteCommand(AStr1);
    except
      on E: Exception do
      begin
        ExecuteCommandFmt
          ('insert into INPUT_FILE_LOG (INPUT_FILE_REC_ID, TYPE, TEXT) values (%f, ''E'', ''%s'')',
          [AINPUT_FILE_REC_ID, E.Message]);
      end
    end;
end;

procedure TFrmImp.Abortprocessing1Click(Sender: TObject);
begin
  if not IqConfirmYN('Do you wish to abort processing?') then
    exit;
  FAbort := True;
end;

procedure TFrmImp.CreateOrders1Click(Sender: TObject);
begin
  if IqConfirmYN('Do you wish to create orders?') then
    CreateOrders;
end;

procedure TFrmImp.CreateOrders;
begin
  FEdiFileId := 0;
  if (QryInputTYPE.asString = 'OE') or (QryInputTYPE.asString = 'SAFELIGHT')
  then
    Process_SafeLight
  else if (QryInputTYPE.asString = 'ELECTROLUX') then
    Process_Electrolux
  else if (QryInputTYPE.asString = 'GENERIC') then
    Process_Generic
  else if (QryInputTYPE.asString = 'ASN') then
    Process_Generic
  else if (QryInputTYPE.asString = 'XML') then
    Process_XML
  else if (QryInputTYPE.asString = 'FA') then
    Process_FA
  else if (QryInputTYPE.asString = 'ZIO') then
    Process_ZIO;

  if FEdiFileId <> 0 then
  begin
    if FAutoProcess then
      ExecuteCommandFmt
        ('update edi_file set parse_date_time = sysdate, comment_line = ''eServer - Parsed ''  || to_char(trunc(sysdate), ''YYYY-MON-DD'') where id = %f',
        [FEdiFileId])
    else
      ExecuteCommandFmt
        ('update edi_file set parse_date_time = sysdate where id = %f',
        [FEdiFileId]);
  end;

end;

procedure TFrmImp.Process_ZIO;
var
  AQry: TFDQuery;
  I: Integer;
begin
  FAbort := FALSE;
  AQry := TFDQuery.Create(self);
  with AQry do
    try
      Connection := uniMainModule.FDConnection1;
      Sql.Add(IQFormat('select * ' + '  from input_file_rec a ' +
        ' where  a.input_file_id = %f ' +
        'and not exists (select id from input_file_log where input_file_rec_id = a.id)',
        [QryInputID.asFloat]));
      Open;
      I := 0;
      try
        while not eof do
        begin
          if FAbort then
            exit;
          Inc(I);
          FCaption := Format('%d orders created', [I]);
          CreateOrderHeaderZIO(AQry);
          Next;
        end;
        if not FAutoProcess then
          IqConfirm(Format('%d orders created', [I]));
      finally
        Panel1.Caption := '';
      end;
    finally
      Free;
    end;
end;

procedure TFrmImp.Process_SafeLight;
var
  AQry: TFDQuery;
  I: Integer;
begin
  FAbort := FALSE;
  AQry := TFDQuery.Create(self);
  with AQry do
    try
      Connection := uniMainModule.FDConnection1;
      Sql.Add(IQFormat('select distinct a.ship_to_id as ship_to_id ' +
        '  from input_file_rec a ' +
        ' where a.ship_to_id is not null and a.input_file_id = %f ' +
        'and not exists (select id from input_file_log where input_file_rec_id = a.id)',
        [QryInputID.asFloat]));
      Open;
      I := 0;
      try
        while not eof do
        begin
          if FAbort then
            exit;
          Inc(I);
          FCaption := Format('%d orders created', [I]);
          CreateOrderHeader(FieldByName('ship_to_id').asFloat);
          Next;
        end;
        if not FAutoProcess then
          IqConfirm(Format('%d orders created', [I]));
      finally
        Panel1.Caption := '';
      end;
    finally
      Free;
    end;
end;

procedure TFrmImp.Process_Electrolux;
var
  AId1, AId2, AId3, ArcustoId: Real;
  AExt, ATrans, ADockId: String;
  I: Integer;
  Ainterchange_code: String;
  AEdiPartnersId: Real;
begin
  FEdiFileId := GetNextID('EDI_FILE');
  ExecuteCommandFmt('insert into edi_file (id, file_name) values (%f, ''%s'')',
    [FEdiFileId, QryInputFILENAME.asString]);

  AId3 := GetNextID('EDI_ISA_HEADER');

  ArcustoId := SelectValueFmtAsFloat
    ('select arcusto_id from arcusto_schema where id = %f',
    [QryInputARCUSTO_SCHEMA_ID.asFloat]);
  Ainterchange_code := SelectValueFmtAsString
    ('select tp_interchange_code from edi_partners where arcusto_id = %f',
    [ArcustoId]);
  AEdiPartnersId := SelectValueFmtAsFloat
    ('select id from edi_partners where arcusto_id = %f', [ArcustoId]);

  ExecuteCommandFmt
    ('insert into EDI_ISA_HEADER (id, edi_file_id, arcusto_id, interchange_code, edi_partners_id) '
    + ' values (%f, %f, %f, ''%s'', decode(%f, 0, null, %f))',
    [AId3, FEdiFileId, ArcustoId, Ainterchange_code, AEdiPartnersId,
    AEdiPartnersId]);

  AExt := UpperCase(ExtractFileExt(QryInputFILENAME.asString));

  if Pos('SRQ', AExt) <> 0 then
    ATrans := '862' // firms
  else
    ATrans := '830'; // forecasts

  with TFDQuery.Create(self) do
    try
      Connection := uniMainModule.FDConnection1;
      Sql.Add(IQFormat
        ('select * from (select pono, ship_to_id, itemno, cuser2, cuser3, arinvt_id, min(id) as id '
        + '  from input_file_rec a ' + ' where input_file_id = %f ' +
        ' group by pono, ship_to_id, itemno, cuser2, cuser3, arinvt_id) ' +
        'order by id', [QryInputID.asFloat]));
      Open;
      if eof and bof then
        exit;

      I := 0;

      while not eof do
      begin
        AId1 := GetNextID('EDI_TS_HDR');
        ADockId := SelectValueFmtAsString
          ('select dockid from ship_to where id = %f',
          [FieldByName('ship_to_id').asFloat]);
        ExecuteCommandFmt
          ('insert into EDI_TS_HDR (id, edi_isa_header_id, transaction_set_id, pono, ship_to_id, dockid) '
          + ' values (%f, %f, ''%s'', ''%s'', %f, ''%s'')',
          [AId1, AId3, ATrans, FieldByName('pono').asString,
          FieldByName('ship_to_id').asFloat, ADockId]);

        AId2 := GetNextID('EDI_ORD_DETAIL');

        ExecuteCommandFmt
          ('insert into EDI_ord_detail (id, EDI_TS_HDR_id, pono, ship_to_id, pt_descrip, uom, aka_ptno) '
          + ' values (%f, %f, ''%s'', %f, ''%s'', decode(''%s'', ''PC'', ''EA'', ''%s''), ''%s'')',
          [AId2, AId1, FieldByName('pono').asString, FieldByName('ship_to_id')
          .asFloat, FieldByName('cuser2').asString, FieldByName('cuser3')
          .asString, FieldByName('cuser3').asString,
          FieldByName('itemno').asString]);

        MatchEdiOrder(AId2, ArcustoId, FieldByName('ship_to_id').asFloat,
          FieldByName('arinvt_id').asFloat, FieldByName('pono').asString);

        Inc(I);
        FCaption := Format('%d prepost orders created', [I]);

        ProcessElectroluxReleases(AId2, FieldByName('pono').asString,
          FieldByName('ship_to_id').asFloat, FieldByName('itemno').asString,
          FieldByName('cuser2').asString, FieldByName('cuser3')
          .asString, ATrans);
        Next;
      end;
    finally
      Free;
    end;
  Panel1.Caption := '';
  ProcessCustomSqlScript(Ainterchange_code, ATrans, FEdiFileId);

  ExecuteCommandFmt('update edi_file set parsed = ''Y'' where id = %f',
    [FEdiFileId]);

  CheckRollBackSegment;
  if not FAutoProcess then
    ShowOrders(FEdiFileId);
  // DoShowEdiOrders(self, Format('(%d)', [Trunc(AEdiFileId)]), RB)  {in EdiOrds.pas}

end;

procedure TFrmImp.Process_Generic;
var
  AId1, AId2, AId3, ArcustoId, VendorId: Real;
  AExt, ATrans, ADockId: String;
  I: Integer;
  Ainterchange_code: String;
  AEdiPartnersId: Real;
begin
  FEdiFileId := GetNextID('EDI_FILE');
  ExecuteCommandFmt('insert into edi_file (id, file_name) values (%f, ''%s'')',
    [FEdiFileId, QryInputFILENAME.asString]);

  AId3 := GetNextID('EDI_ISA_HEADER');

  if (QryInputTYPE.asString = 'ASN') then
  begin
    VendorId := SelectValueFmtAsFloat
      ('select vendor_id from arcusto_schema where id = %f',
      [QryInputARCUSTO_SCHEMA_ID.asFloat]);
    Ainterchange_code := SelectValueFmtAsString
      ('select tp_interchange_code from edi_partners where vendor_id = %f',
      [VendorId]);
    AEdiPartnersId := SelectValueFmtAsFloat
      ('select id from edi_partners where vendor_id = %f', [VendorId]);

    ExecuteCommandFmt
      ('insert into EDI_ISA_HEADER (id, edi_file_id, vendor_id, interchange_code, edi_partners_id) '
      + ' values (%f, %f, %f, ''%s'', decode(%f, 0, null, %f))',
      [AId3, FEdiFileId, VendorId, Ainterchange_code, AEdiPartnersId,
      AEdiPartnersId]);
  end
  else
  begin
    ArcustoId := SelectValueFmtAsFloat
      ('select arcusto_id from arcusto_schema where id = %f',
      [QryInputARCUSTO_SCHEMA_ID.asFloat]);
    Ainterchange_code := SelectValueFmtAsString
      ('select tp_interchange_code from edi_partners where arcusto_id = %f',
      [ArcustoId]);
    AEdiPartnersId := SelectValueFmtAsFloat
      ('select id from edi_partners where arcusto_id = %f', [ArcustoId]);

    ExecuteCommandFmt
      ('insert into EDI_ISA_HEADER (id, edi_file_id, arcusto_id, interchange_code, edi_partners_id) '
      + ' values (%f, %f, %f, ''%s'', decode(%f, 0, null, %f))',
      [AId3, FEdiFileId, ArcustoId, Ainterchange_code, AEdiPartnersId,
      AEdiPartnersId]);

  end;

  AExt := UpperCase(ExtractFileExt(QryInputFILENAME.asString));

  ATrans := '830'; // forecasts
  if (QryInputTYPE.asString = 'ASN') then
    ATrans := '856';

  with TFDQuery.Create(self) do
    try
      Connection := uniMainModule.FDConnection1;

      Sql.Add(IQFormat
        ('select * from (select pono, ship_to_id, itemno, pt_descrip, uom, arinvt_id, min(id) as id '
        + '  from input_file_rec a ' + ' where input_file_id = %f ' +
        ' group by pono, ship_to_id, itemno, pt_descrip, uom, arinvt_id) ' +
        'order by id', [QryInputID.asFloat]));

      // Sql.Add(IQFormat('select distinct pono, ship_to_id, itemno, pt_descrip, uom, arinvt_id' +
      // '  from input_file_rec a ' +
      // ' where input_file_id = %f order by a.id' , [QryInputID.asFloat]));
      Open;
      if eof and bof then
        exit;

      I := 0;

      while not eof do
      begin
        AId1 := GetNextID('EDI_TS_HDR');
        ADockId := SelectValueFmtAsString
          ('select dockid from ship_to where id = %f',
          [FieldByName('ship_to_id').asFloat]);
        ExecuteCommandFmt
          ('insert into EDI_TS_HDR (id, edi_isa_header_id, transaction_set_id, pono, ship_to_id, dockid) '
          + ' values (%f, %f, ''%s'', ''%s'', %f, ''%s'')',
          [AId1, AId3, ATrans, FieldByName('pono').asString,
          FieldByName('ship_to_id').asFloat, ADockId]);

        AId2 := GetNextID('EDI_ORD_DETAIL');

        ExecuteCommandFmt
          ('insert into EDI_ord_detail (id, EDI_TS_HDR_id, pono, ship_to_id, pt_descrip, uom, aka_ptno) '
          + ' values (%f, %f, ''%s'', %f, ''%s'', decode(''%s'', ''PC'', ''EA'', ''%s''), ''%s'')',
          [AId2, AId1, FieldByName('pono').asString, FieldByName('ship_to_id')
          .asFloat, FieldByName('pt_descrip').asString,
          FieldByName('uom').asString, FieldByName('uom').asString,
          FieldByName('itemno').asString]);

        MatchEdiOrder(AId2, ArcustoId, FieldByName('ship_to_id').asFloat,
          FieldByName('arinvt_id').asFloat, FieldByName('pono').asString);

        Inc(I);
        FCaption := Format('%d prepost orders created', [I]);

        ProcessGenericReleases(AId2, FieldByName('pono').asString,
          FieldByName('ship_to_id').asFloat, FieldByName('itemno').asString,
          FieldByName('pt_descrip').asString,
          FieldByName('uom').asString, ATrans);

        Next;
      end;
    finally
      Free;
    end;
  Panel1.Caption := '';

  ProcessCustomSqlScript(Ainterchange_code, ATrans, FEdiFileId);
  CheckRollBackSegment;
  if not FAutoProcess then
    ShowOrders(FEdiFileId);
  // DoShowEdiOrders(self, Format('(%d)', [Trunc(FEdiFileId)]), RB)  {in EdiOrds.pas}

end;

procedure TFrmImp.Process_FA;
var
  AQry: TFDQuery;
  I: Integer;
begin
  FAbort := FALSE;
  AQry := TFDQuery.Create(self);
  with AQry do
    try
      Connection := uniMainModule.FDConnection1;
      Sql.Add(IQFormat('select distinct a.fa_asset_no,            ' +
        ' a.fa_descrip,             ' + ' a.fa_serial_number,      ' +
        ' a.fa_purchase_date,      ' + ' a.fa_in_service_date,    ' +
        ' a.fa_glacct_id_asset,    ' + ' a.fa_glacct_id_expense,    ' +
        ' a.fa_glacct_id_depreciation,    ' + ' a.eplant_id,    ' +
        ' a.fa_macrs_class_life_id, ' + ' a.fa_salvage_value,      ' +
        ' a.fa_useful_life,        ' + ' a.fa_acquisition_cost,   ' +
        ' a.fa_disposal_date,      ' + ' a.fa_disposal_type,      ' +
        ' a.fa_sale_amount         ' + '  from input_file_rec a ' +
        ' where a.input_file_id = %f ' +
        'and not exists (select id from input_file_log where input_file_rec_id = a.id)',
        [QryInputID.asFloat]));
      Open;
      I := 0;
      try
        while not eof do
        begin
          if FAbort then
            exit;
          Inc(I);
          FCaption := Format('%d Fixed assets processed', [I]);
          CreateFA(AQry);
          Next;
        end;
        if not FAutoProcess then
          IqConfirm(Format('%d Fixed assets processed', [I]));
      finally
        Panel1.Caption := '';
      end;
    finally
      Free;
    end;
end;

procedure TFrmImp.CreateFA(AQry: TFDQuery);
var
  aFaMainId: Real;

  afa_asset_no: String;
  afa_descrip: String;
  afa_serial_number: String;
  afa_purchase_date: String;
  afa_in_service_date: String;
  afa_glacct_id_asset: String;
  afa_glacct_id_expense: String;
  afa_glacct_id_depreciation: String;
  aeplant_id: String;
  afa_macrs_class_life_id: String;
  afa_salvage_value: String;
  afa_useful_life: String;
  afa_acquisition_cost: String;
  afa_disposal_date: String;
  afa_disposal_type: String;
  afa_sale_amount: String;
begin

  if AQry.FieldByName('fa_asset_no').asString = '' then
    afa_asset_no := ' is null '
  else
    afa_asset_no := Format(' = ''%s'' ',
      [StrTran(AQry.FieldByName('fa_asset_no').asString, '''', '''''')]);

  if AQry.FieldByName('fa_descrip').asString = '' then
    afa_descrip := ' is null '
  else
    afa_descrip := Format(' = ''%s'' ',
      [StrTran(AQry.FieldByName('fa_descrip').asString, '''', '''''')]);

  if AQry.FieldByName('fa_serial_number').asString = '' then
    afa_serial_number := ' is null '
  else
    afa_serial_number := Format(' = ''%s'' ',
      [StrTran(AQry.FieldByName('fa_serial_number').asString, '''', '''''')]);

  if AQry.FieldByName('fa_purchase_date').asFloat = 0 then
    afa_purchase_date := ' is null '
  else
    afa_purchase_date := Format(' = To_Date(''%s'', ''MM/DD/RR'') ',
      [FormatDateTime('mm/dd/yy', AQry.FieldByName('fa_purchase_date')
      .asDateTime)]);

  if AQry.FieldByName('fa_in_service_date').asFloat = 0 then
    afa_in_service_date := ' is null '
  else
    afa_in_service_date := Format(' = To_Date(''%s'', ''MM/DD/RR'') ',
      [FormatDateTime('mm/dd/yy', AQry.FieldByName('fa_in_service_date')
      .asDateTime)]);

  if AQry.FieldByName('fa_glacct_id_asset').asFloat = 0 then
    afa_glacct_id_asset := ' is null '
  else
    afa_glacct_id_asset := Format(' = %f ',
      [AQry.FieldByName('fa_glacct_id_asset').asFloat]);

  if AQry.FieldByName('fa_glacct_id_expense').asFloat = 0 then
    afa_glacct_id_expense := ' is null '
  else
    afa_glacct_id_expense := Format(' = %f ',
      [AQry.FieldByName('fa_glacct_id_expense').asFloat]);

  if AQry.FieldByName('fa_glacct_id_depreciation').asFloat = 0 then
    afa_glacct_id_depreciation := ' is null '
  else
    afa_glacct_id_depreciation :=
      Format(' = %f ', [AQry.FieldByName('fa_glacct_id_depreciation').asFloat]);

  if AQry.FieldByName('eplant_id').asFloat = 0 then
    aeplant_id := ' is null '
  else
    aeplant_id := Format(' = %f ', [AQry.FieldByName('eplant_id').asFloat]);

  if AQry.FieldByName('fa_macrs_class_life_id').asFloat = 0 then
    afa_macrs_class_life_id := ' is null '
  else
    afa_macrs_class_life_id :=
      Format(' = %f ', [AQry.FieldByName('fa_macrs_class_life_id').asFloat]);

  if AQry.FieldByName('fa_salvage_value').asFloat = 0 then
    afa_salvage_value := ' = 0 '
  else
    afa_salvage_value := Format(' = %f ',
      [AQry.FieldByName('fa_salvage_value').asFloat]);

  if AQry.FieldByName('fa_useful_life').asFloat = 0 then
    afa_useful_life := ' = 0 '
  else
    afa_useful_life := Format(' = %f ',
      [AQry.FieldByName('fa_useful_life').asFloat]);

  if AQry.FieldByName('fa_acquisition_cost').asFloat = 0 then
    afa_acquisition_cost := ' = 0 '
  else
    afa_acquisition_cost := Format(' = %f ',
      [AQry.FieldByName('fa_acquisition_cost').asFloat]);

  if AQry.FieldByName('fa_disposal_date').asFloat = 0 then
    afa_disposal_date := ' is null '
  else
    afa_disposal_date := Format(' = To_Date(''%s'', ''MM/DD/RR'') ',
      [FormatDateTime('mm/dd/yy', AQry.FieldByName('fa_disposal_date')
      .asDateTime)]);

  if AQry.FieldByName('fa_disposal_type').asString = '' then
    afa_disposal_type := ' is null '
  else
    afa_disposal_type := Format(' = ''%s'' ',
      [StrTran(AQry.FieldByName('fa_disposal_type').asString, '''', '''''')]);

  if AQry.FieldByName('fa_sale_amount').asFloat = 0 then
    afa_sale_amount := ' = 0 '
  else
    afa_sale_amount := Format(' = %f ',
      [AQry.FieldByName('fa_sale_amount').asFloat]);

  aFaMainId := SelectValueFmtAsFloat('select id from fa_main where ' +
    ' asset_no          %s  and ' + ' descrip           %s  and ' +
    ' serial_number     %s  and ' + ' purchase_date     %s  and ' +
    ' in_service_date   %s  and ' + ' glacct_id_asset   %s  and ' +
    ' glacct_id_expense %s  and ' + ' glacct_id_depreciation    %s  and ' +
    ' eplant_id    %s  and ' + ' NVL(salvage_value, 0)     %s  and ' +
    ' NVL(useful_life, 0)       %s  and ' +
    ' NVL(acquisition_cost, 0)  %s  and ' + ' disposal_date     %s  and ' +
    ' disposal_type     %s  and ' + ' NVL(sale_amount, 0)       %s ',

    [afa_asset_no, afa_descrip, afa_serial_number, afa_purchase_date,
    afa_in_service_date, afa_glacct_id_asset, afa_glacct_id_expense,
    afa_glacct_id_depreciation, aeplant_id, afa_salvage_value, afa_useful_life,
    afa_acquisition_cost, afa_disposal_date, afa_disposal_type,
    afa_sale_amount]);

  if aFaMainId <> 0 then
    exit;

  aFaMainId := GetNextID('FA_MAIN');
  ExecuteCommandFmt('insert into fa_main (id               , ' +
    'asset_no         , ' + 'descrip          , ' + 'serial_number    , ' +
    'purchase_date    , ' + 'in_service_date  , ' + 'glacct_id_asset  , ' +
    'glacct_id_expense, ' + 'glacct_id_depreciation, ' + 'eplant_id        , ' +
    'salvage_value    , ' + 'useful_life      , ' + 'acquisition_cost , ' +
    'disposal_date    , ' + 'disposal_type    , ' + 'sale_amount )      ' +
    ' values (%f, ' + ' ''%s'', ' + ' ''%s'', ' + ' ''%s'', ' +
    ' decode(%f, 0, null, To_Date(''%s'', ''MM/DD/RRRR'')), ' +
    ' decode(%f, 0, null, To_Date(''%s'', ''MM/DD/RRRR'')), ' +
    ' decode(%f, 0, null, %f), ' + ' decode(%f, 0, null, %f), ' +
    ' decode(%f, 0, null, %f), ' + ' decode(%f, 0, null, %f), ' + ' %f, ' +
    ' %f, ' + ' %f, ' +
    ' decode(%f, 0, null, To_Date(''%s'', ''MM/DD/RRRR'')), ' + ' ''%s'', ' +
    ' %f) ', [aFaMainId, StrTran(AQry.FieldByName('fa_asset_no').asString, '''',
    ''''''), StrTran(AQry.FieldByName('fa_descrip').asString, '''', ''''''),
    StrTran(AQry.FieldByName('fa_serial_number').asString, '''', ''''''),
    AQry.FieldByName('fa_purchase_date').asFloat, FormatDateTime('mm/dd/yyyy',
    AQry.FieldByName('fa_purchase_date').asDateTime),
    AQry.FieldByName('fa_in_service_date').asFloat, FormatDateTime('mm/dd/yyyy',
    AQry.FieldByName('fa_in_service_date').asDateTime),
    AQry.FieldByName('fa_glacct_id_asset').asFloat,
    AQry.FieldByName('fa_glacct_id_asset').asFloat,
    AQry.FieldByName('fa_glacct_id_expense').asFloat,
    AQry.FieldByName('fa_glacct_id_expense').asFloat,
    AQry.FieldByName('fa_glacct_id_depreciation').asFloat,
    AQry.FieldByName('fa_glacct_id_depreciation').asFloat,
    AQry.FieldByName('eplant_id').asFloat, AQry.FieldByName('eplant_id')
    .asFloat, AQry.FieldByName('fa_salvage_value').asFloat,
    AQry.FieldByName('fa_useful_life').asFloat,
    AQry.FieldByName('fa_acquisition_cost').asFloat,
    AQry.FieldByName('fa_disposal_date').asFloat, FormatDateTime('mm/dd/yyyy',
    AQry.FieldByName('fa_disposal_date').asDateTime),
    AQry.FieldByName('fa_disposal_type').asString,
    AQry.FieldByName('fa_sale_amount').asFloat]);

  ProcessFA_Book(afa_asset_no, afa_descrip, afa_serial_number,
    afa_purchase_date, afa_in_service_date, afa_glacct_id_asset,
    afa_salvage_value, afa_useful_life, afa_acquisition_cost, afa_disposal_date,
    afa_disposal_type, afa_sale_amount, aFaMainId, afa_macrs_class_life_id);

end;

procedure TFrmImp.ProcessFA_Book(afa_asset_no, afa_descrip, afa_serial_number,
  afa_purchase_date, afa_in_service_date, afa_glacct_id_asset,
  afa_salvage_value, afa_useful_life, afa_acquisition_cost, afa_disposal_date,
  afa_disposal_type, afa_sale_amount: String; aFaMainId: Real;
  afa_macrs_class_life_id: String);
var
  AQry: TFDQuery;
  AFaBookId: Real;
  AProcedure_to_run: String;
begin
  AQry := TFDQuery.Create(self);
  with AQry do
    try
      Connection := uniMainModule.FDConnection1;
      Sql.Add(Format('select distinct fa_depreciation_method,      ' +
        ' fa_book_type,               ' + ' fa_declining_bal_percent,   ' +
        ' fa_convention,              ' + ' fa_property_class,          ' +
        ' fa_sec_1250_real_property,  ' + ' fa_sec_1245_property,       ' +
        ' fa_listed_property,         ' + ' fa_ny_liberty__zone,        ' +
        ' fa_amortized,               ' + ' fa_business_use_prcnt,      ' +
        ' fa_itc_amount,              ' + ' fa_section_179_ded,         ' +
        ' fa_posting_basis,           ' + ' fa_book_descrip,            ' +
        ' fa_macrs_class_life_id      ' + ' from input_file_rec             ' +
        ' where ' + ' fa_asset_no          %s  and ' +
        ' fa_descrip           %s  and ' + ' fa_serial_number     %s  and ' +
        ' fa_purchase_date     %s  and ' + ' fa_in_service_date   %s  and ' +
        ' fa_glacct_id_asset   %s  and ' +
        ' NVL(fa_salvage_value, 0)     %s  and ' +
        ' NVL(fa_useful_life, 0)       %s  and ' +
        ' NVL(fa_acquisition_cost, 0)  %s  and ' +
        ' fa_disposal_date     %s  and ' + ' fa_disposal_type     %s  and ' +
        ' NVL(fa_sale_amount, 0)       %s ',
        // ' NVL(fa_sale_amount, 0)       %s and ' +
        // ' fa_macrs_class_life_id %s ',
        [afa_asset_no, afa_descrip, afa_serial_number, afa_purchase_date,
        afa_in_service_date, afa_glacct_id_asset, afa_salvage_value,
        afa_useful_life, afa_acquisition_cost, afa_disposal_date,
        afa_disposal_type, afa_sale_amount]));
      // afa_macrs_class_life_id]));
      Open;
      while not eof do
      begin
        AFaBookId := GetNextID('FA_BOOK');
        AProcedure_to_run := SelectValueFmtAsString
          ('select procedure_to_run from fa_book_template where depreciation_method = ''%s''',
          [AQry.FieldByName('fa_depreciation_method').asString]);
        ExecuteCommandFmt(' insert into fa_book ' +
          '( id, depreciation_method, procedure_to_run,  ' +
          ' descrip,               ' + ' book_type,               ' +
          ' declining_bal_percent,   ' + ' convention,              ' +
          ' property_class,          ' + ' sec_1250_real_property,  ' +
          ' sec_1245_property,       ' + ' listed_property,         ' +
          ' ny_liberty_zone,         ' + ' amortized,               ' +
          ' business_use_prcnt,      ' + ' itc_amount,              ' +
          ' section_179_ded,         ' + ' fa_main_id,              ' +
          ' fa_macrs_class_life_id,  ' + ' posting_basis )           ' +
          ' values ( %f, ''%s'', ''%s'', ' + '  ''%s'', ' + '  ''%s'', ' +
          ' decode(%f, 0, null, %f), ' + '  ''%s'', ' + '  ''%s'', ' +
          '  ''%s'', ' + '  ''%s'', ' + '  ''%s'', ' + '  ''%s'', ' +
          '  ''%s'', ' + ' decode(%f, 0, null, %f), ' +
          ' decode(%f, 0, null, %f), ' + '  ''%s'', ' + '  %f, ' +
          ' decode(%f, 0, null, %f), ' + '  ''%s'') ',
          [AFaBookId, AQry.FieldByName('fa_depreciation_method').asString,
          AProcedure_to_run, AQry.FieldByName('fa_book_descrip').asString,
          AQry.FieldByName('fa_book_type').asString,
          AQry.FieldByName('fa_declining_bal_percent').asFloat,
          AQry.FieldByName('fa_declining_bal_percent').asFloat,
          AQry.FieldByName('fa_convention').asString,
          AQry.FieldByName('fa_property_class').asString,
          AQry.FieldByName('fa_sec_1250_real_property').asString,
          AQry.FieldByName('fa_sec_1245_property').asString,
          AQry.FieldByName('fa_listed_property').asString,
          AQry.FieldByName('fa_ny_liberty__zone').asString,
          AQry.FieldByName('fa_amortized').asString,
          AQry.FieldByName('fa_business_use_prcnt').asFloat,
          AQry.FieldByName('fa_business_use_prcnt').asFloat,
          AQry.FieldByName('fa_itc_amount').asFloat,
          AQry.FieldByName('fa_itc_amount').asFloat,
          AQry.FieldByName('fa_section_179_ded').asString, aFaMainId,
          AQry.FieldByName('fa_macrs_class_life_id').asFloat,
          AQry.FieldByName('fa_macrs_class_life_id').asFloat,
          AQry.FieldByName('fa_posting_basis').asString]);

        ProcessFA_DEPR_POSTING(AQry, AFaBookId, afa_asset_no, afa_descrip,
          afa_serial_number, afa_purchase_date, afa_in_service_date,
          afa_glacct_id_asset, afa_salvage_value, afa_useful_life,
          afa_acquisition_cost, afa_disposal_date, afa_disposal_type,
          afa_sale_amount);

        Next;
      end;
    finally
      Free;
    end;
end;

procedure TFrmImp.ProcessFA_DEPR_POSTING(AQry: TFDQuery; AFaBookId: Real;
  afa_asset_no, afa_descrip, afa_serial_number, afa_purchase_date,
  afa_in_service_date, afa_glacct_id_asset, afa_salvage_value, afa_useful_life,
  afa_acquisition_cost, afa_disposal_date, afa_disposal_type,
  afa_sale_amount: String);

var
  afa_depreciation_method: String;
  afa_book_type: String;
  afa_declining_bal_percent: String;
  afa_convention: String;
  afa_property_class: String;
  afa_sec_1250_real_property: String;
  afa_sec_1245_property: String;
  afa_listed_property: String;
  afa_ny_liberty__zone: String;
  afa_amortized: String;
  afa_business_use_prcnt: String;
  afa_itc_amount: String;
  afa_section_179_ded: String;
  afa_posting_basis: String;
begin
  if AQry.FieldByName('fa_depreciation_method').asString = '' then
    afa_depreciation_method := ' is null '
  else
    afa_depreciation_method := Format(' = ''%s'' ',
      [AQry.FieldByName('fa_depreciation_method').asString]);

  if AQry.FieldByName('fa_book_type').asString = '' then
    afa_book_type := ' is null '
  else
    afa_book_type := Format(' = ''%s'' ',
      [AQry.FieldByName('fa_book_type').asString]);

  if AQry.FieldByName('fa_declining_bal_percent').asFloat = 0 then
    afa_declining_bal_percent := ' = 0 '
  else
    afa_declining_bal_percent :=
      Format(' = %f ', [AQry.FieldByName('fa_declining_bal_percent').asFloat]);

  if AQry.FieldByName('fa_convention').asString = '' then
    afa_convention := ' is null '
  else
    afa_convention := Format(' = ''%s'' ',
      [AQry.FieldByName('fa_convention').asString]);

  if AQry.FieldByName('fa_property_class').asString = '' then
    afa_property_class := ' is null '
  else
    afa_property_class := Format(' = ''%s'' ',
      [AQry.FieldByName('fa_property_class').asString]);

  if AQry.FieldByName('fa_sec_1250_real_property').asString = '' then
    afa_sec_1250_real_property := ' is null '
  else
    afa_sec_1250_real_property := Format(' = ''%s'' ',
      [AQry.FieldByName('fa_sec_1250_real_property').asString]);

  if AQry.FieldByName('fa_sec_1245_property').asString = '' then
    afa_sec_1245_property := ' is null '
  else
    afa_sec_1245_property := Format(' = ''%s'' ',
      [AQry.FieldByName('fa_sec_1245_property').asString]);

  if AQry.FieldByName('fa_listed_property').asString = '' then
    afa_listed_property := ' is null '
  else
    afa_listed_property := Format(' = ''%s'' ',
      [AQry.FieldByName('fa_listed_property').asString]);

  if AQry.FieldByName('fa_ny_liberty__zone').asString = '' then
    afa_ny_liberty__zone := ' is null '
  else
    afa_ny_liberty__zone := Format(' = ''%s'' ',
      [AQry.FieldByName('fa_ny_liberty__zone').asString]);

  if AQry.FieldByName('fa_amortized').asString = '' then
    afa_amortized := ' is null '
  else
    afa_amortized := Format(' = ''%s'' ',
      [AQry.FieldByName('fa_amortized').asString]);

  if AQry.FieldByName('fa_business_use_prcnt').asFloat = 0 then
    afa_business_use_prcnt := ' = 0 '
  else
    afa_business_use_prcnt :=
      Format(' = %f ', [AQry.FieldByName('fa_business_use_prcnt').asFloat]);

  if AQry.FieldByName('fa_itc_amount').asFloat = 0 then
    afa_itc_amount := ' = 0 '
  else
    afa_itc_amount := Format(' = %f ',
      [AQry.FieldByName('fa_itc_amount').asFloat]);

  if AQry.FieldByName('fa_section_179_ded').asString = '' then
    afa_section_179_ded := ' is null '
  else
    afa_section_179_ded := Format(' = ''%s'' ',
      [AQry.FieldByName('fa_section_179_ded').asString]);

  if AQry.FieldByName('fa_posting_basis').asString = '' then
    afa_posting_basis := ' is null '
  else
    afa_posting_basis := Format(' = ''%s'' ',
      [AQry.FieldByName('fa_posting_basis').asString]);

  with TFDQuery.Create(self) do
    try
      Connection := uniMainModule.FDConnection1;

      Sql.Add(Format
        ('select NVL(fa_post_date, sysdate) fa_post_date, fa_amount from input_file_rec '
        + ' where ' + ' fa_asset_no          %s  and ' +
        ' fa_descrip           %s  and ' + ' fa_serial_number     %s  and ' +
        ' fa_purchase_date     %s  and ' + ' fa_in_service_date   %s  and ' +
        ' fa_glacct_id_asset   %s  and ' +
        ' NVL(fa_salvage_value, 0)     %s  and ' +
        ' NVL(fa_useful_life, 0)       %s  and ' +
        ' NVL(fa_acquisition_cost, 0)  %s  and ' +
        ' fa_disposal_date     %s  and ' + ' fa_disposal_type     %s  and ' +
        ' NVL(fa_sale_amount, 0)       %s and ' +
        ' fa_depreciation_method  %s and    ' +
        ' fa_book_type            %s and   ' +
        ' NVL(fa_declining_bal_percent, 0) %s and  ' +
        ' fa_convention             %s and ' +
        ' fa_property_class         %s and ' +
        ' fa_sec_1250_real_property %s and ' +
        ' fa_sec_1245_property      %s and ' +
        ' fa_listed_property        %s and ' +
        ' fa_ny_liberty__zone       %s and ' +
        ' fa_amortized              %s and ' +
        ' NVL(fa_business_use_prcnt, 0)  %s and    ' +
        ' NVL(fa_itc_amount, 0)          %s and    ' +
        ' fa_section_179_ded       %s and  ' + ' fa_posting_basis         %s ',
        [afa_asset_no, afa_descrip, afa_serial_number, afa_purchase_date,
        afa_in_service_date, afa_glacct_id_asset, afa_salvage_value,
        afa_useful_life, afa_acquisition_cost, afa_disposal_date,
        afa_disposal_type, afa_sale_amount, afa_depreciation_method,
        afa_book_type, afa_declining_bal_percent, afa_convention,
        afa_property_class, afa_sec_1250_real_property, afa_sec_1245_property,
        afa_listed_property, afa_ny_liberty__zone, afa_amortized,
        afa_business_use_prcnt, afa_itc_amount, afa_section_179_ded,
        afa_posting_basis]));
      Open;
      while not eof do
      begin
        ExecuteCommandFmt
          ('insert into fa_depr_posting (fa_book_id, post_date, amount, beg_balance) '
          + ' values (%f, To_Date(''%s'', ''MM/DD/RRRR''), %f, ''Y'')',
          [AFaBookId, FormatDateTime('mm/dd/yyyy', FieldByName('fa_post_date')
          .asDateTime), FieldByName('fa_amount').asFloat]);

        Next;
      end;
    finally
      Free;
    end;

end;

procedure TFrmImp.Process_XML;
var
  AId1, AId2, AId3, ArcustoId: Real;
  ATrans, ADockId: String;
  I: Integer;
  Ainterchange_code: String;
begin
  FEdiFileId := GetNextID('EDI_FILE');
  ExecuteCommandFmt('insert into edi_file (id, file_name) values (%f, ''%s'')',
    [FEdiFileId, QryInputFILENAME.asString]);

  AId3 := GetNextID('EDI_ISA_HEADER');

  ArcustoId := SelectValueFmtAsFloat
    ('select arcusto_id from arcusto_schema where id = %f',
    [QryInputARCUSTO_SCHEMA_ID.asFloat]);

  Ainterchange_code := SelectValueFmtAsString
    ('select tp_interchange_code from edi_partners where arcusto_id = %f',
    [ArcustoId]);

  ExecuteCommandFmt
    ('insert into EDI_ISA_HEADER (id, edi_file_id, arcusto_id, interchange_code) values (%f, %f, %f, ''%s'')',
    [AId3, FEdiFileId, ArcustoId, Ainterchange_code]);

  ATrans := '830';

  with TFDQuery.Create(self) do
    try
      Connection := uniMainModule.FDConnection1;

      Sql.Add(IQFormat
        ('select * from (select pono, ship_to_id, itemno, arinvt_id, min(id) as id '
        + '  from input_file_rec a ' + ' where input_file_id = %f ' +
        ' group by pono, ship_to_id, itemno, arinvt_id) ' + 'order by id',
        [QryInputID.asFloat]));

      // Sql.Add(IQFormat('select distinct pono, ship_to_id, itemno, arinvt_id' +
      // '  from input_file_rec a ' +
      // ' where input_file_id = %f order by a.id' , [QryInputID.asFloat]));
      Open;
      if eof and bof then
        exit;

      I := 0;

      while not eof do
      begin
        AId1 := GetNextID('EDI_TS_HDR');
        ADockId := SelectValueFmtAsString
          ('select dockid from ship_to where id = %f',
          [FieldByName('ship_to_id').asFloat]);
        ExecuteCommandFmt
          ('insert into EDI_TS_HDR (id, edi_isa_header_id, transaction_set_id, pono, ship_to_id, dockid) '
          + ' values (%f, %f, ''%s'', ''%s'', %f, ''%s'')',
          [AId1, AId3, ATrans, FieldByName('pono').asString,
          FieldByName('ship_to_id').asFloat, ADockId]);

        AId2 := GetNextID('EDI_ORD_DETAIL');

        ExecuteCommandFmt
          ('insert into EDI_ord_detail (id, EDI_TS_HDR_id, pono, ship_to_id, aka_ptno) '
          + ' values (%f, %f, ''%s'', %f, ''%s'')',
          [AId2, AId1, FieldByName('pono').asString, FieldByName('ship_to_id')
          .asFloat, FieldByName('itemno').asString]);

        MatchEdiOrder(AId2, ArcustoId, FieldByName('ship_to_id').asFloat,
          FieldByName('arinvt_id').asFloat, FieldByName('pono').asString);

        Inc(I);
        FCaption := Format('%d prepost orders created', [I]);

        ProcessXMLReleases(AId2, FieldByName('pono').asString,
          FieldByName('ship_to_id').asFloat, FieldByName('itemno')
          .asString, ATrans);
        Next;
      end;
    finally
      Free;
    end;
  Panel1.Caption := '';

  ProcessCustomSqlScript(Ainterchange_code, ATrans, FEdiFileId);
  CheckRollBackSegment;
  if not FAutoProcess then
    ShowOrders(FEdiFileId);
  // DoShowEdiOrders(self, Format('(%d)', [Trunc(FEdiFileId)]), RB)  {in EdiOrds.pas}

end;

procedure TFrmImp.ProcessXMLReleases(AId: Real; APono: String;
  Aship_to_id: Real; AItemno, ATrans: String);
var
  I: Integer;
  AEdiShipId: Real;
begin
  with TFDQuery.Create(self) do
    try
      Connection := uniMainModule.FDConnection1;
      Sql.Add(IQFormat
        ('select id, request_date, qty, cuser1, cuser2, arinvt_id, descrip, ' +
        'Last_Receipt_Date, ' + 'Last_Receipt_Qty,  ' + 'Pt_Descrip,        ' +
        'Bill_TO_Id,        ' + 'Cust_Cum_ATH_PQ    ' +
        '  from input_file_rec a ' + ' where input_file_id = %f ' +
        ' and pono = ''%s'' ' + ' and ship_to_id = %f ' +
        ' and itemno = ''%s'' ' + ' order by ord_date', [QryInputID.asFloat,
        APono, Aship_to_id, AItemno]));
      Open;
      if eof and bof then
        exit;

      ExecuteCommandFmt('update edi_ord_detail set arinvt_id = %f, ' +
        'Last_Receipt_Date = decode(%f, 0, null, To_Date(''%s'', ''MM/DD/RRRR'')), '
        + 'Last_Receipt_Qty  = decode(%.6f, 0, null, %.6f),  ' +
        'Bill_TO_Id        = decode(%f, 0, null, %f), ' +
        'Cust_Cum_ATH_PQ   = decode(%.6f, 0, null, %.6f),  ' +
        ' uom = ''%s'', pt_descrip = ''%s'' where id = %f',
        [FieldByName('arinvt_id').asFloat, FieldByName('Last_Receipt_Date')
        .asFloat, FormatDateTime('mm/dd/yyyy', FieldByName('Last_Receipt_Date')
        .asDateTime), FieldByName('Last_Receipt_Qty').asFloat,
        FieldByName('Last_Receipt_Qty').asFloat, FieldByName('bill_to_id')
        .asFloat, FieldByName('bill_to_id').asFloat,
        FieldByName('Cust_Cum_ATH_PQ').asFloat, FieldByName('Cust_Cum_ATH_PQ')
        .asFloat, FieldByName('cuser2').asString, FieldByName('descrip')
        .asString, AId]);

      I := 0;

      while not eof do
      begin
        AEdiShipId := GetNextID('EDI_SHIP');
        ExecuteCommandFmt
          ('insert into edi_ship (id, edi_ord_detail_id, deldate, delquan, forecast) '
          + ' values (%f, %f, To_Date(''%s'', ''MM/DD/RRRR''), %f, ''%s'' )',
          [AEdiShipId, AId, FormatDateTime('mm/dd/yyyy',
          FieldByName('request_date').asDateTime), FieldByName('qty').asFloat,
          FieldByName('cuser1').asString]);

        ExecuteCommandFmt
          ('update input_file_rec set edi_ship_id = %f, edi_ord_detail_id = %f where id = %f',
          [AEdiShipId, AId, FieldByName('id').asFloat]);

        Inc(I);
        Panel1.Caption := Format('%s (%d releases)', [FCaption, I]);
        Application.processmessages;

        Next;
      end;

    finally
      Free;
    end;
end;

procedure TFrmImp.ProcessElectroluxReleases(AId: Real; APono: String;
  Aship_to_id: Real; AItemno, ACuser2, ACuser3, ATrans: String);
var
  I: Integer;
  AEdiShipId: Real;
begin
  with TFDQuery.Create(self) do
    try
      Connection := uniMainModule.FDConnection1;
      Sql.Add(IQFormat('select id, ord_date, qty, cuser5, arinvt_id, ' +
        'Last_Receipt_Date, ' + 'Last_Receipt_Qty,  ' + 'UOM,               ' +
        'Pt_Descrip,        ' + 'Bill_TO_Id,        ' + 'Cust_Cum_ATH_PQ    ' +
        '  from input_file_rec a ' + ' where input_file_id = %f ' +
        ' and pono = ''%s'' ' + ' and ship_to_id = %f ' +
        ' and itemno = ''%s'' ' + ' and cuser2 = ''%s'' ' +
        ' and cuser3 = ''%s'' ' + ' order by ord_date', [QryInputID.asFloat,
        APono, Aship_to_id, AItemno, ACuser2, ACuser3]));
      Open;
      if eof and bof then
        exit;

      ExecuteCommandFmt('update edi_ord_detail ' + 'set arinvt_id = %f, ' +
        'Last_Receipt_Date = decode(%f, 0, null, To_Date(''%s'', ''MM/DD/RRRR'')), '
        + 'Last_Receipt_Qty  = decode(%.6f, 0, null, %.6f),  ' +
        'UOM               = ''%s'', ' + 'Pt_Descrip        = ''%s'', ' +
        'Bill_TO_Id        = decode(%f, 0, null, %f), ' +
        'Cust_Cum_ATH_PQ   = decode(%.6f, 0, null, %.6f)  ' + ' where id = %f',
        [FieldByName('arinvt_id').asFloat, FieldByName('Last_Receipt_Date')
        .asFloat, FormatDateTime('mm/dd/yyyy', FieldByName('Last_Receipt_Date')
        .asDateTime), FieldByName('Last_Receipt_Qty').asFloat,
        FieldByName('Last_Receipt_Qty').asFloat, FieldByName('uom').asString,
        FieldByName('pt_descrip').asString, FieldByName('bill_to_id').asFloat,
        FieldByName('bill_to_id').asFloat, FieldByName('Cust_Cum_ATH_PQ')
        .asFloat, FieldByName('Cust_Cum_ATH_PQ').asFloat, AId]);

      I := 0;

      while not eof do
      begin
        AEdiShipId := GetNextID('EDI_SHIP');
        ExecuteCommandFmt
          ('insert into edi_ship (id, edi_ord_detail_id, deldate, delquan, forecast, delorderno) '
          + ' values (%f, %f, To_Date(''%s'', ''MM/DD/RRRR''), %f, decode(''%s'', ''830'', ''D'', ''C''), ''%s''  )',
          [AEdiShipId, AId, FormatDateTime('mm/dd/yyyy', FieldByName('ord_date')
          .asDateTime), FieldByName('qty').asFloat, ATrans,
          FieldByName('cuser5').asString]);

        ExecuteCommandFmt
          ('update input_file_rec set edi_ship_id = %f, edi_ord_detail_id = %f where id = %f',
          [AEdiShipId, AId, FieldByName('id').asFloat]);

        Inc(I);
        Panel1.Caption := Format('%s (%d releases)', [FCaption, I]);
        Application.processmessages;

        Next;
      end;

    finally
      Free;
    end;
end;

procedure TFrmImp.ProcessGenericReleases(AId: Real; APono: String;
  Aship_to_id: Real; AItemno, Apt_descrip, AUom, ATrans: String);
var
  I: Integer;
  AEdiShipId: Real;
begin

  with TFDQuery.Create(self) do
    try
      Connection := uniMainModule.FDConnection1;
      Sql.Add(IQFormat
        ('select id, ord_date, qty, delorderno, arinvt_id, NVL(forecast, ''^^^^^'') as forecast, '
        + 'Last_Receipt_Date, ' + 'Last_Receipt_Qty,  ' + 'UOM,               '
        + 'Pt_Descrip,        ' + 'Bill_TO_Id,        ' + 'Cust_Cum_ATH_PQ    '
        + '  from input_file_rec a ' + ' where input_file_id = %f ' +
        ' and pono = ''%s'' ' + ' and ship_to_id = %f ' +
        ' and itemno = ''%s'' ' +
        ' and NVL(pt_descrip, '' '') = NVL(''%s'', '' '') ' +
        ' and NVL(uom, '' '') = NVL(''%s'', '' '') ' + ' order by ord_date',
        [QryInputID.asFloat, APono, Aship_to_id, AItemno, Apt_descrip, AUom]));
      Open;
      if eof and bof then
        exit;

      ExecuteCommandFmt('update edi_ord_detail ' + 'set arinvt_id = %f, ' +
        'Last_Receipt_Date = decode(%f, 0, null, To_Date(''%s'', ''MM/DD/RRRR'')), '
        + 'Last_Receipt_Qty  = decode(%.6f, 0, null, %.6f),  ' +
        'UOM               = ''%s'', ' + 'Pt_Descrip        = ''%s'', ' +
        'Bill_TO_Id        = decode(%f, 0, null, %f), ' +
        'Cust_Cum_ATH_PQ   = decode(%.6f, 0, null, %.6f)  ' + ' where id = %f',
        [FieldByName('arinvt_id').asFloat, FieldByName('Last_Receipt_Date')
        .asFloat, FormatDateTime('mm/dd/yyyy', FieldByName('Last_Receipt_Date')
        .asDateTime), FieldByName('Last_Receipt_Qty').asFloat,
        FieldByName('Last_Receipt_Qty').asFloat, FieldByName('uom').asString,
        FieldByName('pt_descrip').asString, FieldByName('bill_to_id').asFloat,
        FieldByName('bill_to_id').asFloat, FieldByName('Cust_Cum_ATH_PQ')
        .asFloat, FieldByName('Cust_Cum_ATH_PQ').asFloat, AId]);

      I := 0;

      while not eof do
      begin
        AEdiShipId := GetNextID('EDI_SHIP');
        ExecuteCommandFmt
          ('insert into edi_ship (id, edi_ord_detail_id, deldate, delquan, forecast, delorderno) '
          + ' values (%f, %f, To_Date(''%s'', ''MM/DD/RRRR''), %f, decode(''%s'', ''^^^^^'', ''D'', ''%s''), ''%s''  )',
          [AEdiShipId, AId, FormatDateTime('mm/dd/yyyy', FieldByName('ord_date')
          .asDateTime), FieldByName('qty').asFloat, FieldByName('forecast')
          .asString, FieldByName('forecast').asString, FieldByName('delorderno')
          .asString]);

        ExecuteCommandFmt
          ('update input_file_rec set edi_ship_id = %f, edi_ord_detail_id = %f where id = %f',
          [AEdiShipId, AId, FieldByName('id').asFloat]);

        Inc(I);
        Panel1.Caption := Format('%s (%d releases)', [FCaption, I]);
        Application.processmessages;

        Next;
      end;

    finally
      Free;
    end;
end;

procedure TFrmImp.MatchEdiOrder(AId, ArcustoId, Aship_to_id, Arinvt_id: Real;
  APono: String);
var
  AEplantId, AOrdersId: Real;
begin
  AEplantId := SelectValueFmtAsFloat
    ('select eplant_id from ship_to where id = %f', [Aship_to_id]);
  if AEplantId = 0 then
    AOrdersId := SelectValueFmtAsFloat
      ('select d.orders_id from ord_detail d, orders o ' +
      'where o.arcusto_id = %f ' + 'and d.orders_id = o.id ' +
      'and o.ship_to_id = %f ' + 'and d.arinvt_id = %f ' +
      'and NVL(pono, '' '') = NVL(''%s'', '' '')',
      [ArcustoId, Aship_to_id, Arinvt_id, APono])
  else
    AOrdersId := SelectValueFmtAsFloat
      ('select d.orders_id from ord_detail d, orders o ' +
      'where o.arcusto_id = %f ' + 'and d.orders_id = o.id ' +
      'and o.ship_to_id = %f ' + 'and d.arinvt_id = %f ' +
      'and o.eplant_id = %f ' + 'and NVL(pono, '' '') = NVL(''%s'', '' '')',
      [ArcustoId, Aship_to_id, Arinvt_id, AEplantId, APono]);
  if AOrdersId <> 0 then
    ExecuteCommandFmt('update edi_ord_detail set orders_id = %f where id = %f',
      [AOrdersId, AId]);
end;

procedure TFrmImp.CreateOrderHeaderZIO(AQry: TFDQuery);
var
  ArcustoId: Real;
  AOrdersId, AOrderDtlId: Real;
  APono: String;
  ASeqNo: Integer;
  AOrdDetailId, AReleasesId: Real;
  AUom: String;
  ATaxCodeID: Real;
begin
  ASeqNo := 0;
  with TFDQuery.Create(self) do
    try
      Connection := uniMainModule.FDConnection1;
      Sql.Add(IQFormat('select a.id, a.arcusto_id, a.pono ' +
        '  from input_file_rec a' + ' where a.id = %f ' +
        'and not exists (select id from input_file_log where input_file_rec_id = a.id)',
        [AQry.FieldByName('ID').asFloat]));
      Open;
      if eof and bof then
        exit;

      ArcustoId := FieldByName('arcusto_id').asFloat;
      APono := FieldByName('pono').asString;

    finally
      Free;
    end;
  AOrdersId := CreateNewOrderZIO(ArcustoId, APono, AQry);
  if AOrdersId <> 0 then
  begin
    ExecuteCommandFmt('update input_file_rec set orders_id = %f where id = %f',
      [AOrdersId, AQry.FieldByName('id').asFloat]);

    if (AQry.FieldByName('ord_detail_id').asFloat <> 0) and
      (SelectValueFmtAsFloat('select id from ord_detail where id = %f',
      [AQry.FieldByName('ord_detail_id').asFloat]) <> 0) then
      AOrderDtlId := AQry.FieldByName('ord_detail_id').asFloat
    else
    begin
      Inc(ASeqNo);
      AOrderDtlId := GetNextID('ORD_DETAIL');
      AUom := AQry.FieldByName('uom').asString;
      ATaxCodeID := SelectValueFmtAsFloat
        ('select s.tax_code_id from ship_to s, orders o ' +
        'where o.ship_to_id = s.id and o.id = %f', [AOrdersId]);

      ExecuteCommandFmt
        ('insert into ord_detail (id, orders_id, arinvt_id, total_qty_ord, ' +
        'unit, uom_factor, tax_code_id, ord_det_seqno, comment1) ' +
        'values (%f, %f, %f, %f, ''%s'', %.6f, decode(%f, 0, null, %f), %d, ''%s'') ',
        [AOrderDtlId, AOrdersId, AQry.FieldByName('Arinvt_id').asFloat,
        AQry.FieldByName('qty').asFloat, AUom, IQToNativeUomFactor(AUom,
        AQry.FieldByName('Arinvt_id').asFloat, True), ATaxCodeID, ATaxCodeID, 1,
        AQry.FieldByName('cuser4').asString]);

      AssignUnitPrice(AQry.FieldByName('qty').asFloat, AOrderDtlId, ArcustoId,
        AQry.FieldByName('Arinvt_id').asFloat);
      AssignDefaultCommiss(AOrderDtlId, AQry.FieldByName('Arinvt_id').asFloat,
        AOrdersId);
    end;
    if AOrderDtlId <> 0 then
      ExecuteCommandFmt
        ('update input_file_rec set ord_detail_id = %f where id = %f',
        [AOrderDtlId, AQry.FieldByName('id').asFloat]);

    if not((AQry.FieldByName('releases_id').asFloat <> 0) and
      (SelectValueFmtAsFloat('select id from releases where id = %f',
      [AQry.FieldByName('releases_id').asFloat]) <> 0)) then
    begin
      AReleasesId := GetNextID('RELEASES');
      ExecuteCommandFmt
        ('insert into releases (id, ord_detail_id, request_date, promise_date, quan, forecast, seq) '
        + 'values (%f, %f, To_Date(''%s'', ''MM/DD/RRRR''), To_Date(''%s'', ''MM/DD/RRRR''), %f, ''%s'', %d)',
        [AReleasesId, AOrderDtlId, FormatDateTime('mm/dd/yyyy',
        AQry.FieldByName('request_date').asDateTime),
        FormatDateTime('mm/dd/yyyy', AQry.FieldByName('promise_date')
        .asDateTime), AQry.FieldByName('qty').asFloat, 'N', 1]);
      ExecuteCommandFmt
        ('update input_file_rec set releases_id = %f where id = %f',
        [AReleasesId, AQry.FieldByName('id').asFloat]);
    end;

  end;

  Panel1.Caption := Format('%s (%d details)', [FCaption, ASeqNo]);
  Application.processmessages;

end;

procedure TFrmImp.CreateOrderHeader(Aship_to_id: Real);
var
  ArcustoId: Real;
  AOrdersId, AOrderDtlId: Real;
  APono: String;
  ASeqNo: Integer;
  AOrdDetailId, AReleasesId: Real;
begin
  with TFDQuery.Create(self) do
    try
      Connection := uniMainModule.FDConnection1;
      Sql.Add(IQFormat('select arcusto_id, pono ' + '  from input_file_rec a ' +
        ' where ship_to_id = %f and input_file_id = %f ' +
        'and not exists (select id from input_file_log where input_file_rec_id = a.id)',
        [Aship_to_id, QryInputID.asFloat]));
      Open;
      if eof and bof then
        exit;

      ArcustoId := FieldByName('arcusto_id').asFloat;
      APono := FieldByName('pono').asString;

    finally
      Free;
    end;
  AOrdersId := CreateNewOrder(ArcustoId, Aship_to_id, APono);
  if AOrdersId <> 0 then
  begin
    with TFDQuery.Create(self) do
      try
        Connection := uniMainModule.FDConnection1;
        Sql.Add(IQFormat
          ('select id, ord_detail_id, releases_id, qty, arinvt_id, promise_date, request_date '
          + '  from input_file_rec a ' +
          ' where ship_to_id = %f and input_file_id = %f ' +
          'and not exists (select id from input_file_log where input_file_rec_id = a.id)',
          [Aship_to_id, QryInputID.asFloat]));
        Open;
        ASeqNo := 0;
        while not eof do
        begin
          Inc(ASeqNo);
          if (FieldByName('ord_detail_id').asFloat <> 0) and
            (SelectValueFmtAsFloat('select id from ord_detail where id = %f',
            [FieldByName('ord_detail_id').asFloat]) <> 0) then
            AOrderDtlId := FieldByName('ord_detail_id').asFloat
          else
          begin
            AOrderDtlId := CreateNewOrdDetail(AOrdersId,
              FieldByName('qty').asFloat, FieldByName('arinvt_id').asFloat,
              Aship_to_id, ArcustoId, ASeqNo);
            ExecuteCommandFmt
              ('update input_file_rec set ord_detail_id = %f where id = %f',
              [AOrderDtlId, FieldByName('id').asFloat]);
          end;
          if AOrderDtlId <> 0 then
            ExecuteCommandFmt
              ('update input_file_rec set orders_id = %f where id = %f',
              [AOrdersId, FieldByName('id').asFloat]);

          if not((FieldByName('releases_id').asFloat <> 0) and
            (SelectValueFmtAsFloat('select id from releases where id = %f',
            [FieldByName('releases_id').asFloat]) <> 0)) then
          begin
            AReleasesId := GetNextID('RELEASES');
            ExecuteCommandFmt
              ('insert into releases (id, ord_detail_id, request_date, promise_date, quan, forecast, seq) '
              + 'values (%f, %f, To_Date(''%s'', ''MM/DD/RRRR''), To_Date(''%s'', ''MM/DD/RRRR''), %f, ''%s'', %d)',
              [AReleasesId, AOrderDtlId, FormatDateTime('mm/dd/yyyy',
              FieldByName('request_date').asDateTime),
              FormatDateTime('mm/dd/yyyy', FieldByName('promise_date')
              .asDateTime), FieldByName('qty').asFloat, 'N', 1]);
            ExecuteCommandFmt
              ('update input_file_rec set releases_id = %f where id = %f',
              [AReleasesId, FieldByName('id').asFloat]);
          end;

          Next;
          Panel1.Caption := Format('%s (%d details)', [FCaption, ASeqNo]);
          Application.processmessages;
        end;
      finally
        Free;
      end;
  end;

end;

function TFrmImp.CreateNewOrderZIO(ArcustoId: Real; APono: String;
  AQry: TFDQuery): Real;
var
  ABillToId: Real;
  ACurrId: Real;
  AOrderNo: String;
  AEplantId: Real;
  ATerms_id: Real;
  AFob: String;
  AFreight_id: Real;
  AOrdBy: String;
  APartnerId: Real;
  ADiscount: Real;

  AId: Real;
begin
  AId := SelectValueFmtAsFloat
    ('select orders_id from input_file_rec where id = %f ',
    [AQry.FieldByName('ID').asFloat]);

  if AId <> 0 then
  begin
    if SelectValueFmtAsFloat('select id from orders where id = %f', [AId]) <> 0
    then
    begin
      Result := AId;
      exit;
    end;
  end;

  Result := GetNextID('ORDERS');
  ABillToId := SelectValueFmtAsFloat
    ('SELECT ID FROM bill_to where ARCUSTO_ID = %f', [ArcustoId]);

  AOrderNo := AssignNewOrderNo(Result, AEplantId);
  ACurrId := 0;
  ATerms_id := 0;
  with TFDQuery.Create(self) do
    try
      Connection := uniMainModule.FDConnection1;
      Sql.Add(IQFormat
        ('select currency_id, terms_id from arcusto where id = %f',
        [ArcustoId]));
      Open;
      if not eof and bof then
      begin
        ACurrId := FieldByName('currency_id').asFloat;
        ATerms_id := FieldByName('terms_id').asFloat;
      end;
      Sql.Clear;
      Sql.Add(IQFormat
        ('select NVL(fob, ''~@~'') as fob, freight_id from ship_to where id = %f',
        [AQry.FieldByName('ship_to_id').asFloat]));
      Open;
      if not eof and bof then
      begin
        AFob := FieldByName('fob').asString;
        AFreight_id := FieldByName('freight_id').asFloat;
      end;
    finally
      Free;
    end;
  AOrdBy := SecurityManager.UserName;

  ADiscount := SelectValueFmtAsFloat
    ('select discount from arcusto where id = %f', [ArcustoId]);

  ExecuteCommandFmt
    ('insert into orders (discount, id, orderno, pono, arcusto_id, date_taken, userid, '
    + 'ship_to_id, bill_to_id, currency_id, eplant_id, terms_id, freight_id, fob, ord_by) '
    + 'values (%.6f, %f, ''%s'', ''%s'', %f, To_Date(''%s'', ''MM/DD/RRRR''), '
    + '''%s'', %f, Decode(%f, 0, '''', %f), Decode(%f, 0, '''', %f), ' +
    ' Decode(%f, 0, 0, %f), Decode(%f, 0, null, %f), Decode(%f, 0, null, %f), Decode(''%s'', ''~@~'', null, ''%s''), ''%s'' )',
    [ADiscount, Result, AOrderNo, APono, ArcustoId, FormatDateTime('mm/dd/yyyy',
    Date), SecurityManager.UserName, AQry.FieldByName('ship_to_id').asFloat,
    ABillToId, ABillToId, ACurrId, ACurrId, AEplantId, AEplantId, ATerms_id,
    ATerms_id, AFreight_id, AFreight_id, AFob, AFob, AOrdBy]);
end;

function TFrmImp.CreateNewOrder(ArcustoId, AShipToId: Real;
  APono: String): Real;
var
  ABillToId: Real;
  ACurrId: Real;
  AOrderNo: String;
  AEplantId: Real;
  ATerms_id: Real;
  AFob: String;
  AFreight_id: Real;
  AOrdBy: String;
  APartnerId: Real;
  ADiscount: Real;

  AId: Real;
begin
  AId := SelectValueFmtAsFloat
    ('select orders_id from input_file_rec where orders_id is not null and ship_to_id = %f and input_file_id = %f ',
    [AShipToId, QryInputID.asFloat]);

  if AId <> 0 then
  begin
    if SelectValueFmtAsFloat('select id from orders where id = %f', [AId]) <> 0
    then
    begin
      Result := AId;
      exit;
    end;
  end;

  Result := GetNextID('ORDERS');
  ABillToId := SelectValueFmtAsFloat
    ('SELECT ID FROM bill_to where ARCUSTO_ID = %f', [ArcustoId]);

  AOrderNo := AssignNewOrderNo(Result, AEplantId);
  ACurrId := 0;
  ATerms_id := 0;
  with TFDQuery.Create(self) do
    try
      Connection := uniMainModule.FDConnection1;
      Sql.Add(IQFormat
        ('select currency_id, terms_id from arcusto where id = %f',
        [ArcustoId]));
      Open;
      if not eof and bof then
      begin
        ACurrId := FieldByName('currency_id').asFloat;
        ATerms_id := FieldByName('terms_id').asFloat;
      end;
      Sql.Clear;
      Sql.Add(IQFormat
        ('select NVL(fob, ''~@~'') as fob, freight_id from ship_to where id = %f',
        [AShipToId]));
      Open;
      if not eof and bof then
      begin
        AFob := FieldByName('fob').asString;
        AFreight_id := FieldByName('freight_id').asFloat;
      end;
    finally
      Free;
    end;
  AOrdBy := SecurityManager.UserName;

  ADiscount := SelectValueFmtAsFloat
    ('select discount from arcusto where id = %f', [ArcustoId]);

  ExecuteCommandFmt
    ('insert into orders (discount, id, orderno, pono, arcusto_id, date_taken, userid, '
    + 'ship_to_id, bill_to_id, currency_id, eplant_id, terms_id, freight_id, fob, ord_by) '
    + 'values (%.6f, %f, ''%s'', ''%s'', %f, To_Date(''%s'', ''MM/DD/RRRR''), '
    + '''%s'', %f, Decode(%f, 0, '''', %f), Decode(%f, 0, '''', %f), ' +
    ' Decode(%f, 0, 0, %f), Decode(%f, 0, null, %f), Decode(%f, 0, null, %f), Decode(''%s'', ''~@~'', null, ''%s''), ''%s'' )',
    [ADiscount, Result, AOrderNo, APono, ArcustoId, FormatDateTime('mm/dd/yyyy',
    Date), SecurityManager.UserName, AShipToId, ABillToId, ABillToId, ACurrId,
    ACurrId, AEplantId, AEplantId, ATerms_id, ATerms_id, AFreight_id,
    AFreight_id, AFob, AFob, AOrdBy]);
end;

function TFrmImp.CreateNewOrdDetail(AOrdersId, ATotalOrdered, Arinvt_id,
  Aship_to_id, ArcustoId: Real; ASeqNo: Integer): Real;
var
  ATaxCodeID: Real;
  AUom: String;
begin
  Result := GetNextID('ORD_DETAIL');

  AUom := SelectValueFmtAsString('select unit from arinvt where id = %f',
    [Arinvt_id]);

  ATaxCodeID := SelectValueFmtAsFloat
    ('select s.tax_code_id from ship_to s, orders o ' +
    'where o.ship_to_id = s.id and o.id = %f', [AOrdersId]);

  ExecuteCommandFmt
    ('insert into ord_detail (id, orders_id, arinvt_id, total_qty_ord, ' +
    'unit, uom_factor, tax_code_id, ord_det_seqno) ' +
    'values (%f, %f, %f, %f, ''%s'', %.6f, decode(%f, 0, null, %f), %d) ',
    [Result, AOrdersId, Arinvt_id, ATotalOrdered, AUom,
    IQToNativeUomFactor(AUom, Arinvt_id, True), ATaxCodeID, ATaxCodeID,
    ASeqNo]);

  AssignUnitPrice(ATotalOrdered, Result, ArcustoId, Arinvt_id);
  AssignDefaultCommiss(Result, Arinvt_id, AOrdersId);
end;

function TFrmImp.AssignNewOrderNo(AId: Real; var AEplantId: Real): String;
var
  aeplant_id: string;
begin
  aeplant_id := SecurityManager.EPlant_ID;

  if aeplant_id <> 'NULL' then
    Result := GetEPlantNextSequenceNumberA(aeplant_id, 'SO', 'S_ORDERS')
  else
  begin
    Result := IntToStr(Trunc(AId));
    IQAppend_EPlant_Suffix(aeplant_id, Result);
  end;

  if aeplant_id <> 'NULL' then
    AEplantId := StrToFloat(aeplant_id)
  else
    AEplantId := 0;
end;

procedure TFrmImp.AssignUnitPrice(ATotalOrdered, AOrdDetailId, ArcustoId,
  Arinvt_id: Real);
type
  TPriceKind = (pkAKA, pkArinvt, pkDefault);
var
  nAkaId: Real;
  nId: Real;
  cIdField: String;
  cTable: String;
  nMinQty: Real;
  APriceBreak: Real;
  IsAKA: Boolean;
  PriceKind: TPriceKind;
  APer1000Table: string;
  ARate: Real;
  ACurrId1, ACurrId2: Real;
  ADiscount: Real;
  AStdPrice: Real;
  AListPriceBreak: Real;
  AOrderCurrId: Real;
  AShipToId, AShipToId2: Real;
begin
  AOrderCurrId := 0;
  ARate := 1;
  ACurrId1 := SelectValueFmtAsFloat
    ('select o.currency_id from orders o, ord_detail d ' +
    'where d.id = %f and d.orders_id = o.id', [AOrdDetailId]);

  AShipToId := SelectValueFmtAsFloat
    ('select o.ship_to_id from orders o, ord_detail d ' +
    'where d.id = %f and d.orders_id = o.id', [AOrdDetailId]);

  if SelectValueAsString('select multicurrency from iqsys') = 'Y' then
    ARate := SelectValueFmtAsFloat
      ('select spot_rate from currency where id = %f', [ACurrId1]);
  if ARate = 0 then
    ARate := 1;

  nAkaId := SelectValueFmtAsFloat
    ('select id from aka where arcusto_id = %f and arinvt_id = %f ' +
    ' and misc.aka_ship_to_filter( %f, arinvt_id, %f, ship_to_id) = 1',
    [ArcustoId, Arinvt_id, ArcustoId, AShipToId]);
  if (nAkaId <> 0) and
    (SelectValueFmtAsFloat('select aka_id from aka_breaks where aka_id = %f',
    [nAkaId]) <> 0) then
  begin
    if SelectValueAsString('select multicurrency from iqsys') = 'Y' then
    begin
      ACurrId2 := SelectValueFmtAsFloat
        ('select currency_id from aka where id = %f', [nAkaId]);
      if (ACurrId2 <> 0) and (ACurrId2 <> ACurrId1) then
        ARate := ARate / SelectValueFmtAsFloat
          ('select spot_rate from currency where id = %f', [ACurrId2]);
      if ACurrId2 = 0 then
        ACurrId2 := GetEplantNativeCurrencyId; { in McShare.pas }
      if ACurrId2 = ACurrId1 then
        ARate := 1;
    end;
    PriceKind := pkAKA;
    nId := nAkaId;
    cIdField := 'AKA_ID';
    cTable := 'AKA_BREAKS';
    APer1000Table := 'AKA';
  end
  else if SelectValueFmtAsFloat
    ('select arinvt_id from arinvt_breaks where arinvt_id = %f and NVL(buying, ''N'') = ''N''',
    [Arinvt_id]) > 0 then
  begin
    if SelectValueAsString('select multicurrency from iqsys') = 'Y' then
    begin
      if SelectValueFmtAsFloat
        ('select id from arinvt_breaks where arinvt_id = %f and currency_id = %f and NVL(buying, ''N'') = ''N'' '
        + 'and sysdate between NVL(effect_date, sysdate - 36500) and NVL(deactive_date, sysdate + 36500)',
        [Arinvt_id, ACurrId1]) <> 0 then
      begin
        ARate := 1;
        AOrderCurrId := ACurrId1;
      end
      else
        AOrderCurrId := 0;

    end;

    PriceKind := pkArinvt;
    nId := Arinvt_id;
    cIdField := 'ARINVT_ID';
    cTable := 'ARINVT_BREAKS';
    APer1000Table := 'ARINVT'
  end
  else
  begin
    PriceKind := pkDefault;
    nId := Arinvt_id;
    APer1000Table := 'ARINVT';
  end;

  case PriceKind of
    pkAKA, pkArinvt:
      begin
        APriceBreak := GetPriceBreak(ATotalOrdered, nId, cIdField, cTable, 'N',
          AOrderCurrId);
        // CheckMinOrderQty( nTotalOrdered, cTable, cIdField, nId );
      end;
    pkDefault:
      APriceBreak := SelectValueFmtAsFloat
        ('select std_price from arinvt where id = %f', [nId]);
  end;

  FBASED_ON_STD_PRICE := 'X';
  FAR_DISCOUNT_TIERS_ID := 0;
  FDISCOUNT_PRICE := 0;

  ADiscount := SelectValueFmtAsFloat
    ('select o.discount from orders o, ord_detail d where o.id = d.orders_id and d.id = %f',
    [AOrdDetailId]);
  AShipToId2 := SelectValueFmtAsFloat
    ('select o.ship_to_id from orders o, ord_detail d where o.id = d.orders_id and d.id = %f',
    [AOrdDetailId]);
  { TODO -omugdha -cWEBIQ : dependancy on oe_share
    ADiscount :=  oe_share.GetTierDiscount2( ADiscount, ArcustoId, Arinvt_Id, ATotalOrdered,
    FBASED_ON_STD_PRICE, FAR_DISCOUNT_TIERS_ID, FDISCOUNT_PRICE, 0, AShipToId2); } { in oe_share.pas }


  // if ADiscount = 0 then
  // ADiscount := GetTierDiscount( ArcustoId, Arinvt_Id);

  // Z Dec 17 2005
  if FBASED_ON_STD_PRICE = 'X' then
    { keep the defaults }
  else if FBASED_ON_STD_PRICE = 'Y' then
  begin
    // Z Dec 17 2005
    // AStdPrice := SelectValueFmtAsFloat('select std_price from arinvt where id = %f', [Arinvt_Id]);
    AStdPrice := APriceBreak;

    if FDISCOUNT_PRICE <> 0 then
      APriceBreak := FDISCOUNT_PRICE
    else
      { TODO -omugdha -cWEBIQ : Undeclared identifier: 'Check_AR_DISCOUNT_TIERS_PriceBreaks'
        APriceBreak:= Check_AR_DISCOUNT_TIERS_PriceBreaks(SelectValueFmtAsString('select unit from ord_detail where id = %f', [AOrdDetailId]), AStdPrice, ADiscount, ATotalOrdered, FAR_DISCOUNT_TIERS_ID, 0, ArcustoId); } { in oe_share.pas }

      // APriceBreak:= AStdPrice * (1 - ADiscount / 100);
  end
  else
    { TODO -omugdha -cWEBIQ : Undeclared identifier: 'Check_AR_DISCOUNT_TIERS_PriceBreaks'
      APriceBreak:= Check_AR_DISCOUNT_TIERS_PriceBreaks(SelectValueFmtAsString('select unit from ord_detail where id = %f', [AOrdDetailId]), AStdPrice, ADiscount, ATotalOrdered, FAR_DISCOUNT_TIERS_ID, 0, ArcustoId); } { in oe_share.pas }
    //
    APriceBreak := APriceBreak * (1 - ADiscount / 100);

  if SelectValueFmtAsString('select price_per_1000 from %s where id = %f',
    [APer1000Table, nId]) = 'Y' then
    ExecuteCommandFmt
      ('update ord_detail set price_per_1000 = %15.6f, unit_price = %15.6f, discount = %.6f where id = %f',
      [APriceBreak / ARate, APriceBreak / 1000 / ARate, ADiscount,
      AOrdDetailId])
  else
    ExecuteCommandFmt
      ('update ord_detail set unit_price = %15.6f, price_per_1000 = %15.6f, discount = %.6f where id = %f',
      [APriceBreak / ARate, APriceBreak * 1000 / ARate, ADiscount,
      AOrdDetailId]);
end;

procedure TFrmImp.AssignDefaultCommiss(AOrdDetailId, ArinvtId, AOrdersId: Real);
var
  AId, ACount, ArcustoId: Real;
  ASPId, ACommPcnt, AKAComm: Real;
  ASource: String;
  AShipToId: Real;
begin
  AShipToId := SelectValueFmtAsFloat
    ('select ship_to_id from orders where id = %f', [AOrdersId]);

  ArcustoId := SelectValueFmtAsFloat
    ('select arcusto_id from orders where id = %f', [AOrdersId]);
  AId := SelectValueFmtAsFloat
    ('select commissions_id from arinvt where id = %f', [ArinvtId]);
  if AId = 0 then
  begin
    AId := SelectValueFmtAsFloat
      ('select commissions_id from arcusto where id = %f', [ArcustoId]);
    ASource := 'ARCUSTO';
  end;

  ACount := SelectValueFmtAsFloat
    ('select count(id) from commissions_detail where commissions_id = %f', [AId]
    );

  if ACount = 1 then
  begin
    ASPId := SelectValueFmtAsFloat
      ('select salespeople_id from commissions_detail where commissions_id = %f',
      [AId]);

    ACommPcnt := SelectValueFmtAsFloat
      ('select COMIS_PRCNT from aka where arcusto_id = %f and arinvt_id = %f' +
      ' and misc.aka_ship_to_filter( %f, arinvt_id, %f, ship_to_id) = 1',
      [ArcustoId, ArinvtId, ArcustoId, AShipToId]);

    if ACommPcnt = 0 then
    begin
      if ASource = 'ARCUSTO' then
        ACommPcnt := SelectValueFmtAsFloat
          ('select comm_pcnt from arcusto where id = %f', [ArcustoId])
      else
        ACommPcnt := SelectValueFmtAsFloat
          ('select comis_prcnt from arinvt where id = %f', [ArinvtId]);

      if ACommPcnt = 0 then
        ACommPcnt := SelectValueFmtAsFloat
          ('select Min(commission_percent) from commissions_detail where commissions_id = %f',
          [AId]);
    end;

    ExecuteCommandFmt
      ('insert into ORD_DETAIL_COMMISSIONS (ord_detail_id, salespeople_id, commission_percent) '
      + 'values (%f, %f, %f)', [AOrdDetailId, ASPId, ACommPcnt]);
  end
  else if ACount > 1 then
    ExecuteCommandFmt
      ('insert into ORD_DETAIL_COMMISSIONS (ord_detail_id, salespeople_id, commission_percent) '
      + 'select %f, salespeople_id, commission_percent from commissions_detail where commissions_id = %f',
      [AOrdDetailId, AId]);
end;

function TFrmImp.GetTierDiscount(AArcustoID, AArinvtID: Real): Real;
begin
  Result := 0;
  FBASED_ON_STD_PRICE := 'N';

  with TFDQuery.Create(self) do
    try
      Connection := uniMainModule.FDConnection1;
      Sql.Add(IQFormat
        ('select tiers.discount,                                            ' +
        '       NVL(tiers.BASED_ON_STD_PRICE, ''N'') as BASED_ON_STD_PRICE ' +
        '  from ar_discount_tiers tiers,                                   ' +
        '       arinvt,                                                    ' +
        '       arcusto                                                    ' +
        ' where arinvt.id = %f                                             ' +
        '   and arcusto.id = %f                                            ' +
        '   and NVL(tiers.AGGREGATE, ''N'') = ''N''                        ' +
        '   and arcusto.cust_type_id = tiers.cust_type_id                  ' +
        '   and arinvt.item_type_id  = tiers.item_type_id(+)               ',
        [AArinvtID, AArcustoID]));
      Open;
      if not(eof and bof) then
      begin
        Result := FieldByName('discount').asFloat;
        FBASED_ON_STD_PRICE := FieldByName('BASED_ON_STD_PRICE').asString;
      end;
    finally
      Free;
    end;
end;

procedure TFrmImp.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmImp.Showparsedfile1Click(Sender: TObject);
begin
  DoViewParsedFile(); { in ImpInput.pas }
end;

procedure TFrmImp.FormDestroy(Sender: TObject);
begin
  if Assigned(RB) then
    RB.Free;
end;

procedure TFrmImp.ProcessCustomSqlScript(AIterCode, ATrSetId: String;
  AEdiFile_Id: Real);
var
  ASqlFile: String;
  AId: Real;
begin
  try
    if (QryInputTYPE.asString = 'ASN') then
      AId := SelectValueFmtAsFloat
        ('select t.id from EDI_PARTNERS p, EDI_PARTNERS_TS t ' +
        'where p.TP_INTERCHANGE_CODE  = ''%s'' and t.edi_partners_id = p.id ' +
        'and t.transaction_set_code = ''856'' and t.in_out_bound = ''INBOUND'' and t.custom_sql_clob is not null ',
        [AIterCode, ATrSetId])
    else
      AId := SelectValueFmtAsFloat
        ('select t.id from EDI_PARTNERS p, EDI_PARTNERS_TS t ' +
        'where p.TP_INTERCHANGE_CODE  = ''%s'' and t.edi_partners_id = p.id ' +
        'and t.transaction_set_code = ''%s'' and t.custom_sql_clob is not null',
        [AIterCode, ATrSetId]);

    if AId = 0 then
      exit;

    try
      HMsg := hPleaseWait('Processing Custom SQL Script...');
      ExecuteCommandFmt
        ('begin ediparse_main.ProcessPartnersCustomSqlTS(%f, %f); end;',
        [AEdiFile_Id, AId]);
    finally
      HMsg.Free;
    end;

    // if Trim(ASqlFile) = '' then exit;
    //
    // if not FileExists(ASqlFile) then
    // raise exception.create(Format('%s not found', [ASqlFile]));
    // with TQuery.Create(self) do
    // try
    // HMsg:= hPleaseWait('Processing Custom SQL Script...');
    // DataBaseName := 'IQ';
    // ParamCheck  := FALSE;
    // Sql.LoadFromFile(ASqlFile);
    // Sql.Text := StrTran(UpperCase(Sql.Text), ':ID', IntToStr(Trunc(AEdiFile_Id)));
    // Sql.Text:= StrUtils.ReplaceStr( Sql.Text, '::=', ':=' );
    // ExecSql;
    // finally
    // HMsg.Free;
    // Free;
    // end;
  except
    on E: Exception do
    begin
      if FAutoProcess then
      begin
        try
          TFrmCheckPointList.Add(Format('%s', [E.Message]));
          ExecuteCommandFmt
            ('insert into edi_errors (edi_error, EDI_FILE_ID, error_type) ' +
            ' values(substr(''%s'', 1, 250), %f, ''E'')',
            [StrTran(StrTran(StrTran(E.Message, #13, ' '), #10, ' '), '''',
            ''''''), AEdiFile_Id]);
        except
        end;
      end
      else
      begin
        try
          TFrmCheckPointList.Add(Format('%s', [E.Message]));
          ExecuteCommandFmt
            ('insert into edi_errors (edi_error, EDI_FILE_ID, error_type) ' +
            ' values(substr(''%s'', 1, 250), %f, ''E'')',
            [StrTran(StrTran(StrTran(E.Message, #13, ' '), #10, ' '), '''',
            ''''''), AEdiFile_Id]);
        except
        end;
        raise
      end;
    end;
  end;
end;

procedure TFrmImp.CheckRollBackSegment;
begin
  if Assigned(RB) then
    exit;
  { TODO -omugdha -cWEBIQ :  Undeclared identifier: 'TFDIQMS'
    RB:= IQMS.Common.RollbackManager.Create( 'RB_EDI'); }
  RB.Associate;
end;

procedure TFrmImp.FormActivate(Sender: TObject);
begin
  if FImpFa then
    IQHelp.AssignHTMLFile(iqchmFA { CHM } , iqhtmFA { HTM } )
    { IQMS.Common.HelpHook.pas }
  else
    IQHelp.AssignHTMLFile(iqchmEDI { CHM } , iqhtmEDI { HTM } )
    { IQMS.Common.HelpHook.pas }
end;

procedure TFrmImp.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext(self.HelpContext);
end;

procedure TFrmImp.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmImp.ShowOrders(AEdiFileId: Real);
begin
  if SelectValueFmtAsFloat
    ('select count(EDI_FILE_ID) from EDI_ERRORS where EDI_FILE_ID = %f and (error_type = ''E'' or error_type = ''F'')',
    [AEdiFileId]) <> 0 then
  begin
    if IqConfirmYN('File loaded and parsed.' + #13 + 'There were errors.' + #13
      + 'Do you wish to view error log?') then
    begin
      (* TODO -omugdha -cWEBIQ :  Undeclared identifier: 'DoShowEdiErrors'
        if not DoShowEdiErrors(Format('(%d)', [Trunc(AEdiFileId)]), 'SHOWPANEL') then Exit;  {in EdiError.pas}
        DoShowEdiOrders(self, Format('(%d)', [Trunc(AEdiFileId)]), RB)  {in EdiOrds.pas} *)
    end
    else
      (* TODO -omugdha -cWEBIQ :  Undeclared identifier: 'DoShowEdiErrors'
        DoShowEdiOrders(self, Format('(%d)', [Trunc(AEdiFileId)]), RB)  {in EdiOrds.pas}; *)
  end
  else
    (* TODO -omugdha -cWEBIQ :  Undeclared identifier: 'DoShowEdiErrors'
      DoShowEdiOrders(self, Format('(%d)', [Trunc(AEdiFileId)]), RB)  {in EdiOrds.pas}; *)
end;

procedure TFrmImp.Parseonly1Click(Sender: TObject);
begin
  if Parseonly1.Checked then
  begin
    Parseonly1.Checked := FALSE;
    IQRegIntegerScalarWrite(self, 'IQIMP_PARSEONLY', 0);
  end
  else
  begin
    Parseonly1.Checked := True;
    IQRegIntegerScalarWrite(self, 'IQIMP_PARSEONLY', 1);
  end;
end;

end.
