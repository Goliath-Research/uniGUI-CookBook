unit EdiConfDel;

interface

uses
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TConfrimDeleteArchive = (daNone, daDelete, daDeleteArchive, daSkip);

type
  TFrmEdiConfDel = class(TUniForm)
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Button1: TUniButton;
    Button2: TUniButton;
    SR: TIQWebSecurityRegister;
    PnlMain: TUniPanel;
    GroupBox1: TUniGroupBox;
    rbDelete: TUniRadioButton;
    rbArcDel: TUniRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    nConfirmDelete:TConfrimDeleteArchive;
  end;

function DeleteOrNo:TConfrimDeleteArchive;


implementation
uses
  IQMS.Common.RegFrm;
  { TODO -oathite -cWebConvert : Dependent on IQSecIns
  IQSecIns; }

{$R *.DFM}


function DeleteOrNo:TConfrimDeleteArchive;
var
  LFrmEdiConfDel : TFrmEdiConfDel;
begin
  LFrmEdiConfDel := TFrmEdiConfDel.Create(uniGUIApplication.UniApplication);
  LFrmEdiConfDel.ShowModal;
  Result:= LFrmEdiConfDel.nConfirmDelete;
end;

procedure TFrmEdiConfDel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, rbDelete, rbArcDel]);
end;

procedure TFrmEdiConfDel.Button1Click(Sender: TObject);
begin
  if rbDelete.Checked then
     nConfirmDelete := daDelete
  else nConfirmDelete := daDeleteArchive;
  Close;
end;

procedure TFrmEdiConfDel.Button2Click(Sender: TObject);
begin
  nConfirmDelete := daNone;
  Close;
end;

procedure TFrmEdiConfDel.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [self, rbDelete, rbArcDel]);
{ TODO -oathite -cWebConvert : Dependent on IQSecIns
  EnsureSecurityInspectorOnTopOf( self ); }
end;

end.
