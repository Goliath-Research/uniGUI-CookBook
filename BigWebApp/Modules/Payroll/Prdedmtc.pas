unit PRDedMtc;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.About,
  Vcl.DBGrids,
  IQMS.Common.PanelMsg,
  Data.DB,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator;

type
  TFrmDeductMatch = class(TUniForm)
    Panel1: TUniPanel;
    nav: TUniDBNavigator;
    grid: TUniDBGrid;
    IQAbout1: TIQWebAbout;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure navBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    HMsg:TPanelMesg;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent); override;
  end;

procedure DODeductMatch(AOwner:TComponent);

var
  FrmDeductMatch: TFrmDeductMatch;

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  PRDeduct,
  IQMS.Common.HelpHook;
{$R *.DFM}

procedure DODeductMatch(AOwner:TComponent);
begin
  TFrmDeductMatch.Create(AOwner).Show;
//  with TFrmDeductMatch.Create(AOwner) do
//  try
//    try
//      HMsg:= hPleaseWait( 'Opening query, please wait...' );
//      TFrmPRDeductions(AOwner).QrySummary.Open;
//    finally
//      HMsg.Free;
//    end;
//    ShowModal;
//  finally
//    Free;
//    TFrmPRDeductions(AOwner).QrySummary.Close;
//  end;
end;

constructor TFrmDeductMatch.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
    try
      HMsg:= hPleaseWait( 'Opening query, please wait...' );
      TFrmPRDeductions(AOwner).QrySummary.Open;
    finally
      HMsg.Free;
    end;
  IQRegFormRead( self, [self, grid]);
  nav.DataSource := TFrmPRDeductions(AOwner).SrcSummary;
  grid.DataSource := TFrmPRDeductions(AOwner).SrcSummary;
end;


procedure TFrmDeductMatch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TFrmPRDeductions(Owner).QrySummary.Close;
  IQRegFormWrite( self, [self, grid]);
  Action := caFree;
end;

procedure TFrmDeductMatch.navBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    TFrmPRDeductions(Owner).QrySummary.Close;
    TFrmPRDeductions(Owner).QrySummary.Open;
    Abort;
  end;
end;

procedure TFrmDeductMatch.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmPAYROLL{CHM}, iqhtmPAYROLL_DE{HTM} )  {IQMS.Common.HelpHook.pas}
end;

end.
