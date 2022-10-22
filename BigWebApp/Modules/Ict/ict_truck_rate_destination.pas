unit ict_truck_rate_destination;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Hpick,
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
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox;

type
  TTruckDestinationCargo = record
    FromSource: string;
    FromSource_ID: Real;
    ToSource: string;
    ToSource_ID: Real;
  end;

  TFrmICT_NewTruckRateDestination = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    Splitter1: TUniSplitter;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    edSoourceOrigin: TUniEdit;
    edSoourceName: TUniEdit;
    wwDBComboBoxTarget: TUniDBComboBox;
    wwDBComboDlgTargetName: TUniEdit;
    PKEplant: TIQWebHPick;
    PKEplantID: TBCDField;
    PKEplantNAME: TStringField;
    PkDivision: TIQWebHPick;
    PkDivisionID: TBCDField;
    PkDivisionNAME: TStringField;
    PkDivisionDESCRIP: TStringField;
    PkDivisionEPLANT_ID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwDBComboDlgTargetNameCustomDlg(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure PkDivisionBeforeOpen(DataSet: TDataSet);
    procedure PKEplantBeforeOpen(DataSet: TDataSet);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FToSource_ID: Real;
    FFromSource: string;
    FFromSource_ID: Real;
    function GetToSource: string;
    procedure SetToSource_ID(Value: Real);
    procedure Validate;
    procedure SetTruckDestinationCargo(const Value: TTruckDestinationCargo);
    property ToSource: string read GetToSource;
    property ToSource_ID: Real read FToSource_ID write SetToSource_ID;
    property FromSource: string read FFromSource write FFromSource;
    property FromSource_ID: Real read FFromSource_ID write FFromSource_ID;
  public
    { Public declarations }
    class function DoShowModal(var ACargo: TTruckDestinationCargo ): Boolean;
    Property Cargo: TTruckDestinationCargo write SetTruckDestinationCargo;
  end;

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous;

{$R *.dfm}

{ TFrmICT_NewTruckRateDestination }
class function TFrmICT_NewTruckRateDestination.DoShowModal( var ACargo: TTruckDestinationCargo): Boolean;
begin
  with self.Create( UniGuiApplication.UniApplication ) do
  begin
    Cargo:= ACargo;
    Result:= ShowModal = mrOK;
    if Result then
    begin
      ACargo.ToSource   := ToSource;
      ACargo.ToSource_ID:= ToSource_ID;
    end;
  end;
end;

procedure TFrmICT_NewTruckRateDestination.btnOKClick(Sender: TObject);
begin
  Validate;
  ModalResult:= mrOK;
end;

procedure TFrmICT_NewTruckRateDestination.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

function TFrmICT_NewTruckRateDestination.GetToSource: string;
begin
  if wwDBComboBoxTarget.ItemIndex > - 1 then
     Result:= wwDBComboBoxTarget.Items[ wwDBComboBoxTarget.ItemIndex ]
  else
     Result:= '';
end;

procedure TFrmICT_NewTruckRateDestination.PkDivisionBeforeOpen(
  DataSet: TDataSet);
begin
  // TFDQuery(DataSet).ParamByName('id').asFloat:= 0;
  AssignQueryParamValue(DataSet, 'id', 0);
  if FromSource = 'DIVISION' then
     // TFDQuery(DataSet).ParamByName('id').asFloat:= FromSource_ID;
     AssignQueryParamValue(DataSet, 'id', FromSource_ID);
end;

procedure TFrmICT_NewTruckRateDestination.PKEplantBeforeOpen(DataSet: TDataSet);
begin
  //TQuery(DataSet).ParamByName('id').asFloat:= 0;
  AssignQueryParamValue(DataSet, 'id', 0);
  if FromSource = 'EPLANT' then
     // TFDQuery(DataSet).ParamByName('id').asFloat:= FromSource_ID;
     AssignQueryParamValue(DataSet, 'id', FromSource_ID);
end;

procedure TFrmICT_NewTruckRateDestination.SetToSource_ID(Value: Real);
begin
  FToSource_ID := Value;
  wwDBComboDlgTargetName.Text:= SelectValueFmtAsString('select truck_misc.get_source_description( ''%s'', %f ) from dual',
                                             [ ToSource,
                                               FToSource_ID ]);
end;

procedure TFrmICT_NewTruckRateDestination.SetTruckDestinationCargo(
  const Value: TTruckDestinationCargo);
begin
  FFromSource   := Value.FromSource;
  FFromSource_ID:= Value.FromSource_ID;
  edSoourceOrigin.Text:= Value.FromSource;
end;

procedure TFrmICT_NewTruckRateDestination.UniFormShow(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);

  edSoourceName.Text  := SelectValueFmtAsString('select truck_misc.get_source_description( ''%s'', %f ) from dual',
                                      [ FromSource,
                                        FromSource_ID ]);
end;

procedure TFrmICT_NewTruckRateDestination.wwDBComboDlgTargetNameCustomDlg(
  Sender: TObject);
var
  APk: TIQWebHPick;
begin
  IQAssert( ToSource <> '', 'Destination origin must be assigned - operation aborted');

  if ToSource = 'EPLANT' then
     APk:= PkEPlant
  else
     APk:= PkDivision;

  with APk do
    if Execute then
       ToSource_ID:= GetValue('ID');
end;

procedure TFrmICT_NewTruckRateDestination.Validate;
begin
  IQAssert( ToSource <> '', 'Destination origin must be assigned - operation aborted');
  IQAssert( ToSource_ID <> 0, 'Destination name must be assigned - operation aborted');
end;

end.
