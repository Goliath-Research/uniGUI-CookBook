unit IQLMProd;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Forms,
  IQMS.PrintLabels.LMPack,
  Data.DB,
  Mask,
  Spring.Services,
  Spring.Collections,
  IQWeb.Server.DataServices,
  PickListDlg,
  Vcl.Buttons,
  IQMS.WebVcl.Hpick,
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
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.UserDefinedLabel,
  Vcl.Controls,
  IQMS.WebVcl.UDComboBox,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton, uniMainMenu, uniSplitter, uniScrollBox, IQUniGrid,
  uniGUIFrame, uniDBNavigator, uniComboBox, uniDBComboBox, uniDateTimePicker,
  uniDBDateTimePicker, uniMultiItem, uniDBLookupComboBox, uniEdit,
  uniPageControl, uniPanel, uniLabel;

type
  TFrmLM_Prod = class(TFrmLM_Pack)
    SBSearchOrd: TUniSpeedButton;
    sbtnFGLotNo: TUniSpeedButton;
    DataSource1: TDataSource;
    procedure SBSearchOrdClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PkOrderBeforeOpen(DataSet: TDataSet);
    procedure sbtnFGLotNoClick(Sender: TObject);
  private
    { Private declarations }
    FMaster_Label_List: TStringList;
    procedure DoAfterMasterLabelInsert(AMaster_Label_ID: Real);
    procedure AssignDefaultPackage;
  protected
    procedure AssignDefaults;override;
    procedure SrcPackageDataChange(Sender: TObject; Field: TField); override;
  public
    { Public declarations }
    property Master_Label_List: TStringList read FMaster_Label_List;
    constructor Create( AOwner:TComponent; AArinvt_ID: Real ); override;
    procedure AssignSalesOrderBasedOnWorkOrder(AWorkorder_ID, APartno_ID: Real);
    procedure RedirectPackagingToWorkorderBOM;
  end;

var
  FrmLM_Prod: TFrmLM_Prod;

implementation

{$R *.dfm}

uses
  Bom_Lot,
  bom_share,
  IQMS.Common.DataLib,
  IQMS.PrintLabels.LabelMatrix,
  IQMS.Common.Numbers,
  IQMS.WebVcl.ResourceStrings;

constructor TFrmLM_Prod.Create(AOwner: TComponent; AArinvt_ID: Real);
begin
  inherited Create( AOwner, AArinvt_ID );
  FMaster_Label_List:= TStringList.Create;

  AfterMasterLabelInsert:= DoAfterMasterLabelInsert;

  AssignUserDefined( AArinvt_ID );

  with TIQWebLMProd(Owner) do
     if Assigned( hDisplayParent ) then
     begin
       self.Panel1.Visible     := FALSE;                     {hide ok/cancel}
       self.PageControl1.Parent:= hDisplayParent;
       self.Visible            := False;
     end;
end;

procedure TFrmLM_Prod.FormDestroy(Sender: TObject);
begin
  inherited;
  FMaster_Label_List.Free;
end;

procedure TFrmLM_Prod.DoAfterMasterLabelInsert(AMaster_Label_ID: Real);
begin
 FMaster_Label_List.Add(Format('%.0f', [ AMaster_Label_ID ]));
end;

procedure TFrmLM_Prod.SBSearchOrdClick(Sender: TObject);
var
  Qry : TDataSet;
  IDS : IIQDataServices;
  ID  : integer;
begin
  inherited;
  IDS := ServiceLocator.GetService<IIQDataServices>('FireDAC-Oracle');

  Qry := IDS.GetQuery('select a.orderno   as orderno, '+
                      ' a.pono      as pono, '+
                      ' a.id        as orders_id, '+
                      ' c.custno    as custno, '+
                      ' c.company   as company, '+
                      ' b.arinvt_id as arinvt_id, '+
                      ' b.id        as ord_detail_id, '+
                      ' a.arcusto_id as arcusto_id '+
                      ' from '+
                      ' orders a, '+
                      ' ord_detail b, '+
                      ' arcusto c '+
                      ' where '+
                      ' b.arinvt_id = :arinvt_id '+
                      ' and b.orders_id = a.id '+
                      ' and a.arcusto_id = c.id(+)');
  try
    Qry.Open;

    ID := DoSinglePickList(Qry, 0);
    TIQWebLMBase(self.Owner).Arinvt_id := Qry.FieldByName('ARINVT_ID').AsFloat;
    TIQWebLMBase(self.Owner).Orders_id := Qry.FieldByName('ORDERS_ID').AsFloat;
    TIQWebLMBase(self.Owner).FOrder_No := Qry.FieldByName('ORDERNO').AsString;
    TIQWebLMBase(self.Owner).FPoNo     := Qry.FieldByName('PONO').AsString;
    TIQWebLMBase(self.Owner).Ord_Detail_ID:= Qry.FieldByName('ord_detail_id').AsFloat;
    TIQWebLMBase(self.Owner).FArcusto_ID:= Qry.FieldByName('ARCUSTO_ID').AsFloat;

    AssignCustomerLookupParams;
    wwDBLookupComboCustomer.DataSource.DataSet.FieldByName(wwDBLookupComboCustomer.DataField).AsString:= Qry.FieldByName('COMPANY').AsString;

    EditOrder.Text := TIQWebLMBase(self.Owner).FOrder_No;
    EditPoNo.Text  := TIQWebLMBase(self.Owner).FPoNo;

    // grab 1st outstanding release
    EditQty.Text:= SelectValueFmtAsString('select ship_quan_native from v_backlog_releases where ord_detail_id = %f order by promise_date', [ TIQWebLMBase(self.Owner).Ord_detail_ID ]);

    AssignShipTo;
    edLotNo.Text := Qry.FieldByName('LOTNO').AsString
  finally
    Qry.Free;
  end;
end;

procedure TFrmLM_Prod.sbtnFGLotNoClick(Sender: TObject);
var
  AFGLotNo:string;
begin
  AFGLotNo:= edLotNo.Text;
  if DoGetFGLotNo( AFGLotNo, TIQWebLMBase(Self.Owner).Standard_ID, TIQWebLMBase(Self.Owner).Workorder_ID ) then  {Bom_Lot}
  begin
    BOM_UpdateFGLotNo( TIQWebLMBase(Self.Owner).Standard_ID, AFGLotNo );         {bom_share.pas}
    edLotNo.Text:= AFGLotNo;
  end;
end;

procedure TFrmLM_Prod.AssignDefaults;
var
  APrintPkSeq: Integer;
begin
  FShowPK:= FALSE;
  FID:= TIQWebLMBase( self.Owner ).Arinvt_ID;

  inherited;

  with TIQWebLMBase(self.Owner) do
  begin
    if This_Standard_ID > 0 then
       Standard_ID:= This_Standard_ID
    else
       Standard_ID:= SelectValueFmtAsFloat('select standard_id from partno where id = %f', [ FPartnoID ]);  {this will also assign fg_lotno}

    if Standard_ID > 0 then
    begin
       DM.QryMfgNo.Locate('ID', Standard_ID, []);
       AssignDefaultPackage;
    end;
    wwMfgNo.Text:= DM.QryMfgNo.FieldByName('MFGNO').asString;

    // Fill lot number
    if Trim(FLotNo_User) > '' then
       edLotNo.Text:= Trim(FLotNo_User) // user-specified lot number
    else
       edLotNo.Text:= Trim(FLotNo); // default lot number
  end;
end;

procedure TFrmLM_Prod.AssignDefaultPackage;
var
  AQry: TDataSet;
begin
  with TIQWebLMBase(self.Owner) do
  begin
    AQry:= DM.SrcPackage.DataSet;
    if not AQry.Locate( 'PARTNO_ID;SEQ', VarArrayOf([ Partno_ID, 1 ]), []) then
       AQry.Locate( 'PARTNO_ID', Partno_ID, []);
    wwPackage.Text:= AQry.FieldByName('DESCRIP').asString;
    EditBox.Text  :=  AQry.FieldByName('PTSPER').asString;
  end;
end;

procedure TFrmLM_Prod.PkOrderBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  AssignQueryParamValue(DataSet, 'arinvt_id', TIQWebLMBase(self.Owner).Arinvt_ID);
end;

procedure TFrmLM_Prod.RedirectPackagingToWorkorderBOM;
begin
  DM.SrcPackage.DataSet:= DM.QryPackageWorkorderBOM;
  DataSource1.DataSet:= DM.QryPackageWorkorderBOM;
  wwPackage.ListSource:= DataSource1;
  Reopen(DM.QryPackageWorkorderBOM);
  AssignDefaultPackage;
end;

procedure TFrmLM_Prod.AssignSalesOrderBasedOnWorkOrder(AWorkorder_ID, APartno_ID: Real);
var
  A: Variant;
begin
  // get 1st sales order we can find
  A:= SelectValueArrayFmt( 'select o.id,                              '+
                      '       o.orderno,                         '+
                      '       o.pono,                            '+
                      '       r.ord_detail_id,                   '+
                      '       o.arcusto_id                       '+
                      '  from ptorder p, ptorder_rel r, orders o '+
                      ' where p.workorder_id = %f                '+
                      '   and p.partno_id = %f                   '+
                      '   and p.id = r.ptorder_id                '+
                      '   and r.orderno = o.orderno              '+
                      ' order by r.id                            ',
                      [ AWorkorder_ID,
                        APartno_ID ]);
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  TIQWebLMBase(self.Owner).Orders_id := A[ 0 ];
  TIQWebLMBase(self.Owner).FOrder_No := A[ 1 ];
  TIQWebLMBase(self.Owner).FPoNo     := A[ 2 ];
  if A[ 3 ] > 0 then
     TIQWebLMBase(self.Owner).Ord_Detail_ID:= A[ 3 ];
  TIQWebLMBase(self.Owner).FArcusto_ID:= A[ 4 ];

  AssignCustomerLookupParams;
  wwDBLookupComboCustomer.DataSource.DataSet.FieldByName(wwDBLookupComboCustomer.DataField).AsString:= SelectValueByID('company', 'arcusto', TIQWebLMBase(self.Owner).FArcusto_ID );

  EditOrder.Text := TIQWebLMBase(self.Owner).FOrder_No;
  EditPoNo.Text  := TIQWebLMBase(self.Owner).FPoNo;

  AssignShipTo;
end;


procedure TFrmLM_Prod.SrcPackageDataChange(Sender: TObject; Field: TField);
var
  ADataSet: TDataSet;
begin
  // inherited;

  ADataSet:= DM.SrcPackage.DataSet;

  EditBox.Text    := IntToStr(Trunc( ADataSet.FieldByName('PTSPER').asFloat));
  EditBoxNum.Text := IntToStr( iMax(1, ADataSet.FieldByName('BOXNO').asInteger ));
  TIQWebLMBase(self.Owner).FBox_ID:= ADataSet.FieldByName('ARINVT_ID').asFloat;
end;

end.
