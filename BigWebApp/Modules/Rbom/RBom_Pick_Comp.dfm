object FrmRBom_Pick_Comp: TFrmRBom_Pick_Comp
  Left = 136
  Top = 144
  ClientHeight = 330
  ClientWidth = 565
  Caption = 'Add Components'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TUniPanel
    Left = 0
    Top = 290
    Width = 565
    Height = 40
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitTop = 177
    ExplicitWidth = 511
    object Label1: TUniLabel
      Left = 8
      Top = 12
      Width = 24
      Height = 13
      Hint = ''
      Caption = 'Type'
      TabOrder = 2
    end
    object ComboBox1: TUniComboBox
      Left = 42
      Top = 8
      Width = 108
      Height = 21
      Hint = ''
      Style = csDropDownList
      Text = ''
      Items.Strings = (
        'Packaging'
        'Components')
      TabOrder = 3
      OnChange = ComboBox1Change
    end
    object Panel1: TUniPanel
      Tag = 1999
      Left = 253
      Top = 1
      Width = 311
      Height = 38
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitLeft = 199
      object btnOK: TUniButton
        Left = 0
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnNew: TUniButton
        Left = 208
        Top = 8
        Width = 97
        Height = 25
        Hint = 'Create new component'
        ShowHint = True
        ParentShowHint = False
        Caption = '&New'
        TabOrder = 2
        OnClick = btnNewClick
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 3
      end
    end
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 565
    Height = 290
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 348
    IQComponents.Grid.Height = 204
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
    IQComponents.HiddenPanel.Left = 348
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 204
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitLeft = 294
    IQComponents.HiddenPanel.ExplicitHeight = 91
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitWidth = 503
    IQComponents.FormTab.ExplicitHeight = 120
    DataSource = wwDataSource1
    Columns = <
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item #'
        Width = 112
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CLASS'
        Title.Caption = 'Class'
        Width = 35
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REV'
        Title.Caption = 'Rev'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 154
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP2'
        Title.Caption = 'Ext Description'
        Width = 147
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'UNIT'
        Title.Caption = 'Unit'
        Width = 42
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPLANT_ID'
        Title.Caption = 'EPlant ID'
        Width = 56
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'NON_MATERIAL'
        Title.Caption = 'Non Material '
        Width = 7
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitLeft = -1
    ExplicitTop = 2
    ExplicitWidth = 511
    ExplicitHeight = 177
    Marker = 0
  end
  object wwDataSource1: TDataSource
    DataSet = wwQryArinvt
    Left = 144
    Top = 75
  end
  object wwQryArinvt: TFDQuery
    BeforeOpen = wwQryArinvtBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.itemno,'
      '       a.class,'
      '       a.rev,'
      '       a.descrip,'
      '       a.descrip2,'
      '       a.unit,'
      '       a.id,'
      '       a.eplant_id,'
      '       a.non_material'
      '  from arinvt a,'
      '       arinvt_class c'
      ' where a.class = c.class'
      '   and NVL(c.type, '#39' '#39') <> '#39'ROUTING'#39
      '   and ( :class = '#39'**'#39' or :class = a.class )'
      ''
      ' ')
    Left = 232
    Top = 75
    ParamData = <
      item
        Name = 'class'
        DataType = ftString
        ParamType = ptInput
      end>
    object wwQryArinvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 16
      FieldName = 'ITEMNO'
      Origin = 'a.ITEMNO'
      Size = 50
    end
    object wwQryArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 5
      FieldName = 'CLASS'
      Origin = 'a.CLASS'
      Size = 2
    end
    object wwQryArinvtREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 10
      FieldName = 'REV'
      Origin = 'a.rev'
      Size = 15
    end
    object wwQryArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 22
      FieldName = 'DESCRIP'
      Origin = 'a.DESCRIP'
      Size = 100
    end
    object wwQryArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 21
      FieldName = 'DESCRIP2'
      Origin = 'a.DESCRIP2'
      Size = 100
    end
    object wwQryArinvtUNIT: TStringField
      DisplayLabel = 'Unit'
      DisplayWidth = 6
      FieldName = 'UNIT'
      Origin = 'a.unit'
      Size = 10
    end
    object wwQryArinvtEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 8
      FieldName = 'EPLANT_ID'
      Origin = 'a.EPLANT_ID'
      Size = 0
    end
    object wwQryArinvtNON_MATERIAL: TStringField
      DisplayLabel = 'Non Material '
      DisplayWidth = 1
      FieldName = 'NON_MATERIAL'
      Origin = 'a.non_material'
      FixedChar = True
      Size = 1
    end
    object wwQryArinvtID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
end
