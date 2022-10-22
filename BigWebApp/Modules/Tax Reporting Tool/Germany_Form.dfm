object FrmGermany: TFrmGermany
  Left = 0
  Top = 0
  ClientHeight = 107
  ClientWidth = 484
  Caption = 'Additional Information for Germany'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  DesignSize = (
    484
    107)
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TUniLabel
    Left = 3
    Top = 46
    Width = 51
    Height = 13
    Hint = ''
    Caption = 'Fiscal Year'
    TabOrder = 9
  end
  object lblEPlant: TUniLabel
    Left = 8
    Top = 8
    Width = 30
    Height = 13
    Hint = ''
    Caption = 'EPlant'
    TabOrder = 10
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 67
    Width = 484
    Height = 40
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 312
      Top = 1
      Width = 171
      Height = 38
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 7
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Ok'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 88
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 2
        OnClick = BtnCancelClick
      end
    end
  end
  object EdCustomer: TUniEdit
    Left = 127
    Top = 164
    Width = 302
    Height = 21
    Hint = ''
    Visible = False
    Text = 'Customer.csv'
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
  end
  object EdGL: TUniEdit
    Left = 132
    Top = 165
    Width = 302
    Height = 21
    Hint = ''
    Visible = False
    Text = 'General Journal.csv'
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
  end
  object EditGlYear: TUniEdit
    Left = 104
    Top = 40
    Width = 325
    Height = 19
    Hint = ''
    Text = ''
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    Color = clBtnFace
    ReadOnly = True
  end
  object Panel1: TUniPanel
    Left = 435
    Top = 0
    Width = 49
    Height = 67
    Hint = ''
    Align = alRight
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 5
    Caption = ''
    DesignSize = (
      49
      67)
    object SBSearchPurch: TUniSpeedButton
      Left = 0
      Top = 38
      Width = 25
      Height = 25
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
      Anchors = [akTop, akRight]
      ParentColor = False
      Color = clWindow
      OnClick = SBSearchPurchClick
    end
    object sbtnEPlant: TUniSpeedButton
      Left = 0
      Top = 6
      Width = 22
      Height = 22
      Hint = 'Assign Plant'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDD0000000000DDDDDD0FFFFFFFF0DDDDDD0FFFFFFF
        F0DDDDDD0FF80FFFF0DDDDDD0F800FFFF0DDDDDD080B0FFFF0DDDDDD00B0FFFF
        F0DDDDDD0B0FFFFFF0DDDDD0B0FFFFFFF0DDDD0B0FFFFFFFF0DDD0B07FFFFFFF
        F0DDD90D0000000000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnEPlantClick
    end
    object RbCustomer: TUniCheckBox
      Left = -31
      Top = 165
      Width = 66
      Height = 17
      Hint = ''
      Visible = False
      Checked = True
      Caption = 'Include'
      Anchors = [akTop, akRight]
      TabOrder = 0
    end
    object RBGL: TUniCheckBox
      Left = -31
      Top = 192
      Width = 66
      Height = 15
      Hint = ''
      Visible = False
      Checked = True
      Caption = 'Include'
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
    object RbVendor: TUniCheckBox
      Left = -31
      Top = 169
      Width = 66
      Height = 17
      Hint = ''
      Visible = False
      Checked = True
      Caption = 'Include'
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
  end
  object EdVendor: TUniEdit
    Left = 140
    Top = 165
    Width = 302
    Height = 21
    Hint = ''
    Visible = False
    Text = 'Vendor.csv'
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
  end
  object EdAcct: TUniEdit
    Left = 132
    Top = 173
    Width = 302
    Height = 21
    Hint = ''
    Visible = False
    Text = 'GLACCT.csv'
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 6
  end
  object EdVat: TUniEdit
    Left = 132
    Top = 191
    Width = 302
    Height = 21
    Hint = ''
    Visible = False
    Text = 'VAT_INFO.csv'
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 7
  end
  object edEplant: TUniEdit
    Left = 104
    Top = 7
    Width = 325
    Height = 19
    Hint = ''
    Text = ''
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 8
    Color = clBtnFace
    ReadOnly = True
  end
  object MainMenu1: TUniMainMenu
    Left = 8
    Top = 64
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Additional Information for Germany'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 197095 $'
    BuildVersion = '176554'
    Left = 40
    Top = 64
  end
  object PkYear: TIQWebHpick
    BeforeOpen = PkYearBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.id as id,'
      '       a.descrip as description,'
      '       a.eplant_id as eplant_id'
      '  from glyear a'
      
        ' where (:aEplantId = 0) or ((:aEplantId <> 0 and a.eplant_id = :' +
        'aEplantId) or (a.eplant_id is null)) '
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 80
    Top = 68
    ParamData = <
      item
        Name = 'AEPLANTID'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object PkYearID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkYearDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIPTION'
      Size = 25
    end
    object PkYearEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.GLYEAR.EPLANT_ID'
      Size = 0
    end
  end
  object PkEplant: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select c.code as ecode,'
      '       c.company as company_name,'
      '       p.id as plant_id,'
      '       p.name as plant_name'
      '  from ecompany c,'
      '       eplant p'
      ' where c.id = p.ecompany_id'
      ' order by p.name')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 195
    Top = 72
    object PkEplantECODE: TStringField
      DisplayLabel = 'ECode'
      FieldName = 'ECODE'
      Origin = 'ECODE'
      Size = 10
    end
    object PkEplantCOMPANY_NAME: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY_NAME'
      Origin = 'COMPANY_NAME'
      Size = 60
    end
    object PkEplantPLANT_ID: TBCDField
      DisplayLabel = 'Plant ID'
      FieldName = 'PLANT_ID'
      Origin = 'PLANT_ID'
      Required = True
      Precision = 15
      Size = 0
    end
    object PkEplantPLANT_NAME: TStringField
      DisplayLabel = 'Plant Name'
      FieldName = 'PLANT_NAME'
      Origin = 'PLANT_NAME'
      Required = True
      Size = 30
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 136
    Top = 66
    object UnAssignEplant1: TUniMenuItem
      Caption = 'UnAssign Eplant'
      OnClick = UnAssignEplant1Click
    end
  end
end
