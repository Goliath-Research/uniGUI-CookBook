unit exptypes;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Vcl.Menus,
  Data.DB,
  Vcl.DBCtrls, //TNavigateBtn
//  Vcl.Wwdatsrc,
  IQMS.WebVcl.UserDefinedLabel,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.About,
//  Mask,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.UDComboBox,
//  Vcl.Buttons,
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
  Vcl.Controls,
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
  uniMainMenu,
  uniLabel,
  uniPageControl, uniMultiItem, uniComboBox, uniDBComboBox, IQUniGrid,
  uniGUIFrame,
  uniDBGrid {for TUniDBGridColumn};
              
type
  TFrmExpenseTypes = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    SrcHdr: TDataSource;
    QryHdr: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    QryHdrID: TBCDField;
    QryHdrDESCRIPTION: TStringField;
    QryHdrGLACCT_ID_EXPENSE: TBCDField;
    QryHdrREF_CODE_ID: TBCDField;
    QryHdrCUSER1: TStringField;
    QryHdrCUSER2: TStringField;
    QryHdrCUSER3: TStringField;
    QryHdrNUSER1: TFMTBCDField;
    QryHdrNUSER2: TFMTBCDField;
    QryHdrNUSER3: TFMTBCDField;
    QryHdrBILLABLE_RATE: TBCDField;
    QryHdrBILLABLE_UOM: TStringField;
    QryHdrVECHICLE: TStringField;
    QryHdrACCT: TStringField;
    QryHdrREF_CODE_DESCRIP: TStringField;
    QryHdrREF_CODE: TStringField;
    IQUserDefLabel1: TIQWebUserDefLabel;
    IQUserDefLabel2: TIQWebUserDefLabel;
    IQUserDefLabel3: TIQWebUserDefLabel;
    IQUserDefLabel4: TIQWebUserDefLabel;
    IQUserDefLabel5: TIQWebUserDefLabel;
    IQUserDefLabel6: TIQWebUserDefLabel;
    IQAbout1: TIQWebAbout;
    SR: TIQWebSecurityRegister;
    PKAcct: TIQWebHPick;
    PKAcctID: TBCDField;
    PKAcctACCT: TStringField;
    PKAcctDESCRIP: TStringField;
    PKAcctTYPE: TStringField;
    PKAcctEPLANT_ID: TBCDField;
    PkRefCode: TIQWebHPick;
    PkRefCodeCATEGORY_ID: TBCDField;
    PkRefCodeCATEGORY_DESCRIP: TStringField;
    PkRefCodeEPLANT_ID: TBCDField;
    PkRefCodeREF_CODE_ID: TBCDField;
    PkRefCodeREF_CODE_DESCRIP: TStringField;
    PkRefCodeREF_CODE: TStringField;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    TabSheet2: TUniTabSheet;
    IQSearch1: TIQUniGridControl;
    wwDBGlAccount: TUniEdit;
    wwDBRefCode: TUniEdit;
    IQUDVechicle: TIQWebUDComboBox;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Splitter1: TUniSplitter;
    Panel4: TUniPanel;
    Splitter2: TUniSplitter;
    Panel5: TUniPanel;
    Panel6: TUniPanel;
    Splitter3: TUniSplitter;
    Panel7: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    wwDBAcct: TUniEdit;
    wwDBRef: TUniEdit;
    wwDBRefDesc: TUniEdit;
    DBRate: TUniDBEdit;
    DBDescrip: TUniDBEdit;
    DBUom: TUniDBEdit;
    IQUDVeh: TIQWebUDComboBox;
    IQUserDefLabel7: TIQWebUserDefLabel;
    IQUserDefLabel8: TIQWebUserDefLabel;
    IQUserDefLabel9: TIQWebUserDefLabel;
    IQUserDefLabel10: TIQWebUserDefLabel;
    IQUserDefLabel11: TIQWebUserDefLabel;
    IQUserDefLabel12: TIQWebUserDefLabel;
    DBEdit46: TUniDBEdit;
    DBEdit47: TUniDBEdit;
    DBEdit48: TUniDBEdit;
    DBEdit49: TUniDBEdit;
    DBEdit50: TUniDBEdit;
    DBEdit4: TUniDBEdit;
    PopupUserDefLabel: TUniPopupMenu;
    DefineLabelText1: TUniMenuItem;
    SBSearch: TUniSpeedButton;
    sbtnTableForm2: TUniSpeedButton;
    PkSearch: TIQWebHPick;
    PkSearchID: TBCDField;
    PkSearchDESCRIPTION: TStringField;
    PkSearchGLACCT_ID_EXPENSE: TBCDField;
    PkSearchREF_CODE_ID: TBCDField;
    PkSearchCUSER1: TStringField;
    PkSearchCUSER2: TStringField;
    PkSearchCUSER3: TStringField;
    PkSearchNUSER1: TFMTBCDField;
    PkSearchNUSER2: TFMTBCDField;
    PkSearchNUSER3: TFMTBCDField;
    PkSearchBILLABLE_RATE: TBCDField;
    PkSearchBILLABLE_UOM: TStringField;
    PkSearchVECHICLE: TStringField;
    PkSearchACCT: TStringField;
    PkSearchREF_CODE_DESCRIP: TStringField;
    PkSearchREF_CODE: TStringField;
    Contents1: TUniMenuItem;
    procedure QryHdrAfterPost(DataSet: TDataSet);
    procedure NavHdrBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure QryHdrBeforePost(DataSet: TDataSet);
    procedure QryHdrAfterOpen(DataSet: TDataSet);
    procedure IQSearch1AfterSortChange(Sender: TObject);
    procedure wwDBGlAccountCustomDlg(Sender: TObject);
    procedure wwDBRefCodeCustomDlg(Sender: TObject);
    procedure DefineLabelText1Click(Sender: TObject);
    procedure sbtnTableForm2Click(Sender: TObject);
    procedure SBSearchClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  protected
    procedure wwDbGridTitleButtonClick(Column: TUniDBGridColumn);
  private
    { Private declarations }
    procedure UpdateUserLabelColumnTitle( const AFieldName, ATitleText: string );
  public
    { Public declarations }
  end;

procedure DoExpenseTypes;

implementation
uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.HelpHook;
{$R *.dfm}

procedure DoExpenseTypes;
var
  frm: TFrmExpenseTypes;
begin
  frm := TFrmExpenseTypes.Create(uniGUIApplication.UniApplication);
  frm.Show;
end;

procedure TFrmExpenseTypes.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, IqSearch1.DBGrid, Panel2, Panel3, Panel6]);
  QryHdr.open;
  PageControl1.ActivePage := TabSheet2;

  IqSearch1.DBGrid.OnTitleClick := wwDbGridTitleButtonClick;
  
{ TODO -oLema : TUniControl can not accept child controls }
//  wwDBGlAccount.Parent      := IQSearch1.DbGrid;
  wwDBGlAccount.visible     := false;

{ TODO -oLema : TUniControl can not accept child controls }
//  wwDBRefCode.Parent      := IQSearch1.DbGrid;
  wwDBRefCode.visible     := false;

{ TODO -oLema : TUniControl can not accept child controls }
//  IQUDVechicle.Parent      := IQSearch1.DbGrid;
  IQUDVechicle.visible     := false;
end;

procedure TFrmExpenseTypes.QryHdrAfterPost(DataSet: TDataSet);
begin
//  QryHdr.Database.ApplyUpdates([ QryHdr ]);
end;


procedure TFrmExpenseTypes.NavHdrBeforeAction(Sender: TObject;  Button: TNavigateBtn);
var
  AId:Real;
begin
  if Button = nbRefresh then
  begin
    AId := QryHdrID.asFloat;
    IQRegFormWrite( self, [self, IqSearch1.DBGrid, Panel2, Panel3, Panel6]);
    QryHdr.Close;
    QryHdr.Open;

    QryHdr.Locate( 'id', AId, []);
    Abort;
  end
  else if Button = nbInsert then
  begin
    if PageControl1.ActivePage = TabSheet1 then
      IqSearch1.DbGrid.SetFocus;
  end
end;



procedure TFrmExpenseTypes.wwDbGridTitleButtonClick(Column: TUniDBGridColumn);
begin
  if Column.FieldName = 'CUSER1' then
  begin
    IQUserDefLabel1.Execute;
    UpdateUserLabelColumnTitle( 'CUSER1', IQUserDefLabel1.Caption );
  end
  else if Column.FieldName = 'CUSER2' then
  begin
    IQUserDefLabel2.Execute;
    UpdateUserLabelColumnTitle( 'CUSER2', IQUserDefLabel2.Caption );
  end
  else if Column.FieldName = 'CUSER3' then
  begin
    IQUserDefLabel3.Execute;
    UpdateUserLabelColumnTitle( 'CUSER3', IQUserDefLabel3.Caption );
  end
  else if Column.FieldName = 'NUSER1' then
  begin
    IQUserDefLabel4.Execute;
    UpdateUserLabelColumnTitle( 'NUSER1', IQUserDefLabel4.Caption );
  end
  else if Column.FieldName = 'NUSER2' then
  begin
    IQUserDefLabel5.Execute;
    UpdateUserLabelColumnTitle( 'NUSER2', IQUserDefLabel5.Caption );
  end
  else if Column.FieldName = 'NUSER3' then
  begin
    IQUserDefLabel6.Execute;
    UpdateUserLabelColumnTitle( 'NUSER3', IQUserDefLabel6.Caption );
  end;

end;

procedure TFrmExpenseTypes.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, IqSearch1.DBGrid, Panel2, Panel3, Panel6]);
end;

procedure TFrmExpenseTypes.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmExpenseTypes.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmExpenseTypes.UpdateUserLabelColumnTitle( const AFieldName, ATitleText: string );

  function getColumnByName: TUniDBGridColumn;
  var
    I: integer;
  begin
    result := nil;
    for I := 0 to IqSearch1.DBGrid.Columns.Count-1 do
      if (IqSearch1.DBGrid.Columns.Items[i].FieldName = AFieldName) then
      begin
        result := IqSearch1.DBGrid.Columns.Items[i] as TUniDBGridColumn;
        Break;
      end;
  end;

var
  C: TUniDBGridColumn;
begin
  QryHdr.FieldByName(AFieldName).DisplayLabel := ATitleText;

  C:= getColumnByName;
  if C <> nil then
    C.Title.Caption := ATitleText;
//  IqSearch1.DBGrid.ColumnByName(AFieldName).DisplayLabel := ATitleText;
end;


procedure TFrmExpenseTypes.QryHdrBeforePost(DataSet: TDataSet);
begin
  if QryHdrID.asFloat = 0 then
    QryHdrID.asFloat := GetNextID('exp_type');
end;

procedure TFrmExpenseTypes.QryHdrAfterOpen(DataSet: TDataSet);
begin
  UpdateUserLabelColumnTitle( 'CUSER1', IQUserDefLabel1.Caption );
  UpdateUserLabelColumnTitle( 'CUSER2', IQUserDefLabel2.Caption );
  UpdateUserLabelColumnTitle( 'CUSER3', IQUserDefLabel3.Caption );
  UpdateUserLabelColumnTitle( 'NUSER1', IQUserDefLabel4.Caption );
  UpdateUserLabelColumnTitle( 'NUSER2', IQUserDefLabel5.Caption );
  UpdateUserLabelColumnTitle( 'NUSER3', IQUserDefLabel6.Caption );
  IQRegFormRead( self, [self, IqSearch1.DBGrid]);
end;

procedure TFrmExpenseTypes.IQSearch1AfterSortChange(Sender: TObject);
begin
  QryHdrAfterOpen(nil);
end;


procedure TFrmExpenseTypes.wwDBGlAccountCustomDlg(Sender: TObject);
begin
  with PKAcct do
    if Execute then
    begin
      if not (QryHdr.State in [dsEdit, dsInsert]) then QryHdr.Edit;
      QryHdr.FieldByName('GLACCT_ID_EXPENSE').asFloat := GetValue('ID');
      QryHdr.FieldByName('ACCT').asString := GetValue('ACCT');
    end;
end;

procedure TFrmExpenseTypes.wwDBRefCodeCustomDlg(Sender: TObject);
begin
  with PkRefCode do
  if Execute then
  begin
    if not (QryHdr.State in [dsEdit, dsInsert]) then QryHdr.Edit;
    QryHdr.FieldByname('ref_code_id').asFloat :=  GetValue('ref_code_id');

    QryHdrREF_CODE.AsString := GetValue('REF_CODE');
    QryHdrREF_CODE_DESCRIP.asString  := GetValue('REF_CODE_DESCRIP');
  end;
end;

procedure TFrmExpenseTypes.DefineLabelText1Click(Sender: TObject);
begin
  (PopupUserDefLabel.PopupComponent as TIQWebUserDefLabel).Execute;
end;

procedure TFrmExpenseTypes.sbtnTableForm2Click(Sender: TObject);
begin
  if (PageControl1.ActivePage = TabSheet1) or (Sender = NIL) then
  begin
    PageControl1.ActivePage := TabSheet2;
  end
  else
  begin
    PageControl1.ActivePage := TabSheet1;
  end;
end;

procedure TFrmExpenseTypes.SBSearchClick(Sender: TObject);
var
  AId:Real;
begin
  with PkSearch do
    if Execute then
    begin
      AId := GetValue('ID');
      if AID > 0 then
         QryHdr.Locate( 'id', AId, []);
    end
    else System.SysUtils.Abort;
end;

procedure TFrmExpenseTypes.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmExpRep{CHM}, iqhtmExpRep{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmExpenseTypes.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

end.
