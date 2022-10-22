object FrmSecInsCloneUserSettings: TFrmSecInsCloneUserSettings
  Left = 196
  Top = 292
  ClientHeight = 305
  ClientWidth = 413
  Caption = 'Clone From Another User'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 413
    Height = 264
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 89
      Top = 0
      Width = 6
      Height = 264
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 89
      Height = 262
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 8
        Top = 15
        Width = 54
        Height = 13
        Hint = ''
        Caption = 'Clone From'
        TabOrder = 1
      end
    end
    object Panel5: TUniPanel
      Left = 95
      Top = 1
      Width = 318
      Height = 262
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        318
        262)
      object sbtnSearch: TUniSpeedButton
        Left = 286
        Top = 10
        Width = 25
        Height = 25
        Hint = 'Select User Name'
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
        OnClick = sbtnSearchClick
      end
      object edUserName: TUniEdit
        Left = 1
        Top = 12
        Width = 284
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ReadOnly = True
      end
      object chkSecurityRoles: TUniCheckBox
        Left = 1
        Top = 42
        Width = 97
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Security Roles'
        TabOrder = 1
      end
      object chkWMSProfile: TUniCheckBox
        Left = 1
        Top = 59
        Width = 97
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'WMS Profile'
        TabOrder = 2
      end
      object chkEPlantMembership: TUniCheckBox
        Left = 1
        Top = 76
        Width = 121
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'EPlant Membership'
        TabOrder = 3
      end
      object chkGeneral: TUniCheckBox
        Left = 1
        Top = 93
        Width = 112
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'General User Info'
        TabOrder = 4
      end
      object chkLibraryTeam: TUniCheckBox
        Left = 1
        Top = 195
        Width = 148
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Library Team Membership'
        TabOrder = 10
      end
      object chkPOLimit: TUniCheckBox
        Left = 1
        Top = 110
        Width = 66
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'PO Limit'
        TabOrder = 5
      end
      object chkRMAInvLimit: TUniCheckBox
        Left = 1
        Top = 127
        Width = 93
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'RMA/Inv Limit'
        TabOrder = 6
      end
      object chkExclInvTrans: TUniCheckBox
        Left = 1
        Top = 144
        Width = 138
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Exclude Inventory Trans'
        TabOrder = 7
      end
      object chkCRMCustAccess: TUniCheckBox
        Left = 1
        Top = 161
        Width = 133
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'CRM Customer Access'
        TabOrder = 8
      end
      object chkAccessEPlants: TUniCheckBox
        Left = 1
        Top = 178
        Width = 116
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Accessible EPlants'
        TabOrder = 9
      end
      object chkPayGroups: TUniCheckBox
        Left = 1
        Top = 211
        Width = 148
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Visible Pay Groups'
        TabOrder = 11
      end
      object chkSmartPage: TUniCheckBox
        Left = 1
        Top = 227
        Width = 148
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Smart Page Workspace'
        TabOrder = 12
      end
      object chkSPReports: TUniCheckBox
        Left = 1
        Top = 243
        Width = 148
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Smart Page Reports'
        TabOrder = 13
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 264
    Width = 413
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 411
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object Panel3: TUniPanel
      Left = 236
      Top = 3
      Width = 177
      Height = 38
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 3
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 93
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object PKClone: TIQWebHpick
    BeforeOpen = PKCloneBeforeOpen
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select a.username as username'
      '  from all_users a,'
      '       s_user_general s'
      ' where not a.username in ( '#39'SYS'#39', '#39'SYSTEM'#39' )'
      '   and RTrim(a.username) = RTrim(s.user_name(+))'
      '   and a.username in (select user_name from s_users)'
      '   and a.username <> :username'
      '   '
      ''
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 264
    Top = 98
    ParamData = <
      item
        Name = 'username'
        DataType = ftString
        ParamType = ptInput
      end>
    object PKCloneUSERNAME: TStringField
      DisplayLabel = 'User Name'
      FieldName = 'USERNAME'
      Size = 128
    end
  end
end
