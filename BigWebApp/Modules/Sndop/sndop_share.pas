unit sndop_share;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule;


function CalculateOverallCycleTimeOfProcesses( AViewName: string;               {v_fab_ptoper, v_assy1_ptoper or v_assy1_qptoper}
                                               AParent_ID : Real;               {standard_id or quote_id}
                                               var ACycleTm: Real ): Boolean;

implementation

uses
  IQMS.Common.DataLib;

function CalculateOverallCycleTimeOfProcesses( AViewName: string;               {v_fab_ptoper, v_assy1_ptoper or v_assy1_qptoper}
                                               AParent_ID : Real;               {standard_id or quote_id}
                                               var ACycleTm: Real ): Boolean;
type
  TGroupType = (gtUnknown, gtOverlap, gtSequential);
var
  AGroupType: TGroupType;
  ATmpTime: Real;
  ALastSequentialCycleTime: Real;
  AParentColumnNAme: string;

  function IsGroupChanged( AOverlap_Process: Boolean ): Boolean;
  begin
    Result:= TRUE;

    if AGroupType = gtUnknown then
       EXIT;

    if (AGroupType = gtSequential) and AOverlap_Process then
       EXIT;

    if (AGroupType = gtOverlap) and not AOverlap_Process then
       EXIT;

    Result:= FALSE;
  end;

  function GetNextGroupType( AOverlap_Process: Boolean ): TGroupType;
  begin
    if AOverlap_Process then
       Result:= gtOverlap
    else
       Result:= gtSequential
  end;


  procedure AddGroupToTotalBeforeChangingTo( ANextGroupType: TGroupType );
  begin
    case AGroupType {current group} of
      gtOverlap   : // if we are going from overlap to sequential or unknown then don't forget to evaluate the last
                    // sequential cycle time we removed from the previous sequential group
                    if ATmpTime < ALastSequentialCycleTime then
                       ATmpTime:= ALastSequentialCycleTime;
      gtSequential: // if we are going from sequential to overlap subtract that last sequential cycle time
                    // because it belongs to overlap group we are about to switch to. Leave all as is when going to gtUnknown (called after do while loop)
                    if ANextGroupType = gtOverlap then
                       ATmpTime:= ATmpTime - ALastSequentialCycleTime;
    end;

    // ATmpTime represents either:
    // 1. the longest cycle time if this is overlap group
    // 2. the subtotal of all cycle times if this is sequential group
    ACycleTm:= ACycleTm + ATmpTime;
  end;

begin
  {Scan attached processes from top and break it into groups of having overlap hrs and records w/o overlap.
  Note that overlapping group includes the record above the first record with overlap = true:
  A overlap = false  Sequential Group 1

  B overlap = false  Overlapping Group 2  eventhough overlap hrs = 0 it belongs to group 2 because
  C overlap = true   Overlapping Group 2  the next process C is overlapping with it

  D overlap = false  Overlapping Group 3  note overlap hrs = 0 but the process belongs to 3rd group
  E overlap = true   Overlapping Group 3  because it overlaps with process E.
  F overlap = true   Overlapping Group 3

  G overlap = false  Sequential Group 4
  H overlap = false  Sequential Group 4

  In the overlapping group - add the longest cycle time.
  in the sequential group - add each cycle time to total cycle time }

  Result:= FALSE;
  AGroupType:= gtUnknown;
  ATmpTime:= 0;
  ACycleTm:= 0;
  ALastSequentialCycleTime:= 0;

  AParentColumnName:= 'standard_id';
  if CompareText( AViewName, 'v_assy1_qptoper' ) = 0 then
     AParentColumnName:= 'quote_id';

  with TFDQuery.Create(nil) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add(Format('select cycletm, overlap_process from %s where %s = %.0f order by opseq', [  AViewName, AParentColumnName, AParent_ID ]));
    Open;
    while not Eof do
    begin
      {check if the group gas changed and update running total}
      if IsGroupChanged( FieldByName('overlap_process').asString = 'Y' ) then
      begin
        AddGroupToTotalBeforeChangingTo( GetNextGroupType( FieldByName('overlap_process').asString = 'Y' ));
        ATmpTime:= 0;
        AGroupType:= GetNextGroupType( FieldByName('overlap_process').asString = 'Y' );
      end;

      {while the group is the same keep updating tmp totals}
      case AGroupType of
        gtOverlap   : begin
                        if ATmpTime < FieldByName('cycletm').asFloat then
                           ATmpTime:= FieldByName('cycletm').asFloat;
                      end;
        gtSequential: begin
                         ATmpTime:= ATmpTime + FieldByName('cycletm').asFloat;
                         // keep track of the last cycle time - we may need to remove it from the sub total if the next group is overlapping.
                         ALastSequentialCycleTime:= FieldByName('cycletm').asFloat;
                      end;
      end;

      Next;
    end;

    {don't forget the last group to add to the running total}
    AddGroupToTotalBeforeChangingTo( gtUnknown );
  finally
    Free;
  end;
  Result:= TRUE;
end;


end.

