unit Inv_phys_chars_uom;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  vcl.Wwdatainspector,
  IQMS.WebVcl.About,
  Data.DB,
  vcl.wwdatsrc,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Hpick,
  Vcl.Menus,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  MainModule,
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu, Vcl.Grids;

type
  TFrmInvPhysCharsUom = class(TUniForm)
    Panel1: TUniPanel;
    sbtnCopyFromDefault: TUniSpeedButton;
    NavMain: TUniDBNavigator;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    Contents1: TUniMenuItem;
    About1: TUniMenuItem;
    PKEplant: TIQWebHPick;
    PKEplantID: TFloatField;
    PKEplantNAME: TStringField;
    SR: TIQWebSecurityRegister;
    QryInvPhysCharUoms: TFDQuery;
    SrcInvPhysCharUoms: TDataSource;
    IQAbout1: TIQWebAbout;
    wwDataInspector1: TwwDataInspector;
    QryInvPhysCharUomsSOURCE_NAME: TStringField;
    QryInvPhysCharUomsEPLANT_ID: TFMTBCDField;
    QryInvPhysCharUomsLENGTH_UOM: TStringField;
    QryInvPhysCharUomsWIDTH_UOM: TStringField;
    QryInvPhysCharUomsGAUGE_UOM: TStringField;
    QryInvPhysCharUomsCORE_SIZE_UOM: TStringField;
    QryInvPhysCharUomsOD_UOM: TStringField;
    QryInvPhysCharUomsVOLUME_UOM: TStringField;
    procedure QryInvPhysCharUomsAfterPost(DataSet: TDataSet);
    procedure QryInvPhysCharUomsUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    { TODO -oathite -cWebConvert :
Event dosen't exists for TUniDBNavigator
Undeclared identifire: 'TNavigateBtn', 'nbRefresh', 'nbInsert', 'nbDelete'
    procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);  }
    procedure sbtnCopyFromDefaultClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure CopyFromDefaultTo(AEPlant_ID: Real);
    procedure DeleteEPlant;
    procedure InsertEPlant;
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoInvPhysCharsUom;

function GetInvLengthUOM( AEplantID: Real): String;
function GetInvWidthUOM( AEplantID: Real): String;
function GetInvGaugeUOM( AEplantID: Real): String;
function GetInvCoreSizeUOM( AEplantID: Real): String;
function GetInvODUOM( AEplantID: Real): String;
function GetInvVolumeUOM( AEplantID: Real): String;

implementation

uses
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous;
  { TODO -oathite -cWebConvert : Dependent on IQSecIns
  IQSecIns; }

{$R *.dfm}

procedure DoInvPhysCharsUom;
var
  LFrmInvPhysCharsUom : TFrmInvPhysCharsUom;
begin
  LFrmInvPhysCharsUom := TFrmInvPhysCharsUom.Create(uniGUIApplication.UniApplication);
  LFrmInvPhysCharsUom.ShowModal;
end;

function GetInvLengthUOM( AEplantID: Real): String;
begin
 Result := SelectValueFmtAsString('select iqsys3_settings.get_inv_length_uom(%.0f, ''Y'') from dual', [AEplantID]);
end;

function GetInvWidthUOM( AEplantID: Real): String;
begin
 Result := SelectValueFmtAsString('select iqsys3_settings.get_inv_width_uom(%.0f, ''Y'') from dual', [AEplantID]);
end;

function GetInvGaugeUOM( AEplantID: Real): String;
begin
 Result := SelectValueFmtAsString('select iqsys3_settings.get_inv_gauge_uom(%.0f, ''Y'') from dual', [AEplantID]);
end;

function GetInvCoreSizeUOM( AEplantID: Real): String;
begin
 Result := SelectValueFmtAsString('select iqsys3_settings.get_inv_core_size_uom(%.0f, ''Y'') from dual', [AEplantID]);
end;

function GetInvODUOM( AEplantID: Real): String;
begin
 Result := SelectValueFmtAsString('select iqsys3_settings.get_inv_od_uom(%.0f, ''Y'') from dual', [AEplantID]);
end;

function GetInvVolumeUOM( AEplantID: Real): String;
begin
 Result := SelectValueFmtAsString('select iqsys3_settings.get_inv_volume_uom(%.0f, ''Y'') from dual', [AEplantID]);
end;

procedure TFrmInvPhysCharsUom.Exit1Click(Sender: TObject);
begin
 Close;
end;

procedure TFrmInvPhysCharsUom.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmInvPhysCharsUom.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
  Action:= caFree;
end;

procedure TFrmInvPhysCharsUom.FormShow(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self ]);
  { TODO -oathite -cWebConvert : Dependent on IQSecIns
  EnsureSecurityInspectorOnTopOf( self );  {IQSecIns.pas}
end;
{ TODO -oathite -cWebConvert :
Event dosen't exists for TUniDBNavigator
Undeclared identifire: 'TNavigateBtn', 'nbRefresh', 'nbInsert', 'nbDelete' }
{
procedure TFrmInvPhysCharsUom.NavMainBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  case Button of
    nbRefresh:
      begin
        RefreshDataSetByID( QryInvPhysCharUoms, 'eplant_id' );
        ABORT;
      end;
    nbInsert : InsertEPlant;
    nbDelete : DeleteEPlant;
  end;
end;}

procedure TFrmInvPhysCharsUom.QryInvPhysCharUomsAfterPost(DataSet: TDataSet);
begin
  IQApplyUpdateToTable( DataSet );
end;

procedure TFrmInvPhysCharsUom.QryInvPhysCharUomsUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  if ARequest = arUpdate then
  begin
    ExecuteCommandFmt('begin iqsys3_settings.update_setting( ' +
      'iqsys3_settings.INV_PHYS_CHARS_UOM, iqsys3_settings.INV_LENGTH_UOM, ''%s'', %.0f); end;',
      [ASender.FieldByName('LENGTH_UOM').asString,
       ASender.FieldByName('EPLANT_ID').asFloat]);

    ExecuteCommandFmt('begin iqsys3_settings.update_setting( ' +
      'iqsys3_settings.INV_PHYS_CHARS_UOM, iqsys3_settings.INV_WIDTH_UOM, ''%s'', %.0f); end;',
      [ASender.FieldByName('WIDTH_UOM').asString,
       ASender.FieldByName('EPLANT_ID').asFloat]);

    ExecuteCommandFmt('begin iqsys3_settings.update_setting( ' +
      'iqsys3_settings.INV_PHYS_CHARS_UOM, iqsys3_settings.INV_GAUGE_UOM, ''%s'', %.0f); end;',
      [ASender.FieldByName('GAUGE_UOM').asString,
       ASender.FieldByName('EPLANT_ID').asFloat]);

    ExecuteCommandFmt('begin iqsys3_settings.update_setting( ' +
      'iqsys3_settings.INV_PHYS_CHARS_UOM, iqsys3_settings.INV_CORE_SIZE_UOM, ''%s'', %.0f); end;',
      [ASender.FieldByName('CORE_SIZE_UOM').asString,
       ASender.FieldByName('EPLANT_ID').asFloat]);

    ExecuteCommandFmt('begin iqsys3_settings.update_setting( ' +
      'iqsys3_settings.INV_PHYS_CHARS_UOM, iqsys3_settings.INV_OD_UOM, ''%s'', %.0f); end;',
      [ASender.FieldByName('OD_UOM').asString,
       ASender.FieldByName('EPLANT_ID').asFloat]);

    ExecuteCommandFmt('begin iqsys3_settings.update_setting( ' +
      'iqsys3_settings.INV_PHYS_CHARS_UOM, iqsys3_settings.INV_VOLUME_UOM, ''%s'', %.0f); end;',
      [ASender.FieldByName('VOLUME_UOM').asString,
       ASender.FieldByName('EPLANT_ID').asFloat]);
  end;

  AAction := eaApplied;
end;

procedure TFrmInvPhysCharsUom.sbtnCopyFromDefaultClick(Sender: TObject);
begin
  IQAssert( QryInvPhysCharUomsEPLANT_ID.asFloat > 0, 'Select EPlant column to copy over from the System Default parameters' );

  if not IQConfirmYN(Format('Copy System Default UOMs to selected %s eplant?', [ QryInvPhysCharUomsSOURCE_NAME.asString ])) then
     EXIT;

  CopyFromDefaultTo( QryInvPhysCharUomsEPLANT_ID.asFloat );
  RefreshDataSetByID( QryInvPhysCharUoms, 'eplant_id' );
end;

procedure TFrmInvPhysCharsUom.InsertEPlant;
begin
  with PKEplant do
    if Execute then
    begin
      CopyFromDefaultTo( GetValue('ID'));
      Reopen( QryInvPhysCharUoms );
      QryInvPhysCharUoms.Locate('eplant_id', GetValue('ID'), []);
    end;

  ABORT;
end;

procedure TFrmInvPhysCharsUom.DeleteEPlant;
begin
  IQAssert( QryInvPhysCharUomsEPLANT_ID.asFloat > 0, 'Cannot delete System Default parameters.' );
  try
    if not IQConfirmYN('Delete record?') then
       EXIT;
    ExecuteCommandFmt('delete from iqsys3 where app_code = iqsys3_settings.INV_PHYS_CHARS_UOM and eplant_id = %.0f',
      [ QryInvPhysCharUomsEPLANT_ID.asFloat ]);
    Reopen( QryInvPhysCharUoms );
    QryInvPhysCharUoms.Locate('eplant_id', 0, []); {to solve weird datainspector display problem}
  finally
    ABORT;
  end;
end;

procedure TFrmInvPhysCharsUom.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmInvPhysCharsUom.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmInvPhysCharsUom.CopyFromDefaultTo( AEPlant_ID: Real );
begin
    ExecuteCommandFmt('begin iqsys3_settings.update_setting( ' +
      'iqsys3_settings.INV_PHYS_CHARS_UOM, iqsys3_settings.INV_LENGTH_UOM, ' +
      'iqsys3_settings.get_inv_length_uom(null), %.0f); end;',
      [AEPlant_ID]);

    ExecuteCommandFmt('begin iqsys3_settings.update_setting( ' +
      'iqsys3_settings.INV_PHYS_CHARS_UOM, iqsys3_settings.INV_WIDTH_UOM, ' +
      'iqsys3_settings.get_inv_width_uom(null), %.0f); end;',
      [AEPlant_ID]);

    ExecuteCommandFmt('begin iqsys3_settings.update_setting( ' +
      'iqsys3_settings.INV_PHYS_CHARS_UOM, iqsys3_settings.INV_GAUGE_UOM, ' +
      'iqsys3_settings.get_inv_gauge_uom(null), %.0f); end;',
      [AEPlant_ID]);

    ExecuteCommandFmt('begin iqsys3_settings.update_setting( ' +
      'iqsys3_settings.INV_PHYS_CHARS_UOM, iqsys3_settings.INV_CORE_SIZE_UOM, ' +
      'iqsys3_settings.get_inv_core_size_uom(null), %.0f); end;',
      [AEPlant_ID]);

    ExecuteCommandFmt('begin iqsys3_settings.update_setting( ' +
      'iqsys3_settings.INV_PHYS_CHARS_UOM, iqsys3_settings.INV_OD_UOM, ' +
      'iqsys3_settings.get_inv_od_uom(null), %.0f); end;',
      [AEPlant_ID]);

    ExecuteCommandFmt('begin iqsys3_settings.update_setting( ' +
      'iqsys3_settings.INV_PHYS_CHARS_UOM, iqsys3_settings.INV_VOLUME_UOM, ' +
      'iqsys3_settings.get_inv_volume_uom(null), %.0f); end;',
      [AEPlant_ID]);
end;

end.
