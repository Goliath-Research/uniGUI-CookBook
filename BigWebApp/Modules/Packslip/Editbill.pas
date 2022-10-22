unit EditBill;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.DBGrids,
  Vcl.Buttons,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Hpick,
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
  uniScrollBox,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniPageControl;

type
  TEditBillToShipTo = class of TFrmEditBillToCustom;

  TFrmEditBillToCustom = class(TUniForm)
    Panel1: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    sbtnToggleView: TUniSpeedButton;
    Panel2: TUniPanel;
    Src: TDataSource;
    Table: TFDTable;
    TableID: TBCDField;
    TableARCUSTO_ID: TBCDField;
    TableATTN: TStringField;
    TableADDR1: TStringField;
    TableADDR2: TStringField;
    TableADDR3: TStringField;
    TableCITY: TStringField;
    TableSTATE: TStringField;
    TableCOUNTRY: TStringField;
    TableZIP: TStringField;
    TableEXT: TStringField;
    TablePRIME_CONTACT: TStringField;
    TablePHONE_NUMBER: TStringField;
    TableFAX: TStringField;
    Panel3: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    sbtnSearch: TUniSpeedButton;
    Pk: TIQWebHPick;
    PnlFormCarrier: TUniPanel;
    PageControl1: TUniPageControl;
    TabForm: TUniTabSheet;
    TabGrid: TUniTabSheet;
    Grid: TUniDBGrid;
    PnlFormView: TUniPanel;
    sbMain: TUniScrollBox;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    Label12: TUniLabel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label7: TUniLabel;
    Label4: TUniLabel;
    Label8: TUniLabel;
    Label9: TUniLabel;
    Label10: TUniLabel;
    Label11: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    PnlClient02: TUniPanel;
    dbeContact: TUniDBEdit;
    dbeCompany: TUniDBEdit;
    dbeAddress1: TUniDBEdit;
    dbeAddress2: TUniDBEdit;
    dbeAddress3: TUniDBEdit;
    dbeCity: TUniDBEdit;
    dbCountry: TUniDBComboBox;
    dbeTelephone: TUniDBEdit;
    dbeExt: TUniDBEdit;
    dbeFax: TUniDBEdit;
    dbeZip: TUniDBEdit;
    dbeState: TUniDBComboBox;
    procedure sbtnToggleViewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure TableBeforePost(DataSet: TDataSet);
    procedure sbtnSearchClick(Sender: TObject);
    procedure PkBeforeOpen(DataSet: TDataSet);
    procedure dbCountryChange(Sender: TObject);
    procedure SrcDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  strict private
    { Private declarations }
    FArcustoID: Real;
    procedure AssignPickList(ATable: TFDTable);
  strict
  private
    FFormReference: TEditBillToShipTo;
    procedure SetFormReference(const Value: TEditBillToShipTo);
  private
    procedure SetArcustoID(const Value: Real); protected
    FOKButtonClicked: Boolean;
  public
    { Public declarations }
    property OKButtonClicked: Boolean read FOKButtonClicked;
    property ArcustoID: Real read FArcustoID write SetArcustoID;
    property FormReference: TEditBillToShipTo write SetFormReference;
  end;

  { DoEditBillTo( TFrmEditShipTo, ID) }
function DoEditBillToShipTo(AFormReference: TEditBillToShipTo;
  AArcustoID: Real): Real;



implementation

{$R *.DFM}


uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.Regional;

function DoEditBillToShipTo(AFormReference: TEditBillToShipTo;
  AArcustoID: Real): Real;
var
  FrmEditBilltoCustom: TFrmEditBillToCustom;
begin
  FrmEditBilltoCustom := AFormReference.Create(uniGUIApplication.UniApplication);
  with FrmEditBilltoCustom do
    try
      ArcustoID := Trunc(AArcustoID);
      ShowModal;
      if OKButtonClicked then
        Result := Table.FieldByName('ID').AsLargeInt
      else
        Result := 0;
    finally
      Release;
    end;
end;

procedure TFrmEditBillToCustom.UniFormCreate(Sender: TObject);
begin
  FOKButtonClicked := False;
  Table.Open;
  IQMS.Common.Controls.AdjustPageControlToParent(PageControl1);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient02);
  Table.SetRange([FArcustoID], [FArcustoID]);
  AssignPickList(Table);
  IQMS.Common.Regional.LoadCountries(dbCountry);
end;

procedure TFrmEditBillToCustom.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
  SrcDataChange(nil, nil);
end;

procedure TFrmEditBillToCustom.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmEditBillToCustom.sbtnToggleViewClick(Sender: TObject);
begin
  if (PageControl1.ActivePage = TabGrid) or (Sender = nil) then
  begin
    Grid.DataSource := nil;
    PageControl1.ActivePage := TabForm;
  end
  else
  begin
    Grid.DataSource := Src;
    PageControl1.ActivePage := TabGrid;
  end;
end;

procedure TFrmEditBillToCustom.SetArcustoID(const Value: Real);
begin
  FArcustoID := Value;
end;

procedure TFrmEditBillToCustom.SetFormReference(const Value: TEditBillToShipTo);
begin
  FFormReference := Value;
end;

procedure TFrmEditBillToCustom.SrcDataChange(Sender: TObject; Field: TField);
begin
  if not Showing then
    Exit;
  IQMS.Common.Regional.LoadStateCombo(dbeState, dbCountry);
end;

procedure TFrmEditBillToCustom.TableBeforePost(DataSet: TDataSet);
begin
  if Empty(Table.FieldByName('ATTN').AsString) then
    raise Exception.Create('field Company must have a value');
  IQAssignIDBeforePost(DataSet); {in IQlib}
  Table.FieldByName('ArCusto_Id').asFloat := FArcustoID;
end;

procedure TFrmEditBillToCustom.BtnOkClick(Sender: TObject);
begin
  if Table.State in [dsEdit, dsInsert] then
    Table.Post;
  FOKButtonClicked := True;
  Close;
end;

procedure TFrmEditBillToCustom.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmEditBillToCustom.AssignPickList(ATable: TFDTable);
var
  I: Integer;
  AField: TField;
begin
  {Build select Statement}
  with Pk do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select ');
  end;

  {Add select columns}
  with ATable do
    for I := 0 to FieldCount - 1 do
      with Fields[I] do
        if FieldKind = fkData then
          Pk.SQL.Add(FieldName + IIf(I < FieldCount - 1, ',', ''));

  Pk.SQL.Add(Format('from %s', [ATable.TableName]));
  Pk.SQL.Add(IQFormat('where %s = %f', [ATable.IndexFieldNames, FArcustoID]));

  {Build TFields}
  Pk.FieldDefs.Update;

  {Assign TFields properties }
  if Pk.FieldCount = 0 then
    for I := 0 to Pk.FieldDefs.Count - 1 do
    begin
      AField := Pk.FieldDefs[I].CreateField(Pk);
      with ATable.FieldByName(AField.FieldName) do
      begin
        AField.DisplayLabel := DisplayLabel;
        AField.Visible := Visible;
        AField.DisplayWidth := DisplayWidth;
      end;
    end;
end;

procedure TFrmEditBillToCustom.sbtnSearchClick(Sender: TObject);
begin
  with Pk do
    if Execute then
      self.Table.Locate('ID', GetValue('ID'), [])
end;

procedure TFrmEditBillToCustom.PkBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter(DataSet); {pas}
end;

procedure TFrmEditBillToCustom.dbCountryChange(Sender: TObject);
begin
  IQMS.Common.Regional.LoadStateCombo(dbeState, dbCountry);
end;

end.
