object FrmCCOptions: TFrmCCOptions
  Left = 375
  Top = 194
  ClientHeight = 217
  ClientWidth = 329
  Caption = 'Parameters'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMain: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 329
    Height = 176
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 337
    ExplicitHeight = 180
    object PnlPurgeOptions: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 327
      Height = 97
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object gbPurgeOptions: TUniGroupBox
        Left = 1
        Top = 1
        Width = 325
        Height = 95
        Hint = ''
        Caption = ' Purge Options '
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitLeft = 4
        ExplicitTop = 4
        ExplicitWidth = 329
        ExplicitHeight = 89
        object PnlPurgeOptionsControls: TUniPanel
          Tag = 1999
          Left = 2
          Top = 15
          Width = 321
          Height = 78
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter1: TUniSplitter
            Left = 173
            Top = 0
            Width = 6
            Height = 78
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlPurgeOptionsLeft: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 173
            Height = 76
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object lblPurgePromptDays: TUniLabel
              Left = 8
              Top = 12
              Width = 145
              Height = 13
              Hint = ''
              Caption = 'Prompt to purge history every'
              TabOrder = 1
            end
            object lblDaysToKeep: TUniLabel
              Left = 8
              Top = 36
              Width = 100
              Height = 13
              Hint = ''
              Caption = 'Default days to keep'
              TabOrder = 2
            end
          end
          object PnlPurgeOptionsClient: TUniPanel
            Tag = 1999
            Left = 179
            Top = 1
            Width = 142
            Height = 76
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object lblDaysToKeepUOM: TUniLabel
              Left = 56
              Top = 36
              Width = 31
              Height = 13
              Hint = ''
              Caption = '(days)'
              TabOrder = 1
            end
            object lblPurgePromptDaysUOM: TUniLabel
              Left = 56
              Top = 12
              Width = 31
              Height = 13
              Hint = ''
              Caption = '(days)'
              TabOrder = 2
            end
            object edtPurgePromptDays: TUniSpinEdit
              Left = 1
              Top = 8
              Width = 49
              Height = 22
              Hint = ''
              Value = 30
              MaxValue = 365
              MinValue = 1
              TabOrder = 3
            end
            object edtDaysToKeep: TUniSpinEdit
              Left = 1
              Top = 32
              Width = 49
              Height = 22
              Hint = ''
              Value = 14
              MaxValue = 1095
              MinValue = 14
              TabOrder = 4
            end
          end
        end
      end
    end
  end
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 176
    Width = 329
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 119
      Top = 1
      Width = 210
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
        Default = True
      end
      object btnCancel: TUniBitBtn
        Left = 104
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
end
