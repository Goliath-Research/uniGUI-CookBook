object FrmFaPostDispo: TFrmFaPostDispo
  Left = 105
  Top = 179
  Caption = 'Post Dispo'
  ClientHeight = 112
  ClientWidth = 264
  Color = clBtnFace
  Constraints.MaxHeight = 150
  Constraints.MaxWidth = 280
  Constraints.MinHeight = 150
  Constraints.MinWidth = 280
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    264
    112)
  object Label2: TUniLabel
    Left = 5
    Top = 16
    Width = 57
    Height = 13
    Caption = 'Batch Date:'
  end
  object Label3: TUniLabel
    Left = 5
    Top = 45
    Width = 33
    Height = 13
    Caption = 'Period:'
  end
  object SBPeriod: TUniSpeedButton
    Left = 237
    Top = 40
    Width = 22
    Height = 22
    Hint = 'Find period'
    Anchors = [akTop, akRight]
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333333333333333333333333333333333300000003333333330FFFFF
      03333333330FFFFF03333333330F00FF033333333300B0FF03333333330B0FFF
      0333333330B0FFFF033333330B0FF00F03333330B00FFFFF0333330B03000000
      0333339033333333333333333333333333333333333333333333}
    ParentShowHint = False
    ShowHint = True
    OnClick = SBPeriodClick
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 71
    Width = 264
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Panel2: TUniPanel
      Left = 79
      Top = 0
      Width = 185
      Height = 41
      Align = alRight
      TabOrder = 0
      object BtnOk: TUniButton
        Left = 12
        Top = 10
        Width = 75
        Height = 25
        Caption = 'OK'
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 100
        Top = 10
        Width = 75
        Height = 25
        Caption = 'Cancel'
        ModalResult = 2
      end
    end
  end
  object DateTimePicker1: TUniDateTimePicker
    Left = 83
    Top = 12
    Width = 145
    Height = 21
    TabOrder = 1
  end
  object EdPeriod: TUniEdit
    Left = 83
    Top = 41
    Width = 145
    Height = 19
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
end
