unit PRPrintC;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Menus,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.About,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniBasicGrid,
  uniStringGrid,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel, IQUniGrid, uniGUIFrame;

type
  TFrmPRPrintCh = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    Label1: TUniLabel;
    Panel2: TUniPanel;
    BtnPrint: TUniButton;
    BtnCancel: TUniButton;
    EditCheckNo: TUniEdit;
    Panel3: TUniPanel;
    Panel6: TUniPanel;
    Splitter1: TUniSplitter;
    Panel4: TUniPanel;
    BtnAppend: TUniButton;
    BtnAppendAll: TUniButton;
    BtnDeleteAll: TUniButton;
    BtnDelete: TUniButton;
    Panel5: TUniPanel;
    Panel7: TUniPanel;
    GridToPrint: TUniStringGrid;
    gridChecks: TIQUniGridControl;
    srcPRChecks: TDataSource;
    qryPrChecks: TFDQuery;
    qryPrChecksPR_PREPOST_EMPLOYEE_ID: TBCDField;
    qryPrChecksPR_EMP_ID: TBCDField;
    qryPrChecksCHECK_NO: TBCDField;
    qryPrChecksCHECK_AMOUNT: TFMTBCDField;
    qryPrChecksEMPNO: TStringField;
    qryPrChecksFIRST_NAME: TStringField;
    qryPrChecksLAST_NAME: TStringField;
    qryPrChecksMIDDLE_NAME: TStringField;
    qryPrChecksSSNMBR: TStringField;
    qryPrChecksADDR1: TStringField;
    qryPrChecksADDR2: TStringField;
    qryPrChecksSTATE: TStringField;
    qryPrChecksZIP: TStringField;
    qryPrChecksCOUNTRY: TStringField;
    qryPrChecksPHONE_NUMBER: TStringField;
    qryPrChecksNAME: TStringField;
    IQRepDef1: TIQWebRepDef;
    IQAbout1: TIQWebAbout;
    procVoidCheck: TFDStoredProc;
    SR: TIQWebSecurityRegister;
    sbDD: TUniSpeedButton;
    sbCheck: TUniSpeedButton;
    Options1: TUniMenuItem;
    ChecksForm1: TUniMenuItem;
    DirectdepositForm1: TUniMenuItem;
    PopupMenu1: TUniPopupMenu;
    SortbyEmp1: TUniMenuItem;
    SortbyFirstName1: TUniMenuItem;
    SortbyLastName1: TUniMenuItem;
    SortbyDepartment1: TUniMenuItem;
    qryPrChecksDEPARTMENT: TStringField;
    Contents1: TUniMenuItem;
    SortbyDepartmentEmp1: TUniMenuItem;
    N1: TUniMenuItem;
    Reverseprintingorder1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelClick(Sender: TObject);
    procedure EditCheckNoChange(Sender: TObject);
    procedure GridToPrintDragDrop(Sender, Source: TObject; X, Y: Integer);

    procedure AssignRecordToStringGrid(Sender: TObject);
    procedure gridChecksMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GridToPrintDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure GridToPrintMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure gridChecksDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure gridChecksDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnAppendAllClick(Sender: TObject);
    procedure BtnDeleteAllClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure sbDDClick(Sender: TObject);
    procedure sbCheckClick(Sender: TObject);
    procedure ChecksForm1Click(Sender: TObject);
    procedure DirectdepositForm1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SortbyEmp1Click(Sender: TObject);
    procedure SortbyFirstName1Click(Sender: TObject);
    procedure SortbyLastName1Click(Sender: TObject);
    procedure SortbyDepartment1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure SortbyDepartmentEmp1Click(Sender: TObject);
    procedure Reverseprintingorder1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    APrePostIds:String;
    FSql:String;
    FOrderByStr:String;
    procedure InitializeStringGrid;
    function  LocatePrePostId(nPrePostId:Real):Boolean;
    procedure AssignCell(Str1, Str2, Str3:string);
    procedure ReAssignCells(i:Integer);
    procedure DeleteAllRows;
    procedure DeleteRow;
    procedure AssignCheckNumbers;
//    procedure SetCriteriaExpression( List:TStringList; cIds:String );
    procedure SetCriteriaExpression( List, AMasterList:TStringList; ABatch, AStart:Integer );

    procedure CreateMasterList(List:TStringList; cIds:string);

    function  GetReportName:String;
    procedure PostVoidCheck(AID:Real);
    function  StrToNumber(AStr:String):String;
    procedure ResetQuery;
    procedure SetIDs(const Value: String);
    procedure SetBankInfoDtlId(const Value: Real);
    procedure SetReport(const Value: String);
    procedure SetReportDD(const Value: String);
  public
    { Public declarations }
    FIDS:String;
    FBankInfoDtlId :Real;
    FReport:String;
    FReportDD:String;
    property IDs : String read FIDs write SetIDs;
    property BankInfoDtlId: Real read FBankInfoDtlId write SetBankInfoDtlId;
    property Report: String read FReport write SetReport;
    property ReportDD: String read FReportDD write SetReportDD;
  end;

procedure PrintPRChecks(AIDs:String; ABankInfoDtlId:Real; AReport, AReportDD:String);


implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Print,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Dialogs,
  { TODO -oathite -cWebConvert : Dependent on IQSecIns
  IQSecIns, }
  IQMS.Common.HelpHook,
  IQMS.Common.NLS;
{$R *.DFM}

procedure PrintPRChecks(AIDs:String; ABankInfoDtlId:Real; AReport, AReportDD:String);
var
  LFrmPRPrintCh : TFrmPRPrintCh;
begin
  LFrmPRPrintCh := TFrmPRPrintCh.Create( uniGUIApplication.UniApplication);
  with LFrmPRPrintCh do
  begin
    IDs := AIDs;
    BankInfoDtlId := ABankInfoDtlId;
    Report := AReport;
    ReportDD :=  AReportDD;
    ShowModal;
  end;
end;

procedure TFrmPRPrintCh.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DeleteAllRows;
  IQRegFormWrite( self, [ self, GridChecks, GridToPrint, Panel3 ]);
end;

procedure TFrmPRPrintCh.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPRPrintCh.EditCheckNoChange(Sender: TObject);
var
  nInt:Integer;
begin
  try
    nInt := StrToInt(EditCheckNo.Text);
  except
    raise Exception.Create(Format('%s is not a valid check#', [EditCheckNo.Text]))
  end;
end;

procedure TFrmPRPrintCh.InitializeStringGrid;
begin
  with GridtoPrint do
  begin
    Cells[0, 0] := 'Check#';
    Cells[1, 0] := 'Name';
    Cells[2, 0] := 'Check $';
    ColWidths[0] := 45;
    ColWidths[1] := 130;
    ColWidths[2] := 50;
  end;
end;

procedure TFrmPRPrintCh.DeleteRow;
var i:Integer;
begin
  with GridtoPrint do
  begin
    { TODO -oathite -cWebConvert : Undeclared identifier: 'Objects'
    if LongInt(Objects[0, Row]) <> 0 then
//    if Trim(Cells[2, Row]) <> '' then
    begin
      for i:= Row to Rowcount - 2 do
      begin
        ReAssignCells(i);
      end;

      Objects[0, RowCount - 1].Free;

      RowCount := RowCount - 1;
    end; }
  end;
end;

procedure TFrmPRPrintCh.DeleteAllRows;
var
  i:Integer;
begin
  with GridtoPrint do
  begin
    for i := 1 to RowCount - 1 do
    begin
      Row := 1;
      DeleteRow;
    end;
  end;
end;


procedure TFrmPRPrintCh.ReAssignCells(i:Integer);
begin
  with GridtoPrint do
  begin
    Cells[0, i] := Cells[0, i + 1];
    Cells[1, i] := Cells[1, i + 1];
    Cells[2, i] := Cells[2, i + 1];
    Cells[3, i] := Cells[2, i + 1];
    { TODO -oathite -cWebConvert : Undeclared identifier: 'Objects'
    Objects[0, i] := Objects[0, i + 1]; }
  end;
end;

procedure TFrmPRPrintCh.AssignCell(Str1, Str2, Str3:string);
begin
  with GridtoPrint do
  begin
    if Str1 = '' then Str1 := ' ';
    Cells[0, RowCount - 1] := Str1;
    Cells[1, RowCount - 1] := Str2;
    Cells[2, RowCount - 1] := Str3;
  end;
end;

function TFrmPRPrintCh.LocatePrePostId(nPrePostId:Real):Boolean;
var
  i:Integer;
begin
  Result := False;
  with GridtoPrint do
  begin
    { TODO -oathite -cWebConvert : Undeclared identifier: 'Objects'
    for i := 0 to RowCount - 1 do
      if LongInt(Objects[0, i])  = nPrePostId then
        begin
          Result := True;
          Exit;
        end; }
  end;
end;


procedure TFrmPRPrintCh.GridToPrintDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  AssignRecordToStringGrid(nil);
end;

procedure TFrmPRPrintCh.AssignRecordToStringGrid(Sender: TObject);
var
  nId, i:Integer;
begin
   with gridChecks, gridChecks.datasource.dataset do
   begin
     (*TODO -oathite -cWebConvert :  Undeclared identifier: 'SelectedList'
     for i:= 0 to SelectedList.Count-1 do
     begin
       GotoBookmark(SelectedRows.items[i]);
       if not LocatePrePostId(FieldByName('PR_PREPOST_EMPLOYEE_ID').asFloat) then
       begin
         AssignCell(FieldByName('CHECK_NO').asString,
                    FieldByName('NAME').asString,
                    Format('%m', [FieldByName('CHECK_AMOUNT').AsFloat]));
         nId := FieldByName('PR_PREPOST_EMPLOYEE_ID').asInteger;
         { TODO -oathite -cWebConvert : Undeclared identifier: 'Objects'
         GridtoPrint.Objects[0, GridtoPrint.RowCount - 1] := Pointer(nId); }
         GridtoPrint.RowCount := GridtoPrint.RowCount + 1;
       end;
     end;*)
   end;
end;


procedure TFrmPRPrintCh.gridChecksMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  AMax:Integer;
begin
  { TODO -oathite -cWebConvert : Undeclared identifier: 'TDrawState'
  AMax:= TDrawGrid(GridChecks).DefaultRowHeight;
  If (Y > AMax) and (Button = mBLeft) then GridChecks.BeginDrag(False); }
end;

procedure TFrmPRPrintCh.GridToPrintDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if (Source = GridChecks)
    then Accept := True
    else Accept := False;
end;

procedure TFrmPRPrintCh.GridToPrintMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  GridToPrint.BeginDrag(False);
end;

procedure TFrmPRPrintCh.gridChecksDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if (Source = GridtoPrint)
    then Accept := True
    else Accept := False;
end;

procedure TFrmPRPrintCh.gridChecksDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  DeleteRow;
end;

procedure TFrmPRPrintCh.BtnDeleteClick(Sender: TObject);
begin
  DeleteRow;
end;

procedure TFrmPRPrintCh.BtnAppendAllClick(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Undeclared identifier: 'SelectAll'
  gridChecks.SelectAll; }
  with qryPrChecks do
  begin
    First;
    while not eof do
    begin
      AssignRecordToStringGrid(nil);
      Next;
    end;
  end;
end;

procedure TFrmPRPrintCh.BtnDeleteAllClick(Sender: TObject);
begin
  DeleteAllRows;
end;

procedure TFrmPRPrintCh.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPRPrintCh.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmPRPrintCh.AssignCheckNumbers;
var
  nPrePostId:Real;
  nCheckNo, i : Integer;
  lAskForReprint:Boolean;
  ASortOrder:Real;
begin
  lAskForReprint := True;
  APrePostIds      := '(';
  nCheckNo := Trunc(StrToFloat(EditCheckNo.Text)) - 1;
  ASortOrder := 0;
  with GridtoPrint do
  begin
    if Reverseprintingorder1.Checked then
    for i := RowCount - 2 downto 1 do
    begin
      ASortOrder := ASortOrder + 1;
      { TODO -oathite -cWebConvert : Undeclared identifier: 'Objects'
      nPrePostId := LongInt(Objects[0, i]); }
      if SelectValueFmtAsString('select NVL(printed, ''N'') from PR_PREPOST_EMPLOYEE where id = %f', [nPrePostId]) = 'Y' then
      begin

        if lAskForReprint then
          if not IQConfirmYN('One or more checks to be printed are reprints.' + #13 +
                          'Checks previously printed will be marked as ''VOID'', continue?')
                          then abort;
        lAskForReprint := False;
        PostVoidCheck(nPrePostId);
      end;
      if Abs(StrToFloat(StrToNumber(Trim(Cells[2, i])))) > 0.00001 then
      begin
        Inc(nCheckNo);
        ExecuteCommand(IQFormat('update PR_PREPOST_EMPLOYEE set check_no = %d, printed = ''Y'', sort_order = %f where id = %f',
                      [nCheckNo, ASortOrder, nPrePostId]));
        Cells[0, i] := IntToStr(nCheckNo);
      end
      else
        ExecuteCommand(IQFormat('update PR_PREPOST_EMPLOYEE set printed = ''Y'', sort_order = %f where id = %f',
                      [ASortOrder, nPrePostId]));
      APrePostIds := APrePostIds + IntToStr(Trunc(nPrePostId)) + ', ';
    end
    else
    for i := 1 to RowCount - 2 do
    begin
      ASortOrder := ASortOrder + 1;
      { TODO -oathite -cWebConvert : Undeclared identifier: 'Objects'
      nPrePostId := LongInt(Objects[0, i]);}
      if SelectValueFmtAsString('select NVL(printed, ''N'') from PR_PREPOST_EMPLOYEE where id = %f', [nPrePostId]) = 'Y' then
      begin

        if lAskForReprint then
          if not IQConfirmYN('One or more checks to be printed are reprints.' + #13 +
                          'Checks previously printed will be marked as ''VOID'', continue?')
                          then abort;
        lAskForReprint := False;
        PostVoidCheck(nPrePostId);
      end;
      if Abs(StrToFloat(StrToNumber(Trim(Cells[2, i])))) > 0.00001 then
      begin
        Inc(nCheckNo);
        ExecuteCommand(IQFormat('update PR_PREPOST_EMPLOYEE set check_no = %d, printed = ''Y'', sort_order = %f where id = %f',
                      [nCheckNo, ASortOrder, nPrePostId]));
        Cells[0, i] := IntToStr(nCheckNo);
      end
      else
        ExecuteCommand(IQFormat('update PR_PREPOST_EMPLOYEE set printed = ''Y'', sort_order = %f where id = %f',
                      [ASortOrder, nPrePostId]));
      APrePostIds := APrePostIds + IntToStr(Trunc(nPrePostId)) + ', ';
    end;
  end;
  APrePostIds := Copy(APrePostIds, 1, Length(APrePostIds) - 2) + ')';
  qryPrChecks.Close;
  qryPrChecks.Open;

  ExecuteCommand(IQFormat('update bankinfo_dtl set last_checkno = %d where id = %f',
                      [nCheckNo, FBankInfoDtlId]));
  EditCheckNo.Text := IntToStr(nCheckNo + 1);
  DeleteAllRows;
end;

procedure TFrmPRPrintCh.BtnPrintClick(Sender: TObject);
var
  DataBaseName, cServerName, cUID, cPassword, AReportName:String;
  SelectionList:TStringList;
  AMasterList:TStringList;
  ALocHandle:String;
  DBase:TFDConnection;
  AReport:String;
  AMessage :String;
  i, j, ABatch, AOffset:integer;
  ACopies: Integer;
  ACollated: Boolean;
  AStartPage, AStopPage: Integer;
begin
  if not IqConfirmYN('No modifications allowed once checks are printed! Are you sure you want to continue?')
    then exit;
  AMessage := '';
  if ChecksForm1.Checked then
  begin
    if FReport = '' then
    begin
      AReport := 'PR_CHECK_REPNAME';
      FReport := SelectValueAsString('select PR_CHECK_REPNAME from iqsys');
      if Trim(SelectValueFmtAsString('select %s from iqsys', [AReport])) = '' then
        raise Exception.Create('Report not assigned, cannot print.');
    end;
    AReport := FReport;

    with GridtoPrint do
      for i := 1 to RowCount - 2 do
        if Abs(StrToFloat(StrToNumber(Cells[2, i]))) < 0.001 then
        begin
          AMessage := 'The selected print form is for checks, but direct deposits included in this print run.'#13 +
                      'They might not fit your print Vcl.Forms, do you still wish to continue printing?';
          Break;
        end;

  end
  else
  begin
    if FReportDD = '' then
    begin
      AReport := 'PR_DD_REPNAME';
      FReportDD := SelectValueAsString('select PR_DD_REPNAME from iqsys');
      if Trim(SelectValueFmtAsString('select %s from iqsys', [AReport])) = '' then
        raise Exception.Create('Report not assigned, cannot print.');
    end;
    AReport := FReportDD;

    with GridtoPrint do
      for i := 1 to RowCount - 2 do
        if Abs(StrToFloat(StrToNumber(Cells[2, i]))) > 0.001 then
        begin
          AMessage := 'The selected print form is for direct deposits, but checks included in this print run.'#13 +
                      'They might not fit your print Vcl.Forms, do you still wish to continue printing?';
          Break;
        end;

  end;
  if AMessage <> '' then
    if not IqConfirmYN(AMessage) then
      Exit;
  (* TODO -oathite -cWebConvert :  Undeclared identifier: 'DB_DataModule'
  ALocHandle := DB_DataModule.GetIQLockHandle(FloatToStr(FBankInfoDtlId));   {in MainModule.pas}

  if DB_DataModule.IQLock( ALocHandle, 6 ) <> '' then                        {cannot lock exclusive}
  begin
    if IqConfirmYN('Another user is printing checks from this cash account.'#13 +
                   'If you continue you are running serious risk of duplicating check numbers.'#13 +
                   'Do you wish to stop printing?') then Exit;
  end
  else DB_DataModule.IqUnLock(ALocHandle);
  try
    DB_DataModule.IQLock( ALocHandle, 4 );
    if (GridToPrint.RowCount - 2) = 0 then raise Exception.Create('Nothing to print');
    cServername := IQGetServerName( 'IQ' );
    cUID        := IQGetUID( 'IQ' );
    cPassword   := IQGetPassword( 'IQ' );
    AssignCheckNumbers;
    try
      AMasterList := TStringList.Create;
      SelectionList := TStringList.Create;
      CreateMasterList(AMasterList, APrePostIds);
      AReportName := GetReportName;
      aBatch := 100;
      j := 1;
      if AMasterList.Count mod aBatch = 0 then
        AOffset := 0
      else AOffset := 1;
      repeat
        SetCriteriaExpression( SelectionList, AMasterList, ABatch, j * ABatch - ABatch);
        if j = 1 then
          if not AssignPrinterSettings( self, AReport, ACopies, ACollated, AStartPage, AStopPage ) then Exit;  {in IQMS.Common.Print.pas}
        PrintDefaultReportExA(AReport, SelectionList, ACopies, ACollated, AStartPage, AStopPage);              {in IQMS.Common.Print.pas}
        Inc(j);
      until j > (AMasterList.Count div aBatch + AOffset)
    finally
      SelectionList.Free;
      AMasterList.Free;
    end;
    Screen.Cursor := crDefault;
  finally
    DB_DataModule.IqUnLock(ALocHandle);
  end;  *)
end;

procedure TFrmPRPrintCh.CreateMasterList(List:TStringList; cIds:string);
var
  I: Integer;
  S: string;
begin
  cIDs:= Copy( cIds, 2, Length( cIds ) - 2 );   {get rid of ( ) }

  List.Clear;
  repeat
    I:= Pos( ',', cIDs );
    if I > 0 then
    begin
      S   := Copy( cIDs, 1, I-1);
      cIds:= Copy( cIDs, I+1, Length( cIDs ));
      List.Add( Format( '{V_PR_PREPOST_CHEQUE.ID} = %s', [ S ]));
    end;
  until I = 0;

  if Length(cIDs) > 0 then
     List.Add( Format( '{V_PR_PREPOST_CHEQUE.ID} = %s', [ cIDs ]));
end;


procedure TFrmPRPrintCh.SetBankInfoDtlId(const Value: Real);
begin
  FBankInfoDtlId := Value;
  EditCheckNo.Text := IntToStr(1 + Trunc(SelectValueAsFloat(IQFormat('select last_checkno from bankinfo_dtl where id = %f',
                                         [Value]))));
end;

procedure TFrmPRPrintCh.SetCriteriaExpression( List, AMasterList:TStringList; ABatch, AStart:Integer );
var
  I: Integer;
  S: string;
  ACount:integer;
begin
  List.Clear;
  ACount := 0;
  for i := AStart to AMasterList.Count - 1 do
  begin
    Inc(ACount);
    if ACount > ABatch then Break;
    S := AMasterList[i];
    if (ACount = ABatch) or (i = AMasterList.Count - 1) then
      List.Add( Format( '%s', [ S ]))
    else
      List.Add( Format( '%s or ', [ S ]));
  end;
  List[ 0 ]            := Format( '(%s', [ List[ 0 ] ] );
  List[ List.Count -1 ]:= Format( '%s)', [ List[ List.Count -1 ] ] );
end;



procedure TFrmPRPrintCh.SetIDs(const Value: String);
var
  AStr:String;
begin
  FIDs := Value;
  with qryPrChecks do
  begin
    Close;
    AStr := Sql.Text;
    Sql.Clear;
    { TODO -oathite -cWebConvert : Undeclared identifier: 'AIDS'
    Sql.Add(AStr + Format(' and p.pr_prepost_control_id in %s', [AIDS])); }
    Open;
  end;
end;

procedure TFrmPRPrintCh.SetReport(const Value: String);
begin
  FReport := Value;
end;

procedure TFrmPRPrintCh.SetReportDD(const Value: String);
begin
  FReportDD := Value;
end;

//procedure TFrmPRPrintCh.SetCriteriaExpression( List:TStringList; cIds:string );
//var
//  I: Integer;
//  S: string;
//begin
//  cIDs:= Copy( cIds, 2, Length( cIds ) - 2 );   {get rid of ( ) }
//
//  List.Clear;
//  //List.Add('{V_CDPREPOST.ID} in ' + cIds);
//  repeat
//    I:= Pos( ',', cIDs );
//    if I > 0 then
//    begin
//      S   := Copy( cIDs, 1, I-1);
//      cIds:= Copy( cIDs, I+1, Length( cIDs ));
//      List.Add( Format( '{V_PR_PREPOST_CHEQUE.ID} = %s or ', [ S ]));
//    end;
//  until I = 0;
//
//  if Length(cIDs) > 0 then
//     List.Add( Format( '{V_PR_PREPOST_CHEQUE.ID} = %s', [ cIDs ]));
//
//  {Add back ( ) }
//  List[ 0 ]            := Format( '(%s', [ List[ 0 ] ] );
//  List[ List.Count -1 ]:= Format( '%s)', [ List[ List.Count -1 ] ] );
//end;


function TFrmPRPrintCh.GetReportName:String;
begin
  if SelectValueFmtAsFloat('select count(pr_paygroup_id) ' +
                 'from (select distinct pr_paygroup_id from pr_prepost_control where id in %s)', [FIDS]) > 1 then
  begin
    Result := SelectValueAsString('select pr_check_repname from iqsys');
    IqConfirm('The default check report will be used since more than one paygroup is included in this run');
  end
  else
    Result := SelectValueFmtAsString('select paycheck_rpt from pr_paygroup ' +
                          'where id = (select distinct pr_paygroup_id from pr_prepost_control where id in %s)', [FIDS]);

end;

procedure TFrmPRPrintCh.PostVoidCheck(AID:Real);
begin
  with procVoidCheck do
  begin
    ParamByName('V_PREPOST_EMP_ID').Value := AID;
    Prepare;
    ExecProc;
  end;
end;

function TFrmPRPrintCh.StrToNumber(AStr:String):String;
var
  i:Integer;
begin
  Result := '';
  for i := 1 to Length(AStr) do
    if Pos(Astr[i], '0123456789') <> 0 then
      Result := Result + Astr[i];
  if Result = '' then Result := '0';
end;


procedure TFrmPRPrintCh.UniFormCreate(Sender: TObject);
var
  AType :Integer;
begin
  FSql := qryPrChecks.Sql.Text;
  IQRegFormRead( self, [ self, GridChecks, GridToPrint, Panel3 ]);
  SortbyEmp1Click(nil);
  InitializeStringGrid;


  AType := 0;


  if IQRegIntegerScalarRead( self, 'PR_REVERSE_ORDER', AType ) then
  begin
    if AType = 0 then
      Reverseprintingorder1.Checked := False
    else
      Reverseprintingorder1.Checked := True;
  end
  else
  begin
    Reverseprintingorder1.Checked := False;
    IQRegIntegerScalarWrite( self, 'PR_REVERSE_ORDER', 0);
  end;
end;

procedure TFrmPRPrintCh.sbDDClick(Sender: TObject);
begin
{ TODO -oathite -cWebConvert :  Undeclared identifier: 'SelectAll and select record'
  gridChecks.UnSelectAll;
  qryPrChecks.First;
  with qryPrChecks do
    while not eof do
    begin
      if Abs(FieldByName('CHECK_AMOUNT').AsFloat) < 0.001 then
      begin
        gridChecks.SelectRecord;
        AssignRecordToStringGrid(nil);
      end;
      Next;
    end;
    DirectdepositForm1Click(nil);  }
end;

procedure TFrmPRPrintCh.sbCheckClick(Sender: TObject);
begin
  { TODO -oathite -cWebConvert :  Undeclared identifier: 'UnSelectAll and select record'
  gridChecks.UnSelectAll;
  qryPrChecks.First;
  with qryPrChecks do
    while not eof do
    begin
      if Abs(FieldByName('CHECK_AMOUNT').AsFloat) > 0.001 then
      begin
        gridChecks.SelectRecord;
        AssignRecordToStringGrid(nil);
      end;
      Next;
    end;
  ChecksForm1Click(nil);}
end;

procedure TFrmPRPrintCh.ChecksForm1Click(Sender: TObject);
begin
  ChecksForm1.Checked        := True;
  DirectdepositForm1.Checked := False;
end;

procedure TFrmPRPrintCh.DirectdepositForm1Click(Sender: TObject);
begin
  DirectdepositForm1.Checked := True;
  ChecksForm1.Checked        := False;
end;

procedure TFrmPRPrintCh.FormShow(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Dependent on IQSecIns
  EnsureSecurityInspectorOnTopOf( self );}
end;

procedure TFrmPRPrintCh.SortbyEmp1Click(Sender: TObject);
begin
  FOrderByStr := ' order by e.empno, e.last_name ';
  SortbyEmp1.Checked       := True;
  SortbyLastName1.Checked  := False;
  SortbyFirstName1.Checked := False;
  SortbyDepartment1.Checked := False;
  ResetQuery;
end;

procedure TFrmPRPrintCh.SortbyFirstName1Click(Sender: TObject);
begin
  FOrderByStr := ' order by e.first_name, e.last_name ';
  SortbyEmp1.Checked       := False;
  SortbyLastName1.Checked  := False;
  SortbyFirstName1.Checked := True;
  SortbyDepartment1.Checked := False;
  ResetQuery;
end;

procedure TFrmPRPrintCh.SortbyLastName1Click(Sender: TObject);
begin
  FOrderByStr := ' order by e.last_name ';
  SortbyEmp1.Checked        := False;
  SortbyLastName1.Checked   := True;
  SortbyFirstName1.Checked  := False;
  SortbyDepartment1.Checked := False;
  ResetQuery;
end;

procedure TFrmPRPrintCh.ResetQuery;
begin
  with qryPrChecks do
  begin
    Close;
    Sql.Clear;
    Sql.Add(FSql + FOrderByStr);
    Open;
  end;
end;


procedure TFrmPRPrintCh.SortbyDepartment1Click(Sender: TObject);
begin
  FOrderByStr := ' order by NVL(d.description, '' ''), e.last_name, e.first_name ';
  SortbyEmp1.Checked        := False;
  SortbyLastName1.Checked   := False;
  SortbyFirstName1.Checked  := False;
  SortbyDepartment1.Checked := True;
  ResetQuery;
end;

procedure TFrmPRPrintCh.SortbyDepartmentEmp1Click(Sender: TObject);
begin
  FOrderByStr := ' order by NVL(d.description, '' ''), e.empno ';
  SortbyEmp1.Checked        := False;
  SortbyLastName1.Checked   := False;
  SortbyFirstName1.Checked  := False;
  SortbyDepartment1.Checked := True;
  ResetQuery;
end;


procedure TFrmPRPrintCh.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmPAYROLL{CHM}, iqhtmPAYROLL_RV{HTM} )  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmPRPrintCh.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1008224 );
end;


procedure TFrmPRPrintCh.Reverseprintingorder1Click(Sender: TObject);
begin
  if Reverseprintingorder1.Checked then
  begin
    Reverseprintingorder1.Checked := False;
    IQRegIntegerScalarWrite( self, 'PR_REVERSE_ORDER', 0);
  end
  else
  begin
    Reverseprintingorder1.Checked := True;
    IQRegIntegerScalarWrite( self, 'PR_REVERSE_ORDER', 1);
  end;

end;

end.
