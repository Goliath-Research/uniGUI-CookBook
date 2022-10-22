object FrmTrialBalance: TFrmTrialBalance
  Left = 217
  Top = 166
  ClientHeight = 342
  ClientWidth = 608
  Caption = 'Trial Balance'
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  Font.Color = clBlack
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 122
    Width = 608
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 608
    Height = 122
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Bevel2: TUniPanel
      Left = 1
      Top = 28
      Width = 606
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Caption = ''
    end
    object GridPeriods: TUniDBGrid
      Left = 1
      Top = 31
      Width = 606
      Height = 90
      Hint = ''
      TitleFont.Color = clBlack
      DataSource = SrcPreiods
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTabs, dgCancelOnExit]
      ReadOnly = True
      LoadMask.Message = 'Loading data...'
      OnDblClick = BtnApplyClick
      OnEnter = GridPeriodsEnter
      OnKeyDown = GridPeriodsKeyDown
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ParentColor = False
      Color = clBtnFace
      Columns = <
        item
          FieldName = 'PERIOD'
          Title.Caption = 'Period'
          Width = 64
          Font.Color = clBlack
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'START_DATE'
          Title.Caption = 'Start Date'
          Width = 82
          Font.Color = clBlack
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'END_DATE'
          Title.Caption = 'End Date'
          Width = 82
          Font.Color = clBlack
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'YTD_DEBIT'
          Title.Caption = 'YTD Debit'
          Width = 81
          Font.Color = clBlack
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'YTD_CREDIT'
          Title.Caption = 'YTD Credit'
          Width = 94
          Font.Color = clBlack
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ytd_balance'
          Title.Caption = 'YTD Balance'
          Width = 95
          Font.Color = clBlack
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
    object PnlToolbar: TUniPanel
      Left = 1
      Top = 1
      Width = 606
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = ''
      object Label3: TUniLabel
        Left = 8
        Top = 7
        Width = 51
        Height = 13
        Hint = ''
        Caption = 'Fiscal Year'
        TabOrder = 3
      end
      object NavPeriods: TUniDBNavigator
        Left = 505
        Top = 1
        Width = 100
        Height = 25
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        DataSource = SrcPreiods
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
      object CBGLYear: TUniDBLookupComboBox
        Left = 92
        Top = 3
        Width = 156
        Height = 21
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        ListField = 'DESCRIP'
        ListSource = SrcGlYear
        KeyField = 'ID'
        ListFieldIndex = 0
        TabOrder = 1
        Color = clWindow
        OnCloseUp = CBGLYearCloseUp
      end
    end
  end
  object Panel5: TUniPanel
    Left = 0
    Top = 322
    Width = 608
    Height = 20
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel6: TUniPanel
      Left = 1
      Top = 1
      Width = 170
      Height = 18
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = 'Debit Total:'
      object DBDebit: TUniDBText
        Left = 61
        Top = 3
        Width = 3
        Height = 13
        Hint = ''
        DataField = 'TOTAL_DEBIT'
        DataSource = SrcTotals
      end
    end
    object Panel7: TUniPanel
      Left = 437
      Top = 1
      Width = 170
      Height = 18
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = 'Balance:'
      object DBBalance: TUniDBText
        Left = 45
        Top = 3
        Width = 3
        Height = 13
        Hint = ''
        DataField = 'TOTAL_BALANCE'
        DataSource = SrcTotals
      end
    end
    object Panel8: TUniPanel
      Left = 171
      Top = 1
      Width = 266
      Height = 18
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'Credit Total:'
      object DBCredit: TUniDBText
        Left = 64
        Top = 3
        Width = 3
        Height = 13
        Hint = ''
        DataField = 'TOTAL_CREDIT'
        DataSource = SrcTotals
      end
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 125
    Width = 608
    Height = 197
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object PC: TUniPageControl
      Left = 1
      Top = 1
      Width = 606
      Height = 195
      Hint = ''
      ActivePage = TabMon
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      OnChange = PCChange
      object TabMon: TUniTabSheet
        Hint = ''
        Caption = 'Monetary'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object Panel4: TUniPanel
          Left = 0
          Top = 0
          Width = 598
          Height = 167
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Bevel1: TUniPanel
            Left = 1
            Top = 31
            Width = 596
            Height = 3
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            Caption = ''
          end
          object Panel9: TUniPanel
            Left = 1
            Top = 1
            Width = 596
            Height = 30
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Alignment = taLeftJustify
            Caption = ''
            object Label6: TUniLabel
              Left = 52
              Top = 8
              Width = 81
              Height = 13
              Hint = ''
              Caption = 'Evaluated Period'
              TabOrder = 5
            end
            object Label1: TUniLabel
              Left = 262
              Top = 8
              Width = 24
              Height = 13
              Hint = ''
              Caption = 'From'
              TabOrder = 6
            end
            object Label2: TUniLabel
              Left = 366
              Top = 8
              Width = 12
              Height = 13
              Hint = ''
              Caption = 'To'
              TabOrder = 7
            end
            object SBSearchPurch: TUniSpeedButton
              Left = 2
              Top = 2
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
              OnClick = SBSearchPurchClick
            end
            object edPeriod: TUniEdit
              Left = 143
              Top = 5
              Width = 95
              Height = 19
              Hint = ''
              Text = ''
              TabOrder = 0
              Color = clBtnFace
            end
            object edFrom: TUniEdit
              Left = 293
              Top = 5
              Width = 64
              Height = 19
              Hint = ''
              Text = ''
              TabOrder = 1
              Color = clBtnFace
            end
            object edTo: TUniEdit
              Left = 388
              Top = 5
              Width = 64
              Height = 19
              Hint = ''
              Text = ''
              TabOrder = 2
              Color = clBtnFace
            end
            object Panel2: TUniPanel
              Left = 454
              Top = 1
              Width = 141
              Height = 28
              Hint = ''
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 3
              Caption = ''
              object BtnApply: TUniButton
                Left = 36
                Top = 1
                Width = 105
                Height = 27
                Hint = ''
                Caption = 'Apply Selection'
                TabOrder = 1
                OnClick = BtnApplyClick
              end
            end
          end
          object GridAccounts: TUniDBGrid
            Left = 1
            Top = 34
            Width = 596
            Height = 132
            Hint = ''
            TitleFont.Color = clBlack
            DataSource = SrcAccounts
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgTabs, dgCancelOnExit]
            ReadOnly = True
            LoadMask.Message = 'Loading data...'
            OnDblClick = GridAccountsDblClick
            OnEnter = GridAccountsEnter
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            ParentColor = False
            Color = clBtnFace
            Columns = <
              item
                FieldName = 'ACCT'
                Title.Caption = 'GL Account'
                Width = 64
                Font.Color = clBlack
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DESCRIP'
                Title.Caption = 'Description'
                Width = 117
                Font.Color = clBlack
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'Period_beginning_balance'
                Title.Caption = 'Starting Balance'
                Width = 82
                Font.Color = clBlack
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'PERIOD_DEBIT'
                Title.Caption = 'Period Debit'
                Width = 67
                Font.Color = clBlack
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'PERIOD_CREDIT'
                Title.Caption = 'Period Credit'
                Width = 80
                Font.Color = clBlack
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'PERIOD_BALANCE'
                Title.Caption = 'Period Balance'
                Width = 88
                Font.Color = clBlack
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'Period_end_balance'
                Title.Caption = 'YTD'
                Width = 64
                Font.Color = clBlack
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'EPLANT_ID'
                Title.Caption = 'EPlant ID'
                Width = 64
                Font.Color = clBlack
                CheckBoxField.FieldValues = 'true;false'
              end>
          end
        end
      end
      object TabStat: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'Statistical'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object Panel10: TUniPanel
          Left = 0
          Top = 0
          Width = 598
          Height = 167
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Bevel3: TUniPanel
            Left = 1
            Top = 31
            Width = 596
            Height = 3
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            Caption = ''
          end
          object Panel11: TUniPanel
            Left = 1
            Top = 1
            Width = 596
            Height = 30
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Alignment = taLeftJustify
            Caption = ''
            object Label4: TUniLabel
              Left = 52
              Top = 8
              Width = 81
              Height = 13
              Hint = ''
              Caption = 'Evaluated Period'
              TabOrder = 5
            end
            object Label5: TUniLabel
              Left = 262
              Top = 8
              Width = 24
              Height = 13
              Hint = ''
              Caption = 'From'
              TabOrder = 6
            end
            object Label7: TUniLabel
              Left = 366
              Top = 8
              Width = 12
              Height = 13
              Hint = ''
              Caption = 'To'
              TabOrder = 7
            end
            object SpeedButton1: TUniSpeedButton
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
              OnClick = SpeedButton1Click
            end
            object edPeriodStat: TUniEdit
              Left = 143
              Top = 5
              Width = 95
              Height = 19
              Hint = ''
              Text = ''
              TabOrder = 0
              Color = clBtnFace
            end
            object edFromStat: TUniEdit
              Left = 293
              Top = 5
              Width = 64
              Height = 19
              Hint = ''
              Text = ''
              TabOrder = 1
              Color = clBtnFace
            end
            object edToStat: TUniEdit
              Left = 388
              Top = 5
              Width = 64
              Height = 19
              Hint = ''
              Text = ''
              TabOrder = 2
              Color = clBtnFace
            end
            object Panel12: TUniPanel
              Left = 454
              Top = 1
              Width = 141
              Height = 28
              Hint = ''
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 3
              Caption = ''
              object BtnApplyStat: TUniButton
                Left = 36
                Top = 1
                Width = 105
                Height = 27
                Hint = ''
                Caption = 'Apply Selection'
                TabOrder = 1
                OnClick = BtnApplyStatClick
              end
            end
          end
          object GridAccountsStat: TUniDBGrid
            Left = 1
            Top = 34
            Width = 596
            Height = 132
            Hint = ''
            TitleFont.Color = clBlack
            DataSource = SrcAccountsStat
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgTabs, dgCancelOnExit]
            ReadOnly = True
            LoadMask.Message = 'Loading data...'
            OnDblClick = GridAccountsDblClick
            OnEnter = GridAccountsStatEnter
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            ParentColor = False
            Color = clBtnFace
            Columns = <
              item
                FieldName = 'ACCT'
                Title.Caption = 'GL Account'
                Width = 64
                Font.Color = clBlack
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DESCRIP'
                Title.Caption = 'Description'
                Width = 117
                Font.Color = clBlack
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'Period_beginning_balance'
                Title.Caption = 'Starting Balance'
                Width = 82
                Font.Color = clBlack
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'STAT_VALUE'
                Title.Caption = 'Period Value'
                Width = 67
                Font.Color = clBlack
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'Period_Balance'
                Title.Caption = 'Period Balance'
                Width = 88
                Font.Color = clBlack
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'Period_end_balance'
                Title.Caption = 'YTD'
                Width = 64
                Font.Color = clBlack
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'EPLANT_ID'
                Title.Caption = 'EPlant ID'
                Width = 64
                Font.Color = clBlack
                CheckBoxField.FieldValues = 'true;false'
              end>
          end
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 488
    Top = 64
    object Options1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Close'
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
  end
  object SrcGlYear: TDataSource
    DataSet = TblGlYear
    Left = 24
    Top = 219
  end
  object SrcPreiods: TDataSource
    DataSet = QryGLPeriod
    OnDataChange = SrcPreiodsDataChange
    Left = 96
    Top = 219
  end
  object QryGLPeriod: TFDQuery
    Tag = 1
    BeforeScroll = QryGLPeriodBeforeScroll
    AfterScroll = QryGLPeriodAfterScroll
    OnCalcFields = QryGLPeriodCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select p.id,'
      '       p.Period,'
      '       p.status,'
      '       p.glyear_id,'
      '       p.start_date,'
      '       p.end_date,'
      '       Sum(v.period_credit) as ytd_credit,'
      '       Sum(v.period_debit) as ytd_debit'
      '  from glperiods p, c_GLACCT_PERIOD_SUMMARY v'
      ' where p.glyear_id = v.glyear_id(+)'
      '   and v.start_date(+) <= p.start_date'
      '   and p.glyear_id = :nID'
      '   and Misc.Eplant_TFilter(v.glacct_id, '#39'GLACCT'#39') = 1'
      'group by p.id,'
      '         p.Period,'
      '         p.status,'
      '         p.glyear_id,'
      '         p.start_date,'
      '         p.end_date'
      ' order by p.period'
      ''
      ''
      ''
      ' '
      ' ')
    Left = 104
    Top = 235
    ParamData = <
      item
        Name = 'nID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryGLPeriodID: TBCDField
      FieldName = 'ID'
      Origin = 'GLPERIODS.ID'
      Size = 0
    end
    object QryGLPeriodGLYEAR_ID: TBCDField
      FieldName = 'GLYEAR_ID'
      Origin = 'GLPERIODS.GLYEAR_ID'
      Size = 0
    end
    object QryGLPeriodPERIOD: TBCDField
      FieldName = 'PERIOD'
      Origin = 'GLPERIODS.PERIOD'
      Size = 0
    end
    object QryGLPeriodSTART_DATE: TDateTimeField
      FieldName = 'START_DATE'
      Origin = 'GLPERIODS.START_DATE'
    end
    object QryGLPeriodEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
      Origin = 'GLPERIODS.END_DATE'
    end
    object QryGLPeriodSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'GLPERIODS.STATUS'
      Size = 2
    end
    object QryGLPeriodytd_balance: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ytd_balance'
      currency = True
      Calculated = True
    end
    object QryGLPeriodYTD_CREDIT: TFMTBCDField
      FieldName = 'YTD_CREDIT'
      currency = True
      Size = 38
    end
    object QryGLPeriodYTD_DEBIT: TFMTBCDField
      FieldName = 'YTD_DEBIT'
      currency = True
      Size = 38
    end
  end
  object SrcTotals: TDataSource
    DataSet = QryTotals
    Left = 224
    Top = 219
  end
  object QryTotals: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.glperiods_id         as glperiods_id,'
      '       sum(v.period_debit)    as total_debit,'
      '       sum(v.period_credit)   as total_credit,'
      '       sum(v.period_balance)  as total_balance,'
      '       sum(NVL(v.stat_value, 0))   as total_stat_value,'
      
        '       sum(NVL(v.stat_value_balance, 0))  as total_stat_value_ba' +
        'lance'
      ' from c_glacct_period_summary v, glacct a'
      'where glperiods_id = :nGLPeriodsId'
      '   and v.glacct_id = a.id'
      '   and Misc.Eplant_Filter(a.eplant_id) = 1'
      'group by glperiods_id')
    Left = 240
    Top = 219
    ParamData = <
      item
        Name = 'nGLPeriodsId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryTotalsGLPERIODS_ID: TBCDField
      FieldName = 'GLPERIODS_ID'
      Size = 0
    end
    object QryTotalsTOTAL_DEBIT: TFMTBCDField
      FieldName = 'TOTAL_DEBIT'
      currency = True
      Size = 38
    end
    object QryTotalsTOTAL_CREDIT: TFMTBCDField
      FieldName = 'TOTAL_CREDIT'
      currency = True
      Size = 38
    end
    object QryTotalsTOTAL_BALANCE: TFMTBCDField
      FieldName = 'TOTAL_BALANCE'
      currency = True
      Size = 38
    end
    object QryTotalsTOTAL_STAT_VALUE: TFMTBCDField
      FieldName = 'TOTAL_STAT_VALUE'
      Size = 38
    end
    object QryTotalsTOTAL_STAT_VALUE_BALANCE: TFMTBCDField
      FieldName = 'TOTAL_STAT_VALUE_BALANCE'
      Size = 38
    end
  end
  object SrcAccounts: TDataSource
    DataSet = QryAccounts
    Left = 160
    Top = 219
  end
  object QryAccounts: TFDQuery
    Tag = 1
    AfterScroll = QryAccountsAfterScroll
    OnCalcFields = QryAccountsCalcFields
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select *'
      '  from v_glacct_ybb_all_periods_cumm'
      'where majortype <> '#39'STATISTICAL'#39
      'order by acct')
    Left = 175
    Top = 235
    object QryAccountsGLACCT_ID: TBCDField
      FieldName = 'GLACCT_ID'
      Origin = 'V_GLACCT_RE.GLACCT_ID'
      Size = 0
    end
    object QryAccountsGLYEAR_ID: TBCDField
      FieldName = 'GLYEAR_ID'
      Origin = 'V_GLACCT_RE.GLYEAR_ID'
      Size = 0
    end
    object QryAccountsACCT: TStringField
      FieldName = 'ACCT'
      Origin = 'V_GLACCT_RE.ACCT'
      Size = 50
    end
    object QryAccountsDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'V_GLACCT_RE.DESCRIP'
      Size = 50
    end
    object QryAccountsGLYEAR_START_DATE: TDateTimeField
      FieldName = 'GLYEAR_START_DATE'
      Origin = 'V_GLACCT_RE.GLYEAR_START_DATE'
    end
    object QryAccountsGLYEAR_END_DATE: TDateTimeField
      FieldName = 'GLYEAR_END_DATE'
      Origin = 'V_GLACCT_RE.GLYEAR_END_DATE'
    end
    object QryAccountsYTD_BEGINNING: TFMTBCDField
      FieldName = 'YTD_BEGINNING'
      Origin = 'V_GLACCT_RE.YTD_BEGINNING'
      currency = True
      Size = 38
    end
    object QryAccountsYTD_BALANCE: TBCDField
      FieldName = 'YTD_BALANCE'
      Origin = 'V_GLACCT_RE.YTD_BALANCE'
      currency = True
      Size = 2
    end
    object QryAccountsYTD_CREDIT: TBCDField
      FieldName = 'YTD_CREDIT'
      Origin = 'V_GLACCT_RE.YTD_CREDIT'
      currency = True
      Size = 2
    end
    object QryAccountsYTD_DEBIT: TBCDField
      FieldName = 'YTD_DEBIT'
      Origin = 'V_GLACCT_RE.YTD_DEBIT'
      currency = True
      Size = 2
    end
    object QryAccountsYEAR_END_BALANCE: TFMTBCDField
      FieldName = 'YEAR_END_BALANCE'
      Origin = 'V_GLACCT_RE.YEAR_END_BALANCE'
      Size = 38
    end
    object QryAccountsGLPERIODS_START_DATE: TDateTimeField
      FieldName = 'GLPERIODS_START_DATE'
      Origin = 'V_GLACCT_RE.GLPERIODS_START_DATE'
    end
    object QryAccountsGLPERIODS_END_DATE: TDateTimeField
      FieldName = 'GLPERIODS_END_DATE'
      Origin = 'V_GLACCT_RE.GLPERIODS_END_DATE'
    end
    object QryAccountsGLPERIODS_ID: TBCDField
      FieldName = 'GLPERIODS_ID'
      Origin = 'V_GLACCT_RE.GLPERIODS_ID'
      Size = 0
    end
    object QryAccountsPERIOD_DEBIT: TBCDField
      FieldName = 'PERIOD_DEBIT'
      Origin = 'V_GLACCT_RE.PERIOD_DEBIT'
      currency = True
      Size = 2
    end
    object QryAccountsPERIOD_CREDIT: TBCDField
      FieldName = 'PERIOD_CREDIT'
      Origin = 'V_GLACCT_RE.PERIOD_CREDIT'
      currency = True
      Size = 2
    end
    object QryAccountsPERIOD_BALANCE: TBCDField
      FieldName = 'PERIOD_BALANCE'
      Origin = 'V_GLACCT_RE.PERIOD_BALANCE'
      currency = True
      Size = 2
    end
    object QryAccountsCUMM_PERIOD_BALANCE: TFMTBCDField
      FieldName = 'CUMM_PERIOD_BALANCE'
      Origin = 'V_GLACCT_RE.CUMM_PERIOD_BALANCE'
      Size = 38
    end
    object QryAccountsTYPE: TStringField
      FieldName = 'TYPE'
      Origin = 'V_GLACCT_RE.TYPE'
      Size = 35
    end
    object QryAccountsMAJORTYPE: TStringField
      FieldName = 'MAJORTYPE'
      Origin = 'V_GLACCT_RE.MAJORTYPE'
      Size = 35
    end
    object QryAccountsPeriod_beginning_balance: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Period_beginning_balance'
      currency = True
      Calculated = True
    end
    object QryAccountsPeriod_end_balance: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Period_end_balance'
      currency = True
      Calculated = True
    end
    object QryAccountsEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'V_GLACCT_YBB_ALL_PERIODS_CUMM.EPLANT_ID'
      Size = 0
    end
  end
  object TblGlYear: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLYEAR'
    TableName = 'GLYEAR'
    Left = 48
    Top = 219
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
  object IQAbout1: TIQWebAbout
    ModuleName = 'Trial Balance'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 197386 $'
    BuildVersion = '176554'
    Left = 360
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmTrialBalance'
    WebUse = False
    TouchScreen = False
    Left = 328
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 296
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'GridAccounts'
      'GridPeriods'
      'NavAccounts'
      'NavPeriods'
      'MainMenu1'
      'About1'
      'Exit1'
      'Help1'
      'Options1'
      'Print1'
      'PrintSetup1'
      'Reports1'
      'QryAccounts'
      'QryGLPeriod'
      'QryTotals'
      'TblGlYear')
    SecurityCode = 'FRMTRIALBALANCE'
    Left = 392
  end
  object TblGlPeriods: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLPERIODS'
    TableName = 'GLPERIODS'
    Left = 304
    Top = 215
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
  object TblGlAcct: TFDTable
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLACCT'
    TableName = 'GLACCT'
    Left = 344
    Top = 215
  end
  object PKAcct: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       acct,'
      '       descrip,'
      '       type,'
      '       eplant_id'
      '  from V_GLACCT_GLSUB_ACCT_TYPE'
      ' where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      '   and misc.Eplant_Filter(eplant_id) = 1'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 88
    Top = 64
    object PKAcctID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PKAcctACCT: TStringField
      DisplayLabel = 'Account'
      FieldName = 'ACCT'
      Size = 50
    end
    object PKAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PKAcctTYPE: TStringField
      DisplayLabel = 'Account Type'
      FieldName = 'TYPE'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.TYPE'
      Size = 35
    end
    object PKAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.EPLANT_ID'
      Size = 0
    end
  end
  object SrcTblBatchId: TDataSource
    DataSet = QryBatchId
    OnDataChange = SrcTblBatchIdDataChange
    Left = 428
    Top = 208
  end
  object QryBatchId: TFDQuery
    Tag = 1
    BeforeOpen = QryBatchIdBeforeOpen
    AfterScroll = QryBatchIdAfterScroll
    OnCalcFields = QryBatchIdCalcFields
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
      'where period_id = :aPERIOD_ID'
      '   and glacct_id = :aGLACCT_ID'
      '   and glyear_id = :aGLYEAR_ID'
      '--   and batch_date between :nFromBatchDate and :nToBatchDate'
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
    Left = 444
    Top = 208
    ParamData = <
      item
        Name = 'aPERIOD_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'aGLACCT_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'aGLYEAR_ID'
        DataType = ftBCD
        ParamType = ptInput
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
  object SrcTblBatch: TDataSource
    DataSet = QryBatch
    Left = 492
    Top = 208
  end
  object QryBatchOld: TFDQuery
    Tag = 1
    BeforeOpen = QryBatchOldBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'Select h.DESCRIP,'
      '       h.DEBIT,'
      '       h.CREDIT,'
      '       h.glbatchid_id,'
      '       h.header_id,'
      '       h.reference,'
      '       h.ref_code,'
      '       h.cost_object_id,'
      '       h.cost_object_source,'
      '       h.id,'
      '       h.stat_value'
      '  from glbatch h'
      ' where glbatchid_id = :aBATCH_ID'
      '   and glacct_id = :aGLACCT_ID     ')
    Left = 508
    Top = 208
    ParamData = <
      item
        Name = 'aBATCH_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'aGLACCT_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryBatchOldDEBIT: TBCDField
      FieldName = 'DEBIT'
      currency = True
      Size = 2
    end
    object QryBatchOldCREDIT: TBCDField
      FieldName = 'CREDIT'
      currency = True
      Size = 2
    end
    object QryBatchOldGLBATCHID_ID: TBCDField
      FieldName = 'GLBATCHID_ID'
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
      Size = 50
      Lookup = True
    end
    object QryBatchOldHEADER_ID: TBCDField
      FieldName = 'HEADER_ID'
      Size = 0
    end
    object QryBatchOldDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'GLBATCH.DESCRIP'
      Size = 120
    end
    object QryBatchOldREFERENCE: TStringField
      FieldName = 'REFERENCE'
      Origin = 'GLBATCH.REFERENCE'
      Size = 60
    end
    object QryBatchOldREF_CODE: TStringField
      FieldName = 'REF_CODE'
      Origin = 'GLBATCH.REF_CODE'
      Size = 10
    end
    object QryBatchOldID2: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.GLBATCH.ID'
      Size = 0
    end
    object QryBatchOldCost_Source: TStringField
      FieldKind = fkCalculated
      FieldName = 'Cost_Source'
      Size = 60
      Calculated = True
    end
    object QryBatchOldCOST_OBJECT_ID: TBCDField
      FieldName = 'COST_OBJECT_ID'
      Origin = 'IQ.GLBATCH.COST_OBJECT_ID'
      Size = 0
    end
    object QryBatchOldCOST_OBJECT_SOURCE: TStringField
      FieldName = 'COST_OBJECT_SOURCE'
      Origin = 'IQ.GLBATCH.COST_OBJECT_SOURCE'
      Size = 50
    end
    object QryBatchOldSTAT_VALUE: TFMTBCDField
      FieldName = 'STAT_VALUE'
      Origin = 'IQ.GLBATCH.STAT_VALUE'
      Size = 6
    end
  end
  object QryPeriod: TFDQuery
    Tag = 1
    BeforeOpen = QryPeriodBeforeOpen
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
      '       case'
      
        '         when :nGLYearId = decode(gl_misc.IsActiveForThisYear(:n' +
        'GLYearId, :nGlAcctId), 1, :nGLYearId, gl_misc.GetPrevYear_id(:nG' +
        'LYearId)) then'
      '           v.period_beginning_balance'
      '         else v.period_end_balance'
      '       end as Beginning, '
      '       v.period_end_balance as Balance,'
      '       NVL(b.budamount, 0) as budgeted'
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
      '   and v.glperiods_id = :nglperiod_id'
      
        '   and (NVL(v.period_debit, 0) <> 0 or NVL(v.period_credit, 0) <' +
        '> 0)'
      
        '   and v.glyear_id = decode(gl_misc.IsActiveForThisYear(:nGLYear' +
        'Id, :nGlAcctId), 1, :nGLYearId, gl_misc.GetPrevYear_id(:nGLYearI' +
        'd))'
      '   and v.glacct_id = :nGlAcctId'
      '   and b.glperiods_id(+) = v.glperiods_id'
      
        '   and b.glacct_fy_id(+) = GL_GLACCT_FY_ID(v.glacct_id, v.glyear' +
        '_id)'
      
        '   and ( (gl_misc.IsActiveForThisYear(:nGLYearId, :nGlAcctId) = ' +
        '1'
      '         )'
      '        or '
      
        '         (gl_misc.IsActiveForThisYear(:nGLYearId, :nGlAcctId) = ' +
        '0 and p.id = gl_misc.GetPrevYearEndPeriod_Id(:nGLYearId)'
      '          )'
      '       )'
      '   '
      ''
      ''
      ' '
      ' ')
    Left = 452
    Top = 253
    ParamData = <
      item
        Name = 'nglperiod_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'nGlAcctId'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'nGLYearId'
        DataType = ftBCD
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
  end
  object SrcQry: TDataSource
    DataSet = QryPeriod
    Left = 428
    Top = 253
  end
  object TblGlBatchId: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLBATCHID'
    TableName = 'GLBATCHID'
    Left = 508
    Top = 264
  end
  object SrcWholeBatch: TDataSource
    DataSet = QryWholeBatch
    Left = 324
    Top = 264
  end
  object QryWholeBatch: TFDQuery
    Tag = 1
    BeforeOpen = QryWholeBatchBeforeOpen
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
      ' where glbatchid_id = :aBATCH_ID'
      '    and b.glacct_id = a.id'
      '    and b.glbatchid_id = i.id')
    Left = 340
    Top = 264
    ParamData = <
      item
        Name = 'aBATCH_ID'
        DataType = ftBCD
        ParamType = ptInput
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
  object SrcAccountsStat: TDataSource
    DataSet = QryAccountsStat
    Left = 112
    Top = 179
  end
  object QryAccountsStat: TFDQuery
    Tag = 1
    AfterScroll = QryAccountsAfterScroll
    OnCalcFields = QryAccountsStatCalcFields
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select c.id,'
      '       c.glyear_id,'
      '       c.glacct_id,'
      '       c.glperiods_id,'
      '       c.start_date,'
      '       c.end_date,'
      '       c.stat_value,'
      '       c.stat_value_balance,'
      '       g.acct,'
      '       g.descrip,'
      '       g.gl_subacct_type_id,'
      '       g.eplant_id,'
      '       GL.GET_CUMM_PERIODS_BALANCE_STAT(p.start_date, '
      
        '                                   c.glacct_id, p.glyear_id) as ' +
        'cumm_period_balance,'
      
        '       GL.PREVYEARBALANCE_STAT(c.glacct_id, c.glyear_id) as YTD_' +
        'BEGINNING                                   '
      '  from c_glacct_period_summary c,'
      '       glacct g,'
      '       glperiods p'
      ' where c.glacct_id = g.id'
      '   and c.glperiods_id = p.id'
      '   and gl.is_statistical_account(g.gl_subacct_type_id) = 1'
      'order by g.acct   ')
    Left = 127
    Top = 195
    object QryAccountsStatID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryAccountsStatGLYEAR_ID: TBCDField
      FieldName = 'GLYEAR_ID'
      Size = 0
    end
    object QryAccountsStatGLACCT_ID: TBCDField
      FieldName = 'GLACCT_ID'
      Size = 0
    end
    object QryAccountsStatGLPERIODS_ID: TBCDField
      FieldName = 'GLPERIODS_ID'
      Size = 0
    end
    object QryAccountsStatSTART_DATE: TDateTimeField
      FieldName = 'START_DATE'
    end
    object QryAccountsStatEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
    end
    object QryAccountsStatSTAT_VALUE: TFMTBCDField
      FieldName = 'STAT_VALUE'
      Size = 6
    end
    object QryAccountsStatSTAT_VALUE_BALANCE: TFMTBCDField
      FieldName = 'STAT_VALUE_BALANCE'
      Size = 6
    end
    object QryAccountsStatACCT: TStringField
      FieldName = 'ACCT'
      Size = 50
    end
    object QryAccountsStatGL_SUBACCT_TYPE_ID: TBCDField
      FieldName = 'GL_SUBACCT_TYPE_ID'
      Size = 0
    end
    object QryAccountsStatEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryAccountsStatCUMM_PERIOD_BALANCE: TFMTBCDField
      FieldName = 'CUMM_PERIOD_BALANCE'
      Size = 38
    end
    object QryAccountsStatPeriod_beginning_balance: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Period_beginning_balance'
      Calculated = True
    end
    object QryAccountsStatPeriod_end_balance: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Period_end_balance'
      Calculated = True
    end
    object QryAccountsStatYTD_BEGINNING: TFMTBCDField
      FieldName = 'YTD_BEGINNING'
      Size = 38
    end
    object QryAccountsStatDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 50
    end
    object QryAccountsStatPeriod_Balance: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Period_Balance'
      Calculated = True
    end
  end
  object PKAcctStat: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       acct,'
      '       descrip,'
      '       type,'
      '       eplant_id'
      '  from V_GLACCT_GLSUB_ACCT_TYPE'
      ' where misc.Eplant_Filter(eplant_id) = 1'
      '   and gl.is_statistical_account(gl_subacct_type_id) = 1'
      ''
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 136
    Top = 64
    object FloatField1: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object StringField1: TStringField
      DisplayLabel = 'Account'
      FieldName = 'ACCT'
      Size = 50
    end
    object StringField2: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object StringField3: TStringField
      DisplayLabel = 'Account Type'
      FieldName = 'TYPE'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.TYPE'
      Size = 35
    end
    object FloatField2: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.EPLANT_ID'
      Size = 0
    end
  end
  object QryBatch: TFDQuery
    Tag = 1
    BeforeOpen = QryBatchBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'Select h.DESCRIP,'
      '       h.DEBIT,'
      '       h.CREDIT,'
      '       h.glbatchid_id,'
      '       h.header_id,'
      '       h.reference,'
      '       h.ref_code,'
      '       h.cost_object_id,'
      '       h.cost_object_source,'
      
        '       iqms.cost_source.get_cost_object_display(h.cost_object_so' +
        'urce, h.cost_object_id) as cost_source,'
      '       h.id,'
      '       h.stat_value'
      '  from glbatch h'
      ' where glbatchid_id = :aBATCH_ID'
      '   and glacct_id = :aGLACCT_ID     ')
    Left = 556
    Top = 205
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
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 120
    end
    object QryBatchDEBIT: TBCDField
      DisplayLabel = 'Debit'
      FieldName = 'DEBIT'
      Origin = 'DEBIT'
      Precision = 15
      Size = 2
    end
    object QryBatchCREDIT: TBCDField
      DisplayLabel = 'Credit'
      FieldName = 'CREDIT'
      Origin = 'CREDIT'
      Precision = 15
      Size = 2
    end
    object QryBatchGLBATCHID_ID: TBCDField
      FieldName = 'GLBATCHID_ID'
      Origin = 'GLBATCHID_ID'
      Required = True
      Precision = 15
      Size = 0
    end
    object QryBatchHEADER_ID: TBCDField
      FieldName = 'HEADER_ID'
      Origin = 'HEADER_ID'
      Precision = 15
      Size = 0
    end
    object QryBatchREFERENCE: TStringField
      DisplayLabel = 'Reference'
      FieldName = 'REFERENCE'
      Origin = 'REFERENCE'
      Size = 60
    end
    object QryBatchREF_CODE: TStringField
      DisplayLabel = 'Ref Code'
      FieldName = 'REF_CODE'
      Origin = 'REF_CODE'
      Size = 10
    end
    object QryBatchCOST_OBJECT_ID: TBCDField
      FieldName = 'COST_OBJECT_ID'
      Origin = 'COST_OBJECT_ID'
      Precision = 15
      Size = 0
    end
    object QryBatchCOST_OBJECT_SOURCE: TStringField
      FieldName = 'COST_OBJECT_SOURCE'
      Origin = 'COST_OBJECT_SOURCE'
      Size = 50
    end
    object QryBatchID2: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object QryBatchSTAT_VALUE: TFMTBCDField
      FieldName = 'STAT_VALUE'
      Origin = 'STAT_VALUE'
      Precision = 15
      Size = 6
    end
    object QryBatchTableName: TStringField
      FieldKind = fkLookup
      FieldName = 'TableName'
      LookupDataSet = TblGlBatchId
      LookupKeyFields = 'ID'
      LookupResultField = 'TABLENAME'
      KeyFields = 'GLBATCHID_ID'
      Lookup = True
    end
    object QryBatchCOST_SOURCE: TStringField
      FieldName = 'COST_SOURCE'
      ReadOnly = True
      Size = 60
    end
  end
end
