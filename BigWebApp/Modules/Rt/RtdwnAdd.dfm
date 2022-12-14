object FrmRTDwnAdd: TFrmRTDwnAdd
  Left = 0
  Top = 0
  ClientHeight = 251
  ClientWidth = 374
  Caption = 'Create Downtime Interval'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 121
    Top = 0
    Width = 6
    Height = 210
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = 16250871
  end
  object PnlLabels: TUniPanel
    Left = 0
    Top = 0
    Width = 121
    Height = 210
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    Caption = ''
    object lblWorkCenterNumber: TUniLabel
      Left = 8
      Top = 11
      Width = 72
      Height = 13
      Hint = ''
      Caption = 'Work Center #'
      TabOrder = 1
    end
    object lblMfgNumber: TUniLabel
      Left = 8
      Top = 35
      Width = 29
      Height = 13
      Hint = ''
      Caption = 'Mfg #'
      TabOrder = 2
    end
    object lblEPlantID: TUniLabel
      Left = 8
      Top = 59
      Width = 44
      Height = 13
      Hint = ''
      Caption = 'EPlant ID'
      TabOrder = 3
    end
    object lblIntervalStart: TUniLabel
      Left = 8
      Top = 83
      Width = 65
      Height = 13
      Hint = ''
      Caption = 'Interval Start'
      TabOrder = 4
    end
    object lblIntervalEnd: TUniLabel
      Left = 8
      Top = 107
      Width = 59
      Height = 13
      Hint = ''
      Caption = 'Interval End'
      TabOrder = 5
    end
    object lblDownTimeCode: TUniLabel
      Left = 8
      Top = 131
      Width = 75
      Height = 13
      Hint = ''
      Caption = 'Downtime Code'
      TabOrder = 6
    end
    object lblCodeDescription: TUniLabel
      Left = 8
      Top = 155
      Width = 81
      Height = 13
      Hint = ''
      Caption = 'Code Description'
      TabOrder = 7
    end
  end
  object PnlEditControls: TUniPanel
    Left = 127
    Top = 0
    Width = 247
    Height = 210
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlEditControlsClient: TUniPanel
      Left = 1
      Top = 1
      Width = 185
      Height = 208
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      DesignSize = (
        185
        208)
      object edEqNo: TUniEdit
        Left = 0
        Top = 8
        Width = 180
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object edMfgNo: TUniEdit
        Left = 0
        Top = 32
        Width = 180
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object edEPlant: TUniEdit
        Left = 0
        Top = 56
        Width = 180
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object cmbIntervalStart: TUniDBDateTimePicker
        Left = 0
        Top = 80
        Width = 180
        Height = 21
        Hint = ''
        DateTime = 42681.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
      end
      object cmbIntervalEnd: TUniDBDateTimePicker
        Left = 0
        Top = 104
        Width = 180
        Height = 21
        Hint = ''
        DateTime = 42681.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
      end
      object cmbDownCodeDlg: TUniEdit
        Left = 0
        Top = 128
        Width = 180
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        ReadOnly = True
        OnKeyDown = cmbDownCodeDlgKeyDown
      end
      object edDownDescrip: TUniEdit
        Left = 0
        Top = 152
        Width = 180
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
    end
    object PnlEditControlButtons: TUniPanel
      Left = 186
      Top = 1
      Width = 60
      Height = 208
      Hint = ''
      Visible = False
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object sbtnIntervalStart: TUniSpeedButton
        Left = 0
        Top = 72
        Width = 40
        Height = 40
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
        OnClick = sbtnIntervalStartClick
      end
      object sbtnIntervalEnd: TUniSpeedButton
        Left = 0
        Top = 112
        Width = 40
        Height = 40
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
        OnClick = sbtnIntervalEndClick
      end
      object sbtnDownTimeCode: TUniSpeedButton
        Left = 0
        Top = 152
        Width = 40
        Height = 40
        Hint = ''
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
        OnClick = cmbDownCodeDlgCustomDlg
      end
    end
  end
  object PnlButtons: TUniPanel
    Left = 0
    Top = 210
    Width = 374
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object PnlModalButtons: TUniPanel
      Left = 152
      Top = 1
      Width = 221
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 4
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 116
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object PkDownCode: TIQWebHpick
    BeforeOpen = PkDownCodeBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select d.down_code as down_code,              '
      '       d.down_descrip as down_descrip,'
      '       d.eplant_id as eplant_id,'
      
        '       substr(rt_misc.down_code_source( d.down_code, :standard_i' +
        'd, :work_center_id ), 1, 20) as source,'
      '       d.cuser1 as cuser1,'
      '       d.cuser2 as cuser2'
      '  from '
      '       down_code d'
      ' where '
      '       nvl(d.pk_hide, '#39'N'#39') <> '#39'Y'#39' '
      
        '   and ( rt_misc.filter_down_code( d.down_code, :standard_id, :w' +
        'ork_center_id ) = 3'
      '         and'
      '         misc.eplant_filter_include_nulls( d.eplant_id ) = 1 '
      ''
      '         or'
      '         '
      
        '         rt_misc.filter_down_code( d.down_code, :standard_id, :w' +
        'ork_center_id ) in (1, 2))'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 12
    Top = 211
    ParamData = <
      item
        Name = 'standard_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'work_center_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkDownCodeDOWN_CODE: TStringField
      DisplayLabel = 'Down Code'
      FieldName = 'DOWN_CODE'
      FixedChar = True
      Size = 5
    end
    object PkDownCodeDOWN_DESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DOWN_DESCRIP'
      FixedChar = True
    end
    object PkDownCodeEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkDownCodeSOURCE: TStringField
      DisplayLabel = 'Source'
      DisplayWidth = 20
      FieldName = 'SOURCE'
    end
    object PkDownCodeCUSER1: TStringField
      DisplayLabel = 'CUser1'
      FieldName = 'CUSER1'
      Size = 60
    end
    object PkDownCodeCUSER2: TStringField
      DisplayLabel = 'CUser2'
      FieldName = 'CUSER2'
      Size = 60
    end
  end
end
