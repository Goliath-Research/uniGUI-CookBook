unit IQMS.Common.Splash;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Graphics,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication,
  uniGUIBaseClasses,
  uniLabel,
  uniImage, uniTimer;

type
  TIQWebSplash = class(TUniForm)
    imgBackground: TUniImage;
    lblCopyright: TUniLabel;
    lblApplicationName: TUniLabel;
    imgEnterpriseIQ: TUniImage;
    UniTimer1: TUniTimer;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure UniTimer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //constructor Create(AComponent: TComponent); override;
    class procedure DoCreate;
  end;

var
  IQSplash: TIQWebSplash;

implementation

{$R *.DFM}


uses
  IQMS.Common.Screen,
  IQMS.Common.ResStrings;

class procedure TIQWebSplash.DoCreate;
var
   frm : TIQWebSplash;
begin
   frm:= TIQWebSplash.Create(uniGUIApplication.UniApplication);
   frm.ShowModal;
end;


procedure TIQWebSplash.FormCreate(Sender: TObject);
begin
  //IQWeb.Common.Screen.ApplySystemFont(Self);
  // Application Title
  lblApplicationName.Caption := Application.Title;
  imgEnterpriseIQ.Visible := CompareText(Application.Title, 'EnterpriseIQ') = 0;
  lblApplicationName.Visible := not imgEnterpriseIQ.Visible;


  // IQMS.Common.ResStrings.cTXT0000240 = 'Copyright © 1989-%s IQMS.  All rights reserved.'
  // IQMS.Common.ResStrings.cTXT0000256 = 'IQMS applications are protected under United States and international copyright laws.'; // used on splash
  lblCopyright.Caption := Format(IQMS.Common.ResStrings.cTXT0000240,
    [FormatDateTime('yyyy', Date)]) + #13 +
    IQMS.Common.ResStrings.cTXT0000256;

  // Now adjust the Copyright label to fit
  lblCopyright.AutoSize := FALSE;
  // lblCopyright.Left := 16;
  lblCopyright.Width := ClientWidth - 40;
  lblCopyright.AutoSize := TRUE;
  // lblCopyright.Top := ClientHeight - (lblCopyright.Height + 16);

end;

procedure TIQWebSplash.FormActivate(Sender: TObject);
begin
  Update;
end;

procedure TIQWebSplash.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    begin
      Key := #0;
      ModalResult:=mrOk;
    end;
end;

procedure TIQWebSplash.UniTimer1Timer(Sender: TObject);
begin
  Close;
end;

end.
