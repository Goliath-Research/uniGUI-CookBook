unit crm_soconfig_choice_replace;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TFrmCRMConfigChoiceReplace = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    edtPrice: TUniEdit;
    edtCode: TUniEdit;
    chkReplaceCode: TUniCheckBox;
    chkReplacePrice: TUniCheckBox;
    PkSalesChoice: TIQWebHPick;
    PkSalesChoiceID: TBCDField;
    PkSalesChoiceCODE: TStringField;
    PkSalesChoiceDESCRIP: TStringField;
    procedure chkReplaceCodeClick(Sender: TObject);
    procedure chkReplacePriceClick(Sender: TObject);
    procedure edtCodeCustomDlg(Sender: TObject);
  private
    { Private declarations }
    FOrigSalesChoiceID: Real;
    FOrigPrice: Real;
    FNewSalesChoiceID: Real;
    procedure UpdateSalesChoiceDisplay;
    function GetPrice: Real;
    procedure SetPrice(const Value: Real);
    procedure SetSalesChoiceID(const Value: Real);
    function GetModified: Boolean;
    function GetChangePrice: Boolean;
    function GetChangeSalesChoiceID: Boolean;
  public
    { Public declarations }


    property SalesChoiceID: Real read FNewSalesChoiceID write SetSalesChoiceID;
    property Price: Real read GetPrice write SetPrice;

    property ChangeSalesChoiceID: Boolean read GetChangeSalesChoiceID;
    property ChangePrice: Boolean read GetChangePrice;

    property Modified: Boolean read GetModified;
  end;

  function ReplaceCRMConfigChoice(var ASalesChoiceID: Real;
     var APrice: Real; var AChangeSalesChoiceID: Boolean;
     var AChangePrice: Boolean): Boolean;



implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers;


function ReplaceCRMConfigChoice(var ASalesChoiceID: Real;
   var APrice: Real; var AChangeSalesChoiceID: Boolean;
   var AChangePrice: Boolean): Boolean;
var
  FrmCRMConfigChoiceReplace: TFrmCRMConfigChoiceReplace;
begin
  FrmCRMConfigChoiceReplace := TFrmCRMConfigChoiceReplace.Create(uniGUIApplication.UniApplication);
  with FrmCRMConfigChoiceReplace do
  begin
    try
       // Save for later
      FOrigSalesChoiceID := ASalesChoiceID;
      FOrigPrice := APrice;

      // Update property and screen values
      SalesChoiceID := ASalesChoiceID;
      Price := APrice;
      Result := ShowModal = mrOk;

      if Result then
        begin
          ASalesChoiceID := SalesChoiceID;
          APrice := Price;
          AChangeSalesChoiceID := ChangeSalesChoiceID;
          AChangePrice := ChangePrice;
        end;
    finally
      //Free;
    end;
  end;
end;


{ TFrmCRMConfigChoiceReplace }

function TFrmCRMConfigChoiceReplace.GetModified: Boolean;
begin
  Result := ChangeSalesChoiceID or ChangePrice;
end;

function TFrmCRMConfigChoiceReplace.GetPrice: Real;
var
   s: String;
   r: Real;
begin
  s := edtPrice.Text;
  if IQMS.Common.Numbers.IsStringValidFloat(s, r) then
     Result := r
  else
     Result := 0;
end;

procedure TFrmCRMConfigChoiceReplace.SetPrice(const Value: Real);
begin
  edtPrice.Text := FormatFloat1000SeparatorA(Value);
end;

procedure TFrmCRMConfigChoiceReplace.SetSalesChoiceID(const Value: Real);
begin
  FNewSalesChoiceID := Value;
  UpdateSalesChoiceDisplay;
end;

procedure TFrmCRMConfigChoiceReplace.UpdateSalesChoiceDisplay;
begin
  edtCode.Text := SelectValueFmtAsString('SELECT code FROM sales_choice WHERE id = %.0f',
   [FNewSalesChoiceID]);
end;

procedure TFrmCRMConfigChoiceReplace.chkReplaceCodeClick(Sender: TObject);
begin
  Application.ProcessMessages;
  IQMS.Common.Controls.IQEnableControl(edtCode, chkReplaceCode.Checked);
end;

procedure TFrmCRMConfigChoiceReplace.chkReplacePriceClick(Sender: TObject);
begin
  Application.ProcessMessages;
  IQMS.Common.Controls.IQEnableControl(edtPrice, chkReplacePrice.Checked);
end;

function TFrmCRMConfigChoiceReplace.GetChangeSalesChoiceID: Boolean;
begin
  Result := chkReplaceCode.Checked; // and (FOrigSalesChoiceID <> FNewSalesChoiceID);
end;

function TFrmCRMConfigChoiceReplace.GetChangePrice: Boolean;
begin
  Result := chkReplacePrice.Checked; // and (FOrigPrice <> Price);
end;

procedure TFrmCRMConfigChoiceReplace.edtCodeCustomDlg(Sender: TObject);
begin
  with PkSalesChoice do
    if Execute then
      SalesChoiceID := GetValue('ID');
end;

end.
