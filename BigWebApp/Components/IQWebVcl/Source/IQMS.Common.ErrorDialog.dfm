object FrmStringError: TFrmStringError
  Left = 267
  Top = 175
  ClientHeight = 215
  ClientWidth = 433
  Caption = 'Error'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  KeyPreview = True
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 182
    Width = 433
    Height = 33
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object sbtnSaveToFile: TUniSpeedButton
      Left = 4
      Top = 5
      Width = 25
      Height = 25
      Hint = 'Save to file'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE4A592
        C06860B05850A05050A05050A050509048509048409048408040408038408038
        40703840703830FF00FFFF00FFA7A7A770707060606059595959595959595952
        52524E4E4E4E4E4E4747474242424242424040403D3D3DFF00FFFF00FFD06870
        F09090E08080B04820403020C0B8B0C0B8B0D0C0C0D0C8C0505050A04030A040
        30A03830703840FF00FFFF00FF7575759A9A9A8A8A8A5050502E2E2EB7B7B7B7
        B7B7C2C2C2C7C7C75050504A4A4A4A4A4A454545404040FF00FFFF00FFD07070
        FF98A0F08880E08080705850404030907870F0E0E0F0E8E0908070A04030A040
        40A04030803840FF00FFFF00FF7A7A7AA4A4A49292928A8A8A5858583D3D3D78
        7878E2E2E2E7E7E77E7E7E4A4A4A4C4C4C4A4A4A424242FF00FFFF00FFD07870
        FFA0A0F09090F08880705850000000404030F0D8D0F0E0D0807860B04840B048
        40A04040804040FF00FFFF00FF7F7F7FAAAAAA9A9A9A9292925858580000003D
        3D3DD9D9D9DEDEDE7474745454545454544C4C4C474747FF00FFFF00FFD07880
        FFA8B0FFA0A0F09090705850705850705850705850706050806860C05850B050
        50B04840804040FF00FFFF00FF838383B2B2B2AAAAAA9A9A9A58585858585858
        58585858585E5E5E6868686363635C5C5C545454474747FF00FFFF00FFE08080
        FFB0B0FFB0B0FFA0A0F09090F08880E08080E07880D07070D06870C06060C058
        50B05050904840FF00FFFF00FF8A8A8AB7B7B7B7B7B7AAAAAA9A9A9A9292928A
        8A8A8585857A7A7A7575756B6B6B6363635C5C5C4E4E4EFF00FFFF00FFE08890
        FFB8C0FFB8B0D06060C06050C05850C05040B05030B04830A04020A03810C060
        60C05850904840FF00FFFF00FF929292C0C0C0BDBDBD6E6E6E6868686363635C
        5C5C5757575252524848484242426B6B6B6363634E4E4EFF00FFFF00FFE09090
        FFC0C0D06860FFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0E0C8C0A038
        10C06060904850FF00FFFF00FF989898C6C6C6727272E7E7E7E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7E7E7E74242426B6B6B525252FF00FFFF00FFE098A0
        FFC0C0D07070FFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0A040
        20D06860A05050FF00FFFF00FFA1A1A1C6C6C67A7A7AE7E7E7E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7E7E7E7484848727272595959FF00FFFF00FFF0A0A0
        FFC0C0E07870FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0B048
        30D07070A05050FF00FFFF00FFA8A8A8C6C6C6828282E7E7E7E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7E7E7E75252527A7A7A595959FF00FFFF00FFF0A8A0
        FFC0C0E08080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0B050
        30E07880A05050FF00FFFF00FFADADADC6C6C68A8A8AE7E7E7E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7E7E7E7575757858585595959FF00FFFF00FFF0B0B0
        FFC0C0F08890FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0C050
        40603030B05850FF00FFFF00FFB6B6B6C6C6C6959595E7E7E7E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7E7E7E75C5C5C353535606060FF00FFFF00FFF0B0B0
        FFC0C0FF9090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0C058
        50B05860B05860FF00FFFF00FFB6B6B6C6C6C69C9C9CE7E7E7E7E7E7E7E7E7E7
        E7E7E7E7E7E7E7E7E7E7E7E7E7E7636363646464646464FF00FFFF00FFF0B8B0
        F0B8B0F0B0B0F0B0B0F0A8B0F0A0A0E098A0E09090E09090E08890E08080D078
        80D07870D07070FF00FFFF00FFBCBCBCBCBCBCB6B6B6B6B6B6B0B0B0A8A8A8A1
        A1A19898989898989292928A8A8A8383837F7F7F7A7A7AFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = DoSaveClick
    end
    object sbtnSendAsMail: TUniSpeedButton
      Left = 29
      Top = 5
      Width = 25
      Height = 25
      Hint = 'Save to file'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCBCDCD47E8
        F4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFCCCCCCA8A8A8FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCBCCCCB2E0E083ECF626EA
        FF9CEAEBC4D2D1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFCCCCCCCDCDCDC5C5C59F9F9FCACACACCCCCCFF00FFFF00FFFF00FF
        FF00FFFF00FFCCC0BACAB0A2CAA796C79881AE998639DAED2CD2FC0E28FF22E3
        FF2B59FD3FE2F744E0F5FF00FFFF00FFFF00FFFF00FFC5C5C5BBBBBBB6B6B6AC
        ACACA4A4A49F9F9FA0A0A09595959D9D9DA0A0A0A7A7A7A6A6A6CAA492CA9B80
        C79371C6906CCB9C75D1A783D8B590DBB995DBBD998BDFE00970FF1DDBFF15CA
        FF0063FF47B5FCBED4D6B5B5B5AFAFAFA8A8A8A5A5A5ACACACB5B5B5BEBEBEC3
        C3C3C4C4C4BFBFBF9292929B9B9B9898988E8E8EADADADCBCBCBC89378E4BFA6
        FAE7D5F3DBC3EED8BAEED8BDF0D8C0F3DBC3F3DCC48CE6EE0C40FF1EDCFF02A5
        FF006CFF4CA5FCBED7D7ABABABCECECEEFEFEFE3E3E3DBDBDBDDDDDDE0E0E0E3
        E3E3E3E3E3C7C7C79393939C9C9C8F8F8F8E8E8EAFAFAFCDCDCDCDA089E8C7AD
        E7C3ABFFFFF7FFF7E7FFF0DFFFEEDEFFEEDEFFEEDE5EE9F625CDFE0230FF0086
        FF1757FD28E7FE6FDEE9B3B3B3D3D3D3D2D2D2FFFFFFF8F8F8F5F5F5F5F5F5F5
        F5F5F5F5F5B5B5B59E9E9E8F8F8F8E8E8E9898989F9F9FB3B3B3CAA492FFF0DF
        F7DBC7EECBB5FFFFF9FFFAEEF4D5C3FFFAEDFFFCEEDFB99EA0CFB570CBE42FE3
        F797D3CAB2B29EFF00FFB5B5B5F5F5F5E6E6E6D9D9D9FFFFFFFBFBFBE3E3E3FB
        FBFBFBFBFBC8C8C8C2C2C2B6B6B6A0A0A0BFBFBFB1B1B1FF00FFCAADA0FFF0E2
        FFF9EAFFF9E8E2B59DDEAD8FDFBD91D5A283DEAE94EACEAFE7CBA9DEC399D2B9
        8BD2B181C99C85FF00FFBABABAF6F6F6FAFAFAF9F9F9C9C9C9C0C0C0C2C2C2B7
        B7B7C4C4C4D5D5D5D1D1D1C6C6C6B9B9B9B5B5B5B0B0B0FF00FFCBBAB1F9DECE
        FFFFF4FFFDF3E7BDA6E4AF8BD8AE84CFA77BD2A080F9E4CEF0DBBDE7CEABDFC3
        99D8B98BC89D84FF00FFC1C1C1EAEAEAFFFFFFFFFFFFD0D0D0C2C2C2B9B9B9B0
        B0B0B4B4B4EAEAEADFDFDFD2D2D2C6C6C6BCBCBCB0B0B0FF00FFCCC8C6EECAB6
        FFFFFDFAE4D2E4B190F4D8BFEED8BADFBA95D2A97CDFB598FCEDD5F3DFC3E8D1
        AEE2C79DCB9D85FF00FFCACACADADADAFFFFFFECECECC4C4C4E2E2E2DBDBDBC4
        C4C4B3B3B3C5C5C5EFEFEFE3E3E3D4D4D4C9C9C9B1B1B1FF00FFFF00FFE3BBA4
        FFFFFAE4AF93FFE4CAFDEAD8FDEAD8F9E4CBE4C4A0D8AF84EECFB6FDEEDBF4E2
        C4EAD2AFCB9F86FF00FFFF00FFCCCCCCFFFFFFC6C6C6EBEBEBF1F1F1F1F1F1E9
        E9E9CBCBCBB9B9B9DADADAF2F2F2E4E4E4D5D5D5B1B1B1FF00FFFF00FFDAAF9A
        E7B9A1FFE7CFFFF7E8FFF9EAFFF9EAFFF9E8FDEEDCEACEA9D5AD81F0D5BFFDF0
        DBF4E2C4CDA087FF00FFFF00FFC3C3C3CDCDCDEEEEEEF9F9F9FAFAFAFAFAFAF9
        F9F9F3F3F3D3D3D3B6B6B6E0E0E0F2F2F2E4E4E4B3B3B3FF00FFFF00FFC9957C
        FFD8BDFFFCEDFFFFF4FFFFF9FFFFFAFFFFFAFFFFF9FFFAEAEED5B1D2A97FF3D5
        C0FDF0DCCEA189FF00FFFF00FFADADADE5E5E5FBFBFBFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFAFAFAD8D8D8B4B4B4E2E2E2F3F3F3B4B4B4FF00FFFF00FFCCBFB9
        C9A28FCE9D84DAA48AEAB69CFDDBC4FFFCEEFFFFFAFFFFFDFFFFFAFCE4CAD8AE
        87F4DBC4D0A58CFF00FFFF00FFC4C4C4B3B3B3B3B3B3BCBCBCCCCCCCE7E7E7FB
        FBFBFFFFFFFFFFFFFFFFFFE9E9E9BABABAE4E4E4B6B6B6FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFCCCBCACBB5AAC9A593CD9C84D8A38AE5B49AFAD2BDFFE8
        CEE4B99DCD9C83FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCBCBCBBEBEBEB5
        B5B5B1B1B1BBBBBBC9C9C9E3E3E3EEEEEECACACAB2B2B2FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCAAFA2C594
        7DCA8B6FC6967EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFBBBBBBAAAAAAA9A9A9ACACACFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = DoSendMailClick
    end
    object PnlModalButtons: TUniPanel
      Left = 226
      Top = 1
      Width = 207
      Height = 31
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 1
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
        Default = True
        OnClick = DoOkClick
      end
      object btnCancel: TUniBitBtn
        Left = 104
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
        OnClick = btnCancelClick
      end
    end
    object btnCopyToClipboard: TUniButton
      Left = 116
      Top = 4
      Width = 102
      Height = 25
      Hint = ''
      Caption = 'Copy All'
      TabOrder = 4
    end
  end
  object PnlMain: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 433
    Height = 182
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlLeft: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 61
      Height = 180
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      Color = clWhite
      object imgError: TUniImage
        Left = 8
        Top = 8
        Width = 32
        Height = 32
        Hint = ''
        Center = True
        Picture.Data = {
          07544269746D6170360C0000424D360C00000000000036000000280000002000
          0000200000000100180000000000000C0000C40E0000C40E0000000000000000
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          ADB2B584868C5A6163424142313031292C29292829292C293130314241425A61
          63848684ADAEB5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB5B6BD737573
          31344A08084A00005A00006B00007300007300006B00005A0000420000210808
          081818184241427B797BADB6B5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8C8E94293063000073
          00008400008C0000840000840000840000840000840000840000840000840000
          6B0000390000081818184A4D4A949294CECFD6FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5A618400007B00009400008C
          00008400008400008400008400008400008400008400008400008400007B0000
          84000084000073000031080808313031848284C6CBCEFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF4A498400009400008C00008C00008C
          00008C00008C00008C00009400009400009400008C00008C00008C0000840000
          8400007B00008400008400004A000000292829848684CECFCEFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF42458C00009C00008C00008C00008C000094
          00009400009C00009C00009C00009C00009C00009C00009400009400008C0000
          8C00008400008400007B00008C00005A0000003130318C8E94FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF63659C0000A5000094000094000094000094000094
          00009C0000A50000A50000A50000A50000A50000A500009C00009C0000940000
          8C00008C00008C00008400007B00008C000052000408424542A5AAADFF00FFFF
          00FFFF00FFFF00FF9C9EBD0000A500009400009400009C00009C4A49BD5251C6
          00009C0000A50000AD0000AD0000AD0000AD0000AD0000A50000A500009C5A5D
          C63938B500008C00008C00008400008400008C0000311014106B6D73C6CFCEFF
          00FFFF00FFFF00FF2120AD00009C00009C0000A50000A52928ADFFFFFFFFFFFF
          4A49CE0000A50000AD0000AD0000AD0000B50000AD0000AD0000A54A49B5FFFF
          FFFFFFFF2124AD00008C00009400008C00008C000084000008313839A5A6A5FF
          00FFFF00FF8486AD0000B500009C0000A50000AD292CADCECFC6FFFFF7FFFFFF
          FFFFFF4241CE0000AD0000B50000B50000B50000B50000AD4241B5EFEFDEFFFF
          FFFFFFFFFFFFFF3130AD00009400009400008C00009400005210141073757BFF
          00FFFF00FF2120AD0000A50000A50000AD0000B57B798CCECBA5FFFFFFFFFFFF
          FFFFFFFFFFFF4A4DCE0000AD0000B50000B50000B54A49BDF7F3DEFFFFFFFFFF
          FFFFFFFFFFFBD68482AD0000A500009C00009400009400008C0000104A4D52BD
          BEC6B5BAD60004A50004A50000AD0000B50000BD0000B5636173C6C7ADFFFFFF
          FFFFFFFFFFFFFFFFFF4241CE0000B50000B54A4DCEF7F7DEFFFFF7FFFFFFFFFF
          FFE7E7CE7371940000AD0000AD0000A500009C00009400009C000039313031A5
          A6AD7379CE0004A50004AD0000B50000BD0000C60000CE0000BD52556BC6C3A5
          FFFFFFFFFFFFFFFFFFFFFFFF3938CE5251D6FFFFFFFFFFF7FFFFFFFFFFFFE7E3
          CE6B6D8C0000B50000BD0000B50000AD0000A500009C00009C00006B181C1894
          92944A51C60004AD0004B50004BD0004C60004CE0000CE0000D60000BD636173
          C6C7ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEBCE7375
          940000B50000C60000BD0000BD0000B50000AD00009C00009C00008C1014188C
          8E8C292CBD0808B50004BD0004C60004CE0004CE0004D60000CE0000D60000BD
          6B6D84DEDBBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7DE8482A50000
          BD0000C60000C60000C60000BD0000BD0000B50000A50000A500009C08101884
          8A8C1818BD0808BD0808C60808CE0808D60808D60004D60000D60000D60000D6
          0000C68C8AADF7F7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9492CE0000C60000
          CE0000C60000C60004C60004C60000BD0000B50000AD0000A50004AD080C2184
          8A8C080CBD080CC60808CE0808D60808DE080CDE0808DE0000D60000D60000D6
          0000D64249C6FFFBE7FFFFFFFFFFFFFFFFFFFFFFFFFFFFF73938CE0000C60000
          CE0000CE0000CE0004CE0004CE0004C60004BD0004B50004AD0004BD1010218C
          8A8C1818C61010CE080CD6080CDE080CE7080CE70808E70000DE0000D60000D6
          4241CEEFEBD6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A49DE0000
          C60000CE0000CE0004CE0004CE0004CE0004C60004B50004AD0004BD1018298C
          92943130CE1010CE1010D61010E71010EF1010EF080CE70000E70000DE393CCE
          EFEBD6FFFFF7FFFFFFFFFFFFFFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFF4241
          DE0000CE0000D60004D60808D60808CE0808C60004BD0808B50004B52124299C
          9E9C4A51D61014D61014E71818EF1818F71818F7080CF70000EF4A49D6EFEFD6
          FFFFF7FFFFFFFFFFFFEFEFD68486BD8486ADDEDFC6FFFFFFFFFFFFFFFFFFFFFF
          FF4A4DE70000D60004DE080CDE0808D60808CE0808BD0808BD0004A5394142B5
          BABD7375DE1818D6181CE7181CF72120FF181CFF0004FF4A4DE7E7E7CEFFFFF7
          FFFFFFFFFFFFEFEBCE7B79A50000DE0000D673718CCECBADFFFFFFFFFFFFFFFF
          FFFFFFFF4A4DEF0000E70808E7080CDE080CCE080CC6080CC6000494636563CE
          CFD6B5B6D61014DE2120EF2124FF2124FF2124FF5A5DD6DEDFC6FFFFF7FFFFFF
          FFFFFFDEDFC673719C0000DE0000EF0000EF0000D6635D7BC6C3A5FFFFFFFFFF
          FFFFFFFFFFFFFF5255DE0004EF1010E71010D6080CC6080CCE181863949A9CFF
          00FFFF00FF292CE72124EF292CFF3130FF292CFF7B7D9CDEDBB5FFFFFFFFFFFF
          E7E3C66B69940000E70000EF0000E70000E70000EF0000D65A5973BDBE9CFFFF
          FFFFFFFFD6D7A57371BD1010F71014E71014D61010CE080CC64A4D63BDC7C6FF
          00FFFF00FF848ADE2120EF3130FF393CFF393CFF3938FF73719CDEDBBDDEDBBD
          6B6D9C0000F70000F70000EF0000E70000E70000EF0000F70000DE525573BDBA
          9CC6C39C5A5DAD1014FF1818FF181CE71818DE1014DE080C8C9C9E9CFF00FFFF
          00FFFF00FFFF00FF3130EF292CFF4241FF4A49FF4A4DFF4A4DFF6B69846B6984
          2124FF1010FF080CFF0004FF0004F70004F70004F70808FF080CFF1818F76361
          635A598C2120FF2124FF2124FF2120EF181CE71010D6636173CECFCEFF00FFFF
          00FFFF00FFFF00FFA5A6DE2120FF3938FF4A4DFF5A5DFF6365FF6365FF5A5DF7
          5255FF4241FF3130FF2120FF1818FF1818FF181CFF2124FF3130FF3134FF393C
          F73938FF3134FF3130FF292CFF2124EF1818EF313494BDC3C6FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF7379E72928FF4245FF5A5DFF6B6DFF7B79FF8482FF
          8482FF7375FF6365FF5255FF4A49FF4245FF4A49FF4A4DFF5255FF5255FF5251
          FF4A49FF4241FF3938FF292CF72120F72120BDB5B6BDFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF6361E7292CFF4A4DFF6365FF7B7DFF8C8AFF
          9496FF9496FF9492FF8C8AFF7B7DFF7B79FF7371FF7371FF6B6DFF6365FF5A59
          FF5251FF4241FF3134FF2124FF2120CEADB2B5FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF7375E72928FF4A4DFF6B69FF7B7DFF
          9492FFA5A2FFA5A6FFA5A6FFA5A2FF9C9AFF8C8EFF8482FF7375FF6B69FF5A59
          FF4A49FF3938FF2124FF3134CEBDC3C6FF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C9EDE3138F74245FF6361FF
          7B79FF8C8EFF9C9AFFA5A6FFA5A2FF9C9AFF8C8EFF7B7DFF6B6DFF5A5DFF4A49
          FF3938FF181CEF6B6DC6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7B7DE73938FF
          4245FF6365FF7375FF8482FF8486FF7B7DFF7371FF6361FF5251FF393CFF2928
          FF5A5DDEB5BECEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          A5AADE7371E75A59EF5251F74A51FF4A4DFF4A4DF75255EF6B69EF949AE7CECF
          D6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF}
        Transparent = True
      end
    end
    object PnlRTF: TUniPanel
      Tag = 1999
      Left = 61
      Top = 1
      Width = 372
      Height = 180
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      Color = clWhite
      object Bevel1: TUniPanel
        Left = 1
        Top = 1
        Width = 370
        Height = 8
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Caption = ''
      end
      object rtfDisplay: TUniMemo
        Left = 1
        Top = 8
        Width = 370
        Height = 172
        Hint = ''
        ScrollBars = ssVertical
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        ReadOnly = True
        TabOrder = 0
        OnKeyDown = FormKeyDown
      end
    end
  end
end
