unit IQMS.WebVcl.HyperlinkCombo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Menus, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.Win.ComObj, Winapi.ShellAPI, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniEdit, uniDBEdit;

type
  { TIQWebHyperlink }
  TIQWebHyperlink = class(TComponent)
  strict private
    { Private declarations }
    FHyperlinkAddress: string;
    FHyperlinkSubAddress: string;
    function ProcExecuteLink(const AHyperlinkAddress, AHyperlinkSubAddress
      : string): Boolean;
    function TryExecuteMSApp(AFileName, AParams: String): Boolean;
    function JumpToMSWordDoc(AFileName, ABookMark: String): Boolean;
    function OpenMSPowerPointPresentation(AFileName, AParams: String): Boolean;
    function TryCreateOLEObject(const AObjectName: String;
      var AppObject: OLEVariant): Boolean;
    function ShellExec(const AFileName: String;
      const AParams: string = ''): Boolean;
  public
    { Public declarations }
    /// <summary> Execute a link. </summary>
    class function ExecuteLink(const AHyperlinkAddress, AHyperlinkSubAddress
      : string): Boolean;
    /// <summary> Execute the link. </summary>
    function Execute: Boolean;
    /// <summary> Returns a formatted link string, useable for execution.</summary>
    class function FormatLink(const AHyperlinkAddress, AHyperlinkSubAddress
      : string): string;
  published
    { Published declarations }
    /// <summary> Link address to execute.  Can be a URL or local file.</summary>
    property HyperlinkAddress: string read FHyperlinkAddress
      write FHyperlinkAddress;
    /// <summary> Location in the target link, such as a bookmark or
    /// named location.</summary>
    property HyperlinkSubAddress: string read FHyperlinkSubAddress
      write FHyperlinkSubAddress;
  end;

  { TIQWebHyperlinkComboDlg }
  TIQWebHyperlinkComboDlg = class(TUniDBEdit)
    FInternalPopupMenu: TPopupMenu;
    FOpenHyperlink1: TMenuItem;
    FEditHyperlink1: TMenuItem;
    FRenameHyperlink1: TMenuItem;
    FRemoveLink1: TMenuItem;
    FN1: TMenuItem;
    FCopyTarget1: TMenuItem;
    procedure DoKeyPress(Sender: TObject; var Key: Char);
    procedure DoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DoDblClick(Sender: TObject);
    procedure DoOnPopup(Sender: TObject);
    procedure DoOpenHyperlinkClick(Sender: TObject);
    procedure DoEditHyperlinkClick(Sender: TObject);
    procedure DoRenameHyperlinkClick(Sender: TObject);
    procedure DoRemoveLinkClick(Sender: TObject);
    procedure DoCopyTargetClick(Sender: TObject);
  strict private
    { Private declarations }
    FHyperlinkAddressField: string;
    FHyperlinkSubAddressField: string;
    procedure CreateWindowHandle(const Params: TCreateParams); override;
    procedure WMDROPFILES(var Msg: TMessage); message WM_DROPFILES;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    function CheckComponentState: Boolean;
    function HyperlinkValue: string;
    function HyperlinkAddressValue: string;
    function CheckConnected: Boolean;
    function DataSet: TDataSet;
    function DataSetFieldValue(const AFieldName: string): string;
    function GetHyperlinkValues(var AHyperlink, AHyperlinkAddress,
      AHyperlinkSubAddress: string): Boolean;
    function GetHyperlinkFields(var AHyperlink, AHyperlinkAddress,
      AHyperlinkSubAddress: TField): Boolean;
    procedure SetHyperlinkAddressField(const Value: string);
    procedure SetHyperlinkSubAddressField(const Value: string);
  private
    FShowButton: Boolean;
    function GetDataSource: TDataSource; reintroduce;
    procedure SetDataSource(const Value: TDataSource); reintroduce;
    function GetReadOnly: Boolean; reintroduce;
    procedure SetReadOnly(const Value: Boolean); reintroduce;
  protected
    { Protected declarations }
    procedure Loaded; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure Initialize;
  published
    { Published declarations }
    property Align;
    property AlignWithMargins;
    property Anchors;
    /// <summary> Hyperlink display name field name. This is not the link
    /// address, but the display name or description of the link. </summary>
    property DataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property Enabled;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property MaxLength;
    property ShowButton: Boolean read FShowButton write FShowButton;
    property ShowHint;
    property Visible;
    property Width;
    /// <summary> Hyperlink address field name. </summary>
    property HyperlinkAddressField: string read FHyperlinkAddressField
      write SetHyperlinkAddressField;
    /// <summary> Subaddress field name. </summary>
    property HyperlinkSubAddressField: string read FHyperlinkSubAddressField
      write SetHyperlinkSubAddressField;
  end;

implementation

uses
  ClipBrd,
//  IQMS.WebVcl.HyperLinkDialog.pas,
//  iqfile,
//  iqinqry,
//  iqmesg,
//  iqmisc,
  IQMS.Web.MicrosoftWord,
  IQMS.Web.MicrosoftWord.Interop,
  StrUtils,
  IQMS.WebVcl.ResourceStrings;

{$REGION 'TIQWebHyperlink'}
{ TIQWebHyperlink }

class function TIQWebHyperlink.ExecuteLink(const AHyperlinkAddress,
  AHyperlinkSubAddress: string): Boolean;
begin
  with TIQWebHyperlink.Create(nil) do
    try
      HyperlinkAddress := AHyperlinkAddress;
      HyperlinkSubAddress := AHyperlinkSubAddress;
      Execute;
    finally
      Free;
    end;
end;

function TIQWebHyperlink.Execute: Boolean;
begin
  ProcExecuteLink(HyperlinkAddress, HyperlinkSubAddress);
end;

function TIQWebHyperlink.ProcExecuteLink(const AHyperlinkAddress,
  AHyperlinkSubAddress: string): Boolean;
var
  AExt, AAddress, AParams: string;
begin
  Result := False;
  AExt := ExtractFileExt(AHyperlinkAddress);
  AAddress := AHyperlinkAddress;
  AParams := AHyperlinkSubAddress;
  // local html file
  if (Pos('http:', AHyperlinkAddress) = 0) and
    ((CompareText(AExt, '.htm') = 0) or (CompareText(AExt, '.html') = 0)) then
    begin
      if AHyperlinkSubAddress > ' ' then
        begin
          if StrUtils.LeftStr(AHyperlinkSubAddress, 1) <> '#' then
            AParams := '#' + AHyperlinkSubAddress;
          AAddress := StrUtils.ReplaceStr(AHyperlinkAddress, '\', '/');
          Result := ShellExec('file:///' + AAddress + AParams);
        end
      else
        Result := ShellExec('file:///' + AHyperlinkAddress)
    end
    // Internet URL
  else if (Pos('http:', AHyperlinkAddress) > 0) or
    (Pos('https:', AHyperlinkAddress) > 0) then
    begin
      if AHyperlinkSubAddress > ' ' then
        begin
          if LeftStr(AHyperlinkSubAddress, 1) <> '#' then
            AParams := '#' + AHyperlinkSubAddress;
          Result := ShellExec(AHyperlinkAddress + AParams);
        end
      else
        Result := ShellExec(AHyperlinkAddress);
    end
    // Local chm file
  else if (CompareText(AExt, '.chm') = 0) and
    (Pos('http:', AHyperlinkAddress) = 0) then
    begin
      if AHyperlinkSubAddress > '' then
        begin
          if LeftStr(AHyperlinkSubAddress, 1) <> '#' then
            AParams := '#' + AHyperlinkSubAddress;
          AAddress := StrUtils.ReplaceStr(AHyperlinkAddress, '\', '/');
          Result := ShellExec('file:///' + AAddress + AParams);
        end
      else
        Result := ShellExec('file:///' + AHyperlinkAddress);
    end
    { Microsoft }
  else
    begin
      // Special handler for Microsoft applications.  If this function
      // returns false, that means the application has no special handler
      // and just needs to be opened in the usual way.
      Result := TryExecuteMSApp(AHyperlinkAddress, AHyperlinkSubAddress);
      if not Result then
        Result := ShellExec(AHyperlinkAddress);
    end;
end;

class function TIQWebHyperlink.FormatLink(const AHyperlinkAddress,
  AHyperlinkSubAddress: string): string;
var
  AExt, AAddress, AParams: string;
begin
  Result := '';
  AExt := ExtractFileExt(AHyperlinkAddress);
  AAddress := AHyperlinkAddress;
  AParams := AHyperlinkSubAddress;
  if FileExists(AHyperlinkAddress) then
    Result := AHyperlinkAddress
  // local html file
  else if (Pos('http:', AHyperlinkAddress) = 0) and
    ((CompareText(AExt, '.htm') = 0) or (CompareText(AExt, '.html') = 0)) then
    begin
      if AHyperlinkSubAddress > ' ' then
        begin
          if StrUtils.LeftStr(AHyperlinkSubAddress, 1) <> '#' then
            AParams := '#' + AHyperlinkSubAddress;
          AAddress := StrUtils.ReplaceStr(AHyperlinkAddress, '\', '/');
          Result := 'file:///' + AAddress + AParams;
        end
      else
        Result := 'file:///' + AHyperlinkAddress;
    end
    // Internet URL
  else if (Pos('http:', AHyperlinkAddress) > 0) or
    (Pos('https:', AHyperlinkAddress) > 0) then
    begin
      if AHyperlinkSubAddress > ' ' then
        begin
          if LeftStr(AHyperlinkSubAddress, 1) <> '#' then
            AParams := '#' + AHyperlinkSubAddress;
          Result := AHyperlinkAddress + AParams;
        end
      else
        Result := AHyperlinkAddress;
    end
    // Local chm file
  else if (CompareText(AExt, '.chm') = 0) and
    (Pos('http:', AHyperlinkAddress) = 0) then
    begin
      if AHyperlinkSubAddress > '' then
        begin
          if LeftStr(AHyperlinkSubAddress, 1) <> '#' then
            AParams := '#' + AHyperlinkSubAddress;
          AAddress := StrUtils.ReplaceStr(AHyperlinkAddress, '\', '/');
          Result := 'file:///' + AAddress + AParams;
        end
      else
        Result := 'file:///' + AHyperlinkAddress;
    end
  else
    Result := AHyperlinkAddress;
end;

function TIQWebHyperlink.ShellExec(const AFileName: String;
  const AParams: string): Boolean;
var
  ShellExecuteInfo: TShellExecuteInfoA;
begin
  FillChar(ShellExecuteInfo, SizeOf(TShellExecuteInfo), 0);
  with ShellExecuteInfo do
    begin
      cbSize := SizeOf(TShellExecuteInfoA);
      Wnd := Application.MainForm.Handle;
      lpFile := PAnsiChar(AnsiString(AFileName));
      lpParameters := PAnsiChar(AParams);
      nShow := SW_SHOWDEFAULT;
    end;
  Result := ShellExecuteExA(@ShellExecuteInfo);
end;

function TIQWebHyperlink.TryExecuteMSApp(AFileName, AParams: String): Boolean;
var
  AExt: string;
begin
  AExt := ExtractFileExt(AFileName);
  // Microsoft Word Document
  if (CompareText(AExt, '.doc') = 0) or
   (CompareText(AExt, '.docx') = 0) or
   (CompareText(AExt, '.docm') = 0) then
    Result := JumpToMSWordDoc(AFileName, AParams)
    // Microsoft Powerpoint Presentation
  else if (CompareText(AExt, '.ppt') = 0) or
   (CompareText(AExt, '.pptx') = 0) or
   (CompareText(AExt, '.pptm') = 0) then
    Result := OpenMSPowerPointPresentation(AFileName, AParams)
  else
    Result := False;
end;

function TIQWebHyperlink.TryCreateOLEObject(const AObjectName: String;
  var AppObject: OLEVariant): Boolean;
begin
  try
    try
      AppObject := GetActiveOleObject(AObjectName);
      Result := True;
    except
      AppObject := CreateOleObject(AObjectName);
    end;
  except
    Result := False;
  end;
  Result := not System.Variants.VarIsNull(AppObject);
end;

function TIQWebHyperlink.JumpToMSWordDoc(AFileName, ABookMark: String): Boolean;
var
  AApp: OLEVariant;
  MicrosoftWord: IMicrosoftWord;
begin
  Result := False;
  if FileExists(AFileName) then
    begin
      // If there is no bookmark to locate, just open the file in the
      // usual way.
      if (ABookMark = '') then
        ShellExec(AFileName)
      else
        // If there is a bookmark, then we need to use DCOM.
        begin
          MicrosoftWord := TMicrosoftWordInterop.Create;
          if MicrosoftWord.Connect then
            begin
              MicrosoftWord.Application.ChangeFileOpenDirectory(ExtractFilePath(AFileName));
              MicrosoftWord.OpenDocument(AFileName, False);
              if Trim(ABookMark) > ' ' then
                MicrosoftWord.Application.Selection.GoTo( - 1, , , ABookMark);
              Result := True;
            end;
        end;
      // If there is a bookmark, then we need to use DCOM.
{      else if TryCreateOLEObject(MS_WORD, AApp) then
        try
          AApp.ChangeFileOpenDirectory(ExtractFilePath(AFileName));
          AApp.Documents.Open(FileName := AFileName, AddToRecentFiles := True);
          if Trim(ABookMark) > ' ' then
            AApp.Selection.GoTo( - 1, , , ABookMark);
          Result := True;
        except
          Result := False;
        end;
}
    end;
end;

function TIQWebHyperlink.OpenMSPowerPointPresentation(AFileName,
  AParams: String): Boolean;
const
  MS_POWERPOINT = 'PowerPoint.Application';
var
  AApp: OLEVariant;
begin
  Result := False;
  if FileExists(AFileName) then
    begin
      if (AParams = '') then
        ShellExec(AFileName)
      else if TryCreateOLEObject(MS_POWERPOINT, AApp) then
        try
          if FileExists(AFileName) then
            begin
              AApp.Presentations.Open(FileName := AFileName, ReadOnly := 0);
              // ppViewSlide
              AApp.ActiveWindow.ViewType := 1;
              // ppShowTypeSpeaker
              AApp.ActivePresentation.SlideShowSettings.ShowType := 1;
              // msoFalse
              AApp.ActivePresentation.SlideShowSettings.LoopUntilStopped := 0;
              // msoTrue
              AApp.ActivePresentation.SlideShowSettings.
                ShowWithNarration := - 1;
              // msoTrue
              AApp.ActivePresentation.SlideShowSettings.
                ShowWithAnimation := - 1;
              // ppShowAll
              AApp.ActivePresentation.SlideShowSettings.RangeType := 1;
              // ppSlideShowUseSlideTimings
              AApp.ActivePresentation.SlideShowSettings.AdvanceMode := 2;
              // ppForeground
              AApp.ActivePresentation.SlideShowSettings.PointerColor.SchemeColor :=
                2;
              AApp.ActivePresentation.SlideShowSettings.Run;
            end;
          Result := True;
        except
          Result := False;
        end;
    end;
end;

{$ENDREGION 'TIQWebHyperlink'}

{$REGION 'TIQWebHyperlinkComboDlg'}

{ TIQWebHyperlinkComboDlg }

constructor TIQWebHyperlinkComboDlg.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);

  // ControlStyle := ControlStyle + [csNoStdEvents];

  // Default property values
  // DataField := 'HYPERLINK';
  // HyperlinkAddressField := 'HYPERLINKADDRESS';
  // HyperlinkSubAddressField := 'HYPERLINKSUBADDRESS';

  FInternalPopupMenu := TPopupMenu.Create(Self);
  FInternalPopupMenu.OnPopup := DoOnPopup;

  // IQMS.WebVcl.ResourceStrings.cTXT0000466 = 'Open';
  FOpenHyperlink1 := TMenuItem.Create(FInternalPopupMenu);
  FOpenHyperlink1.Caption := IQMS.WebVcl.ResourceStrings.cTXT0000466;
  FOpenHyperlink1.OnClick := DoOpenHyperlinkClick;
  FInternalPopupMenu.Items.Add(FOpenHyperlink1);
  FOpenHyperlink1.Default := True;

  FEditHyperlink1 := TMenuItem.Create(FInternalPopupMenu);
  // IQMS.WebVcl.ResourceStrings.cTXT0000467 = 'Edit';
  FEditHyperlink1.Caption := IQMS.WebVcl.ResourceStrings.cTXT0000467;
  FEditHyperlink1.OnClick := DoEditHyperlinkClick;
  FInternalPopupMenu.Items.Add(FEditHyperlink1);

  FRenameHyperlink1 := TMenuItem.Create(FInternalPopupMenu);
  // IQMS.WebVcl.ResourceStrings.cTXT0000468 = 'Rename';
  FRenameHyperlink1.Caption := IQMS.WebVcl.ResourceStrings.cTXT0000468;
  FRenameHyperlink1.OnClick := DoRenameHyperlinkClick;
  FInternalPopupMenu.Items.Add(FRenameHyperlink1);

  FRemoveLink1 := TMenuItem.Create(FInternalPopupMenu);
  // IQMS.WebVcl.ResourceStrings.cTXT0000469 = 'Remove';
  FRemoveLink1.Caption := IQMS.WebVcl.ResourceStrings.cTXT0000469;
  FRemoveLink1.OnClick := DoRemoveLinkClick;
  FInternalPopupMenu.Items.Add(FRemoveLink1);

  // Break
  FN1 := TMenuItem.Create(FInternalPopupMenu);
  FN1.Caption := '-';
  FInternalPopupMenu.Items.Add(FN1);

  // IQMS.WebVcl.ResourceStrings.cTXT0000475 = 'Copy Link Address';
  FCopyTarget1 := TMenuItem.Create(FInternalPopupMenu);
  FCopyTarget1.Caption := IQMS.WebVcl.ResourceStrings.cTXT0000475;
  FCopyTarget1.OnClick := DoCopyTargetClick;
  FInternalPopupMenu.Items.Add(FCopyTarget1);

  Width := 200;
  ShowButton := True;
  ShowHint := True;
  StyleElements := StyleElements - [seFont];
  PopupMenu := FInternalPopupMenu;
  OnClick := DoOpenHyperlinkClick;
//  OnCustomDlg := DoEditHyperlinkClick;
  OnKeyDown := DoKeyDown;
  OnKeyPress := DoKeyPress;
  OnDblClick := DoDblClick;
end;

procedure TIQWebHyperlinkComboDlg.CreateWindowHandle(const Params: TCreateParams);
begin
  inherited CreateWindowHandle(Params);

  Initialize;
end;

procedure TIQWebHyperlinkComboDlg.Loaded;
begin
  inherited;
  Font.Color := clHotlight;
end;

procedure TIQWebHyperlinkComboDlg.Initialize;
begin
  if not (csDesigning in ComponentState) then
    DragAcceptFiles(Self.Handle, True);
  if Parent <> nil then
    Font.Color := clHotlight;
end;

function TIQWebHyperlinkComboDlg.CheckComponentState: Boolean;
begin
  // Returns "False" if the component should not continue processing
  Result := not ((csLoading in ComponentState) or
    (csDestroying in ComponentState) or
    (csFixups in ComponentState) or
    (csDesigning in ComponentState));
end;

function TIQWebHyperlinkComboDlg.CheckConnected: Boolean;
begin
  Result := False;
//  Result := not (csLoading in ComponentState) and
//    iqmisc.EnsureConnectionExists and (DataSet <> nil);
end;

procedure TIQWebHyperlinkComboDlg.CMMouseEnter(var Message: TMessage);
begin
  if not CheckComponentState then
    Exit;
  Font.Style := Font.Style + [fsUnderLine];
  Font.Color := clHotlight;
  if HyperlinkValue > '' then
    Cursor := crHandPoint;

  Hint := HyperlinkAddressValue;
end;

procedure TIQWebHyperlinkComboDlg.CMMouseLeave(var Message: TMessage);
begin
  if not CheckComponentState then
    Exit;
  Font.Color := clHotlight;
  Font.Style := Font.Style - [fsUnderLine];
  Cursor := crDefault;
end;

procedure TIQWebHyperlinkComboDlg.WMDROPFILES(var Msg: TMessage);
var
  i, ACount, ASize: Integer;
  PName: PChar;
  AFileName: String;
  AHyperlink, AHyperlinkAddress, AHyperlinkSubAddress: TField;
begin
  if not Enabled or ReadOnly then
    Exit;

  if not GetHyperlinkFields(AHyperlink, AHyperlinkAddress,
    AHyperlinkSubAddress) then
    Exit;

  // This method enables drag and drop with the Windows Explorer
  inherited;

  ACount := DragQueryFile(Msg.WParam, $FFFFFFFF, PName, 255);

  for i := 0 to (ACount - 1) do
    begin
      ASize := DragQueryFile(Msg.WParam, i, nil, 0) + 1;
      PName := StrAlloc(ASize);
      DragQueryFile(Msg.WParam, i, PName, ASize);
      AFileName := StrPas(PName);

      if not (DataSet.State in [dsEdit, dsInsert]) then
        DataSet.Edit;

      AHyperlink.AsString := AFileName;
      AHyperlinkAddress.AsString := AFileName;
      AHyperlinkSubAddress.AsString := '';

      StrDispose(PName);

      Break;
    end;

  DragFinish(Msg.WParam);

end;

function TIQWebHyperlinkComboDlg.DataSet: TDataSet;
begin
  Result := nil;
  if Assigned(DataSource) and Assigned(DataSource.DataSet) then
    Result := DataSource.DataSet;
end;

function TIQWebHyperlinkComboDlg.DataSetFieldValue(
  const AFieldName: string): string;
begin
  Result := '';
  if (DataSet <> nil) and (DataSet.FindField(AFieldName) <> nil) then
    Result := DataSet.FindField(AFieldName).AsString;
end;

function TIQWebHyperlinkComboDlg.GetHyperlinkFields(var AHyperlink,
  AHyperlinkAddress, AHyperlinkSubAddress: TField): Boolean;
begin
  AHyperlink := nil;
  AHyperlinkAddress := nil;
  AHyperlinkSubAddress := nil;
  Result := (DataSet <> nil);
  if Result then
    begin
      AHyperlink := DataSet.FindField(DataField);
      AHyperlinkAddress := DataSet.FindField(FHyperlinkAddressField);
      AHyperlinkSubAddress := DataSet.FindField(FHyperlinkSubAddressField);
      Result := Assigned(AHyperlink) and Assigned(AHyperlinkAddress);
    end;
end;

function TIQWebHyperlinkComboDlg.GetHyperlinkValues(var AHyperlink,
  AHyperlinkAddress, AHyperlinkSubAddress: string): Boolean;
begin
  AHyperlink := '';
  AHyperlinkAddress := '';
  AHyperlinkSubAddress := '';
  Result := (DataSet <> nil);
  if Result then
    begin
      AHyperlink := DataSetFieldValue(DataField);
      AHyperlinkAddress := DataSetFieldValue(FHyperlinkAddressField);
      AHyperlinkSubAddress := DataSetFieldValue(FHyperlinkSubAddressField);
    end;
end;

procedure TIQWebHyperlinkComboDlg.DoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key <> VK_LEFT) and
    (Key <> VK_RIGHT) and
    (Key <> VK_UP) and
    (Key <> VK_DOWN) then
    Key := 0;
end;

procedure TIQWebHyperlinkComboDlg.DoKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TIQWebHyperlinkComboDlg.DoOnPopup(Sender: TObject);
begin
  FOpenHyperlink1.Enabled := Enabled;
  FEditHyperlink1.Enabled := Enabled and not ReadOnly;
  FRenameHyperlink1.Enabled := Enabled and not ReadOnly;
  FRemoveLink1.Enabled := Enabled and not ReadOnly;
  FCopyTarget1.Enabled := Enabled;
end;

procedure TIQWebHyperlinkComboDlg.DoEditHyperlinkClick(Sender: TObject);
var
  AHyperlink, AHyperlinkAddress, AHyperlinkSubAddress: TField;
begin
  if not Enabled or ReadOnly then
    Exit;

  if not GetHyperlinkFields(AHyperlink, AHyperlinkAddress,
    AHyperlinkSubAddress) then
    Exit;

//  with TIQWebHyperDlg.Create(nil) do
//    try
//      ShowTextToDisplay := True;
//      ShowSubAddress := ShowSubAddress and Assigned(AHyperlinkSubAddress);
//
//      with DataSet do
//        begin
//          // Initial values when dlg opens
//          HyperLink := AHyperlink.AsString;
//          HyperlinkAddress := AHyperlinkAddress.AsString;
//          if Assigned(AHyperlinkSubAddress) then
//            HyperlinkSubAddress := AHyperlinkSubAddress.AsString;
//
//          if Execute then
//            begin
//              // Is it a local file
//              // IQMS.WebVcl.ResourceStrings.cTXT0000470 =
//              // 'The selected file, %s, is a local file and will not be ' +
//              // 'accessible to network users.  Do you still wish to attach the file?';
//              if iqfile.IsLocalFile(HyperlinkAddress) and
//                not IQWarningYNChk(Format(IQMS.WebVcl.ResourceStrings.cTXT0000470,
//                [HyperlinkAddress]), 'Attach Local File') then
//                Exit;
//
//              // Put dataset in edit mode
//              if not (State in [dsInsert, dsEdit]) then
//                Edit;
//
//              if Trim(HyperLink) = '' then
//                HyperLink := HyperlinkAddress;
//
//              // Set the values from the dlg
//              AHyperlink.AsString := HyperLink;
//              AHyperlinkAddress.AsString := HyperlinkAddress;
//              if Assigned(AHyperlinkSubAddress) then
//                AHyperlinkSubAddress.AsString := HyperlinkSubAddress;
//            end;
//        end;
//    finally
//      Free;
//    end;
end;

procedure TIQWebHyperlinkComboDlg.DoOpenHyperlinkClick(Sender: TObject);
var
  AHyperlink, AHyperlinkAddress, AHyperlinkSubAddress: string;
begin
  if not Enabled then
    Exit;
  // To execute a hyperlink, both the display value and the address must
  // be available.  HYPERLINK is the display text. HYPERLINKADDRESS is
  // the actual address to execute.
  if not GetHyperlinkValues(AHyperlink, AHyperlinkAddress,
    AHyperlinkSubAddress) or (AHyperlink = '') then
    Exit;
  // Display a friendly message if no link is available
  if (AHyperlinkAddress = '') then
    begin
      // IQMS.WebVcl.ResourceStrings.cTXT0000471 =
      // 'The link has either been broken or no longer exists.  ' +
      // 'Please verify the link.';
//      iqmesg.IQError(IQMS.WebVcl.ResourceStrings.cTXT0000471);
      Exit;
    end;
  TIQWebHyperlink.ExecuteLink(AHyperlinkAddress, AHyperlinkSubAddress);
end;

procedure TIQWebHyperlinkComboDlg.DoRemoveLinkClick(Sender: TObject);
var
  AHyperlink, AHyperlinkAddress, AHyperlinkSubAddress: TField;
begin
  if not Enabled or ReadOnly then
    Exit;

  if not GetHyperlinkFields(AHyperlink, AHyperlinkAddress,
    AHyperlinkSubAddress) then
    Exit;

  // IQMS.WebVcl.ResourceStrings.cTXT0000472 = 'Remove link?';
//  if iqmesg.IQConfirmYN(IQMS.WebVcl.ResourceStrings.cTXT0000472) then
//    begin
//      with DataSet do
//        begin
//          if not (State in [dsInsert, dsEdit]) then
//            Edit;
//          AHyperlink.Clear;
//          AHyperlinkAddress.Clear;
//          if Assigned(AHyperlinkSubAddress) then
//            AHyperlinkSubAddress.Clear;
//        end;
//    end;
end;

procedure TIQWebHyperlinkComboDlg.DoRenameHyperlinkClick(Sender: TObject);
var
  AHyperlink, AHyperlinkAddress, AHyperlinkSubAddress: TField;
  AValue: string;
begin
  if not Enabled or ReadOnly then
    Exit;

  if not GetHyperlinkFields(AHyperlink, AHyperlinkAddress,
    AHyperlinkSubAddress) then
    Exit;

  with DataSet do
    begin
      AValue := AHyperlink.AsString;
      // IQMS.WebVcl.ResourceStrings.cTXT0000473 = 'Rename Hyperlink';
      // IQMS.WebVcl.ResourceStrings.cTXT0000474 = 'Enter new name:';
//      if iqinqry.IQInputQuery(IQMS.WebVcl.ResourceStrings.cTXT0000473, IQMS.WebVcl.ResourceStrings.cTXT0000474,
//        AValue) then
//        begin
//          if not (State in [dsInsert, dsEdit]) then
//            Edit;
//          AHyperlink.AsString := AValue;
//        end;
    end;
end;

procedure TIQWebHyperlinkComboDlg.DoCopyTargetClick(Sender: TObject);
begin
  if Enabled then
    Clipboard.AsText := HyperlinkAddressValue;
end;

procedure TIQWebHyperlinkComboDlg.DoDblClick(Sender: TObject);
begin
  System.SysUtils.Abort;
end;

function TIQWebHyperlinkComboDlg.HyperlinkAddressValue: string;
var
  AHyperlink, AHyperlinkAddress, AHyperlinkSubAddress: string;
begin
  // To execute a hyperlink, both the display value and the address must
  // be available.  HYPERLINK is the display text. HYPERLINKADDRESS is
  // the actual address to execute.
  if GetHyperlinkValues(AHyperlink, AHyperlinkAddress,
    AHyperlinkSubAddress) or (AHyperlink = '') then
    Result := TIQWebHyperlink.FormatLink(AHyperlinkAddress, AHyperlinkSubAddress);
end;

function TIQWebHyperlinkComboDlg.HyperlinkValue: string;
begin
  Result := Trim(Self.Text);
end;

function TIQWebHyperlinkComboDlg.GetDataSource: TDataSource;
begin
//  Result := TwwDBComboDlg(Self).DataSource;
end;

procedure TIQWebHyperlinkComboDlg.SetDataSource(const Value: TDataSource);
begin
//  TwwDBComboDlg(Self).DataSource := Value;

  if (DataSet <> nil) then
    begin
      if (DataSet.FindField('HYPERLINK') <> nil) then
        DataField := 'HYPERLINK';
      if (DataSet.FindField('HYPERLINKADDRESS') <> nil) then
        HyperlinkAddressField := 'HYPERLINKADDRESS';
      if (DataSet.FindField('HYPERLINKSUBADDRESS') <> nil) then
        HyperlinkSubAddressField := 'HYPERLINKSUBADDRESS';
    end;
end;

procedure TIQWebHyperlinkComboDlg.SetHyperlinkAddressField(const Value: string);
begin
  FHyperlinkAddressField := UpperCase(Value);
end;

procedure TIQWebHyperlinkComboDlg.SetHyperlinkSubAddressField(const Value: string);
begin
  FHyperlinkSubAddressField := UpperCase(Value);
end;

function TIQWebHyperlinkComboDlg.GetReadOnly: Boolean;
begin
  Result := False;
//  Result := DataLink.ReadOnly;
end;

procedure TIQWebHyperlinkComboDlg.SetReadOnly(const Value: Boolean);
begin
//  DataLink.ReadOnly := Value;
//  if ((Value=False) or (DataLink.DataSet=nil)) and not (csLoading in ComponentState) then
//     inherited ReadOnly := Value;
//
//  TwwDBComboDlg(Self).ShowButton := not ReadOnly;
end;

{$ENDREGION 'TIQWebHyperlinkComboDlg'}

end.
