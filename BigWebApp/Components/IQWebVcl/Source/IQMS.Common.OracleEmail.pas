unit IQMS.Common.OracleEmail;

interface

uses
  IQMS.Common.DataServices,
  FireDAC.Comp.Client,
  System.SysUtils,
  System.Classes,
  IQMS.WebVcl.Blob,
  IQMS.Common.DataConst,
  IQMS.Common.DataLib,
  IQMS.Common.FileUtils,
  IQMS.Common.StringUtils;


procedure SendEmail( ATo, ASubject, ABody: string; Acc:String = ''; DB: String = cnstFDConnectionName; ASentList:TStringList = nil; HTMLContent:boolean = false);
procedure AddAttachmentToBatch(const AFileName: string; ABatchID: Real);


implementation

procedure SendEmail( ATo, ASubject, ABody: string; Acc:String = ''; DB: String = cnstFDConnectionName; ASentList:TStringList = nil; HTMLContent:boolean = false);
var
  I: Integer;
  ABatchId:Real;
  ABody2, Acc2:String;
  aHtml:String;
begin
  ExecuteCommand('delete from EMAIL_ATTACHMENT where time_stamp < sysdate - 1', DB);

  Acc2 := Acc;
  if Acc2 = '' then
    Acc2 := 'NULL';

  if HTMLContent then
    aHtml := 'Y'
  else
    aHtml := 'N';

  if ASentList <> nil then
  begin
    ABatchId  := SelectValueAsFloat('SELECT wf_share.new_attach_batch_id FROM DUAL');
    aBody2 := ABody;
    if ABody2 = '' then
      ABody2 := 'Sending Attached Files';
    for I:= 0 to ASentList.Count - 1 do
    begin
      AddAttachmentToBatch(ASentList[I],  ABatchId);
    end;
    ExecuteCommandFmt('begin iq_mail.send_email(''%s'', ''%s'', ''%s'', ''%s'', %f, ''%s''); end;',
      [ATo, ASubject, Abody, Acc2, ABatchId, aHtml], DB);
  end
  else
    ExecuteCommandFmt('begin iq_mail.send_email(''%s'', ''%s'', ''%s'', ''%s'', 0, ''%s''); end;',
      [ATo, ASubject, Abody, Acc2, aHtml], DB);
end;



procedure AddAttachmentToBatch(const AFileName: string; ABatchID: Real);
var
  AMemoryStream: TMemoryStream;
  AID: Real;
  AUNCFileName, AShortFileName, AExt: string;
  o: TFDCommand;
  AConnection: IIQConnection;
begin
  if (ABatchID > 0) and FileExists(AFileName) then
    begin
      AMemoryStream := TMemoryStream.Create;
      AConnection := TIQCommonDataServices.PooledConnection;
      try
        AConnection.ConnectionName := IntToStr(Trunc(ABatchID));
        if not AConnection.Connected then
          AConnection.Connected := True;

        // Load the file to a memory stream
        AMemoryStream.LoadFromFile(AFileName);
        // Assign the UNC file name.  Since the field is limited to 2000
        // (at this point), ensure the string will fit.
        AUNCFileName := AFileName;
        if Length(AUNCFileName) > 2000 then
          AUNCFileName := '';//(*UG_rem_AMB*) IQMS.Common.FileUtils.ShortDirectoryAndFileName(AFileName);
        // Get the file extension, without the period (max 5 char).
        // Note:  The java side does not want the period in the extension.
        AExt := ''; //(*UG_rem_AMB*) LeftStr(Trim(IQMS.Common.StringUtils.StrAfterDot(ExtractFileExt(AFileName))), 5);
        // Get the file name without the path or the extension (max 255 char).
        // Note:  The java side does not want the path or ext on the file name.
        AShortFileName := '';//(*UG_rem_AMB*)LeftStr(Trim(IQMS.Common.FileUtils.FileNameNoExt(AFileName)), 255);
        // Get next ID for the attachment table
        AID := GetNextID('EMAIL_ATTACHMENT');

      ExecuteCommandParam(
        'INSERT INTO email_attachment(id,                        '#13 +
                                      ' batch_id,                '#13 +
                                      ' file_name,               '#13 +
                                      ' file_extension,          '#13 +
                                      ' unc_file_name,           '#13 +
                                      ' file_data)               '#13 +
                                   '    VALUES (:id,             '#13 +
                                              ' :batch_id,       '#13 +
                                              ' :file_name,      '#13 +
                                              ' :file_extension, '#13 +
                                              ' :unc_file_name,  '#13 +
                                              ' EMPTY_BLOB())',
                                      ['ID;INT64', 'BATCH_ID;F', 'FILE_NAME', 'FILE_EXTENSION', 'UNC_FILE_NAME'],
                                      [AID, ABatchID, AShortFileName, AExt, AUNCFileName], AConnection.ConnectionName);
        TIQWebBlob.SaveBlob('file_data',
          'email_attachment',
          AID,
          AMemoryStream); // iqblob
      finally
        if Assigned(AMemoryStream) then
          FreeAndNil(AMemoryStream);
      end;
    end;
end;


end.
