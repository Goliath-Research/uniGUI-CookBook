unit inv_trans_zones_add_other;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Data.DB,
  System.Generics.Collections,
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
  uniRadioButton,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, IQUniGrid, uniGUIFrame;

type
  TFrmInvZonesAddOther = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    GroupBox1: TUniGroupBox;
    rbtnBlankLocations: TUniRadioButton;
    rbtnAllLocations: TUniRadioButton;
    IQSearch1: TIQUniGridControl;
    SrcInvZones: TDataSource;
    QryInvZones: TFDQuery;
    QryInvZonesID: TBCDField;
    QryInvZonesCODE: TStringField;
    QryInvZonesDESCRIP: TStringField;
    QryInvZonesEPLANT_ID: TBCDField;
    QryInvZonesDIVISION_NAME: TStringField;
    QryInvZonesZONE_TYPE_DISP: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryInvZonesBeforeOpen(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FInvZone_ID: Real;
    procedure InitForm;
    procedure AddLocationsFromOtherZones;
    procedure ProcessListOfZones(AList: TList<Real>);
    procedure SetInvZone_ID(const Value: Real);
  public
    { Public declarations }
    property InvZone_ID: Real write SetInvZone_ID;
    class function DoShowModal(AInvZone_ID: Real ): Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Dialogs;

{ TFrmInvZonesAddOther }

class function TFrmInvZonesAddOther.DoShowModal(AInvZone_ID: Real): Boolean;
var
  LFrmInvZonesAddOther : TFrmInvZonesAddOther;
begin
  LFrmInvZonesAddOther := TFrmInvZonesAddOther.Create(UniGUIApplication.UniApplication);
  LFrmInvZonesAddOther.InvZone_ID := AInvZone_ID;
  Result:= LFrmInvZonesAddOther.ShowModal = mrOK;
end;

procedure TFrmInvZonesAddOther.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [ self ]);
end;


procedure TFrmInvZonesAddOther.InitForm;
  function _zone_type_to_desc( AZoneType: string): string;
  begin
    if AZoneType = 'LO'      then Result:= 'Locating Zone'
    else if AZoneType = 'AL' then Result:= 'Allocating Zone'
    else if AZoneType = 'DZ' then Result:= 'Drop Zone'
    else if AZoneType = 'WK' then Result:= 'Work Zone'
    else Result:= '[Uknown Zone (!)]'
  end;

begin
  rbtnBlankLocations.Caption:= Format('Only add locations with blank %s', [ _zone_type_to_desc( SelectValueByID('zone_type', 'inv_zone', FInvZone_ID))]);
end;


procedure TFrmInvZonesAddOther.QryInvZonesBeforeOpen(DataSet: TDataSet);
begin
  with TFDQuery(DataSet) do
  begin
    ParamByName('eplant_id').Value := SelectValueByID('eplant_id', 'inv_zone', FInvZone_ID);
    ParamByName('division_id').Value := SelectValueByID('division_id', 'inv_zone', FInvZone_ID);
    ParamByName('zone_type').Value := SelectValueByID('zone_type', 'inv_zone', FInvZone_ID);
  end;
end;


procedure TFrmInvZonesAddOther.SetInvZone_ID(const Value: Real);
begin
  FInvZone_ID := Value;
end;

procedure TFrmInvZonesAddOther.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(Self, [ self ]);
  IQSetTablesActive( True, self );

  InitForm();
end;

procedure TFrmInvZonesAddOther.btnOKClick(Sender: TObject);
begin
  if QryInvZones.Eof and QryInvZones.Bof then
     EXIT;

  if not IQConfirmYN('About to add locations from other zones - are you sure you want to continue?') then
     EXIT;

  AddLocationsFromOtherZones;

  IQInformation('Finished processing other zones.');

  ModalResult:= mrOK;
end;


procedure TFrmInvZonesAddOther.AddLocationsFromOtherZones;
var
  AList: TList<Real>;
  I: Integer;
begin
  with IQSearch1 do
  try
     AList:= TList<Real>.Create;
     DataSource.DataSet.DisableControls;
{ TODO -oGPatil -cWebConvert : TUniDBGrid does not contain SelectedList
     if DBGrid.SelectedList.Count > 0 then
        for I:= 0 to DBGrid.SelectedList.Count - 1 do
        begin
          DataSource.DataSet.GotoBookmark(DBGrid.SelectedList.Items[ I ]);
          AList.Add( QryInvZonesID.asFloat )
        end
     else
        AList.Add( QryInvZonesID.asFloat );  }

     ProcessListOfZones( AList );
  finally
     DataSource.DataSet.EnableControls;
     AList.Free;
  end;
end;


procedure TFrmInvZonesAddOther.ProcessListOfZones( AList: TList<Real> );
var
  AInvZone_ID: Real;
  ATrgZoneFieldName: string;
  ADB: TFDCustomConnection;

  function _zone_fieldname( AZoneType: string ): string;
  begin
    if AZoneType = 'LO'      then Result:= 'inv_zone_id'
    else if AZoneType = 'AL' then Result:= 'al_inv_zone_id'
    else if AZoneType = 'DZ' then Result:= 'dz_inv_zone_id'
    else if AZoneType = 'WK' then Result:= 'wk_inv_zone_id'
    else raise Exception.Create('Unable to determine target zone field name.');
  end;

  procedure _AppendLocationsFromZone( AInvZone_ID: Real );
  var
    ASrcZoneFieldName: string;
    AUpdateStaement: string;
  begin
    // based on the zone type determine which field in the locations table to query
    // for instance for AL we would want al_inv_zone_id
    ASrcZoneFieldName:= _zone_fieldname( SelectValueByID('zone_type', 'inv_zone', AInvZone_ID));

    // update locations target zone field.
    AUpdateStaement:= Format(
    'update locations          '+
    '   set %s = %.0f          '+   // target inv zone field name: inv_zone_id,  al_inv_zone_id, dz_inv_zone_id, wk_inv_zone_id
    ' where id in              '+
    '       (select id         '+
    '          from locations  '+
    '         where %s = %.0f)  ',  // source locations attached to the passed AInvZone_ID
    [ ATrgZoneFieldName,
      FInvZone_ID,
      ASrcZoneFieldName,
      AInvZone_ID ]);

    if rbtnBlankLocations.Checked then
       AUpdateStaement:= AUpdateStaement + Format(' and %s is null', [ ATrgZoneFieldName ]);

    // finally execute!
    ExecuteCommand( AUpdateStaement );
  end;

begin
  ADB:= FDManager.FindConnection('IQFD');
  ADB.StartTransaction;
  try
    ATrgZoneFieldName:= _zone_fieldname( SelectValueByID('zone_type', 'inv_zone', FInvZone_ID));

    for AInvZone_ID in AList do
      _AppendLocationsFromZone( AInvZone_ID );

    ADB.Commit;
  finally
    if ADB.InTransaction then
       ADB.RollBack;
  end;
end;


end.
