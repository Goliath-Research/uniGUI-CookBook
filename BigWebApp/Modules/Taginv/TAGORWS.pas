unit TagOrWs;

interface

uses
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, uniRadioGroup;

type
  TTagOrWorksheet = (twTags, twWorksheet, twNone);

type
  TFrmTagWorksheet = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    Panel3: TUniPanel;
    RadioGroup1: TUniRadioGroup;
    rbTags: TUniRadioButton;
    rbWork: TUniRadioButton;
    SR1: TIQWebSecurityRegister;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure Validate;
    { Private declarations }
  public
    { Public declarations }
    FTagOrWorksheet:TTagOrWorksheet;
  end;

function ChooseTagOrWorksheet:TTagOrWorksheet;

implementation

uses
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  { TODO -oLema : Dependent on IQSecIns }
//  IQSecIns,
  taginv_rscstr;

{$R *.DFM}

function ChooseTagOrWorksheet:TTagOrWorksheet;
var
  frm: TFrmTagWorksheet;
begin
  frm := TFrmTagWorksheet.Create(uniGUIApplication.UniApplication);
  frm.ShowModal;
  Result:= frm.FTagOrWorksheet;
end;

procedure TFrmTagWorksheet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ rbTags, rbWork  ]);
end;

procedure TFrmTagWorksheet.FormCreate(Sender: TObject);
begin
  FTagOrWorksheet := twNone;
  IQRegFormRead( self, [ rbTags, rbWork  ]);
end;

procedure TFrmTagWorksheet.FormShow(Sender: TObject);
begin
  { TODO -oLema : Dependent on IQSecIns }
//  EnsureSecurityInspectorOnTopOf(self);
end;

procedure TFrmTagWorksheet.btnOkClick(Sender: TObject);
begin
  Validate;

  if rbTags.Checked then
     FTagOrWorksheet := twTags
  else
     FTagOrWorksheet := twWorksheet;

  ModalResult:= mrOK;
end;

procedure TFrmTagWorksheet.Validate;
begin
  IQAssert( rbTags.Checked or rbWork.Checked, taginv_rscstr.cTXT0000058 ); // 'A method must be selected to continue.';
end;


end.
