unit D4W.MenuToActionListEditor;

interface

uses
  DesignInterfaces, DesignEditors, SysUtils, ActionEditors, Vcl.ActnList, ActnEdit,
  Classes, Vcl.Dialogs, Generics.Defaults;

type
  TD4WMenuToActionListEditor = class(TComponentEditor)
  private
    procedure ShowActionListEditor;
  protected
    procedure DisplayUnassignedActionsList;
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerbCount: Integer; override;
    function GetVerb(Index: Integer): string; override;
  end;

implementation

type
  TActionHack = class(TCustomAction);


procedure TD4WMenuToActionListEditor.DisplayUnassignedActionsList;
var
  i: integer;
  sl: TStringList;
begin
  // Show List
  if not Assigned(Component) then
    raise Exception.Create('Component not assigned');

  if not (Component is TActionList) then
    raise ENotImplemented.Create('Component not a TActionList');

  with TActionList(Component) do
  begin
    sl := TStringList.Create;
    try
      for i := 0 to ActionCount - 1 do
      begin
        if TEqualityComparer<TNotifyEvent>.Default.Equals(
            TActionHack(Actions[i]).OnExecute, nil) then
          sl.Add(Actions[i].Name);
      end;

      if sl.Count > 0 then
        ShowMessage('The following ations do not have an OnExecute event: ' + #13#10 + sl.Text)
      else if ActionCount = 0 then
        ShowMessage('There are no actions in the list')
      else
        ShowMessage('All actions have been assigned');
    finally
      sl.Free;
    end;
  end;
end;

procedure TD4WMenuToActionListEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0: ShowActionListEditor;
    1: DisplayUnassignedActionsList;
  else
    raise ENotImplemented.Create('TClockLabelEditor has only one verb (index = 0) supported.');
  end;
end;

function TD4WMenuToActionListEditor.GetVerbCount: Integer;
begin
  Result := 2;
end;

function TD4WMenuToActionListEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'Action List Editor';
    1: Result := 'View &Unassigned Actions';
  else
    raise ENotImplemented.Create('TMenuToActionListEditor has only one verb (index = 0) supported.');
  end;
end;

procedure TD4WMenuToActionListEditor.ShowActionListEditor;
begin
  Actnedit.ShowActionListDesigner(Designer, Component as TCustomActionList);
end;

end.
