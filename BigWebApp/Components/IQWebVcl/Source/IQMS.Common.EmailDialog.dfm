object FrmEmailDialog: TFrmEmailDialog
  Left = 0
  Top = 0
  ClientHeight = 286
  ClientWidth = 456
  Caption = 'EMail'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 244
    Width = 456
    Height = 42
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 238
      Top = 1
      Width = 218
      Height = 40
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 3
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 110
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 2
        OnClick = btnCancelClick
      end
    end
  end
  object Panel2: TUniPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 450
    Height = 238
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter3: TUniSplitter
      Left = 119
      Top = 0
      Width = 5
      Height = 238
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlDestEMailLeft01: TUniPanel
      Left = 1
      Top = 1
      Width = 119
      Height = 236
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      DesignSize = (
        119
        236)
      object Label7: TUniLabel
        Left = 6
        Top = 6
        Width = 12
        Height = 13
        Hint = ''
        Caption = 'To'
        TabOrder = 1
      end
      object Label8: TUniLabel
        Left = 6
        Top = 30
        Width = 36
        Height = 13
        Hint = ''
        Caption = 'Subject'
        TabOrder = 2
      end
      object lblOtherAttachments: TUniLabel
        Left = 8
        Top = 220
        Width = 61
        Height = 13
        Hint = ''
        Caption = 'Attachments'
        Anchors = [akLeft, akBottom]
        TabOrder = 3
      end
    end
    object pnlEmailRight: TUniPanel
      Left = 425
      Top = 1
      Width = 25
      Height = 236
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        25
        236)
      object sbtnAssignEmail: TUniSpeedButton
        Left = 2
        Top = 3
        Width = 20
        Height = 20
        Hint = 'Add '#39'TO'#39' Address'
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
        OnClick = sbtnAssignEmailClick
      end
      object sbtnOtherAttachments: TUniSpeedButton
        Left = 2
        Top = 215
        Width = 21
        Height = 23
        Hint = 'Assign attachments ...'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80808000000000
          0000000000808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF808080000000FF00FFFF00FFFF00FF000000808080FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFF00FF00
          0000FF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF000000FF00FF000000FF00FF000000FF00FF000000FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FF000000FF
          00FF000000FF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF000000FF00FF000000FF00FF000000FF00FF000000FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FF000000FF
          00FF000000FF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF000000FF00FF000000FF00FF000000FF00FF000000FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FF000000FF
          00FF000000FF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF000000FF00FF000000FF00FF000000FF00FF000000FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FF000000FF
          00FF000000FF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF000000FF00FF000000FF00FF000000FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF
          00FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF000000000000000000FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        Anchors = [akLeft, akBottom]
        ParentColor = False
        Color = clWindow
        OnClick = sbtnOtherAttachmentsClick
      end
    end
    object pnlEMailClient: TUniPanel
      Left = 124
      Top = 1
      Width = 301
      Height = 236
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      DesignSize = (
        301
        236)
      object edEmailTo: TUniEdit
        Left = 1
        Top = 2
        Width = 296
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object edSubject: TUniEdit
        Left = 1
        Top = 27
        Width = 296
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object memoEmail: TUniMemo
        Left = 1
        Top = 52
        Width = 296
        Height = 161
        Hint = ''
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 2
      end
      object edOtherAttachments: TUniEdit
        Left = 1
        Top = 217
        Width = 296
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 3
        ReadOnly = True
      end
    end
  end
end
