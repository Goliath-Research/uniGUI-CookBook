unit vendor_oem_dist;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.DBCtrls, //TNavigateBtn
//  Vcl.Wwdatsrc,
  IQMS.WebVcl.SecurityRegister,
//  Mask,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, Vcl.Controls;

type
  TFrmVendorOEMDistributor = class(TUniForm)
    Panel1: TUniPanel;
    Grid: TIQUniGridControl;
    SrcVendorOEMDist: TDataSource;
    QryVendorOEMDist: TFDQuery;
    QryVendorOEMDistID: TBCDField;
    QryVendorOEMDistOEM_VENDOR_ID: TBCDField;
    QryVendorOEMDistDIST_VENDOR_ID: TBCDField;
    QryVendorOEMDistVENDORNO: TStringField;
    QryVendorOEMDistCOMPANY: TStringField;
    QryVendorOEMDistCITY: TStringField;
    QryVendorOEMDistSTATE: TStringField;
    QryVendorOEMDistZIP: TStringField;
    QryVendorOEMDistADDR1: TStringField;
    QryVendorOEMDistADDR2: TStringField;
    QryVendorOEMDistADDR3: TStringField;
    QryVendorOEMDistCUSER1: TStringField;
    QryVendorOEMDistQA_RATING: TStringField;
    QryVendorOEMDistVEN_RATING: TStringField;
    QryVendorOEMDistSTATUS_ID: TStringField;
    QryVendorOEMDistFED_TAX_ID: TStringField;
    QryVendorOEMDistIS_OEM: TStringField;
    SR: TIQWebSecurityRegister;
    wwDBComboDlgVendorNo: TUniEdit;
    PkVendor: TIQWebHPick;
    PkVendorVENDORNO: TStringField;
    PkVendorCOMPANY: TStringField;
    PkVendorCITY: TStringField;
    PkVendorSTATE: TStringField;
    PkVendorZIP: TStringField;
    PkVendorID: TBCDField;
    PkVendorADDR1: TStringField;
    PkVendorADDR2: TStringField;
    PkVendorADDR3: TStringField;
    PkVendorCUSER1: TStringField;
    PkVendorQA_RATING: TStringField;
    PkVendorVEN_RATING: TStringField;
    PkVendorSTATUS_ID: TStringField;
    PkVendorFED_TAX_ID: TStringField;
    PkVendorIS_OEM: TStringField;
    UpdateSQLVendorOEMDist: TFDUpdateSQL;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryVendorOEMDistBeforeOpen(DataSet: TDataSet);
    procedure wwDBComboDlgVendorNoCustomDlg(Sender: TObject);
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure QryVendorOEMDistNewRecord(DataSet: TDataSet);
    procedure QryVendorOEMDistBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure PkVendorBeforeOpen(DataSet: TDataSet);
    procedure SRAfterApply(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FOEM_Vendor_ID: Real;
    procedure SetOEM_Vendor_ID(const Value : Real);
    function GetOEM_Vendor_ID: Real;
    procedure AppendMultipleRecords;
  public
    { Public declarations }
    property OEM_Vendor_ID: Real read GetOEM_Vendor_ID write SetOEM_Vendor_ID;
    class procedure DoShowModal(AOEM_Vendor_ID: Real);
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm;
//  IQSecIns;

{ TFrmVendorOEMDistributor }

procedure TFrmVendorOEMDistributor.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
end;

class procedure TFrmVendorOEMDistributor.DoShowModal(AOEM_Vendor_ID: Real);
var
  frm : TFrmVendorOEMDistributor;
begin
  frm := TFrmVendorOEMDistributor.Create(uniGUIApplication.UniApplication);
  frm.OEM_Vendor_ID := AOEM_Vendor_ID;
  frm.ShowModal;
end;

procedure TFrmVendorOEMDistributor.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self, Grid]);
//  IQSecIns.EnsureSecurityInspectorOnTopOf(self);
end;


procedure TFrmVendorOEMDistributor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, Grid]);
end;

procedure TFrmVendorOEMDistributor.QryVendorOEMDistBeforeOpen(
  DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
    ParamByName('vendor_id').Value := FOEM_Vendor_ID;
end;


procedure TFrmVendorOEMDistributor.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);

  if Button = nbInsert then
  begin
    AppendMultipleRecords;
    ABORT;
  end;
end;


procedure TFrmVendorOEMDistributor.ApplyUpdates(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
end;


{ TODO -oLema : The following wwDBComboDlgVendorNoCustomDlg is the OnCustomDlg handler of the missing TwwDBComboDlg }
procedure TFrmVendorOEMDistributor.wwDBComboDlgVendorNoCustomDlg(Sender: TObject);
var
  I: Integer;
begin
  with PkVendor do
    if Execute then
    begin
      if SelectValueFmtAsFloat
        ('select id from vendor_oem_dist where oem_vendor_id = %f and dist_vendor_id = %f',
        [FOEM_Vendor_ID, DtoF(GetValue('ID'))]) = 0 then
      begin
        QryVendorOEMDist.Edit;
        QryVendorOEMDist.FieldByName('dist_vendor_id').asFloat := GetValue('ID');
        QryVendorOEMDist.Post;
      end;
      RefreshDataSetByID(QryVendorOEMDist);
    end
    else if QryVendorOEMDist.State in [dsEdit, dsInsert] then
      QryVendorOEMDist.Cancel;
end;

procedure TFrmVendorOEMDistributor.QryVendorOEMDistNewRecord(DataSet: TDataSet);
begin
  QryVendorOEMDist.FieldByName('oem_vendor_id').asFloat := FOEM_Vendor_ID;
end;

function TFrmVendorOEMDistributor.GetOEM_Vendor_ID: Real;
begin
  Result := FOEM_Vendor_ID;
end;

procedure TFrmVendorOEMDistributor.SetOEM_Vendor_ID(const Value: Real);
begin
  FOEM_Vendor_ID := Value;
end;

procedure TFrmVendorOEMDistributor.SRAfterApply(Sender: TObject);
begin
  //Hide grid controls
  wwDBComboDlgVendorNo.Visible := False;

//  IQMS.Common.Controls.AutoSizeNavBar(NavMain);
end;

procedure TFrmVendorOEMDistributor.AppendMultipleRecords;
var
  I: Integer;
begin
  with PkVendor do
    if ExecuteEx('ID') then
    begin
      for I := 0 to ResultList.Count - 1 do
        if SelectValueFmtAsFloat
          ('select id from vendor_oem_dist where oem_vendor_id = %f and dist_vendor_id = %s',
          [FOEM_Vendor_ID, ResultList[I]]) = 0 then
        begin
          QryVendorOEMDist.Append;
          QryVendorOEMDist.FieldByName('dist_vendor_id').asString := ResultList[I];
          QryVendorOEMDist.Post;
        end;
      RefreshDataSetByID(QryVendorOEMDist);
    end;
end;

procedure TFrmVendorOEMDistributor.QryVendorOEMDistBeforePost(
  DataSet: TDataSet);
begin
  if QryVendorOEMDistID.asFloat = 0 then
    QryVendorOEMDistID.asFloat := GetNextID('vendor_oem_dist');
end;

procedure TFrmVendorOEMDistributor.PkVendorBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'vendor_id', FOEM_Vendor_ID);

  //with DataSet as TFDQuery do
  //ParamByName('vendor_id').Value := FOEM_Vendor_ID;
end;

end.
