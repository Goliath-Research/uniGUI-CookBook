unit Qinvt_dm;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Hpick,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TQInvtDM = class(TDataModule)
    TblArinvtBreaks: TFDTable;
    TblArinvtBreaksARINVT_ID: TBCDField;
    TblArinvtBreaksQUAN: TBCDField;
    TblArinvtBreaksQPRICE: TFMTBCDField;
    SrcArinvtBreaks: TDataSource;
    TblQinvtBreaks: TFDTable;
    TblQinvtBreaksQINVT_ID: TBCDField;
    TblQinvtBreaksQUAN: TBCDField;
    TblQinvtBreaksQPRICE: TFMTBCDField;
    SrcQInvtBreaks: TDataSource;
    TblArinvt: TFDTable;
    TblArinvtID: TBCDField;
    TblArinvtCLASS: TStringField;
    TblArinvtITEMNO: TStringField;
    TblArinvtREV: TStringField;
    TblArinvtDESCRIP: TStringField;
    SrcArinvt: TDataSource;
    TblQInvt: TFDTable;
    TblQInvtID: TBCDField;
    TblQInvtCLASS: TStringField;
    TblQInvtITEMNO: TStringField;
    TblQInvtREV: TStringField;
    TblQInvtDESCRIP: TStringField;
    SrcQInvt: TDataSource;
    TblQInvtUNIT: TStringField;
    PkQinvt: TIQWebHPick;
    PkQinvtITEMNO: TStringField;
    PkQinvtCLASS: TStringField;
    PkQinvtREV: TStringField;
    PkQinvtDESCRIP: TStringField;
    PkQinvtUNIT: TStringField;
    PkArinvt: TIQWebHPick;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    TblArinvtUNIT: TStringField;
    SrcQOpMat: TDataSource;
    SrcQOpMat_Qty_Breaks: TDataSource;
    SrcQuote: TDataSource;
    SrcQMat_Qty_Breaks: TDataSource;
    PkQinvt_IN: TIQWebHPick;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    FloatField1: TBCDField;
    PkQinvt_INCLASS: TStringField;
    PkQinvt_PK: TIQWebHPick;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    FloatField2: TBCDField;
    PkQinvt_PKCLASS: TStringField;
    PkQinvt_PL: TIQWebHPick;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    FloatField3: TBCDField;
    PkQinvt_PLCLASS: TStringField;
    PkArinvt_PL: TIQWebHPick;
    PkArinvt_PLITEMNO: TStringField;
    PkArinvt_PLDESCRIP: TStringField;
    PkArinvt_PLREV: TStringField;
    PkArinvt_PLCLASS: TStringField;
    PkArinvt_PLID: TBCDField;
    PkArinvt_PK: TIQWebHPick;
    PkArinvt_IN: TIQWebHPick;
    PkArinvt_PKITEMNO: TStringField;
    PkArinvt_PKDESCRIP: TStringField;
    PkArinvt_PKREV: TStringField;
    PkArinvt_PKCLASS: TStringField;
    PkArinvt_PKID: TBCDField;
    PkArinvt_INITEMNO: TStringField;
    PkArinvt_INDESCRIP: TStringField;
    PkArinvt_INREV: TStringField;
    PkArinvt_INCLASS: TStringField;
    PkArinvt_INID: TBCDField;
    TblQInvtSTDCAV: TFMTBCDField;
    TblQInvtPTWT: TFMTBCDField;
    TblQInvtPT_VOL: TFMTBCDField;
    TblQInvtQUOTE_ID: TBCDField;
    TblQinvtBreaksPRICE_DATE: TDateTimeField;
    TblQinvtBreaksEFFECT_DATE: TDateTimeField;
    TblQinvtBreaksDEACTIVE_DATE: TDateTimeField;
    TblArinvtBreaksPRICE_DATE: TDateTimeField;
    TblArinvtBreaksEFFECT_DATE: TDateTimeField;
    TblArinvtBreaksDEACTIVE_DATE: TDateTimeField;
    TblQInvtSPG: TFMTBCDField;
    TblArinvtSPG: TFMTBCDField;
    TblArinvtDESCRIP2: TStringField;
    TblQInvtDESCRIP2: TStringField;
    TblArinvtEPLANT_ID: TBCDField;
    TblArinvtPK_HIDE: TStringField;
    TblArinvtBreaksBUYING: TStringField;
    TblQInvtRfq: TStringField;
    PkQinvtID: TBCDField;
    PkArinvtID: TBCDField;
    TblQInvtIS_BY_PRODUCT: TStringField;
    TblArinvtIS_BY_PRODUCT: TStringField;
    TblQInvtGAUGE: TFMTBCDField;
    SrcQOpMatByProduct: TDataSource;
    PkQinvt_ByProd: TIQWebHPick;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    FloatField4: TBCDField;
    StringField18: TStringField;
    PkArinvt_ByProd: TIQWebHPick;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    FloatField5: TBCDField;
    SrcQOpmatByProduct_Qty_Breaks: TDataSource;
    TblArinvtGAUGE: TFMTBCDField;
    TblQInvtDEDUCT_BY_PRODUCT_VALUE: TStringField;
    TblQInvtLENGTH: TFMTBCDField;
    TblQInvtWIDTH: TFMTBCDField;
    TblArinvtLENGTH: TFMTBCDField;
    TblArinvtWIDTH: TFMTBCDField;
    PkArinvtPK_HIDE: TStringField;
    PkArinvt_PLPK_HIDE: TStringField;
    PkArinvt_PKPK_HIDE: TStringField;
    PkArinvt_INPK_HIDE: TStringField;
    PkArinvt_ByProdPK_HIDE: TStringField;
    PkQinvtDESCRIP2: TStringField;
    PkQinvt_PLDESCRIP2: TStringField;
    PkQinvt_PKDESCRIP2: TStringField;
    PkQinvt_INDESCRIP2: TStringField;
    PkQinvt_ByProdDESCRIP2: TStringField;
    PkArinvtDESCRIP2: TStringField;
    PkArinvt_PLDESCRIP2: TStringField;
    PkArinvt_PKDESCRIP2: TStringField;
    PkArinvt_INDESCRIP2: TStringField;
    PkArinvt_ByProdDESCRIP2: TStringField;
    TblArinvtRFQ_USE_STD_COST: TStringField;
    PkQinvtRFQ: TStringField;
    PkQinvt_PKRFQ: TStringField;
    PkQinvt_INRFQ: TStringField;
    PkQinvt_PLRFQ: TStringField;
    PkQinvt_ByProdRFQ: TStringField;
    TblArinvtBreaksID: TBCDField;
    TblQinvtBreaksID: TBCDField;
    PkQinvtPK_HIDE: TStringField;
    PkQinvt_PLPK_HIDE: TStringField;
    PkQinvt_PKPK_HIDE: TStringField;
    PkQinvt_INPK_HIDE: TStringField;
    PkQinvt_ByProdPK_HIDE: TStringField;
    TblQInvtPK_HIDE: TStringField;
    TblArinvtSTD_COST: TFMTBCDField;
    TblArinvtSTD_COST_CONTROL: TStringField;
    TblQInvtARINVT_ID: TBCDField;
    TblQInvtStd_Cost: TFloatField;
    TblQInvtStd_Cost_Control: TStringField;
    TblQinvtBreaksStd_Cost: TFMTBCDField;
    TblQinvtBreaksStd_Cost_Control: TStringField;
    TblArinvtBreaksStd_Cost: TFMTBCDField;
    TblArinvtBreaksStd_Cost_Control: TStringField;
    SrcArinvtStdCost: TDataSource;
    QryArinvtStdCost: TFDQuery;
    QryArinvtStdCostID: TBCDField;
    QryArinvtStdCostSTD_COST: TFMTBCDField;
    QryArinvtStdCostSTD_COST_CONTROL: TStringField;
    TblArinvtSTANDARD_ID: TBCDField;
    procedure AssignIDBeforePost(DataSet: TDataSet);
    procedure TblQInvtNewRecord(DataSet: TDataSet);
    procedure PostParentsBeforeEdit(DataSet: TDataSet);
    procedure SrcQInvtBreaksDataChange(Sender: TObject; Field: TField);
    procedure SrcArinvtDataChange(Sender: TObject; Field: TField);
    procedure SrcQOpMat_Qty_BreaksDataChange(Sender: TObject;
      Field: TField);
    procedure SrcQMat_Qty_BreaksDataChange(Sender: TObject; Field: TField);
    procedure SrcQInvtDataChange(Sender: TObject; Field: TField);
    procedure TblArinvtBeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure TblArinvtAfterScroll(DataSet: TDataSet);
    procedure TblQInvtCalcFields(DataSet: TDataSet);
    procedure AbortOnInsert(DataSet: TDataSet);
    procedure TblQinvtBreaksBeforePost(DataSet: TDataSet);
    procedure TblQinvtBreaksCalcFields(DataSet: TDataSet);
    procedure TblArinvtBreaksCalcFields(DataSet: TDataSet);
    procedure TblQinvtBreaksNewRecord(DataSet: TDataSet);
    procedure TblArinvtBreaksFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure TblArinvtAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    FUseStdCost: Boolean;
  public
    { Public declarations }
    class function GetUseStdCost: Boolean;
    class function LookupArinvtStdCost(AArinvt_ID: Real; var AStd_Cost: Real; var AStd_Cost_Control: string): Boolean;
    property UseStdCost: Boolean read FusestdCost;
  end;

implementation

{$R *.DFM}

uses IQMS.Common.DataLib,  IQMS.Common.Mcshare, ClassLst, quote_rscstr, Variants;

procedure TQInvtDM.AssignIDBeforePost(DataSet: TDataSet);
begin
  if DataSet = TblQinvt then
    if Trim(TblQinvt.FieldByname('UNIT').asString) = '' then
       //'Please enter a value for UOM.'
       raise Exception.Create(quote_rscstr.cTXT000000199);

  with TFDTable(DataSet) do
  begin
    if CompareText( TableName, 'v_qinvt_prime_material') = 0 then
       IQAssignIDBeforePost( DataSet, 'QINVT' )
    else if CompareText( TableName, 'v_arinvt_prime_material') = 0 then
       IQAssignIDBeforePost( DataSet, 'ARINVT' )
    else if CompareText( TableName, 'v_qinvt_by_product') = 0 then
       IQAssignIDBeforePost( DataSet, 'QINVT' )
    else if CompareText( TableName, 'v_arinvt_by_product') = 0 then
       IQAssignIDBeforePost( DataSet, 'ARINVT' )
    else if CompareText( TableName, 'v_qinvt_prime_material_TForm2') = 0 then
       IQAssignIDBeforePost( DataSet, 'QINVT' )
    else if CompareText( TableName, 'v_arinvt_prime_material_TForm2') = 0 then
       IQAssignIDBeforePost( DataSet, 'ARINVT' )
    else
       IQAssignIDBeforePost( DataSet );
  end;
end;

procedure TQInvtDM.TblQInvtNewRecord(DataSet: TDataSet);
begin
  TblQinvtCLASS.value:= 'PL';
  TblQinvtUNIT.value := 'LBS';
  TblQinvtREV.value  := ' ';
  TblQinvtPK_HIDE.value:= 'N';
end;

procedure TQInvtDM.PostParentsBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit(DataSet);
end;

procedure TQInvtDM.SrcQInvtBreaksDataChange(Sender: TObject;
  Field: TField);
var
  AID:Real;
begin
  AId := SelectValueFmtAsFloat('select currency_id from quote where id = %f', [TblQinvt.FieldByName('QUOTE_ID').asFloat]);
  if AID = 0 then AID := GetEplantNativeCurrencyId; {in IQMS.Common.Mcshare.pas}
  PostMessage( Application.MainForm.Handle, iq_MCRefreshDataSets, Trunc(AID), iq_MC_Quote_Qinvt_Tag );
end;

procedure TQInvtDM.SrcArinvtDataChange(Sender: TObject; Field: TField);
var
  AID:Real;
begin
  AID := GetEplantNativeCurrencyId; {in IQMS.Common.Mcshare.pas}
  PostMessage( Application.MainForm.Handle, iq_MCRefreshDataSets, Trunc(AID), iq_MC_Quote_Arinvt_Tag );
end;

procedure TQInvtDM.SrcQOpMat_Qty_BreaksDataChange(Sender: TObject;
  Field: TField);
var
  AID:Real;
begin
  AID := GetEplantNativeCurrencyId; {in IQMS.Common.Mcshare.pas}
  PostMessage( Application.MainForm.Handle, iq_MCRefreshDataSets, Trunc(AID), iq_MC_Quote_Pl_Tag );
end;

procedure TQInvtDM.SrcQMat_Qty_BreaksDataChange(Sender: TObject;
  Field: TField);
var
  AID:Real;
begin
  AID := GetEplantNativeCurrencyId; {in IQMS.Common.Mcshare.pas}
  PostMessage( Application.MainForm.Handle, iq_MCRefreshDataSets, Trunc(AID), iq_MC_Quote_Att_Tag );
end;

procedure TQInvtDM.SrcQInvtDataChange(Sender: TObject; Field: TField);
var
 ADataChangeEvent: TDataChangeEvent;
begin
  //if Assigned(TblQinvt) and (TblQinvt.State in [ dsEdit, dsInsert ]) then
  //  with TblQinvt.FieldByName('SPG') do
  //  try
  //    ADataChangeEvent:= SrcQinvt.OnDataChange;
  //    SrcQinvt.OnDataChange:= NIL;
  //    ReadOnly:= FALSE;
  //    if TblQInvt.FieldByName('class').asString <> 'PL' then
  //       Clear;
  //    ReadOnly:= TblQInvt.FieldByName('class').asString <> 'PL';
  //  finally
  //    SrcQinvt.OnDataChange:= ADataChangeEvent;
  //  end;
end;

procedure TQInvtDM.TblArinvtBeforeOpen(DataSet: TDataSet);
begin
  TblArinvt.UpdateOptions.RequestLive:= FALSE;  // [FireDAC][DatS]-2. Object [???????   ??] is not found

  IQAssignEPlantFilter( DataSet );  {pas}
  with DataSet do
    if Filter = '' then
       Filter:= 'PK_HIDE = NULL or PK_HIDE = ''N'''
    else
       Filter:= Format( '%s and (%s)', [ Filter, 'PK_HIDE = NULL or PK_HIDE = ''N''' ]);
end;

procedure TQInvtDM.TblArinvtBreaksCalcFields(DataSet: TDataSet);
begin
  TblArinvtBreaksStd_Cost.asFloat         := TblArinvtSTD_COST.asFloat;
  TblArinvtBreaksStd_Cost_Control.asString:= TblArinvtSTD_COST_CONTROL.asString;
end;

procedure TQInvtDM.DataModuleCreate(Sender: TObject);
begin
  TFrmClassList.EnsurePrimaryMaterialIsChecked; {ClassLst.pas}
  FUseStdCost:= GetUseStdCost;
end;

class function TQInvtDM.GetUseStdCost: Boolean;
begin
  Result:= SelectValueAsString('select use_std_cost from qparams') = 'Y';
end;

procedure TQInvtDM.TblArinvtAfterOpen(DataSet: TDataSet);
begin
  TblArinvt.UpdateOptions.RequestLive:= TRUE;  // [FireDAC][DatS]-2. Object [???????   ??] is not found
end;

procedure TQInvtDM.TblArinvtAfterScroll(DataSet: TDataSet);
begin
  // 09-18-2013 TblArinvtBreaks filtering is taking place in QInv_Bas.pas in TQInvBas.TblArinvtBreaksFilterRecord
  // TblArinvtBreaks.Close;
  // if SelectValueFmtAsFloat('select NVL(standard_id, 0) from arinvt where id = %f', [TblArinvtID.AsFloat]) = 0 then
  //   TblArinvtBreaks.Filter := 'BUYING=''Y'' AND BUYING<>NULL'
  // else
  //   TblArinvtBreaks.Filter := 'BUYING=''N'' OR BUYING=NULL';
  //
  // TblArinvtBreaks.Open;
end;

procedure TQInvtDM.TblArinvtBreaksFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  // see TQInvBas.TblArinvtBreaksFilterRecord
end;


procedure TQInvtDM.TblQInvtCalcFields(DataSet: TDataSet);
var
  AStd_Cost: Real;
  AStd_Cost_Control: string;
begin
  TblQInvtRfq.Clear;
  if TblQInvtQUOTE_ID.asFloat > 0 then
     TblQInvtRfq.asString:= SelectValueByID('rfq', 'quote', TblQInvtQUOTE_ID.asFloat );

  if FUseStdCost and LookupArinvtStdCost( TblQInvtARINVT_ID.asFloat, AStd_Cost, AStd_Cost_Control ) then
  begin
    TblQInvtStd_Cost.asFloat:= AStd_Cost;
    TblQInvtStd_Cost_Control.asString:= AStd_Cost_Control;
  end;
end;

procedure TQInvtDM.AbortOnInsert(DataSet: TDataSet);
begin
  System.SysUtils.Abort; // do not allow inserts
end;

procedure TQInvtDM.TblQinvtBreaksBeforePost(DataSet: TDataSet);
begin
  if TblQinvtBreaksID.asFloat = 0 then
    TblQinvtBreaksID.asFloat := GetNextID('QINVT_QTY_BREAKS');
end;

procedure TQInvtDM.TblQinvtBreaksCalcFields(DataSet: TDataSet);
begin
  TblQinvtBreaksStd_Cost.asFloat:= TblQInvtStd_Cost.asFloat;
  TblQinvtBreaksStd_Cost_Control.asString:= TblQInvtStd_Cost_Control.asString;
end;

procedure TQInvtDM.TblQinvtBreaksNewRecord(DataSet: TDataSet);
begin
  TblQinvtBreaksID.asFloat:= 0;
  if TQInvtDM.GetUseStdCost() then
     TblQinvtBreaksQUAN.asFloat:= 1;
end;

class function TQInvtDM.LookupArinvtStdCost( AArinvt_ID: Real; var AStd_Cost: Real; var AStd_Cost_Control: string ): Boolean;
var
  A: Variant;
begin
  Result:= False;
  if AArinvt_ID = 0 then
     EXIT;

  A:= SelectValueArrayFmt('select std_cost, std_cost_control from arinvt where id = %f', [ AArinvt_ID ]);
  if VarArrayDimCount( A ) = 0 then
    EXIT;

  AStd_Cost:= A[ 0 ];
  AStd_Cost_Control:= A[ 1 ];

  Result:= True;
end;

end.
