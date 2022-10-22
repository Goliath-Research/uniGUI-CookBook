unit crm_ccmain;

{ ---------------------------------------------------------------------------- }
{ ** Call Center main form ** }
{ This unit handles caller ID and displays the caller ID popups }
{ ---------------------------------------------------------------------------- }

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Menus,
  Vcl.Buttons,
  IQMS.WebVcl.About,
  Data.DB,
  Vcl.DdeMan,
  crmtrayico,
  crm_ccconst,
  IQMS.Common.JumpConstants,
  Mask,
  IQMS_CallerID_TLB,
  IQMS.WebVcl.Search,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  MainModule,
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
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmCRMCCMain = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    PnlCarrier: TUniPanel;
    PnlPageControl: TUniPanel;
    Bevel1: TUniPanel;
    IQAbout1: TIQWebAbout;
    System: TDdeServerConv;
    PnlMain: TUniPanel;
    PMain: TUniPopupMenu;
    Show1: TUniMenuItem;
    Exit2: TUniMenuItem;
    CustomTelephoneList1: TUniMenuItem;
    N1: TUniMenuItem;
    Panel5: TUniPanel;
    PnlButtonsInner: TUniPanel;
    sbtnHide: TUniButton;
    sbtnExit: TUniButton;
    PnlGrid: TUniPanel;
    SrcCallHist: TDataSource;
    QryCallHist: TFDQuery;
    PnlToolbar: TUniPanel;
    Bevel3: TUniPanel;
    NavMain: TUniDBNavigator;
    QryCallHistID: TBCDField;
    QryCallHistDATETIME_STAMP: TDateTimeField;
    QryCallHistPHONE_NUMBER: TStringField;
    QryCallHistCALLERNAME: TStringField;
    QryCallHistDIRECTION: TStringField;
    QryCallHistUSERID: TStringField;
    QryCallHistPR_EMP_ID: TBCDField;
    GridCallHistory: TIQUniGridControl;
    sbtnCustomTelephoneList: TUniSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SystemExecuteMacro(Sender: TObject; Msg: TStrings);
    procedure DoTrayOnDblClick(Sender: TObject);
    procedure DoTrayOnClick(Sender: TObject);
    procedure sbtnHideClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sbtnExitClick(Sender: TObject);
    procedure Show1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure CustomTelephoneList1Click(Sender: TObject);
    procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure DoPreventEdits(DataSet: TDataSet);
    procedure DoOnCallerID(ASender: TObject; const displayName: WideString;
      const telephoneNumber: WideString);
    procedure QryCallHistUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
      AOptions: TFDUpdateRowOptions);
    procedure QryCallHistBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    TrayNotifyIcon: TTrayNotifyIcon;
    FForceShutDown: Boolean;
    FCallerID: TCallerID;
    FShown: Boolean;
    procedure WMSYSCOMMAND(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
    procedure IQAfterShowMessage(var Msg: TMessage);
      message iq_AfterShowMessage;
    procedure SetCaption;
    procedure AfterAddCallHistory(const ACRMCallHistID: Real);

    procedure OpenTAPI;
    procedure CloseTAPI;
    procedure PerformShutDown;
  public
    { Public declarations }
    destructor Destroy; override;
    class function DoShow(AOwner: TComponent): Boolean;
    class procedure ShutDown;
  end;

procedure DoCallCenter(AOwner: TComponent);

// var
// FrmCRMCCMain: TFrmCRMCCMain;

implementation

{$R *.DFM}


uses
  crm_ccid,
  crm_ccud,
  crm_rscstr,
  crm_settings,
  IQMS.Common.ApplicationSet,
  IQMS.Common.Controls,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  crm_ccshare;

procedure DoCallCenter(AOwner: TComponent);
begin
  TFrmCRMCCMain.DoShow(AOwner);
end;

class function TFrmCRMCCMain.DoShow(AOwner: TComponent): Boolean;
var
  AForm: TUniForm;
begin
  AForm := IQMS.Common.Controls.FindFormByClassType(Self);
  if not Assigned(AForm) then
    AForm := Self.Create(AOwner);
  AForm.Show;
  Result := True;
end;

class procedure TFrmCRMCCMain.ShutDown;
var
  AForm: TUniForm;
begin
  AForm := IQMS.Common.Controls.FindFormByClassType(Self);
  if Assigned(AForm) then
    TFrmCRMCCMain(AForm).PerformShutDown;
end;

procedure TFrmCRMCCMain.FormCreate(Sender: TObject);
var
  AError: string;
begin
  try
    FForceShutDown := FALSE;
    AssignApplicationSettings(Application); // IQMS.Common.ApplicationSet.pas
    SetCaption;
    RefreshDataSetByID(QryCallHist);
    TrayNotifyIcon := TTrayNotifyIcon.Create(Self);
    TrayNotifyIcon.Name := 'TrayNotifyIcon';
    TrayNotifyIcon.OnClick := DoTrayOnClick;
    TrayNotifyIcon.OnDblClick := DoTrayOnDblClick;
    TrayNotifyIcon.HideTask := True;
    TrayNotifyIcon.Hint := crm_rscstr.cTXT0001508; // 'CRM Call Center';
    TrayNotifyIcon.Icon.Assign(Self.Icon);
    TrayNotifyIcon.IconVisible := True;
    TrayNotifyIcon.PopupMenu := PMain;

    OpenTAPI;

    CenterForm(Self);
    IQMS.Common.Controls.ResizeNavBar(NavMain);
  except
    on E: Exception do
      begin
        FForceShutDown := True;
        IQError(Format
          ('Encountered error while initializing the CRM Call Center:'#13#13'%s',
          [E.Message]));
        PostMessage(Handle, WM_COMMAND, Exit1.Command, 0);
      end;
  end;

end;

procedure TFrmCRMCCMain.FormShow(Sender: TObject);
begin
  IQRegFormRead(Self, [Self]);
  PostMessage(Handle, iq_AfterShowMessage, 0, 0);
end;

procedure TFrmCRMCCMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  IQRegFormWrite(Self, [Self]);
  CloseTAPI;
  if (TrayNotifyIcon <> nil) and Assigned(TrayNotifyIcon) then
    FreeAndNil(TrayNotifyIcon);
end;

procedure TFrmCRMCCMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not FForceShutDown then
    // crm_rscstr.cTXT0001507 = 'Close CRM Call Center?'
    CanClose := IQConfirmYN(crm_rscstr.cTXT0001507)
  else
    CanClose := True;
end;

destructor TFrmCRMCCMain.Destroy;
begin
  CloseTAPI;

  if (TrayNotifyIcon <> nil) and Assigned(TrayNotifyIcon) then
    FreeAndNil(TrayNotifyIcon);

  inherited Destroy;
end;

{ ---------------------------------------------------------------------------- }
{ Message Handlers }
{ ---------------------------------------------------------------------------- }

procedure TFrmCRMCCMain.IQAfterShowMessage(var Msg: TMessage);
begin
  if not FShown then
    Hide;
  FShown := True;
end;

procedure TFrmCRMCCMain.WMSYSCOMMAND(var Msg: TWMSysCommand);
begin
  if Msg.CmdType and $FFF0 = SC_MINIMIZE then
    Hide
  else
    inherited;
end;

{ ---------------------------------------------------------------------------- }

procedure TFrmCRMCCMain.PerformShutDown;
begin
  FForceShutDown := True;
  Close;
end;

procedure TFrmCRMCCMain.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

{ DDE }
procedure TFrmCRMCCMain.SystemExecuteMacro(Sender: TObject; Msg: TStrings);
var
  AMsg, AMsgEx, ACallerNo, ACallerName, ACalledNo: string;
  i1, i2: Integer;
  ACallerRec: TCallerRec;
begin
  // Users must configure their 3rd party driver application as follows:
  // Action Name:  CRM Call Center (call it anything you want, really)
  // Type:  DDE Execute
  // Triggering Event:  Call Ringing.  NOTE: Not on connection.
  // Caller ID Option:  Any Number
  // Appearance:  Any
  // Phone State:  "If not talking"
  // Application Name:  CRM_CALLCNTR
  // Application Topic:  SYSTEM
  // DDE Execute String Options
  // CALLERID[&P^&N^&E]
  // &P
  // Result trigger:
  // if {Call Ringing} with CallerID, then {CRM Call Center}

  // Legend:
  // &P = Caller Telephone Number
  // &N = Caller Name
  // &E = Called Telephone Number

  AMsg := Trim(Msg.Text);

  i1 := Pos('[', AMsg) + 1;
  i2 := Pos(']', AMsg) - 1;
  AMsgEx := Trim(Copy(AMsg, i1, i2 - i1));

  if Copy(AMsg, 1, 8) = 'CALLERID' then
    begin
      ACallerNo := Trim(GetToken(AMsgEx, '^', 1));
      ACallerName := Trim(GetToken(AMsgEx, '^', 2));
      ACalledNo := Trim(GetToken(AMsgEx, '^', 3));
      if ACallerName = '' then
        ACallerName := crm_rscstr.cTXT0001509; // 'Caller Unknown'
    end
  else
    ACallerNo := Trim(AMsg); // assume we are getting just the number

  // Remove any hyphens
  ACallerNo := StringReplace(ACallerNo, '-', '', [rfReplaceAll, rfIgnoreCase]);
  // Remove any spaces
  ACallerNo := StringReplace(ACallerNo, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  // Remove any parentheses
  ACallerNo := StringReplace(ACallerNo, '(', '', [rfReplaceAll, rfIgnoreCase]);
  ACallerNo := StringReplace(ACallerNo, ')', '', [rfReplaceAll, rfIgnoreCase]);

  DoCallerID(Self, ACallerName, ACallerNo, AfterAddCallHistory); // crm_ccid

end;

procedure TFrmCRMCCMain.OpenTAPI;
begin
  CheckCRMSettingsCreated;

  if CRMSettings.TelephonyProtocolMode = 0 then
    begin
      if not Assigned(FCallerID) then
        begin
          FCallerID := TCallerID.Create(Self);
          FCallerID.OnCallerID := DoOnCallerID;
        end;

      if not FCallerID.RegisterDevice(CRMSettings.TelephonyTAPIDriverName) then
        begin
          // 'Caller ID is inactive. The TAPI/IP protocol, %s, could not
          // be found.  Please select a driver in CRM Parameters.'
          IQWarning(Format(crm_rscstr.cTXT0001502,
            [CRMSettings.TelephonyTAPIDriverName]));
          Exit;
        end;
    end;

  // if not etLine1.Device.Active then
  // // 'There was a problem setting your TAPI/IP driver.  Caller ID is inactive.'
  // IQWarning(crm_rscstr.cTXT0001503 + #13#13 + etLine1.Error.Text);
end;

procedure TFrmCRMCCMain.CloseTAPI;
begin
  if Assigned(FCallerID) then
    FreeAndNil(FCallerID);
end;

procedure TFrmCRMCCMain.DoOnCallerID(ASender: TObject;
  const displayName, telephoneNumber: WideString);
begin
  DoCallerID(Self, displayName, telephoneNumber, AfterAddCallHistory);
  // crm_ccid
end;

procedure TFrmCRMCCMain.DoTrayOnClick(Sender: TObject);
begin
  //
end;

procedure TFrmCRMCCMain.DoTrayOnDblClick(Sender: TObject);
begin
  Show;
  Self.BringToFront;
end;

procedure TFrmCRMCCMain.AfterAddCallHistory(const ACRMCallHistID: Real);
begin
  // Call back procedure - this is called after a call has been added to history
  if ACRMCallHistID > 0 then
    begin
      Reopen(QryCallHist);
      QryCallHist.Locate('ID', ACRMCallHistID, []);
    end;
end;

procedure TFrmCRMCCMain.sbtnHideClick(Sender: TObject);
begin
  Hide;
end;

procedure TFrmCRMCCMain.sbtnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCRMCCMain.SetCaption;
begin
  // cTXT0001733 = 'CRM Call Center [User Name: %s]';
  Self.Caption := Format(crm_rscstr.cTXT0001733,
    [SecurityManager.UserName]);
end;

procedure TFrmCRMCCMain.Show1Click(Sender: TObject);
begin
  Show;
end;

procedure TFrmCRMCCMain.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCRMCCMain.CustomTelephoneList1Click(Sender: TObject);
begin
  DoCustomCallList(Self); // crm_ccud.pas
end;

procedure TFrmCRMCCMain.QryCallHistUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
  AOptions: TFDUpdateRowOptions);
begin
  if ARequest = arUpdate then
    ExecuteCommandParamDataSet(
      'UPDATE crm_callhist'#13 +
      '   SET datetime_stamp = :DATETIME_STAMP,'#13 +
      '       phone_number = :PHONE_NUMBER, callername = :CALLERNAME,'#13 +
      '       direction = :DIRECTION, userid = :USERID,'#13 +
      '       pr_emp_id = :PR_EMP_ID'#13 +
      ' WHERE id = :ID',
      QryCallHist)
  else if ARequest = arInsert then
    ExecuteCommandParamDataSet(
      'INSERT INTO crm_callhist(id,'#13 +
      '                         datetime_stamp,'#13 +
      '                         phone_number,'#13 +
      '                         callername,'#13 +
      '                         direction,'#13 +
      '                         userid,'#13 +
      '                         pr_emp_id)'#13 +
      '    VALUES (:ID, :DATETIME_STAMP, :PHONE_NUMBER, :CALLERNAME,'#13 +
      '            :DIRECTION, :USERID, :PR_EMP_ID)',
      QryCallHist);

  AAction := eaApplied;
end;

procedure TFrmCRMCCMain.NavMainBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
    begin
      RefreshDataSetByID(QryCallHist);
      Abort;
    end;
end;

procedure TFrmCRMCCMain.QryCallHistBeforeDelete(DataSet: TDataSet);
begin
  if QryCallHistID.AsFloat > 0 then
    begin
      ExecuteCommandFmt('DELETE FROM crm_callhist WHERE id = %.0f',
        [QryCallHistID.AsFloat]);
      QryCallHist.Prior;
      RefreshDataSetByID(QryCallHist);
    end;
  Abort;
end;

procedure TFrmCRMCCMain.DoPreventEdits(DataSet: TDataSet);
begin
  // do not allow
  Abort;
end;

end.
