object FrmClassLives: TFrmClassLives
  Left = 50
  Top = 158
  HelpContext = 5000258
  ClientHeight = 427
  ClientWidth = 498
  Caption = 'Table of Class Lives and Recovery Periods'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 498
    Height = 30
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Nav: TUniDBNavigator
      Left = 257
      Top = 1
      Width = 240
      Height = 28
      Hint = ''
      DataSource = SrcClass
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Grid: TIQUniGridControl
    Left = 0
    Top = 30
    Width = 498
    Height = 374
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 281
    IQComponents.Grid.Height = 288
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcClass
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
    IQComponents.Navigator.DataSource = SrcClass
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 281
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 288
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcClass
    Columns = <
      item
        FieldName = 'ASSET_CLASS'
        Title.Caption = 'Asset Class'
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
        FieldName = 'CLASS_LIFE'
        Title.Caption = 'Class Life'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'GDS'
        Title.Caption = 'GDS'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ADS'
        Title.Caption = 'ADS'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = True
    Marker = 0
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 404
    Width = 498
    Height = 23
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Alignment = taLeftJustify
    Caption = ''
  end
  object MainMenu1: TUniMainMenu
    Left = 200
    Top = 8
    object File1: TUniMenuItem
      Caption = '&File'
      object ImportUpdatetheClassLivesTable1: TUniMenuItem
        Caption = '&Import/Update the Class Lives Table'
        OnClick = ImportUpdatetheClassLivesTable1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object SrcClass: TDataSource
    DataSet = TblClass
    Left = 192
    Top = 56
  end
  object TblClass: TFDTable
    BeforePost = TblClassBeforePost
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'FA_MACRS_CLASS_LIFE'
    TableName = 'FA_MACRS_CLASS_LIFE'
    Left = 208
    Top = 56
    object TblClassASSET_CLASS: TStringField
      DisplayLabel = 'Asset Class'
      DisplayWidth = 10
      FieldName = 'ASSET_CLASS'
      Size = 10
    end
    object TblClassDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 10
      FieldName = 'DESCRIP'
      Size = 500
    end
    object TblClassCLASS_LIFE: TBCDField
      DisplayLabel = 'Class Life'
      DisplayWidth = 10
      FieldName = 'CLASS_LIFE'
      Size = 2
    end
    object TblClassGDS: TBCDField
      DisplayWidth = 10
      FieldName = 'GDS'
      Size = 2
    end
    object TblClassADS: TBCDField
      DisplayWidth = 10
      FieldName = 'ADS'
      Size = 2
    end
    object TblClassID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Table of Class Lives and Recovery Periods'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 352
    Top = 56
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'dbf'
    Filter = 'Dbf file (*.dbf)|*.dbf'
    Left = 311
    Top = 57
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'Nav'
      'Grid'
      'ImportUpdatetheClassLivesTable1')
    SecurityCode = 'FRMCLASSLIVES'
    Left = 400
    Top = 56
  end
end
