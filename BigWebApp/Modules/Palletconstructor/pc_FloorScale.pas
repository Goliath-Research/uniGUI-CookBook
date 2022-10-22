unit pc_FloorScale;

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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, MainModule;

type
  TFrmFloorScale = class(TUniForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;


  function DoReadFloorScale(var AWeight:Real):Boolean;


implementation

{$R *.dfm}

function DoReadFloorScale(var AWeight:Real):Boolean;
var
  FrmFloorScale : TFrmFloorScale;
begin
  FrmFloorScale := TFrmFloorScale.Create(UniApplication);
  Result:= false;
end;

end.

