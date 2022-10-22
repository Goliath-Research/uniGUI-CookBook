object FrmArchiveTranslog: TFrmArchiveTranslog
  Left = 37
  Top = 179
  ClientHeight = 155
  ClientWidth = 279
  Caption = 'Archive Translog'
  OnShow = UniFormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 279
    Height = 155
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Label1: TUniLabel
      Left = 8
      Top = 18
      Width = 197
      Height = 13
      Hint = ''
      Caption = 'Do you wish to archive Translog records?'
      TabOrder = 4
    end
    object lblPOdate1: TUniLabel
      Left = 8
      Top = 67
      Width = 131
      Height = 13
      Hint = ''
      Caption = 'Translog date no later than'
      TabOrder = 5
    end
    object Label2: TUniLabel
      Left = 10
      Top = 41
      Width = 108
      Height = 13
      Hint = ''
      Caption = 'Earliest Translog date:'
      TabOrder = 6
    end
    object Panel1: TUniPanel
      Left = 1
      Top = 113
      Width = 277
      Height = 41
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Panel2: TUniPanel
        Left = 67
        Top = 1
        Width = 209
        Height = 39
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object btnOk: TUniButton
          Left = 0
          Top = 8
          Width = 97
          Height = 25
          Hint = ''
          Caption = '&OK'
          TabOrder = 1
          OnClick = btnOkClick
        end
        object btnCancel: TUniButton
          Left = 104
          Top = 8
          Width = 97
          Height = 25
          Hint = ''
          Caption = '&Cancel'
          TabOrder = 2
          OnClick = btnCancelClick
        end
      end
    end
    object wwDate: TUniDateTimePicker
      Left = 143
      Top = 64
      Width = 122
      Height = 21
      Hint = ''
      DateTime = 42686.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 1
    end
    object EdTransDate: TUniEdit
      Left = 143
      Top = 40
      Width = 122
      Height = 19
      Hint = ''
      Text = ''
      TabOrder = 2
      Color = clBtnFace
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmArchiveTranslog')
    SecurityCode = 'FRMARCHIVETRANSLOG'
    Left = 216
    Top = 8
  end
end
