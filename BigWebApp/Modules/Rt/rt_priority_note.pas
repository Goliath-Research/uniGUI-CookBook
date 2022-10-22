unit rt_priority_note;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Mask,
  IQMS.WebVcl.UDComboBox,
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
  uniLabel, uniMultiItem, uniComboBox, uniDBComboBox;

type
  TFrmRT_Priority_Note = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Label1: TUniLabel;
    comboNote: TIQWebUDComboBox;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    sbtnPriorityNote: TUniSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnPriorityNoteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create( AOwner: TComponent; APriorityNote: string );
    class function DoShowModal(AOwner: TComponent; var APriorityNote: string): Boolean;
  end;

var
  FrmRT_Priority_Note: TFrmRT_Priority_Note;

implementation

{$R *.dfm}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.EditMemoStr;

{ TFrmRT_Priority_Note }

constructor TFrmRT_Priority_Note.Create(AOwner: TComponent; APriorityNote: string);
begin
  inherited Create(AOwner);

  comboNote.Text:= APriorityNote;
  IQRegFormRead(self, [self]);
end;

class function TFrmRT_Priority_Note.DoShowModal(AOwner: TComponent; var APriorityNote: string ): Boolean;
begin
  with self.Create(AOwner, APriorityNote) do
  try
    Result:= (ShowModal = mrOK);
    if Result then
       APriorityNote:= comboNote.Text;
  finally
    Free;
  end;
end;

procedure TFrmRT_Priority_Note.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmRT_Priority_Note.sbtnPriorityNoteClick(Sender: TObject);
var
  S: string;
begin
  S:= comboNote.Text;
  if DoEditMemoStr( self, S, 255, self.Caption ) then   {IQMS.Common.EditMemoStr.pas}
     comboNote.Text:= S;
end;

end.
