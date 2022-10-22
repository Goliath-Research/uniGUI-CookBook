unit IQModuleFormDesigner;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, uniToolBar,
  uniTreeView, System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  uniImageList, IQMS.WebComponents.DataControllerList, uniPageControl,
  IQUniStream, IQUniModuleFrame;

type
  TDataModuleClass = class of TDataModule;


  TIQUniModuleFormDesigner = class;

  TIQPersistModuleFormEvent = procedure(Sender: TObject; const Stream: TMemoryStream) of object;

  TIQUniModuleFormDesigner = class(TUniFrame)
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
    FCurrentFrame: TIQUniModuleFrame;
    FCurrentModule: TDataModule;
    FCurrentModuleController: TIQDataControllerLinkList;
    FOnNewModuleForm: TNotifyEvent;
    FOnSaveModuleForm: TIQPersistModuleFormEvent;
    FOnLoadModuleForm: TIQPersistModuleFormEvent;
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
    procedure SetOnSaveModuleForm(const Value: TIQPersistModuleFormEvent);
    procedure SetOnLOadModuleForm(const Value: TIQPersistModuleFormEvent);
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

    property CurrentFrame: TIQUniModuleFrame read FCurrentFrame;
    property ModuleCategory: string read FModuleCategory write SetModuleCategory;
    property ModuleName: string read FModuleName write SetModuleName;
  published
    property BinaryFormat: Boolean read FBinaryFormat write SetBinaryFormat default False;

    property AfterCreateModuleForm: TNotifyEvent read FAfterCreateModuleForm write SetAfterCreateModuleForm;
    property BeforeDestroyModuleForm: TNotifyEvent read FBeforeDestroyModuleForm write SetBeforeDestroyModuleForm;
    property OnNewModuleForm: TNotifyEvent read FOnNewModuleForm write SetOnNewModuleForm;
    property OnSaveModuleForm: TIQPersistModuleFormEvent read FOnSaveModuleForm write SetOnSaveModuleForm;
    property OnLoadModuleForm: TIQPersistModuleFormEvent read FOnLoadModuleForm write SetOnLOadModuleForm;
    property OnLoadDialog: TNotifyEvent read FOnLoadDialog write SetOnLoadDialog;
    property OnSaveDialog: TNotifyEvent read FOnSaveDialog write SetOnSaveDialog;
    property OnNewDialog: TNotifyEvent read FOnNewDialog write SetOnNewDialog;
  end;

var
  RegisteredDataModules : TStrings = nil;

implementation

uses
  IQGridDesignerSelectFrm, uniGUIApplication, IQUniGrid, IQUniEditorUtils;

{$R *.dfm}


procedure TIQUniModuleFormDesigner.DoAfterCreate;
begin
  if Assigned(FAfterCreateModuleForm) then
    FAfterCreateModuleForm(Self);
end;

procedure TIQUniModuleFormDesigner.DoBeforeDestroy;
begin
  try
    if Assigned(FBeforeDestroyModuleForm) then
      FBeforeDestroyModuleForm(Self);
  finally
    FreeAndNil(FCurrentFrame);
    FreeAndNil(FCurrentModule);
  end;
end;

procedure TIQUniModuleFormDesigner.CreateNewModuleForm(const AModuleClass: TDataModuleClass; const AName: string);
var
  I, Cnt, H, HTot: Integer;
  XModule : TDataModule;
  XModuleController : TIQDataControllerLinkList;
  XGrid : TIQUniGridControl;
  L : TIQDataControllerLink;
begin
  XModule := AModuleClass.Create(nil);
  try
    XModule.Name := AName;
    for I := 0 to XModule.ComponentCount - 1 do
      if XModule.Components[I] is TIQDataControllerLinkList then
      begin
        XModuleController := XModule.Components[I] as TIQDataControllerLinkList;
        Break;
      end;

    if XModuleController = nil then
      raise Exception.Create('Selected DataModule has no controller.');


    DoBeforeDestroy;

    FCurrentFrame := TIQUniModuleFrame.Create(Self);
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

      XGrid := TIQUniGridControl.Create(FCurrentFrame);
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


procedure TIQUniModuleFormDesigner.NewModuleActionExecute(Sender: TObject);
begin
  if Assigned(FOnNewDialog) then
    FOnNewDialog(Self);
end;

procedure TIQUniModuleFormDesigner.NewModuleCB(Sender: TComponent;
  AResult: Integer);
var
  ModuleClass: TDataModuleClass;
begin
  ModuleClass := TDataModuleClass( (Sender as TIQDesignerSelectForm).ResultClass );
  CreateNewModuleForm(ModuleClass, (Sender as TIQDesignerSelectForm).Result);
end;

procedure TIQUniModuleFormDesigner.CreateNewModule;
var
  F1 : TIQDesignerSelectForm;
begin
  F1 := TIQDesignerSelectForm.Create(UniApplication);
  F1.ShowList('Select a Data Module Class', RegisteredDataModules, NewModuleCB);
end;

procedure TIQUniModuleFormDesigner.LoadFromStream(AComponent: TComponent; AStream: TMemoryStream; ATextDFM: Boolean = True);
begin
  LoadComponentFromStream(Self.Owner, AComponent, AStream, ATextDFM);
end;

procedure TIQUniModuleFormDesigner.SaveToStream(AComponent: TComponent; AStream: TMemoryStream; ATextDFM: Boolean = True);
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

procedure TIQUniModuleFormDesigner.LoadModule;
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

procedure TIQUniModuleFormDesigner.SaveModule;
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

procedure TIQUniModuleFormDesigner.OpenModuleActionExecute(Sender: TObject);
begin
  if Assigned(FOnLoadDialog) then
    FOnLoadDialog(Self);
end;

procedure TIQUniModuleFormDesigner.SaveModuleActionExecute(Sender: TObject);
begin
  if Assigned(FOnSaveDialog) then
    FOnSaveDialog(Self);
end;

procedure TIQUniModuleFormDesigner.SetAfterCreateModuleForm(
  const Value: TNotifyEvent);
begin
  FAfterCreateModuleForm := Value;
end;

procedure TIQUniModuleFormDesigner.SetBeforeDestroyModuleForm(
  const Value: TNotifyEvent);
begin
  FBeforeDestroyModuleForm := Value;
end;

procedure TIQUniModuleFormDesigner.SetBinaryFormat(const Value: Boolean);
begin
  FBinaryFormat := Value;
end;

procedure TIQUniModuleFormDesigner.SetModuleCategory(const Value: string);
begin
  FModuleCategory := Value;
end;

procedure TIQUniModuleFormDesigner.SetModuleName(const Value: string);
begin
  FModuleName := Value;
end;

procedure TIQUniModuleFormDesigner.SetOnLoadDialog(const Value: TNotifyEvent);
begin
  FOnLoadDialog := Value;
end;

procedure TIQUniModuleFormDesigner.SetOnLOadModuleForm(
  const Value: TIQPersistModuleFormEvent);
begin
  FOnLoadModuleForm := Value;
end;

procedure TIQUniModuleFormDesigner.SetOnNewDialog(const Value: TNotifyEvent);
begin
  FOnNewDialog := Value;
end;

procedure TIQUniModuleFormDesigner.SetOnNewModuleForm(
  const Value: TNotifyEvent);
begin
  FOnNewModuleForm := Value;
end;

procedure TIQUniModuleFormDesigner.SetOnSaveDialog(const Value: TNotifyEvent);
begin
  FOnSaveDialog := Value;
end;

procedure TIQUniModuleFormDesigner.SetOnSaveModuleForm(
  const Value: TIQPersistModuleFormEvent);
begin
  FOnSaveModuleForm := Value;
end;

procedure TIQUniModuleFormDesigner.UniFrameCreate(Sender: TObject);
begin
  FModuleStream := TMemoryStream.Create;
end;

procedure TIQUniModuleFormDesigner.UniFrameDestroy(Sender: TObject);
begin
  DoBeforeDestroy;
//  FCurrentModule.Free;
  FModuleStream.Free;
end;

procedure TIQUniModuleFormDesigner.CreateFrame;
begin
  DoBeforeDestroy;

  FCurrentFrame := TIQUniModuleFrame.Create(Self);
  FCurrentFrame.Parent := UniPanelMain;
end;

procedure TIQUniModuleFormDesigner.Refresh;
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

procedure TIQUniModuleFormDesigner.UniToolButton5Click(Sender: TObject);
begin
  Refresh;
end;

initialization

finalization
  RegisteredDataModules.Free;
  RegisteredDataModules := nil;

end.
