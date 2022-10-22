unit assy_data_share;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Data.Db,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Wwdatsrc,
  FireDAC.Phys,
  FireDAC.Comp.Client,
  IQUniGrid;

procedure DrawProgressBarInGrid( AGrid: TIQUniGridControl; Rect: TRect; AProgress, AStdHrsPart, AActHrsPart: Real ); overload;
procedure DrawProgressBarInGrid( AGrid: TIQUniGridControl; Rect: TRect; AProgress: Real ); overload;

procedure DrawProcessDetailsInGrid( AGrid: TIQUniGridControl; Rect: TRect; AOpNo, AOpDesc: string );
procedure CalculateProcessProgress( AWorkorder_ID,
                                    APartno_ID,
                                    ASndop_ID,
                                    APtoper_ID,
                                    ATotalReleaseQty: Real;
                                    var AGoodPartsProduced,
                                        ARejects,
                                        AProgress,
                                        AHoursToGo,
                                        APartsToGo,
                                        ActHrsPart: Real;
                                    ALookup_Mfgtype: string = '' );


function HeijunkaSlotNameToID( AFieldName: string; AHeijunka_ID: Real ): Real;
procedure MoveHeijunkaCards( wwQryBox: TFDQuery; AFromFieldName, AToFieldName: string; AHowMany: Integer );
procedure DrawHeijunkaCards( AGrid: TIQUniGridControl; ACardCount, APartsToGo: Real; ARect: TRect; ABackColor: TColor );
procedure RebuildHeijunkaBoxQuery( AHeijunka_ID: Real; wwQryBox: TFDQuery; wwgridBox: TIQUniGridControl );
function GetHeijunkaSlotPeriod( AHeijunka_ID, ASeq: Real; var ASlotStart, ASlotEnd: TDateTime ): Boolean;
function FindCurrentDateTimeSlotFieldName( AHeijunka_ID: Real ): string;
function HeijunkaSlotNameToPartsToGo( wwQryBox: TFDQuery; AFieldName: string ): Real;

procedure DrawKanBanCard( AGrid: TIQUniGridControl; ACardNo: string; ARect: TRect; AFontColor, ABackColor: TColor );
procedure DrawGenericCard( AGrid: TIQUniGridControl; R: TRect; AFontColor, ABackColor: TColor; AOffs: Integer );

implementation

uses
  IQMS.Common.ApplicationSet,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils;


procedure CalculateProcessProgress( AWorkorder_ID,
                                    APartno_ID,
                                    ASndop_ID,
                                    APtoper_ID,
                                    ATotalReleaseQty: Real;
                                    var AGoodPartsProduced,
                                        ARejects,
                                        AProgress,
                                        AHoursToGo,
                                        APartsToGo,
                                        ActHrsPart: Real;
                                    ALookup_Mfgtype: string = '' );
var
  ACycleTime: Real;
  A: Variant;
  AActualProductionTime: Real;
  ACumulativeRejects: Real;
  AUsePercentComplete: Boolean;
  APercentComplete: Real;
  AStandard_ID: Real;
begin
  ACumulativeRejects:= 0;
  AGoodPartsProduced:= 0;
  AActualProductionTime:= 0;
  APartsToGo:= 0;
  AHoursToGo:= 0;
  ActHrsPart:= 0;
  ARejects  := 0;

  AStandard_ID:= SelectValueByID('standard_id', 'partno', APartno_ID );

  AUsePercentComplete:= SelectValueFmtAsFloat('select assy1_misc.use_percent_complete_ex( %f ) from dual', [ AStandard_ID ]) = 1;

  if ALookup_Mfgtype = '' then
     ALookup_Mfgtype:= SelectValueFmtAsString('select mfg.lookup_mfgtype(s.mfg_type) from standard s where s.id = %f', [ AStandard_ID ]);

  // SCR# 01835 - allow progress bar color coding for ASSY3 - 02-18-2011
  // if ALookup_Mfgtype = 'ASSY3' then
  //    A:= SelectValueArrayFmt('select final_assy_qty, 0, 0 from ptorder where workorder_id = %f', // 02-18-2010 for now rejects = 0
  //                       [ AWorkorder_ID ])
  // else

  // total good parts produced
  A:= SelectValueArrayFmt('select process_qty,                                         '+
                     '       reject_qty,                                          '+
                     '       complete                                             '+
                     '  from c_ta_labor                                           '+
                     ' where workorder_id = %f and partno_id = %f and ptoper_id = %f',
                     [ AWorkorder_ID,
                       APartno_ID,
                       APtoper_ID  ]);
  if VarArrayDimCount( A ) > 0 then
  begin
     AGoodPartsProduced:= A[ 0 ];
     ACumulativeRejects:= A[ 1 ];
     APercentComplete  := A[ 2 ]; // applicable only when AUsePercentComplete = TRUE
  end;

  // if ALookup_Mfgtype <> 'ASSY3' then
  // begin
    A:= SelectValueArrayFmt('select sum(nvl(reject_qty,0)),                                                '+
                       '       sum( decode( time_in, null, reg_hrs, (time_out - time_in) * 24 ))      '+
                       '  from ta_labor                                                               '+
                       ' where source in (''WO'', ''JS'', ''AS'') and workorder_id = %f and partno_id = %f and ptoper_id = %f',
                       [ AWorkorder_ID,
                         APartno_ID,
                         APtoper_ID ]);
    if VarArrayDimCount( A ) > 0 then
    begin
       ARejects:= A[ 0 ];
       AActualProductionTime:= A[ 1 ];
    end;
  // end;

  // progress
  try
    // AProgress:= IQRoundEx( (AGoodPartsProduced - ACumulativeRejects) / ATotalReleaseQty * 100, 2);
    // 11-17-2008 - discount cumulative rejects by the rejects of the process we are on.
    // This is done because user reports the good parts and not the total parts. In other words user has already accounted for the rejects.
    // 11-20-2008 - since we already doing it in the trigger ACumulativeRejects represents cum rejects not including current process
    if AUsePercentComplete then
       AProgress:= APercentComplete
    else
       AProgress:= IQRoundEx( (AGoodPartsProduced - ACumulativeRejects) / ATotalReleaseQty * 100, 2);
    if AProgress < 0 then
       AProgress:= 0;
  except
    AProgress:= 0;
  end;

  // mimic parts produced when use_percent_complete is turned on
  if AUsePercentComplete then
     AGoodPartsProduced:= ATotalReleaseQty * APercentComplete / 100;

  APartsToGo:= ATotalReleaseQty - AGoodPartsProduced + ACumulativeRejects;

  // hours to go
  A:= SelectValueArrayFmt('select cycletm, batch_type, IQMS.Common.Miscellaneous.no_zero( batch_size ), batch_time, scrap from v_assy1_ptoper where partno_id = %f and ptoper_id = %f', [ APartno_ID, APtoper_ID ]);  // in seconds
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  ACycleTime:= A[ 0 ];

  if A[ 1 ] <> 'Y' then
     AHoursToGo:= APartsToGo * ACycleTime / 3600           // not batch type
  else
     AHoursToGo:= Trunc(APartsToGo / A[ 2 ] + 0.999999999)  * A[ 3 ] / 3600 / (1 - A[ 4 ]/100);     // it is batch type

  // actual production rate
  try
    if AGoodPartsProduced <> 0 then
       ActHrsPart:= AActualProductionTime / AGoodPartsProduced
    else
       ActHrsPart:= 0;
  except
    ActHrsPart:= 0;
  end;
end;


procedure DrawProgressBarInGrid( AGrid: TIQUniGridControl; Rect: TRect; AProgress, AStdHrsPart, AActHrsPart: Real );
var
  AProgressRect: TRect;
  ATextRect: TRect;
  ABarWidth: Integer;

  APartsPerHourStd: Real;
  APartsPerHourAct: Real;
begin
  // Text
  ATextRect.TopLeft:= Rect.TopLeft;
  ATextRect.BottomRight:= Rect.BottomRight;
  { TODO : TIQUniGridControl does not contain a member named Canvas
  ATextRect.Right  := ATextRect.Left + AGrid.Canvas.TextWidth('99.99% ') + 3; // 42;


  AGrid.Canvas.TextRect( ATextRect, ATextRect.Left + 1, ATextRect.Top + 10, Format('%f%% ', [ AProgress ]));

  // progress bar background
  AProgressRect.Left  := ATextRect.Right + 2;
  AProgressRect.Top   := Rect.Top + 6;
  AProgressRect.Right := Rect.Right - 2;
  AProgressRect.Bottom:= Rect.Bottom - 6;
  AGrid.Canvas.Brush.Color:= cl3DLight;
  AGrid.Canvas.FillRect(AProgressRect);   }

  // progress bar
  AProgressRect.Left  := ATextRect.Right + 2;
  AProgressRect.Top   := Rect.Top  + 6;

  // calculate the width of the progress bar
  AProgressRect.Right := Rect.Right - 2;
  ABarWidth:= Trunc((AProgressRect.Right - AProgressRect.Left + 1) / 100 * AProgress);
  if ABarWidth = 0 then
     AProgressRect.Right := AProgressRect.Left + 1
  else if AProgressRect.Left + ABarWidth > AProgressRect.Right then
     // do nothing - keep current AProgressRect.Right
  else
     AProgressRect.Right := AProgressRect.Left + ABarWidth;

  // bottom
  AProgressRect.Bottom:= Rect.Bottom - 6;

  // color
  // 04-22-2013 do not round or you risk running into precision problems when comparing act vs std
  // AStdHrsPart:= IQRound(AStdHrsPart, 2);
  // AActHrsPart:= IQRound(AActHrsPart, 2);
  // try APartsPerHourStd:= IQRound(1 / AStdHrsPart, 2); except APartsPerHourStd:= 0; end;
  // try APartsPerHourAct:= IQRound(1 / AActHrsPart, 2); except APartsPerHourAct:= 0; end;
  try APartsPerHourStd:= 1 / AStdHrsPart; except APartsPerHourStd:= 0; end;
  try APartsPerHourAct:= 1 / AActHrsPart; except APartsPerHourAct:= 0; end;
{ TODO : TIQUniGridControl does not contain a member named Canvas
  if (APartsPerHourStd = 0) or (APartsPerHourAct = 0) then
     AGrid.Canvas.Brush.Color:= clNavy

  else if APartsPerHourAct >= APartsPerHourStd then
     AGrid.Canvas.Brush.Color:= clGreen

  else if APartsPerHourAct >= APartsPerHourStd * 0.95 then
     AGrid.Canvas.Brush.Color:= clYellow

  else
     AGrid.Canvas.Brush.Color:= clRed;

  // finally!
  AGrid.Canvas.FillRect(AProgressRect);    }
end;


procedure DrawProcessDetailsInGrid( AGrid: TIQUniGridControl; Rect: TRect; AOpNo, AOpDesc: string );
var
  AOpNoRect: TRect;
  ADescRect: TRect;
begin
  // Text OpNo
  AOpNoRect.TopLeft    := Rect.TopLeft;
  AOpNoRect.BottomRight:= Rect.BottomRight;
  AOpNoRect.Bottom     := AOpNoRect.Top + (AOpNoRect.Bottom - AOpNoRect.Top) div 2 - 1;

{ TODO : TIQUniGridControl does not contain a member named Canvas
  AGrid.Canvas.TextRect( AOpNoRect, AOpNoRect.Left + 1, AOpNoRect.Top + 1, AOpNo );

  // Text Description
  ADescRect.TopLeft    := Rect.TopLeft;
  ADescRect.Top        := AOpNoRect.Bottom + 1;
  ADescRect.BottomRight:= Rect.BottomRight;
  AGrid.Canvas.TextRect( ADescRect, ADescRect.Left + 1, ADescRect.Top + 1, AOpDesc);

  // separator line
  AGrid.Canvas.Pen.Color:= clSilver;
  AGrid.Canvas.MoveTo( AOpNoRect.Left,  AOpNoRect.Bottom );
  AGrid.Canvas.LineTo( AOpNoRect.Right, AOpNoRect.Bottom );   }
end;



procedure DrawProgressBarInGrid( AGrid: TIQUniGridControl; Rect: TRect; AProgress: Real );
var
  AProgressRect: TRect;
  ATextRect: TRect;
  ABarWidth: Integer;

  APartsPerHourStd: Real;
  APartsPerHourAct: Real;
begin
  // Text
  ATextRect.TopLeft:= Rect.TopLeft;
  ATextRect.BottomRight:= Rect.BottomRight;

{ TODO : TIQUniGridControl does not contain a member named Canvas
  ATextRect.Right  := ATextRect.Left + AGrid.Canvas.TextWidth('99.99% ') + 3;

  AGrid.Canvas.TextRect( ATextRect, ATextRect.Left + 1, ATextRect.Top + 1, Format('%f%% ', [ AProgress ]));

  // progress bar background
  AProgressRect.Left  := ATextRect.Right + 2;
  AProgressRect.Top   := Rect.Top + 1;
  AProgressRect.Right := Rect.Right - 2;
  AProgressRect.Bottom:= Rect.Bottom - 2;
  AGrid.Canvas.Brush.Color:= cl3DLight;
  AGrid.Canvas.FillRect(AProgressRect);    }

  // progress bar
  AProgressRect.Left  := ATextRect.Right + 2;
  AProgressRect.Top   := Rect.Top  + 2;

  // calculate the width of the progress bar
  AProgressRect.Right := Rect.Right - 2;
  ABarWidth:= Trunc((AProgressRect.Right - AProgressRect.Left + 1) / 100 * AProgress);
  if ABarWidth = 0 then
     AProgressRect.Right := AProgressRect.Left + 1
  else if AProgressRect.Left + ABarWidth > AProgressRect.Right then
     // do nothing - keep current AProgressRect.Right
  else
     AProgressRect.Right := AProgressRect.Left + ABarWidth;

  // bottom
  AProgressRect.Bottom:= Rect.Bottom - 2;

  { TODO : TIQUniGridControl does not contain a member named Canvas
  // color
  if (AProgress > 0) and (AProgress <= 100) then
     AGrid.Canvas.Brush.Color:= clNavy

  else if (AProgress > 100) then
     AGrid.Canvas.Brush.Color:= clRed;

  // finally!
  AGrid.Canvas.FillRect(AProgressRect);     }
end;




function GetHeijunkaSlotPeriod( AHeijunka_ID, ASeq: Real; var ASlotStart, ASlotEnd: TDateTime ): Boolean;
var
  A: Variant;
begin
  A:= SelectValueArrayFmt( 'select slot_start, slot_end from heijunka_slot where heijunka_id = %f and seq = %f', [ AHeijunka_ID, ASeq ]);
  Result:= VarArrayDimCount( A ) > 0;

  if not Result then
     EXIT;

  ASlotStart:= A[ 0 ];
  ASlotEnd  := A[ 1 ];
end;


procedure RebuildHeijunkaBoxQuery( AHeijunka_ID: Real; wwQryBox: TFDQuery; wwgridBox: TIQUniGridControl );
var
  ASlotList: TStringList;
  AArinvt_ID: Real;
  AActiveFieldName: string;

  procedure CheckUpdateCumTransQuanReduceCards;
  begin
    ExecuteCommandFmt('begin kb_misc.update_trans_quan_reduce_cards( %f ); end;', [ AHeijunka_ID ]);
  end;

  procedure RebuildQuery;
  var
    S: string;
    I: Integer;
  begin
    // select of slot 1, 2 etc
    // -------------------------------------------------------------------------
    // delete select slot1, slot2 etc
    IQMS.Common.StringUtils.DeleteStringsBetweenKeyWords( wwQryBox.SQL,
                                           '_SELECT_START_',
                                           '_SELECT_END_',
                                           I );

    // prepare select slot1, slot2 etc
    S:= '';
    for I:= 0 to ASlotList.Count - 1 do
        S:= S + Format(' x.slot%d, '#13, [ I+1 ]);

    // insert the select portion
    InsertStringsBetweenKeyWords( wwQryBox.SQL,
                                  S,
                                  '_SELECT_START_',
                                  '_SELECT_END_' );


    // select of parts_to_go 1, 2 etc
    // -------------------------------------------------------------------------
    // delete select parts_to_go1, parts_to_go2 etc
    IQMS.Common.StringUtils.DeleteStringsBetweenKeyWords( wwQryBox.SQL,
                                           '_SELECT_PARTS_TO_GO_START_',
                                           '_SELECT_PARTS_TO_GO_END_',
                                           I );

    // prepare select parts_to_go1, parts_to_go2 etc
    S:= '';
    for I:= 0 to ASlotList.Count - 1 do
        S:= S + Format(' z.parts_to_go%d, '#13, [ I+1 ]);

    // insert the select portion
    InsertStringsBetweenKeyWords( wwQryBox.SQL,
                                  S,
                                  '_SELECT_PARTS_TO_GO_START_',
                                  '_SELECT_PARTS_TO_GO_END_' );


    // inline query for slots
    // -------------------------------------------------------------------------
    // now prepare the inline query
    IQMS.Common.StringUtils.DeleteStringsBetweenKeyWords( wwQryBox.SQL,
                                  '_INLINE_QUERY_START_',
                                  '_INLINE_QUERY_END_',
                                  I );

    // prepare select max(decode( s.seq, 1, i.card_count, null)) as slot1, etc
    S:= '';
    for I:= 0 to ASlotList.Count - 1 do
      S:= S + Format(', max(decode( s.seq, %d, i.card_count, null)) as slot%d '#13, [ I+1, I+1 ]);

    // insert the inline select
    InsertStringsBetweenKeyWords( wwQryBox.SQL,
                                  S,
                                  '_INLINE_QUERY_START_',
                                  '_INLINE_QUERY_END_' );

    // inline query for parts_to_go
    // -------------------------------------------------------------------------
    // now prepare the inline query
    IQMS.Common.StringUtils.DeleteStringsBetweenKeyWords( wwQryBox.SQL,
                                  '_INLINE_QUERY_PARTS_TO_GO_START_',
                                  '_INLINE_QUERY_PARTS_TO_GO_END_',
                                  I );

    // prepare select max(decode( s.seq, 1, i.parts_to_go, null)) as parts_to_go1, etc
    S:= '';
    for I:= 0 to ASlotList.Count - 1 do
      S:= S + Format(', max(decode( s.seq, %d, i.parts_to_go, null)) as parts_to_go%d '#13, [ I+1, I+1 ]);

    // insert the inline select
    InsertStringsBetweenKeyWords( wwQryBox.SQL,
                                  S,
                                  '_INLINE_QUERY_PARTS_TO_GO_START_',
                                  '_INLINE_QUERY_PARTS_TO_GO_END_' );


    // wwQryBox.Params.ParamByName('heijunka_id').Value := AHeijunka_ID;
    AssignQueryParamValue(wwQryBox, 'heijunka_id', AHeijunka_ID);

    // recreate fields
    wwQryBox.Fields.Clear;
    wwQryBox.FieldDefs.Update;
    for I:= 0 to wwQryBox.FieldDefs.Count - 1 do
      wwQryBox.FieldDefs[ I ].CreateField( wwQryBox );
  end;


  procedure RebuildGridColumns;
  var
    I: Integer;
    D1, D2: TDateTime;
    S: string;
  begin
{ TODO : TIQUniGridControl does not contain a member named Selected
    wwgridBox.Selected.Clear;
    wwgridBox.Selected.Add('ITEMNO'#9'25'#9'Item #'#9#9);
    // wwgridBox.Selected.Add('REPLENISHMENT_COUNT'#9'12'#9'Replenishment~Cards'#9#9    );  02-06-2012 Randy decided to pull this out to avoid confusion
}
    for I:= 0 to ASlotList.Count - 1 do
    begin
       {construct the following header: '%d~08/15~18:45 - 19:45'}
       if GetHeijunkaSlotPeriod( AHeijunka_ID, I+1, D1, D2 ) then
          S:= Format( '%d~'    +  //    3
                      '%s~'    +  // 08/15
                      '%s - %s',  // 19:45-20:45
                     [ I+1,
                       FormatDateTime('mm/dd', D1),
                       FormatDateTime('hh:nn', D1),
                       FormatDateTime('hh:nn', D2)])
       else
          S:= Format( '%d~'          + // s/n happen
                      'Period - N/A',
                      [ I+1 ]);
      { TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain a member named Selected
      wwgridBox.Selected.Add(Format('SLOT%d'#9'12'#9'%s'#9'F'#9, [ I+1, S ]));  }
    end;

  { TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain a member named Selected
    wwgridBox.Selected.Add('DESCRIP'#9'25'#9'Description' );
    wwgridBox.Selected.Add('REV'#9'5'#9'Rev'#9#9    );
    wwgridBox.Selected.Add('CLASS'#9'4'#9'Class'#9#9 );
    wwgridBox.Selected.Add('RATIO'#9'12'#9'Ratio'#9#9    );

    wwgridBox.ApplySelected;  }
  end;

  procedure StoreCurrentPosition;
  begin
    AArinvt_ID:= 0;
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain a member named GetActiveField
    if (wwQryBox.State <> dsInactive) and (wwQryBox.FindField('arinvt_id') <> nil) and Assigned( wwgridBox.GetActiveField()) then
    begin
      AArinvt_ID:= wwQryBox.FieldByName('arinvt_id').asFloat;
      AActiveFieldName:= wwgridBox.GetActiveField.FieldName;
    end; }
  end;

  procedure RestoreCurrentPosition;
  begin
    if AArinvt_ID > 0 then
    begin
      wwQryBox.Locate('arinvt_id', AArinvt_ID, []);
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain a member named SetActiveField
      wwgridBox.SetActiveField( AActiveFieldName );  }
    end
  end;

begin
  // store current position
  StoreCurrentPosition;
  wwQryBox.Close;

  ASlotList:= TStringList.Create;
  try
    LoadColumnValueIntoStringList( ASlotList, Format('select id from heijunka_slot where heijunka_id = %.0f order by seq', [ AHeijunka_ID ]));

    // consume produced and rebuild query
    CheckUpdateCumTransQuanReduceCards;
    RebuildQuery;
    RebuildGridColumns;

    // restore
    wwQryBox.Open;
    RestoreCurrentPosition;
  finally
    ASlotList.Free;
  end;
end;

procedure TextRectCenterHorizontal( AGrid: TIQUniGridControl; S: string; R: TRect );
var
  AAlign : Word;
  X      : Integer;
  AIsBold: Boolean;
begin
  // figure out center
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain a member named Canvas
  X := ((R.Right - R.Left) div 2) - (AGrid.Canvas.TextWidth( S ) div 2);

  with AGrid.Canvas do
  try
    AIsBold:= fsBold in Font.Style;
    if AIsBold then
        Font.Style:= Font.Style - [fsBold];
    TextRect( R, R.Left + X, R.Top, S );
  finally
    if AIsBold then
        Font.Style:= Font.Style + [fsBold];
  end;  }
end;


procedure DrawHeijunkaCards( AGrid: TIQUniGridControl; ACardCount, APartsToGo: Real; ARect: TRect; ABackColor: TColor );
const
  cHeight = 20; // 20;
  cWidth  = 18; // 18;
  cHGap   = 3;
  cVGap   = 3;
  cOffs   = 2;
var
  R1    : TRect;
  I     : Integer;
  ACount: Integer;
  R2    : TRect;
begin
  // first show parts to go at the bottom
  R2       := ARect;
  R2.Bottom:= R2.Bottom - 2;
  R2.Top   := R2.Bottom - iIIf( IQMS.Common.ApplicationSet.IsTouchScreen, 18, 12);
  TextRectCenterHorizontal( AGrid, FloatToStr( APartsToGo ), R2 );

  // now the cards above!
  ACount:= iMin( 3, Trunc( ACardCount ));

  R1:= ARect;
  R1.Left:= R1.Left + (R1.Right - R1.Left - cWidth - cHGap * (ACount-1)) div 2;
  // R1.Top := R1.Top  + (R1.Bottom - R1.Top - cHeight - cVGap * (ACount-1)) div 2;
  // put the cards closer to the top to allow for text underneath
  R1.Top := R1.Top  + 6;

  for I:= 1 to ACount do
  begin
    // card position
    if I > 1 then
    begin
      R1.Left:= R1.Left + cHGap;
      R1.Top := R1.Top  + cVGap;
    end;

    R1.Right := R1.Left + cWidth;
    R1.Bottom:= R1.Top  + cHeight;

    DrawGenericCard( AGrid, R1, clBlack, ABackColor, cOffs );
  end;

  R1.Left:= R1.Left + iif(ACardCount > 99, 0, iif( ACardCount > 9, 2, 6));
  R1.Top := R1.Top  + 2;
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain a member named Canvas
  AGrid.Canvas.Font.Color:= clBlack;
  AGrid.Canvas.TextRect( R1, R1.Left, R1.Top, FloatToStr( ACardCount )); }
end;


procedure MoveHeijunkaCards( wwQryBox: TFDQuery; AFromFieldName, AToFieldName: string; AHowMany: Integer );

  function IsHeijunkaSlot( AFieldName: string ): Boolean;
  begin
    Result:= Pos( 'SLOT', AFieldName ) > 0;
  end;

  function IsReplenishmentPool( AFieldName: string ): Boolean;
  begin
    Result:= Pos( 'REPLENISHMENT_COUNT', AFieldName ) > 0;
  end;

  procedure RemoveCardsFrom( AArinvt_ID, AHeijunka_Slot_ID: Real );
  begin
    ExecuteCommandFmt('update heijunka_item                                        '+
              '   set card_count = card_count - %d,                        '+
              '       parts_to_go = greatest( 0, nvl(parts_to_go, 0) - %f) '+
              ' where heijunka_slot_id = %f                                '+
              '   and arinvt_id = %f                                       ',
              [ AHowMany,
                AHowMany * wwQryBox.FieldByName('parts_per_card').asFloat,
                AHeijunka_Slot_ID,
                AArinvt_ID ]);


  end;

  procedure AddCardsTo( AArinvt_ID, AHeijunka_Slot_ID: Real );
  begin
    ExecuteCommandFmt('declare                                                 '+
              '  v_count            number::= %d;                      '+
              '  v_heijunka_slot_id number::= %f;                      '+
              '  v_arinvt_id        number::= %f;                      '+
              '  v_part_per_card    number::= %f;                      '+
              'begin                                                   '+
              '  update heijunka_item                                  '+
              '     set card_count = nvl(card_count,0) + v_count,      '+
              '         parts_to_go = nvl(parts_to_go, 0) + v_count * v_part_per_card             '+
              '   where heijunka_slot_id = v_heijunka_slot_id          '+
              '     and arinvt_id = v_arinvt_id;                       '+

              '  if sql%%notfound then                                 '+
              '     insert into heijunka_item                          '+
              '          ( heijunka_slot_id, arinvt_id, card_count, parts_to_go )                 '+
              '     values                                             '+
              '          ( v_heijunka_slot_id, v_arinvt_id, v_count, v_count * v_part_per_card ); '+
              '  end if;                                               '+
              'end;                                                    ',
              [ AHowMany,
                AHeijunka_Slot_ID,
                AArinvt_ID,
                wwQryBox.FieldByName('parts_per_card').asFloat ]);
  end;

begin
  if IsHeijunkaSlot( AFromFieldName ) and IsHeijunkaSlot( AToFieldName ) then
     begin
       RemoveCardsFrom( wwQryBox.FieldByName('arinvt_id').asFloat, HeijunkaSlotNameToID( AFromFieldName, wwQryBox.FieldByName('heijunka_id').asFloat ));
       AddCardsTo( wwQryBox.FieldByName('arinvt_id').asFloat, HeijunkaSlotNameToID( AToFieldName, wwQryBox.FieldByName('heijunka_id').asFloat  ));
     end

  else if IsHeijunkaSlot( AFromFieldName ) and IsReplenishmentPool( AToFieldName ) then
     RemoveCardsFrom( wwQryBox.FieldByName('arinvt_id').asFloat, HeijunkaSlotNameToID( AFromFieldName, wwQryBox.FieldByName('heijunka_id').asFloat  ))

  else if IsReplenishmentPool( AFromFieldName ) and IsHeijunkaSlot( AToFieldName ) then
     AddCardsTo( wwQryBox.FieldByName('arinvt_id').asFloat, HeijunkaSlotNameToID( AToFieldName, wwQryBox.FieldByName('heijunka_id').asFloat ));

  RefreshDataSetByID( wwQryBox, 'arinvt_id' );
end;


function HeijunkaSlotNameToID( AFieldName: string; AHeijunka_ID: Real ): Real;
var
  ASeq: Real;
  I: Integer;
  A: Variant;
begin
  I:= Pos( 'SLOT', AFieldName );
  ASeq:= StrToFloat( Copy( AFieldName, I+4, 255 ));

  A:= SelectValueArrayFmt( 'select id from heijunka_slot where heijunka_id = %f and seq = %f', [ AHeijunka_ID, ASeq ]);
  IQAssert( VarArrayDimCount( A ) > 0, Format('Unable to establish heijunka_slot_id for field ''%s''', [ AFieldName ]));

  Result:= A[ 0 ];
end;


function FindCurrentDateTimeSlotFieldName( AHeijunka_ID: Real ): string;
var
  I: Integer;
  ASeq: Real;
begin
  Result:= '';

  ASeq:= SelectValueFmtAsFloat( 'select seq from heijunka_slot where heijunka_id = %f and round(sysdate, ''MI'') between slot_start and slot_end',
                          [ AHeijunka_ID ]);

  if ASeq > 0 then
     Result:= 'SLOT' + FloatToStr( ASeq );
end;

function HeijunkaSlotNameToPartsToGo( wwQryBox: TFDQuery; AFieldName: string ): Real;
var
  I: Integer;
  APartsToGoFieldName: string;
begin
  I:= Pos( 'SLOT', AFieldName );
  APartsToGoFieldName:= 'parts_to_go' + Copy( AFieldName, I+4, 255 );

  if wwQryBox.FindField( APartsToGoFieldName ) <> nil then
     Result:= wwQryBox.FieldByName( APartsToGoFieldName ).asFloat
  else
     Result:= 0;
end;

procedure DrawKanBanCard( AGrid: TIQUniGridControl; ACardNo: string; ARect: TRect; AFontColor, ABackColor: TColor );
const
  cOffs = 5;
var
  R1    : TRect;
  R2    : TRect;
  I     : Integer;
  ACount: Integer;
  AHeight: Integer;
  AWidth : Integer;
begin
  AHeight:= 28;
  AWidth := 28;

  // clear the cell from the text
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain a member named Canvas
  AGrid.Canvas.Brush.Color:= clWindow;
  AGrid.Canvas.FillRect( ARect ); }

  if ACardNo = '' then
     EXIT;

  // R1 represnts the card rectangle
  R1:= ARect;
  R1.Left  := R1.Left + (R1.Right - R1.Left - AWidth  ) div 2;
  R1.Top   := R1.Top  + (R1.Bottom - R1.Top - AHeight ) div 2;
  R1.Right := R1.Left + AWidth;
  R1.Bottom:= R1.Top  + AHeight;

  DrawGenericCard( AGrid, R1, AFontColor, ABackColor, cOffs );

  // write card no
  R2       := R1;
  R2.Left  := R2.Left + 2;
  R2.Right := R2.Right - 2;
  R2.Top   := R2.Top + cOffs;
  R2.Bottom:= R2.Bottom - 2;
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain a member named Canvas
  R2.Top   := R2.Top + ((R2.Bottom - R2.Top) div 2) - (AGrid.Canvas.TextHeight( ACardNo ) div 2);
  AGrid.Canvas.Font.Color:= AFontColor;   }
  TextRectCenterHorizontal( AGrid, ACardNo, R2 );
end;

procedure DrawGenericCard( AGrid: TIQUniGridControl; R: TRect; AFontColor, ABackColor: TColor; AOffs: Integer );
begin
  // R represnts the card rectangle. First draw filled in polygon with the borders
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain a member named Canvas
  AGrid.Canvas.Brush.Color:= ABackColor;
  AGrid.Canvas.Pen.Width:= 1;

  AGrid.Canvas.Polygon([ Point(R.Left  + AOffs, R.Top),
                         Point(R.Right - AOffs, R.Top),
                         Point(R.Right,         R.Top + AOffs),
                         Point(R.Right,         R.Bottom),
                         Point(R.Left,          R.Bottom),
                         Point(R.Left,          R.Top + AOffs)]);

  // silver left & top border
  AGrid.Canvas.Pen.Color:= clSilver;
  AGrid.Canvas.Polyline([ Point(R.Left,         R.Bottom),
                          Point(R.Left,         R.Top + AOffs),
                          Point(R.Left + AOffs, R.Top ),
                          Point(R.Right - AOffs,R.Top )]);

  // black top and right border
  AGrid.Canvas.Pen.Color:= cl3DDkShadow;
  AGrid.Canvas.Polyline([ Point(R.Right - AOffs,R.Top ),
                          Point(R.Right,        R.Top + AOffs),
                          Point(R.Right,        R.Bottom),
                          Point(R.Left,         R.Bottom )]);
 }
end;


end.
