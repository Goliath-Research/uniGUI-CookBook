unit Snd_OV;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  Snd_Base,
  Vcl.Buttons,
  Mask,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniLabel, IQMS.WebVcl.Jump, Vcl.Menus, uniMainMenu,
  IQMS.WebVcl.SecurityRegister, Vcl.Dialogs, IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About, IQMS.WebVcl.DocumentsExternal, IQMS.WebVcl.Documents,
  uniDBNavigator, uniBasicGrid, uniDBGrid, IQUniGrid, uniGUIFrame, uniCheckBox,
  uniDBCheckBox, uniPageControl, System.Classes, Vcl.Controls;

type
  TSndOV = class(TSndBase)
    PnlOp01: TUniPanel;
    Splitter3: TUniSplitter;
    PnlOpLeft01: TUniPanel;
    PnlOpClient01: TUniPanel;
    Label10: TUniLabel;
    Label11: TUniLabel;
    dbeVendor: TUniDBEdit;
    dbeLeadTime: TUniDBEdit;
    sbtnGetVendor: TUniSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure sbtnGetVendorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SndOV: TSndOV;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.RegFrm,
  sndop_rscstr;

procedure TSndOV.FormCreate(Sender: TObject);
begin
  OpClass:= 'OV';
  inherited;

  TblSndOp.FieldByName('VENDOR_ID').Required:= TRUE; // since it's a outside vendor - insist on valid vendor id
  IQRegFormRead(Self, [PnlOpLeft01]); // iqregfrm
  // ensure navigation bar Vcl.Buttons are 25x25 (after security)
  //IQMS.Common.Controls.ResizeNavBar(NavMain);
end;

procedure TSndOV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [PnlOpLeft01]); // iqregfrm
  inherited;
end;

procedure TSndOV.sbtnGetVendorClick(Sender: TObject);
begin
  inherited; // Pick & Replace
end;

end.

