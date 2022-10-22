unit qc_ppap_psw_submit;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  Wwdbdlg,
  DB,
  InvokeRegistry,
  Rio,
  SOAPHTTPClient,
  FireDAC.Comp.Client,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, uniComboBox,
  uniDBComboBox;

type
  TFrmPSW_Submit = class(TUniForm)
    Label1: TUniLabel;
    Label2: TUniLabel;
    rbtnProcess: TUniRadioButton;
    rbtnRespond: TUniRadioButton;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    QryEdiPartners: TFDQuery;
    QryEdiPartnersID: TBCDField;
    QryEdiPartnersWEB_SERVICE_URL: TStringField;
    QryEdiPartnersCUSTNO: TStringField;
    QryEdiPartnersARCUSTO_COMPANY: TStringField;
    QryEdiPartnersVENDORNO: TStringField;
    QryEdiPartnersVENDOR_COMPANY: TStringField;
    wwDBLookupComboURL: TUniDBLookupComboBox;
    HTTPRIO1: THTTPRIO;
    QryXMLSchema: TFDQuery;
    QryXMLSchemaID: TBCDField;
    QryXMLSchemaDESCRIP: TStringField;
    QryXMLSchemaSCHEMA_NO: TStringField;
    QryXMLSchemaEXECUTE_PROC: TStringField;
    wwDBLookupComboSCHEMA: TUniDBLookupComboBox;
    Label3: TUniLabel;
    pnlBody: TUniPanel;
    pnlButtons: TUniPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FPPAP_ID: Real;
    procedure Validate;
    procedure CreateSubmitXMLviaWebService;
    procedure SetPPAP_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShowModal( APPAP_ID: Real );
    property PPAP_ID: Real write SetPPAP_ID;
  end;

implementation

{$R *.dfm}

{ TFrmPSW_Submit }

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  { TODO -oathite -cWebConvert : Dependent on eapqptrans
  EAPQPTrans, }
  IQMS.Common.StringUtils,
  ImpConst,
  IQMS.Common.COMExe;

class procedure TFrmPSW_Submit.DoShowModal(APPAP_ID: Real);
var
  frm : TFrmPSW_Submit;
begin
  frm := TFrmPSW_Submit.Create(uniGUIApplication.UniApplication);
  with frm do
  begin
    PPAP_ID := APPAP_ID;
    ShowModal;
  end;
end;

procedure TFrmPSW_Submit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmPSW_Submit.SetPPAP_ID(const Value: Real);
begin
  FPPAP_ID := Value;
end;

procedure TFrmPSW_Submit.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
  IQSetTablesActive( TRUE, self );
end;

procedure TFrmPSW_Submit.btnOKClick(Sender: TObject);
begin
  Validate;
  CreateSubmitXMLviaWebService;
  ModalResult:= mrOK;
end;

procedure TFrmPSW_Submit.Validate;
begin
  IQAssert( wwDBLookupComboURL.Text > '', 'No trading partner is selected - unable to continue.');
  IQAssert( wwDBLookupComboSCHEMA.Text > '', 'No XML schema is specified - unable to continue.');
end;

procedure TFrmPSW_Submit.CreateSubmitXMLviaWebService;
var
  ADirName : string;
  AXML     : string;
  AFileName: string;
begin
  ADirName:= Format('%s\PSW', [ ExcludeTrailingBackslash( IQGetLocalHomePath ) ]);
  IQAssert( ForceDirectories( ADirName ), Format('Unable to create directory path %s', [ ADirName ]));
  AFileName:= Format('%s\%s.xml', [ ADirName, GetRandomName ]);

  try
    {Create XML}
    Com_Exec( 'IQIMP', [ ImpConst.XML_AUTO,
                         AFileName,                  {Out FileName}
                         QryXMLSchemaID.asFloat,     {XML_Schema_ID}
                         FPPAP_ID,                   {PPAP}
                         0 ]);                       {} {in ImpShare.pas}

    {Load in string}
    AXML:= ReadFileIntoStr( AFileName );

    {Call web service}
    HTTPRIO1.URL:= QryEdiPartnersWEB_SERVICE_URL.asString;
    { TODO -oathite -cWebConvert : Dependent on eapqptrans }
    (*                     {'http://209.69.34.249/ivitransmission/eapqptrans.asmx'}
    if rbtnProcess.Checked then
       (HTTPRIO1 as EAPQPTransSoap).ProcessPartSubmissionWarrantRPC( AXML )     {EAPQPTrans.pas in External Web Service Interfaces}
    else
       (HTTPRIO1 as EAPQPTransSoap).RespondPartSubmissionWarrantRPC( AXML );
    *)
  finally
    DeleteFile( AFileName );
  end;
end;


end.
