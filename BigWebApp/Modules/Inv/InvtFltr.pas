unit InvtFltr;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  InvtClas,
  Data.DB,
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
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniPanel,
  uniSplitter,
  uniGroupBox,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniLabel, Vcl.StdCtrls, uniButton, uniComboBox, uniDBComboBox, uniGUIApplication;

type
  TFrmInvClassFilter = class(TFrmInvClass)
    rbtnClass: TUniRadioButton;
    rbtnManu: TUniRadioButton;
    rbtnPurch: TUniRadioButton;
    rbtnAllItems: TUniRadioButton;
    GroupBox1: TUniGroupBox;
    wwQryDivision: TFDQuery;
    wwQryDivisionNAME: TStringField;
    wwQryDivisionEPLANT_NAME: TStringField;
    wwQryDivisionID: TBCDField;
    wwQryBuyerCode: TFDQuery;
    wwQryBuyerCodeBUYER_CODE: TStringField;
    wwQryBuyerCodeDESCRIP: TStringField;
    wwQryBuyerCodeID: TBCDField;
    PnlClient02: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient01: TUniPanel;
    Label2: TUniLabel;
    Label5: TUniLabel;
    wwLookupDivision: TUniDBLookupComboBox;
    wwLookupBuyerCode: TUniDBLookupComboBox;
    DivisionSrc: TDataSource;
    BuyerCodeSrc: TDataSource;
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EnableInventoryControls(Sender: TObject);
  private
    { Private declarations }
    FInvClassFilter: TInvClassFilter;

    function GetFilterVisible: boolean;
    procedure SetFilterVisible(const Value: boolean);
    function GetSelectedDivision: string;
    procedure SetSelectedDivision(const Value: string);
    function GetSelectedBuyerCode: string;
    procedure SetSelectedBuyerCode(const Value: string);
  public
    { Public declarations }

    procedure InitFrom( AInvClassFilter: TInvClassFilter ); virtual;

    property FilterVisible     : boolean read GetFilterVisible     write SetFilterVisible;
    property SelectedDivision  : string  read GetSelectedDivision  write SetSelectedDivision;
    property SelectedBuyerCode : string  read GetSelectedBuyerCode write SetSelectedBuyerCode;
    property InvClassFilter    : TInvClassFilter read FInvClassFilter write FInvClassFilter;
  end;

function GetInventoryClassFilter( var AInvClassFilter: TInvClassFilter; AHideDetails: Boolean = FALSE ):Boolean;
function InventoryClassFilterChanged( AInvClassFilter, FInvClassFilter: TInvClassFilter ): Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.Numbers,
  IQMS.Common.DataLib,
  IQMS.Common.SysShare,
//  Sys_Share,
  IQMS.Common.RegFrm,
  IQMS.Common.Controls;

function GetInventoryClassFilter( var AInvClassFilter: TInvClassFilter; AHideDetails: Boolean = FALSE ):Boolean;
var
  LFrmInvClassFilter : TFrmInvClassFilter;
begin
  LFrmInvClassFilter := TFrmInvClassFilter.Create( UniGUIApplication.UniApplication );
  LFrmInvClassFilter.FilterVisible  := not AHideDetails;

  LFrmInvClassFilter.InitFrom(AInvClassFilter);

  Result := LFrmInvClassFilter.ShowModal = mrOK;

  if Result then
    with AInvClassFilter do
    begin
      Kind         := LFrmInvClassFilter.InvClassFilter.Kind;
      InvClass     := LFrmInvClassFilter.InvClassFilter.InvClass;
      Division_ID  := LFrmInvClassFilter.InvClassFilter.Division_ID;
      Buyer_Code_ID:= LFrmInvClassFilter.InvClassFilter.Buyer_Code_ID;
    end;
end;

function InventoryClassFilterChanged( AInvClassFilter, FInvClassFilter: TInvClassFilter ): Boolean;
begin
  Result :=
    (AInvClassFilter.Kind        <> FInvClassFilter.Kind) or
    (AInvClassFilter.InvClass    <> FInvClassFilter.InvClass) or
    (AInvClassFilter.Division_ID <> FInvClassFilter.Division_ID);
end;

procedure TFrmInvClassFilter.FormCreate(Sender: TObject);
begin
  inherited;

  with Label2 do
    Caption := CheckReplaceDivisionCaption( Caption ); {Sys_Share.pas}
//  with wwLookupDivision do CheckReplaceDivisionOfWWSelected( Selected  );

  IQRegFormRead(Self, [PnlLeft01]);
end;

function TFrmInvClassFilter.GetFilterVisible: boolean;
begin
  Result := GroupBox1.Visible;
end;

function TFrmInvClassFilter.GetSelectedBuyerCode: string;
begin
  Result := wwLookupBuyerCode.Text;
end;

function TFrmInvClassFilter.GetSelectedDivision: string;
begin
  Result := wwLookupDivision.Text;
end;

procedure TFrmInvClassFilter.btnOKClick(Sender: TObject);
begin
  if rbtnClass.Checked then
     inherited
  else
    ModalResult:= mrOK;

  with FInvClassFilter do
  begin
    if rbtnClass.Checked then
      begin
        Kind    := ifClass;
        InvClass:= wwLookupClass.Text;
      end

    else if rbtnManu.Checked then
      Kind:= ifManufactured

    else if rbtnPurch.Checked then
      Kind:= ifPurchased

    else if rbtnAllItems.Checked then
      Kind:= ifNone;

    if wwLookupDivision.Text = '' then
      Division_ID:= 0
    else
      Division_ID:= wwQryDivisionID.asFloat;

    Buyer_Code_ID:= IIf( wwLookupBuyerCode.Text = '', 0, wwQryBuyerCodeID.asFloat );
  end;
end;

procedure TFrmInvClassFilter.InitFrom( AInvClassFilter: TInvClassFilter );
begin
  with AInvClassFilter do
  begin
    case Kind of
      ifClass:
         begin
           rbtnClass.Checked:= TRUE;
           SelectedClass := InvClass;
         end;
      ifManufactured:
         begin
           rbtnManu.Checked:= TRUE;
         end;
      ifPurchased:
         begin
           rbtnPurch.Checked:= TRUE;
         end;
      ifNone:
         begin
           rbtnAllItems.Checked:= TRUE;
         end;
    end;

    if Division_ID > 0 then
    begin
      wwQryDivision.Locate('ID', Division_ID, []);
      SelectedDivision := wwQryDivisionNAME.asString;
    end;

    SelectedBuyerCode := SelectValueFmtAsString('select buyer_code from buyer_code where id = %f', [ Buyer_Code_ID ]);
  end;
end;

procedure TFrmInvClassFilter.SetFilterVisible(const Value: boolean);
begin
  GroupBox1.Visible := Value;
end;


procedure TFrmInvClassFilter.SetSelectedBuyerCode(const Value: string);
begin
  wwLookupBuyerCode.Text := Value;
end;

procedure TFrmInvClassFilter.SetSelectedDivision(const Value: string);
begin
  wwLookupDivision.Text := Value;
end;

procedure TFrmInvClassFilter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  IQRegFormWrite(Self, [PnlLeft01]);
end;

procedure TFrmInvClassFilter.EnableInventoryControls(Sender: TObject);
begin
  inherited;
  IQMS.Common.Controls.IQEnableControl( wwLookupClass, rbtnClass.Checked );
end;

end.
