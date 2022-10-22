inherited FrmCRMCCUD: TFrmCRMCCUD
  Left = 327
  Top = 289
  ClientHeight = 246
  ClientWidth = 598
  Caption = 'Custom Telephone List'
  OldCreateOrder = True
  ExplicitWidth = 614
  ExplicitHeight = 285
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TUniPanel
    Width = 598
    ExplicitWidth = 342
  end
  inherited Panel1: TUniPanel
    Width = 598
    ExplicitWidth = 342
    inherited NavMain: TUniDBNavigator
      Left = 373
      DataSource = SrcCc
      ExplicitLeft = 117
    end
  end
  inherited Panel2: TUniPanel
    Width = 598
    Height = 216
    ExplicitWidth = 342
    ExplicitHeight = 128
    inherited Grid: TIQUniGridControl
      Width = 596
      Height = 214
      IQComponents.Grid.Width = 379
      IQComponents.Grid.Height = 128
      IQComponents.Grid.DataSource = SrcCc
      IQComponents.Navigator.DataSource = SrcCc
      IQComponents.HiddenPanel.Left = 379
      IQComponents.HiddenPanel.Height = 128
      IQComponents.HiddenPanel.ExplicitLeft = 123
      IQComponents.HiddenPanel.ExplicitHeight = 40
      IQComponents.FormTab.ExplicitWidth = 332
      IQComponents.FormTab.ExplicitHeight = 69
      DataSource = SrcCc
      Columns = <
        item
          FieldName = 'PHONE_NUMBER'
          Title.Caption = 'Telephone #'
          Width = 175
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DISPLAY'
          Title.Caption = 'Caller Name'
          Width = 175
          CheckBoxField.FieldValues = 'true;false'
        end>
      ExplicitWidth = 340
      ExplicitHeight = 126
      Marker = 0
    end
  end
  object SrcCc: TDataSource
    DataSet = QryCc
    Left = 120
    Top = 59
  end
  object QryCc: TFDQuery
    BeforeInsert = QryCcBeforeInsert
    OnNewRecord = QryCcNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT id, created, createdby, personal, phone_number, display'
      '  FROM ccid_custom'
      ' WHERE createdby = misc.getusername')
    Left = 176
    Top = 48
    object QryCcPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone #'
      DisplayWidth = 25
      FieldName = 'PHONE_NUMBER'
      Origin = 'phone_number'
      Size = 25
    end
    object QryCcDISPLAY: TStringField
      DisplayLabel = 'Caller Name'
      DisplayWidth = 25
      FieldName = 'DISPLAY'
      Origin = 'display'
      Size = 250
    end
    object QryCcCREATEDBY: TStringField
      DisplayLabel = 'Added By'
      DisplayWidth = 30
      FieldName = 'CREATEDBY'
      Origin = 'createdby'
      Visible = False
      Size = 30
    end
    object QryCcPERSONAL: TStringField
      DisplayLabel = 'Private?'
      DisplayWidth = 1
      FieldName = 'PERSONAL'
      Origin = 'personal'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryCcID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 0
    end
    object QryCcCREATED: TDateTimeField
      DisplayWidth = 18
      FieldName = 'CREATED'
      Origin = 'created'
      Visible = False
    end
  end
end
