{
  1. add pk_hide_manager to uses and FPkHideManager: TPkHideManager to vars
  add 3 menu options (RadioItem): ViewAll
  ViewActive
  ViewInactive
  2. create FHideManager: TPkHideManager.Create(self);
  and then
  FPkHideManager.RegisterMenuItem( ViewAll1,      mvoAll      );
  FPkHideManager.RegisterMenuItem( ViewActive1  , mvoActive   );
  FPkHideManager.RegisterMenuItem( ViewInactive1, mvoInactive );
  3. FPkHideManager.LoadFromRegistry;
  4. FPkHideManager.SaveToRegistry;
  5. OnMenuClick:
  FPkHideManager.Select(Sender);
  6. Main DataSet OnFilterData:
  Accept:= FPkHideManager.CanAccept(DataSet.FieldByName('PK_HIDE').asString);
  7. Picklist:
  where misc.pk_hide_filter( pk_hide, :selected_view ) = 1

  ParamByName('selected_view').asFloat:= PkHideManager.SelectedViewIndex;
}
unit IQMS.WebVcl.PkHideManager;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  ComCtrls,
  Forms,
  Dialogs,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication,
  Menus, UniMainMenu;

type
  TMenuViewOption = (mvoAll, mvoActive, mvoInactive);

  TIQWebPkHideManager = class(TComponent)
  strict private
    FViewAll: TUniMenuItem;
    FViewActive: TUniMenuItem;
    FViewInactive: TUniMenuItem;
    function GetFilterIndex: Integer;
    function GetFilterOption: TMenuViewOption;
    procedure SetFilterIndex(const Value: Integer);
    procedure SetFilterOption(const Value: TMenuViewOption);
  strict protected
    FOwnerForm: TUniForm;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent);
    procedure RegisterMenuItem(AMenuItem: TUniMenuItem; AMenuViewOption: TMenuViewOption);
    procedure SaveToRegistry;
    procedure LoadFromRegistry;
    procedure Select(Sender: TObject); overload;
    function SelectedViewCaption: string;
    function CanAccept(APk_Hide: string): Boolean;

    function SelectedViewIndex: Integer; deprecated 'Used property FilterIndex';
    function SelectedViewOption: TMenuViewOption; deprecated 'Used property FilterOption';
    procedure Select(AIndex: Integer); overload; deprecated 'Used property FilterIndex';

    property FilterIndex: Integer read GetFilterIndex write SetFilterIndex;
    property FilterOption: TMenuViewOption read GetFilterOption write SetFilterOption;
  end;

implementation

uses
  IQMS.Common.Controls,
  IQMS.Common.RegFrm,
  IQMS.Common.ResStrings;

{ TPkHideManager }

constructor TIQWebPkHideManager.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  // Assign to private variable
  if (Owner is TUniForm) then
    FOwnerForm := TUniForm(Owner)
  else
    FOwnerForm := IQMS.Common.Controls.GetOwnerForm(AOwner);
end;


procedure TIQWebPkHideManager.LoadFromRegistry;
var
  AFilterIndex: Integer;
begin
  AFilterIndex := 0;

  if not IQRegIntegerScalarRead(FOwnerForm, 'PkHideFilter', AFilterIndex) then
    AFilterIndex := Ord(TMenuViewOption.mvoAll);

  SetFilterIndex(AFilterIndex);
end;

procedure TIQWebPkHideManager.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;

  inherited Notification(AComponent, Operation);

  if (Operation = opRemove) and (AComponent is TUniMenuItem) and (FViewAll = AComponent) then
    FViewAll := NIL;
  if (Operation = opRemove) and (AComponent is TUniMenuItem) and (FViewActive = AComponent) then
    FViewActive := NIL;
  if (Operation = opRemove) and (AComponent is TUniMenuItem) and (FViewInactive = AComponent) then
    FViewInactive := NIL;
end;

procedure TIQWebPkHideManager.RegisterMenuItem(AMenuItem: TUniMenuItem; AMenuViewOption: TMenuViewOption);
begin
  case AMenuViewOption of
    mvoAll:
      FViewAll := AMenuItem;
    mvoActive:
      FViewActive := AMenuItem;
    mvoInactive:
      FViewInactive := AMenuItem;
  end;
end;

procedure TIQWebPkHideManager.SaveToRegistry;
begin
  // 04/14/2016 (EIQ-10990) Remmed this by request.
//  if SelectedViewIndex = 2 then
//    IQRegIntegerScalarWrite(FOwnerForm, 'PkHideFilter', 0)
//  else
  IQRegIntegerScalarWrite(FOwnerForm, 'PkHideFilter', FilterIndex);
end;

procedure TIQWebPkHideManager.Select(Sender: TObject);
begin
  if Assigned(Sender) and (Sender is TUniMenuItem) then
  begin
    FViewAll.Checked := Sender = FViewAll;
    FViewActive.Checked := Sender = FViewActive;
    FViewInactive.Checked := Sender = FViewInactive;
  end;
end;

function TIQWebPkHideManager.SelectedViewCaption: string;
begin
  case FilterOption of
    // IQMS.Common.ResStrings.cTXT0000539 = 'View All';
    mvoAll:
      Result := IQMS.Common.ResStrings.cTXT0000539;
    // IQMS.Common.ResStrings.cTXT0000540 = 'View Active';
    mvoActive:
      Result := IQMS.Common.ResStrings.cTXT0000540;
    // IQMS.Common.ResStrings.cTXT0000541 = 'View Inactive';
    mvoInactive:
      Result := IQMS.Common.ResStrings.cTXT0000541;
  end;
end;

function TIQWebPkHideManager.CanAccept(APk_Hide: string): Boolean;
begin
  case FilterOption of
    mvoAll:
      Result := True;
    mvoActive:
      Result := APk_Hide <> 'Y';
    mvoInactive:
      Result := APk_Hide = 'Y';
  end;
end;

function TIQWebPkHideManager.GetFilterIndex: Integer;
begin
  Result := Ord(FilterOption);
end;

procedure TIQWebPkHideManager.SetFilterIndex(const Value: Integer);
begin
  if (Value in [Ord(Low(TMenuViewOption)) .. Ord(High(TMenuViewOption))]) then
  begin
    case TMenuViewOption(Value) of
      mvoAll:
        if Assigned(FViewAll) then
          Select(FViewAll);
      mvoActive:
        if Assigned(FViewActive) then
          Select(FViewActive);
      mvoInactive:
        if Assigned(FViewInactive) then
          Select(FViewInactive);
    end;
  end;
end;

function TIQWebPkHideManager.GetFilterOption: TMenuViewOption;
begin
  if Assigned(FViewAll) and FViewAll.Checked then
    Result := mvoAll;

  if Assigned(FViewActive) and FViewActive.Checked then
    Result := mvoActive;

  if Assigned(FViewInactive) and FViewInactive.Checked then
    Result := mvoInactive
end;

procedure TIQWebPkHideManager.SetFilterOption(const Value: TMenuViewOption);
begin
  case Value of
    mvoAll:
      if Assigned(FViewAll) then
        Select(FViewAll);
    mvoActive:
      if Assigned(FViewActive) then
        Select(FViewActive);
    mvoInactive:
      if Assigned(FViewInactive) then
        Select(FViewInactive);
  end;
end;

function TIQWebPkHideManager.SelectedViewIndex: Integer;
begin
  Result := Ord(SelectedViewOption());
end;

function TIQWebPkHideManager.SelectedViewOption: TMenuViewOption;
begin
  if Assigned(FViewAll) and FViewAll.Checked then
    Result := mvoAll;

  if Assigned(FViewActive) and FViewActive.Checked then
    Result := mvoActive;

  if Assigned(FViewInactive) and FViewInactive.Checked then
    Result := mvoInactive
end;

procedure TIQWebPkHideManager.Select(AIndex: Integer);
begin
  if (AIndex in [Ord(Low(TMenuViewOption)) .. Ord(High(TMenuViewOption))]) then
  begin
    case TMenuViewOption(AIndex) of
      mvoAll:
        if Assigned(FViewAll) then
          Select(FViewAll);
      mvoActive:
        if Assigned(FViewActive) then
          Select(FViewActive);
      mvoInactive:
        if Assigned(FViewInactive) then
          Select(FViewInactive);
    end;
  end;
end;

end.
