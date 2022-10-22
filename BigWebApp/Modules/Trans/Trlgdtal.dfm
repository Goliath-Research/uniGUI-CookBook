inherited FrmTransLogBetweenDatesAll: TFrmTransLogBetweenDatesAll
  Caption = 'FrmTransLogBetweenDatesAll'
  ExplicitWidth = 532
  ExplicitHeight = 264
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBGridTransLog: TIQUniGridControl
    IQComponents.FormTab.ExplicitLeft = 4
    IQComponents.FormTab.ExplicitTop = 24
    IQComponents.FormTab.ExplicitWidth = 508
    IQComponents.FormTab.ExplicitHeight = 118
    Columns = <
      item
        FieldName = 'TRANS_DATE'
        Title.Caption = 'Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_IN_OUT'
        Title.Caption = 'In/Out'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_TYPE'
        Title.Caption = 'Trans Type'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_QUAN'
        Title.Caption = 'Tran Qty'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BEGIN_QUAN'
        Title.Caption = 'Start Qty'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'RG_QUAN'
        Title.Caption = 'Tran RG'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BEGIN_RG_QUAN'
        Title.Caption = 'Start RG'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LOC_DESC'
        Title.Caption = 'Location'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LOTNO'
        Title.Caption = 'Lot#'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ACT_COST'
        Title.Caption = 'Act Cost'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'STD_COST'
        Title.Caption = 'Std Cost'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_REASON'
        Title.Caption = 'Reason'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'USERID'
        Title.Caption = 'User'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FG_LOTNO'
        Title.Caption = 'FG Lot#'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Parent_ItemNo'
        Title.Caption = 'Parent Item #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'COST_ELEMENT'
        Title.Caption = 'Cost Element'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BATCH'
        Title.Caption = 'Batch'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FGMULTI_CUSER1'
        Title.Caption = 'User Text 1'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FGMULTI_CUSER2'
        Title.Caption = 'User Text 2'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FGMULTI_CUSER3'
        Title.Caption = 'User Text 3'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DIVISION_NAME'
        Title.Caption = 'Division'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'RECEIPTNO'
        Title.Caption = 'Receipt #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_CODE'
        Title.Caption = 'Tran Code'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_DESCRIP'
        Title.Caption = 'Tran Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LOCATION_DESCRIP'
        Title.Caption = 'Location Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BEGIN_QUAN_TOTAL'
        Title.Caption = 'Total Start Qty'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BEGIN_RG_QUAN_TOTAL'
        Title.Caption = 'Total Start RG'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPLANT_ID'
        Title.Caption = 'EPlant ID'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'POSTED'
        Title.Caption = 'Posted'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SYSTEM_DATE'
        Title.Caption = 'System Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'WORKORDER_ID'
        Title.Caption = 'WO #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CLASS'
        Title.Caption = 'Class'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP2'
        Title.Caption = 'Extended Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REV'
        Title.Caption = 'Revision'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MFGNO'
        Title.Caption = 'MFG #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'RECEIPT_COMMENT'
        Title.Caption = 'Comment'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FGMULTI_ID'
        Title.Caption = 'Location ID'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'END_QUAN'
        Title.Caption = 'End Qty'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'END_RG_QUAN'
        Title.Caption = 'End RG Qty'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  inherited Panel3: TUniPanel
    inherited NavTransLog: TUniDBNavigator
      ExplicitLeft = 415
    end
  end
  inherited QryTransLog: TFDQuery
    SQL.Strings = (
      'select /*+ INDEX(translog ix_translog_arinvt_id_desc) */'
      '       t.class                  as class              ,'
      '       t.itemno                 as itemno             ,'
      '       t.descrip                as descrip            ,'
      '       t.descrip2               as descrip2           ,'
      '       t.rev                    as rev                ,'
      '       t.trans_date             as trans_date         ,'
      '       t.trans_in_out           as trans_in_out       ,'
      '       t.trans_quan             as trans_quan         ,'
      '       t.rg_quan                as rg_quan            ,'
      '       t.trans_type             as trans_type         ,'
      '       t.loc_desc               as loc_desc           ,'
      '       t.lotno                  as lotno              ,'
      '       t.fg_lotno               as fg_lotno           ,'
      '       t.act_cost               as act_cost           ,'
      '       t.std_cost               as std_cost           ,'
      '       t.trans_reason           as trans_reason       ,'
      '       t.userid                 as userid             ,'
      '       t.begin_quan             as begin_quan         ,'
      '       t.begin_rg_quan          as begin_rg_quan      ,'
      '       t.parent_arinvt_id       as parent_arinvt_id   ,'
      '       t.batch                  as batch              ,'
      '       t.cost_element           as cost_element       ,'
      '       t.arinvt_id              as arinvt_id          ,'
      '       t.fgmulti_id             as fgmulti_id         ,'
      '       t.fgmulti_cuser1         as fgmulti_cuser1     ,'
      '       t.fgmulti_cuser2         as fgmulti_cuser2     ,'
      '       t.fgmulti_cuser3         as fgmulti_cuser3     ,'
      '       t.receiptno              as receiptno          ,'
      '       t.division_name          as division_name      ,'
      '       t.trans_code             as trans_code         ,'
      '       t.trans_descrip          as trans_descrip      ,'
      '       t.location_descrip       as location_descrip   ,'
      
        '       cast (t.id as number(15,0))                    as id     ' +
        '            ,'
      '       t.exclude_rpt            as exclude_rpt        ,'
      '       t.workorder_id           as workorder_id       ,'
      '       t.source                 as source             ,'
      '       t.source_id              as source_id          ,'
      '       t.begin_quan_total       as begin_quan_total   ,'
      '       t.begin_rg_quan_total    as begin_rg_quan_total,'
      '       t.eplant_id              as eplant_id          ,'
      '       t.posted                 as posted             ,'
      '       t.mfgno                  as mfgno              ,'
      '       t.day_part_id            as day_part_id        ,'
      '       t.act_date               as system_date        ,'
      '       t.receipt_comment        as receipt_comment    ,'
      '       po_receipts_unit_price     as po_receipts_unit_price    ,'
      '       case '
      
        '         when nvl(non_conform_id,0) = 0 or nvl(non_conform_alloc' +
        'atable, '#39'N'#39') = '#39'Y'#39' then '
      
        '              decode(NVL(trim(trans_in_out), '#39'IN'#39'), '#39'IN'#39', 1, (-1' +
        ')) * NVL(trans_quan, 0) + NVL(begin_quan_total, 0) '
      '         else NVL(begin_quan_total, 0)'
      '       end as end_quan,'
      '       '
      '       case '
      
        '         when nvl(non_conform_id,0) = 0 or nvl(non_conform_alloc' +
        'atable, '#39'N'#39') = '#39'Y'#39' then '
      
        '              decode(NVL(trim(trans_in_out), '#39'IN'#39'), '#39'IN'#39', 1, (-1' +
        ')) * NVL(rg_quan, 0) + NVL(begin_rg_quan_total, 0)'
      '         else NVL(begin_rg_quan_total, 0)'
      '       end as end_rg_quan'
      '       '
      '  from translog t,'
      '       arinvt a'
      ' where t.arinvt_id = :ID'
      '   and t.arinvt_id = a.id(+)'
      '   and rtrim(trans_type) not in ('#39'MOVE_LOCATION'#39','
      '                                 '#39'VMI MOVE_LOCATION'#39','
      '                                 '#39'VMI INTERPLANT XFER'#39' )'
      '   and Trunc(trans_date) between :date_start and :date_end'
      ''
      '   and case'
      
        '         when rtrim(trans_type) in ('#39'PO'#39', '#39'VOID RECEIVED PO'#39') th' +
        'en'
      '              po_misc.both_receipt_and_void_found( arinvt_id,'
      '                                                   :date_start,'
      '                                                   :date_end,'
      '                                                   trans_type,'
      '                                                   receiptno )'
      '       else'
      '         0'
      '       end = 0'
      ''
      '   and'
      ''
      '/* START TRANS_TYPE FILTER */'
      '   1=1'
      '/* END TRANS_TYPE FILTER */'
      ''
      '-- HPICK_PROPAGATE_SORT_START'
      '-- do not remove these comments'
      'order by t.ID desc'
      '-- HPICK_PROPAGATE_SORT_END'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'date_start'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'date_end'
        DataType = ftDateTime
        ParamType = ptInput
      end>
  end
end
