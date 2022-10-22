object FrmM_RTEff: TFrmM_RTEff
  Left = 40
  Top = 151
  HelpContext = 1111657
  ClientHeight = 215
  ClientWidth = 546
  Caption = 'Plant Efficiency'
  OnShow = FormShow
  Constraints.MinHeight = 250
  Constraints.MinWidth = 488
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 546
    Height = 215
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel1: TUniPanel
      Left = 1
      Top = 1
      Width = 544
      Height = 186
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object PageControl1: TUniPageControl
        Left = 1
        Top = 1
        Width = 542
        Height = 184
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ActivePage = tabAnalog
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object tabAnalog: TUniTabSheet
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Analog'
          object PnlMachineUtilization: TUniPanel
            Left = 0
            Top = 0
            Width = 128
            Height = 156
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object PnlMachineUtilizationCaption: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 126
              Height = 22
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clWhite
              TabOrder = 0
              Caption = ''
              Color = clBtnShadow
              object lblMachineUtilizationCaption: TUniLabel
                Left = 1
                Top = 1
                Width = 110
                Height = 13
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Alignment = taCenter
                Caption = 'Machine Utilization '
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                ParentFont = False
                Font.Color = clWhite
                Font.Style = [fsBold]
                TabOrder = 1
              end
            end
            object GaugeMachineUtilization: TAdvSmoothGauge
              Left = 1
              Top = 23
              Width = 103
              Height = 103
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              UnlimitedDisplayValue = True
              MaximumValue = 100.000000000000000000
              Digit.Color = 9841920
              Digit.BackGroundColor = 16773091
              OuterCircle.Color = 16765615
              OuterCircle.Width = 0.030000000000000000
              InnerCircle.Color = 16765615
              OuterRim.Width = 2
              Needle.Color = 2179584
              Needle.ShineColor = clGray
              Needle.ShineColorTo = 5395026
              Needle.OuterCenterColor = 16765357
              Needle.InnerCenterColor = 16765615
              Needle.InnerCenterColorTo = 16765615
              Arc.Color = 16773091
              Arc.Width = 0.030000000000000000
              Arc.Threshold.Color = 16765615
              Arc.Threshold.Center = 25.000000000000000000
              Arc.Threshold.EndValue = 100.000000000000000000
              DivisionColor = 9841920
              SubDivisionColor = 9841920
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 9841920
              Font.Height = -19
              Font.Name = 'Tahoma'
              Font.Style = []
              ValueFont.Charset = DEFAULT_CHARSET
              ValueFont.Color = clBlack
              ValueFont.Height = -15
              ValueFont.Name = 'Tahoma'
              ValueFont.Style = []
              ValueFormat = '000.00'
              Version = '2.3.0.0'
              Sections = <
                item
                  Color = clRed
                  EndValue = 30.000000000000000000
                end
                item
                  Color = clGreen
                  StartValue = 30.000000000000000000
                  EndValue = 100.000000000000000000
                end>
              ExtraNeedles = <>
              Align = alClient
              TabOrder = 1
              TMSStyle = 4
            end
            object PnlMachineUtilizationThreshold: TUniPanel
              Left = 1
              Top = 126
              Width = 126
              Height = 29
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alBottom
              Anchors = [akLeft, akRight, akBottom]
              TabOrder = 2
              Caption = ''
              object lblMachineUtilizationThreshold: TUniLabel
                Left = 1
                Top = 1
                Width = 56
                Height = 13
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Alignment = taCenter
                Caption = 'Threshold 0'
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
              end
            end
          end
          object PnlUnscheduledDown: TUniPanel
            Left = 128
            Top = 0
            Width = 128
            Height = 156
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 1
            Caption = ''
            object PnlUnscheduledDownCaption: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 126
              Height = 22
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clWhite
              TabOrder = 0
              Caption = ''
              Color = clBtnShadow
              object lblUnscheduledDownCaption: TUniLabel
                Left = 1
                Top = 1
                Width = 106
                Height = 13
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Alignment = taCenter
                Caption = 'Unscheduled Down'
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                ParentFont = False
                Font.Color = clWhite
                Font.Style = [fsBold]
                TabOrder = 1
              end
            end
            object GaugeUnscheduledDown: TAdvSmoothGauge
              Left = 1
              Top = 23
              Width = 103
              Height = 103
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              UnlimitedDisplayValue = True
              MaximumValue = 100.000000000000000000
              Digit.Color = 9841920
              Digit.BackGroundColor = 16773091
              OuterCircle.Color = 16765615
              OuterCircle.Width = 0.030000000000000000
              InnerCircle.Color = 16765615
              OuterRim.Width = 2
              Needle.Color = 2179584
              Needle.ShineColor = clGray
              Needle.ShineColorTo = 5395026
              Needle.OuterCenterColor = 16765357
              Needle.InnerCenterColor = 16765615
              Needle.InnerCenterColorTo = 16765615
              Arc.Color = 16773091
              Arc.Width = 0.030000000000000000
              Arc.Threshold.Color = 16765615
              Arc.Threshold.Center = 25.000000000000000000
              Arc.Threshold.EndValue = 100.000000000000000000
              DivisionColor = 9841920
              SubDivisionColor = 9841920
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 9841920
              Font.Height = -19
              Font.Name = 'Tahoma'
              Font.Style = []
              ValueFont.Charset = DEFAULT_CHARSET
              ValueFont.Color = clBlack
              ValueFont.Height = -15
              ValueFont.Name = 'Tahoma'
              ValueFont.Style = []
              ValueFormat = '000.00'
              Version = '2.3.0.0'
              Sections = <
                item
                  Color = clGreen
                  EndValue = 30.000000000000000000
                end
                item
                  Color = clRed
                  StartValue = 30.000000000000000000
                  EndValue = 100.000000000000000000
                end>
              ExtraNeedles = <>
              Align = alClient
              TabOrder = 1
              TMSStyle = 4
            end
            object PnlUnscheduledDownThreshold: TUniPanel
              Left = 1
              Top = 126
              Width = 126
              Height = 29
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alBottom
              Anchors = [akLeft, akRight, akBottom]
              TabOrder = 2
              Caption = ''
              object lblUnscheduledDownThreshold: TUniLabel
                Left = 1
                Top = 1
                Width = 56
                Height = 13
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Alignment = taCenter
                Caption = 'Threshold 0'
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
              end
            end
          end
          object PnlEffectiveCycle: TUniPanel
            Left = 256
            Top = 0
            Width = 128
            Height = 156
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 2
            Caption = ''
            object PnlEffectiveCycleCaption: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 126
              Height = 22
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clWhite
              TabOrder = 0
              Caption = ''
              Color = clBtnShadow
              object lblEffectiveCycleCaption: TUniLabel
                Left = 1
                Top = 1
                Width = 82
                Height = 13
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Alignment = taCenter
                Caption = 'Effective Cycle'
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                ParentFont = False
                Font.Color = clWhite
                Font.Style = [fsBold]
                TabOrder = 1
              end
            end
            object GaugeEffectiveCycle: TAdvSmoothGauge
              Left = 1
              Top = 23
              Width = 103
              Height = 103
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              UnlimitedDisplayValue = True
              MaximumValue = 100.000000000000000000
              Digit.Color = 9841920
              Digit.BackGroundColor = 16773091
              OuterCircle.Color = 16765615
              OuterCircle.Width = 0.030000000000000000
              InnerCircle.Color = 16765615
              OuterRim.Width = 2
              Needle.Color = 2179584
              Needle.ShineColor = clGray
              Needle.ShineColorTo = 5395026
              Needle.OuterCenterColor = 16765357
              Needle.InnerCenterColor = 16765615
              Needle.InnerCenterColorTo = 16765615
              Arc.Color = 16773091
              Arc.Width = 0.030000000000000000
              Arc.Threshold.Color = 16765615
              Arc.Threshold.Center = 25.000000000000000000
              Arc.Threshold.EndValue = 100.000000000000000000
              DivisionColor = 9841920
              SubDivisionColor = 9841920
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 9841920
              Font.Height = -19
              Font.Name = 'Tahoma'
              Font.Style = []
              ValueFont.Charset = DEFAULT_CHARSET
              ValueFont.Color = clBlack
              ValueFont.Height = -15
              ValueFont.Name = 'Tahoma'
              ValueFont.Style = []
              ValueFormat = '000.00'
              Version = '2.3.0.0'
              Sections = <
                item
                  Color = clRed
                  EndValue = 30.000000000000000000
                end
                item
                  Color = clGreen
                  StartValue = 30.000000000000000000
                  EndValue = 100.000000000000000000
                end>
              ExtraNeedles = <>
              Align = alClient
              TabOrder = 1
              TMSStyle = 4
            end
            object PnlEffectiveCycleThreshold: TUniPanel
              Left = 1
              Top = 126
              Width = 126
              Height = 29
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alBottom
              Anchors = [akLeft, akRight, akBottom]
              TabOrder = 2
              Caption = ''
              object lblEffectiveCycleThreshold: TUniLabel
                Left = 1
                Top = 1
                Width = 56
                Height = 13
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Alignment = taCenter
                Caption = 'Threshold 0'
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
              end
            end
          end
          object PnlAverageScrap: TUniPanel
            Left = 384
            Top = 0
            Width = 128
            Height = 156
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 3
            Caption = ''
            object PnlAverageScrapCaption: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 126
              Height = 22
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clWhite
              TabOrder = 0
              Caption = ''
              Color = clBtnShadow
              object lblAverageScrapCaption: TUniLabel
                Left = 1
                Top = 1
                Width = 83
                Height = 13
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Alignment = taCenter
                Caption = 'Average Scrap'
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                ParentFont = False
                Font.Color = clWhite
                Font.Style = [fsBold]
                TabOrder = 1
              end
            end
            object GaugeAverageScrap: TAdvSmoothGauge
              Left = 1
              Top = 23
              Width = 103
              Height = 103
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              UnlimitedDisplayValue = True
              MaximumValue = 100.000000000000000000
              Digit.Color = 9841920
              Digit.BackGroundColor = 16773091
              OuterCircle.Color = 16765615
              OuterCircle.Width = 0.030000000000000000
              InnerCircle.Color = 16765615
              OuterRim.Width = 2
              Needle.Color = 2179584
              Needle.ShineColor = clGray
              Needle.ShineColorTo = 5395026
              Needle.OuterCenterColor = 16765357
              Needle.InnerCenterColor = 16765615
              Needle.InnerCenterColorTo = 16765615
              Arc.Color = 16773091
              Arc.Width = 0.030000000000000000
              Arc.Threshold.Color = 16765615
              Arc.Threshold.Center = 25.000000000000000000
              Arc.Threshold.EndValue = 100.000000000000000000
              DivisionColor = 9841920
              SubDivisionColor = 9841920
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 9841920
              Font.Height = -19
              Font.Name = 'Tahoma'
              Font.Style = []
              ValueFont.Charset = DEFAULT_CHARSET
              ValueFont.Color = clBlack
              ValueFont.Height = -15
              ValueFont.Name = 'Tahoma'
              ValueFont.Style = []
              ValueFormat = '000.00'
              Version = '2.3.0.0'
              Sections = <
                item
                  Color = clGreen
                  EndValue = 30.000000000000000000
                end
                item
                  Color = clRed
                  StartValue = 30.000000000000000000
                  EndValue = 100.000000000000000000
                end>
              ExtraNeedles = <>
              Align = alClient
              TabOrder = 1
              TMSStyle = 4
            end
            object PnlAverageScrapThreshold: TUniPanel
              Left = 1
              Top = 126
              Width = 126
              Height = 29
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alBottom
              Anchors = [akLeft, akRight, akBottom]
              TabOrder = 2
              Caption = ''
              object lblAverageScrapThreshold: TUniLabel
                Left = 1
                Top = 1
                Width = 56
                Height = 13
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Alignment = taCenter
                Caption = 'Threshold 0'
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
              end
            end
          end
        end
        object tabDigital: TUniTabSheet
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ImageIndex = 1
          Caption = 'Digital'
          object lblDigitalMachineUtilization: TUniLabel
            Left = 10
            Top = 17
            Width = 91
            Height = 13
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Machine Utilization '
            TabOrder = 0
          end
          object lblDigitalUnscheduledDown: TUniLabel
            Left = 10
            Top = 58
            Width = 91
            Height = 13
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Unscheduled Down'
            TabOrder = 1
          end
          object lblDigitalEffectiveCycle: TUniLabel
            Left = 10
            Top = 97
            Width = 72
            Height = 13
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Effective Cycle'
            TabOrder = 2
          end
          object lblDigitalAverageScrap: TUniLabel
            Left = 10
            Top = 135
            Width = 71
            Height = 13
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Average Scrap'
            TabOrder = 3
          end
          object lblUtilization: TUniLabel
            Left = 590
            Top = 17
            Width = 8
            Height = 13
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '[]'
            TabOrder = 4
          end
          object lblUnsched: TUniLabel
            Left = 590
            Top = 58
            Width = 8
            Height = 13
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '[]'
            TabOrder = 5
          end
          object lblEffCycle: TUniLabel
            Left = 590
            Top = 97
            Width = 8
            Height = 13
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '[]'
            TabOrder = 6
          end
          object lblAvgScrap: TUniLabel
            Left = 590
            Top = 135
            Width = 8
            Height = 13
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '[]'
            TabOrder = 7
          end
          object lblUtilThr: TUniLabel
            Left = 639
            Top = 17
            Width = 6
            Height = 13
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '0'
            TabOrder = 8
          end
          object lblUnschedThr: TUniLabel
            Left = 639
            Top = 58
            Width = 6
            Height = 13
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '0'
            TabOrder = 9
          end
          object lblEffThr: TUniLabel
            Left = 639
            Top = 97
            Width = 6
            Height = 13
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '0'
            TabOrder = 10
          end
          object lblAvgThr: TUniLabel
            Left = 639
            Top = 135
            Width = 6
            Height = 13
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '0'
            TabOrder = 11
          end
          object Label5: TUniLabel
            Left = 617
            Top = -2
            Width = 61
            Height = 13
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Threshold %'
            TabOrder = 12
          end
        end
      end
    end
    object Panel2: TUniPanel
      Left = 1
      Top = 187
      Width = 544
      Height = 27
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object StatusBar1: TUniStatusBar
        Left = 1
        Top = 1
        Width = 542
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Panels = <
          item
            Text = 'Status: Inactive'
            Width = 130
          end
          item
            Text = '        Filter: Overall View'
            Width = 50
          end>
        SizeGrip = False
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        ParentColor = False
        Color = clWindow
      end
      object bbtnFilter: TUniBitBtn
        Left = 132
        Top = 3
        Width = 22
        Height = 22
        Hint = 'Change Filter'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF5A5857404040202820000800FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF58585840
          4040252525050505FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF606060706870404040000800FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6060606A
          6A6A404040050505FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF605860909090606060302830FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5B5B5B90
          90906060602A2A2AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF505850B0A8B0808080404840FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF555555AB
          ABAB808080464646FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFE0C9B9605850C0C0C0A0A0A0404040CEB3A0FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC8C8C8575757C0
          C0C0A0A0A0404040B2B2B2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFE0CABA505850A0A0A0D0D0D0B0B0B0707070201820CCAE9BFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC9C9C9555555A0A0A0D0
          D0D0B0B0B07070701A1A1AADADADFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFE1CCBC706870C0B8C0E0E8E0E0E0E0C0C0C0909890605860201820CBAB
          96FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCBCBCB6A6A6ABBBBBBE6E6E6E0
          E0E0C0C0C09696965B5B5B1A1A1AA9A9A9FF00FFFF00FFFF00FFFF00FFFF00FF
          E1CDBE707070C0C0C0F0E8F0FFF8FFF0F0F0D0D8D0C0C0C0A098A06058601018
          10C9A791FF00FFFF00FFFF00FFFF00FFCCCCCC707070C0C0C0EBEBEBFAFAFAF0
          F0F0D6D6D6C0C0C09B9B9B5B5B5B161616A5A5A5FF00FFFF00FFFF00FFE1CDC0
          808080D0D0D0F0F0F0FFFFFFFFFFFFFFF8FFE0E8E0D0D8D0C0B8C09090905050
          50201820C8A38CFF00FFFF00FFCCCCCC808080D0D0D0F0F0F0FFFFFFFFFFFFFA
          FAFAE6E6E6D6D6D6BBBBBB9090905050501A1A1AA2A2A2FF00FFFF00FF808080
          D0D0D0F0F0F0FFF8FFFFF8FFF0F8F0F0F0F0E0E8E0D0D0D0C0C0C0A098A06068
          60505850101810FF00FFFF00FF808080D0D0D0F0F0F0FAFAFAFAFAFAF6F6F6F0
          F0F0E6E6E6D0D0D0C0C0C09B9B9B656565555555161616FF00FFFF00FFB0B8B0
          C0C8C0D0D0D0D0D0D0C0C0C0C0B8C0B0B0B0A0A8A0A0A0A0A098A09090907078
          70606060504850FF00FFFF00FFB6B6B6C6C6C6D0D0D0D0D0D0C0C0C0BBBBBBB0
          B0B0A6A6A6A0A0A09B9B9B9090907575756060604A4A4AFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        TabOrder = 0
        OnClick = bbtnFilterClick
      end
    end
  end
  object tmRefresh: TUniTimer
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = tmRefreshTimer
    Left = 405
    Top = 138
  end
  object MainMenu1: TUniMainMenu
    Left = 374
    Top = 138
    object File1: TUniMenuItem
      Caption = 'File'
      object Analog1: TUniMenuItem
        Caption = 'Analog'
        Checked = True
        OnClick = SelectView
      end
      object Digital1: TUniMenuItem
        Tag = 1
        Caption = 'Digital'
        OnClick = SelectView
      end
      object N2: TUniMenuItem
        Caption = '-'
      end
      object Filter1: TUniMenuItem
        Caption = 'Filter'
        OnClick = bbtnFilterClick
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmIQMeterRT_Efficiency'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 197411 $'
    BuildVersion = '176554'
    Left = 477
    Top = 137
  end
  object procRT_EFF_MONITOR: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.RT_METER.EFF_MONITOR'
    Left = 446
    Top = 137
    ParamData = <
      item
        Name = 'v_mode_in'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'v_mfg_type_in'
        DataType = ftFixedChar
        ParamType = ptInput
      end
      item
        Name = 'v_mfgcell_in'
        DataType = ftFixedChar
        ParamType = ptInput
      end
      item
        Name = 'v_eplant_id_in'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'v_work_center_id_in'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'v_utilization'
        DataType = ftFMTBcd
        ParamType = ptInputOutput
      end
      item
        Name = 'v_unsched_down'
        DataType = ftFMTBcd
        ParamType = ptInputOutput
      end
      item
        Name = 'v_eff_cycle'
        DataType = ftFMTBcd
        ParamType = ptInputOutput
      end
      item
        Name = 'v_avg_scrap'
        DataType = ftFMTBcd
        ParamType = ptInputOutput
      end>
  end
end
