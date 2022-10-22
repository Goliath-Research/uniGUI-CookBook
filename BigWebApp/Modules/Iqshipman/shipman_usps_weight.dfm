object FrmShipManUSPSWeight: TFrmShipManUSPSWeight
  Left = 364
  Top = 290
  ClientHeight = 126
  ClientWidth = 264
  Caption = 'Package Weight'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 85
    Width = 264
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 56
      Top = 1
      Width = 208
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
        Default = True
      end
      object btnCancel: TUniBitBtn
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object PnlClient01: TUniPanel
    Left = 0
    Top = 25
    Width = 264
    Height = 60
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 89
      Top = 0
      Width = 6
      Height = 60
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Left = 1
      Top = 1
      Width = 89
      Height = 58
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 16
        Top = 12
        Width = 35
        Height = 13
        Hint = ''
        Caption = 'Pounds'
        TabOrder = 1
      end
      object lblOunces: TUniLabel
        Left = 16
        Top = 36
        Width = 36
        Height = 13
        Hint = ''
        Caption = 'Ounces'
        TabOrder = 2
      end
    end
    object PnlClient02: TUniPanel
      Left = 95
      Top = 1
      Width = 169
      Height = 58
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object edtPounds: TUniEdit
        Left = 1
        Top = 8
        Width = 65
        Height = 21
        Hint = ''
        Text = '0'
        TabOrder = 0
      end
      object edtOunces: TUniEdit
        Left = 1
        Top = 32
        Width = 65
        Height = 21
        Hint = ''
        Text = '0'
        TabOrder = 1
      end
      object edtOuncesHidden: TUniEdit
        Left = 1
        Top = 32
        Width = 65
        Height = 21
        Hint = ''
        Visible = False
        Text = '0'
        TabOrder = 2
        OnChange = edtOuncesHiddenChange
      end
      object udPounds: TUpDown
        Left = 66
        Top = 8
        Width = 16
        Height = 21
        Associate = edtPounds
        TabOrder = 4
      end
      object udOunces: TUpDown
        Left = 66
        Top = 32
        Width = 16
        Height = 21
        Associate = edtOuncesHidden
        Max = 150
        Increment = 10
        TabOrder = 5
        Thousands = False
        OnClick = udOuncesClick
      end
    end
  end
  object PnlFlatRate: TUniPanel
    Left = 0
    Top = 0
    Width = 264
    Height = 25
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object chkFlatRate: TUniCheckBox
      Left = 5
      Top = 4
      Width = 97
      Height = 17
      Hint = ''
      Caption = 'Flat rate'
      TabOrder = 0
      OnClick = chkFlatRateClick
    end
  end
end
