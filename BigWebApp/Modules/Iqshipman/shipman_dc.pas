unit shipman_dc;

{ Data Cargo used for Shipping
  Contains declaration for TDataCargo }

interface

uses
  Winapi.Windows,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMultiItem,
  uniComboBox;

    function IndexOfCode(AComboBox: TUniComboBox; ACode: String): Integer;
    function IndexOfValue(AComboBox: TUniComboBox; AValue: Integer): Integer;

type
   TDataCargo = class
    Caption: String;
    Value: Integer;
    FloatValue: Real;
    Code: String;
    Description: String;
   constructor Create(ACaption: String; AValue: Integer; ACode: String);
   constructor CreateB(ACode, ADescription: String);
   constructor CreateC(AValue: Integer);
   end;


implementation

function IndexOfCode(AComboBox: TUniComboBox; ACode: String): Integer;
var
   i: Integer;
begin
   Result := -1;
   for i := 0 to AComboBox.Items.Count - 1 do
    if Assigned(AComboBox.Items.Objects[i]) and
       (AComboBox.Items.Objects[i] is TDataCargo) and
       (TDataCargo(AComboBox.Items.Objects[i]).Code = ACode) then
       begin
         Result := i;
         BREAK;
       end;
end;

function IndexOfValue(AComboBox: TUniComboBox; AValue: Integer): Integer;
var
   i: Integer;
begin
   Result := -1;
   for i := 0 to AComboBox.Items.Count - 1 do
    if Assigned(AComboBox.Items.Objects[i]) and
       (AComboBox.Items.Objects[i] is TDataCargo) and
       (TDataCargo(AComboBox.Items.Objects[i]).Value = AValue) then
       begin
         Result := i;
         BREAK;
       end;
end;

{ ---------------------------------------------------------------------------- }
{ TDataCargo }
{ ---------------------------------------------------------------------------- }

constructor TDataCargo.Create(ACaption: String; AValue: Integer; ACode: String);
begin
  Caption := ACaption;
  Value := AValue;
  Code  := ACode;
end;

constructor TDataCargo.CreateB(ACode, ADescription: String);
begin
  Caption := '';
  Value   := -1;
  Code    := ACode;
  Description := ADescription;
end;

constructor TDataCargo.CreateC(AValue: Integer);
begin
  Caption := '';
  Value   := AValue;
  Code    := '';
  Description := '';
end;

end.
