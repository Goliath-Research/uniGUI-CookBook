object FrmCCSelectAccount: TFrmCCSelectAccount
  Left = 293
  Top = 212
  ClientHeight = 231
  ClientWidth = 465
  Caption = 'Select Credit Card Account'
  Position = poOwnerFormCenter
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlCarrier: TUniPanel
    Tag = 1999
    Left = 0
    Top = 41
    Width = 465
    Height = 149
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 1
      Width = 463
      Height = 147
      Hint = ''
      Caption = ' Options '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object PnlOptions: TUniPanel
        Tag = 1999
        Left = 2
        Top = 15
        Width = 459
        Height = 130
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        DesignSize = (
          459
          130)
        object rbSelected: TUniRadioButton
          Left = 8
          Top = 8
          Width = 185
          Height = 17
          Hint = ''
          Checked = True
          Caption = 'Selected merchant account'
          TabOrder = 0
          OnClick = DoRBClick
        end
        object rbAll: TUniRadioButton
          Left = 8
          Top = 72
          Width = 161
          Height = 17
          Hint = ''
          Caption = 'All merchant accounts'
          TabOrder = 1
          OnClick = DoRBClick
        end
        object PnlClient01: TUniPanel
          Tag = 1999
          Left = 16
          Top = 29
          Width = 415
          Height = 25
          Hint = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Caption = ''
          object PnlCreditCardAccountLabel: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 118
            Height = 23
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object lblCreditCardAccount: TUniLabel
              Left = 8
              Top = 4
              Width = 97
              Height = 13
              Hint = ''
              Caption = 'Credit Card Account'
              TabOrder = 1
            end
          end
          object PnlClient02: TUniPanel
            Tag = 1999
            Left = 118
            Top = 1
            Width = 297
            Height = 23
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object PnlButtonsRight: TUniPanel
              Tag = 1999
              Left = 261
              Top = 1
              Width = 36
              Height = 21
              Hint = ''
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              object sbtnSearch: TUniSpeedButton
                Left = 1
                Top = 1
                Width = 23
                Height = 22
                Hint = 'Search'
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
            end
            object PnlCtrls: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 261
              Height = 21
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              DesignSize = (
                261
                21)
              object edtAccount: TUniEdit
                Left = 1
                Top = 1
                Width = 248
                Height = 19
                Hint = ''
                Text = '(None selected)'
                ParentFont = False
                Font.Color = clBtnShadow
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                Color = clBtnFace
                ReadOnly = True
              end
            end
          end
        end
      end
    end
  end
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 190
    Width = 465
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 255
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
        ModalResult = 1
        TabOrder = 1
        Default = True
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object PnlPrompt: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 465
    Height = 41
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object lblPrompt: TUniLabel
      Left = 1
      Top = 1
      Width = 421
      Height = 13
      Hint = ''
      Caption = 
        'Multiple accounts have been used for transactions.  Please selec' +
        't a credit card account.'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
    end
  end
  object PkCreditCardAccount: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT'
      '   a.id AS id,'
      '   a.description AS description,'
      '   a.gateway AS gateway,'
      '   SubStrB(IQEVAL.SubStrW63Max('
      '     iqms.cc.gateway_descrip(a.gateway), 1, 60), 1, 60)'
      '     AS gateway_descrip,'
      '   a.bankinfo_dtl_id AS bankinfo_dtl_id,'
      '   b.account_number AS bank_account_number,'
      '   b.description AS bank_account_description,'
      '   a.eplant_id AS eplant_id,'
      '   c.name AS eplant_name,'
      '   a.is_default AS is_default,'
      '   a.archived AS archived'
      'FROM'
      '   credit_card_account a,'
      '   bankinfo_dtl b,'
      '   eplant c'
      ''
      'WHERE a.id IN (SELECT DISTINCT credit_card_account_id'
      '               FROM credit_card_trans'
      '               WHERE status IN (0, 4)) AND'
      '      b.id(+) = a.bankinfo_dtl_id AND'
      '      c.id(+) = a.eplant_id AND'
      '      iqms.misc.Eplant_Filter(a.eplant_id) = 1'
      '     ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 264
    Top = 46
    object PkCreditCardAccountID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Origin = 'a.id'
      Visible = False
      Size = 0
    end
    object PkCreditCardAccountDESCRIPTION: TStringField
      DisplayLabel = 'Credit Card Account'
      DisplayWidth = 22
      FieldName = 'DESCRIPTION'
      Origin = 'a.description'
      Size = 60
    end
    object PkCreditCardAccountGATEWAY: TBCDField
      FieldName = 'GATEWAY'
      Origin = 'a.gateway'
      Visible = False
      Size = 0
    end
    object PkCreditCardAccountGATEWAY_DESCRIP: TStringField
      DisplayLabel = 'Gateway'
      DisplayWidth = 22
      FieldName = 'GATEWAY_DESCRIP'
      Visible = False
      Size = 60
    end
    object PkCreditCardAccountBANKINFO_DTL_ID: TBCDField
      Tag = 1
      FieldName = 'BANKINFO_DTL_ID'
      Visible = False
      Size = 0
    end
    object PkCreditCardAccountBANK_ACCOUNT_NUMBER: TStringField
      DisplayLabel = 'Bank Account'
      DisplayWidth = 18
      FieldName = 'BANK_ACCOUNT_NUMBER'
      Origin = 'b.account_number'
      Size = 25
    end
    object PkCreditCardAccountBANK_ACCOUNT_DESCRIPTION: TStringField
      DisplayLabel = 'Bank Account Description'
      DisplayWidth = 35
      FieldName = 'BANK_ACCOUNT_DESCRIPTION'
      Origin = 'b.description'
      Size = 60
    end
    object PkCreditCardAccountEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object PkCreditCardAccountEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 18
      FieldName = 'EPLANT_NAME'
      Origin = 'c.name'
      Size = 30
    end
    object PkCreditCardAccountIS_DEFAULT: TStringField
      FieldName = 'IS_DEFAULT'
      Origin = 'a.is_default'
      Size = 1
    end
    object PkCreditCardAccountARCHIVED: TStringField
      FieldName = 'ARCHIVED'
      Origin = 'a.archived'
      Size = 1
    end
  end
end
