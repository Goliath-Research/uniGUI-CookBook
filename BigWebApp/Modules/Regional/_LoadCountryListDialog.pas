unit _LoadCountryListDialog;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TLoadCountryListDialog = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    PnlMain: TUniPanel;
    lblPrompt: TUniLabel;
    DefaultSpellingsOnlyCheckBox: TUniCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  strict private
    { Private declarations }
    function GetDefaultSpellingsOnly: Boolean;
  public
    { Public declarations }
//    class function DoShowModal(AOwner: TComponent;
    class function DoShowModal(var ADefaultSpellingsOnly: Boolean): Boolean;
    property DefaultSpellingsOnly: Boolean read GetDefaultSpellingsOnly;
  end;

var
  LoadCountryListDialog: TLoadCountryListDialog;

implementation

{$R *.dfm}


uses
  IQMS.Common.RegFrm;

//class function TLoadCountryListDialog.DoShowModal(AOwner: TComponent;
class function TLoadCountryListDialog.DoShowModal(var ADefaultSpellingsOnly: Boolean): Boolean;
begin
  LoadCountryListDialog := TLoadCountryListDialog.Create(UniGUIApplication.UniApplication);
  ADefaultSpellingsOnly := False;
    try
      Result := LoadCountryListDialog.ShowModal = mrOk;
      if Result then
        ADefaultSpellingsOnly := LoadCountryListDialog.DefaultSpellingsOnlyCheckBox.Checked;
    finally
//      Release;
    end;
end;

procedure TLoadCountryListDialog.FormShow(Sender: TObject);
begin
  IQRegFormRead(Self, [Self, DefaultSpellingsOnlyCheckBox]);
end;

procedure TLoadCountryListDialog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  IQRegFormWrite(Self, [Self, DefaultSpellingsOnlyCheckBox]);
end;

function TLoadCountryListDialog.GetDefaultSpellingsOnly: Boolean;
begin
  Result := DefaultSpellingsOnlyCheckBox.Checked;
end;

end.
