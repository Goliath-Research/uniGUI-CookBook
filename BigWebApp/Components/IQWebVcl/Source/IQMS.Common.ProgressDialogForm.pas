unit IQMS.Common.ProgressDialogForm;

interface

uses
  Winapi.Windows,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel,
  uniProgressBar, System.Classes;

type
  TFrmIQProgressDlg = class(TUniForm)
    ProgressBar_StatusIndicator: TUniProgressBar;
    btnCancel: TUniBitBtn;
    Label_ProcessStatus1: TUniLabel;
    Label_ProcessStatus2: TUniLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CancelBtn: TUniBitBtn;
  end;


implementation

{$R *.DFM}

procedure TFrmIQProgressDlg.FormCreate(Sender: TObject);
begin
     CancelBtn := btnCancel;
     CancelBtn.Cursor := crArrow;
end;

procedure TFrmIQProgressDlg.btnCancelClick(Sender: TObject);
begin
 Close;
end;

end.
