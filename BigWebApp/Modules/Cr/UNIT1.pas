unit Unit1;

interface

uses
  Vcl.Forms,
  System.Classes,
  Vcl.Controls,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, uniGUIBaseClasses;

type
  TLauncher = class(TUniForm)
    Button1: TUniButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Launcher: TLauncher;

implementation

//uses
//  CashRec;

{$R *.DFM}

procedure TLauncher.Button1Click(Sender: TObject);
begin
  //DoCr(self);
end;

end.

