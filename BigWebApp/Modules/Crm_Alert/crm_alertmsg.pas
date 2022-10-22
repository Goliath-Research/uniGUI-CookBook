unit crm_alertmsg;

{ Special message box used for displaying CRM Alerts }

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.StdCtrls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.FileCtrl,
  Vcl.Buttons,
  Vcl.Menus,
  IQMS.Common.JumpConstants,
  Vcl.Graphics,
  Vcl.Controls,
  IQMS.Common.RichEditHelper,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel,
  uniImage,
  uniHTMLMemo, uniHTMLFrame, uniMemo;

type
  TFrmCrmMessage = class(TUniForm)
    Panel3: TUniPanel;
    btnOk: TUniBitBtn;
    PMain: TUniPopupMenu;
    CopyMessagetoClipboard1: TUniMenuItem;
    SaveMessagetoFile1: TUniMenuItem;
    SaveDialog: TSaveDialog;
    N1: TUniMenuItem;
    HelpContents1: TUniMenuItem;
    PnlCarrier: TUniPanel;
    PnlClient: TUniPanel;
    PnlCaption: TUniPanel;
    lblTitle: TUniLabel;
    PnlImage: TUniPanel;
    Image: TUniImage;
    UniHTMLFrame1: TUniHTMLFrame;
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CopyMessagetoClipboard1Click(Sender: TObject);
    procedure SaveMessagetoFile1Click(Sender: TObject);
    procedure HelpContents1Click(Sender: TObject);
    procedure PnlClientMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FTitle: string;
    FMessage: string;
    rtfMessage: TUniHtmlMemo;
    procedure IQAfterShowMessage(var Msg: TMessage);
      message iq_AfterShowMessage;
    // procedure SaveMessageToRTF;
  public
    { Public declarations }
//    constructor Create(AOwner: TComponent; AFormCaption,
//      ATitle, AMessage: String);
  end;

  // See Dialog Style constants above.  They simply assign the glyph.
procedure ShowAlertMessage( AFormCaption,
  ATitle, AMessage: String);

var
  FrmCrmMessage: TFrmCrmMessage;

implementation

{$R *.DFM}


uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;

procedure ShowAlertMessage( AFormCaption, ATitle,
  AMessage: String);
  var
    FrmCrmMessage: TFrmCrmMessage;
begin

  FrmCrmMessage:=TFrmCrmMessage.Create(uniGUIApplication.UniApplication);
  with FrmCrmMessage do
  begin
      rtfMessage := TUniHTMLMemo.Create(FrmCrmMessage);
      rtfMessage.Parent := PnlClient;
      rtfMessage.Align := alClient;
      rtfMessage.ShowToolbar := False;

      //rtfMessage.ScrollBars.ssVertical;
      //rtfMessage.WantReturns := True;
      //rtfMessage.PlainText := True;
      //rtfMessage.PopupMenu := PMain;
      rtfMessage.BorderStyle := ubsNone;
      //rtfMessage.HideSelection := False;
      rtfMessage.ReadOnly := True;
      rtfMessage.WordWrap := True;
      // Store original strings in private fields
      FTitle := ATitle;
      FMessage := AMessage;
      // Set the form caption, as requested
      Caption := AFormCaption;
      // Set the title.  Since this is a TLabel control, we need to
      // fix the ampersands.
      lblTitle.Caption := StrTran(ATitle, '&', '&&');
      lblTitle.Visible := Trim(ATitle) > ''; // 04/17/2009
      if not lblTitle.Visible then
        PnlCaption.Height := Image.Top;
      // Set the message text
      rtfMessage.Clear;
      rtfMessage.Text := AMessage ;
      //PostMessage(Handle, iq_AfterShowMessage, 0, 0);
  end;
  FrmCrmMessage.ShowModal;

end;

{ TFrmCrmMessage }


procedure TFrmCrmMessage.FormShow(Sender: TObject);
begin
  //Beep;

  with PnlCarrier do
    begin
      ParentBackground := False;
      ParentBackground := True;
      ParentBackground := False;
    end;
end;

procedure TFrmCrmMessage.FormActivate(Sender: TObject);
begin
  Update;
end;

procedure TFrmCrmMessage.CopyMessagetoClipboard1Click(Sender: TObject);
var
  ALines: TStringList;
begin
  ALines := TStringList.Create;
  try
    ALines.Add(FTitle);
    ALines.Add(FMessage);
    IQMS.Common.StringUtils.CopyStrToClipbrd(ALines.Text);
  finally
    if Assigned(ALines) then
      FreeAndNil(ALines);
  end;
end;

procedure TFrmCrmMessage.SaveMessagetoFile1Click(Sender: TObject);
var
  ADir: String;
  ALines: TStringList;
begin
//  with SaveDialog do
//    try
//      ALines := TStringList.Create;
//      IQRegStringScalarRead(Self, 'Save Directory', ADir); // IQMS.Common.RegFrm.pas
//      if DirectoryExists(ADir) then
//        InitialDir := ADir;
//
//      if Execute then
//        begin
//          ALines.Add(lblTitle.Caption);
//          ALines.AddStrings(rtfMessage.Lines);
//          ALines.SaveToFile(FileName);
//          IQRegStringScalarWrite(Self, 'Save Directory',
//            ExtractFilePath(FileName)); // IQMS.Common.RegFrm.pas
//        end;
//    finally
//      if Assigned(ALines) then
//        FreeAndNil(ALines);
//    end;
end;

procedure TFrmCrmMessage.HelpContents1Click(Sender: TObject);
begin
//  IQHelp.AssignHTMLFile(IQMS.Common.HelpHook.iqchmIQCRM, IQMS.Common.HelpHook.iqhtmIQCRM);
  // IQMS.Common.HelpHook.pas
 // IQHelp.HelpContext(Self.HelpContext);
end;

procedure TFrmCrmMessage.IQAfterShowMessage(var Msg: TMessage);
begin
  Self.BringToFront;
//  IQMS.Common.Controls.ForceForegroundWindowC(Self, []);
end;

procedure TFrmCrmMessage.PnlClientMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight  then
     PMain.Popup(X, Y);
end;

end.
