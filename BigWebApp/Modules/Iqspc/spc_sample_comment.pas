unit spc_sample_comment;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  IQMS.WebVcl.UDComboBox,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniMultiItem, uniComboBox, uniDBComboBox;

type
  TFrmSPCSampleComment = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    lblComment: TUniLabel;
    cmbGridSampleComment: TIQWebUDComboBox;
    PnlEditComment: TUniPanel;
    sbtnEditComment: TUniSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure sbtnEditCommentClick(Sender: TObject);
    procedure DoSetButtons(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FFieldLength: Integer;
    procedure SetButtons;
  public
    { Public declarations }
    function GetText: string;
  end;

function GetRequiredSampleComment(AOwner: TComponent;
  var AComment: string): Boolean;

var
  FrmSPCSampleComment: TFrmSPCSampleComment;

implementation

{$R *.dfm}


uses
  IQMS.Common.EditMemoStr,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  System.Math;

function GetRequiredSampleComment(AOwner: TComponent;
  var AComment: string): Boolean;
begin
  with TFrmSPCSampleComment.Create(AOwner) do
    try
      Result := ShowModal = mrOk;
      if Result then
        AComment := GetText;
    finally
      Release;
    end;
end;

{ TFrmSPCSampleComment }

procedure TFrmSPCSampleComment.FormCreate(Sender: TObject);
var
  iWidth: Integer;
begin
  // Position the combo box button
  iWidth := Max(GetSystemMetrics(SM_CXVSCROLL), 15);
  PnlEditComment.Parent := cmbGridSampleComment;
  PnlEditComment.Top := 0;
  PnlEditComment.Width := iWidth;
  PnlEditComment.Left := (cmbGridSampleComment.ClientWidth - (2 * iWidth));
  PnlEditComment.Anchors := [akTop, akRight];
  sbtnEditComment.Top := 0;
  sbtnEditComment.Left := 1;
  sbtnEditComment.Width := PnlEditComment.Width - 1;
  // Max length of the comment field
  FFieldLength := SelectValueAsInteger(
    'SELECT data_length FROM cols WHERE table_name = ''SPC_SAMPLE'' AND ' +
    'column_name = ''NOTE'' ');
end;

procedure TFrmSPCSampleComment.FormShow(Sender: TObject);
begin
  IQMS.Common.Controls.CenterForm(Self, True);
  SetButtons;
end;

procedure TFrmSPCSampleComment.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmSPCSampleComment.sbtnEditCommentClick(Sender: TObject);
var
  s: string;
  i: Integer;
begin
  s := cmbGridSampleComment.Text;
  if IQMS.Common.EditMemoStr.DoEditMemoStr(Self, s, FFieldLength, lblComment.Caption) then
    cmbGridSampleComment.Text := s;
  SetButtons;
end;

function TFrmSPCSampleComment.GetText: string;
begin
  Result := Trim(cmbGridSampleComment.Text);
end;

procedure TFrmSPCSampleComment.DoSetButtons(Sender: TObject);
begin
  SetButtons;
end;

procedure TFrmSPCSampleComment.SetButtons;
begin
  btnOk.Enabled := GetText > '';
end;

procedure TFrmSPCSampleComment.btnOkClick(Sender: TObject);
begin
  if GetText = '' then
    raise Exception.Create('Please provide a sample comment.');
  ModalResult := mrOk;
end;

end.
