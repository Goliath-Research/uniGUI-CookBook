object FrmSPCSelectRunRules: TFrmSPCSelectRunRules
  Left = 380
  Top = 184
  ClientHeight = 352
  ClientWidth = 544
  Caption = 'Select Run Rules'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 311
    Width = 544
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 333
      Top = 1
      Width = 210
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 2
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 1
        Default = True
      end
      object btnCancel: TUniButton
        Left = 103
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object PnlMain: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 544
    Height = 311
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlPrompt: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 542
      Height = 46
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object lblPrompt: TUniLabel
        Left = 1
        Top = 1
        Width = 209
        Height = 13
        Hint = ''
        Caption = 'Please select run rules to apply to this item.'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
      end
    end
    object PnlList: TUniPanel
      Tag = 1999
      Left = 1
      Top = 47
      Width = 542
      Height = 263
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object gbRunRules: TUniGroupBox
        Left = 1
        Top = 1
        Width = 540
        Height = 261
        Hint = ''
        Caption = ' Run Rules '
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        DesignSize = (
          540
          261)
        object lblRule1: TUniLabel
          Left = 48
          Top = 18
          Width = 490
          Height = 32
          Hint = ''
          AutoSize = False
          Caption = 'Any one point beyond control limits.'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 8
        end
        object lblRule2: TUniLabel
          Left = 48
          Top = 50
          Width = 490
          Height = 32
          Hint = ''
          AutoSize = False
          Caption = 
            'Any two of three sequential points within three standard deviati' +
            'ons on the same side.'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 9
        end
        object lblRule3: TUniLabel
          Left = 48
          Top = 82
          Width = 490
          Height = 32
          Hint = ''
          AutoSize = False
          Caption = 
            'Any four of five sequential points beyond two standard deviation' +
            's on the same side.'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 10
        end
        object lblRule4: TUniLabel
          Left = 48
          Top = 114
          Width = 490
          Height = 32
          Hint = ''
          AutoSize = False
          Caption = 'Eight sequential points on one side of the average.'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 11
        end
        object lblRule5: TUniLabel
          Left = 48
          Top = 146
          Width = 490
          Height = 32
          Hint = ''
          AutoSize = False
          Caption = 'Six sequential points in increasing or decreasing order.'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 12
        end
        object lblRule6: TUniLabel
          Left = 48
          Top = 178
          Width = 490
          Height = 32
          Hint = ''
          AutoSize = False
          Caption = 'Fourteen sequential points are alternating up and down.'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 13
        end
        object lblRule7: TUniLabel
          Left = 48
          Top = 210
          Width = 490
          Height = 32
          Hint = ''
          AutoSize = False
          Caption = 
            'Fifteen sequential points are all within +/- one standard deviat' +
            'ion.'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 14
        end
        object chkRule1: TUniCheckBox
          Left = 16
          Top = 16
          Width = 15
          Height = 17
          Hint = ''
          Caption = ''
          TabOrder = 0
        end
        object chkRule2: TUniCheckBox
          Left = 16
          Top = 48
          Width = 15
          Height = 17
          Hint = ''
          Caption = ''
          TabOrder = 1
        end
        object chkRule3: TUniCheckBox
          Left = 16
          Top = 80
          Width = 15
          Height = 17
          Hint = ''
          Caption = ''
          TabOrder = 2
        end
        object chkRule4: TUniCheckBox
          Left = 16
          Top = 112
          Width = 15
          Height = 17
          Hint = ''
          Caption = ''
          TabOrder = 3
        end
        object chkRule5: TUniCheckBox
          Left = 16
          Top = 144
          Width = 15
          Height = 17
          Hint = ''
          Caption = ''
          TabOrder = 4
        end
        object chkRule6: TUniCheckBox
          Left = 16
          Top = 176
          Width = 15
          Height = 17
          Hint = ''
          Caption = ''
          TabOrder = 5
        end
        object chkRule7: TUniCheckBox
          Left = 16
          Top = 208
          Width = 15
          Height = 17
          Hint = ''
          Caption = ''
          TabOrder = 6
        end
      end
    end
  end
  object PList: TUniPopupMenu
    Left = 376
    Top = 182
    object SelectAll1: TUniMenuItem
      Caption = 'Select All'
      OnClick = SelectAll1Click
    end
    object UnselectAll1: TUniMenuItem
      Caption = 'Unselect All'
      OnClick = UnselectAll1Click
    end
  end
end
