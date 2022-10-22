unit D4WEditorDlgPickDataSet;

interface

uses
  SysUtils, Windows, Classes, Controls, uniComboBox, uniGUITypes, uniGUIClasses,
  Graphics, D4WEditor, uniGUIForm, D4WEditorDlg;

type

  TD4WEditorDlgPickDataSet = class(TD4WCustomEditorDlg)
  protected
    function DialogClass: TUniBaseFormClass; override;
    function DialogClassName: string; override;
    procedure DoBeforeShowDialog(const ADialog: TUniBaseForm); override;
    procedure DoBeforeCreateDialog; override;
  public
    constructor Create(AOwner:TComponent); override;
    procedure ExecTrigger(AButtonId : integer);
    property Field;
    property Text;
  published
    property Style;
    property MaxLength;
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
    property RemoteQuery default True;
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
    property Triggers;
    property HideTrigger;

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
    property OnDialogResult;

    property ListFormat;
    property ListOnlyMode;
    property ListField;
    property ListSource;
    property KeyField;
    property ListFieldIndex;
    property DataField;
    property DataSource;
  end;

implementation

uses
  D4WDlgPickDataSet,
  DB;

{ TD4WEditorDlgPickDataSet }

procedure TD4WEditorDlgPickDataSet.DoBeforeCreateDialog;
begin
  Assert(Assigned(ListSource) , 'Error, ListSource is required');
  Assert(KeyField  <> ''      , 'Error, KeyField is required');
  Assert(ListField <> ''      , 'Error, ListField is required');
end;

constructor TD4WEditorDlgPickDataSet.Create(AOwner: TComponent);
begin
  inherited;
  RemoteQuery := True;
end;

function TD4WEditorDlgPickDataSet.DialogClass: TUniBaseFormClass;
begin
  Result := TD4WDlgPickDataSetForm;
end;

function TD4WEditorDlgPickDataSet.DialogClassName: string;
begin
  Result := 'TD4WDlgPickDataSetForm';
end;

procedure TD4WEditorDlgPickDataSet.DoBeforeShowDialog(const ADialog: TUniBaseForm);
begin
  with (ADialog as TD4WDlgPickDataSetForm) do
  begin
    SrcDataset   := ListSource.DataSet;
    SrcKeyField  := KeyField;
    SrcListField := ListField;
  end;
end;

procedure TD4WEditorDlgPickDataSet.ExecTrigger(AButtonId: integer);
begin
  DoHandleTriggerClick(AButtonId);
end;

end.
