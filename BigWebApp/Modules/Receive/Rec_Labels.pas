unit Rec_Labels;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Vcl.wwDataInspector,
  Data.DB,
  { TODO : IQMS.Common.UserMessages has a problem }
  //IQMS.Common.UserMessages,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniGUIFrame, IQUniGrid, uniRadioGroup;

type
  { TRecLabelsOption }
  TRecLabelsOption = (rcoDefault, rcoPallet);

  { TFrmRecLabels }
  TFrmRecLabels = class(TUniForm)
    PnlLabels: TUniPanel;
    Splitter1: TUniSplitter;
    LabelsGrid: TIQUniGridControl;
    Panel1: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    dbePONo: TUniDBEdit;
    Label7: TUniLabel;
    dbeItemno: TUniDBEdit;
    Label8: TUniLabel;
    dbeLine: TUniDBEdit;
    SrcPOInfo: TDataSource;
    QryPOInfo: TFDQuery;
    QryPOInfoPONO: TStringField;
    QryPOInfoITEMNO: TStringField;
    QryPOInfoSEQ: TBCDField;
    QryPOInfoQTY_RECEIVED: TFMTBCDField;
    dbeReceiptQty: TUniDBEdit;
    QryPOInfoPO_RECEIPT_ID: TBCDField;
    edAccountedFor: TUniEdit;
    edBalance: TUniEdit;
    QryPOInfoQty_Received_Disp: TStringField;
    SR: TIQWebSecurityRegister;
    QryPOInfoPO_DETAIL_UOM: TStringField;
    QryPOInfoARINVT_UOM: TStringField;
    Label9: TUniLabel;
    dbePOUOM: TUniDBEdit;
    Label10: TUniLabel;
    Label11: TUniLabel;
    dbeInvUOM: TUniDBEdit;
    QryPOInfoARINVT_ID: TBCDField;
    SrcPO_Receipts_Labels_Plan: TDataSource;
    QryPO_Receipts_Labels_Plan: TFDQuery;
    QryPO_Receipts_Labels_PlanID: TBCDField;
    QryPO_Receipts_Labels_PlanPO_RECEIPTS_ID: TBCDField;
    QryPO_Receipts_Labels_PlanLABELS_COUNT: TBCDField;
    QryPO_Receipts_Labels_PlanQTY: TBCDField;
    UpdatePO_Receipts_Labels_Plan: TFDUpdateSQL;
    QryPO_Receipts_Labels_PlanSubTotal: TBCDField;
    QryPOInfoKB_CONTAINER_QTY: TFMTBCDField;
    pnlBottom: TUniPanel;
    Panel4: TUniPanel;
    ContinueButton: TUniButton;
    CancelButton: TUniButton;
    Bevel1: TUniPanel;
    PnlPageControlCarrier: TUniPanel;
    pcLabels: TUniPageControl;
    TabLabels: TUniTabSheet;
    TabPallets: TUniTabSheet;
    PnlDetail: TUniPanel;
    PnlLabelOption: TUniPanel;
    grpLabelOption: TUniRadioGroup;
    PnlPalletCarrier: TUniPanel;
    PnlPallet: TUniPanel;
    Splitter2: TUniSplitter;
    PnlPalletDetail: TUniPanel;
    PnlToolbarPallet: TUniPanel;
    PnlToolbarPalletDetail: TUniPanel;
    NavPalletDetail: TUniDBNavigator;
    NavPallet: TUniDBNavigator;
    PalletDetailGrid: TIQUniGridControl;
    SrcPallet: TDataSource;
    QryPallet: TFDQuery;
    UpdateSQL_Pallet: TFDUpdateSQL;
    QryPalletID: TBCDField;
    QryPalletSEQ: TBCDField;
    QryPalletQTY: TFMTBCDField;
    sbtMoveUp: TUniSpeedButton;
    sbtnMoveDown: TUniSpeedButton;
    PalletGrid: TIQUniGridControl;
    QryPO_Receipts_Labels_PlanPO_RECEIPTS_LABELS_PALLET_ID: TBCDField;
    QryPalletPO_RECEIPTS_ID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryPOInfoBeforeOpen(DataSet: TDataSet);
    { TODO : TNavigateBtn not yet converted }
    //procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure QryPO_Receipts_LabelsAfterOpen(DataSet: TDataSet);
    procedure QryPOInfoCalcFields(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure QryPO_Receipts_Labels_PlanNewRecord(DataSet: TDataSet);
    procedure QryPO_Receipts_Labels_PlanBeforePost(DataSet: TDataSet);
    procedure QryPO_Receipts_Labels_PlanAfterOpen(DataSet: TDataSet);
    procedure QryPO_Receipts_Labels_PlanCalcFields(DataSet: TDataSet);
    { TODO : TGridDrawState not yet converted }
   { procedure LabelsGridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);    }
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SRAfterApply(Sender: TObject);
    procedure grpLabelOptionClick(Sender: TObject);
    procedure sbtMoveUpClick(Sender: TObject);
    procedure sbtnMoveDownClick(Sender: TObject);
    procedure QryPO_Receipts_Labels_PlanBeforeOpen(DataSet: TDataSet);
    procedure QryPalletAfterScroll(DataSet: TDataSet);
    procedure QryPalletNewRecord(DataSet: TDataSet);
    procedure QryPO_Receipts_Labels_PlanAfterPost(DataSet: TDataSet);
    procedure QryPO_Receipts_Labels_PlanAfterDelete(DataSet: TDataSet);
    procedure QryPalletBeforePost(DataSet: TDataSet);
    procedure QryPalletBeforeOpen(DataSet: TDataSet);
    procedure QryPalletAfterPost(DataSet: TDataSet);
    procedure QryPalletAfterDelete(DataSet: TDataSet);
    procedure QryPO_Receipts_Labels_PlanBeforeInsert(DataSet: TDataSet);
    procedure QryPO_Receipts_Labels_PlanBeforeEdit(DataSet: TDataSet);
    procedure QryPO_Receipts_Labels_PlanBeforeDelete(DataSet: TDataSet);
    procedure QryPalletBeforeEdit(DataSet: TDataSet);
    procedure QryPalletBeforeInsert(DataSet: TDataSet);
    procedure QryPalletBeforeDelete(DataSet: TDataSet);
    procedure ContinueButtonClick(Sender: TObject);
  private
    { Private declarations }
    FPO_Receipt_ID: Real;
    FPO_Receipt_QtyReceived: Real;
    FUpdated: Boolean;
    procedure IQAfterShowMessage(var Msg: TMessage);
    { TODO : IQMS.Common.UserMessages has a problem }
      //message iq_AfterShowMessage;
    procedure AssignPlaceHolders;
    procedure UpdateBalance;
    function GetOption: TRecLabelsOption;
    procedure SetOption(const Value: TRecLabelsOption);
    procedure SetPO_Receipt_ID(const Value: Real);
  public
    { Public declarations }
    class function DoShowModal(APO_Receipt_ID: Real;
      AUseOkCancelButtons: Boolean = FALSE): Boolean;
    property PO_Receipt_ID : Real write SetPO_Receipt_ID;
    property Option: TRecLabelsOption read GetOption write SetOption;
  end;

implementation

{$R *.dfm}


uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  { TODO : IQSecIns not yet converted }
 // IQSecIns,
  IQMS.Common.UOM,
  Rec_Labels_Conf,
  rec_rscstr,
  IQMS.Common.TableSequence;

{ TFrmRecLabels }

class function TFrmRecLabels.DoShowModal(APO_Receipt_ID: Real;
  AUseOkCancelButtons: Boolean = FALSE): Boolean;
var
  LFrmRecLabels : TFrmRecLabels;
begin
  LFrmRecLabels := TFrmRecLabels.Create(UniGUIApplication.UniApplication);
  with LFrmRecLabels do
  begin
    PO_Receipt_ID := APO_Receipt_ID;
    pnlBottom.Visible := AUseOkCancelButtons;
    Result := (ShowModal = mrOK) or (AUseOkCancelButtons = FALSE);
  end;
end;

procedure TFrmRecLabels.FormShow(Sender: TObject);
begin
  IQMS.Common.Controls.AdjustPageControlToParent(pcLabels);

  IQSetTablesActive(TRUE, self);

  FPO_Receipt_QtyReceived := SelectValueFmtAsFloat(
    'SELECT qty_received FROM po_receipts WHERE id = %.0f',
    [FPO_Receipt_ID]);

    { TODO : IQMS.Common.UserMessages has a problem }
 // PostMessage(Handle, iq_AfterShowMessage, 0, 0);
  IQRegFormRead(self, [self, LabelsGrid]);

  // If there are "pallet" records, then display the pallet tab
  if SelectValueFmtAsInteger(
    'SELECT 1                                               '#13 +
    '  FROM po_receipts_labels_plan                         '#13 +
    ' WHERE po_receipts_labels_pallet_id IS NOT NULL AND    '#13 +
    '       po_receipts_id = %.0f AND                       '#13 +
    '       ROWNUM < 2                                      ',
    [FPO_Receipt_ID]) = 1 then
    Option := rcoPallet;
end;

procedure TFrmRecLabels.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmACCT{CHM}, iqhtmPO{HTM} ); {IQMS.Common.HelpHook.pas}
end;

procedure TFrmRecLabels.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  QryPO_Receipts_Labels_Plan.CheckBrowseMode;

  CanClose := StrToFloat(edBalance.Text) = 0;
  if CanClose then
    EXIT;

  CanClose := StrToFloat(edAccountedFor.Text) = 0;
  if CanClose then
    EXIT;

  CanClose := ModalResult = mrAbort;
  if CanClose then
    EXIT;

  case TFrmRec_Labels_Confirm.DoShowModal of {Rec_Labels_Conf.pas}
    0:
      CanClose := FALSE; {Go back and fix the list}
    1:
      CanClose := TRUE; {Abort - Just close the form and exit }
    2:
      begin {Match receipt qty to the list}
        ExecuteCommandFmt
          ('update po_receipts set qty_received = %.6f where id = %f',
          [IQConvertUom(StrToFloat(edAccountedFor.Text), {IQMS.Common.UOM.pas}
          QryPOInfoARINVT_UOM.asString,
          QryPOInfoPO_DETAIL_UOM.asString,
          QryPOInfoARINVT_ID.AsFloat),
          FPO_Receipt_ID]);
        CanClose := TRUE;
      end;
  end;
end;

procedure TFrmRecLabels.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if FUpdated then
    AssignPlaceHolders; // assign po_receipts_labels

  IQRegFormWrite(self, [self, LabelsGrid]);
end;

procedure TFrmRecLabels.IQAfterShowMessage(var Msg: TMessage);
begin
{ TODO : IQSecIns not yet converted }
 // EnsureSecurityInspectorOnTopOf(self);
end;

procedure TFrmRecLabels.QryPalletAfterDelete(DataSet: TDataSet);
begin
  FUpdated := TRUE;
  UpdateBalance;
end;

procedure TFrmRecLabels.QryPalletAfterPost(DataSet: TDataSet);
begin
  FUpdated := TRUE;
  UpdateBalance;
end;

procedure TFrmRecLabels.QryPalletAfterScroll(DataSet: TDataSet);
begin
  ReOpen(QryPO_Receipts_Labels_Plan);
end;

procedure TFrmRecLabels.QryPalletBeforeDelete(DataSet: TDataSet);
begin
  // 03/08/2016 Check security:  are deletes allowed?
  if not SR.Delete['NavPallet'] then
    System.SysUtils.Abort;
end;

procedure TFrmRecLabels.QryPalletBeforeEdit(DataSet: TDataSet);
begin
  // 03/08/2016 Check security:  are edits allowed?
  if not SR.ReadWrite['NavPallet'] then
    System.SysUtils.Abort;
end;

procedure TFrmRecLabels.QryPalletBeforeInsert(DataSet: TDataSet);
begin
  // 03/08/2016 Check security:  are inserts allowed?
  if not SR.Insert['NavPallet'] then
    System.SysUtils.Abort;
end;

procedure TFrmRecLabels.QryPalletBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'PO_RECEIPTS_ID', Trunc(FPO_Receipt_ID));
end;

procedure TFrmRecLabels.QryPalletBeforePost(DataSet: TDataSet);
begin
  // 03/08/2016 Check security:  are edits allowed?
  if not SR.ReadWrite['NavPallet'] then
    System.SysUtils.Abort;

  // Ensure FK is populated
  if QryPalletPO_RECEIPTS_ID.IsNull then
    QryPalletPO_RECEIPTS_ID.AsLargeInt := Trunc(FPO_Receipt_ID);
end;

procedure TFrmRecLabels.QryPalletNewRecord(DataSet: TDataSet);
begin
  QryPalletID.AsLargeInt := GetNextID('PO_RECEIPTS_LABELS_PALLET');
  QryPalletSEQ.AsInteger := SelectValueFmtAsInteger(
    'SELECT MAX(seq) FROM po_receipts_labels_pallet WHERE po_receipts_id = %.0f',
    [FPO_Receipt_ID]) + 1;
  QryPalletPO_RECEIPTS_ID.AsLargeInt := Trunc(FPO_Receipt_ID);
  // Populate value from previous screen
  QryPalletQTY.AsFloat := FPO_Receipt_QtyReceived -
    SelectValueFmtAsFloat(
    'SELECT SUM(qty) FROM po_receipts_labels_pallet WHERE po_receipts_id = %.0f',
    [FPO_Receipt_ID]);
end;

procedure TFrmRecLabels.QryPOInfoBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'RECEIPT_ID', Trunc(FPO_Receipt_ID));
end;

{ TODO : TNavigateBtn not yet converted }
{procedure TFrmRecLabels.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    RefreshDataSetByID(TUniDBNavigator(Sender).DataSource.DataSet);
    Abort;
  end;
end;   }

procedure TFrmRecLabels.ContinueButtonClick(Sender: TObject);
begin
  if SR.Enabled['ContinueButton'] and
    SR.Visible['ContinueButton'] then
    ModalResult := mrOK;
end;

procedure TFrmRecLabels.QryPO_Receipts_LabelsAfterOpen(DataSet: TDataSet);
begin
  UpdateBalance;
end;

procedure TFrmRecLabels.UpdateBalance;
var
  AAccountedFor: Real;
begin
  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add(       'SELECT SUM(qty * labels_count)                   ');
      SQL.Add(       '  FROM po_receipts_labels_plan                   ');
      SQL.Add(Format(' WHERE po_receipts_id = %d AND                   ', [Trunc(FPO_Receipt_ID)]));
      case Option of
        rcoDefault:
          SQL.Add(   '       po_receipts_labels_pallet_id IS NULL      ');
        rcoPallet:
          SQL.Add(   '       po_receipts_labels_pallet_id IS NOT NULL  ');
      end;
      Open;
      AAccountedFor := Fields[0].AsFloat;
    finally
      Free;
    end;

  edAccountedFor.Text := FloatToStr(AAccountedFor);

  edBalance.Text := FloatToStr(IQMS.Common.Numbers.IQRound(QryPOInfoQTY_RECEIVED.AsFloat -
    AAccountedFor, 4));

  if StrToFloat(edBalance.Text) <> 0 then
  begin
    edBalance.Color := clRed;
    edBalance.Font.Color := clWhite
  end
  else
  begin
    edBalance.Color := clWhite;
    edBalance.Font.Color := clBlack
  end;
end;

procedure TFrmRecLabels.QryPOInfoCalcFields(DataSet: TDataSet);
begin
  {because I have 2 EDITS that aligned to the left make Qty Received aligned to the left as well by converting to string}
  QryPOInfoQty_Received_Disp.asString :=
    FloatToStr(QryPOInfoQTY_RECEIVED.AsFloat);
end;

procedure TFrmRecLabels.QryPO_Receipts_Labels_PlanNewRecord(DataSet: TDataSet);
begin
  QryPO_Receipts_Labels_PlanPO_RECEIPTS_ID.AsLargeInt := Trunc(FPO_Receipt_ID);
  QryPO_Receipts_Labels_PlanQTY.AsFloat := QryPOInfoKB_CONTAINER_QTY.AsFloat;
  if Option = rcoPallet then
    QryPO_Receipts_Labels_PlanPO_RECEIPTS_LABELS_PALLET_ID.AsLargeInt :=
      QryPalletID.AsLargeInt;
end;

procedure TFrmRecLabels.SRAfterApply(Sender: TObject);
begin
 { TODO : Incompatible types: 'TDBNavigator' and 'TUniDBNavigator' }
 { IQMS.Common.Controls.AutoSizeNavBar(NavLabels);
  IQMS.Common.Controls.AutoSizeNavBar(NavPallet);
  IQMS.Common.Controls.AutoSizeNavBar(NavPalletDetail);}
end;

procedure TFrmRecLabels.QryPO_Receipts_Labels_PlanBeforeDelete(
  DataSet: TDataSet);
begin
  // 03/08/2016 Check security:  are deletes allowed?
  if not SR.Delete['NavPalletDetail'] then
    System.SysUtils.Abort;
end;

procedure TFrmRecLabels.QryPO_Receipts_Labels_PlanBeforeEdit(DataSet: TDataSet);
begin
  if (QryPallet.State in [dsEdit, dsInsert]) then
    QryPallet.Post;

  // 03/08/2016 Check security:  are edits allowed?
  if not SR.ReadWrite['NavPalletDetail'] then
    System.SysUtils.Abort;
end;

procedure TFrmRecLabels.QryPO_Receipts_Labels_PlanBeforeInsert(
  DataSet: TDataSet);
begin
  if (QryPallet.State in [dsEdit, dsInsert]) then
    QryPallet.Post;

  // 03/08/2016 Check security:  are inserts allowed?
  if not SR.Insert['NavPalletDetail'] then
    System.SysUtils.Abort;
end;

procedure TFrmRecLabels.QryPO_Receipts_Labels_PlanBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'PO_RECEIPT_ID', Trunc(FPO_Receipt_ID));
  AssignQueryParamValue(DataSet, 'OPTION_INDEX',
    grpLabelOption.ItemIndex);
  AssignQueryParamValue(DataSet, 'PO_RECEIPTS_LABELS_PALLET_ID',
    QryPalletID.AsLargeInt);
end;

procedure TFrmRecLabels.QryPO_Receipts_Labels_PlanBeforePost(DataSet: TDataSet);
begin
  // 03/08/2016 Check security:  are edits allowed?
  if not SR.ReadWrite['NavPalletDetail'] then
    System.SysUtils.Abort;

  if DataSet.FieldByName('ID').AsLargeInt = 0 then
    DataSet.FieldByName('ID').AsLargeInt :=
      GetNextID('PO_RECEIPTS_LABELS_PLAN');

  // rec_rscstr.cTXT0000057 =
  // 'The number of labels must be greater than 0.';
  IQAssert(QryPO_Receipts_Labels_PlanLABELS_COUNT.AsFloat > 0,
    rec_rscstr.cTXT0000057);

  // rec_rscstr.cTXT0000058 =
  // 'The quantity must be greater than 0.';
  IQAssert(QryPO_Receipts_Labels_PlanQTY.AsFloat > 0, rec_rscstr.cTXT0000058);
end;

procedure TFrmRecLabels.QryPO_Receipts_Labels_PlanAfterDelete(
  DataSet: TDataSet);
begin
  FUpdated := TRUE;
  UpdateBalance;
end;

procedure TFrmRecLabels.QryPO_Receipts_Labels_PlanAfterOpen(DataSet: TDataSet);
begin
  FUpdated := TRUE;
  UpdateBalance;
end;

procedure TFrmRecLabels.QryPO_Receipts_Labels_PlanAfterPost(DataSet: TDataSet);
begin
  FUpdated := TRUE;
  UpdateBalance;
end;

procedure TFrmRecLabels.AssignPlaceHolders;
var
  I: Integer;
  S: string;
begin
  ExecuteCommandFmt(
    'delete from po_receipts_labels where po_receipts_id = %.0f',
    [FPO_Receipt_ID]);

  // delete orphan po_receipts_labels_plan records
  S := 'delete from po_receipts_labels_plan where po_receipts_id = %f';
  case Option of
    rcoDefault:
      S := S + ' and po_receipts_labels_pallet_id is not null ';
    rcoPallet:
      S := S + ' and po_receipts_labels_pallet_id is null';
  end;
  ExecuteCommandFmt(S, [FPO_Receipt_ID]);

  if Option = rcoDefault then
    ExecuteCommandFmt(
      'delete from po_receipts_labels_pallet where po_receipts_id = %.0f',
      [FPO_Receipt_ID]);

  ExecuteCommandFmt('begin rec_misc.populate_po_receipts_labels( %f ); end; ',
    [FPO_Receipt_ID]);
end;

procedure TFrmRecLabels.QryPO_Receipts_Labels_PlanCalcFields(DataSet: TDataSet);
begin
  QryPO_Receipts_Labels_PlanSubTotal.AsFloat :=
    QryPO_Receipts_Labels_PlanLABELS_COUNT.AsFloat *
    QryPO_Receipts_Labels_PlanQTY.AsFloat;
end;

{ TODO : TGridDrawState not yet converted }
{procedure TFrmRecLabels.LabelsGridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Highlight then
    EXIT;

  if Field.ReadOnly then
    ABrush.Color := clBtnFace;
end;   }

procedure TFrmRecLabels.grpLabelOptionClick(Sender: TObject);
begin
  pcLabels.ActivePageIndex := grpLabelOption.ItemIndex;
  ReOpen(QryPO_Receipts_Labels_Plan);
end;

function TFrmRecLabels.GetOption: TRecLabelsOption;
begin
  Result := TRecLabelsOption(grpLabelOption.ItemIndex);
end;

procedure TFrmRecLabels.SetOption(const Value: TRecLabelsOption);
begin
  grpLabelOption.ItemIndex := Ord(Value);
  grpLabelOptionClick(grpLabelOption);
end;

procedure TFrmRecLabels.SetPO_Receipt_ID(const Value: Real);
begin
  FPO_Receipt_ID := Value;
end;

procedure TFrmRecLabels.sbtMoveUpClick(Sender: TObject);
begin
  IQMS.Common.TableSequence.ChangeSequence(
    QryPallet, // DataSet
    'PO_RECEIPTS_LABELS_PALLET', // TableName
    '', // Master Field (none)
    QryPalletSEQ.AsInteger, // Current Seq
    QryPalletSEQ.AsInteger - 1 // New Seq
    );
end;

procedure TFrmRecLabels.sbtnMoveDownClick(Sender: TObject);
begin
  IQMS.Common.TableSequence.ChangeSequence(
    QryPallet, // DataSet
    'PO_RECEIPTS_LABELS_PALLET', // TableName
    '', // Master Field (none)
    QryPalletSEQ.AsInteger, // Current Seq
    QryPalletSEQ.AsInteger + 1 // New Seq
    );
end;

end.
