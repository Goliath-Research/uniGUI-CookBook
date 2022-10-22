unit IQMS.Common.selcase;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniPanel,
  UniRadioGroup,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

type
  TCharCase = ( csNone, csLower, csUpper, csTitle );
  TFrmChangeCase = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    rgCase: TUniRadioGroup;
  private
    { Private declarations }
    procedure SetCharCase (ACharCase: TCharCase = csNone);
  public
    { Public declarations }
    property xCharCase: TCharCase  write SetCharCase;
  end;

  function GetChangeCase( AOwner: TComponent; var ACharCase: TCharCase ): Boolean;


implementation

{$R *.DFM}

function GetChangeCase( AOwner: TComponent; var ACharCase: TCharCase ): Boolean;
var
  FrmChangeCase: TFrmChangeCase;
begin
  FrmChangeCase:= TFrmChangeCase.Create(uniGUIApplication.UniApplication);
     with FrmChangeCase do
     begin
       xCharCase:=ACharCase;
        Result := ShowModal = mrOk;
        if Result then
           ACharCase := TCharCase(rgCase.ItemIndex+1);
     end;
end;

procedure TFrmChangeCase.SetCharCase(ACharCase: TCharCase);
begin
   rgCase.ItemIndex := Ord(ACharCase)-1;
end;

end.
