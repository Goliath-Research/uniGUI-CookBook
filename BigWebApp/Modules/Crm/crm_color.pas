unit crm_color;

interface

uses
  Vcl.Graphics;

{ Standard CRM Color Coding
  Use this unit for coloring dbgrid rows and the like in a standard
  format throughout CRM.  Do not call the usual Delphi color constants
  directly unless they are the standard clBlack and clWindow colors.

  Any changes to the color coding must be made here.
}

const
  clCRMYellow = 14811135;
  clCRMGreen = 14286809;
  clCRMBlue = 16772313;
  clCRMLtBlue = 16776927;
  clCRMPurple = 16767487;
  clCRMRed = 11315967;
  clCRMLtBrown = 9822207;
  clCRMBrown = 27803;
  clLtGray = 14408667;
  clSalmon = 8491775; // Salmon color

  // Valid links:  color records that are linked to other areas of IQCRM
  clCRMValidLink = clCRMGreen;
  clCRMValidLinkFont = clBlack;

  // Broken links
  clCRMBrokenLink = clRed; // For links to other areas in CRM
  clCRMBrokenLinkFont = clWindow;

  // History
  clCRMHistory = clYellow; // For archived activities and the like
  clCRMHistoryFont = clBlack;

  // High Priority
  clCRMHighPriority = clWindow; // not used, except for grids
  clCRMHighPriorityFont = clMaroon;

implementation

end.
