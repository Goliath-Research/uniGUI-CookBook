unit SchdSameToolJobs;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, Vcl.ComCtrls, uniBasicGrid, uniListView;

type
  TFrmSchedSameToolJobs = class(TUniForm)
    ListView1: TUniListView;
    Panel1: TUniPanel;
    Bevel1: TUniPanel;
    Label1: TUniLabel;
    Panel2: TUniPanel;
    btnMoveAll: TUniButton;
    btnMoveTop: TUniButton;
    btnCancel: TUniButton;
    SR: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnMoveTopClick(Sender: TObject);
    procedure btnMoveAllClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FList               : TStringList;
    FCurr_Cntr_Sched_ID : Real;
    FCurr_Work_Center_ID: Real;
    FCurr_Seq           : Real;
    FPmeqmt_ID          : Real;
    procedure SetCurr_Cntr_Sched_ID(const Value: Real);
    procedure SetCurr_Seq(const Value: Real);
    procedure SetCurr_Work_Center_ID(const Value: Real);
    procedure SetList(const Value: TStringList);
    procedure SetPmeqmt_ID(const Value: Real);
  public
    { Public declarations }
    property List: TStringList read FList write SetList;
    property Curr_Cntr_Sched_ID: Real read FCurr_Cntr_Sched_ID write SetCurr_Cntr_Sched_ID;
    property Curr_Work_Center_ID: Real read FCurr_Work_Center_ID write SetCurr_Work_Center_ID;
    property Curr_Seq: Real read FCurr_Seq write SetCurr_Seq;
    property Pmeqmt_ID: Real read FPmeqmt_ID write SetPmeqmt_ID;

    procedure LoadWorkorders;
  end;

procedure CheckLoadSameToolAdjoiningJobs( AList: TStringList; ACurr_Cntr_Sched_ID, ACurr_Work_Center_ID, ACurr_Seq: Real );

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm;
  { TODO -oathite -cWebConvert : Depends on IQSecIns
  IQSecIns; }

procedure CheckLoadSameToolAdjoiningJobs( AList: TStringList; ACurr_Cntr_Sched_ID, ACurr_Work_Center_ID, ACurr_Seq: Real );
var
  frm: TFrmSchedSameToolJobs;
  APmeqmt_ID: Real;
begin
  {Init}
  AList.Clear;
  if ACurr_Cntr_Sched_ID = 0 then
     EXIT;

  {The item we are moving}
  AList.Add( FloatToStr( ACurr_Cntr_Sched_ID ));

  if SelectValueAsString('select sched_move_same_tool_wo from params') <> 'Y' then
     EXIT;

  {Tool #}
  APmeqmt_ID:= SelectValueFmtAsFloat('select s.pmeqmt_id                '+
                         '  from cntr_sched sched,          '+
                         '       workorder wo,              '+
                         '       standard s                 '+
                         ' where sched.id = %f              '+
                         '   and sched.workorder_id = wo.id '+
                         '   and wo.standard_id = s.id      ',
                         [ ACurr_Cntr_Sched_ID ]);
  if APmeqmt_ID = 0 then
     EXIT;

  {Popup form}
  frm := TFrmSchedSameToolJobs.Create( UniApplication);
  frm.List               := AList;
  frm.Curr_Cntr_Sched_ID := ACurr_Cntr_Sched_ID;
  frm.Curr_Work_Center_ID:= ACurr_Work_Center_ID;
  frm.Curr_Seq           := ACurr_Seq;
  frm.Pmeqmt_ID          := APmeqmt_ID;
  if frm.FList.Count > 1 then
     frm.ShowModal;
end;

procedure TFrmSchedSameToolJobs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmSchedSameToolJobs.FormShow(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Depends on IQSecIns
  EnsureSecurityInspectorOnTopOf( self );            }
end;

procedure TFrmSchedSameToolJobs.LoadWorkorders;
begin
  {Get all jobs below that are back to back with the one we are moving and have the same tool #}
  with TFDQuery.Create( self ) do
  try
    Connection:= UniMainModule.FDConnection1;
    SQL.Add( IQFormat( 'select sched.id,                  '+
                       '       sched.workorder_id,        '+
                       '       sched.cntr_seq,            '+
                       '       s.mfgno,                   '+
                       '       sched.prod_start_time,     '+
                       '       sched.prod_end_time,       '+
                       '       sched.prodhrs,             '+
                       '       sched.setuphrs,            '+
                       '       wo.start_time              '+
                       '  from cntr_sched sched,          '+
                       '       workorder wo,              '+
                       '       standard s                 '+
                       ' where sched.work_center_id = %f  '+
                       '   and sched.cntr_seq >= %f       '+
                       '   and sched.workorder_id = wo.id '+
                       '   and wo.standard_id = s.id      '+
                       '   and s.pmeqmt_id = %f           '+
                       ' order by sched.cntr_seq          ',
                       [ FCurr_Work_Center_ID,
                         FCurr_Seq,
                         FPmeqmt_ID ]));
    Open;
    while not Eof do
    begin
      if FCurr_Seq <> FieldByName('cntr_seq').asFloat then
         BREAK;

      {add to list of cntr_sched}
      if FList.IndexOf( FieldByName('id').asString ) = -1 then
         FList.Add( FieldByName('id').asString );

      {add to grid}
      with ListView1.Items.Add do
      begin
         Caption:= FieldByName('workorder_id').asString;
         SubItems.Add( FieldByName('mfgno').asString );
         SubItems.Add( FieldByName('cntr_seq').asString);
         SubItems.Add( FieldByName('prod_start_time').asString);
         SubItems.Add( FieldByName('prod_end_time').asString);
         SubItems.Add( FieldByName('start_time').asString);
         SubItems.Add( FormatFloat( '###,###,##0.00', FieldByName('ProdHrs').asFloat ));
         SubItems.Add( FormatFloat( '###,###,##0.00', FieldByName('SetupHrs').asFloat));
      end;

      FCurr_Seq:= FCurr_Seq + 1;
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TFrmSchedSameToolJobs.SetCurr_Cntr_Sched_ID(const Value: Real);
begin
  FCurr_Cntr_Sched_ID := Value;
end;

procedure TFrmSchedSameToolJobs.SetCurr_Seq(const Value: Real);
begin
  FCurr_Seq := Value;
end;

procedure TFrmSchedSameToolJobs.SetCurr_Work_Center_ID(const Value: Real);
begin
  FCurr_Work_Center_ID := Value;
end;

procedure TFrmSchedSameToolJobs.SetList(const Value: TStringList);
begin
  FList := Value;
end;

procedure TFrmSchedSameToolJobs.SetPmeqmt_ID(const Value: Real);
begin
  FPmeqmt_ID := Value;
end;

procedure TFrmSchedSameToolJobs.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);

  Caption:= Format('Back to back workorders [ Tool # %s,  Work Center %s ]',
                   [ SelectValueByID('eqno', 'pmeqmt', FPmeqmt_ID),
                     SelectValueByID('eqno', 'work_center', FCurr_Work_Center_ID) ]);
  Label1.Caption:= Format(' About to move WO # %.0f.', [ DtoF(SelectValueByID('workorder_id', 'cntr_sched', FCurr_Cntr_Sched_ID)) ]);

  LoadWorkorders;
end;

procedure TFrmSchedSameToolJobs.btnCancelClick(Sender: TObject);
begin
  FList.Clear;
  ModalResult:= mrCancel;
end;

procedure TFrmSchedSameToolJobs.btnMoveTopClick(Sender: TObject);
begin
  {Leave 1st one in - the original WO tha is being moved}
  while FList.Count > 1 do FList.Delete( FList.Count - 1 );
  ModalResult:= mrOK;
end;

procedure TFrmSchedSameToolJobs.btnMoveAllClick(Sender: TObject);
begin
  ModalResult:= mrOK;
end;

end.
