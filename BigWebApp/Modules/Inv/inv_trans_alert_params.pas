unit inv_trans_alert_params;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
//  Mask,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  uniPageControl;

type
  TFrmInvTransAlertParams = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    TabSheet2: TUniTabSheet;
    QryInvTransParams: TFDQuery;
    SrcInvTransParams: TDataSource;
    QryInvTransParamsTIME_INC_MINUTES: TBCDField;
    QryInvTransParamsTIME_INC_POINTS: TBCDField;
    QryInvTransParamsPICK_TICKET_PRIORITY: TBCDField;
    QryInvTransParamsRECEIVING_PRIORITY: TBCDField;
    QryInvTransParamsMAT_STAGING_PRIORITY: TBCDField;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    Splitter1: TUniSplitter;
    Panel6: TUniPanel;
    Panel7: TUniPanel;
    Splitter2: TUniSplitter;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    DBEdit4: TUniDBEdit;
    DBEdit5: TUniDBEdit;
    Label8: TUniLabel;
    Label9: TUniLabel;
    Label10: TUniLabel;
    Label11: TUniLabel;
    DBEdit3: TUniDBEdit;
    DBEdit6: TUniDBEdit;
    DBEdit7: TUniDBEdit;
    UpdateSQLInvTransParams: TFDUpdateSQL;
    QryInvTransParamsID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure QryInvTransParamsBeforePost(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal: Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

{ TFrmInvTransAlertParams }

class function TFrmInvTransAlertParams.DoShowModal: Boolean;
var
  frm: TFrmInvTransAlertParams;
begin
  frm := TFrmInvTransAlertParams.Create(uniGUIApplication.UniApplication);
  Result:= (frm.ShowModal = mrOK);
end;

procedure TFrmInvTransAlertParams.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( True, self );
  IQRegFormRead(self, [ self ]);
  PageControl1.ActivePageIndex:= 0;
end;

procedure TFrmInvTransAlertParams.ApplyUpdates(DataSet: TDataSet);
begin
//  IQApplyUpdateToTable(DataSet);
end;

procedure TFrmInvTransAlertParams.btnOKClick(Sender: TObject);
begin
  if QryInvTransParams.State in [dsInsert, dsEdit] then
     QryInvTransParams.Post;
  ModalResult:= mrOK;
end;

procedure TFrmInvTransAlertParams.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;


procedure TFrmInvTransAlertParams.QryInvTransParamsBeforePost(
  DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'inv_trans_params');
  // IQAssert( QryInvTransParamsMED_PRIORITY.asFloat < QryInvTransParamsHIGH_PRIORITY.asFloat, 'Invalid Medium/High priority thresholds - operation aborted');
end;


end.
