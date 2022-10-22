unit cc_helper_classes;

interface

uses
  System.SysConst;

type
  TShortStringHelper = record helper for ShortString
  private
    function GetLength: Integer;
  public
   function IsEmpty: Boolean;
   function IsNullOrWhiteSpace: Boolean;
   function Trim: ShortString;
   property Length: Integer read GetLength;
end;

//type
//  TWideStringHelper = record helper for WideString
//  private
//    function GetLength: Integer;
//  public
//   function IsEmpty: Boolean;
//   function IsNullOrWhiteSpace: Boolean;
//   function Trim: WideString;
//   property Length: Integer read GetLength;
//end;

implementation

uses
  System.AnsiStrings;

{$REGION 'TShortStringHelper'}

function TShortStringHelper.GetLength: Integer;
begin
  Result := System.Length(Self);
end;

function TShortStringHelper.IsEmpty: Boolean;
begin
  Result := Self = '';
end;

function TShortStringHelper.IsNullOrWhiteSpace: Boolean;
begin
  Result := Self.Trim.Length = 0;
end;

function TShortStringHelper.Trim: ShortString;
begin
  Result := System.AnsiStrings.Trim(Self);
end;

{$ENDREGION 'TShortStringHelper'}

{$REGION 'TWideStringHelper'}

//function TWideStringHelper.GetLength: Integer;
//begin
//  Result := System.Length(Self);
//end;
//
//function TWideStringHelper.IsEmpty: Boolean;
//begin
//  Result := Self = '';
//end;
//
//function TWideStringHelper.IsNullOrWhiteSpace: Boolean;
//begin
//  Result := Self.Trim.Length = 0;
//end;
//
//function TWideStringHelper.Trim: WideString;
//begin
//  Result := System.AnsiStrings.Trim(Self);
//end;

{$ENDREGION 'TWideStringHelper'}

end.
