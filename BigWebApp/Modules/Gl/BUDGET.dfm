object FrmGLMain: TFrmGLMain
  Left = 243
  Top = 175
  ClientHeight = 394
  ClientWidth = 573
  Caption = 'General Ledger Account Maintenance'
  OldCreateOrder = True
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 573
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnSearch: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = ''
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
      OnClick = sbtnSearchClick
    end
    object sbtnToggle: TUniSpeedButton
      Left = 26
      Top = 1
      Width = 25
      Height = 25
      Hint = ''
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
      OnClick = sbtnToggleClick
    end
    object navMain: TUniDBNavigator
      Left = 347
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = GL_DM.SrcGLAcct
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object PageControl1: TUniPageControl
    Left = 0
    Top = 27
    Width = 573
    Height = 367
    Hint = ''
    ActivePage = sheetBudget
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    OnChange = PageControl1Change
    ExplicitWidth = 581
    ExplicitHeight = 352
    object sheetAccountData: TUniTabSheet
      Hint = ''
      Caption = 'Account &Data'
      object Notebook1: TUniPageControl
        Left = 0
        Top = 0
        Width = 565
        Height = 339
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitWidth = 573
        ExplicitHeight = 324
        object TUniTabSheet
          Hint = ''
          Caption = 'GLFormView'
          object GroupBox1: TUniGroupBox
            Left = 0
            Top = 0
            Width = 557
            Height = 131
            Hint = ''
            Caption = ' Account Information '
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            ExplicitWidth = 573
            object PnlAcctData: TUniPanel
              Tag = 1999
              Left = 2
              Top = 15
              Width = 553
              Height = 114
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              object Splitter3: TUniSplitter
                Left = 154
                Top = 1
                Width = 6
                Height = 112
                Hint = ''
                Align = alLeft
                ParentColor = False
                Color = clBtnFace
              end
              object PnlAcctDataLeft: TUniPanel
                Tag = 1999
                Left = 1
                Top = 1
                Width = 153
                Height = 112
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 0
                Caption = ''
                object Label1: TUniLabel
                  Left = 8
                  Top = 12
                  Width = 82
                  Height = 13
                  Hint = ''
                  Caption = 'Account  Number'
                  TabOrder = 1
                end
                object Label2: TUniLabel
                  Left = 8
                  Top = 36
                  Width = 53
                  Height = 13
                  Hint = ''
                  Caption = 'Description'
                  TabOrder = 2
                end
                object Label3: TUniLabel
                  Left = 8
                  Top = 60
                  Width = 66
                  Height = 13
                  Hint = ''
                  Caption = 'Account Type'
                  TabOrder = 3
                end
                object Label16: TUniLabel
                  Left = 8
                  Top = 84
                  Width = 123
                  Height = 13
                  Hint = ''
                  Caption = 'Financial Reporting Group'
                  TabOrder = 4
                end
              end
              object PnlAcctDataClient: TUniPanel
                Tag = 1999
                Left = 160
                Top = 1
                Width = 392
                Height = 112
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                ExplicitLeft = 156
                ExplicitTop = 0
                ExplicitWidth = 413
                ExplicitHeight = 114
                object Label8: TUniLabel
                  Left = 256
                  Top = 84
                  Width = 51
                  Height = 13
                  Hint = ''
                  Caption = '(Required)'
                  TabOrder = 5
                end
                object dbeAcctNumber: TUniDBEdit
                  Left = 0
                  Top = 8
                  Width = 249
                  Height = 21
                  Hint = ''
                  DataField = 'ACCT'
                  DataSource = GL_DM.SrcGLAcct
                  TabOrder = 0
                end
                object DBEdit2: TUniDBEdit
                  Left = 0
                  Top = 32
                  Width = 249
                  Height = 21
                  Hint = ''
                  DataField = 'DESCRIP'
                  DataSource = GL_DM.SrcGLAcct
                  TabOrder = 1
                end
                object CBoxAcctType: TUniDBComboBox
                  Left = 0
                  Top = 56
                  Width = 249
                  Height = 21
                  Hint = ''
                  DataField = 'TYPE'
                  DataSource = GL_DM.SrcGLAcct
                  Items.Strings = (
                    'REVENUE'
                    'EXPENSE'
                    'OWNERS EQUITY'
                    'CURRENT ASSETS'
                    'FIXED ASSETS'
                    'CASH'
                    'CURRENT LIABILITIES'
                    'LONG TERM LIABILITIES'
                    'COST OF GOODS SOLD'
                    'ACCUMULATED DEPRECIATION'
                    'OTHER INCOME'
                    'OTHER EXPENSE'
                    'OTHER ASSETS')
                  TabOrder = 2
                end
                object LookupCBoxAcctSubType: TUniDBLookupComboBox
                  Left = 0
                  Top = 80
                  Width = 249
                  Height = 21
                  Hint = ''
                  ListField = 'DESCRIP'
                  ListSource = GL_DM.SrcQryGlSubAcctType
                  KeyField = 'ID'
                  ListFieldIndex = 0
                  DataField = 'GL_SUBACCT_TYPE_ID'
                  DataSource = GL_DM.SrcGLAcct
                  TabOrder = 3
                  Color = clWindow
                  OnDropDown = LookupCBoxAcctSubTypeDropDown
                  OnKeyDown = LookupCBoxAcctSubTypeKeyDown
                end
              end
            end
          end
        end
        object TUniTabSheet
          Hint = ''
          Caption = 'GLTableView'
          object gridAccounts: TIQdbGrid
            Left = 0
            Top = 0
            Width = 557
            Height = 311
            Align = alClient
            DataSource = GL_DM.SrcGLAcct
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnKeyDown = gridAccountsKeyDown
            OnMouseDown = gridAccountsMouseDown
            Columns = <
              item
                Expanded = False
                FieldName = 'ACCT'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRIP'
                Width = 172
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TYPE'
                PickList.Strings = (
                  'REVENUE'
                  'EXPENSE'
                  'OWNERS EQUITY'
                  'CURRENT ASSETS'
                  'FIXED ASSETS'
                  'CASH'
                  'CURRENT LIABILITIES'
                  'LONG TERM LIABILITIES'
                  'COST OF GOODS SOLD'
                  'ACCUMULATED DEPRECIATION'
                  'OTHER INCOME'
                  'OTHER EXPENSE'
                  'OTHER ASSETS')
                Title.Caption = 'Type'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SubAcctType'
                Title.Caption = 'User Defined'
                Width = 120
                Visible = True
              end>
          end
        end
      end
    end
    object sheetBudget: TUniTabSheet
      Hint = ''
      Caption = 'B&udget Info'
      object Splitter1: TUniSplitter
        Left = 0
        Top = 61
        Width = 565
        Height = 8
        Cursor = crVSplit
        Hint = ''
        Align = alTop
        ParentColor = False
        Color = clBtnFace
      end
      object Panel2: TUniPanel
        Left = 0
        Top = 69
        Width = 565
        Height = 238
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Splitter2: TUniSplitter
          Left = 370
          Top = 1
          Width = 4
          Height = 236
          Hint = ''
          Align = alRight
          ParentColor = False
          Color = clBtnFace
        end
        object pnlCurrentBudgetPeriods: TUniPanel
          Left = 374
          Top = 1
          Width = 190
          Height = 236
          Hint = ''
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 1
          Caption = 'pnlCurrentBudgetPeriods'
          object Panel3: TUniPanel
            Left = 1
            Top = 21
            Width = 188
            Height = 214
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = 'Panel3'
            object gridCurrentPeriodBudget: TIQdbGrid
              Left = 1
              Top = 1
              Width = 186
              Height = 212
              Align = alClient
              Color = clBtnFace
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnEnter = gridAcctBudgetEnter
              OnMouseDown = gridCurrentPeriodBudgetMouseDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'PERIOD'
                  ReadOnly = True
                  Title.Caption = 'Period'
                  Visible = True
                end
                item
                  Color = clWindow
                  Expanded = False
                  FieldName = 'BUDAMOUNT'
                  Title.Caption = 'Amount'
                  Width = 59
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BUDPERCENT'
                  ReadOnly = True
                  Title.Caption = '%'
                  Width = 27
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PeriodActual'
                  ReadOnly = True
                  Title.Caption = 'Actual'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PeriodVariance'
                  ReadOnly = True
                  Title.Caption = 'Variance'
                  Width = 48
                  Visible = True
                end>
            end
          end
          object pnlAdjustCBox: TUniPanel
            Left = 1
            Top = 1
            Width = 188
            Height = 20
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            Caption = 'pnlAdjustCBox'
            object cboxAdjust: TUniComboBox
              Left = 0
              Top = -1
              Width = 190
              Height = 21
              Hint = ''
              Style = csDropDownList
              Text = ''
              Items.Strings = (
                'Adjust Budget Period By Amount $'
                'Adjust Budget Period By Percent %')
              TabOrder = 1
              OnChange = cboxAdjustChange
            end
          end
        end
        object pgctrlBudget: TUniPageControl
          Left = 1
          Top = 1
          Width = 369
          Height = 236
          Hint = ''
          ActivePage = sheetCurrent
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          object sheetCurrent: TUniTabSheet
            Hint = ''
            Caption = 'Budget by Account'
            object gridAcctBudget: TIQdbGrid
              Left = 0
              Top = 0
              Width = 361
              Height = 208
              Align = alClient
              Color = clBtnFace
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnEnter = gridAcctBudgetEnter
              OnMouseDown = gridCurrentPeriodBudgetMouseDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'GLACCT'
                  ReadOnly = True
                  Title.Caption = 'Account #'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PrevYTD'
                  ReadOnly = True
                  Title.Caption = 'Actual'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PrevBudget'
                  ReadOnly = True
                  Title.Caption = 'Budget'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PrevVar'
                  ReadOnly = True
                  Title.Caption = 'Variance'
                  Width = 58
                  Visible = True
                end
                item
                  Color = clWindow
                  Expanded = False
                  FieldName = 'YTDBUDGET'
                  Title.Caption = 'Budget'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 66
                  Visible = True
                end>
            end
          end
          object sheetPeriods: TUniTabSheet
            Hint = ''
            Caption = 'Account Budget by Period'
            object gridPrevPeriodBudget: TIQdbGrid
              Left = 0
              Top = 0
              Width = 361
              Height = 208
              Align = alClient
              Color = clBtnFace
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnEnter = gridAcctBudgetEnter
              OnMouseDown = gridCurrentPeriodBudgetMouseDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'PERIOD'
                  Title.Caption = 'Period'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BUDAMOUNT'
                  Title.Caption = 'Budget Amount $'
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BUDPERCENT'
                  Title.Caption = 'Budget Percent %'
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PeriodActual'
                  Title.Caption = 'Actual'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PeriodVariance'
                  Title.Caption = 'Variance $'
                  Width = 58
                  Visible = True
                end>
            end
          end
        end
      end
      object Panel8: TUniPanel
        Left = 0
        Top = 307
        Width = 565
        Height = 32
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object Panel10: TUniPanel
          Left = 254
          Top = 1
          Width = 310
          Height = 30
          Hint = ''
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object btnApply: TUniButton
            Left = 103
            Top = 5
            Width = 97
            Height = 25
            Hint = ''
            Enabled = False
            Caption = 'Apply'
            TabOrder = 1
            OnClick = btnApplyClick
          end
          object btnRevert: TUniButton
            Left = 205
            Top = 5
            Width = 97
            Height = 25
            Hint = ''
            Enabled = False
            Caption = 'Revert'
            TabOrder = 2
            OnClick = btnRevertClick
          end
          object btnSetCriteria: TUniButton
            Left = 1
            Top = 5
            Width = 97
            Height = 25
            Hint = ''
            Caption = 'Filter ...'
            ParentFont = False
            Font.Color = clBlack
            TabOrder = 3
            OnClick = btnSetCriteriaClick
          end
        end
        object pnlMesg: TUniPanel
          Left = 1
          Top = 1
          Width = 253
          Height = 30
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = ''
        end
      end
      object pnlFilter: TUniPanel
        Left = 0
        Top = 0
        Width = 565
        Height = 61
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Caption = ''
        object Panel7: TUniPanel
          Left = 241
          Top = 1
          Width = 323
          Height = 59
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = 'Panel7'
          object Label5: TUniLabel
            Left = 1
            Top = 1
            Width = 24
            Height = 13
            Hint = ''
            Caption = 'Filter'
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object lboxFilter: TUniListBox
            Left = 1
            Top = 14
            Width = 321
            Height = 44
            Hint = ''
            Items.Strings = (
              'Fiscal Year       : '
              'Account Type      : '
              'User Defined Type : '
              'Account           : '
              'Department        : '
              'Division          : ')
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            TabStop = False
            ParentFont = False
            Font.Name = 'Courier New'
            MultiSelect = True
          end
        end
        object Panel9: TUniPanel
          Left = 1
          Top = 1
          Width = 240
          Height = 59
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 1
          Caption = ''
          object Label4: TUniLabel
            Left = 1
            Top = 1
            Width = 82
            Height = 13
            Hint = ''
            Caption = ' Current Account'
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
          end
          object DBEdit1: TUniDBEdit
            Left = 4
            Top = 13
            Width = 225
            Height = 16
            Hint = ''
            DataField = 'GLACCT'
            TabOrder = 0
            Color = clBtnFace
            ReadOnly = True
          end
          object DBEdit3: TUniDBEdit
            Left = 4
            Top = 28
            Width = 225
            Height = 16
            Hint = ''
            DataField = 'GLACCT_DESCRIP'
            TabOrder = 1
            Color = clBtnFace
            ReadOnly = True
          end
          object DBEdit4: TUniDBEdit
            Left = 4
            Top = 43
            Width = 225
            Height = 16
            Hint = ''
            DataField = 'GLACCT_TYPE'
            TabOrder = 2
            Color = clBtnFace
            ReadOnly = True
          end
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 216
    object GL1: TUniMenuItem
      Caption = '&Chart of Accounts'
      object New1: TUniMenuItem
        Caption = 'New'
        OnClick = InvokeNavigator
      end
      object Delete1: TUniMenuItem
        Caption = 'Delete'
        OnClick = InvokeNavigator
      end
      object Search1: TUniMenuItem
        Caption = 'Search...'
        OnClick = sbtnSearchClick
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Replicate1: TUniMenuItem
        Caption = 'Replicate...'
        OnClick = Replicate1Click
      end
      object N12: TUniMenuItem
        Caption = '-'
      end
      object AccountMask1: TUniMenuItem
        Caption = 'Account Structure...'
        OnClick = AccountMask1Click
      end
      object N9: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Budgets1: TUniMenuItem
      Caption = 'Budgets'
      OnClick = Budgets1Click
      object CreateBudgetGroups1: TUniMenuItem
        Caption = 'Define Budget Groups...'
        OnClick = CreateBudgetGroups1Click
      end
      object CreateBudgets1: TUniMenuItem
        Caption = 'Create Budgets by Group...'
        OnClick = CreateBudgets1Click
      end
      object N8: TUniMenuItem
        Caption = '-'
      end
      object MonthlyAllocations1: TUniMenuItem
        Caption = 'Monthly Allocations...'
      end
      object BudgetComparisons1: TUniMenuItem
        Caption = 'Budget Comparisons'
        OnClick = BudgetComparisons1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = '&Options'
      object DefinePeriods1: TUniMenuItem
        Caption = 'Define Periods...'
        OnClick = DefinePeriods1Click
      end
      object mnSysParams: TUniMenuItem
        Caption = 'System Parameters...'
        OnClick = mnSysParamsClick
      end
      object DefineSubAccts1: TUniMenuItem
        Caption = 'Financial reporting groups..'
        OnClick = DefineSubAccts1Click
      end
      object N11: TUniMenuItem
        Caption = '-'
      end
      object Bankmanager1: TUniMenuItem
        Caption = '&Bank Manager'
        OnClick = Bankmanager1Click
      end
      object N6: TUniMenuItem
        Caption = '-'
      end
      object AccountActivity1: TUniMenuItem
        Caption = 'Account Activity...'
        OnClick = AccountActivity1Click
      end
      object JournalEntries1: TUniMenuItem
        Caption = 'Journal Entries...'
        OnClick = JournalEntries1Click
      end
      object N4: TUniMenuItem
        Caption = '-'
      end
      object TrialBalance1: TUniMenuItem
        Caption = 'Trial Balance...'
        OnClick = TrialBalance1Click
      end
      object N5: TUniMenuItem
        Caption = '-'
        Visible = False
      end
      object YearEndClosing1: TUniMenuItem
        Caption = 'Year End Closing...'
        Visible = False
      end
    end
    object Reports1: TUniMenuItem
      Caption = '&Reports'
      object Other1: TUniMenuItem
        Caption = '&Print'
        OnClick = Other1Click
      end
      object UserDefined1: TUniMenuItem
        Caption = 'Printer &Setup'
        OnClick = UserDefined1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'GL Account Maintenance'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 243
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmGLMain'
    WebUse = False
    TouchScreen = False
    Left = 272
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 301
  end
  object PopupMenu1: TUniPopupMenu
    Left = 144
    object ShowTotals1: TUniMenuItem
      Caption = '&Show Periods Total'
      OnClick = ShowTotals1Click
    end
    object N3: TUniMenuItem
      Caption = '-'
    end
    object Recalculate1: TUniMenuItem
      Caption = '&Recalculate $ vs %'
      OnClick = Recalculate2Click
    end
  end
  object PopupMenu2: TUniPopupMenu
    Left = 173
    object ShowTotals2: TUniMenuItem
      Caption = '&Show Periods Total'
      OnClick = ShowTotals1Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object Recalculate2: TUniMenuItem
      Caption = '&Recalculate $$ vs %%'
      OnClick = Recalculate2Click
    end
    object Diff1: TUniMenuItem
      Caption = 'Store Difference Here'
      OnClick = Diff1Click
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnApply'
      'btnRevert'
      'btnSetCriteria'
      'navMain'
      'gridAccounts'
      'gridAcctBudget'
      'gridCurrentPeriodBudget'
      'gridPrevPeriodBudget'
      'MainMenu1'
      'About1'
      'AccountActivity1'
      'AccountMask1'
      'Bankmanager1'
      'BudgetComparisons1'
      'Budgets1'
      'CreateBudgetGroups1'
      'CreateBudgets1'
      'DefinePeriods1'
      'DefineSubAccts1'
      'Delete1'
      'Diff1'
      'Exit1'
      'GL1'
      'Help1'
      'JournalEntries1'
      'mnSysParams'
      'MonthlyAllocations1'
      'New1'
      'Options1'
      'Other1'
      'Recalculate1'
      'Recalculate2'
      'Replicate1'
      'Reports1'
      'Search1'
      'ShowTotals1'
      'ShowTotals2'
      'TrialBalance1'
      'UserDefined1'
      'YearEndClosing1'
      'PopupMenu1'
      'PopupMenu2'
      'QryGLAcct_Budget'
      'QryGLSubAcct'
      'QryPrevPeriodBudget'
      'sbtnSearch'
      'sbtnToggle'
      'TblGLAcct'
      'TblGLBudget'
      'TblGlPeriods'
      'TblGlYear'
      'TblIQSys')
    SecurityCode = 'FRMGLMAIN'
    Left = 336
  end
end
