unit Cost_Elm;

interface

uses
  System.SysUtils,
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Mask,
  Vcl.Buttons,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, uniGUIFrame, IQUniGrid;

type
  TCostElm = class(TUniForm)
    NavMain: TUniDBNavigator;
    Panel1: TUniPanel;
    sbtnForm: TUniSpeedButton;
    DataSource1: TDataSource;
    Notebook1: TUniPageControl;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    EditELEM_DESCRIP: TUniDBEdit;
    PKAcct: TIQWebHPick;
    PKAcctID: TBCDField;
    PKAcctACCT: TStringField;
    PKAcctDESCRIP: TStringField;
    PKAcctTYPE: TStringField;
    DBEdit1: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    sbtnGLAcct: TUniSpeedButton;
    SR: TIQWebSecurityRegister;
    GridElements: TIQUniGridControl;
    wwQryGLAcctLookup: TFDQuery;
    wwDBComboBox1: TUniDBComboBox;
    wwQryGLAcctLookupID: TBCDField;
    wwQryGLAcctLookupACCT: TStringField;
    wwQryGLAcctLookupDESCRIP: TStringField;
    Bevel1: TUniPanel;
    PKAcctEPLANT_ID: TBCDField;
    wwDBComboDlg1: TUniEdit;
    wwDBComboDlg2: TUniEdit;
    wwDBComboDlg3: TUniEdit;
    wwDBComboDlg4: TUniEdit;
    qryElements: TFDQuery;
    qryElementsELEM_DESCRIP: TStringField;
    qryElementsELEM_TYPE: TStringField;
    qryElementsGLAcct: TStringField;
    qryElementsAcct_Prod_Var: TStringField;
    qryElementsAcct_Recv_Dispo: TStringField;
    qryElementsAccr_receipts: TStringField;
    qryElementsDEL_ON_ROLL_OVER: TStringField;
    qryElementsAcct_Prod_Var2: TStringField;
    qryElementsID: TBCDField;
    qryElementsGLACCT_ID: TBCDField;
    qryElementsACCT_ID_PROD_VARIANCE: TBCDField;
    qryElementsACCT_ID_RECV_DISPO_INV: TBCDField;
    qryElementsACCT_ID_ACCRUED_RECV: TBCDField;
    qryElementsACCT_ID_PROD_VARIANCE2: TBCDField;
    procedure sbtnFormClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure AssignIDBeforePost(DataSet: TDataSet);
    procedure GridElementsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure AssignAcctviaPickList1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure wwDBComboDlg1CustomDlg(Sender: TObject);
    procedure wwDBComboDlg2CustomDlg(Sender: TObject);
    procedure wwDBComboDlg3CustomDlg(Sender: TObject);
    procedure wwDBComboDlg4CustomDlg(Sender: TObject);
    procedure ClearComboDlg(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure qryElementsCalcFields(DataSet: TDataSet);
  private
    function GetAcctByID(AGLAcct_ID: Real): string;
    { private declarations }
  public
    { public declarations }
  end;

procedure DoCostElem;

implementation
{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
  { TODO : IQSecIns not yet converted }
  //IQSecIns;

procedure DoCostElem;
var
  LCostElm : TCostElm;
begin
  LCostElm := TCostElm.Create(UniGUIApplication.UniApplication);
  with LCostElm do
  begin
    ShowModal;
  end;
end;

procedure TCostElm.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, GridElements ]);
end;

procedure TCostElm.sbtnFormClick(Sender: TObject);
begin
  {Toggle Form - Table views}
  { TODO : TUniPageControl has no property PageIndex }
  {if NoteBook1.PageIndex = 0 then
  begin
     NoteBook1.PageIndex:= 1;
     gridElements.DataSource:= DataSource1;
  end
  else begin
     NoteBook1.PageIndex:= 0;
     gridElements.DataSource:= NIL;
  end; }
end;

procedure TCostElm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 IQRegFormWrite( self, [ self, GridElements ]);
end;

procedure TCostElm.FormShow(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
{ TODO : IQSecIns not yet converted }
//  EnsureSecurityInspectorOnTopOf( self );
end;

procedure TCostElm.AssignIDBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
end;

procedure TCostElm.GridElementsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //if (Key = VK_DELETE) and Assigned(GridElements.SelectedField) then with GridElements.SelectedField do
  //  if (FieldKind = fkLookup) or (FieldName = 'ELEM_TYPE') then
  //  begin
  //    TblElements.Edit;
  //    if FieldKind = fkLookup then
  //      TblElements.FieldByName(KeyFields).Clear
  //    else
  //      Clear;  {belongs to SelectedField}
  //    Key:= 0;
  //  end
end;

procedure TCostElm.ClearComboDlg(Sender: TObject; var Key: Word;  Shift: TShiftState);
var
  AField: TField;
begin
  if Sender = wwDBComboDlg1      then AField:= qryElements.FieldByName('GLACCT_ID')
  else if Sender = wwDBComboDlg2 then AField:= qryElements.FieldByName('ACCT_ID_PROD_VARIANCE')
  else if Sender = wwDBComboDlg3 then AField:= qryElements.FieldByName('ACCT_ID_RECV_DISPO_INV')
  else if Sender = wwDBComboDlg4 then AField:= qryElements.FieldByName('ACCT_ID_ACCRUED_RECV')
  else
      ABORT;

  IQMS.Common.Controls.CheckClearWWDBComboDlg( Sender, Key, AField );
end;

procedure TCostElm.wwDBComboDlg1CustomDlg(Sender: TObject);
begin
  IQPickAndReplace( DataSource1.DataSet.FieldByName('GLACCT_ID'), PkAcct, 'ID' )
end;

procedure TCostElm.wwDBComboDlg2CustomDlg(Sender: TObject);
begin
  IQPickAndReplace( DataSource1.DataSet.FieldByName('ACCT_ID_PROD_VARIANCE'), PkAcct, 'ID' )
end;

procedure TCostElm.wwDBComboDlg3CustomDlg(Sender: TObject);
begin
  IQPickAndReplace( DataSource1.DataSet.FieldByName('ACCT_ID_RECV_DISPO_INV'), PkAcct, 'ID' )
end;

procedure TCostElm.wwDBComboDlg4CustomDlg(Sender: TObject);
begin
  IQPickAndReplace( DataSource1.DataSet.FieldByName('ACCT_ID_ACCRUED_RECV'), PkAcct, 'ID' )
end;

procedure TCostElm.PopupMenu1Popup(Sender: TObject);
begin
  // AssignAcctviaPickList1.Enabled:= SR.Enabled['AssignAcctviaPickList1'] and
  //                               ((GridElements.SelectedField = TblElementsGLAcct         ) or
  //                                (GridElements.SelectedField = TblElementsAcct_Prod_Var  ) or
  //                                (GridElements.SelectedField = TblElementsAcct_Recv_Dispo) or
  //                                (GridElements.SelectedField = TblElementsAccr_Receipts  ))
end;

procedure TCostElm.qryElementsCalcFields(DataSet: TDataSet);
begin
  qryElementsGLAcct.asString         := GetAcctByID( qryElements.FieldByName('GLACCT_ID').asFloat);
  qryElementsAcct_Prod_Var.asString  := GetAcctByID( qryElements.FieldByName('ACCT_ID_PROD_VARIANCE').asFloat);
  qryElementsAcct_Recv_Dispo.asString:= GetAcctByID( qryElements.FieldByName('ACCT_ID_RECV_DISPO_INV').asFloat);
  qryElementsAccr_receipts.asString  := GetAcctByID( qryElements.FieldByName('ACCT_ID_ACCRUED_RECV').asFloat);
  qryElementsAcct_Prod_Var2.asString := GetAcctByID( qryElements.FieldByName('ACCT_ID_PROD_VARIANCE2').asFloat);
end;

procedure TCostElm.AssignAcctviaPickList1Click(Sender: TObject);
begin
{ TODO : TIQUniGridControll has no property SelectedField }
 { with DataSource1.DataSet do
    if GridElements.SelectedField = qryElementsGLAcct then
       IQPickAndReplace( FieldByName('GLACCT_ID'), PkAcct, 'ID' )

    else if GridElements.SelectedField = qryElementsAcct_Prod_Var  then
       IQPickAndReplace( FieldByName('ACCT_ID_PROD_VARIANCE'), PkAcct, 'ID' )

    else if GridElements.SelectedField = qryElementsAcct_Recv_Dispo then
       IQPickAndReplace( FieldByName('ACCT_ID_RECV_DISPO_INV'), PkAcct, 'ID' )

    else if GridElements.SelectedField = qryElementsAccr_Receipts then
       IQPickAndReplace( FieldByName('ACCT_ID_ACCRUED_RECV'), PkAcct, 'ID' )    }
end;

procedure TCostElm.FormActivate(Sender: TObject);
begin
//  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmCosting6{HTM} );  {IQMS.Common.HelpHook.pas}
end;

function TCostElm.GetAcctByID( AGLAcct_ID: Real ): string;
begin
  Result:= '';
  if AGLAcct_ID > 0 then
     Result:= SelectValueByID('acct', 'glacct', AGLAcct_ID );
end;


end.
