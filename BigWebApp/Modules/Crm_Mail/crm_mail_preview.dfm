object FrmCRMMassMailPreview: TFrmCRMMassMailPreview
  Left = 399
  Top = 236
  ClientHeight = 408
  ClientWidth = 657
  Caption = 'Preview Email'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 389
    Width = 657
    Height = 19
    Hint = ''
    Panels = <>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object PnlCarrier: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 657
    Height = 389
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    Color = clWhite
    object PnlHeader: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 655
      Height = 77
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      Color = clWhite
      object txtSubject: TUniLabel
        Left = 6
        Top = 6
        Width = 49
        Height = 16
        Hint = ''
        Caption = 'Subject'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 2
      end
      object txtFrom: TUniLabel
        Left = 6
        Top = 29
        Width = 64
        Height = 13
        Hint = ''
        Caption = 'Sender Name'
        TabOrder = 3
      end
      object PnlEMailBar02: TUniPanel
        Left = 6
        Top = 52
        Width = 487
        Height = 17
        Hint = ''
        TabOrder = 0
        Caption = ''
        ParentColor = True
        object lblMailTo: TUniLabel
          Left = 1
          Top = 1
          Width = 14
          Height = 13
          Hint = ''
          Caption = 'To'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentFont = False
          Font.Style = [fsBold]
          TabOrder = 1
        end
        object Bevel4: TUniPanel
          Left = 14
          Top = 1
          Width = 6
          Height = 15
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 2
          Caption = ''
        end
        object txtTo: TUniLabel
          Left = 20
          Top = 1
          Width = 74
          Height = 13
          Hint = ''
          Caption = 'Recipient Name'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 3
        end
      end
    end
    object PnlDisplayArea: TUniPanel
      Left = 1
      Top = 77
      Width = 655
      Height = 312
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      Color = clWhite
      object pcMain: TUniPageControl
        Left = 1
        Top = 1
        Width = 653
        Height = 310
        Hint = ''
        Visible = False
        ActivePage = TabTEXT
        TabBarVisible = True
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object TabTEXT: TUniTabSheet
          Hint = ''
          Caption = 'TabTEXT'
          object RichEdit: TRichEdit
            Left = 0
            Top = 0
            Width = 645
            Height = 282
            Align = alClient
            BorderStyle = bsNone
            BorderWidth = 10
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            HideSelection = False
            ParentFont = False
            PlainText = True
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 0
            WantTabs = True
            Zoom = 100
          end
        end
        object TabHTML: TUniTabSheet
          Hint = ''
          ImageIndex = 1
          Caption = 'TabHTML'
          object PnlWebBrowser: TUniPanel
            Left = 0
            Top = 0
            Width = 645
            Height = 282
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object WebBrowser: TWebBrowser
              AlignWithMargins = True
              Left = 8
              Top = 8
              Width = 629
              Height = 266
              Margins.Left = 8
              Margins.Top = 8
              Margins.Right = 8
              Margins.Bottom = 8
              TabStop = False
              Align = alClient
              TabOrder = 1
              OnDocumentComplete = WebBrowserDocumentComplete
              ExplicitWidth = 633
              ExplicitHeight = 268
              ControlData = {
                4C000000024100007E1B00000000000000000000000000000000000000000000
                000000004C000000000000000000000001000000E0D057007335CF11AE690800
                2B2E126208000000000000004C0000000114020000000000C000000000000046
                8000000000000000000000000000000000000000000000000000000000000000
                00000000000000000100000000000000000000000000000000000000}
            end
          end
        end
      end
    end
  end
end
