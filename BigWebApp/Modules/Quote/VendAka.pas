unit VendAka;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
//  Mask,
  IQMS.WebVcl.Search,
//  Vcl.Buttons,
  Data.DB,
//  Vcl.Wwdatsrc,
  IQMS.WebVcl.About,
  Vcl.Menus,
  Vcl.DBCtrls, //TNavigateBtn
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, IQUniGrid, uniGUIFrame,
  Vcl.Controls;

type
  TFrmVendAka = class(TUniForm)
    PanelVendors: TUniPanel;
    IQSearchVendor: TIQUniGridControl;
    Bevel18: TUniPanel;
    Splitter1: TUniSplitter;
    Panel1: TUniPanel;
    Panel64: TUniPanel;
    sbHideAkaBuying: TUniSpeedButton;
    Bevel19: TUniPanel;
    GridAkaVendorBreaks: TIQUniGridControl;
    SrcArinvt_Vendors_Breaks: TDataSource;
    TblArinvt_Vendors_Breaks: TFDTable;
    TblArinvt_Vendors_BreaksQUAN: TBCDField;
    TblArinvt_Vendors_BreaksQPRICE: TFMTBCDField;
    TblArinvt_Vendors_BreaksEFFECT_DATE: TDateTimeField;
    TblArinvt_Vendors_BreaksDEACTIVE_DATE: TDateTimeField;
    TblArinvt_Vendors_BreaksCOMMENT1: TStringField;
    TblArinvt_Vendors_BreaksARINVT_VENDORS_ID: TBCDField;
    TblArinvt_Vendors_BreaksPRICE_DATE: TDateTimeField;
    TblArinvt_Vendors_BreaksID: TBCDField;
    QryArinvtVendors: TFDQuery;
    QryArinvtVendorsVENDORNO: TStringField;
    QryArinvtVendorsVENDORCOMP: TStringField;
    QryArinvtVendorsPRICE_PER_1000: TStringField;
    QryArinvtVendorsVEND_REV: TStringField;
    QryArinvtVendorsINFO_PO: TStringField;
    QryArinvtVendorsIS_DEFAULT: TStringField;
    QryArinvtVendorsVEND_DESCRIP: TStringField;
    QryArinvtVendorsVEND_ITEMNO: TStringField;
    QryArinvtVendorsSEQ: TBCDField;
    QryArinvtVendorsCURRENCYDESCRIP: TStringField;
    QryArinvtVendorsINFO_REC: TStringField;
    QryArinvtVendorsID: TBCDField;
    QryArinvtVendorsARINVT_ID: TBCDField;
    QryArinvtVendorsVENDOR_ID: TBCDField;
    QryArinvtVendorsCURRENCY_ID: TBCDField;
    QryArinvtVendorsCUSER1: TStringField;
    QryArinvtVendorsNUSER4: TFMTBCDField;
    QryArinvtVendorsCUSER2: TStringField;
    QryArinvtVendorsNUSER5: TFMTBCDField;
    QryArinvtVendorsCUSER3: TStringField;
    QryArinvtVendorsNUSER6: TFMTBCDField;
    QryArinvtVendorsCUSER4: TStringField;
    QryArinvtVendorsNUSER7: TFMTBCDField;
    QryArinvtVendorsCUSER5: TStringField;
    QryArinvtVendorsNUSER8: TFMTBCDField;
    QryArinvtVendorsNUSER1: TFMTBCDField;
    QryArinvtVendorsNUSER9: TFMTBCDField;
    QryArinvtVendorsNUSER2: TFMTBCDField;
    QryArinvtVendorsNUSER10: TFMTBCDField;
    QryArinvtVendorsNUSER3: TFMTBCDField;
    QryArinvtVendorsINSP_RECEIPT_THRES: TBCDField;
    QryArinvtVendorsINSP_RECEIPT_COUNT: TBCDField;
    QryArinvtVendorsCUSER6: TStringField;
    QryArinvtVendorsCUSER7: TStringField;
    QryArinvtVendorsCUSER8: TStringField;
    QryArinvtVendorsCUSER9: TStringField;
    QryArinvtVendorsCUSER10: TStringField;
    QryArinvtVendorsVEND_DESCRIP2: TStringField;
    SrcVendor_Arinvt: TDataSource;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    PkVendor: TIQWebHPick;
    PkVendorVENDORNO: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    FloatField1: TBCDField;
    PkVendorPK_HIDE: TStringField;
    PkQCurr: TIQWebHPick;
    PkQCurrCURR_CODE: TStringField;
    PkQCurrID: TBCDField;
    PkQCurrDESCRIP: TStringField;
    PkQCurrGLVALUE: TStringField;
    PkQCurrSPOT_RATE: TFMTBCDField;
    PkQCurrCURR_SYMBOL: TStringField;
    PkQCurrECODE: TStringField;
    PkQCurrEID: TBCDField;
    PkQCurrEDATE_TIME: TDateTimeField;
    PkQCurrECOPY: TStringField;
    PkQCurrNATIVE_CURR: TStringField;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure wwAkaVendCustomDlg(Sender: TObject);
    procedure QryArinvtVendorsAfterInsert(DataSet: TDataSet);
    procedure QryArinvtVendorsBeforeEdit(DataSet: TDataSet);
    procedure sbHideAkaBuyingClick(Sender: TObject);
    procedure TblArinvt_Vendors_BreaksAfterPost(DataSet: TDataSet);
    procedure TblArinvt_Vendors_BreaksBeforeEdit(DataSet: TDataSet);
    procedure TblArinvt_Vendors_BreaksFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure NavAkaVendorBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure wwAkaPOCustomDlg(Sender: TObject);
    procedure wwAkaVendCurrCustomDlg(Sender: TObject);
    procedure QryArinvtVendorsBeforePost(DataSet: TDataSet);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FArinvtId:Real;
    FId:Real;
    procedure SetArinvtId(const Value:Real);
    procedure PickAndReplaceVendor( Pk:TIQWebHPick; const cFK_Field, cPK_Field:string );
    procedure EditItemInfo( AField: TField );
  public
    { Public declarations }
  end;

function DoVendorAka(ArinvtId:Real):Real;

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  { TODO -oLema : Dependent on IQSecIns }
//  IQSecIns,
  inv_rscstr,
  IQMS.Common.EditMemoStr;

{$R *.dfm}

function DoVendorAka(ArinvtId:Real):Real;
var
  frm: TFrmVendAka;
begin
  frm := TFrmVendAka.Create(uniGUIApplication.UniApplication);
  frm.FArinvtId := ArinvtId;
  frm.ShowModal;
  Result := frm.FId;
end;

procedure TFrmVendAka.UniFormCreate(Sender: TObject);
begin
  FId := 0;

{
  wwAkaPO.Parent := IQSearchVendor.wwDbGrid;
  wwAkaVend.Parent := IQSearchVendor.wwDbGrid;
  wwAkaVendCurr.Parent := IQSearchVendor.wwDbGrid;

  wwAkaPO.visible := false;
  wwAkaVend.visible := false;
  wwAkaVendCurr.visible := false;


  IQSearchVendor.wwDbGrid.SetControlType('VENDORNO', fctCustom,  'wwAkaVend');
  IQSearchVendor.wwDbGrid.SetControlType('VENDORCOMP', fctCustom,  'wwAkaVend');
  IQSearchVendor.wwDbGrid.SetControlType('INFO_PO', fctCustom,  'wwAkaPO');
  IQSearchVendor.wwDbGrid.SetControlType('CURRENCYDESCRIP', fctCustom,  'wwAkaVendCurr');
}

  IQRegFormRead( self, [self, PanelVendors, GridAkaVendorBreaks]);
end;

procedure TFrmVendAka.FormShow(Sender: TObject);
begin
  QryArinvtVendors.Close;
  QryArinvtVendors.ParamByName('AID').Value := FArinvtId;
  QryArinvtVendors.Open;
  TblArinvt_Vendors_Breaks.Open;

  { TODO -oLema : Dependent on IQSecIns }
//  EnsureSecurityInspectorOnTopOf( self );
end;


procedure TFrmVendAka.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, PanelVendors, GridAkaVendorBreaks]);
end;

procedure TFrmVendAka.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmVendAka.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmVendAka.PickAndReplaceVendor( Pk:TIQWebHPick; const cFK_Field, cPK_Field:string );
var
  Seq: Integer;
  AAfterInsert: TDataSetNotifyEvent;
begin
  with Pk do
    if Execute then
    begin
      Seq:= Trunc(SelectValueFmtAsFloat('select max(seq) from arinvt_vendors where arinvt_id = %f', [FArinvtID])) + 1;
      with QryArinvtVendors do
      try
        AAfterInsert:= AfterInsert;
        AfterInsert := NIL;
        if not (State in [dsEdit, dsInsert]) then
           Edit;
        FieldByName( cFK_Field ).AsFloat  := GetValue( cPK_Field );
        FieldByName( 'ARINVT_ID' ).AsFloat:= FArinvtId;
        FieldByName( 'SEQ' ).AsInteger    := Seq;
        QryArinvtVendorsVENDORCOMP.asString  := SelectValueFmtAsString('select company from vendor where id = %f', [FieldByName( cFK_Field ).AsFloat]);
        QryArinvtVendorsVENDORNO.asString    := SelectValueFmtAsString('select vendorno from vendor where id = %f', [FieldByName( cFK_Field ).AsFloat]);
      finally
        AfterInsert:= AAfterInsert;
        Abort;
      end;
    end;
end;


procedure TFrmVendAka.wwAkaVendCustomDlg(Sender: TObject);
begin
  PickAndReplaceVendor( PkVendor, 'Vendor_ID', 'ID' );
end;

procedure TFrmVendAka.QryArinvtVendorsAfterInsert(DataSet: TDataSet);
begin
  PickAndReplaceVendor( PkVendor, 'Vendor_ID', 'ID' );
end;

procedure TFrmVendAka.QryArinvtVendorsBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TFrmVendAka.sbHideAkaBuyingClick(Sender: TObject);
begin
  if sbHideAkaBuying.Down then
  begin
     sbHideAkaBuying.Hint := 'Click to show inactives.';
     IQRegIntegerScalarWrite( self, 'INV_AKABTNBUYING_HIDE_INACTIVES', 1);
  end
  else
  begin
     sbHideAkaBuying.Hint := 'Click to hide inactives.';
     IQRegIntegerScalarWrite( self, 'INV_AKABTNBUYING_HIDE_INACTIVES', 0);
  end;
  TblArinvt_Vendors_Breaks.Close;
  TblArinvt_Vendors_Breaks.Open;
end;

procedure TFrmVendAka.SetArinvtId(const Value: Real);
begin
  FArinvtId := Value;
end;

procedure TFrmVendAka.TblArinvt_Vendors_BreaksAfterPost(DataSet: TDataSet);
begin
  if DataSet is TFDTable then
     TFDTable(DataSet).Refresh;
end;

procedure TFrmVendAka.TblArinvt_Vendors_BreaksBeforeEdit(
  DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TFrmVendAka.TblArinvt_Vendors_BreaksFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := True;
  if sbHideAkaBuying.Down then
    Accept := SelectValueFmtAsFloat('select id from ARINVT_VENDORS_BREAKS where Trunc(sysdate) ' +
                        ' between NVL(effect_date, trunc(sysdate)) and NVL(deactive_date, trunc(sysdate)) and id = %f',
                        [TblArinvt_Vendors_BreaksID.asFloat]) <> 0;
end;


procedure TFrmVendAka.NavAkaVendorBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
 IQCheckRefresh( Sender, Button );
end;

procedure TFrmVendAka.wwAkaPOCustomDlg(Sender: TObject);
begin
 EditItemInfo( QryArinvtVendorsINFO_PO );
end;

procedure TFrmVendAka.EditItemInfo( AField: TField );
var
  S: string;
begin
  S:= AField.asString;
  if DoEditMemoStr(S, AField.Size, inv_rscstr.cTXT0000020 {'Edit Item Information'}) then  {IQMS.Common.EditMemoStr.pas}
     with AField.DataSet do
     begin
       Edit;
       AField.asString:= S;
     end;
end;


procedure TFrmVendAka.wwAkaVendCurrCustomDlg(Sender: TObject);
var
  AId:Real;
begin
  with PkQCurr do
  if Execute then
  begin
    AId := GetValue( 'ID' );
    if not (QryArinvtVendors.State in [dsEdit, dsInsert]) then QryArinvtVendors.Edit;

    QryArinvtVendorsCURRENCY_ID.AsFloat:= AId;
    QryArinvtVendorsCURRENCYDESCRIP.asString  := SelectValueFmtAsString('select descrip from currency where id = %f', [AId]);
  end;
end;

procedure TFrmVendAka.QryArinvtVendorsBeforePost(DataSet: TDataSet);
begin
  if QryArinvtVendorsID.asFloat = 0 then
    QryArinvtVendorsID.asFloat := GetNextID('ARINVT_VENDORS');
  QryArinvtVendorsARINVT_ID.asFloat := FArinvtID;
end;

procedure TFrmVendAka.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmVendAka.BtnOkClick(Sender: TObject);
begin
  FId := QryArinvtVendorsID.asFloat;
  Close;
end;

end.
