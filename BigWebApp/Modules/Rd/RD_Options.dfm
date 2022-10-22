object FrmRD_Options: TFrmRD_Options
  Left = 292
  Top = 149
  ClientHeight = 167
  ClientWidth = 288
  Caption = 'Routing Diagram Options'
  OnShow = UniFormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 126
    Width = 288
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Tag = 1999
      Left = 81
      Top = 1
      Width = 206
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnCancel: TUniButton
        Left = 102
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
      object btnOK: TUniButton
        Left = 0
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 2
      end
    end
  end
  object PnlMain: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 288
    Height = 126
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 1
      Width = 286
      Height = 124
      Hint = ''
      Caption = '  Display Options  '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object chkOnHand: TUniCheckBox
        Left = 16
        Top = 24
        Width = 97
        Height = 17
        Hint = ''
        Caption = 'On Hand'
        TabOrder = 0
      end
      object chkNonComitted: TUniCheckBox
        Left = 16
        Top = 42
        Width = 97
        Height = 17
        Hint = ''
        Caption = 'Non Comitted'
        TabOrder = 1
      end
      object chkStdCost: TUniCheckBox
        Left = 16
        Top = 60
        Width = 97
        Height = 17
        Hint = ''
        Caption = 'Std Cost'
        TabOrder = 2
      end
      object chkExtCost: TUniCheckBox
        Left = 16
        Top = 78
        Width = 97
        Height = 17
        Hint = ''
        Caption = 'Ext Cost'
        TabOrder = 3
      end
    end
  end
end
