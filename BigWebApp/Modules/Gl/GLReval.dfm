object FrmAcctReval: TFrmAcctReval
  Left = 254
  Top = 168
  HelpContext = 1103652
  ClientHeight = 505
  ClientWidth = 735
  Caption = 'Account Revaluation'
  OnShow = UniFormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 229
    Width = 735
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alBottom
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 232
    Width = 735
    Height = 273
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 1
      Top = 236
      Width = 733
      Height = 36
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Panel3: TUniPanel
        Left = 525
        Top = 1
        Width = 207
        Height = 34
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object btnCancel: TUniButton
          Left = 103
          Top = 4
          Width = 97
          Height = 25
          Hint = ''
          Caption = '&Cancel'
          TabOrder = 1
          OnClick = btnCancelClick
        end
        object btnPost: TUniButton
          Left = 1
          Top = 4
          Width = 97
          Height = 25
          Hint = ''
          Caption = '&Post'
          TabOrder = 2
          OnClick = btnPostClick
        end
      end
    end
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 733
      Height = 235
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 516
      IQComponents.Grid.Height = 149
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcGTT
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
      IQComponents.Navigator.DataSource = SrcGTT
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 516
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 149
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcGTT
      Columns = <
        item
          FieldName = 'ID'
          Title.Caption = 'ID'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ACCT'
          Title.Caption = 'Account'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DEBIT'
          Title.Caption = 'Debit'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CREDIT'
          Title.Caption = 'Credit'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'OLD_RATE'
          Title.Caption = 'Old Rate'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LAST_REVALUE_RATE'
          Title.Caption = 'Last Revalue Rate'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ORIG_INVOICE_RATE'
          Title.Caption = 'Original Invoice Rate'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ACCT_DESCRIP'
          Title.Caption = 'GL Account Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'AP_INVOICE_NO'
          Title.Caption = 'AP Invoice Number'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'AR_INVOICE_NO'
          Title.Caption = 'AR Invoice Number'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NEW_RATE'
          Title.Caption = 'New Rate'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      Marker = 0
    end
  end
  object Panel4: TUniPanel
    Left = 0
    Top = 0
    Width = 735
    Height = 229
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel5: TUniPanel
      Left = 1
      Top = 1
      Width = 733
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object sbCurr: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Change Currency'
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
        OnClick = sbCurrClick
      end
      object navAcct: TUniDBNavigator
        Left = 532
        Top = 1
        Width = 200
        Height = 25
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        DataSource = SrcAcct
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object gridAcct: TIQUniGridControl
      Left = 1
      Top = 115
      Width = 733
      Height = 113
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 516
      IQComponents.Grid.Height = 27
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcAcct
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
      IQComponents.Navigator.DataSource = SrcAcct
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 516
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 27
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcAcct
      Columns = <
        item
          FieldName = 'ACCT'
          Title.Caption = 'GL Account'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ACCT_DESCRIP'
          Title.Caption = 'GL Account Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FX_Acct'
          Title.Caption = 'FX Account'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FX_ACCT_DESCRIP'
          Title.Caption = 'FX Account Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FX_offset_Acct'
          Title.Caption = 'Loss Account'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LOSS_ACCT_DESCRIP'
          Title.Caption = 'Loss Account Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'OLDRATE'
          Title.Caption = 'Old Rate'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NEWRATE'
          Title.Caption = 'New Rate'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'YTD_BAL'
          Title.Caption = 'Period end balance'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Fx_Gain_Acct'
          Title.Caption = 'Gain Account'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'GAIN_ACCT_DESCRIP'
          Title.Caption = 'Gain Account Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      Marker = 0
    end
    object dbFX: TUniDBLookupComboBox
      Left = 32
      Top = 144
      Width = 121
      Height = 21
      Hint = ''
      ListFieldIndex = 0
      TabOrder = 2
      Color = clWindow
    end
    object dbOffSet: TUniDBLookupComboBox
      Left = 32
      Top = 168
      Width = 121
      Height = 21
      Hint = ''
      ListFieldIndex = 0
      TabOrder = 3
      Color = clWindow
    end
    object dbGain: TUniDBLookupComboBox
      Left = 32
      Top = 192
      Width = 121
      Height = 21
      Hint = ''
      ListFieldIndex = 0
      TabOrder = 4
      Color = clWindow
    end
    object PnlClient01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 28
      Width = 733
      Height = 87
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      Caption = ''
      object Splitter2: TUniSplitter
        Left = 54
        Top = 1
        Width = 6
        Height = 85
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object PnlLeft01: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 53
        Height = 85
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Label9: TUniLabel
          Left = 8
          Top = 12
          Width = 30
          Height = 13
          Hint = ''
          Caption = 'Period'
          TabOrder = 1
        end
      end
      object PnlClient02: TUniPanel
        Tag = 1999
        Left = 60
        Top = 1
        Width = 672
        Height = 85
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object SBPeriod: TUniSpeedButton
          Left = 116
          Top = 8
          Width = 22
          Height = 22
          Hint = 'Find period'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333333333333333333333333333333333333300000003333333330FFFFF
            03333333330FFFFF03333333330F00FF033333333300B0FF03333333330B0FFF
            0333333330B0FFFF033333330B0FF00F03333330B00FFFFF0333330B03000000
            0333339033333333333333333333333333333333333333333333}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = SBPeriodClick
        end
        object DBEditPeriod: TUniDBEdit
          Left = 0
          Top = 8
          Width = 113
          Height = 21
          Cursor = crArrow
          Hint = ''
          ShowHint = True
          ParentShowHint = False
          DataField = 'Period'
          DataSource = SrcPeriod
          TabOrder = 0
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object CbReval: TUniCheckBox
          Left = 0
          Top = 33
          Width = 281
          Height = 17
          Hint = ''
          Caption = 'Revalue based on transaction level detail'
          TabOrder = 1
          OnClick = CbRevalClick
        end
        object btnPrepare: TUniBitBtn
          Left = 0
          Top = 56
          Width = 113
          Height = 25
          Hint = ''
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000C21E0000C21E000000010000000000002FB221005CDD
            4E005ADD4B009EEC9500B7F1B00033C7240035CF25002CA61F00E6FAE300B9F1
            B2001D5F15002BA21F00D9F8D5002BA11F008CE8820034CD2500EDFCEB002481
            1A00278E1C0032BF230033C72400153D0F002A9C1E00F1FDEF00DEF9DA00278F
            1C00237C1A001E66160091E9870030B7220082E676004DDA3D00278F1C002584
            1B00BBF2B50029981D002FB52100C5F4BF00184C12002BA11F0053DB4400D4F7
            D00034CC240028911D00A8EEA00017441100D2F7CE009CEB93001B56140050DB
            410079E46D0096EA8D0089E77E0079E46D00B9F1B2002A9D1E002BA01E002DA8
            2000F5FDF4002278190028931D001F6917001B551400C5F4BF0086E77B0056DC
            470029971D0034CA2400F9FEF90046D837008FE985002A9D1E001F6C170039D5
            29001F6B170034C9240034CC2400FBFFFB002DA9200033C7240026871B000513
            030046D83700143B0F0025861B0031BD220086E77B002EB0210050DB4100B4F0
            AD002EB12100217418002173180084E67800F3FDF20024811A002A9C1E0031BC
            22005FDE5100A3ED9A002DA92000237A190033C5240033C52400C7F4C200F5FD
            F4002FB42100ADEFA500DEF9DA00D0F6CB0065DF58009BEB9200B0F0A8002482
            1A0035D02500278E1C0046D837005CDD4E006EE16100C7F4C20079E46D004AD9
            3B00237C1A0050DB4100D9F8D500DBF8D7002BA01E0032BF230074E367002DAB
            20002DAA20001B581400B7F1B0002BA11F0035CE250031BD22002A9B1E001A54
            1400A3ED9A002A9D1E001F69170036D3250043D83300F1FDEF002CA41F001B59
            140097EA8D00C4F4BF005CDD4E0076E369006BE15E0062DF54006BE15E002FB5
            2100A6ED9D002EAF21002CA51F00184A1200268B1C00206D17001B5714002BA3
            1F00206F18007FE573002DAA2000B2F0AA00DBF8D70092E98800217218007CE5
            70003DD62C0024811A002A9D1E00AAEEA20056DC470040D73000217318002FB5
            21002FB421006BE15E00227819008CE8810032C023007CE5700029981D00278D
            1C002FB32100278C1C001E64160030BA220034CA2400C5F4BF008FE9850034C9
            24001E6516002EB0210025831B002EAE2000B9F1B200AFEFA800206D170035D1
            2500BEF2B70035CF2500206E18002FB621007CE570008CE881002EB0210070E2
            63001D611600EFFCED002EAD2000237C1A0033C524009BEB9200237B1900206D
            17001F671700206D180081E675001A511300206E180034CD250031BE230031BF
            230036D325009CEB9300DBF8D700217218006BE15E0065DF580024811A00EFFC
            ED00F3FDF200FDFFFD00EFFCED00FFFFFF001D611600FBFFFB00C9F5C4002FB4
            210099EB9000DFF9DC00C0F3BA0068E05B008AE77F0035CE2500D9F8D5002CA4
            1F00F3FDF20097EA8D009FEC9500278D1C0029991E00FFFFFF00FFFFFFFF1130
            1BD6FFFFFFFFFFFFFFFFFFFFFFD61B3B1B3096FFFFFFFFFFFFFFFFFFFF483B3B
            3B1BD9FFFFFFFFFFFFFFFFFF383B123B123B1BD6FFFFFFFFFFFFFF22D9121212
            123B3BD9F3FFFFFFFFFFFFCCE81212121212121B38FFFFFFFFFF55D98B42B812
            1212123BD977FFFFFFFFD98B0D8B8B423B1B12123B11FFFFFFFFD9A4A4A40D42
            D9113B12121B96FFFFFF38200500A4D98DF31B12123B48FFFFFFF34820055F38
            FFFF961B123B1BD6FFFFFFF338D948FFFFFFFFC33B123B1BF3FFFFFFFFFFFFFF
            FFFFFFFFCC3B3B1B11FFFFFFFFFFFFFFFFFFFFFFF31B3B3B1BD6FFFFFFFFFFFF
            FFFFFFFFFF92DD1B1B1BFFFFFFFFFFFFFFFFFFFFFFFF183830DD}
          Caption = 'Prepare'
          TabOrder = 2
          OnClick = DoPrepare
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 312
    object File1: TUniMenuItem
      Caption = '&File'
      object Prepare1: TUniMenuItem
        Caption = '&Prepare'
        OnClick = DoPrepare
      end
      object Post1: TUniMenuItem
        Caption = 'P&ost'
        OnClick = btnPostClick
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object ChangeCurrency1: TUniMenuItem
        Caption = '&Change Currency'
        OnClick = sbCurrClick
      end
      object N2: TUniMenuItem
        Caption = '-'
      end
      object EditOldRate1: TUniMenuItem
        Caption = '&Edit Old Rate'
        OnClick = EditOldRate1Click
      end
      object N3: TUniMenuItem
        Caption = '-'
        GroupIndex = 1
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        GroupIndex = 1
        OnClick = Exit1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = '&Options'
      object SettleTransactionsatHistoricalExchangeRate1: TUniMenuItem
        Caption = '&Settle Transactions at Historical Exchange Rate'
        OnClick = SettleTransactionsatHistoricalExchangeRate1Click
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
    ModuleName = 'Account Revaluation'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 197408 $'
    BuildVersion = '176554'
    Left = 368
  end
  object PKAcct: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       acct,'
      '       descrip,'
      '       type,'
      '       eplant_id'
      '  from V_GLACCT_GLSUB_ACCT_TYPE'
      ' where misc.eplant_filter(eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 160
    Top = 272
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
      DisplayLabel = 'Acct. Type'
      FieldName = 'TYPE'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.TYPE'
      Size = 35
    end
    object PKAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object SrcAcct: TDataSource
    DataSet = QryAcct
    OnStateChange = SrcAcctStateChange
    Left = 120
    Top = 272
  end
  object QryAcct: TFDQuery
    AfterInsert = QryAcctAfterInsert
    BeforePost = QryAcctBeforePost
    AfterPost = QryAcctAfterPost
    BeforeDelete = QryAcctBeforeDelete
    CachedUpdates = True
    OnUpdateRecord = QryAcctUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select g.id,'
      '       g.acct,'
      '       g.descrip as acct_descrip,'
      '       g.fx_acct_id,'
      
        '       (select descrip from glacct where id = g.fx_acct_id) as f' +
        'x_acct_descrip,'
      '       g.fx_offset_acct_id,'
      
        '       (select descrip from glacct where id = g.fx_offset_acct_i' +
        'd) as loss_acct_descrip,'
      '       g.majortype,'
      '       g.fx_gain_acct_id,'
      
        '       (select descrip from glacct where id = g.fx_gain_acct_id)' +
        ' as gain_acct_descrip,'
      '       g2.old_spot_rate as oldrate,'
      '       g2.new_spot_rate as newrate,'
      '       NVL(b.ytd_bal, 0) as ytd_bal'
      '   from glacct g,'
      '        glacct g2,'
      '        (select Sum(NVL(debit, 0) - NVL(credit, 0)) as ytd_bal,'
      '                glacct_id'
      '           from glbatch, glbatchid'
      '          where batch_date <= :ADate'
      '            and glbatch.glbatchid_id = glbatchid.id'
      '          group by glacct_id) b'
      '  where g.id = b.glacct_id(+)'
      '    and g.fx_acct_id is not null'
      
        '    and (g.fx_offset_acct_id is not null or g.fx_gain_acct_id is' +
        ' not null)'
      '    and g.fx_acct_id = g2.id(+)'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 128
    Top = 288
    ParamData = <
      item
        Name = 'ADate'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object QryAcctACCT: TStringField
      DisplayLabel = 'GL Account'
      DisplayWidth = 15
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      ReadOnly = True
      Size = 50
    end
    object QryAcctACCT_DESCRIP: TStringField
      DisplayLabel = 'GL Account Description'
      DisplayWidth = 50
      FieldName = 'ACCT_DESCRIP'
      Origin = 'ACCT_DESCRIP'
      Size = 50
    end
    object QryAcctFX_Acct: TStringField
      DisplayLabel = 'FX Account'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'FX_Acct'
      LookupDataSet = tblGLAcctFx
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCT'
      KeyFields = 'FX_ACCT_ID'
      Size = 50
      Lookup = True
    end
    object QryAcctFX_ACCT_DESCRIP: TStringField
      DisplayLabel = 'FX Account Description'
      DisplayWidth = 50
      FieldName = 'FX_ACCT_DESCRIP'
      Origin = 'FX_ACCT_DESCRIP'
      Size = 50
    end
    object QryAcctFX_offset_Acct: TStringField
      DisplayLabel = 'Loss Account'
      DisplayWidth = 17
      FieldKind = fkLookup
      FieldName = 'FX_offset_Acct'
      LookupDataSet = tblGLAcctOffset
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCT'
      KeyFields = 'FX_OFFSET_ACCT_ID'
      Size = 50
      Lookup = True
    end
    object QryAcctLOSS_ACCT_DESCRIP: TStringField
      DisplayLabel = 'Loss Account Description'
      DisplayWidth = 50
      FieldName = 'LOSS_ACCT_DESCRIP'
      Origin = 'LOSS_ACCT_DESCRIP'
      Size = 50
    end
    object QryAcctOLDRATE: TFMTBCDField
      DisplayLabel = 'Old Rate'
      DisplayWidth = 10
      FieldName = 'OLDRATE'
      Size = 6
    end
    object QryAcctNEWRATE: TFMTBCDField
      DisplayLabel = 'New Rate'
      DisplayWidth = 10
      FieldName = 'NEWRATE'
      Size = 6
    end
    object QryAcctYTD_BAL: TFMTBCDField
      DisplayLabel = 'Period end balance'
      DisplayWidth = 10
      FieldName = 'YTD_BAL'
      ReadOnly = True
      currency = True
      Size = 38
    end
    object QryAcctFx_Gain_Acct: TStringField
      DisplayLabel = 'Gain Account'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'Fx_Gain_Acct'
      LookupDataSet = tblGLAcctGain
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCT'
      KeyFields = 'FX_GAIN_ACCT_ID'
      Size = 50
      Lookup = True
    end
    object QryAcctGAIN_ACCT_DESCRIP: TStringField
      DisplayLabel = 'Gain Account Description'
      DisplayWidth = 50
      FieldName = 'GAIN_ACCT_DESCRIP'
      Origin = 'GAIN_ACCT_DESCRIP'
      Size = 50
    end
    object QryAcctID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
    object QryAcctFX_ACCT_ID: TBCDField
      FieldName = 'FX_ACCT_ID'
      Origin = 'GLACCT.FX_ACCT_ID'
      Visible = False
      Size = 0
    end
    object QryAcctFX_OFFSET_ACCT_ID: TBCDField
      FieldName = 'FX_OFFSET_ACCT_ID'
      Origin = 'GLACCT.FX_OFFSET_ACCT_ID'
      Visible = False
      Size = 0
    end
    object QryAcctFX_GAIN_ACCT_ID: TBCDField
      FieldName = 'FX_GAIN_ACCT_ID'
      Visible = False
      Size = 0
    end
    object QryAcctMAJORTYPE: TStringField
      DisplayWidth = 35
      FieldName = 'MAJORTYPE'
      Visible = False
      Size = 35
    end
  end
  object tblGLAcctFx: TFDTable
    Filtered = True
    OnFilterRecord = tblGLAcctFxFilterRecord
    IndexName = 'PK_GLACCT'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLACCT'
    TableName = 'GLACCT'
    Left = 208
    Top = 272
    object tblGLAcctFxID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object tblGLAcctFxACCT: TStringField
      DisplayLabel = 'Account'
      DisplayWidth = 50
      FieldName = 'ACCT'
      Required = True
      Size = 50
    end
    object tblGLAcctFxDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Size = 50
    end
    object tblGLAcctFxTYPE: TStringField
      FieldName = 'TYPE'
      Size = 25
    end
    object tblGLAcctFxGL_SUBACCT_TYPE_ID: TBCDField
      FieldName = 'GL_SUBACCT_TYPE_ID'
      Size = 0
    end
    object tblGLAcctFxECODE: TStringField
      FieldName = 'ECODE'
      Size = 10
    end
    object tblGLAcctFxEID: TBCDField
      FieldName = 'EID'
      Size = 0
    end
    object tblGLAcctFxEDATE_TIME: TDateTimeField
      FieldName = 'EDATE_TIME'
    end
    object tblGLAcctFxECOPY: TStringField
      FieldName = 'ECOPY'
      Size = 1
    end
    object tblGLAcctFxOLD_SPOT_RATE: TFMTBCDField
      FieldName = 'OLD_SPOT_RATE'
      Size = 6
    end
    object tblGLAcctFxNEW_SPOT_RATE: TFMTBCDField
      FieldName = 'NEW_SPOT_RATE'
      Size = 6
    end
    object tblGLAcctFxFX_ACCT_ID: TBCDField
      FieldName = 'FX_ACCT_ID'
      Size = 0
    end
    object tblGLAcctFxFX_OFFSET_ACCT_ID: TBCDField
      FieldName = 'FX_OFFSET_ACCT_ID'
      Size = 0
    end
    object tblGLAcctFxMAJORTYPE: TStringField
      FieldName = 'MAJORTYPE'
      Size = 35
    end
  end
  object tblGLAcctOffset: TFDTable
    IndexName = 'PK_GLACCT'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLACCT'
    TableName = 'GLACCT'
    Left = 256
    Top = 272
    object tblGLAcctOffsetID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object tblGLAcctOffsetACCT: TStringField
      FieldName = 'ACCT'
      Required = True
      Size = 50
    end
    object tblGLAcctOffsetDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 50
    end
    object tblGLAcctOffsetTYPE: TStringField
      FieldName = 'TYPE'
      Size = 25
    end
    object tblGLAcctOffsetGL_SUBACCT_TYPE_ID: TBCDField
      FieldName = 'GL_SUBACCT_TYPE_ID'
      Size = 0
    end
    object tblGLAcctOffsetECODE: TStringField
      FieldName = 'ECODE'
      Size = 10
    end
    object tblGLAcctOffsetEID: TBCDField
      FieldName = 'EID'
      Size = 0
    end
    object tblGLAcctOffsetEDATE_TIME: TDateTimeField
      FieldName = 'EDATE_TIME'
    end
    object tblGLAcctOffsetECOPY: TStringField
      FieldName = 'ECOPY'
      Size = 1
    end
    object tblGLAcctOffsetOLD_SPOT_RATE: TFMTBCDField
      FieldName = 'OLD_SPOT_RATE'
      Size = 6
    end
    object tblGLAcctOffsetNEW_SPOT_RATE: TFMTBCDField
      FieldName = 'NEW_SPOT_RATE'
      Size = 6
    end
    object tblGLAcctOffsetFX_ACCT_ID: TBCDField
      FieldName = 'FX_ACCT_ID'
      Size = 0
    end
    object tblGLAcctOffsetFX_OFFSET_ACCT_ID: TBCDField
      FieldName = 'FX_OFFSET_ACCT_ID'
      Size = 0
    end
    object tblGLAcctOffsetMAJORTYPE: TStringField
      FieldName = 'MAJORTYPE'
      Size = 35
    end
  end
  object tblGlAcctFx2: TFDTable
    IndexName = 'PK_GLACCT'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLACCT'
    TableName = 'GLACCT'
    Left = 208
    Top = 312
    object FloatField1: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object StringField1: TStringField
      FieldName = 'ACCT'
      Required = True
      Size = 50
    end
    object StringField2: TStringField
      FieldName = 'DESCRIP'
      Size = 50
    end
    object StringField3: TStringField
      FieldName = 'TYPE'
      Size = 25
    end
    object FloatField2: TBCDField
      FieldName = 'GL_SUBACCT_TYPE_ID'
      Size = 0
    end
    object StringField5: TStringField
      FieldName = 'ECODE'
      Size = 10
    end
    object FloatField3: TBCDField
      FieldName = 'EID'
      Size = 0
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'EDATE_TIME'
    end
    object StringField6: TStringField
      FieldName = 'ECOPY'
      Size = 1
    end
    object FloatField4: TFMTBCDField
      FieldName = 'OLD_SPOT_RATE'
      Size = 6
    end
    object FloatField5: TFMTBCDField
      FieldName = 'NEW_SPOT_RATE'
      Size = 6
    end
    object FloatField6: TBCDField
      FieldName = 'FX_ACCT_ID'
      Size = 0
    end
    object FloatField7: TBCDField
      FieldName = 'FX_OFFSET_ACCT_ID'
      Size = 0
    end
    object tblGlAcctFx2MAJORTYPE: TStringField
      FieldName = 'MAJORTYPE'
      Size = 35
    end
  end
  object PKCurrency: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       Native_curr,'
      '       curr_code,'
      '       descrip,'
      '       spot_rate,'
      '       glvalue'
      '  from currency'
      'where curr_code <> native_curr')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 224
    Top = 112
    object PKCurrencyID: TBCDField
      FieldName = 'ID'
      Origin = 'CURRENCY.ID'
      Visible = False
      Size = 0
    end
    object PKCurrencyCURR_CODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'CURR_CODE'
      Origin = 'CURRENCY.CURR_CODE'
      Size = 10
    end
    object PKCurrencyDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'CURRENCY.DESCRIP'
      Size = 50
    end
    object PKCurrencySPOT_RATE: TFMTBCDField
      DisplayLabel = 'Rate'
      FieldName = 'SPOT_RATE'
      Origin = 'CURRENCY.SPOT_RATE'
      Size = 6
    end
    object PKCurrencyGLVALUE: TStringField
      FieldName = 'GLVALUE'
      Origin = 'CURRENCY.GLVALUE'
      Visible = False
      Size = 50
    end
    object PKCurrencyNATIVE_CURR: TStringField
      DisplayLabel = 'Native Code'
      FieldName = 'NATIVE_CURR'
      Origin = 'IQ.CURRENCY.NATIVE_CURR'
      Size = 3
    end
  end
  object QryPeriod: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from glperiods')
    Left = 328
    Top = 272
  end
  object SrcPeriod: TDataSource
    DataSet = QryPeriod
    Left = 352
    Top = 272
  end
  object tblGLAcctGain: TFDTable
    IndexName = 'PK_GLACCT'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLACCT'
    TableName = 'GLACCT'
    Left = 256
    Top = 312
    object FloatField8: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object StringField4: TStringField
      FieldName = 'ACCT'
      Required = True
      Size = 50
    end
    object StringField7: TStringField
      FieldName = 'DESCRIP'
      Size = 50
    end
    object StringField8: TStringField
      FieldName = 'TYPE'
      Size = 25
    end
    object FloatField9: TBCDField
      FieldName = 'GL_SUBACCT_TYPE_ID'
      Size = 0
    end
    object StringField9: TStringField
      FieldName = 'ECODE'
      Size = 10
    end
    object FloatField10: TBCDField
      FieldName = 'EID'
      Size = 0
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'EDATE_TIME'
    end
    object StringField10: TStringField
      FieldName = 'ECOPY'
      Size = 1
    end
    object FloatField11: TFMTBCDField
      FieldName = 'OLD_SPOT_RATE'
      Size = 6
    end
    object FloatField12: TFMTBCDField
      FieldName = 'NEW_SPOT_RATE'
      Size = 6
    end
    object FloatField13: TBCDField
      FieldName = 'FX_ACCT_ID'
      Size = 0
    end
    object FloatField14: TBCDField
      FieldName = 'FX_OFFSET_ACCT_ID'
      Size = 0
    end
    object StringField11: TStringField
      FieldName = 'MAJORTYPE'
      Size = 35
    end
  end
  object QryGlAcctFX: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '          acct,'
      '          descrip,'
      '         eplant_id'
      '  from glacct'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      '  and misc.eplant_filter(eplant_id) = 1'
      'order by acct')
    Left = 328
    Top = 312
    object QryGlAcctFXACCT: TStringField
      DisplayLabel = 'Account'
      DisplayWidth = 50
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      Size = 50
    end
    object QryGlAcctFXDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'GLACCT.DESCRIP'
      Size = 50
    end
    object QryGlAcctFXEPLANT_ID: TBCDField
      DisplayLabel = 'Eplant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryGlAcctFXID: TBCDField
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
  end
  object QryGlAcctOffset: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '          acct,'
      '          descrip,'
      '         eplant_id'
      '  from glacct'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      '  and misc.eplant_filter(eplant_id) = 1'
      'order by acct'
      '')
    Left = 368
    Top = 312
    object QryGlAcctOffsetACCT: TStringField
      DisplayLabel = 'Account'
      DisplayWidth = 50
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      Size = 50
    end
    object QryGlAcctOffsetDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'GLACCT.DESCRIP'
      Size = 50
    end
    object QryGlAcctOffsetEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryGlAcctOffsetID: TBCDField
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
  end
  object QryGlAcctGain: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '          acct,'
      '          descrip,'
      '         eplant_id'
      '  from glacct'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      '  and misc.eplant_filter(eplant_id) = 1'
      'order by acct'
      '')
    Left = 408
    Top = 312
    object QryGlAcctGainACCT: TStringField
      DisplayLabel = 'Account'
      DisplayWidth = 50
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      Size = 50
    end
    object QryGlAcctGainDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'GLACCT.DESCRIP'
      Size = 50
    end
    object QryGlAcctGainEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryGlAcctGainID: TBCDField
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnPost'
      'Post1'
      'Prepare1'
      'ChangeCurrency1'
      'EditOldRate1'
      'CbReval')
    SecurityCode = 'FRMACCTREVAL'
    Left = 340
  end
  object SrcGTT: TDataSource
    DataSet = QryGTT
    OnStateChange = SrcAcctStateChange
    Left = 520
    Top = 272
  end
  object QryGTT: TFDQuery
    BeforeOpen = QryGTTBeforeOpen
    AfterOpen = QryGTTAfterOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select g.id,        '
      '       g.batch_id,  '
      '       g.glacct_id,'
      '       g.debit,     '
      '       g.credit,    '
      '       g.old_rate,  '
      '       g.new_rate,  '
      '       g.last_revalue_rate, '
      '       g.orig_invoice_rate, '
      '       g.apinvoice_id, '
      '       g.arinvoice_id,'
      '       t.acct,'
      '       t.descrip as acct_descrip,'
      '       r.invoice_no as ar_invoice_no,'
      '       p.invoice_no as ap_invoice_no,'
      '       NVL(r.invoice_no, p.invoice_no) as invoice_no'
      '  from GTT_GL_REVALUE g,'
      '       glacct t,'
      '       arinvoice r,'
      '       apinvoice p'
      ' where g.batch_id = :ABatchId '
      '   and g.glacct_id = t.id(+)'
      '   and g.apinvoice_id = p.id(+)'
      '   and g.arinvoice_id = r.id(+)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 528
    Top = 288
    ParamData = <
      item
        Name = 'ABatchId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryGTTID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'g.ID'
      Size = 0
    end
    object QryGTTBATCH_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'BATCH_ID'
      Size = 0
    end
    object QryGTTGLACCT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'GLACCT_ID'
      Size = 0
    end
    object QryGTTDEBIT: TBCDField
      DisplayLabel = 'Debit'
      DisplayWidth = 10
      FieldName = 'DEBIT'
      Origin = 'g.DEBIT'
      currency = True
      Size = 2
    end
    object QryGTTCREDIT: TBCDField
      DisplayLabel = 'Credit'
      DisplayWidth = 10
      FieldName = 'CREDIT'
      Origin = 'g.CREDIT'
      currency = True
      Size = 2
    end
    object QryGTTOLD_RATE: TFMTBCDField
      DisplayLabel = 'Old Rate'
      DisplayWidth = 10
      FieldName = 'OLD_RATE'
      Origin = 'g.OLD_RATE'
      Size = 6
    end
    object QryGTTLAST_REVALUE_RATE: TFMTBCDField
      DisplayLabel = 'Last Revalue Rate'
      DisplayWidth = 10
      FieldName = 'LAST_REVALUE_RATE'
      Origin = 'g.LAST_REVALUE_RATE'
      Size = 6
    end
    object QryGTTORIG_INVOICE_RATE: TFMTBCDField
      DisplayLabel = 'Original Invoice Rate'
      DisplayWidth = 10
      FieldName = 'ORIG_INVOICE_RATE'
      Origin = 'g.ORIG_INVOICE_RATE'
      Size = 6
    end
    object QryGTTAPINVOICE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'APINVOICE_ID'
      Size = 0
    end
    object QryGTTARINVOICE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVOICE_ID'
      Size = 0
    end
    object QryGTTACCT: TStringField
      DisplayLabel = 'Account'
      DisplayWidth = 50
      FieldName = 'ACCT'
      Origin = 't.acct'
      Size = 50
    end
    object QryGTTACCT_DESCRIP: TStringField
      DisplayLabel = 'GL Account Description'
      DisplayWidth = 50
      FieldName = 'ACCT_DESCRIP'
      Origin = 't.descrip'
      Size = 50
    end
    object QryGTTAR_INVOICE_NO: TStringField
      DisplayLabel = 'AR Invoice Number'
      DisplayWidth = 25
      FieldName = 'AR_INVOICE_NO'
      Origin = 'r.invoice_no'
      Size = 25
    end
    object QryGTTAP_INVOICE_NO: TStringField
      DisplayLabel = 'AP Invoice Number'
      DisplayWidth = 50
      FieldName = 'AP_INVOICE_NO'
      Origin = 'p.invoice_no'
      Size = 50
    end
    object QryGTTINVOICE_NO: TStringField
      DisplayLabel = 'Invoice Number'
      DisplayWidth = 50
      FieldName = 'INVOICE_NO'
      Size = 50
    end
    object QryGTTNEW_RATE: TFMTBCDField
      DisplayLabel = 'New Rate'
      FieldName = 'NEW_RATE'
      Origin = 'g.new_rate'
      Size = 6
    end
  end
  object PopupMenu1: TUniPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 488
    Top = 336
    object JumptoARInvoice1: TUniMenuItem
      Caption = 'Jump to AR Invoice'
      OnClick = JumptoARInvoice1Click
    end
    object JumptoAPInvoice1: TUniMenuItem
      Caption = 'Jump to AP Invoice'
      OnClick = JumptoAPInvoice1Click
    end
  end
end
