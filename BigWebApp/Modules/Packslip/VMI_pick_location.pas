unit VMI_pick_location;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniComboBox, uniDBComboBox;

type
  TFrmVMIPickLocation = class(TUniForm)
    wwQryLocations: TFDQuery;
    wwQryLocationsLOC_DESC: TStringField;
    wwQryLocationsDESCRIP: TStringField;
    wwQryLocationsEPLANT_ID: TBCDField;
    wwQryLocationsID: TBCDField;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    sbtnFgLotNo: TUniSpeedButton;
    Label3: TUniLabel;
    cmbLocations: TUniDBLookupComboBox;
    EditLotNo: TUniEdit;
    edLocation_ID: TUniEdit;
    Bevel1: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    ds_Locations: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwQryLocationsBeforeOpen(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
    procedure cmbLocationsChange(Sender: TObject);
    procedure sbtnFgLotNoClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FShip_To_ID: Real;
    FArinvt_ID: Real;
    procedure SetShip_To_ID(const Value: Real);
    procedure SetArinvt_ID(const Value: Real);
    procedure Validate;
  public
    { Public declarations }
    property Ship_To_ID: Real write SetShip_To_ID;
    property Arinvt_ID: Real write SetArinvt_ID;
    class function DoShowModal(AShip_To_ID, AArinvt_ID: Real; var ALocations_ID: Real; var ALotno: string ): Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous;

{ TFrmVMIPickLocation }


class function TFrmVMIPickLocation.DoShowModal(AShip_To_ID, AArinvt_ID: Real; var ALocations_ID: Real; var ALotno: string ): Boolean;
var
  frm: TFrmVMIPickLocation;
begin
  frm := TFrmVMIPickLocation.Create(uniGUIApplication.UniApplication);
  frm.Ship_To_ID := AShip_To_ID;
  frm.Arinvt_ID := AArinvt_ID;

  Result:= (frm.ShowModal = mrOK);
  if Result then
  begin
    ALocations_ID:= frm.wwQryLocationsID.asFloat;
    ALotno       := frm.EditLotNo.Text;
  end;

end;

procedure TFrmVMIPickLocation.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

procedure TFrmVMIPickLocation.wwQryLocationsBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(Dataset).ParamByName('ship_to_id').Value := FShip_To_ID;
end;

procedure TFrmVMIPickLocation.btnOKClick(Sender: TObject);
begin
  Validate;
  ModalResult:= mrOK;
end;

procedure TFrmVMIPickLocation.Validate;
begin
  IQAssert(cmbLocations.Text > '', 'No location is selected - operation aborted');
end;


procedure TFrmVMIPickLocation.cmbLocationsChange(Sender: TObject);
begin
  if cmbLocations.Text > '' then
     edLocation_ID.Text:= wwQryLocationsID.asString
  else
     edLocation_ID.Text:= '';
end;

procedure TFrmVMIPickLocation.sbtnFgLotNoClick(Sender: TObject);
var
  AID: Real;
begin
  AID:= SelectValueByID( 'standard_id', 'arinvt', FArinvt_ID );
  EditLotNo.Text:= SelectValueFmtAsString('select fg_lotno from standard where id = %f', [ AID ]);
end;

procedure TFrmVMIPickLocation.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
end;

procedure TFrmVMIPickLocation.SetShip_To_ID(const Value: Real);
begin
  FShip_To_ID := Value;
end;

procedure TFrmVMIPickLocation.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [ self ]);
end;

procedure TFrmVMIPickLocation.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
end;

end.
