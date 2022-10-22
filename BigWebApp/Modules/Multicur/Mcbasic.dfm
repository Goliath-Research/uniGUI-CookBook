object FrmMCBasic: TFrmMCBasic
  Left = 90
  Top = 156
  ClientHeight = 320
  ClientWidth = 381
  Caption = 'Multi Currency Display'
  OnShow = UniFormShow
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 381
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Label1: TUniLabel
      Left = 8
      Top = 7
      Width = 44
      Height = 13
      Hint = ''
      Caption = 'Currency'
      TabOrder = 2
    end
    object cbCurrency: TUniDBLookupComboBox
      Left = 58
      Top = 3
      Width = 111
      Height = 21
      Hint = ''
      ListOnlyMode = lmFollowSource
      ListField = 'DESCRIP'
      ListSource = SrcCurrency
      KeyField = 'ID'
      ListFieldIndex = 0
      TabOrder = 0
      Color = clWindow
      OnEnter = cbCurrencyEnter
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 336
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
  end
  object tblCurrency: TFDTable
    IndexName = 'PK_CURRENCY'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'CURRENCY'
    TableName = 'CURRENCY'
    Left = 300
    Top = 2
    object tblCurrencyID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object tblCurrencyCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 10
    end
    object tblCurrencyDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 50
    end
    object tblCurrencyGLVALUE: TStringField
      FieldName = 'GLVALUE'
      Size = 50
    end
    object tblCurrencySPOT_RATE: TFMTBCDField
      FieldName = 'SPOT_RATE'
      Size = 6
    end
    object tblCurrencyCURR_SYMBOL: TStringField
      FieldName = 'CURR_SYMBOL'
      Size = 10
    end
    object tblCurrencyECODE: TStringField
      FieldName = 'ECODE'
      Size = 10
    end
    object tblCurrencyEID: TBCDField
      FieldName = 'EID'
      Size = 0
    end
    object tblCurrencyEDATE_TIME: TDateTimeField
      FieldName = 'EDATE_TIME'
    end
    object tblCurrencyECOPY: TStringField
      FieldName = 'ECOPY'
      FixedChar = True
      Size = 1
    end
    object tblCurrencyNATIVE_CURR: TStringField
      FieldName = 'NATIVE_CURR'
      Size = 3
    end
  end
  object SrcCurrency: TDataSource
    DataSet = tblCurrency
    Left = 256
    Top = 72
  end
end
