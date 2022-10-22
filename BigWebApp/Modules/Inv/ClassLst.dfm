object FrmClassList: TFrmClassList
  Left = 320
  Top = 156
  HelpContext = 1153470
  ClientHeight = 495
  ClientWidth = 395
  Caption = 'Inventory Classes'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 27
    Width = 395
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 395
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnDimCharacteristics: TUniSpeedButton
      Left = 1
      Top = 2
      Width = 25
      Height = 25
      Hint = 'Dimensional Inventory / Characteristics'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFB0A090
        604830604830604830604830816151907060A08870FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFC0A090FFE8E0FFE8D0FFE0D0FFE0D0FFE0D0FF
        E0D0907870FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0A890
        FFF0E0B08870B08870B08070B08070FFE0D0807060FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFC0A890FFF0F0FFE8E0FFE8E0FFE0D0FFE0D0FF
        E0D0806050FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0A8A0
        FFF8F0B09880B09080B08870B08870FFE0D0706050FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFC0A8A0FFF8F0FFF0F0FFF0E0FFE8E0FFE8D0FF
        E0D0705040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0B0A0
        FFF8F0C0A090C09890C09880B09080FFE0D0604830FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFC0B0A0FFFFFFFFF8F0FFF8F0FFF0F0FFE8E0FF
        E8E0604830634935634935634935634935634935684E3AFF00FFFF00FFC0B0A0
        FFFFFFD0B0A0C0A8A0C0A890C0A090FFE8E0604830FBFAF6FBF8F3FBF5EFFAF3
        EBFAF0E7684E3AFF00FFFF00FFD0B8A0FFFFFFFFFFFFFFFFFFFFF8F0FFF8F0FF
        F0E0604830DAC8BDFBFAF7D3BCAFD6C0B3FAF3EC684E3AFF00FFFF00FFD0B8A0
        FFFFFFD0C0B0D0B8B0D0B0A0C0B0A0FFF0F0604830FCFEFCFCFDFAFCFBF7FBF9
        F4FBF6F1684E3AFF00FFFF00FFD0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFF8FFFF
        F8F0604830DBCAC0FCFEFCD8C4B9D8C4B9FBF9F5684E3AFF00FFFF00FFD0B8A0
        D0B8A0C0B0A0C0B0A0C0B0A0C0A8A0C0A890C0A890FCFEFCFCFEFCFCFEFCFCFD
        FBFCFCF9684E3AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEBAC8DEA
        AA8CEAA989E9A27EE89971E68F63E58555E37B47CC6430FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFEBAC8DFFC3A2FEBF9DFCBB98FBB692FAB08BF9AB
        83F8A67CD26C38FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEBAC8DEA
        AA8BEAAA8BEAA889E9A281E89C77E7946BE68C60E27239FF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnDimCharacteristicsClick
    end
    object DBNavigator1: TUniDBNavigator
      Left = 170
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      DataSource = DataSource1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 30
    Width = 395
    Height = 431
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 178
    IQComponents.Grid.Height = 345
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
    IQComponents.HiddenPanel.Left = 178
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 345
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
      end
      item
        FieldName = 'PRIMARY_MATERIAL'
        Title.Caption = 'Primary ~Material'
        Width = 64
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'MANDATORY_DIM'
        Title.Caption = 'Dim Characteristics ~Mandatory'
        Width = 64
        CheckBoxField.FieldValues = 'Y;N'
      end>
    Marker = 0
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 461
    Width = 395
    Height = 34
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel3: TUniPanel
      Left = 259
      Top = 1
      Width = 136
      Height = 32
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      DesignSize = (
        136
        32)
      object btnOK: TUniButton
        Left = 31
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        Anchors = [akTop, akRight]
        TabOrder = 1
        OnClick = btnOKClick
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 80
    Top = 112
  end
  object Table1: TFDTable
    BeforePost = Table1BeforePost
    IndexFieldNames = 'CLASS;ECODE'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'ARINVT_CLASS'
    TableName = 'ARINVT_CLASS'
    Left = 80
    Top = 136
    object Table1CLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 5
      FieldName = 'CLASS'
      Required = True
      EditMask = '>AA;1;_'
      Size = 2
    end
    object Table1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 28
      FieldName = 'DESCRIP'
      Size = 50
    end
    object Table1PRIMARY_MATERIAL: TStringField
      DisplayLabel = 'Primary ~Material'
      DisplayWidth = 7
      FieldName = 'PRIMARY_MATERIAL'
      FixedChar = True
      Size = 1
    end
    object Table1MANDATORY_DIM: TStringField
      DisplayLabel = 'Dim Characteristics ~Mandatory'
      DisplayWidth = 1
      FieldName = 'MANDATORY_DIM'
      Size = 1
    end
    object Table1ID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 0
    end
  end
end
