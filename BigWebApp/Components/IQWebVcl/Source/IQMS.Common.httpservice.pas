unit IQMS.Common.httpservice;

(* *** Wrapper unit for HTTP Service ***

   This component provides Delphi 7 access to the IQMS HTTP Service DLL.

*)

interface

uses
  Winapi.Windows,
  System.Classes,
  System.Variants,
  System.SysUtils,
  IQMS.Common.StringUtils;

 type
   THTTPService = class(TComponent)
   private
    { Private declarations }
    FRequest: TStringList;
    FResponse: TStringList;
    FURL: String;
    procedure CheckRequiredDLL;
   protected
    { Protected declarations }
   public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Execute;
   published
    { Published declarations }
    property URL: String read FURL write FURL;
    property Request: TStringList read FRequest write FRequest;
    property Response: TStringList read FResponse write FResponse;
 end;

resourcestring
   cTXT000001 = 'Processing.  Please wait.';
   cTXT000002 = 'Cannot find DLL file, %s.';
   //cTXT000003 = '';
   //cTXT000004 = '';
   //cTXT000005 = '';


const
  ASSEMBLY_NAME = 'IQMS.HttpServices';
  NAMESPACE     = 'IQMS.HttpServices';
  _CLASS        = 'IQHTTPClient';
  DLL_FILENAME  = 'IQMS.HttpServices.dll';

implementation

uses
  IQMS.Common.Miscellaneous,
  IQMS.Common.panelmsg,
  IQMS.Common.DotNetCOMInterOp,
  IQMS.Common.DotNetInteropConst;

{ THTTPService }

constructor THTTPService.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // Create internal lists
  FRequest := TStringList.Create;
  FResponse := TStringList.Create;

  // Ensure the required DLL exists
  CheckRequiredDLL;

end;

destructor THTTPService.Destroy;
begin
  // Free internal lists
  if Assigned(FRequest) then FreeAndNil(FRequest);
  if Assigned(FResponse) then FreeAndNil(FResponse);
  inherited Destroy;
end;

procedure THTTPService.Execute;
var
  ADNetObject: Variant;
  CW         : Word;
  S          : String;
  I          : Integer;
  hMsg: TPanelMesg;
begin
  // Initialization
  Response.Clear;
  S := '';
  hMsg := NIL;

  // URL and Request are required, but exit silently if not provided
  if (URL = '') or (Request.Count = 0) then
     Exit;

  DisableFPUExceptions(CW);

  try
     // Standard "please wait" message
     hMsg := hPleaseWait(cTXT000001 {'Processing.  Please wait.'});

     // Access server
     CreateDNetCom(ADNetObject, ASSEMBLY_NAME, Format('%s.%s', [NAMESPACE, _CLASS]), DNetVersion2_0_50727);
     // Set URL
     ADNetObject.RequestURL   := URL;
     // Fill variable with response text, but without return characters
     with Request do
       for I:= 0 to Count - 1 do
           S := S + Trim(Strings[I]);
     // Set the request text
     ADNetObject.RequestString := S;
     // Submit the request
     ADNetObject.SubmitRequest;
     // Retrieve the response text
     Response.Text:= ADNetObject.ResponseString;
  finally
    // Free "please wait" message first
    if (hMsg <> NIL) and Assigned(hMsg) then FreeAndNil(hMsg);
    // Free connections
    FreeDNetObject(ADNetObject);
    RestoreFPU(CW);
  end;
end;

procedure THTTPService.CheckRequiredDLL;
var
   AFound: Boolean;
begin
  // This method checks for the existence of the required DLL in the
  // primary directories.
  AFound := FileExists(IQMS.Common.Miscellaneous.IQGetLocalHomePath + DLL_FILENAME);
  if not AFound then
     AFound := FileExists(IQMS.Common.Miscellaneous.GetSpecialPath(evWindows) + DLL_FILENAME);
  if not AFound then
     AFound := FileExists(IQMS.Common.Miscellaneous.GetSpecialPath(evSystem) + DLL_FILENAME);
  if not AFound then
     raise Exception.CreateFmt(cTXT000002 {'Cannot find DLL file, %s.'},[DLL_FILENAME]);
end;

end.
