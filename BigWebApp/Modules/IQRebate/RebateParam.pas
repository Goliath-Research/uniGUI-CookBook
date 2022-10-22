unit RebateParam;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.About,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Buttons,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.UserDefinedLabel,
  Mask,
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
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniMemo,
  uniDBMemo,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniDateTimePicker, uniDBDateTimePicker,
  IQUniGrid, uniGUIFrame;

type
  TFrmRebateParam = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Panel1: TUniPanel;
    SR: TIQWebSecurityRegister;
    SBSearch: TUniSpeedButton;
    SBToggle: TUniSpeedButton;
    N1: TUniMenuItem;
    Search1: TUniMenuItem;
    SrcParams: TDataSource;
    QryParams: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    QryParamsID: TBCDField;
    QryParamsDESCRIP: TStringField;
    QryParamsBASED_ON: TStringField;
    QryParamsPERCENT: TFMTBCDField;
    QryParamsFLAT_AMOUNT: TBCDField;
    QryParamsSQL_FORMULA: TStringField;
    QryParamsEXCLUDE_COMMISSIONS: TStringField;
    QryParamsCASH_BACK: TStringField;
    QryParamsEFFECT_DATE: TDateTimeField;
    QryParamsGLACCT_ID: TBCDField;
    QryParamsCUSER1: TStringField;
    QryParamsCUSER2: TStringField;
    QryParamsCUSER3: TStringField;
    QryParamsNUSER1: TFMTBCDField;
    QryParamsNUSER2: TFMTBCDField;
    QryParamsNUSER3: TFMTBCDField;
    QryParamsACCT: TStringField;
    IQUserDefLabel1: TIQWebUserDefLabel;
    IQUserDefLabel2: TIQWebUserDefLabel;
    IQUserDefLabel3: TIQWebUserDefLabel;
    IQUserDefLabel4: TIQWebUserDefLabel;
    IQUserDefLabel5: TIQWebUserDefLabel;
    IQUserDefLabel6: TIQWebUserDefLabel;
    PKAcct: TIQWebHPick;
    PKAcctID: TBCDField;
    PKAcctACCT: TStringField;
    PKAcctDESCRIP: TStringField;
    PKAcctTYPE: TStringField;
    PKAcctEPLANT_ID: TBCDField;
    QryParamsDEACTIVE_DATE: TDateTimeField;
    popmEditUserLabel: TUniPopupMenu;
    DefineLabelText2: TUniMenuItem;
    PkParams: TIQWebHPick;
    PkParamsID: TBCDField;
    PkParamsDESCRIP: TStringField;
    PkParamsBASED_ON: TStringField;
    PkParamsPERCENT: TFMTBCDField;
    PkParamsFLAT_AMOUNT: TBCDField;
    PkParamsEXCLUDE_COMMISSIONS: TStringField;
    PkParamsCASH_BACK: TStringField;
    PkParamsEFFECT_DATE: TDateTimeField;
    PkParamsDEACTIVE_DATE: TDateTimeField;
    PkParamsGLACCT_ID: TBCDField;
    PkParamsACCT: TStringField;
    New1: TUniMenuItem;
    Contents1: TUniMenuItem;
    Panel2: TUniPanel;
    PC: TUniPageControl;
    TabGrid: TUniTabSheet;
    IQSearch1: TIQUniGridControl;
    wwDBCBGrid: TUniDBComboBox;
    wwDBCDFomulaGrid: TUniEdit;
    wwDBCDAcctGrid: TUniEdit;
    TabForm: TUniTabSheet;
    Splitter1: TUniSplitter;
    Splitter2: TUniSplitter;
    Splitter3: TUniSplitter;
    Panel3: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Label8: TUniLabel;
    Label9: TUniLabel;
    Label10: TUniLabel;
    Panel4: TUniPanel;
    wwDBBasedOnForm: TUniDBComboBox;
    wwDBGlAcctForm: TUniEdit;
    DBDescrip: TUniDBEdit;
    DBPrecent: TUniDBEdit;
    DBFlatrAmount: TUniDBEdit;
    DBMemoSql: TUniDBMemo;
    DBExclComm: TUniDBCheckBox;
    DBCashBack: TUniDBCheckBox;
    wwDBEffDate: TUniDateTimePicker;
    wwDBDeActDate: TUniDateTimePicker;
    Panel5: TUniPanel;
    IQUserDefLabel7: TIQWebUserDefLabel;
    IQUserDefLabel8: TIQWebUserDefLabel;
    IQUserDefLabel9: TIQWebUserDefLabel;
    IQUserDefLabel10: TIQWebUserDefLabel;
    IQUserDefLabel11: TIQWebUserDefLabel;
    IQUserDefLabel12: TIQWebUserDefLabel;
    Panel11: TUniPanel;
    DBEdit46: TUniDBEdit;
    DBEdit47: TUniDBEdit;
    DBEdit48: TUniDBEdit;
    DBEdit49: TUniDBEdit;
    DBEdit50: TUniDBEdit;
    DBEdit4: TUniDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure SBToggleClick(Sender: TObject);
    procedure QryParamsBeforePost(DataSet: TDataSet);
    { TODO -oBantuK -cWEB_CONVERT : No equivalent control for TNavigateBTN
    procedure NavBeforeAction(Sender: TObject; Button: TNavigateBtn);}
    procedure QryParamsAfterOpen(DataSet: TDataSet);
    procedure wwDBCDAcctGridCustomDlg(Sender: TObject);
    procedure wwDBCDFomulaGridCustomDlg(Sender: TObject);
    procedure DefineLabelText2Click(Sender: TObject);
    procedure SBSearchClick(Sender: TObject);
    procedure PkParamsIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure New1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  protected
    procedure GridTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure UpdateUserLabelColumnTitle( const AFieldName, ATitleText: string );
  private
    { Private declarations }
    procedure ExecuteSearch;
  public
    { Public declarations }
  end;

procedure DoRebateParams;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  //WEB_CONVERT EditMemoStr,
  IQMS.Common.HelpHook;

procedure DoRebateParams;
begin
  with TFrmRebateParam.Create(uniGUIApplication.UniApplication) do show;
end;

procedure TFrmRebateParam.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch3{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmRebateParam.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, Panel2, Panel3, Panel4 ]);
  Action := caFree;
end;

procedure TFrmRebateParam.FormCreate(Sender: TObject);
begin
  IQMS.Common.Controls.AdjustPageControlToParent(PC);

  IQRegFormRead( self, [ self, Panel2, Panel3, Panel4 ]);
  { TODO -oBantuK -cWEB_CONVERT : E2003 Undeclared identifier: 'wwDbGrid'
  IqSearch1.wwDbGrid.OnTitleButtonClick := GridTitleButtonClick;
  wwDBCBGrid.Parent := IqSearch1.wwDbGrid;
  wwDBCBGrid.Visible := False;
  wwDBCDFomulaGrid.Parent := IqSearch1.wwDbGrid;
  wwDBCDFomulaGrid.Visible := False;
  wwDBCDAcctGrid.Parent := IqSearch1.wwDbGrid;}
  wwDBCDAcctGrid.Visible := False;
  PC.ActivePage := TabForm;
end;

procedure TFrmRebateParam.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmRebateParam.About1Click(Sender: TObject);
begin
  IqAbout1.execute
end;

procedure TFrmRebateParam.SBToggleClick(Sender: TObject);
begin
  if (PC.ActivePage = TabGrid) or (Sender = NIL) then
    PC.ActivePage := TabForm
  else
    PC.ActivePage := TabGrid;
end;

procedure TFrmRebateParam.QryParamsBeforePost(DataSet: TDataSet);
begin
  if QryParamsID.asFloat = 0 then
     QryParamsID.asFloat:= GetNextID('rebate_params');
end;

{ TODO -oBantuK -cWEB_CONVERT : There is default navigator for UniGRID control
procedure TFrmRebateParam.NavBeforeAction(Sender: TObject;  Button: TNavigateBtn);
var
  AId:Real;
begin
  if Button = nbRefresh then
  begin
    AId := QryParamsID.asFloat;
    QryParams.Close;
    QryParams.Open;
    QryParams.Locate('ID', AId, []);
    Abort;
  end;
end;
}

procedure TFrmRebateParam.GridTitleButtonClick(Sender: TObject; AFieldName: String);
begin
  if AFieldName = 'CUSER1' then
  begin
    IQUserDefLabel1.Execute;
    UpdateUserLabelColumnTitle( 'CUSER1', IQUserDefLabel1.Caption );
  end
  else if AFieldName = 'CUSER2' then
  begin
    IQUserDefLabel2.Execute;
    UpdateUserLabelColumnTitle( 'CUSER2', IQUserDefLabel2.Caption );
  end
  else if AFieldName = 'CUSER3' then
  begin
    IQUserDefLabel3.Execute;
    UpdateUserLabelColumnTitle( 'CUSER3', IQUserDefLabel3.Caption );
  end
  else if AFieldName = 'NUSER1' then
  begin
    IQUserDefLabel4.Execute;
    UpdateUserLabelColumnTitle( 'NUSER1', IQUserDefLabel4.Caption );
  end
  else if AFieldName = 'NUSER2' then
  begin
    IQUserDefLabel5.Execute;
    UpdateUserLabelColumnTitle( 'NUSER2', IQUserDefLabel5.Caption );
  end
  else if AFieldName = 'NUSER3' then
  begin
    IQUserDefLabel6.Execute;
    UpdateUserLabelColumnTitle( 'NUSER3', IQUserDefLabel6.Caption );
  end;
end;


procedure TFrmRebateParam.QryParamsAfterOpen(DataSet: TDataSet);
begin
  UpdateUserLabelColumnTitle( 'CUSER1', IQUserDefLabel1.Caption );
  UpdateUserLabelColumnTitle( 'CUSER2', IQUserDefLabel2.Caption );
  UpdateUserLabelColumnTitle( 'CUSER3', IQUserDefLabel3.Caption );
  UpdateUserLabelColumnTitle( 'NUSER1', IQUserDefLabel4.Caption );
  UpdateUserLabelColumnTitle( 'NUSER2', IQUserDefLabel5.Caption );
  UpdateUserLabelColumnTitle( 'NUSER3', IQUserDefLabel6.Caption );
end;

procedure TFrmRebateParam.UniFormShow(Sender: TObject);
begin
  QryParams.Open;
  ExecuteSearch;
end;

procedure TFrmRebateParam.UpdateUserLabelColumnTitle( const AFieldName, ATitleText: string );
begin
  QryParams.FieldByName(AFieldName).DisplayLabel := ATitleText;
  //WEB_CONVERT IqSearch1.wwDbGrid.ColumnByName(AFieldName).DisplayLabel := ATitleText;
end;


procedure TFrmRebateParam.wwDBCDAcctGridCustomDlg(Sender: TObject);
begin
  with PKAcct do
    if Execute then
    begin
      if not (QryParams.State in [dsEdit, dsInsert]) then QryParams.Edit;
      QryParams.FieldByName('GLACCT_ID').asFloat := GetValue('ID');
      QryParams.FieldByName('ACCT').asString := GetValue('ACCT');
    end;

end;

procedure TFrmRebateParam.wwDBCDFomulaGridCustomDlg(Sender: TObject);
var
  S: string;
begin
  S:= QryParamsSQL_FORMULA.asString;

  { TODO -oBantuK -cWEB_CONVERT : Dependencies on EditMemoStr
  if DoEditMemoStr( self, S, QryParamsSQL_FORMULA.Size, 'Edit SQL Formula' ) then
  begin
    QryParams.Edit;
    QryParamsSQL_FORMULA.asString:= S;
  end
   }
end;

procedure TFrmRebateParam.DefineLabelText2Click(Sender: TObject);
begin
  (popmEditUserLabel.PopupComponent as TIQWebUserDefLabel).Execute;
end;

procedure TFrmRebateParam.ExecuteSearch;
begin
  try
    SBSearchClick(NIL) ;      // activate search speed button
  except on E:EAbort do
    begin
      PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
      // System.SysUtils.ABORT;
    end;
  end;
end;

procedure TFrmRebateParam.SBSearchClick(Sender: TObject);
var
  AId:Real;
begin
  with PkParams do
    if Execute then
    begin
      AId := GetValue('ID');
      if AID > 0 then
         QryParams.Locate( 'id', AId, []);
    end
    else System.SysUtils.Abort;
end;

procedure TFrmRebateParam.PkParamsIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action     := mrOK;
  ResultValue:= 0;
  PostMessage( self.Handle, wm_Command, New1.Command, 0 );
end;

procedure TFrmRebateParam.New1Click(Sender: TObject);
begin
  //WEB_CONVERT Nav.BtnClick(nbInsert);
end;

procedure TFrmRebateParam.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( HelpContext );
end;

end.
