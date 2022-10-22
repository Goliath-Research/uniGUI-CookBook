inherited FrmIQDBTransImportDBF: TFrmIQDBTransImportDBF
  Left = 388
  Top = 273
  ClientHeight = 80
  ClientWidth = 415
  Caption = 'Import DBF'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = True
  ExplicitWidth = 421
  ExplicitHeight = 128
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel4: TUniPanel
    Width = 415
    Visible = False
    ExplicitWidth = 289
  end
  inherited PnlMain: TUniPanel
    Width = 415
    Height = 77
    ParentColor = True
    ExplicitWidth = 415
    ExplicitHeight = 77
    object Label1: TUniLabel
      Left = 8
      Top = 8
      Width = 100
      Height = 13
      Hint = ''
      Caption = 'Importing DBF file ...'
      TabOrder = 1
    end
    object lblDBFFileName: TUniLabel
      Left = 8
      Top = 24
      Width = 12
      Height = 13
      Hint = ''
      Caption = '...'
      TabOrder = 2
    end
  end
  inherited MainMenu1: TUniMainMenu
    Left = 108
    Top = 8
  end
  object TblSource: TADOTable
    Connection = ADOConnection1
    Left = 164
    Top = 8
  end
  object TblDestination: TIQWebDbxTable
    Aggregates = <>
    IndexFieldNames = ''
    IndexName = ''
    MasterFields = ''
    PacketRecords = 20
    SQLConnection = SQLConnection1
    ParamCheck = True
    Left = 220
    Top = 8
  end
  object ADOConnection1: TADOConnection
    Left = 136
    Top = 8
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'OracleConnection'
    DriverName = 'Oracle'
    Params.Strings = (
      'DriverName=Oracle'
      'DataBase=IQORA'
      'User_Name=IQMS'
      'Password=IQMS'
      'RowsetSize=0'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Oracle TransIsolation=ReadCommited'
      'OS Authentication=False'
      'Multiple Transaction=False'
      'Trim Char=True')
    Left = 192
    Top = 8
  end
end
