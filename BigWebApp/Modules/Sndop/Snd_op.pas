unit Snd_op;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  Snd_Base,
  Mask,
  MainModule,
  Data.DB,
  IQMS.WebVcl.Jump,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Dialogs,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About,
  Vcl.Buttons,
  IQMS.WebVcl.DocumentsExternal,
  IQMS.WebVcl.Documents,
  Vcl.DBGrids,
  Vcl.Controls,
  System.Classes,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniLabel, uniComboBox, uniDBComboBox, uniMainMenu, uniButton, uniBitBtn,
  uniSpeedButton, uniDBNavigator, uniBasicGrid, uniDBGrid, IQUniGrid,
  uniGUIFrame, uniCheckBox, uniDBCheckBox, uniPageControl;

type
  TSndOp = class(TSndBase)
    PnlOp01: TUniPanel;
    Splitter3: TUniSplitter;
    PnlOpLeft01: TUniPanel;
    PnlOpClient01: TUniPanel;
    Label5: TUniLabel;
    dbeCenterRate: TUniDBEdit;
    lblCostElement: TUniLabel;
    wwDBLookupCombo1: TUniDBLookupComboBox;
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    procedure FormCreate(Sender: TObject);
    procedure sbtnCenterTypeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  protected
    { Protected declarations }
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.RegFrm,
  sndop_rscstr;


procedure TSndOp.FormCreate(Sender: TObject);
begin
  OpClass:= 'OP';
  inherited;
  IQRegFormRead(Self, [PnlOpLeft01]); // iqregfrm
  // ensure navigation bar Vcl.Buttons are 25x25 (after security)
  (*
  IQMS.Common.Controls.ResizeNavBar(NavMain);
  IQMS.Common.Controls.ResizeNavBar(navMaterials);
  IQMS.Common.Controls.ResizeNavBar(navMatQPB);
  *)
end;

procedure TSndOp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [PnlOpLeft01]); // iqregfrm

  inherited;

end;

procedure TSndOp.sbtnCenterTypeClick(Sender: TObject);
begin
  inherited; // Pick & Replace
end;

end.
