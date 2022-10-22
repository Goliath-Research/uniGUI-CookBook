unit crm_dbtrans_errors;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  SHDocVw,
  Vcl.Buttons,
  Xml.XMLIntf,
  Xml.Win.msxmldom,
  Xml.XMLDoc,
  Xml.xmldom,
  Vcl.Graphics,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniBasicGrid,
  uniStringGrid,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniPageControl, uniImage, Vcl.StdCtrls, Vcl.ComCtrls, uniMemo, uniHTMLMemo;

type
  { TXMLErrorRecord }
  TErrorFileInformation = packed record
    FileName: string; // log file or XML file
    TableName: string; // table name, if applicable
    ErrorCount: Integer;
    // how many records were skipped; should equal record count in file, if XML.
    ImportedCount: Integer; // how many records were successfully imported
  end;

  { TFrmCRMDBTransErrors }
  TFrmCRMDBTransErrors = class(TUniForm)
    PnlPrompt: TUniPanel;
    PnlDisplay: TUniPanel;
    pcMain: TUniPageControl;
    TabMaster: TUniTabSheet;
    TabChild: TUniTabSheet;
    TabLog: TUniTabSheet;
    PnlErrorsToolbar: TUniPanel;
    PnlMasterToolbar: TUniPanel;
    PnlChildToolbar: TUniPanel;
    PnlErrors: TUniPanel;
    PnlMaster: TUniPanel;
    sbtnSaveAsErrors: TUniSpeedButton;
    sbtnOpenErrorsDir: TUniSpeedButton;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    PnlImage: TUniPanel;
    Image1: TUniImage;
    XMLDocument: TXMLDocument;
    PnlMasterGrid: TUniPanel;
    gridMaster: TUniStringGrid;
    PnlChild: TUniPanel;
    PnlChildGrid: TUniPanel;
    gridChild: TUniStringGrid;
    PnlMasterStdCtrls: TUniPanel;
    sbtnSaveAsMaster: TUniSpeedButton;
    sbtnOpenLocationMaster: TUniSpeedButton;
    sbtnOpenInternetMaster: TUniSpeedButton;
    PnlChildStdCtrls: TUniPanel;
    sbtnSaveAsChild: TUniSpeedButton;
    sbtnOpenLocationChild: TUniSpeedButton;
    sbtnOpenInternetChild: TUniSpeedButton;
    PnlMSAppsChild: TUniPanel;
    Bevel1: TUniPanel;
    sbtnExcelChild: TUniSpeedButton;
    PnlMSAppsMaster: TUniPanel;
    sbtnExcelMaster: TUniSpeedButton;
    Bevel2: TUniPanel;
    rtfErrorLog: TUniMemo;
    rtfPrompt: TUniHTMLMemo;
    procedure sbtnSaveAsErrorsClick(Sender: TObject);
    procedure sbtnSaveAsMasterClick(Sender: TObject);
    procedure sbtnSaveAsChildClick(Sender: TObject);
    procedure sbtnOpenErrorsDirClick(Sender: TObject);
    procedure sbtnOpenLocationMasterClick(Sender: TObject);
    procedure sbtnOpenLocationChildClick(Sender: TObject);
    procedure sbtnOpenInternetMasterClick(Sender: TObject);
    procedure sbtnOpenInternetChildClick(Sender: TObject);
    procedure sbtnExcelMasterClick(Sender: TObject);
    procedure sbtnExcelChildClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    private
      { Private declarations }
      FTotalSourceRecords: Integer;
      FErrorLogInfo: TErrorFileInformation;
      FMasterInfo: TErrorFileInformation;
      FChildInfo: TErrorFileInformation;
      FBothMasterAndChild: Boolean;
      procedure LoadXMLDocument(const AFileName, ATableName: string;
        AGrid: TUniStringGrid);
      procedure UpdatePrompt;
      function GetSaveAsFile(const ACurrentFileName: string;
        var ANewFileName: string): Boolean;
      procedure SetFErrorLogInfo(const Value: TErrorFileInformation);
      procedure SetAMasterInfo(const Value: TErrorFileInformation);
      procedure SetAChildInfo(const Value: TErrorFileInformation);
    public
      { Public declarations }
      property rTotalSourceRecords : Integer read FTotalSourceRecords write FTotalSourceRecords;
      property rBothMasterAndChild : Boolean read FBothMasterAndChild write FBothMasterAndChild;
      property rErrorLogInfo : TErrorFileInformation read FErrorLogInfo write SetFErrorLogInfo;
      property rMasterInfo : TErrorFileInformation read FMasterInfo write SetAMasterInfo;
      property rChildInfo : TErrorFileInformation read FChildInfo write SetAChildInfo;
//      constructor Create(ATotalSourceRecords: Integer;
//        AErrorLogInfo: TErrorFileInformation;
//        AMasterInfo: TErrorFileInformation; AChildInfo: TErrorFileInformation;
//        ABothMasterAndChild: Boolean);
  end;

function PromptWithLogFiles(ATotalSourceRecords: Integer;
  AErrorLogInfo: TErrorFileInformation; AMasterInfo: TErrorFileInformation;
  AChildInfo: TErrorFileInformation; ABothMasterAndChild: Boolean): Boolean;

procedure ClearErrorRec(var ARec: TErrorFileInformation);
procedure CopyErrorRec(const ASource: TErrorFileInformation;
  var ATarget: TErrorFileInformation);

implementation

{$R *.dfm}

uses
  crm_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils;

function PromptWithLogFiles( ATotalSourceRecords: Integer;
  AErrorLogInfo: TErrorFileInformation; AMasterInfo: TErrorFileInformation;
  AChildInfo: TErrorFileInformation; ABothMasterAndChild: Boolean): Boolean;
begin
  with TFrmCRMDBTransErrors.Create(uniGUIApplication.UniApplication) do
    begin
      rTotalSourceRecords := ATotalSourceRecords;
      rBothMasterAndChild := ABothMasterAndChild;
      rErrorLogInfo := AErrorLogInfo;
      rMasterInfo := AMasterInfo;
      rChildInfo := AChildInfo;
      Result := ShowModal = mrOk;
    end;
end;

procedure ClearErrorRec(var ARec: TErrorFileInformation);
begin
  ARec.FileName := '';
  ARec.TableName := '';
  ARec.ErrorCount := 0;
  ARec.ImportedCount := 0;
end;

procedure CopyErrorRec(const ASource: TErrorFileInformation;
  var ATarget: TErrorFileInformation);
begin
  ATarget.FileName := ASource.FileName;
  ATarget.TableName := ASource.TableName;
  ATarget.ErrorCount := ASource.ErrorCount;
  ATarget.ImportedCount := ASource.ImportedCount;
end;

{ TFrmCRMDBTransErrors }


procedure TFrmCRMDBTransErrors.UniFormCreate(Sender: TObject);
begin
  pcMain.ActivePageIndex := 0;
end;

procedure TFrmCRMDBTransErrors.UniFormShow(Sender: TObject);
begin
  UpdatePrompt;
end;

procedure TFrmCRMDBTransErrors.UpdatePrompt;
var
  AImported: Integer;
  sl: TStringList;
  AAborted: Boolean;
begin
  AImported := FMasterInfo.ImportedCount + FChildInfo.ImportedCount;
  AAborted := (FMasterInfo.ImportedCount = FMasterInfo.ErrorCount) and
    (FChildInfo.ImportedCount = FChildInfo.ErrorCount) and (AImported = 0);

  try
    sl := TStringList.Create;
    rtfPrompt.Lines.Clear;

    // crm_rscstr.cTXT0001692 = '%d source records processed.'
    sl.Add(Format(crm_rscstr.cTXT0001692, [FTotalSourceRecords]));

    if FErrorLogInfo.ErrorCount > 0 then
      // 'Encountered %d error(s).'
      sl.Add(Format(crm_rscstr.cTXT0001693, [FErrorLogInfo.ErrorCount]));
    if not AAborted then
      begin
        if FBothMasterAndChild and ((FMasterInfo.ImportedCount > 0) or
          (FChildInfo.ImportedCount > 0)) then
          // '%d master record(s) and %d child record(s) were successfully imported.'
          sl.Add(Format(crm_rscstr.cTXT0001694, [FMasterInfo.ImportedCount,
            FChildInfo.ImportedCount]))
        else if (FMasterInfo.ImportedCount > 0) then
          { crm_rscstr.cTXT0001783 = '%d record(s) were successfully imported.'; }
          sl.Add(Format(crm_rscstr.cTXT0001783, [FMasterInfo.ImportedCount]));

        if FBothMasterAndChild and (FMasterInfo.ErrorCount > 0) and
          (FChildInfo.ErrorCount > 0) then
          { crm_rscstr.cTXT0001695 =
            '%d master record(s) and %d child record(s) could not be
            imported.' }
          sl.Add(Format(crm_rscstr.cTXT0001695, [FMasterInfo.ErrorCount,
            FChildInfo.ErrorCount]))
        else if (FMasterInfo.ErrorCount > 0) then
          { crm_rscstr.cTXT0001781 = '%d master record(s) could not be imported.' }
          sl.Add(Format(crm_rscstr.cTXT0001781, [FMasterInfo.ErrorCount]))
        else if (FChildInfo.ErrorCount > 0) then
          { crm_rscstr.cTXT0001782 = '%d child record(s) could not be imported.' }
          sl.Add(Format(crm_rscstr.cTXT0001782, [FChildInfo.ErrorCount]));
      end;

    PnlButtons.Visible := (AImported > 0);

    if not AAborted and (AImported > 0) then
      // 'Do you want to import %d record(s)?'
      sl.Add(Format(crm_rscstr.cTXT0001696, [AImported]))
    else
      { crm_rscstr.cTXT0001697 =
        'No records were imported.  The import operation will be aborted.' }
      sl.Add(crm_rscstr.cTXT0001697);

    // Apply the caption
    rtfPrompt.Lines.Text := IQMS.Common.StringUtils.StrTran(sl.Text, #13#10, '  ');

  finally
    if Assigned(sl) then
      FreeAndNil(sl);
  end;

end;

procedure TFrmCRMDBTransErrors.sbtnSaveAsErrorsClick(Sender: TObject);
var
  ANewFileName: string;
begin
  if GetSaveAsFile(FErrorLogInfo.FileName, ANewFileName) then
    begin
      FErrorLogInfo.FileName := ANewFileName;
      rtfErrorLog.Lines.LoadFromFile(ANewFileName);
    end;
end;

procedure TFrmCRMDBTransErrors.sbtnSaveAsMasterClick(Sender: TObject);
var
  ANewFileName: string;
begin
  if GetSaveAsFile(FMasterInfo.FileName, ANewFileName) then
    begin
      FMasterInfo.FileName := ANewFileName;
    end;
end;

procedure TFrmCRMDBTransErrors.SetAChildInfo(const Value: TErrorFileInformation);
begin
  CopyErrorRec(value, FChildInfo);
  TabChild.TabVisible := FileExists(FChildInfo.FileName) and
    (FChildInfo.ErrorCount > 0);
  if TabChild.TabVisible then
    begin
      LoadXMLDocument(FChildInfo.FileName, FChildInfo.TableName, gridChild);
      // 'Child Records Skipped (%d)'
      TabChild.Caption := Format(crm_rscstr.cTXT0001691,
        [FChildInfo.ErrorCount]);
    end;
end;

procedure TFrmCRMDBTransErrors.SetAMasterInfo(const Value: TErrorFileInformation);
begin
  CopyErrorRec(value, FMasterInfo);
  TabMaster.TabVisible := FileExists(FMasterInfo.FileName) and
    (FMasterInfo.ErrorCount > 0);
  if TabMaster.TabVisible then
    begin
      LoadXMLDocument(FMasterInfo.FileName, FMasterInfo.TableName, gridMaster);
      // 'Master Records Skipped (%d)'
      TabMaster.Caption := Format(crm_rscstr.cTXT0001690,
        [FMasterInfo.ErrorCount]);
    end;
end;

procedure TFrmCRMDBTransErrors.SetFErrorLogInfo(const Value: TErrorFileInformation);
begin
  CopyErrorRec(Value, FErrorLogInfo);
  TabLog.TabVisible := FileExists(FErrorLogInfo.FileName) and
    (FErrorLogInfo.ErrorCount > 0);
  if TabLog.TabVisible then
    begin
      rtfErrorLog.Lines.LoadFromFile(FErrorLogInfo.FileName);
      // 'Errors (%d)'
      TabLog.Caption := Format(crm_rscstr.cTXT0001689,
        [FErrorLogInfo.ErrorCount]);
    end;
end;

procedure TFrmCRMDBTransErrors.sbtnSaveAsChildClick(Sender: TObject);
var
  ANewFileName: string;
begin
  if GetSaveAsFile(FChildInfo.FileName, ANewFileName) then
    begin
      FChildInfo.FileName := ANewFileName;
    end;
end;

function TFrmCRMDBTransErrors.GetSaveAsFile(const ACurrentFileName: string;
  var ANewFileName: string): Boolean;
var
  AExt: string;
begin
  AExt := ExtractFileExt(ACurrentFileName);
  UniSession.SendFile(ACurrentFileName,ANewFileName);
  result:=true;
end;

procedure TFrmCRMDBTransErrors.sbtnOpenErrorsDirClick(Sender: TObject);
begin
  IQMS.Common.Miscellaneous.ExecuteProgramW(ExtractFilePath(FErrorLogInfo.FileName));
end;

procedure TFrmCRMDBTransErrors.sbtnOpenLocationMasterClick(Sender: TObject);
begin
  IQMS.Common.Miscellaneous.ExecuteProgramW(ExtractFilePath(FMasterInfo.FileName));
end;

procedure TFrmCRMDBTransErrors.sbtnOpenLocationChildClick(Sender: TObject);
begin
  IQMS.Common.Miscellaneous.ExecuteProgramW(ExtractFilePath(FChildInfo.FileName));
end;

procedure TFrmCRMDBTransErrors.sbtnOpenInternetMasterClick(Sender: TObject);
begin
  IQMS.Common.Miscellaneous.ExecuteProgramW(FMasterInfo.FileName);
end;

procedure TFrmCRMDBTransErrors.sbtnOpenInternetChildClick(Sender: TObject);
begin
  IQMS.Common.Miscellaneous.ExecuteProgramW(FChildInfo.FileName);
end;

procedure TFrmCRMDBTransErrors.LoadXMLDocument(const AFileName,
  ATableName: string; AGrid: TUniStringGrid);

  function _ColumnIndex(const AFieldName: string): Integer;
  var
    i: Integer;
  begin
    Result := - 1;
    for i := 0 to AGrid.ColCount - 1 do
      if AGrid.Cells[i, 0] = AFieldName then
        begin
          Result := i;
          Break;
        end;
  end;

  procedure _AddColumnValue(const AFieldName, AValue: string;
    const ANewRow: Boolean);
  var
    col, row: Integer;
  begin
    col := _ColumnIndex(AFieldName);
    if col = - 1 then
      begin
        if (AGrid.ColCount = 1) and (AGrid.Cells[0, 0] = '') then
          col := 0
        else
          begin
            AGrid.ColCount := AGrid.ColCount + 1;
            col := AGrid.ColCount - 1;
          end;
        if AGrid.RowCount < 1 then
          AGrid.RowCount := 1;
        AGrid.Cells[col, 0] := AFieldName;
      end;

    row := AGrid.RowCount - 1;

    if ANewRow then
      begin
        Inc(row);
        AGrid.RowCount := row + 1;
      end;

    AGrid.Cells[col, row] := IQMS.Common.Numbers.sIIf(AValue = 'NULL', '', AValue);

  end;

  procedure _LoadDOM(AXMLNode: IXMLNode);
  var
    i: Integer;
    NewTreeNode: TUniTreeNode;
    NodeText: string;
    AttrNode: IXMLNode;
  begin
    // skip text nodes and other special cases
    if AXMLNode.NodeType <> ntElement then
      Exit;
    // add the node itself
    NodeText := AXMLNode.NodeName;
    if AXMLNode.IsTextElement then
      NodeText := NodeText + ' = ' + AXMLNode.NodeValue;
    // add each child node
    if AXMLNode.HasChildNodes and (NodeText = ATableName) then
      for i := 0 to AXMLNode.ChildNodes.Count - 1 do
        _AddColumnValue(AXMLNode.ChildNodes.Nodes[i].NodeName,
          AXMLNode.ChildNodes.Nodes[i].NodeValue, i = 0);
    // recurse
    if AXMLNode.HasChildNodes then
      for i := 0 to AXMLNode.ChildNodes.Count - 1 do
        _LoadDOM(AXMLNode.ChildNodes.Nodes[i]);
  end;

begin
  if not FileExists(AFileName) or not Assigned(AGrid) then
    Exit;

  try
    AGrid.DisableAlign;
    AGrid.ColCount := 0;
    AGrid.RowCount := 0;
//    AGrid.Options.goFixedVertLine := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine,
//      goRangeSelect, goColSizing];
    XMLDocument.LoadFromFile(AFileName);
    _LoadDOM(XMLDocument.DocumentElement);
    if AGrid.RowCount >= 2 then
      AGrid.FixedRows := 1;
  finally
    AGrid.EnableAlign;
  end;
//  IQMS.Common.Controls.FitGridColumnsToText(AGrid);
end;

procedure TFrmCRMDBTransErrors.sbtnExcelMasterClick(Sender: TObject);
begin
  IQMS.Common.Miscellaneous.ExecuteProgramW('EXCEL', SW_SHOWDEFAULT,
    PWideChar(FMasterInfo.FileName));
end;

procedure TFrmCRMDBTransErrors.sbtnExcelChildClick(Sender: TObject);
begin
  IQMS.Common.Miscellaneous.ExecuteProgramW('EXCEL', SW_SHOWDEFAULT,
    PWideChar(FChildInfo.FileName));
end;

end.
