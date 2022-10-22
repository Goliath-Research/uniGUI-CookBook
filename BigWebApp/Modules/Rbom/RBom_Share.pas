unit RBom_Share;

interface
  uses
  RTTypes;

type
  TRBomEditMode = ( bomNew, bomAdd, bomEdit );
  TRBomEditComponentMode = ( compAdd, compEdit );

  TCloneCargo = record
    Itemno     : string;
    Rev        : string;
    Pts_Per    : Real;
    Overlap_Hrs: Real;
    Arcusto_ID : Real;
    MfgNo      : string;
  end;

  TRBom_Assign_Cargo = class
    Arinvt_ID     : Real;
    Standard_ID   : Real;
    JobShop_Rfq_ID: Real;
    constructor Create( AArinvt_ID, AStandard_ID, AJobShop_Rfq_ID: Real );
  end;

  procedure MovePtoper( APartno_ID, AFromSeq, AToSeq: Real );
  function AssignMfgTypeCell( AMode: TRBomEditMode; AStandard_ID: Real; var MfgCellRecord: TCellMfgType ): Boolean;
  function RBomGetCreateSndOp( AParent_Standard_ID, AParent_Arinvt_ID: Real ): Real;

implementation

uses
  MainModule,
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  FireDAC.Comp.Client,
  RBom_MfgType,
  System.Classes,
  System.SysUtils,
  System.Variants,
  Vcl.Dialogs;

constructor TRBom_Assign_Cargo.Create( AArinvt_ID, AStandard_ID, AJobShop_Rfq_ID: Real );
begin
  Arinvt_ID     := AArinvt_ID;
  Standard_ID   := AStandard_ID;
  JobShop_Rfq_ID:= AJobShop_Rfq_ID;
end;

procedure MovePtoper( APartno_ID, AFromSeq, AToSeq: Real );
var
  AList     : TStringList;
  I         : Integer;
  ANextValue: Integer;
  AThisValue: Integer;

  procedure LoadPtOper;
  begin
    {Picture N balls stacked one on top of the other. If I want to move Nth to the 1st I'd pull out the Nth,
     all the balls move/fall down by 1 and I'd put the Nth I pulled out in the 1st place.

     What if I need to move 1st into the Nth slot? I would turn the balls upsidedown and repeat the action above.

     In other words I want to order the query in such way that I always pull the bottom ball and put it on top.
     So, if AFrom > AToSeq - no need to turn the balls upsidedown. But if AFrom < AToSeq - order the query in desc order
     so we can still pull the bottom ball out and put it on top.
      }
    AList.Clear;
    with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add( IQFormat('select rowid, opseq from ptoper where partno_id = %f', [ APartno_ID ]));

      if AFromSeq > AToSeq then
      begin
        {order the "balls" in  the ascending order of opseq}
        SQL.Add(IQFormat(' and opseq between %f and %f ', [ AToSeq, AFromSeq ]));
        SQL.Add(' order by opseq');
      end
      else
      begin
        {turn the "balls" upsidedown}
        SQL.Add(IQFormat(' and opseq between %f and %f ', [ AFromSeq, AToSeq ]));
        SQL.Add(' order by opseq desc');
      end;

      Open;
      while not Eof do
      begin
        AList.AddObject( Fields[ 0 ].asString, Pointer( Fields[ 1 ].asInteger ));
        Next;
      end;

    finally
      Free;
    end;
  end;

begin
  AList:= TStringList.Create;
  try
    {prepare the "balls" - see explanation above}
    LoadPtOper;
    if AList.Count <= 1 then
       EXIT;

    {let the stack of the balls fall 1 slot down and put the Nth in the 1 slot}
    ANextValue:= LongInt( AList.Objects[ AList.Count - 1 ]);
    for I:= AList.Count - 2 downto 0 do
    begin
      AThisValue:= LongInt( AList.Objects[ I ]);
      AList.Objects[ I ]:= Pointer( ANextValue );
      ANextValue:= AThisValue;
    end;

    {the pulled out bottom ball assign the value of the 1st ball}
    AList.Objects[ AList.Count - 1 ]:= Pointer( ANextValue );

    {update ptoper}
    with AList do
    try
      ExecuteCommandFmt('update ptoper set opseq = -1 where rowid = ''%s''', [ AList[ Count - 1 ]]);

      for I:= 0 to Count - 2 do
        ExecuteCommandFmt('update ptoper set opseq = %d where rowid = ''%s''', [ LongInt(Objects[ I ]), AList[ I ] ]);

      ExecuteCommandFmt('update ptoper set opseq = %d where rowid = ''%s''', [ LongInt(Objects[ Count - 1 ]), AList[ Count - 1 ]]);

    except on E: Exception do
      raise Exception.CreateFmt('Error occured while attempting to update sequence number from %d to %d'#13#13'%s',
                                [ Round(SelectValueFmtAsFloat('select opseq from ptoper where rowid = ''%s''', [ AList[ I ]])),
                                  LongInt(AList.Objects[ I ]), E.Message ]);
    end;
  finally
    AList.Free;
  end;
end;


function AssignMfgTypeCell( AMode: TRBomEditMode; AStandard_ID: Real; var MfgCellRecord: TCellMfgType ): Boolean;
var
  A: Variant;
begin
  Result:= FALSE;
  if (AMode in [ bomNew, bomAdd ]) then
     Result:= RBom_PickMfgTypeCell( MfgCellRecord ) {RBom_MfgType}
  else
     begin
       A:= SelectValueArrayFmt( 'select mfg_type, mfgcell, mfgcell_id from standard where id = %f', [ AStandard_ID ]);
       if VarArrayDimCount( A ) = 0 then
          EXIT;
       if A[ 2 ] > 0 then        {Cell}
          begin
            MfgCellRecord.CellorMfgType := cmCELL;
            MfgCellRecord.MfgType       := A[ 0 ];
            MfgCellRecord.Cell          := A[ 1 ];
            MfgCellRecord.MfgCell_ID    := A[ 2 ];
          end
       else                      {MfgType}
          begin
            MfgCellRecord.CellorMfgType := cmMFGTYPE;
            MfgCellRecord.MfgType       := A[ 0 ];
            MfgCellRecord.Cell          := '';
            MfgCellRecord.MfgCell_ID    := -1;
          end;
       Result:= TRUE;
     end;
end;


function RBomGetCreateSndOp( AParent_Standard_ID, AParent_Arinvt_ID: Real ): Real;
var
  AParent_Partno_ID: Real;
  AOpSeq           : Real;
begin
  {Locate sndop that is attached to parent partno and of class 'OP' }
  Result:= SelectValueFmtAsFloat('select o.sndop_id             '+
                     '  from partno p,              '+
                     '       ptoper o,              '+
                     '       sndop                  '+
                     ' where p.standard_id = %f     '+
                     '   and p.arinvt_id = %f       '+
                     '   and p.id = o.partno_id     '+
                     '   and o.sndop_id = sndop.id  '+
                     '   and sndop.op_class = ''IN'' ', [ AParent_Standard_ID, AParent_Arinvt_ID ]);
  if Result = 0 then
  begin
    {Append to Sndop}
    Result:= GetNextID('sndop');
    ExecuteCommandFmt('insert into sndop( id, opno, op_class, opdesc) values( %f, %f, ''IN'', ''Attached Components'')', [ Result, Result ]);

    {Append to PtOper}
    AParent_Partno_ID:= SelectValueFmtAsFloat('select id from partno where standard_id = %f and arinvt_id = %f', [ AParent_Standard_ID, AParent_Arinvt_ID ]);
    AOpSeq:= 1 + SelectValueFmtAsFloat('select max(opseq) from ptoper where partno_id = %f', [ AParent_Partno_ID ]);
    ExecuteCommandFmt('insert into ptoper( partno_id, sndop_id, opseq ) values( %f, %f, %f )', [ AParent_Partno_ID, Result, AOpSeq ]);
  end;
end;

end.
