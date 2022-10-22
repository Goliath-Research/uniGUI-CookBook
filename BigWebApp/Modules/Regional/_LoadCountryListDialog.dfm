object LoadCountryListDialog: TLoadCountryListDialog
  Left = 0
  Top = 0
  ClientHeight = 196
  ClientWidth = 445
  Caption = 'Load Country List'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 155
    Width = 445
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 235
      Top = 1
      Width = 210
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 1
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
        Left = 104
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
    Width = 445
    Height = 155
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object lblPrompt: TUniLabel
      AlignWithMargins = True
      Left = 8
      Top = 8
      Width = 704
      Height = 13
      Hint = ''
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Caption = 
        'Load the default country list?  This action will remove and repl' +
        'ace all country and subdivision records with the ISO list of cou' +
        'ntries and subdivisions.'
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object DefaultSpellingsOnlyCheckBox: TUniCheckBox
      Left = 8
      Top = 96
      Width = 129
      Height = 17
      Hint = ''
      Caption = 'Default spellings only'
      TabOrder = 0
    end
  end
end
