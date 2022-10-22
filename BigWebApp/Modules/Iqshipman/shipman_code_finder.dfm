object FrmShipManCodeFinder: TFrmShipManCodeFinder
  Left = 215
  Top = 231
  ClientHeight = 345
  ClientWidth = 688
  Caption = 'Country Code Finder'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlClient01: TUniPanel
    Left = 0
    Top = 45
    Width = 688
    Height = 259
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 218
      Top = 1
      Width = 6
      Height = 257
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Splitter2: TUniSplitter
      Left = 441
      Top = 1
      Width = 6
      Height = 257
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Left = 224
      Top = 1
      Width = 217
      Height = 257
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Panel3: TUniPanel
        Left = 1
        Top = 26
        Width = 215
        Height = 205
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object memCountryCode: TUniMemo
          Left = 1
          Top = 1
          Width = 213
          Height = 203
          Hint = ''
          ScrollBars = ssVertical
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          WordWrap = False
          OnChange = memCountryCodeChange
        end
      end
      object Panel4: TUniPanel
        Left = 1
        Top = 1
        Width = 215
        Height = 25
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object Label1: TUniLabel
          Left = 8
          Top = 8
          Width = 72
          Height = 13
          Hint = ''
          Caption = 'Country Codes'
          TabOrder = 1
        end
      end
      object Panel11: TUniPanel
        Left = 1
        Top = 231
        Width = 215
        Height = 25
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 2
        Caption = ''
        object lblCodeCount: TUniLabel
          Left = 1
          Top = 1
          Width = 67
          Height = 13
          Hint = ''
          Caption = 'Item Count: 0'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
        end
      end
    end
    object PnlClient02: TUniPanel
      Left = 447
      Top = 1
      Width = 240
      Height = 257
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Panel1: TUniPanel
        Left = 1
        Top = 1
        Width = 238
        Height = 25
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object Label2: TUniLabel
          Left = 8
          Top = 8
          Width = 83
          Height = 13
          Hint = ''
          Caption = 'Codes Not Found'
          TabOrder = 1
        end
      end
      object Panel2: TUniPanel
        Left = 1
        Top = 26
        Width = 238
        Height = 205
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object memNotFound: TUniMemo
          Left = 1
          Top = 1
          Width = 236
          Height = 203
          Hint = ''
          ScrollBars = ssVertical
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          WordWrap = False
          OnChange = memNotFoundChange
        end
      end
      object Panel12: TUniPanel
        Left = 1
        Top = 231
        Width = 238
        Height = 25
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 2
        Caption = ''
        object lblNotFoundCount: TUniLabel
          Left = 1
          Top = 1
          Width = 67
          Height = 13
          Hint = ''
          Caption = 'Item Count: 0'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
        end
      end
    end
    object Panel6: TUniPanel
      Left = 1
      Top = 1
      Width = 217
      Height = 257
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 2
      Caption = ''
      object Panel7: TUniPanel
        Left = 1
        Top = 26
        Width = 215
        Height = 205
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object memCountryName: TUniMemo
          Left = 1
          Top = 1
          Width = 213
          Height = 203
          Hint = ''
          ScrollBars = ssVertical
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          WordWrap = False
          OnChange = memCountryNameChange
        end
      end
      object Panel8: TUniPanel
        Left = 1
        Top = 1
        Width = 215
        Height = 25
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object Label3: TUniLabel
          Left = 8
          Top = 8
          Width = 157
          Height = 13
          Hint = ''
          Caption = 'Country List (Full Country Name)'
          TabOrder = 1
        end
      end
      object Panel10: TUniPanel
        Left = 1
        Top = 231
        Width = 215
        Height = 25
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 2
        Caption = ''
        object lblNameCount: TUniLabel
          Left = 1
          Top = 1
          Width = 67
          Height = 13
          Hint = ''
          Caption = 'Item Count: 0'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
        end
      end
    end
  end
  object Panel5: TUniPanel
    Left = 0
    Top = 304
    Width = 688
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object BitBtn1: TUniBitBtn
      Left = 8
      Top = 8
      Width = 121
      Height = 25
      Hint = ''
      Caption = 'Get List'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object chkFull: TUniCheckBox
      Left = 136
      Top = 8
      Width = 89
      Height = 17
      Hint = ''
      Caption = 'For code'
      TabOrder = 1
    end
  end
  object Panel9: TUniPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 45
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object Label4: TUniLabel
      Left = 1
      Top = 1
      Width = 1208
      Height = 13
      Hint = ''
      Caption = 
        'This utility is designed for internal programming use to obtain ' +
        'a list of country codes from a list of full country names.  FedE' +
        'x, for example, publishes a list of countries that receive a par' +
        'ticular service, but they do not provide the country codes for t' +
        'hem.'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 396
    Top = 174
    object File1: TUniMenuItem
      Caption = '&File'
      object Debug1: TUniMenuItem
        Caption = 'Debug'
        OnClick = Debug1Click
      end
      object Close1: TUniMenuItem
        Caption = '&Close'
        OnClick = Close1Click
      end
    end
  end
end
