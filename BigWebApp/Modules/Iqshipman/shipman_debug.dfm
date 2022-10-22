object FrmShipManDebug: TFrmShipManDebug
  Left = 362
  Top = 191
  ClientHeight = 356
  ClientWidth = 519
  Caption = 'Debug'
  OnShow = FormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 78
    Width = 519
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object PnlError: TUniPanel
    Left = 0
    Top = 0
    Width = 519
    Height = 78
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    ParentColor = True
    object PnlLeft: TUniPanel
      Left = 54
      Top = 1
      Width = 464
      Height = 76
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ParentColor = True
      object Bevel1: TUniPanel
        Left = 1
        Top = 1
        Width = 462
        Height = 3
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Caption = ''
      end
      object lblError: TUniLabel
        Left = 1
        Top = 4
        Width = 28
        Height = 13
        Hint = ''
        Caption = 'Error'
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Style = [fsBold]
        TabOrder = 3
      end
      object memError: TUniMemo
        Left = 1
        Top = 17
        Width = 462
        Height = 58
        Hint = ''
        ScrollBars = ssVertical
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        ReadOnly = True
        TabOrder = 0
      end
    end
    object Panel7: TUniPanel
      Left = 1
      Top = 1
      Width = 53
      Height = 76
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
      Caption = ''
      ParentColor = True
      object Image1: TUniImage
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
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 325
    Width = 519
    Height = 31
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Left = 422
      Top = 1
      Width = 96
      Height = 29
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniBitBtn
        Left = 1
        Top = 1
        Width = 89
        Height = 25
        Hint = ''
        Caption = 'Close'
        ModalResult = 1
        TabOrder = 0
      end
    end
  end
  object Panel4: TUniPanel
    Left = 0
    Top = 81
    Width = 519
    Height = 244
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object pcMain: TUniPageControl
      Left = 1
      Top = 1
      Width = 517
      Height = 242
      Hint = ''
      ActivePage = TabXMLRequest
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabXMLRequest: TUniTabSheet
        Hint = ''
        Caption = 'XML Request'
        object Panel5: TUniPanel
          Left = 0
          Top = 192
          Width = 509
          Height = 22
          Hint = ''
          Align = alBottom
          Anchors = [akLeft, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object chkWordWrap_Request: TUniCheckBox
            Left = 1
            Top = 3
            Width = 97
            Height = 17
            Hint = ''
            Checked = True
            Caption = 'Word wrap'
            TabOrder = 0
            OnClick = chkWordWrap_RequestClick
          end
          object btnCopy1: TUniButton
            Left = 433
            Top = 1
            Width = 75
            Height = 20
            Hint = ''
            Caption = 'Copy'
            Anchors = [akTop, akRight, akBottom]
            Align = alRight
            TabOrder = 2
          end
          object btnSelect1: TUniButton
            Left = 358
            Top = 1
            Width = 75
            Height = 20
            Hint = ''
            Caption = 'Select'
            Anchors = [akTop, akRight, akBottom]
            Align = alRight
            TabOrder = 3
            OnClick = btnSelect1Click
          end
          object btnSave1: TUniButton
            Left = 283
            Top = 1
            Width = 75
            Height = 20
            Hint = ''
            Caption = 'Save To File'
            Anchors = [akTop, akRight, akBottom]
            Align = alRight
            TabOrder = 4
            OnClick = btnSave1Click
          end
          object btnWordwrap1: TUniButton
            Left = 208
            Top = 1
            Width = 75
            Height = 20
            Hint = ''
            Caption = 'Word Wrap'
            Anchors = [akTop, akRight, akBottom]
            Align = alRight
            TabOrder = 5
            OnClick = btnWordwrap1Click
          end
        end
        object memRequest: TUniMemo
          Left = 0
          Top = 0
          Width = 509
          Height = 192
          Hint = ''
          ScrollBars = ssVertical
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          ReadOnly = True
          TabOrder = 1
        end
      end
      object TabXMLResponse: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'XML Response'
        object Panel6: TUniPanel
          Left = 0
          Top = 192
          Width = 509
          Height = 22
          Hint = ''
          Align = alBottom
          Anchors = [akLeft, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object chkWordWrap_Response: TUniCheckBox
            Left = 1
            Top = 3
            Width = 97
            Height = 17
            Hint = ''
            Checked = True
            Caption = 'Word wrap'
            TabOrder = 0
            OnClick = chkWordWrap_ResponseClick
          end
          object btnCopy2: TUniButton
            Left = 433
            Top = 1
            Width = 75
            Height = 20
            Hint = ''
            Caption = 'Copy'
            Anchors = [akTop, akRight, akBottom]
            Align = alRight
            TabOrder = 2
          end
          object btnSave2: TUniButton
            Left = 283
            Top = 1
            Width = 75
            Height = 20
            Hint = ''
            Caption = 'Save To File'
            Anchors = [akTop, akRight, akBottom]
            Align = alRight
            TabOrder = 3
            OnClick = btnSave2Click
          end
          object btnSelect2: TUniButton
            Left = 358
            Top = 1
            Width = 75
            Height = 20
            Hint = ''
            Caption = 'Select'
            Anchors = [akTop, akRight, akBottom]
            Align = alRight
            TabOrder = 4
            OnClick = btnSelect2Click
          end
          object btnWordWrap2: TUniButton
            Left = 208
            Top = 1
            Width = 75
            Height = 20
            Hint = ''
            Caption = 'Word Wrap'
            Anchors = [akTop, akRight, akBottom]
            Align = alRight
            TabOrder = 5
            OnClick = btnWordWrap2Click
          end
        end
        object memResponse: TUniMemo
          Left = 0
          Top = 0
          Width = 509
          Height = 192
          Hint = ''
          ScrollBars = ssVertical
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
  end
end
