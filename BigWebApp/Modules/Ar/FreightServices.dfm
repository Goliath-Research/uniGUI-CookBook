object FrmFreightServices: TFrmFreightServices
  Left = 0
  Top = 0
  ClientHeight = 437
  ClientWidth = 1080
  Caption = 'Freight Carrier Web Service Providers'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TUniPanel
    Left = 0
    Top = 403
    Width = 1080
    Height = 34
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 865
      Top = 1
      Width = 215
      Height = 32
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 7
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 110
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 1080
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object sbtnToggleView: TUniSpeedButton
      Left = 26
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Toggle Form/Grid'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000A0860100A08601000001000000000000000000001212
        1200282828003E3E3E006A6A6A006F6F6F00800000008B09020097130300A21C
        0500AA230600AD250700B52C0800B92F0900C0340A00C4380A00CA3D0B00CF41
        0C00D5460D00D8511900DA5A2400DD663100E06E3A00E37C4900E5825000F08C
        6800E9916100EA966700EFAB7E00FF00FF00808080008A8A8A008F8F8F009494
        9400999999009F9F9F00A4A4A400A9A9A900ADADAD00AEAEAE00B0B0B000B3B3
        B300B4B4B400B7B7B700B8B8B800BABABA00BDBDBD00F4BF9400FAD3AA00C0C0
        C000C2C2C200C3C3C300C6C6C600C8C8C800C9C9C900CDCDCD00E0E0E000F9F9
        FB00FFFFFF000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001D1D1D1D0505
        050505050505050505051D1D1D1D0505050505050505050505051D1D1D1D1E2C
        29272524232221201F051D1D1D1D1E2C29272524232221201F051D1D1D1D1E2E
        2C2927250302010020051D1D1D1D1E2E2C2927250302010020051D1D1D1D1E32
        2E2C29271E3A3A0021051D1D1D1D1E322E2C29271E3A3A0021051D1D1D1D1E35
        2A2004291E1E1E1E22051D1D1D1D1E352A2004291E1E1E1E22051D1D1D1D1E37
        35322E2C2927252423051D1D1D1D1E3735322E2C2927252423051E1E1E1E1A17
        1513110F0D0B090807061E1E1E1E211E050403030303030202021E3838381A19
        191919191919191919061E3838382120202020202020202020021E3939391A17
        1513110F0D0B090807061E393939211E050403030303030202021E393331392D
        2B392826391E1D1D1D1D1E393331392D2B392826391E1D1D1D1D1E3939393939
        39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D1E3936343931
        2E392B2A391E1D1D1D1D1E39363439312E392B2A391E1D1D1D1D1E3939393939
        39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D302F1C1B1816
        1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D301919191919
        19191919190A1D1D1D1D3720202020202020202020031D1D1D1D302F1C1B1816
        1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnToggleViewClick
    end
    object SBSearch: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Search'
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
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
        90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
        40905030773818FF00FF8B8B8B7777775F5F5F5A5A5A5A5A5A4A4A4AFF00FFFF
        00FFFF00FF8484847474746F6F6F5A5A5A5151513B3B3BFF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0E0C8C0D0A8
        90B07850804820FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7C9C9C9A7A7A7777777484848FF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC09880FFFFFF
        F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF979797FFFFFFE7E7E7C9C9C99E9E9E424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC3A494B08870
        A068509050308048308048208038108F4C26B08870A068509058309048308040
        20703810905830FF00FFA4A4A48787876969695151514A4A4A4848483B3B3B4E
        4E4E8787876969695757574C4C4C424242393939575757FF00FFDEC4B4B08870
        FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
        50803820CFA98AFF00FFC3C3C3878787FFFFFFCECECEA1A1A16F6F6F414141B5
        B5B58D8D8DD7D7D7D9D9D9A1A1A17777773D3D3DA7A7A7FF00FFFF00FFC09080
        F0F0F0FFF8F0F0D8C0B08060804820965732B09070FFFFFFFFF8F0F0D0C0B078
        50804820FF00FFFF00FFFF00FFFF00FFF0F0F0F7F7F7D5D5D57F7F7F48484857
        57578D8D8DFFFFFFF7F7F7D0D0D0777777484848FF00FFFF00FFFF00FFF8E2D2
        C09880B08060A068509050309058409D6842B07860B08870A070508048308048
        20ECC4A7FF00FFFF00FFFF00FFE1E1E19797977F7F7F6969695151515A5A5A67
        67677979798787876F6F6F4A4A4A484848C2C2C2FF00FFFF00FFFF00FFFF00FF
        C09880FFF8FFE0C0B0C09070804820FF00FFC09880FFF8FFE0C8B0D0A0808048
        20FF00FFFF00FFFF00FFFF00FFFF00FF979797FAFAFAC0C0C08E8E8E484848FF
        00FF979797FAFAFAC5C5C59E9E9E484848FF00FFFF00FFFF00FFFF00FFFF00FF
        CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
        37FF00FFFF00FFFF00FFFF00FFFF00FFB0B0B08F8F8F696969515151525252FF
        00FFA5A5A58F8F8F696969515151505050FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFB1836DFFF8F0814527FF00FFFF00FFFF00FFB08068FFF8F0804324FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF838383F7F7F7464646FF00FFFF
        00FFFF00FF808080F7F7F7444444FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A78C8C8C676767FF00FFFF
        00FFFF00FFADADAD8B8B8B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = SBSearchClick
    end
    object NavMain: TUniDBNavigator
      Left = 840
      Top = 1
      Width = 240
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = wwSrcFreightCarrier
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object PnlMain: TUniPanel
    Left = 0
    Top = 27
    Width = 1080
    Height = 376
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object pcMain: TUniPageControl
      Left = 1
      Top = 1
      Width = 1078
      Height = 374
      Hint = ''
      ActivePage = TabForm
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabGrid: TUniTabSheet
        Hint = ''
        Caption = 'TabGrid'
        object GridFreightServices: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 1070
          Height = 346
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 853
          IQComponents.Grid.Height = 260
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = wwSrcFreightCarrier
          IQComponents.Grid.LoadMask.Message = 'Loading data...'
          IQComponents.Grid.Align = alClient
          IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
          IQComponents.Grid.TabOrder = 0
          IQComponents.Navigator.Left = 410
          IQComponents.Navigator.Top = 0
          IQComponents.Navigator.Width = 241
          IQComponents.Navigator.Height = 25
          IQComponents.Navigator.Hint = ''
          IQComponents.Navigator.ShowHint = True
          IQComponents.Navigator.DataSource = wwSrcFreightCarrier
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 853
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 260
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = wwSrcFreightCarrier
          Columns = <
            item
              FieldName = 'CARRIER'
              Title.Caption = 'Name'
              Width = 202
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'URL'
              Title.Caption = 'URL'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'USERNAME'
              Title.Caption = 'Username'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PASSWORD'
              Title.Caption = 'Password'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'API_KEY'
              Title.Caption = 'API Key'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ACCOUNT_NO'
              Title.Caption = 'Account #'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'IS_TEST_MODE'
              Title.Caption = 'Test Mode'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
          object cmbWebServiceProviderGrid: TUniEdit
            Left = 56
            Top = 154
            Width = 121
            Height = 21
            Hint = ''
            Text = ''
            TabOrder = 2
            ReadOnly = True
            OnKeyDown = cmbWebServiceProviderGridKeyDown
          end
        end
      end
      object TabForm: TUniTabSheet
        Hint = ''
        Caption = 'TabForm'
        object PnlFormCarrier: TUniPanel
          Tag = 1999
          Left = 0
          Top = 0
          Width = 1070
          Height = 346
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter1: TUniSplitter
            Left = 161
            Top = 0
            Width = 6
            Height = 346
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlFormLeft: TUniPanel
            Left = 1
            Top = 1
            Width = 161
            Height = 344
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object lblPassword: TUniLabel
              Left = 8
              Top = 86
              Width = 46
              Height = 13
              Hint = ''
              Caption = 'Password'
              TabOrder = 1
            end
            object lblName: TUniLabel
              Left = 8
              Top = 13
              Width = 27
              Height = 13
              Hint = ''
              Caption = 'Name'
              TabOrder = 2
            end
            object lblUsername: TUniLabel
              Left = 8
              Top = 62
              Width = 48
              Height = 13
              Hint = ''
              Caption = 'Username'
              TabOrder = 3
            end
            object lblURL: TUniLabel
              Left = 8
              Top = 37
              Width = 19
              Height = 13
              Hint = ''
              Caption = 'URL'
              TabOrder = 4
            end
          end
          object PnlFormClient: TUniPanel
            Left = 167
            Top = 1
            Width = 903
            Height = 344
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            DesignSize = (
              903
              344)
            object dbeWebServiceURL: TUniDBEdit
              Left = 3
              Top = 34
              Width = 755
              Height = 21
              Hint = ''
              DataField = 'URL'
              DataSource = wwSrcFreightCarrier
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              ReadOnly = True
            end
            object dbeWebServiceUserName: TUniDBEdit
              Left = 3
              Top = 58
              Width = 200
              Height = 21
              Hint = ''
              DataField = 'USERNAME'
              DataSource = wwSrcFreightCarrier
              TabOrder = 1
            end
            object cmbWebServiceProvider: TUniEdit
              Left = 3
              Top = 10
              Width = 522
              Height = 21
              Hint = ''
              Text = ''
              TabOrder = 2
              ReadOnly = True
              OnKeyDown = cmbWebServiceProviderKeyDown
            end
            object dbeWebServicePassword: TUniDBEdit
              Left = 3
              Top = 82
              Width = 200
              Height = 21
              Hint = ''
              DataField = 'PASSWORD'
              DataSource = wwSrcFreightCarrier
              PasswordChar = '*'
              TabOrder = 3
            end
          end
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 356
    Top = 142
    object File1: TUniMenuItem
      Caption = '&File'
      object New1: TUniMenuItem
        Caption = 'New'
        OnClick = New1Click
      end
      object N2: TUniMenuItem
        Caption = '-'
      end
      object ToggleFormTable1: TUniMenuItem
        Caption = '&Toggle Form/Table'
        OnClick = ToggleFormTable1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object wwSrcFreightCarrier: TDataSource
    DataSet = wwQryFreightCarrier
    Left = 480
    Top = 216
  end
  object wwQryFreightCarrier: TFDQuery
    BeforePost = wwQryFreightCarrierBeforePost
    AfterPost = wwQryFreightCarrierAfterPost
    AfterDelete = wwQryFreightCarrierAfterDelete
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'SELECT fc.id   AS id,'
      '  fc.password  AS password,'
      '  fc.username  AS username,'
      '  fc.api_key AS api_key,'
      '  fc.account_no as account_no,'
      '  fc.type      AS frieght_carrier_type,'
      '  nvl(fc.is_test_mode, '#39'N'#39') AS is_test_mode,'
      '  vfct.carrier AS carrier,'
      '  vfct.url     AS url'
      'FROM freight_carrier fc'
      'JOIN v_freight_carrier_type vfct'
      'ON fc.type = vfct.freight_carrier_type')
    Left = 482
    Top = 264
    object wwQryFreightCarrierID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object wwQryFreightCarrierPASSWORD: TStringField
      FieldName = 'PASSWORD'
      Size = 50
    end
    object wwQryFreightCarrierUSERNAME: TStringField
      FieldName = 'USERNAME'
      Size = 30
    end
    object wwQryFreightCarrierFRIEGHT_CARRIER_TYPE: TBCDField
      FieldName = 'FRIEGHT_CARRIER_TYPE'
      Size = 0
    end
    object wwQryFreightCarrierCARRIER: TStringField
      FieldName = 'CARRIER'
      Size = 33
    end
    object wwQryFreightCarrierURL: TStringField
      FieldName = 'URL'
      Size = 56
    end
    object wwQryFreightCarrierAPI_KEY: TStringField
      FieldName = 'API_KEY'
      Size = 50
    end
    object wwQryFreightCarrierACCOUNT_NO: TStringField
      FieldName = 'ACCOUNT_NO'
      Size = 50
    end
    object wwQryFreightCarrierIS_TEST_MODE: TStringField
      FieldName = 'IS_TEST_MODE'
      Size = 1
    end
  end
  object PkWebServices: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT freight_carrier_type,'
      '  carrier,'
      '  url'
      'FROM v_freight_carrier_type'
      'WHERE freight_carrier_type NOT IN'
      '  (SELECT type FROM freight_carrier)')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 684
    Top = 220
    object PkWebServicesFREIGHT_CARRIER_TYPE: TFMTBCDField
      DisplayLabel = 'ID'
      FieldName = 'FREIGHT_CARRIER_TYPE'
      Visible = False
      Size = 38
    end
    object PkWebServicesCARRIER: TStringField
      DisplayLabel = 'Freight Service Provider'
      FieldName = 'CARRIER'
      Size = 33
    end
    object PkWebServicesURL: TStringField
      FieldName = 'URL'
      Size = 56
    end
  end
  object PkFreightCarrier: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT fc.id AS id,'
      '  fc.descrip AS descrip,'
      '  vfct.url   AS url'
      'FROM freight_carrier fc'
      'LEFT OUTER JOIN v_freight_carrier_type vfct'
      'ON fc.type = vfct.freight_carrier_type')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 687
    Top = 276
    object PkFreightCarrierID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.FREIGHT_CARRIER.ID'
      Size = 0
    end
    object PkFreightCarrierDESCRIP: TStringField
      DisplayLabel = 'Name'
      FieldName = 'DESCRIP'
      Origin = 'IQ.FREIGHT_CARRIER.DESCRIP'
      Size = 60
    end
    object PkFreightCarrierURL: TStringField
      FieldName = 'URL'
      Origin = 'IQ.V_FREIGHT_CARRIER_TYPE.URL'
      Size = 56
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Ship Via Maintenance'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 189858 $'
    BuildVersion = '176554'
    Left = 420
    Top = 145
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into freight_carrier'
      
        '  ( PASSWORD, USERNAME, API_KEY, ACCOUNT_NO, TYPE, DESCRIP, IS_T' +
        'EST_MODE)'
      'values'
      
        '  ( :PASSWORD, :USERNAME, :API_KEY, :ACCOUNT_NO, :FRIEGHT_CARRIE' +
        'R_TYPE, :CARRIER, :IS_TEST_MODE)')
    ModifySQL.Strings = (
      'update freight_carrier'
      'set'
      '  ID = :ID,'
      '  PASSWORD = :PASSWORD,'
      '  USERNAME = :USERNAME,'
      '  API_KEY = :API_KEY,'
      '  ACCOUNT_NO = :ACCOUNT_NO,'
      '  TYPE = :FRIEGHT_CARRIER_TYPE,'
      '  DESCRIP = :CARRIER,'
      '  IS_TEST_MODE = :IS_TEST_MODE'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from freight_carrier'
      'where'
      '  ID = :OLD_ID')
    Left = 477
    Top = 316
  end
end
