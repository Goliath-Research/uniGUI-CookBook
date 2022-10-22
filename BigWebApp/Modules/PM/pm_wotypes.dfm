object FrmPMWOTypes: TFrmPMWOTypes
  Left = 300
  Top = 193
  HelpContext = 1012204
  ClientHeight = 207
  ClientWidth = 259
  Caption = 'Work Order Types'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 259
    Height = 207
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlGrid: TUniPanel
      Left = 1
      Top = 1
      Width = 257
      Height = 205
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitTop = 27
      ExplicitHeight = 180
      object Grid: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 255
        Height = 203
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 38
        IQComponents.Grid.Height = 117
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcTypes
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
        IQComponents.Navigator.DataSource = SrcTypes
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 38
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 117
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.HiddenPanel.ExplicitHeight = 92
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        IQComponents.FormTab.ExplicitHeight = 121
        DataSource = SrcTypes
        Columns = <
          item
            FieldName = 'NAME'
            Title.Caption = 'Type Name'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIPTION'
            Title.Caption = 'Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        ExplicitHeight = 178
        Marker = 0
      end
    end
  end
  object SrcTypes: TDataSource
    DataSet = QryTypes
    Left = 144
    Top = 35
  end
  object PMain: TUniPopupMenu
    Left = 200
    Top = 43
    object Help1: TUniMenuItem
      Caption = 'Help'
      ShortCut = 112
      OnClick = Help1Click
    end
  end
  object QryTypes: TFDQuery
    OnNewRecord = QryTypesNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PMWO_TYPE'
    UpdateObject = FDUpdateSQL1
    SQL.Strings = (
      '  SELECT id,'
      '         name,'
      '         description'
      '    FROM pmwo_type'
      'ORDER BY id')
    Left = 144
    Top = 112
    object QryTypesNAME: TStringField
      DisplayLabel = 'Type Name'
      DisplayWidth = 16
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 35
    end
    object QryTypesDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      Size = 255
    end
    object QryTypesID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object FDUpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'INSERT INTO PMWO_TYPE'
      '(ID, NAME, DESCRIPTION)'
      'VALUES (:NEW_ID, :NEW_NAME, :NEW_DESCRIPTION)')
    ModifySQL.Strings = (
      'UPDATE PMWO_TYPE'
      
        'SET ID = :NEW_ID, NAME = :NEW_NAME, DESCRIPTION = :NEW_DESCRIPTI' +
        'ON'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM PMWO_TYPE'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, NAME, DESCRIPTION, EID, ECODE, ECOPY, EDATE_TIME'
      'FROM PMWO_TYPE'
      'WHERE ID = :ID')
    Left = 160
    Top = 128
  end
end
