unit LgMsgMemoConf3Btn;

interface

uses
  Vcl.Controls,
  Vcl.Forms,
  LgMsgMemoConf,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn, uniTimer, uniMemo, uniHTMLMemo, uniSpeedButton, System.Classes,
  uniPanel;

type
  TFrmMsgMemoConfirm3Btn = class(TFrmMsgMemoConfirm)
    bbtnNo: TUniBitBtn;
    procedure btnYesClick(Sender: TObject);
    procedure bbtnNoClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor CreateParam(AMessage, ACaption: string);
  end;

function LrgMsgBoxMemoConfirm3Btn( AMessage, ACaption: string; ABtnCaptions: array of string ): TModalResult;

var
  FrmMsgMemoConfirm3Btn: TFrmMsgMemoConfirm3Btn;

implementation

{$R *.dfm}

function LrgMsgBoxMemoConfirm3Btn( AMessage, ACaption: string; ABtnCaptions: array of string ): TModalResult;
var
   frm :  TFrmMsgMemoConfirm3Btn;
begin
   frm := TFrmMsgMemoConfirm3Btn.CreateParam( AMessage, ACaption);
   with frm do
   begin
     bbtnNo.Caption    := ABtnCaptions[ 0 ];
     btnYes.Caption    := ABtnCaptions[ 1 ];
     bbtnCancel.Caption:= ABtnCaptions[ 2 ];
   end;
   Result := frm.ShowModal ;
end;

procedure TFrmMsgMemoConfirm3Btn.btnYesClick(Sender: TObject);
begin
  // inherited;
  ModalResult:= mrYes;
end;

constructor TFrmMsgMemoConfirm3Btn.CreateParam(AMessage, ACaption: string);
begin
 inherited CreateParam(AMessage,ACaption);
end;

procedure TFrmMsgMemoConfirm3Btn.bbtnNoClick(Sender: TObject);
begin
  // inherited;
  ModalResult:= mrNo;
end;

end.
