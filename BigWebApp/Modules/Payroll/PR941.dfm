object FrmPR941: TFrmPR941
  Left = 97
  Top = 123
  HelpContext = 13983
  ClientHeight = 687
  ClientWidth = 688
  Caption = 'Employers Quarterly Federal Tax Return'
  OnShow = UniFormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 132
    Width = 688
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 132
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 1
      Top = 1
      Width = 686
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object SBSearchPurch: TUniSpeedButton
        Left = 2
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Search... '
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
      object navHeader: TUniDBNavigator
        Left = 486
        Top = 1
        Width = 200
        Height = 25
        Hint = ''
        DataSource = SrcHeader
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object gridHeader: TUniDBGrid
      Left = 1
      Top = 27
      Width = 686
      Height = 105
      Hint = ''
      DataSource = SrcHeader
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Columns = <
        item
          FieldName = 'PR941_QTR'
          Title.Caption = 'Quarter'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PR941_YEAR_STRING'
          Title.Caption = 'Year'
          Width = 28
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 297
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FedTaxId'
          Title.Caption = 'Fed Tax Id'
          Width = 124
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 135
    Width = 688
    Height = 552
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 686
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object DBNavigator2: TUniDBNavigator
        Left = 461
        Top = 1
        Width = 225
        Height = 25
        Hint = ''
        DataSource = SrcDetail
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object GroupBox2: TUniGroupBox
      Left = 369
      Top = 27
      Width = 319
      Height = 525
      Hint = ''
      Caption = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      object Label12: TUniLabel
        Left = 19
        Top = 12
        Width = 56
        Height = 13
        Hint = ''
        Caption = 'Total Taxes'
        TabOrder = 14
      end
      object Label13: TUniLabel
        Left = 19
        Top = 34
        Width = 88
        Height = 13
        Hint = ''
        Caption = 'Adv. EIC Payment'
        TabOrder = 15
      end
      object Label14: TUniLabel
        Left = 19
        Top = 57
        Width = 49
        Height = 13
        Hint = ''
        Caption = 'Net Taxes'
        TabOrder = 16
      end
      object Label15: TUniLabel
        Left = 19
        Top = 79
        Width = 68
        Height = 13
        Hint = ''
        Caption = 'Total Deposits'
        TabOrder = 17
      end
      object Label16: TUniLabel
        Left = 19
        Top = 147
        Width = 59
        Height = 13
        Hint = ''
        Caption = 'Balance Due'
        TabOrder = 18
      end
      object Label17: TUniLabel
        Left = 19
        Top = 169
        Width = 66
        Height = 13
        Hint = ''
        Caption = 'Overpayment'
        TabOrder = 19
      end
      object Label18: TUniLabel
        Left = 19
        Top = 192
        Width = 92
        Height = 13
        Hint = ''
        Caption = 'First Month Liability'
        TabOrder = 20
      end
      object Label19: TUniLabel
        Left = 19
        Top = 214
        Width = 106
        Height = 13
        Hint = ''
        Caption = 'Second Month Liability'
        TabOrder = 21
      end
      object Label20: TUniLabel
        Left = 19
        Top = 237
        Width = 95
        Height = 13
        Hint = ''
        Caption = 'Third Month Liability'
        TabOrder = 22
      end
      object Label21: TUniLabel
        Left = 19
        Top = 260
        Width = 139
        Height = 13
        Hint = ''
        Caption = 'Total Liability for the Quarter'
        TabOrder = 23
      end
      object Label25: TUniLabel
        Left = 19
        Top = 102
        Width = 85
        Height = 13
        Hint = ''
        Caption = 'COBRA payments'
        TabOrder = 24
      end
      object Label26: TUniLabel
        Left = 19
        Top = 124
        Width = 75
        Height = 13
        Hint = ''
        Caption = 'COBRA Number'
        TabOrder = 25
      end
      object db14: TUniDBEdit
        Left = 213
        Top = 76
        Width = 80
        Height = 21
        Hint = 'total deposits for quarter'
        ShowHint = True
        ParentShowHint = False
        DataField = 'FIELD_14'
        DataSource = SrcDetail
        TabOrder = 1
      end
      object db11: TUniDBEdit
        Left = 213
        Top = 9
        Width = 80
        Height = 19
        Cursor = crArrow
        Hint = 'Total taxes less exemption'
        ShowHint = True
        ParentShowHint = False
        DataField = 'FIELD_11'
        DataSource = SrcDetail
        TabOrder = 4
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object db12: TUniDBEdit
        Left = 213
        Top = 31
        Width = 80
        Height = 21
        Hint = 'advanced EIC payments'
        ShowHint = True
        ParentShowHint = False
        DataField = 'FIELD_12'
        DataSource = SrcDetail
        TabOrder = 0
      end
      object db13: TUniDBEdit
        Left = 213
        Top = 54
        Width = 80
        Height = 19
        Cursor = crArrow
        Hint = 'net taxes'
        ShowHint = True
        ParentShowHint = False
        DataField = 'FIELD_13'
        DataSource = SrcDetail
        TabOrder = 5
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object db15: TUniDBEdit
        Left = 213
        Top = 144
        Width = 80
        Height = 19
        Cursor = crArrow
        Hint = 'Balance Due'
        ShowHint = True
        ParentShowHint = False
        DataField = 'FIELD_15'
        DataSource = SrcDetail
        TabOrder = 6
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object db16: TUniDBEdit
        Left = 213
        Top = 166
        Width = 80
        Height = 19
        Cursor = crArrow
        Hint = 'Over Payment'
        ShowHint = True
        ParentShowHint = False
        DataField = 'FIELD_16'
        DataSource = SrcDetail
        TabOrder = 7
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object db17a: TUniDBEdit
        Left = 213
        Top = 189
        Width = 80
        Height = 19
        Cursor = crArrow
        Hint = 'first month liability'
        ShowHint = True
        ParentShowHint = False
        DataField = 'FIELD_17A'
        DataSource = SrcDetail
        TabOrder = 8
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object db17b: TUniDBEdit
        Left = 213
        Top = 211
        Width = 80
        Height = 19
        Cursor = crArrow
        Hint = 'second month liability'
        ShowHint = True
        ParentShowHint = False
        DataField = 'FIELD_17B'
        DataSource = SrcDetail
        TabOrder = 9
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object db17c: TUniDBEdit
        Left = 213
        Top = 234
        Width = 80
        Height = 19
        Cursor = crArrow
        Hint = 'third month liability'
        ShowHint = True
        ParentShowHint = False
        DataField = 'FIELD_17C'
        DataSource = SrcDetail
        TabOrder = 10
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object db17d: TUniDBEdit
        Left = 213
        Top = 257
        Width = 80
        Height = 19
        Cursor = crArrow
        Hint = 'total liability for quarter'
        ShowHint = True
        ParentShowHint = False
        DataField = 'FIELD_17D'
        DataSource = SrcDetail
        TabOrder = 11
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object DBCobraAmt: TUniDBEdit
        Left = 213
        Top = 99
        Width = 80
        Height = 21
        Hint = 'COBRA premium assistance payments.'
        ShowHint = True
        ParentShowHint = False
        DataField = 'COBRA_AMOUNT'
        DataSource = SrcDetail
        TabOrder = 2
      end
      object DBCobraNum: TUniDBEdit
        Left = 213
        Top = 121
        Width = 80
        Height = 21
        Hint = 'Number of individuals provided COBRA premium assistance'
        ShowHint = True
        ParentShowHint = False
        DataField = 'COBRA_NUM'
        DataSource = SrcDetail
        TabOrder = 3
      end
      object GroupBox3: TUniGroupBox
        Left = 2
        Top = 287
        Width = 315
        Height = 238
        Hint = ''
        Caption = ' Hiring Incentives to Restore Employment (HIRE) act '
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 12
        ExplicitTop = 285
        object Label7: TUniLabel
          Left = 19
          Top = 27
          Width = 184
          Height = 13
          Hint = ''
          Caption = '# Employees First Paid Exempt Wages'
          TabOrder = 8
        end
        object Label23: TUniLabel
          Left = 19
          Top = 51
          Width = 187
          Height = 13
          Hint = ''
          Caption = 'Total # Employees Paid Exempt Wages'
          TabOrder = 9
        end
        object Label28: TUniLabel
          Left = 19
          Top = 76
          Width = 72
          Height = 13
          Hint = ''
          Caption = 'Exempt Wages'
          TabOrder = 10
        end
        object Label29: TUniLabel
          Left = 19
          Top = 101
          Width = 143
          Height = 13
          Hint = ''
          Caption = 'Social Security Tax Exemption'
          TabOrder = 11
        end
        object Label30: TUniLabel
          Left = 19
          Top = 126
          Width = 157
          Height = 13
          Hint = ''
          Caption = '# Exempt Employees Mar. 19-31'
          TabOrder = 12
        end
        object Label31: TUniLabel
          Left = 19
          Top = 151
          Width = 128
          Height = 13
          Hint = ''
          Caption = 'Exempt Wages Mar. 19-31'
          TabOrder = 13
        end
        object Label32: TUniLabel
          Left = 19
          Top = 176
          Width = 127
          Height = 13
          Hint = ''
          Caption = 'Mar. 19-31 Tax Exemption'
          TabOrder = 14
        end
        object dbExmNumQtrFst: TUniDBEdit
          Left = 213
          Top = 23
          Width = 80
          Height = 21
          Hint = ''
          ParentShowHint = False
          DataField = 'EXEMPT_NUM_QTR_FIRST'
          DataSource = SrcDetail
          TabOrder = 0
        end
        object dbExmNumQtr: TUniDBEdit
          Left = 213
          Top = 47
          Width = 80
          Height = 21
          Hint = ''
          ParentShowHint = False
          DataField = 'EXEMPT_NUM_QTR'
          DataSource = SrcDetail
          TabOrder = 1
        end
        object dbExemptWages: TUniDBEdit
          Left = 213
          Top = 72
          Width = 80
          Height = 21
          Hint = ''
          ParentShowHint = False
          DataField = 'EXEMPT_WAGES'
          DataSource = SrcDetail
          TabOrder = 2
        end
        object dbExemptTax: TUniDBEdit
          Left = 213
          Top = 97
          Width = 80
          Height = 21
          Hint = ''
          ParentShowHint = False
          DataField = 'EXEMPT_TAX'
          DataSource = SrcDetail
          TabOrder = 3
        end
        object dbExemptMarchNum: TUniDBEdit
          Left = 213
          Top = 122
          Width = 80
          Height = 21
          Hint = ''
          ParentShowHint = False
          DataField = 'EXEMPT_MARCH_NUM'
          DataSource = SrcDetail
          TabOrder = 4
        end
        object dbExemptMarchWages: TUniDBEdit
          Left = 213
          Top = 147
          Width = 80
          Height = 21
          Hint = ''
          ParentShowHint = False
          DataField = 'EXEMPT_MARCH_WAGES'
          DataSource = SrcDetail
          TabOrder = 5
        end
        object dbExemptMarchTax: TUniDBEdit
          Left = 213
          Top = 172
          Width = 80
          Height = 21
          Hint = ''
          ParentShowHint = False
          DataField = 'EXEMPT_MARCH_TAX'
          DataSource = SrcDetail
          TabOrder = 6
        end
        object Calculate: TUniButton
          Left = 214
          Top = 205
          Width = 79
          Height = 25
          Hint = ''
          Caption = 'Calculate'
          TabOrder = 15
          OnClick = CalculateClick
        end
      end
    end
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 27
      Width = 369
      Height = 525
      Hint = ''
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
      object Label2: TUniLabel
        Left = 155
        Top = 16
        Width = 33
        Height = 13
        Hint = ''
        Caption = 'Wages'
        TabOrder = 15
      end
      object Label3: TUniLabel
        Left = 155
        Top = 38
        Width = 95
        Height = 13
        Hint = ''
        Caption = 'Federal Income Tax'
        TabOrder = 16
      end
      object Label4: TUniLabel
        Left = 155
        Top = 62
        Width = 55
        Height = 13
        Hint = ''
        Caption = 'Adjustment'
        TabOrder = 17
      end
      object Label5: TUniLabel
        Left = 155
        Top = 84
        Width = 92
        Height = 13
        Hint = ''
        Caption = 'Line 3 adj by Line 4'
        TabOrder = 18
      end
      object Label6: TUniLabel
        Left = 10
        Top = 107
        Width = 105
        Height = 13
        Hint = ''
        Caption = 'Social Security Wages'
        TabOrder = 19
      end
      object Label8: TUniLabel
        Left = 228
        Top = 130
        Width = 18
        Height = 13
        Hint = ''
        Caption = 'Tax'
        TabOrder = 20
      end
      object Label9: TUniLabel
        Left = 10
        Top = 179
        Width = 195
        Height = 13
        Hint = ''
        Caption = 'Total Social Security and Medicare Taxes'
        TabOrder = 21
      end
      object Label10: TUniLabel
        Left = 140
        Top = 225
        Width = 87
        Height = 13
        Hint = ''
        Caption = 'Total Adjustments'
        TabOrder = 22
      end
      object Label22: TUniLabel
        Left = 228
        Top = 107
        Width = 18
        Height = 13
        Hint = ''
        Caption = 'Tax'
        TabOrder = 23
      end
      object Label24: TUniLabel
        Left = 10
        Top = 130
        Width = 79
        Height = 13
        Hint = ''
        Caption = 'Medicare Wages'
        TabOrder = 24
      end
      object Label27: TUniLabel
        Left = 10
        Top = 16
        Width = 75
        Height = 13
        Hint = ''
        Caption = '# of Employees'
        TabOrder = 25
      end
      object Label1: TUniLabel
        Left = 10
        Top = 202
        Width = 154
        Height = 13
        Hint = ''
        Caption = 'Total Taxes Before Adjustments'
        TabOrder = 26
      end
      object Label11: TUniLabel
        Left = 228
        Top = 155
        Width = 18
        Height = 13
        Hint = ''
        Caption = 'Tax'
        TabOrder = 27
      end
      object Label33: TUniLabel
        Left = 10
        Top = 155
        Width = 109
        Height = 13
        Hint = ''
        Caption = 'Medicare Tier 2 Wages'
        TabOrder = 28
      end
      object db1: TUniDBEdit
        Left = 10
        Top = 35
        Width = 80
        Height = 19
        Cursor = crArrow
        Hint = '# of Employees'
        ShowHint = True
        ParentShowHint = False
        DataField = 'FIELD_1'
        DataSource = SrcDetail
        TabOrder = 0
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object db2: TUniDBEdit
        Left = 262
        Top = 13
        Width = 80
        Height = 19
        Cursor = crArrow
        Hint = 'wages subject to FWT'
        ShowHint = True
        ParentShowHint = False
        DataField = 'FIELD_2'
        DataSource = SrcDetail
        TabOrder = 1
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object db3: TUniDBEdit
        Left = 262
        Top = 35
        Width = 80
        Height = 19
        Cursor = crArrow
        Hint = 'FWT witheld'
        ShowHint = True
        ParentShowHint = False
        DataField = 'FIELD_3'
        DataSource = SrcDetail
        TabOrder = 2
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object db4: TUniDBEdit
        Left = 262
        Top = 58
        Width = 80
        Height = 21
        Hint = 'Adjustment'
        ShowHint = True
        ParentShowHint = False
        DataField = 'FIELD_4'
        DataSource = SrcDetail
        TabOrder = 3
      end
      object db5: TUniDBEdit
        Left = 262
        Top = 80
        Width = 80
        Height = 19
        Cursor = crArrow
        Hint = 'Federal tax'
        ShowHint = True
        ParentShowHint = False
        DataField = 'FIELD_5'
        DataSource = SrcDetail
        TabOrder = 4
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object db6a: TUniDBEdit
        Left = 140
        Top = 103
        Width = 80
        Height = 19
        Cursor = crArrow
        Hint = 'social security taxable wages'
        ShowHint = True
        ParentShowHint = False
        DataField = 'FIELD_6A'
        DataSource = SrcDetail
        TabOrder = 5
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object db6b: TUniDBEdit
        Left = 262
        Top = 104
        Width = 80
        Height = 19
        Cursor = crArrow
        Hint = 'social security tax'
        ShowHint = True
        ParentShowHint = False
        DataField = 'FIELD_6B'
        DataSource = SrcDetail
        TabOrder = 6
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object db7a: TUniDBEdit
        Left = 140
        Top = 127
        Width = 80
        Height = 19
        Cursor = crArrow
        Hint = 'medicare taxable wages'
        ShowHint = True
        ParentShowHint = False
        DataField = 'FIELD_7A'
        DataSource = SrcDetail
        TabOrder = 7
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object db7b: TUniDBEdit
        Left = 262
        Top = 127
        Width = 80
        Height = 19
        Cursor = crArrow
        Hint = 'medicare tax'
        ShowHint = True
        ParentShowHint = False
        DataField = 'FIELD_7B'
        DataSource = SrcDetail
        TabOrder = 8
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object db9: TUniDBEdit
        Left = 262
        Top = 221
        Width = 80
        Height = 21
        Hint = 'adjustment of ss/medicare taxes'
        ShowHint = True
        ParentShowHint = False
        DataField = 'FIELD_9'
        DataSource = SrcDetail
        TabOrder = 9
      end
      object db8: TUniDBEdit
        Left = 262
        Top = 176
        Width = 80
        Height = 19
        Cursor = crArrow
        Hint = ''
        ParentShowHint = False
        DataField = 'FIELD_8'
        DataSource = SrcDetail
        TabOrder = 10
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object dbTotalTaxBefAdj: TUniDBEdit
        Left = 262
        Top = 198
        Width = 80
        Height = 19
        Cursor = crArrow
        Hint = 'Total federal, medicare and social security tax - less exemption'
        ShowHint = True
        ParentShowHint = False
        DataField = 'TotalTaxBefAdj'
        DataSource = SrcDetail
        TabOrder = 11
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object DBTier2Wages: TUniDBEdit
        Left = 140
        Top = 152
        Width = 80
        Height = 19
        Cursor = crArrow
        Hint = 'medicare taxable wages'
        ShowHint = True
        ParentShowHint = False
        DataField = 'MCARE2_TAXABLE'
        DataSource = SrcDetail
        TabOrder = 12
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object DBTier2WagesTax: TUniDBEdit
        Left = 262
        Top = 152
        Width = 80
        Height = 19
        Cursor = crArrow
        Hint = 'medicare tax'
        ShowHint = True
        ParentShowHint = False
        DataField = 'MCARE2_TAX'
        DataSource = SrcDetail
        TabOrder = 13
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 208
    object File1: TUniMenuItem
      Caption = '&File'
      object Search1: TUniMenuItem
        Caption = '&Search'
        OnClick = SBSearchPurchClick
      end
      object N2: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Reports1: TUniMenuItem
      Caption = '&Reports'
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
    ModuleName = 'FrmPR941'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 191860 $'
    BuildVersion = '176554'
    Left = 176
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmPR941'
    WebUse = False
    TouchScreen = False
    Left = 144
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 112
  end
  object SrcHeader: TDataSource
    DataSet = tblHeader
    Left = 136
    Top = 48
  end
  object tblHeader: TFDTable
    AfterInsert = tblHeaderAfterInsert
    BeforePost = tblHeaderBeforePost
    AfterScroll = tblHeaderAfterScroll
    OnCalcFields = tblHeaderCalcFields
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'PR941_HEADER'
    TableName = 'PR941_HEADER'
    Left = 152
    Top = 48
    object tblHeaderID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object tblHeaderPR941_YEAR: TDateTimeField
      FieldName = 'PR941_YEAR'
    end
    object tblHeaderPR941_QTR: TBCDField
      FieldName = 'PR941_QTR'
      Size = 0
    end
    object tblHeaderDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 50
    end
    object tblHeaderPR941_YEAR_STRING: TStringField
      FieldName = 'PR941_YEAR_STRING'
      Size = 4
    end
    object tblHeaderEIN_ID: TBCDField
      FieldName = 'EIN_ID'
      Size = 0
    end
    object tblHeaderEin: TStringField
      FieldKind = fkLookup
      FieldName = 'Ein'
      LookupDataSet = QryEin
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'EIN_ID'
      Lookup = True
    end
    object tblHeaderFedTaxId: TStringField
      FieldKind = fkCalculated
      FieldName = 'FedTaxId'
      Calculated = True
    end
  end
  object SrcDetail: TDataSource
    DataSet = tblDetail
    Left = 256
    Top = 48
  end
  object tblDetail: TFDTable
    BeforeInsert = tblDetailBeforeInsert
    BeforeEdit = tblDetailBeforeInsert
    BeforePost = tblDetailBeforePost
    OnCalcFields = tblDetailCalcFields
    OnNewRecord = tblDetailNewRecord
    IndexFieldNames = 'PR941_HEADER_ID'
    MasterSource = SrcHeader
    MasterFields = 'ID'
    UpdateOptions.UpdateTableName = 'PR941_DETAIL'
    TableName = 'PR941_DETAIL'
    Left = 280
    Top = 48
    object tblDetailID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object tblDetailPR941_HEADER_ID: TBCDField
      FieldName = 'PR941_HEADER_ID'
      Size = 0
    end
    object tblDetailFIELD_1: TFMTBCDField
      FieldName = 'FIELD_1'
      Size = 6
    end
    object tblDetailFIELD_2: TFMTBCDField
      FieldName = 'FIELD_2'
      currency = True
      Size = 6
    end
    object tblDetailFIELD_3: TFMTBCDField
      FieldName = 'FIELD_3'
      currency = True
      Size = 6
    end
    object tblDetailFIELD_4: TFMTBCDField
      FieldName = 'FIELD_4'
      currency = True
      Size = 6
    end
    object tblDetailFIELD_5: TFMTBCDField
      FieldName = 'FIELD_5'
      currency = True
      Size = 6
    end
    object tblDetailFIELD_6A: TFMTBCDField
      FieldName = 'FIELD_6A'
      currency = True
      Size = 6
    end
    object tblDetailFIELD_6B: TFMTBCDField
      FieldName = 'FIELD_6B'
      currency = True
      Size = 6
    end
    object tblDetailFIELD_6C: TFMTBCDField
      FieldName = 'FIELD_6C'
      currency = True
      Size = 6
    end
    object tblDetailFIELD_6D: TFMTBCDField
      FieldName = 'FIELD_6D'
      currency = True
      Size = 6
    end
    object tblDetailFIELD_7A: TFMTBCDField
      FieldName = 'FIELD_7A'
      currency = True
      Size = 6
    end
    object tblDetailFIELD_7B: TFMTBCDField
      FieldName = 'FIELD_7B'
      currency = True
      Size = 6
    end
    object tblDetailFIELD_8: TFMTBCDField
      FieldName = 'FIELD_8'
      currency = True
      Size = 6
    end
    object tblDetailFIELD_9: TFMTBCDField
      FieldName = 'FIELD_9'
      currency = True
      Size = 6
    end
    object tblDetailFIELD_10: TFMTBCDField
      FieldName = 'FIELD_10'
      currency = True
      Size = 6
    end
    object tblDetailFIELD_11: TFMTBCDField
      FieldName = 'FIELD_11'
      currency = True
      Size = 6
    end
    object tblDetailFIELD_12: TFMTBCDField
      FieldName = 'FIELD_12'
      currency = True
      Size = 6
    end
    object tblDetailFIELD_13: TFMTBCDField
      FieldName = 'FIELD_13'
      currency = True
      Size = 6
    end
    object tblDetailFIELD_14: TFMTBCDField
      FieldName = 'FIELD_14'
      currency = True
      Size = 6
    end
    object tblDetailFIELD_16: TFMTBCDField
      FieldName = 'FIELD_16'
      currency = True
      Size = 6
    end
    object tblDetailFIELD_17A: TFMTBCDField
      FieldName = 'FIELD_17A'
      currency = True
      Size = 6
    end
    object tblDetailFIELD_17B: TFMTBCDField
      FieldName = 'FIELD_17B'
      currency = True
      Size = 6
    end
    object tblDetailFIELD_17C: TFMTBCDField
      FieldName = 'FIELD_17C'
      currency = True
      Size = 6
    end
    object tblDetailFIELD_17D: TFMTBCDField
      FieldName = 'FIELD_17D'
      currency = True
      Size = 6
    end
    object tblDetailFIELD_15: TFMTBCDField
      FieldName = 'FIELD_15'
      currency = True
      Size = 6
    end
    object tblDetailCOBRA_AMOUNT: TBCDField
      FieldName = 'COBRA_AMOUNT'
      currency = True
      Size = 2
    end
    object tblDetailCOBRA_NUM: TBCDField
      FieldName = 'COBRA_NUM'
      Size = 0
    end
    object tblDetailEXEMPT_NUM_QTR_FIRST: TBCDField
      FieldName = 'EXEMPT_NUM_QTR_FIRST'
      Size = 0
    end
    object tblDetailEXEMPT_NUM_QTR: TBCDField
      FieldName = 'EXEMPT_NUM_QTR'
      Size = 0
    end
    object tblDetailEXEMPT_WAGES: TBCDField
      FieldName = 'EXEMPT_WAGES'
      Size = 2
    end
    object tblDetailEXEMPT_TAX: TBCDField
      FieldName = 'EXEMPT_TAX'
      Size = 2
    end
    object tblDetailEXEMPT_MARCH_NUM: TBCDField
      FieldName = 'EXEMPT_MARCH_NUM'
      Size = 0
    end
    object tblDetailEXEMPT_MARCH_WAGES: TBCDField
      FieldName = 'EXEMPT_MARCH_WAGES'
      Size = 2
    end
    object tblDetailEXEMPT_MARCH_TAX: TBCDField
      FieldName = 'EXEMPT_MARCH_TAX'
      Size = 2
    end
    object tblDetailTotalTaxBefAdj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalTaxBefAdj'
      currency = True
      Calculated = True
    end
    object tblDetailMCARE2_TAXABLE: TBCDField
      FieldName = 'MCARE2_TAXABLE'
      Size = 2
    end
    object tblDetailMCARE2_TAX: TBCDField
      FieldName = 'MCARE2_TAX'
      Size = 2
    end
  end
  object PK941: TIQWebHpick
    SQL.Strings = (
      'select id as id,'
      '          TO_Char(pr941_year, '#39'YYYY'#39') as year,'
      '          pr941_qtr as pr941_qtr,'
      '          descrip as descrip'
      '  from pr941_header'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 88
    Top = 48
    object PK941PR941_YEAR: TFloatField
      DisplayLabel = 'Year'
      FieldName = 'PR941_YEAR'
      Origin = 'PR941_HEADER.ID'
      Visible = False
    end
    object PK941PR941_QTR: TBCDField
      DisplayLabel = 'Quarter'
      FieldName = 'PR941_QTR'
      Origin = 'PR941_HEADER.PR941_QTR'
      Size = 0
    end
    object PK941DESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'PR941_HEADER.DESCRIP'
      Size = 50
    end
    object PK941ID: TBCDField
      FieldName = 'ID'
      Origin = 'PR941_HEADER.ID'
      Visible = False
      Size = 0
    end
    object PK941YEAR: TStringField
      DisplayLabel = 'Year'
      FieldName = 'YEAR'
      Size = 4
    end
  end
  object PKQtrs: TIQWebHpick
    SQL.Strings = (
      'select quarter as quarter,'
      '           this_year as this_year,'
      '           To_char(this_year, '#39'YYYY'#39') as year'
      '  from v_emp_distinct_quarter')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 88
    Top = 88
    object PKQtrsQUARTER: TFMTBCDField
      DisplayLabel = 'Quarter'
      FieldName = 'QUARTER'
      Origin = 'V_EMP_DISTINCT_QUARTER.QUARTER'
      Size = 38
    end
    object PKQtrsTHIS_YEAR: TDateTimeField
      DisplayLabel = 'This Year'
      FieldName = 'THIS_YEAR'
      Origin = 'V_EMP_DISTINCT_QUARTER.THIS_YEAR'
    end
    object PKQtrsYEAR: TStringField
      DisplayLabel = 'Year'
      FieldName = 'YEAR'
      Size = 4
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 184
    Top = 88
    object Breakdownbymonth1: TUniMenuItem
      Caption = '&Breakdown by month'
      OnClick = Breakdownbymonth1Click
    end
  end
  object PopupMenu2: TUniPopupMenu
    Left = 216
    Top = 88
    object MenuItem1: TUniMenuItem
      Caption = '&Breakdown by month'
      OnClick = MenuItem1Click
    end
  end
  object PopupMenu3: TUniPopupMenu
    Left = 248
    Top = 88
    object MenuItem2: TUniMenuItem
      Caption = '&Breakdown by month'
      OnClick = MenuItem2Click
    end
  end
  object Qry17a: TFDQuery
    Tag = 1
    MasterSource = SrcHeader
    MasterFields = 'PR941_YEAR_STRING'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select check_date,'
      
        '       sum(totalfwt + totaleic + 2 * totalmcare + 2 * totalfica)' +
        ' as total'
      '  from v_emp_941_taxes'
      ' where (this_month  = 1 '
      '    or this_month  = 4 '
      '    or this_month  = 7'
      '    or this_month  = 10)'
      
        '   and RTrim(LTrim(To_Char(this_year))) = LTrim(RTrim(:PR941_YEA' +
        'R_STRING))'
      ' group by check_date')
    Left = 320
    Top = 48
    ParamData = <
      item
        Name = 'PR941_YEAR_STRING'
        DataType = ftString
        ParamType = ptInput
      end>
    object Qry17aCHECK_DATE: TDateTimeField
      FieldName = 'CHECK_DATE'
    end
    object Qry17aTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Size = 38
    end
  end
  object Qry17b: TFDQuery
    Tag = 1
    MasterSource = SrcHeader
    MasterFields = 'PR941_YEAR_STRING'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select check_date,'
      
        '       sum(totalfwt + totaleic + 2 * totalmcare + 2 * totalfica)' +
        ' as total'
      '  from v_emp_941_taxes'
      ' where (this_month  = 2 '
      '    or this_month  = 5 '
      '    or this_month  = 8'
      '    or this_month  = 11)'
      
        '   and RTrim(LTrim(To_Char(this_year))) = LTrim(RTrim(:PR941_YEA' +
        'R_STRING))'
      ' group by check_date')
    Left = 352
    Top = 48
    ParamData = <
      item
        Name = 'PR941_YEAR_STRING'
        DataType = ftString
        ParamType = ptInput
      end>
    object Qry17bCHECK_DATE: TDateTimeField
      FieldName = 'CHECK_DATE'
    end
    object Qry17bTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Size = 38
    end
  end
  object Qry17c: TFDQuery
    Tag = 1
    MasterSource = SrcHeader
    MasterFields = 'PR941_YEAR_STRING'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select check_date,'
      
        '       sum(totalfwt + totaleic + 2 * totalmcare + 2 * totalfica)' +
        ' as total'
      '  from v_emp_941_taxes'
      ' where (this_month  = 3 '
      '    or this_month  = 6 '
      '    or this_month  = 9'
      '    or this_month  = 12)'
      
        '   and RTrim(LTrim(To_Char(this_year))) = LTrim(RTrim(:PR941_YEA' +
        'R_STRING))'
      ' group by check_date')
    Left = 384
    Top = 48
    ParamData = <
      item
        Name = 'PR941_YEAR_STRING'
        DataType = ftString
        ParamType = ptInput
      end>
    object Qry17cCHECK_DATE: TDateTimeField
      FieldName = 'CHECK_DATE'
    end
    object Qry17cTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Size = 38
    end
  end
  object Src17a: TDataSource
    DataSet = Qry17a
    Left = 320
    Top = 72
  end
  object Src17b: TDataSource
    DataSet = Qry17b
    Left = 352
    Top = 72
  end
  object Src17c: TDataSource
    DataSet = Qry17c
    Left = 384
    Top = 72
  end
  object PKQtrsEin: TIQWebHpick
    SQL.Strings = (
      'select v.quarter as quarter,'
      '       v.this_year as this_year,'
      '       To_char(v.this_year, '#39'YYYY'#39') as year,'
      '       e.id as ein_id,'
      '       e.descrip as fed_tax_id'
      '  from v_emp_distinct_quarter_ein v,'
      '       ein e'
      ' where v.ein_id = e.id(+)'
      ''
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 120
    Top = 88
    object FloatField1: TFMTBCDField
      DisplayLabel = 'Quarter'
      FieldName = 'QUARTER'
      Origin = 'V_EMP_DISTINCT_QUARTER.QUARTER'
      Size = 38
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'This Year'
      FieldName = 'THIS_YEAR'
      Origin = 'V_EMP_DISTINCT_QUARTER.THIS_YEAR'
    end
    object StringField1: TStringField
      DisplayLabel = 'Year'
      FieldName = 'YEAR'
      Size = 4
    end
    object PKQtrsEinEIN_ID: TBCDField
      FieldName = 'EIN_ID'
      Visible = False
      Size = 0
    end
    object PKQtrsEinFED_TAX_ID: TStringField
      DisplayLabel = 'Fed Tax ID'
      FieldName = 'FED_TAX_ID'
      Size = 15
    end
  end
  object QryEin: TFDQuery
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, descrip from ein')
    Left = 52
    Top = 49
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'navHeader')
    SecurityCode = 'FRMPR941'
    Left = 208
    Top = 56
  end
end
