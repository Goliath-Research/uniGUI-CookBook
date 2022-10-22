object FrmMenuList: TFrmMenuList
  Left = 450
  Top = 280
  ClientHeight = 173
  ClientWidth = 259
  Caption = ''
  OnShow = FormShow
  Color = clWhite
  BorderStyle = bsNone
  OldCreateOrder = False
  OnClose = FormClose
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  KeyPreview = True
  MonitoredKeys.Keys = <>
  ActiveControl = lstActions
  PixelsPerInch = 96
  TextHeight = 13
  object shpLeft: TUniPanel
    Left = 0
    Top = 8
    Width = 1
    Height = 133
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 3
    Caption = ''
  end
  object shpRight: TUniPanel
    Left = 258
    Top = 8
    Width = 1
    Height = 133
    Hint = ''
    Align = alRight
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 4
    Caption = ''
  end
  object shpBottom: TUniPanel
    Left = 0
    Top = 172
    Width = 259
    Height = 1
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 5
    Caption = ''
  end
  object shpTop: TUniPanel
    Left = 0
    Top = 0
    Width = 259
    Height = 1
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 6
    Caption = ''
  end
  object PnlCarrier: TUniPanel
    Tag = 1999
    Left = 1
    Top = 8
    Width = 257
    Height = 133
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ParentColor = True
    object lstActions: TUniListBox
      Left = 1
      Top = 1
      Width = 255
      Height = 131
      Hint = ''
      ParentShowHint = False
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      OnClick = lstActionsClick
    end
  end
  object PnlCancel: TUniPanel
    Tag = 1999
    Left = 0
    Top = 141
    Width = 259
    Height = 31
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    Color = clWhite
    object Shape5: TUniPanel
      Left = 1
      Top = 1
      Width = 1
      Height = 29
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
      Caption = ''
    end
    object Shape6: TUniPanel
      Left = 258
      Top = 1
      Width = 1
      Height = 29
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 2
      Caption = ''
    end
  end
  object PnlCaptionBar: TUniPanel
    Left = 0
    Top = 1
    Width = 259
    Height = 7
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    Color = clActiveCaption
    object drCaption: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 257
      Height = 5
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      Color = clActiveCaption
      object imgDots: TUniImage
        Left = 111
        Top = 1
        Width = 35
        Height = 3
        Hint = ''
        AutoSize = True
        Picture.Data = {
          07544269746D6170B2000000424DB20000000000000076000000280000002300
          00000300000001000400000000003C0000000000000000000000100000000000
          0000000000000000800000800000008080008000000080008000808000008080
          8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00DFFDDFFDDFFDDFFDDFFDDFFDDFFDDFFDDFF0000007FD07FD07FD07FD07FD
          07FD07FD07FD07F0000000DD00DD00DD00DD00DD00DD00DD00DD00D00000}
        Transparent = True
      end
    end
  end
end
