object FrmTaDescrip: TFrmTaDescrip
  Left = 403
  Top = 180
  ClientHeight = 212
  ClientWidth = 331
  Caption = 'Predefined Descriptions'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 331
    Height = 33
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object DBNavigator1: TUniDBNavigator
      Left = 55
      Top = 1
      Width = 276
      Height = 31
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
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
    Top = 33
    Width = 331
    Height = 179
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    DataSource = DataSource1
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Columns = <
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  object MainMenu1: TUniMainMenu
    Left = 288
    Top = 56
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 24
    Top = 80
  end
  object Table1: TFDTable
    Active = True
    BeforePost = Table1BeforePost
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'TA_PREPOST_CTRL_DESCRIP'
    TableName = 'TA_PREPOST_CTRL_DESCRIP'
    Left = 64
    Top = 80
    object Table1ID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object Table1DESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 50
    end
  end
end
