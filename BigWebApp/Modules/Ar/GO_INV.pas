unit go_inv;

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
  TFrmGo = class(TUniForm)
    Button1: TUniButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FrmGo: TFrmGo;
//var
 // FrmGo: TFrmGo;

implementation

uses MainModule;

//  inv_main;  need to migration
{$R *.DFM}
function FrmGo: TFrmGo;
begin
  Result := TFrmGo(UniMainModule.GetFormInstance(TFrmGo));
end;
procedure TFrmGo.Button1Click(Sender: TObject);
begin
  //  DoInvoice(self);   //*from inv_main
end;

end.
