unit AttachedLaborProperties;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.wwDataInspector,
  IQMS.WebVcl.SecurityRegister,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication, Vcl.Grids;

type
  { TFrmTLAttachedLaborProperties }
  TFrmTLAttachedLaborProperties = class(TUniForm)
    SrcLabor: TDataSource;
    QryLabor: TFDQuery;
    QryLaborLABOR_HRS: TFMTBCDField;
    QryLaborNOTES: TStringField;
    QryLaborPR_EMP_ID: TBCDField;
    QryLaborDETAILNO: TStringField;
    QryLaborPR_PAYTYPE_ID: TBCDField;
    QryLaborRATE: TFMTBCDField;
    QryLaborSOURCE_ID: TBCDField;
    QryLaborCHARGE_RATE: TFMTBCDField;
    QryLaborPK_HIDE: TStringField;
    QryLaborSOURCE: TStringField;
    QryLaborCREATED: TDateTimeField;
    QryLaborEMPNO: TStringField;
    QryLaborFIRST_NAME: TStringField;
    QryLaborLAST_NAME: TStringField;
    QryLaborEMPLOYEE: TStringField;
    QryLaborEMP_CHARGE_RATE: TBCDField;
    QryLaborDESCRIPTION: TStringField;
    QryLaborID: TBCDField;
    QryLaborPOSTING_SOURCE: TStringField;
    SR: TIQWebSecurityRegister;
    wwDataInspector1: TwwDataInspector;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryLaborBeforeOpen(DataSet: TDataSet);
    procedure QryLaborBeforeInsert(DataSet: TDataSet);
    procedure QryLaborUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest;
      var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

    procedure QryLaborAfterOpen(DataSet: TDataSet);
    procedure wwDataInspector1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DoItemChanged(Sender: TwwDataInspector;
      Item: TwwInspectorItem; NewValue: string);
    procedure QryLaborAfterPost(DataSet: TDataSet);

  private
    { Private declarations }
    FEmpLaborID: Real;
    FReadOnly : Boolean;
    procedure SetEmpLaborID(const Value: Real);
    procedure SetReadOnly(const Value: Boolean);
  public
    { Public declarations }
    property EmpLaborID : Real write SetEmpLaborID;
    property AReadOnly : Boolean write SetReadOnly;
  end;

procedure DoShowLaborProperties(AEmpLaborID: Real; AAReadOnly: Boolean = False);

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
{ TODO -oGPatil -cWebConvert : Dependency on iqsecins.pas file
  iqsecins,  }
  IQMS.Common.StringUtils;

procedure DoShowLaborProperties(AEmpLaborID: Real; AAReadOnly: Boolean);
var
  LFrmTLAttachedLaborProperties : TFrmTLAttachedLaborProperties;
begin
  LFrmTLAttachedLaborProperties := TFrmTLAttachedLaborProperties.Create(UniGUIApplication.UniApplication);
  LFrmTLAttachedLaborProperties.EmpLaborID := AEmpLaborID;
  LFrmTLAttachedLaborProperties.AReadOnly := AAReadOnly;
  LFrmTLAttachedLaborProperties.ShowModal;
end;

procedure TFrmTLAttachedLaborProperties.FormShow(Sender: TObject);
var
  i: Integer;
begin
  IQRegFormRead(Self, [Self, wwDataInspector1]);
{ TODO -oGPatil -cWebConvert : Dependency on iqsecins.pas file
  iqsecins.EnsureSecurityInspectorOnTopOf(Self);  }

  QryLabor.Open;

  if FReadOnly then
    for i := 0 to wwDataInspector1.Items.Count - 1 do
      wwDataInspector1.Items[i].ReadOnly := True;

  wwDataInspector1.Items[10].Expanded := True;
  wwDataInspector1.Items[11].ParentItem := wwDataInspector1.Items[10];
  wwDataInspector1.Items[12].ParentItem := wwDataInspector1.Items[10];
  wwDataInspector1.Items[13].ParentItem := wwDataInspector1.Items[10];
  wwDataInspector1.Items[14].ParentItem := wwDataInspector1.Items[10];
  wwDataInspector1.Items[15].ParentItem := wwDataInspector1.Items[10];
  wwDataInspector1.Items[10].Expanded := False;

  //EIQ-5519 Project Manager - Security on Labor Allocated Properties Form

{ TODO -oGPatil -cWebConvert : Dependency on iqsecins.pas file
  IQMS.Common.Controls.SetDataInspectorItemVisible(wwDataInspector1,
    'LABOR_HRS', SR.Visible['QryLaborLABOR_HRS']);
  IQMS.Common.Controls.SetDataInspectorItemReadOnly(wwDataInspector1,
    'LABOR_HRS', not SR.ReadWrite['QryLaborLABOR_HRS']);

  IQMS.Common.Controls.SetDataInspectorItemVisible(wwDataInspector1,
    'CHARGE_RATE', SR.Visible['QryLaborCHARGE_RATE']);
  IQMS.Common.Controls.SetDataInspectorItemReadOnly(wwDataInspector1,
    'CHARGE_RATE', not SR.ReadWrite['QryLaborCHARGE_RATE']);

  IQMS.Common.Controls.SetDataInspectorItemVisible(wwDataInspector1,
    'EMP_CHARGE_RATE', SR.Visible['QryLaborEMP_CHARGE_RATE']);

  IQMS.Common.Controls.SetDataInspectorItemVisible(wwDataInspector1,
    'RATE', SR.Visible['QryLaborRATE']);
  IQMS.Common.Controls.SetDataInspectorItemReadOnly(wwDataInspector1,
    'RATE', not SR.ReadWrite['QryLaborRATE']);

  IQMS.Common.Controls.SetDataInspectorItemVisible(wwDataInspector1,
    'NOTES', SR.Visible['QryLaborNOTES']);
  IQMS.Common.Controls.SetDataInspectorItemReadOnly(wwDataInspector1,
    'NOTES', not SR.ReadWrite['QryLaborNOTES']);

  IQMS.Common.Controls.SetDataInspectorItemVisible(wwDataInspector1,
    'DETAILNO', SR.Visible['QryLaborDETAILNO']);
  IQMS.Common.Controls.SetDataInspectorItemReadOnly(wwDataInspector1,
    'DETAILNO', not SR.ReadWrite['QryLaborDETAILNO']);    }
end;

procedure TFrmTLAttachedLaborProperties.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self, wwDataInspector1]);

  try
    if (QryLabor.State in [dsEdit]) then
      QryLabor.Post;
  except //don't hang up the form if there is a problem; just abort
  end;
end;

procedure TFrmTLAttachedLaborProperties.QryLaborBeforeOpen(
  DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', FEmpLaborID);
end;

procedure TFrmTLAttachedLaborProperties.QryLaborBeforeInsert(
  DataSet: TDataSet);
begin
  System.SysUtils.Abort; //do not allow inserts
end;

procedure TFrmTLAttachedLaborProperties.QryLaborUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
  AOptions: TFDUpdateRowOptions);
var
  AChargeRate: Real;
  ANotes: string;
begin
  if QryLaborCHARGE_RATE.AsFloat = 0 then
    AChargeRate := SelectValueFmtAsFloat(
      'select charge_rate from pr_emp where id = %d',
      [QryLaborPR_EMP_ID.AsLargeInt])
  else
    AChargeRate := QryLaborCHARGE_RATE.AsFloat;

  ExecuteCommandParamDataSet(
    'UPDATE emp_labor                   '#13 +
    '   SET labor_hrs = :labor_hrs,     '#13 +
    '       rate = :rate,               '#13 +
    '       notes = :notes,             '#13 +
    '       detailno = :detailno,       '#13 +
    '       charge_rate = :charge_rate  '#13 +
    ' WHERE id = :id                    ',
    QryLabor);
  AAction := eaApplied;
end;

procedure TFrmTLAttachedLaborProperties.SetEmpLaborID(const Value: Real);
begin
  FEmpLaborID := Value;
end;

procedure TFrmTLAttachedLaborProperties.SetReadOnly(const Value: Boolean);
begin
  FReadOnly := Value;
end;

procedure TFrmTLAttachedLaborProperties.QryLaborAfterOpen(
  DataSet: TDataSet);
begin
  wwDataInspector1.Visible := QryLaborID.AsLargeInt > 0;
end;

procedure TFrmTLAttachedLaborProperties.QryLaborAfterPost(
  DataSet: TDataSet);
begin
  //with DataSet as TFDRDBMSDataSet do
  //begin
  //ApplyUpdates;
  //CommitUpdates;
  //end;
end;

procedure TFrmTLAttachedLaborProperties.wwDataInspector1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if not wwDataInspector1.ActiveItem.ReadOnly then
    with QryLabor do
      if not (State in [dsEdit]) then
        Edit;
end;

procedure TFrmTLAttachedLaborProperties.DoItemChanged(
  Sender: TwwDataInspector; Item: TwwInspectorItem; NewValue: string);
begin
  if (QryLabor.State in [dsEdit]) then
    QryLabor.Post;
end;

end.
