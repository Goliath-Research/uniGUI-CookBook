inherited FrmMsg2: TFrmMsg2
  ClientHeight = 452
  ClientWidth = 634
  Caption = 'FrmMsg2'
  ExplicitWidth = 640
  ExplicitHeight = 481
  PixelsPerInch = 96
  TextHeight = 19
  inherited Panel1: TUniPanel
    Top = 35
    Width = 634
    Height = 347
    ExplicitTop = 35
    ExplicitWidth = 634
    ExplicitHeight = 347
    inherited lblMessage: TUniLabel
      Width = 138
      Height = 39
      ParentFont = False
      Font.Height = -32
      ExplicitWidth = 138
      ExplicitHeight = 39
    end
  end
  inherited Panel3: TUniPanel
    Top = 382
    Width = 634
    ExplicitTop = 382
    ExplicitWidth = 634
    inherited btnYes: TUniBitBtn
      Left = 321
      ExplicitLeft = 321
    end
  end
  object Panel2: TUniPanel [2]
    Left = 0
    Top = 0
    Width = 634
    Height = 35
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object Memo1: TUniMemo
      Left = 1
      Top = 1
      Width = 632
      Height = 33
      Hint = ''
      Lines.Strings = (
        '')
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
end
