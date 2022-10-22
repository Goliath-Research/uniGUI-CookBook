object FrmCrmPriceBreaksSummary: TFrmCrmPriceBreaksSummary
  Left = 408
  Top = 257
  ClientHeight = 233
  ClientWidth = 206
  Caption = 'Price Breaks'
  OnShow = FormShow
  BorderStyle = bsSizeToolWin
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TUniPageControl
    Left = 0
    Top = 0
    Width = 206
    Height = 233
    Hint = ''
    ActivePage = TabBreaks
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabBreaks: TUniTabSheet
      Hint = ''
      Caption = 'Price Breaks'
      object Panel1: TUniPanel
        Left = 0
        Top = 0
        Width = 198
        Height = 205
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = 'No price breaks created for this item.'
        Color = clWindow
        object Grid: TIQUniGridControl
          Left = 1
          Top = 1
          Width = 196
          Height = 203
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 434
          IQComponents.Grid.Height = 117
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcBreaks
          IQComponents.Grid.LoadMask.Message = 'Loading data...'
          IQComponents.Grid.Align = alClient
          IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
          IQComponents.Grid.TabOrder = 0
          IQComponents.Navigator.Left = 410
          IQComponents.Navigator.Top = 0
          IQComponents.Navigator.Width = 241
          IQComponents.Navigator.Height = 25
          IQComponents.Navigator.Hint = ''
          IQComponents.Navigator.ShowHint = True
          IQComponents.Navigator.DataSource = SrcBreaks
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = -21
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 117
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcBreaks
          Columns = <
            item
              FieldName = 'QUAN'
              Title.Caption = 'Quantity'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'QPRICE'
              Title.Caption = 'Price'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DEACTIVE_DATE'
              Title.Caption = 'Inactive Date'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EFFECT_DATE'
              Title.Caption = 'Effective Date'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PRICE_DATE'
              Title.Caption = 'Price Date'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CURRENCY_DESCRIP'
              Title.Caption = 'Currency'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
      end
    end
    object TabTiers: TUniTabSheet
      Hint = ''
      ImageIndex = 1
      Caption = 'Tier Discounts'
      object Panel2: TUniPanel
        Left = 0
        Top = 0
        Width = 198
        Height = 205
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = 'No tier discounts created for this item.'
        Color = clWindow
        object GridTiers: TIQUniGridControl
          Left = 1
          Top = 1
          Width = 196
          Height = 203
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 434
          IQComponents.Grid.Height = 117
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcTiers
          IQComponents.Grid.LoadMask.Message = 'Loading data...'
          IQComponents.Grid.Align = alClient
          IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
          IQComponents.Grid.TabOrder = 0
          IQComponents.Navigator.Left = 410
          IQComponents.Navigator.Top = 0
          IQComponents.Navigator.Width = 241
          IQComponents.Navigator.Height = 25
          IQComponents.Navigator.Hint = ''
          IQComponents.Navigator.ShowHint = True
          IQComponents.Navigator.DataSource = SrcTiers
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = -21
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 117
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcTiers
          Columns = <
            item
              FieldName = 'QUAN'
              Title.Caption = 'Quantity'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DISCOUNT'
              Title.Caption = 'Discount'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
      end
    end
  end
  object SrcBreaks: TDataSource
    DataSet = QryArinvtBreaks
    Left = 72
    Top = 48
  end
  object QryArinvtBreaks: TFDQuery
    Tag = 1
    BeforeOpen = DatasetBeforeOpen
    AfterOpen = DataSetAfterOpen
    OnCalcFields = QryArinvtBreaksCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.quan, a.qprice, a.price_date, a.effect_date, '
      ' a.deactive_date, b.descrip as currency_descrip'
      'from arinvt_breaks a, currency b'
      'where                                                 '
      '  a.arinvt_id = :ID'
      '  and NVL( a.buying, '#39'N'#39' ) <> '#39'Y'#39
      '  and b.id(+) = a.currency_id'
      'order by a.quan')
    Left = 56
    Top = 120
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryArinvtBreaksQUAN: TBCDField
      DisplayLabel = 'Quantity'
      DisplayWidth = 14
      FieldName = 'QUAN'
      Size = 2
    end
    object QryArinvtBreaksQPRICE: TFMTBCDField
      DisplayLabel = 'Price'
      DisplayWidth = 14
      FieldName = 'QPRICE'
      Size = 6
    end
    object QryArinvtBreaksDEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Inactive Date'
      DisplayWidth = 18
      FieldName = 'DEACTIVE_DATE'
    end
    object QryArinvtBreaksEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      DisplayWidth = 18
      FieldName = 'EFFECT_DATE'
    end
    object QryArinvtBreaksPRICE_DATE: TDateTimeField
      DisplayLabel = 'Price Date'
      DisplayWidth = 18
      FieldName = 'PRICE_DATE'
    end
    object QryArinvtBreaksCURRENCY_DESCRIP: TStringField
      DisplayLabel = 'Currency'
      DisplayWidth = 20
      FieldName = 'CURRENCY_DESCRIP'
      Size = 50
    end
    object QryArinvtBreaksValid: TBooleanField
      DisplayLabel = 'Is Active?'
      FieldKind = fkCalculated
      FieldName = 'Valid'
      Visible = False
      Calculated = True
    end
  end
  object QryQinvtBreaks: TFDQuery
    Tag = 1
    BeforeOpen = DatasetBeforeOpen
    AfterOpen = DataSetAfterOpen
    OnCalcFields = QryArinvtBreaksCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'select quan, qprice, price_date, effect_date, deactive_date     ' +
        '             '
      'from qinvt_qty_breaks                                    '
      'where                                                 '
      '    qinvt_id = :id'
      'order by quan')
    Left = 56
    Top = 168
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryQinvtBreaksQUAN: TBCDField
      DisplayLabel = 'Quantity'
      DisplayWidth = 14
      FieldName = 'QUAN'
      Size = 0
    end
    object QryQinvtBreaksQPRICE: TFMTBCDField
      DisplayLabel = 'Price'
      DisplayWidth = 14
      FieldName = 'QPRICE'
      Size = 6
    end
    object QryQinvtBreaksDEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Inactive Date'
      DisplayWidth = 18
      FieldName = 'DEACTIVE_DATE'
    end
    object QryQinvtBreaksEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      DisplayWidth = 18
      FieldName = 'EFFECT_DATE'
    end
    object QryQinvtBreaksPRICE_DATE: TDateTimeField
      DisplayLabel = 'Price Date'
      DisplayWidth = 18
      FieldName = 'PRICE_DATE'
    end
    object QryQinvtBreaksValid: TBooleanField
      DisplayLabel = 'Is Active?'
      FieldKind = fkCalculated
      FieldName = 'Valid'
      Visible = False
      Calculated = True
    end
  end
  object QryAkaBreaks: TFDQuery
    BeforeOpen = DatasetBeforeOpen
    AfterOpen = DataSetAfterOpen
    OnCalcFields = QryArinvtBreaksCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '     aka_breaks.quan,'
      '     aka_breaks.qprice,'
      '     aka_breaks.price_date,'
      '     aka_breaks.effect_date,'
      '     aka_breaks.deactive_date'
      'from'
      '     aka, aka_breaks'
      'where'
      '     aka.arinvt_id = :id and'
      '     aka.arcusto_id = :arcusto_id and'
      '     aka_breaks.aka_id = aka.id')
    Left = 88
    Top = 120
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'arcusto_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryAkaBreaksQUAN: TBCDField
      DisplayLabel = 'Quantity'
      DisplayWidth = 14
      FieldName = 'QUAN'
      Origin = 'IQ.AKA_BREAKS.QUAN'
      Size = 2
    end
    object QryAkaBreaksQPRICE: TFMTBCDField
      DisplayLabel = 'Price'
      DisplayWidth = 14
      FieldName = 'QPRICE'
      Origin = 'IQ.AKA_BREAKS.QPRICE'
      Size = 6
    end
    object QryAkaBreaksDEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Inactive Date'
      DisplayWidth = 18
      FieldName = 'DEACTIVE_DATE'
      Origin = 'IQ.AKA_BREAKS.DEACTIVE_DATE'
    end
    object QryAkaBreaksEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      DisplayWidth = 18
      FieldName = 'EFFECT_DATE'
      Origin = 'IQ.AKA_BREAKS.EFFECT_DATE'
    end
    object QryAkaBreaksPRICE_DATE: TDateTimeField
      DisplayLabel = 'Price Date'
      DisplayWidth = 18
      FieldName = 'PRICE_DATE'
      Origin = 'IQ.AKA_BREAKS.PRICE_DATE'
    end
    object QryAkaBreaksValid: TBooleanField
      DisplayLabel = 'Is Active?'
      FieldKind = fkCalculated
      FieldName = 'Valid'
      Visible = False
      Calculated = True
    end
  end
  object SrcTiers: TDataSource
    DataSet = QryTiers
    Left = 129
    Top = 168
  end
  object QryTiers: TFDQuery
    BeforeOpen = DatasetBeforeOpen
    AfterOpen = QryTiersAfterOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select quan, discount from ('
      'select'
      '     ar_discount_aggregate.quan,'
      '     ar_discount_aggregate.discount'
      '     '
      'from'
      '     ar_discount_tiers,'
      '     ar_discount_aggregate,'
      '     arinvt,'
      '     arcusto'
      'where'
      '     arinvt.id = :id and'
      '     arcusto.id = :arcusto_id and'
      '     arcusto.cust_type_id = ar_discount_tiers.cust_type_id and'
      
        '     arinvt.item_type_id  = ar_discount_tiers.item_type_id(+) an' +
        'd'
      
        '     ar_discount_aggregate.ar_discount_tiers_id = ar_discount_ti' +
        'ers.id'
      '     and nvl(ar_discount_tiers.use_waterfall, '#39'N'#39') = '#39'N'#39
      '     and arinvt.ar_discount_waterfall_id is null'
      'union all'
      'select'
      '     ar_discount_waterfall_levels.quan,'
      '     ar_discount_aggregate.discount'
      '     '
      'from'
      '     ar_discount_tiers,'
      '     ar_discount_aggregate,'
      '     ar_discount_waterfall_levels,'
      '     arinvt,'
      '     arcusto'
      'where'
      '     arinvt.id = :id and'
      '     arcusto.id = :arcusto_id and'
      '     arcusto.cust_type_id = ar_discount_tiers.cust_type_id and'
      
        '     arinvt.item_type_id  = ar_discount_tiers.item_type_id(+) an' +
        'd'
      
        '     ar_discount_aggregate.ar_discount_tiers_id = ar_discount_ti' +
        'ers.id'
      '     and nvl(ar_discount_tiers.use_waterfall, '#39'N'#39') = '#39'Y'#39
      
        '     and arinvt.ar_discount_waterfall_id = ar_discount_waterfall' +
        '_levels.ar_discount_waterfall_id'
      
        '     and ar_discount_aggregate.quan_level = ar_discount_waterfal' +
        'l_levels.quan_level'
      ') order by quan'
      ''
      ''
      '    '
      ''
      ''
      '')
    Left = 136
    Top = 176
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'arcusto_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryTiersQUAN: TBCDField
      DisplayLabel = 'Quantity'
      DisplayWidth = 14
      FieldName = 'QUAN'
      Size = 2
    end
    object QryTiersDISCOUNT: TFMTBCDField
      DisplayLabel = 'Discount'
      DisplayWidth = 10
      FieldName = 'DISCOUNT'
      Size = 5
    end
  end
end
