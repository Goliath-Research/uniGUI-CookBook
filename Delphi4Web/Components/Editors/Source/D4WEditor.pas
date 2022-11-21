unit D4WEditor;

{$R D4WEditor.RES}

interface

uses
  SysUtils, Windows, Classes, Controls, uniComboBox, uniDBComboBox, uniGUITypes,
  uniGUIClasses, Graphics, uniImageList, uniDBLookupComboBox, uniDateTimePicker,
  StdCtrls, uniDBGrid;

type
  TD4WCustomEditor = class(TUniCustomDBLookupComboBox)
  private
    FImages : TUniCustomImageList;
    FDBGrid: TUniDBGrid;
    function GetImages: TUniCustomImageList;
  protected
    function GetIconCount: Integer; virtual;
    procedure LoadIcons; virtual;
    procedure WebCreate; override;
    procedure LoadCompleted; override;
    procedure Loaded; override;
    function AllowEdit: Boolean; override;

    property IconCount: Integer read GetIconCount;
    property Images: TUniCustomImageList read GetImages;
  public
    property DBGrid: TUniDBGrid read FDBGrid write FDBGrid;

    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  end;

  TD4WEditor = class(TD4WCustomEditor)
  published
    property Style;
    property MaxLength;
    property Text;
    property Items;
    property ItemIndex default -1;
    property Align;
    property Anchors;
    property ParentFont;
    property Font;
    property TabOrder;
    property TabStop;
    property ParentColor default False;
    property Color default clWindow;
    property Sorted;
    property ClientEvents;
    property MinQueryLength;
    property RemoteQuery;
    property RemoteQueryDelay;
    property RemoteQueryCache;
    property CharCase;
    property CheckChangeDelay;
    property ScreenMask;
    property ClearButton;
    property MatchFieldWidth;
    property LayoutConfig;
    property FieldLabel;
    property FieldLabelWidth default 100;
    property FieldLabelAlign;
    property Draggable;
    property Images;
    property HideTrigger;
    property Triggers;
    property DataField;
    property DataSource;

    property OnTriggerEvent;
    property OnEndDrag;
    property OnSelect;
    property OnCloseUp;
    property OnKeyDown;
    property OnDropDown;
    property OnKeyUp;
    property OnKeyPress;
    property OnExit;
    property OnEnter;
    property OnClick;
    property OnRemoteQuery;
    property OnAjaxEvent;
    property OnChange;
  end;

var
  RegisteredEditors : TStrings = nil;

procedure D4WRegisterEditor(const AName: string; const AClassType: TUniFormControlClass);
procedure D4WRegisterClass (var AList: TStrings; const AName: string; const AClassType: TPersistentClass); overload;

implementation

uses
  uniCheckBox, uniDBCheckBox, uniSpinEdit, uniDBMemo, uniMemo, D4WEditorDlgPickDataSet;

{ TD4WEditor }

function TD4WCustomEditor.AllowEdit: Boolean;
begin
  Result := not Self.ReadOnly;
end;

constructor TD4WCustomEditor.Create(AOwner: TComponent);
begin
  inherited;

  Style := csDropDown;
  FImages := TUniNativeImageList.Create(Self);
  inherited Images := FImages;
  LoadIcons;
end;

destructor TD4WCustomEditor.Destroy;
begin
  inherited;
end;

function TD4WCustomEditor.GetIconCount: Integer;
begin
  Result := 2;
end;

function TD4WCustomEditor.GetImages: TUniCustomImageList;
begin
  Result := FImages;
end;

procedure TD4WCustomEditor.LoadCompleted;
begin
  inherited;
end;

procedure TD4WCustomEditor.Loaded;
begin
  inherited;
  FImages.Name := Self.Name + 'Images';
end;

procedure TD4WCustomEditor.LoadIcons;
var
  AStream : TResourceStream;
  AResName : string;
  I: Integer;
begin
  for I := 1 to IconCount do
  begin
    AResName := 'btn_' + IntToStr(I);
    if FindResource(HInstance, PChar(AResName), RT_RCDATA)>0 then
    begin
      AStream := TResourceStream.Create(HInstance, AResName, RT_RCDATA);
      try
        (Images as TUniNativeImageList).AddImageStream(AStream, clNone);
      finally
        AStream.Free;
      end;
    end;
  end;
end;

procedure TD4WCustomEditor.WebCreate;
begin
  inherited;
end;

procedure D4WRegisterClass(var AList: TStrings; const AName: string; const AClassType: TPersistentClass);
begin
  if not Assigned(AList) then
    AList := TStringList.Create;

  if AClassType = nil then
    AList.AddObject(AName, nil)
  else if AList.IndexOfObject(TObject(AClassType)) < 0 then
    AList.AddObject(AName, TObject(AClassType));

  if AClassType<>nil then
    RegisterClass(AClassType);
end;

procedure D4WRegisterEditor(const AName: string; const AClassType: TUniFormControlClass);
begin
  D4WRegisterClass(RegisteredEditors, AName, AClassType);
end;

initialization
  RegisteredEditors := TStringList.Create;

finalization
  FreeAndNil(RegisteredEditors);

end.
