object FrmOutsourceCentralReorder: TFrmOutsourceCentralReorder
  Left = 0
  Top = 0
  ClientHeight = 415
  ClientWidth = 719
  Caption = 'Outsource Reorder Point'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 719
    Height = 29
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnSearch: TUniSpeedButton
      Left = 2
      Top = 2
      Width = 26
      Height = 25
      Hint = 'Search ...'
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
      Left = 479
      Top = 1
      Width = 240
      Height = 27
      Hint = ''
      DataSource = SrcReorder
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
    object Panel2: TUniPanel
      Left = 445
      Top = 1
      Width = 34
      Height = 27
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object sbtnAddMultipleFiles: TUniSpeedButton
        Left = 2
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Add multiple Item # / Vendor'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF164E010963000963001750
          01FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF424242808080808080808080FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFC8C5C2A587659B774D98754B8A6D3A045E0000D81D00D70000D70400DA
          391C5D05FF00FFFF00FFFF00FFFF00FFFF00FFC5C5C584848473737371717180
          8080808080BABABABABABABABABABDBDBD808080FF00FFFF00FFC9C6C19B774D
          9E7445A67848AD7E4DE6C195EAC79904600100DC5700D820FFFFFFFAFAFA00DA
          3600DC671C5D05FF00FFC5C5C57373737070707474747A7A7ABCBCBCC2C2C280
          8080C1C1C1BBBBBBFFFFFFFAFAFABDBDBDC3C3C3808080FF00FFFF00FFAC8C57
          ECCBA0B68553AE7F4DA976451C5D0531DF8800DC5E00DA39FFFFFFFAFAFA00DA
          4800DD6B43E4971C5A01FF00FF868686C6C6C68181817B7B7B737373808080C9
          C9C9C2C2C2BDBDBDFFFFFFFAFAFABEBEBEC4C4C4CFCFCF808080C3BBB1A67341
          AE7947ECCDA5EDCFA7E0C1991C5D0523DD80FEFEFEFAFAFAFFFFFFFAFAFAFAFA
          FAFFFFFF18DD791C5D05BABABA707070767676C8C8C8CACACABCBCBC808080C6
          C6C6FEFEFEFAFAFAFFFFFFFAFAFAFAFAFAFFFFFFC6C6C6808080CBCAC7AE844F
          A37744A37A4BA67E4FAD84541C5D0500DD6BFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF00DD6E1C5D05C9C9C97F7F7F7373737575757979797F7F7F808080C4
          C4C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C4C4808080FF00FFCAC9C6
          A37D40F1C694F1CF9FF1CFA21C5D0500DC6200DD6E4FDF95FFFFFFFFFFFF5BDF
          9B18DD791DE2821C5D05FF00FFC8C8C8777777C1C1C1C9C9C9CACACA808080C2
          C2C2C4C4C4CBCBCBFFFFFFFFFFFFCCCCCCC6C6C6CACACA808080FF00FFFF00FF
          B9AA8AECC594FAE0B7FAE3BDFAE3BD1C5D0512DD7779E0AAFFFFFFFFFFFF70E0
          A623DD801C5D05FF00FFFF00FFFF00FFA5A5A5C0C0C0DBDBDBDEDEDEDEDEDE80
          8080C5C5C5D1D1D1FFFFFFFFFFFFD0D0D0C6C6C6808080FF00FFFF00FFFF00FF
          FF00FFBD9E69FFE9C5FFF1D0FFF1D3FFF1D31C5D0500DD6775E0A859E09900DF
          691C5D05BCA07DCAC9C7FF00FFFF00FFFF00FF979797E4E4E4ECECECEDEDEDED
          EDED808080C3C3C3D0D0D0CDCDCDC5C5C58080809C9C9CC9C9C9FF00FFFF00FF
          FF00FFB39E76F9E2BDFFF5D8FFF7DFFFF7DFFFF7DF1C5D051C5D051C5D051C5D
          05E8DABCAA895EC4BFB6FF00FFFF00FFFF00FF999999DDDDDDF0F0F0F3F3F3F3
          F3F3F3F3F3808080808080808080808080D5D5D5848484BEBEBEFF00FFFF00FF
          FF00FFCAC8C4C8AC7CFFF4DBFFFBE7FFFBE8FFFBE8FFFBE8FFFBE8FFFBE8D7C1
          9FE2D7C1A98A66CCCBCBFF00FFFF00FFFF00FFC7C7C7A6A6A6F0F0F0F8F8F8F8
          F8F8F8F8F8F8F8F8F8F8F8F8F8F8BDBDBDD4D4D4868686CBCBCBFF00FFFF00FF
          FF00FFFF00FFB29C72F9E6CBFFFAE9FFFDF0FFFDF0FFFDF0FFFDF0FFFDF0F9F3
          E0BC9F7DDFC4A3C4BFB6FF00FFFF00FFFF00FFFF00FF969696E2E2E2F8F8F8FB
          FBFBFBFBFBFBFBFBFBFBFBFBFBFBF0F0F09B9B9BC0C0C0BEBEBEFF00FFFF00FF
          FF00FFFF00FFCAC9C6BDA072FFF1E2FFFAF0FFFDF4FFFDF4FFFBF3FFFBF3FDFA
          EFB69972B4A485CBCAC8FF00FFFF00FFFF00FFFF00FFC8C8C89A9A9AEFEFEFF9
          F9F9FCFCFCFCFCFCFAFAFAFAFAFAF9F9F99494949F9F9FCACACAFF00FFFF00FF
          FF00FFFF00FFFF00FFBFB49DDABC99FFF0E0FFF3E7FFF3E6FFF1E4FAEADBF1E0
          CBE3CAAB9B7D54FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1B1B1B8B8B8EE
          EEEEF2F2F2F2F2F2F0F0F0E9E9E9DDDDDDC6C6C6797979FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFB6A580AD8C59A98A57A68954A48A55A9915FB09C
          71B7A887BFB49DCCCBCBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0A0A086
          86868484848282828383838A8A8A969696A3A3A3B1B1B1CBCBCBFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnAddMultipleFilesClick
      end
    end
  end
  inline wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 29
    Width = 719
    Height = 386
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    ExplicitTop = 29
    ExplicitWidth = 719
    ExplicitHeight = 386
    inherited PageControl: TUniPageControl
      Width = 719
      Height = 357
      ExplicitWidth = 719
      ExplicitHeight = 357
      inherited GridTab: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 711
        ExplicitHeight = 329
        inherited DBGrid: TUniDBGrid
          Width = 502
          Height = 300
          Columns = <>
        end
        inherited GridEditorsPanel: TUniHiddenPanel
          Left = 502
          Height = 300
          ExplicitLeft = 502
          ExplicitHeight = 300
        end
        inherited GridToolBar: TUniToolBar
          Width = 711
          ExplicitWidth = 711
        end
      end
      inherited FormTab: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 711
        ExplicitHeight = 329
      end
    end
    inherited TopToolBar: TUniToolBar
      Width = 719
      ExplicitWidth = 719
    end
    inherited ImgList: TUniNativeImageList
      Images = {
        0C000000FFFFFF1F049900000089504E470D0A1A0A0000000D49484452000000
        100000001008060000001FF3FF61000000097048597300000EC300000EC301C7
        6FA8640000004B49444154388D63601868C0C8C0C0C0505454F49F548D7D7D7D
        8C0C0C0C0C4C94BA806203181818205E40069B376FC6CB47F632C52E608131B6
        6CD9822241883FEA052A7A81E2A43CF000005FBCA0DF38F75F2F000000004945
        4E44AE426082FFFFFF1F04BA00000089504E470D0A1A0A0000000D4948445200
        0000100000001008060000001FF3FF61000000097048597300000EC300000EC3
        01C76FA8640000006C49444154388D63FCFFFF3F0325808922DD0C0C0C2C0C0C
        0C0C7ECD3BC972C6A65A77468A5D40B1010CFFFFFF67282A2AFA4F2A80EA8184
        012ED0D8D88855BCBEBE1ECE46310059034C11B2626C86A21880AE189F2BB01A
        80CFA9641930D2C2A0B8B898A0626C8091D2EC0C00A47660F25BD5D33D000000
        0049454E44AE426082FFFFFF1F04AF00000089504E470D0A1A0A0000000D4948
        4452000000100000001008060000001FF3FF61000000097048597300000EC300
        000EC301C76FA8640000006149444154388D63FCFFFF3F03258005C6282E2EC6
        6A526F6F2FA377DD26AC725B9BFC1859D014A328282E2E26DE05F8C0D6263F46
        BC06E0723E21390606060686FFFFFF33141515FD2707141515FD6722C60BF8C0
        A801A3063030A0E646B20C0000BDE4512706F208350000000049454E44AE4260
        82FFFFFF1F043801000089504E470D0A1A0A0000000D49484452000000100000
        001008060000001FF3FF61000000097048597300000EC300000EC301C76FA864
        000000EA49444154388DA593BD6DC33014843F05426A975E20BD536983B09256
        7036084CD5C203A5019C119C15548923B8F20059C05B9C2BCA3622C149740D09
        82F7C3C363268925785AC406F2B4A9BAF8AF288B132C16A06C874F4978EF4FFA
        23BCF7CA818FAA8BAB17288023B0B93508214C1A9B19702D71FBBD7A03284208
        A348BA94D629D124F0056CAB2ED29BFD4832972275204994ED7028DB41653B1C
        243D4B7AD849EA0080BE71EF5517199334AE008E2184CD94F15D071343742762
        66B3C5E67DE3B2F9078299BD4E1C8F869924CE7BF7EB315EEF629604EABABEFE
        85F52E3E249FF78E445C9A60C405D6E1B84A5BDA13F60000000049454E44AE42
        6082FFFFFF1F04BD00000089504E470D0A1A0A0000000D494844520000001000
        00001008060000001FF3FF61000000097048597300000EC300000EC301C76FA8
        640000006F49444154388DCD51410EC0200CA23E59DF51BEBC1D1613E76875A7
        8DC4C4D206B0025FC3C6A2D67AF43B495BF10050664577974E112F5D46B78897
        092297AC7F1368ADA502AA5F802BBE5257F1DDFDC63F96380FAF2097B40B9256
        222792D64F962C7DC20E7E22B0FAFF196FE7539CDC17345B4013AFE000000000
        49454E44AE426082FFFFFF1F040D01000089504E470D0A1A0A0000000D494844
        52000000100000001008060000001FF3FF61000000097048597300000EC30000
        0EC301C76FA864000000BF49444154388DA552C10D83300CBC20FE5DA1239429
        F240F50A9D2498904598C11252F3EB9B29BA08A28F928AB6242D701FCB967D3E
        F9ACC671C41EE4E4FC09C00DC0418C56E4FC2846ABCF4672FE6D53E8C9C2F056
        05D99EE1401005397FD94C40CE3380768A51E489CDF594D6E4FC7DAD82F6479E
        5630C792A5AB0800C05A1BFDB6A40B733033FAA1A07E28C0CC60E67504652504
        40362BE81A92AEA1AFFADF043184235A31BA06D2572F2B79C5A0469D9BEB11CF
        A7597C5B315AA55C7800411C3EFFCB0E2E8B0000000049454E44AE426082FFFF
        FF1F04D702000089504E470D0A1A0A0000000D49484452000000100000001008
        060000001FF3FF610000029E4944415478DA9D93CD4B14611CC7BFCFCCACAB90
        2BBBB3F49E11B45DFC03F61A418784A043A5C4CC96A1B3B9BA12168865D98B22
        F662C812E1A615BB5368854891870A32F0525058878E82D5415DA77517D775E7
        B5676633BCECC599790ECF6F7ECFE7F77D7E2FE4C8C9A1256CE25197F37E5D37
        09B101D5070FF186AA8110060C014C6B8327713E58D466D1D7F6F93D3DA504CF
        D5FB75D5621D404F4CF2D08DC97284DCBB2894456FC91AC714CFE754207E4970
        B5DF9155C384C9B260BBDAE2D981A792DF34693C1B707540E2D502FDE90279D0
        2990A65E191B01896E01913ED9D20D582E0ECCCD0B71E5FEA8B4958A2E0226E3
        E061193A2C8D13A29F210F06817F004B03C4F64F906341FB0E3AB573B561B732
        39A6F901160EE075E2307F34F44ED94C328B0A8659BEB6D1500E1C0FF1FC16A0
        A059281454701C8B3217BD170D6D5AE47F42398E501F1D5F655971007D3189EF
        8CC695E74F42BE99EF3FE0F37A4920B00FF3F329CCFDFC0596619D930C217631
        885A50F59A9A0044692CE30006620D7C7BF4B1F272B8DE273547EC2090930908
        62A8A4F4BBB7FBD170FE4D5141FF90E4ED08C7D313C9D3BED9D939545656921D
        3BB723FD278D85851418A69851BB0F4CC3C26A7ECD08ECAF664F855F1401EBD4
        D18775BE48A4C551904824100A9556D0DBD383E68EB70AF936331758CDAD796F
        0C4E4DBE92CFF2A9A525BDA2A29CF3783C5859C92193C9D2EE23CEB2680674DD
        423E5F3076EFE2D9BAA63185AC136D25CF864EF85A5BA38E2D994C4214C5920A
        AE777723DAF541219A6E70F45EE631716471426EF02E2EA474B7DBCD56557990
        CDAE20BD9CA105B00B496784F6B241576E75CDDCBB671B7BA66D3C4DEB420782
        10C35630FEA88E6F0CB738116459862008A57370ED0A9A2F7F5448DFC817A6AC
        A2DC7C3F31BDA9B1FE0BC4F6381BACBE77640000000049454E44AE426082FFFF
        FF1F047803000089504E470D0A1A0A0000000D49484452000000100000001008
        060000001FF3FF61000000017352474200AECE1CE90000000467414D410000B1
        8F0BFC6105000000206348524D00007A26000080840000FA00000080E8000075
        300000EA6000003A98000017709CBA513C000000097048597300000EC400000E
        C401952B0E1B000002E149444154384F8D534B48545118FEEE9D3BE3CC75C649
        2B351D07CB242B2A4451C4208908825AB470D52682A0A0161154206D2ACC85F4
        5845B589A44D24D83B2C3489243403B5AC311FF3141B0747E775E7BE3BE78C3D
        5CD57F398773CF39FFF7FFFFF77F87F3FBFD26CF7148A4D2D0340DFF63826081
        CBE984699AE082C18039371F85DD6E87DBED8685E7C093A169C6CAF5D566B55A
        B0188F239596505E5A02EECBC45753370C6CABD9025DD7B0B42C219D515151E6
        86A6AF06B1DBAD181C0A60F3C6F5588885404281575515F9A208599661158087
        3DA3683DDA05C16A033DFB3578DE442812C7C9B3DDF07D8FC25DE0CAED536493
        7C06C982C69B9C8AC15BBE06BD7D13B05979B64F28423C9EC5E9F33D3871AC09
        4D0D1E284A8EAF1C00B964212BDF648C909387CE2B87D0FD640CB2A2D253389D
        36DCB93F0C87C38EE347EA20493203A6960330D98C8E1B7D90640DBDFD3ECC2F
        64301358469E8DC7D3573E3C7E318ECB17F622939509C13A01604E1038921FAD
        6F369840209240E7A503844C1DA954164323611416D870F55A3FEEDE6C85D7E3
        8294557F07A4BEDCE8D8B8293AF2108C28486534B4347BA06B267EC43278F721
        8C81F733A8AC2842EDCE75A47D596CAF29C5D6EAB5988FC6FE90A8929ED7EE28
        C1EEC63264480B15554359493E59CBA4AD594C4EC748401B8A0A9D68BF3EC0F6
        A856A83100C3D0919555428EC2D2A7753F7B3D8D078FC6D075EB303A2EB680E3
        75446359E29C21AA9508E05F245242A92CE9B058382C2514DCBEF7116D675A90
        4C66D0D6FE1632A9BD7E573173A214183922409E01477E0C16996622491A4E9D
        7B8983FBABD1DC588C744A263D572112ED3F7F330551B4338E0CA25246229572
        2A9D46A5D7C31E93697218188C60DF9E4A02AA30B92E2E6BF8FC6D81F0221239
        3BB0A1D485B9B95938C57C70E170C81C1EF984A03F084F453943A50A54547DA5
        5D606559789E9548CDEF0FC1E3F5A2A1BE0EEC390B8280E9E91924534976E15F
        E672BA5055B58964ACE1279E8D7FDFFABBDA8F0000000049454E44AE426082FF
        FFFF1F049301000089504E470D0A1A0A0000000D494844520000001000000010
        0804000000B5FA37EA0000000273424954080855EC4604000000097048597300
        0004B6000004B601672F633D0000001974455874536F66747761726500777777
        2E696E6B73636170652E6F72679BEE3C1A0000011249444154181905C131880D
        000080E1EF5247B944B98191E59294C92D2C0626D47551EE4CB79C4589BAA423
        6FB058B030DCB9C97683D5209358C8A04C32DCE92C575E52F786FB7D9F244992
        24B1603D91244992C48C5D234722C6CDBAEF8653C692C45DC9C83A877D97249F
        5D48CCF92BD9B5C01379E8A4F306FE183AEEA564E88E99B0E5634C58F6C8B433
        06925C4BC20FEFE39664D3941DC98B24E193DFF69897AC58951D03C792849B72
        D5A42D59F2DCAA29D386CE2661BF6D5FED75D1AE0D4B566CBAEC9FB749C4A2BC
        8A654932F04C4E27126BF220660C258F9D93EB89C43E1FE48D430E9AB368C209
        B99D4862DC53F969D681C43DB9944892B8625B46DEF9265F8C2592243169DE9A
        0DBFBC7634C97F6BE6C03B371D0F9F0000000049454E44AE426082FFFFFF1F04
        9001000089504E470D0A1A0A0000000D49484452000000100000001008060000
        001FF3FF610000000473424954080808087C0864880000000970485973000003
        7600000376017DD582CC0000001974455874536F667477617265007777772E69
        6E6B73636170652E6F72679BEE3C1A0000010D49444154388DA5D3B14E954114
        04E06F08465B3B8D113B135EC0572070B1B021A12631F00256BE0325B1B6B096
        C6D0F204B650118DA5151591646C7ECCE5DEFB5F889C6493DDCCCE9C73E6ECA6
        AD87C4EA5D1792ECE2F570BCC6E7B63F6EF09525C447490E718E635CE0083B49
        DEDE29807738C404AF708AF7F88EF5246BA0EDDC1A5ADB5B840DF8637C6C3B5A
        C173FC1E2BADEDD59064B140DB9F78B2A4BD7FB1CC83F53120C91B9C8D0A24D9
        C6B3241F16602FB0DBF60B64F621259960ADED51924FF83564BBC2535CE26BDB
        3F30EBEE160E86FD01B6A7B097589D9BC8D485CD19F2646C8C7302D8C0FE1479
        EB3EE4B6B7FF42927D5CB4FD36368139536F4C4CB2317872725FF22D81FF8DBF
        79D9CDAAE6A330090000000049454E44AE426082FFFFFF1F04A001000089504E
        470D0A1A0A0000000D49484452000000100000001008060000001FF3FF610000
        000473424954080808087C08648800000009704859730000005700000057010E
        14E5780000001974455874536F667477617265007777772E696E6B7363617065
        2E6F72679BEE3C1A0000011D49444154388DC5D1BD2EED511005F0DF3E41DC1C
        213E1AC589422151284878039D44AB260AA58647F0040AD17901894E755A0585
        44A1905051B8570889288C66AEFC8F8F73A232C94A66CF5A6BF6ECD925229452
        7A318F058C61A402B8ADE00A07388C88E782011C631CF738C15FDCE15F3618C2
        2086319D9E0BCC74612DCD97D8C65187067315CF5A17BA53D4832DD4B48F57DC
        64DE5D30994FD8C70AA630817EF4A5F0110F38C72976B188191101EB082C4784
        76C0726AD723C2FF6241134F986D639E4D4D13E5BD41920D9CE1059BA855B85A
        D65E52D378E73EDC50C75E8ED8CCCD0F661EC9D55B3CDF8CBA9A868D4460F52B
        ED975F16113B99FE49546B2DD1E9CF3BC6EF3728B9B4CF44294FB8CEE36844D4
        7F3AC1D237794BBC01E5FFC13EABCA45470000000049454E44AE426082FFFFFF
        1F041D01000089504E470D0A1A0A0000000D4948445200000010000000100806
        0000001FF3FF610000000473424954080808087C086488000000097048597300
        00007400000074013185E5810000001974455874536F66747761726500777777
        2E696E6B73636170652E6F72679BEE3C1A0000009A49444154388DED93310EC2
        300C459FABAE8CB950A79CA5D761E31E08212E10711896AE48666883DC282E3E
        00963CE4C7FFC9C337AA4A6D60B6EFB681049C81F4D59A81F2C3FC045E40A990
        10C098F3669E2A240A7800D9CE6C907B1430F66680D340A054F5EDE84B087054
        7F000C2232F63E3CBDB7C15544A6C69C815B748BC43E9E9935B6C909D52E6C36
        EB85F5505CB30B3090CB91B977F21F49B7153158E1E79A0000000049454E44AE
        426082}
    end
  end
  object wwDBComboDlgItem: TUniEdit
    Left = 32
    Top = 132
    Width = 121
    Height = 21
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 2
    ReadOnly = True
  end
  object wwDBComboDlgVendor: TUniEdit
    Left = 32
    Top = 159
    Width = 121
    Height = 21
    Hint = ''
    Visible = False
    Text = ''
    TabOrder = 3
    ReadOnly = True
  end
  object PkOutsrcReorder: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select o.id as id,'
      '       o.arinvt_id as arinvt_id,'
      '       a.class as class,'
      '       a.itemno as itemno,'
      '       a.rev as rev,'
      '       a.descrip as descrip,'
      '       a.descrip2 as descrip2,'
      '       o.vendor_id as vendor_id,'
      '       v.vendorno as vendorno,'
      '       v.company as company,'
      '       o.safety_stock as safety_stock,'
      '       o.min_order_qty as min_order_qty,'
      '       a.pk_hide as pk_hide'
      '  from outsrc_reorder o,'
      '       arinvt a,'
      '       vendor v'
      ' where o.arinvt_id = a.id(+)'
      '   and o.vendor_id = v.id(+)'
      '       '
      '         ')
    OnIQModify = PkOutsrcReorderIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 32
    Top = 96
    object PkOutsrcReorderID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkOutsrcReorderARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object PkOutsrcReorderCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object PkOutsrcReorderITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object PkOutsrcReorderREV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
    object PkOutsrcReorderDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkOutsrcReorderDESCRIP2: TStringField
      DisplayLabel = 'Ext Item Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object PkOutsrcReorderVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Visible = False
      Size = 0
    end
    object PkOutsrcReorderVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      FieldName = 'VENDORNO'
      FixedChar = True
      Size = 10
    end
    object PkOutsrcReorderCOMPANY: TStringField
      DisplayLabel = 'Vendor Name'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkOutsrcReorderSAFETY_STOCK: TBCDField
      DisplayLabel = 'Reorder Point '
      FieldName = 'SAFETY_STOCK'
    end
    object PkOutsrcReorderMIN_ORDER_QTY: TBCDField
      DisplayLabel = 'Minimum Order'
      FieldName = 'MIN_ORDER_QTY'
    end
    object PkOutsrcReorderPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object SrcReorder: TDataSource
    DataSet = QryOutsrcReorder
    Left = 180
    Top = 96
  end
  object QryOutsrcReorder: TFDQuery
    AfterInsert = QryOutsrcReorderAfterInsert
    BeforePost = QryOutsrcReorderBeforePost
    OnCalcFields = QryOutsrcReorderCalcFields
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select o.id,'
      '       o.arinvt_id,'
      '       o.vendor_id,'
      '       o.safety_stock,'
      '       o.min_order_qty,'
      '       o.max_order_qty'
      '  from outsrc_reorder o,'
      '       arinvt a'
      ' where o.arinvt_id = a.id(+)'
      ' order by a.itemno'
      '       '
      '         ')
    Left = 179
    Top = 124
    object QryOutsrcReorderITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'ITEMNO'
      Origin = 'ITEMNO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      FixedChar = True
      Size = 50
      Calculated = True
    end
    object QryOutsrcReorderDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Size = 100
      Calculated = True
    end
    object QryOutsrcReorderVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'VENDORNO'
      Origin = 'VENDORNO'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      FixedChar = True
      Size = 10
      Calculated = True
    end
    object QryOutsrcReorderCOMPANY: TStringField
      DisplayLabel = 'Vendor Name'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'COMPANY'
      Origin = 'COMPANY'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Size = 60
      Calculated = True
    end
    object QryOutsrcReorderSAFETY_STOCK: TBCDField
      DisplayLabel = 'Reorder Point '
      DisplayWidth = 15
      FieldName = 'SAFETY_STOCK'
      Origin = 'SAFETY_STOCK'
      Precision = 14
    end
    object QryOutsrcReorderMIN_ORDER_QTY: TBCDField
      DisplayLabel = 'Minimum Order '
      DisplayWidth = 15
      FieldName = 'MIN_ORDER_QTY'
      Origin = 'MIN_ORDER_QTY'
      Precision = 14
    end
    object QryOutsrcReorderCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldKind = fkCalculated
      FieldName = 'CLASS'
      Origin = 'CLASS'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      FixedChar = True
      Size = 2
      Calculated = True
    end
    object QryOutsrcReorderREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'REV'
      Origin = 'REV'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      FixedChar = True
      Size = 15
      Calculated = True
    end
    object QryOutsrcReorderDESCRIP2: TStringField
      DisplayLabel = 'Ext Item Description'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'DESCRIP2'
      Origin = 'DESCRIP2'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Size = 100
      Calculated = True
    end
    object QryOutsrcReorderID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryOutsrcReorderARINVT_ID: TBCDField
      DisplayLabel = 'Item'
      FieldName = 'ARINVT_ID'
      Origin = 'ARINVT_ID'
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryOutsrcReorderVENDOR_ID: TBCDField
      DisplayLabel = 'Vendor'
      FieldName = 'VENDOR_ID'
      Origin = 'VENDOR_ID'
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object PkItemVendor: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select distinct'
      '       a.class as class,'
      '       a.itemno as itemno,'
      '       a.rev as rev,'
      '       a.descrip as descrip,'
      '       a.descrip2 as descrip2,'
      '       v.vendorno as vendorno,'
      '       v.company as company,'
      '       a.id as arinvt_id, '
      '       v.id as vendor_id,'
      '       to_char(a.id) || '#39'*'#39' || to_char(v.id) as identifier'
      '  from standard s,'
      '       mfgtype m,'
      '       partno p,'
      '       ptoper,'
      '       opmat,'
      '       arinvt a,'
      '       vendor v'
      ' where rtrim(s.mfg_type) = rtrim(m.mfgtype)'
      '   and rtrim(nvl(m.standard_mfgtype, m.mfgtype)) = '#39'OUTSOURCE'#39
      '   and s.id = p.standard_id '
      '   and rtrim(s.cntr_type) = rtrim(v.vendorno)'
      '   and misc.eplant_filter(a.eplant_id) = 1'
      '   and p.id = ptoper.partno_id'
      '   and ptoper.sndop_id = opmat.sndop_id'
      '   and opmat.arinvt_id = a.id'
      '   and not (a.id, v.id) '
      '           in '
      '           (select arinvt_id, vendor_id from outsrc_reorder)'
      '   and nvl(s.pk_hide, '#39'N'#39') <> '#39'Y'#39
      '               ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 64
    Top = 96
    object PkItemVendorCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Origin = 'a.class'
      FixedChar = True
      Size = 2
    end
    object PkItemVendorITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Origin = 'a.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object PkItemVendorREV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      Origin = 'a.rev'
      FixedChar = True
      Size = 15
    end
    object PkItemVendorDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      Size = 100
    end
    object PkItemVendorDESCRIP2: TStringField
      DisplayLabel = 'Ext Item Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'a.descrip2'
      Size = 100
    end
    object PkItemVendorVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      FieldName = 'VENDORNO'
      Origin = 'v.vendorno'
      FixedChar = True
      Size = 10
    end
    object PkItemVendorCOMPANY: TStringField
      DisplayLabel = 'Vendor Name'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Origin = 'v.company'
      Size = 60
    end
    object PkItemVendorARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object PkItemVendorVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Visible = False
      Size = 0
    end
    object PkItemVendorIDENTIFIER: TStringField
      FieldName = 'IDENTIFIER'
      Visible = False
      Size = 81
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 28
    Top = 192
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmOutsourceCentralReorder'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 197130 $'
    BuildVersion = '176554'
    Left = 28
    Top = 224
  end
end
