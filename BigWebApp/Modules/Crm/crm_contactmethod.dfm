inherited FrmCRMMethodOfContact: TFrmCRMMethodOfContact
  HelpContext = 5000310
  Caption = 'Method of Contact'
  OldCreateOrder = True
  ExplicitWidth = 481
  ExplicitHeight = 326
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TUniPanel
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
  end
  inherited Panel1: TUniPanel
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    inherited NavMain: TUniDBNavigator
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = SrcContactMethod
    end
  end
  inherited Panel2: TUniPanel
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    inherited Grid: TIQUniGridControl
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      IQComponents.Grid.DataSource = SrcContactMethod
      IQComponents.Navigator.DataSource = SrcContactMethod
      DataSource = SrcContactMethod
      Marker = 0
    end
  end
  object SrcContactMethod: TDataSource
    DataSet = QryContactMethod
    Left = 112
    Top = 75
  end
  object QryContactMethod: TFDQuery
    OnNewRecord = QryContactMethodNewRecord
    AfterApplyUpdates = DoAfterApplyUpdates
    Connection = UniMainModule.FDConnection1
    UpdateObject = QryContactMethodUpdateSQL
    SQL.Strings = (
      'SELECT id, name, description, type '
      '  FROM crm_contact_method')
    Left = 112
    Top = 120
    object QryContactMethodID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object QryContactMethodNAME: TStringField
      DisplayLabel = 'Method Name'
      DisplayWidth = 14
      FieldName = 'NAME'
      Origin = 'NAME'
      FixedChar = True
      Size = 35
    end
    object QryContactMethodDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 23
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      Size = 255
    end
    object QryContactMethodTYPE: TBCDField
      FieldName = 'TYPE'
      Origin = '"TYPE"'
      Precision = 15
      Size = 0
    end
  end
  object PMain: TUniPopupMenu
    Left = 232
    Top = 155
    object Help1: TUniMenuItem
      Caption = '&Help'
      ShortCut = 112
      OnClick = Help1Click
    end
  end
  object QryContactMethodUpdateSQL: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'INSERT INTO CRM_CONTACT_METHOD'
      '(ID, NAME, DESCRIPTION, "TYPE")'
      'VALUES (:NEW_ID, :NEW_NAME, :NEW_DESCRIPTION, :NEW_TYPE)')
    ModifySQL.Strings = (
      'UPDATE CRM_CONTACT_METHOD'
      'SET NAME = :NEW_NAME, DESCRIPTION = :NEW_DESCRIPTION, '
      '  "TYPE" = :NEW_TYPE'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM CRM_CONTACT_METHOD'
      'WHERE ID = :OLD_ID')
    Left = 112
    Top = 168
  end
end
