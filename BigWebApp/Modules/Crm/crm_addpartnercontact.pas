unit crm_addpartnercontact;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  MaskUtils,
  DM_CRMPK,
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
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  uniPageControl;

type
  TFrmCrmAddPartnerContact = class(TUniForm)
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    PC: TUniPageControl;
    Src: TDataSource;
    TblContact: TFDTable;
    TabSheet1: TUniTabSheet;
    TblContactID: TBCDField;
    QryPartner: TFDQuery;
    QryPartnerCOMPANY: TStringField;
    QryPartnerADDR1: TStringField;
    QryPartnerADDR2: TStringField;
    QryPartnerADDR3: TStringField;
    QryPartnerCITY: TStringField;
    QryPartnerSTATE: TStringField;
    QryPartnerCOUNTRY: TStringField;
    QryPartnerZIP: TStringField;
    QryPartnerPHONE_NUMBER: TStringField;
    QryPartnerEXT: TStringField;
    QryPartnerFAX_NUMBER: TStringField;
    QryPartnerUSE_USA_MASK: TStringField;
    Bevel1: TUniPanel;
    QryPartnerPARTNERNO: TStringField;
    QryPartnerID: TBCDField;
    TblContactPARTNER_ID: TBCDField;
    TblContactFIRST_NAME: TStringField;
    TblContactLAST_NAME: TStringField;
    TblContactSALUTATION: TStringField;
    TblContactPHONE_NUMBER: TStringField;
    TblContactEXT: TStringField;
    TblContactFAX_NUMBER: TStringField;
    TblContactEMAIL: TStringField;
    TblContactPARTNER_TYPE_ID: TBCDField;
    TblContactUSE_USA_MASK: TStringField;
    TblContactWEB_USERID: TStringField;
    TblContactTITLE: TStringField;
    TblContactCONTACT_SEQNO: TBCDField;
    TblContactCUSER1: TStringField;
    TblContactCUSER2: TStringField;
    TblContactPAGER: TStringField;
    PnlLeft01: TUniPanel;
    PnlClient01: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    Label8: TUniLabel;
    Label10: TUniLabel;
    Label11: TUniLabel;
    Splitter1: TUniSplitter;
    dbFirst: TUniDBEdit;
    dbLast: TUniDBEdit;
    dbSalut: TUniDBEdit;
    dbTitle: TUniDBEdit;
    dbPhone: TUniDBEdit;
    dbFax: TUniDBEdit;
    dbPager: TUniDBEdit;
    dbEmail: TUniDBEdit;
    Label12: TUniLabel;
    dbExt: TUniDBEdit;
    dbeMobile: TUniDBEdit;
    Label3: TUniLabel;
    TblContactMOBILE: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure TblContactBeforePost(DataSet: TDataSet);
    procedure TblContactNewRecord(DataSet: TDataSet);
    procedure QryPartnerBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    procedure CheckUniqueContact;
    { Private declarations }
  public
    { Public declarations }
    DM: TCRMPK_DM;
    FID: Real;
    FPartnerID: Real;
    //constructor Create(PartnerID: Real);
  end;

function DoGetQuickPartnerContact(var PartnerID: Real): Real;

var
  FrmCrmAddPartnerContact: TFrmCrmAddPartnerContact;

implementation

{$R *.DFM}


uses
  crm_rscstr,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  crm_context;

function DoGetQuickPartnerContact(var PartnerID: Real): Real;
var
  FrmCrmAddPartnerContact: TFrmCrmAddPartnerContact;
begin
  FrmCrmAddPartnerContact := TFrmCrmAddPartnerContact.Create(uniGUIApplication.UniApplication);

  with FrmCrmAddPartnerContact do
  begin
      FPartnerID := PartnerID;

      if FPartnerID = 0 then
        begin
          DM := TCRMPK_DM.Create(FrmCrmAddPartnerContact);
          DM.Name := '';
          if not DM.DoPartnerContextPicklist(FPartnerID) then
            ABORT;
        end;

      QryPartner.Open;
      TblContact.Open;
      TblContact.Insert;

      if ShowModal = mrOk then
        begin
          PartnerID := FPartnerID;
          Result := FID
        end
      else
        Result := 0;
  end;

end;


procedure TFrmCrmAddPartnerContact.FormShow(Sender: TObject);
begin
//  IQRegFormRead(Self, [Self, PnlLeft01]);
end;

procedure TFrmCrmAddPartnerContact.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  Action := caFree;
//  IQRegFormWrite(Self, [Self, PnlLeft01]);
end;

procedure TFrmCrmAddPartnerContact.btnOkClick(Sender: TObject);
begin
  TblContact.FieldByName('PARTNER_ID').asFloat := FPartnerID;
  IQAssignIDBeforePost(TblContact); { in IQlib }
  TblContact.Post;
  FID := TblContactID.asFloat;
end;

procedure TFrmCrmAddPartnerContact.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCrmAddPartnerContact.TblContactBeforePost(DataSet: TDataSet);
begin
  TblContact.FieldByName('PARTNER_ID').asFloat := FPartnerID;
  CheckUniqueContact;
  IQAssignIDBeforePost(DataSet); { in IQlib }
end;

procedure TFrmCrmAddPartnerContact.CheckUniqueContact;
begin
  // 06/02/2007
  if IsFoundParam('select id from partner_contacts             ' +
    'where                                     ' +
    'Upper(Trim(first_name)) = :FIRST_NAME and ' +
    'Upper(Trim(last_name)) = :LAST_NAME and   ' +
    'partner_id = :ID                           ',
    ['FIRST_NAME', 'LAST_NAME', 'ID;F'],
    [UpperCase(Trim(TblContactFIRST_NAME.AsString)),
    UpperCase(Trim(TblContactLAST_NAME.AsString)),
    TblContactPARTNER_ID.asFloat]) then
    begin
      ModalResult := mrNone;
      // 'The contact you entered already exists for this Partner.'
      raise Exception.Create(crm_rscstr.cTXT0000608);
    end;
end;

procedure TFrmCrmAddPartnerContact.TblContactNewRecord(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
  TblContactPHONE_NUMBER.AsString := QryPartnerPHONE_NUMBER.AsString;
  TblContactEXT.AsString := QryPartnerEXT.AsString;
  TblContactFAX_NUMBER.AsString := QryPartnerFAX_NUMBER.AsString;
  TblContactUSE_USA_MASK.AsString := QryPartnerUSE_USA_MASK.AsString;
end;

procedure TFrmCrmAddPartnerContact.QryPartnerBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', FPartnerID);
end;

end.
