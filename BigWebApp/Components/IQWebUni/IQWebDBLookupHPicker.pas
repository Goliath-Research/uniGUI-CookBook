unit IQWebDBLookupHPicker;

interface

uses
  SysUtils, Classes, Controls, StdCtrls, DBCtrls, DB,
  UniDBLookupComboBox, UniDBComboBox, uniMultiItem,
  UniGUIJSUtils, UniDBUtils, DBConsts, UniDBLookupHelper, UniGUIInterfaces,
  Variants,
  IQWebHPick;

type

  TIQWebDBLookupHPicker = class(TUniDBLookupComboBox)
  published
    { Published declarations }
    property PickList: TIQWebHPick;
    property ListFormat;
    property ListOnlyMode;
    property ListField;
    property ListSource;
    property KeyField;
    property ListFieldIndex;
    property DataField;
    property DataSource;
    property ParentFont;
    property Font;
    property Align;
    property Anchors;
    property TabStop;
    property TabOrder;
    property ParentColor;
    property ReadOnly;
    property Color;
    property ClientEvents;
    property AutoEdit;
    property ScreenMask;
    property MatchFieldWidth;
    property RemoteQuery;
    property RemoteQueryDelay;
    property RemoteQueryCache;
    property LayoutConfig;
    property FieldLabel;
    property FieldLabelWidth default 100;
    property FieldLabelAlign;
    property Draggable;

    property OnEndDrag;
    property OnSelect;
    property OnAjaxEvent;
    property OnCloseUp;
    property OnDropDown;
    property OnKeyDown;
    property OnKeyUp;
    property OnKeyPress;
    property OnExit;
    property OnEnter;
  end;
  end;

implementation

end.
