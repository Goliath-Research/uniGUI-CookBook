inherited FrmFinancialReport: TFrmFinancialReport
  Left = 215
  Top = 150
  HelpContext = 1113106
  ClientHeight = 444
  ClientWidth = 618
  Caption = 'Financial Report Setup'
  OnActivate = FormActivate
  Menu = MainMenu1
  ExplicitWidth = 634
  ExplicitHeight = 503
  PixelsPerInch = 96
  TextHeight = 17
  object Splitter1: TUniSplitter [0]
    Left = 0
    Top = 139
    Width = 618
    Height = 4
    Cursor = crVSplit
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  inherited Bevel1: TUniPanel
    Width = 618
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    TabOrder = 5
    ExplicitWidth = 618
  end
  inherited Panel1: TUniPanel
    Top = 383
    Width = 618
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ExplicitTop = 383
    ExplicitWidth = 618
    inherited Panel2: TUniPanel
      Left = 363
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ExplicitLeft = 363
      inherited btnOK: TUniButton
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Enabled = False
        Caption = 'Apply'
      end
      inherited btnCancel: TUniButton
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Enabled = False
        Caption = 'Revert'
      end
    end
  end
  inherited TreeView1: TUniTreeView
    Top = 176
    Width = 618
    Height = 115
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Items.FontData = {0100000000}
    OnChange = TreeView1Change
    OnMouseDown = TreeView1MouseDown
    ExplicitTop = 176
    ExplicitWidth = 618
    ExplicitHeight = 115
  end
  inherited PnlToolbarMain: TUniPanel
    Top = 143
    Width = 618
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ExplicitTop = 143
    ExplicitWidth = 618
    inherited sbtnExpand: TUniSpeedButton
      Left = 39
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ExplicitLeft = 39
    end
    inherited sbtnCollapse: TUniSpeedButton
      Left = 70
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ExplicitLeft = 70
    end
    object sbtnPkAcct: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 31
      Height = 31
      Hint = 'Search and Add'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
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
      OnClick = sbtnPkAcctClick
    end
    object sbtnAssignDef: TUniSpeedButton
      Left = 108
      Top = 1
      Width = 31
      Height = 31
      Hint = 'Assign default header and footer'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        B0A0906048306048306048306048306048306048306048306048306048306048
        30604830FF00FFFF00FFFF00FFFF00FF9E9E9E46464646464646464646464646
        4646464646464646464646464646464646464646FF00FFFF00FFFF00FFFF00FF
        B0A09040B8F040B8F040B0F040B0F040A8F040A8F040A0F04098F04098F04090
        F0604830FF00FFFF00FFFF00FFFF00FF9E9E9EC1C1C1C1C1C1BCBCBCBCBCBCB7
        B7B7B7B7B7B1B1B1ADADADADADADA8A8A8464646FF00FFFF00FFFF00FFFF00FF
        B0A09040B8F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4090
        F0604830FF00FFFF00FFFF00FFFF00FF9E9E9EC1C1C1FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8464646FF00FFFF00FFFF00FFFF00FF
        B0A09040B8F040B8F040B0F040B0F040A8F040A8F040A0F04098F04090F04090
        F0604830FF00FFFF00FFFF00FFFF00FF9E9E9EC1C1C1C1C1C1BCBCBCBCBCBCB7
        B7B7B7B7B7B1B1B1ADADADA8A8A8A8A8A8464646FF00FFFF00FFFF00FFFF00FF
        B0A090FFFFFFFFFFFFFFF8F0FFF8F0FFF0E0FFE8E0FFE8E0FFE8E0FFE8E0D0A8
        90604830FF00FFFF00FFFF00FFFF00FF9E9E9EFFFFFFFFFFFFF7F7F7F7F7F7EE
        EEEEE9E9E9E9E9E9E9E9E9E9E9E9A7A7A7464646FF00FFFF00FFFF00FFFF00FF
        C0A890FFFFFFFFFFFFE0D0D0E0D0C0E0C8C0E0C0C0D0B8B0D0B8A0F0D8D0D0A8
        90604830FF00FFFF00FFFF00FFFF00FFA5A5A5FFFFFFFFFFFFD2D2D2CECECEC9
        C9C9C3C3C3B8B8B8B5B5B5D9D9D9A7A7A7464646FF00FFFF00FFFF00FFFF00FF
        C0A8A0FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0FFF8F0FFF0E0FFE8E0FFE8E0D0A8
        90604830FF00FFFF00FFFF00FFFF00FFA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFF7
        F7F7F7F7F7EEEEEEE9E9E9E9E9E9A7A7A7464646FF00FFFF00FFFF00FFFF00FF
        C0B0A0FFFFFFFFFFFFE0D8D0E0D0D0E0D0C0E0C8C0E0C0B0D0C0B0F0E8E0D0A8
        90604830FF00FFFF00FFFF00FFFF00FFAEAEAEFFFFFFFFFFFFD7D7D7D2D2D2CE
        CECEC9C9C9C0C0C0BEBEBEE7E7E7A7A7A7464646FF00FFFF00FFFF00FFFF00FF
        D0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0FFF0F0FFF0E0D0A8
        90604830FF00FFFF00FFFF00FFFF00FFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF7F7F7F2F2F2EEEEEEA7A7A7464646FF00FFFF00FFFF00FFFF00FF
        D0B0A0FFFFFFFFFFFFE0D8D0E0D8D0E0D0D0E0D0C0E0C8C0E0C8C0FFF8F0C0B0
        A0604830FF00FFFF00FFFF00FFFF00FFAFAFAFFFFFFFFFFFFFD7D7D7D7D7D7D2
        D2D2CECECEC9C9C9C9C9C9F7F7F7AEAEAE464646FF00FFFF00FFFF00FFFF00FF
        D0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0C0B0
        A0604830FF00FFFF00FFFF00FFFF00FFB5B5B5FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF7F7F7AEAEAE464646FF00FFFF00FFFF00FFFF00FF
        D0B8B040B8F040B8F040B0F040B0F040A8F040A8F040A0F04098F04098F04090
        F0604830FF00FFFF00FFFF00FFFF00FFB8B8B8C1C1C1C1C1C1BCBCBCBCBCBCB7
        B7B7B7B7B7B1B1B1ADADADADADADA8A8A8464646FF00FFFF00FFFF00FFFF00FF
        D0C0B040B8F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4090
        F0604830FF00FFFF00FFFF00FFFF00FFBEBEBEC1C1C1FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8464646FF00FFFF00FFFF00FFFF00FF
        E0C0B040B8F040B8F040B0F040B0F040A8F040A8F040A0F04098F04090F04090
        F0604830FF00FFFF00FFFF00FFFF00FFC0C0C0C1C1C1C1C1C1BCBCBCBCBCBCB7
        B7B7B7B7B7B1B1B1ADADADA8A8A8A8A8A8464646FF00FFFF00FFFF00FFFF00FF
        E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B8B0D0B8B0D0B8
        B0BEA590FF00FFFF00FFFF00FFFF00FFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0BEBEBEB8B8B8B8B8B8B8B8B8B8B8B8A3A3A3FF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnAssignDefClick
    end
    object Bevel2: TUniPanel
      Left = 34
      Top = 4
      Width = 3
      Height = 26
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      TabOrder = 5
      Caption = ''
    end
    object Bevel3: TUniPanel
      Left = 103
      Top = 4
      Width = 3
      Height = 26
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      TabOrder = 6
      Caption = ''
    end
  end
  object PnlToolbarRpt: TUniPanel [5]
    Left = 0
    Top = 0
    Width = 618
    Height = 33
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ShowHint = True
    ParentShowHint = False
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
    object sbtnSearch: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 31
      Height = 31
      Hint = 'Search'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
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
    object NavMain: TUniDBNavigator
      Left = 341
      Top = 1
      Width = 277
      Height = 31
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      DataSource = SrcFinancial_Rpt
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object DBGrid1: TUniDBGrid [6]
    Left = 0
    Top = 37
    Width = 618
    Height = 102
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TitleFont.Height = -14
    DataSource = SrcFinancial_Rpt
    LoadMask.Message = 'Loading data...'
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    Columns = <
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Report Description'
        Width = 64
        Font.Height = -14
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REPORT_NAME'
        Title.Caption = 'Report File Name'
        Width = 120
        Font.Height = -14
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  inherited StatusBar1: TUniStatusBar
    Top = 425
    Width = 618
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ExplicitTop = 425
    ExplicitWidth = 618
  end
  object PnlHeaderFooter: TUniPanel [8]
    Tag = 1999
    Left = 0
    Top = 291
    Width = 618
    Height = 92
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 6
    Caption = ''
    object pcHeaderFooter: TUniPageControl
      Left = 1
      Top = 1
      Width = 616
      Height = 90
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ActivePage = sheetAccountType
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object sheetAccountType: TUniTabSheet
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabVisible = False
        Caption = 'sheetAccountType'
        object PnlClient01: TUniPanel
          Tag = 1999
          Left = 0
          Top = 0
          Width = 608
          Height = 58
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter2: TUniSplitter
            Left = 91
            Top = 0
            Width = 4
            Height = 58
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlLeft01: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 91
            Height = 56
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label1: TUniLabel
              Left = 10
              Top = 15
              Width = 43
              Height = 17
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Header'
              TabOrder = 1
            end
            object Label3: TUniLabel
              Left = 10
              Top = 44
              Width = 40
              Height = 17
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Footer'
              TabOrder = 2
            end
          end
          object PnlClient02: TUniPanel
            Tag = 1999
            Left = 95
            Top = 1
            Width = 513
            Height = 56
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object edHeader: TUniEdit
              Left = 1
              Top = 10
              Width = 326
              Height = 24
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Text = ''
              TabOrder = 0
              OnChange = edHeaderChange
            end
            object edFooter: TUniEdit
              Left = 1
              Top = 39
              Width = 326
              Height = 24
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Text = ''
              TabOrder = 1
              OnChange = edHeaderChange
            end
          end
        end
      end
    end
  end
  inherited QryAcct: TFDQuery
    SQL.Strings = (
      'select x.financial_rpt_id,'
      '       x.seq,'
      '       x.heading,'
      '       x.footer,'
      '       x.id, '
      '       x.parent_id,'
      '       x.v_level,'
      '       x.descrip,'
      '       x.glacct_id,'
      '       x.sort_id,'
      '       g.acct,'
      '       g.descrip as acct_descrip'
      '  from glacct g,'
      '       (select financial_rpt_id,'
      '               seq,'
      '               heading,'
      '               footer,'
      '               id, '
      '               sort_id,'
      '               parent_id,'
      '               level as v_level,'
      '               acct_type as descrip,'
      '               glacct_id'
      '          from financial_rpt_detail'
      '        where financial_rpt_id = :nID'
      '         start with parent_id is NULL'
      '        connect by parent_id = prior id ) x'
      ' where x.glacct_id = g.id(+) '
      '   and NVL(x.parent_id, 0) = :AParentId'
      ' order by x.sort_ID'
      ' ')
    Left = 101
    Top = 127
    ParamData = <
      item
        Name = 'nID'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'AParentId'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object SrcFinancial_Rpt: TDataSource [10]
    DataSet = TblFinancial_Rpt
    OnDataChange = SrcFinancial_RptDataChange
    Left = 218
    Top = 42
  end
  object TblFinancial_Rpt: TFDTable [11]
    BeforePost = AssignIDBeforePost
    AfterScroll = TblFinancial_RptAfterScroll
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'FINANCIAL_RPT'
    TableName = 'FINANCIAL_RPT'
    Left = 246
    Top = 42
    object TblFinancial_RptID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object TblFinancial_RptDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Required = True
      Size = 250
    end
    object TblFinancial_RptREPORT_NAME: TStringField
      DisplayLabel = 'Report File Name'
      FieldName = 'REPORT_NAME'
      Required = True
      Size = 30
    end
    object TblFinancial_RptUSERID: TStringField
      FieldName = 'USERID'
      Size = 35
    end
  end
  object PopupMenu1: TUniPopupMenu [12]
    Left = 72
    Top = 128
    object Insert1: TUniMenuItem
      Caption = '&Insert'
      OnClick = sbtnPkAcctClick
    end
    object Delete1: TUniMenuItem
      Caption = '&Delete'
      OnClick = Delete1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object Duplicate1: TUniMenuItem
      Caption = 'Replicate Branch'
      OnClick = Duplicate1Click
    end
  end
  object OpenDialog1: TOpenDialog [13]
    DefaultExt = 'rpt'
    Filter = '*.rpt|*.rpt|*.*|*.*'
    Title = 'Financial Report Fiel Name'
    Left = 274
    Top = 42
  end
  object PkFinancialRep: TIQWebHpick [14]
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id, descrip, report_name'
      'from financial_rpt'
      'order by descrip')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 304
    Top = 43
    object PkFinancialRepID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkFinancialRepDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 250
    end
    object PkFinancialRepREPORT_NAME: TStringField
      DisplayLabel = 'Report File Name'
      FieldName = 'REPORT_NAME'
      Size = 30
    end
  end
  object MainMenu1: TUniMainMenu [15]
    Left = 227
    Top = 128
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Close'
        OnClick = Exit1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = '&Options'
      object InitializeEnterpriseIQSpreadsheetServer1: TUniMenuItem
        Caption = '&Initialize EnterpriseIQ Spreadsheet Server'
        OnClick = InitializeEnterpriseIQSpreadsheetServer1Click
      end
    end
    object Report1: TUniMenuItem
      Caption = '&Report'
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
  object IQAbout1: TIQWebAbout [16]
    ModuleName = 'Financial Reports'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 193290 $'
    BuildVersion = '176554'
    Left = 143
    Top = 128
  end
  object PrinterSetupDialog1: TPrinterSetupDialog [17]
    Left = 171
    Top = 128
  end
  object SR: TIQWebSecurityRegister [18]
    SecurityItems.Strings = (
      'NavMain'
      'Print1'
      'PrintSetup1'
      'Insert1'
      'Delete1'
      'TblFinancial_Rpt'
      'btnOK'
      'TreeView1'
      'sbtnPkAcct'
      'sbtnAssignDef'
      'InitializeEnterpriseIQSpreadsheetServer1')
    SecurityCode = 'FRMFINANCIALREPORT'
    Left = 104
  end
  object IQRepDef1: TIQWebRepDef [19]
    App_ID = 'FrmFinancialReport'
    WebUse = False
    TouchScreen = False
    Left = 256
    Top = 128
  end
  object TimerUp: TUniTimer [20]
    Interval = 300
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = ScrollUp
    Left = 296
    Top = 128
  end
  object TimerDown: TUniTimer [21]
    Interval = 300
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = ScrollDown
    Left = 296
    Top = 168
  end
end
