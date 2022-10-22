unit OE_Ver;

interface

uses
  System.Classes,
  Vcl.Forms,
  Mask,
  Vcl.Buttons,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniCheckBox,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  TFrmOE_VerControl = class(TUniForm)
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label2: TUniLabel;
    Label4: TUniLabel;
    Label1: TUniLabel;
    DBEdit2: TUniDBEdit;
    DBEdit4: TUniDBEdit;
    DBEdit1: TUniDBEdit;
    cbRevHist: TUniCheckBox;
    Label3: TUniLabel;
    BitBtnRevHist: TUniBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure cbRevHistClick(Sender: TObject);
    procedure BitBtnRevHistClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoShowVerControl( );



implementation

uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
  { TODO -oSanketG -cWC : Need to revisit }
  {OE_Main,
  RevHist}

{$R *.DFM}


procedure DoShowVerControl(  );
var
  FrmOE_VerControl: TFrmOE_VerControl;
begin
  FrmOE_VerControl := TFrmOE_VerControl.Create(UniGUIApplication.uniApplication);
  FrmOE_VerControl.Show;
end;

procedure TFrmOE_VerControl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, PnlLeft01 ]);
end;

procedure TFrmOE_VerControl.UniFormCreate(Sender: TObject);
begin
  { TODO -oSanketG -cWC : Need to revisit, Depends on oe_main }
  {TFrmMainOrder(AOwner).DM.Name:= 'OE_DM';
  TFrmMainOrder(AOwner).DM.Name:= '';}
  IQRegFormRead( self, [ self, PnlLeft01 ]);
  cbRevHist.checked := SelectValueAsString('select NVL(enable_rev_hist, ''N'') from iqsys2 where rownum < 2') = 'Y';
  BitBtnRevHist.Visible := cbRevHist.checked;
end;

procedure TFrmOE_VerControl.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSALES_ORDER{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmOE_VerControl.BitBtnRevHistClick(Sender: TObject);
begin
  FormSTyle := fsNormal;
  { TODO -oSanketG -cWC : Need to revisit ,depends on RevHist}
  //DoShowRevHist(self, TFrmMainOrder(Owner).DM.TblOrdersID.asFloat);  {RevHist.pas}
end;

procedure TFrmOE_VerControl.cbRevHistClick(Sender: TObject);
begin
  if cbRevHist.checked then
    ExecuteCommand('update iqsys2 set enable_rev_hist = ''Y''')
  else
    ExecuteCommand('update iqsys2 set enable_rev_hist = ''N''');
  BitBtnRevHist.Visible := cbRevHist.checked;
end;



end.
