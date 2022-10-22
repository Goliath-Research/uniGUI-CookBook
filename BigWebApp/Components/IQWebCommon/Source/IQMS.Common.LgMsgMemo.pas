unit IQMS.Common.LgMsgMemo;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Classes,
  Vcl.Forms,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniTimer,
  UniHTMLMemo, uniMemo, Vcl.Controls;

type
  TFrmMsgMemo = class(TUniForm)
    Panel1: TUniPanel;
    Panel3: TUniPanel;
    btnYes: TUniBitBtn;
    Timer1: TUniTimer;
    Panel2: TUniPanel;
    sbtnScrollUp: TUniSpeedButton;
    sbtnScrollDown: TUniSpeedButton;
    Bevel1: TUniPanel;
    RichEdit1: TUniHTMLMemo;
    procedure Timer1Timer(Sender: TObject);
    procedure btnYesClick(Sender: TObject);
    procedure sbtnScrollUpClick(Sender: TObject);
    procedure sbtnScrollDownClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    function GetCaption: string;
    function GetMessage: string;
    procedure SetCaption(const Value: string);
    procedure SetMessage(const Value: string);
    { Private declarations }
  public
    { Public declarations }

    //constructor CreateParam(AMessage, ACaption: string);

    class function LrgMsgBoxMemo( AMessage, ACaption: string ): Boolean;
    class function LrgMsgBoxMemoModal( AMessage, ACaption: string ): Boolean;


    property  Msg : string read GetMessage write SetMessage;
    property  Cpt : string read GetCaption write SetCaption;

  end;

implementation

{$R *.DFM}

class function TFrmMsgMemo.LrgMsgBoxMemo( AMessage, ACaption: string ): Boolean;
var
  frm : TFrmMsgMemo;

begin
  frm     := TFrmMsgMemo.Create(uniGUIApplication.UniApplication);
  frm.Msg := AMessage;
  frm.Cpt := ACaption;
  frm.Show;

end;

class function TFrmMsgMemo.LrgMsgBoxMemoModal( AMessage, ACaption: string ): Boolean;
var
  frm : TFrmMsgMemo;

begin
  frm     := TFrmMsgMemo.Create(uniGUIApplication.UniApplication);
  frm.Msg := AMessage;
  frm.Cpt := ACaption;
  Result  := frm.ShowModal = mrOk;
end;


//constructor TFrmMsgMemo.CreateParam(AMessage,
//  ACaption: string);
//begin
//   inherited Create(uniGUIApplication.UniApplication);
//   msg := AMessage;
//   Cpt := ACaption;
//end;

function TFrmMsgMemo.GetCaption: string;
begin
   Result := Caption;
end;

function TFrmMsgMemo.GetMessage: string;
begin
  Result:=RichEdit1.Text;
end;

procedure TFrmMsgMemo.Timer1Timer(Sender: TObject);
begin
  Close;
end;

procedure TFrmMsgMemo.UniFormShow(Sender: TObject);
begin
   //WebFocus
   UniSession.AddJS('setTimeout(function(){'+ RichEdit1.JSName +'.focus()}, 100)');
end;

procedure TFrmMsgMemo.btnYesClick(Sender: TObject);
begin
  Close
end;

procedure TFrmMsgMemo.sbtnScrollUpClick(Sender: TObject);
begin
  keybd_event(VK_UP,0,0,0);
end;

procedure TFrmMsgMemo.SetCaption(const Value: string);
begin
  Caption:=Value;
end;

procedure TFrmMsgMemo.SetMessage(const Value: string);
begin
   RichEdit1.Text:=Value;
end;

procedure TFrmMsgMemo.sbtnScrollDownClick(Sender: TObject);
begin
  //SendMessage( RichEdit1.Handle, WM_VSCROLL, SB_LINEDOWN, 0);
  keybd_event(VK_DOWN,0,0,0);
end;

end.
