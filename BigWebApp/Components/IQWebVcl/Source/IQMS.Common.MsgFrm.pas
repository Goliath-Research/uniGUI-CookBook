unit IQMS.Common.MsgFrm;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniImageList,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  UniHTMLMemo,
  uniButton, Vcl.StdCtrls, Vcl.ComCtrls, uniMemo;

type
  TFrmShowStr = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOK: TUniButton;
    ImageList1: TUniImageList;
    PnlDisplay: TUniPanel;
    RichEdit1: TUniHTMLMemo;
    chkCheckbox: TUniCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    private
      FDlgType: TMsgDlgType;
      function GetCheckBoxVisible: Boolean;
      procedure SetCheckBoxVisible(const Value: Boolean);
      function GetMessageText: string;
      procedure SetMessageText(const Value: string);
      function GetCheckBoxChecked: Boolean;
      procedure SetCheckBoxChecked(const Value: Boolean);
      function GetMsgDlgType: TMsgDlgType;
      procedure SetMsgDlgType(const Value: TMsgDlgType);
      { Private declarations }
    public
      { Public declarations }
      class procedure DoShowModal(const ACaption, AMesg: string;
            ADlgType: TMsgDlgType = mtInformation);
      property CheckBoxVisible: Boolean read GetCheckBoxVisible
        write SetCheckBoxVisible;
      property CheckBoxChecked: Boolean read GetCheckBoxChecked
        write SetCheckBoxChecked;
      property MessageText    : string read GetMessageText
        write SetMessageText;
      property DlgType        :TMsgDlgType read GetMsgDlgType
        write SetMsgDlgType default mtInformation;
  end;

procedure IQShowStr(const AMesg: string);
procedure IQShowStrModal(const AMesg: string);
procedure IQShowStringList(AMesg: TStringList);
procedure IQShowTxtFile(AFileName: string);

var
  FrmShowStr: TFrmShowStr;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.RegFrm;

procedure IQShowStr(const AMesg: string);
var
  frm : TFrmShowStr;
begin
  frm := TFrmShowStr.Create(uniGUIApplication.UniApplication);
  frm.MessageText := AMesg;
  frm.Show;
end;

procedure IQShowStrModal(const AMesg: string);
var
  frm : TFrmShowStr;
begin
  frm := TFrmShowStr.Create(uniGUIApplication.UniApplication);
  frm.MessageText := AMesg;
  frm.ShowModal;
end;

procedure IQShowStringList(AMesg: TStringList);
var
   frm : TFrmShowStr;
begin
  frm := TFrmShowStr.Create(uniGUIApplication.UniApplication);
  frm.MessageText := AMesg.ToString;
  with frm do
    begin
      RichEdit1.Font.Name := 'Courier New';
      // RichEdit1.Lines.Assign( AMesg );
      RichEdit1.Lines.Text := AMesg.Text; { faster }
      RichEdit1.ScrollBars := ssBoth;
      RichEdit1.WordWrap := FALSE;
      Show;
    end;
end;

procedure IQShowTxtFile(AFileName: string);
var
   frm : TFrmShowStr;
begin
  frm := TFrmShowStr.Create(uniGUIApplication.UniApplication);
  with frm do
    begin
      Caption := AFileName;
      RichEdit1.Font.Name := 'Courier New';
      RichEdit1.Lines.LoadFromFile(AFileName);
      RichEdit1.ScrollBars := ssBoth;
      RichEdit1.WordWrap := FALSE;
      Show;
    end;
end;


procedure TFrmShowStr.FormShow(Sender: TObject);
begin
  //iqctrl.CenterForm(self, True);
  //iqctrl.ResizeCheckBoxes(self, PnlButtons);
  RichEdit1.ParentFont := True;
end;

procedure TFrmShowStr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [chkCheckbox]);
  IQRegStringScalarWrite ( Self, 'Msg', MessageText );
  IQRegIntegerScalarWrite( Self, 'LastResult', Ord(Self.ModalResult) );
end;

class procedure TFrmShowStr.DoShowModal(const ACaption, AMesg: string;
  ADlgType: TMsgDlgType);
  var
    frm : TFrmShowStr;
begin
  frm :=  TFrmShowStr.Create(uniGUIApplication.UniApplication);
  frm.Caption     := ACaption;
  frm.MessageText := AMesg;
  frm.DlgType     := ADlgType;

  with frm.ImageList1 do
    case frm.DlgType of
      mtInformation:
        GetIcon(0, frm.Icon);
      mtWarning:
        GetIcon(1, frm.Icon);
      mtError:
        GetIcon(2, frm.Icon);
    else
      GetIcon(0, frm.Icon);
    end;
end;

procedure TFrmShowStr.btnOKClick(Sender: TObject);
begin
  Close;
end;

function TFrmShowStr.GetCheckBoxChecked: Boolean;
begin
  Result := chkCheckbox.Checked;
end;

procedure TFrmShowStr.SetCheckBoxChecked(const Value: Boolean);
begin
  chkCheckbox.Checked := Value;
end;

function TFrmShowStr.GetCheckBoxVisible: Boolean;
begin
  Result := chkCheckbox.Visible;
end;

procedure TFrmShowStr.SetCheckBoxVisible(const Value: Boolean);
begin
  chkCheckbox.Visible := Value;
end;

function TFrmShowStr.GetMessageText: string;
begin
  Result := RichEdit1.Text;
end;

function TFrmShowStr.GetMsgDlgType: TMsgDlgType;
begin
  Result:= FDlgType;
end;

procedure TFrmShowStr.SetMessageText(const Value: string);
begin
  RichEdit1.Text := Value;
end;

procedure TFrmShowStr.SetMsgDlgType(const Value: TMsgDlgType);
begin
  FDlgType := Value;
end;

end.
