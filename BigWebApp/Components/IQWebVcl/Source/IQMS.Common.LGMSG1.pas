unit IQMS.Common.LGMSG1;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniTimer,
  uniLabel, Vcl.Controls;

type
  TFrmMsg1 = class(TUniForm)
    Panel1: TUniPanel;
    Panel3: TUniPanel;
    lblMessage: TUniLabel;
    btnYes: TUniBitBtn;
    Timer1: TUniTimer;
    procedure btnYesClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function GetMessage: string;
    procedure SetMessage(const Value: string);
    function GetCaption: string;
    procedure SetCaption(const Value: string);
    { Private declarations }

  public
    { Public declarations }
    property  Msg : string read GetMessage write SetMessage;
    property  Cpt : string read GetCaption write SetCaption;
  end;

function LrgMsgBox( AMessage: String; ACaption: String ): TFrmMsg1;
procedure LrgMsgBoxModal( AMessage: String; ACaption: String );
procedure LrgMsgBoxModal5sec( AMessage: String; ACaption: String );

var
  FrmMsg1: TFrmMsg1;

implementation

{$R *.DFM}

function LrgMsgBox( AMessage: String; ACaption: String ): TFrmMsg1;
var
  frm : TFrmMsg1;

begin
  frm     := TFrmMsg1.Create(uniGUIApplication.UniApplication);
  frm.Msg := AMessage;
  frm.Cpt := ACaption;
  frm.Show;
end;

procedure LrgMsgBoxModal( AMessage: String; ACaption: String );
var
  frm : TFrmMsg1;
begin
  frm     := TFrmMsg1.Create(uniGUIApplication.UniApplication);
  frm.Msg := AMessage;
  frm.Cpt := ACaption;
  frm.ShowModal;
end;

procedure LrgMsgBoxModal5sec( AMessage: String; ACaption: String );
var
  frm : TFrmMsg1;

begin
  frm     := TFrmMsg1.Create(uniGUIApplication.UniApplication);
  frm.Msg := AMessage;
  frm.Cpt := ACaption;
  frm.Timer1.Interval:=5000;
  frm.ShowModal;
end;

procedure TFrmMsg1.btnYesClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMsg1.Timer1Timer(Sender: TObject);
begin
  Close;
end;

procedure TFrmMsg1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

function TFrmMsg1.GetCaption: string;
begin
  Result := Caption;
end;

function TFrmMsg1.GetMessage: string;
begin
  Result := lblMessage.Caption;
end;

procedure TFrmMsg1.SetCaption(const Value: string);
begin
  if Value<>'' then
     Caption := Value;
end;

procedure TFrmMsg1.SetMessage(const Value: string);
begin
  lblMessage.Caption := Value;
end;

end.
