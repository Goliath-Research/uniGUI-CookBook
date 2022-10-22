unit D4WEditorDlgSample;

interface

uses
  SysUtils, Graphics, D4WEditorDlg, Controls;

type
  TD4WEditorDlgA = class(TD4WCustomEditorDlg)
  protected
    function DialogClassName: string; override;
  published
   { published declarations }
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
  end;


implementation

{ TD4WEditorDlgA }

function TD4WEditorDlgA.DialogClassName: string;
begin
  Result := 'TD4WDialogA';
end;

end.
