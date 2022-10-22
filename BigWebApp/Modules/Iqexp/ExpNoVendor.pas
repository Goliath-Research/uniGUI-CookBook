unit ExpNoVendor;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMemo,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TFrmNoVendorUser = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    BtnYes: TUniButton;
    BtnNo: TUniButton;
    Memo1: TUniMemo;
    SR: TIQWebSecurityRegister;
    procedure BtnNoClick(Sender: TObject);
    procedure BtnYesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FResult:boolean;
  public
    { Public declarations }
  end;

function NoVendorWarning(AOwner:TComponent; AList:TStringList):boolean;

var
  FrmNoVendorUser: TFrmNoVendorUser;

implementation
uses
  IQMS.Common.RegFrm;
//  IQSecIns;
{$R *.dfm}


function NoVendorWarning(AOwner:TComponent; AList:TStringList):boolean;
var
  I:Integer;
begin
  FrmNoVendorUser := FrmNoVendorUser.Create(UniGUIApplication.UniApplication);
  FrmNoVendorUser.ShowModal;

  FrmNoVendorUser.Memo1.Clear;
  for I:= 0 to AList.Count - 1 do
    FrmNoVendorUser.Memo1.Lines.Add(AList[I]);


  with FrmNoVendorUser do
  try
    ShowModal;
    Result := FResult;
  finally
    Free;
  end;
end;


procedure TFrmNoVendorUser.BtnNoClick(Sender: TObject);
begin
  FResult := False;
  Close;
end;






procedure TFrmNoVendorUser.BtnYesClick(Sender: TObject);
begin
  FResult := True;
  Close;
end;

procedure TFrmNoVendorUser.FormShow(Sender: TObject);
begin
//  EnsureSecurityInspectorOnTopOf( self );
end;



procedure TFrmNoVendorUser.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);

end;

procedure TFrmNoVendorUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

end.
