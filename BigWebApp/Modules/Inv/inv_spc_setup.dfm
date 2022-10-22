object FrmReceivingSPCSetup: TFrmReceivingSPCSetup
  Left = 0
  Top = 0
  ClientHeight = 106
  ClientWidth = 505
  Caption = 'Receiving SPC Information Setup'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 65
    Width = 505
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 399
      Top = 1
      Width = 105
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 0
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Close'
        ModalResult = 1
        TabOrder = 1
        Default = True
      end
    end
  end
  object PnlClient01: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 505
    Height = 65
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 186
      Top = 1
      Width = 6
      Height = 63
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 185
      Height = 63
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object lblLocation: TUniLabel
        Left = 8
        Top = 11
        Width = 161
        Height = 13
        Hint = ''
        Caption = 'Receive to Non-Conform Location'
        TabOrder = 1
      end
      object lblInspection: TUniLabel
        Left = 8
        Top = 35
        Width = 93
        Height = 13
        Hint = ''
        Caption = 'Use SPC Inspection'
        TabOrder = 2
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 192
      Top = 1
      Width = 312
      Height = 63
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object PnlSelectBtns: TUniPanel
        Tag = 1999
        Left = 281
        Top = 1
        Width = 30
        Height = 61
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object sbtnClearLocation: TUniSpeedButton
          Left = 1
          Top = 8
          Width = 23
          Height = 22
          Hint = 'Clear'
          ShowHint = True
          ParentShowHint = False
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
          OnClick = DoClearLocation
        end
        object sbtnClearInspection: TUniSpeedButton
          Left = 1
          Top = 32
          Width = 23
          Height = 22
          Hint = 'Clear'
          ShowHint = True
          ParentShowHint = False
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
          OnClick = DoClearInspection
        end
      end
      object PnlEditControls: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 280
        Height = 61
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          280
          61)
        object cmbLocation: TUniEdit
          Left = 0
          Top = 8
          Width = 278
          Height = 21
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ReadOnly = True
        end
        object cmbSPCInspection: TUniEdit
          Left = 0
          Top = 32
          Width = 278
          Height = 21
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ReadOnly = True
        end
      end
    end
  end
  object PkLocation: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select l.id as id,'
      '       l.loc_desc as location,'
      '       l.descrip as description,'
      '       l.eplant_id,'
      '       d.name as division'
      '  from locations l,'
      '       division d'
      ' where '
      '       l.division_id = d.id(+)'
      '   and misc.eplant_filter(l.eplant_id) = 1'
      '   and nvl(l.non_conform, '#39'N'#39') = '#39'Y'#39
      '')
    OnIQModify = PkLocationIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 32
    Top = 48
    object PkLocationID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkLocationLOCATION: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 25
      FieldName = 'LOCATION'
      FixedChar = True
      Size = 30
    end
    object PkLocationDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIPTION'
      Size = 50
    end
    object PkLocationEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant _ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkLocationDIVISION: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 20
      FieldName = 'DIVISION'
      Size = 25
    end
  end
  object PkSPCInspection: TIQWebHpick
    BeforeOpen = AssignArinvtIDParam
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      
        'SELECT v.id, v.arinvt_id, v.inspection_name, v.inspection_descri' +
        'p,'
      
        '       v.inspection_created, v.inspection_createdby, v.control_p' +
        'lan_name,'
      
        '       v.control_plan_descrip, v.control_plan_type_name, v.eplan' +
        't_id,'
      '       v.sample_type, v.sample_type_str, v.sample_count,'
      
        '       v.variable_sample_count, v.confidence_level, v.confidence' +
        '_interval'
      '-- HPICK_FROM_START       '
      '  FROM v_spc_inspection v,'
      '      (SELECT DISTINCT a.spc_inspection_id'
      '         FROM spc_inspection_detail a, spc_dimension b'
      '        WHERE a.spc_dimension_id = b.id) b'
      '-- HPICK_WHERE_START        '
      ' WHERE v.source = '#39'ARINVT'#39' AND'
      '       v.source_id = :ARINVT_ID AND'
      '       v.sample_count > 0 AND'
      '       b.spc_inspection_id = v.id AND'
      '       NVL(v.is_rt, '#39'N'#39') <> '#39'Y'#39' AND'
      '       NVL(v.pk_hide, '#39'N'#39') <> '#39'Y'#39
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 88
    Top = 48
    ParamData = <
      item
        Name = 'ARINVT_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkSPCInspectionINSPECTION_NAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 15
      FieldName = 'INSPECTION_NAME'
      Origin = 'V.INSPECTION_NAME'
      Size = 35
    end
    object PkSPCInspectionINSPECTION_DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'INSPECTION_DESCRIP'
      Origin = 'V.INSPECTION_DESCRIP'
      Size = 250
    end
    object PkSPCInspectionINSPECTION_CREATED: TDateTimeField
      DisplayLabel = 'Created'
      DisplayWidth = 18
      FieldName = 'INSPECTION_CREATED'
      Origin = 'V.INSPECTION_CREATED'
    end
    object PkSPCInspectionINSPECTION_CREATEDBY: TStringField
      DisplayLabel = 'Created By'
      DisplayWidth = 15
      FieldName = 'INSPECTION_CREATEDBY'
      Origin = 'V.INSPECTION_CREATEDBY'
      Size = 35
    end
    object PkSPCInspectionCONTROL_PLAN_NAME: TStringField
      DisplayLabel = 'Control Plan Name'
      DisplayWidth = 15
      FieldName = 'CONTROL_PLAN_NAME'
      Origin = 'V.CONTROL_PLAN_NAME'
      Size = 35
    end
    object PkSPCInspectionCONTROL_PLAN_DESCRIP: TStringField
      DisplayLabel = 'Control Plan Description'
      DisplayWidth = 25
      FieldName = 'CONTROL_PLAN_DESCRIP'
      Origin = 'V.CONTROL_PLAN_DESCRIP'
      Size = 255
    end
    object PkSPCInspectionCONTROL_PLAN_TYPE_NAME: TStringField
      DisplayLabel = 'Control Plan Type'
      DisplayWidth = 15
      FieldName = 'CONTROL_PLAN_TYPE_NAME'
      Origin = 'V.CONTROL_PLAN_TYPE_NAME'
      Size = 25
    end
    object PkSPCInspectionSAMPLE_TYPE_STR: TStringField
      DisplayLabel = 'Sample Type'
      DisplayWidth = 30
      FieldName = 'SAMPLE_TYPE_STR'
      Origin = 'V.SAMPLE_TYPE_STR'
      Size = 30
    end
    object PkSPCInspectionSAMPLE_COUNT: TFloatField
      DisplayLabel = 'Sample Count'
      DisplayWidth = 10
      FieldName = 'SAMPLE_COUNT'
      Origin = 'V.SAMPLE_COUNT'
    end
    object PkSPCInspectionVARIABLE_SAMPLE_COUNT: TStringField
      DisplayLabel = 'Variable Sample Count?'
      DisplayWidth = 1
      FieldName = 'VARIABLE_SAMPLE_COUNT'
      Origin = 'V.VARIABLE_SAMPLE_COUNT'
      Size = 1
    end
    object PkSPCInspectionID: TFloatField
      FieldName = 'ID'
      Origin = 'V.ID'
      Visible = False
    end
    object PkSPCInspectionARINVT_ID: TFloatField
      FieldName = 'ARINVT_ID'
      Origin = 'V.ARINVT_ID'
      Visible = False
    end
    object PkSPCInspectionEPLANT_ID: TFloatField
      FieldName = 'EPLANT_ID'
      Origin = 'V.EPLANT_ID'
      Visible = False
    end
    object PkSPCInspectionSAMPLE_TYPE: TFloatField
      FieldName = 'SAMPLE_TYPE'
      Origin = 'V.SAMPLE_TYPE'
      Visible = False
    end
    object PkSPCInspectionCONFIDENCE_LEVEL: TFloatField
      FieldName = 'CONFIDENCE_LEVEL'
      Visible = False
    end
    object PkSPCInspectionCONFIDENCE_INTERVAL: TFloatField
      FieldName = 'CONFIDENCE_INTERVAL'
      Visible = False
    end
  end
  object SrcArinvt: TDataSource
    DataSet = QryArinvt
    Left = 152
    Top = 48
  end
  object QryArinvt: TFDQuery
    BeforeOpen = AssignArinvtIDParam
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'SELECT a.recv_location_id AS recv_location_id, b.loc_desc AS loc' +
        '_desc,'
      
        '       a.spc_inspection_id AS spc_inspection_id, c.name AS inspe' +
        'ction_name'
      '  FROM arinvt a, locations b, spc_inspection c'
      ' WHERE a.id = :ARINVT_ID AND'
      '       b.id(+) = a.recv_location_id AND'
      '       c.id(+) = a.spc_inspection_id')
    Left = 160
    Top = 56
    ParamData = <
      item
        Name = 'ARINVT_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryArinvtRECV_LOCATION_ID: TBCDField
      FieldName = 'RECV_LOCATION_ID'
      Origin = 'a.recv_location_id'
      Size = 0
    end
    object QryArinvtLOC_DESC: TStringField
      FieldName = 'LOC_DESC'
      Origin = 'b.loc_desc'
      Size = 30
    end
    object QryArinvtSPC_INSPECTION_ID: TBCDField
      FieldName = 'SPC_INSPECTION_ID'
      Origin = 'a.spc_inspection_id'
      Size = 0
    end
    object QryArinvtINSPECTION_NAME: TStringField
      FieldName = 'INSPECTION_NAME'
      Origin = 'c.name'
      Size = 35
    end
  end
  object PLocation: TUniPopupMenu
    Left = 320
    Top = 8
    object SelectLocation1: TUniMenuItem
      Caption = 'Select'
      Default = True
      OnClick = DoSelectLocation
    end
    object ClearLocation1: TUniMenuItem
      Caption = 'Clear'
      OnClick = DoClearLocation
    end
  end
  object PInspection: TUniPopupMenu
    Left = 352
    Top = 8
    object SelectInspection1: TUniMenuItem
      Caption = 'Select'
      Default = True
      OnClick = DoSelectInspection
    end
    object ClearInspection1: TUniMenuItem
      Caption = 'Clear'
      OnClick = DoClearInspection
    end
  end
end
