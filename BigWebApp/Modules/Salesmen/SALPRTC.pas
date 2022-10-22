unit SalPRTC;

interface

uses
  System.Classes,
  Vcl.Forms,
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
  uniLabel, Vcl.Controls;

type
  TFrmCommTimeCards = class(TUniForm)
    Panel1: TUniPanel;
    gridPrePost: TUniDBGrid;
    Splitter1: TUniSplitter;
    Panel2: TUniPanel;
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
    Bevel1: TUniPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    procedure AssignDataSource;
  public
    { Public declarations }
  end;

procedure DoShowPRCommissionsTimecards;

implementation
{$R *.DFM}
uses
  IQMS.Common.RegFrm,
  mainsale;

procedure DoShowPRCommissionsTimecards;
var
  LFrmCommTimeCards : TFrmCommTimeCards;
begin
  LFrmCommTimeCards := TFrmCommTimeCards.Create(UniGUIApplication.UniApplication);
  LFrmCommTimeCards.Show;
end;

procedure TFrmCommTimeCards.AssignDataSource;
begin
  navPrepost.DataSource  := TFrmSalesPeople(Owner).SrcPRPrePost;
  gridPrePost.DataSource := TFrmSalesPeople(Owner).SrcPRPrePost;

  navPost.DataSource  := TFrmSalesPeople(Owner).SrcPRPost;
  gridPost.DataSource := TFrmSalesPeople(Owner).SrcPRPost;
end;

procedure TFrmCommTimeCards.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, gridPrePost, gridPost, Panel2]);
end;

procedure TFrmCommTimeCards.UniFormShow(Sender: TObject);
begin
  IQRegFormRead( self, [self, gridPrePost, gridPost, Panel2]);
  AssignDataSource;
end;

end.
