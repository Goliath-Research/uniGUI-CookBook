unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMainForm = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  FactTable;

procedure TMainForm.Button1Click(Sender: TObject);
var
  FactTableForm : TFactTableForm;
begin
  FactTableForm := TFactTableForm.Create(Self);
  try
    FactTableForm.ShowModal;
  finally
    FactTableForm.Free;
  end;
end;

end.
