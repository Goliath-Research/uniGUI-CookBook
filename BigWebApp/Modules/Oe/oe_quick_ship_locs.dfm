object FrmOEQuickShipLocations: TFrmOEQuickShipLocations
  Left = 0
  Top = 0
  ClientHeight = 421
  ClientWidth = 838
  Caption = 'Assign Quantity and Locations'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  ActiveControl = wwDBGrid1
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter2: TUniSplitter
    Left = 0
    Top = 55
    Width = 838
    Height = 4
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 838
    Height = 55
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object wwDataInspector1: TwwDataInspector
      Left = 0
      Top = 0
      Width = 838
      Height = 55
      TabStop = False
      DisableThemes = False
      Align = alClient
      BorderStyle = bsNone
      TabOrder = 0
      DataSource = SrcOrder
      Items = <
        item
          DataSource = SrcOrder
          DataField = 'ORDERNO'
          Caption = 'Order #'
          WordWrap = False
        end
        item
          DataSource = SrcOrder
          DataField = 'ITEMNO'
          Caption = 'Item #'
          Items = <
            item
              DataSource = SrcOrder
              DataField = 'DESCRIP'
              Caption = 'Description'
              WordWrap = False
            end
            item
              DataSource = SrcOrder
              DataField = 'DESCRIP2'
              Caption = 'Ext Description'
              WordWrap = False
            end
            item
              DataSource = SrcOrder
              DataField = 'REV'
              Caption = 'Rev'
              WordWrap = False
            end
            item
              DataSource = SrcOrder
              DataField = 'CLASS'
              Caption = 'Class'
              WordWrap = False
            end>
          WordWrap = False
        end>
      DefaultRowHeight = 19
      CaptionWidth = 100
      Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      LineStyleCaption = ovDottedLine
      LineStyleData = ovDottedLine
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 380
    Width = 838
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel4: TUniPanel
      Left = 613
      Top = 1
      Width = 225
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 8
        Top = 9
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 117
        Top = 9
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 59
    Width = 838
    Height = 321
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 581
      Top = 0
      Width = 4
      Height = 321
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel5: TUniPanel
      Left = 1
      Top = 1
      Width = 581
      Height = 319
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Panel7: TUniPanel
        Left = 1
        Top = 1
        Width = 579
        Height = 28
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = '  Pick On Hand Inventory'
        object pnlLegend: TUniPanel
          Left = 215
          Top = 1
          Width = 136
          Height = 26
          Hint = ''
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
        end
        object Panel9: TUniPanel
          Left = 351
          Top = 1
          Width = 36
          Height = 26
          Hint = ''
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object sbtnClassFilter: TUniSpeedButton
            Left = 9
            Top = 1
            Width = 25
            Height = 25
            Hint = 'Filter ...'
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
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF5A5857404040202820000800FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF58585840
              4040252525050505FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF606060706870404040000800FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6060606A
              6A6A404040050505FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF605860909090606060302830FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5B5B5B90
              90906060602A2A2AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF505850B0A8B0808080404840FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF555555AB
              ABAB808080464646FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFE0C9B9605850C0C0C0A0A0A0404040CEB3A0FF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC8C8C8575757C0
              C0C0A0A0A0404040B2B2B2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFE0CABA505850A0A0A0D0D0D0B0B0B0707070201820CCAE9BFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC9C9C9555555A0A0A0D0
              D0D0B0B0B07070701A1A1AADADADFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFE1CCBC706870C0B8C0E0E8E0E0E0E0C0C0C0909890605860201820CBAB
              96FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCBCBCB6A6A6ABBBBBBE6E6E6E0
              E0E0C0C0C09696965B5B5B1A1A1AA9A9A9FF00FFFF00FFFF00FFFF00FFFF00FF
              E1CDBE707070C0C0C0F0E8F0FFF8FFF0F0F0D0D8D0C0C0C0A098A06058601018
              10C9A791FF00FFFF00FFFF00FFFF00FFCCCCCC707070C0C0C0EBEBEBFAFAFAF0
              F0F0D6D6D6C0C0C09B9B9B5B5B5B161616A5A5A5FF00FFFF00FFFF00FFE1CDC0
              808080D0D0D0F0F0F0FFFFFFFFFFFFFFF8FFE0E8E0D0D8D0C0B8C09090905050
              50201820C8A38CFF00FFFF00FFCCCCCC808080D0D0D0F0F0F0FFFFFFFFFFFFFA
              FAFAE6E6E6D6D6D6BBBBBB9090905050501A1A1AA2A2A2FF00FFFF00FF808080
              D0D0D0F0F0F0FFF8FFFFF8FFF0F8F0F0F0F0E0E8E0D0D0D0C0C0C0A098A06068
              60505850101810FF00FFFF00FF808080D0D0D0F0F0F0FAFAFAFAFAFAF6F6F6F0
              F0F0E6E6E6D0D0D0C0C0C09B9B9B656565555555161616FF00FFFF00FFB0B8B0
              C0C8C0D0D0D0D0D0D0C0C0C0C0B8C0B0B0B0A0A8A0A0A0A0A098A09090907078
              70606060504850FF00FFFF00FFB6B6B6C6C6C6D0D0D0D0D0D0C0C0C0BBBBBBB0
              B0B0A6A6A6A0A0A09B9B9B9090907575756060604A4A4AFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Caption = ''
            ParentColor = False
            Color = clWindow
            OnClick = sbtnClassFilterClick
          end
        end
        object navMainInv: TUniDBNavigator
          Left = 387
          Top = 1
          Width = 192
          Height = 26
          Hint = ''
          DataSource = SrcFgMulti
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel, nbRefresh]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 2
        end
      end
      object wwDBGrid1: TIQUniGridControl
        Left = 1
        Top = 28
        Width = 579
        Height = 291
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 362
        IQComponents.Grid.Height = 205
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcFgMulti
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
        IQComponents.Navigator.DataSource = SrcFgMulti
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 362
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 205
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcFgMulti
        Columns = <
          item
            FieldName = 'QTY'
            Title.Caption = 'Pick Qty'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'LOC_DESC'
            Title.Caption = 'Location'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'LOTNO'
            Title.Caption = 'Lot #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DIVISION_NAME'
            Title.Caption = 'Division'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ONHAND'
            Title.Caption = 'On Hand'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'IN_DATE'
            Title.Caption = 'In-Date'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
    end
    object Panel6: TUniPanel
      Left = 585
      Top = 1
      Width = 253
      Height = 319
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Panel8: TUniPanel
        Left = 1
        Top = 1
        Width = 251
        Height = 28
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = '  Backlog'
        object navBacklog: TUniDBNavigator
          Left = 107
          Top = 1
          Width = 144
          Height = 26
          Hint = ''
          DataSource = SrcBacklog
          VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
      object wwDBGrid2: TIQUniGridControl
        Left = 1
        Top = 28
        Width = 251
        Height = 291
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 34
        IQComponents.Grid.Height = 205
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcBacklog
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
        IQComponents.Navigator.DataSource = SrcBacklog
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 34
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 205
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcBacklog
        Columns = <
          item
            FieldName = 'QTY'
            Title.Caption = 'Qty'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DivisionName'
            Title.Caption = 'Division Name'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object wwDBComboDlgDiv: TUniEdit
        Left = 24
        Top = 84
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 2
        ReadOnly = True
        OnKeyDown = wwDBComboDlgDivKeyDown
      end
    end
  end
  object SrcOrder: TDataSource
    DataSet = QryOrder
    Left = 20
    Top = 131
  end
  object QryOrder: TFDQuery
    BeforeOpen = QryOrderBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select o.orderno,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.descrip2,'
      '       a.rev,'
      '       a.class'
      '  from orders o,'
      '       arinvt a'
      ' where o.id = :orders_id'
      '   and a.id = :arinvt_id')
    Left = 20
    Top = 159
    ParamData = <
      item
        Name = 'orders_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryOrderORDERNO: TStringField
      FieldName = 'ORDERNO'
      Origin = 'IQ.ORDERS.ORDERNO'
      Size = 15
    end
    object QryOrderITEMNO: TStringField
      FieldName = 'ITEMNO'
      Origin = 'IQ.ARINVT.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryOrderDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'IQ.ARINVT.DESCRIP'
      Size = 100
    end
    object QryOrderDESCRIP2: TStringField
      FieldName = 'DESCRIP2'
      Origin = 'IQ.ARINVT.DESCRIP2'
      Size = 100
    end
    object QryOrderREV: TStringField
      FieldName = 'REV'
      Origin = 'IQ.ARINVT.REV'
      FixedChar = True
      Size = 15
    end
    object QryOrderCLASS: TStringField
      FieldName = 'CLASS'
      Origin = 'IQ.ARINVT.CLASS'
      FixedChar = True
      Size = 2
    end
  end
  object SrcFgMulti: TDataSource
    DataSet = QryFgMulti
    Left = 64
    Top = 131
  end
  object QryFgMulti: TFDQuery
    BeforeOpen = QryFgMultiBeforeOpen
    AfterPost = ApplyUpdate
    AfterDelete = ApplyUpdate
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQLFgMulti
    SQL.Strings = (
      'select x.id,'
      '       x.ord_detail_fgmulti_id,'
      '       x.fgmulti_id,'
      '       x.division_id,'
      '       x.qty,'
      ''
      '       loc.loc_desc,'
      '       f.loc_id,'
      '       f.lotno,'
      '       d.name as division_name,'
      '       f.in_date,'
      '       f.onhand / iqmisc.no_zero(:uom_factor) as onhand,'
      '       '
      '       loc.VMI as VMI,'
      '       f.non_conform_id as non_conform_id,'
      '       f.non_allocate_id as non_allocate_id,'
      
        '       f.shipment_dtl_id_in_transit as shipment_dtl_id_in_transi' +
        't,'
      
        '       decode((select source from v_fgmulti_allocated where fgmu' +
        'lti_id = f.id), NULL, '#39'N'#39', '#39'Y'#39' ) as is_hard_alloc,'
      '       f.make_to_order_detail_id as make_to_order_detail_id,'
      '       f.lot_date as lot_date,'
      '       a.shelf_life,'
      
        '       arinvt_misc.is_lot_expired( f.arinvt_id, f.lotno ) as is_' +
        'lot_expired'
      '       '
      '  from GTT_ORD_DETAIL_FGMULTI x,'
      '       fgmulti f,'
      '       locations loc,'
      '       division d,'
      '       arinvt a'
      ''
      ' where '
      '       x.fgmulti_id = f.id'
      '   and f.loc_id = loc.id'
      '   and f.division_id = d.id(+)'
      '   and f.arinvt_id = a.id'
      ''
      '   and (:exclude_vmi <> '#39'Y'#39
      '        or'
      '        nvl(loc.vmi,'#39'N'#39') <> '#39'Y'#39')'
      ''
      '   and (:exclude_non_conform <> '#39'Y'#39
      '        or'
      '        f.non_conform_id is null)'
      '        '
      '   and (:exclude_non_allocate <> '#39'Y'#39
      '        or'
      '        f.non_allocate_id is null)'
      '        '
      '   and (:exclude_in_transit <> '#39'Y'#39
      '        or'
      '        f.shipment_dtl_id_in_transit is null)'
      '        '
      '   and (:exclude_hard_alloc <> '#39'Y'#39
      '        or'
      
        '        decode((select source from v_fgmulti_allocated where fgm' +
        'ulti_id = f.id), NULL, '#39'N'#39', '#39'Y'#39' ) = '#39'N'#39')'
      ''
      '   and (:exclude_make_to_order <> '#39'Y'#39
      '        or'
      '        f.make_to_order_detail_id is null)'
      '        '
      '   and (:exclude_expired <> '#39'Y'#39
      '        or'
      '        arinvt_misc.is_lot_expired( f.arinvt_id, f.lotno ) <> 1)'
      ''
      '/* _ORDER_BY_START_*/        '
      ' order by '
      '       loc.loc_desc, '
      '       f.lotno  '
      '/* _ORDER_BY_END_*/        '
      '          '
      ''
      ' ')
    Left = 64
    Top = 159
    ParamData = <
      item
        Name = 'uom_factor'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'exclude_vmi'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'exclude_non_conform'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'exclude_non_allocate'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'exclude_in_transit'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'exclude_hard_alloc'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'exclude_make_to_order'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'exclude_expired'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryFgMultiQTY: TFMTBCDField
      DisplayLabel = 'Pick Qty'
      DisplayWidth = 12
      FieldName = 'QTY'
      Origin = 'x.qty'
      Size = 6
    end
    object QryFgMultiLOC_DESC: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 26
      FieldName = 'LOC_DESC'
      Origin = 'loc.loc_desc'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object QryFgMultiLOTNO: TStringField
      DisplayLabel = 'Lot #'
      DisplayWidth = 16
      FieldName = 'LOTNO'
      Origin = 'f.lotno'
      ReadOnly = True
      Size = 25
    end
    object QryFgMultiDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 16
      FieldName = 'DIVISION_NAME'
      Origin = 'd.name'
      ReadOnly = True
      Size = 25
    end
    object QryFgMultiONHAND: TFMTBCDField
      DisplayLabel = 'On Hand'
      DisplayWidth = 17
      FieldName = 'ONHAND'
      Origin = 'f.onhand'
      ReadOnly = True
      Size = 38
    end
    object QryFgMultiIN_DATE: TDateTimeField
      DisplayLabel = 'In-Date'
      DisplayWidth = 23
      FieldName = 'IN_DATE'
      Origin = 'f.in_date'
      ReadOnly = True
    end
    object QryFgMultiID: TBCDField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryFgMultiORD_DETAIL_FGMULTI_ID: TBCDField
      FieldName = 'ORD_DETAIL_FGMULTI_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryFgMultiFGMULTI_ID: TBCDField
      FieldName = 'FGMULTI_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryFgMultiDIVISION_ID: TBCDField
      FieldName = 'DIVISION_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryFgMultiVMI: TStringField
      FieldName = 'VMI'
      ReadOnly = True
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFgMultiNON_CONFORM_ID: TBCDField
      FieldName = 'NON_CONFORM_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryFgMultiNON_ALLOCATE_ID: TBCDField
      FieldName = 'NON_ALLOCATE_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryFgMultiSHIPMENT_DTL_ID_IN_TRANSIT: TBCDField
      FieldName = 'SHIPMENT_DTL_ID_IN_TRANSIT'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryFgMultiIS_HARD_ALLOC: TStringField
      FieldName = 'IS_HARD_ALLOC'
      ReadOnly = True
      Visible = False
      Size = 1
    end
    object QryFgMultiMAKE_TO_ORDER_DETAIL_ID: TBCDField
      FieldName = 'MAKE_TO_ORDER_DETAIL_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryFgMultiLOT_DATE: TDateTimeField
      FieldName = 'LOT_DATE'
      ReadOnly = True
      Visible = False
    end
    object QryFgMultiSHELF_LIFE: TBCDField
      FieldName = 'SHELF_LIFE'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryFgMultiIS_LOT_EXPIRED: TFMTBCDField
      FieldName = 'IS_LOT_EXPIRED'
      ReadOnly = True
      Visible = False
      Size = 38
    end
    object QryFgMultiLOC_ID: TBCDField
      FieldName = 'LOC_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
  end
  object SrcBacklog: TDataSource
    DataSet = QryBacklog
    Left = 109
    Top = 130
  end
  object QryBacklog: TFDQuery
    BeforePost = QryBacklogBeforePost
    AfterPost = ApplyUpdate
    AfterDelete = ApplyUpdate
    OnCalcFields = QryBacklogCalcFields
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQLBacklog
    SQL.Strings = (
      'select id, '
      '       qty,'
      '       division_id'
      '  from GTT_ORD_DETAIL_FGMULTI'
      ' where fgmulti_id is null'
      ' order by id')
    Left = 108
    Top = 159
    object QryBacklogQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 10
      FieldName = 'QTY'
      Origin = 'IQ.GTT_ORD_DETAIL_FGMULTI.QTY'
      Size = 6
    end
    object QryBacklogDivisionName: TStringField
      DisplayLabel = 'Division Name'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'DivisionName'
      Size = 25
      Calculated = True
    end
    object QryBacklogDIVISION_ID: TBCDField
      FieldName = 'DIVISION_ID'
      Origin = 'IQ.GTT_ORD_DETAIL_FGMULTI.DIVISION_ID'
      Visible = False
      Size = 0
    end
    object QryBacklogID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.GTT_ORD_DETAIL_FGMULTI.ID'
      Visible = False
      Size = 0
    end
  end
  object PkDivision: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select d.id,'
      '       d.name, '
      '       d.descrip,'
      '       d.eplant_id'
      '  from division d'
      ' where misc.eplant_filter(d.eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 140
    Top = 159
    object PkDivisionID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkDivisionNAME: TStringField
      DisplayLabel = 'Division'
      FieldName = 'NAME'
      Size = 25
    end
    object PkDivisionDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkDivisionEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object UpdateSQLBacklog: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into GTT_ORD_DETAIL_FGMULTI'
      '  (ID, QTY, DIVISION_ID)'
      'values'
      '  (:ID, :QTY, :DIVISION_ID)')
    ModifySQL.Strings = (
      'update GTT_ORD_DETAIL_FGMULTI'
      'set'
      '  ID = :ID,'
      '  QTY = :QTY,'
      '  DIVISION_ID = :DIVISION_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from GTT_ORD_DETAIL_FGMULTI'
      'where'
      '  ID = :OLD_ID')
    Left = 108
    Top = 191
  end
  object UpdateSQLFgMulti: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into GTT_ORD_DETAIL_FGMULTI'
      '  (QTY)'
      'values'
      '  (:QTY)')
    ModifySQL.Strings = (
      'update GTT_ORD_DETAIL_FGMULTI'
      'set'
      '  QTY = :QTY'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from GTT_ORD_DETAIL_FGMULTI'
      'where'
      '  ID = :OLD_ID')
    Left = 64
    Top = 191
  end
  object PopupMenu1: TUniPopupMenu
    Left = 60
    Top = 242
    object JumpToLocationsTransactions1: TUniMenuItem
      Caption = 'Jump To Locations && Transactions'
      OnClick = JumpToLocationsTransactions1Click
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 24
    Top = 242
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
    ModuleName = 'FrmOEQuickShipLocations'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 194130 $'
    BuildVersion = '176554'
    Left = 26
    Top = 275
  end
end
