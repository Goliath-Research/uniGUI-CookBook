unit IQMS.Common.ExtFileBas;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.Menus,
  IQMS.Common.StringUtils,
  Vcl.DBGrids,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  FireDAC.Comp.UI,
  FireDAC.Comp.DataMove,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniProgressBar, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  Data.DB, IQMS.WebVcl.Strings, uniMainMenu, Vcl.Controls, uniFileUpload;

type
  TFrmExtFileBas = class(TUniForm)
    s: TUniPanel;
    Panel2: TUniPanel;
    BtnProcess: TUniButton;
    BntCancel: TUniButton;
    ProgressBar1: TUniProgressBar;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel3: TUniPanel;
    Label1: TUniLabel;
    edFile: TUniEdit;
    sbPO: TUniSpeedButton;
    IQStrings1: TIQWebStrings;
    SrcTxt: TDataSource;
    TblTxtold: TFDTable;
    Panel4: TUniPanel;
    DBGrid1: TUniDBGrid;
    DBNavigator1: TUniDBNavigator;
    N1: TUniMenuItem;
    Abortprocessing1: TUniMenuItem;
    FDDataMove1: TFDDataMove;
    TblTxt: TFDMemTable;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    odFile: TUniFileUpload;
    procedure sbPOClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure BtnProcessClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Abortprocessing1Click(Sender: TObject);
    procedure odFileCompleted(Sender: TObject; AStream: TFileStream);
  protected
    FSchFile:String;
    FType:String;
    FValuesList:TStringList;
    FId:Real;
    FSchemaId:Real;
    FArcustoId:Real;
    FSeparator:Char;
    FDelimiter: Char;
    FHeader, FFileToProcess:String;
    procedure ProcessRecord; virtual;
    procedure AssignSchemaFile; virtual;
    procedure ProcessXMLFile; virtual;
    procedure ProcessTemplate(AINPUT_FILE_REC_ID:Real);virtual;
//    procedure ProcessXMLRecord(ARecordInputNode:TXpNode);
//    procedure ProcessNodeReleases(ARecordInputNode:TXpNode);
//    procedure InsertXMLReleaseRecord(AQty:Real; Adate:TdateTime; ADemandType, AUom:String);
  private
    { Private declarations }
    FPath:String;
    FFileName:String;
    FRecordCount:Integer;
    FAbort:Boolean;
//    FXMLCount:Integer;
    procedure ProcessFile;
    procedure ConnectToTbl;
    function  IsXLS(AFile:String):Boolean;
    procedure CreateTextFile(aFile:String);
  public
    { Public declarations }
    constructor Create(AOwner:TComponent); override;
    destructor  Destroy; override;
  end;

var
  FrmExtFileBas: TFrmExtFileBas;

implementation

uses
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs,
  IQMS.Common.DataLib,
  IQMS.Common.ResStrings,
  System.Win.ComObj;

{$R *.DFM}

constructor TFrmExtFileBas.Create(AOwner:TComponent);
begin
  inherited;
  IQRegFormRead( self, [ self ]);
  FValuesList := TStringList.Create;
end;

destructor TFrmExtFileBas.Destroy;
begin
  FValuesList.Free;
  inherited;
end;

procedure TFrmExtFileBas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmExtFileBas.sbPOClick(Sender: TObject);
begin
  with odFile do
  begin
    FileName := edFile.Text;
    Execute;
  end;
end;

procedure TFrmExtFileBas.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmExtFileBas.BtnProcessClick(Sender: TObject);
var
  ExcelApp  : OLEVariant;
  ATmpFile:String;
  ALine:String;
  I:Integer;
  AStringList:TStringList;
begin
  AssignSchemaFile;
//  if FType = 'XML' then
//    ProcessXMLFile
//  else if IsXLS(FFileName) then
  if IsXLS(FFileName) then
  begin
    ExcelApp:= CreateOleObject('Excel.Application');
    try
      ExcelApp.Workbooks.Open( FPath + FFileName );
      FFileName := StrTran(UpperCase(FFileName), '.XLSX', '.TXT');
      FFileName := StrTran(UpperCase(FFileName), '.XLS', '.TXT');
      DeleteFile(FPath + FFileName);
      DeleteFile(FPath + ATmpFile);
      ExcelApp.DisplayAlerts := 0;
      ATmpFile := 'tmp_' + FFileName;
      ExcelApp.ActiveWorkbook.SaveAs( FPath + ATmpFile, -4158, 0 );            // -4158 - text file   0 - no backup
    finally
      ExcelApp.Application.Quit;
    end;
    sleep(2000);
    AStringList := TStringList.Create;
    try
      AStringList.LoadFromFile(FPath + ATmpFile);
      for I := 0 to AStringList.Count - 1 do
      begin
        ALine := AStringList[I];
        ALine := '"' + ALine + '"';
        ALine := StrTran(ALine, #9, '","');
        AStringList[I] := ALine;
      end;
      AStringList.SaveToFile(FPath + FFileName);
    finally
      AStringList.Free;
    end;

    DeleteFile(FPath + ATmpFile);


    FFileToProcess := FPath + FFileName;
    ConnectToTbl;
    ProcessFile;
  end
  else if FType <> 'XML' then
  begin
    FFileToProcess := FPath + FFileName;
    ConnectToTbl;
    ProcessFile;
  end;
  DeleteFile(FSchFile);
end;

procedure TFrmExtFileBas.ProcessTemplate(AINPUT_FILE_REC_ID:Real);
begin
//
end;

procedure TFrmExtFileBas.AssignSchemaFile;
var
  AList:TStringList;
  I, aPos, J:Integer;
  aStr, aFieldName:String;
begin
  if not FileExists(edFile.Text) then
    raise exception.Create(Format(IQMS.Common.ResStrings.cTXT0000125 {'File %s not found'}, [edFile.Text]));

  FPath     := ExtractFilePath(edFile.Text);
  FFileName := ExtractFileName(edFile.Text);

  FSchFile := FPath + Copy(FFileName, 1, Pos('.', FFileName)) + 'sch';
  try
    AList := TStringList.Create;
//    AList2 := TStringList.Create;
    if FType <> 'XML' then
      Alist.Add(Format('[%s]', [UpperCase(Copy(FFileName, 1, Pos('.', FFileName) - 1))]));
    for I := 0 to IQStrings1.Items.Count - 1 do
      Alist.Add(IQStrings1.Items[I]);
    IQStrings1.Items.Clear;

    for I := 0 to Alist.Count - 1 do
      IQStrings1.Items.Add(Alist[I]);

    FHeader := '';
    for i:= 0 to IQStrings1.Items.Count - 1 do
    begin
      aStr := UpperCase(IQStrings1.Items[I]);
      if Copy(aStr, 1, 9) = 'DELIMITER' then
      begin
        aPos := Pos('= ', aStr);
        aStr := Trim(Copy(aStr, aPos + 1, Length(aStr)));
        FDelimiter := aStr[1];
      end;
      if Copy(aStr, 1, 9) = 'SEPARATOR' then
      begin
        aPos := Pos('= ', aStr);
        aStr := Trim(Copy(aStr, aPos + 1, Length(aStr)));
        FSeparator := aStr[1];
      end;
      if Copy(aStr, 1, 5) = 'FIELD' then
      begin
        aPos := Pos('= ', aStr);
        aStr := Copy(aStr, aPos + 1, Length(aStr));
        aPos := Pos(',', aStr);
        aFieldName := Trim(Copy(aStr, 1, aPos - 1));
        if i = IQStrings1.Items.Count - 1 then
          FHeader := FHeader + aFieldName
        else
          FHeader := FHeader + aFieldName + ',';
      end;
    end;

//    if not IsXLS(FFileName) then
//    begin

//      AList.Clear;
//      aList.LoadFromFile(edFile.Text);
//      AList2.Add(aHeader);
//      aList2.Add(aList.Text);
//      aList2.SaveToFile(FSchFile);
//    end;


    IQStrings1.Items.SaveToFile(FSchFile);
  finally
    AList.Free;
//    AList2.Free;
  end;


//  if not FileExists(edFile.Text) then
//    raise exception.Create(Format(IQMS.Common.ResStrings.cTXT0000125 {'File %s not found'}, [edFile.Text]));
//
//  FPath     := ExtractFilePath(edFile.Text);
//  FFileName := ExtractFileName(edFile.Text);
//
//  FSchFile := FPath + Copy(FFileName, 1, Pos('.', FFileName)) + 'sch';
//  try
//    AList := TStringList.Create;
//    if FType <> 'XML' then
//      Alist.Add(Format('[%s]', [UpperCase(Copy(FFileName, 1, Pos('.', FFileName) - 1))]));
//    for I := 0 to IQStrings1.Items.Count - 1 do
//      Alist.Add(IQStrings1.Items[I]);
//    IQStrings1.Items.Clear;
//
//    for I := 0 to Alist.Count - 1 do
//      IQStrings1.Items.Add(Alist[I]);
//
//
//    IQStrings1.Items.SaveToFile(FSchFile);
//  finally
//    AList.Free;
//  end;
end;

procedure TFrmExtFileBas.ConnectToTbl;
var
  I, aPos, J:Integer;
  aStr, aFileName:String;
  AList1, aList2:TStringList;
begin
  AList2 := TStringList.Create;
  AList1 := TStringList.Create;
  try
    AList1.LoadFromFile(FFileToProcess);
    AList2.Add(FHeader);
    aList2.Add(aList1.Text);
    aList2.SaveToFile(FSchFile);
  finally
    AList1.Free;
    AList2.Free;
  end;
  FDDataMove1.TextDataDef.Delimiter := FDelimiter;
  FDDataMove1.TextDataDef.Separator := FSeparator;
  TblTxt.Close;
  FDDataMove1.TextFileName := FSchFile;
  FDDataMove1.Execute;
  TblTxt.Open;
  While not TblTxt.eof do
  begin
    Inc(FRecordCount);
    TblTxt.Next;
  end;
  ProgressBar1.Max := FRecordCount;
//  Abort;

{

  with TblTxt do
  begin
    Connection := MainModule.FDConnection;
    TableName    := FFileName;
    Open;
    While not eof do
    begin
      Inc(FRecordCount);
      Next;
    end;
    ProgressBar1.Max := FRecordCount;
  end;
}
end;

procedure TFrmExtFileBas.ProcessFile;
var
  I:Integer;
begin
  I := 0;
  with TblTxt do
  try
    FAbort := False;
    DisableControls;
    First;
    While not eof do
    begin
      ProcessRecord;
      Inc(I);
      Panel4.Caption := Format('%d/%d', [I,FRecordCount]);
      ProgressBar1.Position:=ProgressBar1.Position+1;
      if FAbort then exit;
      Next;
    end;
  finally
    EnableControls;
  end;
end;

procedure TFrmExtFileBas.ProcessRecord;
begin
//
end;


procedure TFrmExtFileBas.Abortprocessing1Click(Sender: TObject);
begin
  if not IqConfirmYN( IQMS.Common.ResStrings.cTXT0000126 {'Abort processing?'} ) then exit;
  FAbort := True;
end;

procedure TFrmExtFileBas.ProcessXMLFile;
//var
//  ARecordInput:TXpNode;
//  ARootNodeName:String;
//  AList:TXpNodeList;
//  I:Integer;
begin
//  FXMLCount := 0;
//  try
//    ARootNodeName := XMLSchema.Document.DocumentElement.NodeName;   {ShipmentForecast}
//    AList := XMLInput.Document.GetElementsByTagName(ARootNodeName); {Get all ShipmentForecast elements in the input XML}
//    for I:= 0 to AList.Length - 1  do
//      ProcessXMLRecord(AList.Item(I));
//  finally
//    Panel4.Caption := '';
//  end;
end;
{
procedure TFrmExtFileBas.ProcessXMLRecord(ARecordInputNode:TXpNode);
var
  aSchemaNode:TXpNode;
  AFieldName:String;
  AValue:String;
  AXSL:String;
  AList:TXpNodeList;
begin
  FValuesList.Clear;
  with XMLSchema.Document do
    aSchemaNode:= GetElementsByTagName(DocumentElement.NodeName).Item(0).FirstChild;

  while (aSchemaNode <> nil) do
  begin
    AFieldName := aSchemaNode.NodeName;
    if UpperCase(AFieldName) <> 'QTY' then
    begin
      AXSL       := aSchemaNode.text;
      AValue     := TXpElement(ARecordInputNode).SelectString(AXSL);
      FValuesList.Add(Format('%s=''%s''', [AFieldName, AValue]));
    end;
    aSchemaNode:= aSchemaNode.NextSibling;
  end;

  ProcessNodeReleases(ARecordInputNode);

end;

procedure TFrmExtFileBas.ProcessNodeReleases(ARecordInputNode:TXpNode);
var
  aSchemaNode:TxpNode;
  aNode:TXpNode;
  AXSL:String;
  AList:TXpNodeList;
  I:Integer;
  AQty:Real;
  Adate:TDateTime;
  ADateAttributeName:String;
  ADemandTypeAtttributeName, ADemandType:String;
  AUOMAtttributeName, AUOM:String;
  ASkip:Integer;
  AFormat:String;
begin
  with XMLSchema.Document do
    aSchemaNode:= GetElementsByTagName('QTY').Item(0);

  If aSchemaNode = nil then Exit;

  AXSL                      := TXpElement(aSchemaNode).SelectString('XPath');
  ADateAttributeName        := TXpElement(aSchemaNode).SelectString('Request_Date/Attribute_Name');
  AFormat                   := TXpElement(aSchemaNode).SelectString('Request_Date/Format');
  ADemandTypeAtttributeName := TXpElement(aSchemaNode).SelectString('Demand_Type/Attribute_Name');
  AUOMAtttributeName        := TXpElement(aSchemaNode).SelectString('UOM/Attribute_Name');


{ Example:
     <Request_Date>
       <Attribute_Name>
         Date
       </Attribute_Name>
       <Format>
         select to_date(substr(%s, 1, 10), 'RRRR-MM-DD') from dual
       </Format>
     </Request_Date>
}

{
  AList := TXpElement(ARecordInputNode).SelectNodes(AXSL);

  for I := 0 to AList.Length - 1 do
  begin
    AQty  := StrToFloat(AList.Item(I).text);
    Adate := SelectValueFmtAsFloat(AFormat, [TXpElement(AList.Item(I)).GetAttribute(ADateAttributeName)]);
    ADemandType := TXpElement(AList.Item(I)).GetAttribute(ADemandTypeAtttributeName);
    AUom        := TXpElement(AList.Item(I)).GetAttribute(AUOMAtttributeName);
    InsertXMLReleaseRecord(AQty, Adate, ADemandType, AUom);
  end;
end;
}

//procedure TFrmExtFileBas.InsertXMLReleaseRecord(AQty:Real; Adate:TdateTime; ADemandType, AUom:String);
//var
//  Aid:Real;
//  I:Integer;
//begin
//  Inc(FXMLCount);
//  Panel4.Caption := Format(IQMS.Common.ResStrings.cTXT0000127 {'%d Records Appended'}, [FXMLCount]);
//  Application.ProcessMessages;
//
//  AId := GetNextID('INPUT_FILE_REC');
//
//  ExecuteCommandFmt('insert into INPUT_FILE_REC (id, input_file_id, arcusto_id) values (%f, %f, decode(%f, 0, null, %f))',
//            [AId, FId, FArcustoid, FArcustoid]);
//
//  ExecuteCommandFmt('update INPUT_FILE_REC set qty = %f, request_date = To_Date(''%s'', ''MM/DD/RRRR''), cuser1 = ''%s'', cuser2 = ''%s'' where id = %f',
//            [AQty,
//             FormatDateTime('mm/dd/yyyy', ADate),
//             ADemandType,
//             AUom,
//             AId]);
//
//  for I := 0 to FValuesList.Count - 1 do
//    ExecuteCommandFmt('update INPUT_FILE_REC set %s where id = %f', [FValuesList[I],  AId]);
//
//
//  ProcessTemplate(AID);
//end;

function TFrmExtFileBas.IsXLS(AFile:String):Boolean;
var
  AExt:String;
begin
  AExt := UpperCase(ExtractFileExt(AFile));
  Result := (AExt = '.XLS') or ((AExt = '.XLSX') )
end;


procedure TFrmExtFileBas.odFileCompleted(Sender: TObject; AStream: TFileStream);
begin
  edFile.Text := AStream.FileName;
end;

procedure TFrmExtFileBas.CreateTextFile(aFile:String);
var
  MyFile:TextFile;
begin
  AssignFile(MyFile, aFile);
  Rewrite(MyFile);
  CloseFile(MyFile);
end;


end.
