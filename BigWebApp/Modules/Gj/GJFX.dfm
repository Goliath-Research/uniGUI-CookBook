object FrmGJFX: TFrmGJFX
  Left = 0
  Top = 0
  ClientHeight = 195
  ClientWidth = 817
  Caption = 'GJ Fx Transaction'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 154
    Width = 817
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitTop = 141
    object Panel2: TUniPanel
      Left = 567
      Top = 1
      Width = 249
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnRecalc: TUniButton
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Recalculate'
        TabOrder = 1
        OnClick = BtnRecalcClick
      end
      object BtnOk: TUniButton
        Left = 89
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 2
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 170
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 3
        OnClick = BtnCancelClick
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 817
    Height = 154
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitHeight = 141
    object Splitter1: TUniSplitter
      Left = 498
      Top = 1
      Width = 6
      Height = 152
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
      ExplicitHeight = 139
    end
    object Splitter2: TUniSplitter
      Left = 639
      Top = 1
      Width = 6
      Height = 152
      Hint = ''
      Align = alRight
      ParentColor = False
      Color = clBtnFace
      ExplicitHeight = 139
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 497
      Height = 152
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitHeight = 139
      object Splitter3: TUniSplitter
        Left = 327
        Top = 1
        Width = 6
        Height = 150
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
        ExplicitHeight = 137
      end
      object Panel7: TUniPanel
        Left = 1
        Top = 1
        Width = 326
        Height = 150
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        ExplicitHeight = 137
        DesignSize = (
          326
          150)
        object Label1: TUniLabel
          Left = 9
          Top = 24
          Width = 23
          Height = 13
          Hint = ''
          Caption = 'Date'
          TabOrder = 5
        end
        object Label2: TUniLabel
          Left = 9
          Top = 56
          Width = 81
          Height = 13
          Hint = ''
          Caption = 'From GL Account'
          TabOrder = 6
        end
        object Label3: TUniLabel
          Left = 9
          Top = 88
          Width = 69
          Height = 13
          Hint = ''
          Caption = 'To GL Account'
          TabOrder = 7
        end
        object Label4: TUniLabel
          Left = 9
          Top = 120
          Width = 69
          Height = 13
          Hint = ''
          Caption = 'FX GL Account'
          TabOrder = 8
        end
        object SBSearchFrom: TUniSpeedButton
          Left = 295
          Top = 50
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
          Anchors = [akTop, akRight]
          ParentColor = False
          Color = clWindow
          OnClick = SBSearchFromClick
        end
        object SBSearchTo: TUniSpeedButton
          Left = 295
          Top = 82
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
          Anchors = [akTop, akRight]
          ParentColor = False
          Color = clWindow
          OnClick = SBSearchToClick
        end
        object EdAcctFrom: TUniEdit
          Left = 103
          Top = 53
          Width = 193
          Height = 19
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Color = clBtnFace
          ReadOnly = True
        end
        object EdAcctTo: TUniEdit
          Left = 103
          Top = 85
          Width = 193
          Height = 19
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Color = clBtnFace
          ReadOnly = True
        end
        object EdAcctFx: TUniEdit
          Left = 103
          Top = 117
          Width = 193
          Height = 19
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          Color = clBtnFace
          ReadOnly = True
        end
        object edDate: TUniDateTimePicker
          Left = 105
          Top = 18
          Width = 191
          Height = 21
          Hint = ''
          DateTime = 42682.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
      end
      object Panel8: TUniPanel
        Left = 333
        Top = 1
        Width = 163
        Height = 150
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        ExplicitHeight = 137
        DesignSize = (
          163
          150)
        object Label7: TUniLabel
          Left = 8
          Top = 24
          Width = 44
          Height = 13
          Hint = ''
          Caption = 'Currency'
          TabOrder = 4
        end
        object Label8: TUniLabel
          Left = 8
          Top = 120
          Width = 38
          Height = 13
          Hint = ''
          Caption = 'Fx Rate'
          TabOrder = 5
        end
        object EdCurrFrom: TUniEdit
          Left = 8
          Top = 53
          Width = 147
          Height = 19
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Color = clBtnFace
        end
        object EdCurrTo: TUniEdit
          Left = 8
          Top = 85
          Width = 147
          Height = 19
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Color = clBtnFace
        end
        object EdFxRate: TUniEdit
          Left = 54
          Top = 115
          Width = 101
          Height = 21
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          OnExit = EdFxRateExit
        end
      end
    end
    object Panel5: TUniPanel
      Left = 645
      Top = 1
      Width = 171
      Height = 152
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      ExplicitHeight = 139
      DesignSize = (
        171
        152)
      object Label6: TUniLabel
        Left = 13
        Top = 24
        Width = 29
        Height = 13
        Hint = ''
        Caption = 'Credit'
        TabOrder = 4
      end
      object EdCreditFrom: TUniEdit
        Left = 13
        Top = 53
        Width = 150
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnExit = EdCreditFromExit
        OnEnter = EdCreditFromEnter
      end
      object EdCreditTo: TUniEdit
        Left = 13
        Top = 85
        Width = 150
        Height = 19
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Color = clBtnFace
        ReadOnly = True
      end
      object EdCreditFx: TUniEdit
        Left = 13
        Top = 117
        Width = 150
        Height = 19
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clBtnFace
        ReadOnly = True
      end
    end
    object Panel6: TUniPanel
      Left = 504
      Top = 1
      Width = 135
      Height = 152
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitHeight = 139
      DesignSize = (
        135
        152)
      object Label5: TUniLabel
        Left = 12
        Top = 25
        Width = 25
        Height = 13
        Hint = ''
        Caption = 'Debit'
        TabOrder = 4
      end
      object edDebitFrom: TUniEdit
        Left = 12
        Top = 53
        Width = 115
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnExit = edDebitFromExit
        OnEnter = edDebitFromEnter
      end
      object EdDebitTo: TUniEdit
        Left = 12
        Top = 85
        Width = 115
        Height = 19
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Color = clBtnFace
        ReadOnly = True
      end
      object EdDebitFx: TUniEdit
        Left = 12
        Top = 117
        Width = 115
        Height = 19
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clBtnFace
        ReadOnly = True
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 16
    Top = 152
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'GJ Fx Transaction'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195750 $'
    BuildVersion = '176554'
    Left = 56
    Top = 152
  end
  object PkAcct: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select id,'
      '          acct,'
      '          descrip,'
      '          type,'
      '          eplant_id,'
      '          glacct_id_fx'
      '  from V_GLACCT_GLSUB_ACCT_TYPE2'
      ' where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      '  and misc.eplant_filter(eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 152
    Top = 153
    object PkAcctID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkAcctACCT: TStringField
      DisplayLabel = 'Acct#'
      FieldName = 'ACCT'
      Size = 50
    end
    object PkAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkAcctTYPE: TStringField
      DisplayLabel = 'Acct. Type'
      FieldName = 'TYPE'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.TYPE'
      Size = 35
    end
    object PkAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkAcctGLACCT_ID_FX: TBCDField
      FieldName = 'GLACCT_ID_FX'
      Visible = False
      Size = 0
    end
  end
end
