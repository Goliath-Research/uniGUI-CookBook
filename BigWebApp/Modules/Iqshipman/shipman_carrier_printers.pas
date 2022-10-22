unit shipman_carrier_printers;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Buttons,
  Mask,
  shipman_common,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TFrmShipManCarrierPrinters = class(TUniForm)
    QryPrinters: TFDQuery;
    QryPrintersNAME: TStringField;
    QryPrintersID: TBCDField;
    QryPrintersPRINTER: TStringField;
    QryPrintersEPLANT_ID: TBCDField;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    PnlSelectBtns: TUniPanel;
    PnlEditCtrls: TUniPanel;
    sbtnSelectLabelPrinter: TUniSpeedButton;
    sbtnSelectReportPrinter: TUniSpeedButton;
    edtLabelPrinter: TUniEdit;
    edtReportPrinter: TUniEdit;
    lblLabelPrinter: TUniLabel;
    lblReportPrinter: TUniLabel;
    PkLabelPrn: TIQWebHPick;
    PkReportPrn: TIQWebHPick;
    procedure QryPrintersBeforeOpen(DataSet: TDataSet);
    procedure DoSelectLabelPrinter(Sender: TObject);
    procedure DoSelectReportPrinter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApplyEPlantFilterBeforeOpen(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FOrigLabelPrinterID,
    FOrigReportPrinterID: Real;
    FNewLabelPrinterID,
    FNewReportPrinterID: Real;
    FCarrierType: TCarrierType;
    procedure ApplyOriginalValues;
    function ValuesChanged: Boolean;
    procedure SetControls;
    procedure SetCarrierType(const Value: TCarrierType);
    procedure SetLabelPrinterID(const Value: Real);
    procedure SetReportPrinterID(const Value: Real);
  public
    { Public declarations }

    property CarrierType: TCarrierType write SetCarrierType;
    property LabelPrinterID: Real write SetLabelPrinterID;
    property ReportPrinterID: Real write SetReportPrinterID;
  end;

  function DoCarrierPrinters(const ACarrierType: TCarrierType;
   var ALabelPrinterID: Real;
   var AReportPrinterID: Real): Boolean;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Controls;

function DoCarrierPrinters(const ACarrierType: TCarrierType; var ALabelPrinterID: Real;
 var AReportPrinterID: Real): Boolean;
var
  LFrmShipManCarrierPrinters : TFrmShipManCarrierPrinters;
begin
  LFrmShipManCarrierPrinters := TFrmShipManCarrierPrinters.Create(UniGUIApplication.UniApplication);
  LFrmShipManCarrierPrinters.CarrierType := ACarrierType;
  LFrmShipManCarrierPrinters.LabelPrinterID := ALabelPrinterID;
  LFrmShipManCarrierPrinters.ReportPrinterID := ALabelPrinterID;
  Result := (LFrmShipManCarrierPrinters.ShowModal = mrOk) and LFrmShipManCarrierPrinters.ValuesChanged;
  if Result then
     begin
       if LFrmShipManCarrierPrinters.FNewLabelPrinterID > 0 then
          ALabelPrinterID := LFrmShipManCarrierPrinters.FNewLabelPrinterID;
       if LFrmShipManCarrierPrinters.FNewReportPrinterID > 0 then
          AReportPrinterID := LFrmShipManCarrierPrinters.FNewReportPrinterID;
     end;
end;

procedure TFrmShipManCarrierPrinters.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self, PnlLeft01]);
end;

procedure TFrmShipManCarrierPrinters.ApplyOriginalValues;
begin
  edtLabelPrinter.Text := shipman_common.GetPrinterName(FOrigLabelPrinterID);
  edtReportPrinter.Text := shipman_common.GetPrinterName(FOrigReportPrinterID);
end;

function TFrmShipManCarrierPrinters.ValuesChanged: Boolean;
begin
  Result := (FNewLabelPrinterID > 0) and
            (FNewLabelPrinterID <> FOrigLabelPrinterID);

  if not Result then
     Result := (FNewReportPrinterID > 0) and
               (FNewReportPrinterID <> FOrigReportPrinterID);
end;

procedure TFrmShipManCarrierPrinters.ApplyEPlantFilterBeforeOpen(
  DataSet: TDataSet);
begin
  IQAssignEPlantFilter(DataSet);
  DataSet.Filtered := True;
end;

procedure TFrmShipManCarrierPrinters.QryPrintersBeforeOpen(
  DataSet: TDataSet);
begin
  IQAssignEPlantFilter(DataSet);
  DataSet.Filtered := True;

   begin
     // Filter printer types by carrier

     // FedEx
     if (FCarrierType = ctFedExGround) or
        (FCarrierType = ctFedExExpress) or
        (FCarrierType = ctFedExSmartPost) or
        (FCarrierType = ctUPS) then
        begin
          AssignQueryParamValue(DataSet, 'PRINTER_TYPE', '_2_3_4_'); // all standard label printer types
          AssignQueryParamValue(DataSet, 'BY_TYPE', 1);
        end

     // USPS
     else if (FCarrierType = ctUSPS) then
      begin
        AssignQueryParamValue(DataSet, 'PRINTER_TYPE', '_1_'); // laser only
        AssignQueryParamValue(DataSet, 'BY_TYPE', 1);
      end

     // Default
     else
      begin
        AssignQueryParamValue(DataSet, 'PRINTER_TYPE', '');
        AssignQueryParamValue(DataSet, 'BY_TYPE', 0);
      end;

   end;
end;

procedure TFrmShipManCarrierPrinters.SetCarrierType(const Value: TCarrierType);
begin
  FCarrierType := Value;
end;

procedure TFrmShipManCarrierPrinters.SetControls;
begin
  if (FCarrierType = ctUSPS) then
     IQMS.Common.Controls.IQShowControl([lblLabelPrinter,edtLabelPrinter,sbtnSelectLabelPrinter],False);
end;

procedure TFrmShipManCarrierPrinters.SetLabelPrinterID(const Value: Real);
begin
  FOrigLabelPrinterID := Value;
end;

procedure TFrmShipManCarrierPrinters.SetReportPrinterID(const Value: Real);
begin
  FOrigReportPrinterID := Value;
end;

procedure TFrmShipManCarrierPrinters.UniFormCreate(Sender: TObject);
begin
  FNewLabelPrinterID := 0;
  FNewReportPrinterID := 0;
  ApplyOriginalValues;
  SetControls;
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, PnlLeft01]);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlEditCtrls,2);
end;

procedure TFrmShipManCarrierPrinters.DoSelectLabelPrinter(Sender: TObject);
begin
 // Select Label Printer
 with PkLabelPrn do
  if Execute then
     begin
       FNewLabelPrinterID := GetValue('ID');
       edtLabelPrinter.Text := GetPrinterName(FNewLabelPrinterID);
     end;
end;

procedure TFrmShipManCarrierPrinters.DoSelectReportPrinter(
  Sender: TObject);
begin
 // Select Report Printer
 with PkReportPrn do
  if Execute then
     begin
       FNewReportPrinterID := GetValue('ID');
       edtReportPrinter.Text := GetPrinterName(FNewLabelPrinterID);
     end;
end;

end.
