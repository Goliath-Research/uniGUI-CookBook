unit oe_quick_ship_locs;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.wwDataInspector,
  Data.DB,
  Vcl.Buttons,
  oe_misc,
  IQMS.WebVcl.Hpick,
  Mask,
  Vcl.Menus,
  IQMS.WebVcl.About,
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu, IQUniGrid, uniGUIFrame, Vcl.Grids;

type
  TDisplayFilter = record
   exclude_vmi           : Boolean;
   exclude_non_conform   : Boolean;
   exclude_non_allocate  : Boolean;
   exclude_in_transit    : Boolean;
   exclude_hard_alloc    : Boolean;
   exclude_make_to_order : Boolean;
   exclude_expired       : Boolean;
   constructor Create( dummy: Integer );
  end;


  TFrmOEQuickShipLocations = class(TUniForm)
    Panel1: TUniPanel;
    wwDataInspector1: TwwDataInspector;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel5: TUniPanel;
    Splitter1: TUniSplitter;
    Panel6: TUniPanel;
    Panel7: TUniPanel;
    Panel8: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    navBacklog: TUniDBNavigator;
    wwDBGrid2: TIQUniGridControl;
    SrcOrder: TDataSource;
    QryOrder: TFDQuery;
    Splitter2: TUniSplitter;
    QryOrderORDERNO: TStringField;
    QryOrderITEMNO: TStringField;
    QryOrderDESCRIP: TStringField;
    QryOrderDESCRIP2: TStringField;
    QryOrderREV: TStringField;
    QryOrderCLASS: TStringField;
    pnlLegend: TUniPanel;
    Panel9: TUniPanel;
    sbtnClassFilter: TUniSpeedButton;
    SrcFgMulti: TDataSource;
    QryFgMulti: TFDQuery;
    QryFgMultiID: TBCDField;
    QryFgMultiORD_DETAIL_FGMULTI_ID: TBCDField;
    QryFgMultiFGMULTI_ID: TBCDField;
    QryFgMultiDIVISION_ID: TBCDField;
    QryFgMultiQTY: TFMTBCDField;
    QryFgMultiLOC_DESC: TStringField;
    QryFgMultiLOTNO: TStringField;
    QryFgMultiDIVISION_NAME: TStringField;
    QryFgMultiIN_DATE: TDateTimeField;
    QryFgMultiONHAND: TFMTBCDField;
    QryFgMultiVMI: TStringField;
    QryFgMultiNON_CONFORM_ID: TBCDField;
    QryFgMultiNON_ALLOCATE_ID: TBCDField;
    QryFgMultiSHIPMENT_DTL_ID_IN_TRANSIT: TBCDField;
    QryFgMultiIS_HARD_ALLOC: TStringField;
    QryFgMultiMAKE_TO_ORDER_DETAIL_ID: TBCDField;
    QryFgMultiLOT_DATE: TDateTimeField;
    QryFgMultiSHELF_LIFE: TBCDField;
    QryFgMultiIS_LOT_EXPIRED: TFMTBCDField;
    QryFgMultiLOC_ID: TBCDField;
    SrcBacklog: TDataSource;
    QryBacklog: TFDQuery;
    QryBacklogQTY: TFMTBCDField;
    QryBacklogDIVISION_ID: TBCDField;
    QryBacklogID: TBCDField;
    QryBacklogDivisionName: TStringField;
    PkDivision: TIQWebHPick;
    PkDivisionID: TBCDField;
    PkDivisionNAME: TStringField;
    PkDivisionDESCRIP: TStringField;
    PkDivisionEPLANT_ID: TBCDField;
    wwDBComboDlgDiv: TUniEdit;
    UpdateSQLBacklog: TFDUpdateSQL;
    UpdateSQLFgMulti: TFDUpdateSQL;
    PopupMenu1: TUniPopupMenu;
    JumpToLocationsTransactions1: TUniMenuItem;
    navMainInv: TUniDBNavigator;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryFgMultiBeforeOpen(DataSet: TDataSet);
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure QryBacklogCalcFields(DataSet: TDataSet);
    procedure wwDBComboDlgDivCustomDlg(Sender: TObject);
    procedure wwDBComboDlgDivKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QryBacklogBeforePost(DataSet: TDataSet);
    procedure ApplyUpdate(DataSet: TDataSet);
    procedure JumpToLocationsTransactions1Click(Sender: TObject);
    { TODO -oathite -cWebConvert : Undeclared identifier: TNavigateBtn
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);     }
    procedure QryOrderBeforeOpen(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure wwDBGrid1TitleButtonClick(Sender: TObject; AFieldName: string);
    procedure sbtnClassFilterClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FParams    : TOEQuickShipLocsCargo;
    FFilter    : TDisplayFilter;
    procedure PrepareLocationsForEdit;
    procedure PrepareLocationsForUpdate;
    procedure InitForm;
    procedure SetParams(const Value: TOEQuickShipLocsCargo);
  public
    { Public declarations }
    class function DoShowModal( AParams: TOEQuickShipLocsCargo ): Boolean;
    property Params: TOEQuickShipLocsCargo write SetParams;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.Boolean,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  oe_quick_locs_filter,
  IQMS.Common.SysShare,
  { TODO -oathite -cWebConvert : Depends on
  TranMain,
  Trans,  }
  IQMS.Common.TransMisc,
  IQMS.WebVcl.ResourceStrings;


{ TFilter }
constructor TDisplayFilter.Create(dummy: Integer);
begin
  exclude_vmi           := False;
  exclude_non_conform   := False;
  exclude_non_allocate  := False;
  exclude_in_transit    := False;
  exclude_hard_alloc    := False;
  exclude_make_to_order := False;
  exclude_expired       := False;
end;


{ TFrmOEQuickShipLocations }
class function TFrmOEQuickShipLocations.DoShowModal(AParams: TOEQuickShipLocsCargo): Boolean;
var
  LFrmOEQuickShipLocations : TFrmOEQuickShipLocations;
begin
  LFrmOEQuickShipLocations :=  TFrmOEQuickShipLocations.Create(uniGUIApplication.UniApplication);
  LFrmOEQuickShipLocations.Params := AParams;
  LFrmOEQuickShipLocations.FFilter:= TDisplayFilter.Create(0);
  Result:= LFrmOEQuickShipLocations.ShowModal = mrOK;
end;

procedure TFrmOEQuickShipLocations.InitForm;
begin
  { TODO -oathite -cWebConvert : Undeclared identifier: 'AssignWWColumnTitleEx'
  IQMS.Common.Controls.AssignWWColumnTitleEx( wwDBGrid1, 'ONHAND', Format('On Hand~(%s)', [ FParams.OE_UOM ]));
  IQMS.Common.Controls.AssignWWColumnTitleEx( wwDBGrid1, 'QTY', Format('Pick Qty~(%s)', [ FParams.OE_UOM ]));
  IQMS.Common.Controls.AssignWWColumnTitleEx( wwDBGrid1, 'DIVISION_NAME', CheckReplaceDivisionCaption( QryFgMultiDIVISION_NAME.DisplayLabel ));  // sys_share
  wwDBGrid1.ApplySelected;   }

  IQMS.Common.Controls.CreateLegendOn( pnlLegend, IQMS.Common.TransMisc.LocationsColorLegendArray );

  IQRegBooleanScalarRead( self, 'exclude_in_transit',    FFilter.exclude_in_transit,   True);
  IQRegBooleanScalarRead( self, 'exclude_hard_alloc',    FFilter.exclude_hard_alloc,   True);
  IQRegBooleanScalarRead( self, 'exclude_expired',       FFilter.exclude_expired,      True);
  IQRegBooleanScalarRead( self, 'exclude_non_allocate',  FFilter.exclude_non_allocate, True);
  IQRegBooleanScalarRead( self, 'exclude_non_conform',   FFilter.exclude_non_conform,  True);
  IQRegBooleanScalarRead( self, 'exclude_vmi',           FFilter.exclude_vmi,          True);
  IQRegBooleanScalarRead( self, 'exclude_make_to_order', FFilter.exclude_make_to_order,True);
end;

procedure TFrmOEQuickShipLocations.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1, wwDBGrid2 ]);
  IQRegBooleanScalarWrite( self, 'exclude_in_transit',    FFilter.exclude_in_transit,   True);
  IQRegBooleanScalarWrite( self, 'exclude_hard_alloc',    FFilter.exclude_hard_alloc,   True);
  IQRegBooleanScalarWrite( self, 'exclude_expired',       FFilter.exclude_expired,      True);
  IQRegBooleanScalarWrite( self, 'exclude_non_allocate',  FFilter.exclude_non_allocate, True);
  IQRegBooleanScalarWrite( self, 'exclude_non_conform',   FFilter.exclude_non_conform,  True);
  IQRegBooleanScalarWrite( self, 'exclude_vmi',           FFilter.exclude_vmi,          True);
  IQRegBooleanScalarWrite( self, 'exclude_make_to_order', FFilter.exclude_make_to_order,True);
end;


procedure TFrmOEQuickShipLocations.JumpToLocationsTransactions1Click(
  Sender: TObject);
begin
  IQAssert( QryFgMultiFGMULTI_ID.asFloat > 0, IQMS.WebVcl.ResourceStrings.cTXT0000103 {'Jump information is unavailable'});
  { TODO -oathite -cWebConvert : Depends on TranMain
  TranMain.DoLocateFGMulti( Application, QryFgMultiFGMULTI_ID.asFloat );}
end;

procedure TFrmOEQuickShipLocations.QryBacklogBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'GTT_ORD_DETAIL_FGMULTI');
end;

procedure TFrmOEQuickShipLocations.QryBacklogCalcFields(DataSet: TDataSet);
begin
  if QryBacklogDIVISION_ID.asFloat > 0 then
     QryBacklogDivisionName.asString:= SelectValueByID('name', 'division', QryBacklogDIVISION_ID.asFloat )
end;

procedure TFrmOEQuickShipLocations.QryFgMultiBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'uom_factor', FParams.Uom_Factor);
  AssignQueryParamValue(DataSet, 'exclude_vmi', TIQBoolean.AsYN(FFilter.exclude_vmi));
  AssignQueryParamValue(DataSet, 'exclude_non_conform', TIQBoolean.AsYN(FFilter.exclude_non_conform));
  AssignQueryParamValue(DataSet, 'exclude_non_allocate', TIQBoolean.AsYN(FFilter.exclude_non_allocate));
  AssignQueryParamValue(DataSet, 'exclude_in_transit', TIQBoolean.AsYN(FFilter.exclude_in_transit));
  AssignQueryParamValue(DataSet, 'exclude_hard_alloc', TIQBoolean.AsYN(FFilter.exclude_hard_alloc));
  AssignQueryParamValue(DataSet, 'exclude_make_to_order', TIQBoolean.AsYN(FFilter.exclude_make_to_order));
  AssignQueryParamValue(DataSet, 'exclude_expired', TIQBoolean.AsYN(FFilter.exclude_expired));
end;

procedure TFrmOEQuickShipLocations.QryOrderBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'orders_id', FParams.Orders_ID);
  AssignQueryParamValue(DataSet, 'arinvt_id', FParams.Arinvt_ID);
end;

procedure TFrmOEQuickShipLocations.wwDBComboDlgDivCustomDlg(Sender: TObject);
begin
  with PkDivision do
    if Execute then
    begin
      QryBacklog.Edit;
      QryBacklogDIVISION_ID.asFloat:= GetValue('id');
    end;
end;

procedure TFrmOEQuickShipLocations.wwDBComboDlgDivKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    QryBacklog.Edit;
    QryBacklogDIVISION_ID.Clear;
    Key:= 0;
  end;
end;

procedure TFrmOEQuickShipLocations.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
{var
   TODO -oathite -cWebConvert : Undeclared identifier: 'TColorPair'
  AColorPair: TColorPair;  // trans.pas                              }
begin
  (*if TTransCustom.GetLocationSpecificColor( QryFgMulti, Highlight, AColorPair ) then        // trans.pas
  begin
    AFont.Color := AColorPair.FontColor;
    ABrush.Color:= AColorPair.BrushColor;
  end; *)
end;

procedure TFrmOEQuickShipLocations.PrepareLocationsForEdit;
begin
  ExecuteCommandFmt(
            'declare                                                             '+
            '  v_orders_id number::= %f;                                         '+
            '  v_arinvt_id number::= %f;                                         '+
            'begin                                                               '+
            '  oe_quick.prepare_locations_for_edit( v_orders_id, v_arinvt_id );  '+
            'end;                                                                ',
            [ FParams.Orders_ID,
              FParams.Arinvt_ID ]);
end;

procedure TFrmOEQuickShipLocations.PrepareLocationsForUpdate;
begin
  ExecuteCommandFmt(
            'declare                                                             '+
            '  v_orders_id number::= %f;                                         '+
            '  v_arinvt_id number::= %f;                                         '+
            '  v_ord_detail_id number::= %f;                                     '+
            'begin                                                               '+
            '  oe_quick.prepare_locations_for_update( v_orders_id,               '+
            '                                         v_arinvt_id,               '+
            '                                         v_ord_detail_id );         '+
            'end;                                                                ',
            [ FParams.Orders_ID,
              FParams.Arinvt_ID,
              FParams.Ord_Detail_ID ]);
end;

procedure TFrmOEQuickShipLocations.Exit1Click(Sender: TObject);
begin
  ModalResult:= mrCancel;
end;

procedure TFrmOEQuickShipLocations.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TFrmOEQuickShipLocations.ApplyUpdate(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
end;

procedure TFrmOEQuickShipLocations.btnOKClick(Sender: TObject);
begin
  QryFgMulti.CheckBrowseMode;
  QryBacklog.CheckBrowseMode;
  PrepareLocationsForUpdate;
  ModalResult:= mrOK;
end;

{ TODO -oathite -cWebConvert : Undeclared identifier: TNavigateBtn }
(*
procedure TFrmOEQuickShipLocations.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;    *)

procedure TFrmOEQuickShipLocations.wwDBGrid1TitleButtonClick(Sender: TObject; AFieldName: string);
const
  cKeyword1 = '_ORDER_BY_START_';
  cKeyword2 = '_ORDER_BY_END_';
var
  I: Integer;
begin
  if QryFgMulti.FieldByName(AFieldName).Origin = '' then
     EXIT;

  IQMS.Common.StringUtils.DeleteStringsBetweenKeyWords( QryFgMulti.SQL,
                                         cKeyword1,
                                         cKeyword2,
                                         I);
  IQMS.Common.StringUtils.InsertStringsBetweenKeyWords( QryFgMulti.SQL,
                                         Format('order by %s', [ QryFgMulti.FieldByName(AFieldName).Origin ]),
                                         cKeyword1,
                                         cKeyword2 );
  RefreshDataSetByID( QryFgMulti );
end;


procedure TFrmOEQuickShipLocations.sbtnClassFilterClick(Sender: TObject);
begin
  if TFrmOeQuickLocsFilter.DoShowModal( FFilter ) then
     RefreshDataSetByID( QryFgMulti );
end;



procedure TFrmOEQuickShipLocations.SetParams(
  const Value: TOEQuickShipLocsCargo);
begin
  FParams := Value;
end;

procedure TFrmOEQuickShipLocations.UniFormCreate(Sender: TObject);
begin
  PrepareLocationsForEdit;

  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, wwDBGrid1, wwDBGrid2 ]);
  InitForm;
end;

end.
