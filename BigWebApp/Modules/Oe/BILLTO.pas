unit BillTo;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Vcl.Buttons,
  Vcl.wwdblook,
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
  { TODO -oathite -cWebConvert : Depends on _CountryLookupDataModule
  _CountryLookupDataModule, }
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniComboBox, uniDBComboBox, IQUniGrid, uniGUIFrame;

type
  TFrmBillTo = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnClose: TUniButton;
    Panel3: TUniPanel;
    DataSource1: TDataSource;
    tBillTo: TFDTable;
    tBillToID: TBCDField;
    tBillToARCUSTO_ID: TBCDField;
    tBillToATTN: TStringField;
    tBillToADDR1: TStringField;
    tBillToADDR2: TStringField;
    tBillToADDR3: TStringField;
    tBillToCITY: TStringField;
    tBillToSTATE: TStringField;
    tBillToCOUNTRY: TStringField;
    tBillToZIP: TStringField;
    tBillToPHONE_NUMBER: TStringField;
    tBillToEXT: TStringField;
    tBillToFAX: TStringField;
    tBillToPRIME_CONTACT: TStringField;
    Panel4: TUniPanel;
    Bevel1: TUniPanel;
    sbtnSeachOrdDetail: TUniSpeedButton;
    PkAddress: TIQWebHPick;
    FloatField7: TBCDField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    wwDBGrid1: TIQUniGridControl;
    wwDBComboBoxCountry: TUniDBLookupComboBox;
    wwDBComboBoxState: TUniDBLookupComboBox;
    tBillToCOUNTRY_ID: TBCDField;
    tBillToSTATE_ID: TBCDField;
    procedure BtnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PkAddressBeforeOpen(DataSet: TDataSet);
    procedure sbtnSeachOrdDetailClick(Sender: TObject);
    procedure tBillToNewRecord(DataSet: TDataSet);
    procedure wwDBComboBoxCountryBeforeDropDown(Sender: TObject);
    procedure wwDBComboBoxCountryCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure wwDBComboBoxStateCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure tBillToAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    FArcustoID: Int64;
    procedure SetArcustoID(const Value: Int64);
  protected
  { TODO -oathite -cWebConvert : Depends on _CountryLookupDataModule
    DMLOCALE: TCountryLookupDataModule; }
  public
    { Public declarations }
    property ArcustoID: Int64 write SetArcustoID;
    class procedure DoShowModal(AArcustoID: Int64);
    function SelectedID: Int64;
  end;

procedure DoBillTo(nArCusto_Id: Real);


implementation

{$R *.DFM}


uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  { TODO -oathite -cWebConvert : Depends on IQMS.Regional.ControlUtils
  IQMS.Regional.ControlUtils,}
  IQMS.Common.RegFrm;

procedure DoBillTo(nArCusto_Id: Real);
begin
  TFrmBillTo.DoShowModal(Trunc(nArCusto_Id));
end;

{ TFrmBillTo }
class procedure TFrmBillTo.DoShowModal(AArcustoID: Int64);
var
  LFrmBillTo : TFrmBillTo;
begin
  LFrmBillTo := TFrmBillTo.Create(uniGUIApplication.UniApplication);
  LFrmBillTo.ArcustoID := AArcustoID;
  LFrmBillTo.ShowModal;
end;

procedure TFrmBillTo.FormCreate(Sender: TObject);
begin

  { TODO -oathite -cWebConvert : Depends on _CountryLookupDataModule
  DMLOCALE := TCountryLookupDataModule.Create(Self);
  DMLOCALE.Name := ''; }

  IqRegFormRead(Self, [Self, wwDBGrid1]);
  IQSetTablesActive(TRUE, Self);
end;

procedure TFrmBillTo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IqRegFormWrite(Self, [Self, wwDBGrid1])
end;

procedure TFrmBillTo.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmBillTo.tBillToAfterPost(DataSet: TDataSet);
begin
  tBillTo.Refresh;
end;

procedure TFrmBillTo.tBillToNewRecord(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); { in IQlib }
  tBillToARCUSTO_ID.AsLargeInt := FArcustoID;
end;

procedure TFrmBillTo.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  { TODO -oathite -cWebConvert : Depends on _CountryLookupDataModule
  if Assigned(DMLOCALE) and (tBillTo.State in [dsBrowse]) then
    DMLOCALE.SyncLookupDataSets(
      tBillToCOUNTRY_ID.AsLargeInt,
      tBillToSTATE_ID.AsLargeInt);  }
end;

procedure TFrmBillTo.wwDBComboBoxCountryBeforeDropDown(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Depends on _CountryLookupDataModule
  DMLOCALE.DoCountryComboBoxBeforeDropDown(Sender); }
end;

procedure TFrmBillTo.wwDBComboBoxCountryCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  { TODO -oathite -cWebConvert : Depends on _CountryLookupDataModule
  DMLOCALE.DoCountryComboBoxOnCloseUp(
    Sender,
    LookupTable,
    FillTable,
    modified
    ); }
end;

procedure TFrmBillTo.wwDBComboBoxStateCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  // See note for wwDBComboBoxCountryCloseUp() for why this is necessary.
  { TODO -oathite -cWebConvert : Depends on _CountryLookupDataModule
  DMLOCALE.DoStateComboBoxOnCloseUp(
    Sender,
    LookupTable,
    FillTable,
    modified
    );   }
end;

procedure TFrmBillTo.PkAddressBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ARCUSTO_ID', FArcustoID);
end;

procedure TFrmBillTo.sbtnSeachOrdDetailClick(Sender: TObject);
begin
  with PkAddress do
    if Execute then
      tBillTo.Locate('ID', GetValue('ID'), [])
end;

function TFrmBillTo.SelectedID: Int64;
begin
  Result := tBillToID.AsLargeInt;
end;

procedure TFrmBillTo.SetArcustoID(const Value: Int64);
begin
  FArcustoID := Value;
  tBillTo.SetRange([Value], [Value]);
end;

end.
