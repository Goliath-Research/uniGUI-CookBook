unit Rec_Labels_Conf;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.CaptionPanel,
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmRec_Labels_Confirm = class(TUniForm)
    CaptionPanel1: TIQWebCaptionPanel;
    rbtnAbort: TUniRadioButton;
    rbtnFixList: TUniRadioButton;
    rbtnMatchList: TUniRadioButton;
    Label1: TUniLabel;
    Bevel1: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    SR: TIQWebSecurityRegister;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal: Integer;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.RegFrm;

{ TFrmRec_Labels_Confirm }

class function TFrmRec_Labels_Confirm.DoShowModal: Integer;
begin
  Result:= 0;  {cancel}
  with self.Create(uniGUIApplication.UniApplication) do
  begin
    if ShowModal <> mrOK then
       EXIT;

    if rbtnAbort.Checked then
       Result:= 1  {Abort}
    else if rbtnFixList.Checked then
       Result:= 0  {Cancel}
    else if rbtnMatchList.Checked then
       Result:= 2;  {Match}
  end;
end;

procedure TFrmRec_Labels_Confirm.FormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [ self ]);
end;

procedure TFrmRec_Labels_Confirm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

procedure TFrmRec_Labels_Confirm.FormShow(Sender: TObject);
begin
//  EnsureSecurityInspectorOnTopOf( self );
end;

end.
