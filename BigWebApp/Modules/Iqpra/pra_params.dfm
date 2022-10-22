object FrmPRAParams: TFrmPRAParams
  Left = 304
  Top = 230
  HelpContext = 1063712
  ClientHeight = 99
  ClientWidth = 305
  Caption = 'PRA Parameters'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMain: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 305
    Height = 58
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 82
      Top = 1
      Width = 6
      Height = 56
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 81
      Height = 56
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label2: TUniLabel
        Left = 16
        Top = 12
        Width = 41
        Height = 13
        Hint = ''
        Caption = 'Decimals'
        TabOrder = 1
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 88
      Top = 1
      Width = 216
      Height = 56
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object wwDBSpinEdit1: TUniDBNumberEdit
        Left = 0
        Top = 8
        Width = 41
        Height = 21
        Hint = 'Rounding precision'
        ShowHint = True
        ParentShowHint = False
        DataField = 'PROD_REP_DECIMAL'
        DataSource = wwDataSource1
        TabOrder = 0
        MaxValue = 6.000000000000000000
        DecimalSeparator = '.'
      end
    end
  end
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 58
    Width = 305
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 81
      Top = 1
      Width = 223
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        Default = True
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 112
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object wwDataSource1: TDataSource
    DataSet = wwTable1
    Left = 224
    Top = 15
  end
  object wwTable1: TFDTable
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PARAMS'
    TableName = 'PARAMS'
    Left = 224
    Top = 29
    object wwTable1PROD_REP_DECIMAL: TBCDField
      FieldName = 'PROD_REP_DECIMAL'
      Size = 0
    end
  end
end
