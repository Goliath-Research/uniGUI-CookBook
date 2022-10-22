unit ExpUsers;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Vcl.Menus,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.About,
  IQMS.WebVcl.PkHideManager,
  Mask,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Buttons,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniPageControl, uniMainMenu, IQUniGrid, uniGUIFrame, Vcl.ExtCtrls;

type
  TFrmExpenseReportUsers = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Splitter1: TUniSplitter;
    Panel2: TUniPanel;
    GridDtl: TIQUniGridControl;
    SrcHdr: TDataSource;
    QryHdr: TFDQuery;
    QryDtl: TFDQuery;
    SrcDtl: TDataSource;
    UpdateSQL1: TFDUpdateSQL;
    QryHdrID: TBCDField;
    QryHdrUSER_NAME: TStringField;
    QryHdrPR_EMP_ID: TBCDField;
    QryHdrVENDOR_ID: TBCDField;
    QryHdrVENDOR_CONTACT_ID: TBCDField;
    QryHdrEXP_APPROVER: TStringField;
    QryHdrMILEAGE_RATE: TBCDField;
    QryHdrEMPNO: TStringField;
    QryHdrEMPLOYEE: TStringField;
    QryHdrVENDORNO: TStringField;
    QryHdrCOMPANY: TStringField;
    QryHdrVENDOR_CONTACT: TStringField;
    QryDtlID: TBCDField;
    QryDtlDELEGATE_USER_NAME: TStringField;
    QryDtlEXP_USER_ID: TBCDField;
    IQAbout1: TIQWebAbout;
    UpdateSQL2: TFDUpdateSQL;
    wwDBDelegate: TUniEdit;
    PkUsers: TIQWebHPick;
    PkUsersUSER_NAME: TStringField;
    PkApprover: TIQWebHPick;
    PkApproverUSER_NAME: TStringField;
    PKVendors: TIQWebHPick;
    PKVendorsID: TBCDField;
    PKVendorsCOMPANY: TStringField;
    PKVendorsVENDORNO: TStringField;
    PKVendorsADDR1: TStringField;
    PKVendorsADDR2: TStringField;
    PKVendorsCITY: TStringField;
    PKVendorsSTATE: TStringField;
    PKVendorsZIP: TStringField;
    PKVendorsCURRENCY_ID: TBCDField;
    PKVendorsPK_HIDE: TStringField;
    PkEmp: TIQWebHPick;
    PkEmpID: TBCDField;
    PkEmpEMPNO: TStringField;
    PkEmpPK_HIDE: TStringField;
    PkEmpEMPLOYEE: TStringField;
    PkVendorConact: TIQWebHPick;
    PkVendorConactID: TBCDField;
    PkVendorConactCONTACT_SEQNO: TBCDField;
    PkVendorConactCONTACT: TStringField;
    PkDelegates: TIQWebHPick;
    PkDelegatesUSER_NAME: TStringField;
    SR: TIQWebSecurityRegister;
    QryHdrNO_APPROVER_EDIT: TStringField;
    Contents1: TUniMenuItem;
    PC: TUniPageControl;
    TabGrid: TUniTabSheet;
    TabForm: TUniTabSheet;
    IQSearch1: TIQUniGridControl;
    wwDBUserName: TUniEdit;
    wwDBEmployee: TUniEdit;
    wwDBVendor: TUniEdit;
    wwDBVendorContact: TUniEdit;
    wwDBApprover: TUniEdit;
    dbUsername: TUniDBEdit;
    dbApprover: TUniDBEdit;
    dbMilage: TUniDBEdit;
    dbEmpno: TUniDBEdit;
    dbEmployee: TUniDBEdit;
    dbVendorno: TUniDBEdit;
    dbCompany: TUniDBEdit;
    dbVendCont: TUniDBEdit;
    dbNoApprEdit: TUniDBCheckBox;
    dbInactive: TUniDBCheckBox;
    dbWorkflow: TUniDBCheckBox;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    Label8: TUniLabel;
    SBSearch: TUniSpeedButton;
    SpeedButton1: TUniSpeedButton;
    SpeedButton2: TUniSpeedButton;
    SpeedButton3: TUniSpeedButton;
    SpeedButton4: TUniSpeedButton;
    QryHdrINACTIVE: TStringField;
    QryHdrWORKFLOW: TStringField;
    PkExpUsers: TIQWebHPick;
    PkExpUsersID: TBCDField;
    PkExpUsersUSER_NAME: TStringField;
    PkExpUsersAPPROVER: TStringField;
    PkExpUsersMILAGE_RATE: TBCDField;
    PkExpUsersWORKFLOW: TStringField;
    PkExpUsersNO_APPROVER_EDIT: TStringField;
    PkExpUsersEMPNO: TStringField;
    PkExpUsersEMPLOYEE: TStringField;
    PkExpUsersVENDORNO: TStringField;
    PkExpUsersVENDOR: TStringField;
    PkExpUsersVENDOR_CONTACT: TStringField;
    New1: TUniMenuItem;
    Options1: TUniMenuItem;
    ViewAll1: TUniMenuItem;
    ViewActive1: TUniMenuItem;
    ViewInactive1: TUniMenuItem;
    N1: TUniMenuItem;
    DefaultMileageRate1: TUniMenuItem;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    { TODO -oathite -cWebConvert : Undeclared identifier: 'TNavigateBtn'
    procedure NavHdrBeforeAction(Sender: TObject; Button: TNavigateBtn);  }
    { TODO -oathite -cWebConvert : 'TNavigateBtn' is not a type identifier
    procedure NavDtlBeforeAction(Sender: TObject; Button: TNavigateBtn); }
    procedure QryHdrBeforePost(DataSet: TDataSet);
    procedure QryDtlBeforePost(DataSet: TDataSet);
    procedure wwDBUserNameCustomDlg(Sender: TObject);
    procedure QryDtlAfterPost(DataSet: TDataSet);
    procedure QryHdrNewRecord(DataSet: TDataSet);
    procedure wwDBApproverCustomDlg(Sender: TObject);
    procedure wwDBVendorCustomDlg(Sender: TObject);
    procedure wwDBEmployeeCustomDlg(Sender: TObject);
    procedure wwDBVendorContactCustomDlg(Sender: TObject);
    procedure PkVendorConactBeforeOpen(DataSet: TDataSet);
    procedure wwDBDelegateCustomDlg(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure PKVendorsIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SBToggleClick(Sender: TObject);
    procedure PkExpUsersIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure New1Click(Sender: TObject);
    procedure FilterPkHide(Sender: TObject);
    procedure QryHdrBeforeOpen(DataSet: TDataSet);
    procedure PkExpUsersBeforeOpen(DataSet: TDataSet);
    procedure QryHdrAfterDelete(DataSet: TDataSet);
    procedure QryHdrBeforeDelete(DataSet: TDataSet);
    procedure DefaultMileageRate1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FId:Real;
    FPkHideManager: TIQWebPkHideManager;
    FUser: String;
    procedure SetUser(const Value: String);
  public
    { Public declarations }
    property User: String write SetUser;
    property PkHideManager: TIQWebPkHideManager read FPkHideManager write FPkHideManager;
  end;

procedure DoExpReportUsers(AUser:String = '');

implementation
uses
  exp_rscstr,
  ExpConfVend,
  IQMS.Common.HelpHook,
  IQMS.Common.InputQuery,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.Common.QuickAddBase,
  Qk_Vend;

{$R *.dfm}

procedure DoExpReportUsers(AUser:String = '');
begin
  with TFrmExpenseReportUsers.Create(UniApplication) do
  begin
    User := AUser;
    Show;
  end;

end;

procedure TFrmExpenseReportUsers.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmExpenseReportUsers.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmExpenseReportUsers.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  AType:Integer;
begin
  AType := 0;
  if ViewAll1.Checked then
    AType := 0
  else if ViewActive1.Checked then
    AType := 1
  else if ViewInactive1.Checked then
    AType := 2;

  IQRegIntegerScalarWrite( self, 'EXP_USERS_VIEW', AType );

  IQRegFormWrite( self, [self, Panel2, GridDtl]);
  FPkHideManager.SaveToRegistry;
end;

{ TODO -oathite -cWebConvert : 'TNavigateBtn' is not a type identifier
procedure TFrmExpenseReportUsers.NavHdrBeforeAction(Sender: TObject;  Button: TNavigateBtn);
var
  AId:Real;
begin
  if Button = nbRefresh then
  begin
    AId := QryHdrID.asFloat;
    QryHdr.Close;
    QryHdr.Open;
    QryHdr.Locate( 'id', AId, []);
    Abort;
  end;

end; }

{ TODO -oathite -cWebConvert : 'TNavigateBtn' is not a type identifier
procedure TFrmExpenseReportUsers.NavDtlBeforeAction(Sender: TObject;  Button: TNavigateBtn);
var
  AId:Real;
begin
  if Button = nbRefresh then
  begin
    AId := QryDtlID.asFloat;
    QryDtl.Close;
    QryDtl.Open;
    QryDtl.Locate( 'id', AId, []);
    Abort;
  end;

end; }

procedure TFrmExpenseReportUsers.QryHdrBeforePost(DataSet: TDataSet);
var
  AConfirm:integer;
begin
  if QryHdrVENDOR_ID.asFloat = 0 then
  begin
    { TODO -oathite -cWebConvert : Incompatible types: 'TFormClass' and 'class of TFrmConfVendor' - IQDialogChkEx belongs to IQMS.Common.Dialogs
    AConfirm := IQDialogChkEx( TFrmConfVendor, exp_rscstr.cTXT0000020, 'IQEXP_ConfirmVendor' );
    if AConfirm <> 1 then
      raise Exception.Create(exp_rscstr.cTXT0000019); }
  end;
  if QryHdrUSER_NAME.asString = '' then
    raise Exception.Create(exp_rscstr.cTXT0000002);
  if QryHdrID.asFloat = 0 then
     QryHdrID.asFloat:= GetNextID('exp_user');
end;

procedure TFrmExpenseReportUsers.QryDtlBeforePost(DataSet: TDataSet);
begin
  if QryDtlDELEGATE_USER_NAME.asString = '' then
    raise Exception.Create(exp_rscstr.cTXT0000001);

  if QryDtlID.asFloat = 0 then
     QryDtlID.asFloat:= GetNextID('exp_user_delegate');

  QryDtlEXP_USER_ID.asFloat := QryHdrID.asFloat;
end;

procedure TFrmExpenseReportUsers.wwDBUserNameCustomDlg(Sender: TObject);
var
  AUserName:String;
  APrEmpId:Real;
begin
  with PkUsers do
  if Execute then
  begin
    if not (QryHdr.State in [dsInsert, dsEdit]) then
      QryHdr.Edit;

    AUserName := GetValue('USER_NAME');

    APrEmpId := SelectValueFmtAsFloat('select pr_emp_id from s_user_general where user_name = ''%s''', [AUserName]);
    if APrEmpId <> 0 then
    begin
      QryHdrPR_EMP_ID.asFloat := APrEmpId;
      QryHdrEMPNO.asString    := SelectValueFmtAsString('select empno from pr_emp where id = %f', [APrEmpId]);
      QryHdrEmployee.AsString := SelectValueFmtAsString('select Trim(Trim(first_name) || '' '' || Trim(last_name)) from pr_emp where id = %f', [APrEmpId]);
    end;

    QryHdrUSER_NAME.AsString := AUserName;
  end
  else
    Abort;
end;

procedure TFrmExpenseReportUsers.QryHdrAfterDelete(DataSet: TDataSet);
begin
{
  try
    QryHdr.Database.ApplyUpdates([ QryHdr ]);
  except
    QryHdr.Close;
    QryHdr.Open;
    QryHdr.Locate('ID', FId, []);
  end;
}
end;

procedure TFrmExpenseReportUsers.QryDtlAfterPost(DataSet: TDataSet);
begin
//  QryDtl.Database.ApplyUpdates([ QryDtl ]);
end;

procedure TFrmExpenseReportUsers.QryHdrNewRecord(DataSet: TDataSet);
begin
//  wwDBUserNameCustomDlg(nil);
end;

procedure TFrmExpenseReportUsers.wwDBApproverCustomDlg(Sender: TObject);
begin

  with PkApprover do
  if Execute then
  begin
    if not (QryHdr.State in [dsInsert, dsEdit]) then
      QryHdr.Edit;
    QryHdrEXP_APPROVER.AsString := GetValue('USER_NAME');
  end

end;

procedure TFrmExpenseReportUsers.wwDBVendorCustomDlg(Sender: TObject);
begin
  with PKVendors do
  if Execute then
  begin
    if not (QryHdr.State in [dsInsert, dsEdit]) then
      QryHdr.Edit;
    QryHdrVENDOR_ID.AsString := GetValue('ID');
    QryHdrVENDORNO.AsString  := SelectValueFmtAsString('select vendorno from vendor where id = %s', [QryHdrVENDOR_ID.AsString]);
    QryHdrCOMPANY.AsString   := SelectValueFmtAsString('select company from vendor where id = %s', [QryHdrVENDOR_ID.AsString]);
  end
end;

procedure TFrmExpenseReportUsers.wwDBEmployeeCustomDlg(Sender: TObject);
begin
  with PkEmp do
  if Execute then
  begin
    if not (QryHdr.State in [dsInsert, dsEdit]) then
      QryHdr.Edit;
    QryHdrPR_EMP_ID.AsString := GetValue('ID');
    QryHdrEmployee.AsString  := GetValue('EMPLOYEE');
    QryHdrEMPNO.asString     := GetValue('EMPNO');
  end
end;

procedure TFrmExpenseReportUsers.wwDBVendorContactCustomDlg(Sender: TObject);
begin
  if QryHdrVENDOR_ID.asFloat = 0 then
    raise Exception.Create(exp_rscstr.cTXT0000003);

  with PkVendorConact do
  if Execute then
  begin
    if not (QryHdr.State in [dsInsert, dsEdit]) then
      QryHdr.Edit;
    QryHdrVENDOR_CONTACT_ID.AsString := GetValue('ID');
    QryHdrVENDOR_CONTACT.AsString  := GetValue('CONTACT');
  end

end;

procedure TFrmExpenseReportUsers.PkVendorConactBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'AVendor_Id', QryHdrVENDOR_ID.asFloat);
end;

procedure TFrmExpenseReportUsers.wwDBDelegateCustomDlg(Sender: TObject);
begin
  if QryHdrID.asFloat = 0 then
    raise Exception.Create(exp_rscstr.cTXT0000002);

  with PkDelegates do
  if Execute then
  begin
    if not (QryDtl.State in [dsInsert, dsEdit]) then
      QryDtl.Edit;
    QryDtlDELEGATE_USER_NAME.AsString := GetValue('USER_NAME');
  end

end;

procedure TFrmExpenseReportUsers.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmExpRep{CHM}, iqhtmExpRep{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmExpenseReportUsers.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmExpenseReportUsers.PKVendorsIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
 Action:= DoQuickAppend( TQuickAddVendor, ResultValue ); {Qk_Vend.pas}
end;

procedure TFrmExpenseReportUsers.SBToggleClick(Sender: TObject);
begin
  if (PC.ActivePage = TabGrid) or (Sender = NIL) then
  begin
    PC.ActivePage := TabForm;
  end
  else
  begin
    PC.ActivePage := TabGrid;
  end;

end;

procedure TFrmExpenseReportUsers.SetUser(const Value: String);
begin
  FUser := Value;
end;

procedure TFrmExpenseReportUsers.SpeedButton5Click(Sender: TObject);
var
  AId:Real;
begin
  with PkExpUsers do
    if Execute then
    begin
      AId := GetValue('ID');
      if AID > 0 then
         QryHdr.Locate( 'id', AId, []);
    end
    else
      Abort;

end;


procedure TFrmExpenseReportUsers.UniFormCreate(Sender: TObject);
var
  AType:Integer;
begin
  IQRegFormRead( self, [self, Panel2, GridDtl]);
  PC.ActivePage := TabForm;
  New1.Visible := false;

  wwDBUserName.Parent      := IQSearch1.DbGrid;
  wwDBEmployee.Parent      := IQSearch1.DbGrid;
  wwDBVendor.Parent        := IQSearch1.DbGrid;
  wwDBVendorContact.Parent := IQSearch1.DbGrid;
  wwDBApprover.Parent      := IQSearch1.DbGrid;

  wwDBUserName.visible      := false;
  wwDBEmployee.visible      := false;
  wwDBVendor.visible        := false;
  wwDBVendorContact.visible := false;
  wwDBApprover.visible      := false;

  FPkHideManager:= TIQWebPkHideManager.Create(self);
  FPkHideManager.RegisterMenuItem( ViewAll1,      mvoAll      );
  FPkHideManager.RegisterMenuItem( ViewActive1  , mvoActive   );
  FPkHideManager.RegisterMenuItem( ViewInactive1, mvoInactive );
  FPkHideManager.LoadFromRegistry;

  if IQRegIntegerScalarRead( self, 'EXP_USERS_VIEW', AType ) then
  begin
    if AType = 0 then ViewAll1.Click
    else if AType = 1 then ViewActive1.Click
    else if AType = 2 then ViewInactive1.Click;
  end
  else
    ViewAll1.Click;



//  QryHdr.open;
//  QryDtl.open;

  DefaultMileageRate1.Caption := Format('Default Mileage Rate (%.4f)', [SelectValueAsFloat('select MILEAGE_RATE from iqsys2 where rownum < 2')]);

  if QryHdr.bof and QryHdr.eof then
  begin
    QryHdr.Insert;
  end
  else
  begin
    if FUser <> '' then
      QryHdr.Locate('USER_NAME', FUser, [])
    else
    try
      SpeedButton5Click(NIL) ;      // activate search speed button
    except on E:EAbort do
      begin
        PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
      end;
    end;
  end;
end;

procedure TFrmExpenseReportUsers.PkExpUsersIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action     := mrOK;
  ResultValue:= 0;
  PostMessage( Handle, wm_Command, New1.Command, 0 );
end;

procedure TFrmExpenseReportUsers.New1Click(Sender: TObject);
begin
  QryHdr.Insert;
end;


procedure TFrmExpenseReportUsers.FilterPkHide(Sender: TObject);
begin
  FPkHideManager.Select(Sender);
  QryHdr.Close;
  QryHdr.Open;
  QryDtl.Close;
  QryDtl.Open;
end;

procedure TFrmExpenseReportUsers.QryHdrBeforeDelete(DataSet: TDataSet);
begin
  FId := QryHdrID.asFloat;
end;

procedure TFrmExpenseReportUsers.QryHdrBeforeOpen(DataSet: TDataSet);
var
  ASelectedViewIndex: Integer;
begin
  ASelectedViewIndex:= 0;
  if Assigned (PkHideManager) then
     ASelectedViewIndex:= PkHideManager.SelectedViewIndex;
  TFDQuery(DataSet).ParamByName('selected_view').Value := ASelectedViewIndex;
end;

procedure TFrmExpenseReportUsers.PkExpUsersBeforeOpen(DataSet: TDataSet);
var
  ASelectedViewIndex: Integer;
begin
  ASelectedViewIndex:= 0;
  if Assigned (PkHideManager) then
     ASelectedViewIndex:= PkHideManager.SelectedViewIndex;

  AssignQueryParamValue(DataSet, 'selected_view', ASelectedViewIndex);
end;

procedure TFrmExpenseReportUsers.DefaultMileageRate1Click(Sender: TObject);
var
  ARate:Real;
  AStrRate:String;
begin
  ARate := SelectValueAsFloat('select MILEAGE_RATE from iqsys2 where rownum < 2');
  AStrRate := FloatToStr(ARate);
  if IQMS.Common.InputQuery.IQInputQuery( 'Default Mileage Rate', 'Default Mileage Rate', AStrRate) then
  begin
    ARate  := StrToFloat(AStrRate);
    ExecuteCommandFmt('update iqsys2 set MILEAGE_RATE = %.4f', [ARate]);
    DefaultMileageRate1.Caption := Format('Default Mileage Rate (%.4f)', [SelectValueAsFloat('select MILEAGE_RATE from iqsys2 where rownum < 2')]);
  end;
end;

end.
