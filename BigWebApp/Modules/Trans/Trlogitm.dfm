inherited FrmTransLogSingle: TFrmTransLogSingle
  Left = 349
  Top = 186
  HelpContext = 1088441
  Caption = 'FrmTransLogSingle'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBGridTransLog: TIQUniGridControl
    IQComponents.FormTab.ExplicitLeft = 0
    IQComponents.FormTab.ExplicitTop = 0
    IQComponents.FormTab.ExplicitWidth = 256
    IQComponents.FormTab.ExplicitHeight = 128
    Columns = <
      item
        FieldName = 'TRANS_DATE'
        Title.Caption = 'Date'
        Width = 112
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_IN_OUT'
        Title.Caption = 'In/Out'
        Width = 36
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_TYPE'
        Title.Caption = 'Trans Type'
        Width = 95
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRANS_QUAN'
        Title.Caption = 'Tran Qty'
        Width = 48
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BEGIN_QUAN'
        Title.Caption = 'Start Qty'
        Width = 48
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'RG_QUAN'
        Title.Caption = 'Tran RG'
        Width = 48
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BEGIN_RG_QUAN'
        Title.Caption = 'Start RG'
        Width = 48
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LOC_DESC'
        Title.Caption = 'Location'
        Width = 78
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LOTNO'
        Title.Caption = 'Lot#'
        Width = 73
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ACT_COST'
        Title.Caption = 'Act Cost'
        Width = 51
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
        Width = 111
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'USERID'
        Title.Caption = 'User'
        Width = 49
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FG_LOTNO'
        Title.Caption = 'FG Lot#'
        Width = 103
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Parent_ItemNo'
        Title.Caption = 'Parent Item #'
        Width = 100
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'COST_ELEMENT'
        Title.Caption = 'Cost Element'
        Width = 114
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
        Width = 154
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FGMULTI_CUSER2'
        Title.Caption = 'User Text 2'
        Width = 154
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FGMULTI_CUSER3'
        Title.Caption = 'User Text 3'
        Width = 154
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DIVISION_NAME'
        Title.Caption = 'Division'
        Width = 154
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'RECEIPTNO'
        Title.Caption = 'Receipt #'
        Width = 304
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
        Width = 154
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LOCATION_DESCRIP'
        Title.Caption = 'Location Description'
        Width = 138
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BEGIN_QUAN_TOTAL'
        Title.Caption = 'Total Start Qty'
        Width = 76
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BEGIN_RG_QUAN_TOTAL'
        Title.Caption = 'Total Start RG'
        Width = 72
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
        Width = 37
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SYSTEM_DATE'
        Title.Caption = 'System Date'
        Width = 112
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
        Width = 38
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item #'
        Width = 101
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 106
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP2'
        Title.Caption = 'Extended Description'
        Width = 122
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REV'
        Title.Caption = 'Revision'
        Width = 72
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MFGNO'
        Title.Caption = 'MFG #'
        Width = 304
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'RECEIPT_COMMENT'
        Title.Caption = 'Comment'
        Width = 1504
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
      end
      item
        FieldName = 'PO_RECEIPTS_UNIT_PRICE'
        Title.Caption = 'PO Receipt Cost'
        Width = 100
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  inherited QryTransLog: TFDQuery
    BeforeOpen = QryTransLogBeforeOpen
    SQL.Strings = (
      'select /*+ INDEX(translog ix_translog_arinvt_id_desc) */'
      '       class                  as class              ,'
      '       itemno                 as itemno             ,'
      '       descrip                as descrip            ,'
      '       descrip2               as descrip2           ,'
      '       rev                    as rev                ,'
      '       trans_date             as trans_date         ,'
      '       trans_in_out           as trans_in_out       ,'
      '       trans_quan             as trans_quan         ,'
      '       rg_quan                as rg_quan            ,'
      '       trans_type             as trans_type         ,'
      '       loc_desc               as loc_desc           ,'
      '       lotno                  as lotno              ,'
      '       fg_lotno               as fg_lotno           ,'
      '       act_cost               as act_cost           ,'
      '       std_cost               as std_cost           ,'
      '       trans_reason           as trans_reason       ,'
      '       userid                 as userid             ,'
      '       begin_quan             as begin_quan         ,'
      '       begin_rg_quan          as begin_rg_quan      ,'
      '       parent_arinvt_id       as parent_arinvt_id   ,'
      '       batch                  as batch              ,'
      '       cost_element           as cost_element       ,'
      '       arinvt_id              as arinvt_id          ,'
      '       fgmulti_id             as fgmulti_id         ,'
      '       fgmulti_cuser1         as fgmulti_cuser1     ,'
      '       fgmulti_cuser2         as fgmulti_cuser2     ,'
      '       fgmulti_cuser3         as fgmulti_cuser3     ,'
      '       receiptno              as receiptno          ,'
      '       division_name          as division_name      ,'
      '       trans_code             as trans_code         ,'
      '       trans_descrip          as trans_descrip      ,'
      '       location_descrip       as location_descrip   ,'
      '       cast(id as number(15)) as id                 ,'
      '       exclude_rpt            as exclude_rpt        ,'
      '       workorder_id           as workorder_id       ,'
      '       source                 as source             ,'
      '       source_id              as source_id          ,'
      '       begin_quan_total       as begin_quan_total   ,'
      '       begin_rg_quan_total    as begin_rg_quan_total,'
      '       eplant_id              as eplant_id          ,'
      '       posted                 as posted             ,'
      '       mfgno                  as mfgno              ,'
      '       day_part_id            as day_part_id        ,'
      '       act_date               as system_date,'
      '       receipt_comment     as receipt_comment,      '
      '       po_receipts_unit_price     as po_receipts_unit_price    ,'
      '       '
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
      '  from translog, dual'
      ' where '
      '       arinvt_id = :ID'
      '   and'
      '   '
      '/* START TRANS_TYPE FILTER */'
      '   1=1'
      '/* END TRANS_TYPE FILTER */'
      '         '
      '-- HPICK_PROPAGATE_SORT_START'
      '-- do not remove these comments'
      'order by ID desc'
      '-- HPICK_PROPAGATE_SORT_END')
    Left = 31
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  inherited IQAbout1: TIQWebAbout
    ModuleName = 'FrmTransLogSingle'
  end
end
