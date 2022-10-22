unit ExpMerchants;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Menus,
  Vcl.DBCtrls, //TNavigateBtn
//  Mask,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.About,
  Data.DB,
  IQMS.WebVcl.Hpick,
//  Vcl.Wwdatsrc,
//  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniPageControl, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmMerchants = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    PKAcct: TIQWebHPick;
    PKAcctID: TBCDField;
    PKAcctACCT: TStringField;
    PKAcctDESCRIP: TStringField;
    PKAcctTYPE: TStringField;
    PKAcctEPLANT_ID: TBCDField;
    IQAbout1: TIQWebAbout;
    SR: TIQWebSecurityRegister;
    SrcHdr: TDataSource;
    QryHdr: TFDQuery;
    QryHdrID: TBCDField;
    QryHdrDESCRIPTION: TStringField;
    QryHdrSIC_MCC: TBCDField;
    QryHdrGLACCT_ID_EXPENSE: TBCDField;
    UpdateSQL1: TFDUpdateSQL;
    QryHdrACCT: TStringField;
    Contents1: TUniMenuItem;
    PC: TUniPageControl;
    TabForm: TUniTabSheet;
    TabGrid: TUniTabSheet;
    IQSearch1: TIQUniGridControl;
    wwDBGlAccount: TUniEdit;
    SBSearch: TUniSpeedButton;
    sbtnTableForm2: TUniSpeedButton;
    wwDBGlacctForm: TUniEdit;
    DBDescrip: TUniDBEdit;
    DBSic: TUniDBEdit;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    QryHdrPK_HIDE: TStringField;
    DBInactive: TUniDBCheckBox;
    PkMerchants: TIQWebHPick;
    PkMerchantsID: TBCDField;
    PkMerchantsDESCRIPTION: TStringField;
    PkMerchantsSIC_MCC: TBCDField;
    PkMerchantsGLACCT_ID_EXPENSE: TBCDField;
    PkMerchantsACCT: TStringField;
    New1: TUniMenuItem;
    PkMerchantsPK_HIDE: TStringField;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    BtnCancel: TUniButton;
    BtnSelect: TUniButton;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryHdrAfterPost(DataSet: TDataSet);
    procedure QryHdrBeforePost(DataSet: TDataSet);
    procedure NavHdrBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure wwDBGlAccountCustomDlg(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure sbtnTableForm2Click(Sender: TObject);
    procedure SBSearchClick(Sender: TObject);
    procedure PkMerchantsIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure New1Click(Sender: TObject);
    procedure BtnSelectClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FId:Real;
    procedure ExecuteSearch;
    function GetId: Real;
    procedure SetId(const Value: Real);
  public
    { Public declarations }
    property Id: Real read GetId write SetId;
  end;

procedure DoExpMerchants;
function  GetExpMerchants: real;

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook;
{$R *.dfm}

procedure DoExpMerchants;
var
  frm: TFrmMerchants;
begin
  frm:= TFrmMerchants.Create(uniGUIApplication.UniApplication);
  frm.Panel2.visible := false;
  frm.ExecuteSearch;
  frm.Show;
end;

function GetExpMerchants:real;
var
  frm: TFrmMerchants;
begin
  frm:= TFrmMerchants.Create(uniGUIApplication.UniApplication);
  frm.Panel2.visible := true;
  { TODO -oLema : There is no BtnClick method. Changed to Dataset.Insert }
  frm.QryHdr.Insert;
//  NavHdr.BtnClick(nbInsert);
  frm.ShowModal;
  Result := frm.Id;
end;

procedure TFrmMerchants.UniFormCreate(Sender: TObject);
begin
  FId := 0;
  PC.ActivePage := TabForm;
  QryHdr.open;
  IQRegFormRead( self, [self]);
{ TODO -oLema : TUniControl can not accept child controls }
//  wwDBGlAccount.Parent  := IQSearch1.DBGrid;
  wwDBGlAccount.visible := false;
  New1.visible     := false;
end;

procedure TFrmMerchants.SetId(const Value: Real);
begin
  FId:= Value;
end;

function TFrmMerchants.GetId: Real;
begin
  Result:= Fid;
end;

procedure TFrmMerchants.BtnCancelClick(Sender: TObject);
begin
  FId := 0;
  Close;
end;

procedure TFrmMerchants.BtnSelectClick(Sender: TObject);
begin
  FId := QryHdrID.asFloat;
  Close;
end;

procedure TFrmMerchants.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmMerchants.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmMerchants.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmMerchants.QryHdrAfterPost(DataSet: TDataSet);
begin
//  QryHdr.Database.ApplyUpdates([ QryHdr ]);
end;

procedure TFrmMerchants.ExecuteSearch;
begin
  try
    SBSearchClick(NIL) ;      // activate search speed button
  except on E:EAbort do
    begin
{ TODO -oLema : Windows Message. Changed to Exit1Click}
      Exit1Click(nil);
//      PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
    end;
  end;
end;

procedure TFrmMerchants.SBSearchClick(Sender: TObject);
var
  AId:Real;
begin
  with PkMerchants do
    if Execute then
    begin
      AId := GetValue('ID');
      if AID > 0 then
         QryHdr.Locate( 'id', AId, []);
    end
    else System.SysUtils.Abort;
end;

procedure TFrmMerchants.sbtnTableForm2Click(Sender: TObject);
begin
  if (PC.ActivePage = TabForm) or (Sender = NIL) then
  begin
    PC.ActivePage := TabGrid;
  end
  else
  begin
    PC.ActivePage := TabForm;
  end;
end;

procedure TFrmMerchants.QryHdrBeforePost(DataSet: TDataSet);
begin
  if QryHdrID.asFloat = 0 then
    QryHdrID.asFloat := GetNextID('exp_merchant');
end;


procedure TFrmMerchants.NavHdrBeforeAction(Sender: TObject; Button: TNavigateBtn);
var
  AId:Real;
begin
  if Button = nbRefresh then
  begin
    AId := QryHdrID.asFloat;
    IQRegFormWrite( self, [self]);
    QryHdr.Close;
    QryHdr.Open;
    IQRegFormRead( self, [self]);

    QryHdr.Locate( 'id', AId, []);
    Abort;
  end;

end;


procedure TFrmMerchants.New1Click(Sender: TObject);
begin
  { TODO -oLema : There is no BtnClick method. Changed to Dataset.Insert }
  QryHdr.Insert;
//  NavHdr.BtnClick(nbInsert);
end;

procedure TFrmMerchants.PkMerchantsIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action     := mrOK;
  ResultValue:= 0;

{ TODO -oLema : Windows Message. changed to New1Click}
  New1Click(nil);
//  PostMessage( Handle, wm_Command, New1.Command, 0 );

end;

procedure TFrmMerchants.wwDBGlAccountCustomDlg(Sender: TObject);
begin
  with PKAcct do
    if Execute then
    begin
      if not (QryHdr.State in [dsEdit, dsInsert]) then QryHdr.Edit;
      QryHdr.FieldByName('GLACCT_ID_EXPENSE').asFloat := GetValue('ID');
      QryHdr.FieldByName('ACCT').asString := GetValue('ACCT');
    end;
end;

procedure TFrmMerchants.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmExpRep{CHM}, iqhtmExpRep{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmMerchants.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

end.
