unit crm_ref_list;

(* ****************************************************************************
  ***                        Prompt Delete Activity                         ***

  This unit prompts the user to delete an activity.  It displays "references" --
  places where the activity is referenced -- so that the user knows which
  areas will be affected.

  Please note: The units declared (used) in this unit are inoccuous, so that
  crm_ref_list may be declared in code outside of CRM without hooking in
  other CRM-specific objects.

  **************************************************************************** *)

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.Menus,
  System.Variants,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniListBox,
  uniEdit,
  uniButton,
  uniPanel,
  uniBitBtn,
  uniSpinEdit,
  uniMainMenu, uniMultiItem, Vcl.Forms;

type
  TFrmCRMReferencesList = class(TUniForm)
    PnlCarrier: TUniPanel;
    PnlTop: TUniPanel;
    PnlMiddle: TUniPanel;
    PnlBottom: TUniPanel;
    lblMessage: TUniLabel;
    lstReferences: TUniListBox;
    PnlOK: TUniPanel;
    PnlCancel: TUniPanel;
    btnCancel: TUniBitBtn;
    btnOK: TUniBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DoPromptHasReferences(
  AReferencesList: TStringList;
  AMessageText: string = ''; // An empty string will show the default
  AFormCaption: string = 'References';
  AOKBtnCaption: string = 'OK';
  ACancelBtnCaption: string = 'Cancel'): Boolean;

var
  FrmCRMReferencesList: TFrmCRMReferencesList;

implementation

{$R *.DFM}


uses
  crm_rscstr,
  IQMS.Common.Controls;

function DoPromptHasReferences(
  AReferencesList: TStringList;
  AMessageText: string = '';
  AFormCaption: string = 'References';
  AOKBtnCaption: string = 'OK';
  ACancelBtnCaption: string = 'Cancel'): Boolean;
// if TRUE, continue with delete
var
  frm : TFrmCRMReferencesList;
begin
  if AReferencesList.Count = 0 then
    raise Exception.Create
      ('Internal IQCRM Error [TFrmCRMReferencesList.Create()]:  References List is empty.');

  frm := TFrmCRMReferencesList.Create(uniGUIApplication.UniApplication);

    // Fix up default values for localization.
  if AFormCaption = 'References' then
    AFormCaption := crm_rscstr.cTXT0000324; // 'References'
  if AOKBtnCaption = 'OK' then
    AOKBtnCaption := crm_rscstr.cTXT0000325; // 'OK'
  if ACancelBtnCaption = 'Cancel' then
    ACancelBtnCaption := crm_rscstr.cTXT0000326; // 'Cancel'

  if AMessageText > '' then
    frm.lblMessage.Caption := AMessageText;

  frm.lstReferences.Items := AReferencesList;

  if AOKBtnCaption > '' then
    frm.btnOK.Caption := AOKBtnCaption
  else
    frm.PnlOK.Visible := FALSE;

  if ACancelBtnCaption > '' then
    frm.btnCancel.Caption := ACancelBtnCaption
  else
    frm.PnlCancel.Visible := FALSE;

  frm.PnlBottom.Visible := frm.PnlOK.Visible or frm.PnlCancel.Visible;

  if AFormCaption > '' then
    frm.Caption := AFormCaption;

//  IQMS.Common.Controls.CenterForm(Self, True);

  Result := frm.ShowModal = mrOk;
end;

{ TFrmCRMReferencesList }


procedure TFrmCRMReferencesList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
