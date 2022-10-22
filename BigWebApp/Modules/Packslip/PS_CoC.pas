unit PS_CoC;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Buttons,
  Vcl.wwDataInspector,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Menus,
  Mask,
  IQMS.Common.JumpConstants,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.Jump,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
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
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, Vcl.Grids, IQUniGrid, uniGUIFrame;

type
  TFrmCoC = class(TUniForm)
    pnlTop: TUniPanel;
    wwDBGridShipBom: TIQUniGridControl;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    Panel1: TUniPanel;
    NavShipBom: TUniDBNavigator;
    Panel4: TUniPanel;
    NavShipBomLot: TUniDBNavigator;
    wwDataInspectorHeader: TwwDataInspector;
    Splitter2: TUniSplitter;
    sbtnPrintPackingSlip: TUniSpeedButton;
    sbtnCalcCoC: TUniSpeedButton;
    wwDBGridShipBomLot: TIQUniGridControl;
    SrcShip_Bom: TDataSource;
    QryShip_Bom: TFDQuery;
    QryShip_BomID: TBCDField;
    QryShip_BomSHIPMENT_DTL_ID: TBCDField;
    QryShip_BomPARENT_ID: TBCDField;
    QryShip_BomARINVT_ID: TBCDField;
    QryShip_BomSTANDARD_ID: TBCDField;
    QryShip_BomPARENT_ARINVT_ID: TBCDField;
    QryShip_BomPARENT_STANDARD_ID: TBCDField;
    QryShip_BomOPMAT_ID: TBCDField;
    QryShip_BomPTSPER: TFMTBCDField;
    QryShip_BomBOM_LEVEL: TBCDField;
    QryShip_BomKIND: TStringField;
    QryShip_Bom_ItemNo_Indented: TStringField;
    QryShip_BomLEVEL: TFMTBCDField;
    QryShip_BomItemno: TStringField;
    QryShip_BomDescrip: TStringField;
    QryShip_BomRev: TStringField;
    QryShip_BomClass: TStringField;
    SrcHeader: TDataSource;
    QryHeader: TFDQuery;
    QryHeaderPACKSLIPNO: TStringField;
    QryHeaderITEMNO: TStringField;
    QryHeaderDESCRIP: TStringField;
    QryHeaderCLASS: TStringField;
    QryHeaderREV: TStringField;
    QryHeaderDESCRIP2: TStringField;
    QryHeaderCUSTNO: TStringField;
    QryHeaderCOMPANY: TStringField;
    QryHeaderSHIPMENT_DTL_ID: TBCDField;
    SrcShipBomLot: TDataSource;
    QryShipBomLot: TFDQuery;
    QryShipBomLotID: TBCDField;
    QryShipBomLotC_SHIP_BOM_ID: TBCDField;
    QryShipBomLotLOTNO: TStringField;
    QryShipBomLotTRANSLOG_ID: TBCDField;
    PopupMenuShipBom: TUniPopupMenu;
    AddItem1: TUniMenuItem;
    AddSubItem1: TUniMenuItem;
    DeleteItem1: TUniMenuItem;
    UpdateSQLShipBom: TFDUpdateSQL;
    wwDBComboDlgItemNo: TUniEdit;
    QryShip_BomMfgNo: TStringField;
    wwDBComboBoxKind: TUniDBComboBox;
    PkArinvt: TIQWebHPick;
    PkArinvtID: TBCDField;
    PkArinvtITEMNO: TStringField;
    PkArinvtCLASS: TStringField;
    PkArinvtREV: TStringField;
    PkArinvtDESCRIP: TStringField;
    PkArinvtDESCRIP2: TStringField;
    PkArinvtEPLANT_ID: TBCDField;
    PkArinvtARCUSTO_ID: TBCDField;
    PkArinvtCUSTNO: TStringField;
    PkArinvtCOMPANY: TStringField;
    PkArinvtSTANDARD_ID: TBCDField;
    UpdateSQLShipBomLot: TFDUpdateSQL;
    Splitter3: TUniSplitter;
    wwDataInspectorTranslog: TwwDataInspector;
    SrcTranslog: TDataSource;
    QryTranslog: TFDQuery;
    QryTranslogID: TBCDField;
    QryTranslogARINVT_ID: TBCDField;
    QryTranslogCLASS: TStringField;
    QryTranslogITEMNO: TStringField;
    QryTranslogREV: TStringField;
    QryTranslogDESCRIP: TStringField;
    QryTranslogUNIT: TStringField;
    QryTranslogTRANS_IN_OUT: TStringField;
    QryTranslogTRANS_DATE: TDateTimeField;
    QryTranslogTRANS_QUAN: TFMTBCDField;
    QryTranslogRG_QUAN: TFMTBCDField;
    QryTranslogTRANS_TYPE: TStringField;
    QryTranslogLOC_DESC: TStringField;
    QryTranslogACT_COST: TFMTBCDField;
    QryTranslogMFGNO: TStringField;
    QryTranslogORDERNO: TStringField;
    QryTranslogUSERID: TStringField;
    QryTranslogLOTNO: TStringField;
    QryTranslogFG_LOTNO: TStringField;
    QryTranslogTRANS_REASON: TStringField;
    QryTranslogPOSTED: TStringField;
    QryTranslogBATCH: TBCDField;
    QryTranslogBEGIN_QUAN: TFMTBCDField;
    QryTranslogBEGIN_RG_QUAN: TFMTBCDField;
    QryTranslogDAY_PART_ID: TBCDField;
    QryTranslogSTD_COST: TFMTBCDField;
    QryTranslogCOST_ELEMENT: TStringField;
    QryTranslogPARENT_ARINVT_ID: TBCDField;
    QryTranslogFGMULTI_CUSER1: TStringField;
    QryTranslogFGMULTI_CUSER2: TStringField;
    QryTranslogFGMULTI_CUSER3: TStringField;
    QryTranslogSOURCE: TStringField;
    QryTranslogSOURCE_ID: TBCDField;
    QryTranslogRECEIPTNO: TStringField;
    QryTranslogDIVISION_ID: TBCDField;
    QryTranslogDIVISION_NAME: TStringField;
    QryTranslogTRANS_CODE: TStringField;
    QryTranslogTRANS_DESCRIP: TStringField;
    QryTranslogLOCATION_DESCRIP: TStringField;
    QryTranslogWORKORDER_ID: TBCDField;
    QryTranslogEXCLUDE_RPT: TStringField;
    QryTranslogEPLANT_ID: TBCDField;
    QryTranslogBEGIN_QUAN_TOTAL: TFMTBCDField;
    QryTranslogBEGIN_RG_QUAN_TOTAL: TFMTBCDField;
    QryTranslogRECV_DATE: TDateTimeField;
    QryTranslogPROD_DATE: TDateTimeField;
    QryTranslogRMA_DETAIL_ID: TBCDField;
    QryTranslogACT_DATE: TDateTimeField;
    QryTranslogTRACKNO: TStringField;
    QryTranslogNON_CONFORM_CODE: TStringField;
    QryTranslogFGMULTI_ID: TBCDField;
    N2: TUniMenuItem;
    JumptoInventory1: TUniMenuItem;
    JumptoBOM1: TUniMenuItem;
    IQJumpInv: TIQWebJump;
    IQJumpBom: TIQWebJump;
    Shape5: TUniPanel;
    Shape1: TUniPanel;
    QryShip_BomTranslog_Rec_Exists: TStringField;
    QryShipBomLotVENDOR_ID: TBCDField;
    SrcVendor: TDataSource;
    QryVendor: TFDQuery;
    QryVendorVENDORNO: TStringField;
    QryVendorCOMPANY: TStringField;
    N1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    SR: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryShip_BomCalcFields(DataSet: TDataSet);
    procedure QryHeaderBeforeOpen(DataSet: TDataSet);
    //procedure DispatchNavShipBomAction(Sender: TObject; Button: TNavigateBtn);
    //procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure QryShip_BomUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure QryShip_BomNewRecord(DataSet: TDataSet);
    procedure QryShip_BomBeforePost(DataSet: TDataSet);
    procedure wwDBGridShipBomCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure AddItem1Click(Sender: TObject);
    procedure AddSubItem1Click(Sender: TObject);
    procedure PopupMenuShipBomPopup(Sender: TObject);
    procedure DeleteItem1Click(Sender: TObject);
    procedure sbtnCalcCoCClick(Sender: TObject);
    procedure wwDBComboDlgItemNoCustomDlg(Sender: TObject);
    procedure AssignEPlantFilter(DataSet: TDataSet);
    procedure QryShipBomLotNewRecord(DataSet: TDataSet);
    procedure QryShipBomLotBeforePost(DataSet: TDataSet);
    procedure sbtnPrintPackingSlipClick(Sender: TObject);
    procedure JumptoInventory1Click(Sender: TObject);
    procedure JumptoBOM1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SRAfterApply(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FShipment_Dtl_ID: Real;
    procedure IQAfterPost( var Msg: TMessage ); message iq_AfterPost;
    procedure IQAfterShow( var Msg: TMessage ); message iq_AfterShowMessage;
    procedure AddItemAsChildOf(AParent_ID: Real);
    function ToStr( AValue: Real ): string;
    procedure RecalcCoC;
    procedure SetShipment_Dtl_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShowModal( AShipment_Dtl_ID: Real );
    class procedure DoAutoPrintEntireShipmentCoC(AShipment_ID: Real);
    property Shipment_Dtl_ID: Real write SetShipment_Dtl_ID;
  end;


implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  { TODO -omsonawane -cWEBIQ : Resolve dependency
   IQSecIns,
   prn_coc,
  }
  IQMS.Common.StringUtils,
  System.Variants;

{ TFrmCoC }

class procedure TFrmCoC.DoShowModal( AShipment_Dtl_ID: Real );
var
   LFrmCoC : TFrmCoC;
begin
  LFrmCoC := TFrmCoC.create(UniGuiApplication.UniApplication);
  LFrmCoC.Shipment_Dtl_ID:= AShipment_Dtl_ID;
  LFrmCoC.ShowModal;

end;

class procedure TFrmCoC.DoAutoPrintEntireShipmentCoC(AShipment_ID: Real);
var
  // AReportName   : string;
  // ACopies       : Integer;
  // ACollated     : Boolean;
  // ASelectionList: TStringList;
  AShipment_Dtl_ID_Start: Real;
  AShipment_Dtl_ID_End  : Real;
begin
  AShipment_Dtl_ID_Start:= SelectValueFmtAsFloat('select min(id) from shipment_dtl where shipments_id = %.0f', [ AShipment_ID ]);
  AShipment_Dtl_ID_End  := SelectValueFmtAsFloat('select max(id) from shipment_dtl where shipments_id = %.0f', [ AShipment_ID ]);

  (* TODO -omsonawane -cWEBIQ : Resolve dependency
  DoPrint_COC( FloatToStr( AShipment_Dtl_ID_Start ),  FloatToStr( AShipment_Dtl_ID_End ), TRUE ); {prn_coc.pas}
  *)
  // AReportName:= SelectValueAsString('select COC_REPORT from iqsys');
  // IQAssert( not Empty( AReportName ), 'No default COC report assigned in System Parameters. Please assign default report' );
  // if not AssignPrinterSettings( AOwner, AReportName, ACopies, ACollated ) then
  //    EXIT;
  //
  // with TFDQuery.Create( nil ) do
  // try
  //   Connection := MainModule.FDConnection;
  //   SQL.Add( Format('select id from shipment_dtl where shipments_id = %.0f', [ AShipment_ID ]));
  //   Open;
  //
  //   ASelectionList:= TStringList.Create;
  //   while not Eof do
  //   begin
  //     {calculate}
  //     ExecuteCommandFmt( 'begin ship_bom.populate_ship_bom( %f ); end;', [ FieldByName('id').asFloat ]);
  //
  //     {print}
  //     ASelectionList.Clear; ASelectionList.Add( Format('{C_SHIP_BOM.SHIPMENT_DTL_ID} = %.0f', [ FieldByName('id').asFloat ]));
  //     PrintDefaultReportExA( AReportName, ASelectionList, ACopies, ACollated );
  //
  //     Next;
  //   end;
  // finally
  //   Free;
  //   ASelectionList.Free;
  // end;
end;


procedure TFrmCoC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, pnlTop, wwDataInspectorHeader,  wwDBGridShipBom, wwDBGridShipBomLot ]);
end;

procedure TFrmCoC.FormShow(Sender: TObject);
begin
  //IQSecIns.EnsureSecurityInspectorOnTopOf(self); {IQSecIns.pas}

  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, pnlTop, wwDataInspectorHeader,  wwDBGridShipBom, wwDBGridShipBomLot ]);

  //wwDBComboDlgItemNo.Visible:= FALSE;



end;

procedure TFrmCoC.sbtnCalcCoCClick(Sender: TObject);
begin
  if IQConfirmYNWithSecurity('Recalculate Certificate of Conformance?', 'YNRecalcCoC', False) then
     RecalcCoC;
end;

procedure TFrmCoC.RecalcCoC;
begin
  ExecuteCommandFmt( 'begin ship_bom.populate_ship_bom( %f ); end;', [ FShipment_Dtl_ID ]);
  Reopen( QryShip_Bom );
end;

procedure TFrmCoC.QryShip_BomCalcFields(DataSet: TDataSet);
begin
  with TFDQuery.Create(nil) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add(       'SELECT itemno,       ');
    SQL.Add(       '       descrip,      ');
    SQL.Add(       '       class,        ');
    SQL.Add(       '       rev           ');
    SQL.Add(       '  FROM arinvt        ');
    SQL.Add(Format(' WHERE id = %d       ',[QryShip_BomARINVT_ID.AsLargeInt]));
    Open;
    if not (Bof and Eof) then
      begin
        QryShip_BomItemno.AsString := Fields[0].AsString;
        QryShip_BomDescrip.AsString := Fields[1].AsString;
        QryShip_BomRev.AsString := Fields[2].AsString;
        QryShip_BomClass.AsString := Fields[3].AsString;
      end;
  finally
    Free;
  end;

  QryShip_Bom_ItemNo_Indented.asString   := Space( Trunc(QryShip_BomLEVEL.asFloat - 1) * 5 ) + QryShip_BomItemno.asString;

  QryShip_BomMfgNo.AsString := SelectValueFmtAsString(
    'SELECT mfgno FROM standard WHERE id = %d',
    [QryShip_BomSTANDARD_ID.AsLargeInt]);

  if SelectValueFmtAsFloat('select 1 from c_ship_bom_lot where c_ship_bom_id = %f and rownum < 2', [ QryShip_BomID.asFloat ]) = 1 then
     QryShip_BomTranslog_Rec_Exists.asString:= 'Y';
end;

procedure TFrmCoC.QryHeaderBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
    ParamByName('shipment_dtl_id').Value := FShipment_Dtl_ID;
end;

procedure TFrmCoC.wwDBGridShipBomCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  {TreeView color}
  if CompareText( Field.FieldName, 'ItemNo_Indented') = 0 then
  begin
    ABrush.Color:= clGray;
    AFont.Color := clWhite;
    EXIT;
  end;

  if Highlight then  EXIT;

  {substitute color}
  if IQMS.Common.StringUtils.StrInList( QryShip_BomKIND.asString, ['SUBSTITUTE', 'REWORK']) then
  begin
    ABrush.Color:= clWindow;
    AFont.Color := clBlue;
    EXIT;
  end;

  {Belongs to BOM, no translog records found}
  if QryShip_BomTranslog_Rec_Exists.asString <> 'Y' then
  begin
    ABrush.Color:= clWindow;
    AFont.Color := clSilver;
    EXIT;
  end;
end;
{
procedure TFrmCoC.DispatchNavShipBomAction(Sender: TObject; Button: TNavigateBtn);
var
  P: TPoint;
begin
  case Button of
    nbRefresh:
        begin
          RefreshDataSetByID( TFDQuery(TUniDBNavigator(Sender).DataSource.DataSet));
          ABORT;
        end;
    nbInsert:
        begin
          with NavShipBom.Controls[ Ord(nbInsert) ] do
          begin
            P.X:= Left;
            P.Y:= Top  + Height + 1;
            P:= Parent.ClientToScreen( P );
          end;

          PopupMenuShipBom.Popup( P.X, P.Y );
          ABORT;
        end;
  end;
end;


procedure TFrmCoC.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    RefreshDataSetByID( TFDQuery(TUniDBNavigator(Sender).DataSource.DataSet));
    ABORT;
  end;
end;
}
procedure TFrmCoC.QryShip_BomNewRecord(DataSet: TDataSet);
begin
  QryShip_BomID.AsLargeInt := GetNextID('C_SHIP_BOM');
  QryShip_BomSHIPMENT_DTL_ID.AsLargeInt := Trunc(FShipment_Dtl_ID);
end;

procedure TFrmCoC.QryShip_BomBeforePost(DataSet: TDataSet);
var
  A: Variant;
begin
  if QryShip_BomID.asFloat = 0 then
     QryShip_BomID.asFloat:= GetNextID('c_ship_bom');
  QryShip_BomBOM_LEVEL.asFloat:= QryShip_BomLEVEL.asFloat;

  A:= SelectValueArrayFmt( 'select arinvt_id, standard_id from c_ship_bom where id = %f', [ QryShip_BomPARENT_ID.asFloat ]);
  if VarArrayDimCount( A ) > 0 then
  begin
    QryShip_BomPARENT_ARINVT_ID.asFloat  := A[ 0 ];
    QryShip_BomPARENT_STANDARD_ID.asFloat:= A[ 1 ];
  end;
end;

procedure TFrmCoC.AddItem1Click(Sender: TObject);
begin
  AddItemAsChildOf( QryShip_BomPARENT_ID.asFloat );
end;

procedure TFrmCoC.AddSubItem1Click(Sender: TObject);
begin
  AddItemAsChildOf( QryShip_BomID.asFloat );
end;

procedure TFrmCoC.PopupMenuShipBomPopup(Sender: TObject);
begin
  AddItem1.Enabled:= ( QryShip_BomID.asFloat > 0 ) and ( SR.Insert['NavShipBom']);
  DeleteItem1.Enabled:= ( QryShip_BomID.asFloat > 0 ) and ( SR.Delete['NavShipBom']);
  AddSubItem1.Enabled:= ( QryShip_BomID.asFloat > 0 ) and ( SR.Insert['NavShipBom']);
end;

procedure TFrmCoC.DeleteItem1Click(Sender: TObject);
begin
  //NavShipBom.BtnClick( nbDelete );
end;

procedure TFrmCoC.AddItemAsChildOf( AParent_ID: Real );
var
  A           : Variant;
  AArinvt_ID  : Real;
  AStandard_ID: Real;
  AShip_Bom_ID       : Real;
begin
  QryShip_Bom.CheckBrowseMode;

  if not PkArinvt.Execute then
     EXIT;

  AArinvt_ID  := PkArinvt.GetValue('id');
  AStandard_ID:= PkArinvt.GetValue('standard_id');

  AShip_Bom_ID:= GetNextID('c_ship_bom');
  ExecuteCommandFmt('insert into c_ship_bom     '+
            '      (id,                 '+
            '       shipment_dtl_id,    '+
            '       parent_id,          '+
            '       arinvt_id,          '+
            '       standard_id,        '+
            '       parent_arinvt_id,   '+
            '       parent_standard_id, '+
            '       opmat_id,           '+
            '       ptsper,             '+
            '       bom_level,          '+
            '       kind )              '+
            'values(%f,                 '+       // id
            '       %f,                 '+       // shipment_dtl_id,
            '       %s,                 '+       // parent_id,
            '       %f,                 '+       // arinvt_id,
            '       %s,                 '+       // standard_id,
            '       NULL,               '+       // parent_arinvt_id,
            '       NULL,               '+       // parent_standard_id,
            '       NULL,               '+       // opmat_id,
            '       1,                  '+       // ptsper,
            '       NULL,               '+       // bom_level,
            '       ''MANUAL ADJUSTMENT'') ',    // kind
            [ AShip_Bom_ID,
              FShipment_Dtl_ID,                  // shipment_dtl_id,
              ToStr( AParent_ID ),               // parent_id,
              AArinvt_ID,                        // arinvt_id,
              ToStr( AStandard_ID )]);           // standard_id,

  with QryShip_Bom do
  try
    DisableControls;
    Close;
    Open;
    Locate( 'ID', AShip_Bom_ID, []);
    {update parent arinvt and standard_id and bom_level}
    Edit;
    Post;
  finally
    EnableControls;
  end

end;

procedure TFrmCoC.QryShip_BomUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  case ARequest of
    arDelete:
          if VarIsNull( ASender.FieldByName('parent_id').OldValue ) then
             begin
               ExecuteCommandFmt('update c_ship_bom set parent_id = NULL where parent_id = %f',
                         [ DtoF( ASender.FieldByName('id').OldValue )]);
               PostMessage( self.Handle,
                            iq_AfterPost,
                            0,
                            0 );
             end
          else
             begin
               ExecuteCommandFmt('update c_ship_bom set parent_id = %f where parent_id = %f',
                         [ DtoF( ASender.FieldByName('parent_id').OldValue ),
                           DtoF( ASender.FieldByName('id').OldValue )]);
               PostMessage( self.Handle,
                            iq_AfterPost,
                            Trunc( DtoF( ASender.FieldByName('parent_id').OldValue )),
                            0 );
             end;

    arUpdate: {nothing};

    arInsert:
        begin
          ExecuteCommandFmt('update c_ship_bom set parent_id = %f where parent_id = %f',
                    [ DtoF( ASender.FieldByName('id').asFloat ),
                      DtoF( ASender.FieldByName('parent_id').asFloat )]);
          PostMessage( self.Handle,
                       iq_AfterPost,
                       Trunc( DtoF( ASender.FieldByName('id').OldValue )),
                       0 );
        end;
  end;

  AAction := eaApplied;
end;


procedure TFrmCoC.IQAfterPost(var Msg: TMessage);
begin
  //NavShipBom.btnClick( nbRefresh );
end;

procedure TFrmCoC.wwDBComboDlgItemNoCustomDlg(Sender: TObject);
begin
  with PkArinvt do
    if Execute then
    begin
      QryShip_Bom.Edit;
      QryShip_BomARINVT_ID.asFloat:= GetValue('id');
      if GetValue('standard_id') > 0 then
         QryShip_BomSTANDARD_ID.asFloat:= GetValue('standard_id')
      else
         QryShip_BomSTANDARD_ID.Clear;
    end;
end;

function TFrmCoC.ToStr(AValue: Real): string;
begin
  if AValue = 0 then
     Result:= 'NULL'
  else
     Result:= FloatToStr( AValue );
end;

procedure TFrmCoC.UniFormCreate(Sender: TObject);
begin
  //FShipment_Dtl_ID:= AShipment_Dtl_ID;
  //inherited Create( AOwner );


end;

procedure TFrmCoC.AssignEPlantFilter(DataSet: TDataSet);
begin
  IQAssignEplantFilter( DataSet )
end;

procedure TFrmCoC.QryShipBomLotNewRecord(DataSet: TDataSet);
begin
  QryShipBomLotID.AsLargeInt := GetNextID('C_SHIP_BOM_LOT');
  QryShipBomLotC_SHIP_BOM_ID.AsLargeInt := QryShip_BomID.AsLargeInt;
end;

procedure TFrmCoC.QryShipBomLotBeforePost(DataSet: TDataSet);
begin
  if QryShipBomLotID.asFloat = 0 then
     QryShipBomLotID.asFloat:= GetNextID('c_ship_bom_lot');
end;

procedure TFrmCoC.sbtnPrintPackingSlipClick(Sender: TObject);
  // var
  //   AReport      : string;
  //   SelectionList: TStringList;
begin
  (* TODO -omsonawane -cWEBIQ : Resolve dependency
  DoPrint_COC( FloatToStr( FShipment_Dtl_ID ),  FloatToStr( FShipment_Dtl_ID )); {prn_coc.pas}
  *)
  // AReport:= SelectValueAsString('select COC_REPORT from iqsys');
  // IQAssert( not Empty( AReport ), 'No default report assigned in System Parameters. Please assign default report' );
  //
  // try
  //   SelectionList:= TStringList.Create;
  //   SelectionList.Add( Format('{C_SHIP_BOM.SHIPMENT_DTL_ID} = %.0f', [ FShipment_Dtl_ID ]));
  //   PrintDefaultReportEx( self, AReport, SelectionList );  {IQPrint.pas}
  // finally
  //   SelectionList.Free;
  // end;
end;

procedure TFrmCoC.SetShipment_Dtl_ID(const Value: Real);
begin
  FShipment_Dtl_ID := Value;
end;

procedure TFrmCoC.SRAfterApply(Sender: TObject);
begin
  //IQMS.Common.Controls.AutoSizeNavBar(NavShipBom);
  //IQMS.Common.Controls.AutoSizeNavBar(NavShipBomLot);
end;

procedure TFrmCoC.IQAfterShow(var Msg: TMessage);
begin
  if not (QryShip_Bom.Eof and QryShip_Bom.Bof) then
     EXIT;

  if not IQConfirmYNWithSecurity('Recalculate Certificate of Conformance?', 'YNRecalcCoC', False) then
     EXIT;

  RecalcCoC;
end;

procedure TFrmCoC.JumptoInventory1Click(Sender: TObject);
begin
  IQJumpInv.Execute;
end;

procedure TFrmCoC.JumptoBOM1Click(Sender: TObject);
begin
  IQJumpBom.Execute;
end;

procedure TFrmCoC.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;


procedure TFrmCoC.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSHIP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
