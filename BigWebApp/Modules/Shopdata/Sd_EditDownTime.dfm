object FrmSDEditDownTime: TFrmSDEditDownTime
  Left = 229
  Top = 84
  ClientHeight = 423
  ClientWidth = 603
  Caption = 'Edit Downtime'
  OnShow = FormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  Font.Charset = ANSI_CHARSET
  Font.Height = -13
  Font.Style = [fsBold]
  PixelsPerInch = 96
  TextHeight = 16
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 603
    Height = 333
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object lblCode: TUniLabel
      Left = 22
      Top = 175
      Width = 100
      Height = 16
      Hint = ''
      Caption = 'Downtime Code'
      TabOrder = 5
    end
    object sbtnCode: TUniSpeedButton
      Left = 230
      Top = 165
      Width = 60
      Height = 60
      Hint = 'Search... '
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
      OnClick = sbtnCodeClick
    end
    object edtCode: TUniEdit
      Left = 102
      Top = 183
      Width = 121
      Height = 24
      Hint = ''
      Text = ''
      TabOrder = 0
      Color = clBtnFace
      ReadOnly = True
    end
    object gbStartDateTime: TUniGroupBox
      Left = 8
      Top = 8
      Width = 291
      Height = 142
      Hint = ''
      Caption = ' Interval Start '
      TabOrder = 1
      object lblStartDate: TUniLabel
        Left = 16
        Top = 37
        Width = 69
        Height = 16
        Hint = ''
        Caption = 'Start Date'
        TabOrder = 3
      end
      object sbtnStartDate: TUniSpeedButton
        Left = 221
        Top = 15
        Width = 60
        Height = 60
        Hint = 'Search... '
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3977DB3977D
          B3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB397
          7DB3977DB3977DB3977D80808080808080808080808080808080808080808080
          8080808080808080808080808080808080808080808080808080B3977DF3EBDF
          F3EADEF3E9DCF2E9DBB18B62F1E7D8F1E6D7F1E5D5F0E4D4AB8459EFE3D2EFE2
          D1EFE2D0EEE1CFB3977D808080FFFFFFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF
          00FFFF00FFFF00FF787878FFFFFFFF00FFFF00FFFF00FF808080B3977DF6EFE6
          F6EEE5F4EDE3F4EDE2B6916BF3EADFF3EADDF2E9DCF2E8DBAF8960F1E6D8F1E6
          D6F0E4D6EFE4D4B3977D808080FFFFFFFF00FFFF00FFFF00FF868686FFFFFFFF
          00FFFF00FFFF00FF7D7D7DFFFFFFFF00FFFF00FFFF00FF808080B3977DF8F4ED
          F8F2ECF8F1EAF7F1E9BD9974F5EFE6F5EEE4F5EDE2F4EDE1B59069F4EBDFF3E9
          DCF2E8DCF2E8DAB3977D808080FFFFFFFFFFFFFFFFFFFFFFFF8E8E8EFFFFFFFF
          FFFFFFFFFFFFFFFF848484FFFFFFFFFFFFFFFFFFFFFFFF808080B3977DCDAC8F
          C9A686C7A384C5A281C4A07EC29E7DC19D7ABF9A77BD9875BC9772BA9570B893
          6EB7926CB99670B3977D808080A3A3A39C9C9C9A9A9A98989896969694949492
          92929090908E8E8E8C8C8C8A8A8A8888888686868A8A8A808080B3977DFCFBF8
          FCFAF7FCFAF7FBF9F5CAA889FAF7F3FAF6F1FAF6F0F9F5EFBF9F84737DF35C6C
          EB455BE1314ED8AA9282808080FFFFFFFF00FFFF00FFFF00FF9E9E9EFFFFFFFF
          00FFFF00FFFF00FF959595808080808080808080808080808080B3977DFEFDFD
          FEFDFDFDFCFBFDFCFBD1AF93FCFAF8FCFAF7FCFAF6FBF9F5C7A78E8F97F9747E
          F45D6CEC455BE2AB9382808080FFFFFFFF00FFFF00FFFF00FFA6A6A6FFFFFFFF
          00FFFF00FFFF00FF9C9C9C808080808080808080808080808080B3977DFFFFFF
          FFFFFFFEFFFEFEFFFED8B69CFEFEFCFDFDFCFEFCFBFDFBFACEB097ADB2FA8F96
          F8747DF35D6CEBAD9383808080FFFFFFFFFFFFFFFFFFFFFFFFAEAEAEFFFFFFFF
          FFFFFFFFFFFFFFFFA5A5A5808080808080808080808080808080B3977DE3C4AE
          E0BFA7DFBEA6DEBDA4DDBBA3DCBAA1DBB99FD9B79ED8B69CD6B499D5B497D3B1
          95D2B093D2B398B3977D808080BDBDBDB8B8B8B7B7B7B5B5B5B4B4B4B3B3B3B1
          B1B1B0B0B0AEAEAEACACACAAAAAAA8A8A8A6A6A6A9A9A9808080B3977DFFFEFC
          FFFEFEFFFFFEFFFFFEE2C0A9FFFFFFFFFFFFFFFFFFFFFFFFDCBBA1FFFFFFFFFF
          FEFEFEFEFEFEFDB3977D808080FFFFFFFF00FFFF00FFFF00FFB9B9B9FFFFFFFF
          00FFFF00FFFF00FFB3B3B3FFFFFFFF00FFFF00FFFF00FF808080B3977DFFFBF8
          FFFBF9FFFCFAFFFDFBE5C4ABFFFEFDFFFFFEFFFFFEFFFFFFE0BFA7FFFFFFFFFF
          FFFFFFFFFFFFFFB3977D808080FFFFFFFF00FFFF00FFFF00FFBCBCBCFFFFFFFF
          00FFFF00FFFF00FFB8B8B8FFFFFFFF00FFFF00FFFF00FF808080B3977DFFF8F3
          FFF9F4FFF9F5FFFAF5E6C4ACFFFCF8FFFCF9FFFDFBFFFDFBE4C3ABFFFEFDFFFF
          FEFFFFFEFFFFFFB3977D808080FFFFFFFFFFFFFFFFFFFFFFFFBDBDBDFFFFFFFF
          FFFFFFFFFFFFFFFFBCBCBCFFFFFFFFFFFFFFFFFFFFFFFF808080A17A57A17A57
          A17A57A17A57A17A57A17A57A17A57A17A57A17A57A17A57A17A57A17A57A17A
          57A17A57A17A57A17A5777777777777777777777777777777777777777777777
          7777777777777777777777777777777777777777777777777777A37C58FBE2C7
          FBDDC1FBD8BAFBD1B2FACAA9F8C29FF6B793F3AC85F19F74ED9163E88453E378
          44D96936C65628A17A57797979DFDFDFDADADAD5D5D5CFCFCFC7C7C7C0C0C0B7
          B7B7ACACAC9F9F9F9393938787877C7C7C7070705E5E5E777777A17A57A17A57
          A17A57A17A57A17A57A17A57A17A57A17A57A17A57A17A57A17A57A17A57A17A
          57A17A57A17A57A17A5777777777777777777777777777777777777777777777
          7777777777777777777777777777777777777777777777777777}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnStartDateClick
      end
      object lblStartTime: TUniLabel
        Left = 16
        Top = 97
        Width = 67
        Height = 16
        Hint = ''
        Caption = 'Start Time'
        TabOrder = 5
      end
      object sbtnStartTime: TUniSpeedButton
        Left = 221
        Top = 75
        Width = 60
        Height = 60
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        AllowAllUp = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000232E0000232E00000000000000000000FF00FFFF00FF
          CBB3A3A386756F5D4C5038305A4139796054D7B9A3FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFB2B2B28585855B5B5B38383841414160
          6060B7B7B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBFA799
          876757C08870E0A080F0A880D09870B07850705030AC8E7CFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFA6A6A6676767898989A0A0A0A8A8A896969677
          77774D4D4D8D8D8DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDDC7B7967E66
          E0B090FFC8B0FFC8B0FFC8B0FFC0A0F0A880D08860705030D4B199FF00FFFF00
          FFFF00FFFF00FFFF00FFC6C6C67B7B7BAEAEAEC8C8C8C8C8C8C8C8C8C0C0C0A8
          A8A88888884D4D4DAFAFAFFF00FFFF00FFFF00FFFF00FFFF00FFAE9C8BD0C0B0
          FFE0D0FFE0D0FFE0D0FFD8C0FFD0B0FFC8B0F0A880B078508C6F60FF00FFFF00
          FFFF00FFFF00FFFF00FF9A9A9ABEBEBEE0E0E0E0E0E0E0E0E0D7D7D7CECECEC8
          C8C8A8A8A87777776F6F6FFF00FFFF00FFFF00FFFF00FFFF00FFA49282F0E8E0
          FFF0F0FFF0E0504840504840807060C09890FFC0A0E09870634A3FFF00FFFF00
          FFFF00FFFF00FFFF00FF909090E7E7E7F2F2F2EEEEEE4747474747476E6E6E9A
          9A9AC0C0C09898984A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFA08880FFFFFF
          FFF8FFFFF8F0606060C0B0A0FFE0D0FFD8C0FFC8B0F0B090503830FF00FFFF00
          FFFF00FFFF00FFFF00FF888888FFFFFFFAFAFAF7F7F7606060AEAEAEE0E0E0D7
          D7D7C8C8C8B0B0B0383838FF00FFFF00FFFF00FFFF00FFFF00FFB1A08FFFFFFF
          FFFFFFFFFFFF908080D0C8C0FFF0E0FFE8E0FFD8C0E0B090594837FF00FFFF00
          FFFF00FFFF00FFFF00FF9E9E9EFFFFFFFFFFFFFFFFFF818181C7C7C7EEEEEEE9
          E9E9D7D7D7AEAEAE464646FF00FFFF00FFFF00FFFF00FFFF00FFC8B5AEF0F0F0
          FFFFFFFFFFFFA098A0F0E8E0FFF8F0FFF0E0FFE0D0C09880967460FF00FFFF00
          FFFF00FFFF00FFFF00FFB5B5B5F0F0F0FFFFFFFFFFFF9B9B9BE7E7E7F7F7F7EE
          EEEEE0E0E0979797737373FF00FFFF00FFFF00FFFF00FFFF00FFE5D1C3C7C4B4
          FFF8F0FFFFFFC0B8C0FFF8FFFFF8F0FFF0F0C0C8C0406070CEAC95FF00FFFF00
          FFFF00FFFF00FFFF00FFD0D0D0C1C1C1F7F7F7FFFFFFBBBBBBFAFAFAF7F7F7F2
          F2F2C6C6C6626262AAAAAAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD9C5B9
          C7BDB4E0E8F0607880E0E0E0F0F0F0C0C8D050607030A8D0203840B0A0A0FF00
          FFFF00FFFF00FFA9B28DFF00FFC4C4C4BCBCBCEAEAEA787878E0E0E0F0F0F0CA
          CACA636363ADADAD383838A2A2A2FF00FFFF00FFFF00FFABABABFF00FFFF00FF
          E4CEC090A8B080D0E0506070B0B8C050607060C0E050607030B8F01028301030
          40102830767473407840FF00FFFF00FFCDCDCDA8A8A8D0D0D0636363B9B9B963
          6363C3C3C3636363C1C1C12828283232322828287474746C6C6CFF00FFFF00FF
          FF00FFE0E8F090A8B080E0F050607080D0E050607060D0F040607030B0E02098
          D02088B0205070508860FF00FFFF00FFFF00FFEAEAEAA8A8A8DFDFDF636363D0
          D0D0636363D2D2D2626262B7B7B7A2A2A28E8E8E5656567D7D7DFF00FFFF00FF
          FF00FFFF00FFE0E8F090A8B080E0F050607080E0F040587060D0F050C8F040C0
          F020B0E020A0D0609870FF00FFFF00FFFF00FFFF00FFEAEAEAA8A8A8DFDFDF63
          6363DFDFDF5D5D5DD2D2D2CCCCCCC6C6C6B7B7B7A7A7A78D8D8DFF00FFFF00FF
          FF00FFFF00FFFF00FFE0E8F090A8B080E0F040587080E0F070D8F060D0F050C8
          F040C0F030B8F070A880FF00FFFF00FFFF00FFFF00FFFF00FFEAEAEAA8A8A8DF
          DFDF5D5D5DDFDFDFD9D9D9D2D2D2CCCCCCC6C6C6C1C1C19D9D9DFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFE0E8F090A8B080E0F080E0F080E0F070D8F060D0
          F060B0D0808890B0C0A0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEAEAEAA8
          A8A8DFDFDFDFDFDFDFDFDFD9D9D9D2D2D2B3B3B3898989B9B9B9FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFE0E8F090A8B090A0B090A0A08098A08090
          A0808890BEB7B2A0B8A0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEA
          EAEAA8A8A8A3A3A39F9F9F989898939393898989B7B7B7B2B2B2}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnStartTimeClick
      end
      object edtStartDate: TUniEdit
        Left = 96
        Top = 33
        Width = 119
        Height = 24
        Hint = ''
        Text = ''
        TabOrder = 0
      end
      object edtStartTime: TUniEdit
        Left = 96
        Top = 93
        Width = 119
        Height = 24
        Hint = ''
        Text = ''
        TabOrder = 1
      end
    end
    object gbIntervalFinish: TUniGroupBox
      Left = 306
      Top = 8
      Width = 291
      Height = 142
      Hint = ''
      Caption = ' Interval Finish '
      TabOrder = 2
      object lblFinishDate: TUniLabel
        Left = 16
        Top = 37
        Width = 70
        Height = 16
        Hint = ''
        Caption = 'Finish Date'
        TabOrder = 3
      end
      object sbtnFinishDate: TUniSpeedButton
        Left = 221
        Top = 15
        Width = 60
        Height = 60
        Hint = 'Search... '
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3977DB3977D
          B3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB397
          7DB3977DB3977DB3977D80808080808080808080808080808080808080808080
          8080808080808080808080808080808080808080808080808080B3977DF3EBDF
          F3EADEF3E9DCF2E9DBB18B62F1E7D8F1E6D7F1E5D5F0E4D4AB8459EFE3D2EFE2
          D1EFE2D0EEE1CFB3977D808080FFFFFFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF
          00FFFF00FFFF00FF787878FFFFFFFF00FFFF00FFFF00FF808080B3977DF6EFE6
          F6EEE5F4EDE3F4EDE2B6916BF3EADFF3EADDF2E9DCF2E8DBAF8960F1E6D8F1E6
          D6F0E4D6EFE4D4B3977D808080FFFFFFFF00FFFF00FFFF00FF868686FFFFFFFF
          00FFFF00FFFF00FF7D7D7DFFFFFFFF00FFFF00FFFF00FF808080B3977DF8F4ED
          F8F2ECF8F1EAF7F1E9BD9974F5EFE6F5EEE4F5EDE2F4EDE1B59069F4EBDFF3E9
          DCF2E8DCF2E8DAB3977D808080FFFFFFFFFFFFFFFFFFFFFFFF8E8E8EFFFFFFFF
          FFFFFFFFFFFFFFFF848484FFFFFFFFFFFFFFFFFFFFFFFF808080B3977DCDAC8F
          C9A686C7A384C5A281C4A07EC29E7DC19D7ABF9A77BD9875BC9772BA9570B893
          6EB7926CB99670B3977D808080A3A3A39C9C9C9A9A9A98989896969694949492
          92929090908E8E8E8C8C8C8A8A8A8888888686868A8A8A808080B3977DFCFBF8
          FCFAF7FCFAF7FBF9F5CAA889FAF7F3FAF6F1FAF6F0F9F5EFBF9F84737DF35C6C
          EB455BE1314ED8AA9282808080FFFFFFFF00FFFF00FFFF00FF9E9E9EFFFFFFFF
          00FFFF00FFFF00FF959595808080808080808080808080808080B3977DFEFDFD
          FEFDFDFDFCFBFDFCFBD1AF93FCFAF8FCFAF7FCFAF6FBF9F5C7A78E8F97F9747E
          F45D6CEC455BE2AB9382808080FFFFFFFF00FFFF00FFFF00FFA6A6A6FFFFFFFF
          00FFFF00FFFF00FF9C9C9C808080808080808080808080808080B3977DFFFFFF
          FFFFFFFEFFFEFEFFFED8B69CFEFEFCFDFDFCFEFCFBFDFBFACEB097ADB2FA8F96
          F8747DF35D6CEBAD9383808080FFFFFFFFFFFFFFFFFFFFFFFFAEAEAEFFFFFFFF
          FFFFFFFFFFFFFFFFA5A5A5808080808080808080808080808080B3977DE3C4AE
          E0BFA7DFBEA6DEBDA4DDBBA3DCBAA1DBB99FD9B79ED8B69CD6B499D5B497D3B1
          95D2B093D2B398B3977D808080BDBDBDB8B8B8B7B7B7B5B5B5B4B4B4B3B3B3B1
          B1B1B0B0B0AEAEAEACACACAAAAAAA8A8A8A6A6A6A9A9A9808080B3977DFFFEFC
          FFFEFEFFFFFEFFFFFEE2C0A9FFFFFFFFFFFFFFFFFFFFFFFFDCBBA1FFFFFFFFFF
          FEFEFEFEFEFEFDB3977D808080FFFFFFFF00FFFF00FFFF00FFB9B9B9FFFFFFFF
          00FFFF00FFFF00FFB3B3B3FFFFFFFF00FFFF00FFFF00FF808080B3977DFFFBF8
          FFFBF9FFFCFAFFFDFBE5C4ABFFFEFDFFFFFEFFFFFEFFFFFFE0BFA7FFFFFFFFFF
          FFFFFFFFFFFFFFB3977D808080FFFFFFFF00FFFF00FFFF00FFBCBCBCFFFFFFFF
          00FFFF00FFFF00FFB8B8B8FFFFFFFF00FFFF00FFFF00FF808080B3977DFFF8F3
          FFF9F4FFF9F5FFFAF5E6C4ACFFFCF8FFFCF9FFFDFBFFFDFBE4C3ABFFFEFDFFFF
          FEFFFFFEFFFFFFB3977D808080FFFFFFFFFFFFFFFFFFFFFFFFBDBDBDFFFFFFFF
          FFFFFFFFFFFFFFFFBCBCBCFFFFFFFFFFFFFFFFFFFFFFFF808080A17A57A17A57
          A17A57A17A57A17A57A17A57A17A57A17A57A17A57A17A57A17A57A17A57A17A
          57A17A57A17A57A17A5777777777777777777777777777777777777777777777
          7777777777777777777777777777777777777777777777777777A37C58FBE2C7
          FBDDC1FBD8BAFBD1B2FACAA9F8C29FF6B793F3AC85F19F74ED9163E88453E378
          44D96936C65628A17A57797979DFDFDFDADADAD5D5D5CFCFCFC7C7C7C0C0C0B7
          B7B7ACACAC9F9F9F9393938787877C7C7C7070705E5E5E777777A17A57A17A57
          A17A57A17A57A17A57A17A57A17A57A17A57A17A57A17A57A17A57A17A57A17A
          57A17A57A17A57A17A5777777777777777777777777777777777777777777777
          7777777777777777777777777777777777777777777777777777}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnFinishDateClick
      end
      object lblFinishTime: TUniLabel
        Left = 16
        Top = 97
        Width = 68
        Height = 16
        Hint = ''
        Caption = 'Finish Time'
        TabOrder = 5
      end
      object sbtnFinishTime: TUniSpeedButton
        Left = 221
        Top = 75
        Width = 60
        Height = 60
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        AllowAllUp = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000232E0000232E00000000000000000000FF00FFFF00FF
          CBB3A3A386756F5D4C5038305A4139796054D7B9A3FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFB2B2B28585855B5B5B38383841414160
          6060B7B7B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBFA799
          876757C08870E0A080F0A880D09870B07850705030AC8E7CFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFA6A6A6676767898989A0A0A0A8A8A896969677
          77774D4D4D8D8D8DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDDC7B7967E66
          E0B090FFC8B0FFC8B0FFC8B0FFC0A0F0A880D08860705030D4B199FF00FFFF00
          FFFF00FFFF00FFFF00FFC6C6C67B7B7BAEAEAEC8C8C8C8C8C8C8C8C8C0C0C0A8
          A8A88888884D4D4DAFAFAFFF00FFFF00FFFF00FFFF00FFFF00FFAE9C8BD0C0B0
          FFE0D0FFE0D0FFE0D0FFD8C0FFD0B0FFC8B0F0A880B078508C6F60FF00FFFF00
          FFFF00FFFF00FFFF00FF9A9A9ABEBEBEE0E0E0E0E0E0E0E0E0D7D7D7CECECEC8
          C8C8A8A8A87777776F6F6FFF00FFFF00FFFF00FFFF00FFFF00FFA49282F0E8E0
          FFF0F0FFF0E0504840504840807060C09890FFC0A0E09870634A3FFF00FFFF00
          FFFF00FFFF00FFFF00FF909090E7E7E7F2F2F2EEEEEE4747474747476E6E6E9A
          9A9AC0C0C09898984A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFA08880FFFFFF
          FFF8FFFFF8F0606060C0B0A0FFE0D0FFD8C0FFC8B0F0B090503830FF00FFFF00
          FFFF00FFFF00FFFF00FF888888FFFFFFFAFAFAF7F7F7606060AEAEAEE0E0E0D7
          D7D7C8C8C8B0B0B0383838FF00FFFF00FFFF00FFFF00FFFF00FFB1A08FFFFFFF
          FFFFFFFFFFFF908080D0C8C0FFF0E0FFE8E0FFD8C0E0B090594837FF00FFFF00
          FFFF00FFFF00FFFF00FF9E9E9EFFFFFFFFFFFFFFFFFF818181C7C7C7EEEEEEE9
          E9E9D7D7D7AEAEAE464646FF00FFFF00FFFF00FFFF00FFFF00FFC8B5AEF0F0F0
          FFFFFFFFFFFFA098A0F0E8E0FFF8F0FFF0E0FFE0D0C09880967460FF00FFFF00
          FFFF00FFFF00FFFF00FFB5B5B5F0F0F0FFFFFFFFFFFF9B9B9BE7E7E7F7F7F7EE
          EEEEE0E0E0979797737373FF00FFFF00FFFF00FFFF00FFFF00FFE5D1C3C7C4B4
          FFF8F0FFFFFFC0B8C0FFF8FFFFF8F0FFF0F0C0C8C0406070CEAC95FF00FFFF00
          FFFF00FFFF00FFFF00FFD0D0D0C1C1C1F7F7F7FFFFFFBBBBBBFAFAFAF7F7F7F2
          F2F2C6C6C6626262AAAAAAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD9C5B9
          C7BDB4E0E8F0607880E0E0E0F0F0F0C0C8D050607030A8D0203840B0A0A0FF00
          FFFF00FFFF00FFA9B28DFF00FFC4C4C4BCBCBCEAEAEA787878E0E0E0F0F0F0CA
          CACA636363ADADAD383838A2A2A2FF00FFFF00FFFF00FFABABABFF00FFFF00FF
          E4CEC090A8B080D0E0506070B0B8C050607060C0E050607030B8F01028301030
          40102830767473407840FF00FFFF00FFCDCDCDA8A8A8D0D0D0636363B9B9B963
          6363C3C3C3636363C1C1C12828283232322828287474746C6C6CFF00FFFF00FF
          FF00FFE0E8F090A8B080E0F050607080D0E050607060D0F040607030B0E02098
          D02088B0205070508860FF00FFFF00FFFF00FFEAEAEAA8A8A8DFDFDF636363D0
          D0D0636363D2D2D2626262B7B7B7A2A2A28E8E8E5656567D7D7DFF00FFFF00FF
          FF00FFFF00FFE0E8F090A8B080E0F050607080E0F040587060D0F050C8F040C0
          F020B0E020A0D0609870FF00FFFF00FFFF00FFFF00FFEAEAEAA8A8A8DFDFDF63
          6363DFDFDF5D5D5DD2D2D2CCCCCCC6C6C6B7B7B7A7A7A78D8D8DFF00FFFF00FF
          FF00FFFF00FFFF00FFE0E8F090A8B080E0F040587080E0F070D8F060D0F050C8
          F040C0F030B8F070A880FF00FFFF00FFFF00FFFF00FFFF00FFEAEAEAA8A8A8DF
          DFDF5D5D5DDFDFDFD9D9D9D2D2D2CCCCCCC6C6C6C1C1C19D9D9DFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFE0E8F090A8B080E0F080E0F080E0F070D8F060D0
          F060B0D0808890B0C0A0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEAEAEAA8
          A8A8DFDFDFDFDFDFDFDFDFD9D9D9D2D2D2B3B3B3898989B9B9B9FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFE0E8F090A8B090A0B090A0A08098A08090
          A0808890BEB7B2A0B8A0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEA
          EAEAA8A8A8A3A3A39F9F9F989898939393898989B7B7B7B2B2B2}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnFinishTimeClick
      end
      object edtFinishDate: TUniEdit
        Left = 96
        Top = 33
        Width = 118
        Height = 24
        Hint = ''
        Text = ''
        TabOrder = 0
      end
      object edtFinishTime: TUniEdit
        Left = 96
        Top = 93
        Width = 118
        Height = 24
        Hint = ''
        Text = ''
        TabOrder = 1
      end
    end
    object GroupBox2: TUniGroupBox
      Left = 8
      Top = 226
      Width = 591
      Height = 106
      Hint = ''
      Caption = ' Downtime Comment '
      TabOrder = 3
      DesignSize = (
        591
        106)
      object sbtnKeyboard: TUniSpeedButton
        Left = 523
        Top = 36
        Width = 60
        Height = 60
        Hint = 'Keyboard'
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
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF8E8E8E663333
          6633336633336633336633336633336633336633336633336633336633336633
          33663333663333FF00FFFF00FF80808080808080808080808080808080808080
          8080808080808080808080808080808080808080808080FFFFFF808080C4C4C4
          C4C4C4B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9
          B9C4C4C4C4C4C4663333808080FFFFFFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF808080A0A0A0C4C4C4
          C4C4C48080808080808080808080808080808080808080808080808080808080
          80C4C4C4C4C4C4663333808080FFFFFFFF00FF80808080808080808080808080
          8080808080808080808080808080808080FF00FFFF00FF808080A0A0A0C4C4C4
          C4C4C4C4C4C4C4C4C4E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1C4C4C4C4C4
          C4C4C4C4C4C4C4663333808080FFFFFFFF00FFFF00FFFFFFFFFF00FFFFFFFFFF
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFF00FF808080A3A3A3C4C4C4
          C4C4C4808080E1E1E1808080E1E1E1808080808080808080808080E1E1E18080
          80E1E1E1C4C4C4663333808080FFFFFFFF00FF808080FF00FF808080FF00FF80
          8080808080808080808080FF00FF808080FF00FFFF00FF808080A3A3A3C4C4C4
          C4C4C4D9D9D9C4C4C4D9D9D9C4C4C4E1E1E1E1E1E1D9D9D9E1E1E1C4C4C4E1E1
          E1C4C4C4C4C4C4663333808080FFFFFFFF00FFFFFFFFFFFFFFFF00FFFFFFFFFF
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFF808080A7A7A7C4C4C4
          808080808080E1E1E1808080E1E1E1808080808080808080808080E1E1E18080
          80808080C4C4C4663333808080FFFFFF808080808080FF00FF808080FF00FF80
          8080808080808080808080FF00FF808080808080FF00FF808080A7A7A7C4C4C4
          C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4
          C4C4C4C4C4C4C4663333808080FFFFFFFF00FFFFFFFFFFFFFFFF00FFFFFFFFFF
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFF808080A9A9A9C4C4C4
          808080808080E1E1E1808080E1E1E1808080808080808080808080E1E1E18080
          80808080C4C4C4663333808080FFFFFF808080808080FF00FF808080FF00FF80
          8080808080808080808080FF00FF808080808080FF00FF808080A9A9A9C4C4C4
          C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4
          C4C4C4C4C4C4C4663333808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080DBDBDB6B6B6B
          6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B
          6B6B6B6B6B6B6BFF00FFFF00FF80808080808080808080808080808080808080
          8080808080808080808080808080808080808080808080FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        Anchors = [akTop, akRight]
        ParentColor = False
        Color = clWindow
        OnClick = sbtnKeyboardClick
      end
      object memComment: TUniMemo
        Left = 10
        Top = 24
        Width = 506
        Height = 72
        Hint = ''
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 333
    Width = 603
    Height = 90
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel2: TUniPanel
      Left = 341
      Top = 1
      Width = 262
      Height = 88
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 1
        Top = 16
        Width = 120
        Height = 60
        Hint = ''
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
        OnClick = btnOkClick
      end
      object btnCancel: TUniBitBtn
        Left = 129
        Top = 16
        Width = 120
        Height = 60
        Hint = ''
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object PkDTCode: TIQWebHpick
    Tag = 1
    BeforeOpen = AssignEPlantFilter
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT a.down_code AS down_code, a.down_descrip AS down_descrip,'
      '       a.eplant_id AS eplant_id, b.name AS eplant_name'
      '  FROM down_code a, eplant b'
      ' WHERE NVL(pk_hide, '#39'N'#39') <> '#39'Y'#39' AND'
      '       b.id(+) = a.eplant_id AND'
      '       iqms.misc.eplant_filter_include_nulls(a.eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 118
    Top = 237
    object PkDTCodeDOWN_CODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 20
      FieldName = 'DOWN_CODE'
      Origin = 'a.down_code'
      Size = 5
    end
    object PkDTCodeDOWN_DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 40
      FieldName = 'DOWN_DESCRIP'
      Origin = 'a.down_descrip'
    end
    object PkDTCodeEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'a.eplant_id'
      Visible = False
      Size = 0
    end
    object PkDTCodeEPLANT_NAME: TStringField
      FieldName = 'EPLANT_NAME'
      Origin = 'b.name'
      Visible = False
      Size = 30
    end
  end
end
