unit demo_salesorders;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniEdit, uniDBEdit,
  demo_salesorders_dm, oe_rscstr, Data.DB, IQMS.Common.DataLib, uniPanel, uniPageControl,
  uniToolBar, uniDBNavigator, uniImageList, uniSplitter, uniButton, uniBitBtn,
  uniSpeedButton, uniGroupBox, uniFieldSet, uniCheckBox, uniLabel, uniBasicGrid,
  uniDBGrid, uniDBCheckBox, uniGuiForm, uniGUIApplication, IQMS.Common.StringUtils,
  uniDateTimePicker, uniDBDateTimePicker, IQUniEditor, IQUniEditorDlg,
  IQUniEditorDlgPickDataSet;


type
  TFrmMainOrder = class(TUniForm)
    HeaderPageCOntrol: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    DetailPanel: TUniPanel;
    UniNativeImageListHeader: TUniNativeImageList;
    UniSplitter1: TUniSplitter;
    UniSplitter2: TUniSplitter;
    UniNativeImageListDetail: TUniNativeImageList;
    ReleasesPanel: TUniPanel;
    UniNativeImageListReleases: TUniNativeImageList;
    UniDBGrid1: TUniDBGrid;
    UniDBGrid2: TUniDBGrid;
    UniPanel1: TUniPanel;
    UniSplitter3: TUniSplitter;
    UniFieldSet2: TUniFieldSet;
    DBTotal: TUniDBEdit;
    DBTax: TUniDBEdit;
    DBFreightCharge: TUniDBEdit;
    DBGrand: TUniDBEdit;
    UniFieldSet1: TUniFieldSet;
    dbeOrderNo: TUniDBEdit;
    dbeCustNo: TUniDBEdit;
    dblcbBillTo: TUniDBLookupComboBox;
    dblcbShipTo: TUniDBLookupComboBox;
    dbContact1: TUniDBLookupComboBox;
    UniDBLookupComboBox1: TUniDBLookupComboBox;
    wwDBLookupComboOrderDivision: TUniDBLookupComboBox;
    UniDBEdit1: TUniDBEdit;
    UniDBCheckBox1: TUniDBCheckBox;
    UniDBCheckBox2: TUniDBCheckBox;
    DBComment1: TUniDBEdit;
    UniSplitter4: TUniSplitter;
    UniFieldSet3: TUniFieldSet;
    UniSplitter5: TUniSplitter;
    UniFieldSet4: TUniFieldSet;
    UniDBEdit2: TUniDBEdit;
    UniDBEdit4: TUniDBEdit;
    UniPanel8: TUniPanel;
    UniPanel9: TUniPanel;
    UniPanel11: TUniPanel;
    UniPanel12: TUniPanel;
    NavDetail: TUniDBNavigator;
    UniPanel2: TUniPanel;
    UniPanel3: TUniPanel;
    UniPanel4: TUniPanel;
    UniPanel5: TUniPanel;
    UniPanel6: TUniPanel;
    UniPanel7: TUniPanel;
    UniPanel13: TUniPanel;
    UniToolBar2: TUniToolBar;
    UniToolButton7: TUniToolButton;
    UniToolButton17: TUniToolButton;
    UniToolButton8: TUniToolButton;
    UniToolButton9: TUniToolButton;
    UniToolButton10: TUniToolButton;
    UniToolButton11: TUniToolButton;
    UniToolButton12: TUniToolButton;
    UniToolButton13: TUniToolButton;
    UniToolButton14: TUniToolButton;
    UniToolButton15: TUniToolButton;
    UniToolButton16: TUniToolButton;
    UniToolButton43: TUniToolButton;
    UniCheckBox1: TUniCheckBox;
    UniPanel14: TUniPanel;
    NavReleases: TUniDBNavigator;
    UniPanel15: TUniPanel;
    UniToolBar3: TUniToolBar;
    sbtnSigma: TUniToolButton;
    UniToolButton37: TUniToolButton;
    UniToolButton38: TUniToolButton;
    UniToolButton39: TUniToolButton;
    UniToolButton40: TUniToolButton;
    UniToolButton41: TUniToolButton;
    UniLabel1: TUniLabel;
    UniToolButton42: TUniToolButton;
    edTotRel: TUniEdit;
    UniPanel16: TUniPanel;
    UniPanel17: TUniPanel;
    UniPanel18: TUniPanel;
    UniPanel19: TUniPanel;
    UniPanel20: TUniPanel;
    UniPanel21: TUniPanel;
    UniPanel22: TUniPanel;
    UniToolBar1: TUniToolBar;
    sbtnSearchOrder: TUniToolButton;
    UniToolButton2: TUniToolButton;
    UniToolButton3: TUniToolButton;
    UniToolButton4: TUniToolButton;
    UniToolButton5: TUniToolButton;
    UniToolButton6: TUniToolButton;
    UniToolButton18: TUniToolButton;
    UniToolButton19: TUniToolButton;
    UniToolButton20: TUniToolButton;
    UniToolButton21: TUniToolButton;
    UniToolButton22: TUniToolButton;
    UniToolButton23: TUniToolButton;
    UniToolButton24: TUniToolButton;
    UniToolButton25: TUniToolButton;
    UniToolButton26: TUniToolButton;
    UniToolButton27: TUniToolButton;
    UniToolButton28: TUniToolButton;
    UniToolButton29: TUniToolButton;
    UniToolButton30: TUniToolButton;
    UniToolButton31: TUniToolButton;
    UniToolButton32: TUniToolButton;
    UniToolButton33: TUniToolButton;
    UniToolButton34: TUniToolButton;
    UniToolButton35: TUniToolButton;
    dbFob: TUniDBLookupComboBox;
    UniDBEdit5: TUniDBEdit;
    UniDBLookupComboBox2: TUniDBLookupComboBox;
    UniDBLookupComboBox3: TUniDBLookupComboBox;
    UniDBEdit6: TUniDBEdit;
    UniDBEdit7: TUniDBEdit;
    UniDBEdit8: TUniDBEdit;
    UniDBEdit9: TUniDBEdit;
    UniDBEdit10: TUniDBEdit;
    UniDBEdit3: TUniDBEdit;
    UniDBEdit11: TUniDBEdit;
    UniDBEdit12: TUniDBEdit;
    UniDBEdit13: TUniDBEdit;
    UniDBEdit14: TUniDBEdit;
    UniDBEdit15: TUniDBEdit;
    UniDBCheckBox3: TUniDBCheckBox;
    UniDBCheckBox4: TUniDBCheckBox;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    UniPanel27: TUniPanel;
    UniSpeedButton1: TUniSpeedButton;
    OrderPicker: TIQUniEditorDlgPickDataSet;
    UniPanel10: TUniPanel;
    NavHeader: TUniDBNavigator;
    UniPanel23: TUniPanel;
    UniPanel24: TUniPanel;
    UniPanel25: TUniPanel;
    UniPanel26: TUniPanel;
    UniPanel28: TUniPanel;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniDBGrid2DrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure UniDBGrid1DrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure sbtnSearchOrderClick(Sender: TObject);
    procedure OrderPickerDialogResult(Sender: TObject; Intf: IIQEditorDialog;
      var Handled: Boolean);
  private
    { Private declarations }
    DM: TOE_DM;

    procedure DoOnSalesOrderChange(Sender: TObject);
    procedure DoOnRebuildRelesesList(Sender: TObject);
  public
    { Public declarations }
    procedure StartUp;
    class procedure DoShowModal;
    class procedure DoShow;
  end;

implementation

{$R *.dfm}

class procedure TFrmMainOrder.DoShowModal;
var
  FrmMainOrder: TFrmMainOrder;
begin
  FrmMainOrder:= TFrmMainOrder.Create(uniGUIApplication.UniApplication);  // no need to free
  FrmMainOrder.ShowModal;
end;

class procedure TFrmMainOrder.DoShow;
var
  FrmMainOrder: TFrmMainOrder;
begin
  FrmMainOrder:= TFrmMainOrder.Create(uniGUIApplication.UniApplication);  // no need to free
  FrmMainOrder.Show;
end;

procedure TFrmMainOrder.UniDBGrid1DrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);

begin
   if DM.TblOrd_detailIS_DROP_SHIP.asString = 'Y' then
      Attribs.Color:= clMoneyGreen

   else if DM.TblOrd_detailIS_MAKE_TO_ORDER.asString = 'Y' then
      Attribs.Color:= $00FFCCE6

   else if (DM.TblOrd_detailSHIPHOLD.asString = 'Y') and not (DM.TblOrd_detailONHOLD.asString = 'Y') then
   begin
     Attribs.Color:= clYellow;
     Attribs.Font.Color := clBlack;
   end

   else if DM.tblOrd_detailONHOLD.asString = 'Y' then
      begin
        if not (UpperCase(Column.Field.FieldName) = 'BACKLOG') then
           Attribs.Color:= clRed
      end

  else if Column.Field.ReadOnly then
      Attribs.Color := clBtnFace;

  if Column.Field.ReadOnly then
  begin
    if StrInList( Column.Field.FieldName, ['ORD_DET_SEQNO','TOTAL_QTY_ORD','UNIT_PRICE','ONHOLD','COMM_PCT',
                                    'TAX_CODE','COMMENT1','SALESPERSON', 'CUST_CUM_START', 'LAST_RECEIPT_QTY', 'LAST_RECEIPT_DATE',
                                    'DISCOUNT','PRICE_PER_1000', 'DOCKID', 'LINEFEED',
                                    'RESERVELOCATION', 'KBTRIGGER', 'REF_CODE_DESCRIP', 'CONTAINERS', 'ACCT',
                                    'IS_DROP_SHIP', 'PO_INFO', 'CUSER1', 'CUSER2', 'CUSER3', 'REBATEPARAM', 'HIDE', 'DETAILDISCOUNT']) then
       Attribs.Color := clWindow;

    if (DM.TblOrd_Detail.FieldByName('CUMM_SHIPPED').asFloat = 0) and StrInList( Column.Field.FieldName, [ 'ITEMNUMBER', 'UNIT' ]) then
       Attribs.Color := clWindow;
  end;

  if (UpperCase(Column.Field.FieldName) = 'BACKLOG') then
     Attribs.Font.Color := clRed;

  if (UpperCase(Column.Field.FieldName) = 'ITEMNUMBER') and (DM.tblOrd_detailPhantom.asString = 'Y') and (DM.TblOrd_DetailIncludePhantomComponents.asString = 'Y') then
     Attribs.Font.Style:= Attribs.Font.Style + [fsBold];

  if (DM.TblOrd_Detail.State = dsBrowse)
     and (DM.TblOrd_Detail.FieldByName('ARINVT_ID').asFloat = 0)
     and (CompareText(Column.Field.FieldName, 'ITEMNUMBER') = 0)
     and not DM.TblOrd_Detail.Eof then
  begin
    Attribs.Color:= clAqua;
    Attribs.Font.Color:= clBlack;
  end;
end;


procedure TFrmMainOrder.UniDBGrid2DrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
var
  AField: TField;

  procedure AssignColor(ABack, AFront: TColor);
  begin
    Attribs.Color:= ABack;
    Attribs.Font.Color := AFront;
  end;

begin
  AField:= Column.Field;

//  if not ((UpperCase(AField.FieldName) = 'RELEASED') or
//         (UpperCase(AField.FieldName) = 'LEFTTOSHIP') or
//         (UpperCase(AField.FieldName) = 'ECODE') or
//         (UpperCase(AField.FieldName) = 'SHIP_DATE'))
//  then if (not Highlight) then ABrush.Color := clWindow;

  with DM.QryReleases do
  begin
     if FieldByName('pending_verification').asString = 'Y' then
        AssignColor($000080FF, clBlack)

     else if FieldByName('Ship_date').AsDateTime > 0 then
        AssignColor(clLime, clBlack)

     else if FieldByName('Quan').AsFloat > 0 then
        begin
          if FieldByName('LeftToShip').AsFloat = 0 then
             AssignColor(clLime, clBlack)
          else if FieldByName('LeftToShip').AsFloat = FieldByName('Quan').AsFloat then
             AssignColor(clPurple, clWhite)
          else
             AssignColor(clYellow, clBlack);
        end;

     if DM.QryReleases.FieldByName('expedite').asString = 'Y' then
     begin
       if DM.QryReleases.FieldByName('LeftToShip').asFloat > 0 then
         AssignColor(clRed, clWhite);
     end;

     //if ((AField = DM.QryReleasesQUAN) and sbtnSigma.Down) or ((AField = DM.QryReleasesCum_Quan) and not sbtnSigma.Down) then
     //    AssignColor(clBtnFace, clBlack);

     if (DM.QryReleasesIS_ON_PICKTICKET.asString = 'Y') and ((AField = DM.QryReleasesREQUEST_DATE) or (AField = DM.QryReleasesPROMISE_DATE)) then
         AssignColor( clAqua, clBlack );
  end;

//  if Highlight then
//     AssignColor(clBlue, clWhite);
end;

procedure TFrmMainOrder.UniFrameCreate(Sender: TObject);
begin
  StartUp;
end;

procedure TFrmMainOrder.StartUp;
begin
  DM:= TOE_DM.Create(self);
  DM.OnSalesOrderChange:= DoOnSalesOrderChange;
  DM.OnRebuildRelesesList:= DoOnRebuildRelesesList;

  IQSetTablesActive( TRUE, DM );

  DM.OEDataCoordinator.CheckOpenDataSets;
end;

procedure TFrmMainOrder.DoOnSalesOrderChange(Sender: TObject);
var
  ABillToStatus:String;
begin
  if DM.TblOrders.State = dsBrowse then
  begin
    Caption := Format(oe_rscstr.cTXT0000115,
        [Trim(DM.TblOrdersORDERNO.asString),
         Trim(DM.TblOrdersCOMPANY.asString),
         Trim(DM.TblOrdersCUSTNO.asString) ]);

    if SelectValueFmtAsFloat('select id from ship_to_vmi where ship_to_id = %f', [ DM.TblOrdersSHIP_TO_ID.asFloat ]) > 0 then
       dblcbShipTo.Color:= clYellow
    else
       dblcbShipTo.Color:= clWhite;

    {Intercomp}
    with dbeOrderNo do
      if ( DM.TblOrdersIS_INTERCOMP.asString = 'Y' ) then
         begin
           Color     := clBlack;
           Font.Color:= clFuchsia;
         end
      else if DM.TblOrdersIS_OUTSOURCE_VENDOR.asString = 'Y' then
         begin
           Color     := clBlack;
           Font.Color:= clLime;
         end
      else
         begin
           Color     := clWindow;
           Font.Color:= clBlack;
         end;

    {Division}
    if ( DM.TblOrdersIS_INTERCOMP.asString <> 'Y' ) and (SelectValueFmtAsFloat('select division_id from ship_to where id = %f', [ DM.TblOrdersSHIP_TO_ID.asFloat ]) <> DM.TblOrdersDIVISION_ID.asFloat) then
       wwDBLookupComboOrderDivision.Color:= clAqua
    else
       wwDBLookupComboOrderDivision.Color:= clWhite;

    with dbeCustNo do
    begin
      ABillToStatus := Trim(SelectValueFmtAsString('select status_id from bill_to where id = %.0f', [DM.TblOrdersBILL_TO_ID.asFloat]));
      if SelectValueFmtAsString('select NVL(cash_in_advance, ''N'') from terms where id = %f', [DM.TblOrdersTerms_id.asFloat]) = 'Y' then
      begin
         begin
           Color     := clFuchsia;
           Font.Color:= clWhite;
         end
      end
      else if (Pos( 'Hold', DM.TblOrdersArcusto_Status.asString ) > 0) or (Pos( 'Hold', ABillToStatus ) > 0) then
         begin
           Color     := clRed;
           Font.Color:= clWhite;
         end
      else
         begin
           Color     := clWindow;
           Font.Color:= clBlack;
         end;
    end;
  end;
end;

procedure TFrmMainOrder.DoOnRebuildRelesesList(Sender: TObject);
begin
  edTotRel.Text:= FormatFloat(' ###,###,##0.##', DM.GetReleasesQuanTotal( DM.TblOrd_DetailID.asFloat ));
end;


procedure TFrmMainOrder.sbtnSearchOrderClick(Sender: TObject);
begin
  with DM do
    if DM.TblOrdersID.asFloat > 0 then
      OrderPicker.Text := DM.TblOrdersID.AsString;

  OrderPicker.ExecTrigger(1);
end;


procedure TFrmMainOrder.OrderPickerDialogResult(Sender: TObject;
  Intf: IIQEditorDialog; var Handled: Boolean);
begin
  if Intf.DialogResult = mrOK then
  begin
    DM.TblOrders.Locate('ID', Intf.DialogValue, []);
    Handled := true;
  end;
end;

end.
