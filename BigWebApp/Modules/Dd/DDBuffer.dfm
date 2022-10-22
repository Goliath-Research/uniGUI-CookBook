object FrmBuffer: TFrmBuffer
  Left = 271
  Top = 167
  ClientHeight = 374
  ClientWidth = 314
  Caption = 'View Buffer'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 269
    Width = 314
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alBottom
    ParentColor = False
    Color = clBtnFace
  end
  object Bevel1: TUniPanel
    Left = 0
    Top = 27
    Width = 314
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    Caption = ''
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 314
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnClearBuffer: TUniSpeedButton
      Left = 100
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Delete Multiple Selected Items'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000C21E0000C21E00000001000000000000473E7D005050
        500051515100535353005555550057575700585858005D5D5D005E5E5E005F5F
        5F004D4E63004E486B00504D6D004E4C760049417E004E457E00606060006565
        650066666600696969006A6A6A006B6B6B006C6C6C006E6E6E006F6F6F006363
        7B0070707000717171007272720076767600473C800049388200533D8F004B40
        84004C448500534F83005655810059568D005B568D0054449700554598005D54
        93005E5294005C5A9500625E9900665B9F0062618B00636693005451A7005C4E
        B3005F4FB4005C4FBB005D4DBC006153A100695EAE007474A4007978A2007D7E
        A0007D7DB3007C7BBB007E7CBE005B4BC0007C72CC00FF00FF00808080008282
        8200868686008B8B8B008C8C8C008D8D8D008E8E8E008C949B00909090009191
        910093939300959595009696960097979700949C9B0098989800999999009B9B
        9B009D9D9D009F9F9F009BA49A009BA69C00A1AE9E009E9FA3009F99AA008386
        B3008184B7008F8EB000898EB5008882BD008885BC00888CBC009492B0009B9F
        B8009EA9A1009FA0B500A0A0A000A2A2A200A3A3A300A4A4A400A5A5A500A7A7
        A700A0ACA000A6AAAB00A9A9A900AAAAAA00ACACAC00A1A5B000B3B3B300B5B5
        B500B7B7B700B9B9B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBF
        BF00888AC4008487CB008C8EC8009191C100928BD400968FD800979AD7009CA2
        CD009CA0D100A0A3C200AFBCCC00A6A7DA00B3A9D800AEB1D700B0B1D300B6B8
        D600BABBD500B2B5DB00B2B3DF00B1B8DF0097AAE3009FB1E0009CB3E100AAAD
        E000AAA9E700ACAEE400B1A7ED00A3B0E800B2B2E000B2B3E500B9BFE800BCBD
        E900A3AEF200B4B5F200BBB5F600B7BBF000B9BDF000B8BCF100BBBEF100B5B7
        F800B8B5FA00B7BCF900BDB9FF00BFC6ED00C1C1C100C4C4C400C6C6C600C7C7
        C700C8C8C800C9C9C900CACACA00CBCBCB00C9CFCE00CECECE00CFCFCF00C3C5
        D700CACCD400D0D0D000D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D4DB
        D400D8D8D800D9D9D900DCDDD900DCDCDC00DDDDDD00DEDEDE00DFDFDF00C3C9
        E600C7C8EA00C7CCEB00D2D2E000D3D2E200DCDCEA00C6C5F100C1C1F700C7C3
        F400C2C6F700C6CAF300C5C8F400CBCAF200C8C9F500C6C6FF00CBC7F800CCC5
        FF00D0CAFF00CED6F300D7D3F700D7D6F600D7D8F200D1DAF500D8D4FD00DADC
        FA00DADDFC00DDDDFF00E4DCFB00DFE3F600D9E8F100DAE0FF00E0E0E000E3E3
        E300E1E5E600E4E4E400E5E5E500E6E6E600E7E7E700E2E8EF00E9E9E900EAEA
        EA00E0E2F400EFECFF00ECF6FF00F1F1F100F6F6F600F4FFF000F3F4FF00F8F7
        FF00F2F8FF00F2FBFF00F3FFFC00F4FFFE00F4FEFF00F6FFFF00F8F8F800F9F9
        F900FAFAFA00FCFCFC00FEFEFE00FFFFFF0000000000000000003F3F3F3F3F3F
        3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3FB26F58575455
        4E6BBC3F3F3F3F3F3F3FAF6952646567516DBD3F3F3F3F3F3F3F39373231333D
        343660B93F3F3F3F3F3F42401A181C1C1C1D50BB3F3F3F3F3F3F2CA4958F908E
        9A7B2F61BD3F3F3F3F3F17AD7776777279501B68BD3F3F3F3F3F38A2A39B9899
        9C5A803063C53F3F3F3F41A9ADA7ABAAA8486C1568B83F3F3F3F882BD3C3D1D0
        C994598D2A62C43F3F3F7314BEB5B6B6B37449A61169B73F3F3F3F2E89D8EAD4
        E7D55D838B286AC63F3F3F1679BFE5BDE9BE496D78096CC03F3F3F8A0FF7F2EF
        F5F4875E81962756DC3F3FA604FDFAFBFDFC744A6E77086DE33F3F3F2DD28C97
        9192933E7C828735AE3F3F3F18BA787973737545526E7414B03F3F3F3F22D7A0
        9EA19D9F3B5F852647E23F3F3F05E0ACABA9AAAB444F70114BE43F3F3F3F0EDE
        CFCAC8CCCB3A7E8424B13F3F3F3F03E8B6B4AFB5B643537910AB3F3F3F3F3F00
        DBC7CDC2C1CE5C7F255B3F3F3F3F3F02E4B3B6B3B3B64D66114C3F3F3F3F3F3F
        0BEBD6DDD9DAA57A3C233F3F3F3F3F3F02EDBFE6E1E3B05046073F3F3F3F3F3F
        3F0AF1F0F3F6ECDF7D0D3F3F3F3F3F3F3F03F9EEFBFCF8E652053F3F3F3F3F3F
        3F3F190C201F211E29863F3F3F3F3F3F3F3F13040601040212713F3F3F3F3F3F
        3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F}
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnClearBufferClick
    end
    object sbtnFastForward: TUniSpeedButton
      Left = 75
      Top = 1
      Width = 25
      Height = 25
      Hint = ''
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFC8C4C1BFB4AAB7A392B7A392BFB4AAC8C4C1FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C0BBAE937AA67A58AD7655B6
        7758B77A5BB17D5EA87D5CAE937BC6C0BBFF00FFFF00FFFF00FFFF00FFFF00FF
        C2B8AFA58162B8704DC96D4BCD7959CF7D5FCF7F60CF7F60CE7A5BBD7B5BA582
        63C2B9B0FF00FFFF00FFFF00FFC7C2BDA4805FC2724CD37955D78563D78664D7
        8664D78664D78664D78565D68463C7805EA58263C7C2BDFF00FFFF00FFAE937A
        C1764FDB7D55BD825FA47B58BD825FD88A67DF8C69BB815EA17A57BB825EDE8C
        67C6825EAF957DFF00FFC6C0BAAB7A54DF7D4FE18B65A47F5DFBF9F7D3C0B0BD
        8461DA906BA5805FFFFFFFA5805FE2936EE38B64AC7D58C6C0BBBAAB9DBD7C55
        E58555E48F65A78261FFFFFFFFFFFFD3C0B0BD8762A78261FFFFFFA78261E592
        6BE78C61BE7F57BAAB9DB6A391C68156EA8A5CE89064A78261FFFFFFFFFFFFFF
        FFFFCEB9A7A78261FFFFFFA78261E79268EB9063C7835AB6A391B6A391CB8B64
        F09A70EB9A71A78261FFFFFFFFFFFFFFFFFFD2C0AFA78261FFFFFFA78261EA98
        6EEE996EC98962B6A391BCAC9FC4906CF3AE8BEEAA85A78261FFFFFFFFFFFFD9
        CABCC08C67A78261FFFFFFA78261EEA884F3A983C18A64BCAC9FC7C3BFA27D5A
        F5B693F3B694A47F5DFCFAF9D7C7B8C39371E4AB8AA5805FFBF9F7A5805FF3B8
        98F4B591A17B58C8C4C1FF00FFB09780D09E7DF8C0A1C79A78A98565C69877EA
        B596F8C1A3C99B79A37D5BC89978F8BF9ED09F7EB09881FF00FFFF00FFC8C4C1
        A58263D9AE8FFBCAADF3C3A7FACBAEFACAACF9C9ABFAC9ABF7C6A8F9C8A9D9AD
        8DA68465C8C4C1FF00FFFF00FFFF00FFC4BDB6A78669CBA686F9D4B8FBD6BCFB
        D6BDFAD7BBFBD7BBFBD7BBD2AD8FA68263C3BBB4FF00FFFF00FFFF00FFFF00FF
        FF00FFCBC9C8B49E8BA88261C29F80CCAB8DCDAC8EC3A182A98462B19A84C8C4
        C1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC8C5C2BDAFA3B8
        A696B8A696BDAFA3C8C5C2FF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnFastForwardClick
    end
    object sbtnForeward: TUniSpeedButton
      Left = 50
      Top = 1
      Width = 25
      Height = 25
      Hint = ''
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFC4BEB7B7A392B39B86B39B86B5A18FC2B9B1FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC9C7C5B09881A87855B26F4FB9
        7555BB795BB67656AB7856AA8C70C3BBB4FF00FFFF00FFFF00FFFF00FFFF00FF
        C2B9B0A88668B77654C96F4DCD7A5BCC7F5FCD7F60CF7F61CE7A5BBF7959A480
        5FBEB2A7FF00FFFF00FFFF00FFCAC8C6A98769C27550D47C58D78463BA805DA8
        8363A47F5DBD805ED78665D68462C97E5BA58263C7C3BFFF00FFFF00FFB39B86
        BD7B54DB7F57DF8C69DE8D69A27C59FBF9F7F5F1EDB09073BF8360DF8C6ADF8C
        67C4835EAC9076FF00FFC9C7C4A37E5BE07E50E48E67E5946FE5946FB9835FDF
        D2C6FFFFFFF8F6F3B49579C18662E5936DE48A62AE7B56C4BDB6BDB0A4BB7E55
        E68457CC8760AF7F5BA17A57A17A57A17A57CDB9A6FEFDFDFBF9F7B7997FC285
        60E78B5FC47E54B8A594B9A898C28158EA8B5CB07F5AECE4DDFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFBF9F7A78261E68E62CD8358B39C87B9A899C68B65
        F09B71B1815CECE4DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE6DFA27C
        59EE996ECE8A62B49E8ABFB4ABBD8D6BF3AE8BD49A75B18461A17A57A17A57A1
        7A57C9B29EFEFDFDF0E9E3AA8767D39874F3A982C58B65B9A899CBC9C8A37F5D
        ECB18FF6B896F6B897F6B896C79674D5C4B4FFFFFFEDE6DFA98565D29E7CF6BB
        9BF4B490AB805CC7C2BEFF00FFB8A696C89A79F8C1A1F8C0A1F8C0A1AF8663F0
        E9E3EBE3DBA88363D5A382F8BE9DF8BE9ECB9B7AB39C88FF00FFFF00FFCCCBCB
        AB8E72D4AA8AFACBAEFACBAED4A989A37D5BB48B69D8AB8BFAC8AAFAC7A9D8AB
        8CA78769CAC8C6FF00FFFF00FFFF00FFC7C2BDAB8E74C8A283EFCAAFFBD6BCF9
        D4BAFAD7BBFBD6BBF9D4B9D0AB8CA68566C4BDB6FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFB9A898A37E5DBC9978C7A586C7A687C09D7DA37E5CB39C87C8C5
        C2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCBCAC9BFB4AABA
        AB9DBAAB9DBEB2A7CAC8C6FF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnForewardClick
    end
    object sbtnBack: TUniSpeedButton
      Left = 25
      Top = 1
      Width = 25
      Height = 25
      Hint = ''
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFC4BEB7B7A392B39B86B39B86B5A18FC2B9B1FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC9C7C5B09881A87855B2704FB9
        7555BC795BB67556AB7856AA8C70C3BBB4FF00FFFF00FFFF00FFFF00FFFF00FF
        C2B9B0A88668B77654CA6F4DCE7A5BCD7F60CC7F5FCF7F61CD7A5BBF7959A480
        5FBEB2A7FF00FFFF00FFFF00FFCAC8C6A98769C27550D47B57D68464BD805EA4
        7F5DA88363BA7F5DD78564D78462C97E5BA58263C7C3BFFF00FFFF00FFB39B86
        BD7A54DB7F57DF8C69BF8360B09073F5F1EDF9F7F5A27C59DE8C69DF8C69DF8C
        67C4835EAC9076FF00FFC9C7C4A37E5BE07E50E48E67C08662B49579F8F6F3FF
        FFFFDFD2C6B9835FE6936FE5936FE5926DE48B62AE7B56C4BDB6BDB0A4BB7E55
        E68457C2845DB7997FFBF9F7FEFDFDCEBAA8A17A57A17A57A17A57B0805CCD89
        63E78B5FC37E55B8A594B9A898C28158E78A5CA78261FBF9F7FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFECE4DDB07F5BEA8F63CD8358B39C87B9A899C68B66
        EE9B70A27C59EDE6DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE4DDB180
        5CEE996ECE8A62B49E8ABFB4ABBD8D6BF3AE8BD29974AA8767F0E9E3FEFDFDC9
        B29EA17A57A17A57A17A57B18460D49974F3A982C58B65B9A899CBC9C8A37F5D
        ECB18FF6B796D29D7CA98565EDE6DFFFFFFFD4C2B2C89775F6B998F6B997F6BA
        9BF5B491AB805CC7C2BEFF00FFB8A696C89A79F8C0A1F8BFA1D5A483A88363EC
        E4DDF0E9E3AF8563F8BF9FF8BD9DF7BF9FCB9B7AB39C88FF00FFFF00FFCCCBCB
        AB8E72D4AA8AFACBAEFACBADD7AC8CB38A68A37D5BD4A887F9C8AAF9C8AAD8AB
        8BA78769CAC8C6FF00FFFF00FFFF00FFC7C2BDAB8E74C8A283EFCAAFFBD7BCFB
        D6BCF9D4BAFBD7BBF9D4B9D0AB8CA68566C4BDB6FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFB9A898A37E5DBC9978C7A586C7A687C09C7DA37E5CB39C87C8C5
        C2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCBCAC9BFB4AABA
        AB9DBAAB9DBEB2A7CAC8C6FF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnBackClick
    end
    object sbtnRewind: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = ''
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFC8C4C1BFB4AAB7A392B7A392BFB4AAC8C4C1FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C0BBAE937AA67A58AD7655B6
        7758B77A5BB17D5EA87D5CAE937BC6C0BBFF00FFFF00FFFF00FFFF00FFFF00FF
        C2B8AFA58162B8704DC86D4BCD7959CF7E5FCF7F60CF7F60CE7A5BBD7B5AA582
        63C2B9B0FF00FFFF00FFFF00FFC7C2BDA4805FC1734DD37955D68464D78664D7
        8564D78564D78564D78564D78463C7805EA58263C7C2BDFF00FFFF00FFAE937A
        C1764EDA7E55BB825EA27A57BB825FDF8D69D78A67BD825FA47B58BD835FDE8B
        67C6825EAF957DFF00FFC6C0BAAB7A54DF7D50E08C64A5805FFEFDFDA5805FDA
        906BBD8561D4C2B2FBF9F7A47F5DE3936EE38C64AC7D58C6C0BBBAAB9DBD7C54
        E58556E48F65A78261FFFFFFA78261BD8662D3C0B0FFFFFFFFFFFFA78261E593
        6AE78C61BE7F57BAAB9DB6A391C68156EA8B5CE79064A78261FFFFFFA78261CE
        B9A7FFFFFFFFFFFFFFFFFFA78261E89268EB9063C7835AB6A391B6A391CB8C64
        EF9B70EB9A70A78261FFFFFFA78261D2C0AFFFFFFFFFFFFFFFFFFFA78261EA98
        6EEF996ECA8962B6A391BCAC9FC4906CF3AE8AEEAA85A78261FFFFFFA78261C0
        8C68D9CABCFFFFFFFFFFFFA78261EEA883F3A983C18A64BCAC9FC7C3BFA27D5A
        F5B593F2B592A5805FFBF9F7A5805FE4AA8AC39371D7C7B8FCFAF9A47F5DF4B9
        98F4B591A17B58C8C4C1FF00FFB09780D09E7DF8C1A1C99A79A37D5BC99B79F8
        C1A2EAB596C69876A98565C89876F7BF9FD09F7EB09881FF00FFFF00FFC8C4C1
        A58263D9AE8FFBCBADF8C9ACFACBADFACAACFAC9ABF9C9AAF3C2A2FAC8AAD9AD
        8EA68465C8C4C1FF00FFFF00FFFF00FFC4BDB6A78669CBA686F9D3B8FBD6BCFB
        D7BDFBD7BBFBD7BCFBD6BCD2AD8FA68263C3BBB4FF00FFFF00FFFF00FFFF00FF
        FF00FFCBC9C8B49E8BA88261C29F80CCAB8DCDAB8FC3A182A98462B19A84C8C4
        C1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC8C5C2BDAFA3B8
        A696B8A696BDAFA3C8C5C2FF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnRewindClick
    end
    object SBLocate: TUniSpeedButton
      Left = 125
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Locate the item in the SQL buffer'
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
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF904820E3BCA0FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF4A4A4ABABABAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA05020A05030E1B89BFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF535353545454B6B6B6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        D08060904820A04820A05020A05020A05020A05020B05830C06840A05030E0B4
        96FF00FFFF00FFFF00FFFF00FFFF00FF8383834A4A4A4D4D4D53535353535353
        53535353535C5C5C6B6B6B545454B2B2B2FF00FFFF00FFFF00FFFF00FFFF00FF
        D08860FFB090F09060F08850F08850F08850F08850E08050D07850C07040A058
        30DEB091FF00FFFF00FFFF00FFFF00FF888888B1B1B19292928B8B8B8B8B8B8B
        8B8B8B8B8B8282827A7A7A7171715A5A5AAEAEAEFF00FFFF00FFFF00FFFF00FF
        E09070FFB890FFA880FFA070FFA070F09860F09060F09060E08850E07850C070
        40B05830FF00FFFF00FFFF00FFFF00FF929292B8B8B8A9A9A9A1A1A1A1A1A198
        98989292929292928888887D7D7D7171715C5C5CFF00FFFF00FFFF00FFFF00FF
        E09870FFC0A0FFC0A0FFB8A0FFB890FFB090FFB080FFA880FFA070E08050B058
        30E8BA9CFF00FFFF00FFFF00FFFF00FF989898C0C0C0C0C0C0BABABAB8B8B8B1
        B1B1AFAFAFA9A9A9A1A1A18282825C5C5CB8B8B8FF00FFFF00FFFF00FFFF00FF
        F0A070E09870E09070D08860D08860D08860D08860E09070F09870B05830EABF
        A1FF00FFFF00FFFF00FFFF00FFFF00FFA0A0A098989892929288888888888888
        88888888889292929A9A9A5C5C5CBDBDBDFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE09870C07850ECC2A6FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF989898797979C0C0C0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0A070F2CCB2FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFA0A0A0CACACAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      OnClick = GoToBufferItem1Click
    end
  end
  object ListBox1: TUniListBox
    Left = 0
    Top = 30
    Width = 314
    Height = 239
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    MultiSelect = True
    OnClick = ListBox1Click
    OnMouseDown = ListBox1MouseDown
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 272
    Width = 314
    Height = 102
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Memo1: TUniMemo
      Left = 1
      Top = 1
      Width = 312
      Height = 100
      Hint = ''
      ScrollBars = ssVertical
      Lines.Strings = (
        '')
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      WordWrap = False
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 280
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object About1: TUniMenuItem
      Caption = '&About'
      object Help1: TUniMenuItem
        Caption = '&Help'
        OnClick = Help1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'View Buffer'
    Version = 'Feature unsupported'
    Left = 72
    Top = 88
  end
  object PopupMenu1: TUniPopupMenu
    Left = 160
    Top = 104
    object GoToBufferItem1: TUniMenuItem
      Caption = 'Locate the item in the SQL buffer'
      OnClick = GoToBufferItem1Click
    end
  end
end
