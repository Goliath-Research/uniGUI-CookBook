object FrmCRMActivityReminderDlg: TFrmCRMActivityReminderDlg
  Left = 0
  Top = 0
  ClientHeight = 87
  ClientWidth = 564
  Caption = 'Your Reminder'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 46
    Width = 564
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 354
      Top = 1
      Width = 210
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 1
        Default = True
        OnClick = btnOkClick
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        TabOrder = 2
        OnClick = btnCancelClick
      end
    end
  end
  object PnlReminder: TUniPanel
    Left = 0
    Top = 0
    Width = 564
    Height = 38
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    ShowCaption = False
    Caption = ''
    object Splitter12: TUniSplitter
      Left = 235
      Top = 5
      Width = 6
      Height = 33
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Bevel3: TUniPanel
      Left = 1
      Top = 1
      Width = 562
      Height = 5
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      Caption = ''
    end
    object PnlReminderLeft02: TUniPanel
      Left = 43
      Top = 5
      Width = 192
      Height = 33
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      ShowCaption = False
      Caption = ''
      object Splitter13: TUniSplitter
        Left = 66
        Top = 0
        Width = 6
        Height = 33
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object PnlReminderLeft01: TUniPanel
        Left = 1
        Top = 1
        Width = 66
        Height = 31
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        ShowCaption = False
        Caption = ''
        DesignSize = (
          66
          31)
        object chkSetAlarm: TUniDBCheckBox
          Left = 1
          Top = 7
          Width = 65
          Height = 17
          Hint = ''
          ShowHint = True
          ParentShowHint = False
          DataField = 'SETALARM'
          DataSource = SrcMembers
          ValueChecked = 'Y'
          ValueUnchecked = 'N'
          Caption = 'Reminder'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnClick = chkSetAlarmClick
        end
      end
      object PnlReminderComboBox: TUniPanel
        Left = 72
        Top = 1
        Width = 120
        Height = 31
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          120
          31)
        object cmbLeadTime: TUniDBComboBox
          Left = 1
          Top = 5
          Width = 121
          Height = 21
          Hint = ''
          Anchors = [akLeft, akTop, akRight]
          DataField = 'LEADDISPLAYUNITS'
          DataSource = SrcMembers
          Style = csDropDownList
          Items.Strings = (
            '0 Minutes'#9'0'
            '5 Minutes'#9'1'
            '10 Minutes'#9'2'
            '15 Minutes'#9'3'
            '30 Minutes'#9'4'
            '1 Hour'#9'5'
            '2 Hours'#9'6'
            '3 Hours'#9'7'
            '4 Hours'#9'8'
            '5 Hours'#9'9'
            '6 Hours'#9'10'
            '7 Hours'#9'11'
            '8 Hours'#9'12'
            '9 Hours'#9'13'
            '10 Hours'#9'14'
            '11 Hours'#9'15'
            '0.5 Days'#9'16'
            '18 Hours'#9'17'
            '1 Day'#9'18'
            '2 Days'#9'19'
            '3 Days'#9'20'
            '4 Days'#9'21'
            '1 Week'#9'22'
            '2 Weeks'#9'23')
          TabOrder = 0
        end
      end
    end
    object PnlSendMail: TUniPanel
      Left = 241
      Top = 5
      Width = 323
      Height = 33
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      ShowCaption = False
      Caption = ''
      object Splitter15: TUniSplitter
        Left = 72
        Top = 0
        Width = 6
        Height = 33
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object PnlSendMailInner: TUniPanel
        Left = 1
        Top = 1
        Width = 72
        Height = 31
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        ShowCaption = False
        Caption = ''
        DesignSize = (
          72
          31)
        object chkSendEmail: TUniDBCheckBox
          Left = 1
          Top = 7
          Width = 71
          Height = 17
          Hint = ''
          DataField = 'SEND_MAIL'
          DataSource = SrcMembers
          ValueChecked = 'Y'
          ValueUnchecked = 'N'
          Caption = 'Send Email'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnClick = chkSendEmailClick
        end
      end
      object PnlSendMailControls: TUniPanel
        Left = 78
        Top = 1
        Width = 245
        Height = 31
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        ShowCaption = False
        Caption = ''
        DesignSize = (
          245
          31)
        object sbtnEMail: TUniSpeedButton
          Left = 220
          Top = 5
          Width = 22
          Height = 22
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
          Anchors = [akTop, akRight]
          ParentColor = False
          Color = clWindow
          OnClick = sbtnEMailClick
        end
        object dbeAlertEMail: TUniDBEdit
          Left = 1
          Top = 5
          Width = 217
          Height = 25
          Hint = ''
          ShowHint = True
          ParentShowHint = False
          DataField = 'EMAIL'
          DataSource = SrcMembers
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
      end
    end
    object PnlAlarmImg: TUniPanel
      Left = 1
      Top = 5
      Width = 43
      Height = 33
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 2
      ShowCaption = False
      Caption = ''
      object imgBellColor: TUniImage
        Left = 1
        Top = 1
        Width = 32
        Height = 32
        Hint = ''
        Visible = False
        Picture.Data = {
          07544269746D6170360C0000424D360C00000000000036000000280000002000
          0000200000000100180000000000000C0000C40E0000C40E0000000000000000
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFBAC4C886ACBF5C99B75998B67EA9BDB2C0C7FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFAFBFC64C95B655C0DDB9E9F75ADDF922B0DF4A93B7A1B8C3FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF7CA7BC22A9DD25D7FF5BE4FF25D8FF08B6F41A8CD46DA1BAFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFBDC5C94690B80897E308B4F009BFF508B3F00897E3067AD53D88B8AEBF
          C6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFB5C2C89EB8C488AEBF81AABE70A2BA
          679FB9629CB84B91B44E93B44E93B44E93B44E93B44E93B44E93B44E93B45998
          B6679FB97AA7BC81AABE98B5C2B2C0C7C9CACBFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFB9C3C985ACBF5A98B64594BB439AC345A3CE4FABD45AB8DF
          65C5E66FCCEB77D4EF84E7FF84E7FF7EE7FF75E7FF68E7FF5AE3FF4CDFFF40CF
          F438C8F036BAE437B3DE3FA5CE479ABF4E93B470A2BAA0B8C4FF00FFFF00FFFF
          00FFFF00FFC9CACB4C93B5268DC51991D3209ADA2FA5DF3FB0E44FBBE95EC6EE
          6BD1F377DAF87FE2FB84E7FF84E7FF7EE7FF75E7FF68E7FF5AE4FF4CDEFF3ED9
          FF32D5FF29D0FF26CBFD26C4F926BBF227B1E937A1D24796BD82AABEFF00FFFF
          00FFFF00FFC5C9CB4992B60889D21390D5209ADA44AFE376C7EE8CD4F4AEE3F8
          B5E8FAB7EAFBDAF5FDDDF6FEE7F9FEFFFFFFFFFFFFF5FCFEE9F9FDE6F9FDDBF7
          FEB4EDFD9BE6FD7DDCFC4CCBF926BBF226B2EB2AA9E4369ED44E93B4FF00FFFF
          00FFFF00FFC5C9CB4992B63DA3DE9FD3F3DBF0FCC5E9FBA6E0FB82D7FB77D8FB
          5DD4FB52D4FB3ED3FB4FDAFB69E2FC84E9FC9CEDFBACF0FBADF1FBA1EEFB96EB
          FD85E6FC8CE5FD8FE0FCB4E7FDDAF3FEC2EAFC74CAF33CA2D64E93B4FF00FFFF
          00FFFF00FFFF00FF81AABEA0CDEA60B6F028A5EF2CB0F530BCF932C4FC33CBFD
          38D1FE3CD5FE41DAFE53E1FE72EAFF92F1FEA9F6FEBAF9FEBBF9FEA9F6FE8AED
          FE67E6FF49DBFE25CAFE14BAFE0FB5FD26BBFD7FD6FD96CCE77FA9BDFF00FFFF
          00FFFF00FFFF00FFB5C2C84C93B63298D827A2EF2BAEF32FBBF832C6FC35CEFE
          39D4FF3DD8FF42DCFF54E3FF77EBFF9BF2FEB1F7FEC0FBFEC1FBFEB1F6FE94F0
          FF76E8FF47DCFF25CCFF14BBFF0FB8FF0FB6FE33A1D24E93B4B3C0C7FF00FFFF
          00FFFF00FFFF00FFFF00FFABBDC677A6BC3899D228A7EF2CB4F530C0F934CBFD
          38D3FE3CD8FF42DDFF54E2FF7BECFFA4F3FEB8F8FEC5FAFEC7FBFEB9F8FE9FF2
          FF7AE9FF43DCFF26CCFF14BBFF0FB7FE399ECD4E93B4ABBDC6FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFBAC4C882AABE389BD228ACF02CB8F532C6FA
          38D1FE3CD7FF42DCFF54E3FF7BECFEABF5FEBDF9FFCAFBFFCBFBFEBDF9FEA6F3
          FE6FE7FE43DCFF26CCFF14BCFF2EA4D94E93B4B3C0C7FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFB9C3C94D93B52BA4E529B2F130C1F7
          36CEFC3CD7FF42DCFF54E3FF7AECFEACF5FFBEF9FFCAFBFECCFBFEBEF8FEA5F2
          FF61E5FE43DBFF26CCFF24AFE94D93B5A8BCC5FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF81AABE399BCF27ACEE2DBCF4
          35CBFA3BD5FE42DCFF54E3FF78EBFFACF4FFBEF9FFCAFBFECBFBFEBEF8FF9CF1
          FE5FE4FE43DBFF26CBFF439AC2A1B8C3FF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA3B9C44596BF26AAED2CB7F2
          34C8F93BD4FD42DCFF54E3FF76EBFFACF5FFBEF9FECAFBFECBFBFEBEF8FE94F0
          FE5FE5FF44DCFF2DC1F276A5BCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBAC4C84D93B526A8EB2BB4F1
          32C6F83AD3FD42DCFF54E3FF74EBFFACF4FEBEF9FECAFBFECBFBFEBEF9FE8CEF
          FF5FE5FF43DCFF36B2DF9CB6C3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC9CACB4E93B42BA4E329B3F0
          32C4F63AD2FC42DBFF54E3FF71EAFEACF4FFBEF9FFCAFBFECBFBFEBEF8FE86EE
          FF5FE5FF43DBFF3EA9D2B2C0C7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5596B52CA2E029B2EF
          32C3F639D1FC42DBFF54E2FF70EAFFACF5FFBEF9FECAFBFECCFBFEBEF9FE83ED
          FE5FE4FE43DCFF40A5CCBEC6C9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5596B5126EC325A7E7
          31C2F63AD1FC42DBFF54E3FF6EEAFFABF5FFBEF9FECAFBFECBFBFEB9F8FE82EE
          FF5FE5FF2FB0E43D9AC4C5C9CBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5596B51A6BC40360C4
          1282D227ACE63CD1F854E3FF6EEAFFA7F5FEBEF9FECAFBFECCFBFEA9EFF95FCB
          EB2D9FDC147ACF4197C0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5496B68FC9EB87BBE6
          1071CD0373D2037FDB0C91E11DA4E63CC0EF52D7F85CDCF845D2F737C0F12BA9
          E5319ADDAAE0F465ACCBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E93B42EA4E193D8F7
          E4F6FDB0E1F667BFEA3BA9E61BA3E71EB8F543D7FB5CDCF87ADDF598DEF2C6EF
          F9E8FBFF8AE9FF489DC1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4E93B42BA3E129B1EF
          3DC6F784E2FDC1F3FFDDF9FFFCFFFFFFFFFFFFFFFFFAFFFFF5FEFFE6FDFFB3F5
          FE6AE6FE43DCFF4E9DBFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCBCCCC4E93B429A4E529B0EE
          30C0F538CEFA41D9FE53E2FF6DEAFE99F3FFB8F8FFC4FAFEC4FBFEACF6FE82ED
          FF5FE5FE42DAFF4D9EC0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF82AABE3F99C727ADEC
          2DB9F134C6F63DD2FA50DCFC6BE6FD8BEEFEA7F5FEB7F8FEB7F9FEA2F3FE80EB
          FD5CE0FC42C9F06DA5BEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1C7CA82AABE4896BC
          36A7DA30BBF038C6F54AD2F763DCF980E6FA9AECFAAAF0FAABF0FA98EBFA77DF
          F753BCDD4D96B7A6BBC5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA8BCC5
          74A4BB4C95B843A1C947B0D956BCE06CC9E780CFE87EC4DD7DC2DB63ADCB4F96
          B789AEBFBEC6C9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFC4C8CB6CA0BA3B85B73A8DBC4093BC408FBA327EB74087B57AA7BCC8CA
          CBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF92B1C12E8CC62AD9FF91ECFF29D9FF0783DA3882B8A7BBC5FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFC6C9CA4C93B57DD2EAC6F3FF90ECFF2399D37FA9BDFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFA6BBC572A3BB579FBE4A9ABC7FA9BDB3C0C7FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF}
        Transparent = True
      end
      object imgBell: TUniImage
        Left = 1
        Top = 1
        Width = 32
        Height = 32
        Hint = ''
        Picture.Data = {
          07544269746D6170360C0000424D360C00000000000036000000280000002000
          0000200000000100180000000000000C0000C40E0000C40E0000000000000000
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFC5C5C5AEAEAE9D9D9D9C9C9CABABABC1C1C1FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFC0C0C0999999C2C2C2E9E9E9DEDEDEB7B7B7989898B9B9B9FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFAAAAAAB1B1B1DADADAE4E4E4DBDBDBC0C0C09C9C9CA4A4A4FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFC6C6C6979797A7A7A7BEBEBEC6C6C6BDBDBDA7A7A7909090909090C0C0
          C0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFC3C3C3B9B9B9B0B0B0ACACACA5A5A5
          A2A2A29F9F9F9696969797979797979797979797979797979797979797979C9C
          9CA2A2A2AAAAAAACACACB6B6B6C1C1C1CACACAFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFC4C4C4AEAEAE9C9C9C9A9A9AA0A0A0A9A9A9B1B1B1BDBDBD
          C8C8C8CFCFCFD6D6D6E8E8E8E8E8E8E8E8E8E8E8E8E7E7E7E4E4E4E0E0E0D2D2
          D2CCCCCCBFBFBFB9B9B9ABABAB9F9F9F979797A5A5A5B9B9B9FF00FFFF00FFFF
          00FFFF00FFCACACA9898989797979E9E9EA6A6A6AFAFAFB8B8B8C2C2C2CBCBCB
          D4D4D4DCDCDCE3E3E3E8E8E8E8E8E8E8E8E8E8E8E8E7E7E7E4E4E4E0E0E0DCDC
          DCD9D9D9D5D5D5D1D1D1CBCBCBC3C3C3BABABAA9A9A99C9C9CACACACFF00FFFF
          00FFFF00FFC9C9C99797979898989E9E9EA6A6A6B8B8B8CCCCCCD8D8D8E5E5E5
          E9E9E9EBEBEBF6F6F6F7F7F7F9F9F9FFFFFFFFFFFFFCFCFCF9F9F9F9F9F9F7F7
          F7EEEEEEE7E7E7DFDFDFD1D1D1C3C3C3BBBBBBB3B3B3A7A7A7979797FF00FFFF
          00FFFF00FFC9C9C9979797AEAEAED7D7D7F2F2F2EBEBEBE3E3E3DBDBDBDBDBDB
          D8D8D8D8D8D8D7D7D7DCDCDCE2E2E2E8E8E8ECECECEFEFEFEFEFEFEDEDEDEBEB
          EBE6E6E6E6E6E6E2E2E2E9E9E9F4F4F4ECECECD0D0D0ABABAB979797FF00FFFF
          00FFFF00FFFF00FFACACACD1D1D1C1C1C1B4B4B4BDBDBDC6C6C6CCCCCCD1D1D1
          D6D6D6D9D9D9DCDCDCE2E2E2E9E9E9EFEFEFF4F4F4F7F7F7F7F7F7F4F4F4ECEC
          ECE6E6E6DDDDDDD1D1D1C6C6C6C3C3C3C7C7C7DBDBDBCFCFCFABABABFF00FFFF
          00FFFF00FFFF00FFC3C3C3989898A5A5A5B2B2B2BBBBBBC5C5C5CECECED4D4D4
          D9D9D9DBDBDBDEDEDEE3E3E3EAEAEAF0F0F0F5F5F5F9F9F9F9F9F9F4F4F4EFEF
          EFE8E8E8DEDEDED2D2D2C7C7C7C5C5C5C4C4C4A9A9A9979797C1C1C1FF00FFFF
          00FFFF00FFFF00FFFF00FFBEBEBEA9A9A9A3A3A3B5B5B5BFBFBFC9C9C9D1D1D1
          D8D8D8DBDBDBDFDFDFE3E3E3EBEBEBF1F1F1F6F6F6F8F8F8F9F9F9F6F6F6F0F0
          F0E9E9E9DEDEDED2D2D2C7C7C7C4C4C4A5A5A5979797BEBEBEFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFC5C5C5ACACACA5A5A5B8B8B8C2C2C2CDCDCD
          D6D6D6DBDBDBDEDEDEE3E3E3EBEBEBF3F3F3F7F7F7F9F9F9F9F9F9F7F7F7F1F1
          F1E7E7E7DEDEDED2D2D2C8C8C8ADADAD979797C1C1C1FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFC4C4C4989898B0B0B0BDBDBDC9C9C9
          D3D3D3DBDBDBDEDEDEE3E3E3EBEBEBF3F3F3F7F7F7F9F9F9F9F9F9F6F6F6F1F1
          F1E5E5E5DDDDDDD2D2D2B8B8B8989898BDBDBDFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFACACACA4A4A4B8B8B8C5C5C5
          D1D1D1D9D9D9DEDEDEE3E3E3EAEAEAF2F2F2F7F7F7F9F9F9F9F9F9F7F7F7EFEF
          EFE4E4E4DDDDDDD2D2D2A0A0A0B9B9B9FF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBABABA9C9C9CB6B6B6C1C1C1
          CECECED8D8D8DEDEDEE3E3E3EAEAEAF3F3F3F7F7F7F9F9F9F9F9F9F6F6F6EFEF
          EFE5E5E5DEDEDEC8C8C8A8A8A8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC5C5C5989898B4B4B4BEBEBE
          CDCDCDD7D7D7DEDEDEE3E3E3EAEAEAF2F2F2F7F7F7F9F9F9F9F9F9F7F7F7EEEE
          EEE5E5E5DEDEDEB8B8B8B7B7B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCACACA979797AFAFAFBDBDBD
          CBCBCBD6D6D6DDDDDDE3E3E3E9E9E9F2F2F2F7F7F7F9F9F9F9F9F9F6F6F6EDED
          EDE5E5E5DDDDDDAEAEAEC1C1C1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCACACA9A9A9AAEAEAEBCBCBC
          CACACAD6D6D6DDDDDDE3E3E3E9E9E9F3F3F3F7F7F7F9F9F9F9F9F9F7F7F7ECEC
          ECE4E4E4DEDEDEAAAAAAC7C7C7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCACACA9A9A9A838383B3B3B3
          CACACAD6D6D6DDDDDDE3E3E3E9E9E9F3F3F3F7F7F7F9F9F9F9F9F9F6F6F6EDED
          EDE5E5E5B8B8B8A0A0A0C9C9C9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCACACA9A9A9A8282827C7C7C
          949494B6B6B6D4D4D4E3E3E3E9E9E9F3F3F3F7F7F7F9F9F9F9F9F9EDEDEDCDCD
          CDABABAB8E8E8E9D9D9DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCACACA9B9B9BCECECEC3C3C3
          8888888B8B8B969696A2A2A2B0B0B0C6C6C6D9D9D9DDDDDDD5D5D5C7C7C7B3B3
          B3A8A8A8E2E2E2B0B0B0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCACACA979797AFAFAFDCDCDC
          F7F7F7E3E3E3C5C5C5B4B4B4B0B0B0C2C2C2D9D9D9DDDDDDDEDEDEDFDFDFEFEF
          EFFBFBFBE9E9E9A2A2A2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCACACA979797AEAEAEBBBBBB
          CDCDCDE4E4E4F3F3F3F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFCFCFCF3F3
          F3E6E6E6DEDEDEA2A2A2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCCCCCC979797B0B0B0BABABA
          C8C8C8D3D3D3DCDCDCE3E3E3E9E9E9F1F1F1F6F6F6F8F8F8F9F9F9F4F4F4ECEC
          ECE5E5E5DDDDDDA3A3A3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFACACACA1A1A1B8B8B8
          C2C2C2CCCCCCD6D6D6DDDDDDE5E5E5EDEDEDF3F3F3F6F6F6F7F7F7F1F1F1EAEA
          EAE1E1E1CDCDCDA8A8A8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC8C8C8ACACAC9C9C9C
          AFAFAFC3C3C3CCCCCCD5D5D5DDDDDDE6E6E6EBEBEBEEEEEEEEEEEEEAEAEAE0E0
          E0BFBFBF9A9A9ABCBCBCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBDBDBD
          A7A7A79A9A9AA7A7A7B5B5B5C0C0C0CCCCCCD1D1D1C6C6C6C4C4C4B0B0B09A9A
          9AB0B0B0C7C7C7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFC9C9C9A3A3A38E8E8E9595959999999696968989898F8F8FAAAAAACACA
          CAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFB3B3B3979797DCDCDCECECECDCDCDC9898988C8C8CBCBCBCFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFC9C9C9989898D3D3D3F4F4F4ECECECA4A4A4ABABABFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFBCBCBCA6A6A6A3A3A39F9F9FABABABC1C1C1FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF}
        Transparent = True
      end
    end
  end
  object SrcMembers: TDataSource
    DataSet = QryMembers
    OnDataChange = SrcMembersDataChange
    Left = 264
    Top = 16
  end
  object QryMembers: TFDQuery
    Active = True
    BeforeOpen = QryMembersBeforeOpen
    BeforePost = QryMembersBeforePost
    AfterPost = QryMembersAfterPost
    IndexesActive = False
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvUpdateChngFields, uvUpdateMode, uvLockMode, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateOptions.UpdateTableName = 'CRM_ACTIVITY_MEMBERS'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = FDUpdateSQL1
    SQL.Strings = (
      'SELECT crm_activity_members.id,'
      '       crm_activity_members.crm_activity_id,'
      '       crm_activity_members.setalarm,'
      '       crm_activity_members.leadduration,'
      '       crm_activity_members.leaddisplayunits,'
      '       crm_activity_members.alert_datetime,'
      '       crm_activity_members.send_mail,'
      '       crm_activity_members.email,'
      '       crm_activity_members.mail_sent_date,'
      '       crm_activity_members.source_disp,'
      '       crm_activity.startdate,'
      '       crm_activity.allday'
      '  FROM crm_activity_members, crm_activity'
      ' WHERE crm_activity_members.id = :ID AND'
      '   crm_activity.id = crm_activity_members.crm_activity_id')
    Left = 272
    Top = 24
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryMembersID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object QryMembersCRM_ACTIVITY_ID: TBCDField
      FieldName = 'CRM_ACTIVITY_ID'
      Origin = 'CRM_ACTIVITY_ID'
      Precision = 15
      Size = 0
    end
    object QryMembersSETALARM: TStringField
      FieldName = 'SETALARM'
      Origin = 'SETALARM'
      Size = 1
    end
    object QryMembersLEADDURATION: TBCDField
      FieldName = 'LEADDURATION'
      Origin = 'LEADDURATION'
      Precision = 18
      Size = 0
    end
    object QryMembersLEADDISPLAYUNITS: TBCDField
      FieldName = 'LEADDISPLAYUNITS'
      Origin = 'LEADDISPLAYUNITS'
      Precision = 6
      Size = 0
    end
    object QryMembersALERT_DATETIME: TDateTimeField
      FieldName = 'ALERT_DATETIME'
      Origin = 'ALERT_DATETIME'
    end
    object QryMembersSEND_MAIL: TStringField
      FieldName = 'SEND_MAIL'
      Origin = 'SEND_MAIL'
      Size = 1
    end
    object QryMembersEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 2000
    end
    object QryMembersMAIL_SENT_DATE: TDateTimeField
      FieldName = 'MAIL_SENT_DATE'
      Origin = 'MAIL_SENT_DATE'
    end
    object QryMembersSTARTDATE: TDateTimeField
      FieldName = 'STARTDATE'
      Origin = 'STARTDATE'
    end
    object QryMembersALLDAY: TStringField
      FieldName = 'ALLDAY'
      Origin = 'ALLDAY'
      FixedChar = True
      Size = 1
    end
    object QryMembersSOURCE_DISP: TStringField
      FieldName = 'SOURCE_DISP'
      Origin = 'SOURCE_DISP'
      Visible = False
      Size = 255
    end
  end
  object FDUpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    ModifySQL.Strings = (
      'UPDATE CRM_ACTIVITY_MEMBERS'
      'SET SETALARM = :NEW_SETALARM, LEADDURATION = :NEW_LEADDURATION, '
      
        '  LEADDISPLAYUNITS = :NEW_LEADDISPLAYUNITS, ALERT_DATETIME = :NE' +
        'W_ALERT_DATETIME, '
      
        '  SEND_MAIL = :NEW_SEND_MAIL, EMAIL = :NEW_EMAIL, MAIL_SENT_DATE' +
        ' = :NEW_MAIL_SENT_DATE'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, CRM_ACTIVITY_ID, SOURCE_ID, SOURCE, CONTACT_ID, SOURC' +
        'E_DISP, '
      
        '  USER_ID, FIRST_NAME, LAST_NAME, TITLE, CONTACT_PHONE, CONTACT_' +
        'EXT, '
      '  CONTACT_FAX, CONTACT_EMAIL, COMPANY, ADDR1, ADDR2, ADDR3, '
      
        '  CITY, STATE, ZIP, COUNTRY, COMPANY_PHONE, COMPANY_EXT, COMPANY' +
        '_FAX, '
      '  COMPANY_URL, CRM_PROSPECT, USE_USA_MASK, EID, ECODE, ECOPY, '
      '  EDATE_TIME, COMPANYNO, HAS_CONFLICT, SCHEDULE_REQUEST_STATUS, '
      '  CONTACT_MOBILE, ASSIGNEDTO, ASSIGNEDTO_DISPLAY, MIDDLE_NAME, '
      
        '  NICKNAME, SETALARM, LEADDURATION, LEADDISPLAYUNITS, ALERT_DATE' +
        'TIME, '
      '  SEND_MAIL, EMAIL, MAIL_SENT_DATE, REMINDER_MODIFIED_BY_USER'
      'FROM CRM_ACTIVITY_MEMBERS'
      'WHERE ID = :ID')
    Left = 280
    Top = 32
  end
end