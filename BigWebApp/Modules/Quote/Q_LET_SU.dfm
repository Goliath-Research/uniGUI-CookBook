object FrmQLetterSetup: TFrmQLetterSetup
  Left = 263
  Top = 277
  ClientHeight = 133
  ClientWidth = 459
  Caption = 'New Quote Letter Settings'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 92
    Width = 459
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      459
      41)
    object btnOK: TUniButton
      Left = 250
      Top = 10
      Width = 97
      Height = 25
      Hint = ''
      Caption = 'OK'
      ModalResult = 1
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
    object btnCancel: TUniButton
      Left = 356
      Top = 10
      Width = 97
      Height = 25
      Hint = ''
      Caption = 'Cancel'
      ModalResult = 2
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 459
    Height = 92
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 142
      Top = 0
      Width = 6
      Height = 92
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft: TUniPanel
      Left = 1
      Top = 1
      Width = 142
      Height = 90
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 5
        Top = 12
        Width = 70
        Height = 13
        Hint = ''
        Caption = 'Crystal Report'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 5
        Top = 36
        Width = 90
        Height = 13
        Hint = ''
        Caption = 'MS Word Template'
        TabOrder = 2
      end
      object Label3: TUniLabel
        Left = 5
        Top = 61
        Width = 106
        Height = 13
        Hint = ''
        Caption = 'Quote Letter File Path'
        TabOrder = 3
      end
    end
    object Panel4: TUniPanel
      Left = 148
      Top = 1
      Width = 311
      Height = 90
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        311
        90)
      object edCRW: TUniEdit
        Left = 1
        Top = 8
        Width = 310
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object edMSWord: TUniEdit
        Left = 1
        Top = 32
        Width = 310
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object EdQLetterPath: TUniEdit
        Left = 1
        Top = 56
        Width = 310
        Height = 21
        Hint = 'A UNC path is recommended'
        ShowHint = True
        ParentShowHint = False
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = '*.rpt|*.rpt|*.*|*.*'
    Title = 'Select Crystal Report '
    Left = 248
    Top = 24
  end
  object OpenDialog2: TOpenDialog
    Filter = '*.dot|*.dot|*.*|*.*'
    Title = 'Select MS Word Template'
    Left = 280
    Top = 24
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMQLETTERSETUP')
    SecurityItems.Strings = (
      'btnOK'
      'edMSWord'
      'edCRW'
      'EdQLetterPath')
    SecurityCode = 'FRMQLETTERSETUP'
    Left = 16
    Top = 81
  end
end
