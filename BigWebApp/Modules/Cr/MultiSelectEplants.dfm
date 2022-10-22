object FrmMultiSelEplants: TFrmMultiSelEplants
  Left = 0
  Top = 0
  ClientHeight = 468
  ClientWidth = 521
  Caption = 'Multi-Select EPlants'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 427
    Width = 521
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 259
      Top = 1
      Width = 262
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnCancel: TUniButton
        Left = 175
        Top = 6
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 1
        OnClick = BtnCancelClick
      end
      object BtnOk: TUniButton
        Left = 94
        Top = 6
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 2
        OnClick = BtnOkClick
      end
    end
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 521
    Height = 427
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 304
    IQComponents.Grid.Height = 341
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcEplants
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
    IQComponents.Navigator.DataSource = SrcEplants
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 304
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 341
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitLeft = 0
    IQComponents.FormTab.ExplicitTop = 0
    IQComponents.FormTab.ExplicitWidth = 256
    IQComponents.FormTab.ExplicitHeight = 128
    DataSource = SrcEplants
    Columns = <
      item
        FieldName = 'ID'
        Title.Caption = 'EPlant ID'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'NAME'
        Title.Caption = 'Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object SrcEplants: TDataSource
    DataSet = QryEplants
    Left = 112
    Top = 328
  end
  object QryEplants: TFDQuery
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       name'
      '   from eplant    '
      ' '
      ' ')
    Left = 120
    Top = 336
    object QryEplantsID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 20
      FieldName = 'ID'
      Origin = 'ID'
      Size = 0
    end
    object QryEplantsNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 60
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 30
    end
  end
  object PkEplant: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       name'
      '   from eplant    '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 112
    Top = 270
    object PkEplantID: TBCDField
      DisplayLabel = 'Eplant ID'
      FieldName = 'ID'
      Origin = 'IQ.EPLANT.ID'
      Size = 0
    end
    object PkEplantNAME: TStringField
      DisplayLabel = 'Name'
      FieldName = 'NAME'
      Origin = 'IQ.EPLANT.NAME'
      Size = 30
    end
  end
end
