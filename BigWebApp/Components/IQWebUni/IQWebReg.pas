unit IQWebReg;

interface

  procedure Register;

implementation

uses
  Classes,
  TreeIntf,
  IQWebHPick,
//  IQWebUserDefinedForm,
  uniGUIFrame;

type
  TFrameClass = class of TUniFrame;

procedure RegisterFramesAsComponents(const Page: string; const FrameClasses: array of TFrameClass);
var
  FrameClass: TFrameClass;
begin
  for FrameClass in FrameClasses do
  begin
    RegisterComponents(Page, [FrameClass]);
    RegisterSprigType(FrameClass, TComponentSprig);
  end;
end;

procedure Register;
begin
  RegisterComponents
  (
    'IQWeb UniGUI',
    [
//      TIQWebHPick
    ]
  );

//  RegisterFramesAsComponents
//  (
//    'IQWeb UniGUI',
//    [
//      TUniUserDefinedForm
//    ]);
end;

end.
