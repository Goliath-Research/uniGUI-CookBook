unit ps_void_pick_labels;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
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
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, IQUniGrid, uniGUIFrame;

type
  TPSVoidPickLabelCargo = class
    Qty: Real;
    constructor Create(AQty: Real);
  end;

  TFrmPSVoid_PickLabels = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    IQSearch1: TIQUniGridControl;
    SrcMasterLabels: TDataSource;
    QryMasterLabels: TFDQuery;
    QryMasterLabelsID: TBCDField;
    QryMasterLabelsSERIAL: TStringField;
    QryMasterLabelsQTY: TFMTBCDField;
    QryMasterLabelsLOC_DESC: TStringField;
    QryMasterLabelsFG_LOTNO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryMasterLabelsBeforeOpen(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FArinvt_ID: Real;
    FBatch: Real;
    FShipment_Dtl_ID: Real;
    FShipments_ID: Real;
    FList: TStringList;
    FSilent: Boolean;
    procedure Validate;
    procedure SetArinvt_ID(const Value: Real);
    procedure SetBatch(const Value: Real);
    procedure SetList(const Value: TStringList);
    procedure SetShipment_Dtl_ID(const Value: Real);
    procedure SetShipments_ID(const Value: Real);
  public
    { Public declarations }

    property List : TStringList write SetList;
    property Arinvt_ID: Real write SetArinvt_ID;
    property Batch: Real write SetBatch;
    property Shipment_Dtl_ID: Real write SetShipment_Dtl_ID;
    property Shipments_ID: Real write SetShipments_ID;

    class function DoShowModal(var AList: TStringList;
      AArinvt_ID, ABatch, AShipment_Dtl_ID, AShipments_ID: Real): Boolean;
    class procedure DoGetAllSilent(var AList: TStringList;
      AArinvt_ID, ABatch, AShipment_Dtl_ID, AShipments_ID: Real);
   end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  packslip_rscstr;

{ TPSVoidPickLabelCargo }

constructor TPSVoidPickLabelCargo.Create(AQty: Real);
begin
  Qty := AQty;
end;

class function TFrmPSVoid_PickLabels.DoShowModal(var AList: TStringList;
  AArinvt_ID, ABatch, AShipment_Dtl_ID, AShipments_ID: Real): Boolean;
var
  LFrmPSVoid_PickLabels : TFrmPSVoid_PickLabels;
begin
  LFrmPSVoid_PickLabels := TFrmPSVoid_PickLabels.Create(UniGUIApplication.UniApplication);
  LFrmPSVoid_PickLabels.Arinvt_ID := AArinvt_ID;
  LFrmPSVoid_PickLabels.Batch := ABatch;
  LFrmPSVoid_PickLabels.Shipment_Dtl_ID := AShipment_Dtl_ID;
  LFrmPSVoid_PickLabels.Shipments_ID := AShipments_ID;
  LFrmPSVoid_PickLabels.List := AList;
  Result := LFrmPSVoid_PickLabels.ShowModal = mrOK;
end;

class procedure TFrmPSVoid_PickLabels.DoGetAllSilent(var AList: TStringList;
  AArinvt_ID, ABatch, AShipment_Dtl_ID, AShipments_ID: Real);
var
  LFrmPSVoid_PickLabels : TFrmPSVoid_PickLabels;
begin
  LFrmPSVoid_PickLabels := TFrmPSVoid_PickLabels.Create(UniGUIApplication.UniApplication);
  LFrmPSVoid_PickLabels.Arinvt_ID := AArinvt_ID;
  LFrmPSVoid_PickLabels.Batch := ABatch;
  LFrmPSVoid_PickLabels.Shipment_Dtl_ID := AShipment_Dtl_ID;
  LFrmPSVoid_PickLabels.Shipments_ID := AShipments_ID;
  LFrmPSVoid_PickLabels.List := AList;
  LFrmPSVoid_PickLabels.FSilent := true;
{ TODO -oGPatil -cWebConvert : TUniDbGrid does not contain SelectAll
  IQSearch1.DBGrid.SelectAll;  }
  LFrmPSVoid_PickLabels.btnOKClick(nil);
end;

procedure TFrmPSVoid_PickLabels.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
end;

procedure TFrmPSVoid_PickLabels.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmPSVoid_PickLabels.QryMasterLabelsBeforeOpen(
  DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'arinvt_id', Trunc(FArinvt_ID));
  AssignQueryParamValue(DataSet, 'batch', Trunc(FBatch));
  AssignQueryParamValue(DataSet, 'shipment_dtl_id', Trunc(FShipment_Dtl_ID));
  AssignQueryParamValue(DataSet, 'shipments_id', Trunc(FShipments_ID));
end;

procedure TFrmPSVoid_PickLabels.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
end;

procedure TFrmPSVoid_PickLabels.SetBatch(const Value: Real);
begin
  FBatch := Value;
end;

procedure TFrmPSVoid_PickLabels.SetList(const Value: TStringList);
begin
  FList := Value;
end;

procedure TFrmPSVoid_PickLabels.SetShipments_ID(const Value: Real);
begin
  FShipments_ID := Value;
end;

procedure TFrmPSVoid_PickLabels.SetShipment_Dtl_ID(const Value: Real);
begin
  FShipment_Dtl_ID := Value;
end;

procedure TFrmPSVoid_PickLabels.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
end;

procedure TFrmPSVoid_PickLabels.Validate;
begin
  //packslip_rscstr.cTXT0000226 = 'Please select a label record.';
  if not FSilent then
    IQAssert(not (QryMasterLabels.Eof and QryMasterLabels.Bof),
      packslip_rscstr.cTXT0000226);
end;

procedure TFrmPSVoid_PickLabels.btnOKClick(Sender: TObject);
var
  I: Integer;

  procedure AddToList;
  begin
    with IQSearch1 do
      FList.AddObject(Datasource.DataSet.FieldByName('ID').asString,
        TPSVoidPickLabelCargo.Create(Datasource.DataSet.FieldByName('qty').asFloat));
  end;

begin
  Validate;

  with IQSearch1 do
    try
      Datasource.DataSet.DisableControls;
      if Datasource.DataSet.Eof and Datasource.DataSet.Bof then
        EXIT;
{ TODO -oGPatil -cWebConvert : TUniDbGrid does not contain SelectedList
      if DBGrid.SelectedList.Count > 0 then
        for I := 0 to DBGrid.SelectedList.Count - 1 do
        begin
          Datasource.DataSet.GotoBookmark(DBGrid.SelectedList.Items[I]);
          AddToList;
        end
      else
        AddToList;  }
    finally
      Datasource.DataSet.EnableControls;
    end;

  ModalResult := mrOK;
end;

end.
