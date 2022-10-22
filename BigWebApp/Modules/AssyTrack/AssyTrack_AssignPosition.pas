unit AssyTrack_AssignPosition;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Mask,
  Vcl.wwDataInspector,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.SecurityRegister,
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
  uniRadioButton,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, Vcl.ComCtrls, Vcl.Grids;

type
  TFrmAssyTrackAssignPosition = class(TUniForm)
    SrcProcess: TDataSource;
    QryProcess: TFDQuery;
    QryProcessID: TBCDField;
    QryProcessSNDOP_ID: TBCDField;
    QryProcessSEQ: TBCDField;
    QryProcessWORKORDER_ID: TBCDField;
    QryProcessPARTNO_ID: TBCDField;
    QryProcessWORK_CENTER_ID: TBCDField;
    QryProcessOPNO: TStringField;
    QryProcessOPDESC: TStringField;
    QryProcessEQNO: TStringField;
    pnlTop01: TUniPanel;
    Panel3: TUniPanel;
    Bevel1: TUniPanel;
    Panel2: TUniPanel;
    Panel1: TUniPanel;
    rbAddBottom: TUniRadioButton;
    rbInsert: TUniRadioButton;
    ePos: TUniEdit;
    Panel4: TUniPanel;
    Bevel2: TUniPanel;
    Panel5: TUniPanel;
    btnOK: TUniButton;
    Cancel: TUniButton;
    QryProcessDispatch_To_Eqno: TStringField;
    SR: TIQWebSecurityRegister;
    UpDown1: TUpDown;
    wwDataInspector1: TwwDataInspector;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryProcessBeforeOpen(DataSet: TDataSet);
    procedure QryProcessCalcFields(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FSndop_Dispatch_ID: Real;
    FWork_Center_ID   : Real;
    procedure SetSndop_Dispatch_ID(const Value: Real);
    procedure SetWork_Center_ID(const Value: Real);
  public
    { Public declarations }
    property Sndop_Dispatch_ID : Real write SetSndop_Dispatch_ID;
    property Work_Center_ID : Real write SetWork_Center_ID;
    class function DoShowModal(ASndop_Dispatch_ID, AWork_Center_ID: Real; var ASeq: Real ): Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
  { TODO : IQSecIns not yet converted }
 // IQSecIns;

{ TFrmAssyTrackAssignPosition }

class function TFrmAssyTrackAssignPosition.DoShowModal(ASndop_Dispatch_ID, AWork_Center_ID: Real; var ASeq: Real): Boolean;
var
  LFrmAssyTrackAssignPosition : TFrmAssyTrackAssignPosition;
begin
  LFrmAssyTrackAssignPosition := TFrmAssyTrackAssignPosition.Create( UniGUIApplication.UniApplication);
  with LFrmAssyTrackAssignPosition do
  begin
    Sndop_Dispatch_ID := ASndop_Dispatch_ID;
    Work_Center_ID := AWork_Center_ID;
    Result:= ShowModal = mrOK;
    if Result then
    begin
      if rbAddBottom.Checked then
         ASeq:= 999
      else
      { TODO : TUpDown not converted yet }
        // ASeq:= UpDown1.Position;
    end;
  end;
end;

procedure TFrmAssyTrackAssignPosition.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

procedure TFrmAssyTrackAssignPosition.QryProcessBeforeOpen(DataSet: TDataSet);
begin
  //with TFDQuery( DataSet ) do
  //  ParamByName('sndop_dispatch_id').Value := FSndop_Dispatch_ID;
  AssignQueryParamValue(DataSet, 'sndop_dispatch_id', FSndop_Dispatch_ID );
end;

procedure TFrmAssyTrackAssignPosition.QryProcessCalcFields(DataSet: TDataSet);
begin
  QryProcessDispatch_To_Eqno.asString:= SelectValueByID('eqno', 'work_center', FWork_Center_ID);
end;

procedure TFrmAssyTrackAssignPosition.SetSndop_Dispatch_ID(const Value: Real);
begin
  FSndop_Dispatch_ID := Value;
end;

procedure TFrmAssyTrackAssignPosition.SetWork_Center_ID(const Value: Real);
begin
  FWork_Center_ID := Value;
end;

procedure TFrmAssyTrackAssignPosition.btnOKClick(Sender: TObject);
begin
  ModalResult:= mrOK;
end;

procedure TFrmAssyTrackAssignPosition.FormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead(self, [ self ]);
  { TODO : IQSecIns not yet converted }
 // EnsureSecurityInspectorOnTopOf( self );
end;

end.
