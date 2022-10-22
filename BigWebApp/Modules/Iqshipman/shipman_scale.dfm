object FrmShipManScale: TFrmShipManScale
  Left = 282
  Top = 100
  HelpContext = 17620
  ClientHeight = 267
  ClientWidth = 479
  Caption = 'Freight Scale'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMain: TUniPanel
    Left = 0
    Top = 25
    Width = 479
    Height = 242
    Hint = ''
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object pcScale: TUniPageControl
      Left = 1
      Top = 1
      Width = 477
      Height = 240
      Hint = ''
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      ActivePage = TabCom
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabCom: TUniTabSheet
        Hint = ''
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        TabVisible = False
        Caption = 'TabCom'
        object PnlClient01: TUniPanel
          Left = 0
          Top = 0
          Width = 469
          Height = 343
          Hint = ''
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object Splitter1: TUniSplitter
            Left = 97
            Top = 1
            Width = 6
            Height = 341
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlLeft01: TUniPanel
            Left = 1
            Top = 1
            Width = 96
            Height = 341
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            DesignSize = (
              96
              341)
            object Label1: TUniLabel
              Left = 8
              Top = 12
              Width = 27
              Height = 13
              Hint = ''
              Caption = 'Name'
              TabOrder = 1
            end
            object lblDeviceConfigPort: TUniLabel
              Left = 8
              Top = 36
              Width = 20
              Height = 13
              Hint = ''
              Caption = 'Port'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
            object lblDeviceConfigDataBits: TUniLabel
              Left = 8
              Top = 60
              Width = 43
              Height = 13
              Hint = ''
              Caption = 'Data Bits'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
            end
            object lblDeviceConfigBaud: TUniLabel
              Left = 8
              Top = 84
              Width = 50
              Height = 13
              Hint = ''
              Caption = 'Baud Rate'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 4
            end
            object lblDeviceConfigStopBits: TUniLabel
              Left = 8
              Top = 108
              Width = 42
              Height = 13
              Hint = ''
              Caption = 'Stop Bits'
              TabOrder = 5
            end
            object lblDeviceConfigParity: TUniLabel
              Left = 8
              Top = 132
              Width = 28
              Height = 13
              Hint = ''
              Caption = 'Parity'
              TabOrder = 6
            end
            object lblDeviceConfigStartChar: TUniLabel
              Left = 8
              Top = 156
              Width = 75
              Height = 13
              Hint = ''
              Caption = 'Start Character'
              TabOrder = 7
            end
            object lblDeviceConfigStopChar: TUniLabel
              Left = 8
              Top = 180
              Width = 73
              Height = 13
              Hint = ''
              Caption = 'Stop Character'
              TabOrder = 8
            end
          end
          object PnlClient02: TUniPanel
            Left = 103
            Top = 1
            Width = 365
            Height = 341
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object edtName: TUniEdit
              Left = 0
              Top = 8
              Width = 346
              Height = 21
              Hint = ''
              Text = ''
              TabOrder = 0
            end
            object edtPort: TUniSpinEdit
              Left = 0
              Top = 32
              Width = 100
              Height = 22
              Hint = ''
              Value = 1
              MaxValue = 200
              TabOrder = 1
            end
            object cmbDataBits: TUniComboBox
              Left = 0
              Top = 56
              Width = 100
              Height = 21
              Hint = ''
              Style = csDropDownList
              Text = ''
              Items.Strings = (
                '8'
                '7'
                '6'
                '5')
              TabOrder = 3
            end
            object cmbBaudRate: TUniComboBox
              Left = 0
              Top = 80
              Width = 100
              Height = 21
              Hint = ''
              Style = csDropDownList
              Text = ''
              Items.Strings = (
                '75'
                '110'
                '134'
                '150'
                '300'
                '600'
                '1200'
                '1800'
                '2400'
                '4800'
                '7200'
                '9600'
                '14400'
                '19200'
                '38400'
                '57600'
                '12800'
                '115200')
              TabOrder = 4
            end
            object cmbStopBits: TUniComboBox
              Left = 0
              Top = 104
              Width = 100
              Height = 21
              Hint = ''
              Style = csDropDownList
              Text = ''
              Items.Strings = (
                '1'
                '2')
              TabOrder = 5
            end
            object cmbParity: TUniComboBox
              Left = 0
              Top = 128
              Width = 100
              Height = 21
              Hint = ''
              Style = csDropDownList
              Text = ''
              Items.Strings = (
                'None'
                'Odd'
                'Even'
                'Mark'
                'Space')
              TabOrder = 9
            end
            object edtStartChar: TUniEdit
              Left = 0
              Top = 152
              Width = 100
              Height = 21
              Hint = ''
              MaxLength = 10
              Text = ''
              TabOrder = 6
            end
            object edtStopChar: TUniEdit
              Left = 0
              Top = 176
              Width = 100
              Height = 21
              Hint = ''
              MaxLength = 10
              Text = ''
              TabOrder = 7
            end
            object chkEnabled: TUniCheckBox
              Left = 6
              Top = 200
              Width = 97
              Height = 17
              Hint = ''
              Caption = 'Enabled'
              TabOrder = 8
            end
          end
        end
      end
      object TabHid: TUniTabSheet
        Hint = ''
        TabVisible = False
        ImageIndex = 1
        Caption = 'TabHid'
        object Panel1: TUniPanel
          Left = 0
          Top = 0
          Width = 469
          Height = 343
          Hint = ''
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object Splitter2: TUniSplitter
            Left = 97
            Top = 1
            Width = 6
            Height = 341
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object Panel3: TUniPanel
            Left = 1
            Top = 1
            Width = 96
            Height = 341
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label2: TUniLabel
              Left = 8
              Top = 12
              Width = 27
              Height = 13
              Hint = ''
              Caption = 'Name'
              TabOrder = 1
            end
            object Label3: TUniLabel
              Left = 8
              Top = 32
              Width = 32
              Height = 13
              Hint = ''
              Caption = 'Device'
              TabOrder = 2
            end
            object Label5: TUniLabel
              Left = 8
              Top = 51
              Width = 3
              Height = 13
              Hint = ''
              Caption = ''
              TabOrder = 3
            end
          end
          object Panel4: TUniPanel
            Left = 103
            Top = 1
            Width = 365
            Height = 341
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object cmbScales: TUniComboBox
              Left = 0
              Top = 32
              Width = 145
              Height = 21
              Hint = ''
              Text = '{ Select a Scale }'
              TabOrder = 3
              OnChange = cmbScalesChange
            end
            object edtNameHID: TUniEdit
              Left = 0
              Top = 8
              Width = 346
              Height = 21
              Hint = ''
              Text = ''
              TabOrder = 1
            end
            object chkEnabledHID: TUniCheckBox
              Left = 3
              Top = 56
              Width = 97
              Height = 17
              Hint = ''
              Caption = 'Enabled'
              TabOrder = 2
            end
          end
        end
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 479
    Height = 25
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      479
      25)
    object sbtnTestSettings: TUniSpeedButton
      Left = 407
      Top = 0
      Width = 72
      Height = 25
      Hint = 'Test Port Settings'
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
      Caption = 'Test'
      Anchors = [akTop, akRight]
      ParentColor = False
      Color = clWindow
      OnClick = DoTest
    end
    object Label16: TUniLabel
      Left = 8
      Top = 6
      Width = 56
      Height = 13
      Hint = ''
      Caption = 'Scale Type:'
      TabOrder = 2
    end
    object cmbScaleType: TUniComboBox
      Left = 71
      Top = 3
      Width = 132
      Height = 21
      Hint = ''
      Style = csDropDownList
      Text = ''
      Items.Strings = (
        'Serial Port'
        'USB')
      TabOrder = 3
      OnChange = cmbScaleTypeChange
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 238
    Top = 24
    object File1: TUniMenuItem
      Caption = '&File'
      object Close1: TUniMenuItem
        Caption = '&Close'
        OnClick = Close1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = '&Options'
      object LoadDefaultScaleSettings1: TUniMenuItem
        Caption = 'Load Settings from Default Scales'
        OnClick = LoadDefaultScaleSettings1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Content1: TUniMenuItem
        Caption = 'Contents'
        ShortCut = 112
        OnClick = Content1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Freight Scale'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195512 $'
    BuildVersion = '176554'
    Left = 358
    Top = 24
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'chkPkHide'
      'cmbBaudRate'
      'cmbDataBits'
      'cmbParity'
      'cmbStopBits'
      'dbeName'
      'dbePort'
      'dbeSerial'
      'dbeStartChar'
      'dbeStopChar'
      'IQDocs1'
      'IQExtDoc1'
      'lblDeviceConfigBaud'
      'lblDeviceConfigDataBits'
      'lblDeviceConfigParity'
      'lblDeviceConfigPort'
      'lblDeviceConfigStartChar'
      'lblDeviceConfigStopBits'
      'lblDeviceConfigStopChar'
      'LoadDefaultScaleSettings1'
      'NavMain'
      'Print1')
    SecurityCode = 'FRMSHIPMANSCALE'
    Left = 294
    Top = 8
  end
  object apdCOMPort: TApdComPort
    Baud = 4800
    PromptForPort = False
    InSize = 8192
    AutoOpen = False
    TraceName = 'APRO.TRC'
    LogName = 'APRO.LOG'
    Left = 322
    Top = 8
  end
  object PMain: TUniPopupMenu
    Left = 266
    Top = 32
    object LoadDefaultScaleSettings2: TUniMenuItem
      Caption = 'Load Settings from Default Scales'
      OnClick = LoadDefaultScaleSettings1Click
    end
  end
end
