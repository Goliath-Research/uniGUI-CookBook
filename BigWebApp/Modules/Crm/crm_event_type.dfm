inherited FrmCRMEventTypes: TFrmCRMEventTypes
  HelpContext = 5000305
  Caption = 'Event Types'
  OldCreateOrder = True
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
      DataSource = SrcCRMEventType
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
      IQComponents.Grid.DataSource = SrcCRMEventType
      IQComponents.Navigator.DataSource = SrcCRMEventType
      DataSource = SrcCRMEventType
      Marker = 0
    end
  end
  object SrcCRMEventType: TDataSource
    DataSet = QryCRMEventType
    Left = 168
    Top = 112
  end
  object QryCRMEventType: TFDQuery
    BeforeEdit = QryCRMEventTypeNewRecord
    OnNewRecord = QryCRMEventTypeNewRecord
    AfterApplyUpdates = DoAfterApplyUpdates
    Connection = UniMainModule.FDConnection1
    UpdateObject = QryCRMEventTypeUpdateSQL1
    SQL.Strings = (
      'SELECT id, name, descrip'
      '  FROM crm_event_type')
    Left = 168
    Top = 160
    object QryCRMEventTypeID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object QryCRMEventTypeNAME: TStringField
      DisplayLabel = 'Event Type'
      DisplayWidth = 12
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 35
    end
    object QryCRMEventTypeDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 26
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 255
    end
  end
  object PMain: TUniPopupMenu
    Left = 248
    Top = 155
    object Help1: TUniMenuItem
      Caption = '&Help'
      ShortCut = 112
      OnClick = Help1Click
    end
  end
  object QryCRMEventTypeUpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'INSERT INTO CRM_EVENT_TYPE'
      '(ID, NAME, DESCRIP)'
      'VALUES (:NEW_ID, :NEW_NAME, :NEW_DESCRIP)')
    ModifySQL.Strings = (
      'UPDATE CRM_EVENT_TYPE'
      'SET NAME = :NEW_NAME, DESCRIP = :NEW_DESCRIP'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM CRM_EVENT_TYPE'
      'WHERE ID = :OLD_ID')
    Left = 168
    Top = 208
  end
end
