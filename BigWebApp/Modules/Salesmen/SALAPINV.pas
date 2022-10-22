unit SalAPInv;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.DBGrids,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel;

type
  TFrmAPComm = class(TUniForm)
    Panel1: TUniPanel;
    Splitter1: TUniSplitter;
    Panel2: TUniPanel;
    gridPrePost: TUniDBGrid;
    gridPost: TUniDBGrid;
    Panel5: TUniPanel;
    Panel6: TUniPanel;
    Label1: TUniLabel;
    Panel15: TUniPanel;
    navPrepost: TUniDBNavigator;
    Bevel3: TUniPanel;
    Panel3: TUniPanel;
    Panel7: TUniPanel;
    Label2: TUniLabel;
    Panel8: TUniPanel;
    navPost: TUniDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    procedure AssignDataSource;
  public
    { Public declarations }
  end;

procedure DoShowAPCommissionsInvoices;

implementation
{$R *.DFM}
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  mainsale;

procedure DoShowAPCommissionsInvoices;
var
  LFrmAPComm : TFrmAPComm;
begin
  LFrmAPComm := TFrmAPComm.Create(UniGUIApplication.UniApplication);
  LFrmAPComm.Show;
end;

procedure TFrmAPComm.AssignDataSource;
begin
  navPrepost.DataSource  := TFrmSalesPeople(Owner).SrcAPPrePost;
  gridPrePost.DataSource := TFrmSalesPeople(Owner).SrcAPPrePost;

  navPost.DataSource  := TFrmSalesPeople(Owner).SrcAPPost;
  gridPost.DataSource := TFrmSalesPeople(Owner).SrcAPPost;
end;

procedure TFrmAPComm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, gridPrePost, gridPost, Panel2]);
end;

procedure TFrmAPComm.UniFormShow(Sender: TObject);
begin
  IQRegFormRead( self, [self, gridPrePost, gridPost, Panel2]);
  AssignDataSource;
end;

end.





