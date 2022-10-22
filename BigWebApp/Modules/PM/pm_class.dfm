object FrmPMClass: TFrmPMClass
  Left = 320
  Top = 156
  HelpContext = 1018433
  ClientHeight = 228
  ClientWidth = 340
  Caption = 'MRO Classes'
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 0
    Width = 340
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    ExplicitTop = 27
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 3
    Width = 340
    Height = 191
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 123
    IQComponents.Grid.Height = 105
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcPMClass
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
    IQComponents.Navigator.DataSource = SrcPMClass
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 123
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 105
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 78
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitHeight = 107
    DataSource = SrcPMClass
    Columns = <
      item
        FieldName = 'CLASS'
        Title.Caption = 'Class'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitTop = 30
    ExplicitHeight = 164
    Marker = 0
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 194
    Width = 340
    Height = 34
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlButtonsRight: TUniPanel
      Left = 237
      Top = 1
      Width = 103
      Height = 32
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 1
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
    end
  end
  object SrcPMClass: TDataSource
    DataSet = QryPMClass
    Left = 80
    Top = 112
  end
  object PMain: TUniPopupMenu
    Left = 192
    Top = 88
    object Help1: TUniMenuItem
      Caption = 'Help'
      ShortCut = 112
      OnClick = Help1Click
    end
  end
  object QryPMClass: TFDQuery
    AfterPost = QryPMClassAfterPost
    BeforeDelete = QryPMClassBeforeDelete
    OnNewRecord = QryPMClassNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.UpdateTableName = 'PM_CLASS'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL_Class
    SQL.Strings = (
      '  SELECT id,'
      '         class,'
      '         descrip'
      '    FROM pm_class'
      'ORDER BY class')
    Left = 88
    Top = 120
    object QryPMClassCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 5
      FieldName = 'CLASS'
      Origin = 'IQ.PM_CLASS.CLASS'
      FixedChar = True
      Size = 2
    end
    object QryPMClassDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 28
      FieldName = 'DESCRIP'
      Origin = 'IQ.PM_CLASS.DESCRIP'
      Size = 50
    end
    object QryPMClassID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.PM_CLASS.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL_Class: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO IQMS.PM_CLASS'
      '(ID, CLASS, DESCRIP)'
      'VALUES (:NEW_ID, :NEW_CLASS, :NEW_DESCRIP)')
    ModifySQL.Strings = (
      'UPDATE IQMS.PM_CLASS'
      'SET ID = :NEW_ID, CLASS = :NEW_CLASS, DESCRIP = :NEW_DESCRIP'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM IQMS.PM_CLASS'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, CLASS, DESCRIP'
      'FROM IQMS.PM_CLASS'
      'WHERE ID = :ID')
    Left = 96
    Top = 128
  end
end
