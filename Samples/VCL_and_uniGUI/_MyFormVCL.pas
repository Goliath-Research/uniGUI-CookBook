unit _MyFormVCL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  _MyFormIntf;

type
  TMyFormVCL = class(TForm, IMyForm)
    Label1: TLabel;
    edtSomeText: TEdit;
    btnOK: TButton;
    btnCancel: TButton;
  private
    function GetSomeText: string;
    procedure SetSomeText(const Value: string);
  public

    property SomeText : string read GetSomeText write SetSomeText;
  end;

var
  MyFormVCL: TMyFormVCL;

implementation

{$R *.dfm}

{ TMyFormVCL }

function TMyFormVCL.GetSomeText: string;
begin
  Result := edtSomeText.Text
end;

procedure TMyFormVCL.SetSomeText(const Value: string);
begin
  edtSomeText.Text := Value
end;

end.
