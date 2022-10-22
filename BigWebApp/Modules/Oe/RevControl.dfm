object FrmRevControl: TFrmRevControl
  Left = 0
  Top = 0
  ClientHeight = 243
  ClientWidth = 527
  Caption = 'Confirm'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  DesignSize = (
    527
    243)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 8
    Top = 27
    Width = 153
    Height = 13
    Hint = ''
    Caption = 'Reason for the revision change '
    TabOrder = 3
  end
  object Label2: TUniLabel
    Left = 8
    Top = 62
    Width = 23
    Height = 13
    Hint = ''
    Caption = 'Note'
    TabOrder = 4
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 205
    Width = 527
    Height = 38
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 525
      Height = 5
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object Panel3: TUniPanel
      Left = 314
      Top = 5
      Width = 213
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      DesignSize = (
        213
        33)
      object BtnYes: TUniButton
        Tag = 1
        Left = 7
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Ok'
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
        OnClick = BtnYesClick
      end
      object BtnNo: TUniButton
        Left = 110
        Top = 1
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 2
        OnClick = BtnNoClick
      end
    end
  end
  object dbeComment1: TIQWebUDComboBox
    Left = 182
    Top = 24
    Width = 340
    Height = 21
    Hint = 'Right click to edit the list'
    HelpContext = -31
    ShowHint = True
    ParentShowHint = False
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    KeyTableName = 'ORD_REV_HISTORY'
    KeyFieldName = 'COMMENT1'
  end
  object Memo1: TUniMemo
    Left = 179
    Top = 59
    Width = 340
    Height = 140
    Hint = ''
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
  end
end
