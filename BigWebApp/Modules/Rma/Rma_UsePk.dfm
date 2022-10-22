object FrmRmaUseMatPk: TFrmRmaUseMatPk
  Left = 167
  Top = 145
  ClientHeight = 282
  ClientWidth = 643
  Caption = 'Repair Material Picklist'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 643
    Height = 33
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnUseRepairItemList: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 31
      Height = 31
      Hint = 'Use Predefined Repair Item List'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      ParentShowHint = False
      GroupIndex = 1
      AllowAllUp = True
      Glyph.Data = {
        6E040000424D6E04000000000000360000002800000013000000120000000100
        18000000000038040000C40E0000C40E00000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0BD0000C0C0C0BD0000C0C0C0BD0000C0C0C0BD0000C0C0C0BD0000C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0BD0000
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0BD0000BD0000BD0000C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0BD0000C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0BD0000C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
        0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0BD0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0
        C0C0C0C0C0C0C0000000000000000000000000000000000000C0C0C0C0C0C000
        0000000000000000000000000000000000C0C0C0C0C0C0000000C0C0C0000000
        000000000000FFFFFF00FFFFFFFFFF00FFFF000000000000000000000000FFFF
        FF00FFFFFFFFFF00FFFF000000C0C0C0C0C0C0000000C0C0C0000000FFFFFF00
        0000000000000000000000000000000000000000FFFFFF000000000000000000
        000000000000000000C0C0C0C0C0C0000000C0C0C0000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000C0C0C0C0C0C0C0C0C0000000C0C0C0000000FFFFFF808080808080808080
        FFFFFF000000C0C0C0000000FFFFFF808080808080808080FFFFFF000000C0C0
        C0C0C0C0C0C0C0000000C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0
        C0C0C0000000C0C0C0000000FFFFFF808080808080808080FFFFFF000000C0C0
        C0000000FFFFFF808080808080808080FFFFFF000000C0C0C0C0C0C0C0C0C000
        0000C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0000000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0C0C0C0000000C0C0
        C0000000000000000000000000000000000000000000C0C0C000000000000000
        0000000000000000000000000000C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnUseRepairItemListClick
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 235
    Width = 643
    Height = 47
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Tag = 1999
      Left = 384
      Top = 1
      Width = 259
      Height = 45
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object bbtnAssign: TUniBitBtn
        Left = 6
        Top = 10
        Width = 120
        Height = 31
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Glyph.Data = {
          46010000424D460100000000000076000000280000001A0000000D0000000100
          040000000000D000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDDDDDDDDD000000DDDDDD0DDDDDDDDDDDD7FDDDDD000000DDDDD00DDDDD
          DDDDDD77FDDDDD000000DDDD060DDDDDDDDDD7D7FFFFFD000000DDD06600000D
          DDDD7DD77777FD000000DD066666660DDDD7DDDDDDD7FD000000D0666666660D
          DD78FDDDDDD7FD000000DD066666660DDDD78FDDFFF7FD000000DDD06600000D
          DDDD78F77777DD000000DDDD060DDDDDDDDDD787FDDDDD000000DDDDD00DDDDD
          DDDDDD77FDDDDD000000DDDDDD0DDDDDDDDDDDD7DDDDDD000000DDDDDDDDDDDD
          DDDDDDDDDDDDDD000000}
        Caption = 'Assign'
        TabOrder = 0
        OnClick = bbtnAssignClick
      end
      object btnCancel: TUniButton
        Left = 132
        Top = 10
        Width = 119
        Height = 31
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object srchArinvt: TIQUniGridControl
    Left = 0
    Top = 33
    Width = 643
    Height = 202
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 426
    IQComponents.Grid.Height = 116
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
    IQComponents.HiddenPanel.Left = 426
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 116
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
        FieldName = 'ITEMNO'
        Title.Caption = 'Item #'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 168
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REV'
        Title.Caption = 'Revision'
        Width = 91
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP2'
        Title.Caption = 'Extended Description'
        Width = 210
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CLASS'
        Title.Caption = 'Class'
        Width = 28
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPLANT_ID'
        Title.Caption = 'EPlant ID'
        Width = 63
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 69
    Top = 121
  end
  object Query1: TFDQuery
    BeforeOpen = Query1BeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       itemno,'
      '       descrip,'
      '       descrip2,'
      '       class, '
      '       rev,'
      '       eplant_id'
      '  from arinvt'
      ' where '
      '       ( :prod_code_id = -1'
      '        or'
      '         id in '
      '          ( select arinvt_id '
      '              from repair_item_list'
      '             where prod_code_id = :prod_code_id ))'
      '       and misc.eplant_filter( arinvt.eplant_id ) = 1'
      '         '
      '       '
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 142
    Top = 118
    ParamData = <
      item
        Name = 'prod_code_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object Query1ITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 20
      FieldName = 'ITEMNO'
      Origin = 'arinvt.itemno'
      FixedChar = True
      Size = 50
    end
    object Query1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 24
      FieldName = 'DESCRIP'
      Origin = 'arinvt.descrip'
      Size = 100
    end
    object Query1REV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 13
      FieldName = 'REV'
      Origin = 'arinvt.rev'
      FixedChar = True
      Size = 15
    end
    object Query1DESCRIP2: TStringField
      DisplayLabel = 'Extended Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'arinvt.descrip2'
      Size = 100
    end
    object Query1CLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      Origin = 'arinvt.class'
      FixedChar = True
      Size = 2
    end
    object Query1EPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 9
      FieldName = 'EPLANT_ID'
      Origin = 'arinvt.eplant_id'
      Size = 0
    end
    object Query1ID: TBCDField
      FieldName = 'ID'
      Origin = 'arinvt.id'
      Visible = False
      Size = 0
    end
  end
end
