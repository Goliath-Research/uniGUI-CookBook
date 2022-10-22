object FrmInvTransExecBase: TFrmInvTransExecBase
  Left = 0
  Top = 0
  ClientHeight = 338
  ClientWidth = 729
  Caption = 'Inventory Transaction'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 729
    Height = 338
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 266
      Top = 1
      Width = 4
      Height = 336
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = 16250871
    end
    object pnlLeft01: TUniPanel
      Left = 1
      Top = 1
      Width = 265
      Height = 336
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Splitter2: TUniSplitter
        Left = 98
        Top = 1
        Width = 4
        Height = 334
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = 16250871
      end
      object pnlLeft02: TUniPanel
        Left = 1
        Top = 1
        Width = 97
        Height = 334
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Label1: TUniLabel
          Left = 7
          Top = 104
          Width = 25
          Height = 13
          Hint = ''
          Caption = 'Class'
          TabOrder = 1
        end
        object Label2: TUniLabel
          Left = 7
          Top = 32
          Width = 33
          Height = 13
          Hint = ''
          Caption = 'Item #'
          TabOrder = 2
        end
        object Label3: TUniLabel
          Tag = 110
          Left = 7
          Top = 128
          Width = 19
          Height = 13
          Hint = ''
          Caption = 'Rev'
          TabOrder = 3
        end
        object Label4: TUniLabel
          Left = 7
          Top = 56
          Width = 53
          Height = 13
          Hint = ''
          Caption = 'Description'
          TabOrder = 4
        end
        object lblUnit: TUniLabel
          Left = 7
          Top = 152
          Width = 23
          Height = 13
          Hint = ''
          Caption = 'UOM'
          TabOrder = 5
        end
        object lblExtDesc: TUniLabel
          Left = 7
          Top = 80
          Width = 72
          Height = 13
          Hint = ''
          Caption = 'Ext Description'
          TabOrder = 6
        end
        object lblReason: TUniLabel
          Left = 7
          Top = 296
          Width = 36
          Height = 13
          Hint = ''
          Caption = 'Reason'
          TabOrder = 7
        end
        object Label6: TUniLabel
          Left = 7
          Top = 224
          Width = 55
          Height = 13
          Hint = ''
          Caption = 'Trans Code'
          TabOrder = 8
        end
        object lblTranDate: TUniLabel
          Left = 7
          Top = 272
          Width = 53
          Height = 13
          Hint = ''
          Caption = 'Trans Date'
          TabOrder = 9
        end
        object lblTranDescrip: TUniLabel
          Left = 7
          Top = 248
          Width = 83
          Height = 13
          Hint = ''
          Caption = 'Trans Description'
          TabOrder = 10
        end
        object Label8: TUniLabel
          Left = 8
          Top = 8
          Width = 67
          Height = 13
          Hint = ''
          Caption = 'Transaction #'
          TabOrder = 11
        end
        object Label9: TUniLabel
          Left = 7
          Top = 200
          Width = 40
          Height = 13
          Hint = ''
          Caption = 'Location'
          TabOrder = 12
        end
        object Label10: TUniLabel
          Left = 7
          Top = 176
          Width = 60
          Height = 13
          Hint = ''
          Caption = 'Pk Unit Type'
          TabOrder = 13
        end
      end
      object pnlLeftClient02: TUniPanel
        Left = 102
        Top = 1
        Width = 162
        Height = 334
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        ExplicitLeft = 101
        ExplicitTop = 0
        ExplicitWidth = 164
        ExplicitHeight = 338
        DesignSize = (
          162
          334)
        object dbeItemNo: TUniDBEdit
          Left = 1
          Top = 29
          Width = 160
          Height = 21
          Hint = ''
          Enabled = False
          DataField = 'ITEMNO'
          DataSource = SrcTransAlert
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object dbeDescription: TUniDBEdit
          Left = 1
          Top = 53
          Width = 160
          Height = 21
          Hint = ''
          Enabled = False
          DataField = 'DESCRIP'
          DataSource = SrcTransAlert
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object dbeExtDescription: TUniDBEdit
          Left = 1
          Top = 77
          Width = 160
          Height = 21
          Hint = ''
          Enabled = False
          DataField = 'DESCRIP2'
          DataSource = SrcTransAlert
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
        object dbeClass: TUniDBEdit
          Left = 1
          Top = 101
          Width = 160
          Height = 21
          Hint = ''
          Enabled = False
          DataField = 'CLASS'
          DataSource = SrcTransAlert
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
        end
        object dbeRev: TUniDBEdit
          Left = 1
          Top = 125
          Width = 160
          Height = 21
          Hint = ''
          Enabled = False
          DataField = 'REV'
          DataSource = SrcTransAlert
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
        end
        object dbeUnit: TUniDBEdit
          Left = 1
          Top = 149
          Width = 160
          Height = 21
          Hint = ''
          Enabled = False
          DataField = 'UNIT'
          DataSource = SrcTransAlert
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
        end
        object wwComboTransCode: TUniDBLookupComboBox
          Left = 1
          Top = 221
          Width = 160
          Height = 21
          Hint = ''
          ListFieldIndex = 0
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 6
          Color = clWindow
          OnChange = wwComboTransCodeChange
        end
        object wwTmPkTranDate: TUniDBDateTimePicker
          Tag = 1
          Left = 1
          Top = 269
          Width = 160
          Height = 21
          Hint = ''
          DateTime = 42688.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 7
        end
        object edReason: TUniEdit
          Left = 1
          Top = 293
          Width = 160
          Height = 21
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 8
        end
        object edTranDescrip: TUniEdit
          Left = 1
          Top = 245
          Width = 160
          Height = 21
          Hint = ''
          Enabled = False
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 9
        end
        object dbeTransAlertID: TUniDBEdit
          Left = 1
          Top = 5
          Width = 160
          Height = 21
          Hint = ''
          Enabled = False
          DataField = 'ID'
          DataSource = SrcTransAlert
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 10
        end
        object dbeLocDesc: TUniDBEdit
          Left = 1
          Top = 197
          Width = 160
          Height = 21
          Hint = ''
          Enabled = False
          DataField = 'LOC_DESC'
          DataSource = SrcTransAlert
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 11
        end
        object dbePkUnitType: TUniDBEdit
          Left = 1
          Top = 173
          Width = 160
          Height = 21
          Hint = ''
          Enabled = False
          DataField = 'PK_UNIT_TYPE_DISP'
          DataSource = SrcTransAlert
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 12
        end
      end
    end
    object pnlClient01: TUniPanel
      Left = 270
      Top = 1
      Width = 458
      Height = 336
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object pnlBottom01: TUniPanel
        Left = 1
        Top = 294
        Width = 456
        Height = 41
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object pnlBottomRight01: TUniPanel
          Left = 229
          Top = 1
          Width = 226
          Height = 39
          Hint = ''
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object btnOK: TUniButton
            Left = 4
            Top = 8
            Width = 97
            Height = 25
            Hint = 'Execute Transaction'
            Caption = '&OK'
            TabOrder = 1
            OnClick = btnOKClick
          end
          object btnCancel: TUniButton
            Left = 116
            Top = 8
            Width = 97
            Height = 25
            Hint = 'Cancel Transaction'
            Caption = '&Cancel'
            ModalResult = 2
            TabOrder = 2
          end
        end
      end
      object pnlCClient02: TUniPanel
        Left = 1
        Top = 1
        Width = 456
        Height = 293
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object pnlTop01: TUniPanel
          Left = 1
          Top = 1
          Width = 454
          Height = 28
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object sbtnTransPlan: TUniSpeedButton
            Left = 1
            Top = 1
            Width = 25
            Height = 25
            Hint = 'Trans Location Plan ...'
            ShowHint = True
            ParentShowHint = False
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              1800000000000006000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2098C0
              1070901068801068800060800060700058700058700050600050600048600048
              60004050004050004050FF00FF9D9D9D7474746A6A6A6A6A6A6565656161615B
              5B5B5B5B5B5151515151514B4B4B4B4B4B424242424242424242FF00FF20A0C0
              80D0FF80D0FF80D0FF70D0FF70C8FF60C0FF60C0FF50B8FF50B0FF40A8FF30A0
              F030A0F03098F0004050FF00FFA3A3A3D8D8D8D8D8D8D8D8D8D7D7D7D1D1D1CB
              CBCBCBCBCBC6C6C6C1C1C1BBBBBBB1B1B1B1B1B1ACACAC424242FF00FF20A0D0
              80D0FF2090B080D0FF2090B070D0FF2088B060C0FF1080A050B8FF1078A040A8
              FF10709030A0F0005060FF00FFA7A7A7D8D8D8939393D8D8D8939393D7D7D78E
              8E8ECBCBCB848484C6C6C67E7E7EBBBBBB747474B1B1B1515151FF00FF20A0D0
              20A0D02090B020A0D02090B020A0C02088B02098C01080A01088B01078A01080
              A0107090107890007090FF00FFA7A7A7A7A7A7939393A7A7A7939393A3A3A38E
              8E8E9D9D9D8484848E8E8E7E7E7E8484847474747A7A7A747474D07040D07040
              D07040D06840C06030B05830A05020A04820904010904010903810FF00FFFF00
              FFFF00FFFF00FFFF00FF7373737373737373736E6E6E6464645C5C5C5353534D
              4D4D4444444444443F3F3FFF00FFFF00FFFF00FFFF00FFFF00FFD07040FFA080
              F08050F07840E07040E07030707070505850000000C07050D9E3E2FF00FFFF00
              FFFF00FFFF00FFFF00FF737373A4A4A48585857E7E7E76767674747470707055
              5555000000737373E3E3E3FF00FFFF00FFFF00FFFF00FFFF00FFD07040FFB090
              903810904020B05020C06030A0A0A0FFFFFF5090B0101010B8CFD4FF00FFFF00
              FFFF00FFFF00FFFF00FF737373B1B1B13F3F3F454545555555646464A0A0A0FF
              FFFF949494101010CFCFCFFF00FFFF00FFFF00FFFF00FFFF00FFD07850FFB890
              A04820D8E9ECD07040F08050A0A0A090B8C070D0E05098B0101010B8CFD4FF00
              FFFF00FFFF00FFFF00FF7A7A7AB8B8B84D4D4DE9E9E9737373858585A0A0A0B7
              B7B7CFCFCF9A9A9A101010CFCFCFFF00FFFF00FFFF00FFFF00FFE07850FFC0A0
              C06030D07050FF8850FF9860C0806050A0B090E0F060C0D05098B0101010ADC6
              CCFF00FFFF00FFFF00FF7D7D7DC0C0C06464647575758D8D8D9A9A9A818181A0
              A0A0E0E0E0BFBFBF9A9A9A101010C6C6C6FF00FFFF00FFFF00FFE08060FFC8A0
              D07040FFA870FFA070D07850DBDDD8C1D6DC50A0B090E0F060C0D05098B01010
              10ADC6CCFF00FFFF00FF858585C6C6C6737373A7A7A7A1A1A17A7A7ADCDCDCD6
              D6D6A0A0A0E0E0E0BFBFBF9A9A9A101010C6C6C6FF00FFFF00FFE08860FFC8A0
              FFB890FFB080D07850DBDDD8FF00FFFF00FFC1D6DC60A8B090E0F060C0D05098
              B0101010B8CDD1FF00FF8A8A8AC6C6C6B8B8B8AFAFAF7A7A7ADCDCDCFF00FFFF
              00FFD6D6D6A6A6A6E0E0E0BFBFBF9A9A9A101010CDCDCDFF00FFE09070FFC8A0
              FFB890E08850DBDDD8FF00FFFF00FFFF00FFFF00FFC1D6DC70B0C090E0F070C8
              E0808880303890A3B1CA929292C6C6C6B8B8B8888888DCDCDCFF00FFFF00FFFF
              00FFFF00FFD6D6D6B1B1B1E0E0E0C9C9C9868686545454B6B6B6E09870FFC0A0
              E09070DBDDD8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1D6DC80B0C0D0B8
              B07088D06070B0303890989898C0C0C0929292DCDCDCFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFD6D6D6B1B1B1B8B8B89A9A9A808080545454E09880E0A080
              DBDDD8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1D6DC6070
              B07090E06078D06070B09A9A9AA0A0A0DCDCDCFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFD6D6D6808080A4A4A48F8F8F808080E0A080FF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB7C8
              DE6070B06070B0C1D3E3A0A0A0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFCCCCCC808080808080D6D6D6}
            Caption = ''
            ParentColor = False
            Color = clWindow
            OnClick = sbtnTransPlanClick
          end
        end
      end
    end
  end
  object wwQryTransCode: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, code, descrip, eplant_id'
      '  from trans_code'
      ' where misc.eplant_filter_include_nulls( eplant_id ) = 1'
      ' order by code')
    Left = 345
    Top = 108
    object wwQryTransCodeCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'CODE'
      Origin = 'TRANS_CODE.CODE'
      Size = 10
    end
    object wwQryTransCodeDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'TRANS_CODE.DESCRIP'
      Size = 25
    end
    object wwQryTransCodeEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object wwQryTransCodeID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'TRANS_CODE.ID'
      Visible = False
      Size = 0
    end
  end
  object SrcTransAlert: TDataSource
    DataSet = QryTransAlert
    Left = 312
    Top = 80
  end
  object QryTransAlert: TFDQuery
    BeforeOpen = QryTransAlertBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select t.id,'
      '       t.trans_priority,'
      '       t.workorder_id,'
      '       t.sndop_dispatch_id,'
      '       t.locations_id,'
      '       t.inv_zone_id,'
      '       t.arinvt_id,'
      '       t.qty,'
      '       t.start_time,'
      '       t.trans_in_out,'
      '       t.alert_descrip,'
      '       z.code as zone_code,'
      '       z.descrip as zone_descrip,'
      '       a.itemno,'
      '       a.descrip, '
      '       a.descrip2,'
      '       a.rev,'
      '       a.class,'
      '       a.unit,'
      '       t.source_module,'
      '       l.loc_desc,'
      '       t.source_id,'
      '       case nvl(a.pk_unit_type, '#39'C'#39')'
      '            when '#39'E'#39' then '#39'Each'#39
      '            when '#39'C'#39' then '#39'Case'#39
      '            when '#39'P'#39' then '#39'Pallet'#39
      '       end as pk_unit_type_disp,'
      '       '
      
        '       nvl((select standard_id from workorder where id = t.worko' +
        'rder_id), a.standard_id) as standard_id'
      '       '
      '  from '
      '       trans_alert t,'
      '       inv_zone z,'
      '       arinvt a,'
      '       locations l'
      ' where'
      '       t.id = :trans_alert_id '
      '   and t.inv_zone_id = z.id(+)'
      '   and t.arinvt_id = a.id(+)     '
      '   and t.locations_id = l.id(+)'
      ''
      '')
    Left = 312
    Top = 108
    ParamData = <
      item
        Name = 'trans_alert_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryTransAlertTRANS_PRIORITY: TBCDField
      DisplayLabel = 'Priority'
      FieldName = 'TRANS_PRIORITY'
      Size = 0
    end
    object QryTransAlertID: TBCDField
      DisplayLabel = 'Transaction ID'
      DisplayWidth = 11
      FieldName = 'ID'
      ReadOnly = True
      Size = 0
    end
    object QryTransAlertQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 10
      FieldName = 'QTY'
      ReadOnly = True
      Size = 6
    end
    object QryTransAlertSTART_TIME: TDateTimeField
      DisplayLabel = 'Start Date/Time'
      DisplayWidth = 18
      FieldName = 'START_TIME'
      ReadOnly = True
    end
    object QryTransAlertTRANS_IN_OUT: TStringField
      DisplayLabel = 'Trans In/Out'
      DisplayWidth = 10
      FieldName = 'TRANS_IN_OUT'
      ReadOnly = True
      Size = 3
    end
    object QryTransAlertALERT_DESCRIP: TStringField
      DisplayLabel = 'Trans Description'
      DisplayWidth = 44
      FieldName = 'ALERT_DESCRIP'
      ReadOnly = True
      Size = 255
    end
    object QryTransAlertZONE_CODE: TStringField
      DisplayLabel = 'Work Zone'
      DisplayWidth = 25
      FieldName = 'ZONE_CODE'
      ReadOnly = True
      Size = 25
    end
    object QryTransAlertZONE_DESCRIP: TStringField
      DisplayLabel = 'Work Zone Description'
      DisplayWidth = 100
      FieldName = 'ZONE_DESCRIP'
      ReadOnly = True
      Size = 100
    end
    object QryTransAlertITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      ReadOnly = True
      FixedChar = True
      Size = 50
    end
    object QryTransAlertDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      ReadOnly = True
      Size = 100
    end
    object QryTransAlertDESCRIP2: TStringField
      DisplayLabel = 'Item Ext Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      ReadOnly = True
      Size = 100
    end
    object QryTransAlertREV: TStringField
      DisplayLabel = 'Item Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      ReadOnly = True
      FixedChar = True
      Size = 15
    end
    object QryTransAlertCLASS: TStringField
      DisplayLabel = 'Item Class'
      DisplayWidth = 8
      FieldName = 'CLASS'
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object QryTransAlertWORKORDER_ID: TBCDField
      FieldName = 'WORKORDER_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryTransAlertSNDOP_DISPATCH_ID: TBCDField
      FieldName = 'SNDOP_DISPATCH_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryTransAlertLOCATIONS_ID: TBCDField
      FieldName = 'LOCATIONS_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryTransAlertINV_ZONE_ID: TBCDField
      FieldName = 'INV_ZONE_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryTransAlertARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryTransAlertSOURCE_MODULE: TStringField
      DisplayLabel = 'Source Module'
      FieldName = 'SOURCE_MODULE'
      ReadOnly = True
    end
    object QryTransAlertLOC_DESC: TStringField
      DisplayLabel = 'Start Location'
      FieldName = 'LOC_DESC'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object QryTransAlertSOURCE_ID: TBCDField
      FieldName = 'SOURCE_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryTransAlertUNIT: TStringField
      FieldName = 'UNIT'
      Size = 10
    end
    object QryTransAlertPK_UNIT_TYPE_DISP: TStringField
      DisplayLabel = 'Unit Type'
      FieldName = 'PK_UNIT_TYPE_DISP'
      Size = 6
    end
    object QryTransAlertSTANDARD_ID: TFMTBCDField
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 38
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 104
    Top = 260
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmInvTransExecBase'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196879 $'
    BuildVersion = '176554'
    Left = 136
    Top = 260
  end
end
