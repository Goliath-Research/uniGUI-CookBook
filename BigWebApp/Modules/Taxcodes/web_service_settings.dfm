object FrmTaxWebServiceSettings: TFrmTaxWebServiceSettings
  Left = 0
  Top = 0
  ClientHeight = 267
  ClientWidth = 702
  Caption = 'Tax Web Service Settings'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TUniPanel
    Left = 0
    Top = 27
    Width = 702
    Height = 240
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 0
      Top = 0
      Width = 6
      Height = 240
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object wwDataInspector1: TwwDataInspector
      Left = 6
      Top = 0
      Width = 696
      Height = 240
      DisableThemes = False
      Align = alClient
      CaptionColor = 14671839
      DataColumns = 2
      IndicatorRow.Enabled = True
      IndicatorRow.Height = 20
      PopupMenu = PopupMenu1
      ScrollBars = ssBoth
      TabOrder = 0
      DataSource = SrcAvalaraSettings
      Items = <
        item
          DataSource = SrcAvalaraSettings
          DataField = 'SOURCE_NAME'
          Caption = 'System Default / EPlant'
          ReadOnly = True
          Resizeable = True
          WordWrap = False
        end
        item
          DataSource = SrcAvalaraSettings
          DataField = 'EPLANT_ID'
          Caption = 'ID'
          CellHeight = 19
          ReadOnly = True
          Resizeable = True
          WordWrap = False
        end
        item
          DataSource = SrcAvalaraSettings
          DataField = 'ENABLED'
          Caption = 'Enable Avalara Tax Service'
          Expanded = True
          PickList.Items.Strings = (
            'Y'
            'N')
          PickList.AllowClearKey = True
          PickList.DisplayAsCheckbox = True
          Resizeable = True
          WordWrap = False
        end
        item
          DataSource = SrcAvalaraSettings
          DataField = 'SERVICE_URL'
          Caption = 'Web Service URL'
          Expanded = True
          PickList.AllowClearKey = True
          Resizeable = True
          WordWrap = False
        end
        item
          DataSource = SrcAvalaraSettings
          DataField = 'ACCOUNT'
          Caption = 'Account #'
          CellHeight = 19
          Expanded = True
          PickList.AllowClearKey = True
          Resizeable = True
          WordWrap = False
        end
        item
          DataSource = SrcAvalaraSettings
          DataField = 'LICENSE_KEY'
          Caption = 'License Key'
          Expanded = True
          PickList.AllowClearKey = True
          Resizeable = True
          WordWrap = False
        end
        item
          DataSource = SrcAvalaraSettings
          DataField = 'REQUEST_TIMEOUT'
          Caption = 'Request Timeout'
          WordWrap = False
        end
        item
          DataSource = SrcAvalaraSettings
          DataField = 'LOGGING_ENABLED'
          Caption = 'Logging Enabled'
          Expanded = True
          PickList.Items.Strings = (
            'Y'
            'N')
          PickList.DisplayAsCheckbox = True
          WordWrap = False
        end
        item
          DataSource = SrcAvalaraSettings
          DataField = 'COMPANY_CODE'
          Caption = 'Company Code'
          Expanded = True
          PickList.AllowClearKey = True
          Resizeable = True
          WordWrap = False
        end
        item
          DataSource = SrcAvalaraSettings
          DataField = 'DEFAULT_TAX_CLASS'
          Caption = 'Default Tax Class'
          ReadOnly = True
          CustomControl = dbeDefaultTaxClass
          WordWrap = False
        end
        item
          DataSource = SrcAvalaraSettings
          DataField = 'DOC_COMMIT'
          Caption = 'Disable Document Committing'
          PickList.Items.Strings = (
            'N'
            'Y')
          PickList.DisplayAsCheckbox = True
          WordWrap = False
        end
        item
          DataSource = SrcAvalaraSettings
          DataField = 'USE_UPC_CODE'
          Caption = 'Use UPC Code'
          PickList.Items.Strings = (
            'Y'
            'N')
          PickList.DisplayAsCheckbox = True
          WordWrap = False
        end>
      DefaultRowHeight = 19
      CaptionWidth = 180
      Options = [ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert, ovFillNonCellArea]
      PaintOptions.ActiveRecordColor = clCream
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      LineStyleCaption = ovLight3DLine
      LineStyleData = ovLight3DLine
      CaptionIndent = 16
      object dbeDefaultTaxClass: TUniEdit
        Left = 256
        Top = 120
        Width = 245
        Height = 18
        Hint = ''
        Visible = False
        BorderStyle = ubsNone
        Text = ''
        TabOrder = 0
        TabStop = False
        ReadOnly = True
        OnKeyDown = dbeDefaultTaxClassKeyDown
      end
    end
  end
  object pnlNav: TUniPanel
    Left = 0
    Top = 0
    Width = 702
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object sbtnCopyFromDefault: TUniSpeedButton
      Left = 9
      Top = 2
      Width = 25
      Height = 25
      Hint = 'Assign from System Default parameters'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFC07040B05830B05830A05020A050209048209048
        20904020804020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7171715C
        5C5C5C5C5C5353535353534A4A4A4A4A4A454545424242FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFC07850FFF8F0D0B0A0D0B0A0D0B0A0C0B0A0C0A8
        A0C0A890904020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF797979F7
        F7F7AFAFAFAFAFAFAFAFAFAEAEAEA8A8A8A5A5A5454545FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFD08860FFFFFFE09060D08050D08050D08050D080
        50C0A8A0904820FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF888888FF
        FFFF909090808080808080808080808080A8A8A84A4A4AFF00FFB0A090604830
        604830604830604830604830D09070FFFFFFFFFFFFFFF0F0F0E0D0F0D0C0F0C0
        B0C0B0A0904820FF00FF9E9E9E464646464646464646464646464646909090FF
        FFFFFFFFFFF2F2F2DEDEDED0D0D0C1C1C1AEAEAE4A4A4AFF00FFB0A090FFF0F0
        F0E0D0E0D8D0E0D0C0E0C8C0E0A080FFFFFFF0A880E09870E09060D08050D080
        50D0B0A0A04820FF00FF9E9E9EF2F2F2DEDEDED7D7D7CECECEC9C9C9A0A0A0FF
        FFFFA8A8A8989898909090808080808080AFAFAF4D4D4DFF00FFB0A090FFF8F0
        E0B080E0A070E0A070D09870E0A890FFFFFFFFFFFFFFFFFFFFF8F0F0E8E0F0D0
        C0D0B0A0A05020FF00FF9E9E9EF7F7F7ACACAC9E9E9E9E9E9E969696A9A9A9FF
        FFFFFFFFFFFFFFFFF7F7F7E7E7E7D0D0D0AFAFAF535353FF00FFC0A890FFFFFF
        FFF8F0F0F0F0F0E8E0F0E0D0E0B8A0FFFFFFFFB090FFB090F0D8D0E09060B058
        30B05830A05020FF00FFA5A5A5FFFFFFF7F7F7F0F0F0E7E7E7DEDEDEB7B7B7FF
        FFFFB1B1B1B1B1B1D9D9D99090905C5C5C5C5C5C535353FF00FFC0A8A0FFFFFF
        FFC8A0F0B890E0B080E0A070F0C0A0FFFFFFFFFFFFFFFFFFFFFFFFF09870F0C8
        B0B05830E8BFA4FF00FFA8A8A8FFFFFFC6C6C6B6B6B6ACACAC9E9E9EBEBEBEFF
        FFFFFFFFFFFFFFFFFFFFFF9A9A9AC7C7C75C5C5CBEBEBEFF00FFC0B0A0FFFFFF
        FFFFFFFFF8FFFFF0F0F0E8E0F0C8B0FFFFFFFFFFFFFFFFFFFFFFFFF0A880C068
        30ECC4A6FF00FFFF00FFAEAEAEFFFFFFFFFFFFFAFAFAF2F2F2E7E7E7C7C7C7FF
        FFFFFFFFFFFFFFFFFFFFFFA8A8A86A6A6AC2C2C2FF00FFFF00FFD0B8B0FFFFFF
        FFD8C0FFD0B0F0E0D0B0A090F0C8B0F0C0B0F0C0B0F0B8A0F0B090F0B090F4CE
        B3FF00FFFF00FFFF00FFB8B8B8FFFFFFD7D7D7CECECEDEDEDE9E9E9EC7C7C7C1
        C1C1C1C1C1B8B8B8B0B0B0B0B0B0CCCCCCFF00FFFF00FFFF00FFD0C0B0FFFFFF
        FFFFFFFFFFFFFFFFFFC0A890D0C8C0907060DEC7B2FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFA5A5A5C7C7C770
        7070C5C5C5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE0C0B0FFFFFF
        FFFFFFFFFFFFFFFFFFC0B0A0A08060DFC8B4FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFAEAEAE7D7D7DC6
        C6C6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE0C0B0E0C0B0
        D0C0B0D0C0B0D0B8B0D0B0A0E4CEBFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFC0C0C0C0C0C0BEBEBEBEBEBEB8B8B8AFAFAFCDCDCDFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnCopyFromDefaultClick
    end
    object sbtnWebConsole: TUniSpeedButton
      Left = 33
      Top = 2
      Width = 25
      Height = 25
      Hint = 'AvaTax Admin Console'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFCEC6C69C949473736B6B6B6373737394949CBDBDCEFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE7E7E7AD844AA56331BD6331CE
        6339BD5A39A55A4273524273635A848484DEDEDEFF00FFFF00FFFF00FFFF00FF
        DED6B5C67329BD5A39B55231946B42AD5239C65239CE5A42CE634AA552397B5A
        4A63736BD6DEE7FF00FFFF00FFFFE7CECE63299C4208A53100A53908525A1894
        3908A531089C3910B54A29BD5A39AD5242845A527B7B7BFF00FFFFF7EFCE7B39
        9C3900AD3900AD4200AD4A00106B08186300B54200A54200943900A53908AD52
        399C524A735A52BDBDBDF7DEADA54200AD4A00B55200B55A00A55A0010730008
        7300426300C65208AD4A00AD42006B63319463428C5A42848484E7AD63A54A00
        C65A00CE6300D66B00737B00088400008400317B00CE6300A55A007B5A00296B
        186363318C5A31636363DE8C39B55A00D66308D67300A584004A94001094007B
        8C00D68400C67B00007B00006B00106300396B217B5A21636363D67B29D66308
        CE730052941018A51829A5188C9C18F79410F79408C68400298400087B081073
        001063086363186B6363E7AD5ACE6B006B9C1010B52921B54221BD42B5BD4AEF
        BD42FFAD21FF9408738C00008400007B000863085A6310847B84EFC684D67300
        4AAD3121BD4A39CE634AD66B42C66BC6D684FFC65AFFAD18A59400108C000084
        00086B086B6318BDBDB5FFF7D68C9C2921B5394ACE635ADE84ADDE9484DE94D6
        F7B5DECE7BFFAD39D694086B8C00008400086B00847352FF00FFFF00FFADD694
        29BD524ADE7B94DEA5B5F7B5A5F7ADB5EFAD52CE734ABD427B9C18D67B082984
        007B7B21DEDED6FF00FFFF00FFFF00FFA5D6945ACE7B73E79CBDEFADADEFAD94
        DE9C42CE6B21BD39BD8C08EF8400C67321E7D6ADFF00FFFF00FFFF00FFFF00FF
        FF00FFCEEFBD7BE78C84E79484E7945AD68429CE6318B531B59421E7AD39FFF7
        C6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEEFC6CED69CCE
        D68CC6CE7BD6DE9CFFE7CEFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnWebConsoleClick
    end
    object sbtnTestSettings: TUniSpeedButton
      Left = 57
      Top = 2
      Width = 25
      Height = 25
      Hint = 'Test Settings'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFC2C2C2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC2C2C25D5D5D878787
        8787878787871997C612ACE10DACE40DACE40DACE420A02D1FA02C0D9BD28787
        878787878787877070705D5D5D8787878787878787879E9E9EB4B4B4B5B5B5B5
        B5B5B5B5B58B8B8B8B8B8BA5A5A58787878787878787877070706B6B6BDCDCDC
        E3E3E3E3E3E32CA8D501CAFF02D9FF09C6F020A02D44EE7541FF7D1FA02CE3E3
        E3E3E3E3DFDFDF7979796B6B6BDCDCDCE3E3E3E3E3E3AEAEAED1D1D1DCDCDCCA
        CACA8B8B8BD4D4D4E2E2E28B8B8BE3E3E3E3E3E3DFDFDF797979FF00FFFF00FF
        FF00FFFF00FFFF00FF1195C61D9CCE1FA02C27F54B2DFF5948E8793EFF711FA0
        2CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9D9D9DA4A4A48B
        8B8BD6D6D6DFDFDFCFCFCFE2E2E28B8B8BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF3434341B241F171D1820A02D27F54B23E5421FA02C20A02D40E26D32FF
        621FA02CFF00FFFF00FFFF00FFFF00FFFF00FF3434342222221B1B1B8B8B8BD6
        D6D6C8C8C88B8B8B8B8B8BC9C9C9E0E0E08B8B8BFF00FFFF00FFFF00FFFF00FF
        BFBFBF28282826F80518452E12121220A02D20A02D2C2C2CA5A5A51FA02C4BFF
        8C26FF4B1FA02CFF00FFFF00FFFF00FFBFBFBF282828D7D7D73E3E3E1212128B
        8B8B8B8B8B2C2C2CA5A5A58B8B8BE4E4E4DFDFDF8B8B8BFF00FFFF00FFFF00FF
        ADADAD393939326A3F2C50322020209090905D5D5D2C2C2C1D1D1D4949491FA0
        2C3EFF7A25FF4B1FA02CFF00FFFF00FFADADAD3939395F5F5F48484820202090
        90905D5D5D2C2C2C1D1D1D4949498B8B8BE2E2E2DFDFDF8B8B8BFF00FFFF00FF
        A5A5A54B4B4B2CEE093D583B343434A5A5A5A2A2A29C9C9C6363633F3F3F8888
        881FA02C46FF8220A02DFF00FFFF00FFA5A5A54B4B4BCECECE515151343434A5
        A5A5A2A2A29C9C9C6363633F3F3F8888888B8B8BE3E3E38B8B8BFF00FFFF00FF
        ADADAD5353535454544E4E4E444444ADADADABABABA7A7A7A5A5A5A2A2A28181
        81FF00FF1FA02DFF00FFFF00FFFF00FFADADAD5353535454544E4E4E444444AD
        ADADABABABA7A7A7A5A5A5A2A2A2818181FF00FF8B8B8BFF00FFFF00FFFF00FF
        B8B8B84444443F3F3F515151505050A0A0A0AEAEAEAFAFAFACACACA8A8A88787
        87FF00FFFF00FFFF00FFFF00FFFF00FFB8B8B84444443F3F3F515151505050A0
        A0A0AEAEAEAFAFAFACACACA8A8A8878787FF00FFFF00FFFF00FFFF00FFFF00FF
        C9C9C93E3E3E3434344444444E4E4EB9B9B9ACACACA8A8A8ADADADB4B4B48D8D
        8DFF00FFFF00FFFF00FFFF00FFFF00FFC9C9C93E3E3E3434344444444E4E4EB9
        B9B9ACACACA8A8A8ADADADB4B4B48D8D8DFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF474747343434313131515151DADADAD3D3D3C1C1C1B1B1B1A5A5A58E8E
        8EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF474747343434313131515151DA
        DADAD3D3D3C1C1C1B1B1B1A5A5A58E8E8EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF5555553131312C2C2C5E5E5EE7E7E7E5E5E5DFDFDFD3D3D3C4C4C48B8B
        8BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5555553131312C2C2C5E5E5EE7
        E7E7E5E5E5DFDFDFD3D3D3C4C4C48B8B8BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFBFBFBF8383836F6F6FA0A0A0B5B5B5BFBFBFC9C9C9E7E7E7E7E7E79A9A
        9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBF8383836F6F6FA0A0A0B5
        B5B5BFBFBFC9C9C9E7E7E7E7E7E79A9A9AFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFC3C3C3A2A2A28A8A8A9595956464646868688282
        82FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC3C3C3A2
        A2A28A8A8A959595646464686868828282FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnTestSettingsClick
    end
    object NavMain: TUniDBNavigator
      Left = 477
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      DataSource = SrcAvalaraSettings
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmInvPhysCharsUom'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 193318 $'
    BuildVersion = '176554'
    Left = 330
    Top = 73
  end
  object MainMenu1: TUniMainMenu
    Left = 357
    Top = 73
    object MenuItem1: TUniMenuItem
      Caption = 'File'
      object MenuItem2: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = 'Options'
      object CustomerUsageTypes1: TUniMenuItem
        Caption = 'Customer Usage Types'
        OnClick = CustomerUsageTypes1Click
      end
      object InventoryTaxClasses1: TUniMenuItem
        Caption = 'Inventory Tax Classes'
        OnClick = InventoryTaxClasses1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About ...'
        OnClick = About1Click
      end
    end
  end
  object SrcAvalaraSettings: TDataSource
    DataSet = QryAvalaraSettings
    Left = 393
    Top = 71
  end
  object PKEplant: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select id,'
      '       name'
      '  from eplant'
      ' where misc.eplant_filter( id ) = 1'
      
        '   and nvl(iqsys3_settings.get_avalara_has_settings(id), '#39'N'#39')  =' +
        ' '#39'N'#39)
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 429
    Top = 71
    object PKEplantID: TFloatField
      DisplayLabel = 'EPlant ID'
      FieldName = 'ID'
      Origin = 'IQ.EPLANT.ID'
    end
    object PKEplantNAME: TStringField
      DisplayLabel = 'Descrip'
      FieldName = 'NAME'
      Origin = 'IQ.EPLANT.NAME'
      Size = 30
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'sbtnCopyFromDefault'
      'QryInvPhysCharUomsLENGTH_UOM'
      'QryInvPhysCharUomsWIDTH_UOM'
      'QryInvPhysCharUomsGAUGE_UOM'
      'QryInvPhysCharUomsCORE_SIZE_UOM'
      'QryInvPhysCharUomsOD_UOM'
      'NavMain')
    SecurityCode = 'FRMTAXWEBSERVICESETTINGS'
    Left = 464
    Top = 72
  end
  object QryAvalaraSettings: TFDQuery
    AfterPost = QryAvalaraSettingsAfterPost
    CachedUpdates = True
    OnUpdateRecord = QryAvalaraSettingsUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT s.source_name, s.eplant_id, s.enabled, s.service_url, s.a' +
        'ccount,'
      
        '       s.license_key, s.company_code, s.tax_class_id, t.code as ' +
        'default_tax_class,'
      
        '       s.request_timeout, s.logging_enabled, s.doc_commit, s.use' +
        '_upc_code'
      '  FROM v_avalara_settings s,'
      '             tax_class t'
      '   where (s.eplant_id = 0'
      '        or'
      '        misc.eplant_filter( s.eplant_id ) = 1)'
      '   and s.tax_class_id = t.id(+)')
    Left = 393
    Top = 89
    object QryAvalaraSettingsSOURCE_NAME: TStringField
      FieldName = 'SOURCE_NAME'
      Size = 30
    end
    object QryAvalaraSettingsEPLANT_ID: TFMTBCDField
      FieldName = 'EPLANT_ID'
      Size = 38
    end
    object QryAvalaraSettingsENABLED: TStringField
      FieldName = 'ENABLED'
      Size = 1
    end
    object QryAvalaraSettingsSERVICE_URL: TStringField
      FieldName = 'SERVICE_URL'
      Size = 60
    end
    object QryAvalaraSettingsACCOUNT: TStringField
      FieldName = 'ACCOUNT'
      Size = 30
    end
    object QryAvalaraSettingsLICENSE_KEY: TStringField
      FieldName = 'LICENSE_KEY'
      Size = 30
    end
    object QryAvalaraSettingsCOMPANY_CODE: TStringField
      FieldName = 'COMPANY_CODE'
      Size = 30
    end
    object QryAvalaraSettingsTAX_CLASS_ID: TFMTBCDField
      FieldName = 'TAX_CLASS_ID'
      Size = 38
    end
    object QryAvalaraSettingsDEFAULT_TAX_CLASS: TStringField
      FieldName = 'DEFAULT_TAX_CLASS'
      Size = 8
    end
    object QryAvalaraSettingsREQUEST_TIMEOUT: TFMTBCDField
      FieldName = 'REQUEST_TIMEOUT'
      Size = 38
    end
    object QryAvalaraSettingsLOGGING_ENABLED: TStringField
      FieldName = 'LOGGING_ENABLED'
      Size = 1
    end
    object QryAvalaraSettingsDOC_COMMIT: TStringField
      FieldName = 'DOC_COMMIT'
      Origin = 'DOC_COMMIT'
      Size = 1
    end
    object QryAvalaraSettingsUSE_UPC_CODE: TStringField
      FieldName = 'USE_UPC_CODE'
      Origin = 'USE_UPC_CODE'
      Size = 4
    end
  end
  object PkTaxClass: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select id, code, description, information from tax_class')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 552
    Top = 97
    object PkTaxClassID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.TAX_CLASS.ID'
      Visible = False
      Size = 0
    end
    object PkTaxClassCODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'CODE'
      Origin = 'IQ.TAX_CLASS.CODE'
      Size = 8
    end
    object PkTaxClassDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 60
      FieldName = 'DESCRIPTION'
      Origin = 'IQ.TAX_CLASS.DESCRIPTION'
      Size = 255
    end
    object PkTaxClassINFORMATION: TStringField
      DisplayLabel = 'Information'
      DisplayWidth = 60
      FieldName = 'INFORMATION'
      Origin = 'IQ.TAX_CLASS.INFORMATION'
      Visible = False
      Size = 1000
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 328
    Top = 155
    object JumptoAvaTaxAdminConsole1: TUniMenuItem
      Caption = 'Jump to AvaTax Admin Console'
      OnClick = JumptoAvaTaxAdminConsole1Click
    end
  end
end
