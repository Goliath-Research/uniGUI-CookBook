object FrmPMClassFilter: TFrmPMClassFilter
  Left = 467
  Top = 269
  ClientHeight = 268
  ClientWidth = 537
  Caption = 'Class Filter'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 537
    Height = 227
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 339
    ExplicitHeight = 118
    object Grid: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 535
      Height = 225
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 318
      IQComponents.Grid.Height = 139
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcClassList
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
      IQComponents.Navigator.DataSource = SrcClassList
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 318
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 139
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitLeft = 120
      IQComponents.HiddenPanel.ExplicitHeight = 30
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitWidth = 329
      IQComponents.FormTab.ExplicitHeight = 59
      DataSource = SrcClassList
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
      ExplicitWidth = 337
      ExplicitHeight = 116
      Marker = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 227
    Width = 537
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitTop = 118
    ExplicitWidth = 339
    object Panel3: TUniPanel
      Left = 220
      Top = 1
      Width = 317
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitLeft = 22
      object btnOk: TUniBitBtn
        Left = 112
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Filter'
        ModalResult = 1
        TabOrder = 0
        Default = True
        OnClick = btnOkClick
      end
      object btnCancel: TUniBitBtn
        Left = 214
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
      object btnNone: TUniBitBtn
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'None'
        ModalResult = 1
        TabOrder = 2
        OnClick = btnNoneClick
      end
    end
  end
  object SrcClassList: TDataSource
    DataSet = QryClassList
    Left = 48
    Top = 16
  end
  object QryClassList: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT ID, CLASS, DESCRIP'
      'FROM PM_CLASS')
    Left = 56
    Top = 24
    object QryClassListCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 7
      FieldName = 'CLASS'
      Origin = 'PM_CLASS.CLASS'
      FixedChar = True
      Size = 2
    end
    object QryClassListDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Origin = 'PM_CLASS.DESCRIP'
      Size = 50
    end
    object QryClassListID: TBCDField
      FieldName = 'ID'
      Origin = 'PM_CLASS.ID'
      Visible = False
      Size = 0
    end
  end
end
