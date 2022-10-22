unit inv_loc_type_params;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniDBCheckBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TFrmInvLocTypeParams = class(TUniForm)
    dbchlVerifyLocationCheckDigit: TUniDBCheckBox;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    SecurityRegister1: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FLocationTypeDS: TDataSet;
    procedure AssignDataSource;
  public
    { Public declarations }
    class procedure DoShowModal;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.RegFrm;
{ TODO -oGPatil -cWebConvert : Dependency on these files
  inv_location_type,
  IQSecIns;
}
{ TFrmInvLocTypeParams }

class procedure TFrmInvLocTypeParams.DoShowModal;
var
  LFrmInvLocTypeParams : TFrmInvLocTypeParams;
begin
  LFrmInvLocTypeParams := TFrmInvLocTypeParams.Create(uniGUIApplication.UniApplication);
  LFrmInvLocTypeParams.ShowModal;
end;

procedure TFrmInvLocTypeParams.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormRead(self, [ self ]);
end;

procedure TFrmInvLocTypeParams.FormShow(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency on IQSecIns File.
  EnsureSecurityInspectorOnTopOf( self );
}
end;

procedure TFrmInvLocTypeParams.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [ self ]);
  AssignDataSource;
end;

procedure TFrmInvLocTypeParams.AssignDataSource;
begin
{ TODO -oGPatil -cWebConvert : Dependency on inv_location_type Filie.
  if Owner is TFrmInvLocationType then
  begin
    dbchlVerifyLocationCheckDigit.DataSource:= TFrmInvLocationType(Owner).SrcLocationType;
    FLocationTypeDS:= TFrmInvLocationType(Owner).SrcLocationType.DataSet;
  end;
  }
end;

procedure TFrmInvLocTypeParams.btnOKClick(Sender: TObject);
begin
  if Assigned(FLocationTypeDS) and (FLocationTypeDS.State = dsEdit) then
     FLocationTypeDS.Post;
  ModalResult:= mrOK;
end;


end.
