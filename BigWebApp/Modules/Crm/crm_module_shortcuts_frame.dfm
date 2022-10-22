object FrmModuleShortcutsFrame: TFrmModuleShortcutsFrame
  Left = 0
  Top = 0
  Width = 268
  Height = 360
  Constraints.MinWidth = 190
  TabOrder = 0
  OnResize = FrameResize
  object PnlCarrier: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 268
    Height = 360
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 220
    object sbPnlHint: TUniScrollBox
      Tag = 1999
      Left = 0
      Top = 0
      Width = 268
      Height = 360
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clWhite
      TabOrder = 0
      ExplicitWidth = 220
      ScrollHeight = 290
      object PnlDisplay: TUniPanel
        Tag = 1999
        Left = 0
        Top = 0
        Width = 266
        Height = 290
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        ParentColor = True
        ExplicitWidth = 218
        DesignSize = (
          266
          290)
        object PnlNode: TUniPanel
          Tag = 1999
          Left = 5
          Top = 1
          Width = 257
          Height = 62
          Hint = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          ParentColor = True
          ExplicitWidth = 209
          object PnlTextHint: TUniPanel
            Tag = 1999
            Left = 1
            Top = 30
            Width = 255
            Height = 32
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            ParentColor = True
            ExplicitWidth = 207
            object txtHint: TUniLabel
              Left = 1
              Top = 1
              Width = 191
              Height = 13
              Hint = ''
              Caption = 'Customer Relationship Management.'
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Name = 'Segoe UI'
              TabOrder = 1
            end
          end
          object PnlTitle: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 255
            Height = 30
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            TabOrder = 1
            Caption = ''
            ParentColor = True
            ExplicitWidth = 207
            object lblTitle: TUniLabel
              Left = 8
              Top = 1
              Width = 247
              Height = 28
              Hint = ''
              AutoSize = False
              Caption = 'EnterpriseIQ Information'
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              TabOrder = 1
              ExplicitWidth = 199
            end
            object Bevel1: TUniPanel
              Left = 1
              Top = 1
              Width = 8
              Height = 28
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 2
              Caption = ''
            end
          end
        end
        object PnlSelected: TUniPanel
          Tag = 1999
          Left = 5
          Top = 72
          Width = 257
          Height = 62
          Hint = ''
          Visible = False
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
          ParentColor = True
          ExplicitWidth = 209
          object PnlSelectDescrip: TUniPanel
            Tag = 1999
            Left = 1
            Top = 25
            Width = 255
            Height = 37
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            ExplicitWidth = 207
            object lblSelectedItemDescription: TUniLabel
              Left = 1
              Top = 1
              Width = 137
              Height = 13
              Hint = ''
              Caption = 'lblSelectedItemDescription'
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Name = 'Segoe UI'
              TabOrder = 1
            end
          end
          object PnlSelectedItemCaption: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 255
            Height = 25
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            TabOrder = 1
            Caption = ''
            ParentColor = True
            ExplicitWidth = 207
            object lblSelectedItemCaption: TUniLabel
              Left = 8
              Top = 1
              Width = 247
              Height = 23
              Hint = ''
              Visible = False
              AutoSize = False
              Caption = 'lblSelectedItemCaption'
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              TabOrder = 1
              ExplicitWidth = 199
            end
            object Bevel2: TUniPanel
              Left = 1
              Top = 1
              Width = 8
              Height = 23
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 2
              Caption = ''
            end
          end
        end
        object PnlTasks: TUniPanel
          Tag = 1999
          Left = 5
          Top = 144
          Width = 257
          Height = 81
          Hint = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Caption = ''
          ExplicitWidth = 209
          object PnlActions: TUniPanel
            Tag = 1999
            Left = 1
            Top = 25
            Width = 255
            Height = 56
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            ExplicitWidth = 207
          end
          object PnlActionsCaption: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 255
            Height = 25
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            TabOrder = 1
            Caption = ''
            ParentColor = True
            ExplicitWidth = 207
            object lblActionsCaption: TUniLabel
              Left = 8
              Top = 1
              Width = 247
              Height = 23
              Hint = ''
              AutoSize = False
              Caption = 'Actions'
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              TabOrder = 1
              ExplicitWidth = 199
            end
            object Bevel3: TUniPanel
              Left = 1
              Top = 1
              Width = 8
              Height = 23
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 2
              Caption = ''
            end
          end
        end
        object PnlCollapseStatistics: TUniPanel
          Tag = 1999
          Left = 241
          Top = 1
          Width = 25
          Height = 25
          Hint = ''
          Anchors = [akTop, akRight]
          TabOrder = 3
          ShowCaption = False
          Caption = ''
          Color = clWhite
          ExplicitLeft = 193
          object sbtnCollapsePane: TUniSpeedButton
            Tag = 1999
            Left = 1
            Top = 1
            Width = 20
            Height = 22
            Hint = 'Hide'
            ShowHint = True
            ParentShowHint = False
            Caption = #171
            ParentFont = False
            Font.Color = clGrayText
            Font.Name = 'System'
            ParentColor = False
            Color = clWindow
            OnClick = sbtnCollapsePaneClick
          end
        end
      end
    end
  end
end
