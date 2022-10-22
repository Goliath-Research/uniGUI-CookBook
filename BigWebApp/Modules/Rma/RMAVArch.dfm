object FrmViewArchivedRMA: TFrmViewArchivedRMA
  Left = 79
  Top = 144
  HelpContext = 1044901
  ClientHeight = 652
  ClientWidth = 878
  Caption = 'Archived RMA'#39's'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter2: TUniSplitter
    Left = 0
    Top = 158
    Width = 878
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Splitter1: TUniSplitter
    Left = 0
    Top = 389
    Width = 878
    Height = 4
    Cursor = crVSplit
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 878
    Height = 27
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object SBToggleRma: TUniSpeedButton
      Left = 36
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Toggle Table/Form'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000A0860100A08601000001000000000000000000001212
        1200282828003E3E3E006A6A6A006F6F6F00800000008B09020097130300A21C
        0500AA230600AD250700B52C0800B92F0900C0340A00C4380A00CA3D0B00CF41
        0C00D5460D00D8511900DA5A2400DD663100E06E3A00E37C4900E5825000F08C
        6800E9916100EA966700EFAB7E00FF00FF00808080008A8A8A008F8F8F009494
        9400999999009F9F9F00A4A4A400A9A9A900ADADAD00AEAEAE00B0B0B000B3B3
        B300B4B4B400B7B7B700B8B8B800BABABA00BDBDBD00F4BF9400FAD3AA00C0C0
        C000C2C2C200C3C3C300C6C6C600C8C8C800C9C9C900CDCDCD00E0E0E000F9F9
        FB00FFFFFF000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001D1D1D1D0505
        050505050505050505051D1D1D1D0505050505050505050505051D1D1D1D1E2C
        29272524232221201F051D1D1D1D1E2C29272524232221201F051D1D1D1D1E2E
        2C2927250302010020051D1D1D1D1E2E2C2927250302010020051D1D1D1D1E32
        2E2C29271E3A3A0021051D1D1D1D1E322E2C29271E3A3A0021051D1D1D1D1E35
        2A2004291E1E1E1E22051D1D1D1D1E352A2004291E1E1E1E22051D1D1D1D1E37
        35322E2C2927252423051D1D1D1D1E3735322E2C2927252423051E1E1E1E1A17
        1513110F0D0B090807061E1E1E1E211E050403030303030202021E3838381A19
        191919191919191919061E3838382120202020202020202020021E3939391A17
        1513110F0D0B090807061E393939211E050403030303030202021E393331392D
        2B392826391E1D1D1D1D1E393331392D2B392826391E1D1D1D1D1E3939393939
        39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D1E3936343931
        2E392B2A391E1D1D1D1D1E39363439312E392B2A391E1D1D1D1D1E3939393939
        39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D302F1C1B1816
        1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D301919191919
        19191919190A1D1D1D1D3720202020202020202020031D1D1D1D302F1C1B1816
        1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D}
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      OnClick = SBToggleRmaClick
    end
    object SBSearch: TIQWebDropDownButton
      Left = 1
      Top = 1
      Width = 35
      Height = 25
      Hint = 'Search...'
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
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
        90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
        40905030773818FF00FF8B8B8B7777775F5F5F5A5A5A5A5A5A4A4A4AFF00FFFF
        00FFFF00FF8484847474746F6F6F5A5A5A5151513B3B3BFF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0E0C8C0D0A8
        90B07850804820FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7C9C9C9A7A7A7777777484848FF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC09880FFFFFF
        F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF979797FFFFFFE7E7E7C9C9C99E9E9E424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC3A494B08870
        A068509050308048308048208038108F4C26B08870A068509058309048308040
        20703810905830FF00FFA4A4A48787876969695151514A4A4A4848483B3B3B4E
        4E4E8787876969695757574C4C4C424242393939575757FF00FFDEC4B4B08870
        FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
        50803820CFA98AFF00FFC3C3C3878787FFFFFFCECECEA1A1A16F6F6F414141B5
        B5B58D8D8DD7D7D7D9D9D9A1A1A17777773D3D3DA7A7A7FF00FFFF00FFC09080
        F0F0F0FFF8F0F0D8C0B08060804820965732B09070FFFFFFFFF8F0F0D0C0B078
        50804820FF00FFFF00FFFF00FFFF00FFF0F0F0F7F7F7D5D5D57F7F7F48484857
        57578D8D8DFFFFFFF7F7F7D0D0D0777777484848FF00FFFF00FFFF00FFF8E2D2
        C09880B08060A068509050309058409D6842B07860B08870A070508048308048
        20ECC4A7FF00FFFF00FFFF00FFE1E1E19797977F7F7F6969695151515A5A5A67
        67677979798787876F6F6F4A4A4A484848C2C2C2FF00FFFF00FFFF00FFFF00FF
        C09880FFF8FFE0C0B0C09070804820FF00FFC09880FFF8FFE0C8B0D0A0808048
        20FF00FFFF00FFFF00FFFF00FFFF00FF979797FAFAFAC0C0C08E8E8E484848FF
        00FF979797FAFAFAC5C5C59E9E9E484848FF00FFFF00FFFF00FFFF00FFFF00FF
        CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
        37FF00FFFF00FFFF00FFFF00FFFF00FFB0B0B08F8F8F696969515151525252FF
        00FFA5A5A58F8F8F696969515151505050FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFB1836DFFF8F0814527FF00FFFF00FFFF00FFB08068FFF8F0804324FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF838383F7F7F7464646FF00FFFF
        00FFFF00FF808080F7F7F7444444FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A78C8C8C676767FF00FFFF
        00FFFF00FFADADAD8B8B8B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = SBSearchClick
      AssociatedPopupMenu = PopupMenu1
      Flat = True
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      Caption = ''
    end
  end
  object Panel6: TUniPanel
    Left = 0
    Top = 27
    Width = 878
    Height = 131
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = 'Panel6'
    object PCRma: TUniPageControl
      Left = 1
      Top = 1
      Width = 876
      Height = 129
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ActivePage = TabGrid
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabForm: TUniTabSheet
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'TabForm'
        object PnlHeader: TUniPanel
          Tag = 1999
          Left = 0
          Top = 0
          Width = 868
          Height = 101
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter5: TUniSplitter
            Left = 184
            Top = 1
            Width = 4
            Height = 99
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlHeaderLeft03: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 183
            Height = 99
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Splitter4: TUniSplitter
              Left = 48
              Top = 1
              Width = 4
              Height = 97
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object PnlHeaderLeft01: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 47
              Height = 97
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              object Label1: TUniLabel
                Left = 8
                Top = 13
                Width = 33
                Height = 13
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'RMA #'
                TabOrder = 1
              end
              object Label3: TUniLabel
                Left = 8
                Top = 37
                Width = 23
                Height = 13
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Date'
                TabOrder = 2
              end
              object Label16: TUniLabel
                Left = 8
                Top = 61
                Width = 28
                Height = 13
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Suffix'
                TabOrder = 3
              end
            end
            object PnlHeaderClient01: TUniPanel
              Tag = 1999
              Left = 52
              Top = 1
              Width = 130
              Height = 97
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              DesignSize = (
                130
                97)
              object DBRma: TUniDBEdit
                Left = 3
                Top = 10
                Width = 125
                Height = 21
                Cursor = crArrow
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ShowHint = True
                ParentShowHint = False
                DataField = 'RMANO'
                DataSource = Srcheader
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
              end
              object DBEdit1: TUniDBEdit
                Left = 3
                Top = 34
                Width = 125
                Height = 21
                Cursor = crArrow
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ShowHint = True
                ParentShowHint = False
                DataField = 'RMA_DATE'
                DataSource = Srcheader
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
              end
              object DBEdit2: TUniDBEdit
                Left = 3
                Top = 58
                Width = 125
                Height = 21
                Cursor = crArrow
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ShowHint = True
                ParentShowHint = False
                DataField = 'RMA_SUFFIX'
                DataSource = Srcheader
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
              end
            end
          end
          object PnlHeaderClient03: TUniPanel
            Tag = 1999
            Left = 188
            Top = 1
            Width = 679
            Height = 99
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object Splitter6: TUniSplitter
              Left = 72
              Top = 1
              Width = 4
              Height = 97
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object PnlHeaderLeft02: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 71
              Height = 97
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              object Label2: TUniLabel
                Left = 8
                Top = 13
                Width = 46
                Height = 13
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Customer'
                TabOrder = 1
              end
              object Label5: TUniLabel
                Left = 8
                Top = 37
                Width = 28
                Height = 13
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Notes'
                TabOrder = 2
              end
              object Label17: TUniLabel
                Left = 8
                Top = 61
                Width = 57
                Height = 13
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Archived By'
                TabOrder = 3
              end
            end
            object PnlHeaderClient02: TUniPanel
              Tag = 1999
              Left = 76
              Top = 1
              Width = 602
              Height = 97
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              DesignSize = (
                602
                97)
              object DBEdit3: TUniDBEdit
                Left = 3
                Top = 10
                Width = 607
                Height = 21
                Cursor = crArrow
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ShowHint = True
                ParentShowHint = False
                DataField = 'ARCUSTO_COMPANY'
                DataSource = Srcheader
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
              end
              object DBEdit4: TUniDBEdit
                Left = 3
                Top = 34
                Width = 607
                Height = 21
                Cursor = crArrow
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ShowHint = True
                ParentShowHint = False
                DataField = 'NOTES'
                DataSource = Srcheader
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
              end
              object DBEdit5: TUniDBEdit
                Left = 3
                Top = 58
                Width = 149
                Height = 21
                Cursor = crArrow
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ShowHint = True
                ParentShowHint = False
                DataField = 'ARCHIVED_BY'
                DataSource = Srcheader
                TabOrder = 2
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
              end
            end
          end
        end
      end
      object TabGrid: TUniTabSheet
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'TabGrid'
        object GridRma: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 868
          Height = 101
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 651
          IQComponents.Grid.Height = 15
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = Srcheader
          IQComponents.Grid.LoadMask.Message = 'Loading data...'
          IQComponents.Grid.Align = alClient
          IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
          IQComponents.Grid.TabOrder = 0
          IQComponents.Navigator.Left = 410
          IQComponents.Navigator.Top = 0
          IQComponents.Navigator.Width = 241
          IQComponents.Navigator.Height = 25
          IQComponents.Navigator.Hint = ''
          IQComponents.Navigator.ShowHint = True
          IQComponents.Navigator.DataSource = Srcheader
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 651
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 15
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = Srcheader
          Columns = <
            item
              FieldName = 'RMANO'
              Title.Caption = 'RMA#'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'RMA_SUFFIX'
              Title.Caption = 'RMA Suffix'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'RMA_DATE'
              Title.Caption = 'Date'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'NOTES'
              Title.Caption = 'Notes'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ARCHIVED_BY'
              Title.Caption = 'Archived By'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ARCUSTO_COMPANY'
              Title.Caption = 'ARCUSTO_COMPANY'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ARCUSTO_CUSTNO'
              Title.Caption = 'Cust#'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EPLANT_ID'
              Title.Caption = 'EPlant ID'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 161
    Width = 878
    Height = 228
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = 'Panel2'
    object PnlDetailPcCarrier: TUniPanel
      Tag = 1999
      Left = 1
      Top = 28
      Width = 876
      Height = 199
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object PCDtl: TUniPageControl
        Left = 1
        Top = 1
        Width = 874
        Height = 197
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ActivePage = TabDtlGrid
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object TabDtlForm: TUniTabSheet
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'TabDtlForm'
          object pcDetail: TUniPageControl
            Left = 0
            Top = 0
            Width = 866
            Height = 169
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ActivePage = TabGeneral
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            object TabGeneral: TUniTabSheet
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'General'
              object Splitter3: TUniSplitter
                Left = 496
                Top = 0
                Width = 4
                Height = 141
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alRight
                ParentColor = False
                Color = clBtnFace
              end
              object Panel7: TUniPanel
                Left = 500
                Top = 0
                Width = 358
                Height = 141
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alRight
                Anchors = [akTop, akRight, akBottom]
                TabOrder = 0
                Caption = ''
                object Splitter8: TUniSplitter
                  Left = 106
                  Top = 1
                  Width = 4
                  Height = 139
                  Hint = ''
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Align = alLeft
                  ParentColor = False
                  Color = clBtnFace
                end
                object PnlDetailGeneralClient02: TUniPanel
                  Left = 110
                  Top = 1
                  Width = 247
                  Height = 139
                  Hint = ''
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 0
                  Caption = ''
                  object DBEdit7: TUniDBEdit
                    Left = 3
                    Top = 0
                    Width = 114
                    Height = 21
                    Hint = ''
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataField = 'QTYRETURNED'
                    DataSource = Srcdtl
                    TabOrder = 0
                    TabStop = False
                    Color = clBtnFace
                    ReadOnly = True
                  end
                  object DBEdit8: TUniDBEdit
                    Left = 3
                    Top = 48
                    Width = 114
                    Height = 21
                    Hint = ''
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataField = 'RETURN_CODE_CODE'
                    DataSource = Srcdtl
                    TabOrder = 1
                    TabStop = False
                    Color = clBtnFace
                    ReadOnly = True
                  end
                  object edUom: TUniDBEdit
                    Left = 121
                    Top = 0
                    Width = 43
                    Height = 21
                    Hint = ''
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataField = 'UNIT'
                    DataSource = Srcdtl
                    TabOrder = 2
                    TabStop = False
                    Color = clBtnFace
                    ReadOnly = True
                  end
                  object EditReturned: TUniDBEdit
                    Left = 3
                    Top = 24
                    Width = 114
                    Height = 21
                    Hint = ''
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataField = 'QTY_RECEIVED'
                    DataSource = Srcdtl
                    TabOrder = 3
                    TabStop = False
                    Color = clBtnFace
                    ReadOnly = True
                  end
                end
                object PnlDetailGeneralLeft02: TUniPanel
                  Left = 1
                  Top = 1
                  Width = 105
                  Height = 139
                  Hint = ''
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Align = alLeft
                  Anchors = [akLeft, akTop, akBottom]
                  TabOrder = 1
                  Caption = ''
                  object Label7: TUniLabel
                    Left = 8
                    Top = 3
                    Width = 91
                    Height = 13
                    Hint = ''
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    Caption = 'Quantity to Return'
                    TabOrder = 1
                  end
                  object Label8: TUniLabel
                    Left = 8
                    Top = 51
                    Width = 61
                    Height = 13
                    Hint = ''
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    Caption = 'Return Code'
                    TabOrder = 2
                  end
                  object Label13: TUniLabel
                    Left = 8
                    Top = 27
                    Width = 45
                    Height = 13
                    Hint = ''
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    Caption = 'Returned'
                    TabOrder = 3
                  end
                end
              end
              object PnlDetailGeneralLeft03: TUniPanel
                Left = 0
                Top = 0
                Width = 496
                Height = 141
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                object Splitter7: TUniSplitter
                  Left = 91
                  Top = 1
                  Width = 6
                  Height = 139
                  Hint = ''
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Align = alLeft
                  ParentColor = False
                  Color = clBtnFace
                end
                object PnlDetailGeneralLeft01: TUniPanel
                  Left = 1
                  Top = 1
                  Width = 90
                  Height = 139
                  Hint = ''
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Align = alLeft
                  Anchors = [akLeft, akTop, akBottom]
                  TabOrder = 0
                  Caption = ''
                  object Label4: TUniLabel
                    Left = 8
                    Top = 3
                    Width = 33
                    Height = 13
                    Hint = ''
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    Caption = 'Item #'
                    TabOrder = 1
                  end
                  object Label6: TUniLabel
                    Left = 8
                    Top = 27
                    Width = 53
                    Height = 13
                    Hint = ''
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    Caption = 'Description'
                    TabOrder = 2
                  end
                  object Label15: TUniLabel
                    Left = 8
                    Top = 75
                    Width = 40
                    Height = 13
                    Hint = ''
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    Caption = 'Revision'
                    TabOrder = 3
                  end
                  object Label9: TUniLabel
                    Left = 8
                    Top = 51
                    Width = 76
                    Height = 13
                    Hint = ''
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    Caption = 'Ext. Description'
                    TabOrder = 4
                  end
                end
                object PnlDetailGeneralClient01: TUniPanel
                  Left = 97
                  Top = 1
                  Width = 398
                  Height = 139
                  Hint = ''
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 1
                  Caption = ''
                  DesignSize = (
                    398
                    139)
                  object DBItemNo: TUniDBEdit
                    Left = 3
                    Top = 0
                    Width = 407
                    Height = 21
                    Hint = ''
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataField = 'ARINVT_ITEMNO'
                    DataSource = Srcdtl
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 0
                    TabStop = False
                    Color = clBtnFace
                    ReadOnly = True
                  end
                  object DBDescrip: TUniDBEdit
                    Left = 3
                    Top = 24
                    Width = 407
                    Height = 21
                    Hint = ''
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataField = 'DESCRIPTION'
                    DataSource = Srcdtl
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    TabStop = False
                    Color = clBtnFace
                    ReadOnly = True
                  end
                  object dbRev: TUniDBEdit
                    Left = 3
                    Top = 72
                    Width = 407
                    Height = 21
                    Hint = ''
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataField = 'ARINVT_REV'
                    DataSource = Srcdtl
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    TabStop = False
                    Color = clBtnFace
                    ReadOnly = True
                  end
                  object DBEdit6: TUniDBEdit
                    Left = 3
                    Top = 48
                    Width = 407
                    Height = 21
                    Hint = ''
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataField = 'ARINVT_DESCRIP2'
                    DataSource = Srcdtl
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 3
                    TabStop = False
                    Color = clBtnFace
                    ReadOnly = True
                  end
                end
              end
            end
            object TabReason: TUniTabSheet
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              ImageIndex = 1
              Caption = 'Reason'
              object DBMemo1: TUniDBMemo
                Left = 0
                Top = 0
                Width = 858
                Height = 141
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                DataField = 'MISC_REASON'
                DataSource = Srcdtl
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
                Color = clBtnFace
              end
            end
            object TabUser: TUniTabSheet
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              ImageIndex = 2
              Caption = 'User Fields'
              object PnlUD: TUniPanel
                Left = 0
                Top = 0
                Width = 858
                Height = 141
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
                Caption = ''
                object Splitter9: TUniSplitter
                  Left = 71
                  Top = 1
                  Width = 4
                  Height = 139
                  Hint = ''
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Align = alLeft
                  ParentColor = False
                  Color = clBtnFace
                end
                object PnlUDLeft: TUniPanel
                  Left = 1
                  Top = 1
                  Width = 70
                  Height = 139
                  Hint = ''
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Align = alLeft
                  Anchors = [akLeft, akTop, akBottom]
                  TabOrder = 0
                  Caption = ''
                  object Label14: TUniLabel
                    Left = 8
                    Top = 13
                    Width = 56
                    Height = 13
                    Hint = ''
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    Caption = 'User Text 1'
                    TabOrder = 1
                  end
                  object Label18: TUniLabel
                    Left = 8
                    Top = 38
                    Width = 56
                    Height = 13
                    Hint = ''
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    Caption = 'User Text 2'
                    TabOrder = 2
                  end
                  object Label19: TUniLabel
                    Left = 8
                    Top = 62
                    Width = 56
                    Height = 13
                    Hint = ''
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    Caption = 'User Text 3'
                    TabOrder = 3
                  end
                end
                object PnlUDClient: TUniPanel
                  Left = 75
                  Top = 1
                  Width = 782
                  Height = 139
                  Hint = ''
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 1
                  Caption = ''
                  DesignSize = (
                    782
                    139)
                  object DBEdit12: TUniDBEdit
                    Left = 3
                    Top = 10
                    Width = 749
                    Height = 21
                    Hint = ''
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataField = 'CUSER1'
                    DataSource = Srcdtl
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 0
                    TabStop = False
                    Color = clBtnFace
                    ReadOnly = True
                  end
                  object DBEdit13: TUniDBEdit
                    Left = 3
                    Top = 59
                    Width = 749
                    Height = 21
                    Hint = ''
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataField = 'CUSER2'
                    DataSource = Srcdtl
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    TabStop = False
                    Color = clBtnFace
                    ReadOnly = True
                  end
                  object DBEdit14: TUniDBEdit
                    Left = 3
                    Top = 35
                    Width = 749
                    Height = 21
                    Hint = ''
                    Margins.Left = 4
                    Margins.Top = 4
                    Margins.Right = 4
                    Margins.Bottom = 4
                    DataField = 'CUSER3'
                    DataSource = Srcdtl
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    TabStop = False
                    Color = clBtnFace
                    ReadOnly = True
                  end
                end
              end
            end
          end
        end
        object TabDtlGrid: TUniTabSheet
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'TabDtlGrid'
          object GridDtl: TIQUniGridControl
            Left = 0
            Top = 0
            Width = 866
            Height = 169
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 649
            IQComponents.Grid.Height = 83
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = Srcdtl
            IQComponents.Grid.LoadMask.Message = 'Loading data...'
            IQComponents.Grid.Align = alClient
            IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
            IQComponents.Grid.TabOrder = 0
            IQComponents.Navigator.Left = 410
            IQComponents.Navigator.Top = 0
            IQComponents.Navigator.Width = 241
            IQComponents.Navigator.Height = 25
            IQComponents.Navigator.Hint = ''
            IQComponents.Navigator.ShowHint = True
            IQComponents.Navigator.DataSource = Srcdtl
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 649
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 83
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = Srcdtl
            Columns = <
              item
                FieldName = 'QTYRETURNED'
                Title.Caption = 'Quantity to Return'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'MISC_REASON'
                Title.Caption = 'Reason'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'ARINVT_ITEMNO'
                Title.Caption = 'Item #'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'ARINVT_REV'
                Title.Caption = 'Revision'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DESCRIPTION'
                Title.Caption = 'Description'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'RETURN_CODE_CODE'
                Title.Caption = 'Return Code'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'UNIT'
                Title.Caption = 'UOM'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'QTY_RECEIVED'
                Title.Caption = 'Quantity Returned'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'CUSER1'
                Title.Caption = 'User Text 1'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'CUSER2'
                Title.Caption = 'User Text 2'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'CUSER3'
                Title.Caption = 'User Text 3'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'ARINVT_DESCRIP2'
                Title.Caption = 'Ext. Description'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end>
            Marker = 0
          end
        end
      end
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 876
      Height = 27
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object SBToggleDtl: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Toggle Table/Form'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000A0860100A08601000001000000000000000000001212
          1200282828003E3E3E006A6A6A006F6F6F00800000008B09020097130300A21C
          0500AA230600AD250700B52C0800B92F0900C0340A00C4380A00CA3D0B00CF41
          0C00D5460D00D8511900DA5A2400DD663100E06E3A00E37C4900E5825000F08C
          6800E9916100EA966700EFAB7E00FF00FF00808080008A8A8A008F8F8F009494
          9400999999009F9F9F00A4A4A400A9A9A900ADADAD00AEAEAE00B0B0B000B3B3
          B300B4B4B400B7B7B700B8B8B800BABABA00BDBDBD00F4BF9400FAD3AA00C0C0
          C000C2C2C200C3C3C300C6C6C600C8C8C800C9C9C900CDCDCD00E0E0E000F9F9
          FB00FFFFFF000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000001D1D1D1D0505
          050505050505050505051D1D1D1D0505050505050505050505051D1D1D1D1E2C
          29272524232221201F051D1D1D1D1E2C29272524232221201F051D1D1D1D1E2E
          2C2927250302010020051D1D1D1D1E2E2C2927250302010020051D1D1D1D1E32
          2E2C29271E3A3A0021051D1D1D1D1E322E2C29271E3A3A0021051D1D1D1D1E35
          2A2004291E1E1E1E22051D1D1D1D1E352A2004291E1E1E1E22051D1D1D1D1E37
          35322E2C2927252423051D1D1D1D1E3735322E2C2927252423051E1E1E1E1A17
          1513110F0D0B090807061E1E1E1E211E050403030303030202021E3838381A19
          191919191919191919061E3838382120202020202020202020021E3939391A17
          1513110F0D0B090807061E393939211E050403030303030202021E393331392D
          2B392826391E1D1D1D1D1E393331392D2B392826391E1D1D1D1D1E3939393939
          39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D1E3936343931
          2E392B2A391E1D1D1D1D1E39363439312E392B2A391E1D1D1D1D1E3939393939
          39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D302F1C1B1816
          1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D301919191919
          19191919190A1D1D1D1D3720202020202020202020031D1D1D1D302F1C1B1816
          1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D}
        Caption = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentColor = False
        Color = clWindow
        OnClick = SBToggleDtlClick
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 393
    Width = 878
    Height = 259
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    Caption = 'Panel3'
    object PnlCheckPCCarrier: TUniPanel
      Tag = 1999
      Left = 1
      Top = 28
      Width = 876
      Height = 230
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object PCRec: TUniPageControl
        Tag = 1
        Left = 1
        Top = 1
        Width = 874
        Height = 228
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ActivePage = TabRecGrid
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object TabRecForm: TUniTabSheet
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'TabCheckForm'
          object PnlCheck: TUniPanel
            Tag = 1999
            Left = 0
            Top = 0
            Width = 866
            Height = 200
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object Splitter11: TUniSplitter
              Left = 258
              Top = 1
              Width = 4
              Height = 198
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object PnlCheckLeft03: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 257
              Height = 198
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              object Splitter10: TUniSplitter
                Left = 104
                Top = 1
                Width = 6
                Height = 196
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alLeft
                ParentColor = False
                Color = clBtnFace
              end
              object PnlCheckLeft01: TUniPanel
                Tag = 1999
                Left = 1
                Top = 1
                Width = 103
                Height = 196
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 0
                Caption = ''
                object Label10: TUniLabel
                  Left = 8
                  Top = 13
                  Width = 89
                  Height = 13
                  Hint = ''
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Quantity Received'
                  TabOrder = 1
                end
                object Label11: TUniLabel
                  Left = 8
                  Top = 34
                  Width = 70
                  Height = 13
                  Hint = ''
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Date Received'
                  TabOrder = 2
                end
              end
              object PnlCheckClient01: TUniPanel
                Tag = 1999
                Left = 110
                Top = 1
                Width = 146
                Height = 196
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                DesignSize = (
                  146
                  196)
                object DBEdit10: TUniDBEdit
                  Left = 3
                  Top = 10
                  Width = 142
                  Height = 21
                  Cursor = crArrow
                  Hint = ''
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  DataField = 'QTY_RECEIVED'
                  DataSource = SrcRec
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 0
                  TabStop = False
                  Color = clBtnFace
                  ReadOnly = True
                end
                object DBEdit11: TUniDBEdit
                  Left = 3
                  Top = 34
                  Width = 142
                  Height = 21
                  Cursor = crArrow
                  Hint = ''
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  DataField = 'DATE_RECEIVED'
                  DataSource = SrcRec
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                  TabStop = False
                  Color = clBtnFace
                  ReadOnly = True
                end
              end
            end
            object PnlCheckClient03: TUniPanel
              Tag = 1999
              Left = 262
              Top = 1
              Width = 603
              Height = 198
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              object Splitter12: TUniSplitter
                Left = 93
                Top = 1
                Width = 4
                Height = 196
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alLeft
                ParentColor = False
                Color = clBtnFace
              end
              object PnlCheckLeft02: TUniPanel
                Tag = 1999
                Left = 1
                Top = 1
                Width = 92
                Height = 196
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 0
                Caption = ''
                object Label12: TUniLabel
                  Left = 8
                  Top = 13
                  Width = 78
                  Height = 13
                  Hint = ''
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Disposition Type'
                  TabOrder = 1
                end
                object lblRejCode: TUniLabel
                  Left = 8
                  Top = 37
                  Width = 73
                  Height = 13
                  Hint = ''
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Rejection Code'
                  TabOrder = 2
                end
                object Label20: TUniLabel
                  Left = 8
                  Top = 61
                  Width = 45
                  Height = 13
                  Hint = ''
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  Caption = 'Comment'
                  TabOrder = 3
                end
              end
              object PnlCheckClient02: TUniPanel
                Tag = 1999
                Left = 97
                Top = 1
                Width = 505
                Height = 196
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                DesignSize = (
                  505
                  196)
                object EditDispType: TUniDBEdit
                  Left = 3
                  Top = 10
                  Width = 169
                  Height = 21
                  Cursor = crArrow
                  Hint = ''
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  DataField = 'DISPOSITION_TYPE'
                  DataSource = SrcRec
                  TabOrder = 0
                  TabStop = False
                  Color = clBtnFace
                  ReadOnly = True
                end
                object DBEdit9: TUniDBEdit
                  Left = 3
                  Top = 34
                  Width = 169
                  Height = 21
                  Cursor = crArrow
                  Hint = ''
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  DataField = 'REJECT_CODE'
                  DataSource = SrcRec
                  TabOrder = 1
                  TabStop = False
                  Color = clBtnFace
                  ReadOnly = True
                end
                object DBEdit15: TUniDBEdit
                  Left = 3
                  Top = 58
                  Width = 470
                  Height = 21
                  Cursor = crArrow
                  Hint = ''
                  Margins.Left = 4
                  Margins.Top = 4
                  Margins.Right = 4
                  Margins.Bottom = 4
                  DataField = 'COMMENT1'
                  DataSource = SrcRec
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 2
                  TabStop = False
                  Color = clBtnFace
                  ReadOnly = True
                end
              end
            end
          end
        end
        object TabRecGrid: TUniTabSheet
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'TabCheckGrid'
          object GridRec: TIQUniGridControl
            Left = 0
            Top = 0
            Width = 866
            Height = 200
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 649
            IQComponents.Grid.Height = 114
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = SrcRec
            IQComponents.Grid.LoadMask.Message = 'Loading data...'
            IQComponents.Grid.Align = alClient
            IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
            IQComponents.Grid.TabOrder = 0
            IQComponents.Navigator.Left = 410
            IQComponents.Navigator.Top = 0
            IQComponents.Navigator.Width = 241
            IQComponents.Navigator.Height = 25
            IQComponents.Navigator.Hint = ''
            IQComponents.Navigator.ShowHint = True
            IQComponents.Navigator.DataSource = SrcRec
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 649
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 114
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = SrcRec
            Columns = <
              item
                FieldName = 'QTY_RECEIVED'
                Title.Caption = 'Qty. Received'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DATE_RECEIVED'
                Title.Caption = 'Date Received'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DISPOSITION_TYPE'
                Title.Caption = 'Disp. Type'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'REJECT_CODE'
                Title.Caption = 'Rejection Code'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'COMMENT1'
                Title.Caption = 'Comment'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end>
            Marker = 0
          end
        end
      end
    end
    object Panel5: TUniPanel
      Left = 1
      Top = 1
      Width = 876
      Height = 27
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object SBToggleRec: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Toggle Table/Form'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000A0860100A08601000001000000000000000000001212
          1200282828003E3E3E006A6A6A006F6F6F00800000008B09020097130300A21C
          0500AA230600AD250700B52C0800B92F0900C0340A00C4380A00CA3D0B00CF41
          0C00D5460D00D8511900DA5A2400DD663100E06E3A00E37C4900E5825000F08C
          6800E9916100EA966700EFAB7E00FF00FF00808080008A8A8A008F8F8F009494
          9400999999009F9F9F00A4A4A400A9A9A900ADADAD00AEAEAE00B0B0B000B3B3
          B300B4B4B400B7B7B700B8B8B800BABABA00BDBDBD00F4BF9400FAD3AA00C0C0
          C000C2C2C200C3C3C300C6C6C600C8C8C800C9C9C900CDCDCD00E0E0E000F9F9
          FB00FFFFFF000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000001D1D1D1D0505
          050505050505050505051D1D1D1D0505050505050505050505051D1D1D1D1E2C
          29272524232221201F051D1D1D1D1E2C29272524232221201F051D1D1D1D1E2E
          2C2927250302010020051D1D1D1D1E2E2C2927250302010020051D1D1D1D1E32
          2E2C29271E3A3A0021051D1D1D1D1E322E2C29271E3A3A0021051D1D1D1D1E35
          2A2004291E1E1E1E22051D1D1D1D1E352A2004291E1E1E1E22051D1D1D1D1E37
          35322E2C2927252423051D1D1D1D1E3735322E2C2927252423051E1E1E1E1A17
          1513110F0D0B090807061E1E1E1E211E050403030303030202021E3838381A19
          191919191919191919061E3838382120202020202020202020021E3939391A17
          1513110F0D0B090807061E393939211E050403030303030202021E393331392D
          2B392826391E1D1D1D1D1E393331392D2B392826391E1D1D1D1D1E3939393939
          39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D1E3936343931
          2E392B2A391E1D1D1D1D1E39363439312E392B2A391E1D1D1D1D1E3939393939
          39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D302F1C1B1816
          1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D301919191919
          19191919190A1D1D1D1D3720202020202020202020031D1D1D1D302F1C1B1816
          1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D}
        Caption = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentColor = False
        Color = clWindow
        OnClick = SBToggleRecClick
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 80
    object File1: TUniMenuItem
      Caption = '&File'
      object Search1: TUniMenuItem
        Caption = '&Search'
        OnClick = SBSearchClick
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = '&Close'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object Srcheader: TDataSource
    DataSet = QryHeader
    Left = 316
    Top = 82
  end
  object QryHeader: TFDQuery
    BeforeOpen = QryHeaderBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       rmano,'
      '       arcusto_id,'
      '       rma_date,'
      '       userid,'
      '       notes,'
      '       eplant_id,'
      '       rma_suffix,'
      '       approved_by,'
      '       rma_id,'
      '       archived_by,'
      '       arcusto_company,'
      '       arcusto_custno,'
      '       arcusto_addr1,'
      '       arcusto_addr2,'
      '       arcusto_addr3,'
      '       arcusto_city,'
      '       arcusto_state,'
      '       arcusto_country,'
      '       arcusto_zip,'
      '       to_invoice'
      '  from rma_hist'
      ' ')
    Left = 328
    Top = 82
    object QryHeaderRMANO: TStringField
      DisplayLabel = 'RMA#'
      DisplayWidth = 7
      FieldName = 'RMANO'
      Origin = 'IQ.RMA_HIST.RMANO'
      Size = 15
    end
    object QryHeaderRMA_SUFFIX: TStringField
      DisplayLabel = 'RMA Suffix'
      DisplayWidth = 10
      FieldName = 'RMA_SUFFIX'
      Origin = 'RMA_HIST.RMA_SUFFIX'
      Size = 50
    end
    object QryHeaderRMA_DATE: TDateTimeField
      DisplayLabel = 'Date'
      DisplayWidth = 10
      FieldName = 'RMA_DATE'
      Origin = 'RMA_HIST.RMA_DATE'
    end
    object QryHeaderNOTES: TStringField
      DisplayLabel = 'Notes'
      DisplayWidth = 28
      FieldName = 'NOTES'
      Origin = 'RMA_HIST.NOTES'
      Size = 255
    end
    object QryHeaderARCHIVED_BY: TStringField
      DisplayLabel = 'Archived By'
      DisplayWidth = 35
      FieldName = 'ARCHIVED_BY'
      Origin = 'RMA_HIST.ARCHIVED_BY'
      Size = 35
    end
    object QryHeaderARCUSTO_COMPANY: TStringField
      DisplayWidth = 30
      FieldName = 'ARCUSTO_COMPANY'
      Origin = 'RMA_HIST.ARCUSTO_COMPANY'
      Size = 60
    end
    object QryHeaderARCUSTO_CUSTNO: TStringField
      DisplayLabel = 'Cust#'
      DisplayWidth = 10
      FieldName = 'ARCUSTO_CUSTNO'
      Origin = 'RMA_HIST.ARCUSTO_CUSTNO'
      Size = 10
    end
    object QryHeaderEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'RMA_HIST.EPLANT_ID'
      Size = 0
    end
    object QryHeaderID: TBCDField
      FieldName = 'ID'
      Origin = 'RMA_HIST.ID'
      Visible = False
      Size = 0
    end
    object QryHeaderARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Origin = 'RMA_HIST.ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object QryHeaderUSERID: TStringField
      FieldName = 'USERID'
      Origin = 'RMA_HIST.USERID'
      Visible = False
      Size = 35
    end
    object QryHeaderAPPROVED_BY: TStringField
      FieldName = 'APPROVED_BY'
      Origin = 'RMA_HIST.APPROVED_BY'
      Visible = False
      Size = 35
    end
    object QryHeaderRMA_ID: TBCDField
      FieldName = 'RMA_ID'
      Origin = 'RMA_HIST.RMA_ID'
      Visible = False
      Size = 0
    end
    object QryHeaderARCUSTO_ADDR1: TStringField
      FieldName = 'ARCUSTO_ADDR1'
      Origin = 'RMA_HIST.ARCUSTO_ADDR1'
      Visible = False
      Size = 60
    end
    object QryHeaderARCUSTO_ADDR2: TStringField
      FieldName = 'ARCUSTO_ADDR2'
      Origin = 'RMA_HIST.ARCUSTO_ADDR2'
      Visible = False
      Size = 60
    end
    object QryHeaderARCUSTO_ADDR3: TStringField
      FieldName = 'ARCUSTO_ADDR3'
      Origin = 'RMA_HIST.ARCUSTO_ADDR3'
      Visible = False
      Size = 60
    end
    object QryHeaderARCUSTO_CITY: TStringField
      FieldName = 'ARCUSTO_CITY'
      Origin = 'RMA_HIST.ARCUSTO_CITY'
      Visible = False
      Size = 30
    end
    object QryHeaderARCUSTO_STATE: TStringField
      FieldName = 'ARCUSTO_STATE'
      Origin = 'RMA_HIST.ARCUSTO_STATE'
      Visible = False
    end
    object QryHeaderARCUSTO_COUNTRY: TStringField
      FieldName = 'ARCUSTO_COUNTRY'
      Origin = 'RMA_HIST.ARCUSTO_COUNTRY'
      Visible = False
      Size = 30
    end
    object QryHeaderARCUSTO_ZIP: TStringField
      FieldName = 'ARCUSTO_ZIP'
      Origin = 'RMA_HIST.ARCUSTO_ZIP'
      Visible = False
      Size = 10
    end
    object QryHeaderTO_INVOICE: TStringField
      FieldName = 'TO_INVOICE'
      Origin = 'RMA_HIST.TO_INVOICE'
      Visible = False
      Size = 1
    end
  end
  object Srcdtl: TDataSource
    DataSet = QryDtl
    Left = 364
    Top = 82
  end
  object QryDtl: TFDQuery
    MasterSource = Srcheader
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select r.id,'
      '       r.rma_hist_id,'
      '       r.rma_detail_id,'
      '       r.arinvt_id,'
      '       r.arinvt_class,'
      '       r.arinvt_itemno,'
      '       r.arinvt_rev,'
      '       r.arinvt_descrip,'
      '       r.arinvt_descrip2,'
      '       r.shipment_dtl_id,'
      '       r.qtyreturned,'
      '       r.return_code_id,'
      '       r.misc_reason,'
      '       r.return_code_code,'
      '       r.return_code_description,'
      '       r.return_code_code_type,'
      '       r.misc_item,'
      '       r.unit,'
      
        '       Decode(NVL(r.arinvt_id, 0), 0, r.misc_item, r.arinvt_desc' +
        'rip) as description,'
      '       v.qty_received,'
      '       r.cuser1,'
      '       r.cuser2,'
      '       r.cuser3,'
      '       NVL(so_updated, '#39'N'#39') as so_updated'
      '  from rma_detail_hist r,'
      '       (select rma_detail_hist_id,'
      '               sum(qty_received) as qty_received'
      '          from rma_receipts_hist'
      '      group by rma_detail_hist_id) v'
      ' where rma_hist_id = :ID'
      '   and r.id = v.rma_detail_hist_id(+)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 376
    Top = 82
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 10000c
      end>
    object QryDtlQTYRETURNED: TFMTBCDField
      DisplayLabel = 'Quantity to Return'
      DisplayWidth = 10
      FieldName = 'QTYRETURNED'
      Size = 6
    end
    object QryDtlMISC_REASON: TStringField
      DisplayLabel = 'Reason'
      DisplayWidth = 20
      FieldName = 'MISC_REASON'
      Size = 4000
    end
    object QryDtlARINVT_ITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ARINVT_ITEMNO'
      Size = 50
    end
    object QryDtlARINVT_REV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 15
      FieldName = 'ARINVT_REV'
      Size = 15
    end
    object QryDtlDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIPTION'
      Size = 250
    end
    object QryDtlRETURN_CODE_CODE: TStringField
      DisplayLabel = 'Return Code'
      DisplayWidth = 10
      FieldName = 'RETURN_CODE_CODE'
      Size = 10
    end
    object QryDtlUNIT: TStringField
      DisplayLabel = 'UOM'
      DisplayWidth = 10
      FieldName = 'UNIT'
      Size = 10
    end
    object QryDtlQTY_RECEIVED: TFMTBCDField
      DisplayLabel = 'Quantity Returned'
      DisplayWidth = 10
      FieldName = 'QTY_RECEIVED'
      Size = 38
    end
    object QryDtlCUSER1: TStringField
      DisplayLabel = 'User Text 1'
      DisplayWidth = 20
      FieldName = 'CUSER1'
      Size = 60
    end
    object QryDtlCUSER2: TStringField
      DisplayLabel = 'User Text 2'
      DisplayWidth = 20
      FieldName = 'CUSER2'
      Size = 60
    end
    object QryDtlCUSER3: TStringField
      DisplayLabel = 'User Text 3'
      DisplayWidth = 20
      FieldName = 'CUSER3'
      Size = 60
    end
    object QryDtlARINVT_DESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 100
      FieldName = 'ARINVT_DESCRIP2'
      Size = 100
    end
    object QryDtlID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryDtlRMA_HIST_ID: TBCDField
      FieldName = 'RMA_HIST_ID'
      Visible = False
      Size = 0
    end
    object QryDtlRMA_DETAIL_ID: TBCDField
      FieldName = 'RMA_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object QryDtlARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryDtlARINVT_CLASS: TStringField
      FieldName = 'ARINVT_CLASS'
      Visible = False
      Size = 2
    end
    object QryDtlARINVT_DESCRIP: TStringField
      FieldName = 'ARINVT_DESCRIP'
      Visible = False
      Size = 100
    end
    object QryDtlSHIPMENT_DTL_ID: TBCDField
      FieldName = 'SHIPMENT_DTL_ID'
      Visible = False
      Size = 0
    end
    object QryDtlRETURN_CODE_ID: TBCDField
      FieldName = 'RETURN_CODE_ID'
      Visible = False
      Size = 0
    end
    object QryDtlRETURN_CODE_DESCRIPTION: TStringField
      FieldName = 'RETURN_CODE_DESCRIPTION'
      Visible = False
      Size = 255
    end
    object QryDtlRETURN_CODE_CODE_TYPE: TStringField
      FieldName = 'RETURN_CODE_CODE_TYPE'
      Visible = False
      Size = 10
    end
    object QryDtlMISC_ITEM: TStringField
      FieldName = 'MISC_ITEM'
      Visible = False
      Size = 250
    end
    object QryDtlSO_UPDATED: TStringField
      DisplayWidth = 1
      FieldName = 'SO_UPDATED'
      Visible = False
      Size = 1
    end
  end
  object SrcRec: TDataSource
    DataSet = QryRec
    Left = 412
    Top = 82
  end
  object QryRec: TFDQuery
    MasterSource = Srcdtl
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       rma_detail_hist_id,'
      '       rma_receipts_id,'
      '       qty_received,'
      '       date_received,'
      '       userid,'
      '       shipment_dtl_id,'
      '       reject_code,'
      '       disposition_type,'
      '       comment1'
      '  from rma_receipts_hist'
      ' where rma_detail_hist_id = :ID')
    Left = 424
    Top = 82
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 10000c
      end>
    object QryRecQTY_RECEIVED: TFMTBCDField
      DisplayLabel = 'Qty. Received'
      DisplayWidth = 11
      FieldName = 'QTY_RECEIVED'
      Origin = 'RMA_RECEIPTS_HIST.QTY_RECEIVED'
      Size = 6
    end
    object QryRecDATE_RECEIVED: TDateTimeField
      DisplayLabel = 'Date Received'
      DisplayWidth = 18
      FieldName = 'DATE_RECEIVED'
      Origin = 'RMA_RECEIPTS_HIST.DATE_RECEIVED'
    end
    object QryRecDISPOSITION_TYPE: TStringField
      DisplayLabel = 'Disp. Type'
      DisplayWidth = 19
      FieldName = 'DISPOSITION_TYPE'
      Origin = 'RMA_RECEIPTS_HIST.DISPOSITION_TYPE'
      Size = 10
    end
    object QryRecREJECT_CODE: TStringField
      DisplayLabel = 'Rejection Code'
      DisplayWidth = 13
      FieldName = 'REJECT_CODE'
      Origin = 'RMA_RECEIPTS_HIST.REJECT_CODE'
      Size = 5
    end
    object QryRecCOMMENT1: TStringField
      DisplayLabel = 'Comment'
      DisplayWidth = 20
      FieldName = 'COMMENT1'
      Origin = 'IQ.RMA_RECEIPTS_HIST.COMMENT1'
      Size = 255
    end
    object QryRecID: TBCDField
      FieldName = 'ID'
      Origin = 'RMA_RECEIPTS_HIST.ID'
      Visible = False
      Size = 0
    end
    object QryRecRMA_DETAIL_HIST_ID: TBCDField
      FieldName = 'RMA_DETAIL_HIST_ID'
      Origin = 'RMA_RECEIPTS_HIST.RMA_DETAIL_HIST_ID'
      Visible = False
      Size = 0
    end
    object QryRecRMA_RECEIPTS_ID: TBCDField
      FieldName = 'RMA_RECEIPTS_ID'
      Origin = 'RMA_RECEIPTS_HIST.RMA_RECEIPTS_ID'
      Visible = False
      Size = 0
    end
    object QryRecUSERID: TStringField
      FieldName = 'USERID'
      Origin = 'RMA_RECEIPTS_HIST.USERID'
      Visible = False
      Size = 35
    end
    object QryRecSHIPMENT_DTL_ID: TBCDField
      FieldName = 'SHIPMENT_DTL_ID'
      Origin = 'RMA_RECEIPTS_HIST.SHIPMENT_DTL_ID'
      Visible = False
      Size = 0
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Archived RMAs'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 193710 $'
    BuildVersion = '176554'
    Left = 120
  end
  object PopupMenu1: TUniPopupMenu
    Left = 248
    object StandardSearch1: TUniMenuItem
      Caption = '&Standard Search'
      OnClick = SBSearchClick
    end
    object ExpandedSearch1: TUniMenuItem
      Caption = '&Expanded Search'
      OnClick = ExpandedSearch1Click
    end
  end
  object PKSearchEx: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select r.id as id,'
      '       r.rma_date as rma_date,'
      '       r.rmano as rmano,'
      '       r.arcusto_company as company,'
      '       r.arcusto_custno as custno,'
      '       r.eplant_id as eplant_id,'
      '       d.arinvt_id as arinvt_id,'
      '       d.shipment_dtl_id as shipment_dtl_id,'
      
        '       decode(d.arinvt_id, null, c.itemno, d.arinvt_itemno) as i' +
        'temno,'
      '       d.id as rma_detail_id'
      ' from rma_hist r,'
      '      rma_detail_hist d,'
      '      c_ship_hist c,'
      '      arinvt ar'
      ' where d.rma_hist_id = r.id'
      '   and c.shipment_dtl_id(+) = d.shipment_dtl_id'
      '   and ar.id(+) = d.arinvt_id'
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 472
    Top = 40
    object PKSearchExID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PKSearchExRMA_DATE: TDateTimeField
      DisplayLabel = 'Date'
      FieldName = 'RMA_DATE'
    end
    object PKSearchExCOMPANY: TStringField
      DisplayLabel = 'Customer'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PKSearchExCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PKSearchExEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PKSearchExARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object PKSearchExSHIPMENT_DTL_ID: TBCDField
      FieldName = 'SHIPMENT_DTL_ID'
      Visible = False
      Size = 0
    end
    object PKSearchExITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PKSearchExRMA_DETAIL_ID: TBCDField
      FieldName = 'RMA_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object PKSearchExRMANO: TStringField
      DisplayLabel = 'RMA #'
      FieldName = 'RMANO'
      Size = 15
    end
  end
  object PKSearch: TIQWebHpick
    BeforeOpen = PKSearchBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select r.id as id,'
      '       r.rma_date as rma_date,'
      '       r.rmano as rmano,'
      '       r.arcusto_company as company,'
      '       r.arcusto_custno as custno,'
      '       r.eplant_id as eplant_id'
      ' from rma_hist r'
      '           '
      '       '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 432
    Top = 40
    object PKSearchID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PKSearchRMA_DATE: TDateTimeField
      DisplayLabel = 'Date'
      FieldName = 'RMA_DATE'
    end
    object PKSearchCOMPANY: TStringField
      DisplayLabel = 'Customer'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PKSearchCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PKSearchEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'RMA.EPLANT_ID'
      Size = 0
    end
    object PKSearchRMANO: TStringField
      DisplayLabel = 'RMA #'
      FieldName = 'RMANO'
      Origin = 'IQ.RMA_HIST.RMANO'
      Size = 15
    end
  end
  object PopupMenu2: TUniPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 284
    Top = 65534
    object OrderInformation1: TUniMenuItem
      Caption = 'Order Information'
      OnClick = OrderInformation1Click
    end
  end
end
