object FrmMatException: TFrmMatException
  Left = 148
  Top = 226
  HelpContext = 1051839
  ClientHeight = 596
  ClientWidth = 904
  Caption = 'Material Exception List'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 904
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      904
      27)
    object sbtnClassFilter: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Filter'
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
      OnClick = sbtnClassFilterClick
    end
    object sbtnEplantView: TUniSpeedButton
      Left = 26
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Set EPlant View'
      ShowHint = True
      ParentShowHint = False
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
      OnClick = sbtnEplantViewClick
    end
    object sbtnRecalc: TUniSpeedButton
      Tag = 1
      Left = 51
      Top = 1
      Width = 25
      Height = 25
      Hint = 
        'Calculate Material Exceptions, Ideal vs Existing and Daily Mater' +
        'ial Requirements'
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
      OnClick = recalculate1Click
    end
    object shapeYellow: TUniPanel
      Left = 774
      Top = 9
      Width = 10
      Height = 11
      Hint = 
        'Open PO(s) exist for this item. Please refer to Ideal vs Existin' +
        'g'
      ShowHint = True
      ParentShowHint = False
      Anchors = [akTop, akRight]
      TabOrder = 5
      Caption = ''
    end
    object shapePurple: TUniPanel
      Left = 761
      Top = 9
      Width = 10
      Height = 11
      Hint = 'Numeric Oversize Exception'
      ShowHint = True
      ParentShowHint = False
      Anchors = [akTop, akRight]
      TabOrder = 6
      Caption = ''
    end
    object Shape6: TUniPanel
      Left = 747
      Top = 9
      Width = 10
      Height = 11
      Hint = 'Contains Forecast Data'
      ShowHint = True
      ParentShowHint = False
      Anchors = [akTop, akRight]
      TabOrder = 7
      Caption = ''
    end
    object sbtnEval: TUniSpeedButton
      Left = 76
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Evaluate and Display Exception Details'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C21E0000C21E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFD575CF7040EFD2E33FEA1A4FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7070704A4A4A585858AB
        ABABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFEA1A4FD2E33FD4B50FD2E33F7040EFFC1C3FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABABAB5858586868685858584A
        4A4AC7C7C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFD383EFD4B50FD4B50FD4B50FD2E33FD3A3FFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D5D5D68686868686868686858
        58585E5E5EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FE7A7EFD4B50FE666AFD4B50FE666AFD4B50FD2E33FEA1A4FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8A8A6868687B7B7B6868687B7B7B68
        6868585858ABABABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E1
        FD3A3FFE666AFE666AFE666AFE666AFD4B50FD4B50FD3A3FFFF0F0FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E35E5E5E7B7B7B7B7B7B7B7B7B7B7B7B68
        68686868685E5E5EF2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C42
        FD575BFE666AFE666AFE666AFE666AFE666AFE666AFD2E33FE7A7EFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5F7070707B7B7B7B7B7B7B7B7B7B7B7B7B
        7B7B7B7B7B5858588A8A8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE999CFD3A3F
        FE777BFE7074FE7176FE666AFE666AFE666AFE666AFD4B50FD3A3FFFE5E6FFFF
        FFFFFFFFFFFFFFFFFFFFA4A4A45E5E5E8888888282828383837B7B7B7B7B7B7B
        7B7B7B7B7B6868685E5E5EE8E8E8FFFFFFFFFFFFFFFFFFFFFFFFFD3A3FFE777B
        FE7C7FFE777BFE777BFE7074FD4B50FD2E33FE666AFE666AFD4B50FD575CFFFF
        FFFFFFFFFFFFFFFFFFFF5E5E5E8888888C8C8C88888888888882828268686858
        58587B7B7B7B7B7B686868707070FFFFFFFFFFFFFFFFFFFFFFFFFD3A3FFE8589
        FE8589FE8589FE7C7FFE7074FD3A3FFD575CFD4B50FE666AFE666AFD2E33FFC1
        C3FFFFFFFFFFFFFFFFFF5E5E5E9393939393939393938C8C8C8282825E5E5E70
        70706868687B7B7B7B7B7B585858C7C7C7FFFFFFFFFFFFFFFFFFFE7A7EFE676B
        FEA3A6FE8D90FE8589FD3A3FFFAFB2FFF0F0FD2E33FE666AFE666AFD4B50FD38
        3EFFFFFFFFFFFFFFFFFF8A8A8A7B7B7BADADAD9A9A9A9393935E5E5EB7B7B7F2
        F2F25858587B7B7B7B7B7B6868685D5D5DFFFFFFFFFFFFFFFFFFFFF0F0FD383E
        FE676BFEA3A6FD575CFE7A7EFFFFFFFFFFFFFFC1C3FD2E33FE666AFD4B50FD2E
        33FEA1A4FFFFFFFFFFFFF2F2F25D5D5D7B7B7BADADAD7070708A8A8AFFFFFFFF
        FFFFC7C7C75858587B7B7B686868585858ABABABFFFFFFFFFFFFFFFFFFFFF0F0
        FE7A7EFD3A3FFD383EFFFFFFFFFFFFFFFFFFFFFFFFFE8B8EFD4B50FE666AFD4B
        50FD2E33FFF0F0FFFFFFFFFFFFF2F2F28A8A8A5E5E5E5D5D5DFFFFFFFFFFFFFF
        FFFFFFFFFF9898986868687B7B7B686868585858F2F2F2FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C42FD4B50FD4B
        50FD2E33FD575CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF5F5F5F686868686868585858707070FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FD2E33FD4B
        50FD4B50FD2E33FEA1A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFF2F2F2585858686868686868585858ABABABFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1D3EB04
        0EFD2E33FD2E33FD2E33FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFD6D6D6464646585858585858585858FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF
        F0FE7A7EF7040EEB040EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F18A8A8A4A4A4A464646}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnEvalClick
    end
    object NavMain: TUniDBNavigator
      Left = 804
      Top = 1
      Width = 99
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object PageControl1: TUniPageControl
    Left = 0
    Top = 27
    Width = 904
    Height = 550
    Hint = ''
    ShowHint = True
    ParentShowHint = False
    ActivePage = shExceptions
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    TabStop = False
    OnChange = PageControl1Change
    object shExceptions: TUniTabSheet
      Hint = ''
      HelpContext = 1011589
      ShowHint = True
      Caption = 'Projected Exception'
      object Splitter1: TUniSplitter
        Left = 0
        Top = 168
        Width = 896
        Height = 3
        Cursor = crVSplit
        Hint = ''
        ShowHint = True
        Align = alTop
        ParentColor = False
        Color = clBtnFace
      end
      object Panel3: TUniPanel
        Tag = 1999
        Left = 0
        Top = 171
        Width = 896
        Height = 351
        Hint = ''
        ShowHint = True
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        ExplicitTop = 220
        ExplicitHeight = 200
        object Splitter2: TUniSplitter
          Left = 1
          Top = 209
          Width = 894
          Height = 3
          Cursor = crVSplit
          Hint = ''
          ShowHint = True
          Align = alTop
          ParentColor = False
          Color = clBtnFace
          ExplicitTop = 110
        end
        object Splitter3: TUniSplitter
          Left = 214
          Top = 212
          Width = 6
          Height = 138
          Hint = ''
          ShowHint = True
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
          ExplicitTop = 113
          ExplicitHeight = 237
        end
        object pnlXcptDtl: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 894
          Height = 208
          Hint = ''
          ShowHint = True
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = 'Double-click item to display detail'
          object gridXcptDtl: TIQUniGridControl
            Left = 1
            Top = 1
            Width = 892
            Height = 206
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            ShowHint = True
            TabOrder = 0
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 675
            IQComponents.Grid.Height = 120
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.ShowHint = True
            IQComponents.Grid.DataSource = SrcXcptDtl
            IQComponents.Grid.LoadMask.Message = 'Loading data...'
            IQComponents.Grid.Align = alClient
            IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
            IQComponents.Grid.TabOrder = 0
            IQComponents.Grid.OnDrawColumnCell = gridXcptDtlDBGridDrawColumnCell
            IQComponents.Navigator.Left = 410
            IQComponents.Navigator.Top = 0
            IQComponents.Navigator.Width = 241
            IQComponents.Navigator.Height = 25
            IQComponents.Navigator.Hint = ''
            IQComponents.Navigator.ShowHint = True
            IQComponents.Navigator.DataSource = SrcXcptDtl
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 675
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 120
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.ShowHint = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.HiddenPanel.ExplicitHeight = 21
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ShowHint = True
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            IQComponents.FormTab.ExplicitHeight = 50
            DataSource = SrcXcptDtl
            Columns = <
              item
                FieldName = 'MUST_ORDER'
                Title.Caption = 'Must Order By'
                Width = 98
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'MUST_ARRIVE'
                Title.Caption = 'Must Arrive By'
                Width = 126
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'SHOULD_ARRIVE'
                Title.Caption = 'Should Arrive By'
                Width = 126
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'QTY'
                Title.Caption = 'Order Quantity'
                Width = 70
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'VENDORNO'
                Title.Caption = 'Vendor #'
                Width = 70
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'COMPANY'
                Title.Caption = 'Company'
                Width = 119
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'VENDOR_RECEIVE'
                Title.Caption = 'Vendor Receive'
                Width = 126
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'ORIGIN'
                Title.Caption = 'Origin'
                Width = 70
                CheckBoxField.FieldValues = 'true;false'
              end>
            TabsVisible = True
            ExplicitLeft = -1
            ExplicitTop = 68
            ExplicitHeight = 84
            Marker = 0
          end
        end
        object pnlWO: TUniPanel
          Tag = 1999
          Left = 1
          Top = 212
          Width = 213
          Height = 138
          Hint = ''
          ShowHint = True
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 1
          Caption = ''
          ExplicitTop = 113
          ExplicitHeight = 237
          object gridWO: TUniDBGrid
            Left = 1
            Top = 1
            Width = 211
            Height = 136
            Hint = ''
            ShowHint = True
            DataSource = SrcWO
            LoadMask.Message = 'Loading data...'
            OnEnter = ChangeNavSource
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            ParentColor = False
            Color = clBtnFace
            OnDrawColumnCell = gridWODrawColumnCell
            Columns = <
              item
                FieldName = 'WORKORDER_ID'
                Title.Caption = 'Work Order #'
                Width = 73
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'PROD_DATE'
                Title.Caption = 'Date'
                Width = 54
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'TOT_MAT_QTY'
                Title.Caption = 'Quantity'
                Width = 53
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'HARD_ALLOC_QTY'
                Title.Caption = 'Hard Allocated'
                Width = 90
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'AlternateItemNo'
                Title.Caption = 'Alternate Item #'
                Width = 154
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'OpNo'
                Title.Caption = 'Process #'
                Width = 111
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'OpDesc'
                Title.Caption = 'Process Description'
                Width = 158
                CheckBoxField.FieldValues = 'true;false'
              end>
          end
        end
        object gridOrders: TUniDBGrid
          Left = 220
          Top = 212
          Width = 675
          Height = 138
          Hint = ''
          ShowHint = True
          DataSource = SrcOrders
          LoadMask.Message = 'Loading data...'
          OnEnter = ChangeNavSource
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 2
          ParentColor = False
          Color = clBtnFace
          Columns = <
            item
              FieldName = 'ORDERNO'
              Title.Caption = 'Order #'
              Width = 52
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ITEMNO'
              Title.Caption = 'Item #'
              Width = 53
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'Description'
              Width = 75
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'REL_DATE'
              Title.Caption = 'Release Date'
              Width = 77
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'REL_QUAN'
              Title.Caption = 'Release Quantity'
              Width = 95
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CUSTNO'
              Title.Caption = 'Customer'
              Width = 67
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PONO'
              Title.Caption = 'PO #'
              Width = 75
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'REV'
              Title.Caption = 'Rev'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP2'
              Title.Caption = 'Ext Description'
              Width = 214
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'COMPANY'
              Title.Caption = 'Customer Name'
              Width = 184
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
      end
      object pnlItems: TUniPanel
        Left = 0
        Top = 0
        Width = 896
        Height = 168
        Hint = ''
        ShowHint = True
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = 'pnlItems'
        object srchXcpItems: TIQUniGridControl
          Left = 1
          Top = 1
          Width = 894
          Height = 166
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          ShowHint = True
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 677
          IQComponents.Grid.Height = 80
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.ShowHint = True
          IQComponents.Grid.DataSource = wwSrcXcpItems
          IQComponents.Grid.LoadMask.Message = 'Loading data...'
          IQComponents.Grid.Align = alClient
          IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
          IQComponents.Grid.TabOrder = 0
          IQComponents.Grid.OnDrawColumnCell = srchXcpItemsDBGridDrawColumnCell
          IQComponents.Navigator.Left = 410
          IQComponents.Navigator.Top = 0
          IQComponents.Navigator.Width = 241
          IQComponents.Navigator.Height = 25
          IQComponents.Navigator.Hint = ''
          IQComponents.Navigator.ShowHint = True
          IQComponents.Navigator.DataSource = wwSrcXcpItems
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 677
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 80
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.ShowHint = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ShowHint = True
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = wwSrcXcpItems
          Columns = <
            item
              FieldName = 'ITEMNO'
              Title.Caption = 'Item #'
              Width = 63
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'Description'
              Width = 126
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ONHAND'
              Title.Caption = 'On Hand'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CLASS'
              Title.Caption = 'Class'
              Width = 35
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'REV'
              Title.Caption = 'Revision'
              Width = 42
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'UOM'
              Title.Caption = 'UOM'
              Width = 35
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DIVISION_NAME'
              Title.Caption = 'Division'
              Width = 77
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'QTY'
              Title.Caption = 'Total Exception'
              Width = 84
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'LEFT_TO_ORDER'
              Title.Caption = 'Left To Order'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'VMI'
              Title.Caption = 'VMI'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EPLANT_ID'
              Title.Caption = 'EPlant ID'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'COST_OBJECT'
              Title.Caption = 'Cost Object'
              Width = 140
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'BUYER_CODE'
              Title.Caption = 'Buyer Code'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'VENDORNO'
              Title.Caption = 'Vendor #'
              Width = 84
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'COMPANY'
              Title.Caption = 'Company'
              Width = 210
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP2'
              Title.Caption = 'Ext Description'
              Width = 245
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'MPS'
              Title.Caption = 'MPS'
              Width = 7
              CheckBoxField.FieldValues = 'Y;N'
            end
            item
              FieldName = 'LEAD_DAYS'
              Title.Caption = 'Lead Days'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end>
          TabsVisible = True
          Marker = 0
        end
      end
    end
    object TabSheet2: TUniTabSheet
      Hint = ''
      HelpContext = 1011696
      ShowHint = True
      Caption = 'Requirements on Past-Due PO'#39's'
      object Splitter4: TUniSplitter
        Left = 0
        Top = 145
        Width = 896
        Height = 3
        Cursor = crVSplit
        Hint = ''
        ShowHint = True
        Align = alTop
        ParentColor = False
        Color = clBtnFace
      end
      object pnlReqMat: TUniPanel
        Left = 0
        Top = 0
        Width = 896
        Height = 145
        Hint = ''
        ShowHint = True
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object srchPastDuePO: TIQUniGridControl
          Left = 1
          Top = 1
          Width = 894
          Height = 143
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          ShowHint = True
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 677
          IQComponents.Grid.Height = 57
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.ShowHint = True
          IQComponents.Grid.DataSource = SrcMatReqItems
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
          IQComponents.Navigator.DataSource = SrcMatReqItems
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 677
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 57
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.ShowHint = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ShowHint = True
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcMatReqItems
          Columns = <
            item
              FieldName = 'ITEMNO'
              Title.Caption = 'Item #'
              Width = 175
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'Description'
              Width = 105
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ONHAND'
              Title.Caption = 'On Hand'
              Width = 63
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CLASS'
              Title.Caption = 'Class'
              Width = 49
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DIVISION_NAME'
              Title.Caption = 'Division'
              Width = 112
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'BUYER_CODE'
              Title.Caption = 'Buyer Code'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'REV'
              Title.Caption = 'Rev'
              Width = 105
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP2'
              Title.Caption = 'Ext Description'
              Width = 245
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'LEAD_DAYS'
              Title.Caption = 'Lead Days'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end>
          TabsVisible = True
          Marker = 0
        end
      end
      object Panel5: TUniPanel
        Left = 0
        Top = 148
        Width = 896
        Height = 374
        Hint = ''
        ShowHint = True
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object Splitter6: TUniSplitter
          Left = 1
          Top = 158
          Width = 894
          Height = 3
          Cursor = crVSplit
          Hint = ''
          ShowHint = True
          Align = alTop
          ParentColor = False
          Color = clBtnFace
        end
        object gridPastDuePOs: TUniDBGrid
          Left = 1
          Top = 1
          Width = 894
          Height = 137
          Hint = ''
          ShowHint = True
          DataSource = SrcPastDuePOs
          LoadMask.Message = 'Loading data...'
          OnEnter = ChangeNavSource
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Columns = <
            item
              FieldName = 'PONO'
              Title.Caption = 'PO #'
              Width = 41
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SEQ'
              Title.Caption = 'Line #'
              Width = 40
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PO_DATE'
              Title.Caption = 'PO Date'
              Width = 112
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'COMPANY'
              Title.Caption = 'Vendor'
              Width = 116
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'BLANKET_QTY'
              Title.Caption = 'Blanket Quantity'
              Width = 84
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'TOTAL_RELEASES'
              Title.Caption = 'Total Releases'
              Width = 74
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'QTY_RECEIVED'
              Title.Caption = 'Received'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'LEFT_TO_RECEIVE'
              Title.Caption = 'Left To Receive'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'UNIT'
              Title.Caption = 'PO UOM'
              Width = 71
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
        object wwGrdPOReleasesOverDue: TIQUniGridControl
          Left = 1
          Top = 161
          Width = 894
          Height = 212
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          ShowHint = True
          TabOrder = 1
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 677
          IQComponents.Grid.Height = 126
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.ShowHint = True
          IQComponents.Grid.DataSource = SrcPOReleasesOverDue
          IQComponents.Grid.LoadMask.Message = 'Loading data...'
          IQComponents.Grid.Align = alClient
          IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
          IQComponents.Grid.TabOrder = 0
          IQComponents.Grid.OnDrawColumnCell = wwGrdPOReleasesOverDueDBGridDrawColumnCell
          IQComponents.Navigator.Left = 410
          IQComponents.Navigator.Top = 0
          IQComponents.Navigator.Width = 241
          IQComponents.Navigator.Height = 25
          IQComponents.Navigator.Hint = ''
          IQComponents.Navigator.ShowHint = True
          IQComponents.Navigator.DataSource = SrcPOReleasesOverDue
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 677
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 126
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.ShowHint = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ShowHint = True
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcPOReleasesOverDue
          Columns = <
            item
              FieldName = 'SEQ'
              Title.Caption = '#'
              Width = 21
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'QUAN'
              Title.Caption = 'Quantity'
              Width = 105
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'REQUEST_DATE'
              Title.Caption = 'Request Date'
              Width = 126
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PROMISE_DATE'
              Title.Caption = 'Promise Date'
              Width = 147
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Left_To_Recv'
              Title.Caption = 'Left To Receive'
              Width = 84
              CheckBoxField.FieldValues = 'true;false'
            end>
          TabsVisible = True
          Marker = 0
        end
        object Panel2: TUniPanel
          Tag = 1999
          Left = 1
          Top = 138
          Width = 894
          Height = 20
          Hint = ''
          ShowHint = True
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -12
          TabOrder = 2
          Caption = ''
          Color = clBtnShadow
          object Label7: TUniLabel
            Left = 1
            Top = 1
            Width = 52
            Height = 14
            Hint = ''
            ShowHint = True
            Caption = 'Releases'
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
      end
    end
    object shBelowMin: TUniTabSheet
      Hint = ''
      HelpContext = 1011706
      ShowHint = True
      Caption = 'Raw Material Below Minimum'
      object IQSearchBelowMin: TIQUniGridControl
        Left = 0
        Top = 0
        Width = 896
        Height = 522
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        ShowHint = True
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 679
        IQComponents.Grid.Height = 436
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.ShowHint = True
        IQComponents.Grid.DataSource = SrcBelowMin
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
        IQComponents.Navigator.DataSource = SrcBelowMin
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 679
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 436
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.ShowHint = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ShowHint = True
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcBelowMin
        Columns = <
          item
            FieldName = 'CLASS'
            Title.Caption = 'Class'
            Width = 28
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ITEMNO'
            Title.Caption = 'Item #'
            Width = 126
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'REV'
            Title.Caption = 'Revision'
            Width = 42
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Description'
            Width = 147
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ONHAND'
            Title.Caption = 'On Hand'
            Width = 63
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SAFETY_STOCK'
            Title.Caption = 'Reorder Point'
            Width = 70
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'MIN_ORDER_QTY'
            Title.Caption = 'Minimum Order'
            Width = 77
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'MAX_ORDER_QTY'
            Title.Caption = 'Maximum Order'
            Width = 84
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'UOM'
            Title.Caption = 'UOM'
            Width = 70
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DIVISION_NAME'
            Title.Caption = 'Division'
            Width = 98
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'BUYER_CODE'
            Title.Caption = 'Buyer Code'
            Width = 70
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'VENDORNO'
            Title.Caption = 'Vendor #'
            Width = 70
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'COMPANY'
            Title.Caption = 'Vendor Name'
            Width = 210
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ON_ORDER'
            Title.Caption = 'On Order'
            Width = 105
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PO_REQUIRED'
            Title.Caption = 'PO Required'
            Width = 77
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP2'
            Title.Caption = 'Ext Description'
            Width = 245
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'LEAD_DAYS'
            Title.Caption = 'Lead Days'
            Width = 70
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'HARD_ALLOC'
            Title.Caption = 'Hard Allocated'
            Width = 98
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
      end
    end
    object shOutsourceBelowMin: TUniTabSheet
      Hint = ''
      ShowHint = True
      Caption = 'Outsource Material Below Minimum'
      object srchOutsourceBelowMin: TIQUniGridControl
        Left = 0
        Top = 0
        Width = 896
        Height = 522
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        ShowHint = True
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 679
        IQComponents.Grid.Height = 436
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.ShowHint = True
        IQComponents.Grid.DataSource = SrcOutsourceBelowMin
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
        IQComponents.Navigator.DataSource = SrcOutsourceBelowMin
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 679
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 436
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.ShowHint = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ShowHint = True
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcOutsourceBelowMin
        Columns = <
          item
            FieldName = 'ITEMNO'
            Title.Caption = 'Item #'
            Width = 175
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Item Description'
            Width = 210
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'UNIT'
            Title.Caption = 'Native UOM'
            Width = 70
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'VENDORNO'
            Title.Caption = 'Vendor #'
            Width = 70
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'COMPANY'
            Title.Caption = 'Vendor Name'
            Width = 210
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ONHAND_IN_TRANSIT'
            Title.Caption = 'On Hand In Transit'
            Width = 105
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SHIP_ORDER_QTY'
            Title.Caption = 'On Ship Order'
            Width = 105
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SAFETY_STOCK'
            Title.Caption = 'Reorder Point'
            Width = 105
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'MIN_ORDER_QTY'
            Title.Caption = 'Minimum Order'
            Width = 105
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'MAX_ORDER_QTY'
            Title.Caption = 'Maximum Order'
            Width = 105
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'BUYER_CODE'
            Title.Caption = 'Buyer Code'
            Width = 70
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CLASS'
            Title.Caption = 'Class'
            Width = 14
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'REV'
            Title.Caption = 'Rev'
            Width = 70
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP2'
            Title.Caption = 'Ext Item Description'
            Width = 210
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
      end
    end
    object shExist_Ideal: TUniTabSheet
      Hint = ''
      HelpContext = 1119616
      ShowHint = True
      Caption = 'Ideal vs. Existing'
      object Splitter5: TUniSplitter
        Left = 0
        Top = 224
        Width = 896
        Height = 3
        Cursor = crVSplit
        Hint = ''
        ShowHint = True
        Align = alTop
        ParentColor = False
        Color = clBtnFace
      end
      object pnlExist_Ideal_Items: TUniPanel
        Left = 0
        Top = 0
        Width = 896
        Height = 224
        Hint = ''
        ShowHint = True
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object srchIdealVsExist: TIQUniGridControl
          Left = 1
          Top = 28
          Width = 894
          Height = 195
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          ShowHint = True
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 677
          IQComponents.Grid.Height = 109
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.ShowHint = True
          IQComponents.Grid.DataSource = wwSrcExist_Ideal_Items
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
          IQComponents.Navigator.DataSource = wwSrcExist_Ideal_Items
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 677
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 109
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.ShowHint = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ShowHint = True
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = wwSrcExist_Ideal_Items
          Columns = <
            item
              FieldName = 'CLASS'
              Title.Caption = 'Class'
              Width = 28
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ITEMNO'
              Title.Caption = 'Item #'
              Width = 98
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'REV'
              Title.Caption = 'Revision'
              Width = 28
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'Description'
              Width = 147
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'UNIT'
              Title.Caption = 'Unit'
              Width = 28
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ONHAND'
              Title.Caption = 'On Hand'
              Width = 56
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'UOM'
              Title.Caption = 'UOM'
              Width = 42
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DIVISION_NAME'
              Title.Caption = 'Division'
              Width = 84
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'COST_OBJECT'
              Title.Caption = 'Cost Object'
              Width = 112
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'BUYER_CODE'
              Title.Caption = 'Buyer Code'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP2'
              Title.Caption = 'Ext Description'
              Width = 245
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'LEAD_DAYS'
              Title.Caption = 'Lead Days'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end>
          TabsVisible = True
          Marker = 0
        end
        object pnlIdealExistTop: TUniPanel
          Left = 1
          Top = 1
          Width = 894
          Height = 27
          Hint = ''
          ShowHint = True
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            894
            27)
          object lblFilterSuggestedAction: TUniLabel
            Left = 4
            Top = 8
            Width = 111
            Height = 13
            Hint = ''
            ShowHint = True
            Caption = 'Suggested Action Filter'
            TabOrder = 2
          end
          object sbtnSuggestedActionFilter: TUniSpeedButton
            Left = 834
            Top = 4
            Width = 20
            Height = 22
            Hint = 'Assign Suggested Action Filter'
            ShowHint = True
            ParentShowHint = False
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C21E0000C21E00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF034464034464FF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF0344640ED1FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A14D3FF03
              4464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF0099CC1BD5FF1BD5FF034464FF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A22
              D7FF22D7FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF00669A00669A00669A29DAFF034464034464034464FF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A30DCFF30
              DCFF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF00669A37DEFF37DEFF034464FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A3D
              E0FF3DE0FF3DE0FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF00669A00669A00669A00669A44E3FF034464034464034464034464FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A4BE5FF4BE5FF4B
              E5FF4BE5FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00669A5CEBFE5CEBFE5CEBFE5CEBFE034464FF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0099CC00669A70
              F1FE70F1FE70F1FE70F1FE034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF0099CC0344640344640344640344640344640344
              64FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Caption = ''
            Anchors = [akTop, akRight]
            ParentColor = False
            Color = clWindow
            OnClick = sbtnSuggestedActionFilterClick
          end
          object edSuggestedActionFilter: TUniEdit
            Left = 123
            Top = 4
            Width = 709
            Height = 21
            Hint = ''
            ShowHint = True
            Text = '<Filter not assigned>'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Color = clBtnFace
            ReadOnly = True
          end
        end
      end
      object Panel4: TUniPanel
        Left = 0
        Top = 227
        Width = 896
        Height = 295
        Hint = ''
        ShowHint = True
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object pnlExistPO: TUniPanel
          Left = 1
          Top = 225
          Width = 894
          Height = 69
          Hint = ''
          ShowHint = True
          Align = alBottom
          Anchors = [akLeft, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Label1: TUniLabel
            Left = 8
            Top = 7
            Width = 25
            Height = 13
            Hint = ''
            ShowHint = True
            Caption = 'PO #'
            TabOrder = 5
          end
          object Label3: TUniLabel
            Left = 8
            Top = 29
            Width = 30
            Height = 13
            Hint = ''
            ShowHint = True
            Caption = 'Line #'
            TabOrder = 6
          end
          object Label4: TUniLabel
            Left = 168
            Top = 7
            Width = 69
            Height = 13
            Hint = ''
            ShowHint = True
            Caption = 'Balance on PO'
            TabOrder = 7
          end
          object Label5: TUniLabel
            Left = 8
            Top = 51
            Width = 34
            Height = 13
            Hint = ''
            ShowHint = True
            Caption = 'Vendor'
            TabOrder = 8
          end
          object DBEdit1: TUniDBEdit
            Left = 53
            Top = 4
            Width = 83
            Height = 19
            Hint = ''
            ShowHint = True
            DataField = 'PONO'
            DataSource = SrcV_Exist_Ideal
            TabOrder = 0
            Color = clBtnFace
            ReadOnly = True
          end
          object DBEdit2: TUniDBEdit
            Left = 53
            Top = 26
            Width = 83
            Height = 19
            Hint = ''
            ShowHint = True
            DataField = 'SEQ'
            DataSource = SrcV_Exist_Ideal
            TabOrder = 1
            Color = clBtnFace
            ReadOnly = True
          end
          object DBEdit3: TUniDBEdit
            Left = 248
            Top = 4
            Width = 114
            Height = 19
            Hint = ''
            ShowHint = True
            DataField = 'TOTAL_QTY_ORD'
            DataSource = SrcV_Exist_Ideal
            TabOrder = 2
            Color = clBtnFace
            ReadOnly = True
          end
          object DBEdit4: TUniDBEdit
            Left = 53
            Top = 48
            Width = 310
            Height = 19
            Hint = ''
            ShowHint = True
            DataField = 'VENDOR_COMPANY'
            DataSource = SrcV_Exist_Ideal
            TabOrder = 3
            Color = clBtnFace
            ReadOnly = True
          end
        end
        object gridExist_Ideal: TIQUniGridControl
          Left = 1
          Top = 1
          Width = 894
          Height = 224
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          ShowHint = True
          TabOrder = 1
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 677
          IQComponents.Grid.Height = 138
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.ShowHint = True
          IQComponents.Grid.DataSource = SrcV_Exist_Ideal
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
          IQComponents.Navigator.DataSource = SrcV_Exist_Ideal
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 677
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 138
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.ShowHint = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ShowHint = True
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcV_Exist_Ideal
          Columns = <
            item
              FieldName = 'IDEAL_QTY'
              Title.Caption = 'Ideal Quantity'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'MUST_ARRIVE'
              Title.Caption = 'Must Arrive'
              Width = 105
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SHOULD_ARRIVE'
              Title.Caption = 'Should Arrive'
              Width = 98
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PROMISE_DATE'
              Title.Caption = 'Promise Date'
              Width = 126
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PO_QTY'
              Title.Caption = 'Quantity on PO'
              Width = 91
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PO_QTY_INV_UOM'
              Title.Caption = 'PO Quantity~(Inv UOM)'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PO_RELEASES_SEQ'
              Title.Caption = 'Release #'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ACTION'
              Title.Caption = 'Suggested Action'
              Width = 308
              CheckBoxField.FieldValues = 'true;false'
            end>
          TabsVisible = True
          Marker = 0
        end
      end
    end
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 577
    Width = 904
    Height = 19
    Hint = ''
    ShowHint = True
    ParentShowHint = False
    Panels = <>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object MainMenu1: TUniMainMenu
    Left = 194
    Top = 56
    object File1: TUniMenuItem
      Caption = '&File'
      object recalculate1: TUniMenuItem
        Caption = '&Recalculate'
        Visible = False
        OnClick = recalculate1Click
      end
      object ReceivingDays1: TUniMenuItem
        Caption = 'Receiving Days'
        OnClick = ReceivingDays1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
        Visible = False
      end
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
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
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object SrcXcptDtl: TDataSource
    DataSet = QryXcptDtl
    Left = 114
    Top = 54
  end
  object SrcWO: TDataSource
    DataSet = QryWO
    Left = 81
    Top = 132
  end
  object SrcOrders: TDataSource
    DataSet = QryOrders
    Left = 114
    Top = 132
  end
  object QryXcptDtl: TFDQuery
    Tag = -1
    BeforeOpen = QryXcptDtlBeforeOpen
    AfterOpen = RestoreGridAfterDataSetOpen
    BeforeClose = SaveGridBeforeDataSetClose
    AfterClose = SetGridColor
    Filtered = True
    Filter = 'ARINVT_ID = -1'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select x.arinvt_id,'
      '       x.division_id,'
      '       x.qty,'
      '       x.must_arrive as must_arrive,'
      '       x.must_order as must_order,'
      '       x.should_arrive,'
      '       x.vendor_id,'
      '       ven.vendorno,'
      '       ven.company,'
      '       x.po_detail_id,'
      
        '       decode( x.cost_object_source, '#39'JOBSHOP_TASK'#39', '#39'JOBSHOP_TA' +
        'SK'#39',   NULL ) as cost_object_source,'
      
        '       decode( x.cost_object_source, '#39'JOBSHOP_TASK'#39', x.cost_obje' +
        'ct_id, NULL ) as cost_object_id,'
      '       x.origin,'
      '       x.vendor_receive'
      '  from xcpt_mat_req x,'
      '       vendor ven'
      ' where '
      '       (:include_all = 1 '
      '        or'
      '        x.must_order <= sysdate + :exception_scope )'
      '    and x.vendor_id = ven.id(+)'
      '  order '
      '        by x.must_order'
      ' '
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
    Left = 113
    Top = 102
    ParamData = <
      item
        Name = 'include_all'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'exception_scope'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryXcptDtlMUST_ORDER: TDateTimeField
      DisplayLabel = 'Must Order By'
      DisplayWidth = 14
      FieldName = 'MUST_ORDER'
      DisplayFormat = 'ddddd'
    end
    object QryXcptDtlMUST_ARRIVE: TDateTimeField
      DisplayLabel = 'Must Arrive By'
      DisplayWidth = 18
      FieldName = 'MUST_ARRIVE'
      DisplayFormat = 'ddddd'
    end
    object QryXcptDtlSHOULD_ARRIVE: TDateTimeField
      DisplayLabel = 'Should Arrive By'
      DisplayWidth = 18
      FieldName = 'SHOULD_ARRIVE'
    end
    object QryXcptDtlQTY: TFMTBCDField
      DisplayLabel = 'Order Quantity'
      DisplayWidth = 10
      FieldName = 'QTY'
      DisplayFormat = '#########0.00'
      Size = 6
    end
    object QryXcptDtlVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      DisplayWidth = 10
      FieldName = 'VENDORNO'
      Size = 10
    end
    object QryXcptDtlCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 17
      FieldName = 'COMPANY'
      Size = 60
    end
    object QryXcptDtlVENDOR_RECEIVE: TDateTimeField
      DisplayLabel = 'Vendor Receive'
      DisplayWidth = 18
      FieldName = 'VENDOR_RECEIVE'
    end
    object QryXcptDtlORIGIN: TStringField
      DisplayLabel = 'Origin'
      DisplayWidth = 10
      FieldName = 'ORIGIN'
      Visible = False
      Size = 10
    end
    object QryXcptDtlARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryXcptDtlVENDOR_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'VENDOR_ID'
      Visible = False
      Size = 0
    end
    object QryXcptDtlDIVISION_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'DIVISION_ID'
      Visible = False
      Size = 0
    end
    object QryXcptDtlPO_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PO_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object QryXcptDtlCOST_OBJECT_SOURCE: TStringField
      FieldName = 'COST_OBJECT_SOURCE'
      Visible = False
      Size = 12
    end
    object QryXcptDtlCOST_OBJECT_ID: TFMTBCDField
      FieldName = 'COST_OBJECT_ID'
      Visible = False
      Size = 38
    end
  end
  object QryWO: TFDQuery
    Tag = -1
    AfterOpen = RestoreGridAfterDataSetOpen
    BeforeClose = SaveGridBeforeDataSetClose
    AfterClose = SetGridColor
    OnCalcFields = QryWOCalcFields
    MasterSource = SrcXcptDtl
    MasterFields = 
      'MUST_ARRIVE;ARINVT_ID;COST_OBJECT_SOURCE;COST_OBJECT_ID;DIVISION' +
      '_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select h.workorder_id,'
      '       w.origin,'
      '       h.prod_date,'
      '       h.ptoper_id,'
      '       u.alternate_arinvt_id,'
      '       Sum(decode( u.qty_covered_by_day_use_id, '
      '                   null, decode( u.alternate_arinvt_id, '
      
        '                                 null, u.tot_mat_qty, u.alternat' +
        'e_qty), '
      '                   0)) as tot_mat_qty,'
      '       Sum(decode( u.qty_covered_by_day_use_id, '
      '                   null, u.hard_alloc_qty, '
      '                   0)) as hard_alloc_qty'
      '  from day_hrs h,'
      '       day_pts p,'
      '       day_use u,'
      '       workorder w, '
      '       params'
      'where p.day_hrs_id = h.id'
      '  and u.day_pts_id = p.id'
      '  and u.prod_date >= :must_arrive'
      '  and u.arinvt_id = :arinvt_id'
      
        '  and mat_po_xcpt.filter_cost_object( :cost_object_source, :cost' +
        '_object_id, h.cost_object_source, h.cost_object_id ) = 1'
      '  and (params.capacity_consolidate_div_req = '#39'Y'#39
      '       or'
      '       NVL(h.division_id,0) = NVL(:division_id,0))'
      '  and h.workorder_id = w.id(+)'
      
        '  and (NVL(params.fr_hide, '#39'N'#39') = '#39'N'#39' or  NVL(w.origin, '#39'*'#39') <> ' +
        #39'FORECAST'#39')'
      'group by '
      '      h.prod_date,'
      '      h.workorder_id,'
      '      w.origin,'
      
        '      decode( params.capacity_consolidate_div_req, '#39'Y'#39', null, h.' +
        'division_id ),'
      '      h.ptoper_id,'
      '      u.alternate_arinvt_id'
      'order by          '
      '      h.prod_date,'
      '      h.workorder_id')
    Left = 82
    Top = 144
    ParamData = <
      item
        Name = 'MUST_ARRIVE'
        DataType = ftDateTime
        ParamType = ptInput
        Size = 8
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
        Name = 'COST_OBJECT_SOURCE'
        DataType = ftString
        ParamType = ptInput
        Size = 13
        Value = Null
      end
      item
        Name = 'COST_OBJECT_ID'
        DataType = ftFMTBcd
        NumericScale = 38
        ParamType = ptInput
        Size = 34
        Value = Null
      end
      item
        Name = 'DIVISION_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryWOWORKORDER_ID: TBCDField
      FieldName = 'WORKORDER_ID'
      Origin = 'DAY_HRS.WORKORDER_ID'
      Size = 0
    end
    object QryWOPROD_DATE: TDateTimeField
      FieldName = 'PROD_DATE'
      Origin = 'DAY_HRS.PROD_DATE'
      DisplayFormat = 'ddddd'
    end
    object QryWOTOT_MAT_QTY: TFMTBCDField
      FieldName = 'TOT_MAT_QTY'
      Origin = 'DAY_USE.TOT_MAT_QTY'
      DisplayFormat = '########0.######'
      Size = 38
    end
    object QryWOORIGIN: TStringField
      FieldName = 'ORIGIN'
      Size = 10
    end
    object QryWOHARD_ALLOC_QTY: TFMTBCDField
      DisplayLabel = 'Hard Allocated'
      FieldName = 'HARD_ALLOC_QTY'
      Size = 38
    end
    object QryWOALTERNATE_ARINVT_ID: TBCDField
      FieldName = 'ALTERNATE_ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryWOAlternateItemNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'AlternateItemNo'
      Size = 25
      Calculated = True
    end
    object QryWOOpDesc: TStringField
      FieldKind = fkCalculated
      FieldName = 'OpDesc'
      Size = 60
      Calculated = True
    end
    object QryWOPTOPER_ID: TBCDField
      FieldName = 'PTOPER_ID'
      Size = 0
    end
    object QryWOOpNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'OpNo'
      Size = 30
      Calculated = True
    end
  end
  object QryOrders: TFDQuery
    Tag = -1
    AfterOpen = RestoreGridAfterDataSetOpen
    BeforeClose = SaveGridBeforeDataSetClose
    AfterClose = SetGridColor
    MasterSource = SrcWO
    MasterFields = 'WORKORDER_ID;PROD_DATE'
    DetailFields = 'WORKORDER_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select x.workorder_id,'
      '       rel.rel_date,'
      '       rel.rel_quan_disp as rel_quan,'
      '       rel.orderno,'
      '       rel.pono,'
      '       arinvt.itemno,'
      '       arinvt.descrip,'
      '       arinvt.rev,'
      '       arinvt.descrip2,'
      '       arcusto.custno,'
      '       arcusto.company,'
      '       arinvt.id as arinvt_id,'
      '       orders.id as orders_id,'
      '       ptorder.id as ptorder_id'
      '  from '
      '       (select distinct workorder_id, partno_id'
      '          from v_day_hrs_pts_use '
      '         where workorder_id = :workorder_id'
      '           and prod_date = :prod_date) x,'
      '       ptorder,'
      '       ptorder_rel rel,'
      '       partno,'
      '       arinvt,'
      '       orders,'
      '       arcusto'
      ' where '
      '       ptorder.workorder_id = x.workorder_id'
      '   and ptorder.partno_id = x.partno_id'
      '   and rel.ptorder_id = ptorder.id'
      '   and partno.id = x.partno_id'
      '   and arinvt.id = partno.arinvt_id'
      '   and RTrim(orders.orderno(+)) = RTrim(rel.orderno)'
      '   and arcusto.id(+) = orders.arcusto_id'
      ' '
      ' ')
    Left = 115
    Top = 143
    ParamData = <
      item
        Name = 'WORKORDER_ID'
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
      end>
    object QryOrdersWORKORDER_ID: TBCDField
      FieldName = 'WORKORDER_ID'
      Size = 0
    end
    object QryOrdersREL_DATE: TDateTimeField
      FieldName = 'REL_DATE'
    end
    object QryOrdersREL_QUAN: TBCDField
      FieldName = 'REL_QUAN'
      DisplayFormat = '#########0.00'
      Size = 2
    end
    object QryOrdersORDERNO: TStringField
      DisplayWidth = 10
      FieldName = 'ORDERNO'
      Size = 15
    end
    object QryOrdersPONO: TStringField
      FieldName = 'PONO'
      Size = 35
    end
    object QryOrdersITEMNO: TStringField
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryOrdersDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 100
    end
    object QryOrdersCUSTNO: TStringField
      FieldName = 'CUSTNO'
      Size = 10
    end
    object QryOrdersARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Size = 0
    end
    object QryOrdersORDERS_ID: TBCDField
      FieldName = 'ORDERS_ID'
      Size = 0
    end
    object QryOrdersREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 10
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
    object QryOrdersDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object QryOrdersCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Size = 60
    end
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmMatException'
    WebUse = False
    TouchScreen = False
    Left = 250
    Top = 56
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Material Exception List'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196836 $'
    BuildVersion = '176554'
    Left = 222
    Top = 58
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 278
    Top = 56
  end
  object PopupMenu1: TUniPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 413
    Top = 377
    object JumptoInventory1: TUniMenuItem
      Caption = 'Jump to Inventory'
      OnClick = JumptoInventory1Click
    end
    object JumpToInventoryLocationsTransactions1: TUniMenuItem
      Caption = 'Jump To Inventory Locations && Transactions'
      OnClick = JumpToInventoryLocationsTransactions1Click
    end
    object JumpToMPS1: TUniMenuItem
      Caption = 'Jump To MPS'
      OnClick = JumpToMPS1Click
    end
    object JumpToInventoryAvailability1: TUniMenuItem
      Caption = 'Jump To Inventory Availability'
      OnClick = JumpToInventoryAvailability1Click
    end
    object AlternateItem1: TUniMenuItem
      Caption = 'Alternate Item #'
      OnClick = AlternateItem1Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object VendorRFQ1: TUniMenuItem
      Caption = 'Vendor RFQ'
      OnClick = VendorRFQ1Click
    end
    object AddBatchToPOByVendor: TUniMenuItem
      Caption = 'Add to PO'
      OnClick = AddBatchToPOByVendorClick
    end
    object JumpToPoHistory1: TUniMenuItem
      Caption = 'Jump To PO History'
      OnClick = JumpToPoHistory1Click
    end
  end
  object PopupMenu2: TUniPopupMenu
    Left = 441
    Top = 378
    object JumptoWO1: TUniMenuItem
      Caption = 'Jump to WO'
      OnClick = JumptoWO1Click
    end
  end
  object PopupMenu3: TUniPopupMenu
    Left = 469
    Top = 378
    object JumptoSalesOrder1: TUniMenuItem
      Caption = 'Jump to Sales Order'
      OnClick = JumptoSalesOrder1Click
    end
    object JumptoInventory2: TUniMenuItem
      Caption = 'Jump to Inventory'
      OnClick = JumptoInventory2Click
    end
  end
  object IQJumpInv1: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = wwSrcXcpItems
    JumpTo = jtInventory
    Left = 413
    Top = 406
  end
  object IQJumpWO: TIQWebJump
    DataField = 'WORKORDER_ID'
    DataSource = SrcWO
    JumpTo = jtWorkOrder
    Left = 441
    Top = 406
  end
  object IQJumpInv2: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = SrcOrders
    JumpTo = jtInventory
    Left = 469
    Top = 406
  end
  object IQJumpOE: TIQWebJump
    DataField = 'ORDERS_ID'
    DataSource = SrcOrders
    JumpTo = jtSalesOrder
    Left = 497
    Top = 406
  end
  object SrcMatReqItems: TDataSource
    DataSet = QryMatReqItems
    Left = 153
    Top = 85
  end
  object QryMatReqItems: TFDQuery
    Tag = 1
    BeforeOpen = AssignClassDivisionEPlantFilter
    Filtered = True
    Connection = UniMainModule.FDConnection1
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
      '       v.division_id,'
      '       v.standard_id,'
      '       d.name as division_name,'
      '       -- o.onhand'
      '       UOM.To_Native( o.onhand, a.unit, v.arinvt_id ) as onhand,'
      '       a.buyer_code_id,'
      '       buyer_code.buyer_code,'
      '       a.lead_days'
      '  from DAY_MAT_REQ v,'
      '       division d,'
      '       v_arinvt_division o,'
      '       arinvt a,'
      '       buyer_code,'
      '       (select distinct r.arinvt_id,'
      
        '                        decode( p.capacity_consolidate_div_req, ' +
        #39'Y'#39', -1, r.division_id) as division_id'
      '                   from v_po_releases r, params p'
      '                  where r.promise_date < Trunc(sysdate)'
      '                    and NVL(r.closed, '#39'N'#39') = '#39'N'#39
      '                    and r.qty_onorder > 0 ) po'
      '  where'
      '        v.arinvt_id = po.arinvt_id'
      '    and NVL(v.division_id,0) = NVL(po.division_id,0)'
      '    and v.arinvt_id = o.arinvt_id(+)'
      '    and NVL(v.division_id,0) = NVL(o.division_id(+),0)'
      '    and v.division_id = d.id(+)'
      '    and v.arinvt_id = a.id'
      '    and a.buyer_code_id = buyer_code.id(+)'
      '  group by v.class,'
      '           v.itemno,'
      '           v.descrip,'
      '           a.descrip2,'
      '           a.rev,'
      '           v.arinvt_id,'
      '           v.eplant_id,'
      '           v.division_id,'
      '           v.standard_id,'
      '           d.name,'
      '           --o.onhand'
      '           UOM.To_Native( o.onhand, a.unit, v.arinvt_id ),'
      '           a.buyer_code_id,'
      '           buyer_code.buyer_code,'
      '           a.lead_days'
      '')
    Left = 153
    Top = 101
    object QryMatReqItemsITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'v.itemno'
      Size = 50
    end
    object QryMatReqItemsDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 15
      FieldName = 'DESCRIP'
      Origin = 'V.DESCRIP'
      Size = 100
    end
    object QryMatReqItemsONHAND: TFMTBCDField
      DisplayLabel = 'On Hand'
      DisplayWidth = 9
      FieldName = 'ONHAND'
      Origin = 'UOM.To_Native( o.onhand, a.unit, v.arinvt_id )'
      DisplayFormat = '#########0.00'
      Size = 38
    end
    object QryMatReqItemsCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 7
      FieldName = 'CLASS'
      Origin = 'v.class'
      Size = 2
    end
    object QryMatReqItemsDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 16
      FieldName = 'DIVISION_NAME'
      Origin = 'd.name'
      Size = 25
    end
    object QryMatReqItemsBUYER_CODE: TStringField
      DisplayLabel = 'Buyer Code'
      DisplayWidth = 10
      FieldName = 'BUYER_CODE'
      Origin = 'buyer_code.buyer_code'
      Size = 10
    end
    object QryMatReqItemsREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'a.rev'
      FixedChar = True
      Size = 15
    end
    object QryMatReqItemsDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Origin = 'a.descrip2'
      Size = 100
    end
    object QryMatReqItemsLEAD_DAYS: TBCDField
      DisplayLabel = 'Lead Days'
      DisplayWidth = 10
      FieldName = 'LEAD_DAYS'
      Origin = 'a.lead_days'
      Size = 0
    end
    object QryMatReqItemsEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'v.EPLANT_ID'
      Visible = False
      Size = 0
    end
    object QryMatReqItemsDIVISION_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'DIVISION_ID'
      Origin = 'v.DIVISION_ID'
      Visible = False
      Size = 0
    end
    object QryMatReqItemsSTANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'STANDARD_ID'
      Origin = 'v.STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QryMatReqItemsARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryMatReqItemsBUYER_CODE_ID: TBCDField
      FieldName = 'BUYER_CODE_ID'
      Origin = 'a.buyer_code_id'
      Visible = False
      Size = 0
    end
  end
  object SrcPastDuePOs: TDataSource
    DataSet = QryPastDuePOs
    Left = 187
    Top = 85
  end
  object QryPastDuePOs: TFDQuery
    Tag = 1
    MasterSource = SrcMatReqItems
    MasterFields = 'ARINVT_ID;DIVISION_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select p.id as po_id,'
      '       p.pono as pono,'
      '       p.vendor_id as vendor_id,'
      '       p.po_date as po_date,'
      '       v.company as company,'
      '       d.id as detail_id,'
      '       d.seq,'
      
        '       UOM.To_Native( d.total_qty_ord, d.unit, d.arinvt_id ) as ' +
        'blanket_qty,'
      '       -- d.total_qty_ord as blanket_qty,'
      
        '       UOM.To_Native( total.quan, d.unit, d.arinvt_id ) as total' +
        '_releases,'
      '       d.misc_item as misc_item,'
      
        '       UOM.To_Native( r.qty_received, d.unit, d.arinvt_id ) as q' +
        'ty_received,'
      
        '       UOM.To_Native( NVL(total.quan, 0) - NVL(r.qty_received, 0' +
        '), d.unit, d.arinvt_id ) as Left_To_Receive,'
      '       d.unit'
      '  from po p,'
      '       po_detail d,'
      '       vendor v,'
      '       c_po_receipts_total r,'
      '       c_po_releases_total total'
      ' where d.arinvt_id = :arinvt_id'
      
        '   and iqcapacity.check_consolidate_division_id( NVL(d.division_' +
        'id,0)) = NVL(:division_id,0)'
      '   and NVL(d.closed, '#39'N'#39') = '#39'N'#39
      '   and d.id = total.po_detail_id(+)'
      '   and exists'
      '         (select 1 from po_releases'
      '            where po_releases.po_detail_id = d.id'
      '              and po_releases.promise_date < Trunc( sysdate ))'
      '   and p.vendor_id = v.id(+)'
      '   and p.id = d.po_id(+)'
      '   and d.id = r.po_detail_id(+)'
      '   and NVL(total.quan, 0) - NVL(r.qty_received, 0) > 0'
      ' order by p.po_date'
      ' '
      ' '
      '  '
      ''
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 185
    Top = 101
    ParamData = <
      item
        Name = 'ARINVT_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 1486220000c
      end
      item
        Name = 'DIVISION_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = -10000c
      end>
    object QryPastDuePOsPO_ID: TBCDField
      FieldName = 'PO_ID'
      Size = 0
    end
    object QryPastDuePOsSEQ: TBCDField
      FieldName = 'SEQ'
      Size = 0
    end
    object QryPastDuePOsPONO: TStringField
      FieldName = 'PONO'
      Size = 35
    end
    object QryPastDuePOsVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Size = 0
    end
    object QryPastDuePOsPO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object QryPastDuePOsCOMPANY: TStringField
      FieldName = 'COMPANY'
      Size = 60
    end
    object QryPastDuePOsDETAIL_ID: TBCDField
      FieldName = 'DETAIL_ID'
      Size = 0
    end
    object QryPastDuePOsMISC_ITEM: TStringField
      FieldName = 'MISC_ITEM'
      Size = 100
    end
    object QryPastDuePOsQTY_RECEIVED: TFMTBCDField
      FieldName = 'QTY_RECEIVED'
      DisplayFormat = '#########0.00'
      Size = 38
    end
    object QryPastDuePOsLEFT_TO_RECEIVE: TFMTBCDField
      FieldName = 'LEFT_TO_RECEIVE'
      DisplayFormat = '#########0.00'
      Size = 38
    end
    object QryPastDuePOsBLANKET_QTY: TFMTBCDField
      FieldName = 'BLANKET_QTY'
      DisplayFormat = '#########0.00'
      Size = 38
    end
    object QryPastDuePOsTOTAL_RELEASES: TFMTBCDField
      FieldName = 'TOTAL_RELEASES'
      DisplayFormat = '#########0.00'
      Size = 38
    end
    object QryPastDuePOsUNIT: TStringField
      DisplayLabel = 'PO Uom'
      FieldName = 'UNIT'
      Size = 10
    end
  end
  object PopupMenu4: TUniPopupMenu
    OnPopup = PopupMenu4Popup
    Left = 328
    Top = 378
    object JumptoInventory3: TUniMenuItem
      Caption = 'Jump to Inventory'
      OnClick = JumptoInventory3Click
    end
  end
  object IQJumpInv3: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = SrcMatReqItems
    JumpTo = jtInventory
    Left = 329
    Top = 406
  end
  object PopupMenu5: TUniPopupMenu
    OnPopup = PopupMenu5Popup
    Left = 357
    Top = 378
    object JumptoPO1: TUniMenuItem
      Caption = 'Jump to PO'
      OnClick = JumptoPO1Click
    end
  end
  object IQJumpPO1: TIQWebJump
    DataField = 'DETAIL_ID'
    DataSource = SrcPastDuePOs
    JumpTo = jtPO
    Left = 357
    Top = 406
  end
  object popmXcptDtl: TUniPopupMenu
    OnPopup = popmXcptDtlPopup
    Left = 385
    Top = 378
    object AddtoPO1: TUniMenuItem
      Caption = 'Add to PO - Item'
      OnClick = AddtoPOItem1Click
    end
    object AddtoPOvendor1: TUniMenuItem
      Caption = 'Add to PO - Vendor'
      OnClick = AddtoPOVendor1Click
    end
    object DRPDemand1: TUniMenuItem
      Caption = '&DRP Demand'
      OnClick = DRPDemand1Click
    end
    object ShowAllVendorPriceBreaks1: TUniMenuItem
      Caption = 'Show All Vendor Price Breaks'
      OnClick = ShowAllVendorPriceBreaks1Click
    end
    object N4: TUniMenuItem
      Caption = '-'
    end
    object JumptoPO2: TUniMenuItem
      Caption = 'Jump to PO'
      OnClick = JumptoPO2Click
    end
  end
  object PKPOrders: TIQWebHpick
    BeforeOpen = PKPOrdersBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select p.id as id,'
      '       p.pono as pono,'
      '       p.vendor_id as vendor_id,'
      '       p.po_date as po_date,'
      '       v.company as company,'
      '       d.total_qty_ord as total_ordered,'
      '       r.request_date as required_date,'
      '       r.promise_date as promised_date,'
      '       r.quan as release_qty,'
      '       d.id as po_detail_id,'
      '       d.division_id as division_id,'
      '       d.closed'
      '  from po p,'
      '       po_detail d,'
      '       vendor v,'
      '       po_releases r'
      'where p.vendor_id = v.id(+)'
      '  and d.po_id(+) = p.id'
      '  and d.arinvt_id = :arinvt_id'
      
        '  and mat_po_xcpt.filter_cost_object( :cost_object_source, :cost' +
        '_object_id, d.cost_object_source, d.cost_object_id ) = 1'
      '  and d.id = r.po_detail_id(+)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    OnIQModify = PKPOrdersIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 339
    Top = 57
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'cost_object_source'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'cost_object_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PKPOrdersPONO: TStringField
      DisplayLabel = 'PO#'
      FieldName = 'PONO'
      Size = 35
    end
    object PKPOrdersPO_DATE: TDateTimeField
      DisplayLabel = 'PO Date'
      FieldName = 'PO_DATE'
    end
    object PKPOrdersCOMPANY: TStringField
      DisplayLabel = 'Vendor'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PKPOrdersID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PKPOrdersVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Visible = False
      Size = 0
    end
    object PKPOrdersTOTAL_ORDERED: TBCDField
      DisplayLabel = 'Total Ordered'
      FieldName = 'TOTAL_ORDERED'
    end
    object PKPOrdersREQUIRED_DATE: TDateTimeField
      DisplayLabel = 'Required Date'
      FieldName = 'REQUIRED_DATE'
    end
    object PKPOrdersPROMISED_DATE: TDateTimeField
      DisplayLabel = 'Promised Date'
      FieldName = 'PROMISED_DATE'
    end
    object PKPOrdersPO_DETAIL_ID: TBCDField
      FieldName = 'PO_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object PKPOrdersDIVISION_ID: TBCDField
      FieldName = 'DIVISION_ID'
      Visible = False
      Size = 0
    end
    object PKPOrdersRELEASE_QTY: TBCDField
      DisplayLabel = 'Release Quantity'
      FieldName = 'RELEASE_QTY'
    end
    object PKPOrdersCLOSED: TStringField
      DisplayLabel = 'Closed'
      FieldName = 'CLOSED'
      Origin = 'CLOSED'
      FixedChar = True
      Size = 1
    end
  end
  object PkItems: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as arinvt_id,'
      '       class,'
      '       itemno,'
      '       rev,'
      '       descrip  '
      '  from arinvt'
      ''
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 310
    Top = 57
    object PkItemsARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object PkItemsCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Size = 2
    end
    object PkItemsITEMNO: TStringField
      DisplayLabel = 'Item#'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkItemsREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 5
      FieldName = 'REV'
      Size = 15
    end
    object PkItemsDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 100
    end
  end
  object SrcBelowMin: TDataSource
    DataSet = QryBelowMin
    Left = 152
    Top = 132
  end
  object QryBelowMin: TFDQuery
    Tag = 2
    BeforeOpen = AssignClassDivisionEPlantFilter
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.id as arinvt_id,'
      '       a.class,'
      '       a.itemno,'
      '       a.rev,'
      '       a.descrip, '
      '       a.descrip2, '
      '       '
      
        '       decode( auto_mrp.is_po_inv_by_div( a.id, o.division_id ),' +
        ' 2, div.safety_stock,  0, a.safety_stock,  1) as safety_stock,'
      
        '       decode( auto_mrp.is_po_inv_by_div( a.id, o.division_id ),' +
        ' 2, div.min_order_qty, 0, a.min_order_qty, 0) as min_order_qty,'
      
        '       decode( auto_mrp.is_po_inv_by_div( a.id, o.division_id ),' +
        ' 2, div.max_order_qty, 0, a.max_order_qty, 0) as max_order_qty,'
      '       '
      '       a.unit as arinvt_unit,'
      '       a.standard_id,'
      ''
      '       -- o.onhand,'
      '       case nvl(params.capacity_consolidate_div_req, '#39'N'#39') '
      '         when '#39'N'#39' then div_total.onhand'
      '         else a.onhand'
      '       end as onhand,'
      '       '
      '       o.division_id,'
      '       d.name as division_name,'
      '       '
      '       a.unit as UOM,'
      '       a.eplant_id,'
      '       a.buyer_code_id,'
      '       buyer_code.buyer_code,'
      '       v.vendorno,'
      '       v.company,'
      '       v.id as vendor_id,'
      ''
      '       -- on order'
      '       case auto_mrp.is_po_inv_by_div( a.id, o.division_id )'
      
        '            when 0 then auto_mrp.get_po_on_order_by_div( a.id, -' +
        '1 )'
      
        '            else        auto_mrp.get_po_on_order_by_div( a.id, o' +
        '.division_id )'
      '       end as on_order,'
      ''
      '       -- po required'
      
        '       decode( sign( case auto_mrp.is_po_inv_by_div( a.id, o.div' +
        'ision_id )'
      
        '                       when 0 then nvl(a.safety_stock,0)   - nvl' +
        '(a.onhand,0)         - auto_mrp.get_po_on_order_by_div( a.id, -1' +
        ' ) '
      
        '                       when 1 then 0                       - nvl' +
        '(div_total.onhand,0) - auto_mrp.get_po_on_order_by_div( a.id, o.' +
        'division_id ) '
      
        '                       when 2 then nvl(div.safety_stock,0) - nvl' +
        '(div_total.onhand,0) - auto_mrp.get_po_on_order_by_div( a.id, o.' +
        'division_id ) '
      '                     end ),'
      '               1, '#39'Y'#39', '#39' '#39' ) as po_required,'
      '               '
      '       a.lead_days,'
      
        '       (select sum(nvl(onhand,0)) from fgmulti where arinvt_id =' +
        ' a.id and exists (select 1 from workorder_bom_mat_loc where fgmu' +
        'lti_id = fgmulti.id)) as hard_alloc'
      '  from '
      '       arinvt a,'
      '       '
      '       -- v_arinvt_division o,'
      
        '       (select a.id as arinvt_id, -1 as division_id from arinvt ' +
        'a, params p where nvl(p.capacity_consolidate_div_req, '#39'N'#39') = '#39'Y'#39 +
        ' '
      '          union'
      
        '        select arinvt_id, division_id from v_arinvt_division, pa' +
        'rams p where nvl(p.capacity_consolidate_div_req, '#39'N'#39') <> '#39'Y'#39'    ' +
        '-- total by division'
      '          union'
      
        '        select arinvt_id, division_id from arinvt_division, para' +
        'ms p where nvl(p.capacity_consolidate_div_req, '#39'N'#39') <> '#39'Y'#39' ) o, ' +
        '-- inventory setup by division'
      '       '
      '       division d,'
      '       buyer_code,'
      '       '
      '       -- aka vendor'
      '       ( select distinct arinvt_id, vendor_id'
      '           from arinvt_vendors av1'
      '          where NVL(seq,1) in '
      
        '                        ( select Min( NVL( av2.seq, 1)) from ari' +
        'nvt_vendors av2 '
      
        '                          where av1.arinvt_id = av2.arinvt_id ))' +
        ' x,'
      '       vendor v,'
      ''
      '       -- po inv params setup by division'
      '       arinvt_division div,'
      '     '
      '       -- totals by division'
      '       v_arinvt_division div_total,'
      ''
      '       params'
      '       '
      ' where '
      '       a.id = o.arinvt_id(+)'
      '   and a.standard_id is NULL'
      '   and NVL(a.pk_hide, '#39'N'#39') = '#39'N'#39
      ''
      '       -- only look at records with safety_stock assigned'
      
        '   and decode( auto_mrp.is_po_inv_by_div( a.id, o.division_id ),' +
        ' 2, nvl(div.safety_stock,0), 0, nvl(a.safety_stock,0), 0) > 0'
      ''
      '       -- eval on hand below minimum. exclude hard allocated'
      '   and case auto_mrp.is_po_inv_by_div( a.id, o.division_id )'
      
        '          when 0 then nvl(a.onhand,0) - hard_alloc.get_hard_allo' +
        'c_on_hand_div( a.id, -1 ) - nvl(a.safety_stock,0)    /* no setup' +
        ' */'
      
        '          when 1 then nvl(div_total.onhand,0) - hard_alloc.get_h' +
        'ard_alloc_on_hand_div( a.id, o.division_id ) - 0     /* division' +
        ' without setup */'
      
        '          when 2 then nvl(div_total.onhand,0) - hard_alloc.get_h' +
        'ard_alloc_on_hand_div( a.id, o.division_id ) - nvl(div.safety_st' +
        'ock,0)   /* division with setup */ '
      '       end < 0'
      '   '
      '   and o.division_id = d.id(+)'
      '   and a.buyer_code_id = buyer_code.id(+)'
      ''
      '       -- vendor'
      '   and a.id = x.arinvt_id(+)'
      '   and x.vendor_id = v.id(+)'
      ''
      '       -- po params by division'
      '   and o.arinvt_id = div.arinvt_id(+)'
      '   and o.division_id = div.division_id(+)    '
      '   '
      '       -- division_onhand'
      '   and o.arinvt_id = div_total.arinvt_id(+)'
      '   and nvl(o.division_id,0) = nvl(div_total.division_id(+),0) '
      '')
    Left = 151
    Top = 144
    object QryBelowMinCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      Origin = 'a.class'
      Size = 2
    end
    object QryBelowMinITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 18
      FieldName = 'ITEMNO'
      Origin = 'a.itemno'
      Size = 50
    end
    object QryBelowMinREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 6
      FieldName = 'REV'
      Origin = 'A.REV'
      Size = 15
    end
    object QryBelowMinDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 21
      FieldName = 'DESCRIP'
      Origin = 'A.DESCRIP'
      Size = 100
    end
    object QryBelowMinONHAND: TFMTBCDField
      DisplayLabel = 'On Hand'
      DisplayWidth = 9
      FieldName = 'ONHAND'
      Origin = 'div_total.onhand'
      DisplayFormat = '#########0.00'
      Size = 38
    end
    object QryBelowMinSAFETY_STOCK: TFMTBCDField
      DisplayLabel = 'Reorder Point'
      DisplayWidth = 10
      FieldName = 'SAFETY_STOCK'
      Origin = 
        'decode( auto_mrp.is_po_inv_by_div( a.id, o.division_id ), 2, div' +
        '.safety_stock,  a.safety_stock)'
      Size = 38
    end
    object QryBelowMinMIN_ORDER_QTY: TFMTBCDField
      DisplayLabel = 'Minimum Order'
      DisplayWidth = 11
      FieldName = 'MIN_ORDER_QTY'
      Origin = 
        'decode( auto_mrp.is_po_inv_by_div( a.id, o.division_id ), 2, div' +
        '.min_order_qty, a.min_order_qty)'
      DisplayFormat = '#########0.00'
      Size = 38
    end
    object QryBelowMinMAX_ORDER_QTY: TFMTBCDField
      DisplayLabel = 'Maximum Order'
      DisplayWidth = 12
      FieldName = 'MAX_ORDER_QTY'
      Origin = 
        'decode( auto_mrp.is_po_inv_by_div( a.id, o.division_id ), 2, div' +
        '.max_order_qty, a.max_order_qty)'
      DisplayFormat = '#########0.00'
      Size = 38
    end
    object QryBelowMinUOM: TStringField
      DisplayWidth = 10
      FieldName = 'UOM'
      Origin = 'a.unit'
      Size = 10
    end
    object QryBelowMinDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 14
      FieldName = 'DIVISION_NAME'
      Origin = 'd.name'
      Size = 25
    end
    object QryBelowMinBUYER_CODE: TStringField
      DisplayLabel = 'Buyer Code'
      DisplayWidth = 10
      FieldName = 'BUYER_CODE'
      Origin = 'buyer_code.buyer_code'
      Size = 10
    end
    object QryBelowMinVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      DisplayWidth = 10
      FieldName = 'VENDORNO'
      Origin = 'v.vendorno'
      FixedChar = True
      Size = 10
    end
    object QryBelowMinCOMPANY: TStringField
      DisplayLabel = 'Vendor Name'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Origin = 'v.company'
      FixedChar = True
      Size = 60
    end
    object QryBelowMinON_ORDER: TFMTBCDField
      DisplayLabel = 'On Order'
      DisplayWidth = 15
      FieldName = 'ON_ORDER'
      Origin = 
        'case auto_mrp.is_po_inv_by_div( a.id, o.division_id ) when 0 the' +
        'n auto_mrp.get_po_on_order_by_div( a.id, -1 ) else        auto_m' +
        'rp.get_po_on_order_by_div( a.id, o.division_id ) end '
      DisplayFormat = '#########.######'
      Size = 38
    end
    object QryBelowMinPO_REQUIRED: TStringField
      DisplayLabel = 'PO Required'
      DisplayWidth = 11
      FieldName = 'PO_REQUIRED'
      Origin = 
        'decode( sign( case auto_mrp.is_po_inv_by_div( a.id, o.division_i' +
        'd ) when 0 then nvl(a.safety_stock,0)   - nvl(a.onhand,0)       ' +
        '   - auto_mrp.get_po_on_order_by_div( a.id, -1 ) when 1 then nvl' +
        '(a.safety_stock,0)   - nvl(div_total.onhand,0) - auto_mrp.get_po' +
        '_on_order_by_div( a.id, o.division_id ) when 2 then nvl(div.safe' +
        'ty_stock,0) - nvl(div_total.onhand,0) - auto_mrp.get_po_on_order' +
        '_by_div( a.id, o.division_id ) end ), 1, '#39'Y'#39', '#39' '#39' )'
      Size = 1
    end
    object QryBelowMinDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Origin = 'a.descrip2'
      Size = 100
    end
    object QryBelowMinLEAD_DAYS: TBCDField
      DisplayLabel = 'Lead Days'
      DisplayWidth = 10
      FieldName = 'LEAD_DAYS'
      Size = 0
    end
    object QryBelowMinHARD_ALLOC: TFMTBCDField
      DisplayLabel = 'Hard Allocated'
      DisplayWidth = 14
      FieldName = 'HARD_ALLOC'
      Origin = 
        '(select sum(nvl(onhand,0)) from fgmulti where arinvt_id = a.id a' +
        'nd exists (select 1 from workorder_bom_mat_loc where fgmulti_id ' +
        '= fgmulti.id)) '
      Size = 38
    end
    object QryBelowMinARINVT_UNIT: TStringField
      DisplayWidth = 10
      FieldName = 'ARINVT_UNIT'
      Origin = 'a.unit'
      Visible = False
      Size = 10
    end
    object QryBelowMinEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'a.eplant_id'
      Visible = False
      Size = 0
    end
    object QryBelowMinDIVISION_ID: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'DIVISION_ID'
      Origin = 'o.division_id'
      Visible = False
      Size = 38
    end
    object QryBelowMinSTANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'STANDARD_ID'
      Origin = 'a.standard_id'
      Visible = False
      Size = 0
    end
    object QryBelowMinARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'a.id'
      Visible = False
      Size = 0
    end
    object QryBelowMinBUYER_CODE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'BUYER_CODE_ID'
      Origin = 'a.buyer_code_id'
      Visible = False
      Size = 0
    end
    object QryBelowMinVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Origin = 'VENDOR_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object popmBelowMin: TUniPopupMenu
    Left = 529
    Top = 386
    object AddtoPO2: TUniMenuItem
      Caption = 'Add to PO - Item'
      OnClick = AddtoPOItem1Click
    end
    object AddtoPOvendor2: TUniMenuItem
      Caption = 'Add to PO - Vendor'
      OnClick = AddtoPOVendor1Click
    end
    object N3: TUniMenuItem
      Caption = '-'
    end
    object JumptoInventory4: TUniMenuItem
      Caption = 'Jump to Inventory'
      OnClick = JumptoInventory4Click
    end
    object ShowPOs1: TUniMenuItem
      Caption = 'Show POs'
      OnClick = ShowPOs1Click
    end
  end
  object IQJumpInv: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = SrcBelowMin
    JumpTo = jtInventory
    Left = 529
    Top = 406
  end
  object SrcV_Exist_Ideal: TDataSource
    DataSet = QryV_Exist_Ideal
    Left = 113
    Top = 179
  end
  object QryV_Exist_Ideal: TFDQuery
    Tag = -1
    BeforeOpen = QryV_Exist_IdealBeforeOpen
    AfterOpen = RestoreGridAfterDataSetOpen
    BeforeClose = SaveGridBeforeDataSetClose
    AfterClose = SetGridColor
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.arinvt_id,'
      '       v.ideal_qty,'
      '       v.must_arrive,'
      '       UOM.To_Native( v.po_qty, d.unit, v.arinvt_id ) as po_qty,'
      
        '       UOM.IQConvert( d.unit, a.unit, v.po_qty, v.arinvt_id, '#39'Y'#39 +
        ' ) as po_qty_inv_uom,'
      '       v.action,'
      '       v.po_detail_id as detail_id,'
      ''
      '       -- po details'
      '       h.pono as pono, '
      '       d.seq as seq, '
      
        '       UOM.To_Native( greatest(0, NVL( po_rel.quan, 0) - NVL(p.q' +
        'ty_received, 0)), d.unit, v.arinvt_id) as total_qty_ord,'
      
        '       UOM.IQConvert( d.unit, a.unit, greatest(0, NVL( po_rel.qu' +
        'an, 0) - NVL(p.qty_received, 0)), v.arinvt_id, '#39'Y'#39' ) as total_qt' +
        'y_ord_inv_uom,'
      '       vendor.company as vendor_company, '
      '       '
      '       v.division_id,'
      '       v.should_arrive,'
      '       v.cost_object_source,'
      '       v.cost_object_id,'
      ''
      
        '       nvl((select to_char(seq) from po_releases where id = v.po' +
        '_releases_id), '#39'N/A'#39') as po_releases_seq,'
      
        '       (select promise_date from po_releases where id = v.po_rel' +
        'eases_id) as promise_date'
      '       '
      '  from v_po_exist_ideal_dtl v,'
      '       PO h, '
      '       PO_DETAIL d, '
      '       VENDOR, '
      '       c_po_releases_total po_rel, '
      '       C_PO_RECEIPTS_TOTAL p,'
      '       arinvt a,'
      '       params'
      ' where '
      '       v.arinvt_id = :arinvt_id'
      '   and ( nvl(params.capacity_consolidate_div_req, '#39'N'#39') = '#39'Y'#39
      '         or'
      '         NVL(v.division_id,0) = :division_id )'
      
        '   and mat_po_xcpt.filter_cost_object( :cost_object_source, :cos' +
        't_object_id, v.cost_object_source, v.cost_object_id ) = 1'
      '   '
      '   -- link in po details'
      '   and v.po_detail_id = d.id(+)'
      '   and d.po_id = h.id(+)'
      '   and h.vendor_id = vendor.id(+) '
      '   and d.id = p.po_detail_id(+) '
      '   and d.id = po_rel.po_detail_id(+) '
      '   and v.arinvt_id = a.id(+)'
      ' order by '
      '       v.must_arrive'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 112
    Top = 193
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'division_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'cost_object_source'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'cost_object_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryV_Exist_IdealIDEAL_QTY: TFMTBCDField
      DisplayLabel = 'Ideal Quantity'
      DisplayWidth = 8
      FieldName = 'IDEAL_QTY'
      Origin = 'V_PO_EXIST_IDEAL.IDEAL_QTY'
      DisplayFormat = '#########0.00'
      Size = 38
    end
    object QryV_Exist_IdealMUST_ARRIVE: TDateTimeField
      DisplayLabel = 'Must Arrive'
      DisplayWidth = 15
      FieldName = 'MUST_ARRIVE'
      Origin = 'V_PO_EXIST_IDEAL.MUST_ARRIVE'
    end
    object QryV_Exist_IdealSHOULD_ARRIVE: TDateTimeField
      DisplayLabel = 'Should Arrive'
      DisplayWidth = 14
      FieldName = 'SHOULD_ARRIVE'
    end
    object QryV_Exist_IdealPO_QTY: TFMTBCDField
      DisplayLabel = 'Quantity on PO'
      DisplayWidth = 10
      FieldName = 'PO_QTY'
      Origin = 'V_PO_EXIST_IDEAL.PO_QTY'
      DisplayFormat = '#########0.00'
      Size = 38
    end
    object QryV_Exist_IdealACTION: TStringField
      DisplayLabel = 'Suggested Action'
      DisplayWidth = 44
      FieldName = 'ACTION'
      Origin = 'V_PO_EXIST_IDEAL.ACTION'
      Size = 200
    end
    object QryV_Exist_IdealPONO: TStringField
      DisplayWidth = 15
      FieldName = 'PONO'
      Visible = False
      Size = 35
    end
    object QryV_Exist_IdealSEQ: TBCDField
      DisplayWidth = 10
      FieldName = 'SEQ'
      Visible = False
      Size = 0
    end
    object QryV_Exist_IdealTOTAL_QTY_ORD: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'TOTAL_QTY_ORD'
      Visible = False
      DisplayFormat = '#########0.00'
      Size = 38
    end
    object QryV_Exist_IdealVENDOR_COMPANY: TStringField
      DisplayWidth = 30
      FieldName = 'VENDOR_COMPANY'
      Visible = False
      Size = 60
    end
    object QryV_Exist_IdealDETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'DETAIL_ID'
      Visible = False
      Size = 0
    end
    object QryV_Exist_IdealPROMISE_DATE: TDateTimeField
      DisplayLabel = 'Promise Date'
      DisplayWidth = 18
      FieldName = 'PROMISE_DATE'
      Visible = False
    end
    object QryV_Exist_IdealDIVISION_ID: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'DIVISION_ID'
      Visible = False
      Size = 38
    end
    object QryV_Exist_IdealARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'V_PO_EXIST_IDEAL.ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryV_Exist_IdealCOST_OBJECT_SOURCE: TStringField
      FieldName = 'COST_OBJECT_SOURCE'
      Visible = False
      Size = 50
    end
    object QryV_Exist_IdealCOST_OBJECT_ID: TFMTBCDField
      FieldName = 'COST_OBJECT_ID'
      Visible = False
      Size = 38
    end
    object QryV_Exist_IdealPO_QTY_INV_UOM: TFMTBCDField
      FieldName = 'PO_QTY_INV_UOM'
      Size = 38
    end
    object QryV_Exist_IdealTOTAL_QTY_ORD_INV_UOM: TFMTBCDField
      FieldName = 'TOTAL_QTY_ORD_INV_UOM'
      Size = 38
    end
    object QryV_Exist_IdealPO_RELEASES_SEQ: TStringField
      DisplayLabel = 'Release #'
      FieldName = 'PO_RELEASES_SEQ'
      Size = 40
    end
  end
  object wwSrcExist_Ideal_Items: TDataSource
    DataSet = wwQryExist_Ideal_Items
    Left = 80
    Top = 179
  end
  object wwQryExist_Ideal_Items: TFDQuery
    Tag = 4
    BeforeOpen = AssignClassDivisionEPlantFilter
    AfterOpen = wwQryExist_Ideal_ItemsAfterOpen
    AfterScroll = wwQryExist_Ideal_ItemsAfterScroll
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct v.arinvt_id,'
      
        '       decode( nvl(params.capacity_consolidate_div_req, '#39'N'#39'), '#39'Y' +
        #39', -1, v.division_id ) as division_id,'
      
        '       decode( nvl(params.capacity_consolidate_div_req, '#39'N'#39'), '#39'Y' +
        #39', '#39' '#39', d.name ) as division_name,'
      '       a.class,'
      '       a.itemno,'
      '       a.rev,'
      '       a.descrip,'
      '       a.descrip2,'
      '       a.unit, '
      '       --o.onhand,'
      
        '       uom.to_native( decode( nvl(params.capacity_consolidate_di' +
        'v_req, '#39'N'#39'),'
      '                              '#39'Y'#39', a.onhand,'
      
        '                              (select o.onhand from v_arinvt_div' +
        'ision o where v.arinvt_id = o.arinvt_id and NVL(v.division_id,0)' +
        ' = NVL(o.division_id,0))),'
      '                      unit, a.id ) as onhand,'
      ''
      
        '       RTrim(SubStr(UOM.Native_UOM_Ex(unit, a.id), 1, 10)) as UO' +
        'M,'
      '       a.standard_id,'
      '       a.eplant_id,'
      
        '       decode( v.cost_object_source, '#39'JOBSHOP_TASK'#39', '#39'JobShop Ta' +
        'sk ID '#39'|| v.cost_object_id, NULL ) as cost_object,'
      '       v.cost_object_source,'
      '       v.cost_object_id,'
      '       a.buyer_code_id,'
      '       buyer_code.buyer_code,'
      '       a.lead_days'
      '  from v_po_exist_ideal_dtl v,'
      '       arinvt a,'
      '       -- v_arinvt_division o,'
      '       division d,'
      '       buyer_code,'
      '       params'
      ' where v.arinvt_id = a.id'
      ''
      '   and v.division_id = d.id(+)'
      '   and a.buyer_code_id = buyer_code.id(+)'
      ' '
      '/* START SUGGESTED_ACTION FILTER */'
      ''
      '/* END SUGGESTED_ACTION FILTER */'
      ''
      '')
    Left = 79
    Top = 192
    object wwQryExist_Ideal_ItemsCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      Origin = 'A.CLASS'
      Size = 2
    end
    object wwQryExist_Ideal_ItemsITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 14
      FieldName = 'ITEMNO'
      Origin = 'A.ITEMNO'
      Size = 50
    end
    object wwQryExist_Ideal_ItemsREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 4
      FieldName = 'REV'
      Origin = 'A.REV'
      Size = 15
    end
    object wwQryExist_Ideal_ItemsDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 21
      FieldName = 'DESCRIP'
      Origin = 'A.DESCRIP'
      Size = 100
    end
    object wwQryExist_Ideal_ItemsUNIT: TStringField
      DisplayLabel = 'Unit'
      DisplayWidth = 4
      FieldName = 'UNIT'
      Origin = 'A.UNIT'
      Size = 10
    end
    object wwQryExist_Ideal_ItemsONHAND: TFMTBCDField
      DisplayLabel = 'On Hand'
      DisplayWidth = 8
      FieldName = 'ONHAND'
      DisplayFormat = '#########0.00'
      Size = 38
    end
    object wwQryExist_Ideal_ItemsUOM: TStringField
      DisplayWidth = 6
      FieldName = 'UOM'
      Origin = 'RTrim(SubStr(UOM.Native_UOM( A.unit ), 1, 10))'
      Size = 10
    end
    object wwQryExist_Ideal_ItemsDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 12
      FieldName = 'DIVISION_NAME'
      Origin = 
        'decode( nvl(params.capacity_consolidate_div_req, '#39'N'#39'), '#39'Y'#39', '#39' '#39',' +
        ' d.name )'
      Size = 25
    end
    object wwQryExist_Ideal_ItemsCOST_OBJECT: TStringField
      DisplayLabel = 'Cost Object'
      DisplayWidth = 16
      FieldName = 'COST_OBJECT'
      Origin = 
        'decode( v.cost_object_source, '#39'JOBSHOP_TASK'#39', '#39'JobShop Task ID '#39 +
        '|| v.cost_object_id, NULL )'
      Size = 56
    end
    object wwQryExist_Ideal_ItemsBUYER_CODE: TStringField
      DisplayLabel = 'Buyer Code'
      DisplayWidth = 10
      FieldName = 'BUYER_CODE'
      Origin = 'BUYER_CODE.BUYER_CODE'
      Size = 10
    end
    object wwQryExist_Ideal_ItemsDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Origin = 'a.descrip2'
      Size = 100
    end
    object wwQryExist_Ideal_ItemsLEAD_DAYS: TBCDField
      DisplayLabel = 'Lead Days'
      DisplayWidth = 10
      FieldName = 'LEAD_DAYS'
      Size = 0
    end
    object wwQryExist_Ideal_ItemsARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'V.ARINVT_ID'
      Visible = False
      Size = 0
    end
    object wwQryExist_Ideal_ItemsSTANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'STANDARD_ID'
      Origin = 'A.STANDARD_ID'
      Visible = False
      Size = 0
    end
    object wwQryExist_Ideal_ItemsEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'a.eplant_id'
      Visible = False
      Size = 0
    end
    object wwQryExist_Ideal_ItemsDIVISION_ID: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'DIVISION_ID'
      Origin = 'v.division_id'
      Visible = False
      Size = 38
    end
    object wwQryExist_Ideal_ItemsCOST_OBJECT_SOURCE: TStringField
      FieldName = 'COST_OBJECT_SOURCE'
      Visible = False
      Size = 50
    end
    object wwQryExist_Ideal_ItemsCOST_OBJECT_ID: TFMTBCDField
      FieldName = 'COST_OBJECT_ID'
      Visible = False
      Size = 38
    end
    object wwQryExist_Ideal_ItemsBUYER_CODE_ID: TBCDField
      FieldName = 'BUYER_CODE_ID'
      Visible = False
      Size = 0
    end
  end
  object wwSrcXcpItems: TDataSource
    DataSet = wwQryXcpItems
    Left = 81
    Top = 53
  end
  object wwQryXcpItems: TFDQuery
    BeforeOpen = wwQryXcpItemsBeforeOpen
    AfterScroll = wwQryXcpItemsAfterScroll
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '
      '       x.division_id,'
      '       d.name as division_name,'
      '       x.arinvt_id,'
      '       a.class,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.descrip2,'
      '       a.rev,'
      '       a.unit as arinvt_unit,'
      '       -- o.onhand,'
      '       UOM.To_Native( o.onhand, a.unit, x.arinvt_id ) as onhand,'
      
        '       RTrim(SubStr(UOM.Native_UOM_Ex( a.unit, x.arinvt_id), 1, ' +
        '10)) as UOM,'
      '       a.standard_id,'
      '       a.eplant_id,'
      '       x.qty,'
      '       greatest( 0, NVL(x.qty,0) '
      
        '                    - Sum((NVL(po.qty, 0) - NVL(po.qty_received,' +
        ' 0))) '
      
        '                    - mat_po_xcpt.get_item_vmi_onhand( x.arinvt_' +
        'id, 2/*vendor vmi*/)) as left_to_order,'
      
        '       mat_po_xcpt.get_item_vmi_onhand( x.arinvt_id, 2 /*vendor ' +
        'vmi*/) as vmi, '
      '       over.oversize_flag,'
      '       decode( x.cost_object_source, '
      
        '               '#39'JOBSHOP_TASK'#39', substr(jobshop.get_jobshop_task_f' +
        'ull_descrip( x.cost_object_id ), 1, 60),'
      '               NULL ) as cost_object,'
      '       x.cost_object_source,'
      '       x.cost_object_id,'
      '       a.buyer_code_id,'
      '       buyer_code.buyer_code,'
      '       x.vendor_id,'
      '       ven.vendorno,'
      '       ven.company,'
      '       a.mps,'
      
        '       mat_po_xcpt.get_setup_param( '#39'lead_days'#39', x.arinvt_id, de' +
        'code( params.capacity_consolidate_div_req, '#39'Y'#39', -1, x.division_i' +
        'd )) as lead_days'
      '  from'
      
        '      (select x.arinvt_id,                  -- to distinct arinv' +
        't_id from xcpt'
      
        '              decode( params.capacity_consolidate_div_req, '#39'Y'#39', ' +
        '-1, x.division_id) as division_id,'
      '              x.cost_object_source,'
      '              x.cost_object_id,'
      
        '              max(x.vendor_id) as vendor_id,   -- max() is just ' +
        'a precaution'
      '              Sum(NVL( x.qty, 0 )) as qty'
      '         from xcpt_mat_req x, params'
      '        where '
      '              (:include_all = 1 '
      '               or'
      '               x.must_order <= sysdate + :exception_scope )'
      '        group by'
      '              arinvt_id,'
      
        '              decode( params.capacity_consolidate_div_req, '#39'Y'#39', ' +
        '-1, x.division_id),'
      '              cost_object_source,'
      '              cost_object_id) x,'
      ''
      
        '       arinvt a,                           -- to get arinvt desc' +
        'rip, class'
      ''
      '       division d,                         -- division descrip'
      ''
      '       buyer_code,                         -- buyer_code'
      ''
      '       vendor ven,                         -- vendor'
      ''
      '       params,'
      ''
      
        '       (select f.arinvt_id,                  -- on_hand by divis' +
        'ion'
      
        '               decode( params.capacity_consolidate_div_req, '#39'Y'#39',' +
        ' -1, f.division_id) as division_id,'
      '               sum( NVL(f.onhand, 0)) onhand'
      '          from fgmulti f, params'
      
        '         where (f.non_conform_id is NULL or f.non_conform_id is ' +
        'not NULL and f.non_conform_allocatable = '#39'Y'#39')'
      '           and f.non_allocate_id is NULL'
      '         group by'
      '               arinvt_id, '
      
        '               decode( params.capacity_consolidate_div_req, '#39'Y'#39',' +
        ' -1, f.division_id)) o,'
      ''
      '       (select p.arinvt_id,'
      
        '               decode( params.capacity_consolidate_div_req, '#39'Y'#39',' +
        ' -1, p.division_id) as division_id,'
      '               p.cost_object_source,'
      '               p.cost_object_id,'
      '               p.po_qty as qty,'
      '               p.po_qty_received_posted as qty_received'
      '          from v_po_detail_total_exB p, params ) po,'
      ''
      '       (select distinct d.arinvt_id,'
      
        '               decode( params.capacity_consolidate_div_req, '#39'Y'#39',' +
        ' -1, d.division_id) as division_id,'
      '               d.cost_object_source,'
      '               d.cost_object_id,'
      '               1 as oversize_flag'
      '          from day_use_total d, params'
      '         where oversize = '#39'Y'#39') over'
      ''
      ' where'
      
        '       x.arinvt_id   = a.id                             -- link ' +
        'arinvt to get itemno, class.'
      
        '   and x.division_id = d.id(+)                          -- link ' +
        'division to get div descrip.'
      
        '   and x.arinvt_id   = o.arinvt_id(+)                   -- qty o' +
        'n_hand'
      '   and NVL(x.division_id,0) = NVL(o.division_id(+),0)'
      '   '
      '   -- on po left to receive'
      '   and x.arinvt_id = po.arinvt_id(+)                    '
      '   and NVL(x.division_id, 0)          = NVL(po.division_id(+),0)'
      
        '   and NVL(x.cost_object_source, '#39'*'#39') = NVL(po.cost_object_sourc' +
        'e(+), '#39'*'#39')'
      
        '   and NVL(x.cost_object_id, 0)       = NVL(po.cost_object_id(+)' +
        ', 0)'
      '   '
      '   -- oversize'
      '   and x.arinvt_id = over.arinvt_id(+)                  '
      
        '   and NVL(x.division_id,0)           = NVL(over.division_id(+),' +
        '0) '
      
        '   and NVL(x.cost_object_source, '#39'*'#39') = NVL(po.cost_object_sourc' +
        'e(+), '#39'*'#39')'
      
        '   and NVL(x.cost_object_id, 0)       = NVL(po.cost_object_id(+)' +
        ', 0)'
      ''
      '   and a.buyer_code_id = buyer_code.id(+)'
      ''
      '   and x.vendor_id = ven.id(+)'
      ''
      '   and ( :mfgtype is null'
      '         or'
      
        '         :mfgtype is not null and (select rtrim(mfg_type) from s' +
        'tandard where id = a.standard_id) = :mfgtype )'
      '   -- sum left_to_order'
      ' group by'
      '       x.division_id,'
      '       d.name,'
      '       x.arinvt_id,'
      '       a.class,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.descrip2,'
      '       a.rev,'
      '       a.unit,'
      '       UOM.To_Native( o.onhand, a.unit, x.arinvt_id ),'
      '       a.standard_id,'
      '       a.eplant_id,'
      '       x.qty,'
      '       over.oversize_flag,'
      '       decode( x.cost_object_source, '
      
        '               '#39'JOBSHOP_TASK'#39', substr(jobshop.get_jobshop_task_f' +
        'ull_descrip( x.cost_object_id ), 1, 60),'
      '               NULL ),'
      '       x.cost_object_source,'
      '       x.cost_object_id,'
      '       a.buyer_code_id,'
      '       buyer_code.buyer_code,'
      '       x.vendor_id,'
      '       ven.vendorno,'
      '       ven.company,'
      '       a.mps,'
      
        '       mat_po_xcpt.get_setup_param( '#39'lead_days'#39', x.arinvt_id, de' +
        'code( params.capacity_consolidate_div_req, '#39'Y'#39', -1, x.division_i' +
        'd ))'
      '       '
      '')
    Left = 80
    Top = 102
    ParamData = <
      item
        Name = 'include_all'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'exception_scope'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'mfgtype'
        DataType = ftString
        ParamType = ptInput
      end>
    object wwQryXcpItemsITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 9
      FieldName = 'ITEMNO'
      Origin = 'A.ITEMNO'
      Size = 50
    end
    object wwQryXcpItemsDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 18
      FieldName = 'DESCRIP'
      Origin = 'A.DESCRIP'
      Size = 100
    end
    object wwQryXcpItemsONHAND: TFMTBCDField
      DisplayLabel = 'On Hand'
      DisplayWidth = 10
      FieldName = 'ONHAND'
      DisplayFormat = '#########0.0000'
      Size = 38
    end
    object wwQryXcpItemsCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 5
      FieldName = 'CLASS'
      Origin = 'A.CLASS'
      Size = 2
    end
    object wwQryXcpItemsREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 6
      FieldName = 'REV'
      Origin = 'A.REV'
      Size = 15
    end
    object wwQryXcpItemsUOM: TStringField
      DisplayWidth = 5
      FieldName = 'UOM'
      Origin = 'a.unit'
      Size = 10
    end
    object wwQryXcpItemsDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 11
      FieldName = 'DIVISION_NAME'
      Origin = 'd.name'
      Size = 25
    end
    object wwQryXcpItemsQTY: TFMTBCDField
      DisplayLabel = 'Total Exception'
      DisplayWidth = 12
      FieldName = 'QTY'
      Origin = 'x.qty'
      DisplayFormat = '#########0.0000'
      Size = 38
    end
    object wwQryXcpItemsLEFT_TO_ORDER: TFMTBCDField
      DisplayLabel = 'Left To Order'
      DisplayWidth = 10
      FieldName = 'LEFT_TO_ORDER'
      DisplayFormat = '#########0.0000'
      Size = 38
    end
    object wwQryXcpItemsVMI: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'VMI'
      Size = 38
    end
    object wwQryXcpItemsEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'a.eplant_id'
      Size = 0
    end
    object wwQryXcpItemsCOST_OBJECT: TStringField
      DisplayLabel = 'Cost Object'
      DisplayWidth = 20
      FieldName = 'COST_OBJECT'
      Origin = 
        'decode( x.cost_object_source, '#39'JOBSHOP_TASK'#39', substr(jobshop.get' +
        '_jobshop_task_full_descrip( x.cost_object_id ), 1, 60), NULL )'
      Size = 60
    end
    object wwQryXcpItemsBUYER_CODE: TStringField
      DisplayLabel = 'Buyer Code'
      DisplayWidth = 10
      FieldName = 'BUYER_CODE'
      Origin = 'buyer_code.buyer_code'
      Size = 10
    end
    object wwQryXcpItemsVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      DisplayWidth = 12
      FieldName = 'VENDORNO'
      Origin = 'ven.vendorno'
      FixedChar = True
      Size = 10
    end
    object wwQryXcpItemsCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Origin = 'ven.company'
      Size = 60
    end
    object wwQryXcpItemsDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Origin = 'a.descrip2'
      Size = 100
    end
    object wwQryXcpItemsMPS: TStringField
      DisplayWidth = 1
      FieldName = 'MPS'
      Origin = 'a.mps'
      FixedChar = True
      Size = 1
    end
    object wwQryXcpItemsLEAD_DAYS: TFMTBCDField
      DisplayLabel = 'Lead Days'
      DisplayWidth = 10
      FieldName = 'LEAD_DAYS'
      Size = 38
    end
    object wwQryXcpItemsCOST_OBJECT_SOURCE: TStringField
      DisplayLabel = 'Cost Object'
      DisplayWidth = 15
      FieldName = 'COST_OBJECT_SOURCE'
      Origin = 'x.cost_object_source'
      Visible = False
      Size = 50
    end
    object wwQryXcpItemsARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'X.ARINVT_ID'
      Visible = False
      Size = 0
    end
    object wwQryXcpItemsSTANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'STANDARD_ID'
      Origin = 'A.STANDARD_ID'
      Visible = False
      Size = 0
    end
    object wwQryXcpItemsARINVT_UNIT: TStringField
      DisplayWidth = 4
      FieldName = 'ARINVT_UNIT'
      Origin = 'A.UNIT'
      Visible = False
      Size = 10
    end
    object wwQryXcpItemsDIVISION_ID: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'DIVISION_ID'
      Origin = 'x.division_id'
      Visible = False
      Size = 38
    end
    object wwQryXcpItemsOVERSIZE_FLAG: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'OVERSIZE_FLAG'
      Visible = False
      Size = 38
    end
    object wwQryXcpItemsCOST_OBJECT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'COST_OBJECT_ID'
      Origin = 'x.cost_object_id'
      Visible = False
      Size = 0
    end
    object wwQryXcpItemsBUYER_CODE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'BUYER_CODE_ID'
      Visible = False
      Size = 0
    end
    object wwQryXcpItemsVENDOR_ID: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'VENDOR_ID'
      Origin = 'X.VENDOR_ID'
      Visible = False
      Size = 38
    end
  end
  object PkPoOfVendors: TIQWebHpick
    BeforeOpen = PKPOrdersBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select p.id            as id,'
      '       p.pono          as pono,'
      '       av.vendor_id    as vendor_id,'
      '       p.po_date       as po_date,'
      '       v.company       as company,'
      '       d.total_qty_ord as total_ordered,'
      '       r.request_date  as required_date,'
      '       r.promise_date  as promised_date,'
      '       r.quan          as release_qty,'
      '       d.id            as po_detail_id,'
      '       a.class         as class ,'
      '       a.itemno        as itemno,'
      '       a.descrip       as descrip,'
      '       d.division_id   as division_id'
      '  from arinvt_vendors av,'
      '       po p,'
      '       po_detail d,'
      '       v_vendor v,'
      '       arinvt a,'
      '       po_releases r'
      ' where av.arinvt_id = :arinvt_id'
      
        '   and mat_po_xcpt.filter_cost_object( :cost_object_source, :cos' +
        't_object_id, d.cost_object_source, d.cost_object_id ) = 1'
      '   and av.vendor_id = v.id'
      '   and v.id = p.vendor_id(+)'
      '   and d.po_id(+) = p.id'
      '   and d.arinvt_id = a.id(+)'
      '   and d.id = r.po_detail_id(+)'
      '   and misc.eplant_filter_include_nulls( p.eplant_id ) = 1'
      ' '
      ' '
      ' '
      ' ')
    OnIQModify = PKPOrdersIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 368
    Top = 57
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'cost_object_source'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'cost_object_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object FloatField1: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object StringField1: TStringField
      DisplayLabel = 'PO#'
      FieldName = 'PONO'
      Size = 35
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'PO Date'
      FieldName = 'PO_DATE'
    end
    object StringField2: TStringField
      DisplayLabel = 'Vendor'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkPoOfVendorsCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Size = 2
    end
    object PkPoOfVendorsITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 15
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkPoOfVendorsDESCRIP: TStringField
      DisplayLabel = 'Item Description '
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Size = 100
    end
    object FloatField2: TBCDField
      FieldName = 'VENDOR_ID'
      Visible = False
      Size = 0
    end
    object FloatField3: TBCDField
      DisplayLabel = 'Total Ordered'
      FieldName = 'TOTAL_ORDERED'
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = 'Required Date'
      FieldName = 'REQUIRED_DATE'
    end
    object DateTimeField3: TDateTimeField
      DisplayLabel = 'Promised Date'
      FieldName = 'PROMISED_DATE'
    end
    object FloatField4: TBCDField
      FieldName = 'PO_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object PkPoOfVendorsDIVISION_ID: TBCDField
      FieldName = 'DIVISION_ID'
      Visible = False
      Size = 0
    end
    object PkPoOfVendorsRELEASE_QTY: TBCDField
      DisplayLabel = 'Release Quantity'
      FieldName = 'RELEASE_QTY'
    end
  end
  object SoftEPlant1: TIQWebSoftEPlant
    EPlant_Include_Nulls = False
    Left = 166
    Top = 56
  end
  object SrcPOReleasesOverDue: TDataSource
    DataSet = QryPOReleasesOverDue
    Left = 221
    Top = 86
  end
  object QryPOReleasesOverDue: TFDQuery
    Tag = 1
    OnCalcFields = QryPOReleasesOverDueCalcFields
    Filtered = True
    OnFilterRecord = QryPOReleasesOverDueFilterRecord
    MasterSource = SrcPastDuePOs
    MasterFields = 'DETAIL_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, '
      '       seq,'
      '       request_date,'
      '       promise_date,'
      '       quan,'
      '       qty_left_to_recv'
      '  from '
      '       ( select r.id,'
      '                r.seq,'
      '                r.request_date,'
      '                r.promise_date,'
      
        '                UOM.To_Native( r.quan, d.unit, d.arinvt_id ) as ' +
        'quan,'
      ''
      '                (select greatest(0, x.quan - NVL(x.recv_quan,0))'
      '                   from c_po_releases x'
      '                  where'
      '                        x.id = r.id ) as qty_left_to_recv'
      '                '
      '           from po_releases r, po_detail d'
      '          where '
      '                d.id = :detail_id'
      '            and r.po_detail_id = d.id ) '
      '            '
      ' where      '
      '       nvl(qty_left_to_recv,0) > 0     '
      ' order by seq'
      '')
    Left = 221
    Top = 102
    ParamData = <
      item
        Name = 'DETAIL_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 88400000c
      end>
    object QryPOReleasesOverDueSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 3
      FieldName = 'SEQ'
      Origin = 'PO_RELEASES.SEQ'
      Size = 0
    end
    object QryPOReleasesOverDueQUAN: TFMTBCDField
      DisplayLabel = 'Quantity'
      DisplayWidth = 15
      FieldName = 'QUAN'
      DisplayFormat = '#########0.00'
      Size = 38
    end
    object QryPOReleasesOverDueREQUEST_DATE: TDateTimeField
      DisplayLabel = 'Request Date'
      DisplayWidth = 18
      FieldName = 'REQUEST_DATE'
      Origin = 'PO_RELEASES.REQUEST_DATE'
    end
    object QryPOReleasesOverDuePROMISE_DATE: TDateTimeField
      DisplayLabel = 'Promise Date'
      DisplayWidth = 21
      FieldName = 'PROMISE_DATE'
      Origin = 'PO_RELEASES.PROMISE_DATE'
    end
    object QryPOReleasesOverDueLeft_To_Recv: TFloatField
      DisplayLabel = 'Left To Receive'
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'Left_To_Recv'
      DisplayFormat = '#########0.00'
      Calculated = True
    end
    object QryPOReleasesOverDueID: TBCDField
      FieldName = 'ID'
      Origin = 'PO_RELEASES.ID'
      Visible = False
      Size = 0
    end
    object QryPOReleasesOverDueQTY_LEFT_TO_RECV: TFMTBCDField
      FieldName = 'QTY_LEFT_TO_RECV'
      Visible = False
      Size = 38
    end
  end
  object PkPoByVendor: TIQWebHpick
    BeforeOpen = PKPOrdersBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select p.id as id,'
      '       p.pono as pono,'
      '       p.vendor_id as vendor_id,'
      '       p.po_date as po_date,'
      '       v.company as company,'
      '       d.total_qty_ord as total_ordered,'
      '       r.request_date as required_date,'
      '       r.promise_date as promised_date,'
      '       r.quan as release_qty,'
      '       d.id as po_detail_id,'
      '       d.division_id as division_id'
      '  from po p,'
      '       po_detail d,'
      '       vendor v,'
      '       po_releases r'
      'where p.vendor_id = v.id(+)'
      '  and d.po_id(+) = p.id'
      '  and p.vendor_id = :vendor_id'
      
        '  and mat_po_xcpt.filter_cost_object( :cost_object_source, :cost' +
        '_object_id, d.cost_object_source, d.cost_object_id ) = 1'
      '  and d.id = r.po_detail_id(+)'
      '  and misc.eplant_filter_include_nulls( p.eplant_id ) = 1'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    OnIQModify = PkPoByVendorIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 399
    Top = 57
    ParamData = <
      item
        Name = 'vendor_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'cost_object_source'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'cost_object_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object StringField3: TStringField
      DisplayLabel = 'PO#'
      FieldName = 'PONO'
      Size = 35
    end
    object DateTimeField4: TDateTimeField
      DisplayLabel = 'PO Date'
      FieldName = 'PO_DATE'
    end
    object StringField4: TStringField
      DisplayLabel = 'Vendor'
      FieldName = 'COMPANY'
      Size = 60
    end
    object FloatField5: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object FloatField6: TBCDField
      FieldName = 'VENDOR_ID'
      Visible = False
      Size = 0
    end
    object FloatField7: TBCDField
      DisplayLabel = 'Total Ordered'
      FieldName = 'TOTAL_ORDERED'
    end
    object DateTimeField5: TDateTimeField
      DisplayLabel = 'Required Date'
      FieldName = 'REQUIRED_DATE'
    end
    object DateTimeField6: TDateTimeField
      DisplayLabel = 'Promised Date'
      FieldName = 'PROMISED_DATE'
    end
    object FloatField8: TBCDField
      FieldName = 'PO_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object FloatField9: TBCDField
      FieldName = 'DIVISION_ID'
      Visible = False
      Size = 0
    end
    object FloatField10: TBCDField
      DisplayLabel = 'Release Quantity'
      FieldName = 'RELEASE_QTY'
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'sbtnRecalc'
      'sbtnEval'
      'ReceivingDays1'
      'ShowAllVendorPriceBreaks1')
    SecurityCode = 'FRMMATEXCEPTION'
    Left = 328
    Top = 141
  end
  object PkArinvtVendor: TIQWebHpick
    BeforeOpen = PkArinvtVendorBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.id           as id,'
      '       a.vendor_id    as vendor_id,'
      '       a.seq          as seq,'
      '       a.vend_itemno  as vend_itemno,'
      '       a.vend_descrip as vend_descrip,'
      '       a.vend_rev     as vend_rev,'
      '       v.vendorno     as vendorno,'
      '       v.company      as company'
      '  from '
      '       arinvt_vendors a, vendor v'
      ' where '
      '       a.arinvt_id = :arinvt_id'
      '   and a.vendor_id = v.id'
      '   and misc.eplant_filter_include_nulls( v.eplant_id ) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 429
    Top = 58
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkArinvtVendorID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkArinvtVendorVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Visible = False
      Size = 0
    end
    object PkArinvtVendorVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      FieldName = 'VENDORNO'
      FixedChar = True
      Size = 10
    end
    object PkArinvtVendorCOMPANY: TStringField
      DisplayLabel = 'Vendor Name'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkArinvtVendorSEQ: TBCDField
      DisplayLabel = '#'
      FieldName = 'SEQ'
      Size = 0
    end
    object PkArinvtVendorVEND_ITEMNO: TStringField
      DisplayLabel = 'Vendor AKA Item #'
      FieldName = 'VEND_ITEMNO'
      Size = 25
    end
    object PkArinvtVendorVEND_DESCRIP: TStringField
      DisplayLabel = 'Vendor AKA Item Description'
      FieldName = 'VEND_DESCRIP'
      Size = 35
    end
    object PkArinvtVendorVEND_REV: TStringField
      DisplayLabel = 'Vendor Item Rev'
      FieldName = 'VEND_REV'
      Size = 15
    end
  end
  object PkVendor: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select vendorno,'
      '          company,'
      '          city,'
      '          state,'
      '          country,'
      '          id,'
      '          pk_hide'
      'from v_vendor'
      'order by vendorno'
      '         '
      '         '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 274
    Top = 90
    object PkVendorVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      FieldName = 'VENDORNO'
      Size = 10
    end
    object StringField5: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      Size = 60
    end
    object StringField6: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object StringField7: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
    end
    object StringField8: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Size = 30
    end
    object FloatField11: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkVendorPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.VENDOR.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object IQJumpAvail: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = wwSrcXcpItems
    JumpTo = jtAvailability
    Left = 385
    Top = 406
  end
  object IQJumpInv4: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = SrcMatReqItems
    JumpTo = jtInventory
    Left = 297
    Top = 406
  end
  object popmPastDuePO: TUniPopupMenu
    OnPopup = PopupMenu4Popup
    Left = 296
    Top = 378
    object MenuItem1: TUniMenuItem
      Caption = 'Jump to Inventory'
      OnClick = MenuItem1Click
    end
  end
  object SrcOutsourceBelowMin: TDataSource
    DataSet = QryOutsourceBelowMin
    Left = 80
    Top = 235
  end
  object QryOutsourceBelowMin: TFDQuery
    Tag = 3
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select o.id,'
      '       o.arinvt_id,'
      '       o.vendor_id,'
      ''
      '       a.class,'
      '       a.itemno,'
      '       a.rev,'
      '       a.descrip,'
      '       a.descrip2,'
      '       v.vendorno,'
      '       v.company,'
      ''
      
        '       outsrc_misc.get_onhand_intransit( o.arinvt_id, o.vendor_i' +
        'd ) as onhand_in_transit,'
      '       '
      
        '       outsrc_misc.get_ship_order_qty( o.arinvt_id, o.vendor_id ' +
        ') as ship_order_qty,'
      '       '
      '       o.safety_stock,'
      '       o.min_order_qty,'
      '       o.max_order_qty,'
      ''
      '       a.unit,'
      '       a.buyer_code_id,'
      '       b.buyer_code'
      '       '
      '  from outsrc_reorder o,'
      '       arinvt a,'
      '       vendor v,'
      '       buyer_code b'
      ' where o.arinvt_id = a.id(+)'
      '   and o.vendor_id = v.id(+)'
      '   and a.buyer_code_id = b.id(+)'
      
        '   and outsrc_misc.get_onhand_intransit( o.arinvt_id, o.vendor_i' +
        'd ) < nvl(o.safety_stock,0)'
      '   and misc.eplant_filter(a.eplant_id) = 1'
      '       '
      '         ')
    Left = 80
    Top = 264
    object QryOutsourceBelowMinID: TBCDField
      FieldName = 'ID'
      Origin = 'o.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 0
    end
    object QryOutsourceBelowMinARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'o.ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryOutsourceBelowMinVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Origin = 'o.VENDOR_ID'
      Visible = False
      Size = 0
    end
    object QryOutsourceBelowMinCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Origin = 'a.CLASS'
      FixedChar = True
      Size = 2
    end
    object QryOutsourceBelowMinITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Origin = 'a.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryOutsourceBelowMinREV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      Origin = 'a.REV'
      FixedChar = True
      Size = 15
    end
    object QryOutsourceBelowMinDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'a.DESCRIP'
      Size = 100
    end
    object QryOutsourceBelowMinDESCRIP2: TStringField
      DisplayLabel = 'Ext Item Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'a.DESCRIP2'
      Size = 100
    end
    object QryOutsourceBelowMinVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      FieldName = 'VENDORNO'
      Origin = 'v.VENDORNO'
      FixedChar = True
      Size = 10
    end
    object QryOutsourceBelowMinCOMPANY: TStringField
      DisplayLabel = 'Vendor Name'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Origin = 'v.COMPANY'
      Size = 60
    end
    object QryOutsourceBelowMinONHAND_IN_TRANSIT: TFMTBCDField
      DisplayLabel = 'On Hand In Transit'
      FieldName = 'ONHAND_IN_TRANSIT'
      Origin = 'outsrc_misc.get_onhand_intransit( o.arinvt_id, o.vendor_id )'
      Size = 38
    end
    object QryOutsourceBelowMinSHIP_ORDER_QTY: TFMTBCDField
      DisplayLabel = 'On Ship Order'
      FieldName = 'SHIP_ORDER_QTY'
      Origin = 'SHIP_ORDER_QTY'
      Size = 38
    end
    object QryOutsourceBelowMinSAFETY_STOCK: TBCDField
      DisplayLabel = 'Reorder Point'
      FieldName = 'SAFETY_STOCK'
      Origin = 'o.SAFETY_STOCK'
      Precision = 14
    end
    object QryOutsourceBelowMinMIN_ORDER_QTY: TBCDField
      DisplayLabel = 'Minimum Order'
      FieldName = 'MIN_ORDER_QTY'
      Origin = 'o.MIN_ORDER_QTY'
      Precision = 14
    end
    object QryOutsourceBelowMinMAX_ORDER_QTY: TBCDField
      DisplayLabel = 'Maximum Order'
      FieldName = 'MAX_ORDER_QTY'
      Origin = 'o.MAX_ORDER_QTY'
      Precision = 14
    end
    object QryOutsourceBelowMinUNIT: TStringField
      DisplayLabel = 'Native UOM'
      FieldName = 'UNIT'
      Origin = 'a.UNIT'
      Size = 10
    end
    object QryOutsourceBelowMinBUYER_CODE_ID: TBCDField
      FieldName = 'BUYER_CODE_ID'
      Origin = 'a.BUYER_CODE_ID'
      Visible = False
      Size = 0
    end
    object QryOutsourceBelowMinBUYER_CODE: TStringField
      DisplayLabel = 'Buyer Code'
      FieldName = 'BUYER_CODE'
      Origin = 'b.BUYER_CODE'
      Size = 10
    end
  end
  object popmOutsrcBelowMin: TUniPopupMenu
    OnPopup = popmOutsrcBelowMinPopup
    Left = 116
    Top = 235
    object JumpToInventory5: TUniMenuItem
      Caption = 'Jump To Inventory'
      OnClick = JumpToInventory5Click
    end
    object JumpToOutsourceBOM1: TUniMenuItem
      Caption = 'Jump To Outsource BOM'
      OnClick = JumpToOutsourceBOM1Click
    end
    object JumpToVendor1: TUniMenuItem
      Caption = 'Jump To Vendor'
      OnClick = JumpToVendor1Click
    end
    object JumpToShipOrder1: TUniMenuItem
      Caption = 'Jump To Ship Order'
      OnClick = JumpToShipOrder1Click
    end
    object CreateShipOrder1: TUniMenuItem
      Caption = 'Create Ship Order'
      Visible = False
      OnClick = CreateShipOrder1Click
    end
  end
  object IQJumpOutsrcInv: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = SrcOutsourceBelowMin
    JumpTo = jtInventory
    Left = 116
    Top = 267
  end
  object IQJumpOutsrcVendor: TIQWebJump
    DataField = 'VENDOR_ID'
    DataSource = SrcOutsourceBelowMin
    JumpTo = jtVendor
    Left = 116
    Top = 299
  end
  object PkOutsourceBOM: TIQWebHpick
    BeforeOpen = PkOutsourceBOMBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select s.id as id,'
      '       s.mfgno as mfgno'
      '  from standard s,'
      '       partno p,'
      '       ptoper,'
      '       opmat'
      ' where s.id = p.standard_id'
      
        '   and rtrim(s.cntr_type) = (select rtrim(vendorno) from vendor ' +
        'where id = :vendor_id)'
      '   and p.id = ptoper.partno_id'
      '   and ptoper.sndop_id = opmat.sndop_id'
      '   and opmat.arinvt_id = :arinvt_id'
      '   ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 149
    Top = 235
    ParamData = <
      item
        Name = 'vendor_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkOutsourceBOMID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.STANDARD.ID'
      Visible = False
      Size = 0
    end
    object PkOutsourceBOMMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      FieldName = 'MFGNO'
      Origin = 'IQ.STANDARD.MFGNO'
      Size = 50
    end
  end
  object PkOutsourceShipOrder: TIQWebHpick
    BeforeOpen = PkOutsourceBOMBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select o.id as id,'
      '       o.orderno as orderno,'
      '       o.is_manual_outsource as is_manual_outsource'
      '  from orders o,'
      '       arcusto a'
      ' where o.arcusto_id = a.id'
      
        '   and a.vendor_id_outsource = :vendor_id                       ' +
        '   '
      '   and exists '
      
        '       (select 1 from ord_detail where orders_id = o.id and arin' +
        'vt_id = :arinvt_id)'
      ''
      ''
      '')
    OnIQModify = PkOutsourceShipOrderIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 180
    Top = 235
    ParamData = <
      item
        Name = 'vendor_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkOutsourceShipOrderID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ORDERS.ID'
      Visible = False
      Size = 0
    end
    object PkOutsourceShipOrderORDERNO: TStringField
      DisplayLabel = 'Ship Order #'
      FieldName = 'ORDERNO'
      Origin = 'IQ.ORDERS.ORDERNO'
      Size = 15
    end
    object PkOutsourceShipOrderIS_MANUAL_OUTSOURCE: TStringField
      DisplayLabel = 'Manual Ship Order'
      FieldName = 'IS_MANUAL_OUTSOURCE'
      Size = 1
    end
  end
  object procManualShipOrder: TFDStoredProc
    ConnectionName = 'IQFD'
    PackageName = 'IQMS.IRV32_MISC'
    StoredProcName = 'MANUAL_OUTSOURCE_SHIP_ORDER'
    Left = 80
    Top = 296
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
        Name = 'V_VENDOR_ID'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'V_ORDER_QTY_IN'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'V_PROMISE_DATE'
        DataType = ftDateTime
        FDDataType = dtDateTime
        ParamType = ptInput
      end>
  end
end
