unit crm_mail_preview;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  SHDocVw,
  Vcl.OleCtrls,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel,
  uniPageControl, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFrmCRMMassMailPreview = class(TUniForm)
    PnlDisplayArea: TUniPanel;
    pcMain: TUniPageControl;
    TabTEXT: TUniTabSheet;
    TabHTML: TUniTabSheet;
    StatusBar1: TUniStatusBar;
    PnlHeader: TUniPanel;
    txtSubject: TUniLabel;
    txtFrom: TUniLabel;
    PnlEMailBar02: TUniPanel;
    lblMailTo: TUniLabel;
    Bevel4: TUniPanel;
    txtTo: TUniLabel;
    PnlCarrier: TUniPanel;
    PnlWebBrowser: TUniPanel;
    WebBrowser: TWebBrowser;
    RichEdit: TRichEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure WebBrowserDocumentComplete(ASender: TObject;
      const pDisp: IDispatch; const URL: OleVariant);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FFrom: string;
    FRecipient: string;
    FSubject: string;
    FContentType: string;
    FBodyText: string;
    procedure SetStatus(S: string);
    procedure SetFrom(const Value: string);
    procedure SetRecipient(const Value: string);
    procedure SetSubject(const Value: string);
    procedure SetBodyText(const Value: string);
  public
    { Public declarations }
    property From: string read FFrom write SetFrom;
    property Recipient: string read FRecipient write SetRecipient;
    property Subject: string read FSubject write SetSubject;
    property ContentType: string read FContentType write FContentType;
    property BodyText: string read FBodyText write SetBodyText;
  end;

procedure DoCRMMassMailerPreviewEMail(AFrom, ATo,
  ASubject: string; AText: TStringList; AContentType: string);



implementation

{$R *.DFM}


uses
  crm_html,
  crm_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.RegFrm,
  IQMS.Common.Screen,
  IQMS.Common.StringUtils;

procedure DoCRMMassMailerPreviewEMail(AFrom, ATo, ASubject: string; AText: TStringList; AContentType: string);
var
  FrmCRMMassMailPreview: TFrmCRMMassMailPreview;
begin
  FrmCRMMassMailPreview := TFrmCRMMassMailPreview.Create(uniGUIApplication.uniApplication);
  with FrmCRMMassMailPreview do
  begin
    From := AFrom;
    Recipient := ATo;
    Subject := ASubject;
    ContentType := AContentType;
    if Assigned(AText) then
      BodyText := AText.Text;
    ShowModal;
  end;
end;

procedure TFrmCRMMassMailPreview.UniFormCreate(Sender: TObject);
var
  ABody: TStringList;
  S: string;
begin
  IQMS.Common.Screen.ApplySystemFont(Self);

  txtSubject.Font.Name := IQMS.Common.Screen.SystemFontName;
  txtFrom.Font.Name := IQMS.Common.Screen.SystemFontName;
  lblMailTo.Font.Name := IQMS.Common.Screen.SystemFontName;
  txtTo.Font.Name := IQMS.Common.Screen.SystemFontName;

  AdjustPageControlToParent(pcMain);

  pcMain.Visible := True;
end;

procedure TFrmCRMMassMailPreview.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self]);
end;

procedure TFrmCRMMassMailPreview.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self]);
end;

procedure TFrmCRMMassMailPreview.SetBodyText(const Value: string);
var
  ABody: TStringList;
begin
  FBodyText := Value;
  if CompareText(FContentType, 'TEXT/HTML') = 0 then
    begin
      ABody := TStringList.Create;
      try
        ABody.Text := Value;
        pcMain.ActivePageIndex := 1;
        SetStatus(crm_rscstr.cTXT0000536 { 'Opening page...' } );
        try
          LoadHTMLToWebBrowser(WebBrowser, ABody);
        finally
          SetStatus(crm_rscstr.cTXT0000089 { 'Done.' } );
        end;
        Application.ProcessMessages;
      finally
        if Assigned(ABody) then
          FreeAndNil(ABody);
      end;
    end
    // By default, load as 'TEXT/PLAIN'
  else
    begin
      pcMain.ActivePageIndex := 0;
      RichEdit.Lines.Clear;
      RichEdit.Lines.Text := Value;
      RichEdit.SelLength := 0;
      RichEdit.SelStart := 0;
    end;
end;

procedure TFrmCRMMassMailPreview.SetFrom(const Value: string);
begin
  FFrom := Value;
  txtFrom.Caption := Value;
end;

procedure TFrmCRMMassMailPreview.SetRecipient(const Value: string);
var
  S: string;
begin
  S := IQMS.Common.StringUtils.StrTran(Value, #10, '');
  S := IQMS.Common.StringUtils.StrTran(S, #13, ';');
  FRecipient := S;
  txtTo.Caption := FRecipient;
end;

procedure TFrmCRMMassMailPreview.SetStatus(S: string);
begin
  { TODO -oSanketG -cWebConvert : Need to find alternative property for SimpleText in TUniStatusBar }
  //StatusBar1.SimpleText := S;
  StatusBar1.Update;
end;

procedure TFrmCRMMassMailPreview.SetSubject(const Value: string);
begin
  FSubject := Value;
  txtSubject.Caption := Value;
end;

procedure TFrmCRMMassMailPreview.WebBrowserDocumentComplete(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
begin
  WebBrowser.OleObject.Document.Body.Style.BorderStyle := 'none';
end;

end.
