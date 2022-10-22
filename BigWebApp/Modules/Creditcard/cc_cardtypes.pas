unit cc_cardtypes;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Menus,
  Vcl.Wwdatsrc,
  IQMS.Common.JumpConstants,
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  System.ImageList,
  uniGUIBaseClasses,
  uniImageList,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, IQUniGrid, uniGUIFrame;

type
  TFrmCredCard = class(TUniForm)
    SrcCreditCard: TDataSource;
    tblCreditCard: TFDTable;
    tblCreditCardID: TBCDField;
    tblCreditCardDESCRIP: TStringField;
    tblCreditCardACCTNO_LENGTH: TBCDField;
    Panel1: TUniPanel;
    SR: TIQWebSecurityRegister;
    PnlMain: TUniPanel;
    cmbGridCardType: TUniDBComboBox;
    Grid: TIQUniGridControl;
    Bevel1: TUniPanel;
    PMain: TUniPopupMenu;
    AddAllCardTypes1: TUniMenuItem;
    tblCreditCardExpCust: TBCDField;
    ImageList1: TUniImageList;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    Contents1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    tblCreditCardImageIndex: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure tblCreditCardBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AddAllCardTypes1Click(Sender: TObject);
    procedure tblCreditCardCalcFields(DataSet: TDataSet);
    procedure tblCreditCardBeforeDelete(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure IQAfterShowMessage(var Msg: TMessage);
      message iq_AfterShowMessage;
  public
    { Public declarations }
  end;

procedure DoAcceptedCreditCards;

implementation

{$R *.DFM}


uses
  cc_log,
  cc_rscstr,
  cc_types,
  IQMS.Common.FormFocus,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  { TODO : iqsecins not yet converted }
  //iqsecins,
  IQMS.Common.StringUtils;

procedure DoAcceptedCreditCards;
var
  LFrmCredCard : TFrmCredCard;
begin
  // Create the form, if it does not already exist
  if not Assigned(LFrmCredCard) then
    LFrmCredCard := TFrmCredCard.Create(UniGUIApplication.UniApplication);
  // Show the form
  with LFrmCredCard do
  begin
    Show;
    // BringToFront;
    PostMessage(Handle, iq_AfterShowMessage, 0, 0);
  end;
end;

{ TFrmCredCard }

procedure TFrmCredCard.FormCreate(Sender: TObject);
begin
  WriteToLog_ScreenAccess(Caption, lsCardTypes); // cc_log.pas
  IQSetTablesActiveEx(TRUE, self, '');
  cmbGridCardType.Visible := FALSE;
  PostMessage(Handle, iq_AfterShowMessage, 0, 0);
end;

procedure TFrmCredCard.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self, Grid]);
  { TODO : iqsecins not yet converted }
  //EnsureSecurityInspectorOnTopOf(self);
end;

procedure TFrmCredCard.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, Grid]);
end;

procedure TFrmCredCard.IQAfterShowMessage(var Msg: TMessage);
begin
  // iqctrl.ForceForegroundWindowB(Self.Handle);
  { TODO : There is no overloaded version of 'ForceFormFocus' that can be called with these arguments }
  //IQMS.Common.FormFocus.ForceFormFocus(Self);
  self.BringToFront;
end;

procedure TFrmCredCard.tblCreditCardBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
  if tblCreditCardDESCRIP.AsString = '' then
    raise Exception.Create
      (cc_rscstr.cTXT0000015 { 'Credit card type required.' } );

  if SelectValueFmtAsInteger(
    'SELECT 1 FROM credit_card WHERE TRIM(UPPER(descrip)) = TRIM(UPPER(''%s'')) AND ROWNUM < 2',
    [tblCreditCardDESCRIP.AsString]) = 1 then
    // cc_rscstr.cTXT0000014 =
    // 'The credit card type is already in the list.'
    raise Exception.Create(cc_rscstr.cTXT0000014);
end;

procedure TFrmCredCard.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmSETUP { CHM } , iqhtmSETUPch4 { HTM } );
  { IQMS.Common.HelpHook.pas }
end;

procedure TFrmCredCard.AddAllCardTypes1Click(Sender: TObject);
  procedure _AddType(const AType: string);
  begin
    if AType = '' then
      Exit;
    if SelectValueFmtAsInteger(
      'SELECT 1 FROM credit_card WHERE descrip = ''%s'' AND ROWNUM < 2',
      [AType]) = 0 then
      ExecuteCommandFmt(
        'INSERT INTO credit_card (id, descrip) ' +
        'VALUES( s_credit_card.NEXTVAL, ''%s'' )',
        [AType]);
  end;

var
  o: TCreditCardType;
begin
  // Adds all supported credit card types
  try
    tblCreditCard.DisableControls;
    for o in AcceptedCardTypes do
      _AddType(CardTypeName[o]);
    tblCreditCard.Refresh;
  finally
    tblCreditCard.EnableControls;
  end;
end;

procedure TFrmCredCard.tblCreditCardCalcFields(DataSet: TDataSet);
var
  o: TCreditCardType;
begin
  if (DataSet = nil) or not DataSet.Active or
    (DataSet.FindField('DESCRIP') = nil) or
    (DataSet.FieldByName('DESCRIP').AsString = '') then
    Exit;

  o := GetCardType(DataSet.FieldByName('DESCRIP').AsString); // in cc_types.pas
  tblCreditCardImageIndex.AsInteger := ImageMap[o]; // see cc_types.pas

end;

procedure TFrmCredCard.UniFormDestroy(Sender: TObject);
begin
  inherited Destroy;
end;

procedure TFrmCredCard.tblCreditCardBeforeDelete(DataSet: TDataSet);
begin
  if SelectValueFmtAsInteger(
    'SELECT 1 FROM arcusto_credit_card ' +
    'WHERE credit_card_id = %d AND ROWNUM < 2',
    [tblCreditCardID.AsLargeInt]) = 1 then
    // 'Cannot delete.  This card type is currently associated
    // with one or more customer credit cards.'
    raise Exception.Create(cc_rscstr.cTXT0000021);
end;

procedure TFrmCredCard.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCredCard.Contents1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile('CC.chm', 'CC.hhp'); // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(self.HelpContext);
end;

procedure TFrmCredCard.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

end.
