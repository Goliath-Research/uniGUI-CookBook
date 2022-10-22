unit rma_pick_labels;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
//  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame;

type
  TPickLabelCargo = class
    Qty: Real;
    constructor Create( AQty: Real );
  end;

  TFrmRMA_PickLabels = class(TUniForm)
    Panel2: TUniPanel;
    IQSearch1: TIQUniGridControl;
    Panel1: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    SrcMasterLabels: TDataSource;
    QryMasterLabels: TFDQuery;
    QryMasterLabelsID: TBCDField;
    QryMasterLabelsSERIAL: TStringField;
    QryMasterLabelsQTY: TFMTBCDField;
    QryMasterLabelsLOC_DESC: TStringField;
    QryMasterLabelsFG_LOTNO: TStringField;
    procedure QryMasterLabelsBeforeOpen(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FArinvt_ID      : Real;
    FBatch          : Real;
    FShipment_Dtl_ID: Real;
    FList           : TStringList;
    procedure Validate;

    procedure SetArinvt_ID(Value : Real);
    function GetArinvt_ID: Real;
    procedure SetBatch(Value : Real);
    function GetBatch: Real;
    procedure SetShipment_Dtl_ID(Value : Real);
    function GetShipment_Dtl_ID: Real;

  public
    { Public declarations }
    property Arinvt_ID: Real read GetArinvt_ID write SetArinvt_ID;
    property Batch: Real read GetBatch write SetBatch;
    property Shipment_Dtl_ID: Real read GetShipment_Dtl_ID write SetShipment_Dtl_ID;
    property List: TStringList read FList write FList;

    class function DoShowModal(var AList: TStringLIst; AArinvt_ID, ABatch, AShipment_Dtl_ID: Real ): Boolean;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous;

{ TFrmRMA_PickLabels }

procedure TFrmRMA_PickLabels.UniFormCreate(Sender: TObject);
begin

  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self ]);
{ TODO -oLema : Unknown properties IqSearch1.SearchField , IqSearch1.AssignSearchField }
//  if IqSearch1.SearchField = '' then
//    IqSearch1.AssignSearchField( QryMasterLabelsSERIAL );

end;


class function TFrmRMA_PickLabels.DoShowModal(var AList: TStringList; AArinvt_ID, ABatch, AShipment_Dtl_ID: Real): Boolean;
var
  frm : TFrmRMA_PickLabels;
begin
  frm := TFrmRMA_PickLabels.Create(uniGUIApplication.UniApplication);
  frm.List := AList;
  frm.Arinvt_ID := AArinvt_ID;
  frm.Batch := ABatch;
  frm.Shipment_Dtl_ID := AShipment_Dtl_ID;
  Result:= (frm.ShowModal = mrOK);

end;

procedure TFrmRMA_PickLabels.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

function TFrmRMA_PickLabels.GetArinvt_ID: Real;
begin
  Result := FArinvt_ID;
end;

function TFrmRMA_PickLabels.GetBatch: Real;
begin
  Result := FBatch;
end;

function TFrmRMA_PickLabels.GetShipment_Dtl_ID: Real;
begin
   Result := FShipment_Dtl_ID;
end;

procedure TFrmRMA_PickLabels.QryMasterLabelsBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
  begin
    ParamByName('arinvt_id').Value := FArinvt_ID;
    ParamByName('batch').Value := FBatch;
    ParamByName('shipment_dtl_id').Value := FShipment_Dtl_ID;
  end;
end;

procedure TFrmRMA_PickLabels.SetArinvt_ID(Value: Real);
begin
   FArinvt_ID := Value;
end;

procedure TFrmRMA_PickLabels.SetBatch(Value: Real);
begin
   FBatch := Value;
end;

procedure TFrmRMA_PickLabels.SetShipment_Dtl_ID(Value: Real);
begin
   FShipment_Dtl_ID := Value;
end;


procedure TFrmRMA_PickLabels.Validate;
begin
  IQAssert( not (QryMasterLabels.Eof and QryMasterLabels.Bof), 'Nothing is selected - cannot continue.' );
end;

procedure TFrmRMA_PickLabels.btnOKClick(Sender: TObject);
var
  I: Integer;

  procedure AddToList;
  begin
    with IQSearch1 do
         FList.AddObject( Datasource.DataSet.FieldByName('ID').asString,
                          TPickLabelCargo.Create( Datasource.DataSet.FieldByName('qty').asFloat ));
  end;

begin
  Validate;

  with IQSearch1 do
  try
     Datasource.DataSet.DisableControls;
     if Datasource.DataSet.Eof and Datasource.DataSet.Bof then
        EXIT;

     if DBGrid.SelectedRows.Count > 0 then
        for I:= 0 to DBGrid.SelectedRows.Count - 1 do
        begin
          Datasource.DataSet.GotoBookmark( DBGrid.SelectedRows.Items[ I ]);
          AddToList;
        end
     else
        AddToList;
  finally
     Datasource.DataSet.EnableControls;
  end;

  ModalResult:= mrOK;
end;

{ TPickLabelCargo }

constructor TPickLabelCargo.Create(AQty: Real);
begin
  Qty:= AQty;
end;

end.
