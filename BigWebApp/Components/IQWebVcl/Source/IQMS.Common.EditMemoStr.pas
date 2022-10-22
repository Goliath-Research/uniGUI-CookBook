unit IQMS.Common.EditMemoStr;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Winapi.ShellAPI,
  Vcl.Buttons,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniMemo,
  uniPanel,
  uniStatusBar,
  uniDBMemo,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel;

type
  { TFrmEditMemoString }
  TFrmEditMemoString = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Memo: TUniMemo;
    btnPrint: TUniBitBtn;
    PMain: TUniPopupMenu;
    SelectAll1: TUniMenuItem;
    Copy1: TUniMenuItem;
    Paste1: TUniMenuItem;
    Cut1: TUniMenuItem;
    N1: TUniMenuItem;
    N2: TUniMenuItem;
    Print1: TUniMenuItem;
    StatusBar: TUniStatusBar;
    N3: TUniMenuItem;
    SaveToFile1: TUniMenuItem;
    SaveAndClose1: TUniMenuItem;
    SaveDialog: TSaveDialog;
    SR: TIQWebSecurityRegister;
    DBMemo: TUniDBMemo;
    N4: TUniMenuItem;
    RemoveExtraLineBreaks1: TUniMenuItem;
    Panel3: TUniPanel;
    btnOK: TUniBitBtn;
    btnCancel: TUniBitBtn;
    CheckSpelling1: TUniMenuItem;
    N6: TUniMenuItem;
    PnlPrompt: TUniPanel;
    lblPrompt: TUniLabel;
    Clear1: TUniMenuItem;
    PrintDialog1: TPrintDialog;
    procedure btnPrintClick(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure Cut1Click(Sender: TObject);
    procedure SelectAll1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MemoChange(Sender: TObject);
    procedure MemoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOKClick(Sender: TObject);
    procedure SaveToFile1Click(Sender: TObject);
    procedure RemoveExtraLineBreaks1Click(Sender: TObject);
    procedure CheckSpelling1Click(Sender: TObject);
    procedure PMainPopup(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
  private
    { Private declarations }
    FUsesDataSetField: Boolean;
    FField: TField;
    FMaxLength: Integer;
    FModified: Boolean;
    FPrompt: ShortString;
    FReadOnly: Boolean;
    procedure WMDROPFILES(var Msg: TMessage); message WM_DROPFILES;
    function GetWordCount: Integer;
    procedure SetStatus(S: string; APanel: Integer);
    procedure SetIsDB(AIsDB: Boolean);
    function GetText: string;
    procedure SetMaxLength(const Value: Integer);
    procedure SetPrompt(const Value: ShortString);
    procedure SetText(const Value: string);
    procedure SetReadOnly(const Value: Boolean);
    procedure CheckDataSetInEditMode;
  public
    { Public declarations }
    constructor Create(const ACaption, APrompt: string;
      const AMaxLength: Integer; const AReadOnly: Boolean;
      const AText: string);
    constructor CreateDataAware(AField: TField;
      ADataSource: TDataSource);

    class function DoShowModal(const ACaption,
      APrompt: string; const AMaxLength: Integer; const AReadOnly: Boolean;
      var AText: string): Boolean;

    property Text: string read GetText write SetText;
    property Prompt: ShortString read FPrompt write SetPrompt;
    property MaxLength: Integer read FMaxLength write SetMaxLength;
    property Modified: Boolean read FModified;
    property ReadOnly: Boolean read FReadOnly write SetReadOnly;
    property WordCount: Integer read GetWordCount;
  end;

  { Wrappers }

function DoEditMemoStr( var AStringInOut: string;
  AMaxLength: Integer = 2000; ACaption: string = 'Edit'): Boolean;

procedure DoViewMemoStr( AText: string;
  ACaption: string = 'View Text (Read Only)');

function DoDBEditMemoStr( AField: TField;
  ADataSource: TDataSource): Boolean;

implementation

{$R *.DFM}


uses
  AnsiStrings,
  IQMS.Common.Controls,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  //IQSecIns,
  IQMS.Common.ResStrings,
  IQMS.Common.StringUtils,
  IQMS.Common.SysInfo,
  IQMS.Common.SpellChecker,
  Vcl.Printers;

function DoEditMemoStr( var AStringInOut: string;
  AMaxLength: Integer = 2000; ACaption: string = 'Edit'): Boolean;
begin
  Result := TFrmEditMemoString.DoShowModal(ACaption, '', AMaxLength,
    False, AStringInOut);
end;

procedure DoViewMemoStr( AText: string;
  ACaption: string = 'View Text (Read Only)');
begin
  TFrmEditMemoString.DoShowModal(ACaption, '', 0, True, AText);
end;

function DoDBEditMemoStr( AField: TField;
  ADataSource: TDataSource): Boolean;
begin
  if Assigned(AField) and Assigned(AField.DataSet) then
    with TFrmEditMemoString.CreateDataAware(AField, ADataSource) do
      try
        Result := ShowModal = mrOk;
      finally
        Release;
      end;
end;

{ TFrmEditMemoString }

constructor TFrmEditMemoString.Create(const ACaption, APrompt: string; const AMaxLength: Integer;
  const AReadOnly: Boolean; const AText: string);
begin
  inherited Create(uniGUIApplication.UniApplication);
  SetIsDB(False);
  Memo.Clear;

  // Modify caption for localized versions, since we are using default
  // parameters.
  if ACaption = 'View Text (Read Only)' then
    Self.Caption := IQMS.Common.ResStrings.cTXT0000044
  else if ACaption = 'Edit' then
    Self.Caption := IQMS.Common.ResStrings.cTXT0000043
  else
    Self.Caption := ACaption;
  Self.Prompt := APrompt;
  Self.ReadOnly := AReadOnly;
  Self.MaxLength := AMaxLength;
  Self.Text := AText;
  FModified := False;
  //IQMS.Common.Controls.CenterForm(Self, True);
end;

constructor TFrmEditMemoString.CreateDataAware(AField: TField;
  ADataSource: TDataSource);
begin
  // Data-aware
  if AField = nil then
    Exit;

  inherited Create(uniGUIApplication.UniApplication);
  SetIsDB(True);

  if not AField.ReadOnly then
    DragAcceptFiles((TComponent(Self) as TUniForm).Handle, True);

  DBMemo.DataSource := ADataSource;
  DBMemo.DataField := AField.FieldName;
  FField := AField;

  if (AField.IsBlob or (AField is TMemoField)) and (AField.Size <= 2) then
    MaxLength := 0 // 09/30/2013 We cannot guess the size.
  else
    MaxLength := AField.Size;

  Self.Caption := AField.DisplayLabel;
  Self.ReadOnly := AField.ReadOnly;
  FModified := False;
  //IQMS.Common.Controls.CenterForm(Self, True);
end;

procedure TFrmEditMemoString.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self]);
  MemoChange(nil);
  FModified := False;
  SetStatus('', 1);
  //EnsureSecurityInspectorOnTopOf(Self);
end;

procedure TFrmEditMemoString.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  // If this is maximized, return it to a restored state
  //IQMS.Common.Controls.RestoreForm(Self);
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self]);
end;

class function TFrmEditMemoString.DoShowModal(const ACaption, APrompt: string; const AMaxLength: Integer;
  const AReadOnly: Boolean; var AText: string): Boolean;
begin
  with Self.Create(ACaption, APrompt, AMaxLength, AReadOnly, AText) do
    try
      Caption := ACaption;
      MaxLength := AMaxLength;
      Result := ShowModal = mrOk;
      if Result then
        AText := Text;
    finally
      Release;
    end;
end;

procedure TFrmEditMemoString.btnPrintClick(Sender: TObject);
const
  // default page margin (1 inch)
  c_margin = 1;
var
  APageRect: TRect;

//  procedure _CalcPageRect;
//  var
//    ppiX, ppiY: Integer;
//    ASpaceLeft, ASpaceTop: Integer;
//  begin
//    ppiX := GetDeviceCaps(Printer.Handle, LOGPIXELSX);
//    ppiY := GetDeviceCaps(Printer.Handle, LOGPIXELSY); // non-printable margins
//    ASpaceLeft := GetDeviceCaps(Printer.Handle, PHYSICALOFFSETX);
//    ASpaceTop := GetDeviceCaps(Printer.Handle, PHYSICALOFFSETY); // calc margins
//    APageRect.Left := Round(ppiX * c_margin) - ASpaceLeft;
//    APageRect.Right := Printer.PageWidth - Round(ppiX * c_margin) - ASpaceLeft;
//    APageRect.Top := Round(ppiY * c_margin) - ASpaceTop;
//    APageRect.Bottom := Printer.PageHeight - Round(ppiY * c_margin) - ASpaceTop;
//  end;

begin
  // 02/06/2015 Display the print dialog first
//  if PrintDialog1.Execute then
//    with TRichEdit.Create(Self) do
//      try
//        Parent := Self;
//        Visible := False;
//        Align := alClient;
//        ParentFont := False;
//        WantReturns := True;
//        WantTabs := True;
//        WordWrap := True;
//        // Ensure the system font is used
//        Font.Assign(IQMS.Common.SysInfo.SystemFont);
//        // Ensure one-inch margins
//        _CalcPageRect;
//        PageRect := APageRect;
//        // Set the text to print
//        if FUsesDataSetField then
//          Lines.Text := DBMemo.Text
//        else
//          Lines.Text := Memo.Text;
//        // Print it
//        Print(Caption);
//      finally
//        Free;
//      end;
end;

procedure TFrmEditMemoString.Copy1Click(Sender: TObject);
begin
  if FUsesDataSetField then
//    DBMemo.CopyToClipboard
  else
//    Memo.CopyToClipboard;
end;

procedure TFrmEditMemoString.Paste1Click(Sender: TObject);
var
  S: string;
begin
  // 09/25/2006 If pasting from the clipboard, modify the text so that we
  // can save it to the database without errors.  Certain characters
  // cause problems. Do not call the TMemo PasteFromClipboard method.
  // This bug was reported by Dawn.
//  if not Self.ReadOnly then
//    begin
//      // Get text from the clipboard
//      S := PasteStrFromClipbrd; // iqstring
//
//      // If no text, then exit
//      if S = '' then
//        Exit;
//
//      // Fix the text
//      S := StrTran(S, #96, ''''); // hash mark
//      S := StrTran(S, #145, ''''); // hash mark
//      S := StrTran(S, #146, ''''); // hash mark
//
//      // Assign text
//      if FUsesDataSetField then
//        begin
//          // 01/25/2008
//          if Assigned(DBMemo.DataSource) and Assigned(DBMemo.DataSource.DataSet) and
//            not (DBMemo.DataSource.DataSet.State in [dsEdit, dsInsert]) then
//            DBMemo.DataSource.DataSet.Edit;
//          DBMemo.SelText := S;
//        end
//      else
//        Memo.SelText := S;
//    end;
end;

procedure TFrmEditMemoString.PMainPopup(Sender: TObject);
begin
  Paste1.Enabled := not Self.ReadOnly and SR.Enabled['Paste1'];
  Cut1.Enabled := not Self.ReadOnly and SR.Enabled['Cut1'];
  CheckSpelling1.Enabled := not Self.ReadOnly and SR.Enabled['CheckSpelling1'];
  RemoveExtraLineBreaks1.Enabled := not Self.ReadOnly and
    SR.Enabled['RemoveExtraLineBreaks1'];
end;

procedure TFrmEditMemoString.Cut1Click(Sender: TObject);
begin
//  if not Self.ReadOnly then
//    begin
//      if FUsesDataSetField then
//        DBMemo.CutToClipboard
//      else
//        Memo.CutToClipboard;
//    end;
end;

procedure TFrmEditMemoString.SelectAll1Click(Sender: TObject);
begin
//  if FUsesDataSetField then
//    DBMemo.SelectAll
//  else
//    Memo.SelectAll;
end;

procedure TFrmEditMemoString.SetStatus(S: string; APanel: Integer);
begin
  StatusBar.Panels[APanel].Text := S;
  StatusBar.Update;
end;

procedure TFrmEditMemoString.MemoChange(Sender: TObject);
var
  S: UTF8String;
  i: Integer;
begin
  FModified := True;
  if FUsesDataSetField then
    S := DBMemo.Text
  else
    S := Memo.Text;
  i := Length(S);

  if FMaxLength > 0 then
    SetStatus(IQFormat(IQMS.Common.ResStrings.cTXT0000045 { 'Text Length: %d / %d ' } ,
      [i, FMaxLength]), 0)
  else
    SetStatus(IQMS.Common.ResStrings.cTXT0000046 { 'Memo' } , 0);
  SetStatus(IQMS.Common.ResStrings.cTXT0000047 { 'Modified' } , 1);
  SetStatus(IQFormat(IQMS.Common.ResStrings.cTXT0000048 { 'Word Count: %d' } ,
    [WordCount]), 2);
  if (FMaxLength > 0) and (i >= FMaxLength) then
    Beep;
end;

function TFrmEditMemoString.GetText: string;
var
  S: string;
begin
  if FUsesDataSetField then
    S := DBMemo.Text
  else
    S := Memo.Text;
  Result := IQMS.Common.StringUtils.LeftStr(S, MaxLength);
end;

procedure TFrmEditMemoString.SetText(const Value: string);
var
  ALines: TStringList;
  AText: string;
begin
  ALines := TStringList.Create;
  try
    AText := Value;
    AText := StrTran(AText, #$A#$A, #$D#$A);
    AText := StrTran(AText, #$D#$D, #$D#$A);
    ALines.Text := AText;
    AText := Trim(ALines.Text);
  finally
    if Assigned(ALines) then
      FreeAndNil(ALines);
  end;

  if MaxLength > 0 then
    AText := IQMS.Common.StringUtils.LeftStr(AText, MaxLength);

  if FUsesDataSetField then
    begin
      CheckDataSetInEditMode;
      DBMemo.Text := AText;
    end
  else
    Memo.Text := AText;
end;

function TFrmEditMemoString.GetWordCount: Integer;
var
  AList: TStringList;
begin
  try
    AList := TStringList.Create;
    if FUsesDataSetField then
      AList.CommaText := DBMemo.Text
    else
      AList.CommaText := Memo.Text;
    Result := AList.Count;
  finally
    if (AList <> nil) and Assigned(AList) then
      AList.Free;
  end;
end;

procedure TFrmEditMemoString.MemoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (Key = VK_RETURN) then
    begin
      Key := 0;
      ModalResult := mrOk;
    end;
  if (Key = VK_ESCAPE) then
    begin
      Key := 0;
      ModalResult := mrCancel;
    end;
  if (Key = VK_F5) then
    begin
      if FUsesDataSetField then
        begin
          // 01/25/2008
          CheckDataSetInEditMode;
          //DBMemo.SelText := FormatDateTime('t ddddd', Now());
        end
      else
        //Memo.SelText := FormatDateTime('t ddddd', Now());
    end;
end;

procedure TFrmEditMemoString.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOk; // for external methods calling this event
end;

procedure TFrmEditMemoString.SaveToFile1Click(Sender: TObject);
begin
  with SaveDialog do
    if Execute then
      begin
        if FUsesDataSetField then
          DBMemo.Lines.SaveToFile(FileName)
        else
          Memo.Lines.SaveToFile(FileName);
        if (FileExists(FileName)) and
          (IQConfirmYN
          (IQMS.Common.ResStrings.
          cTXT0000049 { 'Do you want to open the new file now?' } ) = True) then
          ExecuteProgram(FileName, SW_SHOWDEFAULT, ''); // IQMS.Common.Miscellaneous.pas
      end;
end;

procedure TFrmEditMemoString.WMDROPFILES(var Msg: TMessage);
var
  i, j, ASize: Integer;
  PName: PChar;

  AFileName: string;
  ALines: TStringList;
  AMemo: TUniCustomMemo;
  AAction: TModalResult;
begin
  // This method enables drag and drop with the Winapi.Windows Explorer
  if not Self.ReadOnly then
    try
      try
        inherited;

        if FUsesDataSetField then
          AMemo := DBMemo
        else
          AMemo := Memo;

        j := DragQueryFile(Msg.WParam, $FFFFFFFF, PName, 255);

        // Get the user's choice of action
        { 'Append file contents?'#13#13 +
          'Click "Yes" to append file contents as text.'#13 +
          'Click "No" to append the file name(s).'#13 +
          'Click "Cancel" to abort the process.' }
        AAction := IQConfirmEx(IQMS.Common.ResStrings.cTXT0000050,
          [mbYes, mbNo, mbCancel]); // iqmesg

        if AAction <> mrCancel then
          begin
            CheckDataSetInEditMode;
            for i := 0 to (j - 1) do
              begin
                ASize := DragQueryFile(Msg.WParam, i, nil, 0) + 1;
                PName := StrAlloc(ASize);
                DragQueryFile(Msg.WParam, i, PName, ASize);
                AFileName := StrPas(PName);
                case AAction of
                  mrYes: // File contents
                    begin
                      if not FileExists(AFileName) then
                        begin
                          //AMemo.SelText := Format(#32'%s'#13#10, [AFileName])
                        end
                      else
                        begin
                          ALines := TStringList.Create;
                          try
                            ALines.LoadFromFile(AFileName);
                            ALines.Add('');
                            // Add the file
                            //AMemo.Lines.AddStrings(ALines)
                          finally
                            ALines.Free;
                          end;
                        end;
                    end;
                  mrNo: // Add the file name
                    begin
                      //AMemo.SelText := #32 + AFileName + #13#10
                    end;
                end; // end case
                // Free memory
                StrDispose(PName);
              end; // end loop
          end; // end if
      finally
        DragFinish(Msg.WParam);
      end;
    except
      on E: Exception do
        raise Exception.CreateFmt('%s [WMDROPFILES()])', [E.Message]);
    end;
end;

procedure TFrmEditMemoString.SetIsDB(AIsDB: Boolean);
begin
  FUsesDataSetField := AIsDB; // TRUE = this is using the DBMemo
  Memo.Visible := not AIsDB;
  DBMemo.Visible := AIsDB;
end;

procedure TFrmEditMemoString.SetMaxLength(const Value: Integer);
begin
  FMaxLength := Value;

  if Value > 0 then
    begin
      if FUsesDataSetField then
        //DBMemo.MaxLength := Value
      else
        //Memo.MaxLength := Value;
    end;
end;

procedure TFrmEditMemoString.SetPrompt(const Value: ShortString);
begin
  FPrompt := Value;
  lblPrompt.Caption := Value;
  PnlPrompt.Visible := Trim(Value) > '';
end;

procedure TFrmEditMemoString.SetReadOnly(const Value: Boolean);
begin
  FReadOnly := Value;
  Memo.ReadOnly := FReadOnly;
  DBMemo.ReadOnly := FReadOnly;
  btnCancel.Visible := not FReadOnly;
  if FReadOnly then
    btnOK.Left := btnCancel.Left
  else
    btnOK.Left := 1;
  DragAcceptFiles((TComponent(Self) as TUniForm).Handle, not FReadOnly);
end;

procedure TFrmEditMemoString.RemoveExtraLineBreaks1Click(Sender: TObject);
var
  AMemo: TUniCustomMemo;
  S: string;
begin
  if not Self.ReadOnly then
    begin
      if FUsesDataSetField then
        AMemo := DBMemo
      else
        AMemo := Memo;
      try
        AMemo.BeginUpdate;
        S := AMemo.Text;
        S := StringReplace(S, #13, ' ', [rfReplaceAll, rfIgnoreCase]);
        S := StringReplace(S, #10, '', [rfReplaceAll, rfIgnoreCase]);
        S := StringReplace(S, #9, ' ', [rfReplaceAll, rfIgnoreCase]);
        if FUsesDataSetField then
          begin
            CheckDataSetInEditMode;
            FField.AsString := S;
          end
        else
          AMemo.Text := Trim(S);
        //AMemo.SelStart := 0;
      finally
        AMemo.EndUpdate;
      end;
    end;
end;

// jason
procedure TFrmEditMemoString.CheckDataSetInEditMode;
begin
  if FUsesDataSetField and
    Assigned(DBMemo.DataSource) and
    Assigned(DBMemo.DataSource.DataSet) then
    begin
      if not (DBMemo.DataSource.DataSet.State in [dsEdit,dsInsert]) then
        DBMemo.DataSource.DataSet.Edit;
    end;
end;

procedure TFrmEditMemoString.CheckSpelling1Click(Sender: TObject);
var
  AText: string;
  AMemo: TUniCustomMemo;
  S: string;
begin
  if not Self.ReadOnly then
    begin
      if FUsesDataSetField then
        AMemo := DBMemo
      else
        AMemo := Memo;

      AText := AMemo.Text;
      if CheckSpelling(AText) then
        begin
          CheckDataSetInEditMode;
          AMemo.Clear;
          AMemo.Text := AText;
        end;
    end;
end;

procedure TFrmEditMemoString.Clear1Click(Sender: TObject);
begin
  if not Self.ReadOnly then
    Text := '';
end;

end.
