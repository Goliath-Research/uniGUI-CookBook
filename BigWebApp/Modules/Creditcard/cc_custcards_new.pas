unit cc_custcards_new;

{ ** Create a New Credit Card ** }
{ This form is called internally by the credit card application and is not
  accessible externally, through COM. }

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  cc_custcards,
  Vcl.Wwdatsrc,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  IQMS.WebVcl.About,
  Vcl.Menus,
  System.ImageList,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  Data.DB,
  Vcl.Buttons,
  uniGUIBaseClasses,
  UniGUIApplication,
  uniGUIClasses,
  uniPanel,
  uniButton, uniMainMenu, uniImageList, IQUniGrid, Vcl.Forms, uniGUIFrame,
  uniDBEdit, uniEdit, uniCheckBox, uniDBCheckBox, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniLabel, uniSplitter, uniPageControl,
  uniDBNavigator, uniBitBtn, uniSpeedButton;

type
  TFrmCustCredCardInsNew = class(TFrmCustCredCard)
    PnlModalButtons: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    procedure btnOKClick(Sender: TObject);
    procedure sbtnValidateClick(Sender: TObject);
    procedure SrcArcustoCredCardStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FArcusto_ID: Int64;
    procedure SetArcusto_ID(const Value: Int64);
    { Private declarations }
  public
    { Public declarations }
    property Arcusto_ID : Int64 write SetArcusto_ID;
  end;

function DoInsertNewCustCreditCard(AArcusto_ID: Int64; var AArcusto_Credit_Card_ID: Int64): TModalResult;

implementation

{$R *.DFM}


uses
  cc_encrypt,
  cc_rscstr,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous;

function DoInsertNewCustCreditCard(AArcusto_ID: Int64; var AArcusto_Credit_Card_ID: Int64): TModalResult;
var
  LFrmCustCredCardInsNew : TFrmCustCredCardInsNew;
begin
  LFrmCustCredCardInsNew := TFrmCustCredCardInsNew.Create(UniGUIApplication.UniApplication);
  LFrmCustCredCardInsNew.Arcusto_ID := AArcusto_ID ;
  Result := LFrmCustCredCardInsNew.ShowModal;
  if Result = mrOK then
    AArcusto_Credit_Card_ID := LFrmCustCredCardInsNew.QryArcustoCredCardID.AsLargeInt;
end;

procedure TFrmCustCredCardInsNew.btnOKClick(Sender: TObject);
begin
  if (QryArcustoCredCard.State in [dsEdit, dsInsert]) then
    QryArcustoCredCard.Post;
  ModalResult := mrOK;
end;

procedure TFrmCustCredCardInsNew.sbtnValidateClick(Sender: TObject);
begin
  if IQConfirmYN(cc_rscstr.cTXT0000023 { 'Save changes first?' } ) then
    inherited;
end;

procedure TFrmCustCredCardInsNew.SetArcusto_ID(const Value: Int64);
begin
  FArcusto_ID := Value;
end;

procedure TFrmCustCredCardInsNew.SrcArcustoCredCardStateChange(
  Sender: TObject);
begin
  inherited;
  btnCancel.Enabled := (QryArcustoCredCard.State in [dsEdit, dsInsert]);
end;

procedure TFrmCustCredCardInsNew.FormCreate(Sender: TObject);
begin
  inherited;
  // Remove the TMainMenu for this instance
  Self.Menu := nil;
end;

procedure TFrmCustCredCardInsNew.FormShow(Sender: TObject);
begin
  try
  // 06/20/2012 Update the package encryption keys so that
    // we can see data.
    cc_encrypt.ResetPackage;

    // 'Add Credit Card - %s';
    Caption := Format(cc_rscstr.cTXT0000022,
      [SelectValueFmtAsString(
      'SELECT company FROM arcusto WHERE id = %d',
      [FArcusto_ID])]);

    pcMain.ActivePage := TabForm;
    NavMain.Visible := FALSE;
    // Grid.Options := Grid.Options - [dgRowSelect];
    if QryArcustoCredCard.active then
    begin
      QryArcustoCredCard.Append;
    end;
    { get into insert mode and let user fill in blanks }

  except
    on E: Exception do
      if not IQMS.Common.Miscellaneous.IgnoreCOMRaisedEAbort(E) then
        IQError(E.Message);
  end;
end;

end.
