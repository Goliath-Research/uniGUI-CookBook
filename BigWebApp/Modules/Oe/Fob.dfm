object FrmFob: TFrmFob
  Left = 130
  Top = 166
  HelpContext = 1098509
  ClientHeight = 328
  ClientWidth = 587
  Caption = 'F.O.B.'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 587
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object SBSearchPurch: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Third Party Billing'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FF00FFB9A899
        AE937AA78669A17A57A17A57A17A57A37E5DAA8B6FAE9278C1B6ADFF00FFFF00
        FFFF00FFFF00FFFF00FFA58262C3875FD78E65E39368F3B391FFFFFFF3B291EB
        9669DF9266D68E64A17B58FF00FFFF00FFFF00FFFF00FFFF00FFA27C5AF2AC85
        F5AD86F5AD86FDF0E8FFFFFFFDF0E8F4AD85F4AD86F5AD86A17A57FF00FFFF00
        FFFF00FFFF00FFFF00FFA9886CE9B390F8BF9CFAC9ABFFFFFFFFFFFFFFFFFFF9
        C7A8F8BF9CF0B895A68364FF00FFFF00FFFF00FFFF00FFFF00FFB7A392C99F7D
        F3C5A5EDCEBC80AAD85C91CC87AEDAEDCFBEF6C7A7D2A786816B6E4C579C6069
        A48087B0B5B7C3FF00FFCBC9C8B097809D81695388C590C4EAAADAF68DC1E850
        86C5957A68957B79EEEAE7909CED5567DA5060C64A559CC7C8CAFF00FFFF00FF
        6596CAA3D1F0C7ECFEC9EDFEC7ECFDA0CFEF5C8CD4CBD1FCFFFFFFE3E6FD7C8B
        F67383E94D5D9DC9CACBFF00FFBEC4CC5589C2C7ECFEC9EDFEC9EDFEC9EDFEC7
        EDFE5288C9EFF3FCFFFFFFFFFFFF9BA6EE5D73B43F729F42709AFF00FFA1B1C3
        3E6F9CBADFF3C9EDFEC9EDFEC8ECFDC7ECFD4F82BBBED2EA9ABADFCEDCEE4C6A
        9D4478A54486BB43709AFF00FF92A6B8427BAC88B1CEA0C7DF6E98BA9CC3DC51
        7DA44278A67DACD092C6EA78AAD65387B262A3D5497AA6A0AFBCFF00FF8099B0
        6195C06093BF5789B46CA2CE6297C25A8CB75486B0B7DCF0C4EAFCA4DBF75082
        AD4C7CA67F98AFFF00FFFF00FFB8BFC54F7CA38EB7D5A1C9E4B1D7F0ABD2EC91
        B9D747749CBDE2F5C8ECFDBBE3F75588B445739CC7C9CAFF00FFFF00FFFF00FF
        ADB7C07591AB577EA348749D43719A5280A94E81AC5583AA6C96B9A5CCE3679D
        C747749DC5C7C9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9FAEBB65
        91B67CB5DF8BBFE583B6DD4B78A06DA7D47290ABFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF7F98AF5F8AAFABD0EABADDF585B8DF5885
        ABABB6C0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF97A8B85F83A34370995C81A295A7B7FF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = SBSearchPurchClick
    end
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 587
    Height = 301
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 370
    IQComponents.Grid.Height = 215
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcFob
    IQComponents.Grid.LoadMask.Message = 'Loading data...'
    IQComponents.Grid.Align = alClient
    IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
    IQComponents.Grid.TabOrder = 0
    IQComponents.Navigator.Left = 410
    IQComponents.Navigator.Top = 0
    IQComponents.Navigator.Width = 241
    IQComponents.Navigator.Height = 25
    IQComponents.Navigator.Hint = ''
    IQComponents.Navigator.ShowHint = True
    IQComponents.Navigator.DataSource = SrcFob
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 370
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 215
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcFob
    Columns = <
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'FOB'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EXCLUDE_UPS_FREIGHT'
        Title.Caption = 'Exclude from freight charge'
        Width = 64
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'DED_FROM_INV_TOT'
        Title.Caption = 'Deduct from Invoice Total'
        Width = 64
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'CODE'
        Title.Caption = 'Code'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'THIRD_PARTY_BILLING'
        Title.Caption = 'Third Party Billing'
        Width = 64
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'SUBJECT_TO_FREIGHT_REV'
        Title.Caption = 'Subject to Freight Revenue'
        Width = 64
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'PK_HIDE'
        Title.Caption = 'Inactive'
        Width = 64
        CheckBoxField.FieldValues = 'Y;N'
      end>
    Marker = 0
  end
  object SrcFob: TDataSource
    DataSet = QryFOB
    Left = 48
    Top = 88
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into FOB'
      
        '  (ID, DESCRIP, EXCLUDE_UPS_FREIGHT, DED_FROM_INV_TOT, CODE, THI' +
        'RD_PARTY_BILLING, SUBJECT_TO_FREIGHT_REV, PK_HIDE)'
      'values'
      
        '  (:ID, :DESCRIP, :EXCLUDE_UPS_FREIGHT, :DED_FROM_INV_TOT, :CODE' +
        ', :THIRD_PARTY_BILLING, :SUBJECT_TO_FREIGHT_REV, :PK_HIDE)')
    ModifySQL.Strings = (
      'update FOB'
      'set'
      '  ID = :ID,'
      '  DESCRIP = :DESCRIP,'
      '  EXCLUDE_UPS_FREIGHT = :EXCLUDE_UPS_FREIGHT,'
      '  DED_FROM_INV_TOT = :DED_FROM_INV_TOT,'
      '  CODE = :CODE,'
      '  THIRD_PARTY_BILLING = :THIRD_PARTY_BILLING,'
      '  SUBJECT_TO_FREIGHT_REV = :SUBJECT_TO_FREIGHT_REV,'
      '  PK_HIDE = :PK_HIDE'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from FOB'
      'where'
      '  ID = :OLD_ID')
    Left = 136
    Top = 96
  end
  object QryFOB: TFDQuery
    BeforePost = QryFOBBeforePost
    OnNewRecord = QryFOBNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'FOB'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id,'
      '       descrip,'
      '       code,'
      '       exclude_ups_freight,'
      '       ded_from_inv_tot,'
      '      THIRD_PARTY_BILLING,  '
      '      SUBJECT_TO_FREIGHT_REV,'
      '      PK_HIDE'
      ' from FOB'
      '')
    Left = 120
    Top = 80
    object QryFOBDESCRIP: TStringField
      DisplayLabel = 'FOB'
      DisplayWidth = 60
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 60
    end
    object QryFOBEXCLUDE_UPS_FREIGHT: TStringField
      DisplayLabel = 'Exclude from freight charge'
      DisplayWidth = 13
      FieldName = 'EXCLUDE_UPS_FREIGHT'
      Origin = 'EXCLUDE_UPS_FREIGHT'
      FixedChar = True
      Size = 1
    end
    object QryFOBDED_FROM_INV_TOT: TStringField
      DisplayLabel = 'Deduct from Invoice Total'
      DisplayWidth = 20
      FieldName = 'DED_FROM_INV_TOT'
      Origin = 'DED_FROM_INV_TOT'
      FixedChar = True
      Size = 1
    end
    object QryFOBCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 15
      FieldName = 'CODE'
      Origin = 'CODE'
      Size = 15
    end
    object QryFOBTHIRD_PARTY_BILLING: TStringField
      DisplayLabel = 'Third Party Billing'
      DisplayWidth = 1
      FieldName = 'THIRD_PARTY_BILLING'
      Origin = 'THIRD_PARTY_BILLING'
      Size = 1
    end
    object QryFOBSUBJECT_TO_FREIGHT_REV: TStringField
      DisplayLabel = 'Subject to Freight Revenue'
      DisplayWidth = 1
      FieldName = 'SUBJECT_TO_FREIGHT_REV'
      Origin = 'SUBJECT_TO_FREIGHT_REV'
      Size = 1
    end
    object QryFOBPK_HIDE: TStringField
      DisplayLabel = 'Inactive'
      DisplayWidth = 1
      FieldName = 'PK_HIDE'
      Origin = 'IQ.FOB.PK_HIDE'
      Size = 1
    end
    object QryFOBID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ID'
      Visible = False
      Size = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 440
    Top = 96
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FOB'
    Version = 'Feature unsupported'
    ChangeListNumber = '$Change: 191335 $'
    Left = 248
    Top = 88
  end
end
