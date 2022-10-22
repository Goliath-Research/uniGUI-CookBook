object FrmCustOrders: TFrmCustOrders
  Left = 291
  Top = 131
  HelpContext = 6260
  ClientHeight = 393
  ClientWidth = 582
  Caption = 'Customer Orders'
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 121
    Width = 582
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Splitter2: TUniSplitter
    Left = 0
    Top = 246
    Width = 582
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alBottom
    ParentColor = False
    Color = clBtnFace
  end
  object splitComment: TUniSplitter
    Left = 0
    Top = 338
    Width = 582
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alBottom
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 582
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object spSearchOrders: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Search Order'
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
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = spSearchOrdersClick
    end
    object sbtnToggleView: TUniSpeedButton
      Left = 26
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Toggle Grid/Form'
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
      ParentColor = False
      Color = clWindow
      OnClick = sbtnToggleViewClick
    end
    object dbNavigator1: TUniDBNavigator
      Left = 481
      Top = 1
      Width = 100
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcOrd
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      ConfirmDelete = False
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 27
    Width = 582
    Height = 94
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = 'Panel2'
    object PC: TUniPageControl
      Left = 1
      Top = 1
      Width = 580
      Height = 92
      Hint = ''
      ActivePage = TabForm
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabGrid: TUniTabSheet
        Hint = ''
        TabVisible = False
        Caption = 'TabGrid'
        object gridHeader: TUniDBGrid
          Left = 0
          Top = 0
          Width = 572
          Height = 64
          Hint = ''
          DataSource = SrcOrd
          LoadMask.Message = 'Loading data...'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          ParentColor = False
          Color = clBtnFace
          Columns = <
            item
              FieldName = 'ORDERNO'
              Title.Caption = 'Order #'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DATE_TAKEN'
              Title.Caption = 'Date Taken'
              Width = 112
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'BILLTO'
              Title.Caption = 'Bill To'
              Width = 104
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SHIPTO'
              Title.Caption = 'Ship To'
              Width = 104
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PONO'
              Title.Caption = 'PO #'
              Width = 56
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ORD_BY'
              Title.Caption = 'Ordered By'
              Width = 61
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
      end
      object TabForm: TUniTabSheet
        Hint = ''
        TabVisible = False
        Caption = 'TabForm'
        object gbOrders: TUniGroupBox
          Left = 0
          Top = 0
          Width = 572
          Height = 64
          Hint = ''
          Caption = ' Order # '
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          object Panel4: TUniPanel
            Left = 2
            Top = 15
            Width = 568
            Height = 47
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object Splitter4: TUniSplitter
              Left = 194
              Top = 1
              Width = 6
              Height = 45
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object Panel5: TUniPanel
              Left = 1
              Top = 1
              Width = 193
              Height = 45
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              object Splitter3: TUniSplitter
                Left = 90
                Top = 1
                Width = 6
                Height = 43
                Hint = ''
                Align = alLeft
                ParentColor = False
                Color = clBtnFace
              end
              object Panel7: TUniPanel
                Left = 1
                Top = 1
                Width = 89
                Height = 43
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 0
                Caption = ''
                object Label2: TUniLabel
                  Left = 7
                  Top = 4
                  Width = 67
                  Height = 13
                  Hint = ''
                  Caption = 'Customer #'
                  ParentFont = False
                  Font.Color = clNavy
                  Font.Style = [fsBold]
                  ParentColor = False
                  Color = clBtnFace
                  TabOrder = 1
                end
                object Label18: TUniLabel
                  Left = 8
                  Top = 26
                  Width = 23
                  Height = 13
                  Hint = ''
                  Caption = 'Date'
                  TabOrder = 2
                end
                object Label26: TUniLabel
                  Left = 8
                  Top = 47
                  Width = 44
                  Height = 13
                  Hint = ''
                  Caption = 'Taken By'
                  TabOrder = 3
                end
              end
              object Panel16: TUniPanel
                Left = 96
                Top = 1
                Width = 96
                Height = 43
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                DesignSize = (
                  96
                  43)
                object dbeOrderNo: TUniDBEdit
                  Left = 2
                  Top = 1
                  Width = 90
                  Height = 19
                  Cursor = crArrow
                  Hint = ''
                  ShowHint = True
                  ParentShowHint = False
                  DataField = 'CustNo'
                  DataSource = SrcOrd
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 0
                  Color = clBtnFace
                  ReadOnly = True
                end
                object dbeOrdBy: TUniDBEdit
                  Left = 2
                  Top = 46
                  Width = 90
                  Height = 19
                  Cursor = crArrow
                  Hint = ''
                  HelpContext = -7
                  DataField = 'ORD_BY'
                  DataSource = SrcOrd
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                  TabStop = False
                  Color = clBtnFace
                  ReadOnly = True
                end
                object editDate_Taken: TUniDBEdit
                  Left = 2
                  Top = 24
                  Width = 90
                  Height = 19
                  Cursor = crArrow
                  Hint = ''
                  HelpContext = -6
                  DataField = 'DATE_TAKEN'
                  DataSource = SrcOrd
                  MaxLength = 10
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 2
                  TabStop = False
                  Color = clBtnFace
                end
              end
            end
            object Panel8: TUniPanel
              Left = 200
              Top = 1
              Width = 367
              Height = 45
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              object Splitter5: TUniSplitter
                Left = 186
                Top = 1
                Width = 6
                Height = 43
                Hint = ''
                Align = alLeft
                ParentColor = False
                Color = clBtnFace
              end
              object Panel9: TUniPanel
                Left = 1
                Top = 1
                Width = 185
                Height = 43
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 0
                Caption = ''
                object Splitter6: TUniSplitter
                  Left = 58
                  Top = 1
                  Width = 6
                  Height = 41
                  Hint = ''
                  Align = alLeft
                  ParentColor = False
                  Color = clBtnFace
                end
                object Panel11: TUniPanel
                  Left = 1
                  Top = 1
                  Width = 57
                  Height = 41
                  Hint = ''
                  Align = alLeft
                  Anchors = [akLeft, akTop, akBottom]
                  TabOrder = 0
                  Caption = ''
                  object Label19: TUniLabel
                    Left = 6
                    Top = 4
                    Width = 37
                    Height = 13
                    Hint = ''
                    Caption = 'Bill To'
                    ParentFont = False
                    Font.Color = clNavy
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentColor = False
                    Color = clBtnFace
                    TabOrder = 1
                  end
                  object Label1: TUniLabel
                    Left = 6
                    Top = 26
                    Width = 25
                    Height = 13
                    Hint = ''
                    Caption = 'PO #'
                    TabOrder = 2
                  end
                  object Label4: TUniLabel
                    Left = 4
                    Top = 47
                    Width = 29
                    Height = 13
                    Hint = ''
                    Caption = 'Terms'
                    TabOrder = 3
                  end
                end
                object Panel15: TUniPanel
                  Left = 64
                  Top = 1
                  Width = 120
                  Height = 41
                  Hint = ''
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 1
                  Caption = ''
                  DesignSize = (
                    120
                    41)
                  object dbePO: TUniDBEdit
                    Left = 2
                    Top = 25
                    Width = 108
                    Height = 19
                    Cursor = crArrow
                    Hint = ''
                    HelpContext = -9
                    DataField = 'PONO'
                    DataSource = SrcOrd
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 0
                    Color = clBtnFace
                  end
                  object DBEdit1: TUniDBEdit
                    Left = 2
                    Top = 2
                    Width = 108
                    Height = 19
                    Cursor = crArrow
                    Hint = ''
                    DataField = 'BillTo'
                    DataSource = SrcOrd
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clBtnFace
                  end
                  object DBEdit2: TUniDBEdit
                    Left = 2
                    Top = 47
                    Width = 108
                    Height = 19
                    Cursor = crArrow
                    Hint = ''
                    DataField = 'Terms'
                    DataSource = SrcOrd
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    Color = clBtnFace
                  end
                end
              end
              object Panel12: TUniPanel
                Left = 192
                Top = 1
                Width = 174
                Height = 43
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                object Splitter7: TUniSplitter
                  Left = 60
                  Top = 1
                  Width = 6
                  Height = 41
                  Hint = ''
                  Align = alLeft
                  ParentColor = False
                  Color = clBtnFace
                end
                object Panel13: TUniPanel
                  Left = 1
                  Top = 1
                  Width = 59
                  Height = 41
                  Hint = ''
                  Align = alLeft
                  Anchors = [akLeft, akTop, akBottom]
                  TabOrder = 0
                  Caption = ''
                  object Label17: TUniLabel
                    Left = 3
                    Top = 4
                    Width = 45
                    Height = 13
                    Hint = ''
                    Caption = 'Ship To'
                    ParentFont = False
                    Font.Color = clNavy
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentColor = False
                    Color = clBtnFace
                    TabOrder = 1
                  end
                  object Label9: TUniLabel
                    Left = 3
                    Top = 27
                    Width = 37
                    Height = 13
                    Hint = ''
                    Caption = 'Ship Via'
                    TabOrder = 2
                  end
                  object Label6: TUniLabel
                    Left = 6
                    Top = 49
                    Width = 20
                    Height = 13
                    Hint = ''
                    Caption = 'FOB'
                    TabOrder = 3
                  end
                end
                object Panel14: TUniPanel
                  Left = 66
                  Top = 1
                  Width = 107
                  Height = 41
                  Hint = ''
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 1
                  Caption = ''
                  object DBEdit3: TUniDBEdit
                    Left = 3
                    Top = 1
                    Width = 113
                    Height = 19
                    Cursor = crArrow
                    Hint = ''
                    DataField = 'ShipTo'
                    DataSource = SrcOrd
                    TabOrder = 0
                    Color = clBtnFace
                  end
                  object DBEdit4: TUniDBEdit
                    Left = 3
                    Top = 24
                    Width = 113
                    Height = 19
                    Cursor = crArrow
                    Hint = ''
                    DataField = 'Freight'
                    DataSource = SrcOrd
                    TabOrder = 1
                    Color = clBtnFace
                  end
                  object DBEdit5: TUniDBEdit
                    Left = 3
                    Top = 46
                    Width = 113
                    Height = 19
                    Cursor = crArrow
                    Hint = ''
                    DataField = 'FOB'
                    DataSource = SrcOrd
                    TabOrder = 2
                    Color = clBtnFace
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  object pnlReleases: TUniPanel
    Left = 0
    Top = 249
    Width = 582
    Height = 89
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = 'pnlReleases'
    object PnlDelDates: TUniPanel
      Left = 1
      Top = 1
      Width = 580
      Height = 87
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = 'PnlDelDates'
      object Panel10: TUniPanel
        Left = 1
        Top = 1
        Width = 578
        Height = 27
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = ' Releases'
        object DBNavigator3: TUniDBNavigator
          Left = 477
          Top = 1
          Width = 100
          Height = 25
          Hint = ''
          ShowHint = True
          DataSource = SrcOrdRel
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
      object gridReleases: TUniDBGrid
        Left = 1
        Top = 28
        Width = 578
        Height = 58
        Hint = ''
        DataSource = SrcOrdRel
        ReadOnly = True
        LoadMask.Message = 'Loading data...'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        ParentColor = False
        Color = clBtnFace
        Columns = <
          item
            FieldName = 'SEQ'
            Title.Caption = 'Seq #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'REQUEST_DATE'
            Title.Caption = 'Request Date'
            Width = 112
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PROMISE_DATE'
            Title.Caption = 'Promise Date'
            Width = 112
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'QUAN'
            Title.Caption = 'Qty'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SHIP_DATE'
            Title.Caption = 'Ship Date'
            Width = 112
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'UNIT_PRICE'
            Title.Caption = 'Unit Price'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
      end
    end
  end
  object PnlOrders: TUniPanel
    Left = 0
    Top = 124
    Width = 582
    Height = 122
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    Caption = 'PnlOrders'
    object Panel3: TUniPanel
      Left = 1
      Top = 1
      Width = 580
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = ' Order Details'
      object DbNavigator2: TUniDBNavigator
        Left = 479
        Top = 1
        Width = 100
        Height = 25
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        DataSource = SrcOrdDet
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object gridDetails: TUniDBGrid
      Left = 1
      Top = 28
      Width = 580
      Height = 93
      Hint = ''
      DataSource = SrcOrdDet
      ReadOnly = True
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      ParentColor = False
      Color = clBtnFace
      Columns = <
        item
          FieldName = 'ORD_DET_SEQNO'
          Title.Caption = 'Seq#'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ITEMNO'
          Title.Caption = 'Item #'
          Width = 304
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Description'
          Title.Caption = 'Description'
          Width = 124
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TOTAL_QTY_ORD'
          Title.Caption = 'Blanket Qty'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CUMM_SHIPPED'
          Title.Caption = 'Cumm. Shipped'
          Width = 78
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'UNIT_PRICE'
          Title.Caption = 'Unit Price'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TotalPrice'
          Title.Caption = 'Total Price'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COMMENT1'
          Title.Caption = 'Note'
          Width = 124
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COMM_PCT'
          Title.Caption = 'Comm%'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SALESPERSON'
          Title.Caption = 'Salesperson(s)'
          Width = 370
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
  end
  object pnlComment: TUniPanel
    Left = 0
    Top = 341
    Width = 582
    Height = 52
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 4
    Caption = ''
    object Label3: TUniLabel
      Left = 1
      Top = 1
      Width = 31
      Height = 13
      Hint = ''
      Caption = ' Notes'
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object DBMemo1: TUniDBMemo
      Left = 1
      Top = 14
      Width = 580
      Height = 37
      Hint = ''
      DataField = 'COMMENT1'
      DataSource = SrcOrdDet
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      ReadOnly = True
      TabOrder = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 160
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = 'Options'
      object StayonTop1: TUniMenuItem
        Caption = 'Stay on Top'
        Checked = True
        OnClick = StayonTop1Click
      end
      object ShowNote1: TUniMenuItem
        Caption = 'Show Notes'
        OnClick = ShowNote1Click
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
  object IQAbout1: TIQWebAbout
    ModuleName = 'Customer Orders'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196884 $'
    BuildVersion = '176554'
    Left = 192
  end
  object SrcOrd: TDataSource
    DataSet = QryOrders
    OnDataChange = SrcOrdDataChange
    Left = 8
    Top = 190
  end
  object QryOrders: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select o.id,'
      '       o.pono,'
      '       o.arcusto_id,'
      '       o.ord_date,'
      '       o.ord_by,'
      '       o.date_taken,'
      '       o.bill_to_id,'
      '       o.ship_to_id,'
      '       o.cuser1,'
      '       o.cuser2,'
      '       o.cuser3,'
      '       o.cuser4,'
      '       o.cuser5,'
      '       o.cuser6,'
      '       o.timestamp,'
      '       o.fob,'
      '       o.changeuser_id,'
      '       o.terms_id,'
      '       o.freight_id,'
      '       o.free_form,'
      '       o.userid,'
      '       o.orderno,'
      '       t.description as terms,'
      '       a.company as customer,'
      '       a.custno as custno,'
      '       b.attn as billto,'
      '       s.attn as shipto,'
      '       f.descrip as freight'
      ' from orders o,'
      '      terms t,'
      '      arcusto a,'
      '      bill_to b,'
      '      ship_to s,'
      '      freight f '
      '  where o.arcusto_id = :ARCUSTO_ID'
      '    and o.terms_id = t.id(+)'
      '    and o.arcusto_id = a.id(+)'
      '    and o.bill_to_id = b.id(+)'
      '    and o.ship_to_id = s.id(+)'
      '    and o.freight_id = f.id(+)')
    Left = 24
    Top = 190
    ParamData = <
      item
        Name = 'ARCUSTO_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryOrdersID: TBCDField
      FieldName = 'ID'
      Origin = 'ORDERS.ID'
      Size = 0
    end
    object QryOrdersPONO: TStringField
      FieldName = 'PONO'
      Origin = 'ORDERS.PONO'
      Size = 35
    end
    object QryOrdersARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Origin = 'ORDERS.ARCUSTO_ID'
      Size = 0
    end
    object QryOrdersORD_DATE: TDateTimeField
      FieldName = 'ORD_DATE'
      Origin = 'ORDERS.ORD_DATE'
    end
    object QryOrdersORD_BY: TStringField
      FieldName = 'ORD_BY'
      Origin = 'ORDERS.ORD_BY'
      Size = 30
    end
    object QryOrdersDATE_TAKEN: TDateTimeField
      FieldName = 'DATE_TAKEN'
      Origin = 'ORDERS.DATE_TAKEN'
    end
    object QryOrdersBILL_TO_ID: TBCDField
      FieldName = 'BILL_TO_ID'
      Origin = 'ORDERS.BILL_TO_ID'
      Size = 0
    end
    object QryOrdersSHIP_TO_ID: TBCDField
      FieldName = 'SHIP_TO_ID'
      Origin = 'ORDERS.SHIP_TO_ID'
      Size = 0
    end
    object QryOrdersCUSER1: TStringField
      FieldName = 'CUSER1'
      Origin = 'ORDERS.CUSER1'
      Size = 60
    end
    object QryOrdersCUSER2: TStringField
      FieldName = 'CUSER2'
      Origin = 'ORDERS.CUSER2'
      Size = 60
    end
    object QryOrdersCUSER3: TStringField
      FieldName = 'CUSER3'
      Origin = 'ORDERS.CUSER3'
      Size = 60
    end
    object QryOrdersCUSER5: TStringField
      FieldName = 'CUSER5'
      Origin = 'ORDERS.CUSER5'
      Size = 60
    end
    object QryOrdersCUSER6: TStringField
      FieldName = 'CUSER6'
      Origin = 'ORDERS.CUSER6'
      Size = 60
    end
    object QryOrdersTIMESTAMP: TDateTimeField
      FieldName = 'TIMESTAMP'
      Origin = 'ORDERS.TIMESTAMP'
    end
    object QryOrdersFOB: TStringField
      FieldName = 'FOB'
      Origin = 'ORDERS.FOB'
      Size = 60
    end
    object QryOrdersCHANGEUSER_ID: TStringField
      FieldName = 'CHANGEUSER_ID'
      Origin = 'ORDERS.CHANGEUSER_ID'
      Size = 10
    end
    object QryOrdersTERMS_ID: TBCDField
      FieldName = 'TERMS_ID'
      Origin = 'ORDERS.TERMS_ID'
      Size = 0
    end
    object QryOrdersFREIGHT_ID: TBCDField
      FieldName = 'FREIGHT_ID'
      Origin = 'ORDERS.FREIGHT_ID'
      Size = 0
    end
    object QryOrdersFREE_FORM: TStringField
      FieldName = 'FREE_FORM'
      Origin = 'ORDERS.FREE_FORM'
      Size = 1
    end
    object QryOrdersUSERID: TStringField
      FieldName = 'USERID'
      Origin = 'ORDERS.USERID'
      Size = 35
    end
    object QryOrdersORDERNO: TStringField
      FieldName = 'ORDERNO'
      Origin = 'IQ.ORDERS.ORDERNO'
      Size = 15
    end
    object QryOrdersCUSER4: TStringField
      FieldName = 'CUSER4'
      Size = 60
    end
    object QryOrdersTERMS: TStringField
      FieldName = 'TERMS'
      Size = 60
    end
    object QryOrdersCUSTOMER: TStringField
      FieldName = 'CUSTOMER'
      Size = 60
    end
    object QryOrdersCUSTNO: TStringField
      FieldName = 'CUSTNO'
      FixedChar = True
      Size = 10
    end
    object QryOrdersBILLTO: TStringField
      FieldName = 'BILLTO'
      Size = 60
    end
    object QryOrdersSHIPTO: TStringField
      FieldName = 'SHIPTO'
      Size = 60
    end
    object QryOrdersFREIGHT: TStringField
      FieldName = 'FREIGHT'
      Size = 60
    end
  end
  object SrcOrdDet: TDataSource
    DataSet = QryDet
    Left = 80
    Top = 190
  end
  object QryDet: TFDQuery
    OnCalcFields = QryDetCalcFields
    MasterSource = SrcOrd
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select d.id,'
      '       d.orders_id,'
      '       d.arinvt_id,'
      '       d.ord_det_seqno,'
      '       d.total_qty_ord,'
      '       d.cumm_shipped,'
      '       d.misc_item,'
      '       d.comment1,'
      '       d.unit_price,'
      '       d.salespeople_id,'
      '       d.comm_pct,'
      '       d.onhold,'
      '       d.tax_code_id,'
      '       d.price_per_1000,'
      '       s.first_name || '#39' '#39' || s.last_name  as SalesPerson,'
      '       a.itemno,'
      '       a.descrip'
      '  from ord_detail d,'
      '       salespeople s,'
      '       arinvt a'
      'where d.orders_id = :ID'
      '  and d.salespeople_id = s.id(+) '
      '  and d.arinvt_id = a.id(+)'
      'order by d.ord_det_seqno'
      '')
    Left = 96
    Top = 190
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryDetTotalPrice: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalPrice'
      Calculated = True
    end
    object QryDetDescription: TStringField
      FieldKind = fkCalculated
      FieldName = 'Description'
      Calculated = True
    end
    object QryDetID: TBCDField
      FieldName = 'ID'
      Origin = 'ORD_DETAIL.ID'
      Size = 0
    end
    object QryDetORDERS_ID: TBCDField
      FieldName = 'ORDERS_ID'
      Origin = 'ORD_DETAIL.ORDERS_ID'
      Size = 0
    end
    object QryDetARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'ORD_DETAIL.ARINVT_ID'
      Size = 0
    end
    object QryDetORD_DET_SEQNO: TBCDField
      FieldName = 'ORD_DET_SEQNO'
      Origin = 'ORD_DETAIL.ORD_DET_SEQNO'
      Size = 0
    end
    object QryDetTOTAL_QTY_ORD: TBCDField
      FieldName = 'TOTAL_QTY_ORD'
      Origin = 'ORD_DETAIL.TOTAL_QTY_ORD'
    end
    object QryDetCUMM_SHIPPED: TBCDField
      FieldName = 'CUMM_SHIPPED'
      Origin = 'ORD_DETAIL.CUMM_SHIPPED'
    end
    object QryDetONHOLD: TStringField
      FieldName = 'ONHOLD'
      Origin = 'ORD_DETAIL.ONHOLD'
      Size = 1
    end
    object QryDetTAX_CODE_ID: TBCDField
      FieldName = 'TAX_CODE_ID'
      Origin = 'ORD_DETAIL.TAX_CODE_ID'
      Size = 0
    end
    object QryDetMISC_ITEM: TStringField
      FieldName = 'MISC_ITEM'
      Origin = 'ORD_DETAIL.MISC_ITEM'
      Size = 250
    end
    object QryDetUNIT_PRICE: TFMTBCDField
      FieldName = 'UNIT_PRICE'
      Origin = 'ORD_DETAIL.UNIT_PRICE'
      Size = 6
    end
    object QryDetSALESPEOPLE_ID: TBCDField
      FieldName = 'SALESPEOPLE_ID'
      Origin = 'ORD_DETAIL.SALESPEOPLE_ID'
      Size = 0
    end
    object QryDetCOMM_PCT: TBCDField
      FieldName = 'COMM_PCT'
      Origin = 'ORD_DETAIL.COMM_PCT'
      Size = 3
    end
    object QryDetPRICE_PER_1000: TFMTBCDField
      FieldName = 'PRICE_PER_1000'
      Origin = 'ORD_DETAIL.PRICE_PER_1000'
      Size = 6
    end
    object QryDetCOMMENT1: TStringField
      FieldName = 'COMMENT1'
      Origin = 'ORD_DETAIL.COMMENT1'
      Size = 2000
    end
    object QryDetITEMNO: TStringField
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryDetDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 100
    end
    object QryDetSALESPERSON: TStringField
      FieldName = 'SALESPERSON'
      Size = 61
    end
  end
  object QryRel: TFDQuery
    MasterSource = SrcOrdDet
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from releases where ord_detail_id = :ID')
    Left = 168
    Top = 190
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryRelORD_DETAIL_ID: TBCDField
      FieldName = 'ORD_DETAIL_ID'
      Origin = 'RELEASES.ORD_DETAIL_ID'
      Size = 0
    end
    object QryRelREQUEST_DATE: TDateTimeField
      FieldName = 'REQUEST_DATE'
      Origin = 'RELEASES.REQUEST_DATE'
    end
    object QryRelSEQ: TBCDField
      FieldName = 'SEQ'
      Origin = 'RELEASES.SEQ'
      Size = 0
    end
    object QryRelPROMISE_DATE: TDateTimeField
      FieldName = 'PROMISE_DATE'
      Origin = 'RELEASES.PROMISE_DATE'
    end
    object QryRelQUAN: TBCDField
      FieldName = 'QUAN'
      Origin = 'RELEASES.QUAN'
    end
    object QryRelFORECAST: TStringField
      FieldName = 'FORECAST'
      Origin = 'RELEASES.FORECAST'
      Size = 1
    end
    object QryRelSHIP_DATE: TDateTimeField
      FieldName = 'SHIP_DATE'
      Origin = 'RELEASES.SHIP_DATE'
    end
    object QryRelCUSER1: TStringField
      FieldName = 'CUSER1'
      Origin = 'RELEASES.CUSER1'
      Size = 255
    end
    object QryRelUNIT_PRICE: TFMTBCDField
      FieldName = 'UNIT_PRICE'
      Origin = 'RELEASES.UNIT_PRICE'
      Size = 6
    end
  end
  object SrcOrdRel: TDataSource
    DataSet = QryRel
    Left = 152
    Top = 190
  end
  object PkOrder: TIQWebHpick
    BeforeOpen = PkOrderBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       orderno,'
      '       pono,'
      '       ord_date,'
      '       ord_by,'
      '       userid,'
      '       fob'
      '  from orders'
      ' where arcusto_id = :nId      ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 24
    Top = 231
    ParamData = <
      item
        Name = 'nId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkOrderID: TBCDField
      FieldName = 'ID'
      Origin = 'HIST_ORDERS.ID'
      Visible = False
      Size = 0
    end
    object PkOrderPONO: TStringField
      DisplayLabel = 'PO#'
      FieldName = 'PONO'
      Origin = 'HIST_ORDERS.PONO'
      Size = 35
    end
    object PkOrderORD_DATE: TDateTimeField
      DisplayLabel = 'Order Date'
      FieldName = 'ORD_DATE'
      Origin = 'HIST_ORDERS.ORD_DATE'
    end
    object PkOrderORD_BY: TStringField
      DisplayLabel = 'Ordered By'
      FieldName = 'ORD_BY'
      Origin = 'HIST_ORDERS.ORD_BY'
      Size = 30
    end
    object PkOrderFOB: TStringField
      FieldName = 'FOB'
      Origin = 'HIST_ORDERS.FOB'
      Size = 60
    end
    object PkOrderUSERID: TStringField
      DisplayLabel = 'User ID'
      FieldName = 'USERID'
      Origin = 'ORDERS.USERID'
      Size = 35
    end
    object PkOrderORDERNO: TStringField
      DisplayLabel = 'Order#'
      FieldName = 'ORDERNO'
      Origin = 'IQ.ORDERS.ORDERNO'
      Size = 15
    end
  end
  object IQJumpOrd: TIQWebJump
    DataField = 'ID'
    DataSource = SrcOrd
    JumpTo = jtSalesOrder
    Left = 60
    Top = 232
  end
  object PopupMenu1: TUniPopupMenu
    Left = 104
    Top = 230
    object JumpToSalesOrder1: TUniMenuItem
      Caption = 'Jump To Sales Order'
      OnClick = JumpToSalesOrder1Click
    end
  end
end
