object FrmCalcIncPay: TFrmCalcIncPay
  Left = 287
  Top = 224
  ClientHeight = 191
  ClientWidth = 390
  Caption = 'Calculate Incentive Pay'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 140
    Width = 390
    Height = 51
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 126
      Top = 1
      Width = 264
      Height = 49
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 40
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&OK'
        TabOrder = 1
        OnClick = btnOkClick
      end
      object btnCancel: TUniButton
        Left = 144
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 90
    Width = 390
    Height = 50
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object lblNote: TUniLabel
      Left = 1
      Top = 1
      Width = 438
      Height = 13
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 
        'If Incentive Paytype is not specified, then the default paytype ' +
        'from Pay Rules will be used.'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
    end
  end
  object PnlClient01: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 390
    Height = 90
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 102
      Top = 0
      Width = 6
      Height = 90
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 102
      Height = 88
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label44: TUniLabel
        Left = 8
        Top = 15
        Width = 88
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Incentive Paytype'
        TabOrder = 1
      end
      object Label4: TUniLabel
        Left = 8
        Top = 44
        Width = 76
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Incentive Hours'
        TabOrder = 2
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 108
      Top = 1
      Width = 282
      Height = 88
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object dbInc: TUniDBLookupComboBox
        Left = 1
        Top = 10
        Width = 188
        Height = 21
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ListField = 'ID'
        ListSource = SrcQryInc
        KeyField = 'DESCRIPTION'
        ListFieldIndex = 0
        TabOrder = 0
        Color = clWindow
      end
      object dbHrs: TUniDBNumberEdit
        Left = 1
        Top = 34
        Width = 68
        Height = 21
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 1
        DecimalSeparator = '.'
      end
    end
  end
  object QryInc: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, description from pr_paytype'
      'order by description')
    Left = 216
    Top = 40
    object StringField1: TStringField
      DisplayLabel = 'PayType'
      DisplayWidth = 25
      FieldName = 'DESCRIPTION'
      Origin = 'PR_PAYTYPE.DESCRIPTION'
      Size = 50
    end
    object FloatField1: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'PR_PAYTYPE.ID'
      Visible = False
      Size = 0
    end
  end
  object SrcQryInc: TDataSource
    DataSet = QryInc
    Left = 256
    Top = 40
  end
end
