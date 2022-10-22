unit IQMS.WebVcl.DBGrid;

interface

uses

  SysUtils,
  Messages,
  Classes,
  Graphics,
  Controls,
  Grids,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBGrid;

type
  TIQWebDBGrid = class(TUniDBGrid)
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure DoOnDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
        Column: TUniBaseDBGridColumn; Attribs: TUniCellAttribs); override;
  public
    { Public declarations }

    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y:Integer); override;
    procedure MouseMove(Shift: TShiftState; X,Y:integer); override;
  published
    { Published declarations }
    property OnMouseDown;
    property OnMouseMove;
  end;

implementation

procedure TIQWebDBGrid.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y:Integer);
var
  FOnMouseDown: TMouseEvent;
  KeepSelected: Boolean;
begin
  KeepSelected:= (dgMultiSelect in Options)
                 and Assigned(DataSource.DataSet) and DataSource.DataSet.Active
                 and ( ([ssLeft] = Shift) or ([ssRight] = Shift) )
                 and ( not (dgTitles in Options));

  if KeepSelected then
     inherited MouseDown(Button, Shift + [ssCtrl], X, Y)
  else
     inherited MouseDown(Button, Shift, X, Y);

//  if KeepSelected then
//    SelectedRows.CurrentRowSelected := not SelectedRows.CurrentRowSelected;

  if not (dgTitles in Options) then
  begin
    FOnMouseDown:= OnMouseDown;

    if Assigned(FOnMouseDown) then FOnMouseDown(self, Button, Shift, X, Y);
  end;
end;

procedure TIQWebDBGrid.DoOnDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniBaseDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (dgMultiSelect in Options) then
     if SelectedRows.Count>0 then
          Attribs.Font.Color := clYellow;
  inherited;
end;


procedure TIQWebDBGrid.MouseMove(Shift: TShiftState; X,Y:integer);
var
  FMouseMove:TMouseMoveEvent;
begin
  inherited MouseMove(Shift, X, Y);
  FMouseMove:= OnMouseMove;
  if Assigned(FMouseMove) then FMouseMove(self, Shift, X, Y);
end;

end.

