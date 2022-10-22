unit inv_by_loc;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.About,
  Vcl.Menus,
  Data.DB,
  Vcl.Wwdatsrc,
  Mask,
{ TODO -oGPatil -cWebConvert : Dependency
  IQMS.Common.UserMessages, }
  IQMS.WebVcl.Jump,
  IQMS.WebVcl.SecurityRegister,
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
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniTimer,
  uniMainMenu,
  uniLabel, IQUniGrid, uniGUIFrame;

type
  TMoveCargo = class
    Arinvt_ID: Real;
    TrgFGMulti_ID: Real;
    SrcFGMulti_ID: Real;
    SrcOnHandQty: Real;
    SrcInDate   : TDateTime;
    MoveQty: Real;
    Master_Label_List: TStringList;
    Reason: string;

    constructor Create;
    destructor Destroy;
  end;

  TFrmInventoryByLocations = class(TUniForm)
    pnlLocations: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Panel11: TUniPanel;
    Label4: TUniLabel;
    SrcLoc: TDataSource;
    QryLoc: TFDQuery;
    QryLocID: TBCDField;
    QryLocLOC_DESC: TStringField;
    QryLocDESCRIP: TStringField;
    QryLocEPLANT_ID: TBCDField;
    QryLocDIVISION_NAME: TStringField;
    Panel1: TUniPanel;
    IQSearchLoc: TIQUniGridControl;
    SrcFGMulti: TDataSource;
    QryFGMulti: TFDQuery;
    QryFGMultiCLASS: TStringField;
    QryFGMultiITEMNO: TStringField;
    QryFGMultiREV: TStringField;
    QryFGMultiDESCRIP: TStringField;
    QryFGMultiDESCRIP2: TStringField;
    QryFGMultiLOTNO: TStringField;
    QryFGMultiONHAND: TBCDField;
    QryFGMultiACT_COST: TFMTBCDField;
    QryFGMultiIN_DATE: TDateTimeField;
    QryFGMultiLOT_DATE: TDateTimeField;
    pnlRightClient01: TUniPanel;
    Splitter1: TUniSplitter;
    pnlInventory: TUniPanel;
    Panel4: TUniPanel;
    Label1: TUniLabel;
    Panel6: TUniPanel;
    IQSearchFGMulti: TIQUniGridControl;
    Splitter2: TUniSplitter;
    pnlBottom01: TUniPanel;
    pnlLabels: TUniPanel;
    Panel5: TUniPanel;
    Label2: TUniLabel;
    Panel3: TUniPanel;
    IQSearchLabel: TIQUniGridControl;
    pnlDetails: TUniPanel;
    PnlBottomLeftClient01: TUniPanel;
    Splitter6: TUniSplitter;
    PnlLeft03: TUniPanel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label3: TUniLabel;
    Label7: TUniLabel;
    lblDivision: TUniLabel;
    lblRecvDesignator: TUniLabel;
    PnlClient03: TUniPanel;
    dbeNonConf: TUniDBEdit;
    dbeNonAlloc: TUniDBEdit;
    dbeDispo: TUniDBEdit;
    dbeShip: TUniDBEdit;
    dbeDivision: TUniDBEdit;
    dbeRecv: TUniDBEdit;
    Panel7: TUniPanel;
    Label8: TUniLabel;
    Splitter4: TUniSplitter;
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    Bevel3: TUniPanel;
    QryFGMultiNON_CONF_DESCRIP: TStringField;
    QryFGMultiNON_ALLOCATE_DESCRIP: TStringField;
    QryFGMultiAUTO_DISPO_STANDARD_ID: TBCDField;
    QryFGMultiAUTO_DISPO_MFGNO: TStringField;
    QryFGMultiAUTO_DISPO_DEFAULT_LOC: TStringField;
    QryFGMultiAuto_Dispo: TStringField;
    QryFGMultiSHIP_DEFAULT: TStringField;
    QryFGMultiAuto_Ship: TStringField;
    QryFGMultiRECV_DEFAULT: TStringField;
    QryFGMultiAuto_Recv: TStringField;
    QryFGMultiHardAllocLot: TStringField;
    QryFGMultiDIVISION_NAME: TStringField;
    QryFGMultiFGMULTI_ALLOCATED_SOURCE: TStringField;
    QryFab_Lot_Mat: TFDQuery;
    QryFab_Lot_MatIS_ALLOCATED: TStringField;
    QryFab_Lot_MatLOTNO: TStringField;
    QryWO_BOM_Mat_Loc: TFDQuery;
    QryWO_BOM_Mat_LocWORKORDER_ID: TBCDField;
    QryFGMultiIs_Hard_Alloc: TStringField;
    QryFGMultiIN_TRANSIT_ORIGIN: TBCDField;
    QryFGMultiIn_Transit_Origin_Disp: TStringField;
    QryFGMultiSHIPMENT_DTL_ID_IN_TRANSIT: TBCDField;
    QryFGMultiOutsource_VendorNo: TStringField;
    QryFGMultiMAKE_TO_ORDER_DETAIL_ID: TBCDField;
    QryFGMultiMakeToOrderOrderNo: TStringField;
    QryFGMultiID: TBCDField;
    QryLocVMI: TStringField;
    QryLocNON_CONFORM: TStringField;
    QryLocTRANSIT: TStringField;
    pnlLocLegend: TUniPanel;
    Shape3: TUniPanel;
    Shape2: TUniPanel;
    Shape1: TUniPanel;
    pnlLegendFGMulti: TUniPanel;
    Shape4: TUniPanel;
    Shape5: TUniPanel;
    Shape6: TUniPanel;
    Shape7: TUniPanel;
    Shape8: TUniPanel;
    Shape9: TUniPanel;
    Shape10: TUniPanel;
    Shape11: TUniPanel;
    QryFGMultiVMI: TStringField;
    QryFGMultiNON_CONFORM_ID: TBCDField;
    QryFGMultiNON_ALLOCATE_ID: TBCDField;
    QryFGMultiMASTER_LABEL_ID: TBCDField;
    QryFGMultiSHELF_LIFE: TBCDField;
    SrcMaster_Label: TDataSource;
    QryMaster_Label: TFDQuery;
    QryMaster_LabelSERIAL: TStringField;
    QryMaster_LabelQTY: TFMTBCDField;
    QryMaster_LabelDISPO_DATE: TDateTimeField;
    QryMaster_LabelPARENT_SERIAL: TStringField;
    QryMaster_LabelPRINT_DATE: TDateTimeField;
    QryMaster_LabelID: TBCDField;
    QryMaster_LabelPARENT_ID: TBCDField;
    popFGMulti: TUniPopupMenu;
    JumpToLocationsandTransactions1: TUniMenuItem;
    IQJumpInv: TIQWebJump;
    JumpToInventory1: TUniMenuItem;
    QryFGMultiARINVT_ID: TBCDField;
    Contents1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    QryFGMultiCONTAINERNO: TStringField;
    ChangeInDate1: TUniMenuItem;
    N1: TUniMenuItem;
    ToggleToConform1: TUniMenuItem;
    ToggleToNonConform1: TUniMenuItem;
    ToggleToAllocate1: TUniMenuItem;
    ToggleToNonAllocate1: TUniMenuItem;
    ToggletoShip1: TUniMenuItem;
    ToggletoNonShip1: TUniMenuItem;
    ReleaseWOHardAllocation1: TUniMenuItem;
    N2: TUniMenuItem;
    ReleaseMakeToOrderAllocation1: TUniMenuItem;
    N3: TUniMenuItem;
    PrintLabels1: TUniMenuItem;
    Timer1: TUniTimer;
    pnlBottom: TUniPanel;
    QryFGMultiIS_LINKED_TO_SERIAL: TStringField;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryFGMultiCalcFields(DataSet: TDataSet);
    procedure AssignFGMulti_IDBeforeOpen(DataSet: TDataSet);
{ TODO -oGPatil -cWebConvert : TGridDrawState not present in UniGui
    procedure IQSearchLocCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure IQSearchFGMultiCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);  }
    procedure JumpToLocationsandTransactions1Click(Sender: TObject);
    procedure JumpToInventory1Click(Sender: TObject);
    procedure AbortEdit(DataSet: TDataSet);
    procedure Contents1Click(Sender: TObject);
    procedure ChangeInDate1Click(Sender: TObject);
    procedure popFGMultiPopup(Sender: TObject);
    procedure ToggleToConform1Click(Sender: TObject);
    procedure ToggleToNonConform1Click(Sender: TObject);
    procedure ToggleToAllocate1Click(Sender: TObject);
    procedure ToggleToNonAllocate1Click(Sender: TObject);
    procedure ToggletoShip1Click(Sender: TObject);
    procedure ToggletoNonShip1Click(Sender: TObject);
    procedure ReleaseWOHardAllocation1Click(Sender: TObject);
    procedure ReleaseMakeToOrderAllocation1Click(Sender: TObject);
    procedure PrintLabels1Click(Sender: TObject);
    procedure IQSearchFGMultiMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure IQSearchLocDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure IQSearchLocDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure IQSearchLocEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure Panel11DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure pnlBottomDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure IQSearchLocMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure QryLocBeforeOpen(DataSet: TDataSet);
    procedure IQSearchLocUserBtn1OnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    FLast_FGMulti_ID: Real;
    FLocationsSaveOnResize: TNotifyEvent;
    FFGMultiSaveOnResize: TNotifyEvent;
    FMoveList: TList;
    FMoveTrgLoc_ID: Real;
    FDragDirection: string;
    FID: Real;

    procedure IQAfterShowMessage( var Msg: TMessage ); {message iq_AfterShowMessage;}
    procedure AssignIs_Hard_Alloc(AFGMulti_ID: Real);
    procedure LocalLocationsSearchPanelResize(Sender: TObject);
    procedure LocalFGMultiSearchPanelResize(Sender: TObject);
    function PrepareMoveBetweenLocationsList( ASource: TIQUniGridControl ): Boolean;
    procedure MoveBetweenLocationsShell;
    procedure CreateNewFgmulti( ACargo: TMoveCargo);
    procedure PromptSingleMoveQty(ACargo: TMoveCargo);
    procedure MoveFgMulti(ASrcFGMulti_ID, ATrgFGMulti_ID: Real; AReason: string; AQty: Real; AMaster_Label_List: TStringList);
    procedure PrepareMultipleMovesQty;
    procedure PopulateMoveBetweenLocationsList;
    procedure EnableDragTimer( AValue: Boolean;  ADir: string );
    procedure IQSearchLocStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure DoOnShowHint( var HintStr: string; var CanShow: Boolean;
     var HintInfo: THintInfo ); virtual;
{ TODO -oGPatil -cWebConvert : TGridDrawState not present in UniGui
    procedure IQSearchFGMultiCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure IQSearchLocCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);  }
    procedure SetID(const Value: Real);
  public
    { Public declarations }
    property ID: Real write SetID;
    class procedure DoShow(AID: Real = 0);
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DateDlg,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.WebVcl.Trans,
  IQMS.Common.SysShare,
{ TODO -oGPatil -cWebConvert : Dependency
  TranLinkedLabelsMove,
  TranMain,
  Trans,
  Trans_Share,
  TrReason,  }
  trans_conf_move,
  IQMS.WebVcl.ResourceStrings;


type
   TwwLocalDBGrid = class( TIQUniGridControl )    {so we could surface MouseDown event}
   public
      procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: integer);
   end;

{ TwwLocalDBGrid }
procedure TwwLocalDBGrid.MouseDown(Button: TMouseButton;  Shift: TShiftState; X, Y: integer);
begin
  inherited MouseDown( Button, Shift, X, Y );
end;

{ TMoveCargo }
constructor TMoveCargo.Create;
begin
  inherited;
  Master_Label_List:= TStringList.Create;
end;

destructor TMoveCargo.Destroy;
begin
  Master_Label_List.Free;
  inherited
end;


{ TFrmInventoryByLocations }

class procedure TFrmInventoryByLocations.DoShow(AID: Real = 0);
var
  LFrmInventoryByLocations : TFrmInventoryByLocations;
begin
  LFrmInventoryByLocations := TFrmInventoryByLocations.Create(UniGUIApplication.UniApplication);
  LFrmInventoryByLocations.Show;
end;

procedure TFrmInventoryByLocations.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.OnShowHint:= NIL;
  IQRegFormWrite(self, [ self, pnlLocations, pnlBottom01, pnlDetails ]);
end;

procedure TFrmInventoryByLocations.FormDestroy(Sender: TObject);
begin
  IQMS.Common.Controls.ClearListOfObjects( FMoveList );
  FMoveList.Free;
end;


procedure TFrmInventoryByLocations.IQAfterShowMessage(var Msg: TMessage);
begin
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain a member named TopToolPanel
  pnlLocLegend.Parent:= IQSearchLoc.TopToolPanel; // wwIncSearch.Parent.Parent as TPanel;  }
  pnlLocLegend.Align:= alRight;
  LocalLocationsSearchPanelResize( nil );
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain a member named TopToolPanel
  pnlLegendFGMulti.Parent:= IQSearchFGMulti.TopToolPanel; // wwIncSearch.Parent.Parent as TPanel;  }
  pnlLegendFGMulti.Align:= alRight;
  LocalFGMultiSearchPanelResize( nil );
end;

procedure TFrmInventoryByLocations.LocalLocationsSearchPanelResize( Sender : TObject);
begin
  if Assigned( FLocationsSaveOnResize ) then
     FLocationsSaveOnResize( Sender );
  // IQSearchLoc.wwIncSearch.Width:= IQSearchLoc.wwIncSearch.Width - pnlLocLegend.Width;
end;

procedure TFrmInventoryByLocations.LocalFGMultiSearchPanelResize( Sender : TObject);
begin
  if Assigned( FFGMultiSaveOnResize ) then
     FFGMultiSaveOnResize( Sender );
  // IQSearchFGMulti.wwIncSearch.Width:= IQSearchFGMulti.wwIncSearch.Width - pnlLegendFGMulti.Width;
end;

procedure TFrmInventoryByLocations.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmInventoryByLocations.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;


procedure TFrmInventoryByLocations.QryFGMultiCalcFields(DataSet: TDataSet);
var
  A: Variant;
  S: string;
  AHardAllocatedToPkTicket_ID: Real;

  function Get_Mfg_Count: string;
  var
    N: Real;
  begin
    Result:= '';
    N:= SelectValueFmtAsFloat('select count(*) from fgmulti_dispo_bom where fgmulti_id = %f', [ QryFGMultiID.asFloat ]);
    Result:= Format('(Mfg Cnt: %.0f)', [ N ]);
  end;

begin
  if (QryFGMultiAUTO_DISPO_STANDARD_ID.asFloat > 0 ) and ( QryFGMultiAUTO_DISPO_DEFAULT_LOC.asString = 'Y' ) then
     QryFGMultiAuto_Dispo.AsString:= Format('Default and Mfg# %s %s', [ QryFGMultiAUTO_DISPO_MFGNO.asString, Get_Mfg_Count ])

  else if (QryFGMultiAUTO_DISPO_STANDARD_ID.asFloat > 0 ) then
     QryFGMultiAuto_Dispo.AsString:= Format('Mfg # %s %s', [ QryFGMultiAUTO_DISPO_MFGNO.asString, Get_Mfg_Count ])

  else if ( QryFGMultiAUTO_DISPO_DEFAULT_LOC.asString = 'Y' ) then
     QryFGMultiAuto_Dispo.AsString:= 'Default Designator'

  else
     QryFGMultiAuto_Dispo.AsString:= '';

  if ( QryFGMultiSHIP_DEFAULT.asString = 'Y' ) then
     QryFGMultiAuto_Ship.asString:= 'Default Location'
  else
     QryFGMultiAuto_Ship.asString:= '';

  if ( QryFGMultiRECV_DEFAULT.asString = 'Y' ) then
     QryFGMultiAuto_Recv.asString:= 'Default Location';

  // hard material allocation
  AssignIs_Hard_Alloc( QryFGMultiID.asFloat );

  // in transit origin
  case QryFGMultiIN_TRANSIT_ORIGIN.asInteger of
    1: QryFGMultiIn_Transit_Origin_Disp.asString:= 'ICT';
    2: QryFGMultiIn_Transit_Origin_Disp.asString:= 'Outsource Vendor';
    3: QryFGMultiIn_Transit_Origin_Disp.asString:= 'Shipment Staging';
  end;

  // outsource vendor
  if (QryFGMultiSHIPMENT_DTL_ID_IN_TRANSIT.asFloat > 0) and (QryFGMultiIN_TRANSIT_ORIGIN.asInteger = 2) then
     QryFGMultiOutsource_VendorNo.asString:= SelectValueFmtAsString('select v.vendorno from c_ship_hist s, arcusto a, vendor v where s.shipment_dtl_id = %f and s.arcusto_id = a.id and a.vendor_id_outsource = v.id',
                                                          [ QryFGMultiSHIPMENT_DTL_ID_IN_TRANSIT.asFloat ]);

  // make to order (hard allocated to OE)
  if QryFGMultiMAKE_TO_ORDER_DETAIL_ID.asFloat > 0 then
  begin
     A:= SelectValueArrayFmt('select o.orderno, d.ord_det_seqno, make_to_order_ps_ticket_dtl_id from ord_detail d, orders o where d.id = %f and d.orders_id = o.id', [ QryFGMultiMAKE_TO_ORDER_DETAIL_ID.asFloat ]);
     if VarArrayDimCount( A ) > 0 then
     begin
       S:= '';
       if A[ 2 ] > 0 then
       begin
         AHardAllocatedToPkTicket_ID:= SelectValueFmtAsFloat('select t.id from ps_ticket_dtl d, ps_ticket t where d.id = %f and d.ps_ticket_id = t.id', [ DtoF(A[ 2 ])]);
         if AHardAllocatedToPkTicket_ID = 0 then
            AHardAllocatedToPkTicket_ID:= SelectValueFmtAsFloat('select t.id from ps_ticket_dtl_hist d, ps_ticket_hist t where d.id = %f and d.ps_ticket_id = t.id', [ DtoF(A[ 2 ])]);
         S:= Format('[PT# %.0f]', [ AHardAllocatedToPkTicket_ID ]);
       end;
       QryFGMultiMakeToOrderOrderNo.asString:= Format('%s / %s %s', [ A[ 0 ], A[ 1 ], S {show PS# this fgmulti was hard allocated via pick ticket} ]);
     end;
  end;
end;

procedure TFrmInventoryByLocations.AssignIs_Hard_Alloc( AFGMulti_ID : Real );
begin
  if QryFGMultiFGMULTI_ALLOCATED_SOURCE.asString = '' then
     EXIT;

  FLast_FGMulti_ID:= AFGMulti_ID;
  if CompareText( QryFGMultiFGMULTI_ALLOCATED_SOURCE.asString, 'workorder_bom_mat_loc') = 0 then
     begin
       Reopen( QryWO_BOM_Mat_Loc );
       QryFGMultiIs_Hard_Alloc.asString:= 'Y';
       QryFGMultiHardAllocLot.asString := Format('WO# %.0f', [ QryWO_BOM_Mat_LocWORKORDER_ID.asFloat ]);
     end
  else
     begin
       Reopen( QryFab_Lot_Mat );
       QryFGMultiIs_Hard_Alloc.asString:= QryFab_Lot_MatIS_ALLOCATED.asString;
       QryFGMultiHardAllocLot.asString := Format('Lot# %s', [ QryFab_Lot_MatLOTNO.asString ]);
     end;
end;

procedure TFrmInventoryByLocations.AssignFGMulti_IDBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
    ParamByName('fgmulti_id').Value := FLast_FGMulti_ID;
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmInventoryByLocations.IQSearchLocCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if Field = QryLocID then
     begin
       ABrush.Color:= IIf( Highlight, clBlack, clBtnFace );
       AFont.Color := IIf( Highlight, clSilver, clBlack  );
     end
  else if QryLocVMI.asString = 'Y' then
     begin
       ABrush.Color:= IIf( Highlight, clBlack, clYellow );
       AFont.Color := IIf( Highlight, clWhite, clBlack );
     end
  else if QryLocNON_CONFORM.asString = 'Y' then
     begin
       ABrush.Color:= IIf( Highlight, clBlack, clMaroon );
       AFont.Color := IIf( Highlight, clYellow, clWhite );
     end
  else if QryLocTRANSIT.asString = 'Y' then
     begin
       ABrush.Color:= IIf( Highlight, clPurple, clBlack );
       AFont.Color := IIf( Highlight, clWhite, clFuchsia );
     end;

end;    }

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmInventoryByLocations.IQSearchFGMultiCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
var
  AColorPair: TColorPair;
begin
  if Highlight then
     begin
        ABrush.Color:= clNavy;
        AFont.Color := clWhite;
        //if (gdSelected in State) then
        //   AFont.Style:= AFont.Style + [ fsItalic ];
     end

  else if TTransCustom.GetLocationSpecificColor( QryFgMulti, (gdSelected in State), AColorPair ) then
     begin
       ABrush.Color:= AColorPair.BrushColor;
       AFont.Color := AColorPair.FontColor;
     end

  else if (gdFocused in State) or (gdSelected in State) then
     begin
        ABrush.Color:= clHighlight;
        AFont.Color := clWhite;
     end
end;    }

procedure TFrmInventoryByLocations.JumpToLocationsandTransactions1Click(Sender: TObject);
begin
  IQAssert( QryFGMultiID.asFloat > 0, IQMS.WebVcl.ResourceStrings.cTXT0000103 {'Jump information is unavailable'});
{ TODO -oGPatil -cWebConvert : Dependency
  TranMain.DoLocateFGMulti( Application, QryFGMultiID.asFloat );  }
end;

procedure TFrmInventoryByLocations.JumpToInventory1Click(Sender: TObject);
begin
  IQJumpInv.Execute
end;

procedure TFrmInventoryByLocations.AbortEdit(DataSet: TDataSet);
begin
  ABORT;
end;

procedure TFrmInventoryByLocations.Contents1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmInventoryByLocations.popFGMultiPopup(Sender: TObject);
var
  ArinvtLotDocsNON_CONFORM_ID:Real;
  ArinvtLotDocsNON_ALLOCATE_ID:Real;
  ArinvtLotDocsNO_SHIP:String;
  ANoShip:String;
begin
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain FindMenuItem
  with IQSearchFGMulti.FindMenuItem( ChangeInDate1 ) do
    Enabled:= SR.Enabled['ChangeInDate1'] and not (IQSearchFGMulti.Dataset.Eof and IQSearchFGMulti.Dataset.Bof);

  with IQSearchFGMulti.FindMenuItem( JumpToLocationsandTransactions1 ) do
    Enabled:= SR.Enabled['JumpToLocationsandTransactions1'] and (IQSearchFGMulti.wwDBGrid.SelectedList.Count <= 1);

  with IQSearchFGMulti.FindMenuItem( JumpToInventory1 ) do
    Enabled:= SR.Enabled['JumpToInventory1'] and (IQSearchFGMulti.wwDBGrid.SelectedList.Count <= 1);
}
  ANoShip := SelectValueFmtAsString('select no_ship from fgmulti where id = %f', [QryFGMultiID.asFloat]);
  ArinvtLotDocsNON_CONFORM_ID  := 0;
  ArinvtLotDocsNON_ALLOCATE_ID := 0;
  ArinvtLotDocsNO_SHIP         := '';

  with TFDQuery.Create(nil) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IqFormat('select NON_CONFORM_ID, NON_ALLOCATE_ID, NO_SHIP ' +
                     'from arinvt_lot_docs where arinvt_id = %f  and NVL(rtrim(lotno), ''*'') = NVL(rtrim(''%s''), ''*'')',
                     [QryFGMultiARINVT_ID.asFloat, StrTran(QryFGMultiLOTNO.asString, '''', '''''')]));

    Open;
    if not (eof and bof) then
    begin
      ArinvtLotDocsNON_CONFORM_ID  := FieldByName('NON_CONFORM_ID').asFloat;
      ArinvtLotDocsNON_ALLOCATE_ID := FieldByName('NON_ALLOCATE_ID').asFloat;
      ArinvtLotDocsNO_SHIP         := FieldByName('NO_SHIP').AsString
    end;
  finally
    free;
  end;
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain FindMenuItem
  with IQSearchFGMulti.FindMenuItem( ToggleToConform1 ) do
    Visible := (Trim(QryFGMultiNON_CONF_DESCRIP.AsString ) > '')
                 and SR.Visible['ToggleToConform1']
                 and (ArinvtLotDocsNON_CONFORM_ID = 0);

  with IQSearchFGMulti.FindMenuItem( ToggleToNonConform1 ) do
    Visible := (Trim(QryFGMultiNON_CONF_DESCRIP.AsString ) = '')
                and SR.Visible['ToggleToNonConform1'];

  with IQSearchFGMulti.FindMenuItem( ToggleToAllocate1 ) do
    Visible := (Trim(QryFGMultiNON_ALLOCATE_DESCRIP.AsString) > '')
                 and SR.Visible['ToggleToAllocate1']
                 and (ArinvtLotDocsNON_ALLOCATE_ID = 0);

  with IQSearchFGMulti.FindMenuItem( ToggleToNonAllocate1 ) do
    Visible := (Trim(QryFGMultiNON_ALLOCATE_DESCRIP.AsString) = '')
                and SR.Visible['ToggleToNonAllocate1'];

  with IQSearchFGMulti.FindMenuItem( ToggletoShip1 ) do
    Visible := (Trim(ANoShip) = 'Y')
                and SR.Visible['ToggletoShip1']
                and (ArinvtLotDocsNO_SHIP <> 'Y');

  with IQSearchFGMulti.FindMenuItem( ToggletoNonShip1 ) do
    Visible := ((Trim(ANoShip) = 'N') or  (Trim(ANoShip) = ''))
                 and SR.Visible['ToggletoNonShip1'];

  with IQSearchFGMulti.FindMenuItem( ReleaseWOHardAllocation1 ) do
    Enabled:= (QryFGMultiIs_Hard_Alloc.asString = 'Y') and SR.Enabled['ReleaseWOHardAllocation1'];
  with IQSearchFGMulti.FindMenuItem( ReleaseMakeToOrderAllocation1 ) do
    Enabled:= (QryFGMultiMAKE_TO_ORDER_DETAIL_ID.asFloat > 0) and SR.Enabled['ReleaseMakeToOrderAllocation1'];

  with IQSearchFGMulti.FindMenuItem( PrintLabels1 ) do
    Enabled:= ((QryFGMultiIS_LINKED_TO_SERIAL.asString = 'N') or (QryFGMultiIS_LINKED_TO_SERIAL.asString = '')) and SR.Enabled['PrintLabels1'];
}
end;

procedure TFrmInventoryByLocations.ChangeInDate1Click(Sender: TObject);
var
  ADate: TDateTime;
  I: Integer;

  procedure ChangeInDate( AFgMulti_ID: Real );
  begin
    ExecuteCommandFmt('update fgmulti set in_date = to_date(''%s'',''mm/dd/yyyy hh24:mi:ss'') where id = %f',
              [ FormatDateTime('mm/dd/yyyy hh:nn:ss', ADate ),
                AFgMulti_ID ]);
  end;

begin
  ADate:= Date;
  if not GetDateDialog( ADate, 'Change In-Date' ) then
     EXIT;

  with IQSearchFGMulti do
  try
     Datasource.DataSet.DisableControls;
{ TODO -oGPatil -cWebConvert : TUniDBGrid does not contain selectedlist and  UnselectAll
     if DBGrid.SelectedList.Count > 0 then
        for I:= 0 to DBGrid.SelectedList.Count - 1 do
        begin
          Datasource.DataSet.GotoBookmark( DBGrid.SelectedList.Items[ I ]);
          ChangeInDate( Datasource.DataSet.FieldByName('id').asFloat );
        end
     else
        ChangeInDate( Datasource.DataSet.FieldByName('id').asFloat );

     DBGrid.UnselectAll;   }
  finally
     Datasource.DataSet.EnableControls;
     RefreshDataSetByID(QryFGMulti);
  end;
end;

procedure TFrmInventoryByLocations.ToggleToConform1Click(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency
  ToggletoConf(self, QryFGMultiARINVT_ID.asFloat, QryFGMultiID.AsFloat);     {Trans_Share.pas}
  RefreshDataSetByID(QryFGMulti);
end;

procedure TFrmInventoryByLocations.ToggleToNonConform1Click(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency
  ToggletoNonConf(self, QryFGMultiID.AsFloat); {Trans_Share.pas}
  RefreshDataSetByID(QryFGMulti);
end;

procedure TFrmInventoryByLocations.Timer1Timer(Sender: TObject);
begin
  if FDragDirection = 'UP' then
     QryLoc.MoveBy(-1)
  else if FDragDirection = 'DOWN' then
     QryLoc.MoveBy(1);
end;

procedure TFrmInventoryByLocations.ToggleToAllocate1Click(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency
  ToggleToAlloc(QryFGMultiID.AsFloat); {Trans_Share.pas}
  RefreshDataSetByID(QryFGMulti);
end;

procedure TFrmInventoryByLocations.ToggleToNonAllocate1Click(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency
  ToggleToNonAlloc(self, QryFGMultiID.AsFloat); {Trans_Share.pas}
  RefreshDataSetByID(QryFGMulti);
end;

procedure TFrmInventoryByLocations.ToggletoShip1Click(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency
  ToggleToShip(QryFGMultiID.AsFloat); {Trans_Share.pas}
  RefreshDataSetByID(QryFGMulti);
end;

procedure TFrmInventoryByLocations.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead(self, [ self, pnlLocations, pnlBottom01, pnlDetails ]);

  FMoveList:= TList.Create;

  EnableDragTimer( FALSE, '' );
{ TODO -oGPatil -cWebConvert :  Cannot access protected symbol TControl.OnStartDrag
  IQSearchFGMulti.DBGrid.OnStartDrag:= IQSearchLocStartDrag;  }

  lblDivision.Caption:= CheckReplaceDivisionCaption( lblDivision.Caption );  {IQMS.Common.SysShare.pas}

  // legends on location and fgmulti
//  PostMessage( Handle, iq_AfterShowMessage, 0, 0 );
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain wwIncSearch
  FLocationsSaveOnResize:= TUniPanel(IQSearchLoc.wwIncSearch.Parent).OnResize;
  TUniPanel(IQSearchLoc.wwIncSearch.Parent).OnResize:= LocalLocationsSearchPanelResize;

  FFGMultiSaveOnResize:= TUniPanel(IQSearchFGMulti.wwIncSearch.Parent).OnResize;
  TUniPanel(IQSearchFGMulti.wwIncSearch.Parent).OnResize:= LocalFGMultiSearchPanelResize;
}
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain AddRefreshButton
  IQSearchLoc.AddRefreshButton;
  IQSearchFGMulti.AddRefreshButton;
  IQSearchLabel.AddRefreshButton; }
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain UserBtn1
  IQSearchLoc.UserBtn1.AllowAllUp:= TRUE;
  IQSearchLoc.UserBtn1.GroupIndex:= 1;
}
{ TODO -oGPatil -cWebConvert : TUniDbGrid does not contain MultiSelectOptions
  IQSearchFGMulti.DBGrid.MultiSelectOptions:= [ msoShiftSelect ];  }
end;

procedure TFrmInventoryByLocations.ToggletoNonShip1Click(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency
  ToggleToNoShip(QryFGMultiID.AsFloat); {Trans_Share.pas}
  RefreshDataSetByID(QryFGMulti);
end;

procedure TFrmInventoryByLocations.ReleaseWOHardAllocation1Click(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency
  ReleaseWOHardAllocation(QryFGMultiID.AsFloat); {Trans_Share.pas}
  RefreshDataSetByID(QryFGMulti);
end;

procedure TFrmInventoryByLocations.SetID(const Value: Real);
begin
  if Value > 0 then
     QryLoc.Locate('ID', Value, [])
end;

procedure TFrmInventoryByLocations.ReleaseMakeToOrderAllocation1Click(
  Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency
  ReleaseMakeToOrderAllocation(QryFGMultiID.asFloat); {Trans_Share.pas}
  RefreshDataSetByID(QryFGMulti);
end;

procedure TFrmInventoryByLocations.PrintLabels1Click(Sender: TObject);
var
  AStandardId:Real;
begin
  AStandardId := SelectValueFmtAsFloat('select standard_id from arinvt where id = %f', [QryFGMultiARINVT_ID.asFloat]);
{ TODO -oGPatil -cWebConvert : Dependency
  PrintLabels_Shared(QryFGMultiID.asFloat, AStandardId); {Trans_Share.pas}
end;

procedure TFrmInventoryByLocations.IQSearchFGMultiMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
{ TODO -oGPatil -cWebConvert : TUniDbGrid does not contain RowHeights
  if (Shift = [ssLeft]) and (Y > IQSearchFGMulti.DBGrid.RowHeights[ 0 ]) and not (QryFGMulti.Eof and QryFGMulti.Bof) then
    IQSearchFGMulti.DBGrid.BeginDrag(FALSE);   }
end;

procedure TFrmInventoryByLocations.IQSearchLocDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  EnableDragTimer( FALSE, '' );

  Accept:= (Source is TIQUniGridControl) and ((Source = IQSearchFGMulti.DBGrid)
                                      or
                                      ((TIQUniGridControl(Source).Name = 'IQSearchGrid')
                                       and (TIQUniGridControl(Source).Owner.Name = 'IQSearchFGMulti')
                                       and (TIQUniGridControl(Source).Owner.Owner is TFrmInventoryByLocations)))
           and (Sender = IQSearchLoc.DBGrid)
           and not (QryLoc.Eof and QryLoc.Bof);
end;

procedure TFrmInventoryByLocations.IQSearchLocDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  ADB: TFDCustomConnection;
  ASourceForm : TFrmInventoryByLocations;
  ASenderForm : TFrmInventoryByLocations;

  function GetOwnerForm(AComponent:TComponent): TFrmInventoryByLocations;
  var
    aOwner:TObject;
  begin
    while true do
    begin
      aOwner     := aComponent.Owner;

      if aOwner.classname = 'TFrmInventoryByLocations' then
      begin
        result := TFrmInventoryByLocations(aOwner);
        exit;
      end;
      aComponent := aComponent.Owner;
    end;
  end;

  procedure _CopyFrom( AMoveList: TList );
  var
    I: Integer;
    ACargo: TMoveCargo;
  begin
    IQMS.Common.Controls.ClearListOfObjects( self.FMoveList );
    for I:= 0 to AMoveList.Count - 1 do
    begin
      ACargo:= TMoveCargo.Create;
      ACargo.SrcFGMulti_ID:= TMoveCargo(AMoveList[ I ]).SrcFGMulti_ID;
      ACargo.SrcOnHandQty := TMoveCargo(AMoveList[ I ]).SrcOnHandQty;
      ACargo.MoveQty      := TMoveCargo(AMoveList[ I ]).MoveQty;
      ACargo.Arinvt_ID    := TMoveCargo(AMoveList[ I ]).Arinvt_ID;
      ACargo.SrcInDate    := TMoveCargo(AMoveList[ I ]).SrcInDate;

      // add to list
      FMoveList.Add( ACargo );
    end;
  end;



begin
(* TODO -oGPatil -cWebConvert : Incompatible types: 'TFormClass' and 'class of TFrmTransConfMove'
  if not (IQDialogChkEx( TFrmTransConfMove,    {IQDialogChkEx is defined in IQMesg, TFrmTransConfMove is in trans_conf_move;.pas}
                         'Are you sure you want to move location?',
                         'FrmTransConfMove' ) = 1) then
     EXIT;    *)

  //if not PrepareMoveBetweenLocationsList( TwwDBGrid(Source).Owner as TIQSearch ) then
  //   EXIT;

  ASourceForm := GetOwnerForm(TComponent(Source));
  ASenderForm := GetOwnerForm(TComponent(Sender));

  if ASourceForm <> ASenderForm then
    _CopyFrom( ASourceForm.FMoveList );

  if FMoveList.Count = 0 then
     EXIT;

  ADB:= FDManager.FindConnection('IQFD');
  ADB.StartTransaction;
  try
    // drop it on the grid
    TwwLocalDBGrid(IQSearchLoc.DBGrid).MouseDown( mbLeft, [ssLeft], X, Y );
    FMoveTrgLoc_ID:= QryLocID.asFloat;

    { TODO -oGPatil -cWebConvert : Dependency trans_share
    CheckLocationCycleCounted( FMoveTrgLoc_ID ); }

    // launch the engine
    MoveBetweenLocationsShell;

    ADB.Commit;
  finally
    IQMS.Common.Controls.ClearListOfObjects( FMoveList );
    if ADB.InTransaction then ADB.Rollback;
  end;

  RefreshDataSetByID( QryFGMulti );
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain DataSet
  RefreshDataSetByID( (TIQUniGridControl(Source).Owner as TIQUniGridControl).DataSet );    }
end;


procedure TFrmInventoryByLocations.MoveBetweenLocationsShell;
var
  I: Integer;
  ACargo: TMoveCargo;
begin
  // create target fgmulti for each source fgmulti
  PopulateMoveBetweenLocationsList;

  // assign qty and reason
  if FMoveList.Count = 1 then
     PromptSingleMoveQty( TMoveCargo(FMoveList[ 0 ]))
  else
     PrepareMultipleMovesQty;

  // prepare and execute the move
  for I:= 0 to FMoveList.Count - 1 do
  begin
    ACargo:= TMoveCargo(FMoveList[ I ]);

{ TODO -oGPatil -cWebConvert : Dependency trans_share
    CheckFGMultiCycleCounted( ACargo.SrcFGMulti_ID );

    TTransCustom.PrepareMoveA( ACargo.SrcFGMulti_ID,   // AFrom_FGMulti_ID            // trans.pas
                               ACargo.TrgFGMulti_ID,   // ATo_FGMulti_ID_Attempted
                               ACargo.TrgFGMulti_ID,   // ATo_FGMulti_ID_Final
                               ACargo.SrcInDate,       // AFrom_DateIn
                               nil,                    // CheckConformSecurity
                               FMoveTrgLoc_ID );       // ATo_Loc_ID

    MoveFgMulti( ACargo.SrcFGMulti_ID,                 // ASrcFGMulti_ID
                 ACargo.TrgFGMulti_ID,                 // ATrgFGMulti_ID
                 ACargo.Reason,                        // AReason
                 ACargo.MoveQty,                       // AQty
                 ACargo.Master_Label_List );           // AMaster_Label_List  }
  end;
end;

function TFrmInventoryByLocations.PrepareMoveBetweenLocationsList( ASource: TIQUniGridControl ): Boolean;
var
  I: Integer;

  procedure AddToList;
  var
    ACargo: TMoveCargo;
  begin
    // create cargo
    ACargo:= TMoveCargo.Create;
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain DataSet
    ACargo.SrcFGMulti_ID:= ASource.DataSet.FieldByName('ID').asFloat;
    ACargo.SrcOnHandQty := ASource.DataSet.FieldByName('ONHAND').asFloat;  }
    ACargo.MoveQty      := ACargo.SrcOnHandQty;
    ACargo.Arinvt_ID    := SelectValueByID('arinvt_id', 'fgmulti', ACargo.SrcFGMulti_ID);
    ACargo.SrcInDate    := SelectValueByID('in_date', 'fgmulti', ACargo.SrcFGMulti_ID);

    // add to list
    FMoveList.Add( ACargo );
  end;

begin
  IQMS.Common.Controls.ClearListOfObjects( FMoveList );

  with ASource do
  try
     Datasource.DataSet.DisableControls;
     if (Datasource.DataSet.Eof and Datasource.DataSet.Bof) then
        EXIT;
{ TODO -oGPatil -cWebConvert : TUniDBGrid does not contain selectedlist
     if DBGrid.SelectedList.Count > 1 then
        for I:= DBGrid.SelectedList.Count - 1 downto 0 do
        begin
          Datasource.DataSet.GotoBookmark( DBGrid.SelectedList.Items[ I ]);
          AddToList;
          DBGrid.UnselectRecord;
        end
     else
        AddToList;  }

  finally
     Datasource.DataSet.EnableControls;
  end;

  Result:= FMoveList.Count > 0;
end;

procedure TFrmInventoryByLocations.PopulateMoveBetweenLocationsList;
var
  I: Integer;
  ACargo: TMoveCargo;
begin
  for I:= 0 to FMoveList.Count - 1 do
  begin
    ACargo:= TMoveCargo(FMoveList[I]);

    // create fgmulti
    CreateNewFgmulti( ACargo );

    // validate
{ TODO -oGPatil -cWebConvert : Dependency
    TTransCustom.CheckBothLocationsForVMI( ACargo.SrcFGMulti_ID, ACargo.TrgFGMulti_ID );  // trans.pas }
  end;
end;

procedure TFrmInventoryByLocations.CreateNewFgmulti( ACargo: TMoveCargo );
begin
  ACargo.TrgFgMulti_ID:= GetNextID( 'fgmulti' );

  ExecuteCommandFmt('insert into fgmulti                                                   '+
            '     ( id, arinvt_id, loc_id, lotno, non_conform_id, non_allocate_id, '+
            '       auto_dispo_default_loc, ship_default, cuser1, cuser2, cuser3,  '+
            '       division_id, recv_default, lot_date, make_to_order_detail_id,  '+
            '       no_ship, containerno, auto_dispo_standard_id, in_date )        '+
            'select                                                                '+
            '       %f, arinvt_id, %f, lotno, non_conform_id, non_allocate_id,     '+
            '       auto_dispo_default_loc, ship_default, cuser1, cuser2, cuser3,  '+
            '       division_id, recv_default, lot_date, make_to_order_detail_id,  '+
            '       no_ship, containerno, auto_dispo_standard_id, in_date          '+
            '  from fgmulti                                                        '+
            ' where id = %f                                                        ',
            [ ACargo.TrgFgMulti_ID,
              FMoveTrgLoc_ID,
              ACargo.SrcFgMulti_ID ]);

  ExecuteCommandFmt('insert into fgmulti_dispo_bom    '+
            '     ( standard_id, fgmulti_id ) '+
            'select                           '+
            '       standard_id, %f           '+
            '  from fgmulti_dispo_bom         '+
            ' where fgmulti_id = %f           ',
            [ ACargo.TrgFgMulti_ID,
              ACargo.SrcFgMulti_ID ]);
end;


procedure TFrmInventoryByLocations.PromptSingleMoveQty( ACargo: TMoveCargo );
begin
(* TODO -oGPatil -cWebConvert : Dependency TranLinkedLabelsMove
  case SelectValueByID('is_linked_to_serial', 'arinvt', ACargo.Arinvt_ID ) = 'Y' of
    TRUE :  if not TFrmLinkedLabelsMove.DoShowModal( ACargo.SrcFGMulti_ID, ACargo.TrgFGMulti_ID, ACargo.Master_Label_List, ACargo.MoveQty, ACargo.Reason ) then {TranLinkedLabelsMove.pas}
               ABORT;
    FALSE:  if not TrReason.DoGetReasonAndQty( ACargo.Reason, ACargo.MoveQty, ACargo.SrcFGMulti_ID, ACargo.TrgFGMulti_ID ) then // trreason.pas
               ABORT;
  end; *)
end;

procedure TFrmInventoryByLocations.PrepareMultipleMovesQty;
var
  I: Integer;
begin
  // applies only to serialized items
  for I:= 0 to FMoveList.Count - 1 do with TMoveCargo(FMoveList[ I ]) do
  begin
    if SelectValueByID('is_linked_to_serial', 'arinvt', Arinvt_ID ) = 'Y' then
       LoadColumnValueIntoStringList( Master_Label_List,
                                            Format('select id from master_label where fgmulti_id = %.0f', [ SrcFGMulti_ID  ]));
    Reason:= 'Inventory By Location Multiple Move';
  end;
end;


procedure TFrmInventoryByLocations.MoveFgMulti( ASrcFGMulti_ID, ATrgFGMulti_ID: Real; AReason: string; AQty: Real; AMaster_Label_List: TStringList );
var
  IsMovedFromNonConformToConform: Boolean;
  ATransMove: TIQWebTransMove;
begin
(* TODO -oGPatil -cWebConvert : Dependency trans_share
  if IsVMI( SelectValueByID( 'loc_id', 'fgmulti', ASrcFGMulti_ID )) and  IsVMI( SelectValueByID( 'loc_id', 'fgmulti', ATrgFGMulti_ID )) then  // trans_share.pas
     ATransMove:= TIQWebTransMoveVMI.Create(self)  {TIQWebTransMoveVMI inherits from TTransMove and just changes the TYPE of the trans}
  else
     ATransMove:= TIQWebTransMove.Create(self);
 *)
  with ATransMove do
  try
    MoveFrom_FGMulti_ID := ASrcFGMulti_ID;
    MoveTo_FGMulti_ID   := ATrgFGMulti_ID;
    Trans_Quan          := AQty;
    Trans_RG_Quan       := 0;
    Trans_Reason        := AReason;

    {reset the master_label}
    TransOut.Master_Label_List:= AMaster_Label_List;
    {reassign master_label - fgmulti_id, loc_desc etc}
    TransIn .Master_Label_List:= AMaster_Label_List;

    Execute;

    if TransErrCode > 0 then
       ABORT;
  finally
    ATransMove.Free;
  end;
end;

procedure TFrmInventoryByLocations.EnableDragTimer(AValue: Boolean;
  ADir: string);
begin
  FDragDirection:= ADir;
  Timer1.Enabled:= AValue;
end;

procedure TFrmInventoryByLocations.IQSearchLocStartDrag(Sender: TObject;var DragObject: TDragObject);
begin
  PrepareMoveBetweenLocationsList( IQSearchFGMulti )
end;

procedure TFrmInventoryByLocations.Panel11DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept:= FALSE;
  EnableDragTimer( TRUE, 'UP' );
end;

procedure TFrmInventoryByLocations.pnlBottomDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept:= FALSE;
  EnableDragTimer( TRUE, 'DOWN' );
end;

procedure TFrmInventoryByLocations.IQSearchLocEndDrag(Sender, Target: TObject;
  X, Y: Integer);
begin
  EnableDragTimer( FALSE, '' );
end;

procedure TFrmInventoryByLocations.IQSearchLocMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  EnableDragTimer( FALSE, '' );
end;

procedure TFrmInventoryByLocations.DoOnShowHint(var HintStr: string;
  var CanShow: Boolean; var HintInfo: THintInfo);
begin
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain a member named UserBtn1
  with HintInfo do
    if HintControl = IQSearchLoc.UserBtn1 then
    begin
      if IQSearchLoc.UserBtn1.Down then
         HintStr:= IQMS.WebVcl.ResourceStrings.cTXT0000044 // 'Showing inactive only.'#13'Click to toggle.'
      else
         HintStr:= IQMS.WebVcl.ResourceStrings.cTXT0000045 // 'Showing active only.'#13'Click to toggle.'
    end      }
end;


procedure TFrmInventoryByLocations.QryLocBeforeOpen(DataSet: TDataSet);
begin
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain UserBtn1
  TFDQuery(DataSet).ParamByName('pk_hide').Value := IIf( IQSearchLoc.UserBtn1.Down, 'Y', 'N' );    }
end;

procedure TFrmInventoryByLocations.IQSearchLocUserBtn1OnClick(Sender: TObject);
begin
  Reopen(QryLoc);
end;

procedure TFrmInventoryByLocations.FormActivate(Sender: TObject);
begin
  Application.OnShowHint:= DoOnShowHint;
end;



end.
