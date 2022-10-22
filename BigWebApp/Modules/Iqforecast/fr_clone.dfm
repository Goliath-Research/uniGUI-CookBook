object FrmForecastClone: TFrmForecastClone
  Left = 0
  Top = 0
  ClientHeight = 136
  ClientWidth = 413
  Caption = 'Clone Forecast'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 413
    Height = 95
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 141
      Top = 0
      Width = 6
      Height = 95
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel3: TUniPanel
      Left = 1
      Top = 1
      Width = 141
      Height = 93
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 8
        Top = 12
        Width = 72
        Height = 13
        Hint = ''
        Caption = 'Forecast Name'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 8
        Top = 36
        Width = 98
        Height = 13
        Hint = ''
        Caption = 'Forecast Description'
        TabOrder = 2
      end
    end
    object Panel4: TUniPanel
      Left = 147
      Top = 1
      Width = 266
      Height = 93
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        266
        93)
      object edName: TUniEdit
        Left = 1
        Top = 9
        Width = 254
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object edDescrip: TUniEdit
        Left = 1
        Top = 33
        Width = 254
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 95
    Width = 413
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel5: TUniPanel
      Left = 231
      Top = 1
      Width = 182
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 4
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 93
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
end
