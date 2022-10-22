unit ICA_PO_Receipts;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Menus,
  Data.DB,
  MainModule,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
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
  uniCheckBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniMainMenu, uniDateTimePicker, IQUniGrid, uniGUIFrame;

type
  TFrm_ICA_PO_Receipts = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnAssign: TUniButton;
    BtnCancel: TUniButton;
    IQSearch1: TIQUniGridControl;
    QryRec: TFDQuery;
    SrcRec: TDataSource;
    QryRecID: TBCDField;
    QryRecPO_DETAIL_ID: TBCDField;
    QryRecQTY_RECEIVED: TBCDField;
    QryRecRECEIPTNO: TStringField;
    QryRecUNIT_PRICE: TFMTBCDField;
    QryRecARINVT_ID: TBCDField;
    QryRecITEMNO: TStringField;
    QryRecDESCRIP: TStringField;
    QryRecDESCRIP2: TStringField;
    QryRecCLASS: TStringField;
    QryRecREV: TStringField;
    QryRecPONO: TStringField;
    QryRecGLACCT_ID_ALLOC: TFMTBCDField;
    QryRecLOTNO: TStringField;
    QryRecDATE_RECEIVED: TDateTimeField;
    QryRecFGMULTI_ID: TBCDField;
    PKFgMulti: TIQWebHPick;
    PKFgMultiARINVT_ID: TBCDField;
    PKFgMultiLOTNO: TStringField;
    PKFgMultiID: TBCDField;
    PKFgMultiONHAND: TBCDField;
    PKFgMultiDESCRIP: TStringField;
    PKFgMultiITEMNO: TStringField;
    PKFgMultiITEM_DESCRIP: TStringField;
    PKFgMultiITEM_DESCRIP2: TStringField;
    PKFgMultiCLASS: TStringField;
    PKFgMultiREV: TStringField;
    Panel3: TUniPanel;
    BtnApply: TUniButton;
    Label1: TUniLabel;
    Label2: TUniLabel;
    cbViewRec: TUniCheckBox;
    wwDBFrom: TUniDateTimePicker;
    wwDBTo: TUniDateTimePicker;
    QryRecICA_DTL_ID: TFMTBCDField;
    QryRecTRANSLOG_FGMULTI_ID: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAssignClick(Sender: TObject);
    procedure QryRecBeforeOpen(DataSet: TDataSet);
    procedure PKFgMultiBeforeOpen(DataSet: TDataSet);
    procedure BtnApplyClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FIca_Hdr_Id:Real;
    FVendorId:Real;
    FArinvtId:Real;

    procedure SetIca_Hdr_Id(const Value: Real);
  public
    { Public declarations }

    property Ica_Hdr_Id : Real  write SetIca_Hdr_Id;
  end;

function Do_ICA_Select_PO_Receipts(AIca_Hdr_Id:Real):boolean;

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  ap_rscstr;

{$R *.dfm}


function Do_ICA_Select_PO_Receipts(AIca_Hdr_Id:Real):boolean;
var
  frm : TFrm_ICA_PO_Receipts;
begin
  frm := TFrm_ICA_PO_Receipts.Create(UniGUIApplication.UniApplication);
  frm.Ica_Hdr_Id := AIca_Hdr_Id;
  Result := frm.ShowModal = mrOk;
end;

procedure TFrm_ICA_PO_Receipts.UniFormCreate(Sender: TObject);
var
  AFrom, ATo:TDateTime;
  AChecked:boolean;
begin
  IQRegFormRead(self, [self]);

  if IQRegDateTimeScalarRead( self, 'ICA_PO_Receipts_From_Date',  AFrom) then
    wwDBFrom.DateTime := AFrom
  else
    wwDBFrom.DateTime := Date - 365;

  if IQRegDateTimeScalarRead( self, 'ICA_PO_Receipts_To_Date',  ATo) then
    wwDBTo.DateTime := ATo
  else
    wwDBTo.DateTime := Date + 1;

  if IQRegBooleanScalarRead( self, 'ICA_PO_Receipts_Checked',  AChecked ) then
    cbViewRec.checked := AChecked
  else
    cbViewRec.checked := false;
end;

procedure TFrm_ICA_PO_Receipts.SetIca_Hdr_Id(const Value: Real);
begin
  FIca_Hdr_Id := Value;
  FVendorId := SelectValueFmtAsFloat('select vendor_id from ica_hdr where id = %f', [FIca_Hdr_Id]);
  QryRec.Open;
end;

procedure TFrm_ICA_PO_Receipts.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegDateTimeScalarWrite( self, 'ICA_PO_Receipts_From_Date', wwDBFrom.DateTime);
  IQRegDateTimeScalarWrite( self, 'ICA_PO_Receipts_To_Date', wwDBTo.DateTime);
  IQRegBooleanScalarWrite( self, 'ICA_PO_Receipts_Checked', cbViewRec.Checked);

  IQRegFormWrite(self, [self]);
end;

procedure TFrm_ICA_PO_Receipts.BtnAssignClick(Sender: TObject);
var
  I:Integer;
  ALLOC_TECHNIQUE:String;
  Amount:Real;
  AId:Real;
  AFgMultiId, ACount:Real;
begin
  if QryRec.Eof and QryRec.Bof then
    raise exception.create(ap_rscstr.cTXT0000106);

//  if (IqSearch1.wwdbGrid.SelectedList.Count = 0) then
//    IqSearch1.wwdbGrid.SelectRecord;

  ALLOC_TECHNIQUE := SelectValueFmtAsString('select ALLOC_TECHNIQUE from ica_hdr where id = %f', [FIca_Hdr_Id]);
  Amount          := SelectValueFmtAsFloat('select Amount from ica_hdr where id = %f', [FIca_Hdr_Id]);
{
  with IqSearch1.Grid, IqSearch1.datasource.dataset do
  begin
    for i:= 0 to SelectedList.Count-1 do
    begin
      GotoBookmark(SelectedList.items[i]);
      AId := GetNextID('ICA_DTL');
      ExecuteCommandFmt('begin ica_cost_alloc.insert_into_ica_dtl(%f, %f, %f, %f, ''%s'', %f); end;',
      [FIca_Hdr_Id,
       QryRecID.AsFloat,
       AId,
       QryRecTRANSLOG_FGMULTI_ID.asFloat,
       ALLOC_TECHNIQUE,
       Amount]);
//      AFgMultiId := SelectValueFmtAsFloat('select id from fgmulti where id = %f', [QryRecFGMULTI_ID.asFloat]);
//      if AFgMultiId <> 0 then
//        ExecuteCommandFmt('update ica_dtl set fgmulti_id = %f where id = %f', [AFgMultiId, AId])
//      else
//      if AFgMultiId = 0 then
      if QryRecTRANSLOG_FGMULTI_ID.asFloat = 0 then
      begin
        ACount := SelectValueFmtAsFloat('select count(id) from ica_dtl_split where ica_dtl_id = %f', [AId]);
        if ACount = 0 then
        begin
          FArinvtId := SelectValueFmtAsFloat('select arinvt_id from ica_dtl where id = %f', [AId]);
          if PKFgMulti.execute then
          begin
            AFgMultiId := PKFgMulti.GetValue('ID');
            ExecuteCommandFmt('update ica_dtl set fgmulti_id = %f where id = %f', [AFgMultiId, AId]);
          end;
        end;
      end;

    end;
  end;
}
  if ALLOC_TECHNIQUE <> '' then
  begin
    ExecuteCommandFmt('begin FREIGHT_COST_ALLOC.%s(''%s'', %f, ''ICA''); end;',
              [ALLOC_TECHNIQUE,
               IntToStr(Trunc(FIca_Hdr_Id)),
               Amount]);
    ExecuteCommandFmt('begin ICA_COST_ALLOC.AllocateSplit(%f); end;',
              [FIca_Hdr_Id]);
  end;

//  if ALLOC_TECHNIQUE <> '' then
//  begin
//    ExecuteCommandFmt('begin FREIGHT_COST_ALLOC.%s(''%s'', %f, ''ICA''); end;',
//              [ALLOC_TECHNIQUE,
//               IntToStr(Trunc(FIca_Hdr_Id)),
//               Amount]);
//    ExecuteCommandFmt('begin ICA_COST_ALLOC.AllocateSplit(%f); end;',
//              [FIca_Hdr_Id]);
//  end;

  ModalResult := mrOk;
end;

procedure TFrm_ICA_PO_Receipts.QryRecBeforeOpen(DataSet: TDataSet);
var
  AVendorId: Real;
begin
//  QryRec.ParamByName('AId').Value := FIca_Hdr_Id;
//  QryRec.ParamByName('AFrom').Value := wwDBFrom.Date;
//  QryRec.ParamByName('ATo').Value := wwDBTo.Date;
//  if cbViewRec.Checked then
//  begin
//    QryRec.ParamByName('AVendorId').Value := 0;
//    QryRec.ParamByName('ADummy1').Value := 0;
//    QryRec.ParamByName('ADummy2').Value := 1;
//  end
//  else
//  begin
//    QryRec.ParamByName('AVendorId').Value := FVendorId;
//    QryRec.ParamByName('ADummy1').Value := 1;
//    QryRec.ParamByName('ADummy2').Value := 0;
//  end;

  if cbViewRec.Checked then
    AVendorId := 0
  else
    AVendorId := FVendorId;

  AssignQueryParamValue(QryRec, 'AFrom'    , wwDBFrom.DateTime);
  AssignQueryParamValue(QryRec, 'ATo'      , wwDBTo.DateTime);
  AssignQueryParamValue(QryRec, 'AVendorId', AVendorId);
  AssignQueryParamValue(QryRec, 'ADummy1'  , ord(not cbViewRec.Checked));
  AssignQueryParamValue(QryRec, 'ADummy2'  , ord(cbViewRec.Checked));
end;


procedure TFrm_ICA_PO_Receipts.PKFgMultiBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'AId', FArinvtId);
//  TFDQuery(DataSet).ParamByName('AId').Value := FArinvtId;
end;

procedure TFrm_ICA_PO_Receipts.BtnApplyClick(Sender: TObject);
begin
  IQRegDateTimeScalarWrite( self, 'ICA_PO_Receipts_From_Date', wwDBFrom.DateTime);
  IQRegDateTimeScalarWrite( self, 'ICA_PO_Receipts_To_Date', wwDBTo.DateTime);
  IQRegBooleanScalarWrite( self, 'ICA_PO_Receipts_Checked', cbViewRec.Checked);

  QryRec.Close;
  QryRec.Open;
end;

end.
