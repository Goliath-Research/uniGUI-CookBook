// To add a new parameter:
//1. add pk_tkt_xxx to both params and eplant
//2. edit v_pk_tkt_params
//3. add new wrapper (this unit)
//4. add new field to datainspector (this unit)

unit PsTkPara;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  Vcl.wwDataInspector,
  Vcl.Wwdatsrc,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Hpick,
  Vcl.Buttons,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Stan.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Controls,
  Vcl.dbctrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  UniMainMenu,
  uniGUIApplication,
  uniDBNavigator, Vcl.Grids;

type
  TFrmPsTckParam = class(TUniForm)
    SrcPkTktParams: TDataSource;
    QryPkTktParams: TFDQuery;
    wwDataInspector1: TwwDataInspector;
    Panel1: TUniPanel;
    NavMain: TUniDBNavigator;
    QryPkTktParamsSOURCE_NAME: TStringField;
    QryPkTktParamsSOURCE_TABLE: TStringField;
    QryPkTktParamsSOURCE_ID: TFMTBCDField;
    QryPkTktParamsIS_APPLICABLE: TStringField;
    QryPkTktParamsPK_TKT_ORDERS_BASED: TStringField;
    QryPkTktParamsPK_TKT_SO_MODE_PKLIST_BY_DIV: TStringField;
    QryPkTktParamsPK_TKT_PICK_BY_CUSTOMER: TStringField;
    QryPkTktParamsPK_TKT_ONE_PER_CUSTOMER: TStringField;
    QryPkTktParamsPK_TKT_SHOW_ALL: TStringField;
    QryPkTktParamsPK_TKT_KEEP_REL_SEPARATE: TStringField;
    QryPkTktParamsPK_TKT_USE_SHIP_DEFAULT: TStringField;
    QryPkTktParamsPK_TKT_CONV_USE_SYSDATE: TStringField;
    QryPkTktParamsRF_SERIALIZED_ROUTING: TStringField;
    QryPkTktParamsPK_TKT_SORT_NULL_RAN_TOP: TStringField;
    QryPkTktParamsPK_TKT_ENABLE_VOLUME_CALC: TStringField;
    QryPkTktParamsCALC_SHIP_DAY_START_VALID: TStringField;
    QryPkTktParamsPK_TKT_DO_NOT_PRNT_PS_ON_CONV: TStringField;
    QryPkTktParamsPK_TKT_DO_NOT_PRNT_BOL_ON_CONV: TStringField;
    QryPkTktParamsPS_EVAL_OVERSHIP: TStringField;
    QryPkTktParamsPS_VERIFY_INVENTORY: TStringField;
    QryPkTktParamsPK_TKT_SO_SYNC_AFTER_EDI: TStringField;
    QryPkTktParamsPK_TKT_ASSIGN_ASN_ON_PRINT_LBL: TStringField;
    QryPkTktParamsPK_TKT_LABEL_MUST_BE_DISPO: TStringField;
    StatusBar1: TUniStatusBar;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    PKEplant: TIQWebHPick;
    PKEplantID: TFloatField;
    PKEplantNAME: TStringField;
    sbtnCopyFromDefault: TUniSpeedButton;
    QryPkTktParamsPK_TKT_STAGE_BY_PALLET: TStringField;
    Bevel1: TUniPanel;
    QryPkTktParamsPK_TKT_HARD_ALLOC_ON_PICK: TStringField;
    Contents1: TUniMenuItem;
    QryPkTktParamsPK_TKT_PKLIST_BY_SO_DIV: TStringField;
    QryPkTktParamsPK_TKT_USE_DOCK_SCHEDULER: TStringField;
    SR: TIQWebSecurityRegister;
    QryPkTktParamsPS_SKIP_VERIFY_INV_DROP_SHIP: TStringField;
    QryPkTktParamsPK_TKT_SHOW_BACKORDER: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DispatchAction(Sender: TObject; Button: TNavigateBtn);
    procedure wwDataInspector1AfterSelectCell(Sender: TwwDataInspector;
      ObjItem: TwwInspectorItem);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure QryPkTktParamsUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure QryPkTktParamsAfterPost(DataSet: TDataSet);
    procedure wwDataInspector1DrawCaptionCell(Sender: TwwDataInspector;
      ObjItem: TwwInspectorItem; ASelected: Boolean; ACellRect: TRect;
      var ACaptionRect: TRect; var DefaultTextDrawing: Boolean);
    procedure sbtnCopyFromDefaultClick(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure wwDataInspector1ItemChanged(Sender: TwwDataInspector;
      Item: TwwInspectorItem; NewValue: string);
  private
    procedure RefreshDataSet(Sender: TObject;  Button: TNavigateBtn);
    procedure InsertEPlant;
    procedure CopyFromDefaultTo(AEPlant_ID: Real);
    procedure DeleteEPlant;
    function CheckChildFieldValues(Item: TwwInspectorItem): Boolean;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;


procedure DoPkTktParams;

function GetPkTktShowAllValue: Boolean;
function GetPkTktOnePOPerPS( AShip_To_ID: Real ): Boolean;
function GetPkTktOneSOPerPS( AShip_To_ID: Real ): Boolean;
function OnePkTicketPerCustomer: Boolean;
function PickByCustomer: Boolean;

function GetPK_TKT_ORDERS_BASED           : Boolean;
function GetPK_TKT_SO_MODE_PKLIST_BY_DIV  : Boolean;
function GetPK_TKT_PICK_BY_CUSTOMER       : Boolean;
function GetPK_TKT_ONE_PER_CUSTOMER       : Boolean;
function GetPK_TKT_SHOW_ALL               : Boolean;
function GetPK_TKT_KEEP_REL_SEPARATE      : Boolean;
function GetPK_TKT_USE_SHIP_DEFAULT       : Boolean;
function GetPK_TKT_CONV_USE_SYSDATE       : Boolean;
function GetRF_SERIALIZED_ROUTING         : Boolean;
function GetPK_TKT_SORT_NULL_RAN_TOP      : Boolean;
function GetPK_TKT_ENABLE_VOLUME_CALC     : Boolean;
function GetCALC_SHIP_DAY_START_VALID     : Boolean;
function GetPK_TKT_DO_NOT_PRNT_PS_ON_CONV : Boolean;
function GetPK_TKT_DO_NOT_PRNT_BOL_ON_CONV: Boolean;
function GetPS_EVAL_OVERSHIP              : Boolean;
function GetPS_VERIFY_INVENTORY           : Boolean;
function GetPK_TKT_SO_SYNC_AFTER_EDI      : Boolean;
function GetPK_TKT_ASSIGN_ASN_ON_PRINT_LBL: Boolean;
function GetPK_TKT_LABEL_MUST_BE_DISPO    : Boolean;
function GetPK_TKT_STAGE_BY_PALLET        : Boolean;
function GetPK_TKT_HARD_ALLOC_ON_PICK     : Boolean;
function GetPK_TKT_PKLIST_BY_SO_DIV       : Boolean;
function GetPK_TKT_USE_DOCK_SCHEDULER     : Boolean;
function GetPS_SKIP_VERIFY_INV_DROP_SHIP  : Boolean;
function GetPK_TKT_SHOW_BACKORDER         : Boolean;

function CheckAddFilterShipDateExpression( AShipDateFieldName: string ): string;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Numbers,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Dialogs,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.HelpHook;


procedure DoPkTktParams;
begin
    TFrmPsTckParam.Create(uniGUIApplication.UniApplication).ShowModal;
end;


function GetPkTktOnePOPerPS( AShip_To_ID: Real ): Boolean;
begin
  try
    Result:= SelectValueFmtAsString('select a.one_po_per_ps from arcusto a, ship_to s where a.id = s.arcusto_id and s.id = %f', [ AShip_To_ID ]) = 'Y';
  except
    Result:= FALSE;
  end;
end;

function GetPkTktOneSOPerPS( AShip_To_ID: Real ): Boolean;
begin
  try
    Result:= SelectValueFmtAsString('select a.one_so_per_ps from arcusto a, ship_to s where a.id = s.arcusto_id and s.id = %f', [ AShip_To_ID ]) = 'Y';
  except
    Result:= FALSE;
  end;
end;


{------------------------------------------------------------------------------}
{ Aux functions }
{------------------------------------------------------------------------------}
function Is_USE_EPLANT_PK_TKT_PARAMS( AEplant_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsString('select use_eplant_pk_tkt_params from eplant where id = %f', [ AEplant_ID ]) = 'Y';
end;

{------------------------------------------------------------------------------}
function GetPkTktParam( AFieldName: string ): Boolean;
begin
  Result:= FALSE;

  if (SecurityManager.EPlant_ID_AsFloat > 0) and (Is_USE_EPLANT_PK_TKT_PARAMS( SecurityManager.EPlant_ID_AsFloat )) then
  begin
    Result:= SelectValueFmtAsString('select %s from eplant where id = %f', [ AFieldName, SecurityManager.EPlant_ID_AsFloat ]) = 'Y';
    EXIT;
  end;

  Result:= SelectValueFmtAsString('select %s from params', [ AFieldName ]) = 'Y';
end;


{------------------------------------------------------------------------------}
{ Wrappers }
{------------------------------------------------------------------------------}
function GetPK_TKT_ORDERS_BASED           : Boolean; begin Result:= GetPkTktParam( 'PK_TKT_ORDERS_BASED' );            end;
function GetPK_TKT_SO_MODE_PKLIST_BY_DIV  : Boolean; begin Result:= GetPkTktParam( 'PK_TKT_SO_MODE_PKLIST_BY_DIV' );   end;
function GetPK_TKT_PICK_BY_CUSTOMER       : Boolean; begin Result:= GetPkTktParam( 'PK_TKT_PICK_BY_CUSTOMER' );        end;
function GetPK_TKT_ONE_PER_CUSTOMER       : Boolean; begin Result:= GetPkTktParam( 'PK_TKT_ONE_PER_CUSTOMER' );        end;
function GetPK_TKT_SHOW_ALL               : Boolean; begin Result:= GetPkTktParam( 'PK_TKT_SHOW_ALL' );                end;
function GetPK_TKT_KEEP_REL_SEPARATE      : Boolean; begin Result:= GetPkTktParam( 'PK_TKT_KEEP_REL_SEPARATE' );       end;
function GetPK_TKT_USE_SHIP_DEFAULT       : Boolean; begin Result:= GetPkTktParam( 'PK_TKT_USE_SHIP_DEFAULT' );        end;
function GetPK_TKT_CONV_USE_SYSDATE       : Boolean; begin Result:= GetPkTktParam( 'PK_TKT_CONV_USE_SYSDATE' );        end;
function GetRF_SERIALIZED_ROUTING         : Boolean; begin Result:= GetPkTktParam( 'RF_SERIALIZED_ROUTING' );          end;
function GetPK_TKT_SORT_NULL_RAN_TOP      : Boolean; begin Result:= GetPkTktParam( 'PK_TKT_SORT_NULL_RAN_TOP' );       end;
function GetPK_TKT_ENABLE_VOLUME_CALC     : Boolean; begin Result:= GetPkTktParam( 'PK_TKT_ENABLE_VOLUME_CALC' );      end;
function GetCALC_SHIP_DAY_START_VALID     : Boolean; begin Result:= GetPkTktParam( 'CALC_SHIP_DAY_START_VALID' );      end;
function GetPK_TKT_DO_NOT_PRNT_PS_ON_CONV : Boolean; begin Result:= GetPkTktParam( 'PK_TKT_DO_NOT_PRNT_PS_ON_CONV' );  end;
function GetPK_TKT_DO_NOT_PRNT_BOL_ON_CONV: Boolean; begin Result:= GetPkTktParam( 'PK_TKT_DO_NOT_PRNT_BOL_ON_CONV' ); end;
function GetPS_EVAL_OVERSHIP              : Boolean; begin Result:= GetPkTktParam( 'PS_EVAL_OVERSHIP' );               end;
function GetPS_VERIFY_INVENTORY           : Boolean; begin Result:= GetPkTktParam( 'PS_VERIFY_INVENTORY' );            end;
function GetPK_TKT_SO_SYNC_AFTER_EDI      : Boolean; begin Result:= GetPkTktParam( 'PK_TKT_SO_SYNC_AFTER_EDI' );       end;
function GetPK_TKT_ASSIGN_ASN_ON_PRINT_LBL: Boolean; begin Result:= GetPkTktParam( 'PK_TKT_ASSIGN_ASN_ON_PRINT_LBL' ); end;
function GetPK_TKT_LABEL_MUST_BE_DISPO    : Boolean; begin Result:= GetPkTktParam( 'PK_TKT_LABEL_MUST_BE_DISPO' );     end;
function GetPK_TKT_STAGE_BY_PALLET        : Boolean; begin Result:= GetPkTktParam( 'PK_TKT_STAGE_BY_PALLET' );         end;
function GetPK_TKT_HARD_ALLOC_ON_PICK     : Boolean; begin Result:= GetPkTktParam( 'PK_TKT_HARD_ALLOC_ON_PICK' );      end;
function GetPK_TKT_PKLIST_BY_SO_DIV       : Boolean; begin Result:= GetPkTktParam( 'PK_TKT_PKLIST_BY_SO_DIV' );        end;
function GetPK_TKT_USE_DOCK_SCHEDULER     : Boolean; begin Result:= GetPkTktParam( 'PK_TKT_USE_DOCK_SCHEDULER' );      end;
function GetPS_SKIP_VERIFY_INV_DROP_SHIP  : Boolean; begin Result:= GetPkTktParam( 'PS_SKIP_VERIFY_INV_DROP_SHIP' );   end;
function GetPK_TKT_SHOW_BACKORDER         : Boolean; begin Result:= GetPkTktParam( 'PK_TKT_SHOW_BACKORDER' );          end;


{------------------------------------------------------------------------------}
{ Backwards compatability}
{------------------------------------------------------------------------------}
function PickByCustomer                   : Boolean; begin Result:= GetPK_TKT_PICK_BY_CUSTOMER; end;
function OnePkTicketPerCustomer           : Boolean; begin Result:= GetPK_TKT_ONE_PER_CUSTOMER; end;
function GetPkTktShowAllValue             : Boolean; begin Result:= GetPK_TKT_SHOW_ALL;         end;


{ TFrmPsTckParams }

constructor TFrmPsTckParam.Create(AOwner: TComponent);
begin
  inherited;
  IQSetTablesActive(TRUE, self);

//  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PK_TKT_ORDERS_BASED',           'QryPkTktParamsPK_TKT_ORDERS_BASED',           SR);
//  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PK_TKT_SO_MODE_PKLIST_BY_DIV',  'QryPkTktParamsPK_TKT_SO_MODE_PKLIST_BY_DIV',  SR);
//  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PK_TKT_PICK_BY_CUSTOMER',       'QryPkTktParamsPK_TKT_PICK_BY_CUSTOMER',       SR);
//  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PK_TKT_ONE_PER_CUSTOMER',       'QryPkTktParamsPK_TKT_ONE_PER_CUSTOMER',       SR);
//  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PK_TKT_SHOW_ALL',               'QryPkTktParamsPK_TKT_SHOW_ALL',               SR);
//  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PK_TKT_KEEP_REL_SEPARATE',      'QryPkTktParamsPK_TKT_KEEP_REL_SEPARATE',      SR);
//  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PK_TKT_USE_SHIP_DEFAULT',       'QryPkTktParamsPK_TKT_USE_SHIP_DEFAULT',       SR);
//  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PK_TKT_CONV_USE_SYSDATE',       'QryPkTktParamsPK_TKT_CONV_USE_SYSDATE',       SR);
//  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'RF_SERIALIZED_ROUTING',         'QryPkTktParamsRF_SERIALIZED_ROUTING',         SR);
//  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PK_TKT_SORT_NULL_RAN_TOP',      'QryPkTktParamsPK_TKT_SORT_NULL_RAN_TOP',      SR);
//  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PK_TKT_ENABLE_VOLUME_CALC',     'QryPkTktParamsPK_TKT_ENABLE_VOLUME_CALC',     SR);
//  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'CALC_SHIP_DAY_START_VALID',     'QryPkTktParamsCALC_SHIP_DAY_START_VALID',     SR);
//  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PK_TKT_DO_NOT_PRNT_PS_ON_CONV', 'QryPkTktParamsPK_TKT_DO_NOT_PRNT_PS_ON_CONV', SR);
//  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PK_TKT_DO_NOT_PRNT_BOL_ON_CONV','QryPkTktParamsPK_TKT_DO_NOT_PRNT_BOL_ON_CONV',SR);
//  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PS_EVAL_OVERSHIP',              'QryPkTktParamsPS_EVAL_OVERSHIP',              SR);
//  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PS_VERIFY_INVENTORY',           'QryPkTktParamsPS_VERIFY_INVENTORY',           SR);
//  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PK_TKT_SO_SYNC_AFTER_EDI',      'QryPkTktParamsPK_TKT_SO_SYNC_AFTER_EDI',      SR);
//  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PK_TKT_ASSIGN_ASN_ON_PRINT_LBL','QryPkTktParamsPK_TKT_ASSIGN_ASN_ON_PRINT_LBL',SR);
//  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PK_TKT_LABEL_MUST_BE_DISPO',    'QryPkTktParamsPK_TKT_LABEL_MUST_BE_DISPO',    SR);
//  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PK_TKT_STAGE_BY_PALLET',        'QryPkTktParamsPK_TKT_STAGE_BY_PALLET',        SR);
//  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PK_TKT_HARD_ALLOC_ON_PICK',     'QryPkTktParamsPK_TKT_HARD_ALLOC_ON_PICK',     SR);
//  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PK_TKT_PKLIST_BY_SO_DIV',       'QryPkTktParamsPK_TKT_PKLIST_BY_SO_DIV',       SR);
//  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PK_TKT_USE_DOCK_SCHEDULER',     'QryPkTktParamsPK_TKT_USE_DOCK_SCHEDULER',     SR);
//  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PS_SKIP_VERIFY_INV_DROP_SHIP',  'QryPkTktParamsPS_SKIP_VERIFY_INV_DROP_SHIP',  SR);
//  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PK_TKT_SHOW_BACKORDER',         'QryPkTktParamsPK_TKT_SHOW_BACKORDER',         SR);
end;

procedure TFrmPsTckParam.FormShow(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmPsTckParam.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSHIP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmPsTckParam.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmPsTckParam.DispatchAction(Sender: TObject;  Button: TNavigateBtn);
begin
  case Button of
    nbRefresh: RefreshDataSet(Sender, Button);
    nbInsert : InsertEPlant;
    nbDelete : DeleteEPlant;
  end;
end;

procedure TFrmPsTckParam.RefreshDataSet(Sender: TObject;  Button: TNavigateBtn);
begin
  RefreshDataSetByID( TFDQuery(TUniDBNavigator(Sender).DataSource.DataSet), 'source_id');
  ABORT;
end;

procedure TFrmPsTckParam.wwDataInspector1AfterSelectCell(
  Sender: TwwDataInspector; ObjItem: TwwInspectorItem);
begin
  StatusBar1.Panels[0].Text:= ObjItem.TagString
end;

procedure TFrmPsTckParam.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPsTckParam.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmPsTckParam.InsertEPlant;
begin
  with PKEplant do
    if Execute then
    begin
      ExecuteCommandFmt('update eplant set use_eplant_pk_tkt_params = ''Y'' where id = %f', [ DToF(GetValue('ID'))]);
      CopyFromDefaultTo( GetValue('ID'));
      Reopen( QryPkTktParams );
      QryPkTktParams.Locate('source_id', GetValue('ID'), []);
    end;

  ABORT;
end;

procedure TFrmPsTckParam.DeleteEPlant;
begin
  IQAssert( QryPkTktParamsSOURCE_ID.asFloat > 0, 'Cannot delete System Default parameters.' );
  try
    if not IQConfirmYN('Delete record?') then
       EXIT;
    ExecuteCommandFmt('update eplant set use_eplant_pk_tkt_params = ''N'' where id = %f', [ QryPkTktParamsSOURCE_ID.asFloat ]);
    Reopen( QryPkTktParams );
    QryPkTktParams.Locate('source_id', 0, []); {to solve weird datainspector display problem}
  finally
    ABORT;
  end;
end;


procedure TFrmPsTckParam.QryPkTktParamsUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

  procedure Update( ATableName: string; AWhere: string = '' );
  begin
    ExecuteCommandFmt('update %s                                       '+
              '   set PK_TKT_ORDERS_BASED            = ''%s'', '+
              '       PK_TKT_SO_MODE_PKLIST_BY_DIV   = ''%s'', '+
              '       PK_TKT_PICK_BY_CUSTOMER        = ''%s'', '+
              '       PK_TKT_ONE_PER_CUSTOMER        = ''%s'', '+
              '       PK_TKT_SHOW_ALL                = ''%s'', '+
              '       PK_TKT_KEEP_REL_SEPARATE       = ''%s'', '+
              '       PK_TKT_USE_SHIP_DEFAULT        = ''%s'', '+
              '       PK_TKT_CONV_USE_SYSDATE        = ''%s'', '+
              '       RF_SERIALIZED_ROUTING          = ''%s'', '+
              '       PK_TKT_SORT_NULL_RAN_TOP       = ''%s'', '+
              '       PK_TKT_ENABLE_VOLUME_CALC      = ''%s'', '+
              '       CALC_SHIP_DAY_START_VALID      = ''%s'', '+
              '       PK_TKT_DO_NOT_PRNT_PS_ON_CONV  = ''%s'', '+
              '       PK_TKT_DO_NOT_PRNT_BOL_ON_CONV = ''%s'', '+
              '       PS_EVAL_OVERSHIP               = ''%s'', '+
              '       PS_VERIFY_INVENTORY            = ''%s'', '+
              '       PK_TKT_SO_SYNC_AFTER_EDI       = ''%s'', '+
              '       PK_TKT_ASSIGN_ASN_ON_PRINT_LBL = ''%s'', '+
              '       PK_TKT_LABEL_MUST_BE_DISPO     = ''%s'', '+
              '       PK_TKT_STAGE_BY_PALLET         = ''%s'', '+
              '       PK_TKT_HARD_ALLOC_ON_PICK      = ''%s'', '+
              '       PK_TKT_PKLIST_BY_SO_DIV        = ''%s'', '+
              '       PK_TKT_USE_DOCK_SCHEDULER      = ''%s'', '+
              '       PS_SKIP_VERIFY_INV_DROP_SHIP   = ''%s'', '+
              '       PK_TKT_SHOW_BACKORDER          = ''%s''  '+
              '    %s ',

              [ ATableName,
                ASender.FieldByName('PK_TKT_ORDERS_BASED').asString,
                ASender.FieldByName('PK_TKT_SO_MODE_PKLIST_BY_DIV').asString,
                ASender.FieldByName('PK_TKT_PICK_BY_CUSTOMER').asString,
                ASender.FieldByName('PK_TKT_ONE_PER_CUSTOMER').asString,
                ASender.FieldByName('PK_TKT_SHOW_ALL').asString,
                ASender.FieldByName('PK_TKT_KEEP_REL_SEPARATE').asString,
                ASender.FieldByName('PK_TKT_USE_SHIP_DEFAULT').asString,
                ASender.FieldByName('PK_TKT_CONV_USE_SYSDATE').asString,
                ASender.FieldByName('RF_SERIALIZED_ROUTING').asString,
                ASender.FieldByName('PK_TKT_SORT_NULL_RAN_TOP').asString,
                ASender.FieldByName('PK_TKT_ENABLE_VOLUME_CALC').asString,
                ASender.FieldByName('CALC_SHIP_DAY_START_VALID').asString,
                ASender.FieldByName('PK_TKT_DO_NOT_PRNT_PS_ON_CONV').asString,
                ASender.FieldByName('PK_TKT_DO_NOT_PRNT_BOL_ON_CONV').asString,
                ASender.FieldByName('PS_EVAL_OVERSHIP').asString,
                ASender.FieldByName('PS_VERIFY_INVENTORY').asString,
                ASender.FieldByName('PK_TKT_SO_SYNC_AFTER_EDI').asString,
                ASender.FieldByName('PK_TKT_ASSIGN_ASN_ON_PRINT_LBL').asString,
                ASender.FieldByName('PK_TKT_LABEL_MUST_BE_DISPO').asString,
                ASender.FieldByName('PK_TKT_STAGE_BY_PALLET').asString,
                ASender.FieldByName('PK_TKT_HARD_ALLOC_ON_PICK').asString,
                ASender.FieldByName('PK_TKT_PKLIST_BY_SO_DIV').asString,
                ASender.FieldByName('PK_TKT_USE_DOCK_SCHEDULER').asString,
                ASender.FieldByName('PS_SKIP_VERIFY_INV_DROP_SHIP').asString,
                ASender.FieldByName('PK_TKT_SHOW_BACKORDER').asString,
                AWhere ]);
  end;

begin
  if ARequest = arUpdate then
  begin
    if CompareText( ASender.FieldByName('source_table').asString, 'PARAMS') = 0 then
       update('params')

    else if CompareText( ASender.FieldByName('source_table').asString, 'EPLANT') = 0 then
       update('eplant', Format('where id = %.0f', [ ASender.FieldByName('source_id').asFloat ]))
  end;

  AAction := eaApplied;
end;

procedure TFrmPsTckParam.QryPkTktParamsAfterPost(DataSet: TDataSet);
begin
  IQApplyUpdateToTable( DataSet );
end;

procedure TFrmPsTckParam.wwDataInspector1DrawCaptionCell(
  Sender: TwwDataInspector; ObjItem: TwwInspectorItem; ASelected: Boolean;
  ACellRect: TRect; var ACaptionRect: TRect;
  var DefaultTextDrawing: Boolean);
begin
  if ObjItem.ReadOnly then
     Sender.Canvas.Font.Style:= Sender.Canvas.Font.Style + [fsBold]
end;

procedure TFrmPsTckParam.wwDataInspector1ItemChanged(Sender: TwwDataInspector;
  Item: TwwInspectorItem; NewValue: string);
begin
  //If user try to uncheck any item and if there are any child records are checked.
  if(NewValue.Equals('N')) then
  begin
    if (Item.HaveVisibleItem) and (CheckChildFieldValues(Item) = True) then
      begin
        Item.Field.AsString := 'Y';
        IQInformation('There are checked child record(s). Please uncheck them and then try again.');
      end;
  end
  //If user try to select the child item then preventing user by informing message if the ParentItem is checked.
  else if (Item.ParentItem <> nil) and (Item.ParentItem.PickList.DisplayAsCheckbox) and (not (Item.ParentItem.Checked)) then
  begin
     Item.Field.AsString := 'N';
     IQInformation( 'Please check parent item "' + Item.ParentItem.Caption + '" first and then try again.');
  end;

end;

//Function CheckChildFieldValues:
//To check the value of child items of the given item.
//Returns True- if there are any child record is checked and
//        False- if no child record(s) is checked
function TFrmPsTckParam.CheckChildFieldValues(Item: TwwInspectorItem): Boolean;
var
  I: Integer;
begin
   I := 0;
   while I < Item.Items.Count do
    begin
      if(Item.Items[I].Checked) then
      begin
        Result := True;
        Exit;
      end
      else
        I := I+1;
    end;
    Result := False;
end;

procedure TFrmPsTckParam.sbtnCopyFromDefaultClick(Sender: TObject);
begin
  IQAssert( QryPkTktParamsSOURCE_ID.asFloat > 0, 'Select EPlant column to copy over from the System Default parameters' );

  if not IQConfirmYN(Format('Copy System Default parameters to selected %s eplant?', [ QryPkTktParamsSOURCE_NAME.asString ])) then
     EXIT;

  CopyFromDefaultTo( QryPkTktParamsSOURCE_ID.asFloat );
  RefreshDataSetByID( QryPkTktParams, 'source_id' );
end;

procedure TFrmPsTckParam.CopyFromDefaultTo( AEPlant_ID: Real );
begin
  ExecuteCommandFmt('update eplant                            '+
            '   set ( PK_TKT_ORDERS_BASED,            '+
            '         PK_TKT_SO_MODE_PKLIST_BY_DIV,   '+
            '         PK_TKT_PICK_BY_CUSTOMER,        '+
            '         PK_TKT_ONE_PER_CUSTOMER,        '+
            '         PK_TKT_SHOW_ALL,                '+
            '         PK_TKT_KEEP_REL_SEPARATE,       '+
            '         PK_TKT_USE_SHIP_DEFAULT,        '+
            '         PK_TKT_CONV_USE_SYSDATE,        '+
            '         RF_SERIALIZED_ROUTING,          '+
            '         PK_TKT_SORT_NULL_RAN_TOP,       '+
            '         PK_TKT_ENABLE_VOLUME_CALC,      '+
            '         CALC_SHIP_DAY_START_VALID,      '+
            '         PK_TKT_DO_NOT_PRNT_PS_ON_CONV,  '+
            '         PK_TKT_DO_NOT_PRNT_BOL_ON_CONV, '+
            '         PS_EVAL_OVERSHIP,               '+
            '         PS_VERIFY_INVENTORY,            '+
            '         PK_TKT_SO_SYNC_AFTER_EDI,       '+
            '         PK_TKT_ASSIGN_ASN_ON_PRINT_LBL, '+
            '         PK_TKT_LABEL_MUST_BE_DISPO,     '+
            '         PK_TKT_STAGE_BY_PALLET,         '+
            '         PS_SKIP_VERIFY_INV_DROP_SHIP,   '+
            '         PK_TKT_SHOW_BACKORDER,          '+
            '         PK_TKT_USE_DOCK_SCHEDULER )     '+
            '       =                                 '+
            ' (select                                 '+
            '         PK_TKT_ORDERS_BASED,            '+
            '         PK_TKT_SO_MODE_PKLIST_BY_DIV,   '+
            '         PK_TKT_PICK_BY_CUSTOMER,        '+
            '         PK_TKT_ONE_PER_CUSTOMER,        '+
            '         PK_TKT_SHOW_ALL,                '+
            '         PK_TKT_KEEP_REL_SEPARATE,       '+
            '         PK_TKT_USE_SHIP_DEFAULT,        '+
            '         PK_TKT_CONV_USE_SYSDATE,        '+
            '         RF_SERIALIZED_ROUTING,          '+
            '         PK_TKT_SORT_NULL_RAN_TOP,       '+
            '         PK_TKT_ENABLE_VOLUME_CALC,      '+
            '         CALC_SHIP_DAY_START_VALID,      '+
            '         PK_TKT_DO_NOT_PRNT_PS_ON_CONV,  '+
            '         PK_TKT_DO_NOT_PRNT_BOL_ON_CONV, '+
            '         PS_EVAL_OVERSHIP,               '+
            '         PS_VERIFY_INVENTORY,            '+
            '         PK_TKT_SO_SYNC_AFTER_EDI,       '+
            '         PK_TKT_ASSIGN_ASN_ON_PRINT_LBL, '+
            '         PK_TKT_LABEL_MUST_BE_DISPO,     '+
            '         PK_TKT_STAGE_BY_PALLET,         '+
            '         PS_SKIP_VERIFY_INV_DROP_SHIP,   '+
            '         PK_TKT_SHOW_BACKORDER,          '+
            '         PK_TKT_USE_DOCK_SCHEDULER       '+
            '    from params                          '+
            '   where rownum < 2 )                    '+
            'where id = %f                            ',
            [ AEplant_ID ]);
end;

procedure TFrmPsTckParam.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

function CheckAddFilterShipDateExpression( AShipDateFieldName: string ): string;
begin
  Result:= '';
  if GetPK_TKT_SHOW_ALL then
     EXIT;
  Result:= Format(' and %s <= trunc(sysdate+1)-1/86400 ', [ AShipDateFieldName ]);   // Example: ' v.must_ship_date <= trunc(sysdate+1)-1/86400 ';
end;


end.

