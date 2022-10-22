unit IQUniEditorDlgPickDataSet;

interface

uses
  SysUtils, Windows, Classes, Controls, uniComboBox, uniGUITypes, uniGUIClasses,
  Graphics, IQUniEditor, uniGUIForm, IQUniEditorDlg;

type

  TIQUniEditorDlgPickDataSet = class(TIQUniCustomEditorDlg)
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
  IQUniDlgPickDataSet,
  DB;

{ TIQUniEditorDlgPickDataSet }

procedure TIQUniEditorDlgPickDataSet.DoBeforeCreateDialog;
begin
  Assert(Assigned(ListSource) , 'Error, ListSource is required');
  Assert(KeyField  <> ''      , 'Error, KeyField is required');
  Assert(ListField <> ''      , 'Error, ListField is required');
end;

constructor TIQUniEditorDlgPickDataSet.Create(AOwner: TComponent);
begin
  inherited;
  RemoteQuery := True;
end;

function TIQUniEditorDlgPickDataSet.DialogClass: TUniBaseFormClass;
begin
  Result := TIQUniDlgPickDataSetForm;
end;

function TIQUniEditorDlgPickDataSet.DialogClassName: string;
begin
  Result := 'TIQUniDlgPickDataSetForm';
end;

procedure TIQUniEditorDlgPickDataSet.DoBeforeShowDialog(const ADialog: TUniBaseForm);
begin
  with (ADialog as TIQUniDlgPickDataSetForm) do
  begin
    SrcDataset   := ListSource.DataSet;
    SrcKeyField  := KeyField;
    SrcListField := ListField;
  end;
end;

procedure TIQUniEditorDlgPickDataSet.ExecTrigger(AButtonId: integer);
begin
  DoHandleTriggerClick(AButtonId);
end;

end.
