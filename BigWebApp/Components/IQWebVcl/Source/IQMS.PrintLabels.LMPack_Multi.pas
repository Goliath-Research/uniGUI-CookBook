unit IQMS.PrintLabels.LMPack_Multi;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  IQMS.PrintLabels.LMPack,
  Mask,
  Data.DB,
  IQMS.PrintLabels.LabelMatrix,
  IQMS.PrintLabels.LMShare,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.Client,
  IQMS.WebVcl.Hpick,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.UserDefinedLabel,
  Vcl.Forms,
  Vcl.Controls,
  IQMS.WebVcl.UDComboBox,
  Vcl.Buttons, uniMainMenu, uniSplitter, uniScrollBox, IQUniGrid, uniGUIFrame,
  uniDBNavigator, uniComboBox, uniDBComboBox, uniDateTimePicker,
  uniDBDateTimePicker, uniMultiItem, uniDBLookupComboBox, uniGUIClasses,
  uniEdit, uniBitBtn, uniSpeedButton, uniPageControl, uniButton, uniPanel,
  uniGUIBaseClasses, uniLabel;

type
  TFrmLM_Pack_Multi = class(TFrmLM_Pack)
  private
    { Private declarations }
  public
    { Public declarations }
    constructor PackCreateEx( AOwner:TComponent; ID:Real; ASkipMfgExistsValidation: Boolean ); override;
    class procedure AppendLabels( ALMPack: TIQWebLMPackSlip; var AParam: Variant; AOnGetTotalLabelsCount: TOnGetTotalLabelsCount );
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.WebVcl.ResourceStrings;

class procedure TFrmLM_Pack_Multi.AppendLabels( ALMPack: TIQWebLMPackSlip; var AParam: Variant; AOnGetTotalLabelsCount: TOnGetTotalLabelsCount );
{ AParam:
    0 - arinvt_id
    1 - orders_id
    2 - ship_qty
    3 - ps_ticket_tl_id
    4 - ord_detail_id
    5 - standard_id
    6 - ptsper
    7 - boxno
    8 - opmat_pk_arinvt_id
    9 - label_count
    10- lotno
    11- weight
    12- date
    13- bill_to_id
    14- lm_labels_id
    15- cuser1
    16- cuser2
    17- cuser3
    18- cuser4
    19- cuser5
    20- cuser6
    21- cuser7
    22- cuser8
    23- cuser9
    24- cuser10
    25- nuser1
    26- nuser2
    27- nuser3
    28- nuser4
    29- nuser5
    30- nuser6
    31- nuser7
    32- nuser8
    33- nuser9
    34- nuser10
    35- batch for crw label report
    36- dbffile for lm label
    37- AccumulateMultipleRecordsCount
}

var
  AOnDataChange: TDataChangeEvent;
begin
  {note ALMPack is created outside // ALMPack:= TLMPackSlip.Create(Application)}
  ALMPack.FHistOrddetailId := SelectValueFmtAsFloat('select id from hist_orders where id = %f', [ DtoF(AParam[ 1 ]) ]);
  ALMPack.Arinvt_ID  := AParam[ 0 ];
  ALMPack.Orders_id  := AParam[ 1 ];
  ALMPack.ArCusto_id := SelectValueFmtAsFloat('select arcusto_id from orders where id = %f', [ DtoF(AParam[ 1 ])]);
  ALMPack.This_Standard_ID:= AParam[ 5 ];

  ALMPack.FShipQty:= AParam[ 2 ] * TFrmLM_Pack.get_ord_detail_uom_factor( AParam[ 4 ]);
  ALMPack.Pk_Ticket_Dtl_ID:= AParam[ 3 ];
  ALMPack.FSkipBoxNoUpdate:= TRUE;

  with self.PackCreateEx( ALMPack, AParam[ 0 ], TRUE ) do
  begin
    FValidateQuantityAgainstBoxQuantity:= TRUE;  // when printing from pkticket or packslip validate total qty vs box qty

    Fid:= ALMPack.FArinvt_id;

    AOnDataChange:= DM.SrcPackage.OnDataChange;
    DM.SrcPackage.OnDataChange := nil;
    IQSetTablesActive( TRUE, DM );

    if DM.QryMfgNo.Locate('ID', ALMPack.This_Standard_ID, []) then
       wwMfgNo.text := DM.QryMfgNo.FieldByName('MFGNO').asString;

    wwDBLookupComboCustomer.Text:= DM.wwQryCustomer.FieldByName('COMPANY').asString;
    DM.SrcPackage.OnDataChange:= AOnDataChange;

    if DM.QryPackage.Locate('ARINVT_ID', AParam[ 8 ], []) then
       wwPackage.Text:= DM.QryPackage.FieldByName('DESCRIP').asString;

    DM.QryBillTo.Locate('ID', AParam[13], []);
    DM.QryLabelCust.Locate('ID', AParam[14], []);
    wwDBDateTimePickDate.DateTime:= AParam[ 12 ];

    EditBox.Text    := AParam[6];
    EditBoxNum.Text := FloatToStr( AParam[ 7 ]);
    EditLblQty.Text := FloatToStr( AParam[ 9 ]);
    edLotNo.Text    := AParam[ 10 ];
    editWeight.Text := FloatToStr( AParam[ 11 ]);

    dbeCUser1.Text  := AParam[15];
    dbeCUser2.Text  := AParam[16];
    dbeCUser3.Text  := AParam[17];
    dbeCUser4.Text  := AParam[18];
    dbeCUser5.Text  := AParam[19];
    dbeCUser6.Text  := AParam[20];
    dbeCUser7.Text  := AParam[21];
    dbeCUser8.Text  := AParam[22];
    dbeCUser9.Text  := AParam[23];
    dbeCUser10.Text := AParam[24];
    dbeNUser1.Text  := AParam[25];
    dbeNUser2.Text  := AParam[26];
    dbeNUser3.Text  := AParam[27];
    dbeNUser4.Text  := AParam[28];
    dbeNUser5.Text  := AParam[29];
    dbeNUser6.Text  := AParam[30];
    dbeNUser7.Text  := AParam[31];
    dbeNUser8.Text  := AParam[32];
    dbeNUser9.Text  := AParam[33];
    dbeNUser10.Text := AParam[34];

    ALMPack.FBatch := AParam[35];
    ALMPack.DBFFile:= AParam[36];
    FAccumulateMultipleRecordsCount:= AParam[37];

    {used to assign total labels to be printed when we print batch: 1 of 10, 2 of 10 etc}
    OnGetTotalLabelsCount:= AOnGetTotalLabelsCount;

    BtnOkClick( NIL );

    {how many items printed}
    Inc(FAccumulateMultipleRecordsCount, ALMPack.FTBoxNo);

    {keep these things rolling back and forth}
    AParam[35] := ALMPack.FBatch;
    AParam[36] := ALMPack.DBFFile;
    AParam[37] := FAccumulateMultipleRecordsCount;  {this counter is always 1 greater than the actual printed}

    // Note we do not free explicitly. The object will get destroyed when ALMPack gets freed.
    // We leave to the caller to free the ALMPack as we reuse this object after the last call in order to print labels.
  end;
end;


{ TFrmLM_Pack_Multi }

constructor TFrmLM_Pack_Multi.PackCreateEx(AOwner: TComponent; ID: Real; ASkipMfgExistsValidation: Boolean);
begin
  inherited;
  FAccumulateMultipleRecordsBeforePrinting:= TRUE;
end;

end.
