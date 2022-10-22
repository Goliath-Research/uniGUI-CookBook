unit IQMS.Common.MsgConf;

interface

uses
  System.SysUtils,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  IQMS.Common.MsgFrm,
  uniGUIClasses,
  uniGUIApplication,
  uniButton,
  uniGUIBaseClasses,
  uniImageList,
  uniCheckBox,
  uniMemo,
  uniHTMLMemo,
  uniPanel,
  System.Classes ;

type
  TFrmShowConfirmStr = class(TFrmShowStr)
    btnCancel: TUniButton;
    procedure btnOKClick(Sender: TObject);
    private
      { Private declarations }
    public
      { Public declarations }
      class function IQShowConfirmStr(const AMesg: string;
        ACaption: string = 'Confirm'): Boolean;
      class function IQShowConfirmStrEx(const AMesg: string;
        ACaption: string = 'Confirm';
        ADlgType: TMsgDlgType = mtInformation): Boolean;
  end;



implementation

{$R *.DFM}

class function TFrmShowConfirmStr.IQShowConfirmStr(const AMesg: string;
  ACaption: string = 'Confirm'): Boolean;
var
  frm : TFrmShowConfirmStr;
begin
  frm := TFrmShowConfirmStr.Create(uniGUIApplication.UniApplication);

  frm.Caption     := ACaption;
  frm.MessageText := AMesg;
  Result := frm.ShowModal = mrOK;
end;

class function TFrmShowConfirmStr.IQShowConfirmStrEx(const AMesg: string;
  ACaption: string = 'Confirm';
  ADlgType: TMsgDlgType = mtInformation): Boolean;
var
  frm : TFrmShowConfirmStr;
begin
  frm := TFrmShowConfirmStr.Create(uniGUIApplication.UniApplication);

  frm.Caption     := ACaption;
  frm.MessageText := AMesg;
  frm.DlgType     := ADlgType;
  Result := frm.ShowModal = mrOK;
end;

procedure TFrmShowConfirmStr.btnOKClick(Sender: TObject);
begin
  // inherited;
  ModalResult := mrOK;
end;

end.
