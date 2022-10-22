unit IQLOG;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Jump,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.Search,
  Vcl.Wwdatsrc,
{ TODO -oGPatil -cWebConvert : Errors in IQMS.Common.UserFields.pas File
  IQMS.Common.UserFields,  }
  IQMS.Common.JumpConstants,
  IQMS.WebVcl.UDEmbeddedForm,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniMemo, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, uniDBMemo, uniPageControl,
  IQUniGrid, uniGUIFrame, uniDBNavigator, Vcl.Controls,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  Vcl.Buttons;

type
  TIQCenterLog = class(TUniForm)
    pnlHeader: TUniPanel;
    SrcMachLog: TDataSource;
    SrcLog_Detail: TDataSource;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    pnlMachLog: TUniPanel;
    Panel5: TUniPanel;
    Splitter1: TUniSplitter;
    Splitter2: TUniSplitter;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    PopupMenu1: TUniPopupMenu;
    IQJumpBOM: TIQWebJump;
    JumptoBOM1: TUniMenuItem;
    IQJumpWorkCenter: TIQWebJump;
    JumptoWorkCenter1: TUniMenuItem;
    QryMachLog: TFDQuery;
    QryMachLogID: TBCDField;
    QryMachLogWORK_CENTER_ID: TBCDField;
    QryMachLogSTANDARD_ID: TBCDField;
    UpdateSQL1: TFDUpdateSQL;
    QryMachLogEQNO: TStringField;
    QryMachLogMFGNO: TStringField;
    PkMfgNo: TIQWebHPick;
    PkWorkCenter: TIQWebHPick;
    PkMfgNoID: TFloatField;
    PkMfgNoMFGNO: TStringField;
    PkMfgNoMFG_TYPE: TStringField;
    PkMfgNoMFGCELL: TStringField;
    PkWorkCenterID: TFloatField;
    PkWorkCenterEQNO: TStringField;
    Contents1: TUniMenuItem;
    PkMfgNoPK_HIDE: TStringField;
    PkWorkCenterCNTR_DESC: TStringField;
    wwDBComboDlgWorkCenter: TUniEdit;
    IQSearch1: TIQUniGridControl;
    wwDBComboDlgMfg: TUniEdit;
    QryMachLogCNTR_DESC: TStringField;
    QryMachLogEPLANT_ID: TBCDField;
    pgctrlDetails: TUniPageControl;
    TabNote: TUniTabSheet;
    TabUDForm: TUniTabSheet;
    MemoLog_Deltail: TUniDBMemo;
    pnlUDFormCarrier: TUniPanel;
    QryMachLogMFG_TYPE: TStringField;
    QryLog_Detail: TFDQuery;
    QryLog_DetailID: TBCDField;
    QryLog_DetailMACHLOG_ID: TBCDField;
    QryLog_DetailLOG_DATE: TDateTimeField;
    QryLog_DetailPROD_DATE: TDateTimeField;
    QryLog_DetailSHIFT: TBCDField;
    QryLog_DetailUSERID: TStringField;
    QryLog_DetailLOG_TEXT: TStringField;
    QryLog_DetailILLUM_RT_ID: TBCDField;
    QryLog_DetailWORKORDER_ID: TBCDField;
    QryLog_DetailFG_LOTNO: TStringField;
    QryLog_DetailMfg_Type: TStringField;
    UpdateSQLLogDetail: TFDUpdateSQL;
    searchLogDetail: TIQUniGridControl;
    QryLog_DetailBADGENO: TStringField;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    SR: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure AssignIDBeforePost(DataSet: TDataSet);
    procedure PostParentsBeforeEdit(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure TblLog_DetailNewRecord(DataSet: TDataSet);
    procedure TblLog_DetailAfterInsert(DataSet: TDataSet);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
{ TODO -oGPatil -cWebConvert : Dependency on Iqsecins.pas File
    procedure FormShow(Sender: TObject);  }
    procedure JumptoBOM1Click(Sender: TObject);
    procedure JumptoWorkCenter1Click(Sender: TObject);
    procedure QryMachLogAfterPost(DataSet: TDataSet);
    procedure gridMachLogEditButtonClick(Sender: TObject);
    procedure QryMachLogBeforePost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure wwDBComboDlgWorkCenterCustomDlg(Sender: TObject);
    procedure wwDBComboDlgMfgCustomDlg(Sender: TObject);
    { TODO -oGPatil -cWebConvert : TNavigateButton is not present in UniGui
    procedure navMachLogBeforeAction(Sender: TObject;
      Button: TNavigateBtn); }
    procedure pgctrlDetailsChange(Sender: TObject);
    procedure TblLog_DetailCalcFields(DataSet: TDataSet);
    procedure PostParent(DataSet: TDataSet);
    procedure AssignIDBeforePostEx(DataSet: TDataSet);
    procedure ApplyUpdate(DataSet: TDataSet);
{ TODO -oGPatil -cWebConvert : TNavigateButton is not present in UniGui
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);             }
    procedure QryLog_DetailBeforeInsert(DataSet: TDataSet);
    procedure QryMachLogNewRecord(DataSet: TDataSet);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FInit_Work_Center_ID: Real;
    FInit_Standard_ID: Real;
    FInit_Illum_RT_ID: Real;
    FInit_Workorder_ID: Real;
    FInit_FG_LotNo: string;
    FInit_Prod_Date: TDateTime;
    FInit_Shift: Real;
    FBadgeNo: string;
    procedure ReplaceID( AFK_Field, ALookUp_Field: TField; APkList: TIQWebHPick );
    procedure IQNotifyMessage( var Msg: TMessage ); message iq_Notify;
  public
    { Public declarations }
    procedure AddToMachLog(AWork_Center_ID: Real; AStandard_ID: Real = 0 );
  end;

var
  IQCenterLog: TIQCenterLog;

procedure DoIQLog(  Args: array of const );
procedure DoIQLogModal(  Args: array of const );

implementation

{$R *.DFM}

uses
  IQMS.Common.ApplicationSet,
  IQMS.Common.FileUtils,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  { TODO -oGPatil -cWebConvert : Dependency of Files
  IQSecIns,
  sd_settings,
  touchscrn,  }
  System.Variants;


{wrapper procs}
procedure DoIQLogCenter(  Args: array of const; Modal:Boolean ); forward;

procedure DoIQLog(  Args: array of const );
begin
  DoIQLogCenter( Args, FALSE );
end;

procedure DoIQLogModal(  Args: array of const );
begin
  DoIQLogCenter( Args, TRUE );
end;

procedure DoIQLogCenter(  Args: array of const; Modal:Boolean );
var
  Keys: Variant;
  I   : Integer;
  AKeysCount: Integer;
  ADetail_ID: Real;
  AObject: TIQCenterLog;
begin
  {Args:
     0 - work_center_id
     1 - standard_id   (optional)
     2 - illum_rt_id   (optional)
     3 - workorder_id  (optional)
     4 - fg_lotno      (optional)
     5 - prod_date     (optional)
     6 - shift         (optional)
  }

  AKeysCount:= 0;

  AObject:= TIQCenterLog.Create(UniGUIApplication.UniApplication);
  with AObject do
  try
    if Args[ 0 ].VInteger = varEmpty then
       EXIT
    else
       begin
          case High(Args)  of
             0   : AKeysCount:= 1;
             1..6: if Args[ 1 ].VInteger > 0 then AKeysCount:= 2 else AKeysCount:= 1;
          end;

          Keys:= VarArrayCreate( [0, AKeysCount-1], varInteger );
          for I:= 0 to AKeysCount - 1 do Keys[ I ]:= Args[ I ].VInteger;

          if High(Args) >= 0 then  FInit_Work_Center_ID:= Args[ 0 ].VInteger;
          if High(Args) >= 1 then  FInit_Standard_ID   := Args[ 1 ].VInteger;
          if High(Args) >= 2 then  FInit_Illum_RT_ID   := Args[ 2 ].VInteger;
          if High(Args) >= 3 then  FInit_Workorder_ID  := Args[ 3 ].VInteger;
          if High(Args) >= 4 then  FInit_FG_LotNo      := string(Args[ 4 ].VUnicodeString);
          if High(Args) >= 5 then  FInit_Prod_Date     := StrToDate(string(Args[ 5 ].VUnicodeString));
          if High(Args) >= 6 then  FInit_Shift         := Args[ 6 ].VInteger;
       end;

    case AKeysCount of
      1: if not QryMachLog.Locate( 'work_center_id', Keys[ 0 ], []) then
            AddToMachLog( Keys[ 0 ]);

      2: if not QryMachLog.Locate( 'work_center_id;standard_id', Keys, []) then
            AddToMachLog( Keys[ 0 ], Keys[ 1 ])
         else if (FInit_Illum_RT_ID > 0) and (FInit_Shift > 0) and (FInit_Prod_Date > 0) then
            begin
              // try by illum_rt_id, prod_date, shift
              ADetail_ID:= SelectValueFmtAsFloat('select id from log_detail where machlog_id = %f and illum_rt_id = %f and shift = %f and prod_date = to_date(''%s'', ''mm/dd/yyyy'')',
                                     [ QryMachLog.FieldByName('ID').asFloat,
                                       FInit_Illum_RT_ID,
                                       FInit_Shift,
                                       FormatDateTime('mm/dd/yyyy', FInit_Prod_Date)]);
              // try by prod_date, shift
              if ADetail_ID = 0 then
                 ADetail_ID:= SelectValueFmtAsFloat('select id from log_detail where machlog_id = %f and shift = %f and prod_date = to_date(''%s'', ''mm/dd/yyyy'')',
                                        [ QryMachLog.FieldByName('ID').asFloat,
                                          FInit_Shift,
                                          FormatDateTime('mm/dd/yyyy', FInit_Prod_Date)]);
              // find it!
              if ADetail_ID > 0 then
                 QryLog_Detail.Locate('id', ADetail_ID, []);
            end;

      0  : QryMachLog.Locate( 'work_center_id', Keys[ 0 ], []);
    end;

  finally
    if Modal then
      ShowModal
    else
      Show;
  end;

end;


{ TIQCenterLog }

procedure TIQCenterLog.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, pnlHeader, pnlMachLog ]);

  {I had to set grid manually to avoid list out of bounds}
  { TODO -oGPatil -cWebConvert : TIQUniGridControl does not have the respective properties
  IQSearch1.wwDBGrid.SetControlType( 'EQNO',  fctCustom, 'wwDBComboDlgWorkCenter' );
  IQSearch1.wwDBGrid.SetControlType( 'MFGNO', fctCustom, 'wwDBComboDlgMfg' ); }

  pgctrlDetails.ActivePageIndex:= 0;

 { TODO -oGPatil -cWebConvert : TIQUniGridControl does not have the respective properties
  searchLogDetail.TopToolPanel.Visible:= FALSE;

  //PostMessage(Handle, iq_Notify, 0, 0); }

end;

procedure TIQCenterLog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (QryLog_Detail.State in [dsEdit, dsInsert]) and IQWarningYN('Save Changes Before Exiting Out?') then
     QryLog_Detail.Post;
  IQRegFormWrite( self, [self, pnlHeader, pnlMachLog ]);
end;

procedure TIQCenterLog.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TIQCenterLog.AddToMachLog(AWork_Center_ID: Real; AStandard_ID: Real = 0);
begin
  QryMachLog.Append;
  QryMachLogWORK_CENTER_ID.asFloat:= AWork_Center_ID;
  if AStandard_ID > 0 then
     QryMachLogSTANDARD_ID.asFloat:= AStandard_ID;

  {update display}
  QryMachLogEQNO.asString     := SelectValueByID('eqno',      'work_center', QryMachLogWORK_CENTER_ID.asFloat);
  QryMachLogMFGNO.asString    := SelectValueByID('mfgno',     'standard',    QryMachLogSTANDARD_ID.asFloat);
  QryMachLogCNTR_DESC.asString:= SelectValueByID('cntr_desc', 'work_center', QryMachLogWORK_CENTER_ID.asFloat);

  // QryMachLog.Post;
end;

procedure TIQCenterLog.ApplyUpdate(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
end;

procedure TIQCenterLog.AssignIDBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );
end;

procedure TIQCenterLog.AssignIDBeforePostEx(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'log_detail' );
end;

procedure TIQCenterLog.PostParent(DataSet: TDataSet);
begin
  QryMachLog.CheckBrowseMode;
end;

procedure TIQCenterLog.PostParentsBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet );
end;


procedure TIQCenterLog.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TIQCenterLog.TblLog_DetailNewRecord(DataSet: TDataSet);
begin
  Dataset.FieldByName('ID').Value:= 0;
  Dataset.FieldByName('LOG_DATE').asDateTime:= Now;
  Dataset.FieldByName('USERID').asString    := SecurityManager.UserName;
  Dataset.FieldByName('MACHLOG_ID').Value   := QryMachLogID.asFloat;
  Dataset.FieldByName('BADGENO').asString   := FBadgeNo;

  if (FInit_Work_Center_ID > 0) and (QryMachLogWORK_CENTER_ID.asInteger = FInit_Work_Center_ID)
     and
     ( (FInit_Standard_ID = 0) or (FInit_Standard_ID > 0) and (QryMachLogSTANDARD_ID.asInteger = FInit_Standard_ID)) then
  begin
    if FInit_Illum_RT_ID > 0 then
    begin
      Dataset.FieldByName('ILLUM_RT_ID').asFloat:= FInit_Illum_RT_ID;
      FInit_Illum_RT_ID:= 0;
    end;

    if FInit_Workorder_ID > 0 then
    begin
      Dataset.FieldByName('WORKORDER_ID').asFloat:= FInit_Workorder_ID;
      FInit_Workorder_ID:= 0;
    end;

    if FInit_FG_LotNo > '' then
    begin
      Dataset.FieldByName('FG_LOTNO').asString:= FInit_FG_LotNo;
      FInit_FG_LotNo:= '';
    end;
  end;
end;

procedure TIQCenterLog.UniFormShow(Sender: TObject);
begin
    IQSetTablesActive(TRUE,self);
end;

procedure TIQCenterLog.TblLog_DetailAfterInsert(DataSet: TDataSet);
begin
  with TFDQuery.Create(self) do
  try
    Connection:= UniMainModule.FDConnection1;
    SQL.Add('select prod_date, prod_shift from params');
    Open;

    DataSet.FieldByName('PROD_DATE').asDateTime:= FieldByName('prod_date').asDateTime;
    DataSet.FieldByName('SHIFT').asInteger     := FieldByName('prod_shift').asInteger;

    if pgctrlDetails.ActivePage = TabNote then
       MemoLog_Deltail.SetFocus;
  finally
    Free;
  end;
end;

procedure TIQCenterLog.TblLog_DetailCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('Mfg_Type').asString:= QryMachLogMFG_TYPE.asString;
end;

procedure TIQCenterLog.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TIQCenterLog.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TIQCenterLog.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then  begin
    Key:= 0;
    Close;
  end
  else if (UpperCase( Char(Key) ) = 'W') and (Shift = [ssCtrl]) and (QryLog_Detail.State in [dsEdit, dsInsert]) then begin
    Key:= 0;
    QryLog_Detail.Post;
  end
  else if ( Key = VK_DELETE ) and not( QryLog_Detail.Eof and QryLog_Detail.Bof )
       and (ActiveControl = searchLogDetail) and IQWarningYN('Delete this record?') then begin
    Key:= 0;
    QryLog_Detail.Delete;
  end;
end;

{ TODO -oGPatil -cWebConvert : Dependency on Iqsecins.pas File
procedure TIQCenterLog.FormShow(Sender: TObject);
begin
  EnsureSecurityInspectorOnTopOf( self );
end;  }

procedure TIQCenterLog.JumptoBOM1Click(Sender: TObject);
begin
  IQJumpBOM.Execute;
end;

procedure TIQCenterLog.JumptoWorkCenter1Click(Sender: TObject);
begin
  IQJumpWorkCenter.Execute;
end;

procedure TIQCenterLog.QryMachLogAfterPost(DataSet: TDataSet);
var
  ID: Real;
begin
  try
    ApplyUpdate(DataSet);
  finally
    with QryMachLog do
    begin
      ID:= FieldByName('ID').asFloat;
      Close;
      Open;
      Locate('ID', ID, []);
    end;
  end;
end;

procedure TIQCenterLog.QryLog_DetailBeforeInsert(DataSet: TDataSet);
begin
  FBadgeNo := '';
  PostParent(DataSet);
  // 05/15/2014 If this is ShopData, then check
  // if we need to prompt for badge number.
  // EIQ-3025 ShopData -> Prompt for Badge # for IQLog, Print Labels & Scan to Inventory
  if IQMS.Common.ApplicationSet.IsTouchScreen and
    (CompareText(IQMS.Common.FileUtils.ExeFileName, 'SHOPDATA.EXE') = 0) then
    begin
{ TODO : Dependency on touchscrn and sd_settings.pas File
      sd_settings.CheckShopDataSettingsCreated;
      if ShopDataSettings.PromptForBadgeNumber then
        begin
          if not touchscrn.TouchScreen_ScanLogin_BadgeNumber(Self, FBadgeNo) then
            System.SysUtils.Abort;
        end;  }
    end;
end;

procedure TIQCenterLog.gridMachLogEditButtonClick(Sender: TObject);
begin
  //with gridMachLog do
  //  if SelectedField = QryMachLogEQNO then
  //     ReplaceID( QryMachLogWORK_CENTER_ID, QryMachLogEQNO, PkWorkCenter )
  //  else if SelectedField = QryMachLogMFGNO then
  //     ReplaceID( QryMachLogSTANDARD_ID, QryMachLogMFGNO, PkMfgNo );
end;

procedure TIQCenterLog.ReplaceID( AFK_Field, ALookUp_Field: TField; APkList: TIQWebHPick );
begin
  with APkList do
    if Execute then
    begin
      AFK_Field.DataSet.Edit;
      AFK_Field.asFloat:= GetValue('ID');
      ALookUp_Field.asString:= GetValue( ALookUp_Field.FieldName );
    end;
end;

procedure TIQCenterLog.QryMachLogBeforePost(DataSet: TDataSet);
begin
  if QryMachLogID.asFloat = 0 then
     QryMachLogID.asFloat:= SelectValueAsFloat('select s_machlog.nextval from dual');
end;

procedure TIQCenterLog.QryMachLogNewRecord(DataSet: TDataSet);
begin
  Dataset.FieldByName('ID').Value:= 0;
end;

procedure TIQCenterLog.FormActivate(Sender: TObject);
begin
     IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmRT{HTM} );  {IQMS.Common.HelpHook.pas}
end;

{ TODO -oGPatil -cWebConvert : TNavigateButton is not present in UniGui
procedure TIQCenterLog.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end; }

procedure TIQCenterLog.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TIQCenterLog.wwDBComboDlgWorkCenterCustomDlg(Sender: TObject);
begin
  ReplaceID( QryMachLogWORK_CENTER_ID, QryMachLogEQNO, PkWorkCenter )
end;

procedure TIQCenterLog.wwDBComboDlgMfgCustomDlg(Sender: TObject);
begin
   ReplaceID( QryMachLogSTANDARD_ID, QryMachLogMFGNO, PkMfgNo );
end;

{ TODO -oGPatil -cWebConvert : TNavigateButton is not present in UniGui
procedure TIQCenterLog.navMachLogBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    RefreshDataSetByID( QryMachLog );
    ABORT;
  end;
end;       }

procedure TIQCenterLog.IQNotifyMessage(var Msg: TMessage);
begin
end;

procedure TIQCenterLog.pgctrlDetailsChange(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : TIQWebUDEmbeddedForm is not present in UniGui
 IQUDEmbeddedForm1.Active:= (pgctrlDetails.ActivePage = tabUDForm);   }
end;

end.
