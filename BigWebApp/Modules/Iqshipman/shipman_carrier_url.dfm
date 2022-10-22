object FrmShipManCarrierURL: TFrmShipManCarrierURL
  Left = 259
  Top = 208
  ClientHeight = 223
  ClientWidth = 414
  Caption = 'Carrier URL'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 414
    Height = 223
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel3: TUniPanel
      Left = 1
      Top = 27
      Width = 412
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Caption = ''
    end
    object Panel8: TUniPanel
      Left = 1
      Top = 30
      Width = 412
      Height = 193
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object GridURL: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 410
        Height = 191
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 193
        IQComponents.Grid.Height = 105
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcCarrierURL
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
        IQComponents.Navigator.DataSource = SrcCarrierURL
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 193
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 105
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcCarrierURL
        Columns = <
          item
            FieldName = 'TYPE'
            Title.Caption = 'URL Type'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'URL'
            Title.Caption = 'URL'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object cmbURLType: TUniDBComboBox
        Left = 216
        Top = 40
        Width = 121
        Height = 21
        Hint = ''
        Style = csDropDownList
        Items.Strings = (
          'All'#9'0'
          'Test'#9'1'
          'Rates'#9'2'
          'Shipment'#9'3'
          'Labels'#9'4'
          'Tracking'#9'5'
          'Address Validation'#9'6')
        TabOrder = 1
      end
    end
    object Panel6: TUniPanel
      Left = 1
      Top = 1
      Width = 412
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object sbtnClearAll: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Clear All'
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000C21E0000C21E00000001000000000000473E7D005050
          500051515100535353005555550057575700585858005D5D5D005E5E5E005F5F
          5F004D4E63004E486B00504D6D004E4C760049417E004E457E00606060006565
          650066666600696969006A6A6A006B6B6B006C6C6C006E6E6E006F6F6F006363
          7B0070707000717171007272720076767600473C800049388200533D8F004B40
          84004C448500534F83005655810059568D005B568D0054449700554598005D54
          93005E5294005C5A9500625E9900665B9F0062618B00636693005451A7005C4E
          B3005F4FB4005C4FBB005D4DBC006153A100695EAE007474A4007978A2007D7E
          A0007D7DB3007C7BBB007E7CBE005B4BC0007C72CC00FF00FF00808080008282
          8200868686008B8B8B008C8C8C008D8D8D008E8E8E008C949B00909090009191
          910093939300959595009696960097979700949C9B0098989800999999009B9B
          9B009D9D9D009F9F9F009BA49A009BA69C00A1AE9E009E9FA3009F99AA008386
          B3008184B7008F8EB000898EB5008882BD008885BC00888CBC009492B0009B9F
          B8009EA9A1009FA0B500A0A0A000A2A2A200A3A3A300A4A4A400A5A5A500A7A7
          A700A0ACA000A6AAAB00A9A9A900AAAAAA00ACACAC00A1A5B000B3B3B300B5B5
          B500B7B7B700B9B9B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBF
          BF00888AC4008487CB008C8EC8009191C100928BD400968FD800979AD7009CA2
          CD009CA0D100A0A3C200AFBCCC00A6A7DA00B3A9D800AEB1D700B0B1D300B6B8
          D600BABBD500B2B5DB00B2B3DF00B1B8DF0097AAE3009FB1E0009CB3E100AAAD
          E000AAA9E700ACAEE400B1A7ED00A3B0E800B2B2E000B2B3E500B9BFE800BCBD
          E900A3AEF200B4B5F200BBB5F600B7BBF000B9BDF000B8BCF100BBBEF100B5B7
          F800B8B5FA00B7BCF900BDB9FF00BFC6ED00C1C1C100C4C4C400C6C6C600C7C7
          C700C8C8C800C9C9C900CACACA00CBCBCB00C9CFCE00CECECE00CFCFCF00C3C5
          D700CACCD400D0D0D000D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D4DB
          D400D8D8D800D9D9D900DCDDD900DCDCDC00DDDDDD00DEDEDE00DFDFDF00C3C9
          E600C7C8EA00C7CCEB00D2D2E000D3D2E200DCDCEA00C6C5F100C1C1F700C7C3
          F400C2C6F700C6CAF300C5C8F400CBCAF200C8C9F500C6C6FF00CBC7F800CCC5
          FF00D0CAFF00CED6F300D7D3F700D7D6F600D7D8F200D1DAF500D8D4FD00DADC
          FA00DADDFC00DDDDFF00E4DCFB00DFE3F600D9E8F100DAE0FF00E0E0E000E3E3
          E300E1E5E600E4E4E400E5E5E500E6E6E600E7E7E700E2E8EF00E9E9E900EAEA
          EA00E0E2F400EFECFF00ECF6FF00F1F1F100F6F6F600F4FFF000F3F4FF00F8F7
          FF00F2F8FF00F2FBFF00F3FFFC00F4FFFE00F4FEFF00F6FFFF00F8F8F800F9F9
          F900FAFAFA00FCFCFC00FEFEFE00FFFFFF0000000000000000003F3F3F3F3F3F
          3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3FB26F58575455
          4E6BBC3F3F3F3F3F3F3FAF6952646567516DBD3F3F3F3F3F3F3F39373231333D
          343660B93F3F3F3F3F3F42401A181C1C1C1D50BB3F3F3F3F3F3F2CA4958F908E
          9A7B2F61BD3F3F3F3F3F17AD7776777279501B68BD3F3F3F3F3F38A2A39B9899
          9C5A803063C53F3F3F3F41A9ADA7ABAAA8486C1568B83F3F3F3F882BD3C3D1D0
          C994598D2A62C43F3F3F7314BEB5B6B6B37449A61169B73F3F3F3F2E89D8EAD4
          E7D55D838B286AC63F3F3F1679BFE5BDE9BE496D78096CC03F3F3F8A0FF7F2EF
          F5F4875E81962756DC3F3FA604FDFAFBFDFC744A6E77086DE33F3F3F2DD28C97
          9192933E7C828735AE3F3F3F18BA787973737545526E7414B03F3F3F3F22D7A0
          9EA19D9F3B5F852647E23F3F3F05E0ACABA9AAAB444F70114BE43F3F3F3F0EDE
          CFCAC8CCCB3A7E8424B13F3F3F3F03E8B6B4AFB5B643537910AB3F3F3F3F3F00
          DBC7CDC2C1CE5C7F255B3F3F3F3F3F02E4B3B6B3B3B64D66114C3F3F3F3F3F3F
          0BEBD6DDD9DAA57A3C233F3F3F3F3F3F02EDBFE6E1E3B05046073F3F3F3F3F3F
          3F0AF1F0F3F6ECDF7D0D3F3F3F3F3F3F3F03F9EEFBFCF8E652053F3F3F3F3F3F
          3F3F190C201F211E29863F3F3F3F3F3F3F3F13040601040212713F3F3F3F3F3F
          3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnClearAllClick
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 224
    Top = 16
    object File1: TUniMenuItem
      Caption = '&File'
      object PopulateDefaultURLs1: TUniMenuItem
        Caption = 'Populate Default URL'#39's'
        OnClick = PopulateDefaultURLs1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Close1: TUniMenuItem
        Caption = '&Close'
        OnClick = Close1Click
      end
    end
  end
  object SrcCarrier: TDataSource
    DataSet = QryCarrier
    Left = 256
    Top = 16
  end
  object QryCarrier: TFDQuery
    BeforeOpen = QryCarrierBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id from freight_carrier where id = :ID')
    Left = 264
    Top = 24
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryCarrierID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.FREIGHT_CARRIER.ID'
      Size = 0
    end
  end
  object SrcCarrierURL: TDataSource
    DataSet = TblCarrierURL
    OnDataChange = SrcCarrierURLDataChange
    Left = 296
    Top = 16
  end
  object TblCarrierURL: TFDTable
    AfterOpen = TblCarrierURLAfterOpen
    BeforePost = TblCarrierURLBeforePost
    OnNewRecord = TblCarrierURLNewRecord
    IndexFieldNames = 'CARRIER_ID'
    MasterSource = SrcCarrier
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'FREIGHT_CARRIER_URL'
    TableName = 'FREIGHT_CARRIER_URL'
    Left = 304
    Top = 24
    object TblCarrierURLTYPE: TBCDField
      Tag = 1
      DisplayLabel = 'URL Type'
      DisplayWidth = 15
      FieldName = 'TYPE'
      Size = 0
    end
    object TblCarrierURLURL: TStringField
      DisplayWidth = 47
      FieldName = 'URL'
      Size = 2000
    end
    object TblCarrierURLID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblCarrierURLCARRIER_ID: TBCDField
      Tag = 1
      FieldName = 'CARRIER_ID'
      Visible = False
      Size = 0
    end
  end
  object PURL: TUniPopupMenu
    Left = 348
    Top = 6
    object PopulateDefaultURLs2: TUniMenuItem
      Caption = 'Populate Default URL'#39's'
      OnClick = PopulateDefaultURLs1Click
    end
  end
end
