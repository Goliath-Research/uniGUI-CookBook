unit BomConfReplRG;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmBomConfReplaceRG = class(TUniForm)
    SR: TIQWebSecurityRegister;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnReplace: TUniButton;
    btnIgnore: TUniButton;
    PnlMain: TUniPanel;
    Label3: TUniLabel;
    chkFutureChk: TUniCheckBox;
    GroupBox1: TUniGroupBox;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Edit1: TUniEdit;
    Edit2: TUniEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    procedure SetCurrent_RG(const Value: Real);
    procedure SetAvail_RG(const Value: Real);
    { Private declarations }
  public
    { Public declarations }
    property Current_RG : Real write SetCurrent_RG;
    property Avail_RG : Real write SetAvail_RG;
  end;

function ConfirmReplaceRegrind( ACurrent_RG, AAvail_RG: Real; var AKeepChecking: Boolean ): Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
{ TODO -oGPatil -cWebConvert : Dependency on Iqsecins.pas File
  IQSecIns,   }
  IQMS.Common.Controls;

procedure TFrmBomConfReplaceRG.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
{ TODO -oGPatil -cWebConvert : Incompatible types TForm and TFrmBomConfReplaceRG
  IQMS.Common.Controls.ResizeCheckBoxes(self, PnlMain);  }
end;

function ConfirmReplaceRegrind( ACurrent_RG, AAvail_RG: Real; var AKeepChecking: Boolean ): Boolean;
var
  LFrmBomConfReplaceRG : TFrmBomConfReplaceRG;
begin
  LFrmBomConfReplaceRG := TFrmBomConfReplaceRG.Create(UniGUIApplication.UniApplication);
  LFrmBomConfReplaceRG.Current_RG := ACurrent_RG;
  LFrmBomConfReplaceRG.Avail_RG := AAvail_RG;
  Result:= LFrmBomConfReplaceRG.ShowModal = mrOK;
  if Result then
     AKeepChecking:= LFrmBomConfReplaceRG.chkFutureChk.Checked;
end;

procedure TFrmBomConfReplaceRG.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmBomConfReplaceRG.FormShow(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency on Iqsecins.pas File
  EnsureSecurityInspectorOnTopOf( self );  }
end;

procedure TFrmBomConfReplaceRG.SetAvail_RG(const Value: Real);
begin
  Edit1.Text:= FloatToStr( Value );
end;

procedure TFrmBomConfReplaceRG.SetCurrent_RG(const Value: Real);
begin
    Edit2.Text:= FloatToStr( Value );
end;

end.
