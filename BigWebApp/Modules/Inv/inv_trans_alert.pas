unit inv_trans_alert;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  IQMS.WebVcl.About,
  System.SyncObjs,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.Jump,
  IQMS.WebVcl.SecurityRegister,
  Mask,
  Vcl.wwDataInspector,
  IQMS.Common.UserMessages,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  System.ImageList,
  uniGUIBaseClasses,
  uniImageList,
  uniGUIClasses,
  uniTreeView,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniTimer,
  uniLabel, uniMainMenu;

type
  TFrmInvTransAlert = class(TUniForm)
    pnlCarrier: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Report1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrintSetup1: TUniMenuItem;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    tmRefresh: TUniTimer;
    SR: TIQWebSecurityRegister;
    pnlLeft01: TUniPanel;
    Splitter1: TUniSplitter;
    TV: TUniTreeView;
    Panel4: TUniPanel;
    Panel14: TUniPanel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    ImageList1: TUniImageList;
    Options1: TUniMenuItem;
    PrioritySetup1: TUniMenuItem;
    ransactionTroubleTypes1: TUniMenuItem;
    Contents1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmRefreshTimer(Sender: TObject);
    procedure TVClick(Sender: TObject);
    procedure PrioritySetup1Click(Sender: TObject);
    procedure ransactionTroubleTypes1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    CS_TransAlert: TCriticalSection;
    FRefreshTime: Real;
    FChild: TUniForm;

    procedure CloseChild;
    procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;
    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
    procedure RefreshTransAlert;
    procedure CheckAccess(AFormName: string);
    procedure DispatchTVClick(AIndex: Integer);
  public
    { Public declarations }
    class procedure DoShow;
    procedure EnableTimer(Value: Boolean = True);
  end;

implementation

{$R *.dfm}

uses
  inv_trans_alert_base,
  inv_trans_alert_params,
  inv_trans_share,
  inv_trans_trouble,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
{ TODO -oGPatil -cWebConvert : Dependency
  inv_trans_alert_history,
  inv_trans_alert_pending,
  IQSecIns,  }
  IQMS.WebVcl.ResourceStrings,
  IQMS.Common.HelpHook;


const
  {These are TreeView absolute indexes that we go by when user clicks on the those nodes}
  cPENDING        = 0;
  // cPICK_TICKET    = 1;
  // cRECEIVING      = 2;
  cHISTORY        = 1;

{ TFrmInvTransAlert }
class procedure TFrmInvTransAlert.DoShow;
var
  LFrmInvTransAlert : TFrmInvTransAlert;
begin
  LFrmInvTransAlert := TFrmInvTransAlert.Create(UniGUIApplication.UniApplication);
  LFrmInvTransAlert.Show;
end;

procedure TFrmInvTransAlert.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmWMS{CHM}, iqhtmWMS{HTM} );
end;

procedure TFrmInvTransAlert.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  EnableTimer(False);
  CloseChild;
  IQRegFormWrite(self, [ self, pnlLeft01 ]);
end;


procedure TFrmInvTransAlert.FormDestroy(Sender: TObject);
begin
  CS_TransAlert.Free;
  CloseChild;
end;

procedure TFrmInvTransAlert.CheckAccess(AFormName: string);
begin
  if not SR.Enabled[ UpperCase(AFormName) ] then
     raise TInsufficientRights.CreateFmt( IQMS.WebVcl.ResourceStrings.cTXT0000180 {'Insufficient rights.  Access denied. [%s]'}, [ AFormName ]);
end;

procedure TFrmInvTransAlert.CloseChild;
begin
 if Assigned(FChild) then
 try
   {this will trigger IQSearch (if any) on the form to write to the registry}
   IQSetTablesActive( FALSE, FChild );
   {Switch parents back to avoid "Priveledged Instruction" error due to Delphi gets confused because owner is not the parent.
    Note we typecast regardless of the actual type just to get to pnlCarrier}
   TFrmInvTransAlertBase(FChild).pnlCarrier.Parent:= FChild;
   FChild.Close;
   FChild.Release;
 finally
   FChild:= NIL;
 end;
end;


procedure TFrmInvTransAlert.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( HelpContext );
end;

procedure TFrmInvTransAlert.IQAfterShowMessage(var Msg: TMessage);
var
  AIndex: Integer;
begin
  AIndex:= cPENDING;
  IQRegIntegerScalarRead( self, 'ModuleIndex', AIndex );

  if AIndex >= 0 then
     DispatchTVClick( AIndex );
end;

procedure TFrmInvTransAlert.IQNotify(var Msg: TMessage);
begin
  case Msg.WParam of
    0: {future use};
    1: CloseChild;
(* TODO -oGPatil -cWebConvert : Dependency
    2: RefreshSecurityInspectorOnForm( self );    {if SecurityInspector is visible - reload it so we could see all the components on the child form}
*)
  end;
end;

procedure TFrmInvTransAlert.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmInvTransAlert.PrintSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute
end;

procedure TFrmInvTransAlert.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmInvTransAlert.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TFrmInvTransAlert.EnableTimer(Value: Boolean = True);
begin
  tmRefresh.Enabled:= Value;
end;

procedure TFrmInvTransAlert.RefreshTransAlert;
begin
  CS_TransAlert.Acquire;
  try
    if Assigned(FChild) then
       TFrmInvTransAlertBase(FChild).RefreshDataSets;
  finally
     CS_TransAlert.Release;
  end;
end;

procedure TFrmInvTransAlert.tmRefreshTimer(Sender: TObject);
begin
  EnableTimer(False);
  try
    RefreshTransAlert;
  finally
    EnableTimer;
  end;
end;

procedure TFrmInvTransAlert.TVClick(Sender: TObject);
begin
  if Assigned( TV.Selected ) then
     DispatchTVClick( TV.Selected.AbsoluteIndex );
end;

procedure TFrmInvTransAlert.UniFormCreate(Sender: TObject);
var
  ADate: TDateTime;
begin

  CS_TransAlert:= TCriticalSection.Create;

  IQSetTablesActive( TRUE, self );

  IQRegFormRead(self, [ self, pnlLeft01 ]);

  // timer!
  FRefreshTime:= SelectValueAsFloat('select rt_refresh_time from params') * 1000;
  if FRefreshTime >= 5000 then
  begin
    tmRefresh.Interval:= Trunc(FRefreshTime);
    EnableTimer;
  end;

  PostMessage( Handle, iq_AfterShowMessage, 0, 0 );
end;

procedure TFrmInvTransAlert.DispatchTVClick(AIndex: Integer);
begin
  CloseChild;
(* TODO -oGPatil -cWebConvert : Dependency inv_trans_alert_pending
  case AIndex of
    cPENDING    :   begin
                      CheckAccess( 'FrmInvTransAlertPending' );
                      FChild:= TFrmInvTransAlertPending.Create(self);           {inv_trans_alert_pending.pas}
                      TFrmInvTransAlertPending(FChild).pnlCarrier.Parent:= self.pnlCarrier;
                    end;

    cHISTORY    :   begin
                      CheckAccess( 'FrmInvTransAlertHistory' );
                      FChild:= TFrmInvTransAlertHistory.Create(self);            {inv_trans_alert_history.pas}
                      TFrmInvTransAlertHistory(FChild).pnlCarrier.Parent:= self.pnlCarrier;
                    end;

 // cPICK_TICKET:   begin
 //                   CheckAccess( 'FrmInvTransAlertPickTicket' );
 //                   FChild:= TFrmInvTransAlertPickTicket.Create(self);        {inv_trans_alert_pick_ticket.pas}
 //                   TFrmInvTransAlertPickTicket(FChild).pnlCarrier.Parent:= self.pnlCarrier;
 //                 end;
 //
 // cRECEIVING  :   begin
 //                   CheckAccess( 'TFrmInvTransAlertReceive' );
 //                   FChild:= TFrmInvTransAlertReceive.Create(self);           {inv_trans_alert_receive.pas}
 //                   TFrmInvTransAlertReceive(FChild).pnlCarrier.Parent:= self.pnlCarrier;
 //                 end;
  end;

  {Refresh security register}
  SR.Refresh;    *)

  {Refresh SecurityInspector}
  PostMessage( Handle, iq_Notify, 2, 0);

  IQRegIntegerScalarWrite( self, 'ModuleIndex', AIndex );
end;

procedure TFrmInvTransAlert.PrioritySetup1Click(Sender: TObject);
begin
  TFrmInvTransAlertParams.DoShowModal;  // inv_trans_alert_params.pas
end;


procedure TFrmInvTransAlert.ransactionTroubleTypes1Click(Sender: TObject);
begin
  TFrmInvTransTrouble.DoShow;  // inv_trans_trouble
end;

end.
