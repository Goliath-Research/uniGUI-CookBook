unit Cap_Main;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIFrame,
  Cap_MainDataModule,
  uniDBNavigator,
  uniToolBar,
  uniGUIBaseClasses,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniPanel;

type
  TUniCap_Main = class(TUniFrame)
    grdV_Hrs_Day: TUniDBGrid;
    grdV_Hrs_Day_Tot: TUniDBGrid;
    grdV_Hrs_Week_Tot: TUniDBGrid;
    grdWorkCenterType: TUniDBGrid;
    UniToolBar1: TUniToolBar;
    UniDBNavigator1: TUniDBNavigator;
    UniToolBar2: TUniToolBar;
    UniDBNavigator2: TUniDBNavigator;
    UniToolBar3: TUniToolBar;
    UniDBNavigator3: TUniDBNavigator;
    UniToolBar4: TUniToolBar;
    UniDBNavigator4: TUniDBNavigator;
    pnlLeft: TUniPanel;
    pnlRight: TUniPanel;
    pnlTop: TUniPanel;
    pnlCenter: TUniPanel;
    pnlBottom: TUniPanel;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TUniCap_Main.UniFrameCreate(Sender: TObject);
begin
  Cap_Main_DM.DoOnFrameCreate(Self);
end;

procedure TUniCap_Main.UniFrameDestroy(Sender: TObject);
begin
  Cap_Main_DM.DoOnFrameDestroy(Self);
end;

end.
