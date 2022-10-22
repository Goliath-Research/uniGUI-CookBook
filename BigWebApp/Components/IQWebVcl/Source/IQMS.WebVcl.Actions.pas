unit IQMS.WebVcl.Actions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, CheckLst, ActnList;

  type
    TIQWebActionList = class(TActionList)
    private
     procedure GetSavedActions;
     procedure SetSavedActions;
    protected
    public
     procedure Execute;
     procedure Edit;
    published
  end;

implementation

uses
  StrUtils,
    IQMS.WebVcl.ActionsForm, // form used for displaying list to the user
    IQMS.Common.Dialogs,
    IQMS.Common.Numbers,
    IQMS.Common.RegFrm,
    IQMS.Common.StringUtils,
    IQMS.WebVcl.ResourceStrings;

{ TIQWebActionList }

procedure TIQWebActionList.Edit;
begin
  GetSavedActions;
  if DoConfigIQActionList( TActionList(Self) {TActionList}) then // IQActionsFrm
     SetSavedActions;
end;

procedure TIQWebActionList.Execute;
var
   i: Integer;
begin
  // ** Execute Selected Actions ** //
  
  // Ensure the actions are checked or unchecked, based on Registry settings
  GetSavedActions;

  // Cycle the list, execute each action (if it is checked)
  for i := 0 to ActionCount - 1 do
   if TAction(Actions[i]).Checked then
      TAction(Actions[i]).Execute;
end;

procedure TIQWebActionList.GetSavedActions;

  // ---------------------------------------------------------------------------
  procedure _SafeSelectIndex(AIndex: Integer; AChecked: Boolean);
  begin
   if (AIndex >= 0) and (AIndex <= ActionCount - 1) then
      TAction(Actions[AIndex]).Checked := AChecked;
  end;
  // ---------------------------------------------------------------------------

var
   i, x: Integer;
   S: String;
   AList: TStringList;
begin
  // ** Retrieves list of "checked" actions ** //

  // NOTE:  The Checked property must be set at design time
  // First, by default set all actions checked = TRUE
  {for i := 0 to ActionCount - 1 do
    TAction(Actions[i]).Checked := TRUE; }

  // Get a list of indexes from the Registry
  S := '';
  if not IQRegStringScalarRead(Self, 'Actions', S) or (S = '') then Exit; //iqregfrm

  // Apply the list
  try
     AList := TStringList.Create;
     StrToStringList(S, AList);

     // Set all actions checked = FALSE
     for i := 0 to ActionCount - 1 do
         TAction(Actions[i]).Checked := FALSE;

     // And check only the items in the saved list
     for i := 0 to AList.Count - 1 do
      if IsStringValidInteger(AList.Strings[i], x) then
         _SafeSelectIndex(x, TRUE);
  finally
    if Assigned(AList) then FreeAndNil(AList);
  end;
end;

procedure TIQWebActionList.SetSavedActions;
var
   i: Integer;
   S: String;
begin
  // ** Saves list of "checked" actions ** //
  S := '';
  // Build a list of indexes (i.e., '1;2;4')
  for i := 0 to ActionCount - 1 do
    if TAction(Actions[i]).Checked then
       S := S + IfThen(S = '', IntToStr(i), ';' + IntToStr(i));
  // Write it as a string to the Registry
  IQRegStringScalarWrite(Self, 'Actions', S); //iqregfrm
end;

end.
 