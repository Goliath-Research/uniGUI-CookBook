unit D4WModuleFormDesigner;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, uniToolBar,
  uniTreeView, System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  uniImageList, D4W.DataControllerList, uniPageControl,
  D4WStream, D4WModuleFrame;

type
  TDataModuleClass = class of TDataModule;

  TD4WPersistModuleFormEvent = procedure(Sender: TObject; const Stream: TMemoryStream) of object;

  TD4WModuleFrmDsgnr = class(TUniFrame)
    LeftPanel: TUniPanel;
    UniToolBar2: TUniToolBar;
    ActionList1: TActionList;
    NewModuleAction: TAction;
    UniNativeImageList1: TUniNativeImageList;
    UniImageListAdapter1: TUniImageListAdapter;
    UniToolButton1: TUniToolButton;
    UniToolButton2: TUniToolButton;
    SaveModuleAction: TAction;
    UniPanelMain: TUniPanel;
    OpenModuleAction: TAction;
    UniToolButton3: TUniToolButton;
    UniToolButton4: TUniToolButton;
    UniToolButton5: TUniToolButton;
    procedure UniFrameDestroy(Sender: TObject);
    procedure SaveModuleActionExecute(Sender: TObject);
    procedure OpenModuleActionExecute(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure UniToolButton5Click(Sender: TObject);
    procedure NewModuleActionExecute(Sender: TObject);
  private
    { Private declarations }
    FCurrentFrame: TD4WModuleFrame;
    FCurrentModule: TDataModule;
    FCurrentModuleController: TD4WDataControllerLinkList;
    FOnNewModuleForm: TNotifyEvent;
    FOnSaveModuleForm: TD4WPersistModuleFormEvent;
    FOnLoadModuleForm: TD4WPersistModuleFormEvent;
    FModuleStream : TMemoryStream;
    FBinaryFormat: Boolean;
    FAfterCreateModuleForm: TNotifyEvent;
    FBeforeDestroyModuleForm: TNotifyEvent;
    FOnLoadDialog: TNotifyEvent;
    FOnSaveDialog: TNotifyEvent;
    FOnNewDialog: TNotifyEvent;
    FModuleName: string;
    FModuleCategory: string;
    procedure NewModuleCB(Sender: TComponent; AResult:Integer);
    procedure CreateNewModuleForm(const AModuleClass: TDataModuleClass; const AName: string);
    procedure SetOnSaveModuleForm(const Value: TD4WPersistModuleFormEvent);
    procedure SetOnLOadModuleForm(const Value: TD4WPersistModuleFormEvent);
    procedure SetBinaryFormat(const Value: Boolean);
    procedure Refresh;
    procedure LoadFromStream(AComponent: TComponent; AStream: TMemoryStream; ATextDFM: Boolean = True);
    procedure SaveToStream(AComponent: TComponent; AStream: TMemoryStream; ATextDFM: Boolean = True);
    procedure CreateFrame;
    procedure SetAfterCreateModuleForm(const Value: TNotifyEvent);
    procedure SetBeforeDestroyModuleForm(const Value: TNotifyEvent);
    procedure DoAfterCreate;
    procedure DoBeforeDestroy;
    procedure SetOnNewModuleForm(const Value: TNotifyEvent);
    procedure SetOnLoadDialog(const Value: TNotifyEvent);
    procedure SetOnSaveDialog(const Value: TNotifyEvent);
    procedure SetOnNewDialog(const Value: TNotifyEvent);
    procedure SetModuleCategory(const Value: string);
    procedure SetModuleName(const Value: string);
  public
    { Public declarations }
    procedure LoadModule;
    procedure SaveModule;
    procedure CreateNewModule;

    property CurrentFrame: TD4WModuleFrame read FCurrentFrame;
    property ModuleCategory: string read FModuleCategory write SetModuleCategory;
    property ModuleName: string read FModuleName write SetModuleName;
  published
    property BinaryFormat: Boolean read FBinaryFormat write SetBinaryFormat default False;

    property AfterCreateModuleForm: TNotifyEvent read FAfterCreateModuleForm write SetAfterCreateModuleForm;
    property BeforeDestroyModuleForm: TNotifyEvent read FBeforeDestroyModuleForm write SetBeforeDestroyModuleForm;
    property OnNewModuleForm: TNotifyEvent read FOnNewModuleForm write SetOnNewModuleForm;
    property OnSaveModuleForm: TD4WPersistModuleFormEvent read FOnSaveModuleForm write SetOnSaveModuleForm;
    property OnLoadModuleForm: TD4WPersistModuleFormEvent read FOnLoadModuleForm write SetOnLOadModuleForm;
    property OnLoadDialog: TNotifyEvent read FOnLoadDialog write SetOnLoadDialog;
    property OnSaveDialog: TNotifyEvent read FOnSaveDialog write SetOnSaveDialog;
    property OnNewDialog: TNotifyEvent read FOnNewDialog write SetOnNewDialog;
  end;

var
  RegisteredDataModules : TStrings = nil;

implementation

uses
  D4WGridDesignerSelectFrm, uniGUIApplication, D4W.HyperGrid, D4WEditorUtils;

{$R *.dfm}


procedure TD4WModuleFrmDsgnr.DoAfterCreate;
begin
  if Assigned(FAfterCreateModuleForm) then
    FAfterCreateModuleForm(Self);
end;

procedure TD4WModuleFrmDsgnr.DoBeforeDestroy;
begin
  try
    if Assigned(FBeforeDestroyModuleForm) then
      FBeforeDestroyModuleForm(Self);
  finally
    FreeAndNil(FCurrentFrame);
    FreeAndNil(FCurrentModule);
  end;
end;

procedure TD4WModuleFrmDsgnr.CreateNewModuleForm(const AModuleClass: TDataModuleClass; const AName: string);
var
  I, Cnt, H, HTot: Integer;
  XModule : TDataModule;
  XModuleController : TD4WDataControllerLinkList;
  XGrid : TD4WHyperGrid;
  L : TD4WDataControllerLink;
begin
  XModule := AModuleClass.Create(nil);
  XModuleController := nil;
  try
    XModule.Name := AName;
    for I := 0 to XModule.ComponentCount - 1 do
      if XModule.Components[I] is TD4WDataControllerLinkList then
      begin
        XModuleController := XModule.Components[I] as TD4WDataControllerLinkList;
        Break;
      end;

    if XModuleController = nil then
      raise Exception.Create('Selected DataModule has no controller.');


    DoBeforeDestroy;

    FCurrentFrame := TD4WModuleFrame.Create(Self);
    FCurrentFrame.AlignmentControl := uniAlignmentClient;
    FCurrentFrame.Parent := UniPanelMain;
    FCurrentFrame.Layout := 'border';
    FCurrentFrame.Controller := XModuleController;
    FCurrentFrame.Name := AModuleClass.ClassName + '_Form';
    FCurrentFrame.ModuleName := Self.ModuleName;
    FCurrentFrame.ModuleCategory := Self.ModuleCategory;

    if Assigned(FOnNewModuleForm) then FOnNewModuleForm(Self);
    
    Cnt := XModuleController.DataControllerLinks.Count;
    H := 100 div Cnt;
    HTot := 0;
    for I := 0 to  Cnt - 1 do
    begin
      L := XModuleController.DataControllerLinks.Items[I];

      XGrid := TD4WHyperGrid.Create(FCurrentFrame);
      XGrid.Parent := FCurrentFrame;
      XGrid.DesignerParent := LeftPanel;
      XGrid.Controller := FCurrentFrame.Controller;
      XGrid.DataSource := L.DataSource;
      XGrid.ToolbarActions := L.ToolbarActions;
      XGrid.LayoutConfig.Split := True;


      if I = Cnt - 1 then
      begin
        XGrid.LayoutConfig.Region := 'Center';
        XGrid.LayoutConfig.Height := Format('%0.d%%', [100 - HTot]);
      end
      else
      begin
        XGrid.LayoutConfig.Region := 'north';
        XGrid.LayoutConfig.Height := Format('%0.d%%', [H]);
      end;

      Inc(HTot, H);

      if L.IsPrimaryLink then
        XGrid.Name := PrimaryGridName
      else
        XGrid.Name := 'Grid'+IntToStr(I);

    end;

    FCurrentModule := XModule;
    FCurrentModuleController := XModuleController;

    DoAfterCreate;
  except
    FreeAndNil(XModule);
    raise;
  end;
end;


procedure TD4WModuleFrmDsgnr.NewModuleActionExecute(Sender: TObject);
begin
  if Assigned(FOnNewDialog) then
    FOnNewDialog(Self);
end;

procedure TD4WModuleFrmDsgnr.NewModuleCB(Sender: TComponent;
  AResult: Integer);
var
  ModuleClass: TDataModuleClass;
begin
  ModuleClass := TDataModuleClass( (Sender as TD4WDesignerSelectForm).ResultClass );
  CreateNewModuleForm(ModuleClass, (Sender as TD4WDesignerSelectForm).Result);
end;

procedure TD4WModuleFrmDsgnr.CreateNewModule;
var
  F1 : TD4WDesignerSelectForm;
begin
  F1 := TD4WDesignerSelectForm.Create(UniApplication);
  F1.ShowList('Select a Data Module Class', RegisteredDataModules, NewModuleCB);
end;

procedure TD4WModuleFrmDsgnr.LoadFromStream(AComponent: TComponent; AStream: TMemoryStream; ATextDFM: Boolean = True);
begin
  LoadComponentFromStream(Self.Owner, AComponent, AStream, ATextDFM);
end;

procedure TD4WModuleFrmDsgnr.SaveToStream(AComponent: TComponent; AStream: TMemoryStream; ATextDFM: Boolean = True);
var
  FTemp: TMemoryStream;
begin
  AStream.Position := 0;
  AStream.WriteComponent(AComponent);
  AStream.Position := 0;
  if ATextDFM then
  begin
    FTemp := TMemoryStream.Create;
    try
      ObjectBinaryToText(AStream, FTemp);
      AStream.LoadFromStream(FTemp);
      AStream.Position := 0;
    finally
      FTemp.Free;
    end;
  end;
end;

procedure TD4WModuleFrmDsgnr.LoadModule;
begin
  if Assigned(FOnLoadModuleForm) then
  begin
    CreateFrame;

    FModuleStream.Clear;
    FOnLoadModuleForm(Self, FModuleStream);

    try
      LoadFromStream(FCurrentFrame, FModuleStream, not FBinaryFormat);
      DoAfterCreate;
    except
      DoBeforeDestroy;
      raise;
    end;
  end;
end;

procedure TD4WModuleFrmDsgnr.SaveModule;
begin
  if Assigned(FOnSaveModuleForm) and Assigned(FCurrentFrame) then
  begin
    FCurrentFrame.EnableAll;
    try
      SaveToStream(FCurrentFrame, FModuleStream, not FBinaryFormat);
      FOnSaveModuleForm(Self, FModuleStream);
    finally
      FCurrentFrame.RestoreEnabled;
    end;
  end;
end;

procedure TD4WModuleFrmDsgnr.OpenModuleActionExecute(Sender: TObject);
begin
  if Assigned(FOnLoadDialog) then
    FOnLoadDialog(Self);
end;

procedure TD4WModuleFrmDsgnr.SaveModuleActionExecute(Sender: TObject);
begin
  if Assigned(FOnSaveDialog) then
    FOnSaveDialog(Self);
end;

procedure TD4WModuleFrmDsgnr.SetAfterCreateModuleForm(
  const Value: TNotifyEvent);
begin
  FAfterCreateModuleForm := Value;
end;

procedure TD4WModuleFrmDsgnr.SetBeforeDestroyModuleForm(
  const Value: TNotifyEvent);
begin
  FBeforeDestroyModuleForm := Value;
end;

procedure TD4WModuleFrmDsgnr.SetBinaryFormat(const Value: Boolean);
begin
  FBinaryFormat := Value;
end;

procedure TD4WModuleFrmDsgnr.SetModuleCategory(const Value: string);
begin
  FModuleCategory := Value;
end;

procedure TD4WModuleFrmDsgnr.SetModuleName(const Value: string);
begin
  FModuleName := Value;
end;

procedure TD4WModuleFrmDsgnr.SetOnLoadDialog(const Value: TNotifyEvent);
begin
  FOnLoadDialog := Value;
end;

procedure TD4WModuleFrmDsgnr.SetOnLOadModuleForm(
  const Value: TD4WPersistModuleFormEvent);
begin
  FOnLoadModuleForm := Value;
end;

procedure TD4WModuleFrmDsgnr.SetOnNewDialog(const Value: TNotifyEvent);
begin
  FOnNewDialog := Value;
end;

procedure TD4WModuleFrmDsgnr.SetOnNewModuleForm(
  const Value: TNotifyEvent);
begin
  FOnNewModuleForm := Value;
end;

procedure TD4WModuleFrmDsgnr.SetOnSaveDialog(const Value: TNotifyEvent);
begin
  FOnSaveDialog := Value;
end;

procedure TD4WModuleFrmDsgnr.SetOnSaveModuleForm(
  const Value: TD4WPersistModuleFormEvent);
begin
  FOnSaveModuleForm := Value;
end;

procedure TD4WModuleFrmDsgnr.UniFrameCreate(Sender: TObject);
begin
  FModuleStream := TMemoryStream.Create;
end;

procedure TD4WModuleFrmDsgnr.UniFrameDestroy(Sender: TObject);
begin
  DoBeforeDestroy;
//  FCurrentModule.Free;
  FModuleStream.Free;
end;

procedure TD4WModuleFrmDsgnr.CreateFrame;
begin
  DoBeforeDestroy;

  FCurrentFrame := TD4WModuleFrame.Create(Self);
  FCurrentFrame.Parent := UniPanelMain;
end;

procedure TD4WModuleFrmDsgnr.Refresh;
begin
  if FCurrentFrame <> nil then
  begin
    FCurrentFrame.EnableAll;
    SaveToStream(FCurrentFrame, FModuleStream, not FBinaryFormat);
    CreateFrame;
    try
      LoadFromStream(FCurrentFrame, FModuleStream, not FBinaryFormat);
      DoAfterCreate;
    except
      DoBeforeDestroy;
      raise;
    end;
  end;
end;

procedure TD4WModuleFrmDsgnr.UniToolButton5Click(Sender: TObject);
begin
  Refresh;
end;

initialization

finalization
  RegisteredDataModules.Free;
  RegisteredDataModules := nil;

end.
