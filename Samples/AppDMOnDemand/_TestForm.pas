unit _TestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm,
  _AppDM1, uniGUIBaseClasses, uniBasicGrid, uniDBGrid;

type
  TTestForm = class(TUniForm)
    UniDBGrid1: TUniDBGrid;
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function TestForm: TTestForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function TestForm: TTestForm;
begin
  Result := TTestForm(UniMainModule.GetFormInstance(TTestForm));
end;

procedure TTestForm.UniFormDestroy(Sender: TObject);
begin
  AppDM1.Free;
end;

end.
