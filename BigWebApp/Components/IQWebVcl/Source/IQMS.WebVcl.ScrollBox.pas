unit IQMS.WebVcl.ScrollBox;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  uniScrollBox;


type
  TIQWebScrollBox = class(TUniScrollBox)
  protected
    { Protected declarations }
    procedure PaintWindow(DC: HDC); override;
  end;


implementation
uses
  uniGUIBaseClasses, uniGUIClasses;

procedure TIQWebScrollBox.PaintWindow(DC: HDC);
begin
  if DC <> 0 then
    Exit
  else
    inherited;
end;


end.
