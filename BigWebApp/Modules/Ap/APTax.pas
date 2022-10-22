unit APTax;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Menus,
  Vcl.DBGrids,
  Data.DB,
  //AP_Main,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.About,
  inv_main,
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
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu;

type
  TFrmApTax = class(TUniForm)
    Panel1: TUniPanel;
    Grid: TUniDBGrid;
    Nav: TUniDBNavigator;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    SrcTax: TDataSource;
    TblTax: TFDTable;
    TblTaxID: TBCDField;
    TblTaxAPPREPOST_DETAIL_ID: TBCDField;
    TblTaxDESCRIP: TStringField;
    TblTaxTAX_RATE: TFMTBCDField;
    TblTaxGLACCT_ID: TBCDField;
    TblTaxTAX_AMOUNT: TFMTBCDField;
    QryGlAcct: TFDQuery;
    QryGlAcctACCT: TStringField;
    QryGlAcctDESCRIP: TStringField;
    QryGlAcctEPLANT_ID: TBCDField;
    QryGlAcctID: TBCDField;
    TblTaxglAcct: TStringField;
    PKTax: TIQWebHPick;
    PKTaxID: TBCDField;
    PKTaxTAX_CODE: TStringField;
    PKTaxTAX_CODE_DESC: TStringField;
    PKTaxTAX_RATE: TFMTBCDField;
    IQAbout1: TIQWebAbout;
    N1: TUniMenuItem;
    TaxCodes1: TUniMenuItem;
    QryPosted: TFDQuery;
    QryVoided: TFDQuery;
    TblARTax: TFDTable;
    FloatField1: TBCDField;
    StringField1: TStringField;
    FloatField3: TFMTBCDField;
    FloatField4: TBCDField;
    FloatField5: TFMTBCDField;
    StringField2: TStringField;
    TblARTaxARPREPOST_DETAIL_ID: TBCDField;
    QryUsePosted: TFDQuery;
    QryUseVoided: TFDQuery;
    //procedure NavBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure TblTaxBeforeDelete(DataSet: TDataSet);
    procedure TblTaxBeforeInsert(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure TblTaxAfterPost(DataSet: TDataSet);
    procedure TaxCodes1Click(Sender: TObject);
    procedure TblARTaxAfterPost(DataSet: TDataSet);
    procedure TblARTaxBeforePost(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
    {constructor CreateAR(AOwner:TComponent);
    constructor CreateUseAP(AOwner:TComponent);
    constructor Create(AOwner:TComponent);override;
    constructor CreatePosted(AOwner:TComponent; AId:Real);
    constructor CreateVoided(AOwner:TComponent; AId:Real);
    constructor CreateUsePosted(AOwner:TComponent; AId:Real);
    constructor CreateUseVoided(AOwner:TComponent; AId:Real);
    }

  end;


procedure DoArTax;
procedure DoApTax;
procedure DoApUseTax;
procedure DoShowPostedTaxes(AId:Real);
procedure DoShowVoidedTaxes(AId:Real);
procedure DoShowPostedUseTaxes(AId:Real);
procedure DoShowVoidedUseTaxes(AId:Real);


implementation

uses
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs,
  IQMS.Common.DataLib,
  TaxMain,
  IQMS.Common.Controls,
  ap_rscstr;

{$R *.DFM}

procedure DoArTax;
begin
  with TFrmApTax.Create(uniGUIApplication.UniApplication) do
  begin
  TblARTax.MasterSource := TFrmInvoice(uniGUIApplication.UniApplication).SrcArPrePostDetail;
  SrcTax.DataSet := TblARTax;
  TblARTax.Open;
  show;
  end;
end;


procedure DoApTax;
begin
  with TFrmApTax.Create(uniGUIApplication.UniApplication) do
  begin
    TblARTax.MasterSource := TFrmInvoice(uniGUIApplication.UniApplication).SrcArPrePostDetail;
    SrcTax.DataSet := TblARTax;
    TblARTax.Open;
    show;
  end;

end;

procedure DoApUseTax;
begin
  with TFrmApTax.Create(uniGUIApplication.UniApplication) do
  begin
   TblTax.TableName := 'APPREPOST_USE_TAX';
   TblTax.Open;
   show;
  end;
end;


procedure DoShowPostedTaxes(AId:Real);
var
  i : Integer;
begin
  with TFrmApTax.Create(uniGUIApplication.UniApplication) do
  begin
    SrcTax.DataSet := QryPosted;
    QryPosted.Close;
    AssignQueryParamValue(QryPosted, 'AID', AId);
    QryPosted.Open;
    TaxCodes1.Visible := False;
    N1.Visible        := False;
    Grid.ReadOnly     := True;
    for i := 0 to Grid.Columns.Count - 1 do
      Grid.Columns[i].Color := clBtnFace;
    ShowModal;
  end;
end;

procedure DoShowVoidedTaxes(AId:Real);
var
  i : Integer;
begin
  with TFrmApTax.Create(uniGUIApplication.UniApplication) do
  begin
    SrcTax.DataSet := QryVoided;
    QryVoided.Close;
    AssignQueryParamValue(QryVoided, 'AID', AId);
    QryVoided.Open;
    TaxCodes1.Visible := False;
    N1.Visible        := False;
    Grid.ReadOnly     := True;
    for i := 0 to Grid.Columns.Count - 1 do
    Grid.Columns[i].Color := clBtnFace;
      ShowModal;
  end;
end;

procedure DoShowPostedUseTaxes(AId:Real);
var
  i : Integer;
begin
  with TFrmApTax.Create(uniGUIApplication.UniApplication) do
  begin
    SrcTax.DataSet := QryUsePosted;
    QryUsePosted.Close;
    AssignQueryParamValue(QryUsePosted, 'AID', AId);
    QryUsePosted.Open;
    TaxCodes1.Visible := False;
    N1.Visible        := False;
    Grid.ReadOnly     := True;
    for i := 0 to Grid.Columns.Count - 1 do
       Grid.Columns[i].Color := clBtnFace;

    ShowModal;

  end;
end;

procedure DoShowVoidedUseTaxes(AId:Real);
var
  i : Integer;
begin
  with TFrmApTax.Create(uniGUIApplication.UniApplication) do
  begin
    SrcTax.DataSet := QryUseVoided;
    QryUseVoided.Close;
    AssignQueryParamValue(QryUseVoided, 'AID', AId);
    QryUseVoided.Open;
    TaxCodes1.Visible := False;
    N1.Visible        := False;
    Grid.ReadOnly     := True;
    for i := 0 to Grid.Columns.Count - 1 do
      Grid.Columns[i].Color := clBtnFace;
    showModal;
  end;
end;

{
constructor TFrmApTax.CreatePosted(AOwner:TComponent; AId:Real);
var
  I:Integer;
begin
  inherited Create(Aowner);
  IQRegFormRead( self, [self, Grid]);
  SrcTax.DataSet := QryPosted;
  //Nav.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast];
  QryPosted.Close;
//  QryPosted.ParamByName('AID').Value := AId;
  AssignQueryParamValue(QryPosted, 'AID', AId);
  QryPosted.Open;
  TaxCodes1.Visible := False;
  N1.Visible        := False;
  Grid.ReadOnly     := True;
  for i := 0 to Grid.Columns.Count - 1 do
    Grid.Columns[i].Color := clBtnFace;
end;

constructor TFrmApTax.CreateVoided(AOwner:TComponent; AId:Real);
var
  I:Integer;
begin
  inherited Create(Aowner);
  IQRegFormRead( self, [self, Grid]);
  SrcTax.DataSet := QryVoided;
  Nav.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast];
  QryVoided.Close;
//  QryVoided.ParamByName('AID').Value := AId;
  AssignQueryParamValue(QryVoided, 'AID', AId);
  QryVoided.Open;
  TaxCodes1.Visible := False;
  N1.Visible        := False;
  Grid.ReadOnly     := True;
  for i := 0 to Grid.Columns.Count - 1 do
    Grid.Columns[i].Color := clBtnFace;
end;

constructor TFrmApTax.CreateUsePosted(AOwner:TComponent; AId:Real);
var
  I:Integer;
begin
  inherited Create(Aowner);
  IQRegFormRead( self, [self, Grid]);
  SrcTax.DataSet := QryUsePosted;
  Nav.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast];
  QryUsePosted.Close;
//  QryUsePosted.ParamByName('AID').Value := AId;
  AssignQueryParamValue(QryUsePosted, 'AID', AId);
  QryUsePosted.Open;
  TaxCodes1.Visible := False;
  N1.Visible        := False;
  Grid.ReadOnly     := True;
  for i := 0 to Grid.Columns.Count - 1 do
    Grid.Columns[i].Color := clBtnFace;
end;

constructor TFrmApTax.CreateUseVoided(AOwner:TComponent; AId:Real);
var
  I:Integer;
begin
  inherited Create(Aowner);
  IQRegFormRead( self, [self, Grid]);
  SrcTax.DataSet := QryUseVoided;
  Nav.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast];
  QryUseVoided.Close;
//  QryUseVoided.ParamByName('AID').Value := AId;
  AssignQueryParamValue(QryUseVoided, 'AID', AId);
  QryUseVoided.Open;
  TaxCodes1.Visible := False;
  N1.Visible        := False;
  Grid.ReadOnly     := True;
  for i := 0 to Grid.Columns.Count - 1 do
    Grid.Columns[i].Color := clBtnFace;
end;


constructor TFrmApTax.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  IQRegFormRead( self, [self, Grid]);
  TblTax.Open;
  IQMS.Common.Controls.ResizeNavBar(Nav);
end;

constructor TFrmApTax.CreateUseAP(AOwner:TComponent);
begin
  inherited Create(AOwner);
  IQRegFormRead( self, [self, Grid]);
  TblTax.TableName := 'APPREPOST_USE_TAX';
  TblTax.Open;
  IQMS.Common.Controls.ResizeNavBar(Nav);
end;


constructor TFrmApTax.CreateAR(AOwner:TComponent);
var
  i:integer;
begin
  inherited Create(AOwner);
  Caption := 'AR Tax Elements';
  for i := 0 to Grid.Columns.Count - 1 do
  begin
    if Grid.Columns[i].FieldName = 'TAX_RATE' then
      Grid.Columns[i].Title.Caption := 'Tax Rate';
  end;
  IQRegFormRead( self, [self, Grid]);
  TblARTax.MasterSource := TFrmInvoice(self.Owner).SrcArPrePostDetail;
  SrcTax.DataSet := TblARTax;
  TblARTax.Open;
  IQMS.Common.Controls.ResizeNavBar(Nav);
end;
}


procedure TFrmApTax.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, Grid]);

end;
(* ToDo Need to refactor
procedure TFrmApTax.NavBeforeAction(Sender: TObject; Button: TNavigateBtn);
var
  ATaxCodeId:Real;
  AId:Real;
  ASum:Real;
begin
  if Button = nbDelete then
  begin
//    if SBW2.Visible then
    {'Cannot delete individual tax element. Do you want to delete the whole tax code?'}
    if not IQWarningYNChk(ap_rscstr.cTXT0000069, 'APTAX_WARNING2' ) then Abort;

    if SrcTax.DataSet = TblARTax then
    begin
      ExecuteCommandFmt('update arprepost_detail set tax_code_id = null, tax_rate = null where id = %f', [TFrmInvoice(self.Owner).QryARPrepostDetailID.asFloat]);
      ExecuteCommandFmt('delete from arprepost_tax where arprepost_detail_id = %f', [TFrmInvoice(self.Owner).QryARPrepostDetailID.asFloat]);
      AId := TFrmInvoice(self.Owner).QryARPrepostDetailID.asFloat;
      TFrmInvoice(self.Owner).QryARPrepostDetail.Close;
      TFrmInvoice(self.Owner).QryARPrepostDetail.Open;
      TFrmInvoice(self.Owner).QryARPrepostDetail.Locate('ID', aId, []);
      TFrmInvoice(self.Owner).ViewArPrepostDetailTotals.close;
      TFrmInvoice(self.Owner).ViewArPrepostDetailTotals.open;
      TblARTax.Refresh;
    end
    else
    begin
      if TblTax.TableName = 'APPREPOST_USE_TAX' then
      begin
        ExecuteCommandFmt('delete from apprepost_use_tax where apprepost_detail_id = %f', [TFrmAp(Owner).QryDetailID.asFloat]);
        ExecuteCommandFmt('update apprepost_detail set use_tax_code_id = null where id = %f', [TFrmAp(Owner).QryDetailID.asFloat]);
      end
      else
      begin
        ExecuteCommandFmt('delete from apprepost_tax where apprepost_detail_id = %f', [TFrmAp(Owner).QryDetailID.asFloat]);
        ExecuteCommandFmt('update apprepost_detail set amount_distributed = amount_before_tax, tax_code_id = null where id = %f', [TFrmAp(Owner).QryDetailID.asFloat]);
      end;
      AId := TFrmAp(self.Owner).QryDetailID.asFloat;
      TFrmAp(self.Owner).QryDetail.Close;
      TFrmAp(self.Owner).QryDetail.Open;
      TFrmAp(self.Owner).QryDetail.Locate('ID', aId, []);

      TFrmAp(Owner).QryPrePostTotal.Close;
      TFrmAp(Owner).QryPrePostTotal.Open;
      TblTax.Refresh;
    end;
    Abort;
  end
  else if Button = nbInsert then
  begin
    {'The existing tax elements will be deleted, and then replaced ' +
    'with the tax elements belonging to the new tax code. Do you want to continue?'}

//    if SBW2.Visible then
//      if not IqConfirmYN('All the existing tax elements will be deleted and replaced ' +
//                     'with the tax elements belonging to the new tax code. Do you wish to proceed?') then Abort;
    with PkTax do
    if Execute then
    begin
      if SrcTax.DataSet = TblARTax then
      begin
      if SelectValueFmtAsFloat('select count(id) from arprepost_tax where arprepost_detail_id = %f', [TFrmInvoice(self.Owner).QryARPrepostDetailID.asFloat]) <> 0 then
        if not IQWarningYNChk(ap_rscstr.cTXT0000070, 'APTAX_WARNING3' ) then Abort;

        ATaxCodeId := GetValue('ID');
        ExecuteCommandFmt('update arprepost_detail set tax_code_id = %f where id = %f', [ATaxCodeId, TFrmInvoice(self.Owner).QryARPrepostDetailID.asFloat]);
{
// The following is handeled by a trigger: tiu_arprepost_detail_tax
 ExecuteCommandFmt('delete from arprepost_tax where arprepost_detail_id = %f', [TFrmInvoice(self.Owner).QryARPrepostDetailID.asFloat]);

        ExecuteCommandFmt('insert into arprepost_tax (arprepost_detail_id,          ' +
                                              'descrip,                     ' +
                                              'tax_rate,                    ' +
                                              'glacct_id,                   ' +
                                              'tax_amount)                  ' +
                                       'select %f,                          ' +
                                       '        e.descrip,                  ' +
                                       '        e.tax_rate,                 ' +
                                       '         plugins.get_glacct_id_with_ep_gl(e.glacct_id, ''acct_id_salestax'', %f ), ' +
  ' decode(NVL(c.include_freight, ''N''), ''Y'', NVL(%.6f, 0), 0) * NVL(e.tax_rate, 0)/100 + Nvl(%.6f, 0) * NVL(%.6f, 0) * NVL(e.tax_rate, 0)/100 ' +
                                       '  from tax_elements e,              ' +
                                       '       tax_code_link l,             ' +
                                       '       tax_codes c                  ' +
                                       ' where l.tax_elements_id = e.id(+)  ' +
                                       '   and l.tax_codes_id = c.id        ' +
                                       '   and c.id = %f                    ',
                                       [TFrmInvoice(self.Owner).QryARPrepostDetailID.asFloat,
                                        TFrmInvoice(self.Owner).QryARPrePostDetailEPLANT_ID.asFloat,
                                        TFrmInvoice(self.Owner).QryARPrepostDetailFREIGHT_PRICE.asFloat,
                                        TFrmInvoice(self.Owner).QryARPrepostDetailUNIT_PRICE.asFloat,
                                        TFrmInvoice(self.Owner).QryARPrepostDetailINVOICE_QTY.asFloat,
                                        ATaxCodeId]);
}
        AId := TFrmInvoice(self.Owner).QryARPrepostDetailID.asFloat;
        TFrmInvoice(self.Owner).QryARPrepostDetail.Close;
        TFrmInvoice(self.Owner).QryARPrepostDetail.Open;
        TFrmInvoice(self.Owner).QryARPrepostDetail.Locate('ID', aId, []);
        TFrmInvoice(self.Owner).ViewArPrepostDetailTotals.close;
        TFrmInvoice(self.Owner).ViewArPrepostDetailTotals.open;
        TblARTax.Refresh;

      end
      else
      begin
        if TblTax.TableName = 'APPREPOST_USE_TAX' then
        begin
          if SelectValueFmtAsFloat('select count(id) from apprepost_use_tax where apprepost_detail_id = %f', [TFrmAp(self.Owner).QryDetailID.asFloat]) <> 0 then
            if not IQWarningYNChk(ap_rscstr.cTXT0000070, 'APTAX_WARNING3' ) then Abort;

          ATaxCodeId := GetValue('ID');
          ExecuteCommandFmt('delete from apprepost_use_tax where apprepost_detail_id = %f', [TFrmAp(self.Owner).QryDetailID.asFloat]);
          ExecuteCommandFmt('insert into apprepost_use_tax (apprepost_detail_id,          ' +
                                                'descrip,                     ' +
                                                'tax_rate,                    ' +
                                                'use_tax,                    ' +
                                                'glacct_id,                   ' +
                                                'tax_amount)                  ' +
                                         'select %f,                          ' +
                                         '        e.descrip,                  ' +
                                         '        e.tax_rate,                 ' +
                                         '        NVL(l.use_tax, ''N''),     ' +
                                         '        AP.GetAPTaxGlacctId(%f, l.id, %f), ' +
    //                                     '        plugins.get_glacct_id_with_ep_gl(e.glacct_id, ''acct_id_salestax'', %f ), ' +
                                         '        e.tax_rate * %f/100         ' +
                                         '  from tax_elements e,              ' +
                                         '       tax_code_link l,             ' +
                                         '       tax_codes c                  ' +
                                         ' where l.tax_elements_id = e.id(+)  ' +
                                         '   and l.tax_codes_id = c.id        ' +
                                         '   and c.id = %f                    ',
                                         [TFrmAp(self.Owner).QryDetailID.asFloat,
                                          TFrmAp(self.Owner).QryDetailID.asFloat,
                                          TFrmAp(self.Owner).QryAPPrePostEPLANT_ID.asFloat,
                                          TFrmAp(self.Owner).QryDetailAMOUNT_BEFORE_TAX.asFloat,
                                          ATaxCodeId]);

          ASum := SelectValueFmtAsFloat('select sum(tax_amount) from apprepost_use_tax where apprepost_detail_id = %f',
                            [TFrmAp(self.Owner).QryDetailID.asFloat]);

          ExecuteCommandFmt('update apprepost_detail set use_tax_code_id = %f where id = %f',
                    [ATaxCodeId, TFrmAp(self.Owner).QryDetailID.asFloat]);

        end
        else
        begin
          if SelectValueFmtAsFloat('select count(id) from apprepost_tax where apprepost_detail_id = %f', [TFrmAp(self.Owner).QryDetailID.asFloat]) <> 0 then
            if not IQWarningYNChk(ap_rscstr.cTXT0000070, 'APTAX_WARNING3' ) then Abort;

          ATaxCodeId := GetValue('ID');
          ExecuteCommandFmt('delete from apprepost_tax where apprepost_detail_id = %f', [TFrmAp(self.Owner).QryDetailID.asFloat]);
          ExecuteCommandFmt('insert into apprepost_tax (apprepost_detail_id,          ' +
                                                'descrip,                     ' +
                                                'tax_rate,                    ' +
                                                'vat_paid,                    ' +
                                                'glacct_id,                   ' +
                                                'tax_amount)                  ' +
                                         'select %f,                          ' +
                                         '        e.descrip,                  ' +
                                         '        e.tax_rate,                 ' +
                                         '        NVL(l.vat_paid, ''N''),     ' +
                                         '        AP.GetAPTaxGlacctId(%f, l.id, %f), ' +
    //                                     '        plugins.get_glacct_id_with_ep_gl(e.glacct_id, ''acct_id_salestax'', %f ), ' +
                                         '        e.tax_rate * %f/100         ' +
                                         '  from tax_elements e,              ' +
                                         '       tax_code_link l,             ' +
                                         '       tax_codes c                  ' +
                                         ' where l.tax_elements_id = e.id(+)  ' +
                                         '   and l.tax_codes_id = c.id        ' +
                                         '   and c.id = %f                    ',
                                         [TFrmAp(self.Owner).QryDetailID.asFloat,
                                          TFrmAp(self.Owner).QryDetailID.asFloat,
                                          TFrmAp(self.Owner).QryAPPrePostEPLANT_ID.asFloat,
                                          TFrmAp(self.Owner).QryDetailAMOUNT_BEFORE_TAX.asFloat,
                                          ATaxCodeId]);

          ASum := SelectValueFmtAsFloat('select sum(tax_amount) from apprepost_tax where apprepost_detail_id = %f',
                            [TFrmAp(self.Owner).QryDetailID.asFloat]);

          ExecuteCommandFmt('update apprepost_detail set tax_code_id = %f, amount_distributed = NVL(amount_before_tax, 0) + %.6f where id = %f',
                    [ATaxCodeId, ASum, TFrmAp(self.Owner).QryDetailID.asFloat]);

        end;

        AId := TFrmAp(self.Owner).QryDetailID.asFloat;
        TFrmAp(self.Owner).QryDetail.Close;
        TFrmAp(self.Owner).QryDetail.Open;
        TFrmAp(self.Owner).QryDetail.Locate('ID', aId, []);
        TFrmAp(self.Owner).QryPrePostTotal.Close;
        TFrmAp(self.Owner).QryPrePostTotal.Open;
        TblTax.Refresh;


      end;
    end;
    Abort;
  end;
end;
*)


procedure TFrmApTax.TblTaxBeforeDelete(DataSet: TDataSet);
begin
  //NavBeforeAction(nil, nbDelete);
end;

procedure TFrmApTax.TblTaxBeforeInsert(DataSet: TDataSet);
begin
  //NavBeforeAction(nil, nbInsert);
end;

procedure TFrmApTax.UniFormCreate(Sender: TObject);
var
   i : Integer;
begin
  inherited;
  Caption := 'AR Tax Elements';
  for i := 0 to Grid.Columns.Count - 1 do
  begin
    if Grid.Columns[i].FieldName = 'TAX_RATE' then
      Grid.Columns[i].Title.Caption := 'Tax Rate';
  end;
  IQRegFormRead( self, [self, Grid]);
  //IQMS.Common.Controls.ResizeNavBar(Nav);

end;

procedure TFrmApTax.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmApTax.Exit1Click(Sender: TObject);
begin
  Close
end;

procedure TFrmApTax.TblARTaxAfterPost(DataSet: TDataSet);
var
  AId:Real;
  ANewTaxRate:Real;
begin
  ANewTaxRate := SelectValueFmtAsFloat('select sum(tax_rate) from arprepost_tax where arprepost_detail_id = %f', [TFrmInvoice(self.Owner).QryARPrepostDetailID.asFloat]);
  ExecuteCommandFmt('update arprepost_detail set tax_rate = %.6f where id = %f', [ANewTaxRate, TFrmInvoice(self.Owner).QryARPrepostDetailID.asFloat]);
  AId := TFrmInvoice(self.Owner).QryARPrepostDetailID.asFloat;
  TFrmInvoice(self.Owner).QryARPrepostDetail.Close;
  TFrmInvoice(self.Owner).QryARPrepostDetail.Open;
  TFrmInvoice(self.Owner).QryARPrepostDetail.Locate('ID', aId, []);

  TFrmInvoice(self.Owner).ViewArPrepostDetailTotals.close;
  TFrmInvoice(self.Owner).ViewArPrepostDetailTotals.open;
end;

procedure TFrmApTax.TblARTaxBeforePost(DataSet: TDataSet);
var
  AOldTaxRate, ANewTaxRate:Real;
  AOldTaxAmount:Real;
begin
  AOldTaxAmount := SelectValueFmtAsFloat('select tax_amount from arprepost_tax where id = %f', [TblARTax.FieldByName('ID').asFloat]);
  if (AOldTaxAmount <> 0) and (AOldTaxAmount <> TblARTax.FieldByName('TAX_AMOUNT').asFloat) then
  begin
    AOldTaxRate := TblARTax.FieldByName('TAX_RATE').asFloat;
    ANewTaxRate := AOldTaxRate * TblARTax.FieldByName('TAX_AMOUNT').asFloat / AOldTaxAmount;
    TblARTax.FieldByName('TAX_RATE').asFloat := ANewTaxRate;
  end;
end;

procedure TFrmApTax.TblTaxAfterPost(DataSet: TDataSet);
var
  AId:Real;
  ASum:Real;
begin
  {
  ASum := SelectValueFmtAsFloat('select sum(tax_amount) from apprepost_tax where apprepost_detail_id = %f',
                        [TFrmAp(Owner).QryDetailID.asFloat]);

  ExecuteCommandFmt('update apprepost_detail set amount_distributed = NVL(amount_before_tax, 0) + %f where id = %f',
                [ASum, TFrmAp(Owner).QryDetailID.asFloat]);

  AId := TFrmAp(Owner).QryDetailID.asFloat;
  TFrmAp(Owner).QryDetail.Close;
  TFrmAp(Owner).QryDetail.Open;
  TFrmAp(Owner).QryDetail.Locate('ID', aId, []);
  TFrmAp(Owner).QryPrePostTotal.Close;
  TFrmAp(Owner).QryPrePostTotal.Open;
  }
end;

procedure TFrmApTax.TaxCodes1Click(Sender: TObject);
begin
  DoTaxCode;  {TaxMain.pas}
end;

end.
