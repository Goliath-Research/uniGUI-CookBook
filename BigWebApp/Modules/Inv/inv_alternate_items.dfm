object FrmInvAlternateItems: TFrmInvAlternateItems
  Left = 152
  Top = 242
  ClientHeight = 285
  ClientWidth = 582
  Caption = 'Alternate Items'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 582
    Height = 285
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 365
    IQComponents.Grid.Height = 199
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = wwDataSource1
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
    IQComponents.Navigator.DataSource = wwDataSource1
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 365
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 199
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = wwDataSource1
    Columns = <
      item
        FieldName = 'SEQ'
        Title.Caption = 'Seq#'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'AlternateItemCode'
        Title.Caption = 'Alternate Item Code'
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
        FieldName = 'REV'
        Title.Caption = 'Rev'
        Width = 64
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CLASS'
        Title.Caption = 'Class'
        Width = 64
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 64
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'NonCommited'
        Title.Caption = 'Non Commited'
        Width = 64
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ONHAND'
        Title.Caption = 'On Hand'
        Width = 64
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'UNIT'
        Title.Caption = 'UOM'
        Width = 64
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP2'
        Title.Caption = 'Ext Description'
        Width = 64
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object wwDataSource1: TDataSource
    DataSet = wwQuery1
    Left = 225
    Top = 130
  end
  object wwQuery1: TFDQuery
    BeforeOpen = wwQuery1BeforeOpen
    OnCalcFields = wwQuery1CalcFields
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select alt.id,'
      '       alt.parent_arinvt_id,'
      '       alt.arinvt_id,'
      '       a.itemno,'
      '       a.rev,'
      '       a.class,'
      '       a.descrip,'
      '       a.descrip2,'
      '       a.onhand,'
      '       a.unit,'
      '       alt.seq,'
      '       alt.alternate_item_code_id,'
      
        '       round(inv_misc.GetNonCommited( a.id ), 2) as non_committe' +
        'd'
      '  from arinvt_alternate alt, arinvt a'
      ' where alt.parent_arinvt_id = :arinvt_id'
      '   and alt.arinvt_id = a.id'
      ' order by a.itemno')
    Left = 121
    Top = 179
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
        Value = Null
      end>
    object wwQuery1SEQ: TBCDField
      DisplayLabel = 'Seq#'
      DisplayWidth = 10
      FieldName = 'SEQ'
      Origin = 'IQ.ARINVT_ALTERNATE.SEQ'
      Size = 0
    end
    object wwQuery1AlternateItemCode: TStringField
      DisplayLabel = 'Alternate Item Code'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'AlternateItemCode'
      Size = 25
      Calculated = True
    end
    object wwQuery1ITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'IQ.ARINVT.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object wwQuery1REV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 7
      FieldName = 'REV'
      Origin = 'IQ.ARINVT.REV'
      ReadOnly = True
      FixedChar = True
      Size = 15
    end
    object wwQuery1CLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      Origin = 'IQ.ARINVT.CLASS'
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object wwQuery1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 27
      FieldName = 'DESCRIP'
      Origin = 'IQ.ARINVT.DESCRIP'
      ReadOnly = True
      Size = 100
    end
    object wwQuery1NonCommited: TFloatField
      DisplayLabel = 'Non Commited'
      DisplayWidth = 13
      FieldKind = fkCalculated
      FieldName = 'NonCommited'
      ReadOnly = True
      Calculated = True
    end
    object wwQuery1ONHAND: TBCDField
      DisplayLabel = 'On Hand'
      DisplayWidth = 11
      FieldName = 'ONHAND'
      Origin = 'IQ.ARINVT.ONHAND'
      ReadOnly = True
    end
    object wwQuery1UNIT: TStringField
      DisplayLabel = 'UOM'
      DisplayWidth = 10
      FieldName = 'UNIT'
      Origin = 'IQ.ARINVT.UNIT'
      ReadOnly = True
      Size = 10
    end
    object wwQuery1DESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'IQ.ARINVT.DESCRIP2'
      ReadOnly = True
      Size = 100
    end
    object wwQuery1ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.ARINVT_ALTERNATE.ID'
      Visible = False
      Size = 0
    end
    object wwQuery1PARENT_ARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PARENT_ARINVT_ID'
      Origin = 'IQ.ARINVT_ALTERNATE.PARENT_ARINVT_ID'
      Visible = False
      Size = 0
    end
    object wwQuery1ARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.ARINVT_ALTERNATE.ARINVT_ID'
      Visible = False
      Size = 0
    end
    object wwQuery1ALTERNATE_ITEM_CODE_ID: TBCDField
      FieldName = 'ALTERNATE_ITEM_CODE_ID'
      Origin = 'IQ.ARINVT_ALTERNATE.ALTERNATE_ITEM_CODE_ID'
      Visible = False
      Size = 0
    end
    object wwQuery1NON_COMMITTED: TFMTBCDField
      FieldName = 'NON_COMMITTED'
      Visible = False
      Size = 38
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 480
    Top = 192
    object JumptoInventory1: TUniMenuItem
      Caption = 'Jump to &Inventory'
      OnClick = JumptoInventory1Click
    end
    object JumptoInventoryTransactionsLocations1: TUniMenuItem
      Caption = 'Jump to Inventory Locations && Transactions'
      OnClick = JumptoInventoryTransactionsLocations1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object CopyAlternateItems1: TUniMenuItem
      Caption = 'Copy Alternate Items'
      OnClick = CopyAlternateItems1Click
    end
    object ReplaceAlternateItems1: TUniMenuItem
      Caption = 'Replace Alternate Items'
      OnClick = ReplaceAlternateItems1Click
    end
  end
  object IQJumpInv: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = wwDataSource1
    JumpTo = jtInventory
    Left = 496
    Top = 120
  end
  object PkTrgArinvt: TIQWebHpick
    BeforeOpen = PkTrgArinvtBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.id,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.rev,'
      '       a.class,'
      '       a.descrip2,'
      '       a.onhand'
      '  from '
      '       arinvt a'
      ' where '
      '       misc.eplant_filter( a.eplant_id ) = 1'
      '   and a.id <> :arinvt_id'
      '    ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 268
    Top = 200
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkTrgArinvtID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkTrgArinvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object PkTrgArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkTrgArinvtREV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
    object PkTrgArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object PkTrgArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object PkTrgArinvtONHAND: TBCDField
      DisplayLabel = 'On Hand'
      FieldName = 'ONHAND'
    end
  end
end
