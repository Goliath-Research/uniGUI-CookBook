unit LgMsgMemoConf;

interface

uses
  System.SysUtils,
  Vcl.Controls,
  Vcl.Forms,
  LgMsgMemo,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn, uniTimer, uniMemo, uniHTMLMemo, uniSpeedButton, System.Classes,
  uniPanel;

type
  TFrmMsgMemoConfirm = class(TFrmMsgMemo)
    bbtnCancel: TUniBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor CreateParam(AMessage, ACaption: string);
    class function LrgMsgBoxMemoConfirm2( AMessage, ACaption: string ): Boolean;
    class function LrgMsgBoxMemoConfirm( AMessage, ACaption: string ): Boolean;
  end;

implementation

{$R *.DFM}

class function TFrmMsgMemoConfirm.LrgMsgBoxMemoConfirm2( AMessage, ACaption: string ): Boolean;
var
    frm : TFrmMsgMemoConfirm;
begin

    frm := TFrmMsgMemoConfirm.CreateParam(AMessage,ACaption);
    frm.ActiveControl := frm.bbtnCancel;
    Result := frm.ShowModal = mrok;
end;


class function TFrmMsgMemoConfirm.LrgMsgBoxMemoConfirm( AMessage, ACaption: string ): Boolean;
var
    frm : TFrmMsgMemoConfirm;
begin

    frm := TFrmMsgMemoConfirm.CreateParam(AMessage,ACaption);
    Result := frm.ShowModal = mrok;
end;

constructor TFrmMsgMemoConfirm.CreateParam(AMessage,ACaption: string);
begin
   inherited CreateParam(AMessage,ACaption);
end;

end.
