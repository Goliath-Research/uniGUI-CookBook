unit pm_color;

interface

uses
  Vcl.Graphics,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniCanvas;

  procedure GetPMColorCoding(var AWOOpen,
                                 AWOClosed,
                                 AIncomplete,
                                 AUnassigned: TColor);

  procedure SetPMColorSwatches(const AWOOpen,
                                     AWOClosed,
                                     AIncomplete,
                                     AUnassigned: TUniCanvas);
const
  COLOR_WO_OPEN = clTeal; // 1347092;
  COLOR_WO_CLOSED = clMaroon; // 2047685;
  COLOR_INCOMPLETE = clYellow;
  COLOR_UNASSIGNED = clBtnFace;

implementation


procedure GetPMColorCoding(var AWOOpen,
                               AWOClosed,
                               AIncomplete,
                               AUnassigned: TColor);
begin
  AWOOpen     := COLOR_WO_OPEN;
  AWOClosed   := COLOR_WO_CLOSED;
  AIncomplete := COLOR_INCOMPLETE;
  AUnassigned := COLOR_UNASSIGNED;
end;

procedure SetPMColorSwatches(const AWOOpen,
                                   AWOClosed,
                                   AIncomplete,
                                   AUnassigned: TUniCanvas);
  // ---------------------------------------------------------------------------
  procedure _SetSwatch(AShape: TUniCanvas; AColor: TColor);
  begin
    if Assigned(AShape) then
       AShape.Brush.Color := AColor;
  end;
  // ---------------------------------------------------------------------------
begin
  _SetSwatch(AWOOpen, COLOR_WO_OPEN);
  _SetSwatch(AWOClosed, COLOR_WO_CLOSED);
  _SetSwatch(AIncomplete, COLOR_INCOMPLETE);
  _SetSwatch(AUnassigned, COLOR_UNASSIGNED);
end;

end.
