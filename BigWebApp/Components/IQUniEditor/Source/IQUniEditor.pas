unit IQUniEditor;
{$R IQUniEditor.RES}

interface

uses
  SysUtils, Windows, Classes, Controls, uniComboBox, uniDBComboBox, uniGUITypes,
  uniGUIClasses, Graphics, uniImageList, uniDBLookupComboBox, uniDateTimePicker,
  StdCtrls, uniDBGrid;

type
  TIQUniCustomEditor = class(TUniCustomDBLookupComboBox)
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

  TIQUniEditor = class(TIQUniCustomEditor)
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

procedure IQRegisterEditor(const AName: string; const AClassType: TUniFormControlClass);
procedure IQRegisterClass(var AList: TStrings; const AName: string; const AClassType: TPersistentClass); overload;

implementation

uses
  uniCheckBox, uniDBCheckBox, uniSpinEdit, uniDBMemo, uniMemo, IQUniEditorDlgPickDataSet;

{ TIQUniEditor }

function TIQUniCustomEditor.AllowEdit: Boolean;
begin
  Result := not Self.ReadOnly;
end;

constructor TIQUniCustomEditor.Create(AOwner: TComponent);
begin
  inherited;

  Style := csDropDown;
  FImages := TUniNativeImageList.Create(Self);
  inherited Images := FImages;
  LoadIcons;
end;

destructor TIQUniCustomEditor.Destroy;
begin
  inherited;
end;

function TIQUniCustomEditor.GetIconCount: Integer;
begin
  Result := 2;
end;

function TIQUniCustomEditor.GetImages: TUniCustomImageList;
begin
  Result := FImages;
end;

procedure TIQUniCustomEditor.LoadCompleted;
begin
  inherited;
end;

procedure TIQUniCustomEditor.Loaded;
begin
  inherited;
  FImages.Name := Self.Name + 'Images';
end;

procedure TIQUniCustomEditor.LoadIcons;
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

procedure TIQUniCustomEditor.WebCreate;
begin
  inherited;
end;

procedure IQRegisterClass(var AList: TStrings; const AName: string; const AClassType: TPersistentClass);
begin
  if AList = nil then
    AList := TStringList.Create;

  if AClassType = nil then
    AList.AddObject(AName, nil)
  else if AList.IndexOfObject(TObject(AClassType)) < 0 then
    AList.AddObject(AName, TObject(AClassType));

  if AClassType<>nil then
    RegisterClass(AClassType);
end;

procedure IQRegisterEditor(const AName: string; const AClassType: TUniFormControlClass);
begin
  IQRegisterClass(RegisteredEditors, AName, AClassType);
end;

initialization


finalization
  RegisteredEditors.Free;
  RegisteredEditors := nil;

end.
