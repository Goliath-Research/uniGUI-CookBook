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
  Master_Detail;

procedure TMainForm.Button1Click(Sender: TObject);
var
  Master_DetailForm : TMaster_DetailForm;
begin
  Master_DetailForm := TMaster_DetailForm.Create(Self);
  try
    Master_DetailForm.ShowModal;
  finally
    Master_DetailForm.Free;
  end;
end;

end.
