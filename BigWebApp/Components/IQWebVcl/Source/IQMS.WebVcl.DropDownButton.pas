unit IQMS.WebVcl.DropDownButton;

interface

uses
  Windows, Messages, SysUtils, Classes,  Controls, Forms, Dialogs,
  ExtCtrls, Menus, Vcl.Graphics,
  UniGUIClasses, uniGUIConst, UniGUIInterfaces, UniGUITypes,UniCanvas,UniMenuButton;

type

  { TIQWebDropDownButton }
  TIQWebDropDownButton = class(TUniMenuButton)
  private
    { Private declarations }

    { Internal methods }
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }

    { Inherited Properties }
    property Action;
    property Align;
    property Anchors;
    property Caption;
    property Constraints;
    property Cursor;
    property Enabled;
    property Font;
    property Height;
    property Hint;
    property HelpContext;
    property Left;

    property ParentFont;
    property ParentShowHint;
    property ShowHint;
    property Top;
    property Visible;
    property Width;

    { Inherited Methods }
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

const
  DefaultButtonWidth: Integer = 37;

implementation

constructor TIQWebDropDownButton.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);


  Width := DefaultButtonWidth;
  Height := 25;
  Caption := '';
end;

destructor TIQWebDropDownButton.Destroy;
begin
  inherited Destroy;
end;

end.
