unit dbtfldpr;

{ Field Name prompt }

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Buttons,
  ExtCtrls,
  IQMS.DBTrans.dbttypes,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  TFrmDBTFieldNamePrompt = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    PnlMain: TUniPanel;
    lblPrompt: TUniLabel;
    edtFieldName: TUniEdit;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    procedure edtFieldNameKeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AInitialValue: String);
  end;


  function PromptFieldName(const AOwner: TComponent;
                           const ACaption: String;
                           const APrompt: String;
                           var AValue: String;
                           const AMaxLength: Byte = 30): Boolean;

  function PromptFieldNameEx(const AOwner: TComponent;
                             const ACaption: String;
                             const APrompt: String;
                             const ATableType: TCustomTableType;
                             var AValue: String): Boolean;

var
  FrmDBTFieldNamePrompt: TFrmDBTFieldNamePrompt;

implementation

{$R *.dfm}

uses
  IQMS.DBTrans.dbtshare,
  IQMS.DBTrans.dbtrscstr,
  IQMS.Common.RegFrm;

const
  constNUMBERS     = ['0'.. '9'];
  constLOWER       = ['a'.. 'z'];
  constUPPER       = ['A'.. 'Z'];
  constSPECIAL     = ['_', #8 {BACKSPACE}];

  constALPHA_CHARS = constLOWER + constUPPER;
  constVALID_CHARS = constNUMBERS + constALPHA_CHARS + constSPECIAL;

function PromptFieldName(const AOwner: TComponent;
                         const ACaption: String;
                         const APrompt: String;
                         var AValue: String;
                         const AMaxLength: Byte = 30): Boolean;
begin
  with TFrmDBTFieldNamePrompt.Create(AOwner, AValue) do
  try
     edtFieldName.MaxLength := AMaxLength;
     Caption := ACaption;
     lblPrompt.Caption := APrompt;
     Result := (ShowModal = mrOk);
     if Result then
        AValue := edtFieldName.Text;
  finally
    Free;
  end;
end;

function PromptFieldNameEx(const AOwner: TComponent;
                           const ACaption: String;
                           const APrompt: String;
                           const ATableType: TCustomTableType;
                           var AValue: String): Boolean;
var
   AMaxLength: Byte;
begin

  AMaxLength := MaxFieldNameSize(ATableType);

  with TFrmDBTFieldNamePrompt.Create(AOwner, AValue) do
  try
     edtFieldName.MaxLength := AMaxLength;
     Caption := ACaption;
     lblPrompt.Caption := APrompt;
     Result := (ShowModal = mrOk);
     if Result then
        AValue := edtFieldName.Text;
  finally
    Free;
  end;
end;

{ TFrmDBTFieldNamePrompt }

constructor TFrmDBTFieldNamePrompt.Create(AOwner: TComponent;
  AInitialValue: String);
begin
  inherited Create(AOwner);
  edtFieldName.Text := AInitialValue;
end;

procedure TFrmDBTFieldNamePrompt.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self]);
end;

procedure TFrmDBTFieldNamePrompt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self]);
end;

procedure TFrmDBTFieldNamePrompt.edtFieldNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in constVALID_CHARS) then
     Key := #0;
  if (Trim(edtFieldName.Text) = '') and
     not (Key in constUPPER + constLOWER) then
     Key := #0;
end;

procedure TFrmDBTFieldNamePrompt.btnOkClick(Sender: TObject);
var
   AValue: String;
   C: Char;
begin
  AValue := Trim(edtFieldName.Text);
  
  if (Length(AValue) <= 2) then
     //'Please enter at least 2 characters for a field name.'
     raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000162);

  C := AValue[1];
  if not (C in constALPHA_CHARS) then
     // 'Field name must begin with a character (A to Z).'
     raise Exception.Create(IQMS.DBTrans.dbtrscstr.cTXT0000163);


  ModalResult := mrOk;
end;

end.
