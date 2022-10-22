unit crm_strings;

(*****************************************************************************
 ***                         CRM String Functions                          ***

 This unit contains functions for returing CRM strings.  The units declared
 (used) in this unit are inoccuous, so that crm_strings may be declared in
 code outside of CRM without hooking in other CRM-specific objects.

 *****************************************************************************)

interface

uses
  System.Classes;

(*
Idea:

type
  TKeyValuePair = record key: Cardinal; value: string end;
const
  DMFieldBits : array [0..28] of TKeyValuePair =
  (
  (key: DM_ORIENTATION; value: 'DM_ORIENTATION'),
  (key: DM_PAPERSIZE; value: 'DM_PAPERSIZE'),
  (key: DM_PAPERLENGTH; value: 'DM_PAPERLENGTH'),
  ...


function FieldsToText(dmField: Cardinal): string;
var
  Temp: Tstringlist;
  I: Integer;
begin
  Temp:= TStringlist.Create;
  try
    for I := Low(DMFieldBits) to High(DMFieldBits) do
      if (DMFieldBits[I].Key and dmField) <> 0 then
        Temp.Add(DMFieldBits[I].value);
    Result := Temp.CommaText;
  finally
    Temp.Free
  end; { finally }
end;

*)

  function GetTypeString(AType: Integer): String; // Call, Task, Meeting, etc.
  function GetPriorityString(APriority: Integer): String; // Low, Medium, High


implementation

uses
  crm_types;

function GetTypeString(AType: Integer): String;
begin
  Result := '';
  if (AType in [Ord(Low(TActivityType))..Ord(High(TActivityType))]) then
    Result := CRMActivityTypeName[TActivityType(AType)]
end;

function GetPriorityString(APriority: Integer): String;
begin
  Result := '';
  if (APriority in [Ord(Low(TPriorityType))..Ord(High(TPriorityType))]) then
    Result := PriorityTypeName[TPriorityType(APriority)]
end;

end.
