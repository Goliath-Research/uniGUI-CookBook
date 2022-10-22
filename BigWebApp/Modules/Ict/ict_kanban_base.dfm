object FrmKanban_Base: TFrmKanban_Base
  Left = 234
  Top = 223
  HelpContext = 14778
  ClientHeight = 239
  ClientWidth = 584
  Caption = 'Setup eKanban Trigger'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 295
    Top = 0
    Width = 4
    Height = 239
    Hint = ''
    Align = alRight
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 299
    Top = 0
    Width = 285
    Height = 239
    Hint = ''
    Align = alRight
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 1
      Top = 1
      Width = 283
      Height = 25
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      DesignSize = (
        283
        25)
      object sbtnCreateOrder: TUniSpeedButton
        Left = 151
        Top = 1
        Width = 25
        Height = 23
        Hint = 'Create Order'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E00000000000000000000FF00FFB2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2E5EBF0B2CDDFCBD8E12992C22992C22992
          C22992C22992C2ACC5D4FF00FF8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8AC4
          C4C4A8A8A8B2B2B27272727272727272727272727272729F9F9FA5A098B47E45
          B37B43B37C44B37D44B37C44C1D3E172D1EEC0F1F42992C212B7EC15B4F31599
          DF0B95D5219CDA258FC8777777525252505050505050515151505050ADADADAB
          ABABC7C7C77272729696969797977F7F7F7979797F7F7F727272A5A096DCA66C
          DFA76BDFA96EDFAA6FBBD3E22992C24B889B6B898D3F819D0E7CCA0764BB2992
          C208CBFA03CDFC12D4EB7676767979797A7A7A7C7C7C7D7D7DADADAD72727261
          61616060605D5D5D666666525252727272A8A8A8AAAAAAABABABA5A096E3B580
          E8BA85E8BD89DDB7842992C26DD2EE56B7E673C0EE2992C26CCBED2992C203DB
          F401D0FB2992C2BBD5E37676768888888D8D8D9090908A8A8A727272ACACAC96
          96969F9F9F727272A7A7A7727272B2B2B2ACACAC727272AFAFAFA5A096E7C190
          C4A061D0AE75E4D0AE2992C27CD8F375C3F092DCF72992C272CBF1C2F5FC2992
          C22992C2BFD1DFFF00FF7676769494947171717F7F7FA3A3A3727272B2B2B2A2
          A2A2B6B6B6727272A8A8A8CCCCCC727272727272ABABABFF00FFA5A096F0D1A6
          F8DEB7F8E2BDEED6AD2992C25389966C8F9750A3C22992C297F2FFC9F9FEA6F1
          FE60D5F7BCD1E0FF00FF767676A4A4A4B1B1B1B5B5B5A8A8A872727261616167
          67677F7F7F727272C8C8C8D0D0D0C8C8C8B0B0B0ABABABFF00FFA5A096F2D8B0
          CAAB71D8C08EE4D3B22992C292DFECC9F7FA82E3F92C92C45E95A366878E80B9
          C450B3D3BCD2E0FF00FF767676ABABAB7C7C7C919191A6A6A6727272B6B6B6CD
          CDCDBBBBBB7272726D6D6D5F5F5F9090908E8E8EACACACFF00FFA5A096F6E0BD
          FDF0D2FEF4DAEADCBB2992C22992C22992C282E3F92992C24E76826D8E947EBA
          CA357C95BCD4E3FF00FF767676B4B4B4C4C4C4C8C8C8AFAFAF72727272727272
          7272BBBBBB7272724E4E4E666666939393575757AEAEAEFF00FFA5A096F6E3C3
          FFF6DEFFFAE4EEE3C52992C297DCF499E0F62992C22992C295ECFDCFFFFFAAF3
          FE67DDFABCD1E0FF00FF767676B7B7B7CACACACECECEB6B6B6727272B6B6B6B9
          B9B9727272727272C4C4C4D5D5D5C9C9C9B6B6B6ABABABFF00FFA5A096F2E1C1
          C5A971D5C195EAE0C8FEFEFD2992C22992C2D4DCE42992C22992C22992C22992
          C24FC1EFC0D3E0FF00FF767676B4B4B47A7A7A929292B4B4B4D6D6D672727272
          7272B6B6B67272727272727272727272729F9F9FADADADFF00FFA5A096F6E6CC
          FFF9E8FFFDEFF3EDD8ECE3C9ECE3C9ECE3C9E1E3E42992C2A3E7F59AE1F4A1E6
          F62992C2BCD1E3FF00FF767676BABABACFCFCFD3D3D3C2C2C2B7B7B7B7B7B7B7
          B7B7BBBBBB727272BEBEBEB9B9B9BEBEBE727272ACACACFF00FFA5A096F3E4CA
          D8C59CD8C7A1D8C7A1D8C7A1D8C7A1D8C7A1D8C7A1B0C7D92992C22992C22992
          C29FBEDAFF00FFFF00FF767676B8B8B897979799999999999999999999999999
          9999999999A2A2A27272727272727272729B9B9BFF00FFFF00FFA5A096F5E5CF
          ECE0C8ECE3CEECE3CFECE3CFECE3CFECE3CFE2D0ACE4D1AEF9ECD8C7A674FF00
          FFFF00FFFF00FFFF00FF767676BABABAB5B5B5B8B8B8B8B8B8B8B8B8B8B8B8B8
          B8B8A3A3A3A4A4A4C1C1C1787878FF00FFFF00FFFF00FFFF00FFA5A096F6E4CF
          FFF5EBFFF9F1FFF9F2FFF9F2FFF9F2FFF9F2EED2A7F6D1A0CCA765C5BFB3FF00
          FFFF00FFFF00FFFF00FF767676B9B9B9CCCCCCD0D0D0D0D0D0D0D0D0D0D0D0D0
          D0D0A4A4A4A3A3A3787878959595FF00FFFF00FFFF00FFFF00FFA8A49BF5E2CD
          FCEDDFFCF0E3FCF0E4FCF0E4FCF0E4FCEFE3EACEA2D8B986C7C2B8FF00FFFF00
          FFFF00FFFF00FFFF00FF7A7A7AB8B8B8C4C4C4C7C7C7C7C7C7C7C7C7C7C7C7C6
          C6C6A0A0A08B8B8B999999FF00FFFF00FFFF00FFFF00FFFF00FFC7C7C5AC8A48
          AB8947AB8947AB8947AB8947AB8947AB8947AB8947BDAC8DFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF9F9F9F5A5A5A59595959595959595959595959595959
          59595959597F7F7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        Anchors = [akTop, akRight]
        ParentColor = False
        Color = clWindow
        OnClick = sbtnCreateOrderClick
      end
      object NavChild: TUniDBNavigator
        Left = 174
        Top = 1
        Width = 109
        Height = 23
        Hint = ''
        DataSource = SrcChild
        VisibleButtons = [nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object wwDataInspector1: TwwDataInspector
      Left = 0
      Top = 25
      Width = 285
      Height = 214
      DisableThemes = False
      Align = alClient
      PopupMenu = popmDataIns
      TabOrder = 2
      DataSource = SrcChild
      Items = <
        item
          DataSource = SrcChild
          Caption = 'Pull Trigger Qty'
          CustomControl = wwDBEditQty
          WordWrap = False
        end
        item
          DataSource = SrcChild
          Caption = 'Replenishment Scope Days'
          CustomControl = wwDBEditScope
          WordWrap = False
        end
        item
          DataSource = SrcChild
          Caption = 'Replenishment Source'
          CustomControl = wwDBComboDlgReplenishmentSource
          Items = <
            item
              DataSource = SrcChild
              Caption = 'Address'
              ReadOnly = True
              Items = <
                item
                  DataSource = SrcChild
                  Caption = 'Address 2'
                  ReadOnly = True
                  WordWrap = False
                end
                item
                  DataSource = SrcChild
                  Caption = 'Address 3'
                  ReadOnly = True
                  WordWrap = False
                end
                item
                  DataSource = SrcChild
                  Caption = 'City'
                  ReadOnly = True
                  WordWrap = False
                end
                item
                  DataSource = SrcChild
                  Caption = 'State or Region'
                  ReadOnly = True
                  WordWrap = False
                end
                item
                  DataSource = SrcChild
                  Caption = 'Zip'
                  ReadOnly = True
                  WordWrap = False
                end
                item
                  DataSource = SrcChild
                  Caption = 'Country'
                  ReadOnly = True
                  WordWrap = False
                end>
              WordWrap = False
            end
            item
              DataSource = SrcChild
              Caption = 'EPlant'
              ReadOnly = True
              WordWrap = False
            end
            item
              DataSource = SrcChild
              Caption = 'Division'
              ReadOnly = True
              WordWrap = False
            end
            item
              DataSource = SrcChild
              Caption = 'Default Master Distribution'
              ReadOnly = True
              PickList.Items.Strings = (
                'Y'
                'N')
              PickList.DisplayAsCheckbox = True
              WordWrap = False
            end>
          TagString = 'ReplenishmentSource'
          WordWrap = False
        end
        item
          DataSource = SrcChild
          Caption = 'Transit Lead Time'
          CustomControl = wwDBEditLeadDays
          WordWrap = False
        end
        item
          DataSource = SrcChild
          Caption = 'Ship Order'
          WordWrap = False
        end>
      CaptionWidth = 151
      Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      LineStyleCaption = ovDottedLine
      LineStyleData = ovDottedLine
      ExplicitLeft = 1
      ExplicitTop = 31
      object wwDBEditQty: TUniDBEdit
        Left = 42
        Top = 96
        Width = 128
        Height = 15
        Hint = ''
        Visible = False
        DataSource = SrcChild
        TabOrder = 0
        TabStop = False
        BorderStyle = ubsNone
      end
      object wwDBEditScope: TUniDBEdit
        Left = 44
        Top = 122
        Width = 128
        Height = 15
        Hint = ''
        Visible = False
        DataSource = SrcChild
        TabOrder = 1
        TabStop = False
        BorderStyle = ubsNone
      end
      object wwDBEditLeadDays: TUniDBEdit
        Left = 44
        Top = 150
        Width = 128
        Height = 15
        Hint = ''
        Visible = False
        DataSource = SrcChild
        TabOrder = 2
        TabStop = False
        BorderStyle = ubsNone
      end
      object wwDBComboDlgReplenishmentSource: TUniEdit
        Left = 55
        Top = 135
        Width = 128
        Height = 15
        Hint = ''
        Visible = False
        BorderStyle = ubsNone
        Text = ''
        TabOrder = 3
        TabStop = False
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 295
    Height = 239
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object IQSearchArinvt: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 293
      Height = 237
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 76
      IQComponents.Grid.Height = 151
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcArinvt
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
      IQComponents.Navigator.DataSource = SrcArinvt
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 76
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 151
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcArinvt
      Columns = <
        item
          FieldName = 'ITEMNO'
          Title.Caption = 'Item #'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MULTIPLE'
          Title.Caption = 'Multiple Of'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REV'
          Title.Caption = 'Rev'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CLASS'
          Title.Caption = 'Class'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP2'
          Title.Caption = 'Ext Description'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object SrcArinvt: TDataSource
    DataSet = QryArinvt
    Left = 89
    Top = 53
  end
  object QryArinvt: TFDQuery
    BeforeOpen = QryArinvtBeforeOpen
    AfterPost = ApplyUpdateToTable
    OnNewRecord = QryArinvtNewRecord
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQLArinvt
    SQL.Strings = (
      'select a.id,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.rev,'
      '       a.class,'
      '       a.descrip2,'
      '       a.multiple,'
      
        '       nvl(a.onhand, 0) - nvl(a.non_allocate_total, 0) as onhand' +
        ','
      '       auto_mrp_reord_point,'
      '       auto_mrp_order_qty,'
      '       auto_mrp_lead_days,'
      '       auto_mrp_firm_wo,'
      '       auto_mrp_include_vmi,'
      '       auto_mrp_include_vmi_mfg_calc,'
      '       auto_mrp_apply_to_sched_alloc,'
      '       process_safety_stock,'
      '       auto_mrp_kanban_lot_size,'
      '       auto_mrp_exclude_hard_alloc'
      '       '
      '  from         '
      '       arinvt a'
      ' where '
      '       eplant_id = :eplant_id'
      '  and nvl(pk_hide,'#39'N'#39') <> '#39'Y'#39
      '    '
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 89
    Top = 69
    ParamData = <
      item
        Name = 'eplant_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryArinvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'a.itemno'
      ReadOnly = True
      FixedChar = True
      Size = 50
    end
    object QryArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 28
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      ReadOnly = True
      Size = 100
    end
    object QryArinvtMULTIPLE: TBCDField
      DisplayLabel = 'Multiple Of'
      DisplayWidth = 10
      FieldName = 'MULTIPLE'
      Origin = 'IQ.ARINVT.MULTIPLE'
    end
    object QryArinvtREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 8
      FieldName = 'REV'
      Origin = 'a.rev'
      ReadOnly = True
      FixedChar = True
      Size = 15
    end
    object QryArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      Origin = 'a.class'
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object QryArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'a.descrip2'
      ReadOnly = True
      Size = 100
    end
    object QryArinvtID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryArinvtONHAND: TFMTBCDField
      FieldName = 'ONHAND'
      Visible = False
      Size = 38
    end
    object QryArinvtAUTO_MRP_REORD_POINT: TBCDField
      FieldName = 'AUTO_MRP_REORD_POINT'
      Visible = False
      Size = 2
    end
    object QryArinvtAUTO_MRP_ORDER_QTY: TBCDField
      FieldName = 'AUTO_MRP_ORDER_QTY'
      Visible = False
      Size = 2
    end
    object QryArinvtAUTO_MRP_LEAD_DAYS: TBCDField
      FieldName = 'AUTO_MRP_LEAD_DAYS'
      Visible = False
      Size = 2
    end
    object QryArinvtAUTO_MRP_FIRM_WO: TStringField
      FieldName = 'AUTO_MRP_FIRM_WO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryArinvtAUTO_MRP_INCLUDE_VMI: TStringField
      FieldName = 'AUTO_MRP_INCLUDE_VMI'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryArinvtAUTO_MRP_INCLUDE_VMI_MFG_CALC: TStringField
      FieldName = 'AUTO_MRP_INCLUDE_VMI_MFG_CALC'
      Visible = False
      Size = 1
    end
    object QryArinvtAUTO_MRP_APPLY_TO_SCHED_ALLOC: TStringField
      FieldName = 'AUTO_MRP_APPLY_TO_SCHED_ALLOC'
      Visible = False
      Size = 1
    end
    object QryArinvtPROCESS_SAFETY_STOCK: TStringField
      FieldName = 'PROCESS_SAFETY_STOCK'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryArinvtAUTO_MRP_KANBAN_LOT_SIZE: TFMTBCDField
      FieldName = 'AUTO_MRP_KANBAN_LOT_SIZE'
      Visible = False
      Size = 6
    end
    object QryArinvtAUTO_MRP_EXCLUDE_HARD_ALLOC: TStringField
      FieldName = 'AUTO_MRP_EXCLUDE_HARD_ALLOC'
      Visible = False
      Size = 1
    end
  end
  object SrcChild: TDataSource
    DataSet = TblChild
    Left = 156
    Top = 52
  end
  object UpdateSQLArinvt: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into arinvt'
      
        '  (MULTIPLE, AUTO_MRP_REORD_POINT, AUTO_MRP_ORDER_QTY, AUTO_MRP_' +
        'LEAD_DAYS, '
      
        '   AUTO_MRP_FIRM_WO, AUTO_MRP_INCLUDE_VMI, AUTO_MRP_INCLUDE_VMI_' +
        'MFG_CALC, '
      
        '   AUTO_MRP_APPLY_TO_SCHED_ALLOC, PROCESS_SAFETY_STOCK, AUTO_MRP' +
        '_KANBAN_LOT_SIZE, '
      '   AUTO_MRP_EXCLUDE_HARD_ALLOC)'
      'values'
      
        '  (:MULTIPLE, :AUTO_MRP_REORD_POINT, :AUTO_MRP_ORDER_QTY, :AUTO_' +
        'MRP_LEAD_DAYS, '
      
        '   :AUTO_MRP_FIRM_WO, :AUTO_MRP_INCLUDE_VMI, :AUTO_MRP_INCLUDE_V' +
        'MI_MFG_CALC, '
      
        '   :AUTO_MRP_APPLY_TO_SCHED_ALLOC, :PROCESS_SAFETY_STOCK, :AUTO_' +
        'MRP_KANBAN_LOT_SIZE, '
      '   :AUTO_MRP_EXCLUDE_HARD_ALLOC)')
    ModifySQL.Strings = (
      'update arinvt'
      'set'
      '  MULTIPLE = :MULTIPLE,'
      '  AUTO_MRP_REORD_POINT = :AUTO_MRP_REORD_POINT,'
      '  AUTO_MRP_ORDER_QTY = :AUTO_MRP_ORDER_QTY,'
      '  AUTO_MRP_LEAD_DAYS = :AUTO_MRP_LEAD_DAYS,'
      '  AUTO_MRP_FIRM_WO = :AUTO_MRP_FIRM_WO,'
      '  AUTO_MRP_INCLUDE_VMI = :AUTO_MRP_INCLUDE_VMI,'
      
        '  AUTO_MRP_INCLUDE_VMI_MFG_CALC = :AUTO_MRP_INCLUDE_VMI_MFG_CALC' +
        ','
      
        '  AUTO_MRP_APPLY_TO_SCHED_ALLOC = :AUTO_MRP_APPLY_TO_SCHED_ALLOC' +
        ','
      '  PROCESS_SAFETY_STOCK = :PROCESS_SAFETY_STOCK,'
      '  AUTO_MRP_KANBAN_LOT_SIZE = :AUTO_MRP_KANBAN_LOT_SIZE,'
      '  AUTO_MRP_EXCLUDE_HARD_ALLOC = :AUTO_MRP_EXCLUDE_HARD_ALLOC'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from arinvt'
      'where'
      '  ID = :OLD_ID')
    Left = 89
    Top = 101
  end
  object TblChild: TFDQuery
    AfterPost = TblChildAfterPost
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereChanged
    Left = 160
    Top = 79
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'QryArinvt'
      'TblChild'
      'JumpToPhantomBOM1'
      'JumpToAutoMRP1')
    SecurityCode = 'FRMKANBAN_BASE'
    Left = 193
    Top = 52
  end
  object PkReplenishSrc: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select '
      '       s.attn as ship_to, '
      '       d.name as division_name,'
      '       e.name as eplant_name,'
      '       s.eplant_id as eplant_id,'
      '       s.default_ship_to as  master_distribution,'
      '       s.id as ship_to_id'
      '  from '
      '       arcusto a, ship_to s, division d, eplant e'
      ' where a.is_intercomp = '#39'Y'#39
      '   and a.id = s.arcusto_id'
      '   and s.division_id = d.id(+)'
      '   and s.eplant_id = e.id(+)')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 229
    Top = 51
    object PkReplenishSrcSHIP_TO: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'SHIP_TO'
      Size = 60
    end
    object PkReplenishSrcEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant Name'
      DisplayWidth = 20
      FieldName = 'EPLANT_NAME'
      Size = 30
    end
    object PkReplenishSrcDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      FieldName = 'DIVISION_NAME'
      Size = 25
    end
    object PkReplenishSrcMASTER_DISTRIBUTION: TStringField
      DisplayLabel = 'Default Master Distribution'
      FieldName = 'MASTER_DISTRIBUTION'
      FixedChar = True
      Size = 1
    end
    object PkReplenishSrcSHIP_TO_ID: TBCDField
      FieldName = 'SHIP_TO_ID'
      Visible = False
      Size = 0
    end
    object PkReplenishSrcEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object popmDataIns: TUniPopupMenu
    OnPopup = popmDataInsPopup
    Left = 262
    Top = 52
    object JumpToInventory1: TUniMenuItem
      Caption = 'Jump To Inventory'
      OnClick = JumpToInventory1Click
    end
    object JumptoTransactionsLocations1: TUniMenuItem
      Caption = 'Jump to Transactions / Locations'
      OnClick = JumptoTransactionsLocations1Click
    end
    object JumptoSalesOrder1: TUniMenuItem
      Caption = 'Jump to Ship Order'
      OnClick = JumptoSalesOrder1Click
    end
    object JumptoPhantomBOM1: TUniMenuItem
      Caption = 'Jump to Phantom BOM'
      OnClick = JumptoPhantomBOM1Click
    end
    object JumptoAutoMRP1: TUniMenuItem
      Caption = 'Jump to Auto MRP'
    end
  end
  object IQJumpSO: TIQWebJump
    DataSource = SrcChild
    JumpTo = jtSalesOrder
    Left = 262
    Top = 77
  end
  object IQJumpInv: TIQWebJump
    DataField = 'ID'
    DataSource = SrcArinvt
    JumpTo = jtInventory
    Left = 262
    Top = 106
  end
end
