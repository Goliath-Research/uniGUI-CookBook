unit Mfg_Conv;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.DBGrids,
  IQMS.WebVcl.AppDef,
  Vcl.Menus,
  IQMS.WebVcl.DropDownButton,
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
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu;

type
  { TFrmMfgConversion }
  TFrmMfgConversion = class(TUniForm)
    DBGrid1: TUniDBGrid;
    Panel1: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    SrcMfg_Conv: TDataSource;
    AppDef1: TIQWebAppDef;
    DropDownButton1: TIQWebDropDownButton;
    popMenu: TUniPopupMenu;
    TblMfg_Conv: TFDQuery;
    TblMfg_ConvID: TBCDField;
    TblMfg_ConvMFGTYPE: TStringField;
    TblMfg_ConvFIELD_NAME: TStringField;
    TblMfg_ConvCAPTION: TStringField;
    TblMfg_ConvUOM: TStringField;
    TblMfg_ConvFACTOR: TFMTBCDField;
    TblMfg_ConvDefaultUOM: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AppDef1AfterMfgTypeChanged(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TblMfg_ConvCalcFields(DataSet: TDataSet);
    procedure TblMfg_ConvBeforePost(DataSet: TDataSet);
    procedure sbtnAddAllClick(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure TblMfg_ConvNewRecord(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FDataSource: TDataSource;
    FFieldList : TStringList;
    procedure AssignMasterSource( ADataSource: TDataSource );
    procedure ClearFieldList;
    procedure AddObjectsToFieldList( AList: array of string );
    procedure Append_Mfg_Conv_IndexOf( I: Integer );
    procedure Append_Mfg_Conv( Sender: TObject );
    procedure SetADataSource(const Value: TDataSource);
  protected
    procedure LoadFieldList;
    function Like_Generic( S: string ): Boolean;
    function Like_Injection( S: string ): Boolean;
  public
    { Public declarations }
    property ADataSource : TDataSource write SetADataSource;
  end;


  {TMfgConvCargo - object in TStringList (FFieldList) }
  TMfgConvCargo = class
    FDefault: string;
    constructor Create( AOwner: TFrmMfgConversion; AFieldName: string );
  end;

procedure DoShowMfgConv(ADataSource: TDataSource );


implementation

{$R *.DFM}

uses
  bom_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  Mfg_Conv_Def_Uom,
  IQMS.Common.MfgShare;

procedure DoShowMfgConv( ADataSource: TDataSource );
var
  LFrmMfgConversion : TFrmMfgConversion;
begin
  LFrmMfgConversion := TFrmMfgConversion.Create( uniGUIApplication.UniApplication );
  LFrmMfgConversion.ADataSource := ADataSource;
  LFrmMfgConversion.ShowModal;
end;

{ TMfgConvCargo }

constructor TMfgConvCargo.Create( AOwner: TFrmMfgConversion; AFieldName: string );
begin
  inherited Create;
  {AFieldName is a function name on a backend in one of the appdef_bom_xxxx packages:
   LBL_CYCLE_SEC, LBL_HRSK, LBL_LBSK, LBL_SHOT_WT, LBL_SPH, LBL_SPH_NET, LBL_UNIT_CYCLE}
  FDefault:= AOwner.Appdef1.Execute( AFieldName, [ 'NOT_EXISTING_MFGTYPE_TO_GET_HARCODED_LABELS' ]).asString;
end;

{ TFrmMfgConversion }

procedure TFrmMfgConversion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, DBGrid1 ]);
end;

procedure TFrmMfgConversion.AssignMasterSource( ADataSource: TDataSource );
begin
  TblMfg_Conv.Close;
  FDataSource:= ADataSource;
  TblMfg_Conv.MasterSource:= FDataSource;
  AppDef1.DataSource:= FDataSource;
  AppDef1.Refresh;
end;

procedure TFrmMfgConversion.FormDestroy(Sender: TObject);
begin
  ClearFieldList;
  FFieldList.Free;
end;

procedure TFrmMfgConversion.AppDef1AfterMfgTypeChanged(Sender: TObject);
begin
  LoadFieldList;
  // 'User-Defined Conversions for %s';
  Caption := Format(bom_rscstr.cTXT0000014, [AppDef1.MfgType]);
  //Caption:= 'User-Defined Conversions for ' + AppDef1.MfgType;
end;

procedure TFrmMfgConversion.ClearFieldList;
var
  I: Integer;
begin
  for I:= 0 to FFieldList.Count -1 do
    TObject(FFieldList.Objects[I]).Free;
  FFieldList.Clear;
end;

procedure TFrmMfgConversion.LoadFieldList;
var
  I      : Integer;
  NewItem: TUniMenuItem;
  ALookup_MfgType: string;
begin
  {Clear List}
  ClearFieldList;

  (*
  lblCycleTm   - LBL_CYCLE_SEC
  lblHrsK      - LBL_HRSK
  lblLBSK      - Lbl_LBSK
  lblShotWt    - LBL_SHOT_WT
  lblSPH       - LBL_SPH
  lblSprue     - LBL_SPRUE
  lblSPH_Net   - LBL_SPH_NET
  lblUnitCycle - LBL_UNIT_CYCLE
  *)

  ALookup_MfgType:= IQMS.Common.MfgShare.Lookup_MfgType( Appdef1.MfgType );

  {Append to List}
  if ALookup_MfgType = 'OUTSOURCE' then
     AddObjectsToFieldList([ 'LBL_UNIT_CYCLE' ])

  else if ALookup_MfgType = 'EXTRUSION' then
     AddObjectsToFieldList(['LBL_CYCLE_SEC', 'LBL_HRSK', 'LBL_LBSK', 'LBL_SHOT_WT', 'LBL_SPH', 'LBL_SPH_NET', 'LBL_UNIT_CYCLE'])

  else if ALookup_MfgType = 'EXTRUSION2' then
     AddObjectsToFieldList(['LBL_CYCLE_SEC', 'LBL_HRSK', 'LBL_LBSK' ])

  else if ALookup_MfgType = 'COMPOUND1' then
     AddObjectsToFieldList(['LBL_CYCLE_SEC', 'LBL_HRSK', 'LBL_LBSK' ])

  else if ALookup_MfgType = 'EXTRUSION3' then
     AddObjectsToFieldList(['LBL_CYCLE_SEC', 'LBL_HRSK', 'LBL_LBSK' ])

  else if ALookup_MfgType = 'FAB' then
     AddObjectsToFieldList(['LBL_CYCLE_SEC' ])

  //else if Appdef1.MfgType = 'ASSEMBLY' then
  //   AddObjectsToFieldList(['LBL_CYCLE_SEC' ])

  else if Like_Injection( ALookup_MfgType ) then
     AddObjectsToFieldList(['LBL_CYCLE_SEC', 'LBL_HRSK', 'LBL_LBSK', 'LBL_SHOT_WT', 'LBL_SPH', 'LBL_SPH_NET' ])

  else if Like_Generic( ALookup_MfgType ) then
     AddObjectsToFieldList([ 'LBL_CYCLE_SEC', 'LBL_HRSK', 'LBL_SPH' ])

  else
     // 'Unable to establish manufacturing type [Appdef1.MfgType = %s]'
     raise Exception.CreateFmt(bom_rscstr.cTXT0000015, [ ALookup_MfgType ]);

  {Assign to DBGrid drop down column}
  with IQColumnByName( DBGrid1, 'FIELD_NAME' ) do
  begin
    PickList.Clear;
    PickList.Assign( FFieldList );
  end;

  {Assign to popup Menu}
  with popMenu do
  begin
    for I:= 0 to FFieldList.Count - 1 do
    begin
      NewItem:= TUniMenuItem.Create( popMenu );
      with NewItem do
      begin
        Caption   := Format('%s '#9'(%s)', [ FFieldList[ I ], TMfgConvCargo( FFieldList.Objects[ I ]).FDefault ]);
        OnClick   := Append_Mfg_Conv;
        GroupIndex:= 1;
        Tag       := I;
      end;
      popMenu.Items.Add( NewItem );
    end;
  end;
end;

procedure TFrmMfgConversion.Append_Mfg_Conv( Sender: TObject );
begin
  if Sender is TUniMenuItem then
     Append_Mfg_Conv_IndexOf( TUniMenuItem(Sender).Tag );
end;

procedure TFrmMfgConversion.AddObjectsToFieldList( AList: array of string );
var
  I: Integer;
begin
  {Add appdefed labels to the FFieldList. Keep label caption in the cargo}
  for I:= Low(AList) to High( AList ) do
     FFieldList.AddObject( AList[ I ], TMfgConvCargo.Create( self, AList[ I ]));
end;

procedure TFrmMfgConversion.TblMfg_ConvCalcFields(DataSet: TDataSet);
var
  I: Integer;
begin
  {DefaultUOM}
  DataSet.FieldByName('DefaultUOM').asString:= '';
  with FFieldList do
  begin
    I:= IndexOf( DataSet.FieldByName('field_name').asString );
    if I >= 0 then
       DataSet.FieldByName('DefaultUOM').asString:= TMfgConvCargo(Objects[ I ]).FDefault;
  end;
end;

procedure TFrmMfgConversion.TblMfg_ConvNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('FACTOR').asFloat:= 1;
  DataSet.FieldByName('MFGTYPE').asString:= FDataSource.DataSet.FieldByName('mfgtype').asString;
end;

procedure TFrmMfgConversion.UniFormCreate(Sender: TObject);
begin
  FFieldList:= TStringList.Create;

  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, DBGrid1 ]);
end;

function TFrmMfgConversion.Like_Generic( S: string ): Boolean;
begin
  Result:= not StrInList( S, ['INJECTION', 'EXTRUSION', 'BLOWMOLD', 'OUTSOURCE', 'THERMOSET', 'ROTATIONAL', 'DIECAST', 'STAMPING', 'SFOAM' ])
end;

function TFrmMfgConversion.Like_Injection( S: string ): Boolean;
begin
  Result:= IsLikeInjection( S );  {IQLib}
end;

procedure TFrmMfgConversion.TblMfg_ConvBeforePost(DataSet: TDataSet);
var
  I: Integer;
begin
  IQAssignIDBeforePost( DataSet, 'MFG_CONV');
  with FFieldList do
  begin
    I:= IndexOf( DataSet.FieldByName('field_name').asString );
    if I < 0 then
       // 'Invalid Field Name value. Please use the drop-down box to assign a field name.'
       raise Exception.Create(bom_rscstr.cTXT0000016);
  end;
end;

procedure TFrmMfgConversion.sbtnAddAllClick(Sender: TObject);
var
  I: Integer;
begin
  with FFieldList do
    for I:= 0 to FFieldList.Count - 1 do
      Append_Mfg_Conv_IndexOf( I );
end;

procedure TFrmMfgConversion.SetADataSource(const Value: TDataSource);
begin
  AssignMasterSource( Value );
end;

procedure TFrmMfgConversion.Append_Mfg_Conv_IndexOf( I: Integer );
begin
  if not TblMfg_Conv.Locate('field_name', FFieldList[ I ], []) then
  begin
    TblMfg_Conv.Append;

    TblMfg_ConvFIELD_NAME.asString:= FFieldList[ I ];
    TblMfg_ConvCAPTION.asString   := TMfgConvCargo(FFieldList.Objects[ I ]).FDefault;
    TblMfg_ConvFACTOR.asFloat     := 1;

    TblMfg_Conv.Post;
  end;
end;

procedure TFrmMfgConversion.DBGrid1EditButtonClick(Sender: TObject);
var
  AUserDefUOM: string;
  AFactor    : Real;
begin
  AUserDefUOM:= TblMfg_ConvUOM.asString;
  if (TblMfg_ConvDefaultUOM.asString > '')
     and DoMfgConvDefineUOM( TblMfg_ConvDefaultUOM.asString, AUserDefUOM, AFactor ) then
  begin
     TblMfg_Conv.Edit;

     if (TblMfg_ConvUOM.asString <> AUserDefUOM) then
        TblMfg_ConvCAPTION.asString:= ProperCase(AUserDefUOM);

     TblMfg_ConvUOM.asString  := AUserDefUOM;
     TblMfg_ConvFACTOR.asFloat:= AFactor;
  end;
end;

end.



