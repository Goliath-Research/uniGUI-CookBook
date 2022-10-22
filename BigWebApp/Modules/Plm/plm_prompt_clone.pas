unit plm_prompt_clone;

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
  ExtCtrls,
  StdCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmPlmPromptClone = class(TUniForm)
    Label1: TUniLabel;
    edName: TUniEdit;
    Label2: TUniLabel;
    edDescrip: TUniEdit;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Bevel1: TUniPanel;
    chkIncludeDetail: TUniCheckBox;
    chkIncludeNotes: TUniCheckBox;
    chkIncludeInternalDocs: TUniCheckBox;
    chkIncludeExternalDocs: TUniCheckBox;
    chkIncludeEmail: TUniCheckBox;
    chkIncludeUserFields: TUniCheckBox;
    chkIncludeUDForm: TUniCheckBox;
    chkIncludeIdeas: TUniCheckBox;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    procedure SetOld_Scenario_ID(const Value: Real);
    { Private declarations }
  public
    { Public declarations }
    property Old_Scenario_ID: Real write SetOld_Scenario_ID;
    class function DoExecute( AOld_Scenario_ID: Real; var AName, ADescrip: string;
      var ADetail, ANotes, AIntDoc, AExtDoc, AEmail, AUserFields, AUDForm, AIdeas: Boolean ): Boolean;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  plm_rscstr;

class function TFrmPlmPromptClone.DoExecute( AOld_Scenario_ID: Real;  var AName, ADescrip: string;
  var ADetail, ANotes, AIntDoc, AExtDoc, AEmail, AUserFields, AUDForm, AIdeas: Boolean): Boolean;
begin
  with self.Create( uniGUIApplication.UniApplication ) do
  begin
    Old_Scenario_ID  := AOld_Scenario_ID;
    Result:= ShowModal = mrOK;
    if Result then
    begin
      AName   := edName.Text;
      ADescrip:= edDescrip.Text;
      ADetail := chkIncludeDetail.Checked;
      ANotes := chkIncludeNotes.Checked;
      AIntDoc := chkIncludeNotes.Checked;
      AExtDoc := chkIncludeNotes.Checked;
      AEmail := chkIncludeNotes.Checked;
      AUserFields := chkIncludeNotes.Checked;
      AUDForm := chkIncludeUDForm.Checked;
      AIdeas := chkIncludeIdeas.Checked;
    end;
  end;
end;

procedure TFrmPlmPromptClone.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ chkIncludeDetail, chkIncludeNotes, chkIncludeInternalDocs,
    chkIncludeExternalDocs, chkIncludeEmail, chkIncludeUserFields, chkIncludeUDForm,
    chkIncludeIdeas ]);
end;

procedure TFrmPlmPromptClone.SetOld_Scenario_ID(const Value: Real);
begin
  Caption:= Format(plm_rscstr.cTXT0000036, // 'Clone scenario: %s'
    [ SelectValueByID('code', 'plm_scenario', Value)]);
end;

procedure TFrmPlmPromptClone.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ chkIncludeDetail, chkIncludeNotes, chkIncludeInternalDocs,
    chkIncludeExternalDocs, chkIncludeEmail, chkIncludeUserFields, chkIncludeUDForm,
    chkIncludeIdeas ]);
end;

procedure TFrmPlmPromptClone.btnOKClick(Sender: TObject);
begin
  {validate}
  IQAssert( Trim(edName.Text) > '', plm_rscstr.cTXT0000037{'Please enter a scenario name.'});
  ModalResult:= mrOK;
end;

end.
