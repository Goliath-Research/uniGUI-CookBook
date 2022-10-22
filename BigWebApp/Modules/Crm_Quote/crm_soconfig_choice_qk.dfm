object FrmSalesConfigChoiceQk: TFrmSalesConfigChoiceQk
  Left = 304
  Top = 214
  ClientHeight = 149
  ClientWidth = 367
  Caption = 'Add Sales Choice'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 107
    Width = 367
    Height = 42
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 365
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object Panel2: TUniPanel
      Left = 192
      Top = 3
      Width = 175
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 2
        Top = 7
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 91
        Top = 7
        Width = 75
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
    Width = 367
    Height = 107
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 80
      Top = 0
      Width = 6
      Height = 107
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 80
      Height = 105
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 11
        Top = 16
        Width = 25
        Height = 13
        Hint = ''
        Caption = 'Code'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 11
        Top = 40
        Width = 53
        Height = 13
        Hint = ''
        Caption = 'Description'
        TabOrder = 2
      end
      object Label3: TUniLabel
        Left = 11
        Top = 64
        Width = 23
        Height = 13
        Hint = ''
        Caption = 'Price'
        TabOrder = 3
      end
    end
    object Panel5: TUniPanel
      Left = 86
      Top = 1
      Width = 281
      Height = 105
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        281
        105)
      object edCode: TUniEdit
        Left = 1
        Top = 12
        Width = 269
        Height = 21
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object edDescrip: TUniEdit
        Left = 1
        Top = 36
        Width = 269
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object edPrice: TUniEdit
        Left = 1
        Top = 60
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 2
      end
    end
  end
end
