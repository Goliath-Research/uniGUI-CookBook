unit IQMS.Common.MiscItem;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  System.Math,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel,
  uniEdit;

type
  { TMiscItemInfo }
  TMiscItemInfo = packed record
    ItemNumber: String;
    Description: String;
    Quantity: Real;
    UnitPrice: Real;
    UOM: String;
  end;

  { TMiscControlOptions }
  TMiscControlOption = (mcoEnableItemNumber, mcoEnableDescription,
    mcoEnableQuantity, mcoEnableUnitPrice, mcoEnableUOM, mcoShowItemNumber,
    mcoShowDescription, mcoShowQuantity, mcoShowUnitPrice, mcoShowUOM);
  TMiscControlOptions = set of TMiscControlOption;

  { TFrmCRMQuoteMisc }
  TFrmMiscItem = class(TUniForm)
    PnlClient: TUniPanel;
    PnlBottom: TUniPanel;
    PnlButtons: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    PnlLabels: TUniPanel;
    PnlControls: TUniPanel;
    lblDescription: TUniLabel;
    lblQuantity: TUniLabel;
    lblUnitPrice: TUniLabel;
    edtQuantity: TUniFormattedNumberEdit;
    edtUnitPrice: TUniFormattedNumberEdit;
    lblUOM: TUniLabel;
    cmbUOM: TUniComboBox;
    lblItemno: TUniLabel;
    cmbItemNumber: TUniComboBox;
    cmbDescription: TUniComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FControlOptions: TMiscControlOptions;
    FSaveItemNumberMRU,
    FSaveItemDescripMRU: Boolean;
    procedure AdjustScreenControls;
    procedure SetControlOptions(const Value: TMiscControlOptions);
    procedure LoadComboBoxLists;
    procedure SaveComboBoxLists;
    procedure LoadUOMList;
  public
    { Public declarations }
    procedure AssignItemNumberList(const AList: TStringList);
    procedure AssignDescriptionList(const AList: TStringList);
    procedure AssignMiscItemInfo(MiscItemInfo: TMiscItemInfo);
    procedure GetMiscItemInfo(var MiscItemInfo: TMiscItemInfo);
    property ControlOptions: TMiscControlOptions read FControlOptions write SetControlOptions;
  end;

  function GetMiscItem( var MiscItemInfo: TMiscItemInfo ): Boolean;

  function GetMiscItemEx( AControlOptions: TMiscControlOptions;
    var MiscItemInfo: TMiscItemInfo ): Boolean;

  procedure PrepareMiscItemInfo(var MiscItemInfo: TMiscItemInfo);

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.ResStrings,
  IQMS.Common.MruList;

const
   c_all_control_options: TMiscControlOptions =
     [mcoEnableItemNumber, mcoEnableDescription,mcoEnableQuantity,
      mcoEnableUnitPrice,mcoEnableUOM,mcoShowItemNumber, mcoShowDescription,
      mcoShowQuantity, mcoShowUnitPrice, mcoShowUOM];

  MaxMRU: Byte = 10; // maximum count for MRU list
  RegKey_ItemNumberList: String = 'Miscellaneous Item Number';
  RegKey_DescriptionList: String = 'Miscellaneous Item Description';

procedure PrepareMiscItemInfo(var MiscItemInfo: TMiscItemInfo);
begin
  with MiscItemInfo do
   begin
    ItemNumber := '';
    Description := '';
    Quantity := 0;
    UnitPrice := 0;
    UOM := '';
   end;
end;

function GetMiscItem( var MiscItemInfo: TMiscItemInfo ): Boolean;
var
   frm : TFrmMiscItem;
begin
  frm := TFrmMiscItem.Create(uniGUIApplication.UniApplication);

  // Update screen in case user is changing existing data
  frm.AssignMiscItemInfo(MiscItemInfo);

  Result := frm.ShowModal = mrOk;

  if Result then
     frm.GetMiscItemInfo({var} MiscItemInfo);

end;

function GetMiscItemEx(  AControlOptions: TMiscControlOptions;
  var MiscItemInfo: TMiscItemInfo ): Boolean;
var
   frm : TFrmMiscItem;
begin
   frm := TFrmMiscItem.Create(uniGUIApplication.UniApplication);

   frm.AssignMiscItemInfo(MiscItemInfo);
   frm.ControlOptions := AControlOptions;

   Result := frm.ShowModal = mrOk;
     if Result then
        frm.GetMiscItemInfo({var} MiscItemInfo);
 end;

{ TFrmMiscItem }

procedure TFrmMiscItem.FormCreate(Sender: TObject);
begin
  FSaveItemNumberMRU := True;
  FSaveItemDescripMRU := True;
  LoadComboBoxLists;
  Self.ControlOptions := c_all_control_options;
  AdjustScreenControls;
end;

procedure TFrmMiscItem.FormShow(Sender: TObject);
begin
  // 08/22/2006 Set format if necessary
  if (SelectValueAsString('SELECT num_use_1000_separator FROM params WHERE ROWNUM < 2') = 'Y') then
     begin
         //edtQuantity.DisplayFormat := '#,##0';
         with edtQuantity do
         begin
           DecimalPrecision:=0;
           ThousandSeparator:=',';
           FormattedInput.ShowCurrencySign:=False;
         end;

//       edtUnitPrice.DisplayFormat := '#,##0.00####';
         with edtUnitPrice do
         begin
            DecimalPrecision:=6;
            DecimalSeparator:='.';
            FormattedInput.DecimalGroup:=2;
            ThousandSeparator:=',';
         end;
     end;
end;

procedure TFrmMiscItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveComboBoxLists;
end;

procedure TFrmMiscItem.AssignMiscItemInfo(MiscItemInfo: TMiscItemInfo);
begin
  // Update screen in case user is changing existing data
  cmbItemNumber.Text := MiscItemInfo.ItemNumber;
  cmbDescription.Text := MiscItemInfo.Description;
//  edtQuantity.Position := MiscItemInfo.Quantity;
//  edtUnitPrice.Position := MiscItemInfo.UnitPrice;
  cmbUOM.Text := MiscItemInfo.UOM;
end;

procedure TFrmMiscItem.GetMiscItemInfo(var MiscItemInfo: TMiscItemInfo);
begin
  MiscItemInfo.ItemNumber := cmbItemNumber.Text;
  MiscItemInfo.Description := cmbDescription.Text;
//  MiscItemInfo.Quantity := edtQuantity.Position;
//  MiscItemInfo.UnitPrice := edtUnitPrice.Position;
  MiscItemInfo.UOM := cmbUOM.Text;
end;

procedure TFrmMiscItem.btnOkClick(Sender: TObject);
begin
  // Validation
  if cmbDescription.Visible and
     cmbDescription.Enabled and
     (Trim(cmbDescription.Text) = '') then
     begin
       IQError(IQMS.Common.ResStrings.cTXT0000397); // 'A description is required.'
       ModalResult := mrNone;
     end;
end;

procedure TFrmMiscItem.AdjustScreenControls;
var
   i, w: Integer;
begin
  w := 0;
  for i := 0 to PnlLabels.ControlCount - 1 do
   w := System.Math.Max(w, PnlLabels.Controls[i].Width);
  PnlLabels.Width := w + 16;
  Self.Width :=  PnlLabels.Width + 300;
end;

procedure TFrmMiscItem.SetControlOptions(const Value: TMiscControlOptions);
begin
  FControlOptions := Value;

  // Item Number
  IQMS.Common.Controls.IQEnableControl([lblItemno, cmbItemNumber],
    mcoEnableItemNumber in FControlOptions);
  IQMS.Common.Controls.IQShowControl([lblItemno, cmbItemNumber],
    mcoShowItemNumber in FControlOptions);

  // Description
  IQMS.Common.Controls.IQEnableControl([lblDescription, cmbDescription],
    mcoEnableDescription in FControlOptions);
  IQMS.Common.Controls.IQShowControl([lblDescription, cmbDescription],
    mcoShowDescription in FControlOptions);

  // Quantity
  IQMS.Common.Controls.IQEnableControl([lblQuantity, edtQuantity],
    mcoEnableQuantity in FControlOptions);
  IQMS.Common.Controls.IQShowControl([lblQuantity, edtQuantity],
    mcoShowQuantity in FControlOptions);

  // Unit Price
  IQMS.Common.Controls.IQEnableControl([lblUnitPrice, edtUnitPrice],
    mcoEnableUnitPrice in FControlOptions);
  IQMS.Common.Controls.IQShowControl([lblUnitPrice, edtUnitPrice],
    mcoShowUnitPrice in FControlOptions);

  // UOM
  IQMS.Common.Controls.IQEnableControl([lblUOM, cmbUOM],
    mcoEnableUOM in FControlOptions);
  IQMS.Common.Controls.IQShowControl([lblUOM, cmbUOM],
    mcoShowUOM in FControlOptions);

  // Adjust right-aligned controls
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlLabels);

  // Stack the controls based on visibility
  StackUpControlsA(8, 4, [cmbItemNumber, cmbDescription, edtQuantity,
    edtUnitPrice, cmbUOM]);

  // Adjust the labels
  CenterLabel(TUniCustomEdit(cmbItemNumber), lblItemno);
  CenterLabel(TUniCustomEdit(cmbDescription), lblDescription);
  CenterLabel(TUniCustomEdit(edtQuantity), lblQuantity);
  CenterLabel(TUniCustomEdit(edtUnitPrice), lblUnitPrice);
  CenterLabel(TUniCustomEdit(cmbUOM), lblUOM);
end;

procedure TFrmMiscItem.LoadComboBoxLists;
begin
  GetMRUList(Self, RegKey_ItemNumberList, MaxMRU, cmbItemNumber);
  GetMRUList(Self, RegKey_DescriptionList, MaxMRU, cmbDescription);
  LoadUOMList;
end;

procedure TFrmMiscItem.SaveComboBoxLists;
begin
  if FSaveItemNumberMRU then
     SaveMRUList(Self, RegKey_ItemNumberList, MaxMRU,cmbItemNumber);
  if FSaveItemDescripMRU then
     SaveMRUList(Self, RegKey_DescriptionList, MaxMRU, cmbDescription);
end;

procedure TFrmMiscItem.AssignItemNumberList(const AList: TStringList);
begin
  FSaveItemNumberMRU := False;
  cmbItemNumber.Items.Clear;
  if Assigned(AList) then
     cmbItemNumber.Items.AddStrings(AList);
end;

procedure TFrmMiscItem.AssignDescriptionList(const AList: TStringList);
begin
  FSaveItemDescripMRU := False;
  cmbDescription.Items.Clear;
  if Assigned(AList) then
     cmbDescription.Items.AddStrings(AList);
end;

procedure TFrmMiscItem.LoadUOMList;
begin
  cmbUOM.Items.Clear;
  with TFDQuery.Create(NIL) do
  try
     Connection := UniMainModule.FDConnection1;
     // SQL.Add('SELECT DISTINCT uom FROM arinvt_uom ORDER BY uom');
     SQL.Add('SELECT uom FROM arinvt_uom ORDER BY seq, uom');
     Open;
     while not EOF do
      begin
        cmbUOM.Items.Add(Fields[0].AsString);
        Next;
      end;
  finally
     Free;
  end;
end;

end.
