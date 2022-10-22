unit IQMS.Common.GuidUtils;

interface

uses
  System.SysUtils, Winapi.ActiveX;

  type
   {TGUIDGenerator}
   TGUIDGenerator = class(TObject)
  public
   class function NewGuid: string;
  end;

  function GetGUID: string;
  function GetGUIDAlphaNumeric: string;

implementation

uses
  IQMS.Common.StringUtils;

function GetGUID: string;
begin
  Result := TGUIDGenerator.NewGuid;
end;

function GetGUIDAlphaNumeric: string;
begin
  Result := IQMS.Common.StringUtils.AlphaNumeric(TGUIDGenerator.NewGuid);
end;
{ TGUIDGenerator }

class function TGUIDGenerator.NewGuid: string;
var
  ID: TGUID;
begin
  Result := '';
  if CoCreateGuid(ID) = S_OK then
    Result := GUIDToString(ID);
end;

end.
