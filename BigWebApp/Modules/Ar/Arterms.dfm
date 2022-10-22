object FrmArTerms: TFrmArTerms
  Left = 297
  Top = 168
  ClientHeight = 215
  ClientWidth = 322
  Caption = 'Select terms'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 11
    Top = 30
    Width = 549
    Height = 13
    Hint = ''
    Caption = 
      'Selected terms differ from the terms assigned to the header reco' +
      'rd. Please choose what terms you wish to assign.'
    TabOrder = 5
  end
  object Label2: TUniLabel
    Left = 11
    Top = 8
    Width = 124
    Height = 13
    Hint = ''
    Caption = 'Currently assigned terms:'
    TabOrder = 6
  end
  object lbTerms: TUniListBox
    Left = 143
    Top = 92
    Width = 172
    Height = 90
    Hint = ''
    TabOrder = 0
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 185
    Width = 322
    Height = 30
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel2: TUniPanel
      Left = 112
      Top = 1
      Width = 210
      Height = 28
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 5
        Top = 2
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 107
        Top = 2
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        TabOrder = 2
        OnClick = BtnCancelClick
      end
    end
  end
  object RBDoNotChangeTerms: TUniRadioButton
    Left = 11
    Top = 74
    Width = 126
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Do not change terms'
    TabOrder = 2
    OnClick = RBDoNotChangeTermsClick
  end
  object RBSelectTerms: TUniRadioButton
    Left = 11
    Top = 97
    Width = 126
    Height = 17
    Hint = ''
    Caption = 'Select terms from list'
    TabOrder = 3
    OnClick = RBSelectTermsClick
  end
  object edTerms: TUniEdit
    Left = 143
    Top = 5
    Width = 172
    Height = 19
    Hint = ''
    Text = ''
    TabOrder = 4
    Color = clBtnFace
    ReadOnly = True
  end
  object SecurityRegister1: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'RBDoNotChangeTerms'
      'RBSelectTerms')
    SecurityCode = 'FRMARTERMS'
    Left = 8
    Top = 184
  end
end
