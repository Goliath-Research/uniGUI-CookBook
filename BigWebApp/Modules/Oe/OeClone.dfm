object FrmCloneSalesOrder: TFrmCloneSalesOrder
  Left = 102
  Top = 304
  ClientHeight = 237
  ClientWidth = 281
  Caption = 'Clone Sales Order'
  OnShow = UniFormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  DesignSize = (
    281
    237)
  PixelsPerInch = 96
  TextHeight = 13
  object Label11: TUniLabel
    Left = 8
    Top = 24
    Width = 39
    Height = 13
    Hint = 'Order Number'
    ShowHint = True
    ParentShowHint = False
    Caption = 'Order #'
    TabOrder = 7
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 196
    Width = 281
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 60
      Top = 1
      Width = 220
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnClone: TUniButton
        Left = 56
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Clone'
        TabOrder = 1
        OnClick = btnCloneClick
      end
      object btnCancel: TUniButton
        Left = 136
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 2
        OnClick = btnCancelClick
      end
    end
  end
  object edOrderno: TUniEdit
    Left = 90
    Top = 21
    Width = 185
    Height = 21
    Hint = ''
    Text = ''
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
  end
  object cbCloneReleases: TUniCheckBox
    Tag = 1999
    Left = 6
    Top = 56
    Width = 178
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Clone Releases'
    TabOrder = 2
  end
  object cbCloneInternal: TUniCheckBox
    Tag = 1999
    Left = 6
    Top = 80
    Width = 178
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Clone Internal Documents'
    TabOrder = 3
  end
  object cbCloneExternal: TUniCheckBox
    Tag = 1999
    Left = 6
    Top = 104
    Width = 178
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Clone External Documents'
    TabOrder = 4
  end
  object cbCloneEmail: TUniCheckBox
    Tag = 1999
    Left = 6
    Top = 128
    Width = 178
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Clone Email Correspondence'
    TabOrder = 5
  end
  object cbUseCurrentTerms: TUniCheckBox
    Tag = 1999
    Left = 6
    Top = 151
    Width = 178
    Height = 17
    Hint = ''
    Caption = 'Use Current Terms'
    TabOrder = 6
  end
end
