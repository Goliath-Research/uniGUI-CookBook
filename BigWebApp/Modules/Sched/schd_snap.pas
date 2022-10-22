unit schd_snap;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Mask,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TFrmSched_Snap = class(TUniForm)
    Panel1: TUniPanel;
    chkSysDefault: TUniDBCheckBox;
    Label1: TUniLabel;
    Label2: TUniLabel;
    DBEdit1: TUniDBEdit;
    Label3: TUniLabel;
    DBEdit2: TUniDBEdit;
    wwDBComboBoxSnap: TUniDBComboBox;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Bevel1: TUniPanel;
    SrcParams: TDataSource;
    TblParams: TFDTable;
    TblParamsSCHED_JIT: TStringField;
    TblParamsSCHED_SNAP_TO_LAST: TStringField;
    dbchkSystemJIT: TUniDBCheckBox;
    dbchkWorCenterJIT: TUniDBCheckBox;
    pnlButtons: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    TblParamsASSY1_SNAP_TO_LAST: TStringField;
    TblParamsID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure chkSysDefaultClick(Sender: TObject);
    procedure dbchkSystemJITClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure wwDBComboBoxSnapCloseUp(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FDataSource: TDataSource;
    FParamsSchedSnapToLast: string;
    function GetParamsSchedSnapToLast: string;
    function IsLikeAssy1: Boolean;
    procedure SetDataSource(const Value: TDataSource);
  public
    { Public declarations }
    class function DoShowModal( ADataSource: TDataSource ): Boolean;
    property ParamsSchedSnapToLast: string read GetParamsSchedSnapToLast;
    property DataSource: TDataSource read FDataSource write SetDataSource;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.HelpHook,
  IQMS.Common.Controls;

{ TFrmSched_Snap }

class function TFrmSched_Snap.DoShowModal( ADataSource: TDataSource ): Boolean;
var
  frm : TFrmSched_Snap;
begin
  frm := TFrmSched_Snap.Create(uniGUIApplication.UniApplication);
  frm.DataSource := ADataSource;
  Result:= (frm.ShowModal = mrOK);
end;

procedure TFrmSched_Snap.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;


procedure TFrmSched_Snap.btnOKClick(Sender: TObject);
begin
  // Vcl.wwdbedit, Vcl.Wwdotdot, Vcl.Wwdbcomb,   Vcl.wwDataInspector,
  // IQRegBooleanScalarWrite( NIL, 'Snap_To_Last_Job', chkSysDefault.Checked );
  TblParams.CheckBrowseMode;

  if Assigned( FDataSource ) and Assigned( FDataSource.DataSet ) and (FDataSource.DataSet.State = dsEdit ) then
     FDataSource.DataSet.Post;

  ModalResult:= mrOK;
end;

procedure TFrmSched_Snap.btnCancelClick(Sender: TObject);
begin
  if Assigned( FDataSource ) and Assigned( FDataSource.DataSet ) and (FDataSource.DataSet.State = dsEdit ) then
     FDataSource.DataSet.Cancel;

  ModalResult:= mrCancel;
end;

procedure TFrmSched_Snap.chkSysDefaultClick(Sender: TObject);
begin
  if chkSysDefault.Checked and dbchkSystemJIT.Checked then
  begin
    TblParams.Edit;
    TblParamsSCHED_JIT.asString:= 'N';
  end;
  dbchkSystemJIT.Enabled:= not IsLikeAssy1 and not chkSysDefault.Checked;

  {if workcenter is assigned systemn default - changing system default settings should affect the workcenter too}
  wwDBComboBoxSnapCloseUp(nil);
end;

procedure TFrmSched_Snap.dbchkSystemJITClick(Sender: TObject);
begin
  {if workcenter is assigned systemn default - changing system default settings should affect the workcenter too}
  wwDBComboBoxSnapCloseUp(nil);
end;

procedure TFrmSched_Snap.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSCHED{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmSched_Snap.FormShow(Sender: TObject);
begin
  // 01-19-2015 for now disabke for ASSY1
  dbchkSystemJIT.Enabled   := not IsLikeAssy1 and (GetParamsSchedSnapToLast <> 'Y');
  dbchkWorCenterJIT.Enabled:= not IsLikeAssy1
                              and ((FDataSource.DataSet.FieldByName('SNAP_TO_LAST').asFloat = 1)
                                    or
                                   ((FDataSource.DataSet.FieldByName('SNAP_TO_LAST').asFloat = 0) and (GetParamsSchedSnapToLast <> 'Y')));

  // 02/14/2008 Resize the check boxes to fit text
  IQMS.Common.Controls.ResizeCheckBoxes(Self, Self);

  CheckVistaAdjustSize([ DBEdit1, DBEdit2, wwDBComboBoxSnap ])
end;

function TFrmSched_Snap.IsLikeAssy1: Boolean;
begin
  Result:= False;

  if not Assigned(FDataSource) or not Assigned(FDataSource.DataSet) then
     EXIT;

  if not Assigned( FDataSource.DataSet.FindField('Lookup_Mfgtype')) then
     EXIT;

  Result:= (FDataSource.DataSet.FieldByName('Lookup_Mfgtype').asString = 'ASSY1')
           or
           (FDataSource.DataSet.FieldByName('Lookup_Mfgtype').asString = 'ASSY2');
end;


procedure TFrmSched_Snap.SetDataSource(const Value: TDataSource);
begin
  FDataSource := Value;
  DBEdit1.DataSource          := Value;
  DBEdit2.DataSource          := Value;
  wwDBComboBoxSnap.DataSource := Value;
  dbchkWorCenterJIT.DataSource:= Value;
end;

procedure TFrmSched_Snap.UniFormCreate(Sender: TObject);
var
  AValue: Boolean;
begin
  Reopen(TblParams);

  if IsLikeAssy1 then
  begin
    chkSysDefault.DataField:= 'ASSY1_SNAP_TO_LAST';
  end;

  // chkSysDefault.Checked:= IQRegBooleanScalarRead( NIL, 'Snap_To_Last_Job', AValue ) and AValue;
  IQRegFormRead( self, [ self ]);

  
end;

procedure TFrmSched_Snap.wwDBComboBoxSnapCloseUp(Sender: TObject);
begin
  case StrToIntDef( wwDBComboBoxSnap.Text, 0 ) of
    0: // System Default
       with FDataSource.DataSet do
       begin
         Edit;
         FieldByName('SCHED_JIT').asString:= IIf( dbchkSystemJIT.Checked, 'Y', 'N');
         dbchkWorCenterJIT.Enabled:= FALSE;
         FieldByName('SNAP_TO_LAST').asFloat:= 0;
       end;

    1: // do not snap
       with FDataSource.DataSet do
       begin
         dbchkWorCenterJIT.Enabled:= not IsLikeAssy1 and TRUE;
         Edit;
         FieldByName('SNAP_TO_LAST').asFloat:= 1;
       end;

    2: // snap to the last job
       with FDataSource.DataSet do
       begin
         Edit;
         FieldByName('SCHED_JIT').asString:= 'N';
         dbchkWorCenterJIT.Enabled:= FALSE;
         FieldByName('SNAP_TO_LAST').asFloat:= 2;
       end;
  end;
end;

function TFrmSched_Snap.GetParamsSchedSnapToLast: string;
var
  ADataSet: TDataSet;
begin
  Result:= TblParamsSCHED_SNAP_TO_LAST.asString;

  if IsLikeAssy1 then
     Result:= TblParamsASSY1_SNAP_TO_LAST.asString;
end;

end.
