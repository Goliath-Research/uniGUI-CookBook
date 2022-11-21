unit MasterDetailReg;

interface

  procedure Register;

implementation

uses
  Classes,
  TreeIntf,
  Vcl.Forms,
  MasterDetailFrame
  ;

type

  TFrameClass = class of TFrame;

procedure RegisterFramesAsComponents(const Page: string; const FrameClasses: array of TFrameClass);
var
  FrameClass: TFrameClass;
begin
  for FrameClass in FrameClasses do
  begin
    RegisterComponents(Page, [FrameClass]);
    RegisterSprigType(FrameClass, TComponentSprig);
  end
end;

procedure Register;
begin
  // Non-visual components

//  RegisterComponents
//  (
//    'Demo VCL Library',
//    [
//    ]
//  );

  // TSomeFrame = class(TUniFrame)
  RegisterFramesAsComponents
  (
    'Demo VCL Library',
    [
      TfrmMasterDetail
    ]
  )
end;

end.
