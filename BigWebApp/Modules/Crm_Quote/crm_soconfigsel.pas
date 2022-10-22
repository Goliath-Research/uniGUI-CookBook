unit crm_soconfigsel;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Buttons,
  IQMS.WebVcl.Search,
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
  uniButton,
  uniBitBtn,
  uniPanel,
  uniDateTimePicker,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, IQUniGrid, uniGUIFrame;

type
  TFrmCRMSelectSalesConfigTemplate = class(TUniForm)
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    SrcData: TDataSource;
    QryData: TFDQuery;
    Grid: TIQUniGridControl;
    PnlDatesLeft: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Splitter1: TUniSplitter;
    PnlDatesClient: TUniPanel;
    dtRequested: TUniDateTimePicker;
    dtPromised: TUniDateTimePicker;
    Panel1: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    QryDataID: TBCDField;
    QryDataDESCRIP: TStringField;
    QryDataARINVT_ITEMNO: TStringField;
    QryDataARINVT_DESCRIP: TStringField;
    QryDataARINVT_CLASS: TStringField;
    QryDataARINVT_REV: TStringField;
    QryDataPRICE: TFMTBCDField;
    QryDataARINVT_DESCRIP2: TStringField;
    QryDataEPLANT_ID: TBCDField;
    QryDataEPLANT_NAME: TStringField;
    procedure DoOKBtnClick(Sender: TObject);
    procedure dtRequestedChange(Sender: TObject);
    procedure dtPromisedChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridUserBtn1OnClick(Sender: TObject);
    procedure QryDataBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FRequestedDate_WasChanged, FPromisedDate_WasChanged: Boolean;
    FPkHide: Boolean;
    procedure SetButtonHint;
  public
    { Public declarations }
  end;

function DoSelectSalesConfigurationTemplate(var ATemplateID: Real;
  var ARequestedDate, APromisedDate: TDateTime): Boolean;

implementation

{$R *.dfm}

uses
  IQMS.Common.Dialogs,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.ResourceStrings,
  crm_rscstr;

function DoSelectSalesConfigurationTemplate(var ATemplateID: Real;
  var ARequestedDate, APromisedDate: TDateTime): Boolean;
var
  FrmCRMSelectSalesConfigTemplate: TFrmCRMSelectSalesConfigTemplate;
begin
  FrmCRMSelectSalesConfigTemplate := TFrmCRMSelectSalesConfigTemplate.Create(uniGUIApplication.UniApplication);
  with FrmCRMSelectSalesConfigTemplate do
  begin
    try
      // Have any Sales Configuration templates been created yet?
      if not QryData.Active then
        QryData.Open;
      if (QryData.Bof and QryData.Eof) then
      begin
        IQInformation
          (crm_rscstr.
          cTXT0001312 { 'No Sales Configuration Templates have been created.' } );
        Exit;
      end;

      // Show the form
      Result := ShowModal = mrOk;

      // Pass values
      if Result then
      begin
        ATemplateID := QryDataID.AsFloat;
        ARequestedDate := dtRequested.DateTime;
        APromisedDate := dtPromised.DateTime;
      end;
    finally
      // Release;
    end;
  end;
end;

procedure TFrmCRMSelectSalesConfigTemplate.FormCreate(Sender: TObject);
begin
  // Open datasets and read the form
  FPkHide := TRUE;
  ReOpen(QryData);

  // Set the dates to today.  In the OK click we check the dates.
  dtRequested.DateTime := Trunc(Date);
  dtPromised.DateTime := Trunc(Date);
  FRequestedDate_WasChanged := FALSE;
  FPromisedDate_WasChanged := FALSE;
  SetButtonHint;
end;

procedure TFrmCRMSelectSalesConfigTemplate.FormShow(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to find alternative for wwDBGrid in TIQUniGridControl }
  // IQRegFormRead(Self, [Self, Grid.wwDBGrid, PnlDatesLeft]); // IQMS.Common.RegFrm.pas
end;

procedure TFrmCRMSelectSalesConfigTemplate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  { TODO -oSanketG -cWebConvert : Need to find alternative for wwDBGrid in TIQUniGridControl }
  // IQRegFormWrite(Self, [Self, Grid.wwDBGrid, PnlDatesLeft]); // IQMS.Common.RegFrm.pas
end;

procedure TFrmCRMSelectSalesConfigTemplate.DoOKBtnClick(Sender: TObject);
begin

  // Ensure an item is selected
  if QryDataID.AsFloat = 0 then
    raise Exception.Create
      (crm_rscstr.cTXT0001075 { 'Please select an item from the list.' } );

  // Check the dates
  // crm_rscstr.cTXT0001313 =
  // 'Are the Requested Date and the Promised Date correct?'
  if (not FRequestedDate_WasChanged or not FPromisedDate_WasChanged) and
    not IQConfirmYN(crm_rscstr.cTXT0001313) then
    Exit;

  // crm_rscstr.cTXT0001314 =
  // 'Your Promised Date is set to today.  Is this correct?'
  if (Trunc(dtPromised.DateTime) = Trunc(Date)) and
    not IQConfirmYN(crm_rscstr.cTXT0001314) then
    Exit;

  // Pass result
  ModalResult := mrOk;
  // NOTE:  Do NOT set the ModalResult property on the button!

end;

procedure TFrmCRMSelectSalesConfigTemplate.dtRequestedChange(Sender: TObject);
begin
  FRequestedDate_WasChanged := TRUE;
end;

procedure TFrmCRMSelectSalesConfigTemplate.dtPromisedChange(Sender: TObject);
begin
  FPromisedDate_WasChanged := TRUE;
end;

procedure TFrmCRMSelectSalesConfigTemplate.GridUserBtn1OnClick(Sender: TObject);
begin
  FPkHide := not FPkHide;
  ReOpen(QryData);
  SetButtonHint;
end;

procedure TFrmCRMSelectSalesConfigTemplate.QryDataBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'PK_HIDE', sIIf(FPkHide, 'N', 'Y'));
end;

procedure TFrmCRMSelectSalesConfigTemplate.SetButtonHint;
var
  S: string;
begin
  S := sIIf(FPkHide,
    IQMS.WebVcl.ResourceStrings.
    cTXT0000045 { 'Showing active only.'#13'Click to toggle.' } ,
    IQMS.WebVcl.ResourceStrings.
    cTXT0000044 { 'Showing inactive only.'#13'Click to toggle.' } );
  { TODO -oSanketG -cWebConvert : Need to find alternative for UserBtn1Hint in TIQUniGridControl }
  // Grid.UserBtn1Hint := S;
end;

end.
