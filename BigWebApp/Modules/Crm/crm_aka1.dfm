object FrmCRMEditCustomerAka: TFrmCRMEditCustomerAka
  Left = 256
  Top = 117
  HelpContext = 5000497
  ClientHeight = 462
  ClientWidth = 749
  Caption = 'Customer AKA Assignment'
  OnShow = FormShow
  OnResize = FormResize
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 749
    Height = 443
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 747
      Height = 5
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object pcMain: TUniPageControl
      Left = 1
      Top = 5
      Width = 747
      Height = 438
      Hint = ''
      ActivePage = TabAKA
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabAKA: TUniTabSheet
        Hint = ''
        Caption = 'Assign AKA'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object Splitter1: TUniSplitter
          Left = 360
          Top = 0
          Width = 6
          Height = 410
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlAssignAKA_InventoryList: TUniPanel
          Left = 0
          Top = 0
          Width = 360
          Height = 410
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object GridAvailableArinvt: TIQUniGridControl
            Left = 1
            Top = 47
            Width = 358
            Height = 363
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 141
            IQComponents.Grid.Height = 277
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = SrcAvailableArinvt
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
            IQComponents.Navigator.DataSource = SrcAvailableArinvt
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 141
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 277
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = SrcAvailableArinvt
            Columns = <
              item
                FieldName = 'ITEMNO'
                Title.Caption = 'Item #'
                Width = 70
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DESCRIP'
                Title.Caption = 'Description'
                Width = 70
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DESCRIP2'
                Title.Caption = 'Extended Description'
                Width = 70
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'CLASS'
                Title.Caption = 'Class'
                Width = 14
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'REV'
                Title.Caption = 'Revision'
                Width = 70
                CheckBoxField.FieldValues = 'true;false'
              end>
            TabsVisible = True
            Marker = 0
          end
          object Panel1: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 358
            Height = 47
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            Caption = ''
            object Panel5: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 356
              Height = 20
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clWhite
              TabOrder = 0
              Caption = ''
              Color = clBtnShadow
              object Label1: TUniLabel
                Left = 1
                Top = 1
                Width = 123
                Height = 13
                Hint = ''
                Caption = 'Master Inventory List'
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Color = clWhite
                Font.Style = [fsBold]
                TabOrder = 1
              end
            end
            object Panel15: TUniPanel
              Tag = 1999
              Left = 1
              Top = 20
              Width = 356
              Height = 27
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              DesignSize = (
                356
                27)
              object lblFilterByClass: TUniLabel
                Left = 4
                Top = 6
                Width = 67
                Height = 13
                Hint = ''
                Caption = 'Filter by Class'
                TabOrder = 2
              end
              object cmbClassFilter: TUniDBLookupComboBox
                Left = 80
                Top = 2
                Width = 220
                Height = 21
                Hint = ''
                ListFieldIndex = 0
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                Color = clWindow
                OnChange = cmbClassFilterChange
              end
            end
          end
        end
        object PnlCurrentAKA: TUniPanel
          Left = 366
          Top = 0
          Width = 373
          Height = 410
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object Bevel3: TUniPanel
            Left = 1
            Top = 21
            Width = 371
            Height = 3
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
            Caption = ''
          end
          object Panel3: TUniPanel
            Left = 1
            Top = 24
            Width = 34
            Height = 386
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            DesignSize = (
              34
              386)
            object Panel11: TUniPanel
              Left = 1
              Top = 137
              Width = 32
              Height = 129
              Hint = ''
              Anchors = [akLeft, akRight]
              TabOrder = 0
              Caption = ''
              object sbtnAddArinvtToAka: TUniSpeedButton
                Left = 5
                Top = 1
                Width = 25
                Height = 25
                Hint = 'Add Item to AKA List'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  46010000424D460100000000000076000000280000001A0000000D0000000100
                  040000000000D000000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  88888888F8888800000088888808888888888887FF8888000000888888008888
                  8888888778F8880000008888880608888888FFF7F78F88000000880000066088
                  888777778878F80000008806666666088887F88888878F000000880666666660
                  8887F8888888780000008806666666088887FFFFF88788000000880000066088
                  88877777F8788800000088888806088888888887F78888000000888888008888
                  8888888778888800000088888808888888888887888888000000888888888888
                  88888888888888000000}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = sbtnAddArinvtToAkaClick
              end
              object sbtnAddAllArinvtToAka: TUniSpeedButton
                Left = 5
                Top = 32
                Width = 25
                Height = 25
                Hint = 'Add All Items to AKA List'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  46010000424D460100000000000076000000280000001C0000000D0000000100
                  040000000000D000000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                  DDDDDDDDDDDDDDDD0000DDDDD0DD0DDDDDDDDD7FD7FDDDDD0000DDDDD00D00DD
                  DDDDDD77F77FDDDD0000DDDDD060060DDDDDDD787787FDDD0000D00000660660
                  DD77777F87F87FDD0000D066666660660D78FFF8F87F87FD0000D06666666606
                  607888888F87F87D0000D066666660660D788888887887DD0000D00000660660
                  DD77777887887DDD0000DDDDD060060DDDDDDD787787DDDD0000DDDDD00D00DD
                  DDDDDD77D77DDDDD0000DDDDD0DD0DDDDDDDDD7DD7DDDDDD0000DDDDDDDDDDDD
                  DDDDDDDDDDDDDDDD0000}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = sbtnAddAllArinvtToAkaClick
              end
              object sbtnRemoveAka: TUniSpeedButton
                Left = 5
                Top = 72
                Width = 25
                Height = 25
                Hint = 'Remove Item from AKA List'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  46010000424D460100000000000076000000280000001A0000000D0000000100
                  040000000000D000000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  8888888888888800000088888808888888888887F88888000000888880088888
                  88888877F8888800000088880608888888888787FFFFF8000000888066000008
                  888878877777F8000000880666666608888788888887F8000000806666666608
                  8878F8888887F800000088066666660888878F88FFF7F8000000888066000008
                  888878F777778800000088880608888888888787F88888000000888880088888
                  88888877F8888800000088888808888888888887888888000000888888888888
                  88888888888888000000}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = sbtnRemoveAkaClick
              end
              object sbtnRemoveAllAka: TUniSpeedButton
                Left = 5
                Top = 104
                Width = 25
                Height = 25
                Hint = 'Remove All Items from AKA List'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  56010000424D560100000000000076000000280000001C0000000E0000000100
                  040000000000E000000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                  DDDDDDDDDDDDDDDD0000DDDDDDDDDDDDDDDDDDDDDDDDDDDD0000DDDDD0DD0DDD
                  DDDDDDD7FD7FDDDD0000DDDD00D00DDDDDDDDD77F77FDDDD0000DDD060060DDD
                  DDDDD787787FFFFF0000DD06606600000DDD78878877777F0000D06606666666
                  0DD788788888887F00000660666666660D78F78F8888887F0000D06606666666
                  0DD78F78F88FFF7F0000DD06606600000DDD78F78F77777D0000DDD060060DDD
                  DDDDD787787FDDDD0000DDDD00D00DDDDDDDDD77F77FDDDD0000DDDDD0DD0DDD
                  DDDDDDD7DD7DDDDD0000DDDDDDDDDDDDDDDDDDDDDDDDDDDD0000}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = sbtnRemoveAllAkaClick
              end
            end
          end
          object GridSelectedAka: TIQUniGridControl
            Left = 34
            Top = 24
            Width = 339
            Height = 386
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 122
            IQComponents.Grid.Height = 300
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = SrcSelectedArinvt
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
            IQComponents.Navigator.DataSource = SrcSelectedArinvt
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 122
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 300
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = SrcSelectedArinvt
            Columns = <
              item
                FieldName = 'ITEMNO'
                Title.Caption = 'Item #'
                Width = 154
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DESCRIP'
                Title.Caption = 'Description'
                Width = 175
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DESCRIP2'
                Title.Caption = 'Extended Description'
                Width = 175
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'CLASS'
                Title.Caption = 'Class'
                Width = 84
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'REV'
                Title.Caption = 'Revision'
                Width = 105
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'KIND'
                Title.Caption = 'AKA Kind'
                Width = 70
                CheckBoxField.FieldValues = 'true;false'
              end>
            TabsVisible = True
            Marker = 0
          end
          object Panel16: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 371
            Height = 21
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            Caption = ''
            object Panel17: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 369
              Height = 20
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clWhite
              TabOrder = 0
              Caption = ''
              Color = clBtnShadow
              object Label2: TUniLabel
                Left = 1
                Top = 1
                Width = 106
                Height = 13
                Hint = ''
                Caption = 'Current AKA Items'
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                ParentFont = False
                Font.Color = clWhite
                Font.Style = [fsBold]
                TabOrder = 1
              end
              object Label3: TUniLabel
                Left = 106
                Top = 1
                Width = 10
                Height = 13
                Hint = ''
                Caption = ' - '
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 2
              end
              object lblAssignAKA_Customer: TUniLabel
                Left = 116
                Top = 1
                Width = 3
                Height = 13
                Hint = ''
                Caption = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 3
              end
            end
          end
        end
      end
      object TabAKABreaks: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'Price Breaks'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object Splitter2: TUniSplitter
          Left = 360
          Top = 23
          Width = 6
          Height = 387
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlPriceBreaks_AKA: TUniPanel
          Left = 0
          Top = 23
          Width = 360
          Height = 387
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Panel7: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 358
            Height = 27
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Caption = ''
            object sbtnToggleHeaderView: TUniSpeedButton
              Left = 1
              Top = 1
              Width = 25
              Height = 25
              Hint = 'Toggle Form/Table View'
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
              OnClick = sbtnToggleHeaderViewClick
            end
            object NavAKA_Db: TUniDBNavigator
              Left = 134
              Top = 1
              Width = 224
              Height = 25
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              DataSource = SrcAKA
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 0
            end
          end
          object Panel9: TUniPanel
            Left = 1
            Top = 27
            Width = 358
            Height = 360
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object pcAKA: TUniPageControl
              Left = 1
              Top = 1
              Width = 356
              Height = 358
              Hint = ''
              ActivePage = TabAKAForm
              TabBarVisible = True
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              object TabAKAGrid: TUniTabSheet
                Hint = ''
                Caption = 'TabAKAGrid'
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 256
                ExplicitHeight = 128
                object PnlAkaGrid: TUniPanel
                  Left = 0
                  Top = 0
                  Width = 348
                  Height = 330
                  Hint = ''
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 0
                  Caption = ''
                  object GridAKA: TIQUniGridControl
                    Left = 1
                    Top = 1
                    Width = 346
                    Height = 328
                    Layout = 'border'
                    ParentAlignmentControl = False
                    AlignmentControl = uniAlignmentClient
                    Align = alClient
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    TabOrder = 0
                    IQComponents.Grid.Left = 0
                    IQComponents.Grid.Top = 29
                    IQComponents.Grid.Width = 129
                    IQComponents.Grid.Height = 242
                    IQComponents.Grid.Hint = ''
                    IQComponents.Grid.DataSource = SrcAKA
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
                    IQComponents.Navigator.DataSource = SrcAKA
                    IQComponents.Navigator.LayoutConfig.Region = 'east'
                    IQComponents.Navigator.TabOrder = 3
                    IQComponents.HiddenPanel.Left = 129
                    IQComponents.HiddenPanel.Top = 29
                    IQComponents.HiddenPanel.Width = 209
                    IQComponents.HiddenPanel.Height = 242
                    IQComponents.HiddenPanel.Hint = ''
                    IQComponents.HiddenPanel.Visible = True
                    IQComponents.HiddenPanel.Align = alRight
                    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
                    IQComponents.FormTab.Hint = ''
                    IQComponents.FormTab.ImageIndex = 1
                    IQComponents.FormTab.Caption = 'Form'
                    IQComponents.FormTab.Layout = 'border'
                    DataSource = SrcAKA
                    Columns = <
                      item
                        FieldName = 'CUST_ITEMNO'
                        Title.Caption = 'Customer ~Item #'
                        Width = 91
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'CUST_DESCRIP'
                        Title.Caption = 'Customer ~Description'
                        Width = 98
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'CUST_DESCRIP2'
                        Title.Caption = 'Customer ~Extended Description'
                        Width = 126
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'CUST_REV'
                        Title.Caption = 'Customer ~Revision'
                        Width = 126
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'KIND'
                        Title.Caption = 'AKA Kind'
                        Width = 126
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'PRICE_PER_1000'
                        Title.Caption = 'Price ~Per 1000'
                        Width = 63
                        CheckBoxField.FieldValues = 'Y;N'
                      end
                      item
                        FieldName = 'COMIS_PRCNT'
                        Title.Caption = 'Commission ~Percentage'
                        Width = 77
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'CURR_CODE'
                        Title.Caption = 'Currency Code'
                        Width = 126
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'ARINVT_ITEMNO'
                        Title.Caption = 'Master Inventory ~Item #'
                        Width = 91
                        ReadOnly = True
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'ARINVT_DESCRIP'
                        Title.Caption = 'Master Inventory ~Description'
                        Width = 91
                        ReadOnly = True
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'ARINVT_DESCRIP2'
                        Title.Caption = 'Master Inventory ~Extended Description'
                        Width = 105
                        ReadOnly = True
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'ARINVT_CLASS'
                        Title.Caption = 'Master Inventory ~Class'
                        Width = 91
                        ReadOnly = True
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'ARINVT_REV'
                        Title.Caption = 'Master Inventory ~Revision'
                        Width = 91
                        ReadOnly = True
                        CheckBoxField.FieldValues = 'true;false'
                      end>
                    TabsVisible = True
                    Marker = 0
                  end
                  object cmbCurrencyGrid: TUniDBLookupComboBox
                    Left = 80
                    Top = 109
                    Width = 118
                    Height = 21
                    Hint = ''
                    Visible = False
                    ListFieldIndex = 0
                    DataField = 'CURRENCY_ID'
                    DataSource = SrcAKA
                    TabOrder = 1
                    Color = clWindow
                    OnKeyDown = cmbAkaCurrencyKeyDown
                  end
                end
              end
              object TabAKAForm: TUniTabSheet
                Hint = ''
                ImageIndex = 1
                Caption = 'TabAKAForm'
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 256
                ExplicitHeight = 128
                object PnlAkaFormCarrier: TUniPanel
                  Tag = 1999
                  Left = 0
                  Top = 0
                  Width = 348
                  Height = 330
                  Hint = ''
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 0
                  Caption = ''
                  object sbAkaForm: TUniScrollBox
                    Tag = 1999
                    Left = 0
                    Top = 0
                    Width = 348
                    Height = 330
                    Hint = ''
                    Align = alClient
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    TabOrder = 0
                    ExplicitWidth = 352
                    ExplicitHeight = 332
                    ScrollHeight = 301
                    object PnlAkaForm: TUniPanel
                      Tag = 1999
                      Left = 0
                      Top = 0
                      Width = 346
                      Height = 301
                      Hint = ''
                      Align = alTop
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 0
                      Caption = ''
                      object Splitter3: TUniSplitter
                        Left = 176
                        Top = 0
                        Width = 6
                        Height = 301
                        Hint = ''
                        Align = alLeft
                        ParentColor = False
                        Color = clBtnFace
                      end
                      object PnlAkaFormLeft: TUniPanel
                        Tag = 1999
                        Left = 1
                        Top = 1
                        Width = 176
                        Height = 299
                        Hint = ''
                        Align = alLeft
                        Anchors = [akLeft, akTop, akBottom]
                        TabOrder = 0
                        Caption = ''
                        object lblAkaItemno: TUniLabel
                          Left = 8
                          Top = 11
                          Width = 82
                          Height = 13
                          Hint = ''
                          Caption = 'Customer Item #'
                          TabOrder = 1
                        end
                        object lblAkaDescrip: TUniLabel
                          Left = 8
                          Top = 35
                          Width = 102
                          Height = 13
                          Hint = ''
                          Caption = 'Customer Description'
                          TabOrder = 2
                        end
                        object lblAkaCommissionPercent: TUniLabel
                          Left = 8
                          Top = 131
                          Width = 113
                          Height = 13
                          Hint = ''
                          Caption = 'Commission Percentage'
                          TabOrder = 3
                        end
                        object lblAkaCurrency: TUniLabel
                          Left = 8
                          Top = 155
                          Width = 72
                          Height = 13
                          Hint = ''
                          Caption = 'Currency Code'
                          TabOrder = 4
                        end
                        object lblAkaInventoryItemno: TUniLabel
                          Left = 8
                          Top = 179
                          Width = 84
                          Height = 13
                          Hint = ''
                          Caption = 'Inventory Item #'
                          TabOrder = 5
                        end
                        object lblAkaInventoryDescrip: TUniLabel
                          Left = 8
                          Top = 203
                          Width = 104
                          Height = 13
                          Hint = ''
                          Caption = 'Inventory Description'
                          TabOrder = 6
                        end
                        object lblAkaInventoryDescrip2: TUniLabel
                          Left = 8
                          Top = 227
                          Width = 153
                          Height = 13
                          Hint = ''
                          Caption = 'Inventory Extended Description'
                          TabOrder = 7
                        end
                        object lblAkaInventoryClass: TUniLabel
                          Left = 8
                          Top = 251
                          Width = 76
                          Height = 13
                          Hint = ''
                          Caption = 'Inventory Class'
                          TabOrder = 8
                        end
                        object lblAkaInventoryRev: TUniLabel
                          Left = 8
                          Top = 275
                          Width = 91
                          Height = 13
                          Hint = ''
                          Caption = 'Inventory Revision'
                          TabOrder = 9
                        end
                        object Label6: TUniLabel
                          Left = 8
                          Top = 59
                          Width = 151
                          Height = 13
                          Hint = ''
                          Caption = 'Customer Extended Description'
                          TabOrder = 10
                        end
                        object Label7: TUniLabel
                          Left = 8
                          Top = 83
                          Width = 89
                          Height = 13
                          Hint = ''
                          Caption = 'Customer Revision'
                          TabOrder = 11
                        end
                      end
                      object PnlAkaFormClient: TUniPanel
                        Tag = 1999
                        Left = 182
                        Top = 1
                        Width = 164
                        Height = 299
                        Hint = ''
                        Align = alClient
                        Anchors = [akLeft, akTop, akRight, akBottom]
                        TabOrder = 1
                        Caption = ''
                        ExplicitLeft = 179
                        ExplicitWidth = 173
                        DesignSize = (
                          164
                          299)
                        object dbeAkaItemo: TUniDBEdit
                          Left = 1
                          Top = 8
                          Width = 166
                          Height = 21
                          Hint = ''
                          DataField = 'CUST_ITEMNO'
                          DataSource = SrcAKA
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 0
                        end
                        object dbeAkaDescrip: TUniDBEdit
                          Left = 1
                          Top = 32
                          Width = 166
                          Height = 21
                          Hint = ''
                          DataField = 'CUST_DESCRIP'
                          DataSource = SrcAKA
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 1
                        end
                        object chkAkaPricePer1000: TUniDBCheckBox
                          Left = 1
                          Top = 104
                          Width = 97
                          Height = 17
                          Hint = ''
                          DataField = 'PRICE_PER_1000'
                          DataSource = SrcAKA
                          ValueChecked = 'Y'
                          ValueUnchecked = 'N'
                          Caption = 'Price Per 1000'
                          TabOrder = 4
                        end
                        object dbeAkaCommissionPercent: TUniDBEdit
                          Left = 1
                          Top = 128
                          Width = 89
                          Height = 21
                          Hint = ''
                          DataField = 'COMIS_PRCNT'
                          DataSource = SrcAKA
                          TabOrder = 5
                        end
                        object cmbAkaCurrencyForm: TUniDBLookupComboBox
                          Left = 1
                          Top = 152
                          Width = 166
                          Height = 21
                          Hint = ''
                          ListFieldIndex = 0
                          DataField = 'CURRENCY_ID'
                          DataSource = SrcAKA
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 6
                          Color = clWindow
                          OnKeyDown = cmbAkaCurrencyKeyDown
                        end
                        object dbeAkaInventoryItemno: TUniDBEdit
                          Left = 1
                          Top = 176
                          Width = 166
                          Height = 21
                          Hint = ''
                          DataField = 'ARINVT_ITEMNO'
                          DataSource = SrcAKA
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 7
                          Color = clBtnFace
                          ReadOnly = True
                        end
                        object dbeAkaInventoryDescrip: TUniDBEdit
                          Left = 1
                          Top = 200
                          Width = 166
                          Height = 21
                          Hint = ''
                          DataField = 'ARINVT_DESCRIP'
                          DataSource = SrcAKA
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 8
                          Color = clBtnFace
                          ReadOnly = True
                        end
                        object dbeAkaInventoryDescrip2: TUniDBEdit
                          Left = 1
                          Top = 224
                          Width = 166
                          Height = 21
                          Hint = ''
                          DataField = 'ARINVT_DESCRIP2'
                          DataSource = SrcAKA
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 9
                          Color = clBtnFace
                          ReadOnly = True
                        end
                        object dbeAkaInventoryClass: TUniDBEdit
                          Left = 1
                          Top = 248
                          Width = 33
                          Height = 21
                          Hint = ''
                          DataField = 'ARINVT_CLASS'
                          DataSource = SrcAKA
                          TabOrder = 10
                          Color = clBtnFace
                          ReadOnly = True
                        end
                        object dbeAkaInventoryRev: TUniDBEdit
                          Left = 1
                          Top = 272
                          Width = 89
                          Height = 21
                          Hint = ''
                          DataField = 'ARINVT_REV'
                          DataSource = SrcAKA
                          TabOrder = 11
                          Color = clBtnFace
                          ReadOnly = True
                        end
                        object dbeAkaDescrip2: TUniDBEdit
                          Left = 1
                          Top = 56
                          Width = 166
                          Height = 21
                          Hint = ''
                          DataField = 'CUST_DESCRIP2'
                          DataSource = SrcAKA
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 2
                        end
                        object dbeAkaRev: TUniDBEdit
                          Left = 1
                          Top = 80
                          Width = 166
                          Height = 21
                          Hint = ''
                          DataField = 'CUST_REV'
                          DataSource = SrcAKA
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 3
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
        object PnlAKABreaksTables: TUniPanel
          Left = 366
          Top = 23
          Width = 373
          Height = 387
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object Panel10: TUniPanel
            Left = 1
            Top = 1
            Width = 371
            Height = 385
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object pcAKABreaks: TUniPageControl
              Left = 1
              Top = 1
              Width = 369
              Height = 383
              Hint = ''
              ActivePage = TabAKABreaks_AKABreaks
              TabBarVisible = True
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              object TabAKABreaks_AKABreaks: TUniTabSheet
                Hint = ''
                Caption = 'AKA Breaks'
                object Panel13: TUniPanel
                  Left = 0
                  Top = 27
                  Width = 361
                  Height = 328
                  Hint = ''
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 0
                  Caption = ''
                  object GridAKABreaks: TIQUniGridControl
                    Left = 1
                    Top = 1
                    Width = 359
                    Height = 326
                    Layout = 'border'
                    ParentAlignmentControl = False
                    AlignmentControl = uniAlignmentClient
                    Align = alClient
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    TabOrder = 0
                    IQComponents.Grid.Left = 0
                    IQComponents.Grid.Top = 29
                    IQComponents.Grid.Width = 142
                    IQComponents.Grid.Height = 240
                    IQComponents.Grid.Hint = ''
                    IQComponents.Grid.DataSource = SrcAKABreaks
                    IQComponents.Grid.LoadMask.Message = 'Loading data...'
                    IQComponents.Grid.Align = alClient
                    IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
                    IQComponents.Grid.TabOrder = 0
                    IQComponents.Grid.OnDrawColumnCell = GridAKABreaksDBGridDrawColumnCell
                    IQComponents.Navigator.Left = 410
                    IQComponents.Navigator.Top = 0
                    IQComponents.Navigator.Width = 241
                    IQComponents.Navigator.Height = 25
                    IQComponents.Navigator.Hint = ''
                    IQComponents.Navigator.ShowHint = True
                    IQComponents.Navigator.DataSource = SrcAKABreaks
                    IQComponents.Navigator.LayoutConfig.Region = 'east'
                    IQComponents.Navigator.TabOrder = 3
                    IQComponents.HiddenPanel.Left = 142
                    IQComponents.HiddenPanel.Top = 29
                    IQComponents.HiddenPanel.Width = 209
                    IQComponents.HiddenPanel.Height = 240
                    IQComponents.HiddenPanel.Hint = ''
                    IQComponents.HiddenPanel.Visible = True
                    IQComponents.HiddenPanel.Align = alRight
                    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
                    IQComponents.FormTab.Hint = ''
                    IQComponents.FormTab.ImageIndex = 1
                    IQComponents.FormTab.Caption = 'Form'
                    IQComponents.FormTab.Layout = 'border'
                    DataSource = SrcAKABreaks
                    Columns = <
                      item
                        FieldName = 'QUAN'
                        Title.Caption = 'Quantity'
                        Width = 70
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'QPRICE'
                        Title.Caption = 'Price'
                        Width = 70
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'PRICE_DATE'
                        Title.Caption = 'Price Date'
                        Width = 126
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'EFFECT_DATE'
                        Title.Caption = 'Effective Date'
                        Width = 126
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'DEACTIVE_DATE'
                        Title.Caption = 'Deactive Date'
                        Width = 126
                        CheckBoxField.FieldValues = 'true;false'
                      end>
                    TabsVisible = True
                    Marker = 0
                  end
                end
                object PnlAkaBreaksToolbar: TUniPanel
                  Tag = 1999
                  Left = 0
                  Top = 0
                  Width = 361
                  Height = 27
                  Hint = ''
                  Align = alTop
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                  Caption = ''
                  object sbtnHideAka: TUniSpeedButton
                    Left = 1
                    Top = 1
                    Width = 25
                    Height = 25
                    Hint = 'Click to hide inactives.'
                    ShowHint = True
                    ParentShowHint = False
                    GroupIndex = 1
                    AllowAllUp = True
                    Glyph.Data = {
                      36060000424D3606000000000000360000002800000020000000100000000100
                      1800000000000006000000000000000000000000000000000000FF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFC07040B05830B05830A05020A050209048209048
                      20904020804020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7171715C
                      5C5C5C5C5C5353535353534A4A4A4A4A4A454545424242FF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFC07850F0D8D0F0D8C0F0D0C0F0D0B0F0D0B0F0D0
                      B0F0D0B0904020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF797979D9
                      D9D9D5D5D5D0D0D0CDCDCDCDCDCDCDCDCDCDCDCD454545FF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFD08860FFF8F0FFF8F0FFF0E0FFF0E0FFE8E0FFE8
                      E0F0D0B0904820FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF888888F7
                      F7F7F7F7F7EEEEEEEEEEEEE9E9E9E9E9E9CDCDCD4A4A4AFF00FFFF00FFC07040
                      B05830B05830A05020A05020904820904820904020804020FFF0F0FFE8E0FFE8
                      E0F0D0B0904820FF00FFFF00FF7171715C5C5C5C5C5C5353535353534A4A4A4A
                      4A4A454545424242F2F2F2E9E9E9E9E9E9CDCDCD4A4A4AFF00FFFF00FFC07850
                      F0D8D0F0D8C0F0D0C0F0D0B0F0D0B0F0D0B0F0D0B0904020FFF8F0FFF0E0FFF0
                      E0F0D0C0A04820FF00FFFF00FF797979D9D9D9D5D5D5D0D0D0CDCDCDCDCDCDCD
                      CDCDCDCDCD454545F7F7F7EEEEEEEEEEEED0D0D04D4D4DFF00FFFF00FFD08860
                      FFF8F0E09060D08050D08050D08050D08050F0D0B0904820FFFFFFFFF0F0FFF0
                      F0F0D8D0A05020FF00FFFF00FF888888F7F7F790909080808080808080808080
                      8080CDCDCD4A4A4AFFFFFFF2F2F2F2F2F2D9D9D9535353FF00FFFF00FFD09070
                      FFFFFFFFFFFFFFF0F0FFF0F0FFE8E0FFE8E0F0D0B0904820FFFFFFFFF8F0FFF8
                      F0F0E0E0A05020FF00FFFF00FF909090FFFFFFFFFFFFF2F2F2F2F2F2E9E9E9E9
                      E9E9CDCDCD4A4A4AFFFFFFF7F7F7F7F7F7E2E2E2535353FF00FFFF00FFE0A080
                      FFFFFFF0A880E09870E09060D08050D08050F0D0C0A04820FFFFFFFFFFFFFFFF
                      FFFFFFFFA05020FF00FFFF00FFA0A0A0FFFFFFA8A8A898989890909080808080
                      8080D0D0D04D4D4DFFFFFFFFFFFFFFFFFFFFFFFF535353FF00FFFF00FFE0A890
                      FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FFF0F0F0D8D0A05020FFFFFFFFFFFFFFFF
                      FFFFFFFFA05020FF00FFFF00FFA9A9A9FFFFFFFFFFFFFFFFFFFFFFFFF2F2F2F2
                      F2F2D9D9D9535353FFFFFFFFFFFFFFFFFFFFFFFF535353FF00FFFF00FFE0B8A0
                      FFFFFFFFB090F0B090F0A880F09870E09060F0E0E0A05020E0A080D09070D088
                      60C07850C07040FF00FFFF00FFB7B7B7FFFFFFB1B1B1B0B0B0A8A8A89A9A9A90
                      9090E2E2E2535353A0A0A0909090888888797979717171FF00FFFF00FFF0C0A0
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA05020FF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFF535353FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0C8B0
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA05020FF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFC7C7C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFF535353FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0C8B0
                      F0C0B0F0C0B0F0B8A0E0A080D09070D08860C07850C07040FF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFC7C7C7C1C1C1C1C1C1B8B8B8A0A0A090909088
                      8888797979717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                    Caption = ''
                    ParentColor = False
                    Color = clWindow
                    OnClick = sbtnHideAkaClick
                  end
                  object NavAKABreaks_Db: TUniDBNavigator
                    Left = 136
                    Top = 1
                    Width = 225
                    Height = 25
                    Hint = ''
                    ShowHint = True
                    ParentShowHint = False
                    DataSource = SrcAKABreaks
                    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
                    Align = alRight
                    Anchors = [akTop, akRight, akBottom]
                    TabOrder = 0
                  end
                end
              end
              object TabAKABreaks_ArinvtBreaks: TUniTabSheet
                Hint = ''
                ImageIndex = 1
                Caption = 'Master Inventory Breaks'
                object Panel14: TUniPanel
                  Left = 0
                  Top = 27
                  Width = 361
                  Height = 328
                  Hint = ''
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 0
                  Caption = ''
                  object GridMasterInvBreaks: TIQUniGridControl
                    Left = 1
                    Top = 1
                    Width = 359
                    Height = 326
                    Layout = 'border'
                    ParentAlignmentControl = False
                    AlignmentControl = uniAlignmentClient
                    Align = alClient
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    TabOrder = 0
                    IQComponents.Grid.Left = 0
                    IQComponents.Grid.Top = 29
                    IQComponents.Grid.Width = 142
                    IQComponents.Grid.Height = 240
                    IQComponents.Grid.Hint = ''
                    IQComponents.Grid.DataSource = SrcArinvtBreaks
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
                    IQComponents.Navigator.DataSource = SrcArinvtBreaks
                    IQComponents.Navigator.LayoutConfig.Region = 'east'
                    IQComponents.Navigator.TabOrder = 3
                    IQComponents.HiddenPanel.Left = 142
                    IQComponents.HiddenPanel.Top = 29
                    IQComponents.HiddenPanel.Width = 209
                    IQComponents.HiddenPanel.Height = 240
                    IQComponents.HiddenPanel.Hint = ''
                    IQComponents.HiddenPanel.Visible = True
                    IQComponents.HiddenPanel.Align = alRight
                    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
                    IQComponents.FormTab.Hint = ''
                    IQComponents.FormTab.ImageIndex = 1
                    IQComponents.FormTab.Caption = 'Form'
                    IQComponents.FormTab.Layout = 'border'
                    DataSource = SrcArinvtBreaks
                    Columns = <
                      item
                        FieldName = 'QUAN'
                        Title.Caption = 'Quantity'
                        Width = 70
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'QPRICE'
                        Title.Caption = 'Price'
                        Width = 70
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'PRICE_DATE'
                        Title.Caption = 'Price Date'
                        Width = 126
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'EFFECT_DATE'
                        Title.Caption = 'Effective Date'
                        Width = 126
                        CheckBoxField.FieldValues = 'true;false'
                      end
                      item
                        FieldName = 'DEACTIVE_DATE'
                        Title.Caption = 'Deactive Date'
                        Width = 126
                        CheckBoxField.FieldValues = 'true;false'
                      end>
                    TabsVisible = True
                    Marker = 0
                  end
                end
                object PnlArinvtBreaksToolbar: TUniPanel
                  Tag = 1999
                  Left = 0
                  Top = 0
                  Width = 361
                  Height = 27
                  Hint = ''
                  Align = alTop
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                  Caption = ''
                  object sbtnHideArinvtBreaks: TUniSpeedButton
                    Left = 1
                    Top = 1
                    Width = 25
                    Height = 25
                    Hint = 'Click to hide inactives.'
                    ShowHint = True
                    ParentShowHint = False
                    GroupIndex = 1
                    AllowAllUp = True
                    Glyph.Data = {
                      36060000424D3606000000000000360000002800000020000000100000000100
                      1800000000000006000000000000000000000000000000000000FF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFC07040B05830B05830A05020A050209048209048
                      20904020804020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7171715C
                      5C5C5C5C5C5353535353534A4A4A4A4A4A454545424242FF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFC07850F0D8D0F0D8C0F0D0C0F0D0B0F0D0B0F0D0
                      B0F0D0B0904020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF797979D9
                      D9D9D5D5D5D0D0D0CDCDCDCDCDCDCDCDCDCDCDCD454545FF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFD08860FFF8F0FFF8F0FFF0E0FFF0E0FFE8E0FFE8
                      E0F0D0B0904820FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF888888F7
                      F7F7F7F7F7EEEEEEEEEEEEE9E9E9E9E9E9CDCDCD4A4A4AFF00FFFF00FFC07040
                      B05830B05830A05020A05020904820904820904020804020FFF0F0FFE8E0FFE8
                      E0F0D0B0904820FF00FFFF00FF7171715C5C5C5C5C5C5353535353534A4A4A4A
                      4A4A454545424242F2F2F2E9E9E9E9E9E9CDCDCD4A4A4AFF00FFFF00FFC07850
                      F0D8D0F0D8C0F0D0C0F0D0B0F0D0B0F0D0B0F0D0B0904020FFF8F0FFF0E0FFF0
                      E0F0D0C0A04820FF00FFFF00FF797979D9D9D9D5D5D5D0D0D0CDCDCDCDCDCDCD
                      CDCDCDCDCD454545F7F7F7EEEEEEEEEEEED0D0D04D4D4DFF00FFFF00FFD08860
                      FFF8F0E09060D08050D08050D08050D08050F0D0B0904820FFFFFFFFF0F0FFF0
                      F0F0D8D0A05020FF00FFFF00FF888888F7F7F790909080808080808080808080
                      8080CDCDCD4A4A4AFFFFFFF2F2F2F2F2F2D9D9D9535353FF00FFFF00FFD09070
                      FFFFFFFFFFFFFFF0F0FFF0F0FFE8E0FFE8E0F0D0B0904820FFFFFFFFF8F0FFF8
                      F0F0E0E0A05020FF00FFFF00FF909090FFFFFFFFFFFFF2F2F2F2F2F2E9E9E9E9
                      E9E9CDCDCD4A4A4AFFFFFFF7F7F7F7F7F7E2E2E2535353FF00FFFF00FFE0A080
                      FFFFFFF0A880E09870E09060D08050D08050F0D0C0A04820FFFFFFFFFFFFFFFF
                      FFFFFFFFA05020FF00FFFF00FFA0A0A0FFFFFFA8A8A898989890909080808080
                      8080D0D0D04D4D4DFFFFFFFFFFFFFFFFFFFFFFFF535353FF00FFFF00FFE0A890
                      FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FFF0F0F0D8D0A05020FFFFFFFFFFFFFFFF
                      FFFFFFFFA05020FF00FFFF00FFA9A9A9FFFFFFFFFFFFFFFFFFFFFFFFF2F2F2F2
                      F2F2D9D9D9535353FFFFFFFFFFFFFFFFFFFFFFFF535353FF00FFFF00FFE0B8A0
                      FFFFFFFFB090F0B090F0A880F09870E09060F0E0E0A05020E0A080D09070D088
                      60C07850C07040FF00FFFF00FFB7B7B7FFFFFFB1B1B1B0B0B0A8A8A89A9A9A90
                      9090E2E2E2535353A0A0A0909090888888797979717171FF00FFFF00FFF0C0A0
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA05020FF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFF535353FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0C8B0
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA05020FF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFC7C7C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFF535353FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0C8B0
                      F0C0B0F0C0B0F0B8A0E0A080D09070D08860C07850C07040FF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFC7C7C7C1C1C1C1C1C1B8B8B8A0A0A090909088
                      8888797979717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                    Caption = ''
                    ParentColor = False
                    Color = clWindow
                    OnClick = sbtnHideArinvtBreaksClick
                  end
                  object NavMasterInventoryBreaks: TUniDBNavigator
                    Left = 261
                    Top = 1
                    Width = 100
                    Height = 25
                    Hint = ''
                    ShowHint = True
                    ParentShowHint = False
                    DataSource = SrcArinvtBreaks
                    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
                    Align = alRight
                    Anchors = [akTop, akRight, akBottom]
                    TabOrder = 0
                  end
                end
              end
            end
          end
        end
        object PnlPriceBreaksCaptionOuter: TUniPanel
          Tag = 1999
          Left = 0
          Top = 0
          Width = 739
          Height = 23
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Caption = ''
          object PnlPriceBreaksCaption: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 737
            Height = 21
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            TabOrder = 0
            Caption = ''
            Color = clBtnShadow
            object Label4: TUniLabel
              Left = 1
              Top = 1
              Width = 173
              Height = 13
              Hint = ''
              Caption = 'Master and AKA Inventory List'
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              ParentFont = False
              Font.Color = clWhite
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object Label5: TUniLabel
              Left = 173
              Top = 1
              Width = 10
              Height = 13
              Hint = ''
              Caption = ' - '
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 2
            end
            object lblPriceBreaks_Customer: TUniLabel
              Left = 183
              Top = 1
              Width = 3
              Height = 13
              Hint = ''
              Caption = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 3
            end
          end
        end
      end
    end
  end
  object StatusBar: TUniStatusBar
    Left = 0
    Top = 443
    Width = 749
    Height = 19
    Hint = ''
    Panels = <
      item
        Width = 300
      end
      item
        Width = 200
      end
      item
        Bevel = pbNone
        Width = 50
      end>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object MainMenu1: TUniMainMenu
    Left = 206
    Top = 65528
    object File1: TUniMenuItem
      Caption = '&File'
      object Close1: TUniMenuItem
        Caption = '&Close'
        OnClick = Close1Click
      end
    end
    object View1: TUniMenuItem
      Caption = '&View'
      object Refresh1: TUniMenuItem
        Caption = 'Refresh'
        ShortCut = 116
        OnClick = Refresh1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object HelpContents1: TUniMenuItem
        Caption = '&Contents'
        ShortCut = 112
        OnClick = HelpContents1Click
      end
      object HelpAbout1: TUniMenuItem
        Caption = '&About'
        OnClick = HelpAbout1Click
      end
    end
  end
  object SrcAvailableArinvt: TDataSource
    DataSet = QryAvailableArinvt
    Left = 364
    Top = 320
  end
  object QryAvailableArinvt: TFDQuery
    BeforeOpen = DoDataSetBeforeOpen
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id, itemno, descrip, descrip2, class, rev, eplant_id'
      'from arinvt'
      'where NVL( pk_hide, '#39'N'#39' ) <> '#39'Y'#39)
    Left = 376
    Top = 328
    object QryAvailableArinvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 10
      FieldName = 'ITEMNO'
      Origin = 'arinvt.itemno'
      FixedChar = True
      Size = 50
    end
    object QryAvailableArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 10
      FieldName = 'DESCRIP'
      Origin = 'arinvt.descrip'
      Size = 100
    end
    object QryAvailableArinvtDESCRIP2: TStringField
      DisplayLabel = 'Extended Description'
      DisplayWidth = 10
      FieldName = 'DESCRIP2'
      Origin = 'arinvt.descrip2'
      Size = 100
    end
    object QryAvailableArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'arinvt.class'
      FixedChar = True
      Size = 2
    end
    object QryAvailableArinvtREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 10
      FieldName = 'REV'
      Origin = 'arinvt.rev'
      FixedChar = True
      Size = 15
    end
    object QryAvailableArinvtID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'arinvt.id'
      Visible = False
      Size = 0
    end
    object QryAvailableArinvtEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.ARINVT.EPLANT_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcSelectedArinvt: TDataSource
    DataSet = QrySelectedArinvt
    Left = 412
    Top = 320
  end
  object QrySelectedArinvt: TFDQuery
    BeforeOpen = DoDataSetBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'SELECT a.id AS aka_id, a.arinvt_id, a.cust_itemno, a.cust_descri' +
        'p,'
      '       a.kind, b.itemno, b.descrip, b.descrip2, b.class, b.rev'
      '  FROM aka a, arinvt b'
      ' WHERE a.arcusto_id = :ARCUSTO_ID AND'
      '       b.id = a.arinvt_id')
    Left = 424
    Top = 328
    ParamData = <
      item
        Name = 'ARCUSTO_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QrySelectedArinvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 22
      FieldName = 'ITEMNO'
      Origin = 'b.itemno'
      FixedChar = True
      Size = 50
    end
    object QrySelectedArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'b.descrip'
      Size = 100
    end
    object QrySelectedArinvtDESCRIP2: TStringField
      DisplayLabel = 'Extended Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP2'
      Origin = 'b.descrip2'
      Size = 100
    end
    object QrySelectedArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 12
      FieldName = 'CLASS'
      Origin = 'b.class'
      FixedChar = True
      Size = 2
    end
    object QrySelectedArinvtREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'b.rev'
      FixedChar = True
      Size = 15
    end
    object QrySelectedArinvtKIND: TStringField
      DisplayLabel = 'AKA Kind'
      DisplayWidth = 10
      FieldName = 'KIND'
      Origin = 'a.kind'
      Size = 10
    end
    object QrySelectedArinvtAKA_ID: TBCDField
      FieldName = 'AKA_ID'
      Origin = 'a.id'
      Visible = False
      Size = 0
    end
    object QrySelectedArinvtARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'a.arinvt_id'
      Visible = False
      Size = 0
    end
    object QrySelectedArinvtCUST_ITEMNO: TStringField
      FieldName = 'CUST_ITEMNO'
      Origin = 'a.cust_itemno'
      Visible = False
      FixedChar = True
      Size = 50
    end
    object QrySelectedArinvtCUST_DESCRIP: TStringField
      FieldName = 'CUST_DESCRIP'
      Origin = 'a.cust_descrip'
      Visible = False
      Size = 100
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Customer AKA Assignment'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196852 $'
    BuildVersion = '176554'
    Left = 348
    Top = 65530
  end
  object SrcAKA: TDataSource
    DataSet = QryAka
    Left = 460
    Top = 318
  end
  object SrcAKABreaks: TDataSource
    DataSet = QryAkaBreaks
    Left = 516
    Top = 318
  end
  object QryArinvtLookup: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, itemno, descrip, descrip2, class, rev'
      'from arinvt '
      '')
    Left = 396
    Top = 198
    object QryArinvtLookupID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ARINVT.ID'
      Size = 0
    end
    object QryArinvtLookupITEMNO: TStringField
      FieldName = 'ITEMNO'
      Origin = 'IQ.ARINVT.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryArinvtLookupDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'IQ.ARINVT.DESCRIP'
      Size = 100
    end
    object QryArinvtLookupDESCRIP2: TStringField
      FieldName = 'DESCRIP2'
      Origin = 'IQ.ARINVT.DESCRIP2'
      Size = 100
    end
    object QryArinvtLookupCLASS: TStringField
      FieldName = 'CLASS'
      Origin = 'IQ.ARINVT.CLASS'
      FixedChar = True
      Size = 2
    end
    object QryArinvtLookupREV: TStringField
      FieldName = 'REV'
      Origin = 'IQ.ARINVT.REV'
      FixedChar = True
      Size = 15
    end
  end
  object QryCurrency: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      '  SELECT c1.id,'
      '         c1.curr_code,'
      '         c1.descrip,'
      '         c1.glvalue,'
      '         c1.spot_rate,'
      '         c1.curr_symbol,'
      '         c1.native_curr'
      '    FROM currency c1'
      '   WHERE c1.id = (SELECT MIN(id)'
      '                    FROM currency'
      '                   WHERE curr_code = c1.curr_code)'
      'ORDER BY c1.descrip')
    Left = 400
    Top = 233
    object QryCurrencyCURR_CODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'CURR_CODE'
      Origin = 'IQ.CURRENCY.CURR_CODE'
      Size = 10
    end
    object QryCurrencyDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'IQ.CURRENCY.DESCRIP'
      Size = 50
    end
    object QryCurrencyID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object SrcArinvtBreaks: TDataSource
    DataSet = QryArinvtBreaks
    Left = 454
    Top = 201
  end
  object QryArinvtBreaks: TFDQuery
    Filtered = True
    OnFilterRecord = QryArinvtBreaksFilterRecord
    MasterSource = SrcAKA
    MasterFields = 'ARINVT_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from arinvt_breaks'
      'where arinvt_id = :arinvt_id')
    Left = 462
    Top = 209
    ParamData = <
      item
        Name = 'ARINVT_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryArinvtBreaksQUAN: TBCDField
      DisplayLabel = 'Quantity'
      DisplayWidth = 10
      FieldName = 'QUAN'
      Origin = 'IQ.ARINVT_BREAKS.QUAN'
      Size = 2
    end
    object QryArinvtBreaksQPRICE: TFMTBCDField
      DisplayLabel = 'Price'
      DisplayWidth = 10
      FieldName = 'QPRICE'
      Origin = 'IQ.ARINVT_BREAKS.QPRICE'
      Size = 6
    end
    object QryArinvtBreaksPRICE_DATE: TDateTimeField
      DisplayLabel = 'Price Date'
      DisplayWidth = 18
      FieldName = 'PRICE_DATE'
      Origin = 'IQ.ARINVT_BREAKS.PRICE_DATE'
    end
    object QryArinvtBreaksEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      DisplayWidth = 18
      FieldName = 'EFFECT_DATE'
      Origin = 'IQ.ARINVT_BREAKS.EFFECT_DATE'
    end
    object QryArinvtBreaksDEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Deactive Date'
      DisplayWidth = 18
      FieldName = 'DEACTIVE_DATE'
      Origin = 'IQ.ARINVT_BREAKS.DEACTIVE_DATE'
    end
    object QryArinvtBreaksARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.ARINVT_BREAKS.ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryArinvtBreaksID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ARINVT_BREAKS.ID'
      Visible = False
      Size = 0
    end
    object QryArinvtBreaksBUYING: TStringField
      FieldName = 'BUYING'
      Origin = 'IQ.ARINVT_BREAKS.BUYING'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object QryClassLookup: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '#39' <Not filtered> '#39' as class from dual'
      'union'
      'select distinct class from arinvt'
      'order by class')
    Left = 460
    Top = 262
    object QryClassLookupCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 10
      FieldName = 'CLASS'
      Origin = 'IQ.ARINVT.CLASS'
      FixedChar = True
      Size = 16
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'cmbClassFilter'
      'FormAKA'
      'GridAKA'
      'GridAvailableArinvt'
      'lblFilterByClass'
      'JumptoAKAItem1'
      'JumptoTierTable1'
      'NavAKA_Db'
      'NavAKA_Delete'
      'NavAKA_Insert'
      'NavAKA_Nav'
      'NavAKABreaks_Db'
      'NavAKABreaks_Delete'
      'NavAKABreaks_Insert'
      'NavAKABreaks_Nav'
      'NavMasterInventoryBreaks'
      'sbtnAddAllArinvtToAka'
      'sbtnAddArinvtToAka'
      'sbtnRefreshSelectedList'
      'sbtnRemoveAka'
      'sbtnRemoveAllAka'
      'sbtnSaveList'
      'sbtnToggleHeaderView')
    SecurityCode = 'FRMCRMEDITCUSTOMERAKA'
    Left = 376
    Top = 65530
  end
  object JInventory: TIQWebJump
    DataField = 'ID'
    DataSource = SrcAvailableArinvt
    JumpTo = jtInventory
    Left = 420
    Top = 65533
  end
  object PArinvt: TUniPopupMenu
    Left = 234
    Top = 65528
    object JumpToInventory1: TUniMenuItem
      Caption = 'Jump to Inventory'
      OnClick = JumpToInventory1Click
    end
  end
  object PAka: TUniPopupMenu
    Left = 262
    Top = 65528
    object JumpToInventory2: TUniMenuItem
      Caption = 'Jump to Inventory'
      OnClick = JumpToInventory2Click
    end
  end
  object JInventory2: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = SrcAKA
    JumpTo = jtInventory
    Left = 448
    Top = 65533
  end
  object PSelectedAka: TUniPopupMenu
    OnPopup = PSelectedAkaPopup
    Left = 290
    Top = 65528
    object JumptoAKAItem1: TUniMenuItem
      Caption = 'Jump to AKA Item'
      OnClick = JumptoAKAItem1Click
    end
  end
  object JAka: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = SrcSelectedArinvt
    JumpTo = jtInventory
    Left = 477
    Top = 65533
  end
  object QryAka: TFDQuery
    BeforeOpen = QryAkaBeforeOpen
    BeforeInsert = QryAKABeforeInsert
    BeforeDelete = QryAkaBeforeDelete
    OnNewRecord = QryAKANewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'AKA'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = QryAkaUpdateSQL
    SQL.Strings = (
      'SELECT a.id AS id,'
      '       a.arinvt_id AS arinvt_id,'
      '       a.arcusto_id AS arcusto_id,'
      '       a.cust_itemno AS cust_itemno,'
      '       a.cust_descrip AS cust_descrip,'
      '       a.cust_descrip2 AS cust_descrip2,'
      '       a.cust_rev AS cust_rev,'
      '       a.price_per_1000 AS price_per_1000,'
      '       a.comis_prcnt AS comis_prcnt,'
      '       a.currency_id AS currency_id,'
      '       a.kind AS kind,'
      '       b.itemno AS arinvt_itemno,'
      '       b.descrip AS arinvt_descrip,'
      '       b.descrip2 AS arinvt_descrip2,'
      '       b.class AS arinvt_class,'
      '       b.rev AS arinvt_rev,'
      '       c.curr_code,'
      '       c.descrip AS curr_descrip'
      '  FROM aka a, arinvt b, currency c'
      ' WHERE a.arcusto_id = :arcusto_id AND'
      '       b.id = a.arinvt_id AND'
      '       c.id(+) = a.currency_id')
    Left = 472
    Top = 328
    ParamData = <
      item
        Name = 'arcusto_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryAkaCUST_ITEMNO: TStringField
      DisplayLabel = 'Customer ~Item #'
      DisplayWidth = 13
      FieldName = 'CUST_ITEMNO'
      Origin = 'a.cust_itemno'
      Size = 50
    end
    object QryAkaCUST_DESCRIP: TStringField
      DisplayLabel = 'Customer ~Description'
      DisplayWidth = 14
      FieldName = 'CUST_DESCRIP'
      Origin = 'a.cust_descrip'
      Size = 100
    end
    object QryAkaCUST_DESCRIP2: TStringField
      DisplayLabel = 'Customer ~Extended Description'
      DisplayWidth = 18
      FieldName = 'CUST_DESCRIP2'
      Origin = 'a.cust_descrip2'
      Size = 100
    end
    object QryAkaCUST_REV: TStringField
      DisplayLabel = 'Customer ~Revision'
      DisplayWidth = 18
      FieldName = 'CUST_REV'
      Origin = 'a.cust_rev'
      Size = 15
    end
    object QryAkaKIND: TStringField
      DisplayLabel = 'AKA Kind'
      DisplayWidth = 18
      FieldName = 'KIND'
      Origin = 'a.kind'
      Size = 10
    end
    object QryAkaPRICE_PER_1000: TStringField
      DisplayLabel = 'Price ~Per 1000'
      DisplayWidth = 9
      FieldName = 'PRICE_PER_1000'
      Origin = 'a.price_per_1000'
      Size = 1
    end
    object QryAkaCOMIS_PRCNT: TFMTBCDField
      DisplayLabel = 'Commission ~Percentage'
      DisplayWidth = 11
      FieldName = 'COMIS_PRCNT'
      Origin = 'a.comis_prcnt'
      Size = 6
    end
    object QryAkaCURR_CODE: TStringField
      DisplayLabel = 'Currency Code'
      DisplayWidth = 18
      FieldName = 'CURR_CODE'
      Origin = 'c.curr_code'
      Size = 10
    end
    object QryAkaARINVT_ITEMNO: TStringField
      DisplayLabel = 'Master Inventory ~Item #'
      DisplayWidth = 13
      FieldName = 'ARINVT_ITEMNO'
      Origin = 'b.itemno'
      ReadOnly = True
      Size = 50
    end
    object QryAkaARINVT_DESCRIP: TStringField
      DisplayLabel = 'Master Inventory ~Description'
      DisplayWidth = 13
      FieldName = 'ARINVT_DESCRIP'
      Origin = 'b.descrip'
      ReadOnly = True
      Size = 100
    end
    object QryAkaARINVT_DESCRIP2: TStringField
      DisplayLabel = 'Master Inventory ~Extended Description'
      DisplayWidth = 15
      FieldName = 'ARINVT_DESCRIP2'
      Origin = 'b.descrip2'
      ReadOnly = True
      Size = 100
    end
    object QryAkaARINVT_CLASS: TStringField
      DisplayLabel = 'Master Inventory ~Class'
      DisplayWidth = 13
      FieldName = 'ARINVT_CLASS'
      Origin = 'b.class'
      ReadOnly = True
      Size = 2
    end
    object QryAkaARINVT_REV: TStringField
      DisplayLabel = 'Master Inventory ~Revision'
      DisplayWidth = 13
      FieldName = 'ARINVT_REV'
      Origin = 'b.rev'
      ReadOnly = True
      Size = 15
    end
    object QryAkaCURRENCY_ID: TBCDField
      DisplayLabel = 'Currency'
      DisplayWidth = 10
      FieldName = 'CURRENCY_ID'
      Origin = 'a.currency_id'
      Visible = False
      Size = 0
    end
    object QryAkaID: TBCDField
      DisplayWidth = 18
      FieldName = 'ID'
      Origin = 'a.id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryAkaARINVT_ID: TBCDField
      DisplayWidth = 18
      FieldName = 'ARINVT_ID'
      Origin = 'a.arinvt_id'
      Visible = False
      Size = 0
    end
    object QryAkaARCUSTO_ID: TBCDField
      DisplayWidth = 18
      FieldName = 'ARCUSTO_ID'
      Origin = 'a.arcusto_id'
      Visible = False
      Size = 0
    end
    object QryAkaCURR_DESCRIP: TStringField
      DisplayLabel = 'Currency Description'
      DisplayWidth = 18
      FieldName = 'CURR_DESCRIP'
      Origin = 'c.descrip'
      Visible = False
      Size = 50
    end
  end
  object QryAkaBreaks: TFDQuery
    BeforeInsert = QryAkaBreaksBeforeInsert
    BeforeDelete = QryAkaBreaksBeforeDelete
    OnNewRecord = QryAkaBreaksNewRecord
    Filtered = True
    OnFilterRecord = QryAkaBreaksFilterRecord
    MasterSource = SrcAKA
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.UpdateTableName = 'AKA_BREAKS'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = QryAkaBreaksUpdateSQL
    SQL.Strings = (
      
        'SELECT a.id AS id, a.aka_id AS aka_id, a.quan AS quan, a.qprice ' +
        'AS qprice,'
      '       a.price_date AS price_date, a.effect_date AS effect_date,'
      '       a.deactive_date AS deactive_date'
      '  FROM aka_breaks a'
      ' WHERE a.aka_id = :ID')
    Left = 524
    Top = 328
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryAkaBreaksQUAN: TBCDField
      DisplayLabel = 'Quantity'
      DisplayWidth = 10
      FieldName = 'QUAN'
      Origin = 'IQ.AKA_BREAKS.QUAN'
      Size = 2
    end
    object QryAkaBreaksQPRICE: TFMTBCDField
      DisplayLabel = 'Price'
      DisplayWidth = 10
      FieldName = 'QPRICE'
      Origin = 'IQ.AKA_BREAKS.QPRICE'
      Size = 6
    end
    object QryAkaBreaksPRICE_DATE: TDateTimeField
      DisplayLabel = 'Price Date'
      DisplayWidth = 18
      FieldName = 'PRICE_DATE'
      Origin = 'IQ.AKA_BREAKS.PRICE_DATE'
    end
    object QryAkaBreaksEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      DisplayWidth = 18
      FieldName = 'EFFECT_DATE'
      Origin = 'IQ.AKA_BREAKS.EFFECT_DATE'
    end
    object QryAkaBreaksDEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Deactive Date'
      DisplayWidth = 18
      FieldName = 'DEACTIVE_DATE'
      Origin = 'IQ.AKA_BREAKS.DEACTIVE_DATE'
    end
    object QryAkaBreaksID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.AKA_BREAKS.ID'
      Visible = False
      Size = 0
    end
    object QryAkaBreaksAKA_ID: TBCDField
      FieldName = 'AKA_ID'
      Origin = 'IQ.AKA_BREAKS.AKA_ID'
      Visible = False
      Size = 0
    end
  end
  object PMasterInventoryBreaks: TUniPopupMenu
    Left = 318
    Top = 65528
    object JumptoTierTable1: TUniMenuItem
      Caption = 'Jump to Tier Table'
      OnClick = JumptoTierTable1Click
    end
  end
  object QryAkaUpdateSQL: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'INSERT INTO IQMS.AKA'
      '(ID, ARINVT_ID, CUST_ITEMNO, CUST_DESCRIP, '
      '  ARCUSTO_ID, PRICE_PER_1000, COMIS_PRCNT, '
      '  CURRENCY_ID, CUST_REV, CUST_DESCRIP2, KIND)'
      
        'VALUES (:NEW_ID, :NEW_ARINVT_ID, :NEW_CUST_ITEMNO, :NEW_CUST_DES' +
        'CRIP, '
      '  :NEW_ARCUSTO_ID, :NEW_PRICE_PER_1000, :NEW_COMIS_PRCNT, '
      
        '  :NEW_CURRENCY_ID, :NEW_CUST_REV, :NEW_CUST_DESCRIP2, :NEW_KIND' +
        ')')
    ModifySQL.Strings = (
      'UPDATE IQMS.AKA'
      
        'SET ID = :NEW_ID, ARINVT_ID = :NEW_ARINVT_ID, CUST_ITEMNO = :NEW' +
        '_CUST_ITEMNO, '
      
        '  CUST_DESCRIP = :NEW_CUST_DESCRIP, ARCUSTO_ID = :NEW_ARCUSTO_ID' +
        ', '
      
        '  PRICE_PER_1000 = :NEW_PRICE_PER_1000, COMIS_PRCNT = :NEW_COMIS' +
        '_PRCNT, '
      '  CURRENCY_ID = :NEW_CURRENCY_ID, CUST_REV = :NEW_CUST_REV, '
      '  CUST_DESCRIP2 = :NEW_CUST_DESCRIP2, KIND = :NEW_KIND'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM IQMS.AKA'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, ARINVT_ID, CUST_ITEMNO, CUST_DESCRIP, ARCUSTO_ID, PRI' +
        'CE_PER_1000, '
      '  COMIS_PRCNT, CURRENCY_ID, ECODE, EID, EDATE_TIME, ECOPY, '
      '  CUSER1, CUSER2, CUSER3, CUSER4, CUSER5, NUSER1, NUSER2, '
      '  NUSER3, NUSER4, NUSER5, LM_LABELS_ID, CUST_REV, INFO_SO, '
      '  SHIP_TO_ID, COMMISSIONS_ID, NUSER6, NUSER7, NUSER8, NUSER9, '
      '  NUSER10, IS_DROP_SHIP, PALLET_PATTERN_ID, CUST_DESCRIP2, '
      '  CUSER6, CUSER7, CUSER8, CUSER9, CUSER10, REBATE_PARAMS_ID, '
      '  USE_LOT_CHARGE, LOT_CHARGE, KIND, STANDARD_ID, LEAD_DAYS, '
      '  TOTE_QTY, ILPS_AKA_GROUP_ID, UOM, MULTIPLE, MIN_SELL_QTY, '
      '  PLT_WRP_USE_QC, PLT_WRP_LOC_ID'
      'FROM IQMS.AKA'
      'WHERE ID = :ID')
    Left = 468
    Top = 392
  end
  object QryAkaBreaksUpdateSQL: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'INSERT INTO AKA_BREAKS'
      '(AKA_ID, QUAN, QPRICE, PRICE_DATE, EFFECT_DATE, '
      '  DEACTIVE_DATE, ID)'
      
        'VALUES (:NEW_AKA_ID, :NEW_QUAN, :NEW_QPRICE, :NEW_PRICE_DATE, :N' +
        'EW_EFFECT_DATE, '
      '  :NEW_DEACTIVE_DATE, :NEW_ID)')
    ModifySQL.Strings = (
      'UPDATE AKA_BREAKS'
      
        'SET AKA_ID = :NEW_AKA_ID, QUAN = :NEW_QUAN, QPRICE = :NEW_QPRICE' +
        ', '
      '  PRICE_DATE = :NEW_PRICE_DATE, EFFECT_DATE = :NEW_EFFECT_DATE, '
      '  DEACTIVE_DATE = :NEW_DEACTIVE_DATE'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM AKA_BREAKS'
      'WHERE ID = :OLD_ID')
    Left = 524
    Top = 392
  end
end
