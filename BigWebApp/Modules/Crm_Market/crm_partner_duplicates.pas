unit crm_partner_duplicates;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  Vcl.Wwdatsrc,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, IQUniGrid, uniGUIFrame;

type
  TFrmCRMPartnerMatches = class(TUniForm)
    Panel1: TUniPanel;
    PnlGrid: TUniPanel;
    Panel3: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    SrcDuplicates: TDataSource;
    QryDuplicates: TFDQuery;
    QryDuplicatesID: TBCDField;
    QryDuplicatesCOMPANY: TStringField;
    QryDuplicatesADDR1: TStringField;
    QryDuplicatesADDR2: TStringField;
    QryDuplicatesADDR3: TStringField;
    QryDuplicatesCITY: TStringField;
    QryDuplicatesSTATE: TStringField;
    QryDuplicatesZIP: TStringField;
    QryDuplicatesCOUNTRY: TStringField;
    QryDuplicatesPHONE_NUMBER: TStringField;
    Grid: TIQUniGridControl;
    SR: TIQWebSecurityRegister;
    Bevel1: TUniPanel;
    Panel2: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    procedure QryDuplicatesBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FArcustoID: Real;
  end;

  // Pass the ARCUSTO.ID if the Customer record we want to copy to Partners
  // If the result of this method is FALSE, then the user wants to Cancel the
  // process.  Otherwise, if TRUE, then continue with the copying process
function CancelIfPartnerExists(AArcustoID: Real): Boolean;
function MayHaveDuplicates(AArcustoID: Real): Boolean;


implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm;

function CancelIfPartnerExists(AArcustoID: Real): Boolean;
var
  FrmCRMPartnerMatches: TFrmCRMPartnerMatches;
begin
  if MayHaveDuplicates(AArcustoID) then
  begin
    FrmCRMPartnerMatches := TFrmCRMPartnerMatches.Create(uniGUIApplication.uniApplication);
    with FrmCRMPartnerMatches do
    begin
      FArcustoID := AArcustoID;
      Result := (ShowModal = mrOk);
    end
  end
  else
    Result := TRUE; // Pass TRUE to continue processing
end;

function MayHaveDuplicates(AArcustoID: Real): Boolean;
begin
  Result := FALSE; // Initialize to FALSE, no duplicates
  with TFDQuery.Create(NIL) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('select count( partner.id ) as value ');
      SQL.Add('from partner, arcusto               ');
      SQL.Add(IQFormat('where arcusto.id = %.0f ', [AArcustoID]));
      SQL.Add('and Upper( LTrim( RTrim( partner.company ))) like Upper( LTrim( RTrim( arcusto.company ))) ');
      Open;
      Result := (FieldByName('VALUE').AsInteger > 0);
    finally
      Free;
    end;
end;

{ TFrmCRMPartnerMatches }

procedure TFrmCRMPartnerMatches.UniFormCreate(Sender: TObject);
begin
  QryDuplicates.Open;
  { TODO -oSanketG -cWebConvert : Need to revisit ,
  [dcc32 Error] crm_partner_duplicates.pas(130): E2010 Incompatible types: 'TForm' and 'TFrmCRMPartnerMatches'}
  //CenterForm(Self); // iqctrl; must be called before IQRegFormRead()
  IQRegFormRead(Self, [Self, Grid]); // IQMS.Common.RegFrm.pas
end;

procedure TFrmCRMPartnerMatches.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self, Grid]); // IQMS.Common.RegFrm.pas
end;

procedure TFrmCRMPartnerMatches.QryDuplicatesBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
    ParamByName('ARCUSTO_ID').Value := FArcustoID;
end;

end.
