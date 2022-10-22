unit inv_trans_exec_base;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Mask,
  Data.DB,
  inv_trans_share,
  Vcl.Buttons,
  //IQMS.Common.UserMessages,
  Vcl.Menus,
  IQMS.WebVcl.About,
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
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniMainMenu, uniDateTimePicker, uniDBDateTimePicker, uniComboBox,
  uniDBComboBox;

type
  TFrmInvTransExecBase = class(TUniForm)
    pnlCarrier: TUniPanel;
    pnlLeft01: TUniPanel;
    pnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    pnlLeft02: TUniPanel;
    Splitter2: TUniSplitter;
    pnlLeftClient02: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    lblUnit: TUniLabel;
    lblExtDesc: TUniLabel;
    lblReason: TUniLabel;
    Label6: TUniLabel;
    lblTranDate: TUniLabel;
    lblTranDescrip: TUniLabel;
    dbeItemNo: TUniDBEdit;
    dbeDescription: TUniDBEdit;
    dbeExtDescription: TUniDBEdit;
    dbeClass: TUniDBEdit;
    dbeRev: TUniDBEdit;
    dbeUnit: TUniDBEdit;
    wwComboTransCode: TUniDBLookupComboBox;
    wwTmPkTranDate: TUniDBDateTimePicker;
    pnlBottom01: TUniPanel;
    pnlBottomRight01: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    pnlCClient02: TUniPanel;
    edReason: TUniEdit;
    edTranDescrip: TUniEdit;
    wwQryTransCode: TFDQuery;
    wwQryTransCodeCODE: TStringField;
    wwQryTransCodeDESCRIP: TStringField;
    wwQryTransCodeEPLANT_ID: TBCDField;
    wwQryTransCodeID: TBCDField;
    SrcTransAlert: TDataSource;
    QryTransAlert: TFDQuery;
    QryTransAlertID: TBCDField;
    QryTransAlertQTY: TFMTBCDField;
    QryTransAlertSTART_TIME: TDateTimeField;
    QryTransAlertTRANS_IN_OUT: TStringField;
    QryTransAlertALERT_DESCRIP: TStringField;
    QryTransAlertZONE_CODE: TStringField;
    QryTransAlertZONE_DESCRIP: TStringField;
    QryTransAlertITEMNO: TStringField;
    QryTransAlertDESCRIP: TStringField;
    QryTransAlertDESCRIP2: TStringField;
    QryTransAlertREV: TStringField;
    QryTransAlertCLASS: TStringField;
    QryTransAlertWORKORDER_ID: TBCDField;
    QryTransAlertSNDOP_DISPATCH_ID: TBCDField;
    QryTransAlertLOCATIONS_ID: TBCDField;
    QryTransAlertINV_ZONE_ID: TBCDField;
    QryTransAlertARINVT_ID: TBCDField;
    QryTransAlertSOURCE_MODULE: TStringField;
    QryTransAlertLOC_DESC: TStringField;
    QryTransAlertSOURCE_ID: TBCDField;
    pnlTop01: TUniPanel;
    sbtnTransPlan: TUniSpeedButton;
    QryTransAlertUNIT: TStringField;
    MainMenu1: TUniMainMenu;
    IQAbout1: TIQWebAbout;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Label8: TUniLabel;
    dbeTransAlertID: TUniDBEdit;
    Label9: TUniLabel;
    dbeLocDesc: TUniDBEdit;
    QryTransAlertPK_UNIT_TYPE_DISP: TStringField;
    Label10: TUniLabel;
    dbePkUnitType: TUniDBEdit;
    QryTransAlertSTANDARD_ID: TFMTBCDField;
    QryTransAlertTRANS_PRIORITY: TBCDField;
    procedure wwComboTransCodeChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryTransAlertBeforeOpen(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure sbtnTransPlanClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    //procedure IQNotify( var Msg: TMessage ); message iq_Notify;
    procedure DeleteTransAlert;
    procedure SetCargo(const Value: TInvTransPlanCargo);

  protected
    FCargo: TInvTransPlanCargo;
    FSub_Batch: Real;  // result of the transaction
    procedure GenerateTransactionLocationsPlan; virtual;
    procedure StartUp; virtual;

    procedure Validate; virtual;
    procedure PrepareAndExecute; virtual;
    procedure ArchiveTransAlert;

    procedure ExecuteShell;
  public
    { Public declarations }
    class function DoShowModal(ACargo: TInvTransPlanCargo): Boolean;
    property Cargo: TInvTransPlanCargo read FCargo write SetCargo;
  end;

implementation

{$R *.dfm}

uses
{ TODO -ohphadke : Dependency }
  //inv_trans_plan_base,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;

const
  constGenerateLocationsPlan = 1;


class function TFrmInvTransExecBase.DoShowModal(ACargo: TInvTransPlanCargo ): Boolean;  // inv_trans_share.pas
Var
LFrmInvTransExecBase : TFrmInvTransExecBase;
begin
  LFrmInvTransExecBase := TFrmInvTransExecBase.create(UniGUIApplication.UniApplication);
  with LFrmInvTransExecBase do
  begin
    FCargo:= ACargo;
    Result:= ShowModal = mrOK;
  end;
end;

procedure TFrmInvTransExecBase.Exit1Click(Sender: TObject);
begin
  Close;
end;



procedure TFrmInvTransExecBase.SetCargo(const Value: TInvTransPlanCargo);
begin

end;

procedure TFrmInvTransExecBase.StartUp;
begin
  IQSetTablesActive(TRUE, self );
  IQRegFormRead(self, [ self, pnlLeft01, pnlLeft02 ]);
  wwTmPkTranDate.DateTime:= SelectValueAsFloat('select sysdate from dual');
end;

procedure TFrmInvTransExecBase.UniFormCreate(Sender: TObject);
begin
  inherited;
  StartUp;
  //PostMessage( self.Handle, iq_Notify, constGenerateLocationsPlan, 0 );
end;

procedure TFrmInvTransExecBase.Validate;
begin
end;

procedure TFrmInvTransExecBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self, pnlLeft01, pnlLeft02 ])
end;


procedure TFrmInvTransExecBase.FormDestroy(Sender: TObject);
begin
  ExecuteCommandFmt('delete from inv_trans_plan where id = %f', [ FCargo.InvTransPlan_ID ]);
end;

{ TODO -ohphadke : Dependency }
//procedure TFrmInvTransExecBase.IQNotify(var Msg: TMessage);
//begin
//  case Msg.WParam of
//    constGenerateLocationsPlan: GenerateTransactionLocationsPlan;
//  end;
//end;

procedure TFrmInvTransExecBase.PrepareAndExecute;
begin
end;

procedure TFrmInvTransExecBase.QryTransAlertBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
  begin
    ParamByName('trans_alert_id').Value := FCargo.Source_ID;
  end;
end;

procedure TFrmInvTransExecBase.wwComboTransCodeChange(Sender: TObject);
begin
  if wwComboTransCode.Text = '' then
     edTranDescrip.Text:= ''
  else
     edTranDescrip.Text:= wwQryTransCodeDESCRIP.asString;
end;

procedure TFrmInvTransExecBase.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmInvTransExecBase.btnOKClick(Sender: TObject);
begin
  ExecuteShell;
  ModalResult:= mrOK;
end;


procedure TFrmInvTransExecBase.ExecuteShell;
var
  ADB: TFDCustomConnection;
begin
  Validate;

  ADB:= FDManager.FindConnection('IQFD');
  ADB.StartTransaction;
  try
    // execute
    PrepareAndExecute;

    // 06-05-2013 we used to archive and delete from trans_alert on the front end
    // but since we added check to delete fulfilled trans_alert in inventory_trans
    // we no longer need to do that on the front end
    //
    // archive
    // ArchiveTransAlert;
    //
    // delete
    // DeleteTransAlert;
    ADB.Commit;
  finally
    if ADB.InTransaction then
       ADB.Rollback;
  end;
end;


procedure TFrmInvTransExecBase.GenerateTransactionLocationsPlan;
begin
  { populate
     * inv_trans_plan
       |
       inv_trans_item
       |
       inv_trans_detail -> inv_trans_locations -> inv_trans_loc_detail

     note inv_trans_loc_detail is populated based on available inv_trans_locations
  }

  //FCargo.InvTransPlan_ID:= TFrmInvTransPlanBase.GeneratePlan( FCargo );   // inv_trans_plan_base.pas
end;

procedure TFrmInvTransExecBase.sbtnTransPlanClick(Sender: TObject);
begin
{ TODO -ohphadke : Dependency }
  //TFrmInvTransPlanBase.DoShow( self, FCargo );                             // inv_trans_plan_base.pas
end;

procedure TFrmInvTransExecBase.ArchiveTransAlert;
begin
  ExecuteCommandFmt('declare                                                     '+
            '  v_trans_alert_id number:= %f;                             '+
            '  v_sub_batch      number:= %f;                             '+
            'begin                                                       '+
            '  trans_alert_share.archive_trans_alert( v_trans_alert_id,  '+
            '                                         v_sub_batch );     '+
            'end;                                                        ',
            [ QryTransAlertID.asFloat,
              FSub_Batch ]);
end;

procedure TFrmInvTransExecBase.DeleteTransAlert;
begin
  ExecuteCommandFmt('delete from trans_alert where id = %f', [ QryTransAlertID.asFloat ]);
end;

end.
