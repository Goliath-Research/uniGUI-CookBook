unit APCostAlloc;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.About,
  Vcl.Buttons,
  Vcl.Menus,
  IQMS.WebVcl.Hpick,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
 { TODO -oLema : Dependent on AP_Main }
//  AP_Main,
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
//  FireDAC.Stan.ExprFuncs,
  FireDAC.DApt,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmCostAllocAP = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Options1: TUniMenuItem;
    AllocateFreightCost1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    Label8: TUniLabel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    SBSearchTech: TUniSpeedButton;
    sbShipSearch: TUniSpeedButton;
    EdFreight: TUniEdit;
    EdTech: TUniEdit;
    EdShipVia: TUniEdit;
    sbAlloc: TUniButton;
    IQAbout1: TIQWebAbout;
    SR: TIQWebSecurityRegister;
    IQSearch1: TIQUniGridControl;
    QryRec: TFDQuery;
    Src: TDataSource;
    PkFreight: TIQWebHPick;
    PkFreightID: TBCDField;
    PkFreightDESCRIP: TStringField;
    PkFreightSCAC_IATA_CODE: TStringField;
    PkFreightCODE_QUALIFIER: TStringField;
    PkFreightTRANSPORT_CODE: TStringField;
    PkFreightEQUIP_OWNERS_CODE: TStringField;
    PkFreightCOMMENT1: TStringField;
    PkProc: TIQWebHPick;
    PkProcOBJECT_NAME: TStringField;
    QryRecID: TBCDField;
    QryRecAMOUNT_BEFORE_TAX: TBCDField;
    QryRecAMOUNT_DISTRIBUTED: TBCDField;
    QryRecQTY_INVOICED: TBCDField;
    QryRecITEM_DESCRIP: TStringField;
    QryRecITEM_ITEMNO: TStringField;
    QryRecFREIGHT_PRICE: TBCDField;
    QryRecFREIGHT_COMP: TStringField;
    QryRecDESCRIP2: TStringField;
    Contents1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure sbShipSearchClick(Sender: TObject);
    procedure SBSearchTechClick(Sender: TObject);
    procedure sbAllocClick(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  protected
    procedure UpdateFooter(Sender: TObject);
  private
    { Private declarations }
    FAPPrepostID:Real;
    FFreightId:Real;
    FTech:String;
    procedure AssignShipViaText;
    procedure AssignAllocTech;
    function  GetIds:String;
  public
    { Public declarations }
  end;

procedure APFreightCostAlloc(AId:Real);


implementation

uses
  IQMS.Common.DataConst,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.NLS,
  ap_rscstr,
  IQMS.Common.HelpHook;

{$R *.dfm}

procedure APFreightCostAlloc(AId:Real);
var
  frm: TFrmCostAllocAP;
begin
  frm := TFrmCostAllocAP.Create(uniGUIApplication.UniApplication);
  frm.FAPPrepostID := AId;
  frm.Show;
end;

procedure TFrmCostAllocAP.Contents1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmSETUP { CHM } , iqhtmSETUPch4 { HTM } ); // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(Self.HelpContext);
end;

procedure TFrmCostAllocAP.UniFormShow(Sender: TObject);
begin
//  IQSearch1.wwDBGrid.OnUpdateFooter := UpdateFooter;


  FFreightId := SelectValueFmtAsFloat('select min(r.freight_id) ' +
                          '  from apprepost_detail r    ' +
                          ' where r.freight_id is not null ' +
                          '   and r.apprepost_id = %f', [FAPPrepostID]);

  AssignShipViaText;

  EdFreight.text := FloatToStr(SelectValueFmtAsFloat('select sum(r.freight_price) ' +
                          '  from apprepost_detail r    ' +
                          ' where r.freight_id is not null ' +
                          '   and r.apprepost_id = %f', [FAPPrepostID]));

  QryRec.Close;
//  QryRec.ParamByName('AId').Value := FAPPrepostID;
  AssignQueryParamValue(QryRec, 'AId', FAPPrepostID);
  QryRec.Open;
  UpdateFooter(nil);

//  IqSearch1.wwdbgrid.SelectAll;

end;


procedure TFrmCostAllocAP.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
end;

procedure TFrmCostAllocAP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmCostAllocAP.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCostAllocAP.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmCostAllocAP.AssignShipViaText;
begin
  EdShipVia.Readonly := false;
  EdShipVia.Text := SelectValueFmtAsString('select descrip from freight where id = %f', [FFreightId]);
  EdShipVia.Readonly := true;
end;

procedure TFrmCostAllocAP.AssignAllocTech;
begin
  EdTech.Readonly := false;
  EdTech.text := FTech;
  EdTech.Readonly := true;
end;

procedure TFrmCostAllocAP.sbShipSearchClick(Sender: TObject);
begin
   with PkFreight do
   if Execute then
   begin
     FFreightId := GetValue('ID');
     AssignShipViaText;
   end;
end;

procedure TFrmCostAllocAP.SBSearchTechClick(Sender: TObject);
begin
  with PkProc do
  if Execute then
  begin
    FTech := GetValue('OBJECT_NAME');
    AssignAllocTech;
  end;
end;

procedure TFrmCostAllocAP.sbAllocClick(Sender: TObject);
var
  AFreight:Real;
  AIds:String;
  AQry1, AQry2:TFDQuery;
begin
  try
    AFreight := StrToFloat(EdFreight.text);
  except
    raise exception.Create(ap_rscstr.cTXT0000061 {'The freight amount is incorrect.'});
  end;

  if AFreight <= 0 then
     // 'The freight amount must be greater than zero.  Please specify a freight amount.'
     raise exception.Create(ap_rscstr.cTXT0000062);

  if FFreightId = 0 then
     //'Please select a value for Ship Via.'
     raise exception.Create(ap_rscstr.cTXT0000063);

  if FTech = '' then
     // Please select a Cost Allocation Technique.
     raise exception.Create(ap_rscstr.cTXT0000064);

  AIds := GetIds;
  if AIds = ')' then
     // 'No records were found to process.'
    raise exception.Create(ap_rscstr.cTXT0000065);

  ExecuteCommandFmt('begin FREIGHT_COST_ALLOC.%s(''%s'', %f, ''AP''); end;', [FTech, AIds, AFreight]);
  ExecuteCommandFmt('update apprepost_detail set freight_id = %f where id in %s', [FFreightId, AIds]);

  AQry1 := TFDQuery.Create(nil);
  try
    AQry1.ConnectionName := cnstFDConnectionName;
    AQry1.Sql.Add(IqFormat('select * from apprepost_detail where id in %s', [AIds]));
    AQry1.Open;
    while not AQry1.Eof do
    begin
      AQry2 := TFDQuery.Create(nil);
      try
        AQry2.ConnectionName := cnstFDConnectionName;
        AQry2.Sql.Add(IQFormat('select NVL(t.include_freight, ''N'') as include_freight, a.id from apprepost_tax a, apprepost_detail d, tax_codes t ' +
                       ' where a.apprepost_detail_id = %f ' +
                       '   and d.id = a.apprepost_detail_id and d.tax_code_id = t.id(+)', [AQry1.FieldByName('ID').asFloat]));
        AQry2.Open;
        while not AQry2.Eof do
        begin
          if AQry2.FieldByName('include_freight').asString = 'Y' then
            ExecuteCommandFmt('update apprepost_tax set tax_amount = tax_rate * (%f + %f)/100 where id = %f',
                      [AQry1.FieldByName('AMOUNT_BEFORE_TAX').asFloat,
                       AQry1.FieldByName('FREIGHT_PRICE').asFloat,
                       AQry2.FieldByName('ID').asFloat])
          else
            ExecuteCommandFmt('update apprepost_tax set tax_amount = tax_rate * %f/100 where id = %f',
                      [AQry1.FieldByName('AMOUNT_BEFORE_TAX').asFloat,
                       AQry2.FieldByName('ID').asFloat]);
          AQry2.Next;
        end;
      finally
        AQry2.Free;
      end;
      AQry1.Next;
    end;
  finally
    AQry1.Free;
  end;

//  IqSearch1.wwdbgrid.UnSelectAll;

  QryRec.Close;
  QryRec.Open;
 { TODO -oLema : Dependent on AP_Main }
//  TFrmAp(Owner).QryDetail.Close;
//  TFrmAp(Owner).QryDetail.Open;
//  TFrmAp(Owner).QryPrePostTotal.Close;
//  TFrmAp(Owner).QryPrePostTotal.Open;
  UpdateFooter(nil);
end;

function TFrmCostAllocAP.GetIds:String;
var
  I:Integer;
begin
//  if IqSearch1.wwdbgrid.SelectedList.Count = 0 then
//    IqSearch1.wwdbgrid.SelectAll;

  Result := '(';
  with IqSearch1.dbgrid, IqSearch1.dbgrid.datasource.dataset do
 begin
  for I:= 0 to SelectedRows.Count-1 do begin
   GotoBookmark(SelectedRows.items[i]);
      Result := IqFormat('%s%f, ', [Result, FieldByName('ID').asFloat]);
  end;
 end;

  Result := Copy(Result, 1, Length(Result) - 2) + ')';

end;


procedure TFrmCostAllocAP.UpdateFooter(Sender: TObject);
var
  AFreight:Real;
begin
  AFreight := SelectValueFmtAsFloat('select sum(r.freight_price) ' +
                          '  from apprepost_detail r    ' +
                          ' where r.freight_price is not null ' +
                          '   and r.apprepost_id = %f', [FAPPrepostID]);

//  IqSearch1.wwDBGrid.ColumnByName('FREIGHT_PRICE').FooterValue := FloatToStr(AFreight);
end;


end.
