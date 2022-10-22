unit Qk_contact;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.QuickAddBase,
  Data.DB,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniLabel, uniPageControl, uniButton;

type
  TFrmQuickAddContact = class(TQuickAddBase)
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
    Table1ID: TBCDField;
    Table1ARCUSTO_ID: TBCDField;
    Table1CONTACT_TYPE: TStringField;
    Table1CONTACT_SEQNO: TBCDField;
    Table1SALUTATION: TStringField;
    Table1LAST_NAME: TStringField;
    Table1FIRST_NAME: TStringField;
    Table1TITLE: TStringField;
    Table1PHONE_NUMBER: TStringField;
    Table1EXT: TStringField;
    Table1FAX_NUMBER: TStringField;
    Table1EMAIL: TStringField;
    Table1PAGER: TStringField;
    Table1CUSER1: TStringField;
    Table1CUSER2: TStringField;
    Table1ECODE: TStringField;
    Table1EID: TBCDField;
    Table1EDATE_TIME: TDateTimeField;
    Table1ECOPY: TStringField;
    Table1USE_USA_MASK: TStringField;
    Table1MOBILE: TStringField;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    Label8: TUniLabel;
    Label10: TUniLabel;
    lblMobile: TUniLabel;
    Label11: TUniLabel;
    Label12: TUniLabel;
    PnlClient02: TUniPanel;
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
    procedure Table1NewRecord(DataSet: TDataSet);
    procedure QryArcustoBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure CheckUniqueContact;
    procedure AdjustControls;
    procedure SetArcustoID(const Value: Real);
  public
    { Public declarations }
    FArcustoID:Real;
    property ArcustoID : Real write SetArcustoID;
  end;

  function DoQuickAddContact(AArcustoID: Real; var AResultValue: Variant): TModalResult;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils, uniGUIApplication;

function DoQuickAddContact(AArcustoID: Real; var AResultValue: Variant): TModalResult;
var
  LFrmQuickAddContact : TFrmQuickAddContact;
begin
  LFrmQuickAddContact := TFrmQuickAddContact.Create(UniGUIApplication.UniApplication);
  with LFrmQuickAddContact do
  begin
    ArcustoID := AArcustoID;
    Result := ShowModal;
    if Result = mrOk then
      AResultValue := Table1ID.AsFloat;
  end;
end;

procedure TFrmQuickAddContact.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( Self, [Self, PnlLeft01] );
  inherited;
end;

procedure TFrmQuickAddContact.FormShow(Sender: TObject);
begin
  inherited;
   ReOpen(QryArcusto);
end;

procedure TFrmQuickAddContact.CheckUniqueContact;
begin
  if IsFoundParam('select id from contact                                ' +
                        'where                                                 ' +
                        'Upper(Trim(first_name)) = :FIRST_NAME and ' +
                        'Upper(Trim(last_name)) = :LAST_NAME and  ' +
                        'arcusto_id = :ID                                      ',
                        ['FIRST_NAME','LAST_NAME','ID'],
                        [UpperCase(Trim(Table1.FieldByName('FIRST_NAME').AsString)),
                         UpperCase(Trim(Table1.FieldByName('LAST_NAME').AsString)),
                         Table1.FieldByName('ARCUSTO_ID').AsFloat]) then
     begin
       ModalResult := mrNone;
       // 'The contact you entered already exists for this customer.'
       raise Exception.Create('The contact you entered already exists for this customer.');
     end;
end;

procedure TFrmQuickAddContact.AdjustControls;
begin
   IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient02);
end;

procedure TFrmQuickAddContact.Table1NewRecord(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );
  // Populate default telephone and fax numbers (do not populate extension)
  Table1CONTACT_SEQNO.AsInteger := Trunc(SelectValueFmtAsFloat('select max(contact_seqno) from contact where arcusto_id = %.0f', [FArcustoID])) + 1;
  Table1PHONE_NUMBER.AsString := QryArcustoPHONE_NUMBER.AsString;
  Table1FAX_NUMBER.AsString   := QryArcustoFAX_NUMBER.AsString;
  Table1USE_USA_MASK.AsString := QryArcustoUSE_USA_MASK.AsString;
end;

procedure TFrmQuickAddContact.QryArcustoBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
   ParamByName('ID').Value := FArcustoID;
end;

procedure TFrmQuickAddContact.SetArcustoID(const Value: Real);
begin
  FArcustoID := Value;
end;

procedure TFrmQuickAddContact.Table1BeforePost(DataSet: TDataSet);
begin
  inherited;
  Table1.FieldByName('ARCUSTO_ID').asFloat := FArcustoID;
  CheckUniqueContact;
end;

end.
