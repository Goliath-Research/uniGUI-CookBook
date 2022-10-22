unit TL_Const;

interface

const

  { Show Type constants:  When DoIQTool is called, what data is displayed? }
  SHOW_OPEN_WO = 1; { Only open work orders }
  SHOW_CLOSED_WO = 2; { Only closed work orders }
  SHOW_OPEN_RFQ = 3; { Only open RFQ's }
  SHOW_CLOSED_RFQ = 4; { Only closed RFQ's }
  SHOW_ALL_OPEN = 5; { Everything that is open, WO and RFQ }
  SHOW_ALL_CLOSED = 6; { Everything that is closed, WO and RFQ }
  SHOW_ALL_WO = 7; { Every WO, open or closed }
  SHOW_ALL_RFQ = 8; { Every RFQ, open or closed }
  SHOW_OPEN_WO_PM = 9; { Only open work orders, filtered by PM ID }
  SHOW_CLOSED_WO_PM = 10; { Only closed work orders, filtered by PM ID }
  SHOW_OPEN_RFQ_PM = 11; { Only open RFQs, filtered by PM ID }
  SHOW_CLOSED_RFQ_PM = 12; { Only closed RFQ's, filter by PM ID }
  SHOW_ALL_WO_PM = 13; { Every WO associated with PM ID }
  SHOW_ALL_RFQ_PM = 14; { Every RFQ associated with PM ID }
  CREATE_PROJECT = 15; // new project
  SHOW_ARCHIVED = 16; // show archived project
  SHOW_TASK = 17;

implementation

end.
