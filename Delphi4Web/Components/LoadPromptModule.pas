unit LoadPromptModule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniTreeView, uniButton;

type
  TLoadPromptForm = class(TUniForm)
    TreeView: TUniTreeView;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    SelectedCategory, SelectedModule : string;
    procedure AssignList(AList: TStrings);
  end;

function LoadPromptForm: TLoadPromptForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function LoadPromptForm: TLoadPromptForm;
begin
  Result := TLoadPromptForm(UniMainModule.GetFormInstance(TLoadPromptForm));
end;

{ TLoadPromptForm }

procedure TLoadPromptForm.AssignList(AList: TStrings);
var
  I: Integer;
  SBranch, SNode: string;
  ANode : TUniTreeNode;
begin
  for I := 0 to AList.Count - 1 do
  begin
    SBranch := AList.Names[I];
    SNode := AList.ValueFromIndex[I];

    ANode := TreeView.Items.FindNodeByCaption(SBranch);
    if  ANode = nil then
      ANode := TreeView.Items.Add(nil, SBranch);

    TreeView.Items.Add(ANode, SNode);
  end;
end;

procedure TLoadPromptForm.UniFormBeforeShow(Sender: TObject);
begin
  TreeView.FullExpand;
end;

procedure TLoadPromptForm.UniFormClose(Sender: TObject;
  var Action: TCloseAction);
var
  ANode : TUniTreeNode;
begin
  if ModalResult = mrOK then
  begin
    ANode := TreeView.Selected;
    if (ANode = nil) or ANode.HasChildren then
    begin
      Action := caNone;
      ShowMessage('Please select a module.');
      Exit;
    end;

    SelectedCategory := ANode.Parent.Text;
    SelectedModule := ANode.Text;
  end;
end;

end.
