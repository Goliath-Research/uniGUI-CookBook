{ ******************************************************* }
{ }
{ Main Unit for Export }
{ This unit contains the primary wrappers for }
{ export routines. }
{ }
{ ******************************************************* }

unit dbtexp;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  uniGUIApplication,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  DB,
  SqlExpr,
  DBClient,
  ADODB,
  IQMS.WebVcl.DBExpress,
  IQMS.DBTrans.dbttypes;

function ExportToStandardFormat(
  const ASource: TDataSet;
  const ATargetFile: String;
  const ATableType: TCustomTableType;
  const AShowProgress: Boolean;
  const ALogging: Boolean = False;
  const ALogFileName: String = '';
  const AErrorLogFileName: String = '';
  const AOnProgressEvent: TOnProgressEvent = NIL;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent = NIL;
  const ASourceOracleTableName: string = '')
  : Boolean;

function ExportToMSAccess(
  const ASource: TDataSet; // source dataset
  const ATableName, // source table name
  ATargetFile, // MS Access file (.mdb)
  ATargetTableName: String; // target table name
  const ALogging: Boolean;
  const ALogFile,
  AErrorLogFile: String;
  const AUserName: String = 'Admin';
  const APassWord: String = '';
  const AProgressMessage: String = '';
  const AShowProgress: Boolean = True;
  const AOnProgressEvent: TOnProgressEvent = NIL;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent = NIL)
  : Boolean;

function ExportToExcel(
  const ASource: TDataSet;
  const ATableName: String;
  const ATargetFile: String;
  const ALogging: Boolean;
  const ALogFile: String;
  const AErrorLogFile: String;
  const AProgressMessage: String = '';
  const AShowProgress: Boolean = True;
  const ASuppressPrompts: Boolean = False;
  const AOnProgressEvent: TOnProgressEvent = NIL;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent = NIL)
  : Boolean;

function ExportToCSV(
  const ASource: TDataSet;
  const ATargetFile: String;
  const AShowProgress: Boolean;
  const AOnProgressEvent: TOnProgressEvent = NIL;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent = NIL;
  const ARecordCount: Integer = 0): Boolean;

function ExportToAlias(
  const ASQLConnection: TSQLConnection;
  const ASource: TDataSet;
  const ATableName,
  ADatabaseName,
  ATargetTableName: String;
  const ADataSourceType: TDataSourceType;
  const ADriverType: TDriverType;
  const ALogging: Boolean;
  const ALogFile,
  AErrorLogFile: String;
  var AUserName: String;
  var APassWord: String;
  const AOnProgressEvent: TOnProgressEvent = NIL;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent = NIL)
  : Boolean;

function ExportToAscii(
  const ASQLConnection: TSQLConnection;
  const ASource: TDataSet;
  const ASourceTableName,
  ATargetFile: String;
  const ALogging: Boolean;
  const ALogFile,
  AErrorLogFile: String;
  const AShowProgress: Boolean;
  const AProgressMessage: String;
  const ASuppressPrompts: Boolean;
  const AExecuteImmediate: Boolean = False;
  const AOnProgressEvent: TOnProgressEvent = NIL;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent = NIL)
  : Boolean;

function ExportToXML(
  const ASource: TDataSet;
  const ATargetFile,
  ATargetTableName: String;
  const AExecuteImmediate: Boolean = False;
  const AOnProgressEvent: TOnProgressEvent = NIL;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent = NIL)
  : Boolean;

implementation

uses
  IQMS.DBTrans.dbtado,
  dbtbatmv,
  IQMS.DBTrans.dbtdbexp,
  dbtexpm,
  dbtexpa,
  dbtexptx,
  dbtexpxl,
  dbtxml,
  IQMS.DBTrans.dbtrscstr,
  IQMS.Common.ProgressDialog;

function ExportToStandardFormat(
  const ASource: TDataSet;
  const ATargetFile: String;
  const ATableType: TCustomTableType;
  const AShowProgress: Boolean;
  const ALogging: Boolean;
  const ALogFileName: String;
  const AErrorLogFileName: String;
  const AOnProgressEvent: TOnProgressEvent;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent;
  const ASourceOracleTableName: string): Boolean;
var
  AADOConnection: TADOConnection;
  ATarget: TAdoTable;
  AFileLog, AFileError: String;
begin
  // 05/27/2009 A dBase file size cannot exceed 2 GB.  And the field count
  // must not exceed 1024 fields.  Field names must be 31
  // characters or less.  String fields hold 254 characters or less.

  // Initialization
  Result := False;
  ATarget := NIL;
  AFileLog := '';
  AFileError := '';

  if (ASource = NIL) then
    raise Exception.Create('Application Error: Source dataset not provided.');

//  if not (ASource is TDbxCustomDataSet) then
//    raise Exception.Create('Application Error: Invalid Source dataset type.');

  if (ATargetFile = '') then
    raise Exception.Create('Application Error: Target file name not provided.');

  if ALogging then
    begin
      AFileLog := ALogFileName;
      AFileError := AErrorLogFileName;
    end;

  AADOConnection := TADOConnection.Create(NIL);
  try
    case ATableType of
      dttParadox:
        IQMS.DBTrans.dbtado.ADO_ConfigureConnectionForParadox(AADOConnection,
          ExtractFilePath(ATargetFile));
      dttDBase:
        IQMS.DBTrans.dbtado.ADO_ConfigureConnectionForDBF(AADOConnection,
          ExtractFilePath(ATargetFile));
      dttFoxPro:
        IQMS.DBTrans.dbtado.ADO_ConfigureConnectionForVisualFoxPro(AADOConnection,
          ExtractFilePath(ATargetFile));
    else
      raise Exception.Create(
        'Application Error: Error exporting to standard format:  Invalid table type.');
    end;

    AADOConnection.KeepConnection := True;
    AADOConnection.Mode := cmReadWrite;

    ATarget := TAdoTable.Create(NIL);
    try
      with ATarget do
        begin
          Connection := AADOConnection;
          TableName := ExtractFileName(ATargetFile);
        end;

      BatchExport(
        //TDbxCustomDataSet(ASource),
        ASource,
        ATarget,
        ATargetFile,
        ATableType,
        iqbmCopy,
        AShowProgress,
        NIL, // AFieldMap
        '', // AExportMsg1
        '', //
        AFileLog, // ALogFile
        AFileError, // AErrorLogFile
        AOnProgressEvent,
        AOnCheckProgressAbortedEvent,
        ASourceOracleTableName); // dbtbatmv

      Result := True;

    finally
      if Assigned(ATarget) then
        FreeAndNil(ATarget);
    end;
  finally
    FreeAndNil(AADOConnection);
  end;

end;

function ExportToMSAccess(const ASource: TDataSet; // source dataset
  const ATableName, // source table name
  ATargetFile, // MS Access file (.mdb)
  ATargetTableName: String; // target table name
  const ALogging: Boolean;
  const ALogFile,
  AErrorLogFile: String;
  const AUserName: String;
  const APassWord: String;
  const AProgressMessage: String;
  const AShowProgress: Boolean;
  const AOnProgressEvent: TOnProgressEvent;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent): Boolean;
begin
  with TFrmDBTransExportMDB.Create do // dbtexpm.pas
    try
      SourceDataSet := ASource;
      TableName := ATableName;
      DatabaseName := ATargetFile;
      TargetTableName := ATargetTableName;
      UserName := AUserName;
      Password := APassWord;
      ProgressMessage := AProgressMessage;
      Logging := ALogging;
      LogFile := ALogFile;
      ErrorLogFile := AErrorLogFile;
      OnProgressEvent := AOnProgressEvent;
      OnCheckProgressAbortedEvent := AOnCheckProgressAbortedEvent;
      ShowProgress := AShowProgress;
      if AShowProgress then
        Result := ShowModal = mrOk
      else
        Result := Execute;
    finally
      Free;
    end;
end;

function ExportToExcel(const ASource: TDataSet;
  const ATableName: String;
  const ATargetFile: String;
  const ALogging: Boolean;
  const ALogFile: String;
  const AErrorLogFile: String;
  const AProgressMessage: String;
  const AShowProgress: Boolean;
  const ASuppressPrompts: Boolean;
  const AOnProgressEvent: TOnProgressEvent;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent): Boolean;
begin
  with TFrmDBTransExportExcel.Create(Application, ASource,
    ATargetFile) do // dbtexpxl
    try
      TableName := ATableName;
      Logging := ALogging;
      LogFile := ALogFile;
      ErrorLogFile := AErrorLogFile;
      ProgressMessage := AProgressMessage;
      SuppressPrompts := ASuppressPrompts;
      ShowProgress := AShowProgress;
      OnProgressEvent := AOnProgressEvent;
      OnCheckProgressAbortedEvent := AOnCheckProgressAbortedEvent;
      if AShowProgress then
        Result := ShowModal = mrOk
      else
        Result := Execute;
    finally
      Free;
    end;
end;

function ExportToCSV(const ASource: TDataSet;
  const ATargetFile: String;
  const AShowProgress: Boolean;
  const AOnProgressEvent: TOnProgressEvent;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent;
  const ARecordCount: Integer): Boolean;
var
  AMax, ACount, I: Integer;
  AFileStream: TStream;
  ALine, AText: UTF8String;
  AProgressMessage: string;
  AActive: Boolean;
  hPrg: TIQWebProgressDialog; // in isprogressdlg.pas
begin
  // Initial
  hPrg := NIL;
  AFileStream := NIL;
  AActive := False;
  AMax := ARecordCount;
  ACount := 0;

  try
    if AMax = 0 then
      try
        if not ASource.Active then
          ASource.Open;

        if (ASource is TSQLTable) then
          AMax := IQMS.DBTrans.dbtdbexp.DBX_GetRecordCount(TSQLTable(ASource))

        else if (ASource is TSQLQuery) then
          AMax := IQMS.DBTrans.dbtdbexp.DBX_GetRecordCount(TSQLQuery(ASource))

        else if (ASource is TIQWebDbxQuery) then
          AMax := TIQWebDbxQuery(ASource).RecordCount

        else if (ASource is TIQWebDbxTable) then
          AMax := TIQWebDbxTable(ASource).RecordCount

        else
          AMax := ASource.RecordCount;
      except
        AMax := 0;
      end;

    DeleteFile(ATargetFile);

    // 'Exporting to %s.  Please wait.'
    AProgressMessage := Format(IQMS.DBTrans.dbtrscstr.cTXT0000043,
      [ExtractFileName(ATargetFile)]);

    // Create the Progress Dialog box
    if AShowProgress then
      hPrg := hProgressDlg( AMax { Max Value } ,
        AProgressMessage { Status Text } );
    try
      if Assigned(AOnProgressEvent) then
        AOnProgressEvent(AMax, 0, AProgressMessage);

      // Create text file
      AFileStream := TFileStream.Create(ATargetFile, fmCreate);
      try
        AText := '';
        AActive := ASource.Active;
        if not ASource.Active then
          ASource.Open;
        // Column Headers
        for I := 0 to ASource.FieldCount - 1 do
          begin
            if not ASource.Fields[I].Visible then
              CONTINUE;
            if ALine > '' then
              ALine := ALine + ',' + '"' + ASource.Fields[I].DisplayLabel + '"'
            else
              ALine := '"' + ASource.Fields[I].DisplayLabel + '"';
          end;
        ALine := ALine + #13#10;
        AFileStream.WriteBuffer(Pointer(ALine)^, Length(ALine));

        ASource.First;
        // Loop through the records
        while not ASource.EOF do
          begin
            // Check to see if user pressed Cancel button
            if Assigned(hPrg) and hPrg.CheckProgressAborted then
              Break;
            if Assigned(AOnCheckProgressAbortedEvent) and
              AOnCheckProgressAbortedEvent then
              Break;

            ALine := '';
            // Loop through the fields
            for I := 0 to ASource.FieldCount - 1 do
              begin
                if not ASource.Fields[I].Visible then
                  CONTINUE;
                // Get field text
                if ASource.Fields[I].DataType in [ftString, ftMemo, ftFixedChar,
                  ftWideString] then
                  AText := '"' + ASource.Fields[I].AsAnsiString + '"'
                else
                  AText := ASource.Fields[I].AsAnsiString;
                // Add field text to line
                if ALine > '' then
                  ALine := ALine + ',' + AText
                else
                  ALine := AText;
              end;
            ALine := ALine + #13#10; // append new line char
            // Write line to file
            AFileStream.WriteBuffer(Pointer(ALine)^, Length(ALine));
            ASource.Next;
            Inc(ACount);

            // Step progress bar
            if Assigned(hPrg) then
              hPrg.StepProgress;
            if Assigned(AOnProgressEvent) then
              AOnProgressEvent(AMax, ACount, AProgressMessage);
          end;
        Result := True;
      finally
        FreeAndNil(AFileStream);
      end;
    finally
      if Assigned(hPrg) then
        FreeAndNil(hPrg);
    end;
  finally
    if not AActive then
      ASource.Close;
    // Free the Progress Dialog box
  end;
end;

function ExportToAlias(const ASQLConnection: TSQLConnection;
  const ASource: TDataSet;
  const ATableName,
  ADatabaseName,
  ATargetTableName: String;
  const ADataSourceType: TDataSourceType;
  const ADriverType: TDriverType;
  const ALogging: Boolean;
  const ALogFile,
  AErrorLogFile: String;
  var AUserName: String;
  var APassWord: String;
  const AOnProgressEvent: TOnProgressEvent;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent): Boolean;
begin
  Result := False;
  // Create the form and execute
  with TFrmDBTransExportAlias.Create(
    ADatabaseName,
    ATableName,
    AUserName,
    APassWord,
    ATargetTableName,
    ADataSourceType,
    ADriverType,
    ASource) do
    // dbtexpa.pas, descendant of dbthiddn.pas
    try
      SQLConnection := ASQLConnection;
      Logging := ALogging;
      LogFile := ALogFile;
      ErrorLogFile := AErrorLogFile;
      OnProgressEvent := AOnProgressEvent;
      OnCheckProgressAbortedEvent := AOnCheckProgressAbortedEvent;
      if not FAborted then
        begin
          // SourceDataSet := ASource;  // must set the source dataset first
          Show;
          Application.ProcessMessages;
          if Visible then
            Result := DoProcessExec;
        end;
      AUserName := UserName;
      APassWord := Password;
    finally
      Free;
    end;
end;

function ExportToAscii(const ASQLConnection: TSQLConnection;
  const ASource: TDataSet;
  const ASourceTableName,
  ATargetFile: String;
  const ALogging: Boolean;
  const ALogFile,
  AErrorLogFile: String;
  const AShowProgress: Boolean;
  const AProgressMessage: String;
  const ASuppressPrompts: Boolean;
  const AExecuteImmediate: Boolean;
  const AOnProgressEvent: TOnProgressEvent;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent): Boolean;
begin
  // Display "Export Text Wizard" to build schema.  We need
  // to know if it's delimited (with details) or fixed.
  with TFrmIQDBTransExportTextFile.Create( ATargetFile) do
    // dbtexptx.pas, descendant of dbthiddn.pas
    try
      SQLConnection := ASQLConnection;
      SourceDataSet := ASource; // must set the source dataset first
      SourceTableName := ASourceTableName;

      DatabaseName := ATargetFile;
      ShowProgress := AShowProgress;
      ProgressMessage := AProgressMessage;
      Logging := ALogging;
      LogFile := ALogFile;
      ErrorLogFile := AErrorLogFile;
      SuppressPrompts := ASuppressPrompts;
      OnProgressEvent := AOnProgressEvent;
      OnCheckProgressAbortedEvent := AOnCheckProgressAbortedEvent;

      if not AExecuteImmediate then
        Result := ShowModal = mrOk
      else
        Result := Execute;

    finally
      Free;
    end;
end;

function ExportToXML(const ASource: TDataSet;
  const ATargetFile,
  ATargetTableName: String;
  const AExecuteImmediate: Boolean;
  const AOnProgressEvent: TOnProgressEvent;
  const AOnCheckProgressAbortedEvent: TCheckProgressAbortedEvent): Boolean;
begin
  // Export to XML
  with TXMLExport.Create(NIL, ATargetFile, ATargetTableName,
    ASource) do // dbtxml.pas
    try
      DataSet := ASource;
      TargetTableName := ATargetTableName;
      OnProgressEvent := AOnProgressEvent;
      OnCheckProgressAbortedEvent := AOnCheckProgressAbortedEvent;
      Result := Execute;
    finally
      Free;
    end;
end;

end.
