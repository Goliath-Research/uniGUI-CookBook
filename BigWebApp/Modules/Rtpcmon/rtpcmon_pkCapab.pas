unit rtpcmon_pkCapab;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Search,
  FireDAC.Comp.Client,
  FireDAC.Phys,
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
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, IQUniGrid, uniGUIFrame;

type
  TFrmPkCapabilities = class(TUniForm)
    iqsrchCapabilities: TIQUniGridControl;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    srcSelectCapabilities: TDataSource;
    qrySelectCapabilites: TFDQuery;
    qrySelectCapabilitesCAPAB_TYPE: TStringField;
    qrySelectCapabilitesCAPAB_DESCRIP: TStringField;
    qrySelectCapabilitesCAPAB_COMMAND: TStringField;
    qrySelectCapabilitesCAPAB_START_POS: TBCDField;
    qrySelectCapabilitesCAPAB_TEMPLATE_ID: TBCDField;
    Panel1: TUniPanel;
    qrySelectCapabilitesCAPAB_NAME: TStringField;
    qrySelectCapabilitesUOM: TStringField;
    procedure qrySelectCapabilitesBeforeOpen(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FDeviceID: Real;
    FProtocol: String;
    procedure SetDeviceID(const Value: Real);
    procedure SetProtocol(const Value: string);
  public
    { Public declarations }
    property DeviceID: Real read FDeviceID write SetDeviceID;
    property Protocol: string read FProtocol write SetProtocol;
  end;

procedure doShowModal(ADeviceID: Real; AProtocol: String);

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;

procedure doShowModal(ADeviceID: Real; AProtocol: String);
var
  frm: TFrmPkCapabilities;
begin
  frm := TFrmPkCapabilities.Create(uniGUIApplication.UniApplication);

  with frm do
  begin
    DeviceID := ADeviceID;
    Protocol := AProtocol;
    qrySelectCapabilitesCAPAB_COMMAND.Visible := FProtocol = '';
    qrySelectCapabilitesCAPAB_START_POS.Visible := FProtocol = '';
    qrySelectCapabilitesCAPAB_NAME.Visible := FProtocol <> '';
    iqsrchCapabilities.DataSource := srcSelectCapabilities;
    qrySelectCapabilites.Open;
    ShowModal;
  end;

end;


procedure TFrmPkCapabilities.qrySelectCapabilitesBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'DEVICE_ID', FDeviceID);
  // TFDQuery(DataSet).ParamByName('DEVICE_ID').Value := FDeviceID;
end;

procedure TFrmPkCapabilities.SetDeviceID(const Value: Real);
begin
  FDeviceID := Value;
end;

procedure TFrmPkCapabilities.SetProtocol(const Value: string);
begin
  FProtocol := Value;
end;

procedure TFrmPkCapabilities.btnOKClick(Sender: TObject);
var
  i: integer;
begin
  with iqsrchCapabilities.DBGrid, iqsrchCapabilities.DBGrid.DataSource.DataSet do
    for i := 0 to SelectedRows.Count - 1 do
    begin
      GotoBookmark(SelectedRows.items[i]);
      ExecuteCommandFmt('begin pcmon_misc.addCapabToDevice(%f, %f); end;', [FDeviceID, FieldByName('CAPAB_TEMPLATE_ID').asFloat]);
    end;

  qrySelectCapabilites.Close;

  Self.ModalResult := mrOk;
end;

end.
