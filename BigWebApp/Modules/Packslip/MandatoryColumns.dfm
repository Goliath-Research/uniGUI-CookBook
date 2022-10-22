object FrmMandatoryColumns: TFrmMandatoryColumns
  Left = 0
  Top = 0
  ClientHeight = 339
  ClientWidth = 387
  Caption = 'Mandatory Columns'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 297
    Width = 387
    Height = 42
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 279
      Top = 1
      Width = 108
      Height = 40
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Button1: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Done'
        TabOrder = 1
        OnClick = Button1Click
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 27
    Width = 387
    Height = 270
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 185
      Top = 0
      Width = 6
      Height = 270
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel5: TUniPanel
      Left = 191
      Top = 1
      Width = 196
      Height = 268
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object ScrollBox2: TUniScrollBox
        Left = 0
        Top = 0
        Width = 196
        Height = 268
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 185
      Height = 268
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
      Caption = ''
      object ScrollBox1: TUniScrollBox
        Left = 0
        Top = 0
        Width = 185
        Height = 268
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
  end
  object Panel6: TUniPanel
    Left = 0
    Top = 0
    Width = 387
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Alignment = taLeftJustify
    Caption = '  Please assign Mandatory Column(s)'
  end
  object Src: TDataSource
    Left = 24
    Top = 184
  end
end
