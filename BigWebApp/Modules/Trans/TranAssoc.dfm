inherited FrmTransAssociate: TFrmTransAssociate
  Caption = 'Select Transaction to Associate with ...'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Splitter1: TUniSplitter
    Top = 105
    Align = alTop
    ExplicitTop = 105
  end
  inherited pnlTransLogDtls: TUniPanel
    Top = 108
    Height = 240
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    ExplicitTop = 108
    ExplicitHeight = 240
    inherited gridTransLogDtls: TUniDBGrid
      Height = 220
      Columns = <
        item
          FieldName = 'TRANS_DATE'
          Title.Caption = 'Date'
          Width = 112
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TRANS_QUAN'
          Title.Caption = 'Quantity'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LOC_DESC'
          Title.Caption = 'Location'
          Width = 94
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LOTNO'
          Title.Caption = 'Lot #'
          Width = 58
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TRANS_TYPE'
          Title.Caption = 'Transaction Type'
          Width = 91
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'RG_QUAN'
          Title.Caption = 'RG Quantity'
          Width = 41
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'WORKORDER_ID'
          Title.Caption = 'WO #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
  end
  inherited gridItems: TUniDBGrid
    Height = 75
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    Columns = <
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item #'
        Width = 304
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 151
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CLASS'
        Title.Caption = 'Class'
        Width = 33
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REV'
        Title.Caption = 'Rev'
        Width = 32
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'UNIT'
        Title.Caption = 'Unit'
        Width = 41
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPLANT_ID'
        Title.Caption = 'EPlant ID'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  inherited QryUniqueItems: TFDQuery
    SQL.Strings = (
      'select distinct'
      '       arinvt_id,'
      '       class,'
      '       itemno,'
      '       rev,'
      '       descrip,'
      '       unit, '
      '       eplant_id'
      '  from translog'
      ' where trans_in_out = '#39'IN'#39
      '   and trans_date between :date1 and :date2'
      '   and arinvt_id is not NULL'
      '   and NVL(parent_arinvt_id, 0) = 0'
      '   and mfgno = :mfgno'
      '   and trans_type in ('#39'MANUAL/BACKFLUSH'#39', '#39'DISPOSITION'#39')'
      '')
    ParamData = <
      item
        Name = 'date1'
        DataType = ftDateTime
      end
      item
        Name = 'date2'
        DataType = ftDateTime
      end
      item
        Name = 'mfgno'
        DataType = ftString
      end>
  end
  inherited QryTransLogDtl: TFDQuery
    SQL.Strings = (
      'select id,'
      '       trans_type,'
      '       trans_date,'
      '       trans_quan,'
      '       rg_quan,'
      '       loc_desc,'
      '       lotno,'
      '        workorder_id'
      '  from translog'
      ' where arinvt_id = :arinvt_id'
      '   and trans_date between :date1 and :date2'
      ' order by trans_date desc')
  end
  inherited PkItems: TIQWebHpick
    SQL.Strings = (
      'select distinct'
      '       arinvt_id,'
      '       class,'
      '       itemno,'
      '       rev,'
      '       descrip,'
      '       unit'
      '  from translog'
      ' where trans_in_out = '#39'IN'#39
      '   and trans_date between :date1 and :date2'
      '   and arinvt_id is not NULL'
      '   and mfgno = :mfgno'
      '   and trans_type in ('#39'MANUAL/BACKFLUSH'#39', '#39'DISPOSITION'#39')'
      ' '
      ' '
      ' ')
    ParamData = <
      item
        Name = 'date1'
        DataType = ftDateTime
      end
      item
        Name = 'date2'
        DataType = ftDateTime
      end
      item
        Name = 'mfgno'
        DataType = ftString
      end>
  end
end
