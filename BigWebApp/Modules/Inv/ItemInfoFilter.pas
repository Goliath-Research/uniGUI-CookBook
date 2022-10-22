unit ItemInfoFilter;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
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
  uniCheckBox,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniDateTimePicker,
  uniSplitter,
  uniGroupBox,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniDBComboBox;

type
  TItemInfoType     = (iitAny, iitPurchased, iitManufactured);
  TItemInfoSource   = (iisAny, iisCurrent, iisArchived);
  TItemInfoPOStatus = (iipAny, iipOpen, iipClosed);

  TItemInfoCargo = record
    FType      : TItemInfoType;
    FSource    : TItemInfoSource;
    FDate1     : TDateTime;
    FDate2     : TDateTime;
    FPOStatus  : TItemInfoPOStatus;
    FVendor_ID : Real;
    FArcusto_ID: Real;
  end;

  TFrmItemInfoFilter = class(TUniForm)
    wwSrcVendor: TDataSource;
    wwQryVendor: TFDQuery;
    wwSrcArcusto: TDataSource;
    wwQryArcusto: TFDQuery;
    wwQryVendorVENDORNO: TStringField;
    wwQryVendorCOMPANY: TStringField;
    wwQryVendorVENDOR_ID: TBCDField;
    wwQryArcustoCUSTNO: TStringField;
    wwQryArcustoCOMPANY: TStringField;
    wwQryArcustoARCUSTO_ID: TBCDField;
    wwQryVendorPK_HIDE: TStringField;
    wwQryArcustoPK_HIDE: TStringField;
    Panel1: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel10: TUniPanel;
    gbGeneral: TUniGroupBox;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    Label1: TUniLabel;
    Label4: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    PnlClient02: TUniPanel;
    cmbType: TUniComboBox;
    cmbSource: TUniComboBox;
    Date1: TUniDateTimePicker;
    Date2: TUniDateTimePicker;
    gbPurchased: TUniGroupBox;
    Panel5: TUniPanel;
    chkOneVendor: TUniCheckBox;
    PnlClient03: TUniPanel;
    Splitter2: TUniSplitter;
    PnlLeft02: TUniPanel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    PnlClient04: TUniPanel;
    wwDBcombVendor: TUniDBLookupComboBox;
    cmbPoStatus: TUniComboBox;
    gbManufactured: TUniGroupBox;
    Panel6: TUniPanel;
    chkOneCustomer: TUniCheckBox;
    PnlClient05: TUniPanel;
    Splitter3: TUniSplitter;
    PnlLeft03: TUniPanel;
    Label8: TUniLabel;
    PnlClient06: TUniPanel;
    wwDBcombCustomer: TUniDBLookupComboBox;
    procedure btnOKClick(Sender: TObject);
    procedure wwDBcombVendorDropDown(Sender: TObject);
    procedure wwDBcombVendorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FItemInfoCargo: TItemInfoCargo;
    FVendorId, FArcustoId:Real;
    procedure InitializeForm;
    procedure SetItemInfoCargo(const Value: TItemInfoCargo);
  public
    { Public declarations }
    property ItemInfoCargo: TItemInfoCargo write SetItemInfoCargo;
  end;

function DoGetItemInfoFilter( var AItemInfoCargo: TItemInfoCargo ): Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.Numbers,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  inv_rscstr;

function DoGetItemInfoFilter( var AItemInfoCargo: TItemInfoCargo ): Boolean;
var
  AVendorId:Real;
  AVendorId2:Real;
  ArCustoId2:Real;
  LFrmItemInfoFilter : TFrmItemInfoFilter;
begin
  LFrmItemInfoFilter := TFrmItemInfoFilter.Create(UniGUIApplication.UniApplication);
  LFrmItemInfoFilter.ItemInfoCargo := AItemInfoCargo;
  Result:= LFrmItemInfoFilter.ShowModal = mrOK;
    if Result then
      with AItemInfoCargo do
      begin
        FType      := TItemInfoType( LFrmItemInfoFilter.cmbType.ItemIndex );
        FSource    := TItemInfoSource( LFrmItemInfoFilter.cmbSource.ItemIndex );
        FDate1     := LFrmItemInfoFilter.Date1.Datetime;
        FDate2     := LFrmItemInfoFilter.Date2.Datetime;
        FPOStatus  := TItemInfoPOStatus( LFrmItemInfoFilter.cmbPoStatus.ItemIndex );
        AVendorId := FVendor_ID;
        AVendorId2 := LFrmItemInfoFilter.FItemInfoCargo.FVendor_ID;
        ArCustoId2 := LFrmItemInfoFilter.FItemInfoCargo.FArcusto_ID;
//        FVendor_ID := IIf( chkOneVendor.Checked,   AVendorId2,  0);
//        FArcusto_ID:= IIf( chkOneCustomer.Checked, ArCustoId2, 0);

        FVendor_ID := IIf( LFrmItemInfoFilter.chkOneVendor.Checked,   LFrmItemInfoFilter.FVendorID,  0);
        FArcusto_ID:= IIf( LFrmItemInfoFilter.chkOneCustomer.Checked, LFrmItemInfoFilter.FArcustoID, 0);
//        FVendor_ID := IIf( chkOneVendor.Checked,   FItemInfoCargo.FVendor_ID,  0);
//        FArcusto_ID:= IIf( chkOneCustomer.Checked, FItemInfoCargo.FArcusto_ID, 0);
      end;
end;

procedure TFrmItemInfoFilter.InitializeForm;
  procedure SyncComboBox( wwComboBox: TUniDBLookupComboBox; ASearch: string );
  begin
(* TODO -oGPatil -cWebconvert : TUniDBLookupComboBox does not contain a member named LookupValue
      wwComboBox.LookupValue:= ASearch;
      wwComboBox.PerformSearch;  *)
  end;
begin
  with FItemInfoCargo do
  begin
    cmbType.ItemIndex     := Ord( FType );
    cmbSource.ItemIndex   := Ord( FSource );
    Date1.Datetime            := FDate1;
    Date2.Datetime            := FDate2;
    cmbPoStatus.ItemIndex := Ord( FPOStatus );

    chkOneVendor.Checked  := FVendor_ID > 0;
    if FVendor_ID > 0 then
       SyncComboBox( wwDBcombVendor, SelectValueByID('vendorno', 'vendor', FVendor_ID ));

    chkOneCustomer.Checked:= FArcusto_ID > 0;
    if FArcusto_ID > 0 then
       SyncComboBox( wwDBcombCustomer, SelectValueByID('custno', 'arcusto', FArcusto_ID ));
  end;
end;

procedure TFrmItemInfoFilter.SetItemInfoCargo(const Value: TItemInfoCargo);
begin
  FItemInfoCargo := Value;
end;

procedure TFrmItemInfoFilter.UniFormCreate(Sender: TObject);
begin
  FVendorID := FItemInfoCargo.FVendor_ID;
  FArcustoID := FItemInfoCargo.FArcusto_ID;
  IQSetTablesActive( TRUE, self );
  InitializeForm;
  IQMS.Common.Controls.AdjustControlWidthToParentA(PnlClient02);
  IQMS.Common.Controls.AdjustControlWidthToParentA(PnlClient04);
  IQMS.Common.Controls.AdjustControlWidthToParentA(PnlClient06);
end;

procedure TFrmItemInfoFilter.btnOKClick(Sender: TObject);
begin
  if chkOneVendor.Checked then
  begin
(* TODO -oGPatil -cWebconvert : TUniDBLookupComboBox does not contain a member named LookupValue
     IQAssert( wwDBcombVendor.LookupValue > '', inv_rscstr.cTXT0000092 {'Please select a Vendor.'} ); *)
     FItemInfoCargo.FVendor_ID:= wwQryVendorVENDOR_ID.asFloat;
  end;

  if chkOneCustomer.Checked then
  begin
(* TODO -oGPatil -cWebconvert : TUniDBLookupComboBox does not contain a member named LookupValue
     IQAssert( wwDBcombCustomer.LookupValue > '', inv_rscstr.cTXT0000093 {'Please select a Customer.'} ); *)
     FItemInfoCargo.FArcusto_ID:= wwQryArcustoARCUSTO_ID.asFloat;
  end;

  ModalResult:= mrOK;
end;

procedure TFrmItemInfoFilter.wwDBcombVendorDropDown(Sender: TObject);
begin
(* TODO -oGPatil -cWebconvert : TUniDBLookupComboBox does not contain a member named LookupValue
  (Sender as TUniDBLookupComboBox).LookupTable.Filter:= 'PK_HIDE = NULL or PK_HIDE = ''N''';
  if Sender = wwDBcombVendor then
    (Sender as TUniDBLookupComboBox).LookupTable.Locate('VENDOR_ID', FVendorId, [])
  else
    (Sender as TUniDBLookupComboBox).LookupTable.Locate('ARCUSTO_ID', FArcustoId, []);
 *)
end;

procedure TFrmItemInfoFilter.wwDBcombVendorCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  if Sender = wwDBcombVendor then
    FVendorId := LookupTable.FieldByName('VENDOR_ID').asFloat
  else
    FArcustoId := LookupTable.FieldByName('ARCUSTO_ID').asFloat;
  LookupTable.Filter:= '';
end;

end.
