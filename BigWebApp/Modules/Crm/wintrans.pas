unit wintrans;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms;

function MakeWindowTransparent(Wnd: HWND; nAlpha: Integer = 10): Boolean;
procedure FadeToTranparency(AHandle: HWND; ATargetValue: Integer);

// The SetLayeredWindowAttributes function sets the opacity and transparency
// color key of a layered window.
// Note : This function is only available with Windows 2000 and XP!
function SetLayeredWindowAttributes(
  // Handle to the layered window.
  Wnd: HWND;
  // Pointer to a COLORREF value that specifies the transparency
  // color key to be used when composing the layered window
  crKey: ColorRef;
  // Alpha value used to describe the opacity of the layered window
  Alpha: Byte;
  // Specifies an action to take
  // LWA_COLORKEY or LWA_ALPHA
  // This parameter can be one or more of the following values:
  dwFlags: DWORD): Boolean;
  stdcall; external 'user32.dll';

var
  FColorKey: TCOLOR;

const
  // Use crKey as the transparency color.
  LWA_COLORKEY = 1;
  // Use bAlpha to determine the opacity of the layered window..
  LWA_ALPHA = 2;
  WS_EX_LAYERED = $80000;

implementation

// uses
// iv_share;

procedure FadeToTranparency(AHandle: HWND; ATargetValue: Integer);
var
  i: Integer;
begin
  // This method will gradually fade to target transparency

  // loop until target transparency is reached
  if (ATargetValue > 0) then
    begin
      i := 0;
      repeat
        Inc(i, 5);
        if i > ATargetValue then
          i := ATargetValue;
        MakeWindowTransparent(AHandle, i);
        Application.ProcessMessages;
      until i >= ATargetValue;
    end
  else
    MakeWindowTransparent(AHandle, 0);
end;

function MakeWindowTransparent(Wnd: HWND; nAlpha: Integer = 10): Boolean;
type
  TSetLayeredWindowAttributes = function(HWND: HWND; crKey: ColorRef;
    bAlpha: Byte;
    dwFlags: Longint): Longint;
    stdcall;
const
  // Use crKey as the transparency color.
  LWA_COLORKEY = 1;
  // Use bAlpha to determine the opacity of the layered window..
  LWA_ALPHA = 2;
  WS_EX_LAYERED = $80000;
var
  hUser32: HMODULE;
  SetLayeredWindowAttributes: TSetLayeredWindowAttributes;
  i: Integer;
begin
  Result := False;
  // Here we import the function from USER32.DLL
  hUser32 := GetModuleHandle('USER32.DLL');
  if hUser32 <> 0 then
    begin
      @SetLayeredWindowAttributes := GetProcAddress(hUser32,
        'SetLayeredWindowAttributes');
      // If the import did not succeed, make sure your app can handle it!
      if @SetLayeredWindowAttributes <> nil then
        begin
          // Check the current state of the dialog, and then add the WS_EX_LAYERED attribute
          SetWindowLong(Wnd, GWL_EXSTYLE, GetWindowLong(Wnd, GWL_EXSTYLE) or
            WS_EX_LAYERED);
          // The SetLayeredWindowAttributes function sets the opacity and
          // transparency color key of a layered window
          SetLayeredWindowAttributes(Wnd, 0, Trunc((255 / 100) * (100 - nAlpha)
            ), LWA_ALPHA);
          Result := True;
        end;
    end;
end;

end.
