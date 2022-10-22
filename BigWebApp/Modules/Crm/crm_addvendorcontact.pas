unit crm_addvendorcontact;

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
  TFrmCrmAddVendorContact = class(TUniForm)
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    PC: TUniPageControl;
    Src: TDataSource;
    TblContact: TFDTable;
    TabSheet1: TUniTabSheet;
    TblContactID: TBCDField;
    QryVendor: TFDQuery;
    Bevel1: TUniPanel;
    TblContactVENDOR_ID: TBCDField;
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
    TblContactECOPY: TStringField;
    TblContactUSE_USA_MASK: TStringField;
    TblContactWEB_USERID: TStringField;
    QryVendorID: TBCDField;
    QryVendorPHONE_NUMBER: TStringField;
    QryVendorFAX_NUMBER: TStringField;
    QryVendorUSE_USA_MASK: TStringField;
    PnlMain: TUniPanel;
    PnlLeft: TUniPanel;
    PnlClient: TUniPanel;
    Splitter1: TUniSplitter;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    Label8: TUniLabel;
    Label10: TUniLabel;
    Label11: TUniLabel;
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
    TblContactMOBILE: TStringField;
    Label3: TUniLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure TblContactBeforePost(DataSet: TDataSet);
    procedure TblContactNewRecord(DataSet: TDataSet);
    procedure QryVendorBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure CheckUniqueContact;
    procedure AdjustControls;
  public
    { Public declarations }
    DM: TCRMPK_DM;
    FID: Real;
    FVendorID: Real;
  end;

function DoGetQuickVendorContact(var VendorID: Real): Real;

implementation

{$R *.DFM}


uses
  crm_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  crm_context;

function DoGetQuickVendorContact(var VendorID: Real): Real;
var
  FrmCrmAddVendorContact: TFrmCrmAddVendorContact;
begin

  FrmCrmAddVendorContact := TFrmCrmAddVendorContact.Create(uniGUIApplication.UniApplication);

  with FrmCrmAddVendorContact do
  begin
    FVendorID := VendorID;

    if FVendorID = 0 then
      begin
        DM := TCRMPK_DM.Create(FrmCrmAddVendorContact);
        DM.Name := '';
        if not DM.DoVendorContextPicklist(FVendorID) then
          System.SysUtils.Abort;
      end;

    QryVendor.Open;
    TblContact.Open;
    TblContact.Insert;

    if ShowModal = mrOk then
      begin
        VendorID := FVendorID;
        Result := FID;
      end
    else
      Result := 0;
  end;
end;

procedure TFrmCrmAddVendorContact.FormCreate(Sender: TObject);
begin
//  AdjustControls;
end;

procedure TFrmCrmAddVendorContact.FormShow(Sender: TObject);
begin
//  IQRegFormRead(Self, [Self, PnlLeft]);
end;

procedure TFrmCrmAddVendorContact.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  Action := caFree;
//  IQRegFormWrite(Self, [Self, PnlLeft]);
end;

procedure TFrmCrmAddVendorContact.btnOkClick(Sender: TObject);
begin
  TblContact.FieldByName('VENDOR_ID').asFloat := FVendorID;
  IQAssignIDBeforePost(TblContact); { in IQlib }
  TblContact.Post;
  FID := TblContactID.asFloat;
end;

procedure TFrmCrmAddVendorContact.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCrmAddVendorContact.TblContactBeforePost(DataSet: TDataSet);
begin
  TblContact.FieldByName('VENDOR_ID').asFloat := FVendorID;
  CheckUniqueContact;
  IQAssignIDBeforePost(DataSet); // in IQlib
end;

procedure TFrmCrmAddVendorContact.CheckUniqueContact;
begin
  if SelectValueParam(
    'select 1 from vendor_contact             ' +
    'where                                     ' +
    'Upper(Trim(first_name)) = :FIRST_NAME and ' +
    'Upper(Trim(last_name)) = :LAST_NAME and   ' +
    'vendor_id = :ID                           ',
    ['FIRST_NAME', 'LAST_NAME', 'ID;F'],
    [UpperCase(Trim(TblContact.FieldByName('FIRST_NAME').AsString)),
    UpperCase(Trim(TblContact.FieldByName('LAST_NAME').AsString)),
    TblContact.FieldByName('VENDOR_ID').asFloat]) = 1 then
    begin
      ModalResult := mrNone;
      // 'The contact you entered already exists for this vendor.';
      raise Exception.Create(crm_rscstr.cTXT0001513);
    end;
end;

procedure TFrmCrmAddVendorContact.TblContactNewRecord(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
  TblContactPHONE_NUMBER.AsString := QryVendorPHONE_NUMBER.AsString;
  TblContactFAX_NUMBER.AsString := QryVendorFAX_NUMBER.AsString;
  TblContactUSE_USA_MASK.AsString := QryVendorUSE_USA_MASK.AsString;
end;

procedure TFrmCrmAddVendorContact.QryVendorBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', FVendorID);
end;

procedure TFrmCrmAddVendorContact.AdjustControls;
begin
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient);
end;

end.
