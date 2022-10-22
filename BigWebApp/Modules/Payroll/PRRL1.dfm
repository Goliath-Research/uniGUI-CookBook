object FrmPrRl: TFrmPrRl
  Left = 0
  Top = 0
  ClientHeight = 672
  ClientWidth = 1009
  Caption = 'RL Statement of Remuneration Paid'
  OldCreateOrder = False
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 148
    Width = 1009
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alBottom
    ParentColor = False
    Color = clBtnFace
  end
  object PnlDtl: TUniPanel
    Left = 0
    Top = 151
    Width = 1009
    Height = 521
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel1: TUniPanel
      Left = 1
      Top = 1
      Width = 1007
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object SBSearchEmp: TUniSpeedButton
        Left = 2
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Search Employee... '
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
        OnClick = SBSearchEmpClick
      end
      object NavDtl: TUniDBNavigator
        Left = 782
        Top = 1
        Width = 225
        Height = 25
        Hint = ''
        DataSource = SrcDtl
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object Panel2: TUniPanel
      Left = 1
      Top = 27
      Width = 1007
      Height = 494
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Splitter2: TUniSplitter
        Left = 621
        Top = 0
        Width = 6
        Height = 494
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object Splitter3: TUniSplitter
        Left = 627
        Top = 0
        Width = 6
        Height = 494
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object Panel4: TUniPanel
        Left = 425
        Top = 1
        Width = 196
        Height = 492
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          196
          492)
        object Label16: TUniLabel
          Left = 6
          Top = 46
          Width = 84
          Height = 13
          Hint = ''
          Caption = 'Employee Income'
          TabOrder = 26
        end
        object Label17: TUniLabel
          Left = 6
          Top = 83
          Width = 87
          Height = 13
          Hint = ''
          Caption = 'QPP Contributions'
          TabOrder = 27
        end
        object Label18: TUniLabel
          Left = 6
          Top = 120
          Width = 77
          Height = 13
          Hint = ''
          Caption = 'EI Contributions'
          TabOrder = 28
        end
        object label55: TUniLabel
          Left = 6
          Top = 157
          Width = 86
          Height = 13
          Hint = ''
          Caption = 'RPP Contributions'
          TabOrder = 29
        end
        object Label20: TUniLabel
          Left = 6
          Top = 194
          Width = 96
          Height = 13
          Hint = ''
          Caption = 'Quebec Income Tax'
          TabOrder = 30
        end
        object Label21: TUniLabel
          Left = 6
          Top = 231
          Width = 54
          Height = 13
          Hint = ''
          Caption = 'Union Dues'
          TabOrder = 31
        end
        object Label22: TUniLabel
          Left = 6
          Top = 268
          Width = 124
          Height = 13
          Hint = ''
          Caption = 'QPP pensionable earnings'
          TabOrder = 32
        end
        object Label13: TUniLabel
          Left = 23
          Top = 8
          Width = 80
          Height = 13
          Hint = ''
          Caption = 'Submission Code'
          TabOrder = 33
        end
        object Label19: TUniLabel
          Left = 6
          Top = 305
          Width = 67
          Height = 13
          Hint = ''
          Caption = 'QPIP premium'
          TabOrder = 34
        end
        object Label30: TUniLabel
          Left = 6
          Top = 379
          Width = 74
          Height = 13
          Hint = ''
          Caption = 'Health Services'
          TabOrder = 35
        end
        object Label31: TUniLabel
          Left = 6
          Top = 416
          Width = 63
          Height = 13
          Hint = ''
          Caption = 'Remote Area'
          TabOrder = 36
        end
        object Label32: TUniLabel
          Left = 6
          Top = 453
          Width = 70
          Height = 13
          Hint = ''
          Caption = 'Other benefits'
          TabOrder = 37
        end
        object Label33: TUniLabel
          Left = 6
          Top = 342
          Width = 114
          Height = 13
          Hint = ''
          Caption = 'QPIP insurable earnings'
          TabOrder = 38
        end
        object DBB: TUniDBEdit
          Left = 25
          Top = 97
          Width = 133
          Height = 21
          Hint = ''
          DataField = 'QPP_WITHHELD'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object DBC: TUniDBEdit
          Left = 25
          Top = 134
          Width = 133
          Height = 21
          Hint = ''
          DataField = 'EI_WITHHELD'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
        object DBD: TUniDBEdit
          Left = 25
          Top = 171
          Width = 133
          Height = 21
          Hint = ''
          DataField = 'RPP_WITHHELD'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
        end
        object DBE: TUniDBEdit
          Left = 25
          Top = 209
          Width = 133
          Height = 21
          Hint = ''
          DataField = 'TOTALPRO'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
        end
        object DBA: TUniDBEdit
          Left = 25
          Top = 60
          Width = 133
          Height = 21
          Hint = ''
          DataField = 'GROSS_PAY'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object DBF: TUniDBEdit
          Left = 25
          Top = 246
          Width = 133
          Height = 21
          Hint = ''
          DataField = 'UNION_DUES'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
        end
        object DBG: TUniDBEdit
          Left = 25
          Top = 283
          Width = 133
          Height = 21
          Hint = ''
          DataField = 'CPP_QPP_EARNINGS'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 6
        end
        object Edit5: TUniEdit
          Left = 6
          Top = 61
          Width = 19
          Height = 19
          Hint = ''
          Text = ' A'
          TabOrder = 7
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object Edit6: TUniEdit
          Left = 6
          Top = 99
          Width = 19
          Height = 19
          Hint = ''
          Text = ' B'
          TabOrder = 8
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object Edit7: TUniEdit
          Left = 6
          Top = 136
          Width = 19
          Height = 19
          Hint = ''
          Text = ' C'
          TabOrder = 9
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object Edit8: TUniEdit
          Left = 6
          Top = 173
          Width = 19
          Height = 19
          Hint = ''
          Text = ' D'
          TabOrder = 10
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object Edit9: TUniEdit
          Left = 6
          Top = 208
          Width = 19
          Height = 19
          Hint = ''
          Text = ' E'
          TabOrder = 11
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object Edit10: TUniEdit
          Left = 6
          Top = 247
          Width = 19
          Height = 19
          Hint = ''
          Text = ' F'
          TabOrder = 12
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object Edit11: TUniEdit
          Left = 6
          Top = 284
          Width = 19
          Height = 19
          Hint = ''
          Text = ' G'
          TabOrder = 13
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object DBEditCode: TUniDBEdit
          Left = 23
          Top = 24
          Width = 133
          Height = 19
          Hint = ''
          DataField = 'SUBMISSION_CODE'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 19
          TabStop = False
          Color = clBtnFace
        end
        object Edit1: TUniEdit
          Left = 6
          Top = 321
          Width = 19
          Height = 19
          Hint = ''
          Text = ' H'
          TabOrder = 20
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object DBH: TUniDBEdit
          Left = 25
          Top = 319
          Width = 133
          Height = 21
          Hint = ''
          DataField = 'QPIP_WITHHELD'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 14
        end
        object Edit2: TUniEdit
          Left = 6
          Top = 358
          Width = 19
          Height = 19
          Hint = ''
          Text = ' I'
          TabOrder = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object DBI: TUniDBEdit
          Left = 25
          Top = 356
          Width = 133
          Height = 21
          Hint = ''
          DataField = 'QPIP_GROSSTOTAX'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 15
        end
        object DBJ: TUniDBEdit
          Left = 25
          Top = 393
          Width = 133
          Height = 21
          Hint = ''
          DataField = 'HEALTH_SERVICES'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 16
        end
        object Edit3: TUniEdit
          Left = 6
          Top = 395
          Width = 19
          Height = 19
          Hint = ''
          Text = ' J'
          TabOrder = 22
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object Edit4: TUniEdit
          Left = 6
          Top = 432
          Width = 19
          Height = 19
          Hint = ''
          Text = ' K'
          TabOrder = 23
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object DBK: TUniDBEdit
          Left = 25
          Top = 433
          Width = 133
          Height = 21
          Hint = ''
          DataField = 'REMOTE_AREA'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 17
        end
        object DBL: TUniDBEdit
          Left = 25
          Top = 468
          Width = 133
          Height = 21
          Hint = ''
          DataField = 'OTHER_BENEFITS'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 18
        end
        object Edit19: TUniEdit
          Left = 6
          Top = 470
          Width = 19
          Height = 19
          Hint = ''
          Text = ' L'
          TabOrder = 24
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
      end
      object Panel5: TUniPanel
        Left = 633
        Top = 1
        Width = 374
        Height = 492
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 2
        Caption = ''
        DesignSize = (
          374
          492)
        object Label23: TUniLabel
          Left = 9
          Top = 46
          Width = 60
          Height = 13
          Hint = ''
          Caption = 'Commissions'
          TabOrder = 26
        end
        object Label24: TUniLabel
          Left = 4
          Top = 84
          Width = 99
          Height = 13
          Hint = ''
          Caption = 'Charitable donations'
          TabOrder = 27
        end
        object Label25: TUniLabel
          Left = 4
          Top = 119
          Width = 66
          Height = 13
          Hint = ''
          Caption = 'Other Income'
          TabOrder = 28
        end
        object Label26: TUniLabel
          Left = 4
          Top = 156
          Width = 144
          Height = 13
          Hint = ''
          Caption = 'Multi-Employer Insurance plan'
          TabOrder = 29
        end
        object Label27: TUniLabel
          Left = 4
          Top = 194
          Width = 79
          Height = 13
          Hint = ''
          Caption = 'Deferred Wages'
          TabOrder = 30
        end
        object Label28: TUniLabel
          Left = 4
          Top = 233
          Width = 70
          Height = 13
          Hint = ''
          Caption = 'Indian reserve'
          TabOrder = 31
        end
        object Label29: TUniLabel
          Left = 4
          Top = 268
          Width = 19
          Height = 13
          Hint = ''
          Caption = 'Tips'
          TabOrder = 32
        end
        object Label14: TUniLabel
          Left = 7
          Top = 8
          Width = 124
          Height = 13
          Hint = ''
          Caption = 'Last Transmission Number'
          TabOrder = 33
        end
        object Label15: TUniLabel
          Left = 175
          Top = 8
          Width = 87
          Height = 13
          Hint = ''
          Caption = 'Sequence Number'
          TabOrder = 34
        end
        object Label34: TUniLabel
          Left = 6
          Top = 307
          Width = 64
          Height = 13
          Hint = ''
          Caption = 'Allocated tips'
          TabOrder = 35
        end
        object Label35: TUniLabel
          Left = 5
          Top = 382
          Width = 85
          Height = 13
          Hint = ''
          Caption = 'Meals and lodging'
          TabOrder = 36
        end
        object Label36: TUniLabel
          Left = 5
          Top = 419
          Width = 84
          Height = 13
          Hint = ''
          Caption = 'Motor vehicle use'
          TabOrder = 37
        end
        object Label37: TUniLabel
          Left = 6
          Top = 453
          Width = 69
          Height = 13
          Hint = ''
          Caption = 'Code (case O)'
          TabOrder = 38
        end
        object Label38: TUniLabel
          Left = 5
          Top = 345
          Width = 88
          Height = 13
          Hint = ''
          Caption = 'Phased retirement'
          TabOrder = 39
        end
        object DBN: TUniDBEdit
          Left = 23
          Top = 98
          Width = 327
          Height = 21
          Hint = ''
          DataField = 'CHARITABLE'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object DBO: TUniDBEdit
          Left = 23
          Top = 133
          Width = 327
          Height = 21
          Hint = ''
          DataField = 'OTHER_INCOME'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
        object DBP: TUniDBEdit
          Left = 23
          Top = 170
          Width = 327
          Height = 21
          Hint = ''
          DataField = 'MULTI_EMPLOYER'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
        end
        object DBQ: TUniDBEdit
          Left = 23
          Top = 209
          Width = 327
          Height = 21
          Hint = ''
          DataField = 'DEFERRED_WAGES'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
        end
        object DBM: TUniDBEdit
          Left = 23
          Top = 60
          Width = 327
          Height = 21
          Hint = ''
          DataField = 'COMMISSIONS'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object DBR: TUniDBEdit
          Left = 23
          Top = 246
          Width = 327
          Height = 21
          Hint = ''
          DataField = 'INDIAN_RESERVE'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
        end
        object DBS: TUniDBEdit
          Left = 23
          Top = 284
          Width = 327
          Height = 21
          Hint = ''
          DataField = 'TIPS'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 6
        end
        object Edit12: TUniEdit
          Left = 5
          Top = 60
          Width = 19
          Height = 19
          Hint = ''
          Text = ' M'
          TabOrder = 7
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object Edit13: TUniEdit
          Left = 5
          Top = 98
          Width = 19
          Height = 19
          Hint = ''
          Text = ' N'
          TabOrder = 8
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object Edit14: TUniEdit
          Left = 5
          Top = 134
          Width = 19
          Height = 19
          Hint = ''
          Text = ' O'
          TabOrder = 9
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object Edit15: TUniEdit
          Left = 5
          Top = 170
          Width = 19
          Height = 19
          Hint = ''
          Text = ' P'
          TabOrder = 10
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object Edit16: TUniEdit
          Left = 5
          Top = 209
          Width = 19
          Height = 19
          Hint = ''
          Text = ' Q'
          TabOrder = 11
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object Edit17: TUniEdit
          Left = 5
          Top = 247
          Width = 19
          Height = 19
          Hint = ''
          Text = ' R'
          TabOrder = 12
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object Edit18: TUniEdit
          Left = 5
          Top = 284
          Width = 19
          Height = 19
          Hint = ''
          Text = ' S'
          TabOrder = 13
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object DBEditLastTransNumber: TUniDBEdit
          Left = 7
          Top = 24
          Width = 133
          Height = 19
          Hint = ''
          DataField = 'ORG_RL_SLIP_NO'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 14
          TabStop = False
          Color = clBtnFace
        end
        object DBEditSequenceNo: TUniDBEdit
          Left = 175
          Top = 24
          Width = 133
          Height = 19
          Hint = ''
          DataField = 'SEQUENCE_NO'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 15
          TabStop = False
          Color = clBtnFace
        end
        object Edit20: TUniEdit
          Left = 5
          Top = 324
          Width = 19
          Height = 19
          Hint = ''
          Text = ' T'
          TabOrder = 16
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object DBT: TUniDBEdit
          Left = 24
          Top = 322
          Width = 327
          Height = 21
          Hint = ''
          DataField = 'ALLOCATED_TIPS'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 17
        end
        object Edit21: TUniEdit
          Left = 5
          Top = 361
          Width = 19
          Height = 19
          Hint = ''
          Text = ' U'
          TabOrder = 18
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object DBU: TUniDBEdit
          Left = 24
          Top = 359
          Width = 327
          Height = 21
          Hint = ''
          DataField = 'PHASED_RETIRE'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 19
        end
        object DBV: TUniDBEdit
          Left = 24
          Top = 398
          Width = 327
          Height = 21
          Hint = ''
          DataField = 'MEALS_LODGING'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 20
        end
        object Edit22: TUniEdit
          Left = 5
          Top = 398
          Width = 19
          Height = 19
          Hint = ''
          Text = ' V'
          TabOrder = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object Edit23: TUniEdit
          Left = 5
          Top = 435
          Width = 19
          Height = 19
          Hint = ''
          Text = ' W'
          TabOrder = 22
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object DBW: TUniDBEdit
          Left = 24
          Top = 433
          Width = 327
          Height = 21
          Hint = ''
          DataField = 'MOTOR_VEHICLE'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 23
        end
        object DBCode: TUniDBEdit
          Left = 24
          Top = 468
          Width = 327
          Height = 21
          Hint = ''
          DataField = 'CODE_O'
          DataSource = SrcDtl
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 24
        end
      end
      object Panel6: TUniPanel
        Left = 1
        Top = 1
        Width = 425
        Height = 492
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Splitter4: TUniSplitter
          Left = 0
          Top = 220
          Width = 425
          Height = 3
          Cursor = crVSplit
          Hint = ''
          Align = alTop
          ParentColor = False
          Color = clBtnFace
        end
        object GroupBox2: TUniGroupBox
          Left = 1
          Top = 1
          Width = 423
          Height = 220
          Hint = ''
          Caption = ' Employee Info '
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DesignSize = (
            423
            220)
          object Label1: TUniLabel
            Left = 297
            Top = 15
            Width = 117
            Height = 13
            Hint = ''
            Caption = 'Social Insurance number'
            TabOrder = 13
          end
          object Label2: TUniLabel
            Left = 32
            Top = 15
            Width = 115
            Height = 13
            Hint = ''
            Caption = 'Province of Employment'
            TabOrder = 14
          end
          object Label3: TUniLabel
            Left = 184
            Top = 15
            Width = 86
            Height = 13
            Hint = ''
            Caption = 'Employment Code'
            TabOrder = 15
          end
          object Label4: TUniLabel
            Left = 32
            Top = 66
            Width = 51
            Height = 13
            Hint = ''
            Caption = 'First Name'
            TabOrder = 16
          end
          object Label5: TUniLabel
            Left = 184
            Top = 66
            Width = 60
            Height = 13
            Hint = ''
            Caption = 'Middle Name'
            TabOrder = 17
          end
          object Label6: TUniLabel
            Left = 297
            Top = 66
            Width = 50
            Height = 13
            Hint = ''
            Caption = 'Last Name'
            TabOrder = 18
          end
          object Label7: TUniLabel
            Left = 32
            Top = 99
            Width = 48
            Height = 13
            Hint = ''
            Caption = 'Address 1'
            TabOrder = 19
          end
          object Label8: TUniLabel
            Left = 32
            Top = 140
            Width = 48
            Height = 13
            Hint = ''
            Caption = 'Address 2'
            TabOrder = 20
          end
          object Label9: TUniLabel
            Left = 297
            Top = 101
            Width = 19
            Height = 13
            Hint = ''
            Caption = 'City'
            TabOrder = 21
          end
          object Label10: TUniLabel
            Left = 352
            Top = 140
            Width = 57
            Height = 13
            Hint = ''
            Caption = 'Postal Code'
            TabOrder = 22
          end
          object Label11: TUniLabel
            Left = 297
            Top = 140
            Width = 41
            Height = 13
            Hint = ''
            Caption = 'Province'
            TabOrder = 23
          end
          object Label12: TUniLabel
            Left = 297
            Top = 176
            Width = 39
            Height = 13
            Hint = ''
            Caption = 'Country'
            TabOrder = 24
          end
          object DBSIN: TUniDBEdit
            Left = 297
            Top = 30
            Width = 121
            Height = 21
            Hint = ''
            DataField = 'SSNMBR'
            DataSource = SrcDtl
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object edEmplProv: TUniDBComboBox
            Left = 32
            Top = 30
            Width = 121
            Hint = ''
            DataField = 'PROV_CODE'
            DataSource = SrcDtl
            Items.Strings = (
              'AK'
              'AL'
              'AR'
              'AZ'
              'CA'
              'CO'
              'CT'
              'DC'
              'DE'
              'FL'
              'GA'
              'HA'
              'IA'
              'ID'
              'IL'
              'IN'
              'KS'
              'KY'
              'LA'
              'MA'
              'MD'
              'MI'
              'MN'
              'MO'
              'MS'
              'MT'
              'NC'
              'ND'
              'NE'
              'NH'
              'NJ'
              'NM'
              'NV'
              'NY'
              'OH'
              'OK'
              'OR'
              'PA'
              'RI'
              'SC'
              'SD'
              'TN'
              'TX'
              'UT'
              'VA'
              'VT'
              'WA'
              'WI'
              'WV'
              'WY'
              'AB'
              'BC'
              'MB'
              'NB'
              'NL'
              'NS'
              'NT'
              'NU'
              'ON'
              'PE'
              'QC'
              'SK'
              'YT'
              'US'
              'ZZ')
            ParentFont = False
            Font.Color = clBlack
            TabOrder = 0
          end
          object DBEmplCode: TUniDBEdit
            Left = 184
            Top = 34
            Width = 93
            Height = 21
            Hint = ''
            DataField = 'EMPL_CODE'
            DataSource = SrcDtl
            TabOrder = 1
          end
          object DBFirst: TUniDBEdit
            Left = 32
            Top = 79
            Width = 121
            Height = 21
            Hint = ''
            DataField = 'FIRST_NAME'
            DataSource = SrcDtl
            TabOrder = 3
          end
          object DBMiddle: TUniDBEdit
            Left = 184
            Top = 79
            Width = 93
            Height = 21
            Hint = ''
            DataField = 'MIDDLE_NAME'
            DataSource = SrcDtl
            TabOrder = 4
          end
          object DBLast: TUniDBEdit
            Left = 297
            Top = 79
            Width = 119
            Height = 21
            Hint = ''
            DataField = 'LAST_NAME'
            DataSource = SrcDtl
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
          end
          object DBAddr1: TUniDBEdit
            Left = 32
            Top = 113
            Width = 245
            Height = 21
            Hint = ''
            DataField = 'ADDR1'
            DataSource = SrcDtl
            TabOrder = 6
          end
          object DBAddr2: TUniDBEdit
            Left = 32
            Top = 154
            Width = 245
            Height = 21
            Hint = ''
            DataField = 'ADDR2'
            DataSource = SrcDtl
            TabOrder = 7
          end
          object DBCity: TUniDBEdit
            Left = 297
            Top = 115
            Width = 121
            Height = 21
            Hint = ''
            DataField = 'CITY'
            DataSource = SrcDtl
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 8
          end
          object DBPostalCode: TUniDBEdit
            Left = 355
            Top = 154
            Width = 61
            Height = 21
            Hint = ''
            DataField = 'POSTAL_CODE'
            DataSource = SrcDtl
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 10
          end
          object DBCountry: TUniDBEdit
            Left = 297
            Top = 191
            Width = 120
            Height = 21
            Hint = ''
            DataField = 'COUNTRY'
            DataSource = SrcDtl
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 11
          end
          object DBProv: TUniDBComboBox
            Left = 297
            Top = 153
            Width = 47
            Hint = ''
            DataField = 'PROV'
            DataSource = SrcDtl
            Items.Strings = (
              'AK'
              'AL'
              'AR'
              'AZ'
              'CA'
              'CO'
              'CT'
              'DC'
              'DE'
              'FL'
              'GA'
              'HA'
              'IA'
              'ID'
              'IL'
              'IN'
              'KS'
              'KY'
              'LA'
              'MA'
              'MD'
              'MI'
              'MN'
              'MO'
              'MS'
              'MT'
              'NC'
              'ND'
              'NE'
              'NH'
              'NJ'
              'NM'
              'NV'
              'NY'
              'OH'
              'OK'
              'OR'
              'PA'
              'RI'
              'SC'
              'SD'
              'TN'
              'TX'
              'UT'
              'VA'
              'VT'
              'WA'
              'WI'
              'WV'
              'WY'
              'AB'
              'BC'
              'MB'
              'NB'
              'NL'
              'NS'
              'NT'
              'NU'
              'ON'
              'PE'
              'QC'
              'SK'
              'YT'
              'US'
              'ZZ')
            ParentFont = False
            Font.Color = clBlack
            TabOrder = 9
          end
        end
        object Panel7: TUniPanel
          Left = 1
          Top = 223
          Width = 423
          Height = 269
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object Panel8: TUniPanel
            Left = 1
            Top = 1
            Width = 421
            Height = 27
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Alignment = taLeftJustify
            Caption = '  Other Information'
          end
          object GridCodes: TIQUniGridControl
            Left = 1
            Top = 27
            Width = 421
            Height = 242
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 204
            IQComponents.Grid.Height = 156
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = SrcCodes
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
            IQComponents.Navigator.DataSource = SrcCodes
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 204
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 156
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = SrcCodes
            Columns = <
              item
                FieldName = 'CODE'
                Title.Caption = 'Box'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'AMOUNT'
                Title.Caption = 'Amount'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end>
            Marker = 0
          end
        end
      end
    end
  end
  object PnlHdr: TUniPanel
    Left = 0
    Top = 0
    Width = 1009
    Height = 148
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Left = 1
      Top = 1
      Width = 1007
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object SBSearch: TUniSpeedButton
        Left = 2
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Search year... '
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
        OnClick = SBSearchClick
      end
    end
    object GridHdr: TIQUniGridControl
      Left = 1
      Top = 27
      Width = 1007
      Height = 121
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 790
      IQComponents.Grid.Height = 35
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcHeader
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
      IQComponents.Navigator.DataSource = SrcHeader
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 790
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 35
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcHeader
      Columns = <
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PR_YEAR_STRING'
          Title.Caption = 'Year'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PR_ACCOUNT_NO'
          Title.Caption = 'Payroll Account #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NAME'
          Title.Caption = 'Company Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PHONE'
          Title.Caption = 'Phone#'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PHONE_EXT'
          Title.Caption = 'Phone Ext.'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'AREA_CODE'
          Title.Caption = 'Area Code'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'POSTAL_CODE'
          Title.Caption = 'Postal Code'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PROVINCE_CODE'
          Title.Caption = 'Province Code'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COUNTRY'
          Title.Caption = 'Country'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ADDR1'
          Title.Caption = 'Address1'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ADDR2'
          Title.Caption = 'Address2'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CITY'
          Title.Caption = 'City'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CONTACT_NAME'
          Title.Caption = 'Contact'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REPORT_TYPE'
          Title.Caption = 'Report Type'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ACCESS_CODE'
          Title.Caption = 'Access Code'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TRANSMITTER_NO'
          Title.Caption = 'Transmission number'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FILE_NO'
          Title.Caption = 'File number'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NEQ'
          Title.Caption = 'Quebec enterprise number'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BEGIN_SEQUENCE_NO'
          Title.Caption = 'Beginning Sequence'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PACKAGE_TYPE_CODE'
          Title.Caption = 'Package Type'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 288
    Top = 1
    object File1: TUniMenuItem
      Caption = '&File'
      object Recalculate1: TUniMenuItem
        Caption = '&Recalculate Employee'
        OnClick = Recalculate1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object CreateOutputXMLFile1: TUniMenuItem
        Caption = 'Create Output XML File'
        OnClick = CreateOutputXMLFile1Click
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
      object PrintSetUp1: TUniMenuItem
        Caption = '&Print &Setup'
        OnClick = PrintSetUp1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object SrcHeader: TDataSource
    DataSet = tblHeader
    Left = 136
    Top = 40
  end
  object tblHeader: TFDTable
    AfterInsert = tblHeaderAfterInsert
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'PRRL_HEADER'
    TableName = 'PRRL_HEADER'
    Left = 152
    Top = 40
    object tblHeaderDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Size = 50
    end
    object tblHeaderPR_YEAR_STRING: TStringField
      DisplayLabel = 'Year'
      DisplayWidth = 4
      FieldName = 'PR_YEAR_STRING'
      Size = 4
    end
    object tblHeaderPR_ACCOUNT_NO: TStringField
      DisplayLabel = 'Payroll Account #'
      DisplayWidth = 15
      FieldName = 'PR_ACCOUNT_NO'
      Size = 15
    end
    object tblHeaderNAME: TStringField
      DisplayLabel = 'Company Name'
      DisplayWidth = 30
      FieldName = 'NAME'
      Size = 30
    end
    object tblHeaderPHONE: TStringField
      DisplayLabel = 'Phone#'
      DisplayWidth = 30
      FieldName = 'PHONE'
      Size = 30
    end
    object tblHeaderPHONE_EXT: TStringField
      DisplayLabel = 'Phone Ext.'
      DisplayWidth = 10
      FieldName = 'PHONE_EXT'
      Size = 10
    end
    object tblHeaderAREA_CODE: TStringField
      DisplayLabel = 'Area Code'
      DisplayWidth = 3
      FieldName = 'AREA_CODE'
      Size = 3
    end
    object tblHeaderPOSTAL_CODE: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 10
      FieldName = 'POSTAL_CODE'
      Size = 10
    end
    object tblHeaderPROVINCE_CODE: TStringField
      DisplayLabel = 'Province Code'
      DisplayWidth = 2
      FieldName = 'PROVINCE_CODE'
      Size = 2
    end
    object tblHeaderCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 3
      FieldName = 'COUNTRY'
      Size = 3
    end
    object tblHeaderADDR1: TStringField
      DisplayLabel = 'Address1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Size = 60
    end
    object tblHeaderADDR2: TStringField
      DisplayLabel = 'Address2'
      DisplayWidth = 20
      FieldName = 'ADDR2'
      Size = 60
    end
    object tblHeaderCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 30
      FieldName = 'CITY'
      Size = 30
    end
    object tblHeaderCONTACT_NAME: TStringField
      DisplayLabel = 'Contact'
      DisplayWidth = 22
      FieldName = 'CONTACT_NAME'
      Size = 22
    end
    object tblHeaderREPORT_TYPE: TStringField
      DisplayLabel = 'Report Type'
      DisplayWidth = 1
      FieldName = 'REPORT_TYPE'
      Size = 1
    end
    object tblHeaderACCESS_CODE: TStringField
      DisplayLabel = 'Access Code'
      DisplayWidth = 20
      FieldName = 'ACCESS_CODE'
      Size = 50
    end
    object tblHeaderTRANSMITTER_NO: TStringField
      DisplayLabel = 'Transmission number'
      DisplayWidth = 15
      FieldName = 'TRANSMITTER_NO'
      Size = 15
    end
    object tblHeaderFILE_NO: TStringField
      DisplayLabel = 'File number'
      DisplayWidth = 15
      FieldName = 'FILE_NO'
      Size = 15
    end
    object tblHeaderNEQ: TStringField
      DisplayLabel = 'Quebec enterprise number'
      DisplayWidth = 15
      FieldName = 'NEQ'
      Size = 15
    end
    object tblHeaderBEGIN_SEQUENCE_NO: TStringField
      DisplayLabel = 'Beginning Sequence'
      DisplayWidth = 9
      FieldName = 'BEGIN_SEQUENCE_NO'
      Size = 9
    end
    object tblHeaderPACKAGE_TYPE_CODE: TStringField
      DisplayLabel = 'Package Type'
      DisplayWidth = 2
      FieldName = 'PACKAGE_TYPE_CODE'
      Size = 2
    end
    object tblHeaderEIN_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EIN_ID'
      Visible = False
      Size = 0
    end
    object tblHeaderPR_YEAR: TDateTimeField
      DisplayWidth = 18
      FieldName = 'PR_YEAR'
      Visible = False
    end
    object tblHeaderID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object tblHeaderPRT4_HEADER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PRT4_HEADER_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcDtl: TDataSource
    DataSet = TblDtl
    Left = 136
    Top = 80
  end
  object TblDtl: TFDTable
    AfterInsert = TblDtlAfterInsert
    IndexFieldNames = 'PRRL_HEADER_ID'
    MasterSource = SrcHeader
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'PRRL_DETAIL'
    TableName = 'PRRL_DETAIL'
    Left = 152
    Top = 80
    object TblDtlID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object TblDtlPR_EMP_ID: TBCDField
      FieldName = 'PR_EMP_ID'
      Size = 0
    end
    object TblDtlSSNMBR: TStringField
      FieldName = 'SSNMBR'
      EditMask = '999-999-999;0;'
      Size = 11
    end
    object TblDtlFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Size = 30
    end
    object TblDtlMIDDLE_NAME: TStringField
      FieldName = 'MIDDLE_NAME'
      Size = 30
    end
    object TblDtlLAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Size = 30
    end
    object TblDtlADDR1: TStringField
      FieldName = 'ADDR1'
      Size = 60
    end
    object TblDtlADDR2: TStringField
      FieldName = 'ADDR2'
      Size = 60
    end
    object TblDtlCITY: TStringField
      FieldName = 'CITY'
      Size = 30
    end
    object TblDtlPROV: TStringField
      FieldName = 'PROV'
    end
    object TblDtlPOSTAL_CODE: TStringField
      FieldName = 'POSTAL_CODE'
      Size = 10
    end
    object TblDtlPROV_CODE: TStringField
      FieldName = 'PROV_CODE'
      Size = 2
    end
    object TblDtlEXEMPT_CPP_QPP: TStringField
      FieldName = 'EXEMPT_CPP_QPP'
      Size = 1
    end
    object TblDtlEXEMPT_EI: TStringField
      FieldName = 'EXEMPT_EI'
      Size = 1
    end
    object TblDtlEMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 2
    end
    object TblDtlGROSS_PAY: TBCDField
      FieldName = 'GROSS_PAY'
      currency = True
      Size = 2
    end
    object TblDtlTOTALFED: TBCDField
      FieldName = 'TOTALFED'
      currency = True
      Size = 2
    end
    object TblDtlCPP_WITHHELD: TBCDField
      FieldName = 'CPP_WITHHELD'
      currency = True
      Size = 2
    end
    object TblDtlQPP_WITHHELD: TBCDField
      FieldName = 'QPP_WITHHELD'
      currency = True
      Size = 2
    end
    object TblDtlEI_WITHHELD: TBCDField
      FieldName = 'EI_WITHHELD'
      currency = True
      Size = 2
    end
    object TblDtlEI_GROSSTOTAX: TBCDField
      FieldName = 'EI_GROSSTOTAX'
      currency = True
      Size = 2
    end
    object TblDtlRPP_WITHHELD: TBCDField
      FieldName = 'RPP_WITHHELD'
      currency = True
      Size = 2
    end
    object TblDtlCPP_QPP_EARNINGS: TBCDField
      FieldName = 'CPP_QPP_EARNINGS'
      currency = True
      Size = 2
    end
    object TblDtlUNION_DUES: TBCDField
      FieldName = 'UNION_DUES'
      currency = True
      Size = 2
    end
    object TblDtlCHARITABLE: TBCDField
      FieldName = 'CHARITABLE'
      currency = True
      Size = 2
    end
    object TblDtlRPP_DPSP_NO: TStringField
      FieldName = 'RPP_DPSP_NO'
      Size = 25
    end
    object TblDtlPENSION_ADJ: TBCDField
      FieldName = 'PENSION_ADJ'
      currency = True
      Size = 2
    end
    object TblDtlPPIP_WITHHELD: TBCDField
      FieldName = 'PPIP_WITHHELD'
      currency = True
      Size = 2
    end
    object TblDtlPPIP_GROSSTOTAX: TBCDField
      FieldName = 'PPIP_GROSSTOTAX'
      currency = True
      Size = 2
    end
    object TblDtlCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 30
    end
    object TblDtlPRRL_HEADER_ID: TBCDField
      FieldName = 'PRRL_HEADER_ID'
      Size = 0
    end
    object TblDtlPRT4_DETAIL_ID: TBCDField
      FieldName = 'PRT4_DETAIL_ID'
      Size = 0
    end
    object TblDtlSUBMISSION_CODE: TStringField
      FieldName = 'SUBMISSION_CODE'
      Size = 1
    end
    object TblDtlSEQUENCE_NO: TStringField
      FieldName = 'SEQUENCE_NO'
      Size = 9
    end
    object TblDtlORG_RL_SLIP_NO: TStringField
      FieldName = 'ORG_RL_SLIP_NO'
      Size = 9
    end
    object TblDtlORG_RL_SLIP_ID: TBCDField
      FieldName = 'ORG_RL_SLIP_ID'
      Size = 0
    end
    object TblDtlEXEMPT_QPIP: TStringField
      FieldName = 'EXEMPT_QPIP'
      Size = 1
    end
    object TblDtlTOTALPRO: TBCDField
      FieldName = 'TOTALPRO'
      Size = 2
    end
    object TblDtlHEALTH_SERVICES: TBCDField
      FieldName = 'HEALTH_SERVICES'
      Size = 2
    end
    object TblDtlREMOTE_AREA: TBCDField
      FieldName = 'REMOTE_AREA'
      Size = 2
    end
    object TblDtlOTHER_BENEFITS: TBCDField
      FieldName = 'OTHER_BENEFITS'
      Size = 2
    end
    object TblDtlCOMMISSIONS: TBCDField
      FieldName = 'COMMISSIONS'
      Size = 2
    end
    object TblDtlARINVOICE_COMM_ID: TBCDField
      FieldName = 'ARINVOICE_COMM_ID'
      Size = 2
    end
    object TblDtlOTHER_INCOME: TBCDField
      FieldName = 'OTHER_INCOME'
      Size = 2
    end
    object TblDtlMULTI_EMPLOYER: TBCDField
      FieldName = 'MULTI_EMPLOYER'
      Size = 2
    end
    object TblDtlDEFERRED_WAGES: TBCDField
      FieldName = 'DEFERRED_WAGES'
      Size = 2
    end
    object TblDtlINDIAN_RESERVE: TBCDField
      FieldName = 'INDIAN_RESERVE'
      Size = 2
    end
    object TblDtlTIPS: TBCDField
      FieldName = 'TIPS'
      Size = 2
    end
    object TblDtlALLOCATED_TIPS: TBCDField
      FieldName = 'ALLOCATED_TIPS'
      Size = 2
    end
    object TblDtlPHASED_RETIRE: TBCDField
      FieldName = 'PHASED_RETIRE'
      Size = 2
    end
    object TblDtlMEALS_LODGING: TBCDField
      FieldName = 'MEALS_LODGING'
      Size = 2
    end
    object TblDtlMOTOR_VEHICLE: TBCDField
      FieldName = 'MOTOR_VEHICLE'
      Size = 2
    end
    object TblDtlCODE_O: TStringField
      FieldName = 'CODE_O'
      Size = 50
    end
    object TblDtlQPIP_WITHHELD: TBCDField
      FieldName = 'QPIP_WITHHELD'
      Size = 2
    end
    object TblDtlQPIP_GROSSTOTAX: TBCDField
      FieldName = 'QPIP_GROSSTOTAX'
      Size = 2
    end
  end
  object PKYearEin: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select distinct v.this_year as this_year,'
      '       To_char(v.this_year, '#39'YYYY'#39') as year,'
      '       e.id as ein_id,'
      '       e.descrip as fed_tax_id'
      '  from v_emp_distinct_emp_year v,'
      '       ein e'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 320
    Top = 56
    object StringField1: TStringField
      DisplayLabel = 'Year'
      DisplayWidth = 30
      FieldName = 'YEAR'
      Size = 4
    end
    object PKYearEinFED_TAX_ID: TStringField
      DisplayLabel = 'Fed Tax ID'
      FieldName = 'FED_TAX_ID'
      Size = 15
    end
    object PKYearEinEIN_ID: TBCDField
      FieldName = 'EIN_ID'
      Visible = False
      Size = 0
    end
  end
  object PKYear: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select distinct this_year as this_year,'
      '       To_char(this_year, '#39'YYYY'#39') as year'
      '  from v_emp_distinct_emp_year')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 320
    Top = 96
    object PKYearYEAR: TStringField
      DisplayLabel = 'Year'
      FieldName = 'YEAR'
      Size = 4
    end
  end
  object wwTblCodes: TFDTable
    BeforeInsert = wwTblCodesBeforeEdit
    BeforeEdit = wwTblCodesBeforeEdit
    BeforePost = wwTblCodesBeforePost
    IndexFieldNames = 'PRRL_DETAIL_ID'
    MasterSource = SrcDtl
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'PRRL_CODES'
    TableName = 'PRRL_CODES'
    Left = 152
    Top = 112
    object wwTblCodesCODE: TStringField
      DisplayLabel = 'Box'
      DisplayWidth = 20
      FieldName = 'CODE'
      Size = 100
    end
    object wwTblCodesAMOUNT: TBCDField
      DisplayLabel = 'Amount'
      DisplayWidth = 10
      FieldName = 'AMOUNT'
      Size = 2
    end
    object wwTblCodesID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object wwTblCodesPRRL_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PRRL_DETAIL_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcCodes: TDataSource
    DataSet = wwTblCodes
    Left = 136
    Top = 112
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 224
    Top = 40
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'RL Statement of Remuneration Paid'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192085 $'
    BuildVersion = '176554'
    Left = 192
    Top = 40
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmPrRl'
    WebUse = False
    TouchScreen = False
    Left = 264
    Top = 40
  end
  object PKRL: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '          TO_Char(pr_year, '#39'YYYY'#39') as year,'
      '          NVL(descrip, '#39' '#39') as descrip'
      '  from prrl_header')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 352
    Top = 40
    object PKRLID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PKRLYEAR: TStringField
      DisplayLabel = 'Year'
      FieldName = 'YEAR'
      Size = 4
    end
    object PKRLDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
  end
  object PkEmp: TIQWebHpick
    BeforeOpen = PkEmpBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as id,'
      '       NVL(ssnmbr, '#39' '#39') as ssnmbr,'
      '       NVL(first_name, '#39' '#39') as first_name,'
      '       NVL(middle_name, '#39' '#39') as middle_init,'
      '       NVL(last_name, '#39' '#39') as last_name,'
      '       NVL(addr1, '#39' '#39') as emp_addr1,'
      '       NVL(addr2, '#39' '#39') as emp_addr2,'
      '       NVL(city, '#39' '#39') as emp_city,'
      '       NVL(prov, '#39' '#39') as emp_state,'
      '       NVL(postal_code, '#39' '#39') as emp_zip'
      '  from prrl_detail'
      ' where prrl_header_id = :nId'
      ''
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 384
    Top = 40
    ParamData = <
      item
        Name = 'nId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkEmpID: TBCDField
      FieldName = 'ID'
      Origin = 'PRW2_DETAIL.ID'
      Visible = False
      Size = 0
    end
    object PkEmpSSNMBR: TStringField
      DisplayLabel = 'SIN'
      FieldName = 'SSNMBR'
      Origin = 'PRW2_DETAIL.SSNMBR'
      Size = 11
    end
    object PkEmpFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      FieldName = 'FIRST_NAME'
      Origin = 'PRW2_DETAIL.FIRST_NAME'
      Size = 30
    end
    object PkEmpMIDDLE_INIT: TStringField
      DisplayLabel = 'Middle Name'
      FieldName = 'MIDDLE_INIT'
      Origin = 'PRW2_DETAIL.MIDDLE_INIT'
      Size = 30
    end
    object PkEmpLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      FieldName = 'LAST_NAME'
      Origin = 'PRW2_DETAIL.LAST_NAME'
      Size = 30
    end
    object PkEmpEMP_ADDR1: TStringField
      DisplayLabel = 'Address1'
      FieldName = 'EMP_ADDR1'
      Origin = 'PRW2_DETAIL.EMP_ADDR1'
      Size = 60
    end
    object PkEmpEMP_ADDR2: TStringField
      DisplayLabel = 'Address2'
      FieldName = 'EMP_ADDR2'
      Origin = 'PRW2_DETAIL.EMP_ADDR2'
      Size = 60
    end
    object PkEmpEMP_CITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'EMP_CITY'
      Origin = 'PRW2_DETAIL.EMP_CITY'
      Size = 30
    end
    object PkEmpEMP_STATE: TStringField
      DisplayLabel = 'Prov.'
      FieldName = 'EMP_STATE'
      Origin = 'PRW2_DETAIL.EMP_STATE'
    end
    object PkEmpEMP_ZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'EMP_ZIP'
      Origin = 'PRW2_DETAIL.EMP_ZIP'
      Size = 10
    end
  end
  object PKT4: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '          TO_Char(pr_year, '#39'YYYY'#39') as year,'
      '          NVL(descrip, '#39' '#39') as descrip,'
      '          ein_id,'
      '          pr_year'
      '  from prT4_header')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 440
    Top = 40
    object PKT4ID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PKT4YEAR: TStringField
      DisplayLabel = 'Year'
      FieldName = 'YEAR'
      Size = 4
    end
    object PKT4DESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PKT4EIN_ID: TBCDField
      FieldName = 'EIN_ID'
      Visible = False
      Size = 0
    end
    object PKT4PR_YEAR: TDateTimeField
      FieldName = 'PR_YEAR'
      Visible = False
    end
  end
  object PkEmpT4: TIQWebHpick
    BeforeOpen = PkEmpT4BeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as id,'
      '       NVL(ssnmbr, '#39' '#39') as ssnmbr,'
      '       NVL(first_name, '#39' '#39') as first_name,'
      '       NVL(middle_name, '#39' '#39') as middle_init,'
      '       NVL(last_name, '#39' '#39') as last_name,'
      '       NVL(addr1, '#39' '#39') as emp_addr1,'
      '       NVL(addr2, '#39' '#39') as emp_addr2,'
      '       NVL(city, '#39' '#39') as emp_city,'
      '       NVL(prov, '#39' '#39') as emp_state,'
      '       NVL(postal_code, '#39' '#39') as emp_zip'
      '  from prt4_detail'
      ' where prt4_header_id = :nId'
      ''
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 480
    Top = 40
    ParamData = <
      item
        Name = 'nId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkEmpT4ID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkEmpT4SSNMBR: TStringField
      DisplayLabel = 'SIN'
      FieldName = 'SSNMBR'
      Size = 11
    end
    object PkEmpT4FIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      FieldName = 'FIRST_NAME'
      Size = 30
    end
    object PkEmpT4MIDDLE_INIT: TStringField
      DisplayLabel = 'Middle Name'
      FieldName = 'MIDDLE_INIT'
      Size = 30
    end
    object PkEmpT4LAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      FieldName = 'LAST_NAME'
      Size = 30
    end
    object PkEmpT4EMP_ADDR1: TStringField
      DisplayLabel = 'Address1'
      FieldName = 'EMP_ADDR1'
      Size = 60
    end
    object PkEmpT4EMP_ADDR2: TStringField
      DisplayLabel = 'Address2'
      FieldName = 'EMP_ADDR2'
      Size = 60
    end
    object PkEmpT4EMP_CITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'EMP_CITY'
      Size = 30
    end
    object PkEmpT4EMP_STATE: TStringField
      DisplayLabel = 'Prov.'
      FieldName = 'EMP_STATE'
    end
    object PkEmpT4EMP_ZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'EMP_ZIP'
      Size = 10
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'XML files (*.xml)|*.XML|Text filex (*.txt)|*.TXT'
    Left = 552
    Top = 104
  end
  object wwMemoDialog1: TwwMemoDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    MemoAttributes = [mSizeable, mViewOnly]
    DlgLeft = 0
    DlgTop = 0
    DlgWidth = 561
    DlgHeight = 396
    UserButton1Caption = 'Save To File'
    Left = 600
    Top = 103
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMPRRL')
    SecurityCode = 'FRMPRRL'
    Left = 392
    Top = 112
  end
end
