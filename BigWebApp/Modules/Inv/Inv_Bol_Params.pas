unit Inv_Bol_Params;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Mask,
  Vcl.wwDataInspector,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Param,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  IQMS.Common.Applications,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniComboBox,
  uniDBComboBox, Vcl.Grids;

type
  TFrmInvBOLParams = class(TUniForm)
    PnlButtons: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Bevel1: TUniPanel;
    UpdateSQLArinvt: TFDUpdateSQL;
    TblArinvt: TFDQuery;
    TblArinvtID: TBCDField;
    TblArinvtVOLUME: TFMTBCDField;
    TblArinvtEPLANT_ID: TBCDField;
    TblArinvtPK_HIDE: TStringField;
    TblArinvtPK_WEIGHT: TFMTBCDField;
    TblArinvtPK_PTSPER: TFMTBCDField;
    TblArinvtIS_LINKED_TO_SERIAL: TStringField;
    TblArinvtPK_LENGTH: TFMTBCDField;
    TblArinvtPK_WIDTH: TFMTBCDField;
    TblArinvtPK_HEIGHT: TFMTBCDField;
    TblArinvtPALLET_LENGTH: TFMTBCDField;
    TblArinvtPALLET_WIDTH: TFMTBCDField;
    TblArinvtPALLET_HEIGHT: TFMTBCDField;
    TblArinvtPALLET_VOLUME: TFMTBCDField;
    TblArinvtPALLET_PTSPER: TFMTBCDField;
    TblArinvtPALLET_WEIGHT: TFMTBCDField;
    TblArinvtLENGTH: TFMTBCDField;
    TblArinvtWIDTH: TFMTBCDField;
    TblArinvtPACK_INV_MOVE_CLASS_ID: TBCDField;
    TblArinvtPALLET_INV_MOVE_CLASS_ID: TBCDField;
    TblArinvtPK_UNIT_TYPE: TStringField;
    TblArinvtFIFO: TStringField;
    TblArinvtOVERRIDE_REC_LOC: TStringField;
    SrcArinvt: TDataSource;
    TblArinvtLOOSE_INV_MOVE_CLASS_ID: TBCDField;
    TblArinvtBOL_CALC_OVERRIDE: TStringField;
    QryMoveClass: TFDQuery;
    QryMoveClassCODE: TStringField;
    QryMoveClassDESCRIP: TStringField;
    QryMoveClassRANK_PERCENT: TBCDField;
    QryMoveClassID: TBCDField;
    TblArinvtITEMNO: TStringField;
    TblArinvtDESCRIP: TStringField;
    TblArinvtREV: TStringField;
    TblArinvtCLASS: TStringField;
    TblArinvtMAX_PALLET_STACK: TBCDField;
    TblArinvtLOOSE_MOVE_RANK_LOCK: TStringField;
    TblArinvtPACK_MOVE_RANK_LOCK: TStringField;
    TblArinvtPALLET_MOVE_RANK_LOCK: TStringField;
    TblArinvtLOOSE_LENGTH: TFMTBCDField;
    TblArinvtLOOSE_WIDTH: TFMTBCDField;
    TblArinvtLOOSE_HEIGHT: TFMTBCDField;
    TblArinvtLOOSE_VOLUME: TFMTBCDField;
    TblArinvtLOOSE_WEIGHT: TFMTBCDField;
    TblArinvtICT_TRUCK_PTSPER: TFMTBCDField;
    wwDataInspector1: TwwDataInspector;
    wwDBComboDlgPkVolume: TUniEdit;
    wwDBComboDlgPalletVolume: TUniEdit;
    wwDBLookupComboLooseMoveClass: TUniDBLookupComboBox;
    wwDBLookupComboPackMoveClass: TUniDBLookupComboBox;
    wwDBLookupComboPalletMoveClass: TUniDBLookupComboBox;
    wwDBPackageType: TUniDBComboBox;
    wwDBComboDlgLooseVolume: TUniEdit;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure wwDataInspector1DrawCaptionCell(Sender: TwwDataInspector;
      ObjItem: TwwInspectorItem; ASelected: Boolean; ACellRect: TRect;
      var ACaptionRect: TRect; var DefaultTextDrawing: Boolean);
    procedure wwDBComboDlgPalletVolumeCustomDlg(Sender: TObject);
    procedure wwDBComboDlgPkVolumeCustomDlg(Sender: TObject);
    procedure TblArinvtBeforeOpen(DataSet: TDataSet);
    procedure TblArinvtAfterPost(DataSet: TDataSet);
    procedure btnCancelClick(Sender: TObject);
    procedure wwDBComboDlgLooseVolumeCustomDlg(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    FArinvt_ID: Real;
    procedure InitForm;
    procedure CloseWindow(AAction: TModalResult);
    procedure SetArinvt_ID(const Value: Real);
    { Private declarations }
  public
    { Public declarations }
    property Arinvt_ID: Real write SetArinvt_ID;
    class function DoShowModal( AArinvt_ID: Real ): Boolean;
    class procedure DoShow( AArinvt_ID: Real );
  end;



implementation

uses
  inv_trans_share,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager;

{$R *.DFM}

{ TFrmInvBOLParams }

class procedure TFrmInvBOLParams.DoShow(AArinvt_ID: Real);
var
  LFrmInvBOLParams: TFrmInvBOLParams;
begin
  LFrmInvBOLParams := TFrmInvBOLParams.Create( UniGUIApplication.UniApplication );
  LFrmInvBOLParams.Arinvt_ID := AArinvt_ID;
  LFrmInvBOLParams.Show;
end;

class function TFrmInvBOLParams.DoShowModal(AArinvt_ID: Real): Boolean;
var
  LFrmInvBOLParams: TFrmInvBOLParams;
begin
  LFrmInvBOLParams := TFrmInvBOLParams.Create( UniGUIApplication.UniApplication );
  LFrmInvBOLParams.Arinvt_ID := AArinvt_ID;
  Result:= LFrmInvBOLParams.ShowModal = mrOK
end;

procedure TFrmInvBOLParams.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmInvBOLParams.btnCancelClick(Sender: TObject);
begin
  CloseWindow( mrCancel );
end;

procedure TFrmInvBOLParams.btnOKClick(Sender: TObject);
begin
  if TblArinvt.State = dsEdit then
     TblArinvt.Post;

  CloseWindow( mrOK );
end;

procedure TFrmInvBOLParams.CloseWindow( AAction: TModalResult );
begin
  if fsModal in FormState then
     ModalResult:= AAction
  else
     Close;
end;


procedure TFrmInvBOLParams.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmInvBOLParams.wwDataInspector1DrawCaptionCell(Sender: TwwDataInspector; ObjItem: TwwInspectorItem; ASelected: Boolean;
  ACellRect: TRect; var ACaptionRect: TRect;  var DefaultTextDrawing: Boolean);
begin
  if ObjItem.ReadOnly then
     Sender.Canvas.Font.Color:= clGray;
end;

procedure TFrmInvBOLParams.wwDBComboDlgPalletVolumeCustomDlg(Sender: TObject);
begin
  TblArinvt.Edit;
  TblArinvtPALLET_VOLUME.asFloat:= TblArinvtPALLET_LENGTH.asFloat * TblArinvtPALLET_WIDTH.asFloat * TblArinvtPALLET_HEIGHT.asFloat;
end;

procedure TFrmInvBOLParams.wwDBComboDlgPkVolumeCustomDlg(Sender: TObject);
begin
  TblArinvt.Edit;
  TblArinvtVOLUME.asFloat:= TblArinvtPK_LENGTH.asFloat * TblArinvtPK_WIDTH.asFloat * TblArinvtPK_HEIGHT.asFloat;
end;

procedure TFrmInvBOLParams.InitForm;
var
  A: Variant;

  procedure _assign_caption( ATagString, ACaption, AUom: string );
  var
    AItem: TwwInspectorItem;
  begin
    AItem:= wwDataInspector1.GetItemByTagString(ATagString);
    if Assigned(AItem) then
       AItem.Caption:= Format('%s [%s]', [  ACaption, AUom ]);
  end;

  procedure _check_assign_visible( ATagString: string; Value: Boolean );
  var
    AItem: TwwInspectorItem;
  begin
    AItem:= wwDataInspector1.GetItemByTagString( ATagString );
    if not Assigned(AItem) then
       EXIT;

    AItem.Visible:= Value;
  end;

begin
  A:= SelectValueArray('select lower(case_dim_uom), lower(pallet_dim_uom), lower(weight_uom), lower(loose_dim_uom) from params');

  _assign_caption( 'case_length_label', 'Length', A[ 0 ]);
  _assign_caption( 'case_width_label',  'Width',  A[ 0 ]);
  _assign_caption( 'case_height_label', 'Height', A[ 0 ]);
  _assign_caption( 'case_weight_label', 'Weight', A[ 2 ]);

  _assign_caption( 'pallet_length_label', 'Length', A[ 1 ]);
  _assign_caption( 'pallet_width_label',  'Width',  A[ 1 ]);
  _assign_caption( 'pallet_height_label', 'Height', A[ 1 ]);
  _assign_caption( 'pallet_weight_label', 'Weight', A[ 2 ]);

  _assign_caption( 'loose_length_label', 'Length', A[ 3 ]);
  _assign_caption( 'loose_width_label',  'Width',  A[ 3 ]);
  _assign_caption( 'loose_height_label', 'Height', A[ 3 ]);
  _assign_caption( 'loose_weight_label', 'Weight', A[ 2 ]);

  _check_assign_visible( 'MovementClass',        inv_trans_share.IsWMS2Licensed);
  _check_assign_visible( 'DefaultPkUnitType',    inv_trans_share.IsWMS2Licensed);
  _check_assign_visible( 'DirectedTransactions', inv_trans_share.IsWMS2Licensed);

  _check_assign_visible( 'ict_Info',             SecurityManager.IsModuleLicensed( apInterCompTrans ));
  _check_assign_visible( 'items_per_full_truck', SecurityManager.IsModuleLicensed( apInterCompTrans ));
end;


procedure TFrmInvBOLParams.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
end;

procedure TFrmInvBOLParams.TblArinvtAfterPost(DataSet: TDataSet);
begin
//  IQApplyUpdateToTable(DataSet);
end;

procedure TFrmInvBOLParams.TblArinvtBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('id').Value := FArinvt_ID;
end;

procedure TFrmInvBOLParams.UniFormCreate(Sender: TObject);
begin
  IQsetTablesActive(TRUE, self);
  IQRegFormRead(self, [self]);
  InitForm;
end;

procedure TFrmInvBOLParams.wwDBComboDlgLooseVolumeCustomDlg(Sender: TObject);
begin
  TblArinvt.Edit;
  TblArinvtLOOSE_VOLUME.asFloat:= TblArinvtLOOSE_LENGTH.asFloat * TblArinvtLOOSE_WIDTH.asFloat * TblArinvtLOOSE_HEIGHT.asFloat;
end;


end.

