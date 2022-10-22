object FrmSecurityGroupClone: TFrmSecurityGroupClone
  Left = 0
  Top = 0
  ClientHeight = 140
  ClientWidth = 488
  Caption = 'Clone Security Group'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 145
    Top = 0
    Width = 4
    Height = 98
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 98
    Width = 488
    Height = 42
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel4: TUniPanel
      Left = 260
      Top = 1
      Width = 228
      Height = 40
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 4
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 116
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 145
    Height = 98
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 1
    Caption = ''
    object Label1: TUniLabel
      Left = 12
      Top = 12
      Width = 83
      Height = 13
      Hint = ''
      Caption = 'New Group Name'
      TabOrder = 1
    end
    object Label2: TUniLabel
      Left = 12
      Top = 36
      Width = 109
      Height = 13
      Hint = ''
      Caption = 'New Group Description'
      TabOrder = 2
    end
  end
  object Panel3: TUniPanel
    Left = 149
    Top = 0
    Width = 339
    Height = 98
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    DesignSize = (
      339
      98)
    object edName: TUniEdit
      Left = 1
      Top = 9
      Width = 324
      Height = 21
      Hint = ''
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object edDescrip: TUniEdit
      Left = 1
      Top = 33
      Width = 324
      Height = 21
      Hint = ''
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
  end
end
