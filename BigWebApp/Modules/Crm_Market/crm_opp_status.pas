unit crm_opp_status;

{This unit is the Opportunity Status list, called by Opportunity Central}

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Mask,
  FireDAC.Comp.Client,
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
  FireDAC.Comp.DataSet,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, IQUniGrid, uniGUIFrame;

type
  TFrmOppStatus = class(TUniForm)
    PnlToolbar: TUniPanel;
    PnlMain: TUniPanel;
    PnlGrid: TUniPanel;
    Bevel1: TUniPanel;
    SrcOppStatus: TDataSource;
    TblOppStatus: TFDTable;
    TblOppStatusID: TBCDField;
    TblOppStatusCODE: TStringField;
    TblOppStatusDESCRIPTION: TStringField;
    TblOppStatusIS_CLOSED: TStringField;
    Grid: TIQUniGridControl;
    NavMain: TUniDBNavigator;
    cmbType: TUniDBComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure TblOppStatusBeforePost(DataSet: TDataSet);
    procedure TblOppStatusNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure DoOppStatus(AOwner: TComponent);

var
  FrmOppStatus: TFrmOppStatus;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  crm_rscstr;

procedure DoOppStatus(AOwner: TComponent);
begin
  TFrmOppStatus.Create(AOwner).Show;
end;

procedure TFrmOppStatus.FormCreate(Sender: TObject);
begin
  IQMS.Common.Controls.CenterForm(Self); // IQMS.Common.Controls.pas; default position
  TblOppStatus.Open;
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, Grid]);
  cmbType.Visible := FALSE;
end;

procedure TFrmOppStatus.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self, Grid]);
  Action := caFree;
end;

procedure TFrmOppStatus.TblOppStatusBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
end;

procedure TFrmOppStatus.TblOppStatusNewRecord(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
  TblOppStatusIS_CLOSED.AsString := 'N'; // default value is "open, not closed"
end;

end.
