inherited FrmShowStrTimed: TFrmShowStrTimed
  Left = 144
  ClientHeight = 138
  ClientWidth = 378
  ExplicitWidth = 394
  ExplicitHeight = 177
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlDisplay: TUniPanel
    Width = 378
    Height = 106
    ExplicitWidth = 378
    ExplicitHeight = 106
    inherited RichEdit1: TUniHTMLMemo
      Width = 376
      Height = 104
      ExplicitWidth = 376
      ExplicitHeight = 104
    end
  end
  inherited PnlButtons: TUniPanel
    Top = 106
    Width = 378
    ExplicitTop = 106
    ExplicitWidth = 378
    inherited PnlButtonsInner: TUniPanel
      Left = 272
      ExplicitLeft = 272
    end
  end
  object Timer1: TUniTimer
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = Timer1Timer
    Left = 87
    Top = 18
  end
end
