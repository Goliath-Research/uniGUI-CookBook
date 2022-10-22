unit qc_audit_seltype;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmQcAuditSelType = class(TUniForm)
    Label1: TUniLabel;
    rbInternal: TUniRadioButton;
    rbExternal: TUniRadioButton;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function SelectAuditType(var AType: Byte): Boolean;


implementation

{$R *.dfm}

uses
  IQMS.Common.Numbers;

function SelectAuditType(var AType: Byte): Boolean;
begin
  with TFrmQcAuditSelType.Create(UniGuiApplication.UniApplication) do
  Begin
    Result := ShowModal = mrOk;
    if Result then
      AType := IQMS.Common.Numbers.iIIf(rbInternal.Checked, 0, 1);
  end;
end;

end.
