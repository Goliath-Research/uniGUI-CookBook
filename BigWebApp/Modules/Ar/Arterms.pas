unit ArTerms;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniMultiItem,
  uniListBox,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmArTerms = class(TUniForm)
    lbTerms: TUniListBox;
    Label1: TUniLabel;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    RBDoNotChangeTerms: TUniRadioButton;
    RBSelectTerms: TUniRadioButton;
    SecurityRegister1: TIQWebSecurityRegister;
    Label2: TUniLabel;
    edTerms: TUniEdit;
    procedure BtnCancelClick(Sender: TObject);
    procedure RBDoNotChangeTermsClick(Sender: TObject);
    procedure RBSelectTermsClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
   
  public
    { Public declarations }
    FTermsId:Integer;


  end;

  function DoGetArPrepostTermsId(FStringList:TStringList; var ATermsId:Integer; AId:Real; ATable:String = 'ARPREPOST'):Boolean;

var
  FrmArTerms: TFrmArTerms;
  vFStringList:TStringList;
  vAId:Real;
  vATable:String;
implementation
uses
  IQMS.Common.RegFrm,
 // IQSecIns,
  IQMS.Common.DataLib;
{$R *.DFM}

function DoGetArPrepostTermsId(FStringList:TStringList; var ATermsId:Integer; AId:Real; ATable:String = 'ARPREPOST'):Boolean;
begin
  FrmArTerms := TFrmArTerms.Create(uniGUIApplication.UniApplication);
  vFStringList := FStringList;
  vAId := AId   ;
  vATable := ATable;
  with FrmArTerms do
  try
    ShowModal;
    ATermsId := FTermsId;
    Result := ATermsId <> 0;
  finally
    Free;
  end;
end;


procedure TFrmArTerms.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmArTerms.BtnCancelClick(Sender: TObject);
begin
  FTermsId := 0;
  Close;
end;

procedure TFrmArTerms.BtnOkClick(Sender: TObject);
begin
  if RBDoNotChangeTerms.Checked then
    FTermsID := 0
  else
    FTermsId := LongInt(LBTerms.Items.Objects[LBTerms.ItemIndex]);
  Close;
end;

procedure TFrmArTerms.RBDoNotChangeTermsClick(Sender: TObject);
begin
  lbTerms.Enabled := False;
end;

procedure TFrmArTerms.RBSelectTermsClick(Sender: TObject);
begin
  lbTerms.Enabled := True;
end;

procedure TFrmArTerms.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
  edTerms.Text := SelectValueFmtAsString('select t.description from terms t, %s a ' +
                             'where a.terms_id = t.id and a.id = %f', [vATable, vAId]);
  LbTerms.Items.Assign(vFStringList);
  LbTerms.ItemIndex := 0;
  LbTerms.Enabled := False;
end;

procedure TFrmArTerms.FormShow(Sender: TObject);
begin
 // EnsureSecurityInspectorOnTopOf( self );
end;

end.
