unit ImpShare;

interface

uses
  ImpConst,
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  IQMS.WebVcl.TextStream,
  MainModule;


procedure DoIqImp( AOwner: TComponent; AType: Integer; AStr:String; AID1: Real; ADir:String; AId2:Real=0 );
procedure ProcessAutoXML(AFileName:String; ASchemaId:Real; AId:Real=0);
procedure ProcessXML(AXMLFile, AXSLTFile, AEXECUTE_PROC:String; ASchemaId:Real; AXMLFile_Export:String; AId:Real= 0);
function FindHistDirectory(ADir:String):Boolean;
procedure ExtractToFile(AFileName:String; ASchemaId:Real);
procedure IqCopyFile(ASource, ATarget:String);
procedure XMLCheckAuto997(AFileName:String);

implementation

uses
  IQMS.Common.Applications,
  MainImp,
  IQMS.WebVcl.SecurityManager,
  XMLSetUp,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  { TODO -omugdha -cWEBIQ : Dependancy on IqTxStrm
  IqTxStrm, }
  IQMS.Common.NLS,
  SchMaint;
  { TODO -omugdha -cWEBIQ : Dependancy on EDIEServer
  EDIEServer;}


procedure DoIqImp( AOwner: TComponent;  AType: Integer; AStr:String; AID1: Real; ADir:String; AId2:Real=0 );
begin
  if not SecurityManager.SetVisibleIfLicensed( nil,    nil, nil, IQAppsNames[ apEDI ] , nil ) then
     EXIT;

  case AType of
    SHOW_IMP_MAIN    : DoImp(AOwner);               {in MainImp.pas}
    IMP_AUTO         : DoAutoImp(AStr, AID1, ADir); {in MainImp.pas}
    XML_AUTO         : ProcessAutoXML(AStr, AID1, AID2); {in ImpShare.pas}
    XML_ESERVER_AUTO : DoAutoXML(AStr, AID1, AID2, ADir); {in XMLSetUp.pas}
    SHOW_IMP_MAIN_FA : DoImpFA(AOwner);             {in MainImp.pas}
    SHOW_XML_SETUP   : DoXMLSetUp();          {in XMLSetUp.pas}
    { TODO -omugdha -cWEBIQ :  dependancy on SchMaint
    SHOW_SCHEMA_MAIN : DoArcustoSchema(AOwner);   }        {in SchMaint.pas}
  end;
end;

procedure ProcessAutoXML(AFileName:String; ASchemaId:Real; AId:Real=0);
var
  AExecProc, ASchema_no:String;
  AXMLFile_IN, AXMLFile_Out, AXSLTFile:String;
  ADir:String;
begin
  AExecProc  := SelectValueFmtAsString('select execute_proc from xml_schema where id = %f', [ASchemaId]);
  ASchema_no := SelectValueFmtAsString('select schema_no from xml_schema where id = %f', [ASchemaId]);
  ADir := SelectValueAsString('select edi_unc_collector_dir from iqsys where rownum < 2');
  ForceDirectories(ADir);
  AXMLFile_IN := AFileName;
  AXMLFile_OUT := ADir + '\' + IntToStr(Trunc(ASchemaId)) + '_' + ASCHEMA_NO +
               FormatDateTime('mm_dd_yyyy', Date) + '_' +
               FormatDateTime('hh_nn_ss', Time) + '_' + ExtractFileName(AXMLFile_IN);

  AXSLTFile := ADir + '\' + IntToStr(Trunc(ASchemaId)) + '_' + ASCHEMA_NO +
               FormatDateTime('mm_dd_yyyy', Date) + '_' +
               FormatDateTime('hh_nn_ss', Time) +
               '.XSL';
  CopyFile(PChar(AXMLFile_IN), PChar(AXMLFile_OUT), False);

  ExtractToFile(AXSLTFile, ASchemaId);

  ProcessXML(AXMLFile_OUT, AXSLTFile, AExecProc, ASchemaId, AFileName, AId);
  XMLCheckAuto997(AFileName);
end;

procedure XMLCheckAuto997(AFileName:String);
var
  aId:Real;
  AQry:TFDQuery;
  AFileList:TStringList;
  K:Integer;
  AInterchangeCode:String;
begin
  aId := SelectValueFmtAsFloat('select max(id) from edi_file where InStr(file_name, ''%s'') <> 0', [ExtractFileName(AFileName)]);
  if AId <> 0 then
  begin
      if SelectValueFmtAsFloat('select count(t.id)  from EDI_PARTNERS p, ' +
                                   ' EDI_PARTNERS_TS t ' +
                               'where p.TP_INTERCHANGE_CODE  in (select interchange_code from edi_isa_header where edi_file_id = %f) ' +
                               ' and t.edi_partners_id = p.id ' +
                               ' and NVL(t.func_ackn, ''N'') = ''Y'' ' +
                               'and t.transaction_set_code in (select h1.transaction_set_id ' +
                                                                ' from edi_ts_hdr h1, ' +
                                                                ' edi_isa_header h2 ' +
                                                                ' where h1.edi_isa_header_id = h2.id ' +
                                                                ' and h2.edi_file_id = %f) ',
                               [aId, aId]) > 0 then
      begin
        AQry := TFDQuery.Create(nil);
        with AQry do
        try
//          DataBaseName:= 'IQ';
          Connection := uniMainModule.FDConnection1;
          
          Sql.Add(IqFormat('select distinct h.id, h.interchange_code ' +
                           ' from edi_isa_header h, ' +
                           '       edi_ts_hdr t, ' +
                           '       edi_partners_ts ts, ' +
                           '       edi_partners p ' +
                           ' where t.edi_isa_header_id = h.id ' +
                           '   and h.edi_file_id = %f ' +
                           '   and p.TP_INTERCHANGE_CODE = h.interchange_code ' +
                           ' and ts.edi_partners_id = p.id ' +
                           ' and ts.transaction_set_code = t.transaction_set_id ' +
                           ' and NVL(ts.func_ackn, ''N'') = ''Y'' order by h.interchange_code ', [aId]));
           open;
           AFileList := TStringList.Create;

           try
             AInterchangeCode := AQry.FieldByName('interchange_code').asString;
           except
             AInterchangeCode := '~~~~@@@###$$#@$#%^%$$#@#$';
           end;

           try
             while not eof do
             begin
               if AInterchangeCode <> '~~~~@@@###$$#@$#%^%$$#@#$' then
               begin
                 if AQry.FieldByName('interchange_code').asString <> AInterchangeCode then
                 begin
                   AInterchangeCode := AQry.FieldByName('interchange_code').asString;
                   for K := 0 to AFileList.Count - 1 do
                     MoveFile( PChar(Copy(AFileList[K], 1, Pos('%%%%%%%%%%', AFileList[K]) - 1)),
                           PChar(Copy(AFileList[K], Pos('%%%%%%%%%%', AFileList[K]) + 10, Length(AFileList[K])) ));
                   AFileList.Free;
                   AFileList := TStringList.Create;
                 end;
               end;
               { TODO -omugdha -cWEBIQ :  dependancy on EDIEServer
               ProcessAuto997(FieldByName('id').asfloat, AFileList);} {in EDIEServer.pas}
               next;
             end;
            for K := 0 to AFileList.Count - 1 do
              MoveFile( PChar(Copy(AFileList[K], 1, Pos('%%%%%%%%%%', AFileList[K]) - 1)),
                        PChar(Copy(AFileList[K], Pos('%%%%%%%%%%', AFileList[K]) + 10, Length(AFileList[K])) ));

           finally
             AFileList.Free;
           end;
        finally
          Free;
        end;
      end
  end;
end;


procedure ProcessXML(AXMLFile, AXSLTFile, AEXECUTE_PROC:String; ASchemaId:Real; AXMLFile_Export:String; AId:Real=0);
var
  ADir, ALocalDir, AXMLDir, AFileName, AFile:String;
  AType:Integer;
begin
  ADir := SelectValueAsString('select edi_unc_collector_dir from iqsys where rownum < 2');
  ALocalDir := SelectValueAsString('select edi_local_collector_dir from iqsys where rownum < 2');
  ForceDirectories(ADir);
  AFileName := StrTran(UpperCase(ExtractFileName(AXSLTFile)), '.XSL', '');
  AXMLDir := Format('DIR_%s', [AFileName]);
  ExecuteCommandFmt('create or replace directory %s as ''%s''', [AXMLDir, ALocalDir]);

  try
    if Pos('XML_IMP', AEXECUTE_PROC) <> 0 then
      ExecuteCommandFmt('begin %s.XML_IMPORT(''%s'', ''%s'', ''%s'', %f); end;',
                  [AEXECUTE_PROC,
                   ExtractFileName(AXMLFile), ExtractFileName(AXSLTFile),
                   AXMLDir, ASchemaId])
    else
    begin
      AFile := ALocalDir + '\' + ExtractFileName(AXMLFile);
      ExecuteCommandFmt('begin %s.XML_EXPORT(''%s'', ''%s'', ''%s'', %f, %f); end;',
                  [AEXECUTE_PROC,
                   AFile, ExtractFileName(AXSLTFile),
                   AXMLDir, ASchemaId, AId]);

      if FileExists(AXMLFile) then
        DeleteFile(AXMLFile_Export);

      MoveFile( PChar(AXMLFile), PChar(AXMLFile_Export));
    end;
  finally
    ExecuteCommandFmt('drop directory %s', [AXMLDir]);
  end;

  AType := 0;
  if IQRegIntegerScalarRead( nil, 'XML_DELETE_FILE_AFTER_PROCESS', AType ) then
  begin
    if AType = 1 then
    begin
      DeleteFile(AXMLFile);
      DeleteFile(AXSLTFile);
    end;
  end;
end;

function FindHistDirectory(ADir:String):Boolean;
var
  i:Integer;
begin
  result := false;
  for i := 1 to 4 do
  begin
    result :=  DirectoryExists(ADir);
    if result then exit;
    sleep(2000);
  end;

end;

procedure ExtractToFile(AFileName:String; ASchemaId:Real);
var
  AStream :TTextStream;
  ABuffer :String;
begin
  AStream:= TTextStream.Create(AFileName, tfmCreate);
  try
    with TFDQuery.Create(nil) do
    try
//      DataBaseName:= 'IQ';
      Connection := uniMainModule.FDConnection1;
      
      Sql.Add(IqFormat('select ID, SEQ, xslt_record, NVL(PARTIAL, ''N'') as PARTIAL from XML_SCHEMA_DTL ' +
                       ' where XML_SCHEMA_ID = %f order by seq', [ASchemaId]));
      Open;
      while not eof do
      begin
        ABuffer := FieldByName('xslt_record').asString;
        if FieldByName('PARTIAL').asString = 'Y' then
        begin
          if SelectValueFmtAsFloat('select id from XML_SCHEMA_DTL where XML_SCHEMA_ID = %f and seq = %d and NVL(PARTIAL, ''N'') = ''Y''',
                       [ASchemaId, FieldByName('SEQ').asInteger + 1]) <> 0 then
            AStream.Write(ABuffer)
          else
            AStream.WriteLn(ABuffer);
        end
        else
          AStream.WriteLn(ABuffer);
        next;
      end;
    finally
      Free;
    end;
  finally
    AStream.Free;
  end;
end;


procedure IqCopyFile(ASource, ATarget:String);
var
  ASourceStream :TStream;
  ATargetStream :TStream;
begin
  ASourceStream := TFileStream.Create(ASource, fmOpenRead);
  ATargetStream := TFileStream.Create(ATarget, fmCreate);
  try
    ATargetStream.CopyFrom( ASourceStream, 0 );
  finally
    ASourceStream.Free;
    ATargetStream.Free;
  end;

end;



end.
