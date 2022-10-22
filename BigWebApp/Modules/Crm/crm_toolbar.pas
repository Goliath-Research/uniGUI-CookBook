unit crm_toolbar;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Menus,
  crm_bar,
  uniMainMenu;

type
  TDrawDirection = (ddHorizontal, ddVertical);

  TFrmCRMToolbar_Base = class(TIQBar)
    PMain: TUniPopupMenu;
    AutoHide1: TUniMenuItem;
    N1: TUniMenuItem;
    Close1: TUniMenuItem;
    procedure AutoHide1Click(Sender: TObject);
    procedure PMainPopup(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormResize(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    procedure DrawHandleBar(Sender: TObject;
      DrawDirection: TDrawDirection;
      rc: TRect);
    procedure ShowHandleBarCursor(X, Y: Integer);
  public
    { Public declarations }
    FResizing: Boolean;
  end;

const
  // These are Toolbar constants
  HANDLEBAR_SIZE = 12;


implementation
uses
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication;
{$R *.DFM}


procedure TFrmCRMToolbar_Base.AutoHide1Click(Sender: TObject);
begin
  AutoHide := not AutoHide;
  AutoHide1.Checked := AutoHide;
  UpdateBar;
end;

procedure TFrmCRMToolbar_Base.PMainPopup(Sender: TObject);
begin
  AutoHide1.Checked := AutoHide;
end;

procedure TFrmCRMToolbar_Base.DrawHandleBar(Sender: TObject;
  DrawDirection: TDrawDirection; rc: TRect);
begin
  // Draw the HandleBar in the rectangle passed as argument with some plain
  with (Sender as TUniForm).Canvas do
    case DrawDirection of
      ddHorizontal: // Drawn Top
        begin
          // First Line
          Pen.Color := clBtnHighlight; // this line is the left closure
          MoveTo(0, rc.Top + 1);
          LineTo(0, rc.Top + 2);
          MoveTo(0, rc.Top + 4);
          LineTo(0, rc.Top + 6);

          Pen.Color := clBtnHighlight;
          MoveTo(0, rc.Top + 1);
          LineTo(rc.Right - 1, rc.Top + 1);

          Pen.Color := clBtnFace;
          MoveTo(0, rc.Top + 2);
          LineTo(rc.Right - 1, rc.Top + 2);

          Pen.Color := clBtnShadow;
          MoveTo(0, rc.Top + 3);
          LineTo(rc.Right - 1, rc.Top + 3);

          // Second Line
          Pen.Color := clBtnHighlight;
          MoveTo(0, rc.Top + 4);
          LineTo(rc.Right - 1, rc.Top + 4);

          Pen.Color := clBtnFace;
          MoveTo(0, rc.Top + 5);
          LineTo(rc.Right - 1, rc.Top + 5);

          Pen.Color := clBtnShadow;
          MoveTo(0, rc.Top + 6);
          LineTo(rc.Right - 1, rc.Top + 6);

          Pen.Color := clBtnShadow; // this line is the right closure
          MoveTo(rc.Right - 1, rc.Top + 1);
          LineTo(rc.Right - 1, rc.Top + 2);
          MoveTo(rc.Right - 1, rc.Top + 4);
          LineTo(rc.Right - 1, rc.Top + 6);

        end;
      ddVertical: // Drawn Left
        begin
          // First Line
          Pen.Color := clBtnHighlight;
          MoveTo(rc.Left + 1, rc.Top - 14);
          LineTo(rc.Left + 1, rc.Bottom - 1);

          Pen.Color := clBtnFace;
          MoveTo(rc.Left + 2, rc.Top - 14);
          LineTo(rc.Left + 2, rc.Bottom - 1);

          Pen.Color := clBtnShadow;
          MoveTo(rc.Left + 3, rc.Top - 14);
          LineTo(rc.Left + 3, rc.Bottom - 1);

          // Second Line
          Pen.Color := clBtnHighlight;
          MoveTo(rc.Left + 4, rc.Top - 14);
          LineTo(rc.Left + 4, rc.Bottom - 1);

          Pen.Color := clBtnFace;
          MoveTo(rc.Left + 5, rc.Top - 14);
          LineTo(rc.Left + 5, rc.Bottom - 1);

          Pen.Color := clBtnShadow;
          MoveTo(rc.Left + 6, rc.Top - 14);
          LineTo(rc.Left + 6, rc.Bottom - 1);

        end;
    end;

end;

procedure TFrmCRMToolbar_Base.FormPaint(Sender: TObject);
begin
  case Edge of
    abeLeft, abeRight:
      // The HandleBar is placed horizontally and topmost
      DrawHandleBar(Sender, ddHorizontal, Rect(0, // HANDLEBAR_SIZE * 2,
        0,
        ClientWidth,
        0 { HANDLEBAR_SIZE } ));

    abeTop, abeBottom, abeFloat:
      // The HandleBar is placed vertically and leftmost
      DrawHandleBar(Sender, ddVertical, Rect(0,
        0, // HANDLEBAR_SIZE * 2,
        0, // HANDLEBAR_SIZE,
        ClientHeight));
  end;
end;

procedure TFrmCRMToolbar_Base.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCRMToolbar_Base.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  FResizing := TRUE;
end;

procedure TFrmCRMToolbar_Base.FormResize(Sender: TObject);
begin
  FResizing := FALSE;
end;

procedure TFrmCRMToolbar_Base.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ShowHandleBarCursor(X, Y);
end;

procedure TFrmCRMToolbar_Base.FormMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ShowHandleBarCursor(X, Y);
end;

procedure TFrmCRMToolbar_Base.ShowHandleBarCursor(X, Y: Integer);
begin
  if (X in [0 .. 12]) and (Y >= 0) and
    (Y <= Height) then
    Cursor := crSizeAll
  else
    Cursor := crDefault;
end;

end.
