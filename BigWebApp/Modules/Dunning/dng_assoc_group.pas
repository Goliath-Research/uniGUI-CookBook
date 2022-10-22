unit dng_assoc_group;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.About,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniPageControl, IQUniGrid, uniGUIFrame;

type
  TAssociatedWith = (awCustomers, awInvoices);

  TFrmDNAssocGroup = class(TUniForm)
    PnlMain: TUniPanel;
    pcMain: TUniPageControl;
    TabCustomers: TUniTabSheet;
    TabInvoices: TUniTabSheet;
    SrcArcusto: TDataSource;
    QryArcusto: TFDQuery;
    SrcArInvoice: TDataSource;
    QryInvoices: TFDQuery;
    GridArcusto: TIQUniGridControl;
    GridInvoices: TIQUniGridControl;
    QryInvoicesID: TBCDField;
    QryInvoicesARCUSTO_ID: TBCDField;
    QryInvoicesINVOICE_NO: TStringField;
    QryInvoicesINVOICE_DATE: TDateTimeField;
    QryInvoicesDUE_DATE: TDateTimeField;
    QryInvoicesBILL_TO_ATTN: TStringField;
    QryInvoicesBILL_TO_ADDR1: TStringField;
    QryInvoicesBILL_TO_ADDR2: TStringField;
    QryInvoicesBILL_TO_ADDR3: TStringField;
    QryInvoicesBILL_TO_CITY: TStringField;
    QryInvoicesBILL_TO_STATE: TStringField;
    QryInvoicesBILL_TO_COUNTRY: TStringField;
    QryInvoicesBILL_TO_ZIP: TStringField;
    QryInvoicesDUNNING_SEQ: TBCDField;
    QryInvoicesDUNNING_EXCLUDE: TStringField;
    QryInvoicesEPLANT_ID: TBCDField;
    QryInvoicesTERMS_DESCRIP: TStringField;
    QryInvoicesTERMS_DAYS: TBCDField;
    QryArcustoID: TBCDField;
    QryArcustoCUSTNO: TStringField;
    QryArcustoCOMPANY: TStringField;
    QryArcustoADDR1: TStringField;
    QryArcustoADDR2: TStringField;
    QryArcustoADDR3: TStringField;
    QryArcustoCITY: TStringField;
    QryArcustoSTATE: TStringField;
    QryArcustoZIP: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    PArcusto: TUniPopupMenu;
    PInvoice: TUniPopupMenu;
    JumpToCustomerMaintenance1: TUniMenuItem;
    JumpToInvoice1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    Bevel1: TUniPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DoBeforeOpen(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure JumpToCustomerMaintenance1Click(Sender: TObject);
    procedure JumpToInvoice1Click(Sender: TObject);
    procedure PArcustoPopup(Sender: TObject);
    procedure PInvoicePopup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FGroupID: Real;
    FCaption: String;
    FAssociated: TAssociatedWith;
    procedure SetCaption;
    procedure SetAssociated(const Value: TAssociatedWith);
    procedure SetGroupID(const Value: Real);
  public
    { Public declarations }
    property GroupID : Real write SetGroupID;
    property Associated : TAssociatedWith write SetAssociated;
  end;

procedure ShowAssocGroup(AGroupID: Real;AAssociated: TAssociatedWith = awCustomers);


implementation

{$R *.DFM}
uses
{ TODO -omugdha -cWEBIQ : Dependancy on iview
  iview,
  cust, }
  dunning_rscstr,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.Common.Controls;


procedure TFrmDNAssocGroup.UniFormCreate(Sender: TObject);
begin
  try
    //inherited Create(AOwner);
    AdjustPageControlToParent(pcMain); // config page ctrl
    if FAssociated = awCustomers then
      ReOpen(QryArcusto) // open dataset
    else
      ReOpen(QryInvoices);
    pcMain.ActivePageIndex := Ord(FAssociated); // show page
    SetCaption; // caption based on associated
  except
    on E: Exception do
      begin
        IQError(E.Message);
        PostMessage(Handle, wm_Command, Exit1.Command, 0); // Call "Exit"
      end;
  end;
end;

procedure ShowAssocGroup(AGroupID: Real; AAssociated: TAssociatedWith);
var
  LFrmDNAssocGroup : TFrmDNAssocGroup;
begin
  //TFrmDNAssocGroup.Create(AOwner, AGroupID, AAssociated).Show;
  LFrmDNAssocGroup := TFrmDNAssocGroup.Create(uniGUIApplication.UniApplication);
  with LFrmDNAssocGroup do
  begin
  FGroupID := AGroupID;
  end;
end;


procedure TFrmDNAssocGroup.FormShow(Sender: TObject);
begin
  IQRegFormRead(Self, [Self]); // IQMS.Common.RegFrm.pas
end;

procedure TFrmDNAssocGroup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self]); // IQMS.Common.RegFrm.pas
end;

procedure TFrmDNAssocGroup.DoBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', FGroupID);
end;

procedure TFrmDNAssocGroup.SetAssociated(const Value: TAssociatedWith);
begin
    FAssociated:= Value;
end;

procedure TFrmDNAssocGroup.SetCaption;
var
  S: String;
begin
  S := SelectValueFmtAsString
    ('select descrip from dunning_group where id = %.0f', [FGroupID]);
  if pcMain.ActivePageIndex = 0 then
    // dunning_rscstr.cTXT0000005  =
    // 'Associated Customers - %s'
    Caption := Format(dunning_rscstr.cTXT0000005, [S])
  else
    // dunning_rscstr.cTXT0000006  =
    // 'Associated Invoices - %s'
    Caption := Format(dunning_rscstr.cTXT0000006, [S]);
end;

procedure TFrmDNAssocGroup.SetGroupID(const Value: Real);
begin
      FGroupID:=Value;
end;


procedure TFrmDNAssocGroup.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmDNAssocGroup.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmDNAssocGroup.JumpToCustomerMaintenance1Click(
  Sender: TObject);
begin
  if QryArcustoID.AsLargeInt > 0 then
  { TODO -omugdha -cWEBIQ : Dependancy on cust
    DoIQJumpToCustomer(Application, QryArcustoID.AsLargeInt);} // cust
end;

procedure TFrmDNAssocGroup.JumpToInvoice1Click(Sender: TObject);
begin
  if (QryInvoicesID.AsLargeInt > 0) then
  { TODO -omugdha -cWEBIQ : Dependancy on cust
    DoJumpToInvoice(Application, QryInvoicesID.AsLargeInt); }// iview
end;

procedure TFrmDNAssocGroup.PArcustoPopup(Sender: TObject);
begin
  JumpToCustomerMaintenance1.Enabled := (QryArcustoID.AsLargeInt > 0) and
    SR.Enabled['JumpToCustomerMaintenance1'];
end;

procedure TFrmDNAssocGroup.PInvoicePopup(Sender: TObject);
begin
  JumpToInvoice1.Enabled := (QryInvoicesID.AsLargeInt > 0) and
    SR.Enabled['JumpToInvoice1'];

end;

end.
