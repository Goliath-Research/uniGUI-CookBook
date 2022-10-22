inherited FrmDBTransImportMDB: TFrmDBTransImportMDB
  Left = 260
  Top = 258
  ClientHeight = 216
  ClientWidth = 336
  Caption = 'Import Microsoft Access Database'
  BorderStyle = bsDialog
  OldCreateOrder = True
  ExplicitWidth = 342
  ExplicitHeight = 264
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel4: TUniPanel
    Width = 336
    TabOrder = 2
    ExplicitWidth = 336
  end
  inherited PnlMain: TUniPanel
    Width = 336
    Height = 181
    TabOrder = 1
    ParentColor = True
    ExplicitWidth = 336
    ExplicitHeight = 181
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
      Tag = 1999
      Left = 7
      Top = 25
      Width = 322
      Height = 150
      Hint = ''
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = 'Retrieving table list ...'
      Color = clWhite
      object lstTableList: TUniListBox
        Left = 1
        Top = 1
        Width = 320
        Height = 148
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
  object PnlButtons: TUniPanel [2]
    Left = 0
    Top = 184
    Width = 336
    Height = 32
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ParentColor = True
    object PnlButtonsInner: TUniPanel
      Left = 130
      Top = 0
      Width = 206
      Height = 32
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ParentColor = True
      object btnFinish: TUniBitBtn
        Left = 1
        Top = 1
        Width = 97
        Height = 25
        Hint = ''
        Enabled = False
        Caption = 'OK'
        TabOrder = 0
        OnClick = btnFinishClick
      end
      object btnCancel: TUniBitBtn
        Left = 102
        Top = 1
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Close'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
        OnClick = btnCancelClick
      end
    end
  end
  object ADOConnection: TADOConnection [3]
    LoginPrompt = False
    Mode = cmRead
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 60
    Top = 48
  end
  object ADOTable: TADOTable [4]
    Connection = ADOConnection
    LockType = ltReadOnly
    Left = 88
    Top = 48
  end
  inherited MainMenu1: TUniMainMenu
    Left = 32
    Top = 48
  end
  object LocalSQLConnection: TSQLConnection
    ConnectionName = 'OracleConnection'
    DriverName = 'Oracle'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Oracle'
      'DataBase=IQORA'
      'User_Name=IQMS'
      'Password=IQMS'
      'RowsetSize=0'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Oracle TransIsolation=DirtyRead'
      'OS Authentication=False'
      'Multiple Transaction=False'
      'Trim Char=False')
    Left = 144
    Top = 48
  end
end
