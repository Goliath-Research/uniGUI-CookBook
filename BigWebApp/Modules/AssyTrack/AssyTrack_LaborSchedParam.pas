unit AssyTrack_LaborSchedParam;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.wwDataInspector,
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
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, Vcl.Grids;

type
  TFrmAssyTrackLaborSchedParam = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    wwDataInspector1: TwwDataInspector;
    wwDataSource1: TDataSource;
    wwTable1: TFDTable;
    wwTable1ASSY1_TA_MESG_DISP_TIME: TBCDField;
    wwTable1ASSY1_PRINT_SCHED_ON_LOGIN: TStringField;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //constructor Create(AOwner: TComponent); override;
    class function DoShowModal(AOwner: TComponent): Boolean;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

{ TFrmAssyTrackLaborSchedParam }
class function TFrmAssyTrackLaborSchedParam.DoShowModal(AOwner: TComponent): Boolean;
Var
  LFrmAssyTrackLaborSchedParam : TFrmAssyTrackLaborSchedParam;
begin
  LFrmAssyTrackLaborSchedParam := TFrmAssyTrackLaborSchedParam(UniGUIApplication.UniApplication);
    Result:= LFrmAssyTrackLaborSchedParam.ShowModal = mrOK;
end;

//constructor TFrmAssyTrackLaborSchedParam.Create(AOwner: TComponent);
//begin
//  inherited;
//  IQSetTAblesActive( TRUE, self );
//  IQRegFormRead(self, [self]);
//end;

procedure TFrmAssyTrackLaborSchedParam.btnOKClick(Sender: TObject);
begin
  if wwTable1.State in [dsEdit, dsInsert] then
     wwTable1.Post;
  ModalResult:= mrOK;
end;


procedure TFrmAssyTrackLaborSchedParam.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmAssyTrackLaborSchedParam.UniFormCreate(Sender: TObject);
begin
  inherited;
  IQSetTAblesActive( TRUE, self );
  IQRegFormRead(self, [self]);
end;

end.
