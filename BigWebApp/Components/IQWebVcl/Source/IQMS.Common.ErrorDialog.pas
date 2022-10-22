unit IQMS.Common.ErrorDialog;

(* IQ Error Dialog

  Purpose:
  Displays detailed error information for use in debugging.
  The text display allows users to save the message to a text
  file or copy it to the clipboard to be sent in an e-mail,
  thereby assisting support personnel in solving problems.

  Developer:
  Include at least a header and an error message. For the message
  to display properly (from a visual standpoint), both should be
  supplied. The detail information is optional.

*)

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtDlgs,
  Vcl.Menus,
  MaskUtils,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniMemo,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  UniImage,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ComCtrls, uniSpeedButton;

type
  TFrmStringError = class(TUniForm)
    Panel1: TUniPanel;
    PnlMain: TUniPanel;
    PnlLeft: TUniPanel;
    PnlRTF: TUniPanel;
    rtfDisplay: TUniMemo;
    imgError: TUniImage;
    Bevel1: TUniPanel;
    sbtnSaveToFile: TUniSpeedButton;
    sbtnSendAsMail: TUniSpeedButton;
    PnlModalButtons: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    btnCopyToClipboard: TUniButton;
    procedure DoSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DoOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DoSendMailClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    function GetFixedStr(const AValue: string): string;
    procedure UniFormCreate(Sender: TObject);
    private
      { Private declarations }
      FIsModal: Boolean;
      procedure AddSection(AHeader, AMessage: string);
      procedure AddLine(ACaption, AText: string);
      procedure DoSendAsMail;
      procedure AppendSystemInfo;
      procedure ShowHideCancelButton(AShow: Boolean);
    public
      procedure xCreate(AHeader, AError, ADetail: string);
      { Public declarations }
  end;

  // * Modal version
procedure ShowIQErrorMessage(AHeader, AError, ADetail: string; ADoAbort: Boolean = True );
// * Non-Modal version
procedure ShowIQErrorMessageA(AHeader, AError: string; ADetail: string = '');
// * Allow user to cancel a process (screen shows a Cancel button)
function ShowIQErrorMessageB(AHeader, AError: string; ADetail: string = '')
  : Boolean; // FALSE=User pressed Cancel button

resourcestring
  cTXTdtls = 'Details';


implementation

{$R *.DFM}

uses
  IQMS.Common.ApplicationSet,
  IQMS.Common.Boolean,
  IQMS.Common.Controls,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  Winapi.ShellAPI,
  IQMS.Common.COMShare;

procedure ShowIQErrorMessage(AHeader, AError, ADetail: string; ADoAbort: Boolean = True );
var
  FrmStringError: TFrmStringError;
begin
  if not IsConsole and not IsCGI then
  begin
    FrmStringError:= TFrmStringError.Create(uniGUIApplication.UniApplication);
    // show a modal error message
    with FrmStringError do
      try
        xCreate(AHeader, AError, ADetail);
        FIsModal := TRUE;
        ShowModal;
      finally
        if ADoAbort then
        Abort;
      end
  end
  else
    if ADoAbort then
    Abort;
end;

procedure ShowIQErrorMessageA(AHeader, AError, ADetail: string);
var
  FrmStringError: TFrmStringError;
begin
  if not IsConsole and not IsCGI then
   begin
    // Just show the error.  The calling application handles program execution (abort, etc.).

    FrmStringError:= TFrmStringError.Create(uniGUIApplication.UniApplication);
    with FrmStringError do
     begin
       xCreate(AHeader, AError, ADetail);
       Show;
     end;
   end;
end;

function ShowIQErrorMessageB(AHeader, AError: string;
  ADetail: string = ''): Boolean;
var
  FrmStringError: TFrmStringError;
begin
  if not IsConsole and not IsCGI then
  // show a modal error message
  begin
   FrmStringError:= TFrmStringError.Create(uniGUIApplication.UniApplication);
  with FrmStringError do
    begin
      xCreate(AHeader, AError, ADetail);
      FIsModal := TRUE;
      ShowHideCancelButton(TRUE); // show the Cancel button
      Result := ShowModal = mrOk;
    end;
  end;
end;

procedure TFrmStringError.DoSaveClick(Sender: TObject);
var
S : TStringStream;
begin
  S := TStringStream.Create(rtfDisplay.Lines.Text);
  try
    UniSession.SendStream(S, 'Error.txt');
  finally
    S.Free;
  end;
end;

procedure TFrmStringError.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmStringError.AddSection(AHeader, AMessage: string);
begin
  if (Trim(AHeader) = '') and (Trim(AMessage) = '') then
    Exit;
  with rtfDisplay do
    begin
      Font.Style := [fsBold];
      if Trim(AHeader) > '' then
        Lines.Add(Trim(AHeader));
      Font.Style := [];
      if Trim(AMessage) > '' then
        Lines.Add(Trim(AMessage));
      rtfDisplay.Lines.Add(''); // blank line
    end;
end;

procedure TFrmStringError.DoOkClick(Sender: TObject);
begin
  if FIsModal then
    ModalResult := mrOk
  else
    Close;
end;

procedure TFrmStringError.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_ESCAPE, VK_RETURN] then
    DoOkClick(nil);
end;

procedure TFrmStringError.DoSendMailClick(Sender: TObject);
begin
  DoSendAsMail;
end;

procedure TFrmStringError.DoSendAsMail;
var
  ABodyText, ALineText: string;
  AMailToText: PChar;
  i: Integer;
begin
  ABodyText := '';
  for i := 0 to rtfDisplay.Lines.Count - 1 do
    begin
      ALineText := rtfDisplay.Lines[i];
      while Pos(' ', ALineText) > 0 do
        ALineText := Copy(ALineText, 1, Pos(' ', ALineText) - 1) + '%20' +
          Copy(ALineText, Pos(' ', ALineText) + 1, Length(ALineText) - Pos(' ',
          ALineText));
      ABodyText := ABodyText + ALineText + '%0D%0A';
    end;
  AMailToText := PChar('mailto: ?subject= &Body=' + ABodyText);
//  ShellExecute(Handle, 'Open', AMailToText, nil, nil, SW_RESTORE);
end;

procedure TFrmStringError.AppendSystemInfo;

  function _MachineUser: string;
  var
    iSize: DWord;
    pC: PChar;
  begin
    iSize := 250;
    GetMem(pC, iSize);
    GetUserName(pC, iSize);
    Result := StrPas(pC);
    FreeMem(pC);
  end;

  function _MachineLanguage: string;
  var
    iSize: DWord;
    pC: PChar;
    i: Integer;
  begin
    iSize := 250;
    GetMem(pC, iSize);
    i := GetSystemDefaultLangID;
    VerLanguageName(i, pC, iSize);
    Result := StrPas(pC);
    FreeMem(pC);
  end;

  function _MachineTimeZone: string;
  var
    iZoneInfo: TTimeZoneInformation;
  begin
    GetTimeZoneInformation(iZoneInfo);
    Result := sIIf(iZoneInfo.DaylightName > '', iZoneInfo.DaylightName,
      iZoneInfo.StandardName);
  end;

  function _MachineRAM: string;
  var
    iMemStatus: TMemoryStatus;
  begin
    iMemStatus.dwLength := SizeOf(iMemStatus);
    GlobalmemoryStatus(iMemStatus);
    Result := FormatFloat('#,###', iMemStatus.dwTotalPhys / 1024) + ' KB RAM';
  end;

var
  S: string;
  iSysInf: TSystemInfo;
  sWinV, sWinPl: string;
begin
  rtfDisplay.Lines.Add(Repl('-', 50)); // IQMS.Common.StringUtils.pas
  rtfDisplay.Lines.Add('System Information');
  AddLine('Current date', FormatDateTime('ddddd tt', Now));
  AddLine('Computer Name', IQMS.Common.COMShare.IQGetComputerName);
  AddLine('User Name', _MachineUser);

  sWinV := Format('%d.%d.%d', [System.SysUtils.Win32MajorVersion,
    System.SysUtils.Win32MinorVersion, System.SysUtils.Win32BuildNumber]);
  case System.SysUtils.Win32Platform of
    VER_PLATFORM_WIN32s:
      sWinPl := 'Windows 3.1';
    VER_PLATFORM_WIN32_WINDOWS:
      sWinPl := 'Windows 95/98';
    VER_PLATFORM_WIN32_NT:
      sWinPl := 'Windows NT/2000/XP';
  end;
  AddLine('Windows Platform', sWinPl + ' ' + sWinV);

  GetSystemInfo(iSysInf);
  if iSysInf.wProcessorArchitecture = 0 then
    begin
      case iSysInf.wProcessorLevel of
        0 .. 2:
          S := 'Unsupported';
        3:
          S := 'Intel 80386';
        4:
          S := 'Intel 80486';
        5:
          S := 'Intel Pentium';
        6:
          begin
            case HIBYTE(iSysInf.wProcessorRevision) of
              1:
                S := 'Intel Pentium Pro';
              3, 5:
                S := 'Intel Pentium II';
              7, 8, 10, 11:
                S := 'Intel Pentium III';
            else
              S := 'Intel Pentium Class';
            end; // end case
          end;
        15:
          S := 'Intel Pentium IV';
      else
        S := 'Intel Pentium Class';
      end;

      AddLine('Processor Level', Format('%s (%d)',
        [S, iSysInf.dwProcessorType]));
      AddLine('Processors', IntToStr(iSysInf.dwNumberOfProcessors));
    end;
  AddLine('Memory', _MachineRAM);
  // granularity with which virtual memory is allocated
  AddLine('Virtual Memory (kb)',
    FloatToStr(iSysInf.dwAllocationGranularity / 1024));

  AddLine('Default Locale', _MachineLanguage);
  AddLine('Time Zone', _MachineTimeZone);
end;

procedure TFrmStringError.AddLine(ACaption, AText: string);
begin
  rtfDisplay.Lines.Add(Format('%s: %s', [ACaption, AText]));
end;

procedure TFrmStringError.FormShow(Sender: TObject);
begin
  MessageBeep(MB_ICONEXCLAMATION);
end;

procedure TFrmStringError.ShowHideCancelButton(AShow: Boolean);
const
  cBuffer = 5;
begin
  btnCancel.Visible := AShow;
  PnlModalButtons.Width := iIIF(AShow, btnOk.Width + btnCancel.Width +
    (cBuffer * 2), btnOk.Width + cBuffer);
end;

procedure TFrmStringError.UniFormCreate(Sender: TObject);
begin

  btnCopyToClipboard.ClientEvents.ExtEvents.Values['click']:='function click(sender, e, eOpts) '+
      ' { '+
      ' var textarea = document.getElementById("'+rtfDisplay.JSName+'_id-inputEl"); '+
      ' textarea.select(); '+
      ' try { '+
      ' var successful = document.execCommand(''copy''); '+
      ' if(successful) console.log(''Copied!''); '+
      ' else console.log(''Unable to copy!''); '+
      ' } catch (err) { '+
      ' console.log(''Unsupported Browser!''); '+
      ' } '+
      ' }';
end;

procedure TFrmStringError.btnCancelClick(Sender: TObject);
begin
  if FIsModal then
    ModalResult := mrCancel
  else
    Close;
end;

function TFrmStringError.GetFixedStr(const AValue: string): string;
begin
  // 12/03/2009 Added this line (Byron) because some error messages
  // generated by Oracle through DBExpress contain NULL (#0) characters
  // and cause a rich edit "line insertion error."
  Result := IQMS.Common.StringUtils.StrTran(Trim(AValue), #0, '');
end;

procedure TFrmStringError.xCreate(AHeader, AError, ADetail: string);
begin
  FIsModal := FALSE; // default

  // 11/15/2012
  // Set design-time Position to poDefaultPosOnly.  The owner
  // may sometimes be NIL.  If that is the case, the following
  // method will compensate.
//  IQMS.Common.Controls.CenterForm(Self, TRUE);

  // Load text
  rtfDisplay.Lines.Clear;
  AddSection(GetFixedStr(AHeader), GetFixedStr(AError));
  if Trim(ADetail) > '' then
    AddSection(cTXTdtls { 'Details' } , GetFixedStr(ADetail));

  // Add System information to the text
  // AppendSystemInfo;

  // NOTE: This feature is disabled for now
  // As long as we are under 1000 characters, we can send a mail msg via API.
//  SendMail1.Visible := FALSE; // Length(rtfDisplay.Text) < 1000;
  sbtnSendAsMail.Visible := FALSE;

  // By default, hide the Cancel button
  ShowHideCancelButton(FALSE); // hide the Cancel button
end;

end.
