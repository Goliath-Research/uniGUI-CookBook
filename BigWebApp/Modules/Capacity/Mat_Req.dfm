object FrmMatReq: TFrmMatReq
  Left = 198
  Top = 147
  HelpContext = 1051907
  ClientHeight = 326
  ClientWidth = 655
  Caption = ''
  OldCreateOrder = True
  ShowHint = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter4: TUniSplitter
    Left = 226
    Top = 27
    Width = 6
    Height = 299
    Hint = ''
    ShowHint = True
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 655
    Height = 27
    Hint = ''
    ShowHint = True
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      655
      27)
    object shapePurple: TShape
      Left = 542
      Top = 9
      Width = 10
      Height = 11
      Hint = 'Numeric Oversize Exception'
      Anchors = [akTop, akRight]
      Brush.Color = clPurple
      ParentShowHint = False
      Pen.Color = clWhite
      Shape = stSquare
      ShowHint = True
      ExplicitLeft = 554
    end
    object Shape6: TShape
      Left = 528
      Top = 9
      Width = 10
      Height = 11
      Hint = 'Contains Forecast Data'
      Anchors = [akTop, akRight]
      ParentShowHint = False
      Pen.Color = clBlue
      Shape = stSquare
      ShowHint = True
      ExplicitLeft = 540
    end
    object sbtnSearch: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Search Inventory Item'
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
      TabOrder = 2
      OnClick = sbtnSearchClick
    end
    object sbFilter2: TUniSpeedButton
      Left = 26
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Filter...'
      ShowHint = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF5A5857404040202820000800FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF58585840
        4040252525050505FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF606060706870404040000800FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6060606A
        6A6A404040050505FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF605860909090606060302830FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5B5B5B90
        90906060602A2A2AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF505850B0A8B0808080404840FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF555555AB
        ABAB808080464646FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFE0C9B9605850C0C0C0A0A0A0404040CEB3A0FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC8C8C8575757C0
        C0C0A0A0A0404040B2B2B2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFE0CABA505850A0A0A0D0D0D0B0B0B0707070201820CCAE9BFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC9C9C9555555A0A0A0D0
        D0D0B0B0B07070701A1A1AADADADFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFE1CCBC706870C0B8C0E0E8E0E0E0E0C0C0C0909890605860201820CBAB
        96FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCBCBCB6A6A6ABBBBBBE6E6E6E0
        E0E0C0C0C09696965B5B5B1A1A1AA9A9A9FF00FFFF00FFFF00FFFF00FFFF00FF
        E1CDBE707070C0C0C0F0E8F0FFF8FFF0F0F0D0D8D0C0C0C0A098A06058601018
        10C9A791FF00FFFF00FFFF00FFFF00FFCCCCCC707070C0C0C0EBEBEBFAFAFAF0
        F0F0D6D6D6C0C0C09B9B9B5B5B5B161616A5A5A5FF00FFFF00FFFF00FFE1CDC0
        808080D0D0D0F0F0F0FFFFFFFFFFFFFFF8FFE0E8E0D0D8D0C0B8C09090905050
        50201820C8A38CFF00FFFF00FFCCCCCC808080D0D0D0F0F0F0FFFFFFFFFFFFFA
        FAFAE6E6E6D6D6D6BBBBBB9090905050501A1A1AA2A2A2FF00FFFF00FF808080
        D0D0D0F0F0F0FFF8FFFFF8FFF0F8F0F0F0F0E0E8E0D0D0D0C0C0C0A098A06068
        60505850101810FF00FFFF00FF808080D0D0D0F0F0F0FAFAFAFAFAFAF6F6F6F0
        F0F0E6E6E6D0D0D0C0C0C09B9B9B656565555555161616FF00FFFF00FFB0B8B0
        C0C8C0D0D0D0D0D0D0C0C0C0C0B8C0B0B0B0A0A8A0A0A0A0A098A09090907078
        70606060504850FF00FFFF00FFB6B6B6C6C6C6D0D0D0D0D0D0C0C0C0BBBBBBB0
        B0B0A6A6A6A0A0A09B9B9B9090907575756060604A4A4AFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      TabOrder = 3
      OnClick = sbFilter2Click
    end
    object sbtnEplantView: TUniSpeedButton
      Left = 51
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Set EPlant View'
      ShowHint = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFB0A0906048306048306048306048306048306048306048
        30604830604830604830FF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E46464646
        4646464646464646464646464646464646464646464646464646FF00FFFF00FF
        FF00FFFF00FFFF00FFB0A090E0E8E0D0D8D0D0D0D0C0C0C0C0B8C0B0B0B0B0A8
        A0A0A0A0A098A0604830FF00FFFF00FFFF00FFFF00FFFF00FF9E9E9EE6E6E6D6
        D6D6D0D0D0C0C0C0BBBBBBB0B0B0A7A7A7A0A0A09B9B9B464646FF00FFFF00FF
        FF00FFFF00FFFF00FFB0A090F0F0F0F0E8F0E0E0E0E0D8D0D0D0D06060508078
        70A0A0A0A0A0A0604830FF00FFFF00FFFF00FFFF00FFFF00FF9E9E9EF0F0F0EB
        EBEBE0E0E0D7D7D7D0D0D05C5C5C777777A0A0A0A0A0A0464646FF00FFFF00FF
        FF00FFFF00FFFF00FFB0A090FFF8FFF0F8F0F0F0F0E0E8E0E0D8E0303030FFFF
        FF909090B0A8A0604830FF00FFFF00FFFF00FFFF00FFFF00FF9E9E9EFAFAFAF6
        F6F6F0F0F0E6E6E6DBDBDB303030FFFFFF909090A7A7A7464646FF00FFFF00FF
        FF00FFFF00FFFF00FFB0A090FFFFFFB0B0B0808880A0A0A0D0D0D02018103028
        20706050B0B0B0604830FF00FFFF00FFFF00FFFF00FFFF00FF9E9E9EFFFFFFB0
        B0B0868686A0A0A0D0D0D01717172727275E5E5EB0B0B0464646FF00FFFF00FF
        FF00FFFF00FFFF00FFB0A090FFFFFFFFFFFFFFFFFFFFF8FFF0F0F0E0E8E0E0D8
        E0D0D0D0B0B8B0604830FF00FFFF00FFFF00FFFF00FFFF00FF9E9E9EFFFFFFFF
        FFFFFFFFFFFAFAFAF0F0F0E6E6E6DBDBDBD0D0D0B6B6B6464646FF00FFFF00FF
        FF00FFFF00FF707070404040000800FFFFFFFFFFFFFFFFFFFFF8FF6060508078
        70A0A0A0C0C0C0604830FF00FFFF00FFFF00FFFF00FF707070404040050505FF
        FFFFFFFFFFFFFFFFFAFAFA5C5C5C777777A0A0A0C0C0C0464646FF00FFFF00FF
        FF00FFFF00FF707070505050100810FFFFFFFFFFFFFFFFFFFFFFFF303030FFFF
        FF909090D0C8D0604830FF00FFFF00FFFF00FFFF00FF7070705050500B0B0BFF
        FFFFFFFFFFFFFFFFFFFFFF303030FFFFFF909090CBCBCB464646FF00FFFF00FF
        FF00FFFF00FF707070707070404040B0B8B0909090A098A0E0E0E01018103028
        20706050D0D8D0604830FF00FFFF00FFFF00FFFF00FF707070707070404040B6
        B6B69090909B9B9BE0E0E01616162727275E5E5ED6D6D6464646FF00FFFF00FF
        FF00FFFF00FF707070909890504850F0E8F0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF8FFE0E0E0604830FF00FFFF00FFFF00FFFF00FF7070709696964A4A4AEB
        EBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAE0E0E0464646FF00FFFF00FF
        FF00FFD3C8B9909090D0C8C0505850B08070E09870E09070E09060E08060D080
        50D07840D07040D06830FF00FFFF00FFFF00FFC6C6C6909090C7C7C755555581
        81819898989292929090908585858080807979797373736C6C6CFF00FFFF00FF
        DACBBF808880F0F0F0E0D8D0909890404840D0A080FFB090FFA880F0A070F098
        70F09860F09860D06830FF00FFFF00FFCACACA868686F0F0F0D7D7D796969646
        46469E9E9EB1B1B1A9A9A9A0A0A09A9A9A9898989898986C6C6CFF00FFE5D3C9
        707070F0E8F0FFF8FFF0E8E0D0D0D0707070404840C08860E09060E08860D080
        50D07840D07040D06830FF00FFD3D3D3707070EBEBEBFAFAFAE7E7E7D0D0D070
        70704646468686869090908A8A8A8080807979797373736C6C6CDFCFC7707070
        C0C8C0FFFFFFF0F8F0F0F0F0D0D8D0B0A8B0606060404840CDB5A2FF00FFFF00
        FFFF00FFFF00FFFF00FFCFCFCF707070C6C6C6FFFFFFF6F6F6F0F0F0D6D6D6AB
        ABAB606060464646B4B4B4FF00FFFF00FFFF00FFFF00FFFF00FFC0B8C0C0C0C0
        D0C8D0C0C0C0B0B8B0B0B0B0B0B0B0A0A0A0808080606060404840FF00FFFF00
        FFFF00FFFF00FFFF00FFBBBBBBC0C0C0CBCBCBC0C0C0B6B6B6B0B0B0B0B0B0A0
        A0A0808080606060464646FF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      TabOrder = 4
      OnClick = sbtnEplantViewClick
    end
    object sbtnRecalc: TUniSpeedButton
      Tag = 1
      Left = 76
      Top = 1
      Width = 25
      Height = 25
      Hint = 
        'Recalculate Material Exceptions, Ideal vs Existing and Daily Mat' +
        'erial Requirements'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        CDB6A88068608060507058407058407050407050406050406050306050307050
        40B89A83FF00FFFF00FFFF00FFFF00FFB5B5B568686860606056565656565650
        50505050504E4E4E4C4C4C4C4C4C505050989898FF00FFFF00FFFF00FFFF00FF
        877766D0C0B0D0B8B0D0B0A0C0B0A0C0A8A0C0A8A0C0A090C0A090B0A090B098
        90775E46FF00FFFF00FFFF00FFFF00FF757575BEBEBEB8B8B8AFAFAFAEAEAEA8
        A8A8A8A8A8A0A0A0A0A0A09E9E9E9999995C5C5CFF00FFFF00FFFF00FFFF00FF
        967E66F0E0D0D0C0B0D0B8B0D0B0B0C0B0A0C0A8A0C0A8A0C0A090C0A090B0A0
        90775E46FF00FFFF00FFFF00FFFF00FF7B7B7BDEDEDEBEBEBEB8B8B8B3B3B3AE
        AEAEA8A8A8A8A8A8A0A0A0A0A0A09E9E9E5C5C5CFF00FFFF00FFFF00FFFF00FF
        967E75F0E0D0C08870B07050D0B8B0C08870B07050C0B0A0C08870B07050C0A0
        90775E46FF00FFFF00FFFF00FFFF00FF7E7E7EDEDEDE898989717171B8B8B889
        8989717171AEAEAE898989717171A0A0A05C5C5CFF00FFFF00FFFF00FFFF00FF
        968675F0E0E0FFC8B0C08870D0C0B0F0C8B0C08870C0B0A0F0C8B0C08070C0A8
        90775E46FF00FFFF00FFFF00FFFF00FF848484E2E2E2C8C8C8898989BEBEBEC7
        C7C7898989AEAEAEC7C7C7838383A5A5A55C5C5CFF00FFFF00FFFF00FFFF00FF
        968D85F0E8E0E0D0C0D0C8C0D0C0C0D0C0B0D0B8B0D0B8B0C0B0A0C0B0A0C0A8
        A0776655FF00FFFF00FFFF00FFFF00FF8C8C8CE7E7E7CECECEC7C7C7C2C2C2BE
        BEBEB8B8B8B8B8B8AEAEAEAEAEAEA8A8A8646464FF00FFFF00FFFF00FFFF00FF
        A58D85FFE8E0C09070B07050E0C8C0C09080B07050D0B8B0C09070B07050C0B0
        A0866655FF00FFFF00FFFF00FFFF00FF8D8D8DE9E9E98E8E8E717171C9C9C991
        9191717171B8B8B88E8E8E717171AEAEAE666666FF00FFFF00FFFF00FFFF00FF
        A59585FFF0F0FFC8B0C08870E0D0C0F0C8B0C08870D0C0B0F0C8B0C08870D0B0
        A0866D55FF00FFFF00FFFF00FFFF00FF939393F2F2F2C8C8C8898989CECECEC7
        C7C7898989BEBEBEC7C7C7898989AFAFAF6B6B6BFF00FFFF00FFFF00FFFF00FF
        A59C94FFF0F0E0E0E0E0D8D0E0D0D0E0D0D0E0C8C0D0C8C0D0C0B0D0C0B0D0B8
        B0866D55FF00FFFF00FFFF00FFFF00FF9B9B9BF2F2F2E0E0E0D7D7D7D2D2D2D2
        D2D2C9C9C9C7C7C7BEBEBEBEBEBEB8B8B86B6B6BFF00FFFF00FFFF00FFFF00FF
        B4A494FFF8F09080D04030A0E0D8D09080D04030A0E0C8C09080D04030A0D0C0
        B0867564FF00FFFF00FFFF00FFFF00FFA2A2A2F7F7F7979797595959D7D7D797
        9797595959C9C9C9979797595959BEBEBE737373FF00FFFF00FFFF00FFFF00FF
        B4A4A3FFF8F0C0C0E09080D0E0E0E0C0C0E09080D0E0D0D0C0C0E09080D0D0C0
        C0957564FF00FFFF00FFFF00FFFF00FFA6A6A6F7F7F7C8C8C8979797E0E0E0C8
        C8C8979797D2D2D2C8C8C8979797C2C2C2757575FF00FFFF00FFFF00FFFF00FF
        B4ABA3FFF8FFFFE0D0FFD0B0FFD0B0FFC090F0B890D0A080D0A080D0B0A0D0C8
        C0957C73FF00FFFF00FFFF00FFFF00FFAAAAAAFAFAFAE0E0E0CECECECECECEBD
        BDBDB6B6B69E9E9E9E9E9EAFAFAFC7C7C77C7C7CFF00FFFF00FFFF00FFFF00FF
        B4ABA3FFFFFFFF9860FFA060FFA060FFA060FFA060FFA060FFA060B06850C0A8
        90958473FF00FFFF00FFFF00FFFF00FFAAAAAAFFFFFF9A9A9A9F9F9F9F9F9F9F
        9F9F9F9F9F9F9F9F9F9F9F6B6B6BA5A5A5828282FF00FFFF00FFFF00FFFF00FF
        B4B3A3FFFFFFE07840F0D8D0F0D8D0F0C8B0E0B0A0E0A080E08050A05830D0A0
        90958473FF00FFFF00FFFF00FFFF00FFB0B0B0FFFFFF7B7B7BD9D9D9D9D9D9C7
        C7C7B1B1B1A0A0A08282825A5A5AA1A1A1828282FF00FFFF00FFFF00FFFF00FF
        DAC7C0BEB3A9F0B8A0D09070D08860D08050D07040D06830C06030D08060A088
        80C6A891FF00FFFF00FFFF00FFFF00FFC7C7C7B2B2B2B8B8B890909088888880
        80807373736C6C6C646464838383888888A6A6A6FF00FFFF00FFFF00FFFF00FF
        FF00FFCCC4B3B0A8A0B0A8A0B0A090B09890B09890A09890A09080A08880C9AE
        98FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1C1C1A7A7A7A7A7A79E9E9E99
        99999999999797978E8E8E888888ACACACFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      TabOrder = 5
      OnClick = Recalculate1Click
    end
    object NavMain: TUniDBNavigator
      Left = 554
      Top = 1
      Width = 100
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcUniqueItems
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object pcDetail: TUniPageControl
    Left = 232
    Top = 27
    Width = 423
    Height = 299
    Hint = ''
    ShowHint = True
    ActivePage = shTabular
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    TabStop = False
    object shTabular: TUniTabSheet
      Hint = ''
      HelpContext = 1051907
      ShowHint = True
      Caption = 'Tabular'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object Splitter2: TUniSplitter
        Left = 217
        Top = 113
        Width = 6
        Height = 158
        Hint = ''
        ShowHint = True
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object Splitter1: TUniSplitter
        Left = 0
        Top = 110
        Width = 415
        Height = 3
        Cursor = crVSplit
        Hint = ''
        ShowHint = True
        Align = alTop
        ParentColor = False
        Color = clBtnFace
      end
      object pnlWO: TUniPanel
        Left = 0
        Top = 113
        Width = 217
        Height = 158
        Hint = ''
        ShowHint = True
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = 'pnlWO'
        object gridWO: TUniDBGrid
          Left = 1
          Top = 28
          Width = 215
          Height = 129
          Hint = ''
          ShowHint = True
          DataSource = SrcWo
          ReadOnly = True
          LoadMask.Message = 'Loading data...'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Columns = <
            item
              FieldName = 'WORKORDER_ID'
              Title.Caption = 'Work Order #'
              Width = 82
            end
            item
              FieldName = 'REQUIRED'
              Title.Caption = 'Required'
              Width = 58
            end
            item
              FieldName = 'EQNO'
              Title.Caption = 'Work Center'
              Width = 364
            end
            item
              FieldName = 'CNTR_DESC'
              Title.Caption = 'Work Center Description'
              Width = 160
            end
            item
              FieldName = 'Cntr_Seq'
              Title.Caption = 'Sequence #'
              Width = 64
            end
            item
              FieldName = 'HARD_ALLOC_QTY'
              Title.Caption = 'Hard Allocated'
              Width = 84
            end>
        end
        object Panel6: TUniPanel
          Left = 1
          Top = 1
          Width = 215
          Height = 27
          Hint = ''
          ShowHint = True
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = ''
          object DBNavigator2: TUniDBNavigator
            Left = 114
            Top = 1
            Width = 100
            Height = 25
            Hint = ''
            ShowHint = True
            DataSource = SrcWo
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
      end
      object Panel3: TUniPanel
        Left = 223
        Top = 113
        Width = 192
        Height = 158
        Hint = ''
        ShowHint = True
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = 'Panel3'
        object gridAffected: TUniDBGrid
          Left = 1
          Top = 48
          Width = 190
          Height = 109
          Hint = ''
          ShowHint = True
          DataSource = SrcOnOrd
          ReadOnly = True
          LoadMask.Message = 'Loading data...'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Columns = <
            item
              FieldName = 'ORDERNO'
              Title.Caption = 'Sales Order #'
              Width = 81
            end
            item
              FieldName = 'ID'
              Title.Caption = 'Work Order #'
              Width = 80
            end
            item
              FieldName = 'ITEMNO'
              Title.Caption = 'Item #'
              Width = 85
            end
            item
              FieldName = 'REL_DATE'
              Title.Caption = 'Delivery Date'
              Width = 112
            end
            item
              FieldName = 'REL_QUAN'
              Title.Caption = 'Delivery Quantity'
              Width = 44
            end
            item
              FieldName = 'COMPANY'
              Title.Caption = 'Customer'
              Width = 58
            end
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'Description'
              Width = 79
            end
            item
              FieldName = 'REV'
              Title.Caption = 'Rev'
              Width = 64
            end
            item
              FieldName = 'DESCRIP2'
              Title.Caption = 'Ext Description'
              Width = 214
            end>
        end
        object Panel5: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 190
          Height = 47
          Hint = ''
          ShowHint = True
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
          object Panel7: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 188
            Height = 20
            Hint = ''
            ShowHint = True
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            TabOrder = 0
            Caption = ''
            Color = clBtnShadow
            object Label2: TUniLabel
              Left = 1
              Top = 1
              Width = 71
              Height = 13
              Hint = ''
              ShowHint = True
              Caption = 'Sales Orders'
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clWhite
              Font.Style = [fsBold]
              TabOrder = 1
            end
          end
          object Panel4: TUniPanel
            Tag = 1999
            Left = 1
            Top = 21
            Width = 188
            Height = 25
            Hint = ''
            ShowHint = True
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object DBNavigator1: TUniDBNavigator
              Left = 87
              Top = 1
              Width = 100
              Height = 23
              Hint = ''
              ShowHint = True
              DataSource = SrcOnOrd
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 0
            end
          end
        end
      end
      object pnlDetails: TUniPanel
        Left = 0
        Top = 0
        Width = 415
        Height = 110
        Hint = ''
        ShowHint = True
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Caption = 'pnlDetails'
        object gridDetails: TUniDBGrid
          Left = 1
          Top = 1
          Width = 413
          Height = 108
          Hint = ''
          ShowHint = True
          DataSource = SrcV_Day_Mat_Req_Dtl
          ReadOnly = True
          LoadMask.Message = 'Loading data...'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          OnEnter = gridItemsEnter
          Columns = <
            item
              FieldName = 'PROD_DATE'
              Title.Caption = 'Production Date'
              Width = 57
            end
            item
              FieldName = 'ONHAND'
              Title.Caption = 'On Hand'
              Width = 64
            end
            item
              FieldName = 'ONORDER'
              Title.Caption = 'On Order'
              Width = 64
            end
            item
              FieldName = 'DAY_USAGE'
              Title.Caption = 'Daily Usage'
              Width = 64
            end
            item
              FieldName = 'Day_Balance'
              Title.Caption = 'Balance'
              Width = 64
            end
            item
              FieldName = 'ORIGIN'
              Title.Caption = 'Origin'
              Width = 64
            end>
        end
      end
    end
    object shGraph: TUniTabSheet
      Hint = ''
      HelpContext = 1051922
      ShowHint = True
      Caption = 'Graph'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object Panel2: TUniPanel
        Left = 0
        Top = 0
        Width = 415
        Height = 271
        Hint = ''
        HelpContext = 1051922
        ShowHint = True
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = 'Panel2'
        object DBChart1: TDBChart
          Left = 1
          Top = 1
          Width = 413
          Height = 269
          AllowPanning = pmHorizontal
          BackWall.Brush.Style = bsClear
          Gradient.Balance = 74
          Gradient.Direction = gdBottomTop
          Gradient.EndColor = 15921906
          Gradient.Visible = True
          LeftWall.Brush.Gradient.EndColor = clWhite
          LeftWall.Brush.Gradient.StartColor = clYellow
          LeftWall.Brush.Gradient.Visible = True
          MarginBottom = 1
          MarginLeft = 1
          MarginRight = 1
          Title.Text.Strings = (
            'Material Requirements for xx xxxxxxxxxxxxxxxxxxxx')
          Title.Visible = False
          Legend.Alignment = laBottom
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          TabOrder = 0
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 0
          object Series2: TLineSeries
            DataSource = QryV_Day_Mat_Req_Dtl
            SeriesColor = 4051807
            Title = 'On Hand'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            XValues.ValueSource = 'PROD_DATE'
            YValues.Name = 'Y'
            YValues.Order = loNone
            YValues.ValueSource = 'ONHAND'
          end
          object Series3: TLineSeries
            DataSource = QryV_Day_Mat_Req_Dtl
            SeriesColor = clYellow
            Title = 'Usage'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            XValues.ValueSource = 'PROD_DATE'
            YValues.Name = 'Y'
            YValues.Order = loNone
            YValues.ValueSource = 'DAY_USAGE'
          end
          object Series1: TLineSeries
            DataSource = QryV_Day_Mat_Req_Dtl
            SeriesColor = 13311
            Title = 'Balance'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            XValues.ValueSource = 'PROD_DATE'
            YValues.Name = 'Y'
            YValues.Order = loNone
            YValues.ValueSource = 'DAY_BALANCE'
          end
        end
      end
    end
  end
  object pnlItems: TUniPanel
    Left = 0
    Top = 27
    Width = 226
    Height = 299
    Hint = ''
    ShowHint = True
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 2
    Caption = ''
    object gridItems: TUniDBGrid
      Left = 1
      Top = 1
      Width = 224
      Height = 297
      Hint = ''
      ShowHint = True
      DataSource = SrcUniqueItems
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      OnEnter = gridItemsEnter
      Columns = <
        item
          FieldName = 'ITEMNO'
          Title.Caption = 'Item #'
          Width = 71
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 91
        end
        item
          FieldName = 'ProjectedOnHand'
          Title.Caption = 'Projected On Hand'
          Width = 95
        end
        item
          FieldName = 'PastDue'
          Title.Caption = 'Past-Due PO'#39's'
          Width = 72
        end
        item
          FieldName = 'OnHand'
          Title.Caption = 'Currently On Hand'
          Width = 94
        end
        item
          FieldName = 'CLASS'
          Title.Caption = 'Class'
          Width = 29
        end
        item
          FieldName = 'DIVISION_NAME'
          Title.Caption = 'Division'
          Width = 67
        end
        item
          FieldName = 'EPLANT_NAME'
          Title.Caption = 'EPlant'
          Width = 55
        end
        item
          FieldName = 'BUYER_CODE'
          Title.Caption = 'Buyer Code'
          Width = 64
        end
        item
          FieldName = 'REV'
          Title.Caption = 'Rev'
          Width = 64
        end
        item
          FieldName = 'DESCRIP2'
          Title.Caption = 'Ext Description'
          Width = 214
        end
        item
          FieldName = 'SAFETY_STOCK'
          Title.Caption = 'ReOrder Point'
          Width = 72
        end
        item
          FieldName = 'SAFETY_STOCK2'
          Title.Caption = 'Safety Stock'
          Width = 65
        end>
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 226
    Top = 2
    object File1: TUniMenuItem
      Caption = '&File'
      object Search1: TUniMenuItem
        Caption = '&Search'
        OnClick = sbtnSearchClick
      end
      object Recalculate1: TUniMenuItem
        Caption = '&Recalculate'
        Visible = False
        OnClick = Recalculate1Click
      end
      object N3: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = '&Options'
      object SelectFilter1: TUniMenuItem
        Caption = '&Filter'
        OnClick = sbFilter2Click
      end
      object SetEPlantView1: TUniMenuItem
        Caption = 'Set &EPlant View'
        OnClick = sbtnEplantViewClick
      end
    end
    object Reports1: TUniMenuItem
      Caption = '&Reports'
      object Print1: TUniMenuItem
        Caption = '&Print'
        OnClick = Print1Click
      end
      object PrinterSetup1: TUniMenuItem
        Caption = 'Printer &Setup'
        OnClick = PrinterSetup1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object N2: TUniMenuItem
        Caption = '-'
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object SrcWo: TDataSource
    DataSet = QryWo
    Left = 128
    Top = 67
  end
  object QryWo: TFDQuery
    OnCalcFields = QryWoCalcFields
    MasterSource = SrcV_Day_Mat_Req_Dtl
    MasterFields = 'DIVISION_ID;ARINVT_ID;PROD_DATE;EPLANT_ID'
    DetailFields = 'DIVISION_ID;ARINVT_ID'
    ConnectionName = 'IQFD'
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select x.arinvt_id,'
      '       sum(x.tot_mat_qty) as required,'
      '       x.workorder_id,'
      '       x.division_id,'
      '       '
      '       decode( assy1.id,'
      
        '               null, decode( w.id, NULL, '#39'(Not Sched)'#39', w.eqno )' +
        ','
      
        '               decode( assy1.work_center_id, NULL, '#39'(Not Sched)'#39 +
        ', assy1.eqno )) as eqno,'
      '       '
      
        '       decode( assy1.id, null, w.cntr_desc, assy1.cntr_desc ) as' +
        ' cntr_desc,'
      '       '
      '       workorder.origin,'
      '       sum(x.hard_alloc_qty) as hard_alloc_qty'
      '  from '
      '       (select h.workorder_id,'
      
        '               decode(params.capacity_consolidate_div_req, '#39'Y'#39', ' +
        '-1, h.division_id) as division_id,'
      '               u.arinvt_id,'
      
        '               decode( u.qty_covered_by_day_use_id, null, u.tot_' +
        'mat_qty, 0) as tot_mat_qty,'
      '               u.hard_alloc_qty,'
      '               h.sndop_id'
      '          from day_hrs h,'
      '               day_pts t,'
      '               day_use u,'
      '               params'
      '         where h.id = t.day_hrs_id'
      '           and t.id = u.day_pts_id'
      '           and (:division_id = -1'
      '                or'
      
        '                NVL(NVL(u.ict_division_id_source, h.division_id)' +
        ',0) = NVL(:division_id,0))'
      '           and u.arinvt_id = :ARINVT_ID'
      '           and u.prod_date = :PROD_DATE) x,'
      '       '
      '       cntr_sched c,'
      '       work_center w,'
      '       arinvt a,'
      '       workorder,'
      '       params,'
      '       v_scheduled_workorders_assy1 assy1'
      ' where '
      '       x.workorder_id = c.workorder_id(+)'
      '   and c.work_center_id = w.id(+)'
      '   and a.id = x.arinvt_id'
      '   and NVL(a.eplant_id,0) = NVL(:eplant_id,0)'
      '   and x.workorder_id = workorder.id(+)'
      '   and w.parent_id is null'
      '   and ( NVL(params.fr_hide, '#39'N'#39') = '#39'N'#39
      '         or'
      
        '         NVL(params.fr_hide, '#39'N'#39') = '#39'Y'#39' and NVL(workorder.origin' +
        ', '#39'*'#39') <> '#39'FORECAST'#39')'
      ''
      '   and  x.workorder_id = assy1.workorder_id(+)'
      '   and  x.sndop_id = assy1.sndop_id(+)'
      'group by x.arinvt_id,'
      '         x.workorder_id,'
      '         x.division_id,'
      '         decode( assy1.id,'
      
        '                 null, decode( w.id, NULL, '#39'(Not Sched)'#39', w.eqno' +
        ' ),'
      
        '                 decode( assy1.work_center_id, NULL, '#39'(Not Sched' +
        ')'#39', assy1.eqno )),'
      '         decode( assy1.id, null, w.cntr_desc, assy1.cntr_desc ),'
      '         workorder.origin'
      '')
    Left = 128
    Top = 84
    ParamData = <
      item
        Name = 'division_id'
        DataType = ftFMTBcd
        NumericScale = 38
        ParamType = ptInput
        Size = 34
        Value = Null
      end
      item
        Name = 'ARINVT_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end
      item
        Name = 'PROD_DATE'
        DataType = ftDateTime
        ParamType = ptInput
        Size = 8
        Value = Null
      end
      item
        Name = 'EPLANT_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryWoARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Size = 0
    end
    object QryWoREQUIRED: TFMTBCDField
      FieldName = 'REQUIRED'
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryWoWORKORDER_ID: TBCDField
      FieldName = 'WORKORDER_ID'
      Size = 0
    end
    object QryWoEQNO: TStringField
      FieldName = 'EQNO'
      Size = 60
    end
    object QryWoDIVISION_ID: TFMTBCDField
      FieldName = 'DIVISION_ID'
      Size = 38
    end
    object QryWoORIGIN: TStringField
      FieldName = 'ORIGIN'
      Size = 10
    end
    object QryWoCNTR_DESC: TStringField
      DisplayLabel = 'Work Center Description'
      DisplayWidth = 25
      FieldName = 'CNTR_DESC'
      FixedChar = True
      Size = 250
    end
    object QryWoHARD_ALLOC_QTY: TFMTBCDField
      FieldName = 'HARD_ALLOC_QTY'
      Size = 38
    end
    object QryWoCntr_Seq: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Cntr_Seq'
      Calculated = True
    end
  end
  object SrcOnOrd: TDataSource
    DataSet = QryOnOrd
    Left = 160
    Top = 67
  end
  object QryOnOrd: TFDQuery
    MasterSource = SrcWo
    MasterFields = 'WORKORDER_ID'
    ConnectionName = 'IQFD'
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select w.id,'
      '       r.rel_quan,'
      '       r.rel_date,'
      '       c.custno,'
      '       c.company,'
      '       a.itemno, '
      '       a.descrip,'
      '       a.descrip2,'
      '       a.rev,'
      '       o.orderno,'
      '       o.id as orders_id'
      '  from workorder w, '
      '       ptorder t,'
      '       ptorder_rel r,'
      '       arcusto c,'
      '       partno p,'
      '       arinvt a,'
      '       orders o'
      ' where t.workorder_id(+) = w.id'
      '   and r.ptorder_id(+) = t.id'
      '   and p.id = t.partno_id'
      '   and p.arinvt_id = a.id(+)'
      '   and w.id = :WORKORDER_ID'
      '   and RTrim(r.orderno) = RTrim(o.orderno(+))'
      ' '
      '   /* and w.arcusto_id = c.id */'
      '   and o.arcusto_id = c.id(+) '
      ' '
      ' ')
    Left = 160
    Top = 83
    ParamData = <
      item
        Name = 'WORKORDER_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryOnOrdID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryOnOrdREL_QUAN: TBCDField
      FieldName = 'REL_QUAN'
      DisplayFormat = '#,###,###,##0.00'
      Size = 2
    end
    object QryOnOrdREL_DATE: TDateTimeField
      FieldName = 'REL_DATE'
      DisplayFormat = 'c'
    end
    object QryOnOrdCUSTNO: TStringField
      FieldName = 'CUSTNO'
      Size = 10
    end
    object QryOnOrdCOMPANY: TStringField
      FieldName = 'COMPANY'
      Size = 60
    end
    object QryOnOrdITEMNO: TStringField
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryOnOrdDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 100
    end
    object QryOnOrdORDERNO: TStringField
      FieldName = 'ORDERNO'
      Size = 15
    end
    object QryOnOrdORDERS_ID: TBCDField
      FieldName = 'ORDERS_ID'
      Size = 0
    end
    object QryOnOrdDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object QryOnOrdREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 10
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
  end
  object QryV_Day_Mat_Req_Dtl: TFDQuery
    OnCalcFields = QryV_Day_Mat_Req_DtlCalcFields
    MasterSource = SrcUniqueItems
    MasterFields = 'ARINVT_ID;Prod_Date1;Prod_Date2;DIVISION_ID;EPLANT_ID'
    DetailFields = 'ARINVT_ID;DIVISION_ID;EPLANT_ID'
    ConnectionName = 'IQFD'
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select d.arinvt_id,'
      '       d.prod_date,'
      '       d.onorder  ,'
      
        '       decode( params.fr_hide, '#39'Y'#39', d.firm_onhand, d.onhand) as ' +
        'onhand,'
      
        '       decode( params.fr_hide, '#39'Y'#39', d.firm_day_usage, d.day_usag' +
        'e) as day_usage,'
      
        '       decode( NVL(d.firm_day_usage,0) - NVL(d.day_usage,0), 0, ' +
        #39'N'#39', '#39'Y'#39' ) as has_forecast,'
      '       d.eplant_id,'
      
        '       decode(params.capacity_consolidate_div_req, '#39'Y'#39', -1, d.di' +
        'vision_id) as division_id,'
      '       d.origin'
      '  from DAY_MAT_REQ d,'
      '       params'
      ' where d.arinvt_id = :arinvt_id'
      '   and d.prod_date between :prod_date1 and :prod_date2'
      '   and ( :division_id = -1'
      '         or'
      '         NVL(d.division_id,0) = NVL(:division_id,0))'
      '   and NVL(d.eplant_id,0) = NVL(:eplant_id,0)'
      '   and ( NVL(params.fr_hide, '#39'N'#39') = '#39'N'#39
      '         or'
      
        '         NVL(params.fr_hide, '#39'N'#39') = '#39'Y'#39' and ( NVL(d.onorder,0) >' +
        ' 0 or NVL(d.firm_day_usage,0) > 0 ))'
      ' order by                        '
      '       d.prod_date')
    Left = 92
    Top = 67
    ParamData = <
      item
        Name = 'ARINVT_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end
      item
        Name = 'Prod_Date1'
        DataType = ftDate
        ParamType = ptInput
        Size = 4
        Value = Null
      end
      item
        Name = 'Prod_Date2'
        DataType = ftDate
        ParamType = ptInput
        Size = 4
        Value = Null
      end
      item
        Name = 'division_id'
        DataType = ftFMTBcd
        NumericScale = 38
        ParamType = ptInput
        Size = 34
        Value = Null
      end
      item
        Name = 'EPLANT_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryV_Day_Mat_Req_DtlARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'V_DAY_MAT_REQ.ARINVT_ID'
      Size = 0
    end
    object QryV_Day_Mat_Req_DtlPROD_DATE: TDateTimeField
      FieldName = 'PROD_DATE'
      Origin = 'V_DAY_MAT_REQ.PROD_DATE'
    end
    object QryV_Day_Mat_Req_DtlONHAND: TFMTBCDField
      FieldName = 'ONHAND'
      Origin = 'V_DAY_MAT_REQ.ONHAND'
      DisplayFormat = '#,###,###,##0.00'
      Size = 38
    end
    object QryV_Day_Mat_Req_DtlDAY_USAGE: TFMTBCDField
      FieldName = 'DAY_USAGE'
      Origin = 'V_DAY_MAT_REQ.DAY_USAGE'
      DisplayFormat = '#,###,###,##0.00'
      Size = 38
    end
    object QryV_Day_Mat_Req_DtlONORDER: TFMTBCDField
      FieldName = 'ONORDER'
      Origin = 'V_DAY_MAT_REQ.ONORDER'
      DisplayFormat = '#,###,###,##0.00'
      Size = 6
    end
    object QryV_Day_Mat_Req_DtlDay_Balance: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Day_Balance'
      DisplayFormat = '#,###,###,##0.00'
      Calculated = True
    end
    object QryV_Day_Mat_Req_DtlEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'V_DAY_MAT_REQ.EPLANT_ID'
      Size = 0
    end
    object QryV_Day_Mat_Req_DtlDIVISION_ID: TFMTBCDField
      FieldName = 'DIVISION_ID'
      Size = 38
    end
    object QryV_Day_Mat_Req_DtlORIGIN: TStringField
      FieldName = 'ORIGIN'
      Size = 10
    end
    object QryV_Day_Mat_Req_DtlHAS_FORECAST: TStringField
      FieldName = 'HAS_FORECAST'
      Size = 1
    end
  end
  object QryUniqueItems: TFDQuery
    BeforeOpen = AssignEPlantFilter
    OnCalcFields = QryUniqueItemsCalcFields
    Filtered = True
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.arinvt_id,'
      '       v.itemno, '
      '       v.class,'
      '       v.descrip,'
      '       a.descrip2,'
      '       a.rev,'
      '       v.eplant_id,'
      '       e.name as eplant_name,'
      
        '       decode(params.capacity_consolidate_div_req, '#39'Y'#39', -1, v.di' +
        'vision_id) as division_id,'
      
        '       sum( decode(v.oversize, '#39'Y'#39', 1, 0 )) as oversize_sum_chec' +
        'k,'
      '       a.buyer_code_id,'
      '       b.buyer_code,'
      '       a.safety_stock,'
      '       a.safety_stock2'
      '  from day_mat_req v,'
      '       eplant e,'
      '       params,'
      '       arinvt a,'
      '       buyer_code b'
      '  where '
      '        (v.class = :cClass or :cClass = '#39'ALL'#39')'
      '        '
      
        '    and ( NVL(v.division_id, 0) = :v_division_id or :v_division_' +
        'id = -1)'
      '    '
      
        '    and ( NVL(a.buyer_code_id, 0) = :v_buyer_code_id or :v_buyer' +
        '_code_id = -1)'
      '    '
      '    and v.prod_date between :prod_date1 and :prod_date2'
      '    '
      '    and v.eplant_id = e.id(+)'
      '    and ( NVL(params.fr_hide, '#39'N'#39') = '#39'N'#39
      '          or '
      
        '          NVL(params.fr_hide, '#39'N'#39') = '#39'Y'#39' and ( v.onorder > 0 or ' +
        'v.firm_day_usage > 0 ))'
      '    and v.arinvt_id = a.id'
      '    and a.buyer_code_id = b.id(+)'
      ' group by v.class, '
      '          v.itemno,'
      '          v.descrip,'
      '          a.descrip2,'
      '          a.rev,'
      '          v.arinvt_id,'
      '          e.name,'
      '          v.eplant_id,'
      
        '          decode(params.capacity_consolidate_div_req, '#39'Y'#39', -1, v' +
        '.division_id),'
      '          a.buyer_code_id,'
      '          b.buyer_code,'
      '          a.safety_stock,'
      '          a.safety_stock2'
      '  order by         '
      '          v.itemno')
    Left = 20
    Top = 67
    ParamData = <
      item
        Name = 'cClass'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'v_division_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'v_buyer_code_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'prod_date1'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'prod_date2'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object QryUniqueItemsARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Size = 0
    end
    object QryUniqueItemsITEMNO: TStringField
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryUniqueItemsCLASS: TStringField
      FieldName = 'CLASS'
      Origin = 'V_DAY_MAT_REQ.CLASS'
      Size = 2
    end
    object QryUniqueItemsDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'V_DAY_MAT_REQ.DESCRIP'
      Size = 100
    end
    object QryUniqueItemsEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'V_DAY_MAT_REQ.EPLANT_ID'
      Size = 0
    end
    object QryUniqueItemsProd_Date1: TDateField
      FieldKind = fkCalculated
      FieldName = 'Prod_Date1'
      Calculated = True
    end
    object QryUniqueItemsProd_Date2: TDateField
      FieldKind = fkCalculated
      FieldName = 'Prod_Date2'
      Calculated = True
    end
    object QryUniqueItemsPastDue: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PastDue'
      DisplayFormat = '#,###,###,##0.00'
      Calculated = True
    end
    object QryUniqueItemsProjectedOnHand: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ProjectedOnHand'
      DisplayFormat = '#,###,###,##0.00'
      Calculated = True
    end
    object QryUniqueItemsOnHand: TFloatField
      FieldKind = fkCalculated
      FieldName = 'OnHand'
      DisplayFormat = '#,###,###,##0.00'
      Calculated = True
    end
    object QryUniqueItemsEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      FieldName = 'EPLANT_NAME'
      Size = 30
    end
    object QryUniqueItemsDIVISION_ID: TFMTBCDField
      FieldName = 'DIVISION_ID'
      Size = 38
    end
    object QryUniqueItemsDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      FieldKind = fkCalculated
      FieldName = 'DIVISION_NAME'
      Size = 25
      Calculated = True
    end
    object QryUniqueItemsOVERSIZE_SUM_CHECK: TFMTBCDField
      FieldName = 'OVERSIZE_SUM_CHECK'
      Size = 38
    end
    object QryUniqueItemsBUYER_CODE_ID: TBCDField
      FieldName = 'BUYER_CODE_ID'
      Visible = False
      Size = 0
    end
    object QryUniqueItemsBUYER_CODE: TStringField
      DisplayLabel = 'Buyer Code'
      FieldName = 'BUYER_CODE'
      Size = 10
    end
    object QryUniqueItemsDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object QryUniqueItemsREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 10
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
    object QryUniqueItemsSAFETY_STOCK: TBCDField
      DisplayLabel = 'ReOrder Point'
      FieldName = 'SAFETY_STOCK'
    end
    object QryUniqueItemsSAFETY_STOCK2: TBCDField
      DisplayLabel = 'Safety Stock'
      FieldName = 'SAFETY_STOCK2'
    end
  end
  object SrcUniqueItems: TDataSource
    DataSet = QryUniqueItems
    OnDataChange = SrcUniqueItemsDataChange
    Left = 20
    Top = 91
  end
  object SrcV_Day_Mat_Req_Dtl: TDataSource
    DataSet = QryV_Day_Mat_Req_Dtl
    Left = 92
    Top = 91
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 286
    Top = 2
  end
  object popOnOrder: TUniPopupMenu
    OnPopup = popOnOrderPopup
    Left = 52
    Top = 176
    object OnOrder1: TUniMenuItem
      Caption = '&On Order'
      OnClick = OnOrder1Click
    end
    object DRPDemand1: TUniMenuItem
      Caption = '&DRP Demand'
      OnClick = DRPDemand1Click
    end
  end
  object popItem: TUniPopupMenu
    Left = 24
    Top = 176
    object JumptoInventory1: TUniMenuItem
      Caption = 'Jump to Inventory'
      OnClick = JumptoInventory1Click
    end
    object JumpToInventoryLocationsTransactions1: TUniMenuItem
      Caption = 'Jump to Inventory Locations && Transactions'
      OnClick = JumpToInventoryLocationsTransactions1Click
    end
    object PastDuePOs1: TUniMenuItem
      Caption = 'Past Due POs'
      OnClick = PastDuePOs1Click
    end
  end
  object popWO: TUniPopupMenu
    Left = 80
    Top = 176
    object JumptoWorkOrder1: TUniMenuItem
      Caption = 'Jump to Work Order'
      OnClick = JumptoWorkOrder1Click
    end
  end
  object popOE: TUniPopupMenu
    Left = 108
    Top = 176
    object JumptoSalesOrder1: TUniMenuItem
      Caption = 'Jump to Sales Order'
      OnClick = JumptoSalesOrder1Click
    end
  end
  object procPOCumm: TFDStoredProc
    ConnectionName = 'IQFD'
    PackageName = 'IQCAPACITY'
    StoredProcName = 'PO_CUM'
    Left = 56
    Top = 118
    ParamData = <
      item
        Position = 1
        Name = 'RESULT'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptResult
      end
      item
        Position = 2
        Name = 'V_ARINVT_ID'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'V_PROMISE_DATE'
        DataType = ftDateTime
        FDDataType = dtDateTime
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'V_DIVISION_ID'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInput
      end>
  end
end
