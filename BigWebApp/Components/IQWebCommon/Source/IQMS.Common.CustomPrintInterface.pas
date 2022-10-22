unit IQMS.Common.CustomPrintInterface;

interface

uses
  System.Classes, Vcl.Graphics, System.Types, System.UITypes;

type
  ICustomPrint = interface
    ['{06AEB60D-F9C2-4FE3-859A-F31146D3CB81}']
    procedure SetCanvasFont(const Value: TFont);
    procedure StartDoc;
    procedure PrintLine(const ALeft, ATop: Integer; AText: string);
    procedure PrintFooter(const APageNumber: Integer);
    procedure PrintHeader(const APageNumber: Integer);
    procedure EndDoc;
    procedure Execute;

    function GetLines: TStringList;
    procedure SetLines(const Value: TStringList);
    property Lines: TStringList read GetLines write SetLines;

    function GetHeaderCaption: string;
    procedure SetHeaderCaption(const Value: string);
    property HeaderCaption: string read GetHeaderCaption write SetHeaderCaption;

    function GetHeaderOnFirstPage: Boolean;
    procedure SetHeaderOnFirstPage(const Value: Boolean);
    property HeaderOnFirstPage: Boolean read GetHeaderOnFirstPage write SetHeaderOnFirstPage;

    function GetFooterOnFirstPage: Boolean;
    procedure SetFooterOnFirstPage(const Value: Boolean);
    property FooterOnFirstPage: Boolean read GetFooterOnFirstPage write SetFooterOnFirstPage;

    function GetShowHeader: Boolean;
    procedure SetShowHeader(const Value: Boolean);
    property ShowHeader: Boolean read GetShowHeader write SetShowHeader;

    function GetShowFooter: Boolean;
    procedure SetShowFooter(const Value: Boolean);
    property ShowFooter: Boolean read GetShowFooter write SetShowFooter;

    function GetLeftMargin: Single;
    procedure SetLeftMargin(const Value: Single);
    property LeftMargin: Single read GetLeftMargin write SetLeftMargin;

    function GetRightMargin: Single;
    procedure SetRightMargin(const Value: Single);
    property RightMargin: Single read GetRightMargin write SetRightMargin;

    function GetTopMargin: Single;
    procedure SetTopMargin(const Value: Single);
    property TopMargin: Single read GetTopMargin write SetTopMargin;

    function GetBottomMargin: Single;
    procedure SetBottomMargin(const Value: Single);
    property BottomMargin: Single read GetBottomMargin write SetBottomMargin;

    function GetShowPrintFinished: Boolean;
    procedure SetShowPrintFinished(const Value: Boolean);
    property ShowPrintFinished: Boolean read GetShowPrintFinished write SetShowPrintFinished;

    function GetOrientation: TPrinterOrientation;
    procedure SetOrientation(const Value: TPrinterOrientation);
    property Orientation: TPrinterOrientation read GetOrientation write SetOrientation;

    function GetCanvasFont: TFont;
    property Font: TFont read GetCanvasFont;

    function GetTextRect: TRect;
    property TextRect: TRect read GetTextRect;

    function GetCanvasTextHeight: Integer;
    property CanvasTextHeight: Integer read GetCanvasTextHeight;

    function CanvasTextWidth(const AText: string): Integer;
  end;

implementation

end.
