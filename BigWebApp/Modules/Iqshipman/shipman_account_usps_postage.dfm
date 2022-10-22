object FrmShipManAccountUSPSPostage: TFrmShipManAccountUSPSPostage
  Left = 0
  Top = 0
  ClientHeight = 75
  ClientWidth = 242
  Caption = 'Purchase Postage'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 34
    Width = 242
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 34
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
    Top = 0
    Width = 242
    Height = 34
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 121
      Top = 0
      Width = 6
      Height = 34
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Left = 1
      Top = 1
      Width = 121
      Height = 32
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 16
        Top = 12
        Width = 97
        Height = 13
        Hint = ''
        Caption = 'Amount to Purchase'
        TabOrder = 1
      end
    end
    object PnlClient02: TUniPanel
      Left = 127
      Top = 1
      Width = 115
      Height = 32
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object edtPostage: TUniSpinEdit
        Left = 1
        Top = 7
        Width = 80
        Height = 22
        Hint = ''
        TabOrder = 1
      end
    end
  end
end
