object FrmCRMProperties: TFrmCRMProperties
  Left = 194
  Top = 118
  ClientHeight = 327
  ClientWidth = 336
  Caption = 'Properties'
  BorderStyle = bsSizeToolWin
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object pcMain: TUniPageControl
    Left = 0
    Top = 0
    Width = 336
    Height = 308
    Hint = ''
    ActivePage = TabGeneral
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabGeneral: TUniTabSheet
      Hint = ''
      Caption = 'General'
      object Panel1: TUniPanel
        Left = 0
        Top = 0
        Width = 328
        Height = 280
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = 'There are not properties to display.'
        Color = clWindow
        object DataInspector: TwwDataInspector
          Left = 0
          Top = 0
          Width = 328
          Height = 280
          DisableThemes = False
          Align = alClient
          BorderStyle = bsNone
          TabOrder = 0
          PictureMaskFromDataSet = True
          Items = <>
          CaptionWidth = 120
          Options = [ovColumnResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert, ovTabToVisibleOnly]
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          LineStyleCaption = ovDottedLine
          LineStyleData = ovDottedLine
          ReadOnly = True
        end
      end
    end
    object TabComment: TUniTabSheet
      Hint = ''
      ImageIndex = 1
      Caption = 'Comment'
      object PnlComment: TUniPanel
        Left = 0
        Top = 0
        Width = 328
        Height = 280
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object memComment: TUniMemo
          Left = 1
          Top = 1
          Width = 326
          Height = 278
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
    end
  end
  object StatusBar: TUniStatusBar
    Left = 0
    Top = 308
    Width = 336
    Height = 19
    Hint = ''
    Panels = <>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
end
