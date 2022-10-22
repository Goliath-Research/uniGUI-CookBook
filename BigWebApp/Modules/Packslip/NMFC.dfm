object FrmNMFC: TFrmNMFC
  Left = 263
  Top = 93
  HelpContext = 1060397
  ClientHeight = 271
  ClientWidth = 372
  Caption = 'Shipping Classes'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 92
    Width = 372
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 372
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object DBNavigator1: TUniDBNavigator
      Left = 147
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcNMFC
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object PageControl1: TUniPageControl
    Left = 0
    Top = 95
    Width = 372
    Height = 176
    Hint = ''
    ActivePage = TabSheet1
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object TabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'Standard'
      object PnlToolbarStandard: TUniPanel
        Tag = 1999
        Left = 0
        Top = 0
        Width = 364
        Height = 27
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object DBNavigator2: TUniDBNavigator
          Left = 139
          Top = 1
          Width = 225
          Height = 25
          Hint = ''
          ShowHint = True
          ParentShowHint = False
          DataSource = SrcNMFCClass
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
      object gridSTD: TUniDBGrid
        Left = 0
        Top = 27
        Width = 364
        Height = 121
        Hint = ''
        DataSource = SrcNMFCClass
        LoadMask.Message = 'Loading data...'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Columns = <
          item
            FieldName = 'LBS_CU_FT'
            Title.Caption = 'Up to Lbs/Cu.Ft'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CLASS'
            Title.Caption = 'Class'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SUBCODE'
            Title.Caption = 'Sub-Code'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Description'
            Width = 304
            CheckBoxField.FieldValues = 'true;false'
          end>
      end
    end
    object TabSheet2: TUniTabSheet
      Hint = ''
      Caption = 'Bumped'
      object PnlToolbarBumped: TUniPanel
        Tag = 1999
        Left = 0
        Top = 0
        Width = 364
        Height = 27
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object DBNavigator3: TUniDBNavigator
          Left = 139
          Top = 1
          Width = 225
          Height = 25
          Hint = ''
          ShowHint = True
          ParentShowHint = False
          DataSource = SrcNMFCBump
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
      object gridBump: TUniDBGrid
        Left = 0
        Top = 27
        Width = 364
        Height = 121
        Hint = ''
        DataSource = SrcNMFCBump
        LoadMask.Message = 'Loading data...'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Columns = <
          item
            FieldName = 'LBS_CU_FT_FROM'
            Title.Caption = 'From Lbs/Cu.Ft'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'LBS_CU_FT_TO'
            Title.Caption = 'To Lbs/Cu.Ft'
            Width = 73
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'BUMPED_LBS_CU_FT'
            Title.Caption = 'Bumped Lbs/Cu.Ft'
            Width = 103
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'BUMPED_CLASS'
            Title.Caption = 'Bumped Class'
            Width = 79
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Description'
            Width = 304
            CheckBoxField.FieldValues = 'true;false'
          end>
      end
    end
  end
  object pnlNMFC: TUniPanel
    Left = 0
    Top = 27
    Width = 372
    Height = 65
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = 'pnlNMFC'
    object gridNMFC: TUniDBGrid
      Left = 1
      Top = 1
      Width = 370
      Height = 63
      Hint = ''
      DataSource = SrcNMFC
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Columns = <
        item
          FieldName = 'CODE'
          Title.Caption = 'NMFC Code'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 231
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
  end
  object SrcNMFC: TDataSource
    DataSet = TblNMFC
    Left = 88
    Top = 35
  end
  object TblNMFC: TFDTable
    BeforePost = TblNMFCBeforePost
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'NMFC'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'NMFC'
    Left = 88
    Top = 51
    object TblNMFCID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object TblNMFCCODE: TStringField
      DisplayLabel = 'NMFC Code'
      FieldName = 'CODE'
      Required = True
      Size = 25
    end
    object TblNMFCDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
  end
  object SrcNMFCClass: TDataSource
    DataSet = TblNMFCClass
    Left = 128
    Top = 35
  end
  object TblNMFCClass: TFDTable
    BeforeInsert = TblNMFCClassBeforeEdit
    BeforeEdit = TblNMFCClassBeforeEdit
    BeforePost = TblNMFCBeforePost
    IndexFieldNames = 'NMFC_ID;LBS_CU_FT'
    MasterSource = SrcNMFC
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'NMFC_CLASS'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'NMFC_CLASS'
    Left = 128
    Top = 51
    object TblNMFCClassID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object TblNMFCClassNMFC_ID: TBCDField
      FieldName = 'NMFC_ID'
      Size = 0
    end
    object TblNMFCClassLBS_CU_FT: TFMTBCDField
      DisplayLabel = 'Up to Lbs/Cu.Ft'
      FieldName = 'LBS_CU_FT'
      Size = 6
    end
    object TblNMFCClassCLASS: TBCDField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Size = 2
    end
    object TblNMFCClassDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object TblNMFCClassSUBCODE: TStringField
      FieldName = 'SUBCODE'
      Size = 10
    end
  end
  object SrcNMFCBump: TDataSource
    DataSet = TblNMFCBump
    Left = 168
    Top = 35
  end
  object TblNMFCBump: TFDTable
    BeforeInsert = TblNMFCClassBeforeEdit
    BeforeEdit = TblNMFCClassBeforeEdit
    BeforePost = TblNMFCBeforePost
    AfterPost = TblNMFCBumpAfterPost
    IndexFieldNames = 'NMFC_ID;LBS_CU_FT_FROM'
    MasterSource = SrcNMFC
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'NMFC_BUMPED'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'NMFC_BUMPED'
    Left = 168
    Top = 51
    object TblNMFCBumpID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object TblNMFCBumpNMFC_ID: TBCDField
      FieldName = 'NMFC_ID'
      Size = 0
    end
    object TblNMFCBumpLBS_CU_FT_FROM: TFMTBCDField
      DisplayLabel = 'From Lbs/Cu.Ft'
      FieldName = 'LBS_CU_FT_FROM'
      Size = 6
    end
    object TblNMFCBumpLBS_CU_FT_TO: TFMTBCDField
      DisplayLabel = 'To Lbs/Cu.Ft'
      FieldName = 'LBS_CU_FT_TO'
      Size = 6
    end
    object TblNMFCBumpBUMPED_LBS_CU_FT: TFMTBCDField
      DisplayLabel = 'Bumped Lbs/Cu.Ft'
      FieldName = 'BUMPED_LBS_CU_FT'
      Size = 6
    end
    object TblNMFCBumpBUMPED_CLASS: TBCDField
      DisplayLabel = 'Bumped Class'
      FieldName = 'BUMPED_CLASS'
      Size = 2
    end
    object TblNMFCBumpDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 208
    Top = 35
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Reports1: TUniMenuItem
      Caption = '&Reports'
      object Print1: TUniMenuItem
        Caption = '&Print'
        OnClick = Print1Click
      end
      object SetupPrinter1: TUniMenuItem
        Caption = '&Setup Printer'
        OnClick = SetupPrinter1Click
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
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmNMFC'
    WebUse = False
    TouchScreen = False
    Left = 240
    Top = 35
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Shipping Classes'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 193264 $'
    BuildVersion = '176554'
    Left = 272
    Top = 35
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 304
    Top = 35
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMNMFC')
    SecurityCode = 'FRMNMFC'
    Left = 333
    Top = 35
  end
end
