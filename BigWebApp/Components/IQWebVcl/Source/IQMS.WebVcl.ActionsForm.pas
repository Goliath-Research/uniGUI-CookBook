unit IQMS.WebVcl.ActionsForm;

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
  ExtCtrls,
  StdCtrls,
  Buttons,
  CheckLst,
  ActnList,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

type
  TFrmActionList = class(TUniForm)
    PnlMain: TUniPanel;
    PnlButtons: TUniPanel;
    lstActions: TCheckListBox;
    PnlButtonsInner: TUniPanel;
    btnOK: TUniBitBtn;
    btnCancel: TUniBitBtn;
    btnExecute: TUniBitBtn;
    procedure btnExecuteClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FActionList: TActionList;
    procedure LoadList;
    procedure SetSavedItems;
    procedure Validate;
    procedure SetActionList(AActionList: TActionList);
  public
    property ActionList : TActionList read FActionList Write SetActionList;
    { Public declarations }
  end;

  function DoConfigIQActionList(var AActionList: TActionList): Boolean;


implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.Dialogs,
  IQMS.WebVcl.ResourceStrings;

function DoConfigIQActionList(var AActionList: TActionList): Boolean;
var
  FrmActionList: TFrmActionList;
begin
  FrmActionList:= TFrmActionList.Create(uniGUIApplication.UniApplication);
  with FrmActionList do
  begin
     ActionList:=AActionList;
     LoadList;
     Result := ShowModal = mrOk;
     if Result then
        begin
          SetSavedItems;
          AActionList := FActionList; // send back the TActionList
        end;
  end;
end;

{ TFrmMultiJump }

procedure TFrmActionList.LoadList;
var
   i: Integer;
begin

  // ** Load the list of Actions

  if not Assigned(FActionList) then Exit;

  // Clear the list
  lstActions.Clear;

  // Cycle the list, adding actions and setting the "checked" property
  for i := 0 to FActionList.ActionCount - 1 do
   begin
      lstActions.Items.AddObject(TAction(FActionList.Actions[i]).Caption, TAction(FActionList.Actions[i]));
      lstActions.Checked[i] := TAction(FActionList.Actions[i]).Checked;
   end;

end;

procedure TFrmActionList.SetActionList(AActionList: TActionList);
begin
  if (AActionList = NIL) then SysUtils.Abort;
  FActionList := AActionList;
end;

procedure TFrmActionList.SetSavedItems;
var
   i: Integer;
begin
  // ** Set the "checked" property on the TActionList ** //
   
  // Set "checked" property for each item on the TActionList passed to this
  // form.  The wrapper (above) passes it back to the calling method.
  // The calling method records the result in the Registry.
  for i := 0 to lstActions.Count - 1 do
    TAction(FActionList.Actions[i]).Checked := lstActions.Checked[i];
end;

procedure TFrmActionList.btnExecuteClick(Sender: TObject);
var
   i: Integer;
begin

  Validate;

  if not IQConfirmYN(IQMS.WebVcl.ResourceStrings.cTXT0000331 {'Execute all actions now?'}) then Exit;

  try
    SetSavedItems;
    for i := 0 to FActionList.ActionCount - 1 do
      if TAction(FActionList.Actions[i]).Checked then
         TAction(FActionList.Actions[i]).Execute;
  finally
    ModalResult := mrOk;
  end;

end;

procedure TFrmActionList.Validate;
begin
  if IQMS.Common.Controls.CheckedItems(lstActions) = 0 then
     raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000330 {'Please select at least one item from the list.'});
end;

procedure TFrmActionList.btnOKClick(Sender: TObject);
begin
  Validate;
  ModalResult := mrOk;
end;

end.
