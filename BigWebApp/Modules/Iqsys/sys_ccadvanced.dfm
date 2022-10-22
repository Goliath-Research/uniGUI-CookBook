object FrmSysCCAdvanced: TFrmSysCCAdvanced
  Left = 368
  Top = 231
  ClientHeight = 233
  ClientWidth = 344
  Caption = 'Advanced Options'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 344
    Height = 192
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object pcMain: TUniPageControl
      Left = 1
      Top = 1
      Width = 342
      Height = 190
      Hint = ''
      ActivePage = TabGeneral
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabGeneral: TUniTabSheet
        Hint = ''
        ImageIndex = 2
        Caption = 'General'
        object PnlClient01: TUniPanel
          Left = 0
          Top = 0
          Width = 334
          Height = 162
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter2: TUniSplitter
            Left = 145
            Top = 0
            Width = 6
            Height = 162
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlLeft01: TUniPanel
            Left = 1
            Top = 1
            Width = 145
            Height = 160
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label1: TUniLabel
              Left = 8
              Top = 11
              Width = 93
              Height = 13
              Hint = ''
              Caption = 'Time Out Threshold'
              TabOrder = 1
            end
          end
          object PnlClient02: TUniPanel
            Left = 151
            Top = 1
            Width = 183
            Height = 160
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object edtTimeOut: TUniEdit
              Left = 1
              Top = 8
              Width = 81
              Height = 21
              Hint = ''
              Text = '30'
              TabOrder = 0
            end
            object udTimeOut: TUpDown
              Left = 82
              Top = 8
              Width = 16
              Height = 21
              Associate = edtTimeOut
              Min = 30
              Max = 10000
              Increment = 5
              Position = 30
              TabOrder = 2
              Thousands = False
            end
          end
        end
      end
      object TabGateway: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'Gateway URL'
        object PnlURL: TUniPanel
          Left = 0
          Top = 0
          Width = 334
          Height = 162
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter1: TUniSplitter
            Left = 105
            Top = 0
            Width = 6
            Height = 162
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlURLLeft: TUniPanel
            Left = 1
            Top = 1
            Width = 105
            Height = 160
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object lblProductionURL: TUniLabel
              Left = 8
              Top = 12
              Width = 73
              Height = 13
              Hint = ''
              Caption = 'Production URL'
              TabOrder = 1
            end
            object lblProductionPort: TUniLabel
              Left = 8
              Top = 36
              Width = 74
              Height = 13
              Hint = ''
              Caption = 'Production Port'
              TabOrder = 2
            end
            object lblTestURL: TUniLabel
              Left = 8
              Top = 60
              Width = 43
              Height = 13
              Hint = ''
              Caption = 'Test URL'
              TabOrder = 3
            end
            object lblTestPort: TUniLabel
              Left = 8
              Top = 84
              Width = 44
              Height = 13
              Hint = ''
              Caption = 'Test Port'
              TabOrder = 4
            end
          end
          object PnlURLClient: TUniPanel
            Left = 111
            Top = 1
            Width = 223
            Height = 160
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            DesignSize = (
              223
              160)
            object edtProductionURL: TUniEdit
              Left = 1
              Top = 8
              Width = 220
              Height = 21
              Hint = ''
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
            object edtProductionPort: TUniEdit
              Left = 1
              Top = 32
              Width = 121
              Height = 21
              Hint = ''
              Text = ''
              TabOrder = 1
            end
            object edtTestURL: TUniEdit
              Left = 1
              Top = 56
              Width = 220
              Height = 21
              Hint = ''
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
            object edtTestPort: TUniEdit
              Left = 1
              Top = 80
              Width = 121
              Height = 21
              Hint = ''
              Text = ''
              TabOrder = 3
            end
          end
        end
      end
      object TabFirewall: TUniTabSheet
        Hint = ''
        Caption = 'Firewall'
        object PnlFirewall: TUniPanel
          Left = 0
          Top = 0
          Width = 334
          Height = 162
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter12: TUniSplitter
            Left = 112
            Top = 0
            Width = 6
            Height = 162
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlFirewallLeft: TUniPanel
            Left = 1
            Top = 1
            Width = 112
            Height = 160
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object lblFirewallHost: TUniLabel
              Left = 8
              Top = 59
              Width = 22
              Height = 13
              Hint = 'Name or IP address of firewall (optional)'
              ShowHint = True
              ParentShowHint = False
              Caption = 'Host'
              TabOrder = 1
            end
            object lblFirewallPassword: TUniLabel
              Left = 8
              Top = 131
              Width = 46
              Height = 13
              Hint = 
                'If authentication is required, password to be used when connecti' +
                'ng through the firewall.'
              ShowHint = True
              ParentShowHint = False
              Caption = 'Password'
              TabOrder = 2
            end
            object lblFirewallPort: TUniLabel
              Left = 8
              Top = 83
              Width = 20
              Height = 13
              Hint = 'The TCP port used for the firewall host.'
              ShowHint = True
              ParentShowHint = False
              Caption = 'Port'
              TabOrder = 3
            end
            object lblFirewallType: TUniLabel
              Left = 8
              Top = 35
              Width = 24
              Height = 13
              Hint = 'The type of firewall'
              ShowHint = True
              ParentShowHint = False
              Caption = 'Type'
              TabOrder = 4
            end
            object lblFirewallUserName: TUniLabel
              Left = 8
              Top = 107
              Width = 52
              Height = 13
              Hint = 'User name to be used when connecting through the firewall.'
              ShowHint = True
              ParentShowHint = False
              Caption = 'User Name'
              TabOrder = 5
            end
          end
          object PnlFirewallClient: TUniPanel
            Left = 118
            Top = 1
            Width = 216
            Height = 160
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            DesignSize = (
              216
              160)
            object dbeFirewallHost: TUniEdit
              Left = 1
              Top = 56
              Width = 210
              Height = 21
              Hint = ''
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              OnChange = dbeFirewallHostChange
            end
            object dbeFirewallPassword: TUniEdit
              Left = 1
              Top = 128
              Width = 210
              Height = 21
              Hint = ''
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 5
            end
            object dbeFirewallUser: TUniEdit
              Left = 1
              Top = 104
              Width = 210
              Height = 21
              Hint = ''
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 4
            end
            object edtFirewallPort: TUniEdit
              Left = 1
              Top = 80
              Width = 121
              Height = 21
              Hint = ''
              Text = 'edtFirewallPort'
              TabOrder = 3
            end
            object cmbFirewallType: TUniComboBox
              Left = 1
              Top = 32
              Width = 210
              Height = 21
              Hint = ''
              Text = 'cmbFirewallType'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 6
              OnChange = cmbFirewallTypeChange
            end
            object chkUseFirewallSettings: TUniCheckBox
              Left = 1
              Top = 8
              Width = 137
              Height = 17
              Hint = ''
              Caption = 'Use Firewall Settings'
              TabOrder = 0
              OnClick = chkUseFirewallSettingsClick
            end
          end
        end
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 192
    Width = 344
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Tag = 1999
      Left = 122
      Top = 1
      Width = 222
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
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
end
