object FrmInjStats: TFrmInjStats
  Left = 290
  Top = 173
  HelpContext = 1011175
  ClientHeight = 355
  ClientWidth = 411
  Caption = 'Injury Statistics'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 411
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Nav: TUniDBNavigator
      Left = 186
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcStat
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 27
    Width = 411
    Height = 95
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 1
      Width = 409
      Height = 93
      Hint = ''
      Caption = 'Calculation Parameters '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      DesignSize = (
        409
        93)
      object Label1: TUniLabel
        Left = 216
        Top = 21
        Width = 17
        Height = 13
        Hint = ''
        Caption = 'EIN'
        TabOrder = 6
      end
      object Label2: TUniLabel
        Left = 216
        Top = 44
        Width = 30
        Height = 13
        Hint = ''
        Caption = 'EPlant'
        TabOrder = 7
      end
      object Label3: TUniLabel
        Left = 216
        Top = 67
        Width = 36
        Height = 13
        Hint = ''
        Caption = 'Division'
        TabOrder = 8
      end
      object Label4: TUniLabel
        Left = 8
        Top = 21
        Width = 52
        Height = 13
        Hint = ''
        Caption = 'Begin Date'
        TabOrder = 9
      end
      object Label5: TUniLabel
        Left = 8
        Top = 44
        Width = 44
        Height = 13
        Hint = ''
        Caption = 'End Date'
        TabOrder = 10
      end
      object sbEINSearch: TUniSpeedButton
        Left = 385
        Top = 16
        Width = 25
        Height = 22
        Hint = 'Search EIN...'
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
        OnClick = sbEINSearchClick
      end
      object SbEplantSearch: TUniSpeedButton
        Left = 385
        Top = 39
        Width = 25
        Height = 22
        Hint = 'Search EPlant...'
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
        OnClick = SbEplantSearchClick
      end
      object SbDivisionSearch: TUniSpeedButton
        Left = 385
        Top = 62
        Width = 25
        Height = 22
        Hint = 'Search Division...'
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
        OnClick = SbDivisionSearchClick
      end
      object DBEIN: TUniDBEdit
        Left = 261
        Top = 18
        Width = 120
        Height = 19
        Cursor = crArrow
        Hint = ''
        DataField = 'EIN'
        DataSource = SrcStat
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Color = clBtnFace
        ReadOnly = True
      end
      object DBEPlant: TUniDBEdit
        Left = 261
        Top = 41
        Width = 120
        Height = 19
        Cursor = crArrow
        Hint = ''
        DataField = 'EPLANT_ID'
        DataSource = SrcStat
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Color = clBtnFace
        ReadOnly = True
      end
      object DBDivision: TUniDBEdit
        Left = 261
        Top = 64
        Width = 120
        Height = 19
        Cursor = crArrow
        Hint = ''
        DataField = 'DIVISION'
        DataSource = SrcStat
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clBtnFace
        ReadOnly = True
      end
      object DbBegDate: TUniDBDateTimePicker
        Left = 67
        Top = 17
        Width = 130
        Height = 21
        Hint = ''
        DataField = 'BEGIN_DATE'
        DataSource = SrcStat
        DateTime = 42663.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 3
      end
      object DBEndDate: TUniDBDateTimePicker
        Left = 67
        Top = 40
        Width = 130
        Height = 21
        Hint = ''
        DataField = 'END_DATE'
        DataSource = SrcStat
        DateTime = 42663.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 4
      end
      object BtnCalc: TUniButton
        Left = 3
        Top = 67
        Width = 188
        Height = 25
        Hint = ''
        Caption = 'Calculate/Recalculate'
        TabOrder = 14
        OnClick = BtnCalcClick
      end
    end
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 122
    Width = 411
    Height = 233
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 194
    IQComponents.Grid.Height = 147
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcStat
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
    IQComponents.Navigator.DataSource = SrcStat
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 194
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 147
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitLeft = 0
    IQComponents.FormTab.ExplicitTop = 0
    IQComponents.FormTab.ExplicitWidth = 256
    IQComponents.FormTab.ExplicitHeight = 128
    DataSource = SrcStat
    Columns = <
      item
        FieldName = 'AVG_NUM_EMPLOYEES'
        Title.Caption = 'Avg. # of Employees'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TOTAL_HRS_WORKED'
        Title.Caption = 'Tot.Hrs.Worked'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'INCIDENT_RATE_TOTAL'
        Title.Caption = 'Incident Rate Total'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'INCIDENT_RATE_DART'
        Title.Caption = 'Incident Rate DART'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FINALIZED'
        Title.Caption = 'Finalized'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BEGIN_DATE'
        Title.Caption = 'Begin Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EIN'
        Title.Caption = 'EIN'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'END_DATE'
        Title.Caption = 'End Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DIVISION'
        Title.Caption = 'Division'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPLANT_ID'
        Title.Caption = 'Eplant ID'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object MainMenu1: TUniMainMenu
    Left = 144
    object File1: TUniMenuItem
      Caption = '&File'
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
        Caption = '&Print Setup'
        OnClick = PrintSetup1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Injury Statistics'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192935 $'
    BuildVersion = '176554'
    Left = 176
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmInjStats'
    WebUse = False
    TouchScreen = False
    Left = 208
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'BtnCalc'
      'FinalizeCalculations1'
      'CalcAvgofemployees1'
      'CalcTotalHrsWorked1'
      'CalcIncidentRateTotal1'
      'CalcIncidentRateDART1'
      'CalcAll1 ')
    SecurityCode = 'FRMINJSTATS'
    Left = 240
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 272
  end
  object SrcStat: TDataSource
    DataSet = QryStat
    Left = 88
    Top = 197
  end
  object QryStat: TFDQuery
    BeforePost = QryStatBeforePost
    AfterPost = QryStatAfterPost
    AfterDelete = QryStatAfterPost
    AfterScroll = QryStatAfterScroll
    OnNewRecord = QryStatNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'HR_INJURY_STATS'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select h.id,'
      '       h.eplant_id,'
      '       h.division_id,'
      '       h.ein_id,'
      '       h.begin_date,'
      '       h.end_date,'
      '       h.avg_num_employees,'
      '       h.total_hrs_worked,'
      '       h.incident_rate_total,'
      '       h.incident_rate_dart,'
      '       e.descrip as ein,'
      '       d.name as division,'
      '       h.finalized,'
      '       e.descrip as ein'
      '  from HR_INJURY_STATS h,'
      '       ein e,'
      '       division d'
      ' where h.ein_id = e.id(+)'
      '   and h.division_id = d.id(+)'
      '')
    Left = 96
    Top = 200
    object QryStatAVG_NUM_EMPLOYEES: TBCDField
      DisplayLabel = 'Avg. # of Employees'
      DisplayWidth = 10
      FieldName = 'AVG_NUM_EMPLOYEES'
      Origin = 'h.AVG_NUM_EMPLOYEES'
      Size = 0
    end
    object QryStatTOTAL_HRS_WORKED: TBCDField
      DisplayLabel = 'Tot.Hrs.Worked'
      DisplayWidth = 10
      FieldName = 'TOTAL_HRS_WORKED'
      Origin = 'h.TOTAL_HRS_WORKED'
      Size = 3
    end
    object QryStatINCIDENT_RATE_TOTAL: TBCDField
      DisplayLabel = 'Incident Rate Total'
      DisplayWidth = 10
      FieldName = 'INCIDENT_RATE_TOTAL'
      Origin = 'h.INCIDENT_RATE_TOTAL'
      Size = 3
    end
    object QryStatINCIDENT_RATE_DART: TBCDField
      DisplayLabel = 'Incident Rate DART'
      DisplayWidth = 10
      FieldName = 'INCIDENT_RATE_DART'
      Origin = 'h.INCIDENT_RATE_DART'
      Size = 3
    end
    object QryStatFINALIZED: TStringField
      DisplayLabel = 'Finalized'
      DisplayWidth = 1
      FieldName = 'FINALIZED'
      Origin = 'h.FINALIZED'
      Size = 1
    end
    object QryStatBEGIN_DATE: TDateTimeField
      DisplayLabel = 'Begin Date'
      DisplayWidth = 18
      FieldName = 'BEGIN_DATE'
      Origin = 'h.BEGIN_DATE'
    end
    object QryStatEIN: TStringField
      DisplayWidth = 10
      FieldName = 'EIN'
      Origin = 'e.descrip'
      Size = 15
    end
    object QryStatEND_DATE: TDateTimeField
      DisplayLabel = 'End Date'
      DisplayWidth = 18
      FieldName = 'END_DATE'
      Origin = 'h.END_DATE'
    end
    object QryStatDIVISION: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 50
      FieldName = 'DIVISION'
      Origin = 'd.name'
      Size = 25
    end
    object QryStatEPLANT_ID: TBCDField
      DisplayLabel = 'Eplant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'h.EPLANT_ID'
      Size = 0
    end
    object QryStatID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'h.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryStatDIVISION_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'DIVISION_ID'
      Origin = 'h.DIVISION_ID'
      Visible = False
      Size = 0
    end
    object QryStatEIN_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EIN_ID'
      Origin = 'h.EIN_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into HR_INJURY_STATS'
      '  (ID, EPLANT_ID, DIVISION_ID, EIN_ID, BEGIN_DATE, END_DATE, '
      'AVG_NUM_EMPLOYEES, '
      
        '   TOTAL_HRS_WORKED, INCIDENT_RATE_TOTAL, INCIDENT_RATE_DART, FI' +
        'NALIZED)'
      'values'
      
        '  (:ID, :EPLANT_ID, :DIVISION_ID, :EIN_ID, :BEGIN_DATE, :END_DAT' +
        'E, '
      ':AVG_NUM_EMPLOYEES, '
      
        '   :TOTAL_HRS_WORKED, :INCIDENT_RATE_TOTAL, :INCIDENT_RATE_DART,' +
        ' :FINALIZED)')
    ModifySQL.Strings = (
      'update HR_INJURY_STATS'
      'set'
      '  ID = :ID,'
      '  EPLANT_ID = :EPLANT_ID,'
      '  DIVISION_ID = :DIVISION_ID,'
      '  EIN_ID = :EIN_ID,'
      '  BEGIN_DATE = :BEGIN_DATE,'
      '  END_DATE = :END_DATE,'
      '  AVG_NUM_EMPLOYEES = :AVG_NUM_EMPLOYEES,'
      '  TOTAL_HRS_WORKED = :TOTAL_HRS_WORKED,'
      '  INCIDENT_RATE_TOTAL = :INCIDENT_RATE_TOTAL,'
      '  INCIDENT_RATE_DART = :INCIDENT_RATE_DART,'
      '  FINALIZED = :FINALIZED'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from HR_INJURY_STATS'
      'where'
      '  ID = :OLD_ID')
    Left = 112
    Top = 216
  end
  object PkEin: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       descrip'
      '  from ein'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 136
    Top = 162
    object PkEinID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.EIN.ID'
      Visible = False
      Size = 0
    end
    object PkEinDESCRIP: TStringField
      DisplayLabel = 'EIN'
      FieldName = 'DESCRIP'
      Origin = 'IQ.EIN.DESCRIP'
      Size = 15
    end
  end
  object PkEplant: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       name'
      ' from eplant')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 168
    Top = 162
    object PkEplantID: TBCDField
      DisplayLabel = 'EPlant'
      FieldName = 'ID'
      Origin = 'IQ.EPLANT.ID'
      Size = 0
    end
    object PkEplantNAME: TStringField
      DisplayLabel = 'EPlant Name'
      FieldName = 'NAME'
      Origin = 'IQ.EPLANT.NAME'
      Size = 30
    end
  end
  object PkDivision: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       descrip,'
      '       name'
      ' from division')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 200
    Top = 162
    object PkDivisionID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.DIVISION.ID'
      Visible = False
      Size = 0
    end
    object PkDivisionDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.DIVISION.DESCRIP'
      Size = 50
    end
    object PkDivisionNAME: TStringField
      DisplayLabel = 'Division'
      FieldName = 'NAME'
      Origin = 'IQ.DIVISION.NAME'
      Size = 25
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 232
    Top = 162
    object Clear1: TUniMenuItem
      Caption = 'Clear'
      OnClick = Clear1Click
    end
  end
  object PopupMenu2: TUniPopupMenu
    Left = 264
    Top = 162
    object Clear2: TUniMenuItem
      Caption = 'Clear'
      OnClick = Clear2Click
    end
  end
  object PopupMenu3: TUniPopupMenu
    Left = 304
    Top = 162
    object Clear3: TUniMenuItem
      Caption = 'Clear'
      OnClick = Clear3Click
    end
  end
  object PopupMenu4: TUniPopupMenu
    OnPopup = PopupMenu4Popup
    Left = 344
    Top = 162
    object CalcAll1: TUniMenuItem
      Caption = 'Calc. All'
      OnClick = BtnCalcClick
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object CalcAvgofemployees1: TUniMenuItem
      Caption = 'Calc. Avg. # of employees '
      OnClick = CalcAvgofemployees1Click
    end
    object CalcTotalHrsWorked1: TUniMenuItem
      Caption = 'Calc. Total Hrs. Worked'
      OnClick = CalcTotalHrsWorked1Click
    end
    object CalcIncidentRateTotal1: TUniMenuItem
      Caption = 'Calc. Incident Rate Total'
      OnClick = CalcIncidentRateTotal1Click
    end
    object CalcIncidentRateDART1: TUniMenuItem
      Caption = 'Calc. Incident Rate DART'
      OnClick = CalcIncidentRateDART1Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object FinalizeCalculations1: TUniMenuItem
      Caption = 'Finalize Calculations'
      OnClick = FinalizeCalculations1Click
    end
  end
end
