unit GLrepeat;

interface

uses
  Vcl.Forms,
  Vcl.Buttons,
  Vcl.Controls,
  System.Classes,
  uniRadioGroup,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit,
  uniButton,
  uniBitBtn;

type
  TFrmRepeat = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    BitBtn1: TUniBitBtn;
    BitBtn2: TUniBitBtn;
    Panel1: TUniPanel;
    Label1: TUniLabel;
    Edit1: TUniEdit;
    Panel2: TUniPanel;
    RadioGroup1: TUniRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.
