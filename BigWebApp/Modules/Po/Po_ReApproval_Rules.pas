{to add a new parameter:
1. add pk_tkt_xxx to both params and eplant
2. edit v_pk_tkt_params
3. add new wrapper (this unit)
4. add new field to datainspector (this unit)}

unit Po_ReApproval_Rules;

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
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.UI.Intf,
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
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, Vcl.Grids;

type
  TFrmPO_ReApproval_Rules = class(TUniForm)
    SrcPoRarParams: TDataSource;
    QryPoRarParams: TFDQuery;
    wwDataInspector1: TwwDataInspector;
    Panel1: TUniPanel;
    NavMain: TUniDBNavigator;
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
    Bevel1: TUniPanel;
    Contents1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    QryPoRarParamsSOURCE_NAME: TStringField;
    QryPoRarParamsSOURCE_TABLE: TStringField;
    QryPoRarParamsSOURCE_ID: TFMTBCDField;
    QryPoRarParamsPO_RAR_UNITPRICE_HIGHER: TStringField;
    QryPoRarParamsPO_RAR_UNITPRICE_LOWER: TStringField;
    QryPoRarParamsPO_RAR_UNITQTY_HIGHER: TStringField;
    QryPoRarParamsPO_RAR_UNITQTY_LOWER: TStringField;
    QryPoRarParamsPO_RAR_LINEITEMS_ADDED: TStringField;
    QryPoRarParamsPO_RAR_LINEITEMS_DELETED: TStringField;
    QryPoRarParamsPO_RAR_RELEASES_ADDED: TStringField;
    QryPoRarParamsPO_RAR_RELEASES_DELETED: TStringField;
    QryPoRarParamsPO_RAR_GL_ACCT_CHANGED: TStringField;
    QryPoRarParamsPO_RAR_TERMS_CHANGED: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    { TODO -oathite -cWebConvert : Undeclared identifier: 'TNavigateBtn'
    procedure DispatchAction(Sender: TObject; Button: TNavigateBtn); }
    procedure wwDataInspector1AfterSelectCell(Sender: TwwDataInspector;
      ObjItem: TwwInspectorItem);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure QryPoRarParamsUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure QryPoRarParamsAfterPost(DataSet: TDataSet);
    procedure wwDataInspector1DrawCaptionCell(Sender: TwwDataInspector;
      ObjItem: TwwInspectorItem; ASelected: Boolean; ACellRect: TRect;
      var ACaptionRect: TRect; var DefaultTextDrawing: Boolean);
    procedure sbtnCopyFromDefaultClick(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
  { TODO -oathite -cWebConvert : 'TNavigateBtn' is not a type identifier
    procedure RefreshDataSet(Sender: TObject;  Button: TNavigateBtn); }
    procedure CopyFromDefaultTo(AEPlant_ID: Real);
    { Private declarations }
  public
    { Public declarations }
  end;

  TPO_Change  =
    (
      pocUNITPRICE_HIGHER,
      pocUNITPRICE_LOWER,
      pocUNITQTY_HIGHER,
      pocUNITQTY_LOWER,
      pocLINEITEMS_ADDED,
      pocLINEITEMS_DELETED,
      pocRELEASES_ADDED,
      pocRELEASES_DELETED,
      pocGL_ACCT_CHANGED,
      pocTERMS_CHANGED
    );
  TPO_Changes = set of TPO_Change;

  TOnPoChangedEventHandler = procedure(APoChanges: TPO_Changes) of object;

procedure DoPO_ReApproval_Rules;


function GetPO_RAR_UNITPRICE_HIGHER  : Boolean;
function GetPO_RAR_UNITPRICE_LOWER   : Boolean;
function GetPO_RAR_UNITQTY_HIGHER    : Boolean;
function GetPO_RAR_UNITQTY_LOWER     : Boolean;
function GetPO_RAR_LINEITEMS_ADDED   : Boolean;
function GetPO_RAR_LINEITEMS_DELETED : Boolean;
function GetPO_RAR_RELEASES_ADDED    : Boolean;
function GetPO_RAR_RELEASES_DELETED  : Boolean;
function GetPO_RAR_GL_ACCT_CHANGED   : Boolean;
function GetPO_RAR_TERMS_CHANGED     : Boolean;

var
  FrmPO_ReApproval_Rules: TFrmPO_ReApproval_Rules;

implementation

{$R *.dfm}

uses
  IQMS.Common.HelpHook,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  { TODO -oathite -cWebConvert : Dependent on IQSecIns
  IQSecIns, }
  IQMS.WebVcl.SecurityManager;

procedure DoPO_ReApproval_Rules;
var
  LFrmPO_ReApproval_Rules : TFrmPO_ReApproval_Rules;
begin
  LFrmPO_ReApproval_Rules := TFrmPO_ReApproval_Rules.Create(uniGUIApplication.UniApplication);
  LFrmPO_ReApproval_Rules.ShowModal;
end;

function GetPoRaRParam( AFieldName: string ): Boolean;
begin
  if SecurityManager.EPlant_ID_AsFloat > 0 then
    Result:= SelectValueFmtAsString('select %s from eplant where id = %f', [ AFieldName, SecurityManager.EPlant_ID_AsFloat ]) = 'Y'
  else
    Result:= SelectValueFmtAsString('select %s from params', [ AFieldName ]) = 'Y';
end;

{------------------------------------------------------------------------------}
{ Wrappers }
{------------------------------------------------------------------------------}
function GetPO_RAR_UNITPRICE_HIGHER  : Boolean; begin Result:= GetPoRaRParam( 'PO_RAR_UNITPRICE_HIGHER' );  end;
function GetPO_RAR_UNITPRICE_LOWER   : Boolean; begin Result:= GetPoRaRParam( 'PO_RAR_UNITPRICE_LOWER' );   end;
function GetPO_RAR_UNITQTY_HIGHER    : Boolean; begin Result:= GetPoRaRParam( 'PO_RAR_UNITQTY_HIGHER' );    end;
function GetPO_RAR_UNITQTY_LOWER     : Boolean; begin Result:= GetPoRaRParam( 'PO_RAR_UNITQTY_LOWER' );     end;
function GetPO_RAR_LINEITEMS_ADDED   : Boolean; begin Result:= GetPoRaRParam( 'PO_RAR_LINEITEMS_ADDED' );   end;
function GetPO_RAR_LINEITEMS_DELETED : Boolean; begin Result:= GetPoRaRParam( 'PO_RAR_LINEITEMS_DELETED' ); end;
function GetPO_RAR_RELEASES_ADDED    : Boolean; begin Result:= GetPoRaRParam( 'PO_RAR_RELEASES_ADDED' );    end;
function GetPO_RAR_RELEASES_DELETED  : Boolean; begin Result:= GetPoRaRParam( 'PO_RAR_RELEASES_DELETED' );  end;
function GetPO_RAR_GL_ACCT_CHANGED   : Boolean; begin Result:= GetPoRaRParam( 'PO_RAR_GL_ACCT_CHANGED' );   end;
function GetPO_RAR_TERMS_CHANGED     : Boolean; begin Result:= GetPoRaRParam( 'PO_RAR_TERMS_CHANGED' );     end;

{ TFrmPoRaRParams }

procedure TFrmPO_ReApproval_Rules.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

{ TODO -oathite -cWebConvert : 'TNavigateBtn' is not a type identifier
procedure TFrmPO_ReApproval_Rules.DispatchAction(Sender: TObject;  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
    RefreshDataSet(Sender, Button);
end; }

{ TODO -oathite -cWebConvert : 'TNavigateBtn' is not a type identifier
procedure TFrmPO_ReApproval_Rules.RefreshDataSet(Sender: TObject;  Button: TNavigateBtn);
begin
  RefreshDataSetByID( TFDQuery(TUniDBNavigator(Sender).DataSource.DataSet), 'source_id');
  ABORT;
end; }

procedure TFrmPO_ReApproval_Rules.wwDataInspector1AfterSelectCell(
  Sender: TwwDataInspector; ObjItem: TwwInspectorItem);
begin
  { TODO -oathite -cWebConvert : Undeclared identifier: 'SimpleText'
  StatusBar1.SimpleText:= ObjItem.TagString }
end;

procedure TFrmPO_ReApproval_Rules.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPO_ReApproval_Rules.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmPO_ReApproval_Rules.QryPoRarParamsUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

  procedure Update( ATableName: string; AWhere: string = '' );
  begin
    ExecuteCommandFmt
    (
      'update %s                            '+
      'set                                  '+
      '  PO_RAR_UNITPRICE_HIGHER  = ''%s'', '+
      '  PO_RAR_UNITPRICE_LOWER   = ''%s'', '+
      '  PO_RAR_UNITQTY_HIGHER    = ''%s'', '+
      '  PO_RAR_UNITQTY_LOWER     = ''%s'', '+
      '  PO_RAR_LINEITEMS_ADDED   = ''%s'', '+
      '  PO_RAR_LINEITEMS_DELETED = ''%s'', '+
      '  PO_RAR_RELEASES_ADDED    = ''%s'', '+
      '  PO_RAR_RELEASES_DELETED  = ''%s'', '+
      '  PO_RAR_GL_ACCT_CHANGED   = ''%s'', '+
      '  PO_RAR_TERMS_CHANGED     = ''%s''  '+
      '%s ',
      [
        ATableName,
        QryPoRarParamsPO_RAR_UNITPRICE_HIGHER.Value,
        QryPoRarParamsPO_RAR_UNITPRICE_LOWER.Value,
        QryPoRarParamsPO_RAR_UNITQTY_HIGHER.Value,
        QryPoRarParamsPO_RAR_UNITQTY_LOWER.Value,
        QryPoRarParamsPO_RAR_LINEITEMS_ADDED.Value,
        QryPoRarParamsPO_RAR_LINEITEMS_DELETED.Value,
        QryPoRarParamsPO_RAR_RELEASES_ADDED.Value,
        QryPoRarParamsPO_RAR_RELEASES_DELETED.Value,
        QryPoRarParamsPO_RAR_GL_ACCT_CHANGED.Value,
        QryPoRarParamsPO_RAR_TERMS_CHANGED.Value,
        AWhere
      ]);
  end;

begin
  if ARequest = arUpdate then
  begin
    if CompareText( QryPoRarParamsSOURCE_TABLE.asString, 'PARAMS') = 0 then
       update('params')

    else if CompareText( QryPoRarParamsSOURCE_TABLE.asString, 'EPLANT') = 0 then
       update('eplant', Format('where id = %.0f', [ QryPoRarParamsSOURCE_ID.asFloat ]))
  end;

  AAction := eaApplied;
end;

procedure TFrmPO_ReApproval_Rules.QryPoRarParamsAfterPost(DataSet: TDataSet);
begin
  IQApplyUpdateToTable( DataSet );
end;

procedure TFrmPO_ReApproval_Rules.wwDataInspector1DrawCaptionCell(
  Sender: TwwDataInspector; ObjItem: TwwInspectorItem; ASelected: Boolean;
  ACellRect: TRect; var ACaptionRect: TRect;
  var DefaultTextDrawing: Boolean);
begin
  if ObjItem.ReadOnly then
     Sender.Canvas.Font.Style:= Sender.Canvas.Font.Style + [fsBold]
end;

procedure TFrmPO_ReApproval_Rules.sbtnCopyFromDefaultClick(Sender: TObject);
begin
  IQAssert( QryPoRarParamsSOURCE_ID.asFloat > 0, 'Select EPlant column to copy over from the System Default parameters' );

  if not IQConfirmYN(Format('Copy System Default parameters to selected %s eplant?', [ QryPoRarParamsSOURCE_NAME.asString ])) then
     EXIT;

  CopyFromDefaultTo( QryPoRarParamsSOURCE_ID.asFloat );
  RefreshDataSetByID( QryPoRarParams, 'source_id' );
end;

procedure TFrmPO_ReApproval_Rules.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self ]);
  { TODO -oathite -cWebConvert : Undeclared identifier: 'AssignDataInspectorItemVisible'
  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PO_RAR_UNITPRICE_HIGHER ' , 'QryPO_RAR_UNITPRICE_HIGHER'  , SR);
  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PO_RAR_UNITPRICE_LOWER'   , 'QryPO_RAR_UNITPRICE_LOWER'   , SR);
  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PO_RAR_UNITQTY_HIGHER'    , 'QryPO_RAR_UNITQTY_HIGHER'    , SR);
  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PO_RAR_UNITQTY_LOWER'     , 'QryPO_RAR_UNITQTY_LOWER'     , SR);
  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PO_RAR_LINEITEMS_ADDED'   , 'QryPO_RAR_LINEITEMS_ADDED'   , SR);
  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PO_RAR_LINEITEMS_DELETED' , 'QryPO_RAR_LINEITEMS_DELETED' , SR);
  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PO_RAR_RELEASES_ADDED'    , 'QryPO_RAR_RELEASES_ADDED'    , SR);
  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PO_RAR_RELEASES_DELETED'  , 'QryPO_RAR_RELEASES_DELETED'  , SR);
  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PO_RAR_GL_ACCT_CHANGED'   , 'QryPO_RAR_GL_ACCT_CHANGED'   , SR);
  IQMS.WebVcl.SecurityRegister.AssignDataInspectorItemVisible( wwDataInspector1, 'PO_RAR_TERMS_CHANGED'     , 'QryPO_RAR_TERMS_CHANGED'     , SR);
  }
end;

procedure TFrmPO_ReApproval_Rules.CopyFromDefaultTo( AEPlant_ID: Real );
begin
  ExecuteCommandFmt('update eplant                            '+
            'set                                      '+
            '  (                                      '+
            '    PO_RAR_UNITPRICE_HIGHER,             '+
            '    PO_RAR_UNITPRICE_LOWER,              '+
            '    PO_RAR_UNITQTY_HIGHER,               '+
            '    PO_RAR_UNITQTY_LOWER,                '+
            '    PO_RAR_LINEITEMS_ADDED,              '+
            '    PO_RAR_LINEITEMS_DELETED,            '+
            '    PO_RAR_RELEASES_ADDED,               '+
            '    PO_RAR_RELEASES_DELETED,             '+
            '    PO_RAR_GL_ACCT_CHANGED,              '+
            '    PO_RAR_TERMS_CHANGED                 '+
            '  )                                      '+
            '  =                                      '+
            '  (                                      '+
            '    select                               '+
            '      PO_RAR_UNITPRICE_HIGHER,           '+
            '      PO_RAR_UNITPRICE_LOWER,            '+
            '      PO_RAR_UNITQTY_HIGHER,             '+
            '      PO_RAR_UNITQTY_LOWER,              '+
            '      PO_RAR_LINEITEMS_ADDED,            '+
            '      PO_RAR_LINEITEMS_DELETED,          '+
            '      PO_RAR_RELEASES_ADDED,             '+
            '      PO_RAR_RELEASES_DELETED,           '+
            '      PO_RAR_GL_ACCT_CHANGED,            '+
            '      PO_RAR_TERMS_CHANGED               '+
            '    from params                          '+
            '    where rownum < 2                     '+
            '  )                                      '+
            'where id = %f                            ',
            [ AEplant_ID ]);
end;

procedure TFrmPO_ReApproval_Rules.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmPO_ReApproval_Rules.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSHIP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmPO_ReApproval_Rules.FormShow(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Dependent on IQSecIns
  EnsureSecurityInspectorOnTopOf( self ); }
end;


end.

