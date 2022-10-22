unit SchMaint;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  IQMS.WebVcl.About,
  Vcl.Menus,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Wwdatsrc,
  Mask,
  IQMS.WebVcl.Hpick,
  AbBase,
  AbBrowse,
  AbZBrows,
  AbZipper,
  AbUnzper,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.RepDef,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Phys,
  MainModule,
  IQMS.Common.QuickAddBase,
  FireDAC.Comp.DataMove,
  Vcl.wwMemo,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniDBNavigator,
  uniMainMenu,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  vcl.wwdbgrid, IQUniGrid, uniGUIFrame, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls;

const SchemaHeader = 'select id, descrip, type, text from arcusto_schema where id in ';
const SchemaDetail = 'select id, arcusto_schema_id as arcusto_sc, seq, text from schema_template where arcusto_schema_id in ';



type
  TFrmSchemaMaint = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Splitter1: TUniSplitter;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Splitter2: TUniSplitter;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    NavTemplate: TUniDBNavigator;
    SrcSchema: TDataSource;
    QrySchema: TFDQuery;
    Panel7: TUniPanel;
    Panel8: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    QrySchemaDESCRIP: TStringField;
    QrySchemaTYPE: TStringField;
    QrySchemaCUSTNO: TStringField;
    QrySchemaCOMPANY: TStringField;
    QrySchemaARCUSTO_ID: TBCDField;
    Panel9: TUniPanel;
    QrySchemaTEXT: TStringField;
    Panel6: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    Splitter4: TUniSplitter;
    Panel10: TUniPanel;
    Panel11: TUniPanel;
    SrcTemplate: TDataSource;
    QrySchemaID: TBCDField;
    PkArcusto: TIQWebHPick;
    PkArcustoCUSTNO: TStringField;
    PkArcustoCOMPANY: TStringField;
    PkArcustoADDR1: TStringField;
    PkArcustoCITY: TStringField;
    PkArcustoSTATE: TStringField;
    PkArcustoCOUNTRY: TStringField;
    PkArcustoZIP: TStringField;
    PkArcustoPHONE_NUMBER: TStringField;
    PkArcustoPRIME_CONTACT: TStringField;
    PkArcustoID: TBCDField;
    PkArcustoADDR2: TStringField;
    PkArcustoADDR3: TStringField;
    PkArcustoPK_HIDE: TStringField;
    Options1: TUniMenuItem;
    ExportSchemas1: TUniMenuItem;
    ImportSchemas1: TUniMenuItem;
    OpenDialog2: TOpenDialog;
    QryBatchMove: TFDQuery;
    AbZipper1: TAbZipper;
    BatchMove1: TFDDataMove;
    OpenDialog1: TOpenDialog;
    AbUnZipper1: TAbUnZipper;
    SR: TIQWebSecurityRegister;
    wwMemoDialog2: TwwMemoDialog;
    PopupMenu2: TUniPopupMenu;
    BringupSqlediform1: TUniMenuItem;
    PopupMenu1: TUniPopupMenu;
    MenuItem1: TUniMenuItem;
    wwMemoDialog1: TwwMemoDialog;
    Panel12: TUniPanel;
    IQSearch1: TIQUniGridControl;
    wwCustno: TUniEdit;
    wwCustomer: TUniEdit;
    wwType: TUniDBComboBox;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    IQRepDef1: TIQWebRepDef;
    QryTemplate: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    QryTemplateID: TBCDField;
    QryTemplateARCUSTO_SCHEMA_ID: TBCDField;
    QryTemplateSEQ: TBCDField;
    QryTemplateTEXT: TStringField;
    Contents1: TUniMenuItem;
    QrySchemaVENDOR_ID: TBCDField;
    QrySchemaVENDORNO: TStringField;
    QrySchemaVENDOR_COMP: TStringField;
    wwVendorNo: TUniEdit;
    wwVendor: TUniEdit;
    PkVendor: TIQWebHPick;
    PkVendorVENDORNO: TStringField;
    PkVendorCOMPANY: TStringField;
    PkVendorADDR1: TStringField;
    PkVendorADDR2: TStringField;
    PkVendorADDR3: TStringField;
    PkVendorCITY: TStringField;
    PkVendorSTATE: TStringField;
    PkVendorCOUNTRY: TStringField;
    PkVendorZIP: TStringField;
    PkVendorPHONE_NUMBER: TStringField;
    PkVendorPRIME_CONTACT: TStringField;
    PkVendorID: TBCDField;
    PkVendorPK_HIDE: TStringField;
    FDUpdateSQL1: TFDUpdateSQL;
    QryHeader: TFDQuery;
    QryDetail: TFDQuery;
    DBRichEdit1: TDBRichEdit;
    DBRichEdit2: TDBRichEdit;
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure QrySchemaUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QrySchemaBeforePost(DataSet: TDataSet);
    procedure wwCustnoCustomDlg(Sender: TObject);
    procedure QrySchemaAfterPost(DataSet: TDataSet);
    procedure NavSchemaBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure QrySchemaBeforeDelete(DataSet: TDataSet);
    procedure BtnOkClick(Sender: TObject);
    procedure ExportSchemas1Click(Sender: TObject);
    procedure ImportSchemas1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QrySchemaAfterInsert(DataSet: TDataSet);
    procedure QrySchemaAfterCancel(DataSet: TDataSet);
    procedure PkArcustoIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure BringupSqlediform1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure QryTemplateAfterPost(DataSet: TDataSet);
    procedure QryTemplateAfterInsert(DataSet: TDataSet);
    procedure QryTemplateBeforeEdit(DataSet: TDataSet);
    procedure NavTemplateBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure wwVendorCustomDlg(Sender: TObject);
    procedure PkVendorIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure wwMemoDialog1CloseDialog(Dialog: TwwMemoDlg);
    procedure wwMemoDialog2CloseDialog(Dialog: TwwMemoDlg);
  protected
   procedure CheckArcusto; virtual;
  private
    { Private declarations }
    FId:Real;
    FSchemaId:Real;
    FSelectedIds:String;
    FZIPFileName:String;

    FScHeader    :String;
    FScHeaderDBT :String;
    FScDetail    :String;
    FScDetailDBT :String;
    FNewCustId   :Real;
    FNewVendId   :Real;
    FImportedSchemaId :Real;
    FSqlLiteConnection:TFDConnection;



    procedure Startup;
    procedure UpdateQrySchema;
    procedure InsertQrySchema;
    procedure DeleteQrySchema;
    function  GetSelectedIds:String;
    procedure CreateDbfs(ADir:String);
    procedure AssignSelection(Qry:TFDQuery; AStr, ASql:String);
    procedure BatchCopyTableToDBF( const AFileName:String; SourceTableName : TFDQuery );
    procedure ImportZIP( AZipFileName: string );
    procedure InternalImport( S: string );
    procedure InsertHeader;
    procedure InsertDetail(AHeaderID, ANewHeaderID:Real);
  public
    { Public declarations }
  end;

function DoSelectArcustoSchema(var AID:Variant ):TModalResult;
procedure DoArcustoSchema;

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.FileUtils,
  IQMS.Common.NLS,
  IQMS.Common.HelpHook,
{ TODO -oGPatil -cWebConvert : Dependency on Files
  IQSecIns,
  Qk_Cust,
  Qk_vend,   }
  IQMS.Common.SqlLiteImportExport;

{$R *.DFM}

function DoSelectArcustoSchema(var AID:Variant ):TModalResult;
var
  LFrmSchemaMaint : TFrmSchemaMaint;
begin
   LFrmSchemaMaint := TFrmSchemaMaint.Create(UniGUIApplication.UniApplication);
   LFrmSchemaMaint.Startup;
   LFrmSchemaMaint.ShowModal;
   Result := LFrmSchemaMaint.ModalResult;
   AID := LFrmSchemaMaint.FID;
end;

procedure DoArcustoSchema;
var
  LFrmSchemaMaint : TFrmSchemaMaint;
begin
   LFrmSchemaMaint := TFrmSchemaMaint.Create(UniGUIApplication.UniApplication);
   LFrmSchemaMaint.Panel7.Visible := False;
   LFrmSchemaMaint.Startup;
   LFrmSchemaMaint.Show;
end;

procedure TFrmSchemaMaint.Startup;
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, Panel1, Panel2, Panel6, Panel12 ]);

  wwCustno.Parent  := IQSearch1.DBGrid;
  wwCustno.visible := False;

  wwCustomer.Parent  := IQSearch1.DBGrid;
  wwCustomer.Visible := False;

  wwType.Parent      := IQSearch1.DBGrid;
  wwType.Visible     := False;

  wwVendor.Parent      := IQSearch1.DBGrid;
  wwVendor.Visible     := False;

  wwVendorNo.Parent      := IQSearch1.DBGrid;
  wwVendorNo.Visible     := False;
end;

procedure TFrmSchemaMaint.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmSchemaMaint.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmSchemaMaint.QrySchemaUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
{
  with DataSet do
    case UpdateKind of
      arUpdate: UpdateQrySchema;
      arInsert: InsertQrySchema;
      arDelete: DeleteQrySchema;
    end;
  AAction := eaApplied;
}
end;

procedure TFrmSchemaMaint.UpdateQrySchema;
begin
  ExecuteCommandFmt('update arcusto_schema ' +
            '   set arcusto_id = decode(%f, 0, null, %f), ' +
            '       vendor_id = decode(%f, 0, null, %f), ' +
            '       descrip    = ''%s'', ' +
            '       type       = ''%s'', ' +
            '       text       = ''%s'' ' +
            '  where id = %f ',
            [QrySchemaARCUSTO_ID.asFloat,
             QrySchemaARCUSTO_ID.asFloat,
             QrySchemaVENDOR_ID.asFloat,
             QrySchemaVENDOR_ID.asFloat,
             QrySchemaDESCRIP.asString,
             QrySchemaTYPE.asString,
             StrTran(QrySchemaTEXT.asString, #13, ''),
             QrySchemaID.asFloat]);
end;

procedure TFrmSchemaMaint.InsertQrySchema;
begin
  ExecuteCommandFmt('insert into arcusto_schema ' +
            ' (arcusto_id, vendor_id, descrip, type, text, id) ' +
            ' values ( decode(%f, 0, null, %f), decode(%f, 0, null, %f), ''%s'', ''%s'', ''%s'', decode(%f, 0, null, %f) ) ',
            [QrySchemaARCUSTO_ID.asFloat,
             QrySchemaARCUSTO_ID.asFloat,
             QrySchemaVENDOR_ID.asFloat,
             QrySchemaVENDOR_ID.asFloat,
             QrySchemaDESCRIP.asString,
             QrySchemaTYPE.asString,
             StrTran(QrySchemaTEXT.asString, #13, ''),
             QrySchemaID.asFloat,
             QrySchemaID.asFloat]);
end;

procedure TFrmSchemaMaint.DeleteQrySchema;
begin
  ExecuteCommandFmt('delete from arcusto_schema where id = %f', [FSchemaId]);
end;

procedure TFrmSchemaMaint.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, Panel1, Panel2, Panel6, Panel12 ]);
end;

procedure TFrmSchemaMaint.QrySchemaBeforePost(DataSet: TDataSet);
begin
  if QrySchemaID.AsFloat = 0 then
    QrySchemaID.AsFloat := GetNextID('ARCUSTO_SCHEMA');

  CheckArcusto;

  if QrySchemaTYPE.asString = '' then
    raise exception.create('Schema type must be assigned');

  QrySchemaTEXT.AsString := StrTran(QrySchemaTEXT.asString, '''', '''''');

end;

procedure TFrmSchemaMaint.CheckArcusto;
begin
  if (QrySchemaARCUSTO_ID.asFloat = 0) and (QrySchemaVENDOR_ID.asFloat = 0) then
    raise exception.create('Customer or Vendor must be assigned');
end;

procedure TFrmSchemaMaint.wwCustnoCustomDlg(Sender: TObject);
begin
  FNewCustId := 0;
  with PkArcusto do
    if Execute then
    begin
      QrySchemaVENDOR_ID.Clear;
      QrySchemaVENDOR_COMP.Clear;
      QrySchemaVENDORNO.Clear;
      if FNewCustId = 0 then
      begin
        QrySchemaARCUSTO_ID.asFloat := GetValue('ID');
        QrySchemaCUSTNO.asString    := GetValue('CUSTNO');
        QrySchemaCOMPANY.asString   := GetValue('COMPANY');
      end
      else
      begin
        QrySchemaARCUSTO_ID.asFloat := FNewCustId;
        QrySchemaCUSTNO.asString    := SelectValueFmtAsString('select custno from arcusto where id = %f', [FNewCustId]);
        QrySchemaCOMPANY.asString   := SelectValueFmtAsString('select company from arcusto where id = %f', [FNewCustId]);
      end;
    end;
end;

procedure TFrmSchemaMaint.wwVendorCustomDlg(Sender: TObject);
begin
  FNewVendId := 0;
  with PkVendor do
    if Execute then
    begin
      QrySchemaARCUSTO_ID.Clear;
      QrySchemaCUSTNO.Clear;
      QrySchemaCOMPANY.Clear;
      if FNewVendId = 0 then
      begin
        QrySchemaVENDOR_ID.asFloat    := GetValue('ID');
        QrySchemaVENDORNO.AsString    := GetValue('VENDORNO');
        QrySchemaVENDOR_COMP.AsString := GetValue('COMPANY');
      end
      else
      begin
        QrySchemaVENDOR_ID.asFloat := FNewVendId;
        QrySchemaVENDORNO.asString    := SelectValueFmtAsString('select vendorno from vendor where id = %f', [FNewVendId]);
        QrySchemaVENDOR_COMP.asString   := SelectValueFmtAsString('select company from vendor where id = %f', [FNewVendId]);
      end;
    end;
end;


procedure TFrmSchemaMaint.QrySchemaAfterPost(DataSet: TDataSet);
var
  AId:Real;
begin
{ TODO -oGPatil -cWebConvert : TUniDBGrid does not contain selectedlist
  IQSearch1.DBGrid.Options := IQSearch1.DBGrid.Options + [VCL.Wwdbgrid.dgMultiSelect];
  IQSearch1.DBGrid.UnselectAll;   }
{
  try
    QrySchema.Database.ApplyUpdates([ QrySchema ]);
    AId := QrySchemaID.asFloat;
    QrySchema.Close;
    QrySchema.Open;
    QrySchema.Locate('ID', AId, []);
  except on E:Exception do
    with QrySchema do
    begin
      CancelUpdates;
      raise;
    end;
  end;
}
end;

procedure TFrmSchemaMaint.NavSchemaBeforeAction(Sender: TObject; Button: TNavigateBtn);
var
  AId:Real;
begin
  if Button = nbRefresh then
  begin
    AId := QrySchemaID.asFloat;
    QrySchema.Close;
    QrySchema.Open;
    QrySchema.Locate('ID', AId, []);
    Abort;
  end;
end;

procedure TFrmSchemaMaint.QrySchemaBeforeDelete(DataSet: TDataSet);
begin
  FSchemaId := QrySchemaID.asFloat;
end;

procedure TFrmSchemaMaint.BtnOkClick(Sender: TObject);
begin
  QrySchema.CheckBrowseMode;
  FId := QrySchemaID.asFloat;
  ModalResult := mrOk;
end;

procedure TFrmSchemaMaint.ExportSchemas1Click(Sender: TObject);
var
  S:String;
begin
  FSelectedIds := GetSelectedIds;
  with OpenDialog2 do
  begin
    If Execute then
      FZIPFileName := FileName
    else
      Exit;
  end;

  if FileExists(FZIPFileName) then
    raise exception.create(Format('File %s already exists. Please specify a new archive file.', [FZIPFileName]));


  S := ExtractFilePath( FZIPFileName );

//  CreateDbfs(S);
  CreateDbfs(FZIPFileName);
end;

procedure TFrmSchemaMaint.CreateDbfs(ADir:String);
var
  ScHeader    :String;
  ScHeaderDBT :String;
  ScDetail    :String;
  ScDetailDBT :String;
  S:String;
  AConn: TFDConnection;
  aFileName:String;
  aSqlLiteExport:TIQSqlLiteExport;
begin

  aFileName := StrTran(ADir, '.zip', '.s3db');

  AssignSelection(QryHeader, FSelectedIds, SchemaHeader);
  AssignSelection(QryDetail, FSelectedIds, SchemaDetail);

  aSqlLiteExport := TIQSqlLiteExport.Create(aFileName,
                                            [QryHeader, QryDetail],
                                             ['ScHeader', 'ScDetail']);
  try
    aSqlLiteExport.Execute;
  finally
    aSqlLiteExport.Free;
  end;


  AbZipper1.OpenArchive(FZIPFileName);
  try
    AbZipper1.AddFiles(aFileName   , 0);
  finally
    AbZipper1.CloseArchive;
  end;
  IqConfirm(Format('Schemas ZIPPED into the %s file ', [FZIPFileName]));

  exit;



  S := ADir + '$SCHEMA_TEMP\';
  if not DirectoryExists(S) then
    if not CreateDir(S) then
      raise Exception.Create(Format('Unable to create %s directory', [S]));



  ScHeader    := StrTran( S + '\ScHeader.DBF' , '\\', '\' );
  ScHeaderDBT := StrTran( S + '\ScHeader.DBT' , '\\', '\' );
  ScDetail    := StrTran( S + '\ScDetail.DBF' , '\\', '\' );
  ScDetailDBT := StrTran( S + '\ScDetail.DBT' , '\\', '\' );


  Screen.Cursor:= crHourGlass;
  try
    AssignSelection(QryBatchMove, FSelectedIds, SchemaHeader);
    BatchCopyTableToDBF( ScHeader, QryBatchMove);

    AssignSelection(QryBatchMove, FSelectedIds, SchemaDetail);
    BatchCopyTableToDBF( ScDetail, QryBatchMove);

    with TFDTable.Create(self) do
    try
{ TODO -oGPatil -cWebConvert : MainModule does not contain GetDBFConnection
      AConn := GetDBFConnection( S ); }
      AConn.Connected := true;

      Connection := AConn;

//      DataBaseName := S;
      TableName := 'ScHeader.DBF';
      Open;
      while not eof do
      begin
        if Pos('''', FieldByName('text').asString) <> 0 then
        begin
          Edit;
          FieldByName('text').asString := Strtran(FieldByName('text').asString, '''', '''''');
          Post;
        end;
        Next;
      end;
    finally
      Free;
    end;

    with TFDTable.Create(self) do
    try
{ TODO -oGPatil -cWebConvert : MainModule does not contain GetDBFConnection
      AConn := GetDBFConnection( S );  }
      AConn.Connected := true;

      Connection := AConn;

//      DataBaseName := S;
      TableName := 'ScDetail.DBF';
      Open;
      while not eof do
      begin
        if Pos('''', FieldByName('text').asString) <> 0 then
        begin
          Edit;
          FieldByName('text').asString := Strtran(FieldByName('text').asString, '''', '''''');
          Post;
        end;
        Next;
      end;
    finally
      Free;
    end;


    AbZipper1.OpenArchive(FZIPFileName);
    try
      AbZipper1.AddFiles(ScHeader   , 0);
      AbZipper1.AddFiles(ScHeaderDBT, 0);
      AbZipper1.AddFiles(ScDetail   , 0);
      AbZipper1.AddFiles(ScDetailDBT, 0);
    finally
      AbZipper1.CloseArchive;
    end;
    DeleteFile(ScHeader   );
    DeleteFile(ScHeaderDBT);
    DeleteFile(ScDetail   );
    DeleteFile(ScDetailDBT);
    RemoveDir(S);
  finally
    IqConfirm(Format('Schemas ZIPPED into the %s file ', [FZIPFileName]));
    Screen.Cursor:= crDefault;
  end;
end;


function TFrmSchemaMaint.GetSelectedIds:String;
var
  i:Integer;
begin
  Result := '';
{ TODO -oGPatil -cWebConvert : TUniDBGrid does not contain selectedlist
  if IQSearch1.DbGrid.SelectedList.Count = 0 then
    raise exception.create('No records selected');

  with IQSearch1.DbGrid, IQSearch1.DbGrid.datasource.dataset do
  for i:= 0 to SelectedList.Count-1 do
  begin
    GotoBookmark(SelectedList.items[i]);
    Result := Result + Format('%s', [Trim(FieldByName('ID').asString)]) + ', ';
  end;

  Result := Format('(%s)', [Copy(Result, 1, Length(Result) - 2)])   }
end;

procedure TFrmSchemaMaint.AssignSelection(Qry:TFDQuery; AStr, ASql:String);
begin
  Qry.Close;
  Qry.Sql.Clear;
  Qry.Sql.Add(ASql + AStr);
  Qry.Open;
end;

procedure TFrmSchemaMaint.BatchCopyTableToDBF( const AFileName:String; SourceTableName : TFDQuery );
var
  dbfTable:TFDTable;
  aPath:String;
  AConn: TFDConnection;
  dbf :TFDTable;
begin


    dbf     :=  TFDTable.Create(nil);

    aPath := ExtractFilePath( UpperCase(AFileName) );
{ TODO -oGPatil -cWebConvert : MainModule does not contain GetDBFConnection
    AConn := GetDBFConnection( aPath ); }
    AConn.Connected := true;
    AConn.Params.Add('DriverID=ADS');
    AConn.Params.Add(Format('Database=%s', [aPath]));
    AConn.Params.Add('ServerTypes=Local');
    AConn.Params.Add('TableType=VFP');

    dbf.Connection := AConn;
    AConn.Connected := true;



//    dbf.CatalogName     :=  ExtractFilePath(aFileName);
//    dbf.TableName       :=  ExtractFileName(aFileName);
    dbf.TableName       :=  'KUKU';
    dbf.Exclusive       :=  True;

    dbf.FieldDefs.Clear;
    dbf.FieldDefs.Add('ID'    ,ftAutoInc);
    dbf.FieldDefs.Add('CODE'  ,ftString,10);
    dbf.FieldDefs.Add('NAME'  ,ftString,30);
    dbf.IndexDefs.Add('p','id',[]);
    dbf.Open;




//  DM.BatchCopyTableToDBF( AFileName, SourceTableName );
{
  dbfTable := TFDTable.Create(self);
  try
    aPath := ExtractFilePath( UpperCase(AFileName) );
    AConn := GetDBFConnection( aPath );
    AConn.Connected := true;

    dbfTable.Connection := AConn;
    dbfTable.TableName   := ExtractFileName( AFileName );
    with BatchMove1 do
    begin
      Mode       := dmAlwaysInsert;
      Destination:= dbfTable;
      Source     := SourceTableName;
      Execute;
    end;
  finally
    dbfTable.Free;
  end;
}
end;


procedure TFrmSchemaMaint.ImportSchemas1Click(Sender: TObject);
var
  I: Integer;
begin
  if OpenDialog1.Execute then with OpenDialog1 do
     for I:= 0 to Files.Count - 1 do
         ImportZIP( Files[ I ] );

  QrySchema.Locate('ID', FImportedSchemaId, []);
end;

procedure TFrmSchemaMaint.ImportZIP( AZipFileName: string );
const
  cPrefix = '$SCHEMA_TEMP\';
var
  ADir : string;
  AName: string;
  S    : string;
  aFileName:String;
begin
  {get dir name}
  S:= ExtractFileExt( AZipFileName );
  AName:= ExtractFileName( AZipFileName );
  if S > '' then
     AName:= Copy( AName, 1, Length(AName) - Length(S));

  {create dir: D:\iqwin32\_edi_tmp_\abco}
  ADir:= IQGetLocalHomePath + cPrefix + AName;    {IQMS.Common.Miscellaneous.pas}
  IQCreateDir( ADir );                            {IQMS.Common.FileUtils.pas}
  try
    {just in case this dir exists - delete all files}
    IQDeleteFiles( [ ADir + '\*.S3DB']);

    {unzip}
    AbUnZipper1.OpenArchive(AZipFileName);
    try
      AbUnZipper1.BaseDirectory:= ADir;
      AbUnZipper1.ExtractFiles( '*.*' );
    finally
      AbUnZipper1.CloseArchive;
      AbUnZipper1.BaseDirectory:= '';
    end;

    {import}
     aFileName := ADir +'\' + StrTran(UpperCase(ExtractFileName(AZipFileName)), '.ZIP', '.S3DB');
     InternalImport( aFileName );

     IqConfirm('Schemas UnZipped');
  finally
    {get rid of dir}
    IQDeleteFiles( [ ADir + '\*.dbf', ADir + '\*.dbt' ]);
    RemoveDir( ADir );
    RemoveDir( IQGetLocalHomePath + cPrefix );
  end;
end;


procedure TFrmSchemaMaint.InternalImport( S: string );
begin

  FSqlLiteConnection := TFDConnection.Create(nil);
  FSqlLiteConnection.DriverName := 'SQLITE';
  FSqlLiteConnection.Params.Values['Database'] := S;
  try
    // Establish the connection.
    FSqlLiteConnection.Open;
  except
      on E: EDatabaseError do
      begin
        FSqlLiteConnection.Close;
        FSqlLiteConnection.Free;
        raise exception.Create('Problem Establishing SQL Lite Connection');
      end;
  end;

  try
   InsertHeader;
   IQSetTablesActive( FALSE, self );
   IQSetTablesActive( TRUE, self );
  finally
    FSqlLiteConnection.Close;
    FSqlLiteConnection.Free;
  end;
  exit;


   FScHeader   := StrTran( S + '\ScHeader.DBF' ,   '\\', '\' );
   FScHeaderDBT:= StrTran( S + '\ScHeader.DBT',   '\\', '\' );
   FScDetail   := StrTran( S + '\ScDetail.DBF', '\\', '\' );
   FScDetailDBT:= StrTran( S + '\ScDetail.DBT', '\\', '\' );

   if not    FileExists( FScHeader     )
      or not FileExists( FScHeaderDBT  )
      or not FileExists( FScDetail     )
      or not FileExists( FScDetailDBT  ) then
      raise Exception.CreateFmt( 'Can not find all the Schema Import files while processing directory %s', [ S ]);

   InsertHeader;

   IQSetTablesActive( FALSE, self );
   IQSetTablesActive( TRUE, self );
end;

procedure TFrmSchemaMaint.InsertHeader;
var
  AID:Real;
  Arcusto_Id, Vendor_Id:Real;
  aPath:String;
  AConn: TFDConnection;
begin
  with TFDQuery.Create(self) do
  try
    Connection := FSqlLiteConnection;

//    DataBaseName:= ExtractFilePath( FScHeader );
    Sql.Add('select * from ScHeader');
    Open;
    while not eof do
    begin
      if FieldByName('type').asString = 'ASN' then
      begin
        PkVendor.Title := Format('Please assign vendor for the ''%s'' schema', [FieldByName('descrip').asString]);
        if PkVendor.Execute then
        begin
          Vendor_Id := PkVendor.GetValue('ID');
          AID := GetNextID('ARCUSTO_SCHEMA');
          ExecuteCommandFmt('insert into arcusto_schema (id, descrip, type, text, vendor_id) values (%f, ''%s'', ''%s'', ''%s'', %f)',
                    [AID,
                     FieldByName('descrip').asString,
                     FieldByName('type').asString,
                     FieldByName('text').asString,
                     Vendor_Id]);
          InsertDetail(FieldByName('id').asFloat, AID);
        end;
      end
      else
      begin
        PkArcusto.Title := Format('Please assign customer for the ''%s'' schema', [FieldByName('descrip').asString]);
        if PkArcusto.Execute then
        begin
          Arcusto_Id := PkArcusto.GetValue('ID');
          AID := GetNextID('ARCUSTO_SCHEMA');
          ExecuteCommandFmt('insert into arcusto_schema (id, descrip, type, text, arcusto_id) values (%f, ''%s'', ''%s'', ''%s'', %f)',
                    [AID,
                     FieldByName('descrip').asString,
                     FieldByName('type').asString,
                     FieldByName('text').asString,
                     Arcusto_Id]);
          InsertDetail(FieldByName('id').asFloat, AID);
        end;
      end;
      FImportedSchemaId := AId;
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TFrmSchemaMaint.InsertDetail(AHeaderID, ANewHeaderID:Real);
var
  AID:Real;
  AStr:String;
  aPath:String;
  AConn: TFDConnection;
begin
  with TFDQuery.Create(self) do
  try
    Connection := FSqlLiteConnection;
    Sql.Add(IQFormat('select * from ScDetail where arcusto_sc = %f order by seq', [AHeaderID]));
    Open;

    while not eof do
    begin
      AStr := FieldByName('text').asString;
      if Pos('::', AStr) <> 0 then
      begin
        AStr := StrTran(AStr, '::', '^^^^');
      end;
      AStr := StrTran(AStr, #13, '');

      AId := GetNextID('SCHEMA_TEMPLATE');

      AStr := StrTran(AStr, #39, #7);

      ExecuteCommandFmt('insert into SCHEMA_TEMPLATE (id, arcusto_schema_id, seq, text) ' +
                                             'values (%f, %f, %d, ''%s'')',
                                             [AId,
                                              ANewHeaderID,
                                              FieldByName('seq').asInteger,
                                              AStr
//                                              StrTran(FieldByName('text').asString, #13, '')
                                              ]);

      ExecuteCommandFmt('update SCHEMA_TEMPLATE set text = replace(text, chr(7), chr(39)) where id = %f', [AId]);

      ExecuteCommandFmt('update SCHEMA_TEMPLATE set text = replace(text, ''^^^^'', ''::'') where id = %f', [AId]);
      Next;
    end;
  finally
    Free;
  end;

end;

procedure TFrmSchemaMaint.FormShow(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency on iqsecins.pas File
  EnsureSecurityInspectorOnTopOf( self );  }
end;

procedure TFrmSchemaMaint.QrySchemaAfterInsert(DataSet: TDataSet);
begin
{ TODO -oGPatil -cWebConvert : Vcl does not contain Wwdbigrd
  IQSearch1.DBGrid.Options := IQSearch1.DBGrid.Options - [VCL.Wwdbigrd.dgMultiSelect];     }
end;

procedure TFrmSchemaMaint.QrySchemaAfterCancel(DataSet: TDataSet);
begin
{ TODO -oGPatil -cWebConvert : Vcl does not contain Wwdbigrd
  IQSearch1.DBGrid.Options := IQSearch1.DBGrid.Options + [VCL.Wwdbigrd.dgMultiSelect];  }
end;

procedure TFrmSchemaMaint.PkArcustoIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
{ TODO -oGPatil -cWebConvert : Dependency on Qk_Cust.pas File
  Action:= DoQuickAppend( TQuickAddCustomer, ResultValue ); {Qk_Cust.pas}
  if Action = 1 then
    FNewCustId := ResultValue;
end;

procedure TFrmSchemaMaint.PkVendorIQModify(Sender: TObject;  var Action: TModalResult; var ResultValue: Variant);
begin
{ TODO -oGPatil -cWebConvert : Dependency on qk_vend.pas File
  Action:= DoQuickAppend( TQuickAddVendor, ResultValue ); {Qk_vend.pas}
  if Action = 1 then
    FNewVendId := ResultValue;
end;


procedure TFrmSchemaMaint.BringupSqlediform1Click(Sender: TObject);
var
  i:integer;
begin
  wwMemoDialog2.Lines.Clear;
  for i := 0 to DBRichEdit2.Lines.count - 1
  do
  begin
     wwMemoDialog2.Lines.Add(DBRichEdit2.Lines[i]);
  end;
  if not (QryTemplate.State in [dsInsert, dsEdit]) then
    QryTemplate.Edit;
  wwMemoDialog2.Execute;
end;

procedure TFrmSchemaMaint.MenuItem1Click(Sender: TObject);
var
  i:integer;
begin
  wwMemoDialog1.Lines.Clear;
  for i := 0 to DBRichEdit1.Lines.count - 1
  do
  begin
     wwMemoDialog1.Lines.Add(DBRichEdit1.Lines[i]);
  end;
  if not (QrySchema.State in [dsInsert, dsEdit]) then
    QrySchema.Edit;
  wwMemoDialog1.Execute;
end;

procedure TFrmSchemaMaint.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmSchemaMaint.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmSchemaMaint.QryTemplateAfterPost(DataSet: TDataSet);
var
  AId:Real;
begin
{
  try
    QryTemplate.Database.ApplyUpdates([ QryTemplate ]);
    AId := QryTemplateID.asFloat;
    QryTemplate.Close;
    QryTemplate.Open;
    QryTemplate.Locate('ID', AId, []);
  except on E:Exception do
    with QryTemplate do
    begin
      QryTemplate.Close;
      QryTemplate.Open;
      raise;
    end;
  end;
}
end;

procedure TFrmSchemaMaint.QryTemplateAfterInsert(DataSet: TDataSet);
begin
  QryTemplateSEQ.asInteger := Trunc(SelectValueFmtAsFloat('select max(seq) from SCHEMA_TEMPLATE where ARCUSTO_SCHEMA_ID = %f',
                                        [QrySchemaID.asFloat])) + 1;

end;

procedure TFrmSchemaMaint.QryTemplateBeforeEdit(DataSet: TDataSet);
begin
  if QrySchemaID.AsFloat = 0 then
    raise exception.create('Master record must be assigned');

  if QryTemplateARCUSTO_SCHEMA_ID.asFloat = 0 then
    QryTemplateARCUSTO_SCHEMA_ID.AsFloat := QrySchemaID.AsFloat;

  if QryTemplateID.asFloat = 0 then
   QryTemplateID.asFloat := GetNextID('SCHEMA_TEMPLATE');

end;

procedure TFrmSchemaMaint.NavTemplateBeforeAction(Sender: TObject; Button: TNavigateBtn);
var
  AId:Real;
begin
  if Button = nbRefresh then
  begin
    AId := QryTemplateID.asFloat;
    QryTemplate.Close;
    QryTemplate.Open;
    QryTemplate.Locate('ID', AId, []);
    Abort;
  end;

end;

procedure TFrmSchemaMaint.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 5001770 );
end;

procedure TFrmSchemaMaint.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmEDI{CHM}, iqhtmEDI{HTM} )  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmSchemaMaint.wwMemoDialog1CloseDialog(Dialog: TwwMemoDlg);
begin
  if Dialog.Memo.Modified then
  begin
    if not (QrySchema.State in [dsInsert, dsEdit]) then
      QrySchema.Edit;
    QrySchemaTEXT.asString := StrTran(Dialog.Memo.Text, #13#10, #10);
  end
end;


procedure TFrmSchemaMaint.wwMemoDialog2CloseDialog(Dialog: TwwMemoDlg);
begin
  if Dialog.Memo.Modified then
  begin
    if not (QryTemplate.State in [dsInsert, dsEdit]) then
      QryTemplate.Edit;
    QryTemplateTEXT.asString := StrTran(Dialog.Memo.Text, #13#10, #10);
  end
end;

end.
