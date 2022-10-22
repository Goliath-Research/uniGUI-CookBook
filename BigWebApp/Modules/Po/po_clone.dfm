object FrmPO_Clone: TFrmPO_Clone
  Left = 197
  Top = 270
  ClientHeight = 111
  ClientWidth = 390
  Caption = 'Clone PO'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  ActiveControl = edPoNo
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 70
    Width = 390
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = 'Panel1'
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 388
      Height = 2
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object Panel2: TUniPanel
      Left = 168
      Top = 2
      Width = 222
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 3
        Top = 9
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 115
        Top = 9
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 390
    Height = 70
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 108
      Top = 0
      Width = 6
      Height = 70
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 108
      Height = 68
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 11
        Top = 22
        Width = 77
        Height = 13
        Hint = ''
        Caption = 'Enter new PO #'
        TabOrder = 1
      end
    end
    object Panel5: TUniPanel
      Left = 114
      Top = 1
      Width = 276
      Height = 68
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        276
        68)
      object edPoNo: TUniEdit
        Left = 1
        Top = 18
        Width = 256
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
    end
  end
end
