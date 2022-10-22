object FrmWaterfall_Setup: TFrmWaterfall_Setup
  Left = 312
  Top = 190
  HelpContext = 21012
  ClientHeight = 356
  ClientWidth = 427
  Caption = 'Waterfalls'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 27
    Width = 427
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
  end
  object Splitter1: TUniSplitter
    Left = 0
    Top = 181
    Width = 427
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alBottom
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 427
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object NavMain: TUniDBNavigator
      Left = 202
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcWaterfall
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 30
    Width = 427
    Height = 151
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = 'Panel2'
    object DBGrid1: TUniDBGrid
      Left = 1
      Top = 1
      Width = 425
      Height = 149
      Hint = ''
      DataSource = SrcWaterfall
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Columns = <
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 184
    Width = 427
    Height = 172
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = 'Panel3'
    object Panel4: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 425
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object NavLevels: TUniDBNavigator
        Left = 200
        Top = 1
        Width = 225
        Height = 25
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        DataSource = SrcWaterfallLevel
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object DBGrid2: TUniDBGrid
      Left = 1
      Top = 27
      Width = 425
      Height = 145
      Hint = ''
      DataSource = SrcWaterfallLevel
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Columns = <
        item
          FieldName = 'QUAN_LEVEL'
          Title.Caption = 'Level'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'QUAN'
          Title.Caption = 'Quantity'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
  end
  object SrcWaterfall: TDataSource
    DataSet = TblWaterfall
    Left = 32
    Top = 64
  end
  object TblWaterfall: TFDTable
    BeforePost = TblWaterfallBeforePost
    IndexFieldNames = 'DESCRIP'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'AR_DISCOUNT_WATERFALL'
    TableName = 'AR_DISCOUNT_WATERFALL'
    Left = 40
    Top = 112
    object TblWaterfallID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object TblWaterfallDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 50
    end
  end
  object TblWaterfallLevels: TFDTable
    BeforePost = TblWaterfallLevelsBeforePost
    OnNewRecord = TblWaterfallLevelsNewRecord
    IndexFieldNames = 'AR_DISCOUNT_WATERFALL_ID'
    MasterSource = SrcWaterfall
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'AR_DISCOUNT_WATERFALL_LEVELS'
    TableName = 'AR_DISCOUNT_WATERFALL_LEVELS'
    Left = 136
    Top = 240
    object FloatField1: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object TblWaterfallLevelsAR_DISCOUNT_WATERFALL_ID: TBCDField
      FieldName = 'AR_DISCOUNT_WATERFALL_ID'
      Size = 0
    end
    object TblWaterfallLevelsQUAN_LEVEL: TBCDField
      FieldName = 'QUAN_LEVEL'
      Size = 0
    end
    object TblWaterfallLevelsQUAN: TBCDField
      FieldName = 'QUAN'
      Size = 2
    end
  end
  object SrcWaterfallLevel: TDataSource
    DataSet = TblWaterfallLevels
    Left = 80
    Top = 248
  end
  object MainMenu1: TUniMainMenu
    Left = 248
    Top = 72
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
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
  object IQAbout1: TIQWebAbout
    ModuleName = 'Waterfalls'
    Version = 'Feature unsupported'
    ChangeListNumber = '$Change: 189062 $'
    Left = 205
    Top = 72
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'NavMain'
      'TblTypes')
    SecurityCode = 'FRMCUST_TYPE'
    Left = 72
    Top = 64
  end
end
