unit dbtexpxl;

(* Export to Microsoft Excel (*.XLS) *)

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  dbthiddn,
  ComCtrls,
  StdCtrls,
  Menus,
  ExtCtrls,
  DB,
  IQMS.Common.JumpConstants,
  IQMS.DBTrans.dbttypes,
  ADODB, uniProgressBar, uniLabel, uniMainMenu, uniGUIBaseClasses,
  uniGUIClasses, uniPanel;

type
  TFrmDBTransExportExcel = class(TFrmDBTransHidden)
    lblStatus1: TUniLabel;
    ProgressBar: TUniProgressBar;
    procedure FormShow(Sender: TObject);
    private
      { Private declarations }
      FTargetFile: string;
      FTableName: string;
      FProgressMessage: string;
      FSuppressPrompts: Boolean;
      procedure IQAfterShowMessage(var Msg: TMessage);
        message iq_AfterShowMessage;

      // Returns True if all is well
      function CheckDeleteExistingFile: Boolean;
      function ValidateRecordCount(const AMax: Integer): Boolean;

      function DoProcessExec: Boolean; override;

      // Exports as Excel 2.1 format (old version)
      // function ExportAsStream: Boolean;
      // Added 05/16/2008
      function ExportAsADO: Boolean;

    public
      { Public declarations }
      constructor Create(AOwner: TComponent; ASource: TDataSet;
        ATargetFile: string);
    published
      { Published declarations }
      property TargetFile: string
        read FTargetFile
        write FTargetFile;

      property SourceDataset;
      property TableName: string
        read FTableName
        write FTableName;
      property Logging;
      property LogFile;
      property ErrorLogFile;
      property ProgressMessage: string
        read FProgressMessage
        write FProgressMessage;
      property SuppressPrompts;
      property OnProgressEvent;
      property OnCheckProgressAbortedEvent;
  end;

var
  FrmDBTransExportExcel: TFrmDBTransExportExcel;

implementation

{$R *.dfm}

uses
  IQMS.DBTrans.dbtado,
  IQMS.DBTrans.dbtrscstr,
  IQMS.DBTrans.dbtshare,
  IQMS.Common.Boolean,
  IQMS.Common.Controls,
  IQMS.Common.Dialogs,
  IQMS.Common.Numbers,
  IQMS.Common.RecordCount,
  IQMS.Common.StringUtils;

{ TFrmDBTransExportExcel }

constructor TFrmDBTransExportExcel.Create(AOwner: TComponent; ASource: TDataSet;
  ATargetFile: string);
begin
  inherited Create(AOwner);
  SourceDataset := ASource;
  TargetFile := ATargetFile;
end;

procedure TFrmDBTransExportExcel.FormShow(Sender: TObject);
begin
  inherited;
  PostMessage(Handle, iq_AfterShowMessage, 0, 0);
end;

procedure TFrmDBTransExportExcel.IQAfterShowMessage(var Msg: TMessage);
begin
  DoProcessExec;
end;

function TFrmDBTransExportExcel.DoProcessExec: Boolean;
var
  AMsg: string;
begin
  Application.ProcessMessages;
  try
    // Result := ExportAsStream;
    Result := ExportAsADO;

    // write to log file
    if Result and Logging then
      WriteToLog
        (Format('Exported table, %s, to Microsoft Excel spreadsheet, %s.',
        [TableName, TargetFile]));

    if Result then
      ModalResult := mrOk
    else
      ModalResult := mrCancel;

  except
    on E: Exception do
      try
        AMsg := Format
          ('Error exporting to Microsoft Excel spreadsheet, %s:'#13#13'%s',
          [TargetFile, E.Message]);
        // Write error to error log first
        WriteToLog(AMsg);
        WriteToErrorLog(AMsg);
        raise Exception.Create(AMsg);
      finally
        ModalResult := mrCancel;
      end;
  end;
end;

function TFrmDBTransExportExcel.CheckDeleteExistingFile: Boolean;
begin
  // Initial result
  Result := True;

  if FileExists(TargetFile) then
    begin
      // 'The file %s already exists.  Do you want to replace the existing file?'
      if not SuppressPrompts then
        if not IQConfirmYN(Format(IQMS.DBTrans.dbtrscstr.cTXT0000062, [TargetFile])) then
          begin
            Result := False;
            Exit;
          end;

      // Delete the file
      Result := DeleteFile(TargetFile);

      // If we cannot delete the file prompt user
      if not Result then
        begin
          if not SuppressPrompts then
            IQError(IQMS.DBTrans.dbtrscstr.cTXT0000066); // 'Could not replace file.'
        end;
    end;
end;

function TFrmDBTransExportExcel.ValidateRecordCount
  (const AMax: Integer): Boolean;
begin
  Result := False;
  if (AMax > 65536) then
    // 'Dataset contains excessive number of records.  Microsoft Excel can have a maxiumum of 65,536 rows.'
    raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000065);
  Result := True;
end;

function TFrmDBTransExportExcel.ExportAsADO: Boolean;
var
  AConnectionString, ACommandText, AFieldName: string;
  ADefinition: TStringList;
  AMax, ACount, i: Integer;
  ADOTable: TADOTable;
  AAborted: Boolean;
begin
  // Initialization
  Result := False;
  AMax := 0;
  ACount := 0;
  ADefinition := nil;
  AAborted := False;

  if SourceDataset = nil then
    Exit;
  if TargetFile = '' then
    Exit;

  // Overwrite? File must be deleted first
  if not CheckDeleteExistingFile then
    Exit;
  if FileExists(TargetFile) then
    Exit;

  // Check if ISAM dll exists
  IQMS.DBTrans.dbtado.CheckExcelISAMExists;

  // Basic connection string for Excel
  // NOTE:  Do not call IQMS.DBTrans.dbtado.ADO_ConnectionStringForMSExcel() because
  // we are access a file that does not yet exist.  If we use the
  // dbtado function, we will get an error when we try to create the
  // new spreadsheet.
  if (CompareText(ExtractFileExt(TargetFile), '.xlsx') = 0) or
  (CompareText(ExtractFileExt(TargetFile), '.xlsb') = 0) or
  (CompareText(ExtractFileExt(TargetFile), '.xlsm') = 0) then
    AConnectionString := Format('Provider=Microsoft.Ace.OLEDB.12.0; ' +
      'Data Source=%s;Extended Properties=Excel 12.0 XML', [TargetFile])
  else
    AConnectionString := Format('Provider=Microsoft.Jet.OLEDB.4.0; ' +
      'Data Source=%s;Extended Properties=Excel 8.0', [TargetFile]);

  // Get the Jet table definition
  try
    ADefinition := TStringList.Create;
    IQMS.DBTrans.dbtshare.GetMicrosoftJetTableDefinition(SourceDataset, TableName,
      ADefinition);
    ACommandText := ADefinition.Text;
  finally
    FreeAndNil(ADefinition);
  end;

  if not SourceDataset.Active then
    SourceDataset.Open;
  SourceDataset.First;
  AMax := GetRecordCount;
  if not ValidateRecordCount(AMax) then
    Exit;

  ProgressBar.Position := 0;
  ProgressBar.Min := 0;
  ProgressBar.Max := AMax;

  // lblStatus1.Caption := Format(IQMS.DBTrans.dbtrscstr.cTXT0000063 {'Exporting %s'}, [TargetFile]);
  lblStatus1.Caption := ProgressMessage;
  Application.ProcessMessages;

  if Assigned(OnProgressEvent) then
    OnProgressEvent(AMax, 0, ProgressMessage);

  // Create the Excel spreadsheet
  with TADOCommand.Create(nil) do // Create the ADO command object
    try
      // Insert the new table
      ConnectionString := AConnectionString; // apply the connection string
      Prepared := True; // prepare it first
      CommandText := ACommandText; // apply the CREATE TABLE SQL
      try
        Execute; // create an empty spreadsheet
      except
        on E: Exception do
          begin
            IQError(E.Message);
            Exit;
          end;
      end;
    finally
      Free;
    end;

  // Copy the records
  try
    // Create target ADO connect to the spreadsheet
    ADOTable := TADOTable.Create(nil);
    ADOTable.ConnectionString := AConnectionString;
    ADOTable.TableName := TableName;
    ADOTable.Open;

    SourceDataset.DisableControls;
    SourceDataset.First;

    // Copy records
    while not SourceDataset.EOF do
      begin
        if Assigned(OnCheckProgressAbortedEvent) and
          OnCheckProgressAbortedEvent then
          begin
            AAborted := True;
            Break;
          end;

        // insert a record
        ADOTable.Insert;

        // cycle each field and insert value, left to right
        for i := 0 to SourceDataset.FieldCount - 1 do
          if SourceDataset.Fields[i].Visible then
            begin
              // Get the field name
              AFieldName := SourceDataset.Fields[i].FieldName;
              // Check if field exists
              if ADOTable.FindField(AFieldName) = nil then
                raise Exception.Create('Application Error: Excel field ' +
                  'definition incorrect.  Operation aborted.');
              // Write data by type
              case SourceDataset.Fields[i].DataType of
                ftUnknown:
                  Continue;
                ftBytes, ftSmallint, ftInteger, ftWord:
                  ADOTable.FieldByName(AFieldName).AsInteger :=
                    SourceDataset.Fields[i].AsInteger;
                ftBoolean:
                  ADOTable.FieldByName(AFieldName).AsString :=
                    IQMS.Common.Boolean.BoolToYesNo(SourceDataset.Fields[i].AsBoolean);
                ftAutoInc, ftLargeInt, ftFloat, ftCurrency, ftBCD, ftFmtBCD:
                  ADOTable.FieldByName(AFieldName).AsFloat :=
                    SourceDataset.Fields[i].AsFloat;
                ftDateTime, ftDate, ftTime, ftTimeStamp:
                  ADOTable.FieldByName(AFieldName).AsString :=
                    FormatDateTime('ddddd', SourceDataset.Fields[i].AsDateTime);
                ftString, ftFixedChar, ftWideString, ftFmtMemo, ftMemo:
                  ADOTable.FieldByName(AFieldName).AsString :=
                    SourceDataset.Fields[i].AsString;

                ftBlob, ftOraClob, ftOraBlob:
                  Continue;

              else
                Continue;
              end; // end case
            end;

        // save changes
        if (ADOTable.State in [dsInsert]) then
          ADOTable.Post;

        // next record
        SourceDataset.Next;
        Inc(ACount);

        // The label sometimes will disappear (?)
        lblStatus1.Invalidate;

        // 04/25/2012 Instead of calling ProgressBar.StepIt, we
        // must add some kludgy code to compensate for a "feature"
        // in the Windows common control.  Progress will not update
        // properly if we just call StepIt, and it will appear that
        // the progress bar only filled 75 percent or just half way.
        ProgressBar.Position := ProgressBar.Position - 1;
        ProgressBar.Position := ProgressBar.Position + 2;
        if Assigned(OnProgressEvent) then
          OnProgressEvent(AMax, ACount, ProgressMessage);
        Application.ProcessMessages;
      end;

      // Finally, fill the progress bar all the way
      ProgressBar.Position := AMax;

  finally
    // tidy up
    SourceDataset.First;
    SourceDataset.EnableControls;
    if Assigned(ADOTable) then
      FreeAndNil(ADOTable);
  end;

  Result := not AAborted;

end;

end.
