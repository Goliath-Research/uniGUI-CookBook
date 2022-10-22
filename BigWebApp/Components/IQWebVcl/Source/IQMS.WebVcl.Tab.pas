unit IQMS.WebVcl.Tab;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DB;

const

  PrevKey = VK_F2;
  NextKey = VK_F4;


type
  TIQWebTab = class(TComponent)
  private
    { Private declarations }
    FItems: TStringList;
    FNextShift:TShiftState;
    FPrevShift:TShiftState;

    FCurrentIndex:Integer;
    FOnKeyDown: TKeyEvent;

    FIncrement:Integer;

    procedure SetItems(Value: TStringList);
    function FindControl(AParent: TWinControl):TWinControl;
    function FindFirstTabStopControl(AParent: TWinControl):TWinControl;
    procedure SetNewFocus;
  protected
    { Protected declarations }
    procedure Loaded; override;
    procedure ChangeCurrentIndex;
    procedure EvaluateKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  public
    { Public declarations }
    procedure SetInitialFocus(AIndex:Integer);
  published
    { Published declarations }
    constructor Create(AOwner:TComponent);override;

    property Items: TStringList read FItems write SetItems;

    property NextShift: TShiftState read FNextShift write FNextShift;
    property PrevShift: TShiftState read FPrevShift write FPrevShift;
  end;

implementation

uses
  IQMS.Common.DataLib;

constructor TIQWebTab.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FItems := TStringList.Create;
  FCurrentIndex := 0;
end;

procedure TIQWebTab.SetItems(Value: TStringList);
begin
  Items.Assign(Value);
end;

procedure TIQWebTab.Loaded;
begin
  inherited Loaded;
  FOnKeyDown      := TForm(Owner).OnKeyDown;  
  TForm(Owner).OnKeyDown := EvaluateKeyDown;  
  TForm(Owner).KeyPreView := True;
end;

procedure TIQWebTab.SetInitialFocus(AIndex:Integer);
begin 
  FCurrentIndex := AIndex;
  SetNewFocus;
end;

procedure TIQWebTab.SetNewFocus;
var
  I:Integer;
  AControl:TWinControl;
begin
  AControl:= NIL;
  for I := 0 to Items.Count -1 do
  begin
    AControl := FindControl(TWinControl(Owner));
    if not Assigned(AControl) or not AControl.CanFocus then
      ChangeCurrentIndex
    else
    begin
      if not AControl.TabStop then
      begin
        AControl := FindFirstTabStopControl(AControl);
        if not Assigned(AControl) or not AControl.CanFocus then
          ChangeCurrentIndex
        else
        begin
          AControl.SetFocus;
          Exit;
        end;
      end
      else
      begin
        AControl.SetFocus;
        Exit;
      end;
    end;
  end;
end;

function TIQWebTab.FindFirstTabStopControl(AParent: TWinControl):TWinControl;
var
  I : Integer;
begin
  Result:= NIL;
  
  
  if AParent.TabStop then
     begin
       Result:= AParent;
       EXIT;
     end
  else
     for I:= 0 to AParent.ControlCount - 1 do
     begin
       if AParent.Controls[ I ] is TWinControl then
          Result:= FindFirstTabStopControl( TWinControl( AParent.Controls[ I ] ));
       if Assigned( Result ) then
          EXIT;
     end;
end;

function TIQWebTab.FindControl( AParent: TWinControl ):TWinControl;
var
  I : Integer;
begin
  Result:= NIL;
  if CompareText(AParent.Name, Items[ FCurrentIndex ]) = 0 then
     begin
       Result:= AParent;
       EXIT;
     end
  else
     for I:= 0 to AParent.ControlCount - 1 do
     begin
       if AParent.Controls[ I ] is TWinControl then
          Result:= FindControl( TWinControl( AParent.Controls[ I ] ));
       if Assigned( Result ) then
          EXIT;
     end;
end;

procedure TIQWebTab.EvaluateKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Assigned(FOnKeyDown) then
    FOnKeyDown(Sender, Key, Shift);

  if Items.Count < 1 then Exit;

  if      (Shift = PrevShift) and (Key = PrevKey) then
    FIncrement := -1
  else if (Shift = NextShift) and (Key = NextKey) then
    FIncrement := 1;

  if ( (Shift = PrevShift) and (Key = PrevKey) )
  or ( (Shift = NextShift) and (Key = NextKey) ) then
  begin
    ChangeCurrentIndex;
    SetNewFocus;
  end;
end;

procedure TIQWebTab.ChangeCurrentIndex;
begin
  if (FCurrentIndex + FIncrement) < 0 then
    FCurrentIndex := Items.Count - 1
  else if (FCurrentIndex + FIncrement) > (Items.Count - 1) then
    FCurrentIndex := 0
  else
    FCurrentIndex := (FCurrentIndex + FIncrement);
end;



end.
