unit cust_vmi_items;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  vcl.wwdatsrc,
  vcl.wwdblook,
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
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniComboBox, uniDBComboBox, IQUniGrid, uniGUIFrame;

type
  TFrmCustVMIItems = class(TUniForm)
    Bevel1: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    wwDataSource1: TDataSource;
    SR: TIQWebSecurityRegister;
    wwDBLookupInventory: TUniDBLookupComboBox;
    wwTblVMI_ARINVT: TFDTable;
    wwTblVMI_ARINVTID: TBCDField;
    wwTblVMI_ARINVTARINVT_ID: TBCDField;
    wwTblVMI_ARINVTSHIP_TO_ID: TBCDField;
    wwQryArinvt: TFDQuery;
    wwQryArinvtDESCRIP: TStringField;
    wwQryArinvtREV: TStringField;
    wwQryArinvtEPLANT_ID: TBCDField;
    wwQryArinvtEPLANT_NAME: TStringField;
    wwTblVMI_ARINVTItemno: TStringField;
    wwTblVMI_ARINVTDescrip: TStringField;
    wwTblVMI_ARINVTRev: TStringField;
    wwTblVMI_ARINVTEPlant_name: TStringField;
    wwQryArinvtID: TBCDField;
    wwDBLookupVMILocation: TUniDBLookupComboBox;
    wwQryShiptoVMILocations: TFDQuery;
    wwTblVMI_ARINVTLocationDescrip: TStringField;
    wwTblVMI_ARINVTLOCATIONS_ID: TFMTBCDField;
    wwQryShiptoVMILocationsID: TBCDField;
    wwQryShiptoVMILocationsLOC_DESC: TStringField;
    wwQryShiptoVMILocationsEPLANT_ID: TBCDField;
    wwQryArinvtITEMNO: TStringField;
    wwTblVMI_ARINVTEPLANT_ID: TFMTBCDField;
    procedure wwDBLookupInventoryBeforeDropDown(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwTblVMI_ARINVTBeforePost(DataSet: TDataSet);
    procedure wwQryShiptoVMILocationsBeforeOpen(DataSet: TDataSet);
    procedure wwDBLookupVMILocationBeforeDropDown(Sender: TObject);
    procedure wwTblVMI_ARINVTCalcFields(DataSet: TDataSet);
    procedure wwDBLookupInventoryCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure wwDBLookupVMILocationCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure wwTblVMI_ARINVTNewRecord(DataSet: TDataSet);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FShip_To_ID : real;
    FSrcShipTo: TDataSource;
    procedure SetShip_To_ID(const Value: Real);
    procedure SetSrcShipTo(const Value: TDataSource);
  public
    { Public declarations }
    property SrcShipTo : TDataSource write SetSrcShipTo;
    property Ship_To_ID : Real write SetShip_To_ID;
    class procedure ShowModeless( SrcShip_To: TDataSource; AShip_To_ID : real );
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Controls;

procedure TFrmCustVMIItems.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, wwDBGrid1 ]);
end;

procedure TFrmCustVMIItems.SetShip_To_ID(const Value: Real);
begin
  FShip_To_ID := Value;
end;

procedure TFrmCustVMIItems.SetSrcShipTo(const Value: TDataSource);
begin
  FSrcShipTo := Value;
  wwTblVMI_ARINVT.MasterSource:= FSrcShipTo;
end;

class procedure TFrmCustVMIItems.ShowModeless( SrcShip_To: TDataSource; AShip_To_ID : real);
var
  AForm: TUniForm;
  LFrmCustVMIItems : TFrmCustVMIItems;
begin
  AForm:= FindFormByClassName( 'TFrmCustVMIItems' );
  if not Assigned( AForm ) then
     LFrmCustVMIItems := TFrmCustVMIItems.Create( UniGUIApplication.UniApplication );
     with LFrmCustVMIItems do
     begin
       SrcShipTo := SrcShip_To;
       Ship_To_ID := AShip_To_ID;
       show;
     end;
end;

procedure TFrmCustVMIItems.UniFormShow(Sender: TObject);
begin
  wwTblVMI_ARINVT.Filter := Format('SHIP_TO_ID = %f', [FShip_To_ID]);
  wwTblVMI_ARINVT.Filtered:= True;
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [self, wwDBGrid1 ]);
end;

procedure TFrmCustVMIItems.wwDBLookupInventoryBeforeDropDown(Sender: TObject);
begin
  wwQryArinvt.Close;
  wwQryArinvt.Open;
end;

procedure TFrmCustVMIItems.wwDBLookupVMILocationBeforeDropDown(Sender: TObject);
begin
  wwQryShipToVMILocations.Close;
  wwQryShipToVMILocations.Open;
end;

procedure TFrmCustVMIItems.wwQryShiptoVMILocationsBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('ship_to_id').Value := FShip_To_ID;
end;

procedure TFrmCustVMIItems.wwTblVMI_ARINVTBeforePost(DataSet: TDataSet);
var
  aEplantId:Real;
begin
  if (wwTblVMI_ARINVTID.asFloat = 0) or (wwTblVMI_ARINVT.state in [dsInsert]) then
    wwTblVMI_ARINVTID.asFloat := GetNextID('VMI_ARINVT');
//  IQAssignIDBeforePost( DataSet );
//  if not (DataSet.State in [dsEdit, dsInsert]) then
//    DataSet.Edit;
  wwTblVMI_ARINVTSHIP_TO_ID.asFloat:=  FShip_To_ID;
  aEplantId := SelectValueFmtAsFloat('select eplant_id from arinvt where id = %f', [ wwTblVMI_ARINVTARINVT_ID.asFloat ]);
  if aEplantId <> 0 then
    wwTblVMI_ARINVTEPLANT_ID.asFloat := aEplantId;
end;


procedure TFrmCustVMIItems.wwTblVMI_ARINVTCalcFields(DataSet: TDataSet);
begin
  if wwTblVMI_ARINVTARINVT_ID.asFloat <> 0 then
  begin
    wwTblVMI_ARINVTItemno.asString := SelectValueByID('itemno', 'arinvt', wwTblVMI_ARINVTARINVT_ID.asFloat );
    wwTblVMI_ARINVTRev.asString := SelectValueByID('rev', 'arinvt', wwTblVMI_ARINVTARINVT_ID.asFloat );
    wwTblVMI_ARINVTDescrip.asString := SelectValueByID('descrip', 'arinvt', wwTblVMI_ARINVTARINVT_ID.asFloat );
  end;

  if wwTblVMI_ARINVTLOCATIONS_ID.asFloat <> 0 then
  begin
    wwTblVMI_ARINVTLocationDescrip.asString := SelectValueByID('descrip', 'locations', wwTblVMI_ARINVTLOCATIONS_ID.asFloat );
  end;

  if wwTblVMI_ARINVTEPLANT_ID.asFloat <> 0 then
  begin
    wwTblVMI_ARINVTEPlant_name.asString := SelectValueByID('name', 'eplant', wwTblVMI_ARINVTEPLANT_ID.asFloat );
  end;

end;

procedure TFrmCustVMIItems.wwTblVMI_ARINVTNewRecord(DataSet: TDataSet);
begin
  wwTblVMI_ARINVTID.asFloat := 0;
end;

procedure TFrmCustVMIItems.wwDBLookupInventoryCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  if not (wwTblVMI_ARINVT.State in [dsInsert, dsEdit]) then
    wwTblVMI_ARINVT.Edit;

  wwTblVMI_ARINVTARINVT_ID.asFloat := wwQryArinvtID.asFloat;
end;

procedure TFrmCustVMIItems.wwDBLookupVMILocationCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  if not (wwTblVMI_ARINVT.State in [dsInsert, dsEdit]) then
    wwTblVMI_ARINVT.Edit;

  wwTblVMI_ARINVTLOCATIONS_ID.asFloat := wwQryShiptoVMILocationsID.asFloat;

end;



end.
