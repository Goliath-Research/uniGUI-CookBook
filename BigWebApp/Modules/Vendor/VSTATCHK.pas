unit VStatChk;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  Data.DB,
  Mask,
  System.Math,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniCheckBox,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TFrmVendStatusException = class(TUniForm)
    Query1: TFDQuery;
    DataSource1: TDataSource;
    SR: TIQWebSecurityRegister;
    PnlButton: TUniPanel;
    Button1: TUniButton;
    PnlCarrier: TUniPanel;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    PnlDisplay: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft: TUniPanel;
    lblVendor: TUniLabel;
    lblCompany: TUniLabel;
    lblStatus: TUniLabel;
    PnlClient: TUniPanel;
    DBEdit1: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    DBEdit3: TUniDBEdit;
    chkIgnore: TUniCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FVendor_ID: Real;
    { Private declarations }
    procedure PrepareQuery(AID: Real);
    procedure SetVendor_ID(const Value: Real);
  public
    { Public declarations }
    property Vendor_ID: Real write SetVendor_ID;
  end;

procedure CheckVendStatusFor(AVendor_ID: Real; const AStatus: array of string);



implementation

{$R *.DFM}


uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //IQSecIns,
  vendor_rscstr;

procedure CheckVendStatusFor(AVendor_ID: Real; const AStatus: array of string);
var
  S: string;
  i: Integer;
  FrmVendStatusException: TFrmVendStatusException;
begin
  S := Trim(SelectValueFmtAsString(
    'select status_id from vendor where id = %f',
    [AVendor_ID]));
  for i := low(AStatus) to high(AStatus) do
    if CompareText(S, AStatus[i]) = 0 then
    begin
      FrmVendStatusException := TFrmVendStatusException.Create(UniGUIApplication.UniApplication);
      with FrmVendStatusException do
      begin
        try
          Vendor_ID := AVendor_ID;
          if not ((ShowModal = mrOK) and chkIgnore.Checked) then
            //'Status exception has not been authorized.  Cannot proceed';
            raise Exception.Create(vendor_rscstr.cTXT0000015);
        finally
          //Release;
        end;
      end;
    end;
end;

procedure TFrmVendStatusException.FormShow(Sender: TObject);
begin
  IQRegFormRead(Self, [Self]);
  { TODO -oSanketG -cWebConvert : Need to revisit , dependent on IQSecIns}
  //EnsureSecurityInspectorOnTopOf(Self);

  //Compensate for translation
  PnlLeft.Width := 12 + Round(MaxIntValue([lblVendor.Width, lblCompany.Width, lblStatus.Width]));
end;

procedure TFrmVendStatusException.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self]);
end;

procedure TFrmVendStatusException.PrepareQuery(AID: Real);
begin
  with Query1 do
  begin
    Close;
    ParamByName('ID').Value := AID;
    Open;
  end;
end;


procedure TFrmVendStatusException.SetVendor_ID(const Value: Real);
begin
  FVendor_ID := Value;
  PrepareQuery(FVendor_ID);
end;

end.
