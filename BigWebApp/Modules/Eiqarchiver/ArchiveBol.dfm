object FrmArchBol: TFrmArchBol
  Left = 209
  Top = 174
  ClientHeight = 506
  ClientWidth = 500
  Caption = 'FrmArchBol'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 506
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel1: TUniPanel
      Left = 1
      Top = 464
      Width = 498
      Height = 41
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Panel2: TUniPanel
        Left = 288
        Top = 1
        Width = 209
        Height = 39
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object btnOk: TUniButton
          Left = 0
          Top = 8
          Width = 97
          Height = 25
          Hint = ''
          Caption = '&OK'
          TabOrder = 1
          OnClick = btnOkClick
        end
        object btnCancel: TUniButton
          Left = 104
          Top = 8
          Width = 97
          Height = 25
          Hint = ''
          Caption = '&Cancel'
          TabOrder = 2
          OnClick = btnCancelClick
        end
      end
    end
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 498
      Height = 463
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 281
      IQComponents.Grid.Height = 377
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
      IQComponents.HiddenPanel.Left = 281
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 377
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
          FieldName = 'SHIP_TO_ATTN'
          Title.Caption = 'Ship To'
          Width = 245
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BOL_DATE'
          Title.Caption = 'BOL Date'
          Width = 126
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BOLNO'
          Title.Caption = 'BOL #'
          Width = 105
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FREIGHT_DESCRIP'
          Title.Caption = 'Ship Via'
          Width = 210
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FOB'
          Title.Caption = 'FOB'
          Width = 105
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      Marker = 0
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 112
    Top = 64
  end
  object Query1: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select b.id,'
      '       b.bol_date,'
      '       b.bolno,'
      '       b.freight_descrip,'
      '       b.ship_to_attn,'
      '       b.fob'
      '  from bol b'
      ' where b.bol_date < :ADate'
      '   and NVL(b.archived, '#39'N'#39') = '#39'N'#39
      '')
    Left = 112
    Top = 128
    ParamData = <
      item
        Name = 'ADate'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object Query1SHIP_TO_ATTN: TStringField
      DisplayLabel = 'Ship To'
      DisplayWidth = 35
      FieldName = 'SHIP_TO_ATTN'
      Origin = 'b.SHIP_TO_ATTN'
      Size = 60
    end
    object Query1BOL_DATE: TDateTimeField
      DisplayLabel = 'BOL Date'
      DisplayWidth = 18
      FieldName = 'BOL_DATE'
      Origin = 'b.BOL_DATE'
    end
    object Query1BOLNO: TStringField
      DisplayLabel = 'BOL #'
      DisplayWidth = 15
      FieldName = 'BOLNO'
      Origin = 'b.BOLNO'
      Size = 15
    end
    object Query1FREIGHT_DESCRIP: TStringField
      DisplayLabel = 'Ship Via'
      DisplayWidth = 30
      FieldName = 'FREIGHT_DESCRIP'
      Origin = 'b.FREIGHT_DESCRIP'
      Size = 60
    end
    object Query1FOB: TStringField
      DisplayWidth = 15
      FieldName = 'FOB'
      Origin = 'b.fob'
      Size = 60
    end
    object Query1ID: TBCDField
      FieldName = 'ID'
      Origin = 'b.ID'
      Visible = False
      Size = 0
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 192
    Top = 88
    object JumptoBOL1: TUniMenuItem
      Caption = '&Jump to BOL'
      OnClick = JumptoBOL1Click
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmArchBol')
    SecurityCode = 'FRMARCHBOL'
    Left = 240
    Top = 88
  end
end
