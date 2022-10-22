unit vendor_assoc_oem;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Hpick,
//  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, Vcl.Controls;

type
  TFrmAssociatedOEM = class(TUniForm)
    Panel1: TUniPanel;
    DataSource1: TDataSource;
    wwQryOEM: TFDQuery;
    wwDBGrid1: TIQUniGridControl;
    sbtPkOEM: TUniSpeedButton;
    PkOEM: TIQWebHPick;
    wwQryOEMVENDORNO: TStringField;
    wwQryOEMCOMPANY: TStringField;
    wwQryOEMCITY: TStringField;
    wwQryOEMSTATE: TStringField;
    wwQryOEMZIP: TStringField;
    wwQryOEMADDR1: TStringField;
    wwQryOEMADDR2: TStringField;
    wwQryOEMADDR3: TStringField;
    wwQryOEMCUSER1: TStringField;
    wwQryOEMQA_RATING: TStringField;
    wwQryOEMVEN_RATING: TStringField;
    wwQryOEMTAX_CODE_ID: TBCDField;
    wwQryOEMIS_OEM: TStringField;
    PkOEMVENDORNO: TStringField;
    PkOEMCOMPANY: TStringField;
    PkOEMCITY: TStringField;
    PkOEMSTATE: TStringField;
    PkOEMZIP: TStringField;
    PkOEMADDR1: TStringField;
    PkOEMADDR2: TStringField;
    PkOEMADDR3: TStringField;
    PkOEMCUSER1: TStringField;
    PkOEMQA_RATING: TStringField;
    PkOEMVEN_RATING: TStringField;
    PkOEMTAX_CODE_ID: TBCDField;
    PkOEMIS_OEM: TStringField;
    wwQryOEMID: TBCDField;
    PkOEMID: TBCDField;
    procedure wwQryOEMBeforeOpen(DataSet: TDataSet);
    procedure sbtPkOEMClick(Sender: TObject);
    procedure PkOEMBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);

  private
    { Private declarations }
    FVendor_ID: real;
    procedure SetVendor_ID(const Value: Real);
    function GetVendor_ID: Real;
  public
    { Public declarations }
    property Vendor_ID: Real read GetVendor_ID write SetVendor_ID;
    class procedure DoShowModal(AVendor_ID: real);
  end;


implementation

{$R *.dfm}


uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs,
  vendor_rscstr;

{ TFrmAssociatedOEM }

procedure TFrmAssociatedOEM.UniFormCreate(Sender: TObject);
begin
  wwQryOEM.Open;
end;


class procedure TFrmAssociatedOEM.DoShowModal(AVendor_ID: real);
var
  frm: TFrmAssociatedOEM;
begin
  frm := TFrmAssociatedOEM.Create(uniGUIApplication.UniApplication);
  frm.Vendor_ID := AVendor_ID;

  if (SelectValueFmtAsInteger(
    'select count(*)               ' +
    '  from vendor v,              ' +
    '       vendor_oem_dist o      ' +
    ' where o.dist_vendor_id = %f  ' +
    '   and o.oem_vendor_id = v.id ' +
    'order by v.vendorno         ',
    [AVendor_ID]) > 0) then
    frm.ShowModal
  else
  //'There are no OEM Vendors associated to this Vendor.'
    IQInformation(vendor_rscstr.cTXT0000021);

end;

procedure TFrmAssociatedOEM.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self, wwDBGrid1]);
end;


procedure TFrmAssociatedOEM.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, wwDBGrid1]);
end;

procedure TFrmAssociatedOEM.PkOEMBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('id').Value := FVendor_ID;
end;

procedure TFrmAssociatedOEM.sbtPkOEMClick(Sender: TObject);
begin
  with PkOEM do
  begin
    if Execute then
      wwQryOEM.Locate('ID', GetValue('ID'), []);
  end;
end;

procedure TFrmAssociatedOEM.wwQryOEMBeforeOpen(DataSet: TDataSet);
begin
  with wwQryOEM do
    ParamByName('id').Value := FVendor_ID;
end;

function TFrmAssociatedOEM.GetVendor_ID: Real;
begin
  result := FVendor_ID;
end;

procedure TFrmAssociatedOEM.SetVendor_ID(const Value: Real);
begin
  FVendor_ID := Value;
end;


end.
