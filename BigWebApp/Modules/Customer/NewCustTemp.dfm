object FrmCustTemplate: TFrmCustTemplate
  Left = 0
  Top = 0
  HelpContext = 996931
  ClientHeight = 399
  ClientWidth = 875
  Caption = 'New Customer Template'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 137
    Width = 875
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
    Width = 875
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnTableForm: TUniSpeedButton
      Left = 25
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Toggle Table / Form View'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000A0860100A08601000001000000000000000000001212
        1200282828003E3E3E006A6A6A006F6F6F00800000008B09020097130300A21C
        0500AA230600AD250700B52C0800B92F0900C0340A00C4380A00CA3D0B00CF41
        0C00D5460D00D8511900DA5A2400DD663100E06E3A00E37C4900E5825000F08C
        6800E9916100EA966700EFAB7E00FF00FF00808080008A8A8A008F8F8F009494
        9400999999009F9F9F00A4A4A400A9A9A900ADADAD00AEAEAE00B0B0B000B3B3
        B300B4B4B400B7B7B700B8B8B800BABABA00BDBDBD00F4BF9400FAD3AA00C0C0
        C000C2C2C200C3C3C300C6C6C600C8C8C800C9C9C900CDCDCD00E0E0E000F9F9
        FB00FFFFFF000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001D1D1D1D0505
        050505050505050505051D1D1D1D0505050505050505050505051D1D1D1D1E2C
        29272524232221201F051D1D1D1D1E2C29272524232221201F051D1D1D1D1E2E
        2C2927250302010020051D1D1D1D1E2E2C2927250302010020051D1D1D1D1E32
        2E2C29271E3A3A0021051D1D1D1D1E322E2C29271E3A3A0021051D1D1D1D1E35
        2A2004291E1E1E1E22051D1D1D1D1E352A2004291E1E1E1E22051D1D1D1D1E37
        35322E2C2927252423051D1D1D1D1E3735322E2C2927252423051E1E1E1E1A17
        1513110F0D0B090807061E1E1E1E211E050403030303030202021E3838381A19
        191919191919191919061E3838382120202020202020202020021E3939391A17
        1513110F0D0B090807061E393939211E050403030303030202021E393331392D
        2B392826391E1D1D1D1D1E393331392D2B392826391E1D1D1D1D1E3939393939
        39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D1E3936343931
        2E392B2A391E1D1D1D1D1E39363439312E392B2A391E1D1D1D1D1E3939393939
        39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D302F1C1B1816
        1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D301919191919
        19191919190A1D1D1D1D3720202020202020202020031D1D1D1D302F1C1B1816
        1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnTableFormClick
    end
    object sbSearch: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Search Template'
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
      OnClick = sbSearchClick
    end
    object Nav: TUniDBNavigator
      Left = 650
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      DataSource = SrcTempl
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 27
    Width = 875
    Height = 110
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object PC: TUniPageControl
      Left = 1
      Top = 1
      Width = 873
      Height = 108
      Hint = ''
      ActivePage = TabForm
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabForm: TUniTabSheet
        Hint = ''
        Caption = 'TabForm'
        object PnlFormViewClient01: TUniPanel
          Tag = 1999
          Left = 0
          Top = 0
          Width = 865
          Height = 80
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter2: TUniSplitter
            Left = 105
            Top = 0
            Width = 6
            Height = 80
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlFormViewLeft01: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 105
            Height = 78
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label1: TUniLabel
              Left = 8
              Top = 11
              Width = 74
              Height = 13
              Hint = ''
              Caption = 'Template Name'
              TabOrder = 1
            end
            object Label2: TUniLabel
              Left = 8
              Top = 35
              Width = 53
              Height = 13
              Hint = ''
              Caption = 'Description'
              TabOrder = 2
            end
          end
          object PnlFormViewClient02: TUniPanel
            Tag = 1999
            Left = 111
            Top = 1
            Width = 754
            Height = 78
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            DesignSize = (
              754
              78)
            object dbeTemplateName: TUniDBEdit
              Left = 1
              Top = 8
              Width = 725
              Height = 21
              Hint = ''
              DataField = 'TEMPLATE_NAME'
              DataSource = SrcTempl
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
            object dbeTemplateDescription: TUniDBEdit
              Left = 1
              Top = 32
              Width = 725
              Height = 21
              Hint = ''
              DataField = 'TEMPLATE_DESCRIP'
              DataSource = SrcTempl
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
          end
        end
      end
      object TabGrid: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'TabGrid'
        inline wwDBGrid1: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 865
          Height = 80
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          ExplicitWidth = 865
          ExplicitHeight = 80
          inherited PageControl: TUniPageControl
            Width = 865
            Height = 51
            ExplicitWidth = 865
            ExplicitHeight = 51
            inherited GridTab: TUniTabSheet
              ExplicitLeft = 4
              ExplicitTop = 24
              ExplicitWidth = 857
              ExplicitHeight = 23
              inherited DBGrid: TUniDBGrid
                Width = 648
                Columns = <>
              end
              inherited GridEditorsPanel: TUniHiddenPanel
                Left = 648
                ExplicitLeft = 648
              end
              inherited GridToolBar: TUniToolBar
                Width = 857
                ExplicitWidth = 857
              end
            end
            inherited FormTab: TUniTabSheet
              ExplicitLeft = 4
              ExplicitTop = 24
              ExplicitWidth = 857
              ExplicitHeight = 23
            end
          end
          inherited TopToolBar: TUniToolBar
            Width = 865
            ExplicitWidth = 865
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
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 140
    Width = 875
    Height = 259
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object pcCustomerDetail: TUniPageControl
      Left = 1
      Top = 1
      Width = 873
      Height = 257
      Hint = ''
      ActivePage = TabCredit
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabCredit: TUniTabSheet
        Hint = ''
        Caption = 'Credit Status'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object sbCreditStatus: TUniScrollBox
          Left = 0
          Top = 0
          Width = 865
          Height = 229
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          ScrollHeight = 121
          object Panel21: TUniPanel
            Left = 0
            Top = 0
            Width = 863
            Height = 121
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Caption = ''
            ExplicitWidth = 867
            object Splitter8: TUniSplitter
              Left = 262
              Top = 0
              Width = 6
              Height = 121
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object Splitter9: TUniSplitter
              Left = 573
              Top = 0
              Width = 6
              Height = 121
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object PnlCredStatus01: TUniPanel
              Left = 1
              Top = 1
              Width = 262
              Height = 119
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              object Splitter5: TUniSplitter
                Left = 79
                Top = 0
                Width = 6
                Height = 119
                Hint = ''
                Align = alLeft
                ParentColor = False
                Color = clBtnFace
              end
              object PnlCredStatusLeft01: TUniPanel
                Left = 1
                Top = 1
                Width = 79
                Height = 117
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 0
                Caption = ''
                object lblStatus: TUniLabel
                  Left = 8
                  Top = 4
                  Width = 31
                  Height = 13
                  Hint = ''
                  Caption = 'Status'
                  TabOrder = 1
                end
                object lblTerms: TUniLabel
                  Left = 8
                  Top = 28
                  Width = 29
                  Height = 13
                  Hint = ''
                  Caption = 'Terms'
                  TabOrder = 2
                end
              end
              object PnlCredStatusClient01: TUniPanel
                Left = 85
                Top = 1
                Width = 177
                Height = 117
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                ExplicitLeft = 82
                ExplicitWidth = 180
                ExplicitHeight = 121
                DesignSize = (
                  177
                  117)
                object dbcStatus: TUniDBComboBox
                  Left = -1
                  Top = 1
                  Width = 178
                  Height = 21
                  Hint = ''
                  Anchors = [akLeft, akTop, akRight]
                  DataField = 'STATUS_ID'
                  DataSource = SrcTempl
                  Items.Strings = (
                    'Active'
                    'Inactive'
                    'Quote'
                    'Cr Hold'
                    'Ship Hold'
                    'Mfg Hold'
                    'Obsolete')
                  TabOrder = 0
                end
                object cmbTerms: TUniDBLookupComboBox
                  Left = 1
                  Top = 25
                  Width = 178
                  Height = 21
                  Hint = ''
                  ListField = 'DESCRIPTION'
                  ListSource = SrcTerms
                  KeyField = 'ID'
                  ListFieldIndex = 0
                  DataField = 'TERMS_ID'
                  DataSource = SrcTempl
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                  Color = clWindow
                end
                object dbchkCharge: TUniDBCheckBox
                  Left = 1
                  Top = 48
                  Width = 102
                  Height = 21
                  Hint = ''
                  DataField = 'FINANCE_CHARGE'
                  DataSource = SrcTempl
                  ValueChecked = 'Y'
                  ValueUnchecked = 'N'
                  Caption = 'Finance Charge'
                  TabOrder = 2
                end
              end
            end
            object PnlCredStatus02: TUniPanel
              Left = 268
              Top = 1
              Width = 305
              Height = 119
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 1
              Caption = ''
              object Splitter6: TUniSplitter
                Left = 117
                Top = 0
                Width = 6
                Height = 119
                Hint = ''
                Align = alLeft
                ParentColor = False
                Color = clBtnFace
              end
              object PnlCredStatusLeft02: TUniPanel
                Left = 1
                Top = 1
                Width = 117
                Height = 117
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 0
                Caption = ''
                object lblSalesperson: TUniLabel
                  Left = 8
                  Top = 4
                  Width = 71
                  Height = 13
                  Hint = ''
                  Caption = 'Salesperson(s)'
                  TabOrder = 1
                end
                object lblTerritory: TUniLabel
                  Left = 8
                  Top = 28
                  Width = 42
                  Height = 13
                  Hint = ''
                  Caption = 'Territory'
                  TabOrder = 2
                end
                object lblDunningGroup: TUniLabel
                  Left = 8
                  Top = 52
                  Width = 71
                  Height = 13
                  Hint = ''
                  Caption = 'Dunning Group'
                  TabOrder = 3
                end
              end
              object PnlCredStatusClient02: TUniPanel
                Left = 123
                Top = 1
                Width = 182
                Height = 117
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                ExplicitLeft = 120
                ExplicitWidth = 185
                ExplicitHeight = 121
                DesignSize = (
                  182
                  117)
                object cmbSalesperson: TUniDBLookupComboBox
                  Left = 1
                  Top = 1
                  Width = 180
                  Height = 21
                  Hint = ''
                  ListFieldIndex = 0
                  DataField = 'COMMISSIONS_ID'
                  DataSource = SrcTempl
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 0
                  Color = clWindow
                end
                object dbeTerr: TIQWebUDComboBox
                  Left = 1
                  Top = 25
                  Width = 180
                  Height = 21
                  Hint = 'Right click to edit the list'
                  HelpContext = -57
                  ShowHint = True
                  ParentShowHint = False
                  Anchors = [akLeft, akTop, akRight]
                  DataField = 'TERRITORY'
                  DataSource = SrcTempl
                  TabOrder = 1
                  KeyTableName = 'ARCUSTO'
                  KeyFieldName = 'TERRITORY'
                end
                object cmbDunningGroup: TUniDBLookupComboBox
                  Left = 1
                  Top = 49
                  Width = 180
                  Height = 21
                  Hint = ''
                  ListFieldIndex = 0
                  DataField = 'DUNNING_GROUP_ID'
                  DataSource = SrcTempl
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 2
                  Color = clWindow
                end
                object chkExcludeDunning: TUniDBCheckBox
                  Left = 1
                  Top = 72
                  Width = 137
                  Height = 21
                  Hint = 'Do not send Dunning Letters to this customer'
                  DataField = 'DUNNING_EXCLUDE'
                  DataSource = SrcTempl
                  ValueChecked = 'Y'
                  ValueUnchecked = 'N'
                  Caption = 'Exclude from Dunning'
                  TabOrder = 3
                end
              end
            end
            object PnlCredStatus03: TUniPanel
              Left = 579
              Top = 1
              Width = 284
              Height = 119
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 2
              Caption = ''
              object Splitter7: TUniSplitter
                Left = 162
                Top = 0
                Width = 6
                Height = 119
                Hint = ''
                Align = alLeft
                ParentColor = False
                Color = clBtnFace
              end
              object PnlCredStatusLeft03: TUniPanel
                Left = 1
                Top = 1
                Width = 162
                Height = 117
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 0
                Caption = ''
                object lblCreditLimit: TUniLabel
                  Left = 8
                  Top = 3
                  Width = 53
                  Height = 13
                  Hint = ''
                  Caption = 'Credit Limit'
                  TabOrder = 1
                end
                object lblDiscount: TUniLabel
                  Left = 8
                  Top = 27
                  Width = 55
                  Height = 13
                  Hint = ''
                  Caption = 'Discount %'
                  TabOrder = 2
                end
                object lblCommission: TUniLabel
                  Left = 8
                  Top = 75
                  Width = 69
                  Height = 13
                  Hint = ''
                  Caption = 'Commission %'
                  TabOrder = 3
                end
                object LblCurrency: TUniLabel
                  Left = 8
                  Top = 99
                  Width = 44
                  Height = 13
                  Hint = ''
                  Caption = 'Currency'
                  TabOrder = 4
                end
              end
              object PnlCredStatusClient03: TUniPanel
                Left = 168
                Top = 1
                Width = 116
                Height = 117
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                ExplicitLeft = 165
                ExplicitWidth = 129
                ExplicitHeight = 121
                DesignSize = (
                  116
                  117)
                object dbeCreditLimit: TUniDBEdit
                  Left = 1
                  Top = 1
                  Width = 121
                  Height = 21
                  Hint = ''
                  DataField = 'CREDIT_LIMIT'
                  DataSource = SrcTempl
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 0
                end
                object dbeDiscount: TUniDBEdit
                  Left = 1
                  Top = 24
                  Width = 121
                  Height = 21
                  Hint = ''
                  DataField = 'DISCOUNT'
                  DataSource = SrcTempl
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                end
                object DbeCommission: TUniDBEdit
                  Left = 1
                  Top = 72
                  Width = 121
                  Height = 21
                  Hint = ''
                  HelpContext = -58
                  DataField = 'COMM_PCNT'
                  DataSource = SrcTempl
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 3
                end
                object DBTierDiscount: TUniDBCheckBox
                  Left = 1
                  Top = 48
                  Width = 124
                  Height = 15
                  Hint = ''
                  DataField = 'USE_DISCOUNT_TIER'
                  DataSource = SrcTempl
                  ValueChecked = 'Y'
                  ValueUnchecked = 'N'
                  Caption = 'Discount Tier Price'
                  TabOrder = 2
                end
                object cbCurrency: TUniDBLookupComboBox
                  Left = 1
                  Top = 96
                  Width = 121
                  Height = 21
                  Hint = ''
                  ListFieldIndex = 0
                  DataField = 'CURRENCY_ID'
                  DataSource = SrcTempl
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 4
                  Color = clWindow
                end
              end
            end
          end
        end
      end
      object TabAI: TUniTabSheet
        Hint = ''
        Caption = 'Auto Invoicing'
        object Splitter11: TUniSplitter
          Left = 441
          Top = 0
          Width = 6
          Height = 229
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlAutoInvoice01: TUniPanel
          Left = 0
          Top = 0
          Width = 441
          Height = 229
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter10: TUniSplitter
            Left = 193
            Top = 0
            Width = 6
            Height = 229
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlAutoInvoiceLeft01: TUniPanel
            Left = 1
            Top = 1
            Width = 193
            Height = 227
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label28: TUniLabel
              Left = 8
              Top = 3
              Width = 119
              Height = 13
              Hint = ''
              Caption = 'Auto Invoicing technique'
              TabOrder = 1
            end
          end
          object PnlAutoInvoiceClient01: TUniPanel
            Left = 199
            Top = 1
            Width = 242
            Height = 227
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            DesignSize = (
              242
              227)
            object dbAI: TUniDBComboBox
              Left = 1
              Top = 1
              Width = 244
              Height = 21
              Hint = ''
              Anchors = [akLeft, akTop, akRight]
              DataField = 'AUTOINVOICE_TECHNIQUE'
              DataSource = SrcTempl
              Items.Strings = (
                'One Invoice per Packing Slip'#9'One Inv. per PS'
                'One Invoice per Unique PO/PS'#9'One Inv. per Unique PO/PS')
              TabOrder = 0
            end
            object chkPSDateOnInvoice: TUniDBCheckBox
              Left = 1
              Top = 24
              Width = 209
              Height = 17
              Hint = ''
              DataField = 'PS_DATE_ON_INVOICE'
              DataSource = SrcTempl
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Use Ship date when auto invoicing'
              TabOrder = 1
            end
          end
        end
        object PnlAutoInvoice02: TUniPanel
          Left = 447
          Top = 0
          Width = 418
          Height = 229
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
        end
      end
      object TabMisc: TUniTabSheet
        Hint = ''
        ImageIndex = 3
        Caption = 'Miscellaneous'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object sbMisc: TUniScrollBox
          Left = 0
          Top = 0
          Width = 865
          Height = 229
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          ScrollHeight = 225
          object Panel4: TUniPanel
            Left = 0
            Top = 0
            Width = 863
            Height = 225
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Caption = ''
            ExplicitWidth = 867
            object Splitter20: TUniSplitter
              Left = 345
              Top = 0
              Width = 6
              Height = 225
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object PnlMisc01: TUniPanel
              Left = 1
              Top = 1
              Width = 345
              Height = 223
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              object Splitter16: TUniSplitter
                Left = 170
                Top = 0
                Width = 6
                Height = 223
                Hint = ''
                Align = alLeft
                ParentColor = False
                Color = clBtnFace
              end
              object PnlMiscLeft01: TUniPanel
                Left = 1
                Top = 1
                Width = 170
                Height = 221
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 0
                Caption = ''
                object Label13: TUniLabel
                  Left = 8
                  Top = 4
                  Width = 97
                  Height = 13
                  Hint = ''
                  Caption = 'Min Change Interval'
                  TabOrder = 1
                end
                object Label20: TUniLabel
                  Left = 8
                  Top = 27
                  Width = 41
                  Height = 13
                  Hint = ''
                  Caption = 'Industry'
                  TabOrder = 2
                end
                object Label68: TUniLabel
                  Left = 8
                  Top = 49
                  Width = 33
                  Height = 13
                  Hint = ''
                  Caption = 'Source'
                  TabOrder = 3
                end
                object Label73: TUniLabel
                  Left = 8
                  Top = 76
                  Width = 83
                  Height = 13
                  Hint = ''
                  Caption = 'Safety Lead Time'
                  TabOrder = 4
                end
                object Label21: TUniLabel
                  Left = 8
                  Top = 101
                  Width = 98
                  Height = 13
                  Hint = ''
                  Caption = 'Price Break Quantity'
                  TabOrder = 5
                end
                object Label92: TUniLabel
                  Left = 8
                  Top = 126
                  Width = 71
                  Height = 13
                  Hint = ''
                  Caption = 'AR GL Account'
                  TabOrder = 6
                end
                object Label129: TUniLabel
                  Left = 8
                  Top = 150
                  Width = 88
                  Height = 13
                  Hint = ''
                  Caption = 'Rebate Parameter'
                  TabOrder = 7
                end
                object Label133: TUniLabel
                  Left = 8
                  Top = 175
                  Width = 94
                  Height = 13
                  Hint = ''
                  Caption = 'Web Payment Type'
                  TabOrder = 8
                end
                object Label134: TUniLabel
                  Left = 8
                  Top = 200
                  Width = 135
                  Height = 13
                  Hint = ''
                  Caption = 'Cash Receipt Payment Type'
                  TabOrder = 9
                end
              end
              object PnlMiscClient01: TUniPanel
                Left = 176
                Top = 1
                Width = 169
                Height = 221
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                Caption = ''
                ExplicitLeft = 173
                ExplicitWidth = 172
                ExplicitHeight = 225
                DesignSize = (
                  169
                  221)
                object SbRebateParam: TUniSpeedButton
                  Left = 150
                  Top = 149
                  Width = 22
                  Height = 22
                  Hint = 'Search and replace Rebate Parameter'
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
                  OnClick = SbRebateParamClick
                end
                object SBGLAcct: TUniSpeedButton
                  Left = 150
                  Top = 123
                  Width = 22
                  Height = 22
                  Hint = 'Search and replace AR GL Account'
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
                  OnClick = SBGLAcctClick
                end
                object wwDBMinCharge: TUniDBNumberEdit
                  Left = 1
                  Top = 1
                  Width = 171
                  Height = 21
                  Hint = 
                    'Minimum number of days that is acceptable between order revision' +
                    's'
                  ParentShowHint = False
                  DataField = 'MIN_CHANGE_INTERVAL'
                  DataSource = SrcTempl
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 0
                  MaxValue = 366.000000000000000000
                  MinValue = 1.000000000000000000
                  DecimalSeparator = '.'
                end
                object dbeIndustry: TIQWebUDComboBox
                  Left = 1
                  Top = 24
                  Width = 171
                  Height = 21
                  Hint = 'Right click to edit the list'
                  HelpContext = -42
                  ShowHint = True
                  ParentShowHint = False
                  Anchors = [akLeft, akTop, akRight]
                  DataField = 'INDUSTRY'
                  DataSource = SrcTempl
                  TabOrder = 1
                  KeyTableName = 'ARCUSTO'
                  KeyFieldName = 'INDUSTRY'
                end
                object dbeMiscSource: TUniDBEdit
                  Left = 1
                  Top = 49
                  Width = 171
                  Height = 21
                  Hint = ''
                  HelpContext = -43
                  DataField = 'SOURCE'
                  DataSource = SrcTempl
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 2
                end
                object dbeSafetyleadTime: TUniDBEdit
                  Left = 1
                  Top = 73
                  Width = 171
                  Height = 21
                  Hint = 'Safety Lead Time in days. Used in AutoLoad.'
                  HelpContext = -42
                  DataField = 'SAFETY_LEAD_TIME'
                  DataSource = SrcTempl
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 3
                end
                object dbePriceBrkQty: TUniDBEdit
                  Left = 1
                  Top = 98
                  Width = 171
                  Height = 21
                  Hint = ''
                  HelpContext = -42
                  DataField = 'QTY_PRICE_BREAK'
                  DataSource = SrcTempl
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 4
                end
                object wwGlAcct: TUniDBLookupComboBox
                  Left = 1
                  Top = 123
                  Width = 145
                  Height = 21
                  Hint = ''
                  ListFieldIndex = 0
                  DataField = 'AR_GLACCT_ID'
                  DataSource = SrcTempl
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 5
                  Color = clWindow
                end
                object DBRebateParam: TUniDBEdit
                  Left = 1
                  Top = 147
                  Width = 145
                  Height = 21
                  Hint = ''
                  DataField = 'RebateParam'
                  DataSource = SrcTempl
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 6
                  Color = clBtnFace
                  ReadOnly = True
                end
                object cmbWebPaymentType: TUniDBComboBox
                  Left = 1
                  Top = 172
                  Width = 171
                  Height = 21
                  Hint = ''
                  Anchors = [akLeft, akTop, akRight]
                  DataField = 'WEB_PAYMENT_TYPE'
                  DataSource = SrcTempl
                  Style = csDropDownList
                  Items.Strings = (
                    'COD'#9'COD'
                    'Pre-Paid'#9'Pre-Paid'
                    'On Account'#9'On Account'
                    'Credit Card'#9'Credit Card')
                  TabOrder = 7
                end
                object DBRecPayType: TUniDBComboBox
                  Left = 1
                  Top = 197
                  Width = 171
                  Height = 21
                  Hint = ''
                  Anchors = [akLeft, akTop, akRight]
                  DataField = 'REF_TYPE'
                  DataSource = SrcTempl
                  Items.Strings = (
                    'ACH'#9'ACH'
                    'Adjustment'#9'ADJUSTMENT'
                    'Cash'#9'CASH'
                    'Check'#9'CHECK'
                    'Credit Card'#9'CREDIT_CARD'
                    'EDI'#9'EDI'
                    'Lock Box'#9'LOCK BOX'
                    'PayPal'#9'PAYPAL'
                    'Wire Transfer'#9'WIRE TRANSFER')
                  TabOrder = 8
                end
              end
            end
            object PnlMisc02: TUniPanel
              Left = 351
              Top = 1
              Width = 512
              Height = 223
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              object PnlMiscClient02: TUniPanel
                Left = 1
                Top = 1
                Width = 510
                Height = 221
                Hint = ''
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
                Caption = ''
                DesignSize = (
                  510
                  221)
                object dbchkOnePO: TUniDBCheckBox
                  Left = 8
                  Top = 16
                  Width = 151
                  Height = 17
                  Hint = ''
                  DataField = 'ONE_PO_PER_PS'
                  DataSource = SrcTempl
                  ValueChecked = 'Y'
                  ValueUnchecked = 'N'
                  Caption = 'One PO # per Packing Slip'
                  TabOrder = 1
                end
                object dbchkOneSO: TUniDBCheckBox
                  Left = 8
                  Top = 32
                  Width = 152
                  Height = 17
                  Hint = ''
                  DataField = 'ONE_SO_PER_PS'
                  DataSource = SrcTempl
                  ValueChecked = 'Y'
                  ValueUnchecked = 'N'
                  Caption = 'One SO # per Packing Slip'
                  TabOrder = 2
                end
                object dbchkPS_PreserveRAN: TUniDBCheckBox
                  Left = 8
                  Top = 64
                  Width = 97
                  Height = 17
                  Hint = ''
                  DataField = 'PS_PRESERVE_RAN'
                  DataSource = SrcTempl
                  ValueChecked = 'Y'
                  ValueUnchecked = 'N'
                  Caption = 'Preserve RAN#'
                  TabOrder = 4
                end
                object DBCheckBox3: TUniDBCheckBox
                  Left = 8
                  Top = 80
                  Width = 201
                  Height = 17
                  Hint = ''
                  DataField = 'COC_REQUIRED'
                  DataSource = SrcTempl
                  ValueChecked = 'Y'
                  ValueUnchecked = 'N'
                  Caption = 'Certificate of Conformance Required'
                  TabOrder = 5
                end
                object dbchkMakeToOrder: TUniDBCheckBox
                  Left = 8
                  Top = 112
                  Width = 147
                  Height = 17
                  Hint = ''
                  DataField = 'IS_MAKE_TO_ORDER'
                  DataSource = SrcTempl
                  ValueChecked = 'Y'
                  ValueUnchecked = 'N'
                  Caption = 'Make-To-Order Allocation'
                  TabOrder = 7
                end
                object dbchkTrackingRequired: TUniDBCheckBox
                  Left = 8
                  Top = 96
                  Width = 120
                  Height = 17
                  Hint = ''
                  DataField = 'TRACKING_REQUIRED'
                  DataSource = SrcTempl
                  ValueChecked = 'Y'
                  ValueUnchecked = 'N'
                  Caption = 'Require Tracking #'
                  TabOrder = 6
                end
                object dbchkShipForecast: TUniDBCheckBox
                  Left = 8
                  Top = 48
                  Width = 127
                  Height = 17
                  Hint = ''
                  DataField = 'SHIP_FORECAST'
                  DataSource = SrcTempl
                  ValueChecked = 'Y'
                  ValueUnchecked = 'N'
                  Caption = 'Skip forecast warning'
                  TabOrder = 3
                end
                object dbchkStat: TUniDBCheckBox
                  Left = 8
                  Top = 1
                  Width = 328
                  Height = 17
                  Hint = ''
                  DataField = 'STATEMENTS'
                  DataSource = SrcTempl
                  ValueChecked = 'Y'
                  ValueUnchecked = 'N'
                  Caption = 'Statements'
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 0
                  ParentColor = False
                  Color = clBtnFace
                end
              end
            end
          end
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 232
    object File1: TUniMenuItem
      Caption = '&File'
      object New1: TUniMenuItem
        Caption = '&New'
        OnClick = New1Click
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityCode = 'FRMCUSTTEMPLATE'
    AfterApply = SRAfterApply
    Left = 264
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmCustTemplate'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196421 $'
    BuildVersion = '176554'
    Left = 296
  end
  object SrcTempl: TDataSource
    DataSet = QryTempl
    Left = 392
  end
  object QryTempl: TFDQuery
    BeforePost = QryTemplBeforePost
    AfterPost = QryTemplAfterPost
    AfterDelete = QryTemplAfterPost
    OnCalcFields = QryTemplCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'ARCUSTO_TEMPLATE'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id,'
      '       template_name,'
      '       template_descrip,'
      '       territory,'
      '       industry,'
      '       finance_charge,'
      '       terms_id,'
      '       credit_limit,'
      '       status_id,'
      '       statements,'
      '       comm_pcnt,'
      '       source,'
      '       salespeople_id,'
      '       discount,'
      '       currency_id,'
      '       autoinvoice_technique,'
      '       ps_date_on_invoice,'
      '       commissions_id,'
      '       min_change_interval,'
      '       one_po_per_ps,'
      '       one_so_per_ps,'
      '       safety_lead_time,'
      '       ship_forecast,'
      '       qty_price_break,'
      '       ar_glacct_id,'
      '       dunning_group_id,'
      '       dunning_exclude,'
      '       distlist,'
      '       ps_preserve_ran,'
      '       is_intercomp,'
      '       coc_required,'
      '       cust_credit_days,'
      '       cust_credit_incl_ship,'
      '       cust_credit_incl_so,'
      '       is_make_to_order,'
      '       credit_limit_autocalc,'
      '       tracking_required,'
      '       rebate_params_id,'
      '       web_payment_type,'
      '       ref_type,'
      '       USE_DISCOUNT_TIER '
      '  from ARCUSTO_TEMPLATE')
    Left = 432
    object QryTemplTEMPLATE_NAME: TStringField
      DisplayLabel = 'Template Name'
      DisplayWidth = 25
      FieldName = 'TEMPLATE_NAME'
      Origin = 'IQ.ARCUSTO_TEMPLATE.TEMPLATE_NAME'
      Size = 25
    end
    object QryTemplTEMPLATE_DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 99
      FieldName = 'TEMPLATE_DESCRIP'
      Origin = 'IQ.ARCUSTO_TEMPLATE.TEMPLATE_DESCRIP'
      Size = 250
    end
    object QryTemplID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.ARCUSTO_TEMPLATE.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryTemplTERRITORY: TStringField
      DisplayWidth = 50
      FieldName = 'TERRITORY'
      Origin = 'IQ.ARCUSTO_TEMPLATE.TERRITORY'
      Visible = False
      FixedChar = True
      Size = 5
    end
    object QryTemplINDUSTRY: TStringField
      DisplayWidth = 20
      FieldName = 'INDUSTRY'
      Origin = 'IQ.ARCUSTO_TEMPLATE.INDUSTRY'
      Visible = False
    end
    object QryTemplFINANCE_CHARGE: TStringField
      DisplayWidth = 1
      FieldName = 'FINANCE_CHARGE'
      Origin = 'IQ.ARCUSTO_TEMPLATE.FINANCE_CHARGE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryTemplTERMS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'TERMS_ID'
      Origin = 'IQ.ARCUSTO_TEMPLATE.TERMS_ID'
      Visible = False
      Size = 0
    end
    object QryTemplCREDIT_LIMIT: TBCDField
      DisplayWidth = 10
      FieldName = 'CREDIT_LIMIT'
      Origin = 'IQ.ARCUSTO_TEMPLATE.CREDIT_LIMIT'
      Visible = False
      Size = 2
    end
    object QryTemplSTATUS_ID: TStringField
      DisplayWidth = 20
      FieldName = 'STATUS_ID'
      Origin = 'IQ.ARCUSTO_TEMPLATE.STATUS_ID'
      Visible = False
      FixedChar = True
    end
    object QryTemplSTATEMENTS: TStringField
      DisplayWidth = 1
      FieldName = 'STATEMENTS'
      Origin = 'IQ.ARCUSTO_TEMPLATE.STATEMENTS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryTemplCOMM_PCNT: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'COMM_PCNT'
      Origin = 'IQ.ARCUSTO_TEMPLATE.COMM_PCNT'
      Visible = False
      Size = 6
    end
    object QryTemplSOURCE: TStringField
      DisplayWidth = 5
      FieldName = 'SOURCE'
      Origin = 'IQ.ARCUSTO_TEMPLATE.SOURCE'
      Visible = False
      FixedChar = True
      Size = 5
    end
    object QryTemplSALESPEOPLE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SALESPEOPLE_ID'
      Origin = 'IQ.ARCUSTO_TEMPLATE.SALESPEOPLE_ID'
      Visible = False
      Size = 0
    end
    object QryTemplDISCOUNT: TBCDField
      DisplayWidth = 10
      FieldName = 'DISCOUNT'
      Origin = 'IQ.ARCUSTO_TEMPLATE.DISCOUNT'
      Visible = False
      Size = 2
    end
    object QryTemplCURRENCY_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'CURRENCY_ID'
      Origin = 'IQ.ARCUSTO_TEMPLATE.CURRENCY_ID'
      Visible = False
      Size = 0
    end
    object QryTemplAUTOINVOICE_TECHNIQUE: TStringField
      DisplayWidth = 50
      FieldName = 'AUTOINVOICE_TECHNIQUE'
      Origin = 'IQ.ARCUSTO_TEMPLATE.AUTOINVOICE_TECHNIQUE'
      Visible = False
      Size = 50
    end
    object QryTemplPS_DATE_ON_INVOICE: TStringField
      DisplayWidth = 1
      FieldName = 'PS_DATE_ON_INVOICE'
      Origin = 'IQ.ARCUSTO_TEMPLATE.PS_DATE_ON_INVOICE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryTemplCOMMISSIONS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'COMMISSIONS_ID'
      Origin = 'IQ.ARCUSTO_TEMPLATE.COMMISSIONS_ID'
      Visible = False
      OnChange = QryTemplCOMMISSIONS_IDChange
      Size = 0
    end
    object QryTemplMIN_CHANGE_INTERVAL: TBCDField
      DisplayWidth = 10
      FieldName = 'MIN_CHANGE_INTERVAL'
      Origin = 'IQ.ARCUSTO_TEMPLATE.MIN_CHANGE_INTERVAL'
      Visible = False
      Size = 0
    end
    object QryTemplONE_PO_PER_PS: TStringField
      DisplayWidth = 1
      FieldName = 'ONE_PO_PER_PS'
      Origin = 'IQ.ARCUSTO_TEMPLATE.ONE_PO_PER_PS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryTemplONE_SO_PER_PS: TStringField
      DisplayWidth = 1
      FieldName = 'ONE_SO_PER_PS'
      Origin = 'IQ.ARCUSTO_TEMPLATE.ONE_SO_PER_PS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryTemplSAFETY_LEAD_TIME: TBCDField
      DisplayWidth = 10
      FieldName = 'SAFETY_LEAD_TIME'
      Origin = 'IQ.ARCUSTO_TEMPLATE.SAFETY_LEAD_TIME'
      Visible = False
      Size = 0
    end
    object QryTemplSHIP_FORECAST: TStringField
      DisplayWidth = 1
      FieldName = 'SHIP_FORECAST'
      Origin = 'IQ.ARCUSTO_TEMPLATE.SHIP_FORECAST'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryTemplQTY_PRICE_BREAK: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'QTY_PRICE_BREAK'
      Origin = 'IQ.ARCUSTO_TEMPLATE.QTY_PRICE_BREAK'
      Visible = False
      Size = 6
    end
    object QryTemplAR_GLACCT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'AR_GLACCT_ID'
      Origin = 'IQ.ARCUSTO_TEMPLATE.AR_GLACCT_ID'
      Visible = False
      Size = 0
    end
    object QryTemplDUNNING_GROUP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'DUNNING_GROUP_ID'
      Origin = 'IQ.ARCUSTO_TEMPLATE.DUNNING_GROUP_ID'
      Visible = False
      Size = 0
    end
    object QryTemplDUNNING_EXCLUDE: TStringField
      DisplayWidth = 1
      FieldName = 'DUNNING_EXCLUDE'
      Origin = 'IQ.ARCUSTO_TEMPLATE.DUNNING_EXCLUDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryTemplDISTLIST: TStringField
      DisplayWidth = 1
      FieldName = 'DISTLIST'
      Origin = 'IQ.ARCUSTO_TEMPLATE.DISTLIST'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryTemplPS_PRESERVE_RAN: TStringField
      DisplayWidth = 1
      FieldName = 'PS_PRESERVE_RAN'
      Origin = 'IQ.ARCUSTO_TEMPLATE.PS_PRESERVE_RAN'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryTemplIS_INTERCOMP: TStringField
      DisplayWidth = 1
      FieldName = 'IS_INTERCOMP'
      Origin = 'IQ.ARCUSTO_TEMPLATE.IS_INTERCOMP'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryTemplCOC_REQUIRED: TStringField
      DisplayWidth = 1
      FieldName = 'COC_REQUIRED'
      Origin = 'IQ.ARCUSTO_TEMPLATE.COC_REQUIRED'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryTemplCUST_CREDIT_DAYS: TBCDField
      DisplayWidth = 10
      FieldName = 'CUST_CREDIT_DAYS'
      Origin = 'IQ.ARCUSTO_TEMPLATE.CUST_CREDIT_DAYS'
      Visible = False
      Size = 0
    end
    object QryTemplCUST_CREDIT_INCL_SHIP: TStringField
      DisplayWidth = 1
      FieldName = 'CUST_CREDIT_INCL_SHIP'
      Origin = 'IQ.ARCUSTO_TEMPLATE.CUST_CREDIT_INCL_SHIP'
      Visible = False
      Size = 1
    end
    object QryTemplCUST_CREDIT_INCL_SO: TStringField
      DisplayWidth = 1
      FieldName = 'CUST_CREDIT_INCL_SO'
      Origin = 'IQ.ARCUSTO_TEMPLATE.CUST_CREDIT_INCL_SO'
      Visible = False
      Size = 1
    end
    object QryTemplIS_MAKE_TO_ORDER: TStringField
      DisplayWidth = 1
      FieldName = 'IS_MAKE_TO_ORDER'
      Origin = 'IQ.ARCUSTO_TEMPLATE.IS_MAKE_TO_ORDER'
      Visible = False
      Size = 1
    end
    object QryTemplCREDIT_LIMIT_AUTOCALC: TStringField
      DisplayWidth = 1
      FieldName = 'CREDIT_LIMIT_AUTOCALC'
      Origin = 'IQ.ARCUSTO_TEMPLATE.CREDIT_LIMIT_AUTOCALC'
      Visible = False
      Size = 1
    end
    object QryTemplTRACKING_REQUIRED: TStringField
      DisplayWidth = 1
      FieldName = 'TRACKING_REQUIRED'
      Origin = 'IQ.ARCUSTO_TEMPLATE.TRACKING_REQUIRED'
      Visible = False
      Size = 1
    end
    object QryTemplREBATE_PARAMS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'REBATE_PARAMS_ID'
      Origin = 'IQ.ARCUSTO_TEMPLATE.REBATE_PARAMS_ID'
      Visible = False
      Size = 0
    end
    object QryTemplWEB_PAYMENT_TYPE: TStringField
      DisplayWidth = 15
      FieldName = 'WEB_PAYMENT_TYPE'
      Origin = 'IQ.ARCUSTO_TEMPLATE.WEB_PAYMENT_TYPE'
      Visible = False
      Size = 15
    end
    object QryTemplREF_TYPE: TStringField
      DisplayWidth = 15
      FieldName = 'REF_TYPE'
      Origin = 'IQ.ARCUSTO_TEMPLATE.REF_TYPE'
      Visible = False
      Size = 15
    end
    object QryTemplUSE_DISCOUNT_TIER: TStringField
      FieldName = 'USE_DISCOUNT_TIER'
      Visible = False
      Size = 1
    end
    object QryTemplRebateParam: TStringField
      FieldKind = fkCalculated
      FieldName = 'RebateParam'
      Visible = False
      Calculated = True
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into ARCUSTO_TEMPLATE'
      '  (ID, TEMPLATE_NAME, TEMPLATE_DESCRIP, TERRITORY, INDUSTRY, '
      'FINANCE_CHARGE, '
      
        '   TERMS_ID, CREDIT_LIMIT, STATUS_ID, STATEMENTS, COMM_PCNT, SOU' +
        'RCE, '
      'SALESPEOPLE_ID, '
      
        '   DISCOUNT, CURRENCY_ID, AUTOINVOICE_TECHNIQUE, PS_DATE_ON_INVO' +
        'ICE, '
      'COMMISSIONS_ID, '
      '   MIN_CHANGE_INTERVAL, ONE_PO_PER_PS, ONE_SO_PER_PS, '
      'SAFETY_LEAD_TIME, '
      
        '   SHIP_FORECAST, QTY_PRICE_BREAK, AR_GLACCT_ID, DUNNING_GROUP_I' +
        'D, '
      'DUNNING_EXCLUDE, '
      '   DISTLIST, PS_PRESERVE_RAN, IS_INTERCOMP, COC_REQUIRED, '
      'CUST_CREDIT_DAYS, '
      
        '   CUST_CREDIT_INCL_SHIP, CUST_CREDIT_INCL_SO, IS_MAKE_TO_ORDER,' +
        ' '
      'CREDIT_LIMIT_AUTOCALC, '
      
        '   TRACKING_REQUIRED, REBATE_PARAMS_ID, WEB_PAYMENT_TYPE, REF_TY' +
        'PE, USE_DISCOUNT_TIER)'
      'values'
      
        '  (:ID, :TEMPLATE_NAME, :TEMPLATE_DESCRIP, :TERRITORY, :INDUSTRY' +
        ', '
      ':FINANCE_CHARGE, '
      
        '   :TERMS_ID, :CREDIT_LIMIT, :STATUS_ID, :STATEMENTS, :COMM_PCNT' +
        ', '
      ':SOURCE, '
      
        '   :SALESPEOPLE_ID, :DISCOUNT, :CURRENCY_ID, :AUTOINVOICE_TECHNI' +
        'QUE, '
      ':PS_DATE_ON_INVOICE, '
      '   :COMMISSIONS_ID, :MIN_CHANGE_INTERVAL, :ONE_PO_PER_PS, '
      ':ONE_SO_PER_PS, '
      
        '   :SAFETY_LEAD_TIME, :SHIP_FORECAST, :QTY_PRICE_BREAK, :AR_GLAC' +
        'CT_ID, '
      
        '   :DUNNING_GROUP_ID, :DUNNING_EXCLUDE, :DISTLIST, :PS_PRESERVE_' +
        'RAN, '
      ':IS_INTERCOMP, '
      '   :COC_REQUIRED, :CUST_CREDIT_DAYS, :CUST_CREDIT_INCL_SHIP, '
      ':CUST_CREDIT_INCL_SO, '
      
        '   :IS_MAKE_TO_ORDER, :CREDIT_LIMIT_AUTOCALC, :TRACKING_REQUIRED' +
        ', '
      ':REBATE_PARAMS_ID, '
      '   :WEB_PAYMENT_TYPE, :REF_TYPE, :USE_DISCOUNT_TIER)')
    ModifySQL.Strings = (
      'update ARCUSTO_TEMPLATE'
      'set'
      '  ID = :ID,'
      '  TEMPLATE_NAME = :TEMPLATE_NAME,'
      '  TEMPLATE_DESCRIP = :TEMPLATE_DESCRIP,'
      '  TERRITORY = :TERRITORY,'
      '  INDUSTRY = :INDUSTRY,'
      '  FINANCE_CHARGE = :FINANCE_CHARGE,'
      '  TERMS_ID = :TERMS_ID,'
      '  CREDIT_LIMIT = :CREDIT_LIMIT,'
      '  STATUS_ID = :STATUS_ID,'
      '  STATEMENTS = :STATEMENTS,'
      '  COMM_PCNT = :COMM_PCNT,'
      '  SOURCE = :SOURCE,'
      '  SALESPEOPLE_ID = :SALESPEOPLE_ID,'
      '  DISCOUNT = :DISCOUNT,'
      '  CURRENCY_ID = :CURRENCY_ID,'
      '  AUTOINVOICE_TECHNIQUE = :AUTOINVOICE_TECHNIQUE,'
      '  PS_DATE_ON_INVOICE = :PS_DATE_ON_INVOICE,'
      '  COMMISSIONS_ID = :COMMISSIONS_ID,'
      '  MIN_CHANGE_INTERVAL = :MIN_CHANGE_INTERVAL,'
      '  ONE_PO_PER_PS = :ONE_PO_PER_PS,'
      '  ONE_SO_PER_PS = :ONE_SO_PER_PS,'
      '  SAFETY_LEAD_TIME = :SAFETY_LEAD_TIME,'
      '  SHIP_FORECAST = :SHIP_FORECAST,'
      '  QTY_PRICE_BREAK = :QTY_PRICE_BREAK,'
      '  AR_GLACCT_ID = :AR_GLACCT_ID,'
      '  DUNNING_GROUP_ID = :DUNNING_GROUP_ID,'
      '  DUNNING_EXCLUDE = :DUNNING_EXCLUDE,'
      '  DISTLIST = :DISTLIST,'
      '  PS_PRESERVE_RAN = :PS_PRESERVE_RAN,'
      '  IS_INTERCOMP = :IS_INTERCOMP,'
      '  COC_REQUIRED = :COC_REQUIRED,'
      '  CUST_CREDIT_DAYS = :CUST_CREDIT_DAYS,'
      '  CUST_CREDIT_INCL_SHIP = :CUST_CREDIT_INCL_SHIP,'
      '  CUST_CREDIT_INCL_SO = :CUST_CREDIT_INCL_SO,'
      '  IS_MAKE_TO_ORDER = :IS_MAKE_TO_ORDER,'
      '  CREDIT_LIMIT_AUTOCALC = :CREDIT_LIMIT_AUTOCALC,'
      '  TRACKING_REQUIRED = :TRACKING_REQUIRED,'
      '  REBATE_PARAMS_ID = :REBATE_PARAMS_ID,'
      '  WEB_PAYMENT_TYPE = :WEB_PAYMENT_TYPE,'
      '  REF_TYPE = :REF_TYPE,'
      '  USE_DISCOUNT_TIER = :USE_DISCOUNT_TIER'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from ARCUSTO_TEMPLATE'
      'where'
      '  ID = :OLD_ID')
    Left = 472
  end
  object PkTempl: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as id,'
      '       template_name as template_name,'
      '       template_descrip as template_descrip'
      '  from ARCUSTO_TEMPLATE')
    OnIQModify = PkTemplIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 336
    object PkTemplID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ARCUSTO_TEMPLATE.ID'
      Visible = False
      Size = 0
    end
    object PkTemplTEMPLATE_NAME: TStringField
      DisplayLabel = 'Template Name'
      FieldName = 'TEMPLATE_NAME'
      Origin = 'IQ.ARCUSTO_TEMPLATE.TEMPLATE_NAME'
      Size = 25
    end
    object PkTemplTEMPLATE_DESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'TEMPLATE_DESCRIP'
      Origin = 'IQ.ARCUSTO_TEMPLATE.TEMPLATE_DESCRIP'
      Size = 250
    end
  end
  object SrcTerms: TDataSource
    DataSet = QryTerms
    Left = 115
    Top = 313
  end
  object QryTerms: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       description,'
      '       days,'
      '       discount,'
      '       discount_days,'
      '       ecode,'
      '       eid,'
      '       edate_time,'
      '       ecopy,'
      '       based_on,'
      '       end_of_month,'
      '       day_of_month'
      '  from terms'
      ' order by description')
    Left = 128
    Top = 312
    object QryTermsID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.TERMS.ID'
      Size = 0
    end
    object QryTermsDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Origin = 'IQ.TERMS.DESCRIPTION'
      Size = 60
    end
    object QryTermsDAYS: TBCDField
      FieldName = 'DAYS'
      Origin = 'IQ.TERMS.DAYS'
      Size = 0
    end
    object QryTermsDISCOUNT: TBCDField
      FieldName = 'DISCOUNT'
      Origin = 'IQ.TERMS.DISCOUNT'
      Size = 3
    end
    object QryTermsDISCOUNT_DAYS: TBCDField
      FieldName = 'DISCOUNT_DAYS'
      Origin = 'IQ.TERMS.DISCOUNT_DAYS'
      Size = 0
    end
    object QryTermsECODE: TStringField
      FieldName = 'ECODE'
      Origin = 'IQ.TERMS.ECODE'
      Size = 10
    end
    object QryTermsEID: TBCDField
      FieldName = 'EID'
      Origin = 'IQ.TERMS.EID'
      Size = 0
    end
    object QryTermsEDATE_TIME: TDateTimeField
      FieldName = 'EDATE_TIME'
      Origin = 'IQ.TERMS.EDATE_TIME'
    end
    object QryTermsECOPY: TStringField
      FieldName = 'ECOPY'
      Origin = 'IQ.TERMS.ECOPY'
      FixedChar = True
      Size = 1
    end
    object QryTermsBASED_ON: TStringField
      FieldName = 'BASED_ON'
      Origin = 'IQ.TERMS.BASED_ON'
      FixedChar = True
      Size = 1
    end
    object QryTermsEND_OF_MONTH: TStringField
      FieldName = 'END_OF_MONTH'
      Origin = 'IQ.TERMS.END_OF_MONTH'
      FixedChar = True
      Size = 1
    end
    object QryTermsDAY_OF_MONTH: TBCDField
      FieldName = 'DAY_OF_MONTH'
      Origin = 'IQ.TERMS.DAY_OF_MONTH'
      Size = 0
    end
  end
  object QryCommissions: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select c.id,'
      
        '       substr(c.descrip, 1, 50) || '#39' ('#39' || To_Char(sum(d.commiss' +
        'ion_percent))  || '#39'%)'#39' as descrip,'
      '       sum(d.commission_percent) as commission_percent'
      '  from commissions c,'
      '       salespeople s,'
      '       commissions_detail d'
      ' where d.commissions_id = c.id'
      '   and d.salespeople_id = s.id'
      '   and NVL(s.inactive, '#39'N'#39') = '#39'N'#39
      ' group by c.id, c.descrip'
      
        'order by substr(c.descrip, 1, 50) || '#39' ('#39' || To_Char(sum(d.commi' +
        'ssion_percent))  || '#39'%)'#39
      '')
    Left = 176
    Top = 313
    object QryCommissionsDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 95
      FieldName = 'DESCRIP'
      Size = 94
    end
    object QryCommissionsID: TBCDField
      FieldName = 'ID'
      Origin = 'COMMISSIONS.ID'
      Visible = False
      Size = 0
    end
    object QryCommissionsCOMMISSION_PERCENT: TFMTBCDField
      FieldName = 'COMMISSION_PERCENT'
      Origin = 'COMMISSIONS_DETAIL.COMMISSION_PERCENT'
      Visible = False
      Size = 38
    end
  end
  object QryDunningGroup: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, descrip from dunning_group'
      'order by descrip')
    Left = 216
    Top = 316
    object QryDunningGroupDESCRIP: TStringField
      DisplayLabel = 'Dunning Group'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'DUNNING_GROUP.DESCRIP'
      Size = 250
    end
    object QryDunningGroupID: TBCDField
      FieldName = 'ID'
      Origin = 'DUNNING_GROUP.ID'
      Visible = False
      Size = 0
    end
  end
  object QryCurrency: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select c1.id,'
      '       c1.curr_code,'
      '       c1.descrip,'
      '       c1.glvalue,'
      '       c1.spot_rate,'
      '       c1.curr_symbol,'
      '       c1.ecode,'
      '       c1.eid,'
      '       c1.edate_time,'
      '       c1.ecopy,'
      '       c1.native_curr'
      '  from currency c1'
      ' where '
      
        '       c1.id = (select min(id) from currency where curr_code = c' +
        '1.curr_code)'
      '  order by c1.descrip ')
    Left = 256
    Top = 312
    object QryCurrencyDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'IQ.CURRENCY.DESCRIP'
      Size = 50
    end
    object QryCurrencySPOT_RATE: TFMTBCDField
      DisplayLabel = 'Spot Rate'
      DisplayWidth = 10
      FieldName = 'SPOT_RATE'
      Origin = 'IQ.CURRENCY.SPOT_RATE'
      Visible = False
      Size = 6
    end
    object QryCurrencyCURR_CODE: TStringField
      DisplayLabel = 'Curr. Code'
      DisplayWidth = 10
      FieldName = 'CURR_CODE'
      Origin = 'IQ.CURRENCY.CURR_CODE'
      Visible = False
      Size = 10
    end
    object QryCurrencyGLVALUE: TStringField
      DisplayLabel = 'GL Value'
      DisplayWidth = 10
      FieldName = 'GLVALUE'
      Origin = 'IQ.CURRENCY.GLVALUE'
      Visible = False
      Size = 50
    end
    object QryCurrencyCURR_SYMBOL: TStringField
      DisplayLabel = 'Currency Symbol'
      DisplayWidth = 10
      FieldName = 'CURR_SYMBOL'
      Origin = 'IQ.CURRENCY.CURR_SYMBOL'
      Visible = False
      Size = 10
    end
    object QryCurrencyNATIVE_CURR: TStringField
      DisplayLabel = 'Native Curr. Code'
      DisplayWidth = 3
      FieldName = 'NATIVE_CURR'
      Origin = 'IQ.CURRENCY.NATIVE_CURR'
      Visible = False
      Size = 3
    end
    object QryCurrencyID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.CURRENCY.ID'
      Visible = False
      Size = 0
    end
    object QryCurrencyECODE: TStringField
      FieldName = 'ECODE'
      Origin = 'IQ.CURRENCY.ECODE'
      Visible = False
      Size = 10
    end
    object QryCurrencyEID: TBCDField
      FieldName = 'EID'
      Origin = 'IQ.CURRENCY.EID'
      Visible = False
      Size = 0
    end
    object QryCurrencyEDATE_TIME: TDateTimeField
      FieldName = 'EDATE_TIME'
      Origin = 'IQ.CURRENCY.EDATE_TIME'
      Visible = False
    end
    object QryCurrencyECOPY: TStringField
      FieldName = 'ECOPY'
      Origin = 'IQ.CURRENCY.ECOPY'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object PKAcct: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT id, acct, descrip, type, eplant_id'
      '  FROM glacct'
      ' WHERE NVL(pk_hide, '#39'N'#39') <> '#39'Y'#39' AND'
      '       NVL(ar_hide, '#39'N'#39') <> '#39'Y'#39' AND'
      '       misc.eplant_filter(eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 144
    Top = 65531
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
      DisplayLabel = 'Type'
      FieldName = 'TYPE'
      Size = 25
    end
    object PKAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object PkRebateParams: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select p.id as id,'
      '       p.descrip as descrip,'
      '       p.based_on as based_on,'
      '       p.percent as percent,'
      '       p.flat_amount as flat_amount,'
      '       p.sql_formula as sql_formula,'
      '       p.exclude_commissions as exclude_commissions,'
      '       p.cash_back as cash_back,'
      '       p.effect_date as effect_date,'
      '       p.DEACTIVE_DATE as DEACTIVE_DATE,'
      '       p.glacct_id as glacct_id,'
      '       g.acct as acct'
      '  from rebate_params p,'
      '       glacct g'
      ' where p.glacct_id = g.id(+)'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 184
    object PkRebateParamsID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkRebateParamsDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkRebateParamsBASED_ON: TStringField
      DisplayLabel = 'Based On'
      FieldName = 'BASED_ON'
      Size = 100
    end
    object PkRebateParamsPERCENT: TFMTBCDField
      DisplayLabel = 'Percent'
      FieldName = 'PERCENT'
      Size = 6
    end
    object PkRebateParamsFLAT_AMOUNT: TBCDField
      DisplayLabel = 'Flat Amount'
      FieldName = 'FLAT_AMOUNT'
      Size = 2
    end
    object PkRebateParamsEXCLUDE_COMMISSIONS: TStringField
      DisplayLabel = 'Exclude Comissions'
      FieldName = 'EXCLUDE_COMMISSIONS'
      Size = 1
    end
    object PkRebateParamsCASH_BACK: TStringField
      DisplayLabel = 'Cash Back'
      FieldName = 'CASH_BACK'
      Size = 1
    end
    object PkRebateParamsEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      FieldName = 'EFFECT_DATE'
    end
    object PkRebateParamsDEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'InActive Date'
      FieldName = 'DEACTIVE_DATE'
    end
    object PkRebateParamsGLACCT_ID: TBCDField
      FieldName = 'GLACCT_ID'
      Visible = False
      Size = 0
    end
    object PkRebateParamsACCT: TStringField
      DisplayLabel = 'GL Account'
      FieldName = 'ACCT'
      Size = 50
    end
  end
  object PopupMenu4: TUniPopupMenu
    Left = 512
    object ClearRebateParameter1: TUniMenuItem
      Caption = 'Clear Rebate Parameter'
      OnClick = ClearRebateParameter1Click
    end
  end
  object QryGlAcct: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      '  SELECT id, eplant_id, acct, descrip'
      '    FROM glacct'
      '   WHERE NVL(pk_hide, '#39'N'#39') <> '#39'Y'#39' AND'
      '         NVL(ar_hide, '#39'N'#39') <> '#39'Y'#39
      'ORDER BY acct')
    Left = 300
    Top = 316
    object QryGlAcctACCT: TStringField
      DisplayLabel = 'G/L Account'
      DisplayWidth = 20
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      Size = 50
    end
    object QryGlAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'GLACCT.DESCRIP'
      Size = 50
    end
    object QryGlAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant_ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'GLACCT.EPLANT_ID'
      Size = 0
    end
    object QryGlAcctID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
  end
end
