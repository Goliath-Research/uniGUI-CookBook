object FrmActivity: TFrmActivity
  Left = 321
  Top = 172
  ClientHeight = 362
  ClientWidth = 481
  Caption = 'Account Activity'
  OnShow = FormShow
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
    Top = 195
    Width = 481
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel9: TUniPanel
    Left = 0
    Top = 0
    Width = 481
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object SBLookUp: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Search'
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
      OnClick = LookupAccount1Click
    end
    object SBGridView: TUniSpeedButton
      Left = 26
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
      OnClick = SBGridViewClick
    end
    object SBDrillDown: TUniSpeedButton
      Left = 57
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Drill Down '
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        0800000000000002000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
        FDFD525BFDFDFDFDFDFDFDFDFDFDFDFDFDFDA4A4FFFDFDFDFDFDFDFDFDFDFDFD
        FD52EDA45BFDFDFDFDFDFDFDFDFDFDFDFDA4FFA4A4FFFDFDFDFDFDFDFDFDFDFD
        5208FFED525BFDFDFDFDFDFDFDFDFDFDA4FFFDFDA4A4FFFDFDFDFDFDFDFDFDFD
        52ED08FFED525BFDFDFDFDFDFDFDFDFDA4A4FFFDFDA4A4FFFDFDFDFDFDFDFDFD
        FD52ED08FF01525BFDFDFDFDFDFDFDFDFDA4A4FFFDA4A4A4FFFDFDFDFDFDFDFD
        FDFD5BEDFF01015BFDFDFDFDFDFDFDFDFDFDA4A4FFA4A4A4FFFDFDFDFDFDFDFD
        FDFD01151615015BFDFDFDFDFDFDFDFDFDFDA4A4A4A4A4A4FFFDFDFDFDFDFDFD
        FD52ED0708165D5DFDFDFDFDFDFDFDFDFDA4A4FDFDA4A4A4FDFDFDFDFDFDFDFD
        52ED0708FF5D5DFDFDFDFDFDFDFDFDFDA4A4FFFDFDA4A4FDFDFDFDFDFDFDFD00
        A45208FFFF5DFDFDFDFDFDFDFDFDFDA4A4A4FFFDFDA4FDFDFDFDFDFDFDFDFDA4
        ADA565FF65FDFDFDFDFDFDFDFDFDFDA4FFA4A4FFA4FDFDFDFDFDFDFDFDFDFD00
        AFAFA465FDFDFDFDFDFDFDFDFDFDFDA4FFFFA4A4FDFDFDFDFDFDFDFDFDFDFD9B
        005D65FDFDFDFDFDFDFDFDFDFDFDFDA4A4A4A4FDFDFDFDFDFDFDFDFDFDFD9BFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDA4FDFDFDFDFDFDFDFDFDFDFDFDFDFD9BFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDA4FDFDFDFDFDFDFDFDFDFDFDFDFDFD9BFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDA4FDFDFDFDFDFDFDFDFDFDFDFDFD}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = DrillDown1Click
    end
    object Bevel1: TUniPanel
      Left = 53
      Top = 3
      Width = 2
      Height = 21
      Hint = ''
      TabOrder = 5
      Caption = ''
    end
    object NavMain: TUniDBNavigator
      Left = 380
      Top = 1
      Width = 100
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcGLAcct
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 27
    Width = 481
    Height = 168
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 191
      Top = 1
      Width = 6
      Height = 129
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel2: TUniPanel
      Left = 197
      Top = 1
      Width = 283
      Height = 129
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = 'Panel2'
      object PageControl1: TUniPageControl
        Left = 1
        Top = 1
        Width = 281
        Height = 127
        Hint = ''
        ActivePage = TabGrid
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object TabGrid: TUniTabSheet
          Hint = ''
          TabVisible = False
          Caption = 'TabGrid'
          object DBGridAccounts: TUniDBGrid
            Left = 0
            Top = 0
            Width = 273
            Height = 99
            Hint = ''
            DataSource = SrcGLAcct
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTabs, dgCancelOnExit]
            LoadMask.Message = 'Loading data...'
            OnDblClick = BtnApplyClick
            OnEnter = DBGridAccountsEnter
            OnKeyDown = DBGridAccountsKeyDown
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Columns = <
              item
                FieldName = 'DESCRIP'
                Title.Caption = 'Description'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'ACCT'
                Title.Caption = 'Account #'
                Width = 144
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'EPLANT_ID'
                Title.Caption = 'EPlant ID'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end>
          end
        end
        object TabForm: TUniTabSheet
          Hint = ''
          TabVisible = False
          Caption = 'TabForm'
          object PnlFormView: TUniPanel
            Tag = 1999
            Left = 0
            Top = 0
            Width = 273
            Height = 99
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object Splitter4: TUniSplitter
              Left = 82
              Top = 1
              Width = 6
              Height = 97
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object PnlFormViewLeft: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 81
              Height = 97
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              object Label3: TUniLabel
                Left = 8
                Top = 12
                Width = 39
                Height = 13
                Hint = ''
                Caption = 'Account'
                TabOrder = 1
              end
              object Label4: TUniLabel
                Left = 8
                Top = 36
                Width = 53
                Height = 13
                Hint = ''
                Caption = 'Description'
                TabOrder = 2
              end
              object Label7: TUniLabel
                Left = 8
                Top = 60
                Width = 44
                Height = 13
                Hint = ''
                Caption = 'EPlant ID'
                TabOrder = 3
              end
            end
            object PnlFormViewClient: TUniPanel
              Tag = 1999
              Left = 88
              Top = 1
              Width = 184
              Height = 97
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              object DBEditAccount: TUniDBEdit
                Left = 0
                Top = 8
                Width = 150
                Height = 21
                Hint = ''
                DataField = 'ACCT'
                DataSource = SrcGLAcct
                TabOrder = 0
                Color = clBtnFace
                ReadOnly = True
              end
              object DBEditDescript: TUniDBEdit
                Left = 0
                Top = 32
                Width = 149
                Height = 21
                Hint = ''
                DataField = 'DESCRIP'
                DataSource = SrcGLAcct
                TabOrder = 1
                Color = clBtnFace
                ReadOnly = True
              end
              object DBEplantID: TUniDBEdit
                Left = 0
                Top = 56
                Width = 149
                Height = 21
                Hint = ''
                DataField = 'EPLANT_ID'
                DataSource = SrcGLAcct
                TabOrder = 2
                Color = clBtnFace
                ReadOnly = True
              end
            end
          end
        end
      end
    end
    object Panel6: TUniPanel
      Left = 1
      Top = 130
      Width = 479
      Height = 37
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Label6: TUniLabel
        Left = 12
        Top = 12
        Width = 48
        Height = 13
        Hint = ''
        Caption = 'Evaluated'
        TabOrder = 4
      end
      object Panel7: TUniPanel
        Left = 343
        Top = 1
        Width = 135
        Height = 35
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object BtnApply: TUniButton
          Left = 1
          Top = 6
          Width = 129
          Height = 27
          Hint = ''
          Caption = 'Apply Selection'
          TabOrder = 1
          OnClick = BtnApplyClick
        end
      end
      object edAccount: TUniEdit
        Left = 66
        Top = 9
        Width = 95
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 1
        Color = clBtnFace
      end
      object edDescrip: TUniEdit
        Left = 167
        Top = 9
        Width = 174
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 2
        Color = clBtnFace
      end
    end
    object PnlFilter: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 190
      Height = 129
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 2
      Caption = ''
      object Splitter3: TUniSplitter
        Left = 82
        Top = 1
        Width = 6
        Height = 127
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object PnlFilterLeft: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 81
        Height = 127
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Label5: TUniLabel
          Left = 8
          Top = 12
          Width = 51
          Height = 13
          Hint = ''
          Caption = 'Fiscal Year'
          TabOrder = 1
        end
        object Label1: TUniLabel
          Left = 8
          Top = 84
          Width = 24
          Height = 13
          Hint = ''
          Caption = 'From'
          TabOrder = 2
        end
        object Label2: TUniLabel
          Left = 8
          Top = 112
          Width = 12
          Height = 13
          Hint = ''
          Caption = 'To'
          TabOrder = 3
        end
      end
      object PnlFilterLeftClient: TUniPanel
        Tag = 1999
        Left = 88
        Top = 1
        Width = 101
        Height = 127
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        ExplicitLeft = 84
        ExplicitTop = 0
        ExplicitWidth = 106
        ExplicitHeight = 131
        DesignSize = (
          101
          127)
        object DBLookupComboBoxGlYear: TUniDBLookupComboBox
          Left = 0
          Top = 8
          Width = 102
          Height = 21
          Hint = ''
          ListField = 'DESCRIP'
          ListSource = SrcGlYear
          KeyField = 'ID'
          ListFieldIndex = 0
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Color = clWindow
          OnCloseUp = DBLookupComboBoxGlYearCloseUp
          OnEnter = Reset_Button_Grid_FrmDrillDown
        end
        object RBPeriod: TUniRadioButton
          Left = 0
          Top = 39
          Width = 50
          Height = 17
          Hint = ''
          Checked = True
          Caption = 'Period'
          TabOrder = 1
          OnClick = RBPeriodClick
        end
        object RBDate: TUniRadioButton
          Left = 0
          Top = 56
          Width = 45
          Height = 17
          Hint = ''
          Caption = 'Date '
          TabOrder = 2
          OnClick = RBDateClick
        end
        object EditFromDate: TUniDateTimePicker
          Left = 0
          Top = 80
          Width = 99
          Height = 21
          Hint = ''
          DateTime = 42688.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 3
          OnEnter = Reset_Button_Grid_FrmDrillDown
        end
        object EditToDate: TUniDateTimePicker
          Left = 0
          Top = 104
          Width = 99
          Height = 21
          Hint = ''
          DateTime = 42688.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 4
          OnEnter = Reset_Button_Grid_FrmDrillDown
        end
      end
    end
  end
  object Panel4: TUniPanel
    Left = 0
    Top = 198
    Width = 481
    Height = 164
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = 'Panel4'
    object DBGridPeriods: TUniDBGrid
      Left = 1
      Top = 1
      Width = 479
      Height = 162
      Hint = ''
      DataSource = SrcQry
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTabs, dgCancelOnExit]
      LoadMask.Message = 'Loading data...'
      OnDblClick = DrillDown1Click
      OnEnter = DBGridPeriodsEnter
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Columns = <
        item
          FieldName = 'PERIOD'
          Title.Caption = 'Period'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BEGINNING'
          Title.Caption = 'Beginning'
          Width = 80
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TOTAL_DEBIT'
          Title.Caption = 'Debit'
          Width = 80
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TOTAL_CREDIT'
          Title.Caption = 'Credit'
          Width = 80
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TOTAL'
          Title.Caption = 'Period Total'
          Width = 80
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BALANCE'
          Title.Caption = 'Balance'
          Width = 80
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BUDGETED'
          Title.Caption = 'Budgeted'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TOTAL_STAT_VALUE'
          Title.Caption = 'Stat. Value'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Cumm_stat_Value'
          Title.Caption = 'YTD Stat Value'
          Width = 75
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REPCUR_PERIOD_CREDIT'
          Title.Caption = 'Report Curr. Credit'
          Width = 97
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REPCUR_PERIOD_DEBIT'
          Title.Caption = 'Report Curr. Debit'
          Width = 93
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 136
    Top = 4
    object Options1: TUniMenuItem
      Caption = '&File'
      object DrillDown2: TUniMenuItem
        Caption = '&Drill Down'
        OnClick = DrillDown1Click
      end
      object LookupAccount1: TUniMenuItem
        Caption = '&Search'
        OnClick = LookupAccount1Click
      end
      object ShowCriteria1: TUniMenuItem
        Caption = 'Show Criteria'
        Checked = True
        Visible = False
        OnClick = ShowCriteria1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Reports1: TUniMenuItem
      Caption = 'Reports'
      object Print1: TUniMenuItem
        Caption = '&Print'
        OnClick = Print1Click
      end
      object PrintSetup1: TUniMenuItem
        Caption = 'Print &Setup'
        OnClick = PrintSetup1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
    object Debug1: TUniMenuItem
      Caption = '&Debug'
      Visible = False
      object Show1: TUniMenuItem
        Caption = '&Show'
        OnClick = Show1Click
      end
      object Clear1: TUniMenuItem
        Caption = '&Clear'
        OnClick = Clear1Click
      end
    end
  end
  object SrcGLAcct: TDataSource
    DataSet = TblGlAcct
    Left = 276
    Top = 301
  end
  object TblGlAcct: TFDTable
    BeforeOpen = TblGlAcctBeforeOpen
    AfterScroll = TblGlAcctAfterScroll
    OnCalcFields = TblGlAcctCalcFields
    Filtered = True
    IndexFieldNames = 'ACCT'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'V_GLACCT_GLSUB_ACCT_TYPE'
    TableName = 'V_GLACCT_GLSUB_ACCT_TYPE'
    Left = 278
    Top = 314
    object TblGlAcctID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object TblGlAcctACCT: TStringField
      FieldName = 'ACCT'
      Required = True
      Size = 50
    end
    object TblGlAcctDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 50
    end
    object TblGlAcctGL_SUBACCT_TYPE_ID: TBCDField
      FieldName = 'GL_SUBACCT_TYPE_ID'
      Size = 0
    end
    object TblGlAcctnFromDate: TDateField
      FieldKind = fkCalculated
      FieldName = 'nFromDate'
      Calculated = True
    end
    object TblGlAcctnToDate: TDateField
      FieldKind = fkCalculated
      FieldName = 'nToDate'
      Calculated = True
    end
    object TblGlAcctnGlYearId: TFloatField
      FieldKind = fkCalculated
      FieldName = 'nGlYearId'
      Calculated = True
    end
    object TblGlAcctnFromBatchDate: TDateField
      FieldKind = fkCalculated
      FieldName = 'nFromBatchDate'
      Calculated = True
    end
    object TblGlAcctnToBatchDate: TDateField
      FieldKind = fkCalculated
      FieldName = 'nToBatchDate'
      Calculated = True
    end
    object TblGlAcctTYPE: TStringField
      FieldName = 'TYPE'
      Required = True
      Size = 35
    end
    object TblGlAcctMAJORTYPE: TStringField
      FieldName = 'MAJORTYPE'
      Size = 35
    end
    object TblGlAcctEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object QryPeriod: TFDQuery
    Tag = 1
    BeforeOpen = QryPeriodBeforeOpen
    AfterOpen = QryPeriodAfterOpen
    OnCalcFields = QryPeriodCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select p.period,'
      '       v.glyear_id,'
      '       v.glacct_id,'
      '       v.glperiods_id   as period_id,'
      '       v.period_credit  as Total_Credit,'
      '       v.period_debit   as Total_Debit,'
      '       v.period_balance as Total,'
      '       v.stat_value     as total_stat_value,'
      '       case'
      
        '         when :nGLYearId1 = decode(gl_misc.IsActiveForThisYear(:' +
        'nGLYearId2, :nGlAcctId1), 1, :nGLYearId3, gl_misc.GetPrevYear_id' +
        '(:nGLYearId4)) then'
      '           v.period_beginning_balance'
      '         else v.period_end_balance'
      '       end as Beginning, '
      '       v.period_end_balance as Balance,'
      '       NVL(b.budamount, 0) as budgeted,'
      '       v.repcur_period_debit, '
      '       v.repcur_period_credit '
      '       '
      '  from v_glacct_re v,'
      '       glperiods p,'
      '       (select z.glperiods_id,'
      '               x.glacct_fy_id,'
      '               z.budamount'
      '          from (select glacct_fy_id,'
      '                       min(id) as id '
      '                  from budgets_fy'
      '                 group by glacct_fy_id) x,'
      '                glbudget z'
      '          where z.budgets_fy_id = x.id) b'
      ' where p.id = v.glperiods_id'
      
        '   and (NVL(v.period_debit, 0) <> 0 or NVL(v.period_credit, 0) <' +
        '> 0 or NVL(v.stat_value, 0) <> 0)'
      
        '   and v.glyear_id = decode(gl_misc.IsActiveForThisYear(:nGLYear' +
        'Id5, :nGlAcctId2), 1, :nGLYearId6, gl_misc.GetPrevYear_id(:nGLYe' +
        'arId7))'
      '   and v.glacct_id = :nGlAcctId3'
      '   and b.glperiods_id(+) = v.glperiods_id'
      
        '   and b.glacct_fy_id(+) = GL_GLACCT_FY_ID(v.glacct_id, v.glyear' +
        '_id)'
      
        '   and ( (gl_misc.IsActiveForThisYear(:nGLYearId8, :nGlAcctId4) ' +
        '= 1'
      '         )'
      '        or '
      
        '         (gl_misc.IsActiveForThisYear(:nGLYearId9, :nGlAcctId5) ' +
        '= 0 and p.id = gl_misc.GetPrevYearEndPeriod_Id(:nGLYearId10)'
      '          )'
      '       )'
      '   '
      ' order by v.glyear_id, p.period'
      ''
      ''
      ''
      ' '
      ' ')
    Left = 204
    Top = 301
    ParamData = <
      item
        Name = 'NGLYEARID1'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLYEARID2'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLACCTID1'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLYEARID3'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLYEARID4'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLYEARID5'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLACCTID2'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLYEARID6'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLYEARID7'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLACCTID3'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLYEARID8'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLACCTID4'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLYEARID9'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLACCTID5'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLYEARID10'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryPeriodPERIOD: TBCDField
      FieldName = 'PERIOD'
      Size = 0
    end
    object QryPeriodGLYEAR_ID: TBCDField
      FieldName = 'GLYEAR_ID'
      Size = 0
    end
    object QryPeriodGLACCT_ID: TBCDField
      FieldName = 'GLACCT_ID'
      Size = 0
    end
    object QryPeriodPERIOD_ID: TBCDField
      FieldName = 'PERIOD_ID'
      Size = 0
    end
    object QryPeriodGlYear_Descrip: TStringField
      FieldKind = fkLookup
      FieldName = 'GlYear_Descrip'
      LookupDataSet = TblGlYear
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'GLYEAR_ID'
      Lookup = True
    end
    object QryPeriodTOTAL_CREDIT: TBCDField
      FieldName = 'TOTAL_CREDIT'
      currency = True
      Size = 2
    end
    object QryPeriodTOTAL_DEBIT: TBCDField
      FieldName = 'TOTAL_DEBIT'
      currency = True
      Size = 2
    end
    object QryPeriodnFromBatchDate: TDateField
      FieldKind = fkCalculated
      FieldName = 'nFromBatchDate'
      Calculated = True
    end
    object QryPeriodnToBatchDate: TDateField
      FieldKind = fkCalculated
      FieldName = 'nToBatchDate'
      Calculated = True
    end
    object QryPeriodTOTAL: TBCDField
      FieldName = 'TOTAL'
      currency = True
      Size = 2
    end
    object QryPeriodBEGINNING: TFMTBCDField
      FieldName = 'BEGINNING'
      currency = True
      Size = 38
    end
    object QryPeriodBALANCE: TFMTBCDField
      FieldName = 'BALANCE'
      currency = True
      Size = 38
    end
    object QryPeriodBUDGETED: TFMTBCDField
      FieldName = 'BUDGETED'
      currency = True
      Size = 38
    end
    object QryPeriodTOTAL_STAT_VALUE: TFMTBCDField
      FieldName = 'TOTAL_STAT_VALUE'
      Size = 6
    end
    object QryPeriodCumm_stat_Value: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Cumm_stat_Value'
      Calculated = True
    end
    object QryPeriodREPCUR_PERIOD_DEBIT: TBCDField
      FieldName = 'REPCUR_PERIOD_DEBIT'
      Size = 2
    end
    object QryPeriodREPCUR_PERIOD_CREDIT: TBCDField
      FieldName = 'REPCUR_PERIOD_CREDIT'
      Size = 2
    end
  end
  object SrcQry: TDataSource
    DataSet = QryPeriod
    OnDataChange = SrcQryDataChange
    Left = 132
    Top = 301
  end
  object QryDate: TFDQuery
    Tag = 1
    BeforeOpen = QryPeriodBeforeOpen
    AfterOpen = QryPeriodAfterOpen
    OnCalcFields = QryDateCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.period,'
      '       v.glyear_id,'
      '       v.glacct_id,'
      '       v.period_id,'
      '       Sum(NVL(v.repcur_debit, 0)) as repcur_period_debit,'
      '       Sum(NVL(v.repcur_credit, 0)) as repcur_period_credit, '
      '       Sum(NVL(v.batch_credit, 0)) as Total_Credit,'
      '       Sum(NVL(v.batch_debit, 0)) as Total_Debit,'
      '       Sum(NVL(v.batch_stat_value, 0)) as total_stat_value,'
      
        '       Sum(NVL(v.batch_debit, 0)) - Sum(NVL(v.batch_credit, 0)) ' +
        'as Total,'
      '       NVL(b.budamount, 0) as budgeted'
      '  from v_glperiods_batch v,'
      '       (select z.glperiods_id,'
      '               x.glacct_fy_id,'
      '               z.budamount'
      '          from (select glacct_fy_id,'
      '                       min(id) as id '
      '                  from budgets_fy'
      '                 group by glacct_fy_id) x,'
      '                glbudget z'
      '          where z.budgets_fy_id = x.id) b'
      
        ' where v.glyear_id = decode(gl_misc.IsActiveForThisYear(:nGlYear' +
        'Id1, :nGlAcctId1), 1, :nGlYearId2, gl_misc.GetPrevYear_id(:nGlYe' +
        'arId3))'
      
        '   and ( (gl_misc.IsActiveForThisYear(:nGlYearId4, :nGlAcctId2) ' +
        '= 1 and v.batch_date between :nFromDate and :nToDate'
      '         )'
      '        or '
      
        '         (gl_misc.IsActiveForThisYear(:nGlYearId5, :nGlAcctId3) ' +
        '= 0'
      '          )'
      '       )'
      ''
      '   and v.glacct_id = :nGlAcctId4'
      '   and b.glperiods_id(+) = v.period_id'
      
        '   and b.glacct_fy_id(+) = GL_GLACCT_FY_ID(v.glacct_id, v.glyear' +
        '_id)'
      
        '   and ( (gl_misc.IsActiveForThisYear(:nGlYearId6, :nGlAcctId5) ' +
        '= 1'
      '         )'
      '        or '
      
        '         (gl_misc.IsActiveForThisYear(:nGlYearId7, :nGlAcctId6) ' +
        '= 0 and v.period_id = gl_misc.GetPrevYearEndPeriod_Id(:nGlYearId' +
        '8)'
      '          )'
      '       )'
      ''
      'group by v.glyear_id,'
      '         v.period_id,'
      '         v.period,'
      '         v.glacct_id,'
      '         b.budamount'
      'order by v.glyear_id, v.period'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 172
    Top = 301
    ParamData = <
      item
        Name = 'NGLYEARID1'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLACCTID1'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLYEARID2'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLYEARID3'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLYEARID4'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLACCTID2'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'nFromDate'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'nToDate'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'NGLYEARID5'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLACCTID3'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLACCTID4'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLYEARID6'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLACCTID5'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLYEARID7'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLACCTID6'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLYEARID8'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryDatePERIOD: TBCDField
      FieldName = 'PERIOD'
      Size = 0
    end
    object QryDateGLYEAR_ID: TBCDField
      FieldName = 'GLYEAR_ID'
      Size = 0
    end
    object QryDateGLACCT_ID: TBCDField
      FieldName = 'GLACCT_ID'
      Size = 0
    end
    object QryDatePERIOD_ID: TBCDField
      FieldName = 'PERIOD_ID'
      Size = 0
    end
    object QryDateTOTAL_CREDIT: TFMTBCDField
      FieldName = 'TOTAL_CREDIT'
      currency = True
      Size = 38
    end
    object QryDateGlYear_Descrip: TStringField
      FieldKind = fkLookup
      FieldName = 'GlYear_Descrip'
      LookupDataSet = TblGlYear
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'GLYEAR_ID'
      Lookup = True
    end
    object QryDateTOTAL_DEBIT: TFMTBCDField
      FieldName = 'TOTAL_DEBIT'
      currency = True
      Size = 38
    end
    object QryDateBalance: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Balance'
      currency = True
      Calculated = True
    end
    object QryDateBeginning: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Beginning'
      currency = True
      Calculated = True
    end
    object QryDatenFromBatchDate: TDateField
      FieldKind = fkCalculated
      FieldName = 'nFromBatchDate'
      Calculated = True
    end
    object QryDatenToBatchDate: TDateField
      FieldKind = fkCalculated
      FieldName = 'nToBatchDate'
      Calculated = True
    end
    object QryDateTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      currency = True
      Size = 38
    end
    object QryDateBUDGETED: TFMTBCDField
      FieldName = 'BUDGETED'
      currency = True
      Size = 38
    end
    object QryDateTOTAL_STAT_VALUE: TFMTBCDField
      FieldName = 'TOTAL_STAT_VALUE'
      Size = 38
    end
    object QryDateCumm_stat_Value: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Cumm_stat_Value'
      Calculated = True
    end
    object QryDateREPCUR_PERIOD_DEBIT: TFMTBCDField
      FieldName = 'REPCUR_PERIOD_DEBIT'
      currency = True
      Size = 38
    end
    object QryDateREPCUR_PERIOD_CREDIT: TFMTBCDField
      FieldName = 'REPCUR_PERIOD_CREDIT'
      currency = True
      Size = 38
    end
  end
  object TblGlAccountPeriodSummary: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'C_GLACCT_PERIOD_SUMMARY'
    TableName = 'C_GLACCT_PERIOD_SUMMARY'
    Left = 200
    Top = 264
    object TblGlAccountPeriodSummaryGLPERIODS_ID: TBCDField
      FieldName = 'GLPERIODS_ID'
      Size = 0
    end
    object TblGlAccountPeriodSummaryGLACCT_ID: TBCDField
      FieldName = 'GLACCT_ID'
      Required = True
      Size = 0
    end
    object TblGlAccountPeriodSummaryPERIOD_DEBIT: TBCDField
      FieldName = 'PERIOD_DEBIT'
      Size = 2
    end
    object TblGlAccountPeriodSummaryPERIOD_CREDIT: TBCDField
      FieldName = 'PERIOD_CREDIT'
      Size = 2
    end
    object TblGlAccountPeriodSummaryPERIOD_BALANCE: TBCDField
      FieldName = 'PERIOD_BALANCE'
      Size = 2
    end
  end
  object TblGlYear: TFDTable
    Filtered = True
    OnFilterRecord = TblGlYearFilterRecord
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLYEAR'
    TableName = 'GLYEAR'
    Left = 44
    Top = 301
    object TblGlYearID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object TblGlYearDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Required = True
      Size = 25
    end
    object TblGlYearSTART_DATE: TDateTimeField
      FieldName = 'START_DATE'
      Required = True
    end
    object TblGlYearEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
      Required = True
    end
  end
  object SrcGlYear: TDataSource
    DataSet = TblGlYear
    Left = 44
    Top = 315
  end
  object PopupMenu1: TUniPopupMenu
    Left = 164
    Top = 4
    object DrillDown1: TUniMenuItem
      Caption = 'Drill Down'
      OnClick = DrillDown1Click
    end
    object ShowCriteria2: TUniMenuItem
      Caption = 'Show Criteria'
      Checked = True
      Visible = False
      OnClick = ShowCriteria1Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object BudgetInfo1: TUniMenuItem
      Caption = '&Budget Info'
      OnClick = BudgetInfo1Click
    end
  end
  object TblGlPeriods: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLPERIODS'
    TableName = 'GLPERIODS'
    Left = 268
    Top = 264
    object TblGlPeriodsID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object TblGlPeriodsGLYEAR_ID: TBCDField
      FieldName = 'GLYEAR_ID'
      Required = True
      Size = 0
    end
    object TblGlPeriodsPERIOD: TBCDField
      FieldName = 'PERIOD'
      Required = True
      Size = 0
    end
    object TblGlPeriodsSTART_DATE: TDateTimeField
      FieldName = 'START_DATE'
      Required = True
    end
    object TblGlPeriodsEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
      Required = True
    end
    object TblGlPeriodsSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 2
    end
  end
  object QryBatchId: TFDQuery
    AfterScroll = QryBatchIdAfterScroll
    OnCalcFields = QryBatchIdCalcFields
    MasterSource = SrcQry
    MasterFields = 'PERIOD_ID;GLACCT_ID;GLYEAR_ID;nFromBatchDate;nToBatchDate'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select glyear_id,'
      '       glacct_id,'
      '       period_id,'
      '       batch_id,'
      '       batch_date,'
      '       userid,'
      '       batchnumber,'
      '       source,'
      '       Sum(NVL(batch_credit, 0)) as Total_Credit,'
      '       Sum(NVL(batch_debit, 0)) as Total_Debit,'
      
        '       Sum(NVL(batch_debit, 0)) - Sum(NVL(batch_credit, 0)) as B' +
        'alance'
      '  from v_glperiods_batch'
      'where period_id = :PERIOD_ID'
      '   and glacct_id = :GLACCT_ID'
      '   and glyear_id = :GLYEAR_ID'
      '   and batch_date between :nFromBatchDate and :nToBatchDate'
      ' group by glyear_id,'
      '         period_id,'
      '         period,'
      '         glacct_id,'
      '         batch_id,'
      '         batch_date,'
      '         userid,'
      '         batchnumber,'
      '         source'
      '--order by glyear_id, period_id, batch_id')
    Left = 140
    Top = 264
    ParamData = <
      item
        Name = 'PERIOD_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'GLACCT_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'GLYEAR_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'nFromBatchDate'
        DataType = ftDate
        ParamType = ptInput
        Size = 4
      end
      item
        Name = 'nToBatchDate'
        DataType = ftDate
        ParamType = ptInput
        Size = 4
      end>
    object QryBatchIdBATCH_ID: TBCDField
      DisplayLabel = 'GLBatchID ID'
      DisplayWidth = 10
      FieldName = 'BATCH_ID'
      Origin = 'BATCH_ID'
      Size = 0
    end
    object QryBatchIdBATCH_DATE: TDateTimeField
      DisplayLabel = 'Date'
      DisplayWidth = 6
      FieldName = 'BATCH_DATE'
      Origin = 'BATCH_DATE'
    end
    object QryBatchIdBATCHNUMBER: TBCDField
      DisplayLabel = 'Batch'
      DisplayWidth = 10
      FieldName = 'BATCHNUMBER'
      Origin = 'BATCHNUMBER'
      Size = 0
    end
    object QryBatchIdSOURCE: TStringField
      DisplayLabel = 'Src'
      DisplayWidth = 2
      FieldName = 'SOURCE'
      Origin = 'SOURCE'
      Size = 2
    end
    object QryBatchIdTOTAL_DEBIT: TFMTBCDField
      DisplayLabel = 'Debit'
      DisplayWidth = 10
      FieldName = 'TOTAL_DEBIT'
      Origin = 'Sum(NVL(batch_debit, 0))'
      currency = True
      Size = 38
    end
    object QryBatchIdTOTAL_CREDIT: TFMTBCDField
      DisplayLabel = 'Credit'
      DisplayWidth = 10
      FieldName = 'TOTAL_CREDIT'
      Origin = 'Sum(NVL(batch_credit, 0))'
      currency = True
      Size = 38
    end
    object QryBatchIdBALANCE: TFMTBCDField
      DisplayLabel = 'Batch Total'
      DisplayWidth = 10
      FieldName = 'BALANCE'
      Origin = 'Sum(NVL(batch_debit, 0)) - Sum(NVL(batch_credit, 0))'
      currency = True
      Size = 38
    end
    object QryBatchIdOnHand: TFloatField
      DisplayLabel = 'Balance'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'OnHand'
      currency = True
      Calculated = True
    end
    object QryBatchIdUSERID: TStringField
      DisplayLabel = 'UserID'
      DisplayWidth = 10
      FieldName = 'USERID'
      Origin = 'USERID'
      Size = 35
    end
    object QryBatchIdRunningTotal: TFloatField
      DisplayLabel = 'Running Balance'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'RunningTotal'
      currency = True
      Calculated = True
    end
    object QryBatchIdGLYEAR_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'GLYEAR_ID'
      Origin = 'GLYEAR_ID'
      Visible = False
      Size = 0
    end
    object QryBatchIdGLACCT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'GLACCT_ID'
      Origin = 'GLACCT_ID'
      Visible = False
      Size = 0
    end
    object QryBatchIdPERIOD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PERIOD_ID'
      Origin = 'PERIOD_ID'
      Visible = False
      Size = 0
    end
  end
  object TblGlBatchId: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLBATCHID'
    TableName = 'GLBATCHID'
    Left = 236
    Top = 264
  end
  object SrcTblBatchId: TDataSource
    DataSet = QryBatchId
    OnDataChange = SrcTblBatchIdDataChange
    Left = 124
    Top = 264
  end
  object QryBatchOld: TFDQuery
    Tag = 1
    MasterSource = SrcTblBatchId
    MasterFields = 'BATCH_ID;GLACCT_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'Select DESCRIP,'
      '       DEBIT,'
      '       CREDIT,'
      '       STAT_VALUE,'
      '       glbatchid_id,'
      '       header_id,'
      '       reference,'
      '       ref_code,'
      '       cost_object_id,'
      '       cost_object_source,'
      '       id'
      '  from glbatch'
      ' where glbatchid_id = :BATCH_ID'
      '   and glacct_id = :GLACCT_ID     ')
    Left = 76
    Top = 272
    ParamData = <
      item
        Name = 'BATCH_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'GLACCT_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryBatchOldDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'GLBATCH.DESCRIP'
      Size = 120
    end
    object QryBatchOldDEBIT: TBCDField
      DisplayLabel = 'Debit'
      DisplayWidth = 10
      FieldName = 'DEBIT'
      currency = True
      Size = 2
    end
    object QryBatchOldCREDIT: TBCDField
      DisplayLabel = 'Credit'
      DisplayWidth = 10
      FieldName = 'CREDIT'
      currency = True
      Size = 2
    end
    object QryBatchOldREFERENCE: TStringField
      DisplayLabel = 'Reference'
      DisplayWidth = 20
      FieldName = 'REFERENCE'
      Origin = 'GLBATCH.REFERENCE'
      Size = 60
    end
    object QryBatchOldREF_CODE: TStringField
      DisplayLabel = 'Ref Code'
      DisplayWidth = 10
      FieldName = 'REF_CODE'
      Origin = 'GLBATCH.REF_CODE'
      Size = 10
    end
    object QryBatchOldCost_Source: TStringField
      DisplayLabel = 'Cost Source'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'Cost_Source'
      Size = 60
      Calculated = True
    end
    object QryBatchOldSTAT_VALUE: TFMTBCDField
      DisplayLabel = 'Stat. Value'
      DisplayWidth = 10
      FieldName = 'STAT_VALUE'
      Origin = 'IQ.GLBATCH.STAT_VALUE'
      Size = 6
    end
    object QryBatchOldGLBATCHID_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'GLBATCHID_ID'
      Visible = False
      Size = 0
    end
    object QryBatchOldTableName: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'TableName'
      LookupDataSet = TblGlBatchId
      LookupKeyFields = 'ID'
      LookupResultField = 'TABLENAME'
      KeyFields = 'GLBATCHID_ID'
      Visible = False
      Size = 50
      Lookup = True
    end
    object QryBatchOldHEADER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'HEADER_ID'
      Visible = False
      Size = 0
    end
    object QryBatchOldID2: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.GLBATCH.ID'
      Visible = False
      Size = 0
    end
    object QryBatchOldCOST_OBJECT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'COST_OBJECT_ID'
      Origin = 'IQ.GLBATCH.COST_OBJECT_ID'
      Visible = False
      Size = 0
    end
    object QryBatchOldCOST_OBJECT_SOURCE: TStringField
      DisplayWidth = 50
      FieldName = 'COST_OBJECT_SOURCE'
      Origin = 'IQ.GLBATCH.COST_OBJECT_SOURCE'
      Visible = False
      Size = 50
    end
  end
  object SrcTblBatch: TDataSource
    DataSet = QryBatch
    Left = 52
    Top = 264
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Account Activity'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196888 $'
    BuildVersion = '176554'
    Left = 220
    Top = 4
  end
  object PkGLAcct: TIQWebHpick
    BeforeOpen = PkGLAcctBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select ID,'
      '          Acct,'
      '          Descrip, '
      '          Type,'
      '          eplant_id'
      '  from V_GLACCT_GLSUB_ACCT_TYPE'
      'order by Acct')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 96
    Top = 301
    object PkGLAcctACCT: TStringField
      DisplayLabel = 'Account #'
      FieldName = 'ACCT'
      Size = 50
    end
    object PkGLAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkGLAcctID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkGLAcctTYPE: TStringField
      DisplayLabel = 'Acct. Type'
      FieldName = 'TYPE'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.TYPE'
      Size = 35
    end
    object PkGLAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.EPLANT_ID'
      Size = 0
    end
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 276
    Top = 4
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'NavMain'
      'DrillDown1 '
      'LookupAccount1'
      'ShowCriteria1'
      'ShowCriteria2'
      'SBLookUp'
      'SBDrillDown'
      'BtnApply'
      'DBGridAccounts'
      'DBGridPeriods'
      'Print1'
      'PrintSetup1')
    SecurityCode = 'FRMACTIVITY'
    Left = 304
    Top = 4
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmActivity'
    WebUse = False
    TouchScreen = False
    Left = 248
    Top = 4
  end
  object SrcWholeBatch: TDataSource
    DataSet = QryWholeBatch
    Left = 324
    Top = 264
  end
  object QryWholeBatch: TFDQuery
    MasterSource = SrcTblBatchId
    MasterFields = 'BATCH_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'Select b.DESCRIP,'
      '       b.DEBIT,'
      '       b.CREDIT,'
      '       b.glbatchid_id,'
      '       b.header_id,'
      '       b.reference,'
      '       b.ref_code,'
      '       a.acct,'
      '       a.descrip as acct_descrip,'
      '       i.batchnumber,'
      '       i.source,'
      '       b.num_of_supp_docs'
      '  from glbatch b, glacct a, glbatchid i'
      ' where glbatchid_id = :BATCH_ID'
      '    and b.glacct_id = a.id'
      '    and b.glbatchid_id = i.id')
    Left = 340
    Top = 264
    ParamData = <
      item
        Name = 'BATCH_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryWholeBatchDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 10
      FieldName = 'DESCRIP'
      Origin = 'GLBATCH.DESCRIP'
      Size = 120
    end
    object QryWholeBatchDEBIT: TBCDField
      DisplayLabel = 'Debit'
      DisplayWidth = 10
      FieldName = 'DEBIT'
      currency = True
      Size = 2
    end
    object QryWholeBatchCREDIT: TBCDField
      DisplayLabel = 'Credit'
      DisplayWidth = 10
      FieldName = 'CREDIT'
      currency = True
      Size = 2
    end
    object QryWholeBatchACCT: TStringField
      DisplayLabel = 'Account #'
      DisplayWidth = 50
      FieldName = 'ACCT'
      Size = 50
    end
    object QryWholeBatchREFERENCE: TStringField
      DisplayLabel = 'Reference'
      DisplayWidth = 20
      FieldName = 'REFERENCE'
      Origin = 'GLBATCH.REFERENCE'
      Size = 60
    end
    object QryWholeBatchREF_CODE: TStringField
      DisplayLabel = 'Reference Code'
      DisplayWidth = 10
      FieldName = 'REF_CODE'
      Origin = 'GLBATCH.REF_CODE'
      Size = 10
    end
    object QryWholeBatchNUM_OF_SUPP_DOCS: TBCDField
      DisplayLabel = 'Supporting Documents'
      DisplayWidth = 10
      FieldName = 'NUM_OF_SUPP_DOCS'
      Origin = 'IQ.GLBATCH.NUM_OF_SUPP_DOCS'
      Size = 0
    end
    object QryWholeBatchACCT_DESCRIP: TStringField
      DisplayLabel = 'Account Description'
      DisplayWidth = 50
      FieldName = 'ACCT_DESCRIP'
      Origin = 'IQ.GLACCT.DESCRIP'
      Size = 50
    end
    object QryWholeBatchGLBATCHID_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'GLBATCHID_ID'
      Visible = False
      Size = 0
    end
    object QryWholeBatchHEADER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'HEADER_ID'
      Visible = False
      Size = 0
    end
    object QryWholeBatchBATCHNUMBER: TBCDField
      DisplayWidth = 10
      FieldName = 'BATCHNUMBER'
      Visible = False
      Size = 0
    end
    object QryWholeBatchSOURCE: TStringField
      DisplayWidth = 2
      FieldName = 'SOURCE'
      Visible = False
      Size = 2
    end
  end
  object QryYtdBeginnig: TFDQuery
    Tag = 1
    MasterSource = SrcGlYear
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select glacct_id,'
      '       NVL(ytd_beginning, 0) as ytd_beginning'
      '  from v_glacct_all_ybb '
      ' where glyear_id = :ID'
      '           ')
    Left = 344
    Top = 312
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 10000c
      end>
  end
  object IQTiming1: TIQWebTiming
    Left = 332
    Top = 4
  end
  object PopupMenu2: TUniPopupMenu
    Left = 192
    Top = 4
    object CalculateYearbeginningbalance1: TUniMenuItem
      Caption = '&Calculate year beginning balance'
      OnClick = CalculateYearbeginningbalance1Click
    end
  end
  object QryDateNoact: TFDQuery
    Tag = 1
    BeforeOpen = QryPeriodBeforeOpen
    AfterOpen = QryPeriodAfterOpen
    OnCalcFields = QryDateNoactCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'select p.period,                                                ' +
        '        '
      
        '       p.glyear_id,                                             ' +
        '        '
      
        '       :nGlAcctId1 as glacct_id,                                ' +
        '               '
      
        '       p.id as period_id,                                       ' +
        '        '
      
        '       0 as Total_Credit,                                       ' +
        '        '
      
        '       0 as Total_Debit,                                        ' +
        '        '
      '       0 as Total,      '
      
        '       0 as repcur_period_debit,                                ' +
        '                '
      
        '       0 as repcur_period_credit,                               ' +
        '                 '
      
        '       NVL(b.budamount, 0) as budgeted                          ' +
        '        '
      
        '  from glperiods p,                                             ' +
        '        '
      '       glyear y,  '
      
        '       glacct a,                                                ' +
        '      '
      
        '       (select z.glperiods_id,                                  ' +
        '        '
      
        '               x.glacct_fy_id,                                  ' +
        '        '
      
        '               z.budamount                                      ' +
        '        '
      
        '          from (select glacct_fy_id,                            ' +
        '        '
      
        '                       min(id) as id                            ' +
        '        '
      
        '                  from budgets_fy                               ' +
        '        '
      
        '                 group by glacct_fy_id) x,                      ' +
        '        '
      
        '                glbudget z                                      ' +
        '        '
      
        '          where z.budgets_fy_id = x.id) b                       ' +
        '        '
      
        '                                                                ' +
        '        '
      
        ' where p.glyear_id = :nGlYearId1                                ' +
        '         '
      
        '   and y.id = :nGlYearId2                                       ' +
        '         '
      
        '   and p.glyear_id = y.id                                       ' +
        '        '
      
        '   and p.id = (select min(id) from glperiods where glyear_id = :' +
        'nGlYearId3)'
      
        '   and b.glperiods_id(+) = p.id                                 ' +
        '        '
      
        '   and b.glacct_fy_id(+) = GL_GLACCT_FY_ID(:nGlAcctId2, p.glyear' +
        '_id)           '
      '   and a.id = :nGlAcctId3'
      '   and a.majortype in ('#39'ASSET'#39', '#39'LIABILITY'#39', '#39'OWNERS EQUITY'#39')')
    Left = 172
    Top = 221
    ParamData = <
      item
        Name = 'NGLACCTID1'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLYEARID1'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLYEARID2'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLYEARID3'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLACCTID2'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'NGLACCTID3'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object StringField1: TStringField
      FieldKind = fkLookup
      FieldName = 'GlYear_Descrip'
      LookupDataSet = TblGlYear
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'GLYEAR_ID'
      Lookup = True
    end
    object FloatField7: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Balance'
      currency = True
      Calculated = True
    end
    object FloatField8: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Beginning'
      currency = True
      Calculated = True
    end
    object DateField1: TDateField
      FieldKind = fkCalculated
      FieldName = 'nFromBatchDate'
      Calculated = True
    end
    object DateField2: TDateField
      FieldKind = fkCalculated
      FieldName = 'nToBatchDate'
      Calculated = True
    end
    object QryDateNoactPERIOD: TBCDField
      FieldName = 'PERIOD'
      Size = 0
    end
    object QryDateNoactTOTAL_CREDIT: TFMTBCDField
      FieldName = 'TOTAL_CREDIT'
      currency = True
      Size = 38
    end
    object QryDateNoactTOTAL_DEBIT: TFMTBCDField
      FieldName = 'TOTAL_DEBIT'
      currency = True
      Size = 38
    end
    object QryDateNoactTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      currency = True
      Size = 38
    end
    object QryDateNoactBUDGETED: TFMTBCDField
      FieldName = 'BUDGETED'
      Size = 38
    end
    object QryDateNoactREPCUR_PERIOD_DEBIT: TFMTBCDField
      FieldName = 'REPCUR_PERIOD_DEBIT'
      currency = True
      Size = 38
    end
    object QryDateNoactREPCUR_PERIOD_CREDIT: TFMTBCDField
      FieldName = 'REPCUR_PERIOD_CREDIT'
      currency = True
      Size = 38
    end
    object QryDateNoactGLYEAR_ID: TBCDField
      FieldName = 'GLYEAR_ID'
      Origin = 'GLYEAR_ID'
      Required = True
      Precision = 15
      Size = 0
    end
    object QryDateNoactGLACCT_ID: TFMTBCDField
      FieldName = 'GLACCT_ID'
      Origin = 'GLACCT_ID'
      Precision = 38
      Size = 38
    end
    object QryDateNoactPERIOD_ID: TBCDField
      FieldName = 'PERIOD_ID'
      Origin = 'PERIOD_ID'
      Required = True
      Precision = 15
      Size = 0
    end
  end
  object QryBatch: TFDQuery
    BeforeOpen = QryBatchBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'Select DESCRIP,'
      '       DEBIT,'
      '       CREDIT,'
      '       STAT_VALUE,'
      '       glbatchid_id,'
      '       header_id,'
      '       reference,'
      '       ref_code,'
      '       cost_object_id,'
      '       cost_object_source,'
      
        '       iqms.cost_source.get_cost_object_display(cost_object_sour' +
        'ce, cost_object_id) as cost_source,'
      '       id'
      '  from glbatch'
      ' where glbatchid_id = :aBATCH_ID'
      '   and glacct_id = :aGLACCT_ID     '
      '   ')
    Left = 53
    Top = 229
    ParamData = <
      item
        Name = 'ABATCH_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'AGLACCT_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryBatchDESCRIP: TStringField
      DisplayWidth = 120
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 120
    end
    object QryBatchDEBIT: TBCDField
      DisplayWidth = 16
      FieldName = 'DEBIT'
      Origin = 'DEBIT'
      Precision = 15
      Size = 2
    end
    object QryBatchCREDIT: TBCDField
      DisplayWidth = 16
      FieldName = 'CREDIT'
      Origin = 'CREDIT'
      Precision = 15
      Size = 2
    end
    object QryBatchSTAT_VALUE: TFMTBCDField
      DisplayWidth = 16
      FieldName = 'STAT_VALUE'
      Origin = 'STAT_VALUE'
      Precision = 15
      Size = 6
    end
    object QryBatchGLBATCHID_ID: TBCDField
      DisplayWidth = 16
      FieldName = 'GLBATCHID_ID'
      Origin = 'GLBATCHID_ID'
      Required = True
      Precision = 15
      Size = 0
    end
    object QryBatchHEADER_ID: TBCDField
      DisplayWidth = 16
      FieldName = 'HEADER_ID'
      Origin = 'HEADER_ID'
      Precision = 15
      Size = 0
    end
    object QryBatchREFERENCE: TStringField
      DisplayWidth = 60
      FieldName = 'REFERENCE'
      Origin = 'REFERENCE'
      Size = 60
    end
    object QryBatchREF_CODE: TStringField
      DisplayWidth = 10
      FieldName = 'REF_CODE'
      Origin = 'REF_CODE'
      Size = 10
    end
    object QryBatchCOST_OBJECT_ID: TBCDField
      DisplayWidth = 16
      FieldName = 'COST_OBJECT_ID'
      Origin = 'COST_OBJECT_ID'
      Precision = 15
      Size = 0
    end
    object QryBatchCOST_OBJECT_SOURCE: TStringField
      DisplayWidth = 50
      FieldName = 'COST_OBJECT_SOURCE'
      Origin = 'COST_OBJECT_SOURCE'
      Size = 50
    end
    object QryBatchID2: TBCDField
      DisplayWidth = 16
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object QryBatchTableName: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'TableName'
      LookupDataSet = TblGlBatchId
      LookupKeyFields = 'ID'
      LookupResultField = 'TABLENAME'
      KeyFields = 'GLBATCHID_ID'
      Lookup = True
    end
    object QryBatchCOST_SOURCE: TStringField
      DisplayWidth = 20
      FieldName = 'COST_SOURCE'
      ReadOnly = True
    end
  end
end
