unit inv_trans_shuttle_locs;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.About,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  IQMS.WebVcl.SecurityRegister,
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
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmInvTransShuttleLocs = class(TUniForm)
    Panel1: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    SrcDivStaging: TDataSource;
    QryDivStaging: TFDQuery;
    QryDivStagingFromDivision: TStringField;
    QryDivStagingToDivision: TStringField;
    QryDivStagingFromLocation: TStringField;
    QryDivStagingToLocation: TStringField;
    wwDBComboDlgFromDiv: TUniEdit;
    wwDBComboDlgFromLoc: TUniEdit;
    wwDBComboDlgToDiv: TUniEdit;
    wwDBComboDlgToLoc: TUniEdit;
    UpdateSQLDivStaging: TFDUpdateSQL;
    PkLocation: TIQWebHPick;
    PkLocationID: TBCDField;
    PkLocationLOCATION: TStringField;
    PkLocationDESCRIPTION: TStringField;
    PkLocationEPLANT_ID: TBCDField;
    PkDivision: TIQWebHPick;
    PkDivisionID: TBCDField;
    PkDivisionNAME: TStringField;
    PkDivisionDESCRIP: TStringField;
    PkDivisionEPLANT_ID: TBCDField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    QryDivStagingID: TBCDField;
    QryDivStagingFROM_DIVISION_ID: TBCDField;
    QryDivStagingTO_DIVISION_ID: TBCDField;
    QryDivStagingFROM_LOCATIONS_ID: TBCDField;
    QryDivStagingTO_LOCATIONS_ID: TBCDField;
    SR: TIQWebSecurityRegister;
    Contents1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryDivStagingBeforePost(DataSet: TDataSet);
    procedure QryDivStagingCalcFields(DataSet: TDataSet);
    procedure ApplyUpdate(DataSet: TDataSet);
    procedure PkLocationBeforeOpen(DataSet: TDataSet);
    procedure wwDBComboDlgFromLocCustomDlg(Sender: TObject);
    procedure wwDBComboDlgToLocCustomDlg(Sender: TObject);
    procedure wwDBComboDlgFromDivCustomDlg(Sender: TObject);
    procedure wwDBComboDlgToDivCustomDlg(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    { TODO -oSanketG -cWC : Need to find alternative component for TNavigateBtn }
    //procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FPickListDivision_ID: Real;
    FIs_Whs_Division: Boolean;
    procedure PickReplaceLocationBasedOnDivision(ADivision_ID: Real;
      ALocationField: TField);
    procedure PickReplaceDivision(ADivisionField: TField);
  public
    { Public declarations }
    class procedure DoShow();
  end;



implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.SysShare,
  IQMS.Common.HelpHook;

{ TFrmInvTransShuttleLocs }

class procedure TFrmInvTransShuttleLocs.DoShow();
var
  FrmInvTransShuttleLocs: TFrmInvTransShuttleLocs;
begin
  FrmInvTransShuttleLocs := self.Create(UniGUIApplication.uniApplication);
  FrmInvTransShuttleLocs.Show;
end;

procedure TFrmInvTransShuttleLocs.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmInvTransShuttleLocs.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TFrmInvTransShuttleLocs.ApplyUpdate(DataSet: TDataSet);
begin
//  IQApplyUpdateToTable(DataSet);
end;

{procedure TFrmInvTransShuttleLocs.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh( Sender, Button );
end;}

procedure TFrmInvTransShuttleLocs.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( HelpContext );
end;

procedure TFrmInvTransShuttleLocs.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmWMS{CHM}, iqhtmWMS{HTM} );
end;

procedure TFrmInvTransShuttleLocs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self, wwDBGrid1 ]);
end;

procedure TFrmInvTransShuttleLocs.PkLocationBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
    ParamByName('division_id').Value := FPickListDivision_ID;
end;

procedure TFrmInvTransShuttleLocs.QryDivStagingBeforePost(DataSet: TDataSet);

  procedure _RaiseMismatchError( S:string );
  begin
    if FIs_Whs_Division then
       S:= IQMS.Common.SysShare.CheckReplaceDivisionCaption( S );
    raise Exception.Create( S );
  end;

  procedure _ValidateDivisionLocation( ADivision_ID, ALocations_ID: Real; AOrigin: string );
  var
    A: Variant;
    ADivision_EPlant_ID: Real;
    S: string;
  begin
    ADivision_EPlant_ID:= SelectValueByID('eplant_id', 'division', ADivision_ID);
    A:= SelectValueArrayFmt( 'select division_id, eplant_id from locations where id = %f', [ ALocations_ID ]);
    IQAssert( VarArrayDimCount( A ) > 0, Format('Invalid locations id %.0f (%s)', [ ALocations_ID, AOrigin ]));

    if ADivision_ID <> A[ 0 ] then
       _RaiseMismatchError(Format('Selected Division and Selected Location Division Mismatch (%s) - Operation Aborted', [ AOrigin ]));

    if ADivision_EPlant_ID <> A[ 1 ] then
       _RaiseMismatchError(Format('Selected Division EPlant and Selected Location EPlant Mismatch (%s) - Operation Aborted', [ AOrigin ]));
  end;

begin
  IQAssignIDBeforePost( DataSet, 'DIV_STAGING_LOC');

  IQAssert( QryDivStagingFROM_DIVISION_ID.asFloat <> QryDivStagingTO_DIVISION_ID.asFloat, 'Invalid From/To Division/Warehouse');

  _ValidateDivisionLocation( QryDivStagingFROM_DIVISION_ID.asFloat, QryDivStagingFROM_LOCATIONS_ID.asFloat, 'FROM' );
  _ValidateDivisionLocation( QryDivStagingTO_DIVISION_ID.asFloat, QryDivStagingTO_LOCATIONS_ID.asFloat, 'TO' );
end;

procedure TFrmInvTransShuttleLocs.QryDivStagingCalcFields(DataSet: TDataSet);
begin
  if QryDivStagingFROM_DIVISION_ID.asFloat > 0 then
     QryDivStagingFromDivision.asString:= SelectValueByID('name', 'division', QryDivStagingFROM_DIVISION_ID.asFloat);

  if QryDivStagingTO_DIVISION_ID.asFloat > 0 then
     QryDivStagingToDivision.asString:= SelectValueByID('name', 'division', QryDivStagingTO_DIVISION_ID.asFloat);

  if QryDivStagingFROM_LOCATIONS_ID.asFloat > 0 then
     QryDivStagingFromLocation.asString:= SelectValueByID('loc_desc', 'locations', QryDivStagingFROM_LOCATIONS_ID.asFloat );

  if QryDivStagingTO_LOCATIONS_ID.asFloat > 0 then
     QryDivStagingToLocation.asString:= SelectValueByID('loc_desc', 'locations', QryDivStagingTO_LOCATIONS_ID.asFloat );
end;

procedure TFrmInvTransShuttleLocs.UniFormCreate(Sender: TObject);
begin
  //IQMS.Common.SysShare.CheckReplaceDivisionOfWWSelected( wwDBGrid1.Selected );
  //wwDBGrid1.ApplySelected;

  FIs_Whs_Division:= Is_Whs_Division;
  IQRegFormRead(self, [ self, wwDBGrid1 ]);
  IQSetTablesActive(TRUE, self);
end;

procedure TFrmInvTransShuttleLocs.wwDBComboDlgFromDivCustomDlg(Sender: TObject);
begin
  PickReplaceDivision( QryDivStagingFROM_DIVISION_ID );
end;

procedure TFrmInvTransShuttleLocs.wwDBComboDlgToDivCustomDlg(Sender: TObject);
begin
  PickReplaceDivision( QryDivStagingTO_DIVISION_ID );
end;

procedure TFrmInvTransShuttleLocs.wwDBComboDlgFromLocCustomDlg(Sender: TObject);
begin
  PickReplaceLocationBasedOnDivision( QryDivStagingFROM_DIVISION_ID.asFloat, QryDivStagingFROM_LOCATIONS_ID );
end;

procedure TFrmInvTransShuttleLocs.wwDBComboDlgToLocCustomDlg(Sender: TObject);
begin
  PickReplaceLocationBasedOnDivision( QryDivStagingTO_DIVISION_ID.asFloat, QryDivStagingTO_LOCATIONS_ID );
end;

procedure TFrmInvTransShuttleLocs.PickReplaceDivision( ADivisionField: TField );
begin
  with PkDivision do
    if Execute then
    begin
      QryDivStaging.Edit;
      ADivisionField.asFloat:= GetValue('id');
    end;
end;


procedure TFrmInvTransShuttleLocs.PickReplaceLocationBasedOnDivision( ADivision_ID: Real; ALocationField: TField );
begin
  FPickListDivision_ID:= ADivision_ID;
  with PkLocation do
    if Execute then
    begin
      QryDivStaging.Edit;
      ALocationField.asFloat:= GetValue('id');
    end;
end;


end.
