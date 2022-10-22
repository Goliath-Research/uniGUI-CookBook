unit PREmpMtc;

interface

uses
  System.Classes,
  Vcl.Forms,
  Vcl.DBGrids,
  IQMS.WebVcl.About,
  Vcl.Menus,
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
  uniDBNavigator,
  uniMainMenu;

type
  TFrmPREmpMatch = class(TUniForm)
    Panel1: TUniPanel;
    grid: TUniDBGrid;
    nav: TUniDBNavigator;
    IQAbout1: TIQWebAbout;
    PopupMenu1: TUniPopupMenu;
    Trace1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure Trace1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

procedure DOEmpDeductMatch(AOwner:TComponent);

var
  FrmPREmpMatch: TFrmPREmpMatch;

implementation
{$R *.DFM}
uses
  IQMS.Common.RegFrm,
//  PRDeduct,
  IQMS.Common.HelpHook;
 //   TR_Base;

procedure DOEmpDeductMatch(AOwner:TComponent);
begin
  TFrmPREmpMatch.Create(AOwner).Show;
end;





procedure TFrmPREmpMatch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, grid]);
  Action := caFree;
end;

procedure TFrmPREmpMatch.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmPAYROLL{CHM}, iqhtmPAYROLL_DE{HTM} )  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmPREmpMatch.Trace1Click(Sender: TObject);
begin
 // DoShowTrace( self, 'PR_DEDUCTION_MATCH', TFrmPRDeductions(Owner).tblEmpMatchID.asFloat ); {TR_Base.pas}
end;

procedure TFrmPREmpMatch.UniFormCreate(Sender: TObject);
begin
    IQRegFormRead( self, [self, grid]);
 // nav.DataSource := TFrmPRDeductions(AOwner).SrcEmpMatch;
 // grid.DataSource := TFrmPRDeductions(AOwner).SrcEmpMatch;
end;

end.
