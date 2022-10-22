unit TlItem;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  Mainmodule, uniRadioGroup, uniButton, uniBitBtn, uniPanel;

type
  TFrmTLItem = class(TUniForm)
    PnlCtrls: TUniPanel;
    PnlButtons: TUniPanel;
    btnOK: TUniBitBtn;
    btnCancel: TUniBitBtn;
    rgOption: TUniRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DoSelectItemType: Integer;

implementation

{$R *.DFM}

function DoSelectItemType: Integer;
var
  FrmTLItem : TFrmTLItem;
begin
  FrmTLItem := TFrmTLItem.Create(uniGUIApplication.UniApplication);
   with FrmTLItem do
     begin
        if ShowModal = mrOk
           then Result := rgOption.ItemIndex   {get the user's choice if mrOk}
           else Result := -1;  {original value if mrCancel}
     end;
end;

end.
