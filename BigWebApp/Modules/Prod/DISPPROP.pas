unit DispProp;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Buttons,
  ComCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniButton,
  uniBitBtn,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniPageControl, uniPanel;

type
  TFrmDispProp = class(TUniForm)
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    BitBtn1: TUniBitBtn;
    BitBtn2: TUniBitBtn;
    CheckBox1: TUniCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoDispProp( AOwner:TComponent );
  
var
  FrmDispProp: TFrmDispProp;

implementation

{$R *.DFM}

procedure DoDispProp( AOwner:TComponent );
begin
  with TFrmDispProp.Create( AOwner ) do
  try
    ShowModal;
  finally
    Free;
  end;    
end;

end.
