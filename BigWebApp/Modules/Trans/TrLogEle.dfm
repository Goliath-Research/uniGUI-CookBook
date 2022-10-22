inherited FrmTransLogElemBetweenDates: TFrmTransLogElemBetweenDates
  Left = 74
  Top = 139
  Caption = 'FrmTransLogElemBetweenDates'
  ClientHeight = 226
  ExplicitWidth = 532
  ExplicitHeight = 264
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBGridTransLog: TIQdbGrid
    Height = 176
  end
  inherited Panel3: TUniPanel
    inherited NavTransLog: TUniDBNavigator
    end
  end
  inherited StatusBar1: TUniStatusBar
    Top = 207
    ExplicitTop = 207
  end
  inherited QryTransLog: TFDQuery
    BeforeOpen = QryTransLogBeforeOpen
    SQL.Strings = (
      'select id                  as id                 ,'
      '       class               as class              ,'
      '       itemno              as itemno             ,'
      '       rev                 as rev                ,'
      '       descrip             as descrip            ,'
      '       descrip2            as descrip2           ,'
      '       trans_date          as trans_date         ,'
      '       trans_in_out        as trans_in_out       ,'
      '       trans_quan          as trans_quan         ,'
      '       rg_quan             as rg_quan            ,'
      '       trans_type          as trans_type         ,'
      '       loc_desc            as loc_desc           ,'
      '       lotno               as lotno              ,'
      '       fg_lotno            as fg_lotno           ,'
      '       act_cost            as act_cost           ,'
      '       std_cost            as std_cost           ,'
      '       trans_reason        as trans_reason       ,'
      '       userid              as userid             ,'
      '       begin_quan          as begin_quan         ,'
      '       begin_rg_quan       as begin_rg_quan      ,'
      '       batch               as batch              ,'
      '       cost_element        as cost_element       ,'
      '       parent_arinvt_id    as parent_arinvt_id   ,'
      '       arinvt_id           as arinvt_id          ,'
      '       fgmulti_id          as fgmulti_id         ,'
      '       fgmulti_cuser1      as fgmulti_cuser1     ,'
      '       fgmulti_cuser2      as fgmulti_cuser2     ,'
      '       fgmulti_cuser3      as fgmulti_cuser3     ,'
      '       receiptno           as receiptno          ,'
      '       division_name       as division_name      ,'
      '       trans_code          as trans_code         ,'
      '       trans_descrip       as trans_descrip      ,'
      '       location_descrip    as location_descrip   ,'
      '       exclude_rpt         as exclude_rpt        ,'
      '       workorder_id        as workorder_id       ,'
      '       source              as source             ,'
      '       source_id           as source_id          ,'
      '       begin_quan_total    as begin_quan_total   ,'
      '       begin_rg_quan_total as begin_rg_quan_total,'
      '       eplant_id           as eplant_id          ,'
      '       posted              as posted             ,'
      '       mfgno               as mfgno              ,'
      '       act_date            as system_date,'
      '       day_part_id         as day_part_id        ,'
      '       receipt_comment     as receipt_comment,'
      '       po_receipts_unit_price     as po_receipts_unit_price    ,'
      '                      '
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
      '  from translog'
      ' where '
      '       parent_arinvt_id = :arinvt_id'
      '   and trans_date between :date_start and :date_end'
      '   and rtrim( cost_element ) = :cost_element'
      ''
      '   and'
      '   '
      '/* START TRANS_TYPE FILTER */'
      '   1=1 '
      '/* END TRANS_TYPE FILTER */'
      '  '
      '-- HPICK_PROPAGATE_SORT_START'
      '-- do not remove these comments'
      ' order by ID desc'
      '-- HPICK_PROPAGATE_SORT_END')
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftFloat
        ParamType = ptInput
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
      end
      item
        Name = 'cost_element'
        DataType = ftString
        ParamType = ptInput
      end>
  end
end
