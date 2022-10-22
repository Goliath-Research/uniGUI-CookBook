object FrmShipmanUPSCustomValues: TFrmShipmanUPSCustomValues
  Left = 231
  Top = 191
  ClientHeight = 255
  ClientWidth = 728
  Caption = 'UPS Custom Values'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlGrid: TUniPanel
    Left = 0
    Top = 0
    Width = 728
    Height = 255
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitTop = 25
    ExplicitHeight = 230
    object GridCustomValues: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 726
      Height = 253
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 509
      IQComponents.Grid.Height = 167
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = srcCustomValues
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
      IQComponents.Navigator.DataSource = srcCustomValues
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 509
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 167
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitHeight = 142
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitHeight = 171
      DataSource = srcCustomValues
      Columns = <
        item
          FieldName = 'DisplayName'
          Title.Caption = 'Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SERVICE_CODE'
          Title.Caption = 'Service'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TYPE'
          Title.Caption = 'Type'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'VALUE'
          Title.Caption = 'Value'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      ExplicitHeight = 228
      Marker = 0
    end
    object cmbServiceCode: TUniDBComboBox
      Left = 384
      Top = 136
      Width = 121
      Height = 21
      Hint = ''
      TabOrder = 1
    end
    object cmbType: TUniDBComboBox
      Left = 512
      Top = 136
      Width = 121
      Height = 21
      Hint = ''
      Items.Strings = (
        'Amount Increase'#9'0'
        'Amount Decrease'#9'1'
        'Percent Increase'#9'2'
        'Percent Decrease'#9'3'
        'Fixed Value'#9'4')
      TabOrder = 2
    end
    object cmbCodes: TUniEdit
      Left = 16
      Top = 136
      Width = 275
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 3
      ReadOnly = True
    end
  end
  object tblCustomValues: TFDTable
    BeforePost = tblCustomValuesBeforePost
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'UPS_CUSTOM_VALUES'
    TableName = 'UPS_CUSTOM_VALUES'
    Left = 192
    Top = 8
    object tblCustomValuesDisplayName: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'DisplayName'
      LookupDataSet = qryCodes
      LookupKeyFields = 'CODE'
      LookupResultField = 'DISPLAYNAME'
      KeyFields = 'CODE'
      Size = 60
      Lookup = True
    end
    object tblCustomValuesSERVICE_CODE: TStringField
      DisplayLabel = 'Service'
      DisplayWidth = 30
      FieldName = 'SERVICE_CODE'
      Size = 60
    end
    object tblCustomValuesTYPE: TBCDField
      DisplayLabel = 'Type'
      DisplayWidth = 20
      FieldName = 'TYPE'
      Size = 0
    end
    object tblCustomValuesVALUE: TBCDField
      DisplayLabel = 'Value'
      DisplayWidth = 10
      FieldName = 'VALUE'
      Size = 2
    end
    object tblCustomValuesCODE: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 60
      FieldName = 'CODE'
      Visible = False
      Size = 60
    end
    object tblCustomValuesID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
  end
  object srcCustomValues: TDataSource
    DataSet = tblCustomValues
    Left = 168
    Top = 16
  end
  object qryCodes: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select displayname, code from v_ups_custom_value_codes ')
    Left = 328
    Top = 16
    object qryCodesDISPLAYNAME: TStringField
      FieldName = 'DISPLAYNAME'
      Origin = 'IQ.V_UPS_OPTION_COST.DISPLAYNAME'
      Size = 60
    end
    object qryCodesCODE: TStringField
      DisplayWidth = 21
      FieldName = 'CODE'
      Origin = 'IQ.V_UPS_OPTION_COST.CODE'
      Size = 60
    end
  end
  object srcCodes: TDataSource
    DataSet = qryCodes
    Left = 296
    Top = 16
  end
  object PkCodes: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select displayname, code from v_ups_custom_value_codes')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 224
    Top = 86
    object PkCodesDISPLAYNAME: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DISPLAYNAME'
      Origin = 'IQ.V_UPS_OPTION_COST.DISPLAYNAME'
      Size = 60
    end
  end
end
