object FrmAssociatedOEM: TFrmAssociatedOEM
  Left = 0
  Top = 0
  ClientHeight = 175
  ClientWidth = 635
  Caption = 'Associated OEMs'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtPkOEM: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = ''
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
        90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
        40905030773818FF00FFB09080FFF8FFE0C8C0D0A090C08060804020FF00FFFF
        00FFFF00FFB08060F0E8E0E0C8C0D0A890B07850804820FF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FFB09080FFF8FFE0C8C0D0A090C08060804020FF00FFFF
        00FFFF00FFB08060F0E8E0F0E0E0E0C0B0C08870804830FF00FFC09880FFFFFF
        F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FFC3A494B08870A068509050308048308048208038108F
        4C26B08870A06850905830904830804020703810905830FF00FFDEC4B4B08870
        FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
        50803820CFA98AFF00FFFF00FFC09080F0F0F0FFF8F0F0D8C0B0806080482096
        5732B09070FFFFFFFFF8F0F0D0C0B07850804820FF00FFFF00FFFF00FFF8E2D2
        C09880B08060A068509050309058409D6842B07860B08870A070508048308048
        20ECC4A7FF00FFFF00FFFF00FFFF00FFC09880FFF8FFE0C0B0C09070804820FF
        00FFC09880FFF8FFE0C8B0D0A080804820FF00FFFF00FFFF00FFFF00FFFF00FF
        CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
        37FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1836DFFF8F0814527FF00FFFF
        00FFFF00FFB08068FFF8F0804324FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      OnClick = sbtPkOEMClick
    end
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 635
    Height = 148
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 418
    IQComponents.Grid.Height = 62
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = DataSource1
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
    IQComponents.Navigator.DataSource = DataSource1
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 418
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 62
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = DataSource1
    Columns = <
      item
        FieldName = 'VENDORNO'
        Title.Caption = 'Vendor'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'COMPANY'
        Title.Caption = 'Company'
        Width = 420
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CITY'
        Title.Caption = 'City'
        Width = 210
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'STATE'
        Title.Caption = 'State'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ZIP'
        Title.Caption = 'Zip/Postal Code'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ADDR1'
        Title.Caption = 'Address 1'
        Width = 420
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ADDR2'
        Title.Caption = 'Address 2'
        Width = 420
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ADDR3'
        Title.Caption = 'Address 3'
        Width = 420
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CUSER1'
        Title.Caption = 'User Text'
        Width = 420
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'QA_RATING'
        Title.Caption = 'QA Rating'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'VEN_RATING'
        Title.Caption = 'Vendor Rating'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TAX_CODE_ID'
        Title.Caption = 'Tax Code'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'IS_OEM'
        Title.Caption = 'OEM'
        Width = 7
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object DataSource1: TDataSource
    DataSet = wwQryOEM
    Left = 560
    Top = 48
  end
  object wwQryOEM: TFDQuery
    BeforeOpen = wwQryOEMBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '
      '       v.id as id,'
      '       v.vendorno,'
      '       v.company,'
      '       v.city,'
      '       v.state,'
      '       v.zip,'
      '       v.addr1,'
      '       v.addr2,'
      '       v.addr3,'
      '       v.cuser1,'
      '       v.qa_rating,'
      '       v.ven_rating,'
      '       v.tax_code_id,'
      '       v.is_oem'
      '  from vendor v,'
      '       vendor_oem_dist o'
      ' where o.dist_vendor_id = :id'
      '   and o.oem_vendor_id = v.id'
      ' order by v.vendorno')
    Left = 496
    Top = 96
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQryOEMVENDORNO: TStringField
      DisplayLabel = 'Vendor'
      DisplayWidth = 10
      FieldName = 'VENDORNO'
      Origin = 'IQ.VENDOR.VENDORNO'
      Size = 10
    end
    object wwQryOEMCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 60
      FieldName = 'COMPANY'
      Origin = 'IQ.VENDOR.COMPANY'
      Size = 60
    end
    object wwQryOEMCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 30
      FieldName = 'CITY'
      Origin = 'IQ.VENDOR.CITY'
      Size = 30
    end
    object wwQryOEMSTATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 20
      FieldName = 'STATE'
      Origin = 'IQ.VENDOR.STATE'
    end
    object wwQryOEMZIP: TStringField
      DisplayLabel = 'Zip/Postal Code'
      DisplayWidth = 10
      FieldName = 'ZIP'
      Origin = 'IQ.VENDOR.ZIP'
      Size = 10
    end
    object wwQryOEMADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 60
      FieldName = 'ADDR1'
      Origin = 'IQ.VENDOR.ADDR1'
      Size = 60
    end
    object wwQryOEMADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 60
      FieldName = 'ADDR2'
      Origin = 'IQ.VENDOR.ADDR2'
      Size = 60
    end
    object wwQryOEMADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 60
      FieldName = 'ADDR3'
      Origin = 'IQ.VENDOR.ADDR3'
      Size = 60
    end
    object wwQryOEMCUSER1: TStringField
      DisplayLabel = 'User Text'
      DisplayWidth = 60
      FieldName = 'CUSER1'
      Origin = 'IQ.VENDOR.CUSER1'
      Size = 60
    end
    object wwQryOEMQA_RATING: TStringField
      DisplayLabel = 'QA Rating'
      DisplayWidth = 10
      FieldName = 'QA_RATING'
      Origin = 'IQ.VENDOR.QA_RATING'
      Size = 10
    end
    object wwQryOEMVEN_RATING: TStringField
      DisplayLabel = 'Vendor Rating'
      DisplayWidth = 10
      FieldName = 'VEN_RATING'
      Origin = 'IQ.VENDOR.VEN_RATING'
      Size = 10
    end
    object wwQryOEMTAX_CODE_ID: TBCDField
      DisplayLabel = 'Tax Code'
      DisplayWidth = 10
      FieldName = 'TAX_CODE_ID'
      Origin = 'IQ.VENDOR.TAX_CODE_ID'
      Size = 0
    end
    object wwQryOEMIS_OEM: TStringField
      DisplayLabel = 'OEM'
      DisplayWidth = 1
      FieldName = 'IS_OEM'
      Origin = 'IQ.VENDOR.IS_OEM'
      Size = 1
    end
    object wwQryOEMID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.VENDOR.ID'
      Visible = False
      Size = 0
    end
  end
  object PkOEM: TIQWebHpick
    BeforeOpen = PkOEMBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select '
      '       v.id as id,'
      '       v.vendorno,'
      '       v.company,'
      '       v.city,'
      '       v.state,'
      '       v.zip,'
      '       v.addr1,'
      '       v.addr2,'
      '       v.addr3,'
      '       v.cuser1,'
      '       v.qa_rating,'
      '       v.ven_rating,'
      '       v.tax_code_id,'
      '       v.is_oem'
      '  from vendor v,'
      '       vendor_oem_dist o'
      ' where o.dist_vendor_id = :id'
      '   and o.oem_vendor_id = v.id'
      ' order by v.vendorno'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 496
    Top = 48
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkOEMID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.VENDOR.ID'
      Visible = False
      Size = 0
    end
    object PkOEMVENDORNO: TStringField
      DisplayLabel = 'Vendor'
      FieldName = 'VENDORNO'
      Origin = 'IQ.VENDOR.VENDORNO'
      Size = 10
    end
    object PkOEMCOMPANY: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      Origin = 'IQ.VENDOR.COMPANY'
      Size = 60
    end
    object PkOEMCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Origin = 'IQ.VENDOR.CITY'
      Size = 30
    end
    object PkOEMSTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
      Origin = 'IQ.VENDOR.STATE'
    end
    object PkOEMZIP: TStringField
      DisplayLabel = 'Zip / Postal Code'
      FieldName = 'ZIP'
      Origin = 'IQ.VENDOR.ZIP'
      Size = 10
    end
    object PkOEMADDR1: TStringField
      DisplayLabel = 'Address 1'
      FieldName = 'ADDR1'
      Origin = 'IQ.VENDOR.ADDR1'
      Size = 60
    end
    object PkOEMADDR2: TStringField
      DisplayLabel = 'Address 2'
      FieldName = 'ADDR2'
      Origin = 'IQ.VENDOR.ADDR2'
      Size = 60
    end
    object PkOEMADDR3: TStringField
      DisplayLabel = 'Address 3'
      FieldName = 'ADDR3'
      Origin = 'IQ.VENDOR.ADDR3'
      Size = 60
    end
    object PkOEMCUSER1: TStringField
      DisplayLabel = 'User Text'
      FieldName = 'CUSER1'
      Origin = 'IQ.VENDOR.CUSER1'
      Size = 60
    end
    object PkOEMQA_RATING: TStringField
      DisplayLabel = 'QA Rating'
      FieldName = 'QA_RATING'
      Origin = 'IQ.VENDOR.QA_RATING'
      Size = 10
    end
    object PkOEMVEN_RATING: TStringField
      DisplayLabel = 'Vendor Rating'
      FieldName = 'VEN_RATING'
      Origin = 'IQ.VENDOR.VEN_RATING'
      Size = 10
    end
    object PkOEMTAX_CODE_ID: TBCDField
      DisplayLabel = 'Tax Code'
      FieldName = 'TAX_CODE_ID'
      Origin = 'IQ.VENDOR.TAX_CODE_ID'
      Size = 0
    end
    object PkOEMIS_OEM: TStringField
      DisplayLabel = 'Is OEM'
      FieldName = 'IS_OEM'
      Origin = 'IQ.VENDOR.IS_OEM'
      Size = 1
    end
  end
end
