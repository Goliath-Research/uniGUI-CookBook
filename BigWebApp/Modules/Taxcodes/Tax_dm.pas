unit Tax_DM;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDM_Tax = class(TDataModule)
    SrcTaxElements: TDataSource;
    SrcTaxCodeLink: TDataSource;
    TblTaxCodeLink2: TFDTable;
    TblTaxCodeLink2TAX_CODES_ID: TBCDField;
    TblTaxCodeLink2TAX_ELEMENTS_ID: TBCDField;
    TblTaxCodeLink2SEQ: TBCDField;
    SrcTaxCodes: TDataSource;
    TblTaxCodeLink2Descrip: TStringField;
    TblTaxCodeLink2Rate: TFloatField;
    TblGlAcct: TFDTable;
    TblTaxCodeLink2GlAcct: TStringField;
    PKAcct: TIQWebHPick;
    PKAcctID: TFloatField;
    PKAcctACCT: TStringField;
    PKAcctDESCRIP: TStringField;
    PKAcctTYPE: TStringField;
    QryTaxCodes: TFDQuery;
    QryTaxCodesID: TBCDField;
    QryTaxCodesTAX_CODE: TStringField;
    QryTaxCodesTAX_CODE_DESC: TStringField;
    QryTaxCodesTOT_TAX_RATE: TFMTBCDField;
    QryTaxCodesECODE: TStringField;
    QryTaxCodesEID: TBCDField;
    QryTaxCodesEDATE_TIME: TDateTimeField;
    QryTaxCodesECOPY: TStringField;
    QryTaxCodesVAT_PAID: TStringField;
    QryTaxElements: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    QryTaxElementsID: TBCDField;
    QryTaxElementsDESCRIP: TStringField;
    QryTaxElementsTAX_RATE: TFMTBCDField;
    QryTaxElementsGLACCT_ID: TBCDField;
    QryTaxElementsECODE: TStringField;
    QryTaxElementsEID: TBCDField;
    QryTaxElementsEDATE_TIME: TDateTimeField;
    QryTaxElementsECOPY: TStringField;
    QryTaxElementsACCT: TStringField;
    UpdateSQL2: TFDUpdateSQL;
    QryTaxCodesTAX_RATE: TFMTBCDField;
    QryTaxCodesINCLUDE_FREIGHT: TStringField;
    TblTaxCodeLink2VAT_PAID: TStringField;
    TblTaxCodeLink2ID: TBCDField;
    QryTaxCodesSTATE: TStringField;
    QryTaxCodesCOUNTY: TStringField;
    TblTaxCodeLink2USE_TAX: TStringField;
    TblTaxCodeLink: TFDTable;
    TblTaxCodeLinkTAX_CODES_ID: TBCDField;
    TblTaxCodeLinkTAX_ELEMENTS_ID: TBCDField;
    TblTaxCodeLinkSEQ: TBCDField;
    TblTaxCodeLinkECODE: TStringField;
    TblTaxCodeLinkEID: TBCDField;
    TblTaxCodeLinkEDATE_TIME: TDateTimeField;
    TblTaxCodeLinkECOPY: TStringField;
    TblTaxCodeLinkID: TBCDField;
    TblTaxCodeLinkVAT_PAID: TStringField;
    TblTaxCodeLinkSERVICE_ID: TBCDField;
    TblTaxCodeLinkUSE_TAX: TStringField;
    TblTaxCodeLinkDescrip: TStringField;
    TblTaxCodeLinkRate: TFloatField;
    TblTaxCodeLinkGlAcct: TStringField;
    PkTaxElements: TIQWebHPick;
    PkTaxElementsID: TBCDField;
    PkTaxElementsDESCRIP: TStringField;
    PkTaxElementsTAX_RATE: TFMTBCDField;
    PkTaxElementsACCOUNT: TStringField;
    procedure TblTaxCodeLink2BeforeInsert(DataSet: TDataSet);
    procedure TblTaxElementsBeforePost(DataSet: TDataSet);
    procedure TblTaxCodesBeforePost(DataSet: TDataSet);
    procedure TblTaxCodesCalcFields(DataSet: TDataSet);
    procedure TblTaxCodeLink2AfterPost(DataSet: TDataSet);
    procedure TblTaxCodeLink2AfterInsert(DataSet: TDataSet);
    procedure TblTaxElementsAfterPost(DataSet: TDataSet);
    procedure QryTaxCodesBeforePost(DataSet: TDataSet);
    procedure QryTaxElementsBeforePost(DataSet: TDataSet);
    procedure TblTaxCodeLinkCalcFields(DataSet: TDataSet);
    procedure TblTaxCodeLinkAfterPost(DataSet: TDataSet);
    procedure TblTaxCodeLinkAfterInsert(DataSet: TDataSet);
    procedure TblTaxCodeLinkBeforeInsert(DataSet: TDataSet);
    procedure TblTaxCodeLinkBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_Tax: TDM_Tax;

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.StringUtils;

{$R *.DFM}

procedure TDM_Tax.TblTaxCodeLink2BeforeInsert(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TDM_Tax.TblTaxElementsBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TDM_Tax.TblTaxCodesBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TDM_Tax.TblTaxCodesCalcFields(DataSet: TDataSet);
begin
{  with TblTaxCodes do
    if FieldByName('ID').AsFloat > 0 then
    begin
      if not (State in [dsEdit, dsInsert]) then Edit;
      FieldByName('TAXRATE').AsFloat :=
           SelectValueAsFloat(Format('select sum(tax_elements.tax_rate) from ' +
                         'tax_elements, tax_code_link ' +
                         'where tax_elements.id = tax_code_link.tax_elements_id ' +
                         'and tax_code_link.tax_codes_id = %f',
                         [FieldByName('ID').AsFloat]));
     Post;
    end;}
end;

procedure TDM_Tax.TblTaxCodeLink2AfterPost(DataSet: TDataSet);
begin
  TblTaxCodeLink.Refresh;
end;

procedure TDM_Tax.TblTaxCodeLink2AfterInsert(DataSet: TDataSet);
begin
  TblTaxCodeLink.FieldByName('SEQ').asInteger :=
    Trunc(SelectValueAsFloat(IQFormat('select max(seq) from tax_code_link where tax_codes_id = %f',
          [TblTaxCodeLink.FieldByName('TAX_CODES_ID').asFloat]))) + 1;
end;

procedure TDM_Tax.TblTaxElementsAfterPost(DataSet: TDataSet);
begin
  TblTaxCodeLink.Refresh;
  QryTaxCodes.Close;
  QryTaxCodes.Open;
end;

procedure TDM_Tax.QryTaxCodesBeforePost(DataSet: TDataSet);
begin
  if QryTaxCodesID.asFloat = 0 then
  begin
    QryTaxCodesID.AsFloat := GetNextID('TAX_CODES');
    if SelectValueFmtAsFloat('select id from tax_codes where id <> %f and tax_code = ''%s''', [QryTaxCodesID.AsFloat, StrTran(QryTaxCodesTAX_CODE.asString, '''', '''''')]) <> 0 then
      raise Exception.Create('Duplicate Tax Code.');
  end;

end;

procedure TDM_Tax.QryTaxElementsBeforePost(DataSet: TDataSet);
begin
  if QryTaxElementsID.asFloat = 0 then
    QryTaxElementsID.AsFloat := GetNextID('TAX_ELEMENTS');
end;

procedure TDM_Tax.TblTaxCodeLinkCalcFields(DataSet: TDataSet);
begin
  TblTaxCodeLinkDescrip.asString := SelectValueFmtAsString('select descrip from tax_elements where id = %f', [TblTaxCodeLinkTAX_ELEMENTS_ID.asFloat]);
  TblTaxCodeLinkRate.asFloat := SelectValueFmtAsFloat('select tax_rate from tax_elements where id = %f', [TblTaxCodeLinkTAX_ELEMENTS_ID.asFloat]);
  TblTaxCodeLinkGlAcct.asString := SelectValueFmtAsString('select g.acct from tax_elements t, glacct g ' +
                                                ' where t.id = %f and g.id = t.glacct_id', [TblTaxCodeLinkTAX_ELEMENTS_ID.asFloat]);
end;

procedure TDM_Tax.TblTaxCodeLinkAfterInsert(DataSet: TDataSet);
begin
  TblTaxCodeLink.FieldByName('SEQ').asInteger :=
    Trunc(SelectValueAsFloat(IQFormat('select max(seq) from tax_code_link where tax_codes_id = %f',
          [TblTaxCodeLink.FieldByName('TAX_CODES_ID').asFloat]))) + 1;
end;

procedure TDM_Tax.TblTaxCodeLinkAfterPost(DataSet: TDataSet);
begin
  TblTaxCodeLink.Refresh;
end;



procedure TDM_Tax.TblTaxCodeLinkBeforeInsert(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TDM_Tax.TblTaxCodeLinkBeforePost(DataSet: TDataSet);
begin
//  if (TblTaxCodeLinkVAT_PAID.asString = 'Y') and (TblTaxCodeLinkUSE_TAX.asString = 'Y') then
//    raise exception.create('Both VAT Paid and Use tax boxes cannot be cheched');
end;

end.
