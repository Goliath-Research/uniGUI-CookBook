object FrmDiscount: TFrmDiscount
  Left = 247
  Top = 266
  ClientHeight = 149
  ClientWidth = 391
  Caption = 'Discount'
  Position = poDefaultPosOnly
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 30
    Top = 7
    Width = 33
    Height = 13
    Hint = ''
    Caption = 'Terms:'
    TabOrder = 5
  end
  object Label2: TUniLabel
    Left = 30
    Top = 35
    Width = 67
    Height = 13
    Hint = ''
    Caption = 'Discount (%):'
    TabOrder = 6
  end
  object Label3: TUniLabel
    Left = 30
    Top = 65
    Width = 85
    Height = 13
    Hint = ''
    Caption = 'Discount Amount:'
    TabOrder = 7
  end
  object SBAcct: TUniSpeedButton
    Left = 5
    Top = 90
    Width = 20
    Height = 20
    Hint = 'Find Account number'
    ShowHint = True
    ParentShowHint = False
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333333333333333333333333333333333300000003333333330FFFFF
      03333333330FFFFF03333333330F00FF033333333300B0FF03333333330B0FFF
      0333333330B0FFFF033333330B0FF00F03333330B00FFFFF0333330B03000000
      0333339033333333333333333333333333333333333333333333}
    Caption = ''
    ParentColor = False
    Color = clWindow
    OnClick = SBAcctClick
  end
  object Label10: TUniLabel
    Left = 30
    Top = 94
    Width = 69
    Height = 13
    Hint = ''
    Caption = 'Disc. Account:'
    TabOrder = 9
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 122
    Width = 391
    Height = 27
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 194
      Top = 1
      Width = 197
      Height = 25
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 37
        Top = 2
        Width = 75
        Height = 23
        Hint = ''
        Caption = '&Ok'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 118
        Top = 2
        Width = 75
        Height = 23
        Hint = ''
        Caption = '&Cancel'
        TabOrder = 2
        OnClick = BtnCancelClick
      end
    end
  end
  object DBEditTerms: TUniDBEdit
    Left = 114
    Top = 4
    Width = 121
    Height = 19
    Hint = ''
    DataField = 'Terms'
    TabOrder = 1
    Color = clBtnFace
    ReadOnly = True
  end
  object DBEditDiscount: TUniDBEdit
    Left = 114
    Top = 32
    Width = 121
    Height = 19
    Hint = ''
    DataField = 'Terms_Discount'
    TabOrder = 2
    Color = clBtnFace
    ReadOnly = True
  end
  object DBEditDiscAmt: TUniDBEdit
    Left = 114
    Top = 61
    Width = 121
    Height = 21
    Hint = ''
    DataField = 'DISCOUNT_APPLIED'
    TabOrder = 3
  end
  object DBEditARAcct: TUniDBEdit
    Left = 117
    Top = 91
    Width = 270
    Height = 19
    Hint = ''
    DataField = 'GlAcctDisc'
    TabOrder = 4
    Color = clBtnFace
    ReadOnly = True
  end
end
