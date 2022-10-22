object FrmTerms: TFrmTerms
  Left = 336
  Top = 211
  HelpContext = 1093271
  ClientHeight = 182
  ClientWidth = 346
  Caption = 'Terms'
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
    Width = 346
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
  end
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 346
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object DBNavigator1: TUniDBNavigator
      Left = 121
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = DataSource1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object DBGrid1: TUniDBGrid
    Left = 0
    Top = 30
    Width = 346
    Height = 152
    Hint = ''
    DataSource = DataSource1
    LoadMask.Message = 'Loading data...'
    OnKeyDown = DBGrid1KeyDown
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Columns = <
      item
        FieldName = 'DESCRIPTION'
        Title.Caption = 'Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DAYS'
        Title.Caption = 'Days'
        Width = 28
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DISCOUNT'
        Title.Caption = 'Discount'
        Width = 45
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DISCOUNT_DAYS'
        Title.Caption = 'Discount Days'
        Width = 72
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BASED_ON'
        Title.Caption = 'Based On'
        Width = 50
        PickList.Strings = (
          'I'
          'S'
          'C')
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'END_OF_MONTH'
        Title.Caption = 'End of Month'
        Width = 68
        PickList.Strings = (
          'Y'
          'N')
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DAY_OF_MONTH'
        Title.Caption = 'Day of Month'
        Width = 69
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PK_HIDE'
        Title.Caption = 'Inactive'
        Width = 43
        PickList.Strings = (
          'Y'
          'N')
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CASH_IN_ADVANCE'
        Title.Caption = 'Cash In Advance'
        Width = 86
        PickList.Strings = (
          'Y'
          'N')
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 216
    Top = 56
  end
  object Table1: TFDTable
    BeforePost = Table1BeforePost
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'TERMS'
    TableName = 'TERMS'
    Left = 232
    Top = 72
    object Table1ID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object Table1DAYS: TBCDField
      FieldName = 'DAYS'
      Size = 0
    end
    object Table1DISCOUNT: TBCDField
      FieldName = 'DISCOUNT'
      Size = 3
    end
    object Table1DISCOUNT_DAYS: TBCDField
      FieldName = 'DISCOUNT_DAYS'
      Size = 0
    end
    object Table1BASED_ON: TStringField
      FieldName = 'BASED_ON'
      Size = 1
    end
    object Table1END_OF_MONTH: TStringField
      FieldName = 'END_OF_MONTH'
      FixedChar = True
      Size = 1
    end
    object Table1DAY_OF_MONTH: TBCDField
      FieldName = 'DAY_OF_MONTH'
      Size = 0
    end
    object Table1DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object Table1PK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Size = 1
    end
    object Table1CASH_IN_ADVANCE: TStringField
      FieldName = 'CASH_IN_ADVANCE'
      Size = 1
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'IQWin32/Terms'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195328 $'
    BuildVersion = '176554'
    Left = 244
    Top = 145
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 305
    Top = 145
  end
  object MainMenu1: TUniMainMenu
    Left = 212
    Top = 145
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Report1: TUniMenuItem
      Caption = '&Report'
      object Print1: TUniMenuItem
        Caption = '&Print'
        OnClick = Print1Click
      end
      object PrinterSetup1: TUniMenuItem
        Caption = 'Printer &Setup'
        OnClick = PrinterSetup1Click
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
    App_ID = 'FrmTerms'
    WebUse = False
    TouchScreen = False
    Left = 275
    Top = 145
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'DBNavigator1'
      'Table1'
      'Print1'
      'DBGrid1')
    SecurityCode = 'FRMTERMS'
    Left = 272
    Top = 64
  end
end
