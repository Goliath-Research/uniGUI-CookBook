inherited FrmDBTransImportAlias: TFrmDBTransImportAlias
  Left = 376
  Top = 153
  ClientHeight = 206
  ClientWidth = 328
  Caption = 'Import'
  OnShow = FormShow
  OldCreateOrder = True
  KeyPreview = True
  ExplicitWidth = 344
  ExplicitHeight = 264
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel4: TUniPanel
    Width = 328
    TabOrder = 2
    ExplicitWidth = 328
  end
  inherited PnlMain: TUniPanel
    Width = 328
    Height = 166
    ParentColor = True
    ExplicitWidth = 328
    ExplicitHeight = 166
    DesignSize = (
      328
      166)
    object Label6: TUniLabel
      Left = 8
      Top = 8
      Width = 148
      Height = 13
      Hint = ''
      Caption = 'Please select a table to import.'
      TabOrder = 2
    end
    object PnlList: TUniPanel
      Left = 7
      Top = 25
      Width = 322
      Height = 145
      Hint = ''
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = 'Retrieving table list ...'
      ParentColor = True
      object lstTableList: TUniListBox
        Left = 1
        Top = 1
        Width = 320
        Height = 143
        Hint = ''
        Visible = False
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Sorted = True
        OnClick = lstTableListClick
        OnDblClick = btnFinishClick
      end
    end
  end
  object Panel8: TUniPanel [2]
    Left = 0
    Top = 169
    Width = 328
    Height = 37
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ParentColor = True
    object Panel1: TUniPanel
      Left = 117
      Top = 0
      Width = 211
      Height = 37
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ParentColor = True
      object btnFinish: TUniBitBtn
        Left = 4
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Enabled = False
        Caption = 'OK'
        TabOrder = 0
        Default = True
        OnClick = btnFinishClick
      end
      object btnCancel: TUniBitBtn
        Left = 106
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Close'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  inherited MainMenu1: TUniMainMenu
    Left = 40
    Top = 32
  end
  object SrcData: TDataSource
    DataSet = QryADOData
    Left = 128
    Top = 32
  end
  object QryADOData: TADOQuery
    Connection = ADOConnection
    BeforeOpen = QryADODataBeforeOpen
    Parameters = <>
    Left = 160
    Top = 32
  end
  object TblADOSource: TADOTable
    Connection = ADOConnection
    LockType = ltReadOnly
    Left = 208
    Top = 32
  end
  object TblDestination: TIQWebDbxTable
    Aggregates = <>
    IndexFieldNames = ''
    IndexName = ''
    MasterFields = ''
    PacketRecords = 20
    SQLConnection = LocalSQLConnection
    ParamCheck = True
    Left = 151
    Top = 84
  end
  object ADOConnection: TADOConnection
    Left = 87
    Top = 32
  end
  object LocalSQLConnection: TSQLConnection
    ConnectionName = 'OracleConnection'
    DriverName = 'Oracle'
    Params.Strings = (
      'DriverName=Oracle'
      'DataBase=IQORA'
      'User_Name=IQMS'
      'Password=IQMS'
      'RowsetSize=20'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Oracle TransIsolation=ReadCommited'
      'OS Authentication=False'
      'Multiple Transaction=False'
      'Trim Char=False')
    Left = 87
    Top = 84
  end
  object SourceSQLConnection: TSQLConnection
    Left = 88
    Top = 136
  end
  object SourceDataSetProvider: TDataSetProvider
    DataSet = SourceSQLQuery
    Left = 152
    Top = 136
  end
  object SourceClientDataSet: TClientDataSet
    Aggregates = <>
    PacketRecords = 20
    Params = <>
    ProviderName = 'SourceDataSetProvider'
    Left = 208
    Top = 136
  end
  object SourceSQLQuery: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SourceSQLConnection
    Left = 264
    Top = 136
  end
end
