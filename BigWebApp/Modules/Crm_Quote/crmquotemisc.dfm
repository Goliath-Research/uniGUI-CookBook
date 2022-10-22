object FrmCRMQuoteMisc: TFrmCRMQuoteMisc
  Left = 367
  Top = 320
  ClientHeight = 122
  ClientWidth = 313
  Caption = 'Miscellaneous'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlClient: TUniPanel
    Left = 0
    Top = 0
    Width = 313
    Height = 81
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 106
      Top = 0
      Width = 6
      Height = 81
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft: TUniPanel
      Left = 1
      Top = 1
      Width = 106
      Height = 79
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 16
        Top = 12
        Width = 53
        Height = 13
        Hint = ''
        Caption = 'Description'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 16
        Top = 36
        Width = 42
        Height = 13
        Hint = ''
        Caption = 'Quantity'
        TabOrder = 2
      end
      object Label3: TUniLabel
        Left = 16
        Top = 60
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'Unit Price'
        TabOrder = 3
      end
    end
    object Panel2: TUniPanel
      Left = 112
      Top = 1
      Width = 201
      Height = 79
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        201
        79)
      object edtQty: TIQWebFloatSpinner
        Left = 1
        Top = 32
        Width = 121
        Height = 21
        Hint = ''
        Constraints.MinWidth = 121
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Position = 1.000000000000000000
        Precision = 0
        Style = fstCustom
        SpinBtnHeight = 9
        SpinBtnWidth = 17
        LargeBtnImage = False
        DesignSize = (
          121
          21)
      end
      object edtUnitPrice: TIQWebFloatSpinner
        Left = 1
        Top = 56
        Width = 121
        Height = 21
        Hint = ''
        Constraints.MinWidth = 121
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Precision = 6
        Style = fstCustom
        SpinBtnHeight = 9
        SpinBtnWidth = 17
        LargeBtnImage = False
        DesignSize = (
          121
          21)
      end
      object cmbDescrip: TUniDBLookupComboBox
        Left = 1
        Top = 8
        Width = 197
        Height = 21
        Hint = ''
        ListOnlyMode = lmFollowSource
        ListField = 'SOURCE_DISPLAY'
        ListSource = SrcMisc
        KeyField = 'SOURCE_DISPLAY'
        ListFieldIndex = 0
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clWindow
      end
    end
  end
  object PnlBottom: TUniPanel
    Left = 0
    Top = 81
    Width = 313
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlButtons: TUniPanel
      Left = 100
      Top = 1
      Width = 213
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 0
        OnClick = btnOkClick
      end
      object btnCancel: TUniBitBtn
        Left = 112
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object SrcMisc: TDataSource
    DataSet = QryMisc
    Left = 229
    Top = 8
  end
  object QryMisc: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct'
      '  trim(source_display) as source_display from crm_quote_detail'
      'where'
      '   source_id is null'
      '   and source is null'
      '   and trim(source_display) > '#39' '#39
      'order by upper(trim(source_display))')
    Left = 240
    Top = 16
    object QryMiscSOURCE_DISPLAY: TStringField
      FieldName = 'SOURCE_DISPLAY'
      Size = 250
    end
  end
end
