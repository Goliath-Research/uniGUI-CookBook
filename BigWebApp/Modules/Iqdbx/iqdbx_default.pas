unit iqdbx_default;

{ This is the "Main Form" that is executed for COM Applications }

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
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

type
  TDefaultForm = class(TUniForm)
    Label1: TUniLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.
