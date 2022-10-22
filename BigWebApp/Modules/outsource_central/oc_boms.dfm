object FrmOutsourceBOMs: TFrmOutsourceBOMs
  Left = 91
  Top = 217
  ClientHeight = 273
  ClientWidth = 505
  Caption = 'Outsource BOM'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 273
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 503
      Height = 271
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 286
      IQComponents.Grid.Height = 185
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = DataSource1
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
      IQComponents.Navigator.DataSource = DataSource1
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 286
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 185
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = DataSource1
      Columns = <
        item
          FieldName = 'MFGNO'
          Title.Caption = 'Mfg #'
          Width = 133
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'VENDORNO'
          Title.Caption = 'Vendor #'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COMPANY'
          Title.Caption = 'Company'
          Width = 161
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ITEMNO'
          Title.Caption = 'Item #'
          Width = 168
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REV'
          Title.Caption = 'Rev'
          Width = 49
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Item Description'
          Width = 182
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP2'
          Title.Caption = 'Item Ext Description'
          Width = 210
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_ID'
          Title.Caption = 'EPlant ID'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EFFECT_DATE'
          Title.Caption = 'Effective Date'
          Width = 126
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DEACTIVE_DATE'
          Title.Caption = 'Inactive Date'
          Width = 126
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 88
    Top = 77
  end
  object Query1: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select standard.mfgno          as mfgno,'
      '       standard.mfg_type       as mfg_type,'
      '       arinvt.itemno           as itemno,'
      '       arinvt.rev              as rev,'
      '       arinvt.descrip          as descrip,'
      '       arinvt.descrip2         as descrip2,'
      '       v_vendor.vendorno       as vendorno,'
      '       arcusto.company         as company,'
      '       standard.id             as id,'
      '       standard.eplant_id      as eplant_id,'
      '       standard.effect_date    as effect_date,'
      '       standard.deactive_date  as deactive_date,'
      '       arinvt.id               as arinvt_id'
      '  from '
      '       standard, '
      '       partno, '
      '       arinvt, '
      '       arcusto,'
      '       v_vendor'
      ' where '
      '       standard.id = partno.standard_id(+)'
      '   and partno.arinvt_id = arinvt.id(+)'
      '   and NVL(standard.pk_hide, '#39'N'#39') <> '#39'Y'#39
      '   and standard.mfg_type = '#39'OUTSOURCE'#39
      '   and standard.cntr_type = v_vendor.vendorno'
      '   and v_vendor.id = arcusto.vendor_id_outsource'
      '   and misc.eplant_filter( standard.eplant_id ) = 1'
      ' '
      ' ')
    Left = 48
    Top = 150
    object Query1MFGNO: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 19
      FieldName = 'MFGNO'
      Origin = 'standard.mfgno'
      Size = 50
    end
    object Query1VENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      DisplayWidth = 10
      FieldName = 'VENDORNO'
      Origin = 'v_vendor.vendorno'
      FixedChar = True
      Size = 10
    end
    object Query1COMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 23
      FieldName = 'COMPANY'
      Origin = 'arcusto.company'
      Size = 60
    end
    object Query1ITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 24
      FieldName = 'ITEMNO'
      Origin = 'arinvt.itemno'
      FixedChar = True
      Size = 50
    end
    object Query1REV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 7
      FieldName = 'REV'
      Origin = 'arinvt.rev'
      FixedChar = True
      Size = 15
    end
    object Query1DESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 26
      FieldName = 'DESCRIP'
      Origin = 'arinvt.descrip'
      Size = 100
    end
    object Query1DESCRIP2: TStringField
      DisplayLabel = 'Item Ext Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'arinvt.descrip2'
      Size = 100
    end
    object Query1EPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'standard.eplant_id'
      Size = 0
    end
    object Query1EFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      DisplayWidth = 18
      FieldName = 'EFFECT_DATE'
      Origin = 'standard.effect_date'
    end
    object Query1DEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Inactive Date'
      DisplayWidth = 18
      FieldName = 'DEACTIVE_DATE'
      Origin = 'standard.deactive_date'
    end
    object Query1ID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object Query1ARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 125
    Top = 91
    object JumptoBOM1: TUniMenuItem
      Caption = 'Jump to BOM'
      OnClick = JumptoBOM1Click
    end
    object JumpToInventory1: TUniMenuItem
      Caption = 'Jump To Inventory'
      OnClick = JumpToInventory1Click
    end
  end
  object IQJumpBom: TIQWebJump
    DataField = 'ID'
    DataSource = DataSource1
    JumpTo = jtBom
    Left = 125
    Top = 111
  end
  object IQJumpInv: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = DataSource1
    JumpTo = jtInventory
    Left = 125
    Top = 128
  end
end
