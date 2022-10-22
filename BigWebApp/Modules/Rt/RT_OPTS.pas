unit RT_opts;

interface

uses
  Vcl.Forms,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, System.Classes, Vcl.Controls, uniRadioGroup;

type
  TFrmOptions = class(TUniForm)
    RadioGroup1: TUniRadioGroup;
    BitBtn1: TUniBitBtn;
    BitBtn2: TUniBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOptions: TFrmOptions;

implementation
//uses
 // RT_Main;
{$R *.DFM}

end.
