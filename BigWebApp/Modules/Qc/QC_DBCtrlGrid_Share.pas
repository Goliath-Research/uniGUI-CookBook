unit QC_DBCtrlGrid_Share;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Controls,
  DB,
  ExtCtrls,
  dbcgrids,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniSplitter;

procedure QC_CheckExpandSummaryTab( AValue: Boolean; AUpperPanel, ABottomPanel: TUniPanel; ASplitterBetween: TUniSplitter; var AOriginalUpperPanelSize: Integer );
procedure QC_AdjustDBCtrlGridRowCount( AParentPanel, AGridHeaderPanel: TUniPanel; ADBCtrlGrid: TDBCtrlGrid; AForceRowCount: Integer );
           
implementation

procedure QC_CheckExpandSummaryTab( AValue: Boolean; AUpperPanel, ABottomPanel: TUniPanel; ASplitterBetween: TUniSplitter; var AOriginalUpperPanelSize: Integer );
begin
  case AValue of
    TRUE :
      if ABottomPanel.Visible then                       
      begin                     
        ABottomPanel.Visible:= FALSE;
        ASplitterBetween.Visible:= FALSE;
        if ASplitterBetween.Align = alTop then
           AOriginalUpperPanelSize:= AUpperPanel.Height
        else   
           AOriginalUpperPanelSize:= AUpperPanel.Width;
        AUpperPanel.Align:= alClient;
      end;
      
    FALSE:
      if not ABottomPanel.Visible then
      begin
        if ASplitterBetween.Align = alTop then
           begin
             AUpperPanel.Align:= alTop;
             AUpperPanel.Top:= 0;
             AUpperPanel.Height:= AOriginalUpperPanelSize;
           end
        else   
           begin
             AUpperPanel.Align:= alLeft;
             AUpperPanel.Left:= 0;
             AUpperPanel.Width:= AOriginalUpperPanelSize;
           end;
        ABottomPanel.Visible:= TRUE;
        ASplitterBetween.Visible:= TRUE;                
        if ASplitterBetween.Align = alTop then
           ASplitterBetween.Top:= 1000                     // ensure it is under upper page control
        else   
           ASplitterBetween.Left:= 1000;
      end;
  end;                         
end;


procedure QC_AdjustDBCtrlGridRowCount( AParentPanel, AGridHeaderPanel: TUniPanel; ADBCtrlGrid: TDBCtrlGrid; AForceRowCount: Integer );
var
  ARowCount: Integer;
  P: TPoint;
begin
  if AForceRowCount > 0 then
  begin
     ADBCtrlGrid.RowCount:= AForceRowCount;
     EXIT;
  end;
  
  P:= AGridHeaderPanel.ClientToParent( Point(0, AGridHeaderPanel.Height), AParentPanel );  // columns caption panel

  ARowCount:= (AParentPanel.Height - (P.Y - AParentPanel.Top)) div 100;
  
  if ARowCount = 0 then
     ARowCount:= 1;
     
  ADBCtrlGrid.RowCount:= ARowCount;
end;


end.
