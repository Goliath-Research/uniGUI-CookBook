unit uniModuleA;

interface

uses
  SysUtils, Classes, Data.DB, Datasnap.DBClient, System.Actions, Vcl.ActnList,
  D4W.DataControllerList, System.ImageList, Vcl.ImgList,
  uniImageList, uniGUIBaseClasses, uniGUIClasses;

type
  TDataModuleA = class(TDataModule)
    ActionList1: TActionList;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1OrderNo: TFloatField;
    ClientDataSet1CustNo: TFloatField;
    ClientDataSet1SaleDate: TDateTimeField;
    ClientDataSet1ShipDate: TDateTimeField;
    ClientDataSet1EmpNo: TIntegerField;
    ClientDataSet1ShipToContact: TStringField;
    ClientDataSet1ShipToAddr1: TStringField;
    ClientDataSet1ShipToAddr2: TStringField;
    ClientDataSet1ShipToCity: TStringField;
    ClientDataSet1ShipToState: TStringField;
    ClientDataSet1ShipToZip: TStringField;
    ClientDataSet1ShipToCountry: TStringField;
    ClientDataSet1ShipToPhone: TStringField;
    ClientDataSet1ShipVIA: TStringField;
    ClientDataSet1PO: TStringField;
    ClientDataSet1Terms: TStringField;
    ClientDataSet1PaymentMethod: TStringField;
    ClientDataSet1ItemsTotal: TCurrencyField;
    ClientDataSet1TaxRate: TFloatField;
    ClientDataSet1Freight: TCurrencyField;
    ClientDataSet1AmountPaid: TCurrencyField;
    ClientDataSet2: TClientDataSet;
    ClientDataSet2ID: TStringField;
    ClientDataSet2Name: TStringField;
    DataSource2: TDataSource;
    D4WDataControllerLinkList1: TD4WDataControllerLinkList;
    ClientDataSet3: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    DataSource3: TDataSource;
    Customers: TClientDataSet;
    CustomersCustNo: TFloatField;
    CustomersCompany: TStringField;
    CustomersAddr1: TStringField;
    CustomersAddr2: TStringField;
    CustomersCity: TStringField;
    CustomersState: TStringField;
    CustomersZip: TStringField;
    CustomersCountry: TStringField;
    CustomersPhone: TStringField;
    CustomersFAX: TStringField;
    CustomersTaxRate: TFloatField;
    CustomersContact: TStringField;
    CustomersLastInvoiceDate: TDateTimeField;
    CustomersDS: TDataSource;
    ClientDataSet1CustName: TStringField;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    UniNativeImageList1: TUniNativeImageList;
    UniImageListAdapter1: TUniImageListAdapter;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DataModuleA: TDataModuleA;

implementation

{$R *.dfm}

uses
  UniGUIVars, uniGUIMainModule, MainModule, D4WEditor, D4WModuleFormDesigner;

function DataModuleA: TDataModuleA;
begin
  Result := TDataModuleA(UniMainModule.GetModuleInstance(TDataModuleA));
end;

procedure TDataModuleA.DataModuleCreate(Sender: TObject);
begin
//
end;

initialization
  RegisterModuleClass(TDataModuleA);

  D4WRegisterClass(RegisteredDataModules, 'DataModuleA', TDataModuleA);

end.
