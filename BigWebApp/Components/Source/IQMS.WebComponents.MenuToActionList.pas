unit IQMS.WebComponents.MenuToActionList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList, Rtti;

type
  TIQMenuToActionList = class(TActionList)
  private
    FMainMenu: TMainMenu;
    FExecute: Boolean;
    procedure SetMainMenu(const Value: TMainMenu);
    procedure BuildActionList;
    procedure SetExecute(const Value: Boolean);
  public
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  published
    property Execute: Boolean read FExecute write SetExecute default False;
    property MainMenu: TMainMenu read FMainMenu write SetMainMenu;
  end;

implementation


{ TMenuToActionList }

procedure TIQMenuToActionList.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  if (Operation = opRemove) and (AComponent = FMainMenu) then
    FMainMenu := nil;
  inherited;
end;

procedure TIQMenuToActionList.SetExecute(const Value: Boolean);
begin
  if Value then
    BuildActionList;
end;

procedure TIQMenuToActionList.SetMainMenu(const Value: TMainMenu);
begin
  FMainMenu := Value;
end;

procedure TIQMenuToActionList.BuildActionList;
var
  c: integer;
  procedure BuildActionItems(aMenuItem: TMenuItem; const aPath: string);

    (*


    {
 VAR
    M   : TMethod ABSOLUTE Event;
    O   : TObject;
    CTX : TRttiContext;
    TYP : TRttiType;
    RTM : TRttiMethod;
    OK  : BOOLEAN;

  BEGIN
    O:=M.Data;
    TRY
      OK:=O IS TObject;
      Result:=O.ClassName
    EXCEPT
      OK:=FALSE
    END;
    IF OK THEN BEGIN
      CTX:=TRttiContext.Create;
      TRY
        TYP:=CTX.GetType(O.ClassType);
        FOR RTM IN TYP.GetMethods DO
          IF RTM.CodeAddress=M.Code THEN
            EXIT(O.ClassName+'.'+RTM.Name)
      FINALLY
        CTX.Free
      END
    END;
    Result:=IntToHex(NativeInt(M.Code),SizeOf(NativeInt)*2)
  END;    }



    { Get the value of the OnChange property, which is a method pointer }
//    context.GetType(a.Owner.ClassType).GetMethods.
//
//    method := context.GetType(a.Owner.ClassType).GetMethods do  GetProperty('OnExecute'). GetValue(a);
//
//    { Display the method code and data pair }
//    ShowMessage(method.);
////    Writeln(method.ToString);
//
//    { Get event RTTI }
//    methodType := context.GetType(method.TypeInfo) as TRttiInvokableType;
//    ShowMessage(methodType.Name);
////    Writeln(methodType.Name);

*)

    (*

  { Invoke event }
  { The first parameter must be the procedure/method pointer in a TValue variable }
  methodType.Invoke(method, [mapModel { Sender } , nil { Area } ]);
end;
    *)

    function MakeValidIdent(const s: string): string;
    var
      x: Integer;
      c: Char;
    begin
      SetLength(Result, Length(s));
      x := 0;
      for c in s do
        if CharInSet(c, ['A'..'Z', 'a'..'z', '0'..'9', '_']) then
        begin
          Inc(x);
          Result[x] := c;
        end;
      SetLength(Result, x);

      // cannot start with a number, and we don't want a begning _
      while (Length(Result) > 1) and (CharInSet(Result[1], ['0'..'9', '_']))  do
        Delete(Result, 1, 1); // remove preceeding underscore
    end;
  var
    i: integer;
    a: TAction;
    NewName: string;

//    context: TRttiContext;
//    method: TValue; // System.TMethod
//    methodType: TRttiInvokableType;

  begin
    if Assigned(aMenuItem.OnClick) or ((aMenuItem.Count = 0) and (aMenuItem.Caption <> '-')) then
    begin
      a := TAction.Create(Self.Owner);
      Self.AddAction(a);
      a.Caption := aMenuItem.Caption;
      a.Category := aPath; // todo

      // assign a comp name
      NewName := StringReplace(aPath + '_' + aMenuItem.Caption, '\', '_', [rfReplaceAll]);
      NewName := MakeValidIdent(NewName) + IntToStr(c);
      if NewName[1] = '\' then
        Delete(NewName, 1, 1); // remove preceeding underscore
      a.Name := NewName;
      Inc(c);

      // a.OnExecute := aMenuItem.OnClick; do not assign the event automatically...
    end;

    // recurse
    for i := 0 to aMenuItem.Count -1 do
      BuildActionItems(aMenuItem.Items[i], aPath + '\' + aMenuItem.Caption);
  end;
var
  i: integer;
begin
  c := 0;

  if Assigned(FMainMenu) then
  begin
    //dynamically build the actions.
    for i := 0 to MainMenu.Items.Count -1 do
    begin
      BuildActionItems(MainMenu.Items[i], '');
    end;
  end;
end;

end.
