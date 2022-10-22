unit Tlconf;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  MainModule, uniButton, uniBitBtn, uniRadioGroup, System.Classes, Vcl.Controls,
  uniPanel;

type
  TFrmToolingConfirm = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    RadioGroup1: TUniRadioGroup;
    Panel3: TUniPanel;
    btnOK: TUniBitBtn;
    btnCancel: TUniBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

end.
