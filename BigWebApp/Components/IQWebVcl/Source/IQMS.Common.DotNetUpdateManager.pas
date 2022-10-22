unit IQMS.Common.DotNetUpdateManager;

interface

uses
  Winapi.Windows, System.SysUtils, System.Variants, System.Classes,IQMS.Common.DotNetCOMInterOp,
  FireDAC.Phys;
  // db_dm;

function RequestVersionInformaiton( AVersionFileName, APropertyName: string; var Value: string; APathToIQUpdateManager:String ): Boolean;
procedure UploadFile( AFileNamePath, AFileDescriptor: string );

function LoadVersionFileInList( AFileName: string; var AList: TStringList ): Boolean;
function GetVersionFileBuild( AVersionFileName: string): string;

implementation

uses
  IQMS.Common.DotNetCOMInteropConst,
  System.Win.ComObj;

function RequestVersionInformaiton( AVersionFileName, APropertyName: string; var Value: string; APathToIQUpdateManager:String ): Boolean;
var
  DNetObject: Variant;
begin
  Result:= FALSE;
  if CreateDNetCOM_Ex( DNetObject, 'IQUpdateManager', 'IQUpdateManager.Dispatcher', DNetCurrentVersion, APathToIQUpdateManager ) then
  try
    Value := DNetObject.RequestVersionInformation( AVersionFileName, APropertyName );
    Result:= Value <> '';
  finally
    FreeDNetObject_Ex( DNetObject );
  end;
end;

procedure UploadFile( AFileNamePath, AFileDescriptor: string );
var
  DNetObject: Variant;
begin
  if CreateDNetCOM_Ex( DNetObject, 'IQUpdateManager', 'IQUpdateManager.Dispatcher' ) then
  try
    DNetObject.UploadFile( AFileNamePath, AFileDescriptor );
  finally
    FreeDNetObject_Ex( DNetObject );
  end;
end;


function LoadVersionFileInList( AFileName: string; var AList: TStringList ): Boolean;
var
  XMLDoc: OleVariant;

  procedure ReadTag( ATagName: string );
  var
    ElemList: OleVariant;
  begin
    ElemList:= XMLDoc.documentElement.getElementsByTagName( ATagName );
    if ElemList.Length > 0 then
       AList.Add(Format('%s=%s', [ ATagName, ElemList.Item[0].Text ]));
  end;

begin
  Result:= FALSE;
  if not FileExists( AFileName ) then
     EXIT;

  // create object
  XMLDoc:= CreateOleObject('microsoft.xmldom');
  XMLDoc.async:= False;

  // load xml
  XMLDoc.Load(AFileName);

  // check xml is valid
  if not Assigned(TVarData(XMLDoc.documentElement).VDispatch) then
     EXIT;

  // read tags
  ReadTag('version');
  ReadTag('build');
  ReadTag('timestamp');

  XMLDoc:= NULL;
  Result:= TRUE;
end;


function GetVersionFileBuild( AVersionFileName:string ): string;
var
  AList: TStringList;
begin
  Result:= '';
  AList:= TStringList.Create;
  try
    if LoadVersionFileInList( AVersionFileName, AList ) then
       if AList.IndexOfName('build') > -1 then
          Result:= AList.Values['build'];
  finally
    AList.Free;
  end;
end;


end.
