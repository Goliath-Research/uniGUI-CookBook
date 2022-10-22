unit crm_addcontact;

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
  TFrmCrmAddContact = class(TUniForm)
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    PC: TUniPageControl;
    Src: TDataSource;
    TblContact: TFDTable;
    TabSheet1: TUniTabSheet;
    TblContactID: TBCDField;
    TblContactARCUSTO_ID: TBCDField;
    TblContactCONTACT_TYPE: TStringField;
    TblContactCONTACT_SEQNO: TBCDField;
    TblContactSALUTATION: TStringField;
    TblContactLAST_NAME: TStringField;
    TblContactFIRST_NAME: TStringField;
    TblContactTITLE: TStringField;
    TblContactPHONE_NUMBER: TStringField;
    TblContactEXT: TStringField;
    TblContactFAX_NUMBER: TStringField;
    TblContactEMAIL: TStringField;
    TblContactPAGER: TStringField;
    TblContactCUSER1: TStringField;
    TblContactCUSER2: TStringField;
    TblContactECODE: TStringField;
    TblContactUSE_USA_MASK: TStringField;
    QryArcusto: TFDQuery;
    QryArcustoCUSTNO: TStringField;
    QryArcustoCOMPANY: TStringField;
    QryArcustoADDR1: TStringField;
    QryArcustoADDR2: TStringField;
    QryArcustoADDR3: TStringField;
    QryArcustoCITY: TStringField;
    QryArcustoSTATE: TStringField;
    QryArcustoCOUNTRY: TStringField;
    QryArcustoZIP: TStringField;
    QryArcustoPHONE_NUMBER: TStringField;
    QryArcustoEXT: TStringField;
    QryArcustoFAX_NUMBER: TStringField;
    QryArcustoUSE_USA_MASK: TStringField;
    Bevel1: TUniPanel;
    TblContactMOBILE: TStringField;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    Label8: TUniLabel;
    Label10: TUniLabel;
    lblMobile: TUniLabel;
    Label11: TUniLabel;
    dbFirst: TUniDBEdit;
    dbLast: TUniDBEdit;
    dbSalut: TUniDBEdit;
    dbTitle: TUniDBEdit;
    dbPhone: TUniDBEdit;
    dbFax: TUniDBEdit;
    dbPager: TUniDBEdit;
    dbMobile: TUniDBEdit;
    dbEmail: TUniDBEdit;
    dbExt: TUniDBEdit;
    Label12: TUniLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure TblContactBeforePost(DataSet: TDataSet);
    procedure TblContactNewRecord(DataSet: TDataSet);
    procedure QryArcustoBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure CheckUniqueContact;
    procedure AdjustControls;
  public
    { Public declarations }
    DM: TCRMPK_DM;
    FID: Real;
    FArcustoID: Real;
    //constructor Create(ArcustoID: Real);
  end;

function DoGetQuickContact(var ArcustoID: Real): Real;

var
  FrmCrmAddContact: TFrmCrmAddContact;

implementation

{$R *.DFM}


uses
  crm_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  crm_context;

function DoGetQuickContact(var ArcustoID: Real): Real;
var
   FrmCrmAddContact: TFrmCrmAddContact;
begin
  FrmCrmAddContact:= TFrmCrmAddContact.Create(uniGUIApplication.UniApplication);
  with FrmCrmAddContact do
  begin
    FArcustoID := ArcustoID;

    if FArcustoID = 0 then
      begin
        DM := TCRMPK_DM.Create(FrmCrmAddContact);
        DM.Name := '';
        if not DM.DoCustomerContextPicklist(CRMContext.GlobalContext.Prospect,
          FArcustoID) then
          ABORT;
      end;

    QryArcusto.Open;
    TblContact.Open;
    TblContact.Insert;

    if ShowModal = mrOk then
      begin
        ArcustoID := FArcustoID;
        Result := FID
      end
    else
      Result := 0;
  end;
end;


procedure TFrmCrmAddContact.FormCreate(Sender: TObject);
begin
//  CenterForm(Self); // iqctrl; must be called before IQRegFormRead()
//  AdjustControls;
end;

procedure TFrmCrmAddContact.FormShow(Sender: TObject);
begin
 // IQRegFormRead(Self, [Self, PnlLeft01]);
  // 12/22/2009
  if dbFirst.CanFocus then
    dbFirst.SetFocus;
end;

procedure TFrmCrmAddContact.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  IQRegFormWrite(Self, [Self, PnlLeft01]);
//  Action := caFree;
end;

procedure TFrmCrmAddContact.btnOkClick(Sender: TObject);
begin
  TblContact.FieldByName('ARCUSTO_ID').asFloat := FArcustoID;
  IQAssignIDBeforePost(TblContact); { in IQlib }
  TblContact.Post;
  FID := TblContactID.asFloat;
end;

procedure TFrmCrmAddContact.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCrmAddContact.TblContactBeforePost(DataSet: TDataSet);
begin
  TblContact.FieldByName('ARCUSTO_ID').asFloat := FArcustoID;
  CheckUniqueContact;
  IQAssignIDBeforePost(DataSet); { in IQlib }
end;

procedure TFrmCrmAddContact.CheckUniqueContact;
begin
  if IsFoundParam('select id from contact                                ' +
    'where                                                 ' +
    'Upper(Trim(first_name)) = :FIRST_NAME and ' +
    'Upper(Trim(last_name)) = :LAST_NAME and  ' +
    'arcusto_id = :ID                                      ',
    ['FIRST_NAME', 'LAST_NAME', 'ID'],
    [UpperCase(Trim(TblContact.FieldByName('FIRST_NAME').AsString)),
    UpperCase(Trim(TblContact.FieldByName('LAST_NAME').AsString)),
    TblContact.FieldByName('ARCUSTO_ID').asFloat]) then
    begin
      ModalResult := mrNone;
      // 'The contact you entered already exists for this customer.'
      raise Exception.Create(crm_rscstr.cTXT0000346);
    end;
end;

procedure TFrmCrmAddContact.TblContactNewRecord(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
  // Populate default telephone and fax numbers (do not populate extension)
  TblContactCONTACT_SEQNO.AsInteger :=
    Trunc(SelectValueFmtAsFloat
    ('select max(contact_seqno) from contact where arcusto_id = %.0f',
    [FArcustoID])) + 1;
  TblContactPHONE_NUMBER.AsString := QryArcustoPHONE_NUMBER.AsString;
  TblContactFAX_NUMBER.AsString := QryArcustoFAX_NUMBER.AsString;
  TblContactUSE_USA_MASK.AsString := QryArcustoUSE_USA_MASK.AsString;
end;

procedure TFrmCrmAddContact.QryArcustoBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', FArcustoID);
end;

procedure TFrmCrmAddContact.AdjustControls;
begin
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient02);
end;

end.
