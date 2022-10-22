object FrmTAHolidays: TFrmTAHolidays
  Left = 333
  Top = 170
  ClientHeight = 264
  ClientWidth = 312
  Caption = 'Holidays'
  OldCreateOrder = True
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 312
    Height = 27
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Nav: TUniDBNavigator
      Left = 87
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcHolidays
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Grid: TUniDBGrid
    Left = 0
    Top = 27
    Width = 312
    Height = 237
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    DataSource = SrcHolidays
    LoadMask.Message = 'Loading data...'
    OnDblClick = SetHolidaysdatetime1Click
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Columns = <
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'START_TIME'
        Title.Caption = 'Start date/time'
        Width = 82
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'END_TIME'
        Title.Caption = 'End date/time'
        Width = 76
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  object MainMenu1: TUniMainMenu
    Left = 232
    Top = 72
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object About1: TUniMenuItem
        Caption = '&About...'
        OnClick = About1Click
      end
    end
  end
  object SrcHolidays: TDataSource
    DataSet = TblHoliDays
    Left = 24
    Top = 80
  end
  object TblHoliDays: TFDTable
    BeforePost = TblHoliDaysBeforePost
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'TA_HOLIDAYS'
    TableName = 'TA_HOLIDAYS'
    Left = 72
    Top = 80
    object TblHoliDaysDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Size = 50
    end
    object TblHoliDaysSTART_TIME: TDateTimeField
      DisplayLabel = 'Start date/time'
      DisplayWidth = 13
      FieldName = 'START_TIME'
    end
    object TblHoliDaysEND_TIME: TDateTimeField
      DisplayLabel = 'End date/time'
      DisplayWidth = 12
      FieldName = 'END_TIME'
    end
    object TblHoliDaysID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'T&&A Holidays'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 16
  end
  object PopupMenu1: TUniPopupMenu
    Left = 200
    Top = 96
    object SetHolidaysdatetime1: TUniMenuItem
      Caption = '&Set Holidays date/time'
      OnClick = SetHolidaysdatetime1Click
    end
  end
end
