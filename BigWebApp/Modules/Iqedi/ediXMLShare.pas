unit ediXMLShare;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  FireDAC.Comp.Client,
  FireDAC.Phys;

var
  FUseSingleQuote:Boolean;
  FEdiEditHdrId:Real;
  FEdiXmlHdrId:Real;
  FTRANSACTION_SET_UNIQUE_ID:String;
  FEdi:TextFile;
  FLoop:Boolean;
  FDetail:Boolean;
  FLoopCounter:Integer;
  FLoops:Integer;
  FDetails:Integer;
  FDetailCounter:Integer;

function  CreateXMLfile(AEdiEditId:Real; AConfirm:Boolean):Boolean;
procedure WriteXMLFile(ASql:String);
procedure ProcessXMLRecord(AQry:TFDQuery);
procedure ProcessLoop(AQry:TFDQuery);
procedure ProcessDetails(AQry:TFDQuery);
function  GetAttributesStr(AId:Real):String;
function  GetSegmentValue(Asegment_tokens_id:Real):String;
function  GetNumberofDetails(AId:Real):Integer;


implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  edi_rscstr,
  IQMS.Common.DataConst;

function CreateXMLfile(AEdiEditId:Real; AConfirm:Boolean):Boolean;
var
  ADir:string;
  AFile:String;
begin
  Result := True;
  FEdiEditHdrId := AEdiEditId;
  FTRANSACTION_SET_UNIQUE_ID := SelectValueFmtAsString('select TRANSACTION_SET_UNIQUE_ID from EDI_EDIT_HDR where id = %f', [FEdiEditHdrId]);
  FEdiXmlHdrId := SelectValueFmtAsFloat('select id from edi_xml_hdr where TRANSACTION_SET_UNIQUE_ID = ''%s''', [FTRANSACTION_SET_UNIQUE_ID]);
  FUseSingleQuote := SelectValueFmtAsString('select NVL(use_single_quote, ''N'') from edi_xml_hdr where id = %f', [FEdiXmlHdrId]) = 'Y';
  if FEdiXmlHdrId = 0 then
    raise exception.create(edi_rscstr.cTXT0000281{'No XML template assigned'});

  if AConfirm then
    if not IqConfirmYN(edi_rscstr.cTXT0000282{'Do you want to create an XML file?'}) then
    begin
      Result := false;
      Exit;
    end;

  AFile := SelectValueFmtAsString('select edi_file from EDI_EDIT_HDR where id = %f', [FEdiEditHdrId]);

  if Pos('.', AFile) = 0 then
    AFile := AFile + '.xml'
  else
    AFile := Copy(AFile, 1, Pos('.', AFile)) + 'xml';

  try
    AssignFile(FEdi, AFile);
    ReWrite(FEdi);
    if FUseSingleQuote then
      WriteLn(FEdi, StrTran(SelectValueFmtAsString('select header_tag from edi_xml_hdr where id = %f', [FEdiXmlHdrId]), '"',''''))
    else
      WriteLn(FEdi, SelectValueFmtAsString('select header_tag from edi_xml_hdr where id = %f', [FEdiXmlHdrId]));
    WriteXMLFile(IqFormat('select * from edi_xml_template where parent_id is null and edi_xml_hdr_id = %f order by seq', [FEdiXmlHdrId]));
  finally
    CloseFile(FEdi);
  end;

  if AConfirm then
    IqConfirm(Format(edi_rscstr.cTXT0000283{'XML file, %s, created.'}, [AFile]));

end;

procedure WriteXMLFile(ASql:String);
var
  AQry:TFDQuery;
begin
  AQry := TFDQuery.Create(nil);
  with AQry do
  try
    ConnectionName := cnstFDConnectionName; // IQMS.Common.DataConst;
    Sql.Add(ASql);
    open;
    while not eof do
    begin
      if FieldByName('loop').asString = 'Y' then
        ProcessLoop(AQry)
      else if FieldByName('detail').asString = 'Y' then
        ProcessDetails(AQry)
      else
        ProcessXMLRecord(AQry);
      next;
    end;
  finally
    Free;
  end;
end;

procedure ProcessXMLRecord(AQry:TFDQuery);
var
  AStr, AAttrStr:String;
  AValue:String;
begin
  with AQry do
  begin
    AStr := '<' + FieldByName('tag').asString;
    AAttrStr := GetAttributesStr(FieldByName('id').asFloat);
    if AAttrStr <> '' then
      AStr := AStr + AAttrStr;
    AStr := AStr + '>';
    AValue := GetSegmentValue(FieldByName('segment_tokens_id').asFloat);
    if AValue <> '' then
      AStr := AStr + AValue;

    if AAttrStr <> '' then
      WriteLn(FEdi, AStr)
    else
      Write(FEdi, AStr);

    WriteXMLFile(IqFormat('select * from edi_xml_template where parent_id = %f and edi_xml_hdr_id = %f ' +
                          ' and NVL(tag_attribute, ''N'') = ''N'' order by seq',
               [FieldByName('id').asFloat, FEdiXmlHdrId]));
    AStr := Format('</%s>', [FieldByName('tag').asString]);
    WriteLn(FEdi, AStr);
  end;
end;

procedure ProcessLoop(AQry:TFDQuery);
var
  AValue:String;
  I:Integer;
  AStr:String;
  AIterations:Integer;
begin
  FLoop := True;
  FLoopCounter := 0;
  with AQry do
  begin
    AStr := '<' + FieldByName('tag').asString;
    FLoops := GetNumberofDetails(FieldByName('id').asFloat);
    if FDetail then
      AIterations := Trunc(FLoops/FDetails)
    else
      AIterations := FLoops;
    for I := 1 to AIterations do
    begin
      FLoopCounter := I;
      ProcessXMLRecord(AQry);
    end;
  end;
  FLoopCounter := 0;
  FLoop := False;
end;

procedure ProcessDetails(AQry:TFDQuery);
var
  AValue:String;
  I:Integer;
  AStr:String;
begin
  FDetail := True;
  FDetailCounter := 0;
  with AQry do
  begin
    FDetails := GetNumberofDetails(FieldByName('id').asFloat);
    for I := 1 to FDetails do
    begin
      FDetailCounter := I;
      if FieldByName('loop').asString = 'Y' then
        ProcessLoop(AQry)
      else
        ProcessXMLRecord(AQry);
    end;
  end;
  FDetailCounter := 0;
  FDetail := False;
end;

function GetAttributesStr(AId:Real):String;
var
  AQry:TFDQuery;
  AValue:String;
begin
  Result := '';
  AQry := TFDQuery.Create(nil);
  with AQry do
  try
    ConnectionName := cnstFDConnectionName; // IQMS.Common.DataConst;
    Sql.Add(IqFormat('select * from edi_xml_template where NVL(tag_attribute, ''N'') = ''Y'' ' +
                     ' and edi_xml_hdr_id = %f and parent_id = %f order by seq',
                     [FEdiXmlHdrId, AId]));
    open;
    while not eof do
    begin
      AValue := GetSegmentValue(FieldByName('segment_tokens_id').asFloat);
      if FUseSingleQuote then
        Result := Format('%s %s=''%s''', [Result, FieldByName('tag').asString, AValue])
      else
        Result := Format('%s %s="%s"', [Result, FieldByName('tag').asString, AValue]);
      next;
    end;
  finally
    Free;
  end;
end;

function GetSegmentValue(Asegment_tokens_id:Real):String;
var
  Amaster_segments_id:Real;
  Atoken_code:String;
  AQry:TFDQuery;
  I, J:Integer;
begin
  Result := '';
  Amaster_segments_id := SelectValueFmtAsFloat('select master_segments_id from segment_tokens where id = %f', [Asegment_tokens_id]);
  Atoken_code         := SelectValueFmtAsString('select token_code from segment_tokens where id = %f', [Asegment_tokens_id]);
  AQry := TFDQuery.Create(nil);
  with AQry do
  try
    ConnectionName := cnstFDConnectionName; // IQMS.Common.DataConst;
    Sql.Add(IqFormat('select t.token_value               ' +
                         '   from edi_edit_dtl_tokens t,      ' +
                         '        edi_edit_dtl e,             ' +
                         '        edi_edit_hdr h              ' +
                         '  where t.edi_edit_dtl_id = e.id    ' +
                         '    and e.edi_edit_hdr_id = h.id    ' +
                         '    and h.id = %f                    ' +
                         '    and e.master_segments_id = %f    ' +
                         '    and t.token_code = ''%s'' order by t.id',
                         [FEdiEditHdrId, Amaster_segments_id, Atoken_code]));
    open;

    if eof and bof then
      Exit;
    if FLoop and FDetail then
    begin
      for j := 1 to FDetailCounter - 1 do
      begin
        for I := 1 to Trunc(FLoops/FDetails) do
         next;
      end;
      for I := 1 to FLoopCounter - 1 do
       next;
    end;
    if FLoop and (not FDetail) then
    begin
      for I := 1 to FLoopCounter - 1 do
       next;
    end;
    if (not FLoop) and FDetail then
    begin
      for I := 1 to FDetailCounter - 1 do
       next;
    end;
    Result := Trim(FieldByName('token_value').asString);
  finally
    free;
  end;
end;

function GetNumberofDetails(AId:Real):Integer;
var
  Atoken_code:String;
  ASegment_tokens_id:Real;
  Amaster_segments_id:Real;
begin
  ASegment_tokens_id := SelectValueFmtAsFloat('select segment_tokens_id ' +
                                  ' from edi_xml_template where edi_xml_hdr_id = %f and parent_id = %f ' +
                                  ' and segment_tokens_id is not null',
                                  [FEdiXmlHdrId, AId]);

  Amaster_segments_id := SelectValueFmtAsFloat('select master_segments_id from segment_tokens where id = %f', [Asegment_tokens_id]);
  Atoken_code         := SelectValueFmtAsString('select token_code from segment_tokens where id = %f', [Asegment_tokens_id]);


  Result := Trunc(SelectValueFmtAsFloat('select count(t.id)               ' +
                         '   from edi_edit_dtl_tokens t,      ' +
                         '        edi_edit_dtl e,             ' +
                         '        edi_edit_hdr h              ' +
                         '  where t.edi_edit_dtl_id = e.id    ' +
                         '    and e.edi_edit_hdr_id = h.id    ' +
                         '    and h.id = %f                    ' +
                         '    and e.master_segments_id = %f    ' +
                         '    and t.token_code = ''%s'' ',
                         [FEdiEditHdrId, Amaster_segments_id, Atoken_code]));

end;


end.

