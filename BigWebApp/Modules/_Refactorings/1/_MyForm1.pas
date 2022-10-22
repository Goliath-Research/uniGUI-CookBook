unit _MyForm1;

interface

uses
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit,
  uniButton;

type
  TMyForm1 = class(TUniForm)
    edtSomeText: TUniEdit;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    lblSomeText: TUniLabel;
  private
    function GetSomeText: string;
    procedure SetSomeText(const Value: string);
  public

    property SomeText : string read GetSomeText write SetSomeText;
  end;

  function GetOrModifySomeText(var aText : string) : boolean;

implementation

{$R *.dfm}

function GetOrModifySomeText(var aText : string) : boolean;
var
  MyForm: TMyForm1;
begin
  MyForm := TMyForm1.Create(UniGUIApplication.UniApplication);
  MyForm.SomeText := aText;

  Result := MyForm.ShowModal = mrOk;

  if Result then
    aText := MyForm.SomeText;
end;

{ TMyForm }

function TMyForm1.GetSomeText: string;
begin
  Result := edtSomeText.Text;
end;

procedure TMyForm1.SetSomeText(const Value: string);
begin
  edtSomeText.Text := Value;
end;

end.
