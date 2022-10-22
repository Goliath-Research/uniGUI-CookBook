unit IQMS.CostSource.Manager;

interface

uses
  Vcl.Forms,
  System.Classes,
  System.SysUtils,
  Vcl.Menus,
  Data.DB,
  IQMS.CostSource.Intf,
  IQMS.CostSource.Types,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Search,
  Generics.Collections,
  uniGUIForm,
  uniMainMenu,
  IQUniGrid;

type
  TOnAssignCostSource = procedure(const ACostSourceMenuType: TCostSourceMenuType;
    var AHandled: Boolean) of object;

  TOnUnAssignCostSource = procedure(var AHandled: Boolean) of object;

  TCostSourceManager = class(TInterfacedObject, ICostSourceManager)
  strict private
    FOwnerForm: TUniForm;
    FDataSource: TDataSource;
    FDataSet: TDataSet;
    FCostSourceMenu: TUniMenuItem;
    FMenuList: TList<TUniMenuItem>;
    FMenuItemSuffix: Integer;
    FOnAssignCostSource: TOnAssignCostSource;
    FOnUnAssignCostSource: TOnUnAssignCostSource;
    FSavedOnPopup: TNotifyEvent;
    FCostSourceOwnerType: TCostSourceOwnerType;
    FCostSourceMenuTypes: TCostSourceMenuTypes;
    FGridComponent: TComponent;
    FSecurityRegister: TIQWebSecurityRegister;
    FPostChangesImmediately: Boolean;
    FAfterAssignCostSource: TNotifyEvent;
    FBeforeAssignCostSource: TNotifyEvent;
    FAfterUnAssignCostSource: TNotifyEvent;
    FBeforeUnAssignCostSource: TNotifyEvent;
    function CreateMenuItem(
      const AParent: TUniMenuItem;
      const ACaption,
      AName: string;
      const ACostSourceMenuType: TCostSourceMenuType;
      const OnClickEvent: TNotifyEvent;
      const AAddToInternalList: Boolean = True): TUniMenuItem;
    procedure SetDataSource(const Value: TDataSource);
    procedure CostSourceMenuItem1Click(Sender: TObject);
    procedure CostSourceUnassignMenuItem1Click(Sender: TObject);
    procedure CostSourceMenuItem1Popup(Sender: TObject);
    procedure SetCostSourceMenu(const Value: TUniMenuItem);
    procedure ClearCostSourceMenus;
    procedure SetCostSourceMenuTypes(const Value: TCostSourceMenuTypes);
    procedure AssignSecurityRegister;
    procedure CheckMenuListCreated;
    procedure AssignMenuSecurity;
  protected
    procedure RegisterMenu(AMenuItem: TUniMenuItem);
    procedure RegisterDataSource(ADataSource: TDataSource);
    procedure CreateCostSourceMenus;
    procedure EnableCostSourceMenus;
    procedure EnableCostSourceMenu(const ACostSourceMenuType
      : TCostSourceMenuType);
    function SelectedCostSource: TCostSourceMenuType;
    function SelectedCostSourceID: Int64;
    function IsMultipleRecordsSelected: Boolean;
    function GetCostSourceMenu(const ACostSourceMenuType: TCostSourceMenuType)
      : TUniMenuItem;
    function GetCostSourceMenuType(const AMenuItem: TUniMenuItem)
      : TCostSourceMenuType;
  public
    /// <summary> Create an instance of class TCostSourceManager
    /// which implements the ICostSourceManager interface.
    /// </summary>
    /// <param name="AOwner">Class owner
    /// </param>
    /// <param name="AMenuItem">The menu item that will host the list of
    /// cost source submenus.
    /// </param>
    /// <param name="ADataSource">The detail datasource which contains the
    /// fields, COST_OBJECT_SOURCE and COST_OBJECT_ID.
    /// </param>
    /// <param name="ACostSourceOwnerType">The parent type where this
    /// cost source is assigned.  Each calling form will have a unique
    /// owner type.
    /// </param>
    /// <param name="ACostSourceMenuTypes">Cost source menus that should
    /// display.
    /// </param>
    /// <param name="AMenuItemSuffix">Appends a numeric suffix to cost source
    /// menu items.  Allows multiple sets of cost source menus to be created
    /// on one form.  The default value is 1.
    /// </param>
    constructor Create(
      AOwner: TComponent;
      AMenuItem: TUniMenuItem;
      ADataSource: TDataSource;
      ACostSourceOwnerType: TCostSourceOwnerType;
      ACostSourceMenuTypes: TCostSourceMenuTypes;
      AMenuItemSuffix: Byte = 1); reintroduce;
    destructor Destroy; override;

    /// <summary> Enable or disable a menu according to the cost source
    /// business rules. </summary>
    class procedure CheckEnableMenu(
      ACostSourceMenuType: TCostSourceMenuType;
      AMenuItem: TUniMenuItem;
      ADataSet: TDataSet;
      AGridComponent: TComponent;
      ASecurityRegister: TIQWebSecurityRegister);

    /// <summary> Enable or disable the "Unassign" cost source menu according
    /// to the cost source business rules. </summary>
    class procedure CheckEnableUnassignMenu(
      AMenuItem: TUniMenuItem;
      ADataSet: TDataSet;
      AGridComponent: TComponent;
      ASecurityRegister: TIQWebSecurityRegister);

    /// <summary> Either display a pick list to select a cost source, or
    /// show a summary form, if a cost source has been assigned.  Call
    /// this method when a cost source menu is clicked.
    /// </summary>
    /// <remarks>
    /// This menu does not apply to the "Unassign" cost source menu.
    /// </remarks>
    class procedure EditCostSource(
      ACostSourceMenuType: TCostSourceMenuType;
      ACostSourceOwnerType: TCostSourceOwnerType;
      ADataSource: TDataSource;
      APostChanges: Boolean);

    /// <summary> Either display a pick list to select a cost source, or
    /// show a summary form, if a cost source has been assigned.  Call
    /// this method when a cost source menu is clicked.  SQL is used
    /// to update the data.
    /// </summary>
    class procedure SQLEditCostSource(
      ATableName: string;
      ACostSourceMenuType: TCostSourceMenuType;
      ACostSourceOwnerType: TCostSourceOwnerType;
      ADataSet: TDataSet);

    /// <summary> Clear the cost source if it is assigned.  This menu
    /// is called by the "Unassign" cost source menu.
    /// </summary>
    class procedure ClearCostSource(
      ADataSet: TDataSet;
      APromptFirst: Boolean;
      APostChanges: Boolean);

    /// <summary> Clear the cost source if it is assigned.  This menu
    /// is called by the "Unassign" cost source menu. SQL is used
    /// to update the data.
    /// </summary>
    class procedure SQLClearCostSource(
      ATableName: string;
      ADataSet: TDataSet;
      APromptFirst: Boolean);

    property CostSourceOwnerType: TCostSourceOwnerType read FCostSourceOwnerType
      write FCostSourceOwnerType;

    // Properties
    /// <summary> Indicates which cost source types are supported.  All
    /// types are supported by default.
    /// </summary>
    property CostSourceMenuTypes: TCostSourceMenuTypes read FCostSourceMenuTypes
      write SetCostSourceMenuTypes;

    /// <summary> The parent "Cost Source" menu item on the owner form.
    /// The cost source menus will be created as sub-items.
    /// </summary>
    property CostSourceMenu: TUniMenuItem read FCostSourceMenu
      write SetCostSourceMenu;

    /// <summary> The datasource associated with the cost source record
    /// on the calling form.
    /// </summary>
    property DataSource: TDataSource read FDataSource write SetDataSource;
    property DataSet: TDataSet read FDataSet write FDataSet;

    /// <summary> The grid componenent on the calling form.  This property
    /// is optional, but is useful if multi-select or an IQSearch component
    /// is used.
    /// </summary>
    property AssociatedGrid: TComponent read FGridComponent
      write FGridComponent;

    /// <summary> The security component on the calling form.
    /// </summary>
    property SecurityRegister: TIQWebSecurityRegister read FSecurityRegister
      write FSecurityRegister;

    /// <summary> Indicates whether or not changes to the dataset are
    /// posted immediately.  If set to False, then the end user must
    /// post changes manually.  If set to True, then as soon as the
    /// cost source is modified, changes are posted to the dataset.
    /// </summary>
    property PostChangesImmediately: Boolean read FPostChangesImmediately
      write FPostChangesImmediately;

    // Events
    /// <summary> Executes after the cost source is assigned. </summary>
    property AfterAssignCostSource: TNotifyEvent read FAfterAssignCostSource
      write FAfterAssignCostSource;
    /// <summary> Executes after the cost source is unassigned. </summary>
    property AfterUnAssignCostSource: TNotifyEvent read FAfterUnAssignCostSource
      write FAfterUnAssignCostSource;
    /// <summary> Executes before the cost source is assigned. </summary>
    property BeforeAssignCostSource: TNotifyEvent read FBeforeAssignCostSource
      write FBeforeAssignCostSource;
    /// <summary> Executes before the cost source is unassigned. </summary>
    property BeforeUnAssignCostSource: TNotifyEvent read FBeforeUnAssignCostSource
      write FBeforeUnAssignCostSource;
    /// <summary> Assign the cost source. </summary>
    property OnAssignCostSource: TOnAssignCostSource read FOnAssignCostSource
      write FOnAssignCostSource;
    /// <summary> Unassign the cost source. </summary>
    property OnUnAssignCostSource: TOnUnAssignCostSource read FOnUnAssignCostSource
      write FOnUnAssignCostSource;
  end;

implementation

uses
  costsrc_rscstr,
  IQMS.Common.Applications,
  IQMS.Common.Dialogs,
  IQMS.Common.Numbers,
  IQMS.WebVcl.SecurityManager,
  _CostSourceDataModule,
  IQMS.CostSource.Utils,
  IQMS.Common.DataLib,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIApplication;

{ TCostSourceManager }

constructor TCostSourceManager.Create(
  AOwner: TComponent;
  AMenuItem: TUniMenuItem;
  ADataSource: TDataSource;
  ACostSourceOwnerType: TCostSourceOwnerType;
  ACostSourceMenuTypes: TCostSourceMenuTypes;
  AMenuItemSuffix: Byte);
begin
  inherited Create;
  if AMenuItemSuffix > 0 then
    FMenuItemSuffix := AMenuItemSuffix
  else
    FMenuItemSuffix := 1;
  FOwnerForm := TUniForm(AOwner);
  AssignSecurityRegister;
  // Example:
  // [ProjectManagerProject,
  // ProjectManagerTask,
  // MRO,
  // JobShop,
  // FixedAssets,
  // UnassignCostSource];
  FCostSourceMenuTypes := ACostSourceMenuTypes;
  FCostSourceOwnerType := ACostSourceOwnerType;
  CostSourceMenu := AMenuItem;
  DataSource := ADataSource;
end;

procedure TCostSourceManager.AssignMenuSecurity;
var
  i: Integer;
begin
  if Assigned(FSecurityRegister) and
    Assigned(FMenuList) then
  begin
    for i := 0 to FMenuList.Count - 1 do
      if FSecurityRegister.SecurityItems.IndexOf(
        FMenuList.Items[i].Name) = - 1 then
      begin
        FSecurityRegister.AddInternalSecurityItem(FMenuList.Items[i].Name);
      end;
    // Refresh is required.  Now that the items have been added, their
    // attributes must be read from the database; otherwise, all of the
    // menus will be disabled.
    FSecurityRegister.Refresh;
  end;
end;

procedure TCostSourceManager.AssignSecurityRegister;
var
  i: Integer;
begin
  if Assigned(FOwnerForm) then
    for i := 0 to FOwnerForm.ComponentCount - 1 do
      if (FOwnerForm.Components[i] is TIQWebSecurityRegister) then
      begin
        FSecurityRegister := FOwnerForm.Components[i] as TIQWebSecurityRegister;
        Break;
      end;
end;

class procedure TCostSourceManager.CheckEnableMenu(
  ACostSourceMenuType: TCostSourceMenuType;
  AMenuItem: TUniMenuItem;
  ADataSet: TDataSet;
  AGridComponent: TComponent;
  ASecurityRegister: TIQWebSecurityRegister);
var
  AEnabled: Boolean;

  ACostSourceValue: string;
  ACostSourceIDValue: Int64;
  AExpectedCostSourceValue: string;

begin
  // Depending upon the ACostSourceType, determine whether a cost object source
  // has been or not been assigned for that type.  If it already has been assigned,
  // then the menu is disabled; otherwise, it is enabled.  The mirror procedure to
  // EnableMenu is EnableUnassignMenu.  Each procedure does the opposite of the other.

  // Validation
  if not Assigned(ADataSet) or
    not Assigned(AMenuItem) or
    (ADataSet.FindField(CostSourceIDFieldName) = nil) or
    (ADataSet.FindField(CostSourceFieldName) = nil) then
    Exit;

  // Get the current cost source values, if assigned.
  with ADataSet do
  begin
    ACostSourceValue := Trim(FieldByName(CostSourceFieldName).AsString);
    ACostSourceIDValue := FieldByName(CostSourceIDFieldName).AsLargeInt;
  end;

  // Get the expected cost source value for comparison
  AExpectedCostSourceValue := CostSourceString[ACostSourceMenuType];

  // Determine if -- based merely on the cost source information -- whether
  // the menu may be enabled or not.  Security will apply below.
  AEnabled :=
    (
    (String.IsNullOrWhiteSpace(ACostSourceValue) or (ACostSourceIDValue = 0)) or
    ((CompareText(ACostSourceValue, AExpectedCostSourceValue) = 0) and (ACostSourceIDValue > 0))
    );

  if AEnabled then
    case ACostSourceMenuType of
      TCostSourceMenuType.ProjectManagerProject:
        AEnabled := SecurityManager.SetVisibleIfLicensed(nil { speedbtn } ,
          nil { menu } ,
          nil { separator } ,
          IQAppsNames[apTooling],
          nil { SR } );
      TCostSourceMenuType.ProjectManagerTask:
        AEnabled := SecurityManager.SetVisibleIfLicensed(nil { speedbtn } ,
          nil { menu } ,
          nil { separator } ,
          IQAppsNames[apTooling],
          nil { SR } );
      TCostSourceMenuType.MRO:
        AEnabled := SecurityManager.SetVisibleIfLicensed(nil { speedbtn } ,
          nil { menu } ,
          nil { separator } ,
          IQAppsNames[apPM],
          nil { SR } );
      TCostSourceMenuType.JobShop:
        AEnabled := SecurityManager.SetVisibleIfLicensed(nil { speedbtn } ,
          nil { menu } ,
          nil { separator } ,
          sIIf(jobshop2_licensed = 1, IQAppsNames[apJobShop2],
          IQAppsNames[apJobShop]),
          nil { SR } );
      TCostSourceMenuType.FixedAssets:
        AEnabled := SecurityManager.SetVisibleIfLicensed(nil { speedbtn } ,
          nil { menu } ,
          nil { separator } ,
          IQAppsNames[apFA],
          nil { SR } );
    else
      Exit;
    end;

  // check security
  // ASecurityRegister.ApplySecurity(AMenuItem.Name);
  if (ASecurityRegister <> nil) then
    AEnabled := AEnabled and ASecurityRegister.Enabled[AMenuItem.Name];

  // apply enabled state
  AMenuItem.Enabled := AEnabled;
//  if Assigned(AGridComponent) and
//    (AGridComponent is TIQUniGridControl) then
//    TIQUniGridControl(AGridComponent).MenuEnabled(AMenuItem, AEnabled);
end;

class procedure TCostSourceManager.CheckEnableUnassignMenu(AMenuItem: TUniMenuItem;
  ADataSet: TDataSet; AGridComponent: TComponent;
  ASecurityRegister: TIQWebSecurityRegister);
var
  AEnabled: Boolean;
begin
  // Enable or disable the 'Unassign Cost Source' menu,
  // if there is no cost source assigned
  //
  // If the fields, 'COST_OBJECT_SOURCE' and 'COST_OBJECT_ID'
  // have a value, then make 'Unassign Cost Source' on the
  // popup menu available (otherwise, there is nothing to
  // unassign).  The actual clearing of the cost object source
  // occurs in the UnAssignCostSource procedure.

  // Validation
  if not Assigned(ADataSet) or
    not Assigned(AMenuItem) or
    (ADataSet.FindField(CostSourceIDFieldName) = nil) or
    (ADataSet.FindField(CostSourceFieldName) = nil) then
    Exit;

  with ADataSet do
    AEnabled := (FieldByName(CostSourceFieldName).AsString <> '') and
      (FieldByName(CostSourceIDFieldName).AsLargeInt > 0);

  // check security
  if (ASecurityRegister <> nil) then
    AEnabled := AEnabled and ASecurityRegister.Enabled[AMenuItem.Name];

  // apply enabled state
  AMenuItem.Enabled := AEnabled;
//  if Assigned(AGridComponent) and
//    (AGridComponent is TIQUniGridControl) then
//    TIQUniGridControl(AGridComponent).MenuEnabled(AMenuItem, AEnabled);
end;

procedure TCostSourceManager.CheckMenuListCreated;
begin
  if not Assigned(FMenuList) then
    FMenuList := TList<TUniMenuItem>.Create;
end;

procedure TCostSourceManager.ClearCostSourceMenus;
var
  i: Integer;
begin
  CheckMenuListCreated;
  FMenuList.Clear;
  if Assigned(FCostSourceMenu) then
  begin
    for i := FCostSourceMenu.Count - 1 downto 0 do
      FCostSourceMenu.Delete(i);
  end;
end;

procedure TCostSourceManager.CreateCostSourceMenus;
var
  i: Integer;
  ASubMenuItem: TUniMenuItem;
begin
  if Assigned(FCostSourceMenu) then
  begin
    ClearCostSourceMenus;

    if (TCostSourceMenuType.ProjectManagerProject in FCostSourceMenuTypes) or
      (TCostSourceMenuType.ProjectManagerTask in FCostSourceMenuTypes) then
    begin
      // Project Manager (Main)
      // costsrc_rscstr.cTXT0000006 = 'Project Manager';
      ASubMenuItem := CreateMenuItem(
        FCostSourceMenu,
        costsrc_rscstr.cTXT0000006,
        Format('CostSource_ProjectManager%d', [FMenuItemSuffix]),
        TCostSourceMenuType.None,
        nil,
        False);

      // Project Manager Project
      // costsrc_rscstr.cTXT0000015 = 'Project';
      if (TCostSourceMenuType.ProjectManagerProject in FCostSourceMenuTypes)
      then
        CreateMenuItem(
          ASubMenuItem,
          costsrc_rscstr.cTXT0000015,
          Format('CostSource_ProjectManagerProject%d', [FMenuItemSuffix]),
          TCostSourceMenuType.ProjectManagerProject,
          CostSourceMenuItem1Click);

      // Project Manager Task
      // costsrc_rscstr.cTXT0000016 = 'Task';
      if (TCostSourceMenuType.ProjectManagerTask in FCostSourceMenuTypes) then
        CreateMenuItem(
          ASubMenuItem,
          costsrc_rscstr.cTXT0000016,
          Format('CostSource_ProjectManagerTask%d', [FMenuItemSuffix]),
          TCostSourceMenuType.ProjectManagerTask,
          CostSourceMenuItem1Click);
    end;

    // MRO
    // costsrc_rscstr.cTXT0000007 = 'MRO';
    if (TCostSourceMenuType.MRO in FCostSourceMenuTypes) then
      CreateMenuItem(
        FCostSourceMenu,
        costsrc_rscstr.cTXT0000007,
        Format('CostSource_MRO%d', [FMenuItemSuffix]),
        TCostSourceMenuType.MRO,
        CostSourceMenuItem1Click);

    // JobShop
    // costsrc_rscstr.cTXT0000008 = 'JobShop';
    if (TCostSourceMenuType.JobShop in FCostSourceMenuTypes) then
      CreateMenuItem(
        FCostSourceMenu,
        costsrc_rscstr.cTXT0000008,
        Format('CostSource_JobShop%d', [FMenuItemSuffix]),
        TCostSourceMenuType.JobShop,
        CostSourceMenuItem1Click);

    // Fixed Assets
    // costsrc_rscstr.cTXT0000009 = 'Fixed Assets';
    if (TCostSourceMenuType.FixedAssets in FCostSourceMenuTypes) then
      CreateMenuItem(
        FCostSourceMenu,
        costsrc_rscstr.cTXT0000009,
        Format('CostSource_FixedAssets%d', [FMenuItemSuffix]),
        TCostSourceMenuType.FixedAssets,
        CostSourceMenuItem1Click);

    // Unassign
    // costsrc_rscstr.cTXT0000021 = 'Unassign Cost Source';
    if (FCostSourceMenuTypes <> []) then
      CreateMenuItem(
        FCostSourceMenu,
        costsrc_rscstr.cTXT0000021,
        Format('CostSource_Unassign%d', [FMenuItemSuffix]),
        TCostSourceMenuType.UnassignCostSource,
        CostSourceUnassignMenuItem1Click);
  end;

  AssignMenuSecurity;
end;

procedure TCostSourceManager.RegisterDataSource(ADataSource: TDataSource);
begin
  FDataSource := ADataSource;
  if Assigned(FDataSource) then
    FDataSet := FDataSource.DataSet;
end;

procedure TCostSourceManager.RegisterMenu(AMenuItem: TUniMenuItem);
var
  APopupMenu: TUniPopupMenu;
begin
  FCostSourceMenu := AMenuItem;
  if (AMenuItem.GetParentComponent is TUniPopupMenu) then
  begin
    APopupMenu := TUniPopupMenu(AMenuItem.GetParentComponent);
    FSavedOnPopup := APopupMenu.OnPopup;
    APopupMenu.OnPopup := CostSourceMenuItem1Popup;
  end;
  CreateCostSourceMenus;
end;

function TCostSourceManager.SelectedCostSource: TCostSourceMenuType;
var
  AValue: string;
  o: TCostSourceMenuType;
begin
  Result := TCostSourceMenuType(0);
  if Assigned(FDataSet) and
    FDataSet.Active and
    (FDataSet.FindField(CostSourceFieldName) <> nil) then
  begin
    AValue := FDataSet.FieldByName(CostSourceFieldName).AsString;
    for o in [low(TCostSourceMenuType) .. high(TCostSourceMenuType)] do
      if CompareText(CostSourceString[o], AValue) = 0 then
      begin
        Result := o;
        Break;
      end;
  end;
end;

function TCostSourceManager.SelectedCostSourceID: Int64;
var
  AValue: string;
begin
  Result := 0;
  if Assigned(FDataSet) and
    FDataSet.Active and
    (FDataSet.FindField(CostSourceIDFieldName) <> nil) then
    Result := FDataSet.FieldByName(CostSourceIDFieldName).AsLargeInt;
end;

procedure TCostSourceManager.SetCostSourceMenu(const Value: TUniMenuItem);
begin
  RegisterMenu(Value);
end;

procedure TCostSourceManager.SetCostSourceMenuTypes
  (const Value: TCostSourceMenuTypes);
begin
  FCostSourceMenuTypes := Value;
  CreateCostSourceMenus;
end;

procedure TCostSourceManager.SetDataSource(const Value: TDataSource);
begin
  RegisterDataSource(Value);
end;

class procedure TCostSourceManager.ClearCostSource(ADataSet: TDataSet;
  APromptFirst, APostChanges: Boolean);
begin
  if Assigned(ADataSet) then
  begin
    // costsrc_rscstr.cTXT0000011 = 'Unassign cost source?';
    if APromptFirst and not IQConfirmYN(costsrc_rscstr.cTXT0000011) then
      Exit;

    // Edit mode
    if not (ADataSet.State in [dsEdit, dsInsert]) then
      ADataSet.Edit;

    // Clear fields
    if ADataSet.FindField(CostSourceIDFieldName) <> nil then
      ADataSet.FieldByName(CostSourceIDFieldName).Clear;
    if ADataSet.FindField(CostSourceFieldName) <> nil then
      ADataSet.FieldByName(CostSourceFieldName).Clear;

    if APostChanges then
    begin
      ADataSet.Post;
      // Allows the cost source display field to refresh,
      // since it is contained within the SQL.
      RefreshDataSetByID(ADataSet);
    end;
  end;
end;

class procedure TCostSourceManager.SQLClearCostSource(ATableName: string;
  ADataSet: TDataSet; APromptFirst: Boolean);
var
  ASelectedDataSetID: Int64;
begin
  if Assigned(ADataSet) then
  begin
    // Get ID values
    ASelectedDataSetID := ADataSet.FieldByName('ID').AsLargeInt;

    if ASelectedDataSetID = 0 then
      Exit;

    // costsrc_rscstr.cTXT0000011 = 'Unassign cost source?';
    if APromptFirst and not IQConfirmYN(costsrc_rscstr.cTXT0000011) then
      Exit;

    // Clear fields
    ExecuteCommandFmt(
      'UPDATE %s                        '#13 +
      '  SET cost_object_source = NULL, '#13 +
      '      cost_object_id = NULL      '#13 +
      'WHERE id = %d',
      [ATableName,
      ASelectedDataSetID]);

    // Always refresh
    RefreshDataSetByID(ADataSet);
  end;
end;

function TCostSourceManager.CreateMenuItem(const AParent: TUniMenuItem;
  const ACaption, AName: string; const ACostSourceMenuType: TCostSourceMenuType;
  const OnClickEvent: TNotifyEvent; const AAddToInternalList: Boolean)
  : TUniMenuItem;
begin
  Result := TUniMenuItem.Create(FOwnerForm);
  Result.Caption := ACaption;
  Result.Name := AName;
  Result.Tag := Ord(ACostSourceMenuType);
  Result.OnClick := OnClickEvent;
  AParent.Add(Result);
  if AAddToInternalList then
    FMenuList.Add(Result);
end;

destructor TCostSourceManager.Destroy;
begin
  if Assigned(FMenuList) then
    FMenuList.Free;
  inherited Destroy;
end;

function TCostSourceManager.IsMultipleRecordsSelected: Boolean;
begin
  Result := False;
  if Assigned(FGridComponent) then
  begin
      if (FGridComponent is TIQUniGridControl) then
      Result := True
    else if (FGridComponent is TIQUniGridControl) then
      Result := True;

//    if (FGridComponent is TIQUniGridControl) then //and
//      {(dgMultiSelect in TIQUniGridControl(FGridComponent).Options) and }
//      ({TIQUniGridControl(FGridComponent).SelectedList.Count > 1) then }
//      Result := True
//    else if (FGridComponent is TIQUniGridControl) then //and
//     { (dgMultiSelect in TIQUniGridControl(FGridComponent).Options) and
//      (TIQUniGridControl(FGridComponent).wwdbgrid.SelectedList.Count > 1)  then }
//      Result := True;
  end;
end;

class procedure TCostSourceManager.EditCostSource(
  ACostSourceMenuType: TCostSourceMenuType;
  ACostSourceOwnerType: TCostSourceOwnerType;
  ADataSource: TDataSource;
  APostChanges: Boolean);
var
  AValue: Int64;
  ASelectedCostSourceID: Int64;
  ASelectedDataSetID: Int64;
begin
  if Assigned(ADataSource) and
    Assigned(ADataSource.DataSet) and
    ADataSource.DataSet.Active then
    with ADataSource.DataSet do
    begin
      // Validation
      if (FindField(CostSourceIDFieldName) = nil) or
        (FindField(CostSourceFieldName) = nil) then
        // costsrc_rscstr.cTXT0000001 =
        // 'Cost Sourcing is unavailable for this dataset'
        raise Exception.Create(costsrc_rscstr.cTXT0000001);

      // Get ID values
      ASelectedDataSetID := ADataSource.DataSet.FieldByName('ID').AsLargeInt;
      ASelectedCostSourceID := ADataSource.DataSet.FieldByName
        (CostSourceIDFieldName).AsLargeInt;

      // Unassign the cost source
      if ACostSourceMenuType = TCostSourceMenuType.UnassignCostSource then
        TCostSourceManager.ClearCostSource(
          ADataSource.DataSet,
          True,
          APostChanges)

        // Assign the cost source
      else if (ASelectedCostSourceID = 0) and
        not TCostSourceDataModule.IsDataSetReadOnly(ADataSource.DataSet) and
        TCostSourceDataModule.PromptCostSource(
        ACostSourceMenuType,
        AValue) then
        IQMS.CostSource.Utils.SafeAssignCostSourceFields(
          ADataSource,
          ACostSourceMenuType,
          AValue,
          APostChanges)

        // Show the cost source summary
      else if (ASelectedCostSourceID > 0) then
        TCostSourceDataModule.ShowSummary(
          ACostSourceOwnerType,
          ACostSourceMenuType,
          ASelectedDataSetID);
    end;
end;

class procedure TCostSourceManager.SQLEditCostSource(
  ATableName: string;
  ACostSourceMenuType: TCostSourceMenuType;
  ACostSourceOwnerType: TCostSourceOwnerType;
  ADataSet: TDataSet);
var
  AValue: Int64;
  ASelectedCostSourceID: Int64;
  ASelectedDataSetID: Int64;
begin
  if Assigned(ADataSet) then
    with ADataSet do
    begin
      // Get ID values
      ASelectedDataSetID := FieldByName('ID').AsLargeInt;
      ASelectedCostSourceID := FieldByName(CostSourceIDFieldName).AsLargeInt;

      if ASelectedDataSetID = 0 then
        Exit;

      // Unassign the cost source
      if ACostSourceMenuType = TCostSourceMenuType.UnassignCostSource then
      begin
        ExecuteCommandFmt(
          'UPDATE %s                        '#13 +
          '  SET cost_object_source = NULL, '#13 +
          '      cost_object_id = NULL      '#13 +
          'WHERE id = %d',
          [ATableName,
          ASelectedDataSetID]);
        RefreshDataSetByID(ADataSet);
      end

      // Assign the cost source
      else if (ASelectedCostSourceID = 0) and
        TCostSourceDataModule.PromptCostSource(
        ACostSourceMenuType,
        AValue) then
      begin
        ExecuteCommandFmt(
          'UPDATE %s                          '#13 +
          '  SET cost_object_source = ''%s'', '#13 +
          '      cost_object_id = %d          '#13 +
          'WHERE id = %d',
          [ATableName,
          CostSourceString[ACostSourceMenuType],
          AValue,
          ASelectedDataSetID]);
        RefreshDataSetByID(ADataSet);
      end
      // Show the cost source summary
      else
        TCostSourceDataModule.ShowSummary(
          ACostSourceOwnerType,
          ACostSourceMenuType,
          ASelectedDataSetID);
    end;
end;

procedure TCostSourceManager.EnableCostSourceMenu(
  const ACostSourceMenuType: TCostSourceMenuType);
begin
  if ACostSourceMenuType = TCostSourceMenuType.UnassignCostSource then
    TCostSourceManager.CheckEnableUnassignMenu(
      GetCostSourceMenu(TCostSourceMenuType.UnassignCostSource),
      FDataSet,
      FGridComponent,
      FSecurityRegister)
  else
    TCostSourceManager.CheckEnableMenu(
      ACostSourceMenuType,
      GetCostSourceMenu(ACostSourceMenuType),
      FDataSet,
      FGridComponent,
      FSecurityRegister);
end;

procedure TCostSourceManager.EnableCostSourceMenus;
var
  i: Integer;

  function _CheckSecurity(AName: string): Boolean;
  begin
    if Assigned(FSecurityRegister) then
      Result := FSecurityRegister.Enabled[AName]
    else
      Result := True;
  end;

begin
  if Assigned(FCostSourceMenu) then
    for i := 0 to FCostSourceMenu.Count - 1 do
      if TCostSourceMenuType(FCostSourceMenu.Items[i].Tag) <>
        TCostSourceMenuType.UnassignCostSource then
        FCostSourceMenu.Items[i].Enabled := _CheckSecurity(
          FCostSourceMenu.Items[i].Name)
      else
        FCostSourceMenu.Items[i].Enabled := False;
end;

function TCostSourceManager.GetCostSourceMenu(
  const ACostSourceMenuType: TCostSourceMenuType): TUniMenuItem;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to FMenuList.Count - 1 do
    if FMenuList.Items[i].Tag = Ord(ACostSourceMenuType) then
    begin
      Result := FMenuList.Items[i];
      Break;
    end;
end;

function TCostSourceManager.GetCostSourceMenuType(
  const AMenuItem: TUniMenuItem): TCostSourceMenuType;
begin
  Result := TCostSourceMenuType(0);
  if Assigned(AMenuItem) then
    Result := TCostSourceMenuType(AMenuItem.Tag);
end;

procedure TCostSourceManager.CostSourceMenuItem1Popup(Sender: TObject);
begin
  // If there is only one selected, then we do the usual routine
  // and enable/disable Vcl.Menus according to the current records cost source data.
  // Otherwise, we allow all Vcl.Menus to be enabled.
  if IsMultipleRecordsSelected then
    EnableCostSourceMenus
  else
  begin
    EnableCostSourceMenu(TCostSourceMenuType.ProjectManagerProject);
    EnableCostSourceMenu(TCostSourceMenuType.ProjectManagerTask);
    EnableCostSourceMenu(TCostSourceMenuType.MRO);
    EnableCostSourceMenu(TCostSourceMenuType.JobShop);
    EnableCostSourceMenu(TCostSourceMenuType.FixedAssets);
    EnableCostSourceMenu(TCostSourceMenuType.UnassignCostSource);
  end
end;

procedure TCostSourceManager.CostSourceUnassignMenuItem1Click(Sender: TObject);
var
  AHandled: Boolean;
begin
  if Assigned(FBeforeUnAssignCostSource) then
    FBeforeUnAssignCostSource(Sender);

  if Assigned(FOnUnAssignCostSource) then
    FOnUnAssignCostSource(AHandled);

  if AHandled then
    Exit;

  TCostSourceManager.ClearCostSource(FDataSet, True, FPostChangesImmediately);

  if Assigned(FAfterUnAssignCostSource) then
    FAfterUnAssignCostSource(Sender);
end;

procedure TCostSourceManager.CostSourceMenuItem1Click(Sender: TObject);
var
  ACostSourceMenuType: TCostSourceMenuType;
  AHistory: Boolean;
  AHandled: Boolean;
begin
  ACostSourceMenuType := GetCostSourceMenuType(Sender as TUniMenuItem);
  AHandled := False;

  if Assigned(FBeforeAssignCostSource) then
    FBeforeAssignCostSource(Sender);

  if Assigned(FOnAssignCostSource) then
    FOnAssignCostSource(ACostSourceMenuType, AHandled);

  if not AHandled and (Sender is TUniMenuItem) then
  begin
    TCostSourceManager.EditCostSource(
      ACostSourceMenuType,
      FCostSourceOwnerType,
      FDataSource,
      PostChangesImmediately);
  end;

  if Assigned(FAfterAssignCostSource) then
    FAfterAssignCostSource(Sender);
end;

end.
