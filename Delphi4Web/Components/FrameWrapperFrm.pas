unit FrameWrapperFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn;

type
  TFrmFrameWrapper = class(TUniForm)
    pnlFrame: TUniPanel;
    pnlButtons: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
  private
    { Private declarations }

    procedure SetFrame(aClass : TClass);
  public
    { Public declarations }

    property Frame : TClass write SetFrame;
  end;

function FrmFrameWrapper(aClass : TClass) : TFrmFrameWrapper;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FrmFrameWrapper(aClass : TClass) : TFrmFrameWrapper;
begin
  Result := TFrmFrameWrapper.Create(UniGUIApplication.UniApplication);
  Result.Frame := aClass;
end;

{ TFrmFrameWrapper }

procedure TFrmFrameWrapper.SetFrame(aClass : TClass);
begin
  Self.InsertControl(TControl(aClass).Create(Self));
end;

end.
