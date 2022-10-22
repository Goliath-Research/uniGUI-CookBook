unit MyForm2;

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
  uniButton,
  MyForm2Intf;

type

  TMyForm2 = class(TUniForm, IMyForm2)
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

implementation

{$R *.dfm}

{ TMyForm2 }

function TMyForm2.GetSomeText: string;
begin
  Result := edtSomeText.Text;
end;

procedure TMyForm2.SetSomeText(const Value: string);
begin
  edtSomeText.Text := Value;
end;

end.
