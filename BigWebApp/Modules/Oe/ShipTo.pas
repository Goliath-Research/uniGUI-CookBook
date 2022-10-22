unit ShipTo;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  BillTo,
  Data.DB,
  IQMS.WebVcl.Hpick,
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
  FireDAC.Comp.Client,
  Vcl.Buttons,
  Vcl.Controls,
  { TODO -oathite -cWebConvert : Dependent on _CountryLookupDataModule
  _CountryLookupDataModule, }
  vcl.wwdblook,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit, uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox,
  IQUniGrid, uniGUIFrame, uniBitBtn, uniSpeedButton, uniButton, uniPanel;

type
  TFrmShipTo = class(TFrmBillTo)
    tBillToSHIP_TIME: TBCDField;
    tBillToTAX_CODE_ID: TBCDField;
    tBillToTax_code: TStringField;
    tBillToFREIGHT_ID: TBCDField;
    tBillToFreight_Comp: TStringField;
    tBillToEPLANT_ID: TBCDField;
    tBillToPlant_Name: TStringField;
    PkAddressEPLANT_ID: TBCDField;
    PkAddressSHIP_VIA: TStringField;
    PkAddressDIVISION_NAME: TStringField;
    PkAddressPK_HIDE: TStringField;
    tBillToDIVISION_ID: TBCDField;
    tBillToDivision: TStringField;
    PkDivision: TIQWebHPick;
    PkDivisionID: TBCDField;
    PkDivisionNAME: TStringField;
    PkDivisionEPLANT_ID: TBCDField;
    PkFreight: TIQWebHPick;
    PkFreightID: TBCDField;
    PkFreightDESCRIP: TStringField;
    PkFreightSCAC_IATA_CODE: TStringField;
    PkFreightCODE_QUALIFIER: TStringField;
    PkFreightTRANSPORT_CODE: TStringField;
    PkFreightEQUIP_OWNERS_CODE: TStringField;
    PkFreightPK_HIDE: TStringField;
    PkFreightEPLANT_ID: TBCDField;
    PkTaxCode: TIQWebHPick;
    PkTaxCodeTAX_CODE: TStringField;
    PkTaxCodeTAX_CODE_DESC: TStringField;
    PkTaxCodeTOT_TAX_RATE: TFMTBCDField;
    PkTaxCodeID: TBCDField;
    wwDBComboDlgTaxCode: TUniEdit;
    wwDBComboDlgFreight: TUniEdit;
    wwDBComboDlgDivision: TUniEdit;
    wwDBComboDlgEplant: TUniEdit;
    procedure tBillToBeforeOpen(DataSet: TDataSet);
    procedure sbtnSeachOrdDetailClick(Sender: TObject);
    procedure PkAddressBeforeOpen(DataSet: TDataSet);
    procedure tBillToCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure wwDBComboDlgTaxCodeCustomDlg(Sender: TObject);
    procedure wwDBComboDlgTaxCodeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure wwDBComboDlgFreightKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure wwDBComboDlgDivisionKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure wwDBComboDlgFreightCustomDlg(Sender: TObject);
    procedure wwDBComboDlgDivisionCustomDlg(Sender: TObject);
    procedure wwDBComboDlgEplantCustomDlg(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoShipTo(nArCusto_Id: Int64);


implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.COmmon.SetPlant,
  IQMS.Common.DataLib,
  IQMS.Common.SysShare,
  uniGUIApplication;

procedure DoShipTo(nArCusto_Id: Int64);
begin
  with TFrmShipTo.Create(uniGUIApplication.UniApplication) do
    try
      ArCustoId := nArCusto_Id;
      ShowModal;
    finally
      Release;
    end;
end;

procedure TFrmShipTo.tBillToBeforeOpen(DataSet: TDataSet);
begin
  inherited; { nothing }
  IQAssignEPlantFilter(DataSet);
end;

procedure TFrmShipTo.sbtnSeachOrdDetailClick(Sender: TObject);
begin
  inherited;
  // Delphi
end;

procedure TFrmShipTo.PkAddressBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  // Delphi
end;

procedure TFrmShipTo.tBillToCalcFields(DataSet: TDataSet);
begin
  inherited;
  if tBillToDIVISION_ID.AsLargeInt > 0 then
    tBillToDivision.asString := SelectValueByID('name', 'division', tBillToDIVISION_ID.AsLargeInt);

  if tBillToTAX_CODE_ID.AsLargeInt > 0 then
    tBillToTax_code.asString := SelectValueByID('tax_code', 'tax_codes',
      tBillToTAX_CODE_ID.AsLargeInt);

  if tBillToFREIGHT_ID.AsLargeInt > 0 then
    tBillToFreight_Comp.asString := SelectValueByID('descrip', 'freight',
      tBillToFREIGHT_ID.AsLargeInt);

  if tBillToEPLANT_ID.AsLargeInt > 0 then
    tBillToPlant_Name.asString := SelectValueByID('name', 'eplant', tBillToEPLANT_ID.AsLargeInt);
end;

procedure TFrmShipTo.wwDBComboDlgDivisionKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IQMS.Common.Controls.CheckClearWWDBComboDlg(Sender, Key, tBillToDIVISION_ID);
end;

procedure TFrmShipTo.wwDBComboDlgEplantCustomDlg(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Incompatible types: 'TDataSet' and 'TFrmShipTo'
  DoChangePlantID(self, TBillTo); { IQMS.COmmon.SetPlant.pas }
end;

procedure TFrmShipTo.wwDBComboDlgFreightKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  IQMS.Common.Controls.CheckClearWWDBComboDlg(Sender, Key, tBillToFREIGHT_ID);
end;

procedure TFrmShipTo.wwDBComboDlgTaxCodeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  IQMS.Common.Controls.CheckClearWWDBComboDlg(Sender, Key, tBillToTAX_CODE_ID);
end;

procedure TFrmShipTo.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  { TODO -oathite -cWebConvert :  Undeclared identifier: 'WWColumnIndexByName'
  I := WWColumnIndexByName(wwDBGrid1, 'DIVISION');
  if I > -1 then
    with wwDBGrid1 do
      Columns[I].DisplayLabel := CheckReplaceDivisionCaption(Columns[I].DisplayLabel);   }
end;

procedure TFrmShipTo.wwDBComboDlgTaxCodeCustomDlg(Sender: TObject);
begin
  IQPickAndReplace(tBillToTAX_CODE_ID, PkTaxCode, 'ID')
end;

procedure TFrmShipTo.wwDBComboDlgFreightCustomDlg(Sender: TObject);
begin
  IQPickAndReplace(tBillToFREIGHT_ID, PkFreight, 'ID')
end;

procedure TFrmShipTo.wwDBComboDlgDivisionCustomDlg(Sender: TObject);
begin
  IQPickAndReplace(tBillToDIVISION_ID, PkDivision, 'ID')
end;

end.
