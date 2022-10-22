unit pc_PromptPallet;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
//  pc_share,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, MainModule, uniBitBtn, uniEdit, uniPanel, uniButton,
  uniSpeedButton;

type
  TFrmPromptPallet = class(TUniForm)
    sbtnShowKeyPad: TUniSpeedButton;
    pnlInstructions: TUniPanel;
    edSerialno: TUniEdit;
    bbtnOK: TUniBitBtn;
    bbtnCancel: TUniBitBtn;
    procedure edSerialnoKeyPress(Sender: TObject; var Key: Char);
    procedure sbtnShowKeyPadClick(Sender: TObject);
    procedure bbtnCancelClick(Sender: TObject);
    procedure bbtnOKClick(Sender: TObject);
  private
    { Private declarations }
    FMasterLabelRec:TMasterLabelRec;
  public
    { Public declarations }
    property MasterLabelRec:TMasterLabelRec read FMasterLabelRec write FMasterLabelRec;
  end;

  function PromptPallet(var ASerialno:String; var AMasterLabelRec:TMasterLabelRec):Boolean;

var
  FrmPromptPallet: TFrmPromptPallet;

implementation

{$R *.dfm}

uses
  iqmisc,
  pc_rscstr,
  Touchscrn;

function PromptPallet(var ASerialno:String; var AMasterLabelRec:TMasterLabelRec):Boolean;
begin
  with TFrmPromptPallet.Create(Application) do
  try
    edSerialno.Text:= ASerialno;

    Result:= ShowModal = mrOK;
    if Result then
      AMasterLabelRec:= FMasterLabelRec;
  finally
    FREE;
  end;
end;


procedure TFrmPromptPallet.edSerialnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in [ #13 ] then bbtnOK.Click;
end;


procedure TFrmPromptPallet.sbtnShowKeyPadClick(Sender: TObject);
var
  ANewValue: String;
begin
  ANewValue:= edSerialno.Text;
  if TouchScreen_KeyPad( self, ANewValue, FALSE {CheckThousandSeparator}, FALSE{ShowDecimalSeparator}) then // touchscrn.pas
    edSerialno.Text:= ANewValue;
end;


procedure TFrmPromptPallet.bbtnCancelClick(Sender: TObject);
begin
  self.ModalResult:= mrCancel;
end;


procedure TFrmPromptPallet.bbtnOKClick(Sender: TObject);
begin                                                          // 'Invalid Serial #'
  IQAssert( GetSerialInfo( edSerialno.Text, FMasterLabelRec ), pc_rscstr.cTXT0000029 ); // iqmisc.pas

  ModalResult:= mrOk;
end;


end.
