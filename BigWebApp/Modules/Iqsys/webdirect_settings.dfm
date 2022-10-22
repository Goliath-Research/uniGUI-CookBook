object FrmWebDirectSettings: TFrmWebDirectSettings
  Left = 540
  Top = 283
  ClientHeight = 575
  ClientWidth = 551
  Caption = 'WebDirect Settings'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 551
    Height = 540
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object grpCustomerSet: TUniGroupBox
      Left = 1
      Top = 1
      Width = 549
      Height = 252
      Hint = ''
      Caption = 'Customer WebDirect'
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      DesignSize = (
        549
        252)
      object lblUDCartMessage: TUniLabel
        Left = 12
        Top = 27
        Width = 131
        Height = 13
        Hint = ''
        Caption = 'User Defined Cart Message'
        TabOrder = 8
      end
      object lblOverrideFreightMsg: TUniLabel
        Left = 12
        Top = 73
        Width = 236
        Height = 13
        Hint = ''
        Caption = 'Override Default Checkout Area Freight Message'
        TabOrder = 9
      end
      object edUDCartMessage: TUniDBEdit
        Left = 12
        Top = 46
        Width = 527
        Height = 21
        Hint = 'This text will display at the top of the checkout area.'
        DataField = 'UD_CART_MESSAGE'
        DataSource = srcWebDirectParams
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object wwCheckBox1: TUniDBCheckBox
        Left = 12
        Top = 126
        Width = 129
        Height = 17
        Hint = 
          'All items in a cart must specify at least 1 release to submit th' +
          'e web order.'
        ShowHint = True
        ParentShowHint = False
        DataField = 'RELEASES_REQD'
        DataSource = srcWebDirectParams
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Caption = 'Require Releases'
        TabOrder = 1
      end
      object dbchkEnforeSellingMult: TUniDBCheckBox
        Left = 12
        Top = 149
        Width = 213
        Height = 17
        Hint = 
          'If this is checked and the item being ordered in WebDirect B2B h' +
          'as a value in Selling Multiples of field, enforce the qty during' +
          ' ordering'
        ShowHint = True
        ParentShowHint = False
        DataField = 'ENFORCE_SELLMULTIPLES_OF'
        DataSource = srcWebDirectParams
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Caption = 'Enforce Selling Multiples of Qty'
        TabOrder = 2
      end
      object dbeChkOutFreightMsg: TUniDBEdit
        Left = 12
        Top = 92
        Width = 527
        Height = 21
        Hint = 
          'This message will override the default Checkout area Freight mes' +
          'sage'
        ShowHint = True
        ParentShowHint = False
        DataField = 'UD_FREIGHT_MESSAGE'
        DataSource = srcWebDirectParams
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
      end
      object dbeChkWaterfallBreaksHidden: TUniDBCheckBox
        Left = 12
        Top = 172
        Width = 232
        Height = 17
        Hint = 
          'If this is checked then all waterfall price breaks will be hidde' +
          'n in WebDirect B2B unless they have the '#39'WebDirect - Show'#39' optio' +
          'n enabled'
        ShowHint = True
        ParentShowHint = False
        DataField = 'WATERFALL_BREAKS_HIDDEN'
        DataSource = srcWebDirectParams
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Caption = 'Waterfall Price Breaks - Default to Hidden'
        TabOrder = 4
        OnClick = dbeChkWaterfallBreaksHiddenClick
      end
      object dbeChkWaterfallMinLtMult: TUniDBCheckBox
        Left = 31
        Top = 195
        Width = 405
        Height = 17
        Hint = 
          'If this is checked and the item being ordered in WebDirect B2B h' +
          'as a Minimum Sell Qty that is less than the Selling Multiples Of' +
          ' quantity then it will be shown'
        ShowHint = True
        ParentShowHint = False
        DataField = 'WATERFALL_MIN_LT_MULT'
        DataSource = srcWebDirectParams
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Caption = 
          'Show Minimum Sell Qty when Minimum Sell Qty is less than Selling' +
          ' Multiples Of'
        TabOrder = 5
      end
      object dbeChkWaterfallMaxBreakLtMin: TUniDBCheckBox
        Left = 31
        Top = 213
        Width = 178
        Height = 17
        Hint = 
          'If this is checked then the Selling Multiples Of quantity will a' +
          'lways be shown as a price break'
        ShowHint = True
        ParentShowHint = False
        DataField = 'WATERFALL_ALWAYS_SHOW_MULT'
        DataSource = srcWebDirectParams
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Caption = 'Always show Selling Multiples Of'
        TabOrder = 6
      end
    end
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 253
      Width = 549
      Height = 180
      Hint = 
        'This will ensure all users are logged out of the Employee Portal' +
        ' after the specified time in seconds (minimum 60).  This will ov' +
        'erride the user Auto Shut Off time if it is lower.'
      ShowHint = True
      ParentShowHint = False
      Caption = 'Vendor WebDirect'
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        549
        180)
      object lblVendUD: TUniLabel
        Left = 12
        Top = 30
        Width = 135
        Height = 13
        Hint = ''
        ShowHint = True
        Caption = 'User Defined Login Message'
        TabOrder = 2
      end
      object DBEdit1: TUniDBEdit
        Left = 12
        Top = 49
        Width = 527
        Height = 21
        Hint = ''
        ShowHint = True
        DataField = 'UD_LOGIN_MESSAGE'
        DataSource = srcWebDirectParams
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
    end
    object grpEmpPortalSettings: TUniGroupBox
      Left = 1
      Top = 433
      Width = 549
      Height = 108
      Hint = ''
      Caption = 'Employee Portal'
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      object Label1: TUniLabel
        Left = 12
        Top = 24
        Width = 84
        Height = 13
        Hint = ''
        Caption = 'Auto Logout Time'
        TabOrder = 2
      end
      object dbeEmpAutoShutTime: TUniDBEdit
        Left = 106
        Top = 21
        Width = 124
        Height = 21
        Hint = ''
        DataField = 'EMP_AUTO_SHUT_TIME'
        DataSource = srcWebDirectParams
        TabOrder = 0
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 540
    Width = 551
    Height = 35
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      551
      35)
    object bbtnOK: TUniBitBtn
      Left = 339
      Top = 6
      Width = 97
      Height = 25
      Hint = ''
      Glyph.Data = {
        BE060000424DBE06000000000000360400002800000024000000120000000100
        0800000000008802000000000000000000000001000000010000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
        FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
        800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
        FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
        800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
        FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
        800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
        FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
        800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
        FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
        800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
        FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
        800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
        800000800000008080008000000080008000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303030303030303030303030303030303030303030313030303030303030303
        030303030303030404030303030303030303030303030303030C0C1303030303
        030303030303030303030402020403030303030303030303030303030C03030C
        130303030303030303030303030402020202040303030303030303030303030C
        030303030C130303030303030303030304020202020202040303030303030303
        03030C0303030303030C130303030303030303040202020E0202020204030303
        03030303030C1303030C130303030C13030303030303030202020E030E020202
        0403030303030303030C13030C030C1303030C13030303030303030E020E0303
        030E02020204030303030303030C130C0303030C1303030C1303030303030303
        0E03030303030E02020204030303030303030C03030303030C1303030C130303
        03030303030303030303030E02020204030303030303030303030303030C1303
        030C13030303030303030303030303030E020202040303030303030303030303
        03030C1303030C13030303030303030303030303030E02020204030303030303
        030303030303030C1303030C13030303030303030303030303030E0202020403
        0303030303030303030303030C1303030C13030303030303030303030303030E
        02020403030303030303030303030303030C13030C1303030303030303030303
        030303030E02020303030303030303030303030303030C130C03030303030303
        0303030303030303030E03030303030303030303030303030303030C03030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303}
      Caption = 'OK'
      ModalResult = 1
      Anchors = [akTop, akRight]
      TabOrder = 0
      Default = True
      OnClick = bbtnOKClick
    end
    object bbtnCancel: TUniBitBtn
      Left = 441
      Top = 6
      Width = 97
      Height = 25
      Hint = ''
      Glyph.Data = {
        BE060000424DBE06000000000000360400002800000024000000120000000100
        0800000000008802000000000000000000000001000000010000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
        FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
        800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
        FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
        800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
        FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
        800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
        FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
        800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
        FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
        800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
        FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
        800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
        800000800000008080008000000080008000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        03030C0C03030303030303030303030303030303031303030303030303030303
        03030303030D01010C03030303030D0C03030303030303030C0C130303030303
        0313030303030303030D0101010C0303030D01010C0303030303030C13030C13
        030303130C0C130303030303030D010101010C030D010101010C03030303030C
        1303030C1303130C03030C130303030303030D010101010C01010101010C0303
        0303030C130303030C130C030303030C130303030303030D0101010101010101
        0C030303030303030C130303030C03030303130C03030303030303030D010101
        0101010C0303030303030303030C13030303030303130C030303030303030303
        0301010101010C03030303030303030303030C1303030303030C030303030303
        03030303030D010101010C0303030303030303030303030C130303030C030303
        03030303030303030D01010101010C0303030303030303030303030C03030303
        0C130303030303030303030D0101010C0101010C030303030303030303030C03
        030303030C1303030303030303030D0101010C030D0101010C03030303030303
        030C0303030C1303030C13030303030303030D01010C0303030D0101010C0303
        030303030C1303030C030C1303030C13030303030303030D0103030303030D01
        01010303030303030C13130C0303030C1303030C130303030303030303030303
        0303030D010D030303030303030C0C03030303030C1313130C03030303030303
        030303030303030303030303030303030303030303030303030C0C0C03030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303}
      Caption = 'Cancel'
      Cancel = True
      ModalResult = 2
      Anchors = [akTop, akRight]
      TabOrder = 1
      OnClick = bbtnCancelClick
    end
  end
  object tblWebDriectParams: TFDTable
    BeforePost = tblWebDriectParamsBeforePost
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'WEBDIRECT_PARAMS'
    TableName = 'WEBDIRECT_PARAMS'
    Left = 462
    Top = 95
    object tblWebDriectParamsID: TBCDField
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
    object tblWebDriectParamsUD_CART_MESSAGE: TStringField
      FieldName = 'UD_CART_MESSAGE'
      Size = 255
    end
    object tblWebDriectParamsRELEASES_REQD: TStringField
      FieldName = 'RELEASES_REQD'
      Size = 1
    end
    object tblWebDriectParamsUD_LOGIN_MESSAGE: TStringField
      FieldName = 'UD_LOGIN_MESSAGE'
      Size = 255
    end
    object tblWebDriectParamsENFORCE_SELLMULTIPLES_OF: TStringField
      FieldName = 'ENFORCE_SELLMULTIPLES_OF'
      Size = 1
    end
    object tblWebDriectParamsUD_FREIGHT_MESSAGE: TStringField
      FieldName = 'UD_FREIGHT_MESSAGE'
      Size = 255
    end
    object tblWebDriectParamsEMP_AUTO_SHUT_TIME: TBCDField
      FieldName = 'EMP_AUTO_SHUT_TIME'
      Size = 0
    end
    object tblWebDriectParamsWATERFALL_BREAKS_HIDDEN: TStringField
      FieldName = 'WATERFALL_BREAKS_HIDDEN'
      Size = 1
    end
    object tblWebDriectParamsWATERFALL_MIN_LT_MULT: TStringField
      FieldName = 'WATERFALL_MIN_LT_MULT'
      Size = 1
    end
    object tblWebDriectParamsWATERFALL_ALWAYS_SHOW_MULT: TStringField
      FieldName = 'WATERFALL_ALWAYS_SHOW_MULT'
      Size = 1
    end
  end
  object srcWebDirectParams: TDataSource
    DataSet = tblWebDriectParams
    Left = 498
    Top = 95
  end
end
