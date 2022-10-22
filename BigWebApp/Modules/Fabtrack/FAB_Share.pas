unit FAB_Share;

interface

  function Get_FAB_MaterialException( AFab_Start_ID: Real ): string;
  function Get_FAB_PrimaryMatState( AFAB_Start_ID: Real ): string;
  function Get_FAB_AttachedMatState( AFAB_Start_ID: Real ): string;

  function IsOnExceptionList( AFAB_Start_ID: Real ): Boolean;
  function IsOnExceptionListByWorkorder( AWorkOrder_ID: Real ): Boolean;

  function Get_FAB_LotSize( AWorkOrder_ID, AArinvt_ID: Real ): Real;
  function Get_FAB_Arinvt_ID_Mat_FromFAB_Start( AFab_Start_ID: Real ): Real;
  function Get_FAB_Standard_ID( AFab_Lot_ID: Real ): Real;

  function Split_FAB_Lot( ASrc_Fab_Lot_ID, AQty: Real; AUser_Suggested_New_Fab_Lot_ID: Real = 0; AUser_Suggested_New_Fab_LotNo: string = '' ): Real;
  procedure PropagateRatioToHardAllocMaterialQuan( AFab_Lot_ID, ARatio: Real );

implementation

uses
  FAB_Const,
  IQMS.Common.DataLib,
  System.SysUtils,
  IQMS.Common.Numbers,
  IQMS.WebVcl.Trans,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.DatS,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.UI.Intf,
  MainModule;


function Get_FAB_MaterialException( AFab_Start_ID: Real ): string;
begin
  if IsOnExceptionList( AFab_Start_ID ) then
     Result:= TXT_MAT_EXCEP
  else
     Result:= TXT_READY;
end;

function Get_FAB_PrimaryMatState( AFAB_Start_ID: Real ): string;
var
  AWO_Qty: Real;
begin
  if SelectValueFmtAsFloat('select count(*) from fab_lot where fab_start_id = %f', [ AFAB_Start_ID ]) = 0 then
  begin
    Result:= TXT_LOT_NOT_ASSIGNED;
    EXIT;
  end;

  if SelectValueFmtAsFloat('select count(*) from v_lot_track where fab_start_id = %f and fab_mat_arinvt_id is not NULL', [ AFAB_Start_ID ]) = 0 then
  begin
    Result:= TXT_NOT_APPLICABLE;
    EXIT;
  end;

  {do we have prim material location assigned?}
  if SelectValueFmtAsFloat('select 1 from v_lot_track_ex where fab_start_id = %f and fab_process_sndop_id is NULL '+
               '   and fab_wo_is_start = ''Y'' and fab_mat_arinvt_id is not NULL and fab_loc_fgmulti_id is NULL', [ AFAB_Start_ID ]) = 1 then
  begin
    Result:= TXT_LOC_NOT_ASSIGNED;
    EXIT;
  end;

  AWO_Qty:= SelectValueFmtAsFloat('select sum(ptorder_rel.rel_quan)                     '+
                      '  from fab_start,                                    '+
                      '       ptorder,                                      '+
                      '       partno,                                       '+
                      '       ptorder_rel                                   '+
                      ' where                                               '+
                      '       fab_start.id = %f                             '+
                      '   and fab_start.workorder_id = ptorder.workorder_id '+
                      '   and ptorder.partno_id = partno.id                 '+
                      '   and partno.arinvt_id = fab_start.arinvt_id        '+
                      '   and ptorder_rel.ptorder_id = ptorder.id           ',
                      [ AFAB_Start_ID ]);

  // not sure if this check is needed
  // if (AWO_Qty > 0) and (AWO_Qty <> SelectValueFmtAsFloat('select sum(start_qty) from fab_lot where fab_start_id = %f', [ AFAB_Start_ID ])) then
  // begin
  //   Result:= TXT_QTY_MISMATCH;
  //   EXIT;
  // end;

  Result:= TXT_READY;
end;

function Get_FAB_AttachedMatState( AFAB_Start_ID: Real ): string;
begin
  if SelectValueFmtAsFloat('select count(*) from v_lot_track where fab_start_id = %f and fab_mat_arinvt_id is not NULL', [ AFAB_Start_ID ]) = 0 then
  begin
    Result:= TXT_NOT_APPLICABLE;
    EXIT;
  end;

  {do we have attached material location assigned?}
  if SelectValueFmtAsFloat('select 1 from v_lot_track_ex where fab_start_id = %f and fab_process_sndop_id is not NULL '+
               '   and fab_mat_arinvt_id is not NULL and fab_loc_fgmulti_id is NULL and fab_mat_alloc_req = ''Y''', [ AFAB_Start_ID ]) = 1 then
  begin
    Result:= TXT_ATT_MAT_LOC_NOT_ASSIGNED;
    EXIT;
  end;

  Result:= TXT_READY;
end;

function IsOnExceptionListByWorkorder( AWorkOrder_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select 1                                                          '+
                     '  from day_hrs h,                                                 '+
                     '       day_pts p,                                                 '+
                     '       day_use u                                                  '+
                     ' where h.workorder_id = %f                                        '+
                     '   and rownum < 2                                                 '+
                     '   and h.id = p.day_hrs_id                                        '+
                     '   and p.id = u.day_pts_id                                        '+
                     '   and exists (select 1 from xcpt_mat_req x                       '+
                     '                where u.arinvt_id = x.arinvt_id                   '+
                     '                  and h.prod_date >= x.must_arrive                '+
                     '                  and NVL(h.division_id,0) = NVL(x.division_id,0))',
                     [ AWorkOrder_ID ]) = 1;
end;


function IsOnExceptionList( AFAB_Start_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select 1                                                            '+
                     '   from                                                             '+
                     '        day_hrs h,                                                  '+
                     '        day_pts p,                                                  '+
                     '        day_use u,                                                  '+
                     '                                                                    '+
                     '        (select fab_wo_workorder_id,                                '+
                     '                fab_mat_arinvt_id                                   '+
                     '           from                                                     '+
                     '                v_lot_track                                         '+
                     '          where                                                     '+
                     '                fab_start_id = %f                                   '+
                     //               -- consider attached components or primary material for only starting wo
                     '            and (fab_process_sndop_id is not NULL                   '+
                     '                 or                                                 '+
                     '                 fab_wo_is_start = ''Y'')                           '+
                     '             and fab_mat_arinvt_id is not NULL ) lot                '+
                     '                                                                    '+
                     '  where                                                             '+
                     //       look only at workorders that for that fab_start
                     '        h.workorder_id = lot.fab_wo_workorder_id                    '+
                     '    and h.id = p.day_hrs_id                                         '+
                     '    and p.id = u.day_pts_id                                         '+
                     '                                                                    '+
                     //       not only for hard allocated arinvt_id
                     '    and u.arinvt_id = lot.fab_mat_arinvt_id                         '+
                     '                                                                    '+
                     //       and on the exception list
                     '    and exists (select 1 from xcpt_mat_req x                        '+
                     '                 where u.arinvt_id = x.arinvt_id                    '+
                     '                   and h.prod_date >= x.must_arrive                 '+
                     '                   and NVL(h.division_id,0) = NVL(x.division_id,0)) '+
                     '    and rownum < 2                                                  ',
                     [ AFAB_Start_ID ]) = 1;
end;

function Get_FAB_LotSize( AWorkOrder_ID, AArinvt_ID: Real ): Real;
begin
  Result:= SelectValueFmtAsFloat('select partno.actcav                 '+
                     '  from ptorder,                      '+
                     '       partno                        '+
                     ' where ptorder.workorder_id = %f     '+
                     '   and ptorder.partno_id = partno.id '+
                     '   and partno.arinvt_id = %f         ',
                     [ AWorkOrder_ID, AArinvt_ID ]);
end;

function Get_FAB_Arinvt_ID_Mat_FromFAB_Start( AFab_Start_ID: Real ): Real;
begin
  Result:= SelectValueFmtAsFloat('select s.arinvt_id_mat           '+
                     '  from                           '+
                     '       fab_start fab,            '+
                     '       workorder w,              '+
                     '       standard s                '+
                     ' where                           '+
                     '       fab.id = %f               '+
                     '   and fab.workorder_id = w.id   '+
                     '   and w.standard_id = s.id      ',
                     [ AFab_Start_ID ]);
end;

function Get_FAB_Standard_ID( AFab_Lot_ID: Real ): Real;
begin
  Result:= SelectValueFmtAsFloat('select w.standard_id             '+
                     '  from                           '+
                     '       fab_lot lot,              '+
                     '       fab_start fab,            '+
                     '       workorder w               '+
                     ' where                           '+
                     '       lot.id = %f               '+
                     '   and lot.fab_start_id = fab.id '+
                     '   and fab.workorder_id = w.id   ',
                     [ AFab_Lot_ID ]);
end;


function Split_FAB_Lot( ASrc_Fab_Lot_ID, AQty: Real; AUser_Suggested_New_Fab_Lot_ID: Real = 0; AUser_Suggested_New_Fab_LotNo: string = '' ): Real;
var
  AFGMulti_ID    : Real;
  AOrig_Qty      : Real;
  ATrg_Fab_Lot_ID: Real;

  function SplitQty( ASrc_Fab_Lot_ID, AQty: Real ): Real;
  var
    I        : Integer;
    AFabLotNo: string;
  begin
    {new fab_lot}
    if AUser_Suggested_New_Fab_Lot_ID > 0 then
      Result:= AUser_Suggested_New_Fab_Lot_ID
    else
      Result:= GetNextID( 'fab_lot' );

    {new fab lotno}
    if AUser_Suggested_New_Fab_LotNo > '' then
       AFabLotNo:= AUser_Suggested_New_Fab_LotNo
    else
       AFabLotNo:= FloatToStr( Result );

    ExecuteCommandFmt('declare                                           '+
              '  v_rec fab_lot%%rowtype;                         '+
              'begin                                             '+
              '  select * into v_rec from fab_lot where id = %f; '+
              '  insert into fab_lot                             '+
              '        (id,                                      '+
              '         fab_start_id,                            '+
              '         lotno,                                   '+
              '         workorder_id,                            '+
              '         arinvt_id,                               '+
              '         sndop_id,                                '+
              '         work_center_id,                          '+
              '         seq,                                     '+
              '         start_qty,                               '+
              '         fgmulti_id,                              '+
              '         start_time,                              '+
              '         end_time,                                '+
              '         in_transit,                              '+
              '         rework,                                  '+
              '         split_parent_id,                         '+
              '         rework_note)                             '+
              '  values                                          '+
              '       ( %f,                                      '+
              '         v_rec.fab_start_id,                      '+
              '         ''%s'',                                  '+
              '         v_rec.workorder_id,                      '+
              '         v_rec.arinvt_id,                         '+
              '         v_rec.sndop_id,                          '+
              '         v_rec.work_center_id,                    '+
              '         v_rec.seq,                               '+
              '         %f,                                      '+
              '         v_rec.fgmulti_id,                        '+
              '         v_rec.start_time,                        '+
              '         v_rec.end_time,                          '+
              '         v_rec.in_transit,                        '+
              '         v_rec.rework,                            '+
              '         %f,                                      '+
              '         v_rec.rework_note );                     '+
              'end;                                              ',
              [ ASrc_Fab_Lot_ID,             {original, source lot id}
                Result,                      {new lot id}
                AFabLotNo,                   {lotno}
                0.0,                         {start_qty. Note we inserted 0 to keep trigger that generates fab_lot_detail idle}
                ASrc_Fab_Lot_ID ]);          {split_parent_id}

    {old/new fab_lot_detail - just change the parent. start from the bottom}
    ExecuteCommandFmt('declare                                                                      '+
              '  v_count  number::= %f;                                                     '+
              'begin                                                                        '+
              '  for v in (select id from fab_lot_detail                                    '+
              '             where fab_lot_id = %f and rejects_id is NULL order by seq desc) '+
              '  loop                                                                       '+
              '    update fab_lot_detail set fab_lot_id = %f where id = v.id;               '+
              '    v_count::= v_count - 1;                                                  '+
              '    if v_count <= 0 then                                                     '+
              '       return;                                                               '+
              '    end if;                                                                  '+
              '  end loop;                                                                  '+
              'end;                                                                         ',
              [ AQty,
                ASrc_Fab_Lot_ID,
                Result ]);

    {old fab_lot - update qty}
    ExecuteCommandFmt('update fab_lot set start_qty = %f where id = %f',
              [ DtoF(SelectValueByID('start_qty', 'fab_lot', ASrc_Fab_Lot_ID)) - AQty,
                ASrc_Fab_Lot_ID ]);
  end;

  procedure MoveFromSplitted;
  begin
    with TFDQuery.Create(NIL) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add(IQFormat('select trg.fab_loc_quan       as trg_fab_loc_quan,       '+
                       '       trg.fab_loc_fgmulti_id as trg_fab_loc_fgmulti_id, '+
                       '       src.fab_loc_fgmulti_id as src_fab_loc_fgmulti_id  '+
                       '  from v_lot_track_ex trg,                               '+
                       '       v_lot_track_ex src                                '+
                       ' where trg.fab_lot_id = %f                               '+
                       '   and src.fab_lot_id = %f                               '+
                       '   and trg.fab_loc_split_parent_id = src.fab_loc_id',
                        [ ATrg_Fab_Lot_ID,
                          ASrc_Fab_Lot_ID ]));
      Open;
      while not Eof do
      begin
        {actual move}
        with TIQWebTransMove.Create( NIL ) do
        try
          MoveFrom_FGMulti_ID  := FieldByName('src_fab_loc_fgmulti_id').asFloat;
          MoveTo_FGMulti_ID    := FieldByName('trg_fab_loc_fgmulti_id').asFloat;
          Trans_Quan           := FieldByName('trg_fab_loc_quan').asFloat;
          Trans_RG_Quan        := 0;
          Trans_Reason         := 'FAB LOT SPLIT';
          TransOut.Fab_Lot_ID  := ASrc_Fab_Lot_ID;
          TransIn.Fab_Lot_ID   := ATrg_Fab_Lot_ID;
          Execute;
        finally
          Free;
        end;

        Next;
      end;
    finally
      Free;
    end;
  end;


{ MAIN of Split_FAB_Lot }
begin
  AOrig_Qty:= SelectValueByID('start_qty', 'fab_lot', ASrc_Fab_Lot_ID );

  {validate}
  IQAssert( SelectValueByID('lotno', 'fab_lot', ASrc_Fab_Lot_ID ) > '', fab_msg1002 );        // 'Lot # is not assigned'
  IQAssert( AQty < AOrig_Qty, fab_msg1000 );  // 'Split qty must be less than original lot qty'

  with FDManager.FindConnection('IQFD') do
  begin
    StartTransaction;
    try
      {Split}
      ATrg_Fab_Lot_ID:= SplitQty( ASrc_Fab_Lot_ID, AQty ); {local above}

      {Clone rows. Prepare fgmulti and quan in fab_lot_mat and fab_lot_mat_loc. We will do the actual transaction next step}
      ExecuteCommandFmt('begin fab.clone_rows_for_split( %f, %f, %.8f ); end;', [ ASrc_Fab_Lot_ID, ATrg_Fab_Lot_ID, AQty / AOrig_Qty ]);

      {Actual transaction - Move}
      MoveFromSplitted; {local above}

      {Update hard allocated material quan}
      PropagateRatioToHardAllocMaterialQuan( ASrc_Fab_Lot_ID, (1 - AQty / AOrig_Qty ));

      {Update new fab_lot record - start_qty. Note: fab_lot_detail records already exists when we called SplitLotQty}
      ExecuteCommandFmt('update fab_lot set start_qty = %.6f where id = %f', [ AQty, ATrg_Fab_Lot_ID ]);

      Commit;
      Result:= ATrg_Fab_Lot_ID;
    finally
      if InTransaction then
         RollBack;
    end;
  end;
end;

procedure PropagateRatioToHardAllocMaterialQuan( AFab_Lot_ID, ARatio: Real );
var
  ACurrWOSeq: Real;
begin
  ACurrWOSeq:= SelectValueFmtAsFloat('select b.seq from fab_lot a, fab_lot_wo b '+
                         ' where a.id = %f and b.fab_lot_id = a.id  '+
                         '   and b.workorder_id = a.workorder_id    ',
                         [ AFab_Lot_ID ]);

  ExecuteCommandFmt('update fab_lot_mat                         '+
            '   set quan = Round(quan * %.8f)           '+
            ' where id in                               '+
            '       (select fab_mat_id from v_lot_track '+
            '         where fab_lot_id = %f             '+
            '           and fab_wo_seq >= %f)           ',
            [ ARatio,
              AFab_Lot_ID,
              ACurrWOSeq ]);

  // June-13-2005 - do not reduce the hard alloc materials as we use that
  // qty to populate work_mat_req_loc. On the other had we calc mat req on fly
  // based on dispo_cycles_based and taking either fab_lot_process start_qty or end_qty
  // The will get out of sync if I reduce the hard alloc mat

  // ExecuteCommandFmt('update fab_lot_mat_loc                        '+
  //           '   set quan = Round(quan * %.8f)              '+
  //           ' where id in                                  '+
  //           '       (select fab_loc_id from v_lot_track_ex '+
  //           '         where fab_lot_id = %f                '+
  //           '           and fab_wo_seq >= %f)              ',
  //           [ ARatio,
  //             AFab_Lot_ID,
  //             ACurrWOSeq ]);
end;

end.


