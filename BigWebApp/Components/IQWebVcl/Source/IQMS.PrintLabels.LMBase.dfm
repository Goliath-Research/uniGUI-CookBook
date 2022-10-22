object FrmLM_Base: TFrmLM_Base
  Left = 171
  Top = 127
  HelpContext = 1011348
  ClientHeight = 428
  ClientWidth = 401
  Caption = 'Print Label'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 0
    Width = 401
    Height = 5
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 395
    Width = 401
    Height = 33
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 191
      Top = 1
      Width = 209
      Height = 31
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 6
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 108
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 2
        OnClick = BtnCancelClick
      end
    end
  end
  object PageControl1: TUniPageControl
    Left = 0
    Top = 5
    Width = 401
    Height = 390
    Hint = ''
    ActivePage = TabDimInv
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object TabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'General'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object Panel8: TUniPanel
        Left = 0
        Top = 0
        Width = 393
        Height = 362
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Location: TUniLabel
          Left = 8
          Top = 76
          Width = 26
          Height = 13
          Hint = ''
          Caption = 'Lot #'
          TabOrder = 8
        end
        object Label3: TUniLabel
          Left = 8
          Top = 12
          Width = 23
          Height = 13
          Hint = ''
          Caption = 'Date'
          TabOrder = 9
        end
        object Label1: TUniLabel
          Left = 8
          Top = 116
          Width = 78
          Height = 13
          Hint = ''
          Caption = 'Pk Unit Quantity'
          TabOrder = 10
        end
        object Label5: TUniLabel
          Left = 8
          Top = 36
          Width = 25
          Height = 13
          Hint = ''
          Caption = 'Label'
          TabOrder = 12
        end
        object SBNewLabel: TUniSpeedButton
          Left = 344
          Top = 32
          Width = 22
          Height = 22
          Hint = 'New Label'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FF52392A0A0A0A32B8E650E0EB6FC2DFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3838380A0A0ABEBEBEDC
            DCDCC5C5C5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF797E8E4493A000F6FF0CFFFF00D1FA6D6263FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF818181929292F0F0F0F7
            F7F7D4D4D4636363FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFA2C3D424F8FF60FFFF61FFFF18ECFF0000006F4545FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC5C5C5F2F2F2F8F8F8F8
            F8F8E9E9E9000000494949FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF654419
            65441965441965441933EBF187FFFF89FFFF48FFFF00ACC40000004D1B0A6544
            19654419654419B1A99EFF00FF414141414141414141414141E5E5E5F9F9F9F9
            F9F9F8F8F8ACACAC0000001F1F1F414141414141414141A8A8A8654419F5DCC4
            EFD6BDEFD6BDEFD6BD97D6DC208597379BA3B8FFFF5CFFFF00C1DC0000008964
            58EFD6BDE4CAB1654419414141DADADAD3D3D3D3D3D3D3D3D3D4D4D485858598
            9898FBFBFBF8F8F8C1C1C1000000656565D3D3D3C7C7C7414141654419C3B4A7
            FFEAD5C7B7A6E6D3C036322D7B403A000000437E81C2FFFF62FFFF00CFE60000
            008A7C71F6DFCA654419414141B3B3B3E8E8E8B5B5B5D1D1D131313145454500
            00007C7C7CFCFCFCF8F8F8CECECE0000007B7B7BDDDDDD414141654419C3B8AC
            FFEEDDFFEEDDFFEEDDFFEEDDFFEEDDC5B3A80000002F6A6BC1FFFF6EFFFF00DB
            EF0000008E8379654419414141B7B7B7ECECECECECECECECECECECECECECECB3
            B3B3000000676767FCFCFCF9F9F9D9D9D9000000828282414141654419C3BBB2
            FFF3E60000000F0E0EFFF3E6000000FFF3E61E19190404041A5656B6FFFF79FF
            FF00A0B7000000443041414141BABABAF2F2F20000000E0E0EF2F2F2000000F2
            F2F2191919040404535353FBFBFBF9F9F9A0A0A0000000353535654419C3BEB9
            FFF7F00000000F0F0EFFF7F0000000FFF7F0000000C3BBB7000000004343DBEF
            F0CCC9AE37343C240CBE414141BEBEBEF6F6F60000000F0F0FF6F6F6000000F6
            F6F6000000BBBBBB000000404040EEEEEEC4C4C43636365F5F5F654419C3C0BE
            FFFBF80000000F0F0FFFFBF8000000FFFBF8000000D2CFCC080707A99C999187
            72DCD2D2BAA3FF41178E414141C0C0C0FBFBFB0000000F0F0FFBFBFB000000FB
            FBFB000000CFCFCF0707079D9D9D838383D3D3D3BDBDBD4A4A4A654419C3C2C2
            FFFEFE0000000F0F0FFFFEFE000000FFFEFE000000D2D1D1000000FFFEFE362A
            555326A07B4EBB603D27414141C2C2C2FEFEFE0000000F0F0FFEFEFE000000FE
            FEFE000000D1D1D1000000FEFEFE3737375757577474743D3D3D654419C3C3C3
            FFFFFF0000000F0F0FFFFFFF000000FFFFFF000000D2D2D2000000FFFFFF0000
            00FFFFFFF6F3F2654419414141C3C3C3FFFFFF0000000F0F0FFFFFFF000000FF
            FFFF000000D2D2D2000000FFFFFF000000FFFFFFF3F3F3414141654419C3C3C3
            FFFFFF0000000F0F0FFFFFFF000000FFFFFF000000D2D2D2000000FFFFFF0000
            00FFFFFFF6F3F2654419414141C3C3C3FFFFFF0000000F0F0FFFFFFF000000FF
            FFFF000000D2D2D2000000FFFFFF000000FFFFFFF3F3F3414141654419C3C3C3
            FFFFFF0000000F0F0FFFFFFF000000FFFFFF000000D2D2D2000000FFFFFF0000
            00FFFFFFF6F3F2654419414141C3C3C3FFFFFF0000000F0F0FFFFFFF000000FF
            FFFF000000D2D2D2000000FFFFFF000000FFFFFFF3F3F3414141FF00FFA38F75
            A38F75A38F75A38F75A38F75A38F75A38F75A38F75A38F75A38F75A38F75A38F
            75A38F75A38F75FF00FFFF00FF8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B
            8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8BFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Caption = ''
          ParentColor = False
          Color = clWindow
          TabOrder = 11
          OnClick = SBNewLabelClick
        end
        object Label12: TUniLabel
          Left = 8
          Top = 140
          Width = 75
          Height = 13
          Hint = ''
          Caption = 'Labels Quantity'
          TabOrder = 13
        end
        object lblCountryOfOrigin: TUniLabel
          Left = 8
          Top = 192
          Width = 85
          Height = 13
          Hint = ''
          Caption = 'Country Of Origin'
          TabOrder = 14
        end
        object lblPrinter: TUniLabel
          Left = 8
          Top = 218
          Width = 32
          Height = 13
          Hint = ''
          Caption = 'Printer'
          TabOrder = 15
        end
        object lblLabelDispositionSetting: TUniLabel
          Left = 8
          Top = 245
          Width = 116
          Height = 13
          Hint = ''
          Caption = 'Label Disposition Setting'
          TabOrder = 16
        end
        object LblAkaItemno: TUniLabel
          Left = 8
          Top = 283
          Width = 56
          Height = 13
          Hint = ''
          Caption = 'AKA Item #'
          TabOrder = 18
        end
        object EditQty: TUniEdit
          Left = 152
          Top = 113
          Width = 70
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 3
          OnExit = DoEditBoxExit
        end
        object wwLabels: TUniDBLookupComboBox
          Left = 152
          Top = 33
          Width = 190
          Height = 21
          Hint = ''
          ListFieldIndex = 0
          TabOrder = 1
          Color = clWindow
          OnChange = wwLabelsChange
        end
        object EditLblQty: TUniEdit
          Left = 152
          Top = 137
          Width = 70
          Height = 21
          Hint = ''
          Text = '0'
          TabOrder = 4
          OnExit = DoEditBoxExit
        end
        object edLotNo: TUniEdit
          Left = 152
          Top = 73
          Width = 190
          Height = 21
          Hint = ''
          CharCase = ecUpperCase
          Text = ''
          TabOrder = 2
        end
        object wwDBDateTimePickDate: TUniDBDateTimePicker
          Left = 152
          Top = 9
          Width = 190
          Height = 21
          Hint = ''
          DateTime = 42643.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 0
        end
        object wwDBComboPrinter: TUniDBComboBox
          Left = 152
          Top = 216
          Width = 190
          Height = 21
          Hint = ''
          TabOrder = 6
        end
        object cmbLabelDispositionSetting: TUniComboBox
          Left = 152
          Top = 242
          Width = 190
          Height = 21
          Hint = ''
          Style = csDropDownList
          Text = ''
          TabOrder = 17
        end
        object EdAkaItemno: TUniEdit
          Left = 152
          Top = 281
          Width = 190
          Height = 19
          Hint = ''
          Text = ''
          TabOrder = 7
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
      end
    end
    object TabDimInv: TUniTabSheet
      Hint = ''
      ImageIndex = 2
      Caption = 'Dimensional Inv'
      object pnlDimInvTop: TUniPanel
        Tag = 1999
        Left = 0
        Top = 0
        Width = 393
        Height = 27
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object navDimInv: TUniDBNavigator
          Left = 311
          Top = 1
          Width = 81
          Height = 25
          Hint = ''
          VisibleButtons = [nbPost, nbCancel, nbRefresh]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
        object PnlLegend: TUniPanel
          Left = 279
          Top = 1
          Width = 32
          Height = 25
          Hint = ''
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object shpCalculated: TUniPanel
            Left = 3
            Top = 7
            Width = 10
            Height = 11
            Hint = 'Calculated dimension'
            ShowHint = True
            ParentShowHint = False
            TabOrder = 1
            Caption = ''
          end
        end
      end
      inline gridDimInv: TIQUniGridControl
        Left = 0
        Top = 27
        Width = 393
        Height = 335
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        ExplicitTop = 27
        ExplicitWidth = 393
        ExplicitHeight = 335
        inherited PageControl: TUniPageControl
          Width = 393
          Height = 306
          ExplicitWidth = 393
          ExplicitHeight = 306
        end
        inherited TopToolBar: TUniToolBar
          Width = 393
        end
      end
    end
    object TabSheet2: TUniTabSheet
      Hint = ''
      Caption = 'User-Defined'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object sbUserDefined: TUniScrollBox
        Left = 0
        Top = 0
        Width = 393
        Height = 362
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object PnlUserDefined: TUniPanel
          Left = 0
          Top = 0
          Width = 391
          Height = 252
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object Splitter3: TUniSplitter
            Left = 201
            Top = 1
            Width = 4
            Height = 250
            Hint = ''
            Align = alRight
            ParentColor = False
            Color = clBtnFace
          end
          object PnlClient01: TUniPanel
            Left = 1
            Top = 1
            Width = 200
            Height = 250
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object Splitter1: TUniSplitter
              Left = 82
              Top = 1
              Width = 6
              Height = 248
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object PnlUDLeft01: TUniPanel
              Left = 1
              Top = 1
              Width = 81
              Height = 248
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
            end
            object PnlClient02: TUniPanel
              Left = 88
              Top = 1
              Width = 111
              Height = 248
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              DesignSize = (
                111
                248)
              object dbeCUSER1: TUniEdit
                Left = 1
                Top = 8
                Width = 61
                Hint = ''
                Text = ''
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
              end
              object dbeCUSER2: TUniEdit
                Left = 1
                Top = 32
                Width = 61
                Hint = ''
                Text = ''
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
              end
              object dbeCUSER3: TUniEdit
                Left = 1
                Top = 56
                Width = 61
                Hint = ''
                Text = ''
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
              end
              object dbeCUSER4: TUniEdit
                Left = 1
                Top = 80
                Width = 61
                Hint = ''
                Text = ''
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 3
              end
              object dbeCUSER5: TUniEdit
                Left = 1
                Top = 104
                Width = 61
                Hint = ''
                Text = ''
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 4
              end
              object dbeCUSER6: TUniEdit
                Left = 1
                Top = 128
                Width = 61
                Hint = ''
                Text = ''
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 5
              end
              object dbeCUSER7: TUniEdit
                Left = 1
                Top = 152
                Width = 61
                Hint = ''
                Text = ''
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 6
              end
              object dbeCUSER8: TUniEdit
                Left = 1
                Top = 176
                Width = 61
                Hint = ''
                Text = ''
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 7
              end
              object dbeCUSER9: TUniEdit
                Left = 1
                Top = 200
                Width = 61
                Hint = ''
                Text = ''
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 8
              end
              object dbeCUSER10: TUniEdit
                Left = 1
                Top = 224
                Width = 61
                Hint = ''
                Text = ''
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 9
              end
            end
          end
          object PnlUDRight01: TUniPanel
            Left = 205
            Top = 1
            Width = 185
            Height = 250
            Hint = ''
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object Splitter2: TUniSplitter
              Left = 89
              Top = 1
              Width = 6
              Height = 248
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object PnlUDLeft02: TUniPanel
              Left = 1
              Top = 1
              Width = 88
              Height = 248
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
            end
            object PnlClient03: TUniPanel
              Left = 95
              Top = 1
              Width = 89
              Height = 248
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              DesignSize = (
                89
                248)
              object dbeNUSER1: TUniEdit
                Left = 1
                Top = 8
                Width = 87
                Hint = ''
                Text = ''
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
              end
              object dbeNUSER2: TUniEdit
                Left = 1
                Top = 32
                Width = 87
                Hint = ''
                Text = ''
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
              end
              object dbeNUSER3: TUniEdit
                Left = 1
                Top = 56
                Width = 87
                Hint = ''
                Text = ''
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
              end
              object dbeNUSER4: TUniEdit
                Left = 1
                Top = 80
                Width = 87
                Hint = ''
                Text = ''
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 3
              end
              object dbeNUSER5: TUniEdit
                Left = 1
                Top = 104
                Width = 87
                Hint = ''
                Text = ''
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 4
              end
              object dbeNUSER6: TUniEdit
                Left = 1
                Top = 128
                Width = 87
                Hint = ''
                Text = ''
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 5
              end
              object dbeNUSER7: TUniEdit
                Left = 1
                Top = 152
                Width = 87
                Hint = ''
                Text = ''
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 6
              end
              object dbeNUSER8: TUniEdit
                Left = 1
                Top = 176
                Width = 87
                Hint = ''
                Text = ''
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 7
              end
              object dbeNUSER9: TUniEdit
                Left = 1
                Top = 200
                Width = 87
                Hint = ''
                Text = ''
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 8
              end
              object dbeNUSER10: TUniEdit
                Left = 1
                Top = 224
                Width = 87
                Hint = ''
                Text = ''
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -12
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 9
              end
            end
          end
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 144
    object File1: TUniMenuItem
      Caption = '&File'
      object NewLabel1: TUniMenuItem
        Caption = '&New Label'
        OnClick = SBNewLabelClick
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
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
  object PopupUserDefLabel: TUniPopupMenu
    Left = 172
    object DefineLabelText1: TUniMenuItem
      Caption = '&Define Label Text'
      OnClick = DefineLabelText1Click
    end
  end
end
