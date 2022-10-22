unit IQMS.Common.PanelMsg;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, Vcl.Graphics, uniImage, Vcl.ExtCtrls, uniColorButton;

type
  TPanelMesg = class(TUniForm)
    pnlCarrier: TUniPanel;
    Image1: TUniImage;
    pnlMesg: TUniPanel;
    lblMsg: TUniLabel;
    Shape1: TUniColorButton;
    sbtnHide: TUniSpeedButton;
    procedure sbtnHideClick(Sender: TObject);
  private
    { Private declarations }
    function GetMesg:string;
    procedure SetMesg( AValue:string );
    procedure AlignMesg;
  public
    { Public declarations }
    property Mesg:string read GetMesg write SetMesg;
  end;

function hPleaseWait( S: string ):TPanelMesg; overload;
function hPleaseWait:TPanelMesg; overload;

var
  PanelMesgVisible: Boolean;  {application wide flag}

implementation

{$R *.DFM}

uses
  IQMS.Common.ApplicationSet,
  IQMS.Common.Numbers,
  IQMS.Common.Screen,
  IQMS.Common.ResStrings;

function hPleaseWait: TPanelMesg;
begin
  Result:= hPleaseWait( '' );
end;

function hPleaseWait( S: string ):TPanelMesg;
begin
  Result:= NIL;

  if not PanelMesgVisible then
     EXIT;

  if Trim(S) = '' then
     // IQMS.Common.ResourceStrings.cTXT0000444 = 'Processing. Please Wait ...'
     S:= IQMS.Common.ResStrings.cTXT0000444;

  Result := TPanelMesg.Create(uniGUIApplication.UniApplication);
  Result.Mesg := S;

  // 05/10/2013 Added check for IsConsole (Byron)
  if not IsConsole and not IQMS.Common.ApplicationSet.IsCGI and PanelMesgVisible then
    Result.Show;
end;

function TPanelMesg.GetMesg:string;
begin
  Result:= lblMsg.Caption;
end;

procedure TPanelMesg.SetMesg( AValue:string );
begin
  if IsConsole or IQMS.Common.ApplicationSet.IsCGI or not PanelMesgVisible or not Visible then Exit;

  //lblMsg.WordWrap := bIIf((Pos(#13,AValue)>0) or (Pos(#10,AValue)>0),FALSE,TRUE); // iqnumber
  lblMsg.Caption:= AValue;
  //AlignMesg;
end;

procedure TPanelMesg.AlignMesg;
var
  i: Integer;
begin
  // Center the message text in the window, after the caption has changed

  // Resize the TLabel
  lblMsg.AutoSize := TRUE;
  lblMsg.Width := pnlMesg.Width - lblMsg.Left - 4;
  lblMsg.Perform(CM_TEXTCHANGED, 0, 0);

  // Ensure only 2 lines of height display on the panel message
//TODO  i := 2 * IQMS.Common.Screen.GetTextHeightPixels(lblMsg.Font, lblMsg.Caption, Self);
  lblMsg.Height := IQMS.Common.Numbers.iMin(lblMsg.Height, i );

  // Set the top, so that TLabel is centered
  lblMsg.Top := (pnlMesg.ClientHeight div 2) - (lblMsg.Height div 2) - 1;
  lblMsg.Top := IQMS.Common.Numbers.iMax(lblMsg.Top, 4 );

  // Reset
  lblMsg.AutoSize := FALSE;
end;


procedure TPanelMesg.sbtnHideClick(Sender: TObject);
begin
  Hide;
end;

initialization

  PanelMesgVisible:= not IsConsole and not ( IQMS.Common.ApplicationSet.AppType = atCGI );

end.
