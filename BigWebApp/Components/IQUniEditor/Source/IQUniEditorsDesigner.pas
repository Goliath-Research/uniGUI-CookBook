unit IQUniEditorsDesigner;
{***@@@---------------------------------------------------------------------***}
{               uniGUI Web Application Framework for Delphi                    }
{                                                                              }
{ This source code is copyrighted material.                                    }
{ Copyright (c) FMSoft Co. Ltd. 2009-2016. All rights reserved.                }
{                                                                              }
{ See License.pdf under installation folder for details.                       }
{                                                                              }
{ Developed by: Farshad Mohajeri                                               }
{ Contact: farshad@fmsoft.net - info@fmsoft.net                                }
{ http://www.unigui.com                                                        }
{ http://www.fmsoft.net                                                        }
{------------------------------------------------------------------------------}

interface

uses
  Classes, Forms, SysUtils, DesignIntf, DesignWindows, DesignEditors, Dialogs,
  Controls, StdCtrls, ToolWin, ComCtrls, ImgList, ImageList, IQUniGrid,
  uniGUIClasses, uniGUIUtils;

type
  TIQControlEditor = class(TClassProperty)
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

  TIQControlGridDsgn = class(TDefaultEditor)
  protected
  public
    function GetVerb(Index: Integer):string; override;
    function GetVerbCount: Integer; override;
    procedure ExecuteVerb(Index: Integer); override;
    procedure Edit; override;
  end;

  TEditorsDesignDlg = class(TDesignWindow)
    LBox: TListBox;
    ToolBar1: TToolBar;
    NewButton: TToolButton;
    EraseButton: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ImageList1: TImageList;
    EraseAllButton: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    MoveButton: TToolButton;
    ToolButton9: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton4Click(Sender: TObject);
    procedure NewButtonClick(Sender: TObject);
    procedure LBoxClick(Sender: TObject);
    procedure EraseButtonClick(Sender: TObject);
    procedure EraseAllButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MoveButtonClick(Sender: TObject);
  private
    FGridControl : TIQUniGridControl;
    procedure SetGrid(C: TIQUniGridControl);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    procedure UpdateSelection;
    procedure SelectionChanged(const ADesigner: IDesigner; const ASelection: IDesignerSelections); override;

    procedure RefreshList(FAdd: Boolean);
    destructor Destroy; override;
  end;

procedure Register;

implementation

uses
  DesignConst, ToolsAPI, uniStrUtils, IQUniEditorTypeDlg, IQUniEditor,
  uniPageControl;

{$R *.dfm}

procedure Register;
begin
  RegisterPropertyEditor(TypeInfo(TIQControls), TIQUniGridControl, 'IQControls', TIQControlEditor);
  RegisterComponentEditor(TIQUniGridControl, TIQControlGridDsgn);
end;

procedure RunEditor(C : TIQUniGridControl; D:IDesigner);
var
  DForm : TEditorsDesignDlg;
begin
  if C.Designer<>nil then
    DForm := C.Designer as TEditorsDesignDlg
  else
    DForm := TEditorsDesignDlg.Create(Application);

  DForm.Designer := D;
  DForm.SetGrid(C);
  DForm.Show;
end;

procedure TEditorsDesignDlg.FormDestroy(Sender: TObject);
begin
  Designer:=nil;
end;

procedure TEditorsDesignDlg.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=27 then Close;
 
end;

procedure TEditorsDesignDlg.SetGrid(C: TIQUniGridControl);
begin
  FGridControl := C;
  if Assigned(FGridControl) then
    FGridControl.Designer:=Self;

  RefreshList(False);
end;

procedure TEditorsDesignDlg.LBoxClick(Sender: TObject);
begin
  UpdateSelection;
end;

procedure TEditorsDesignDlg.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;

  if Operation = opRemove then
  begin

  end;
end;

procedure TEditorsDesignDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;

  if Assigned(FGridControl) then FGridControl.Designer:=nil;

  LBox.Clear;
  UpdateSelection;
end;

destructor TEditorsDesignDlg.Destroy;
begin
  FGridControl:=nil;
  inherited;
end;

procedure TEditorsDesignDlg.NewButtonClick(Sender: TObject);
var
  C : TUniControl;
  Cat, I : Integer;
  F, F1 : TIQEditorDialogForm;
  Sl : TUniFormControlClass;
  Pnl: TWinControl;
  S : string;
begin
  F := TIQEditorDialogForm.Create(Application);
  try
    F.ShowList('Select a Category', RegisteredCategories, Cat);
    case Cat of
      IQCategoryForm : sl := TUniFormControlClass(F.ShowList('Select a Form Type', RegisteredForms, I));
      IQCategoryPanel : sl := TUniFormControlClass(F.ShowList('Select a Panel Type', RegisteredPanels, I));
      IQCategoryEditor : sl := TUniFormControlClass(F.ShowList('Select an Editor Type', RegisteredEditors, I));
      IQCategoryFieldSet : sl := TUniFormControlClass(F.ShowList('Select an Editor Type', RegisteredFieldSets, I));
    else
      sl := nil;
    end;

    if sl<>nil then
    begin
      F1 := TIQEditorDialogForm.Create(Application);
      try
        FGridControl.PopulateParents(F1.ListBox.Items, Cat);
        S := F1.ShowList('Select a Target', I);
        if S<>'' then
          Pnl := FGridControl.FindComponent(S) as TWinControl
        else
          Exit;
      finally
        F1.Free;
      end;

      if Pnl = nil then
      begin
        ShowMessage('No Parent Specified');
        Exit;
      end;

      C := FGridControl.CreateIQControl(Sl, uniUniqueComponentName(Sl.ClassName, FGridControl), Pnl);

      if Cat = IQCategoryEditor then
        FGridControl.ArrangePanelEditors(Pnl);

      if Assigned(C) then
      begin
        RefreshList(True);
        Designer.Modified;
      end;
    end;
  finally
    F.Free;
  end;
end;

procedure TEditorsDesignDlg.EraseButtonClick(Sender: TObject);
var
  C : TComponent;
  I : Integer;
begin
  if LBox.SelCount = 0 then Exit;

  if MessageDlg('Selected Editors will be deleted, Continue?', mtWarning, mbYesNoCancel, 0)<>mrYes then
    Exit;

  Designer.Modified; // this should be called *before* deleting any control

  with LBox do
    for I := 0 to Items.Count - 1 do
      if Selected[I] then
      begin
        C := TComponent(Items.Objects[I]);
        FGridControl.DeleteIQControl(C);
      end;

//  if LBox.Items.Count > 0 then
//    FGridControl.ArrangePanelEditors();

  RefreshList(False);
end;

procedure TEditorsDesignDlg.ToolButton4Click(Sender: TObject);
begin
  Close;
end;

procedure TEditorsDesignDlg.EraseAllButtonClick(Sender: TObject);
var
  C : TComponent;
  I : Integer;
begin
  if MessageDlg('All Editors will be deleted, Continue?', mtWarning, mbYesNoCancel, 0)<>mrYes then
    Exit;

  Designer.Modified; // this should be called *before* deleting any control

  with LBox do
    for I := 0 to Items.Count - 1 do
    begin
      C := TComponent(Items.Objects[I]);
      FGridControl.DeleteIQControl(C);
    end;

//  FGridControl.ArrangePanelEditors;

  RefreshList(False);
end;

procedure TEditorsDesignDlg.ToolButton7Click(Sender: TObject);
begin
  LBox.SelectAll;

  UpdateSelection;
end;

procedure TEditorsDesignDlg.MoveButtonClick(Sender: TObject);
var
  F : TIQEditorDialogForm;
  S : string;
  Pnl : TWinControl;
  I, Cat : Integer;
  C : TControl;
begin
  if LBox.SelCount > 0 then
  begin
    C := nil;
    F := TIQEditorDialogForm.Create(Application);
    try
      for I := 0 to LBox.Items.Count - 1 do
        if LBox.Selected[I] then
        begin
          C := TControl(LBox.Items.Objects[I]);
          Break;
        end;

      if C is TIQUniPanel then
        Cat := IQCategoryPanel
      else if C is TIQUniTabForm then
        Cat := IQCategoryForm
      else if C is TIQUniFieldSet then
        Cat := IQCategoryFieldSet
      else
        Cat := IQCategoryEditor;

      FGridControl.PopulateParents(F.ListBox.Items, Cat);
      S := F.ShowList('Select a Target', I);
      if S<>'' then
      begin
        Pnl := FGridControl.FindComponent(S) as TWinControl;

        if Assigned(Pnl) then
        begin
          FGridControl.AssignParent(C, Pnl);
          FGridControl.ArrangePanelEditors(Pnl);
          Designer.Modified;
        end;
      end;
    finally
      F.Free;
    end;
  end;
end;

procedure TEditorsDesignDlg.RefreshList(FAdd: Boolean);
var
  I : Integer;
begin
  LBox.Clear;

  if Assigned(FGridControl) then
  begin
    for I := 0 to FGridControl.IQControls.Count-1 do
      LBox.Items.AddObject((FGridControl.IQControls[I] as TComponent).Name, FGridControl.IQControls[I]);

    if LBox.Items.Count>0 then
    begin
      if FAdd then
        LBox.Selected[Lbox.Items.Count-1]:=True;
    end;
  end;

  UpdateSelection;
end;

procedure TEditorsDesignDlg.UpdateSelection;
var
  I : Integer;
  C : TComponent;
  ComponentList: IDesignerSelections;
  Prn : TWinControl;
begin
  if Active then
  begin
    MoveButton.Enabled := LBox.SelCount = 1;

    ComponentList := TDesignerSelections.Create;
    try
      with LBox do
        for I := 0 to Items.Count - 1 do
          if Selected[I] then
          begin
            C := TComponent(Items.Objects[I]);
            if C <> nil then ComponentList.Add(C);
          end;

      if (ComponentList.Count = 0) and Assigned(FGridControl) then
        ComponentList.Add(FGridControl);
    except
      raise;
    end;

    if ComponentList.Count = 1 then
    begin
      if ComponentList.Items[0] is TIQUniTabForm then
        Prn := (ComponentList.Items[0] as TIQUniTabForm)
      else if ComponentList.Items[0] is TIQUniPanel then
        Prn := (ComponentList.Items[0] as TIQUniPanel).Parent
      else
        Prn := nil;

      if Prn is TUniTabSheet then (Prn as TUniTabSheet).Show;
    end;

    Designer.SetSelections(ComponentList);
  end;
end;


procedure TEditorsDesignDlg.SelectionChanged(const ADesigner: IDesigner; const ASelection: IDesignerSelections);
var
  I: Integer;
  S: Boolean;

  function InSelection(Component: TComponent): Boolean;
  var
    I: Integer;
  begin
    Result := True;
    if ASelection <> nil then
      with ASelection do
        for I := 0 to Count - 1 do
          if Component = Items[I] then Exit;
    Result := False;
  end;

begin
  if FGridControl = nil then Exit;


  with LBox do
    for I := 0 to Items.Count - 1 do
    begin
      S := InSelection(TComponent(Items.Objects[I]));
      if Selected[I] <> S then Selected[I] := S;
    end;
end;

{ TIQControlGridDsgn }

procedure TIQControlGridDsgn.Edit;
begin
  ExecuteVerb(0);
end;

procedure TIQControlGridDsgn.ExecuteVerb(Index: Integer);
var
  uC : TIQUniGridControl;
begin
  uC :=Component as TIQUniGridControl;

  case Index of
    0 : RunEditor(uC, Designer);
  end;
end;

function TIQControlGridDsgn.GetVerb(Index: Integer): string;
begin
  case Index of
    0 : Result:='IQControls Editor...';
  end;
end;

function TIQControlGridDsgn.GetVerbCount: Integer;
begin
  Result:=1;
end;

{ TIQControlEditor }

procedure TIQControlEditor.Edit;
var
  uGrid : TIQUniGridControl;
begin
  uGrid := TIQUniGridControl(GetComponent(0));

  RunEditor(uGrid, Designer);
end;

function TIQControlEditor.GetAttributes: TPropertyAttributes;
begin
	Result := [paDialog];
end;

end.
