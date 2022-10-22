object FrmPsTckParam: TFrmPsTckParam
  Left = 250
  Top = 147
  HelpContext = 1039746
  ClientHeight = 736
  ClientWidth = 768
  Caption = 'Pick Ticket Parameters'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 27
    Width = 768
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
  end
  object wwDataInspector1: TwwDataInspector
    Left = 0
    Top = 30
    Width = 768
    Height = 685
    DisableThemes = False
    Align = alClient
    CaptionColor = 14671839
    DataColumns = 5
    IndicatorRow.Enabled = True
    IndicatorRow.Caption = 'Parameters'
    IndicatorRow.Height = 20
    ScrollBars = ssBoth
    TabOrder = 0
    DataSource = SrcPkTktParams
    Items = <
      item
        DataSource = SrcPkTktParams
        DataField = 'SOURCE_NAME'
        Caption = 'System Default / EPlant'
        WordWrap = False
      end
      item
        DataSource = SrcPkTktParams
        DataField = 'SOURCE_ID'
        Caption = 'ID'
        WordWrap = False
      end
      item
        DataSource = SrcPkTktParams
        Caption = 'Pick Ticket'
        ReadOnly = True
        Expanded = True
        Items = <
          item
            DataSource = SrcPkTktParams
            DataField = 'PK_TKT_ORDERS_BASED'
            Caption = 'Sales Orders Based Mode'
            Expanded = True
            PickList.Items.Strings = (
              'Y'
              'N')
            PickList.DisplayAsCheckbox = True
            Items = <
              item
                DataSource = SrcPkTktParams
                DataField = 'PK_TKT_SO_MODE_PKLIST_BY_DIV'
                Caption = 'Filter new orders by division'
                Expanded = True
                PickList.Items.Strings = (
                  'Y'
                  'N')
                PickList.DisplayAsCheckbox = True
                Items = <
                  item
                    DataSource = SrcPkTktParams
                    DataField = 'PK_TKT_PKLIST_BY_SO_DIV'
                    Caption = 'Filter by sales order warehouse/division'
                    PickList.Items.Strings = (
                      'Y'
                      'N')
                    PickList.DisplayAsCheckbox = True
                    WordWrap = False
                  end>
                WordWrap = False
              end
              item
                DataSource = SrcPkTktParams
                DataField = 'PK_TKT_PICK_BY_CUSTOMER'
                Caption = 'Pick By Customer'
                PickList.Items.Strings = (
                  'Y'
                  'N')
                PickList.DisplayAsCheckbox = True
                WordWrap = False
              end>
            TagString = 
              'Check to create Pick Tickets based on SO Backlog. Clear to base ' +
              'on both SO Backlog and Availability (default)'
            WordWrap = False
          end
          item
            DataSource = SrcPkTktParams
            DataField = 'PK_TKT_ONE_PER_CUSTOMER'
            Caption = 'One pickticket per customer'
            PickList.Items.Strings = (
              'Y'
              'N')
            PickList.DisplayAsCheckbox = True
            WordWrap = False
          end
          item
            DataSource = SrcPkTktParams
            DataField = 'PK_TKT_SHOW_ALL'
            Caption = 'Show all releases - ignore ship date'
            PickList.Items.Strings = (
              'Y'
              'N')
            PickList.DisplayAsCheckbox = True
            WordWrap = False
          end
          item
            DataSource = SrcPkTktParams
            DataField = 'PK_TKT_KEEP_REL_SEPARATE'
            Caption = 'Keep releases separate on PS'
            PickList.Items.Strings = (
              'Y'
              'N')
            PickList.DisplayAsCheckbox = True
            WordWrap = False
          end
          item
            DataSource = SrcPkTktParams
            DataField = 'PK_TKT_USE_SHIP_DEFAULT'
            Caption = 'Use Default Shipping Designator'
            PickList.Items.Strings = (
              'Y'
              'N')
            PickList.DisplayAsCheckbox = True
            WordWrap = False
          end
          item
            DataSource = SrcPkTktParams
            DataField = 'PK_TKT_CONV_USE_SYSDATE'
            Caption = 'Use sysdate for shipdate on convert '
            PickList.Items.Strings = (
              'Y'
              'N')
            PickList.DisplayAsCheckbox = True
            TagString = 
              'Use current date (system date) for ship date on pickticket conve' +
              'rsion to PS'
            WordWrap = False
          end
          item
            DataSource = SrcPkTktParams
            DataField = 'RF_SERIALIZED_ROUTING'
            Caption = 'Serialized Routing'
            PickList.Items.Strings = (
              'Y'
              'N')
            PickList.DisplayAsCheckbox = True
            TagString = 
              'Check to enable serialized routing picking in Warehouse Manageme' +
              'nt'
            WordWrap = False
          end
          item
            DataSource = SrcPkTktParams
            DataField = 'PK_TKT_SORT_NULL_RAN_TOP'
            Caption = 'Reorder null RAN# to top'
            EditText = 'N'
            PickList.Items.Strings = (
              'Y'
              'N')
            PickList.DisplayAsCheckbox = True
            TagString = 
              'On sequence reorder if box is checked null RAN numbers will sort' +
              ' to top'
            WordWrap = False
          end
          item
            DataSource = SrcPkTktParams
            DataField = 'PK_TKT_ENABLE_VOLUME_CALC'
            Caption = 'Enable volume/weight calculations'
            EditText = 'Y'
            PickList.Items.Strings = (
              'Y'
              'N')
            PickList.DisplayAsCheckbox = True
            WordWrap = False
          end
          item
            DataSource = SrcPkTktParams
            DataField = 'PK_TKT_HARD_ALLOC_ON_PICK'
            Caption = 'Hard allocate inventory during picking process'
            PickList.Items.Strings = (
              'Y'
              'N')
            PickList.DisplayAsCheckbox = True
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = SrcPkTktParams
        Caption = 'Staging'
        ReadOnly = True
        Expanded = True
        Items = <
          item
            DataSource = SrcPkTktParams
            DataField = 'PK_TKT_STAGE_BY_PALLET'
            Caption = 'By Pallet'
            PickList.Items.Strings = (
              'Y'
              'N')
            PickList.DisplayAsCheckbox = True
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = SrcPkTktParams
        Caption = 'Must Ship Date'
        ReadOnly = True
        Expanded = True
        Items = <
          item
            DataSource = SrcPkTktParams
            DataField = 'CALC_SHIP_DAY_START_VALID'
            Caption = 'Ensure promise date is valid ship day'
            PickList.Items.Strings = (
              'Y'
              'N')
            PickList.DisplayAsCheckbox = True
            TagString = 
              'Ensure/convert promise date to a valid ship day when starting ca' +
              'lculation of the Must Ship Day'
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = SrcPkTktParams
        Caption = 'Print'
        ReadOnly = True
        Expanded = True
        Items = <
          item
            DataSource = SrcPkTktParams
            DataField = 'PK_TKT_DO_NOT_PRNT_PS_ON_CONV'
            Caption = 'Do Not Print Packslip on Convert'
            PickList.Items.Strings = (
              'Y'
              'N')
            PickList.DisplayAsCheckbox = True
            TagString = 'Print Packing Slip when converting Ticket to Packing Slip?'
            WordWrap = False
          end
          item
            DataSource = SrcPkTktParams
            DataField = 'PK_TKT_DO_NOT_PRNT_BOL_ON_CONV'
            Caption = 'Do Not Print BOL on Convert'
            PickList.Items.Strings = (
              'Y'
              'N')
            PickList.DisplayAsCheckbox = True
            TagString = 'Print BOL when converting Ticket to Packing Slip?'
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = SrcPkTktParams
        Caption = 'Packing Slip'
        ReadOnly = True
        Expanded = True
        Items = <
          item
            DataSource = SrcPkTktParams
            DataField = 'PS_EVAL_OVERSHIP'
            Caption = 'Evaluate Overshipment'
            PickList.Items.Strings = (
              'Y'
              'N')
            PickList.DisplayAsCheckbox = True
            TagString = 
              'On overshipment - prompt to increase a release or split the ship' +
              'ment '
            WordWrap = False
          end
          item
            DataSource = SrcPkTktParams
            DataField = 'PS_VERIFY_INVENTORY'
            Caption = 'Verify Inventory before relieving '
            PickList.Items.Strings = (
              'Y'
              'N')
            PickList.DisplayAsCheckbox = True
            Items = <
              item
                DataSource = SrcPkTktParams
                DataField = 'PS_SKIP_VERIFY_INV_DROP_SHIP'
                Caption = 'Skip Verification on Drop Ship Orders'
                PickList.Items.Strings = (
                  'Y'
                  'N')
                PickList.DisplayAsCheckbox = True
                WordWrap = False
              end>
            WordWrap = False
          end
          item
            DataSource = SrcPkTktParams
            DataField = 'PK_TKT_SHOW_BACKORDER'
            Caption = 'Show Backorder'
            PickList.Items.Strings = (
              'Y'
              'N')
            PickList.DisplayAsCheckbox = True
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = SrcPkTktParams
        Caption = 'EDI'
        ReadOnly = True
        Expanded = True
        Items = <
          item
            DataSource = SrcPkTktParams
            DataField = 'PK_TKT_SO_SYNC_AFTER_EDI'
            Caption = 'Synchronize with SO releases'
            PickList.Items.Strings = (
              'Y'
              'N')
            PickList.DisplayAsCheckbox = True
            TagString = 
              'Synchronize / merge orphaned pick tickets with sales order relea' +
              'ses'
            WordWrap = False
          end
          item
            DataSource = SrcPkTktParams
            DataField = 'PK_TKT_ASSIGN_ASN_ON_PRINT_LBL'
            Caption = 'Populate ASN when printing labels'
            PickList.Items.Strings = (
              'Y'
              'N')
            PickList.DisplayAsCheckbox = True
            TagString = 'Only use this option if not scanning labels'
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = SrcPkTktParams
        Caption = 'Scanning'
        ReadOnly = True
        Expanded = True
        Items = <
          item
            DataSource = SrcPkTktParams
            DataField = 'PK_TKT_LABEL_MUST_BE_DISPO'
            Caption = 'Labels Must Be Dispositioned'
            PickList.Items.Strings = (
              'Y'
              'N')
            PickList.DisplayAsCheckbox = True
            TagString = 
              'Check to indicate whether labels scanned to a pickticket must be' +
              ' marked as dispositioned'
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = SrcPkTktParams
        Caption = 'Dock Scheduling'
        ReadOnly = True
        Expanded = True
        Items = <
          item
            DataSource = SrcPkTktParams
            DataField = 'PK_TKT_USE_DOCK_SCHEDULER'
            Caption = 'Use Dock Scheduler'
            PickList.Items.Strings = (
              'Y'
              'N')
            PickList.DisplayAsCheckbox = True
            TagString = 
              'Check to indicate whether to use the Dock Scheduler to assign th' +
              'e Ship Dock location.'
            WordWrap = False
          end>
        WordWrap = False
      end>
    DefaultRowHeight = 19
    CaptionWidth = 261
    Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert, ovFillNonCellArea]
    PaintOptions.ActiveRecordColor = clCream
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
    LineStyleCaption = ovLight3DLine
    LineStyleData = ovLight3DLine
    CaptionIndent = 16
    OnAfterSelectCell = wwDataInspector1AfterSelectCell
    OnDrawCaptionCell = wwDataInspector1DrawCaptionCell
    OnItemChanged = wwDataInspector1ItemChanged
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 768
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object sbtnCopyFromDefault: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Assign from System Default parameters'
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
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFC07040B05830B05830A05020A050209048209048
        20904020804020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7171715C
        5C5C5C5C5C5353535353534A4A4A4A4A4A454545424242FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFC07850FFF8F0D0B0A0D0B0A0D0B0A0C0B0A0C0A8
        A0C0A890904020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF797979F7
        F7F7AFAFAFAFAFAFAFAFAFAEAEAEA8A8A8A5A5A5454545FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFD08860FFFFFFE09060D08050D08050D08050D080
        50C0A8A0904820FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF888888FF
        FFFF909090808080808080808080808080A8A8A84A4A4AFF00FFB0A090604830
        604830604830604830604830D09070FFFFFFFFFFFFFFF0F0F0E0D0F0D0C0F0C0
        B0C0B0A0904820FF00FF9E9E9E464646464646464646464646464646909090FF
        FFFFFFFFFFF2F2F2DEDEDED0D0D0C1C1C1AEAEAE4A4A4AFF00FFB0A090FFF0F0
        F0E0D0E0D8D0E0D0C0E0C8C0E0A080FFFFFFF0A880E09870E09060D08050D080
        50D0B0A0A04820FF00FF9E9E9EF2F2F2DEDEDED7D7D7CECECEC9C9C9A0A0A0FF
        FFFFA8A8A8989898909090808080808080AFAFAF4D4D4DFF00FFB0A090FFF8F0
        E0B080E0A070E0A070D09870E0A890FFFFFFFFFFFFFFFFFFFFF8F0F0E8E0F0D0
        C0D0B0A0A05020FF00FF9E9E9EF7F7F7ACACAC9E9E9E9E9E9E969696A9A9A9FF
        FFFFFFFFFFFFFFFFF7F7F7E7E7E7D0D0D0AFAFAF535353FF00FFC0A890FFFFFF
        FFF8F0F0F0F0F0E8E0F0E0D0E0B8A0FFFFFFFFB090FFB090F0D8D0E09060B058
        30B05830A05020FF00FFA5A5A5FFFFFFF7F7F7F0F0F0E7E7E7DEDEDEB7B7B7FF
        FFFFB1B1B1B1B1B1D9D9D99090905C5C5C5C5C5C535353FF00FFC0A8A0FFFFFF
        FFC8A0F0B890E0B080E0A070F0C0A0FFFFFFFFFFFFFFFFFFFFFFFFF09870F0C8
        B0B05830E8BFA4FF00FFA8A8A8FFFFFFC6C6C6B6B6B6ACACAC9E9E9EBEBEBEFF
        FFFFFFFFFFFFFFFFFFFFFF9A9A9AC7C7C75C5C5CBEBEBEFF00FFC0B0A0FFFFFF
        FFFFFFFFF8FFFFF0F0F0E8E0F0C8B0FFFFFFFFFFFFFFFFFFFFFFFFF0A880C068
        30ECC4A6FF00FFFF00FFAEAEAEFFFFFFFFFFFFFAFAFAF2F2F2E7E7E7C7C7C7FF
        FFFFFFFFFFFFFFFFFFFFFFA8A8A86A6A6AC2C2C2FF00FFFF00FFD0B8B0FFFFFF
        FFD8C0FFD0B0F0E0D0B0A090F0C8B0F0C0B0F0C0B0F0B8A0F0B090F0B090F4CE
        B3FF00FFFF00FFFF00FFB8B8B8FFFFFFD7D7D7CECECEDEDEDE9E9E9EC7C7C7C1
        C1C1C1C1C1B8B8B8B0B0B0B0B0B0CCCCCCFF00FFFF00FFFF00FFD0C0B0FFFFFF
        FFFFFFFFFFFFFFFFFFC0A890D0C8C0907060DEC7B2FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFA5A5A5C7C7C770
        7070C5C5C5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE0C0B0FFFFFF
        FFFFFFFFFFFFFFFFFFC0B0A0A08060DFC8B4FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFAEAEAE7D7D7DC6
        C6C6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE0C0B0E0C0B0
        D0C0B0D0C0B0D0B8B0D0B0A0E4CEBFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFC0C0C0C0C0C0BEBEBEBEBEBEB8B8B8AFAFAFCDCDCDFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnCopyFromDefaultClick
    end
    object NavMain: TUniDBNavigator
      Left = 542
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      DataSource = SrcPkTktParams
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 715
    Width = 768
    Height = 21
    Hint = ''
    Panels = <
      item
        Width = 768
      end>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object SrcPkTktParams: TDataSource
    DataSet = QryPkTktParams
    Left = 393
    Top = 71
  end
  object QryPkTktParams: TFDQuery
    AfterPost = QryPkTktParamsAfterPost
    CachedUpdates = True
    OnUpdateRecord = QryPkTktParamsUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select source_name,'
      '       source_table,'
      '       source_id,'
      '       is_applicable,'
      '       pk_tkt_orders_based,'
      '       pk_tkt_so_mode_pklist_by_div,'
      '       pk_tkt_pick_by_customer,'
      '       pk_tkt_one_per_customer,'
      '       pk_tkt_show_all,'
      '       pk_tkt_keep_rel_separate,'
      '       pk_tkt_use_ship_default,'
      '       pk_tkt_conv_use_sysdate,'
      '       rf_serialized_routing,'
      '       pk_tkt_sort_null_ran_top,'
      '       pk_tkt_enable_volume_calc,'
      '       calc_ship_day_start_valid,'
      '       pk_tkt_do_not_prnt_ps_on_conv,'
      '       pk_tkt_do_not_prnt_bol_on_conv,'
      '       ps_eval_overship,'
      '       ps_verify_inventory,'
      '       pk_tkt_so_sync_after_edi,'
      '       pk_tkt_assign_asn_on_print_lbl,'
      '       pk_tkt_label_must_be_dispo,'
      '       pk_tkt_stage_by_pallet,'
      '       pk_tkt_hard_alloc_on_pick,'
      '       pk_tkt_pklist_by_so_div,'
      '       pk_tkt_use_dock_scheduler,'
      '       ps_skip_verify_inv_drop_ship,'
      '       pk_tkt_show_backorder'
      ' '
      '  from v_pk_tkt_params'
      ' where is_applicable = '#39'Y'#39
      '   and (source_id = 0'
      '        or'
      '        misc.eplant_filter( source_id ) = 1)')
    Left = 393
    Top = 89
    object QryPkTktParamsSOURCE_NAME: TStringField
      DisplayLabel = 'Source'
      FieldName = 'SOURCE_NAME'
      Origin = 'IQ.V_PK_TKT_PARAMS.SOURCE_NAME'
      ReadOnly = True
      Size = 30
    end
    object QryPkTktParamsSOURCE_TABLE: TStringField
      DisplayLabel = 'Source Table'
      FieldName = 'SOURCE_TABLE'
      Origin = 'IQ.V_PK_TKT_PARAMS.SOURCE_TABLE'
      ReadOnly = True
      FixedChar = True
      Size = 6
    end
    object QryPkTktParamsSOURCE_ID: TFMTBCDField
      DisplayLabel = 'Source ID'
      FieldName = 'SOURCE_ID'
      Origin = 'IQ.V_PK_TKT_PARAMS.SOURCE_ID'
      ReadOnly = True
      Size = 38
    end
    object QryPkTktParamsIS_APPLICABLE: TStringField
      DisplayLabel = 'Applicable'
      FieldName = 'IS_APPLICABLE'
      Origin = 'IQ.V_PK_TKT_PARAMS.IS_APPLICABLE'
      ReadOnly = True
      Visible = False
      Size = 1
    end
    object QryPkTktParamsPK_TKT_ORDERS_BASED: TStringField
      DisplayLabel = 'Sales Orders Based Mode'
      FieldName = 'PK_TKT_ORDERS_BASED'
      Origin = 'IQ.V_PK_TKT_PARAMS.PK_TKT_ORDERS_BASED'
      Size = 1
    end
    object QryPkTktParamsPK_TKT_SO_MODE_PKLIST_BY_DIV: TStringField
      DisplayLabel = 'Filter new orders by Division'
      FieldName = 'PK_TKT_SO_MODE_PKLIST_BY_DIV'
      Origin = 'IQ.V_PK_TKT_PARAMS.PK_TKT_SO_MODE_PKLIST_BY_DIV'
      Size = 1
    end
    object QryPkTktParamsPK_TKT_PICK_BY_CUSTOMER: TStringField
      DisplayLabel = 'Pick By Customer'
      FieldName = 'PK_TKT_PICK_BY_CUSTOMER'
      Origin = 'IQ.V_PK_TKT_PARAMS.PK_TKT_PICK_BY_CUSTOMER'
      Size = 1
    end
    object QryPkTktParamsPK_TKT_ONE_PER_CUSTOMER: TStringField
      DisplayLabel = 'One pickticket per customer'
      FieldName = 'PK_TKT_ONE_PER_CUSTOMER'
      Origin = 'IQ.V_PK_TKT_PARAMS.PK_TKT_ONE_PER_CUSTOMER'
      Size = 1
    end
    object QryPkTktParamsPK_TKT_SHOW_ALL: TStringField
      DisplayLabel = 'Show all releases - ignore ship date'
      FieldName = 'PK_TKT_SHOW_ALL'
      Origin = 'IQ.V_PK_TKT_PARAMS.PK_TKT_SHOW_ALL'
      Size = 1
    end
    object QryPkTktParamsPK_TKT_KEEP_REL_SEPARATE: TStringField
      DisplayLabel = 'Keep releases separate on PS'
      FieldName = 'PK_TKT_KEEP_REL_SEPARATE'
      Origin = 'IQ.V_PK_TKT_PARAMS.PK_TKT_KEEP_REL_SEPARATE'
      Size = 1
    end
    object QryPkTktParamsPK_TKT_USE_SHIP_DEFAULT: TStringField
      DisplayLabel = 'Use Default Shipping Designator'
      FieldName = 'PK_TKT_USE_SHIP_DEFAULT'
      Origin = 'IQ.V_PK_TKT_PARAMS.PK_TKT_USE_SHIP_DEFAULT'
      Size = 1
    end
    object QryPkTktParamsPK_TKT_CONV_USE_SYSDATE: TStringField
      DisplayLabel = 'Use sysdate for shipdate on convert '
      FieldName = 'PK_TKT_CONV_USE_SYSDATE'
      Origin = 'IQ.V_PK_TKT_PARAMS.PK_TKT_CONV_USE_SYSDATE'
      Size = 1
    end
    object QryPkTktParamsRF_SERIALIZED_ROUTING: TStringField
      DisplayLabel = 'Serialized Routing'
      FieldName = 'RF_SERIALIZED_ROUTING'
      Origin = 'IQ.V_PK_TKT_PARAMS.RF_SERIALIZED_ROUTING'
      Size = 1
    end
    object QryPkTktParamsPK_TKT_SORT_NULL_RAN_TOP: TStringField
      DisplayLabel = 'Reorder null RAN# to top'
      FieldName = 'PK_TKT_SORT_NULL_RAN_TOP'
      Origin = 'IQ.V_PK_TKT_PARAMS.PK_TKT_SORT_NULL_RAN_TOP'
      Size = 1
    end
    object QryPkTktParamsPK_TKT_ENABLE_VOLUME_CALC: TStringField
      DisplayLabel = 'Enable volume/weight calculations'
      FieldName = 'PK_TKT_ENABLE_VOLUME_CALC'
      Origin = 'IQ.V_PK_TKT_PARAMS.PK_TKT_ENABLE_VOLUME_CALC'
      Size = 1
    end
    object QryPkTktParamsCALC_SHIP_DAY_START_VALID: TStringField
      DisplayLabel = 'Ensure promise date is valid ship day'
      FieldName = 'CALC_SHIP_DAY_START_VALID'
      Origin = 'IQ.V_PK_TKT_PARAMS.CALC_SHIP_DAY_START_VALID'
      Size = 1
    end
    object QryPkTktParamsPK_TKT_DO_NOT_PRNT_PS_ON_CONV: TStringField
      DisplayLabel = 'Do Not Print Packslip on Convert'
      FieldName = 'PK_TKT_DO_NOT_PRNT_PS_ON_CONV'
      Origin = 'IQ.V_PK_TKT_PARAMS.PK_TKT_DO_NOT_PRNT_PS_ON_CONV'
      Size = 1
    end
    object QryPkTktParamsPK_TKT_DO_NOT_PRNT_BOL_ON_CONV: TStringField
      DisplayLabel = 'Do Not Print BOL on Convert'
      FieldName = 'PK_TKT_DO_NOT_PRNT_BOL_ON_CONV'
      Origin = 'IQ.V_PK_TKT_PARAMS.PK_TKT_DO_NOT_PRNT_BOL_ON_CONV'
      Size = 1
    end
    object QryPkTktParamsPS_EVAL_OVERSHIP: TStringField
      DisplayLabel = 'Evaluate Overshipment'
      FieldName = 'PS_EVAL_OVERSHIP'
      Origin = 'IQ.V_PK_TKT_PARAMS.PS_EVAL_OVERSHIP'
      Size = 1
    end
    object QryPkTktParamsPS_VERIFY_INVENTORY: TStringField
      DisplayLabel = 'Verify Inventory before relieving '
      FieldName = 'PS_VERIFY_INVENTORY'
      Origin = 'IQ.V_PK_TKT_PARAMS.PS_VERIFY_INVENTORY'
      Size = 1
    end
    object QryPkTktParamsPK_TKT_SO_SYNC_AFTER_EDI: TStringField
      DisplayLabel = 'Synchronize with SO releases'
      FieldName = 'PK_TKT_SO_SYNC_AFTER_EDI'
      Origin = 'IQ.V_PK_TKT_PARAMS.PK_TKT_SO_SYNC_AFTER_EDI'
      Size = 1
    end
    object QryPkTktParamsPK_TKT_ASSIGN_ASN_ON_PRINT_LBL: TStringField
      DisplayLabel = 'Populate ASN when printing labels'
      FieldName = 'PK_TKT_ASSIGN_ASN_ON_PRINT_LBL'
      Origin = 'IQ.V_PK_TKT_PARAMS.PK_TKT_ASSIGN_ASN_ON_PRINT_LBL'
      Size = 1
    end
    object QryPkTktParamsPK_TKT_LABEL_MUST_BE_DISPO: TStringField
      DisplayLabel = 'Labels Must Be Dispositioned'
      FieldName = 'PK_TKT_LABEL_MUST_BE_DISPO'
      Origin = 'IQ.V_PK_TKT_PARAMS.PK_TKT_LABEL_MUST_BE_DISPO'
      Size = 1
    end
    object QryPkTktParamsPK_TKT_STAGE_BY_PALLET: TStringField
      DisplayLabel = 'By Pallet'
      FieldName = 'PK_TKT_STAGE_BY_PALLET'
      Size = 1
    end
    object QryPkTktParamsPK_TKT_HARD_ALLOC_ON_PICK: TStringField
      DisplayLabel = 'Hard Allocate'
      FieldName = 'PK_TKT_HARD_ALLOC_ON_PICK'
      Size = 1
    end
    object QryPkTktParamsPK_TKT_PKLIST_BY_SO_DIV: TStringField
      FieldName = 'PK_TKT_PKLIST_BY_SO_DIV'
      Size = 1
    end
    object QryPkTktParamsPK_TKT_USE_DOCK_SCHEDULER: TStringField
      FieldName = 'PK_TKT_USE_DOCK_SCHEDULER'
      Size = 1
    end
    object QryPkTktParamsPS_SKIP_VERIFY_INV_DROP_SHIP: TStringField
      FieldName = 'PS_SKIP_VERIFY_INV_DROP_SHIP'
      Size = 1
    end
    object QryPkTktParamsPK_TKT_SHOW_BACKORDER: TStringField
      FieldName = 'PK_TKT_SHOW_BACKORDER'
      Size = 1
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 357
    Top = 73
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About ...'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmPsTckParam'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 193956 $'
    BuildVersion = '176554'
    Left = 330
    Top = 73
  end
  object PKEplant: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       name'
      '  from eplant'
      ' where misc.eplant_filter( id ) = 1'
      '   and nvl(use_eplant_pk_tkt_params, '#39'N'#39') = '#39'N'#39)
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 429
    Top = 71
    object PKEplantID: TFloatField
      DisplayLabel = 'Eplant ID'
      FieldName = 'ID'
      Origin = 'IQ.EPLANT.ID'
    end
    object PKEplantNAME: TStringField
      DisplayLabel = 'Descrip'
      FieldName = 'NAME'
      Origin = 'IQ.EPLANT.NAME'
      Size = 30
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'QryPkTktParamsPK_TKT_ORDERS_BASED'
      'QryPkTktParamsPK_TKT_SO_MODE_PKLIST_BY_DIV'
      'QryPkTktParamsPK_TKT_PICK_BY_CUSTOMER'
      'QryPkTktParamsPK_TKT_ONE_PER_CUSTOMER'
      'QryPkTktParamsPK_TKT_SHOW_ALL'
      'QryPkTktParamsPK_TKT_KEEP_REL_SEPARATE'
      'QryPkTktParamsPK_TKT_USE_SHIP_DEFAULT'
      'QryPkTktParamsPK_TKT_CONV_USE_SYSDATE'
      'QryPkTktParamsRF_SERIALIZED_ROUTING'
      'QryPkTktParamsPK_TKT_SORT_NULL_RAN_TOP'
      'QryPkTktParamsPK_TKT_ENABLE_VOLUME_CALC'
      'QryPkTktParamsCALC_SHIP_DAY_START_VALID'
      'QryPkTktParamsPK_TKT_DO_NOT_PRNT_PS_ON_CONV'
      'QryPkTktParamsPK_TKT_DO_NOT_PRNT_BOL_ON_CONV'
      'QryPkTktParamsPS_EVAL_OVERSHIP'
      'QryPkTktParamsPS_VERIFY_INVENTORY'
      'QryPkTktParamsPK_TKT_SO_SYNC_AFTER_EDI'
      'QryPkTktParamsPK_TKT_ASSIGN_ASN_ON_PRINT_LBL'
      'QryPkTktParamsPK_TKT_LABEL_MUST_BE_DISPO'
      'QryPkTktParamsPK_TKT_STAGE_BY_PALLET'
      'QryPkTktParamsPK_TKT_HARD_ALLOC_ON_PICK'
      'QryPkTktParamsPK_TKT_PKLIST_BY_SO_DIV'
      'QryPkTktParamsPK_TKT_USE_DOCK_SCHEDULER'
      'sbtnCopyFromDefault'
      'NavMain'
      'QryPkTktParamsPK_TKT_SHOW_BACKORDER')
    SecurityCode = 'FRMPSTCKPARAM'
    Left = 464
    Top = 72
  end
end
