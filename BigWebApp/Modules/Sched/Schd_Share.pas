unit Schd_Share;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule;

type
  TWOCargo = class
    WorkOrder_ID       : Real;
    Cntr_Sched_ID      : Real;
    Work_Center_ID     : Real;
    Eqno               : string;
    Cntr_Seq           : Real;
    ProdHrs            : Real;
    SetupHrs           : Real;
    Prod_Start_Time    : TDateTime;
    Prod_End_Time      : TDateTime;
    Must_Start_Time    : TDateTime;
    Standard_ID        : Real;
    MfgNo              : string;
    MfgCell_ID         : Real;
    Overlap_Hrs        : Real;
    Level              : Integer;

    constructor Create( AWorkOrder_ID: Real; ALevel: Integer = 0 );
    function IsScheduled: Boolean;
    procedure AssignOverlapHrs( AParent: TWOCargo );
    function NegativeConsumptionOf( AChild: TWOCargo ): Boolean;
    procedure AdjustMustStartEarlierBasedOn( AParent: TWOCargo );
    procedure Assign( AOther: TWOCargo );
  end;


  TEvalSched = class
  private
    procedure PopulateConsumedBy( AWOCargo: TWOCargo; ALevel: Integer );
    procedure PopulateDependedOn( AWOCargo: TWOCargo; ALevel: Integer );
  public
    ConsumedWO       : TStringList;
    DependedWO       : TStringList;
    WOCargo: TWOCargo;                   {Moved WorkOrder Cargo}
    constructor Create( AWorkOrder_ID: Real );
    destructor Destroy; override;
    procedure Execute;
    function IsNegativeConsumptionFound: Boolean;
  end;

implementation

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.Proc,
  IQMS.Common.PanelMsg,
  IQMS.Common.NLS,
  Variants,
  IQMS.Common.MfgShare;

var
    IsUpdateNegConsON: Boolean;

{ TWOCargo }

constructor TWOCargo.Create( AWorkOrder_ID: Real; ALevel: Integer = 0 );
var
  A: Variant;
  AMfg_Type: string;
  X: string;
begin
  inherited Create;
  WorkOrder_ID:= AWorkOrder_ID;
  Level       := ALevel;

  if WorkOrder_ID = 0 then
     EXIT;

  AMfg_Type:= SelectValueFmtAsString('select s.mfg_type from workorder w, standard s where w.id = %f and w.standard_id = s.id', [ WorkOrder_ID ]);

  if not IQMS.Common.MfgShare.IsMfgTypeSimilarToASSY1( AMfg_Type ) then
     A:= SelectValueArrayFmt( 'select c.id, c.cntr_seq, c.prodhrs, c.setuphrs, c.prod_start_time, '+
                         '       c.prod_end_time, w.start_time, w.standard_id, e.mfgcell_id, '+
                         '       c.work_center_id, e.eqno, s.mfgno                           '+
                         '  from cntr_sched c, workorder w, work_center e, standard s        '+
                         ' where c.workorder_id = %f                                         '+
                         '   and c.workorder_id = w.id                                       '+
                         '   and c.work_center_id = e.id                                     '+
                         '   and w.standard_id = s.id',  [ WorkOrder_ID ])
  else
     A:= SelectValueArrayFmt( 'select c.id,                                                                                  '+
                         '       c.cntr_seq,                                                                            '+
                         '       IQCalendar.Prod_Hrs_Between( c.work_center_id, d.prod_start_time, d.prod_end_time, 0, e.mfgcell_id ) as prodhrs, '+
                         '       0 as setuphrs,                                                                      '+
                         '       d.prod_start_time,                                                                     '+
                         '       d.prod_end_time,                                                                       '+
                         '       w.start_time,                                                                          '+
                         '       w.standard_id,                                                                         '+
                         '       e.mfgcell_id,                                                                          '+
                         '       c.work_center_id,                                                                      '+
                         '       e.eqno,                                                                                '+
                         '       s.mfgno                                                                                '+
                         '  from                                                                                        '+
                         '       cntr_sched c,                                                                          '+
                         '       workorder w,                                                                           '+
                         '       work_center e,                                                                         '+
                         '       standard s,                                                                            '+
                         '       ( select min(prod_start_time) as prod_start_time, max(prod_end_time) as prod_end_time  '+
                         '           from sndop_dispatch                                                                '+
                         '          where workorder_id = %f ) d                                                         '+
                         ' where                                                                                        '+
                         '       c.sndop_dispatch_id = (select min(d.id) from sndop_dispatch d, cntr_sched c            '+
                         '                               where d.workorder_id = %f and d.id = c.sndop_dispatch_id )     '+
                         '   and c.workorder_id = w.id                                                                  '+
                         '   and c.work_center_id = e.id                                                                '+
                         '   and w.standard_id = s.id                                                                   ',
                         [ WorkOrder_ID, WorkOrder_ID ]);

  if VarArrayDimCount( A ) > 0 then
  begin
    Cntr_Sched_ID  := A[ 0 ];
    Cntr_Seq       := A[ 1 ];
    ProdHrs        := A[ 2 ];
    SetupHrs       := A[ 3 ];
    if not VarIsNull( A[ 4 ] ) then
       Prod_Start_Time:= A[ 4 ];        // StrToDateTime(A[ 4 ]);
    if not VarIsNull( A[ 5 ] ) then
       Prod_End_Time  := A[ 5 ];        // StrToDateTime(A[ 5 ]);
    if A[ 6 ] <> NULL then
       Must_Start_Time:= A[ 6 ]         // StrToDateTime(A[ 6 ])
    else
       Must_Start_Time:= -1;
    Standard_ID    := A[ 7 ];
    MfgCell_ID     := A[ 8 ];
    Work_Center_ID := A[ 9 ];
    Eqno           := A[ 10 ];
    MfgNo          := A[ 11 ];
  end;
end;

procedure TWOCargo.AssignOverlapHrs( AParent: TWOCargo );
begin
  Overlap_Hrs:= SelectValueFmtAsFloat('select MAX(m.overlap_hrs)      '+
                          '  from partno p,               '+
                          '       ptoper o,               '+
                          '       opmat m,                '+
                          '       arinvt a                '+
                          ' where p.standard_id = %f      '+
                          '   and p.id = o.partno_id      '+
                          '   and o.sndop_id = m.sndop_id '+
                          '   and m.arinvt_id = a.id      '+
                          '   and a.standard_id = %f      ',
                          [ AParent.Standard_ID, self.Standard_ID ]);
end;


function TWOCargo.IsScheduled: Boolean;
begin
  Result:= (Cntr_Sched_ID > 0) and (ProdHrs > 0);
end;

function TWOCargo.NegativeConsumptionOf( AChild: TWOCargo ): Boolean;
begin
  if AChild.Overlap_Hrs = 0 then
     Result:= AChild.Prod_End_Time > self.Prod_Start_Time
  else
     Result:= AChild.Prod_Start_Time + fMin( AChild.Overlap_Hrs, AChild.ProdHrs ) / 24 + AChild.SetupHrs / 24 > self.Prod_Start_Time;
end;

procedure TWOCargo.AdjustMustStartEarlierBasedOn( AParent: TWOCargo );
var
  AHrs: Real;
  AMust_Start: TDateTime;
begin
  {Mar-07-02 - if they don't want the must_start_date be updated - exit}
  if not IsUpdateNegConsON then
     EXIT;

  if self.Overlap_Hrs = 0 then
     AHrs:= ProdHrs + SetupHrs
  else
     AHrs:= fMin( Overlap_Hrs, ProdHrs ) + SetupHrs;

  GetStartDate( Work_Center_ID,           // center_id  (IQMS.Common.Proc.pas)
                AParent.Prod_Start_Time,  // v_ini_end_time
                AHrs,                     // v_hrs
                0,                        // v_is_default_calendar
                AMust_Start,              // calculate must start
                MfgCell_ID );             // mfgcell_id

  if Must_Start_Time <> AMust_Start then
  begin
     ExecuteCommandFmt('update workorder set start_time = to_date(''%s'', ''MM/DD/YYYY'') where id = %f',
               [ FormatDateTime( 'MM/DD/YYYY', AMust_Start ), WorkOrder_ID ]);
     Must_Start_Time:= AMust_Start;
  end;
end;

procedure TWOCargo.Assign( AOther: TWOCargo );
begin
  WorkOrder_ID   := AOther.WorkOrder_ID;
  Cntr_Sched_ID  := AOther.Cntr_Sched_ID;
  Work_Center_ID := AOther.Work_Center_ID;
  Eqno           := AOther.Eqno;
  Cntr_Seq       := AOther.Cntr_Seq;
  ProdHrs        := AOther.ProdHrs;
  SetupHrs       := AOther.SetupHrs;
  Prod_Start_Time:= AOther.Prod_Start_Time;
  Prod_End_Time  := AOther.Prod_End_Time;
  Must_Start_Time:= AOther.Must_Start_Time;
  Standard_ID    := AOther.Standard_ID;
  MfgNo          := AOther.MfgNo;
  MfgCell_ID     := AOther.MfgCell_ID;
  Overlap_Hrs    := AOther.Overlap_Hrs;
  Level          := AOther.Level;
end;

{ EvalSched }

constructor TEvalSched.Create( AWorkOrder_ID: Real );
begin
  inherited Create;
  WOCargo:= TWOCargo.Create( AWorkOrder_ID );

  ConsumedWO:= TStringList.Create;
  DependedWO:= TStringList.Create;

  IsUpdateNegConsON:= SelectValueAsString('select sched_eval_neg_cons from params') = 'Y';
end;

destructor TEvalSched.Destroy;
begin
  ClearStringListOfObjects( ConsumedWO );
  ConsumedWO.Free;

  ClearStringListOfObjects( DependedWO );
  DependedWO.Free;

  WOCargo.Free;
  inherited;
end;

procedure TEvalSched.Execute;
var
  hMsg : TPanelMesg;
begin
  {Check if scheduled}
  if WOCargo.Cntr_Sched_ID = 0 then
     EXIT;

  hMsg:= hPleaseWait('Analyzing Dependencies ...');
  try
    {Clear}
    ClearStringListOfObjects( ConsumedWO );
    ClearStringListOfObjects( DependedWO );

    {Populate}
    PopulateConsumedBy( WOCargo, 0 );
    PopulateDependedOn( WOCargo, 0 );
  finally
    hMsg.Free;
  end;
end;

procedure TEvalSched.PopulateDependedOn( AWOCargo: TWOCargo; ALevel: Integer );
begin

end;

procedure TEvalSched.PopulateConsumedBy( AWOCargo: TWOCargo; ALevel: Integer );
var
  AChild: TWOCargo;
begin
  with TFDQuery.Create( Application ) do
  try
    ConnectionName:= 'IQFD';
    SQL.Add( IQFormat('select distinct(p2.workorder_id) as workorder_id  '+
                      '  from                                            '+
                      '     ( select t2.id as ptallocate_id              '+
                      '        from ptorder p1,                          '+
                      '             ptorder_rel r1,                      '+
                      '             ptallocate t2                        '+
                      '       where p1.workorder_id = %f                 '+
                      '         and r1.ptorder_id = p1.id                '+
                      '         and r1.ptallocate_id = t2.parent_id ) x, '+
                      '       ptorder p2,                                '+
                      '       ptorder_rel r2                             '+
                      ' where                                            '+
                      '       x.ptallocate_id = r2.ptallocate_id         '+
                      '   and r2.ptorder_id = p2.id                      ',
                      [ AWOCargo.WorkOrder_ID ]));

    Open;
    while not Eof do
    begin
        AChild:= TWOCargo.Create( Fields[ 0 ].asFloat, ALevel + 1 );

        {Check if scheduled}
        if not AChild.IsScheduled then
        begin
          AChild.Free;
          Next; Continue;
        end;

        {Assign Overlap hrs - pass parent }
        AChild.AssignOverlapHrs( AWOCargo );

        {Check Negative Consumption}
        if not AWOCargo.NegativeConsumptionOf( AChild ) then
        begin
          AChild.Free;
          Next; Continue;
        end;

        {Adjust}
        AChild.AdjustMustStartEarlierBasedOn( AWOCargo );

        {Add to List}
        ConsumedWO.AddObject( FloatToStr(AChild.WorkOrder_ID), AChild );

        {Recursive}
        PopulateConsumedBy( AChild, ALevel + 1 );

      Next;
    end;
  finally
    Free;
  end;
end;

function TEvalSched.IsNegativeConsumptionFound: Boolean;
begin
  Result:= (ConsumedWO.Count > 0);
end;

end.

