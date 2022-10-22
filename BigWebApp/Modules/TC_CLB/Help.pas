unit Help;

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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMemo,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

type
  TFormHelp2 = class(TUniForm)
    Memo1: TUniMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


function FormHelp2: TFormHelp2;

implementation

{$R *.DFM}

uses MainModule;

function FormHelp2: TFormHelp2;
begin
  Result := TFormHelp2(UniMainModule.GetFormInstance(TFormHelp2));
end;

end.
