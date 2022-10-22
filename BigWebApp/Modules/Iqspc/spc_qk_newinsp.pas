unit spc_qk_newinsp;

// NOTE:  Do not call any SPC units in this form!  This unit is called directly
// from FAB and other areas.  Any used units must be standard calls.

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TFrmSPCNewQuickInspection = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    SrcSPCInspection: TDataSource;
    TblSPCInspection: TFDTable;
    TblSPCInspectionID: TBCDField;
    TblSPCInspectionNAME: TStringField;
    TblSPCInspectionDESCRIPTION: TStringField;
    TblSPCInspectionSAMPLE_COUNT: TBCDField;
    TblSPCInspectionCREATED: TDateTimeField;
    TblSPCInspectionCREATEDBY: TStringField;
    lblName: TUniLabel;
    dbeName: TUniDBEdit;
    lblDescription: TUniLabel;
    dbeDescription: TUniDBEdit;
    lblSampleCount: TUniLabel;
    wwDBSpinEdit1: TUniDBNumberEdit;
    TblSPCInspectionSOURCE: TStringField;
    TblSPCInspectionSOURCE_ID: TBCDField;
    Panel3: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure TblSPCInspectionBeforePost(DataSet: TDataSet);
    procedure TblSPCInspectionNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FSource: String;
    FSourceID: Real;
    procedure SetSource(const Value: String);
    procedure SetSourceID(const Value: Real);
  public
    { Public declarations }
    property Source: String write SetSource;
    property SourceID: Real write SetSourceID;
  end;

  // NOTE:  The default params are setup for SNDOP.  Do not pass a source id for
  // SNDOP, but do pass a source of 'SNDOP', which will be used when
  // creating samples.
function DoSPCNewQuickInspection(var ASPCInspectionID: Real;
  ASource: String = 'SNDOP'; ASourceID: Real = 0): Boolean;

resourcestring
  cRsc_001 = 'Name is required.  Please enter a name.';



implementation

{$R *.DFM}


uses
  IQMS.Common.DataLib,
  IQMS.Common.Dates,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager;

function DoSPCNewQuickInspection(var ASPCInspectionID: Real;
  ASource: String = 'SNDOP'; ASourceID: Real = 0): Boolean;
var
  FrmSPCNewQuickInspection: TFrmSPCNewQuickInspection;
begin
  FrmSPCNewQuickInspection := TFrmSPCNewQuickInspection.Create(UniGuiApplication.UniApplication);
  FrmSPCNewQuickInspection.Source := ASource;
  FrmSPCNewQuickInspection.SourceID := ASourceID;
  Result := FrmSPCNewQuickInspection.ShowModal = mrOk;
  if Result then
    ASPCInspectionID := FrmSPCNewQuickInspection.TblSPCInspectionID.AsFloat;
//  finally
//      Release;
end;

procedure TFrmSPCNewQuickInspection.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(Self, [Self]); // iqregfrm
end;

procedure TFrmSPCNewQuickInspection.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self]); // iqregfrm
end;

procedure TFrmSPCNewQuickInspection.FormShow(Sender: TObject);
begin
  TblSPCInspection.Open;
  TblSPCInspection.Insert;
end;

procedure TFrmSPCNewQuickInspection.SetSource(const Value: String);
begin
  FSource := Value;
end;

procedure TFrmSPCNewQuickInspection.SetSourceID(const Value: Real);
begin
  FSourceID := Value;
end;

procedure TFrmSPCNewQuickInspection.btnOkClick(Sender: TObject);
begin
  if Trim(TblSPCInspectionNAME.AsString) = '' then
    begin
      // 'Name is required.  Please enter a name.';
      IQError(cRsc_001);
      if dbeName.CanFocus then
        dbeName.SetFocus;
      ModalResult := mrNone;
    end
  else
    begin
      if TblSPCInspection.State in [dsEdit, dsInsert] then
        TblSPCInspection.Post;
    end;
end;

procedure TFrmSPCNewQuickInspection.btnCancelClick(Sender: TObject);
begin
  if TblSPCInspection.State in [dsEdit, dsInsert] then
    TblSPCInspection.Cancel;
end;

procedure TFrmSPCNewQuickInspection.TblSPCInspectionBeforePost(
  DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
  // 09/15/2006 Min of 2
  if TblSPCInspectionSAMPLE_COUNT.AsInteger < 2 then
    TblSPCInspectionSAMPLE_COUNT.AsInteger := 2;
end;

procedure TFrmSPCNewQuickInspection.TblSPCInspectionNewRecord(
  DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
  TblSPCInspectionCREATED.AsDateTime := IQOracleAdjustedDateTime;
  TblSPCInspectionCREATEDBY.AsString := SecurityManager.UserName;
  TblSPCInspectionSAMPLE_COUNT.AsInteger := 2; // 09/15/2006 minimum of 2
  TblSPCInspectionSOURCE.AsString := FSource;
  if FSourceID > 0 then
    TblSPCInspectionSOURCE_ID.AsFloat := FSourceID;
end;

end.
