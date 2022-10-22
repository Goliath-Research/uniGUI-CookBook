object FrmFloorScaleConfig: TFrmFloorScaleConfig
  Left = 566
  Top = 248
  ClientHeight = 486
  ClientWidth = 457
  Caption = 'Scale Configuration'
  OnShow = FormShow
  Position = poMainFormCenter
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    457
    486)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCOMSettings: TUniPanel
    Left = 0
    Top = 27
    Width = 457
    Height = 440
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object pnlCOMSettingsHdr: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 455
      Height = 19
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      Color = clBtnShadow
      object lblSettingsHdr: TUniLabel
        Left = 1
        Top = 1
        Width = 75
        Height = 13
        Hint = ''
        Caption = 'COM Settings'
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Style = [fsBold]
        TabOrder = 2
      end
      object Panel18: TUniPanel
        Left = 425
        Top = 1
        Width = 30
        Height = 17
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        ParentColor = True
      end
    end
    object diCOMDevice: TwwDataInspector
      Left = 0
      Top = 19
      Width = 457
      Height = 421
      DisableThemes = False
      Align = alClient
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Items = <
        item
          Caption = 'Port'
          Expanded = True
          PickList.Items.Strings = (
            '0')
          PickList.Style = csDropDownList
          WordWrap = False
        end
        item
          Caption = 'Baud'
          PickList.Items.Strings = (
            '150'
            '300'
            '600'
            '1200'
            '2400'
            '4800'
            '9600'
            '19200'
            '38400'
            '57600'
            '115200')
          WordWrap = False
        end
        item
          Caption = 'Parity'
          PickList.Items.Strings = (
            'Odd'
            'None')
          WordWrap = False
        end
        item
          Caption = 'DataBits'
          PickList.Items.Strings = (
            '7'
            '8')
          WordWrap = False
        end
        item
          Caption = 'DTR'
          PickList.Items.Strings = (
            'False'
            'True')
          WordWrap = False
        end
        item
          Caption = 'RTS'
          PickList.Items.Strings = (
            'False'
            'True')
          WordWrap = False
        end>
      CaptionWidth = 85
      Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      LineStyleCaption = ovDottedLine
      LineStyleData = ovDottedLine
      OnItemChanged = diCOMDeviceItemChanged
    end
  end
  object pnlToolbar: TUniPanel
    Left = 0
    Top = 0
    Width = 457
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object cbxOpenPort: TUniCheckBox
      Left = 8
      Top = 5
      Width = 81
      Height = 17
      Hint = ''
      Caption = 'Activate'
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 0
      OnClick = cbxOpenPortClick
    end
  end
  object gbxTest: TUniGroupBox
    Left = 5
    Top = 164
    Width = 455
    Height = 315
    Hint = ''
    Caption = 'Test'
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    ParentFont = False
    Font.Height = -13
    Font.Style = [fsBold]
    object pnlpgctrTestHolder: TUniPanel
      Left = 2
      Top = 18
      Width = 451
      Height = 295
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = 'Please select a device.'
      object pctrlTest: TUniPageControl
        Left = 1
        Top = 1
        Width = 449
        Height = 293
        Hint = ''
        ActivePage = tabScanner
        TabBarVisible = True
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object tabScanner: TUniTabSheet
          Hint = ''
          ImageIndex = 1
          Caption = 'Scanner'
          object sbtnClearScanner: TUniSpeedButton
            Left = 387
            Top = 7
            Width = 50
            Height = 50
            Hint = ''
            Glyph.Data = {
              4E010000424D4E01000000000000760000002800000012000000120000000100
              040000000000D800000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
              6666660000006666666666666666660000006FF6FF666666666666000000FFFF
              FFFF6666666666000000FFFFFF711166666666000000FFFFF791111666666600
              0000FFFFF9191111666666000000FF6F61999111066666000000F66669191910
              7066660000006666669191038706660000006666666910BB3870660000006666
              66663BF8B387060000006666666663BF8B303000000066666666663BFB033300
              0000666666666663B38B3300000066666666666638BBB3000000666666666666
              63FBBB000000666666666666663FBB000000}
            Caption = ''
            ParentColor = False
            Color = clWindow
            OnClick = sbtnClearScannerClick
          end
          object Label1: TUniLabel
            Left = 1
            Top = 106
            Width = 45
            Height = 16
            Hint = ''
            Caption = 'Output'
            TabOrder = 3
          end
          object edOutput: TUniEdit
            Left = 1
            Top = 20
            Width = 376
            Height = 24
            Hint = ''
            Text = ''
            ParentFont = False
            Font.Height = -13
            TabOrder = 0
          end
          object btnSend: TUniButton
            Left = 0
            Top = 52
            Width = 100
            Height = 40
            Hint = ''
            Enabled = False
            Caption = 'Send'
            ParentFont = False
            Font.Style = [fsBold]
            TabOrder = 4
            OnClick = btnSendClick
          end
          object Memo1: TUniMemo
            Left = 0
            Top = 120
            Width = 441
            Height = 145
            Hint = ''
            TabOrder = 2
          end
        end
      end
    end
  end
  object Status: TUniStatusBar
    Left = 0
    Top = 467
    Width = 457
    Height = 19
    Hint = ''
    Panels = <
      item
        Width = 200
      end>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object commFloorScale: TApdWinsockPort
    WsLocalAddresses.Strings = (
      '10.92.6.120')
    WsLocalAddressIndex = 0
    WsPort = 'telnet'
    WsSocksServerInfo.Port = 0
    WsTelnet = False
    AutoOpen = False
    Baud = 9600
    ComNumber = 1
    DataBits = 7
    TraceName = 'APRO.TRC'
    LogName = 'commFloorScale.LOG'
    Parity = pEven
    PromptForPort = False
    OnTriggerAvail = commFloorScaleTriggerAvail
    Left = 208
    Top = 88
  end
end
