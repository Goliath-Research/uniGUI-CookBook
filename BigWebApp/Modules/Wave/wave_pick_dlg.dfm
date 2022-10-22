object FrmWavePickDlg: TFrmWavePickDlg
  Left = 0
  Top = 0
  ClientHeight = 459
  ClientWidth = 1010
  Caption = 'Add To Wave'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 28
    Width = 1010
    Height = 390
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 297
      Top = 0
      Width = 4
      Height = 390
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PageControl1: TUniPageControl
      Left = 301
      Top = 1
      Width = 709
      Height = 388
      Hint = ''
      ActivePage = TabSheet1
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabSheet1: TUniTabSheet
        Hint = ''
        ImageIndex = 2
        Caption = 'Releases'
        object IQSearch1: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 701
          Height = 360
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 484
          IQComponents.Grid.Height = 274
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcReleases
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
          IQComponents.Navigator.DataSource = SrcReleases
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 484
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 274
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcReleases
          Columns = <
            item
              FieldName = 'ORDERNO'
              Title.Caption = 'Order #'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ITEMNO'
              Title.Caption = 'Item #'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'Description'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'REV'
              Title.Caption = 'Rev'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SHIP_QUAN'
              Title.Caption = 'Backlog Qty'
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
              FieldName = 'SHIP_DATE'
              Title.Caption = 'Ship Date'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PONO'
              Title.Caption = 'PO #'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EPLANT_ID'
              Title.Caption = 'EPlant ID'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'RAN'
              Title.Caption = 'RAN#'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ONHOLD'
              Title.Caption = 'On Hold'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'KBTRIGGER'
              Title.Caption = 'KB Trigger'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SHIP_VIA'
              Title.Caption = 'Ship Via'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP2'
              Title.Caption = 'Ext Description'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SHIP_QUAN_NATIVE'
              Title.Caption = 'Backlog Native Qty'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ARINVT_UNIT'
              Title.Caption = 'Native UOM'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'OE_UNIT'
              Title.Caption = 'OE UOM'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'WAVE_PICK_ID'
              Title.Caption = 'Wave #'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EXPEDITE'
              Title.Caption = 'Expedite'
              Width = 64
              CheckBoxField.FieldValues = 'Y;N'
            end
            item
              FieldName = 'COMPANY'
              Title.Caption = 'Customer'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SHIP_TO_ATTN'
              Title.Caption = 'Ship To'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'REQUEST_DATE'
              Title.Caption = 'Request Date'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
      end
    end
    object pnlWaveHeader: TUniPanel
      Left = 1
      Top = 1
      Width = 297
      Height = 388
      Hint = ''
      Constraints.MinWidth = 200
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
      Caption = ''
      ParentColor = True
      object diCriteria: TwwDataInspector
        Left = 0
        Top = 0
        Width = 297
        Height = 388
        DisableThemes = False
        Align = alClient
        TabOrder = 1
        Items = <
          item
            Caption = 'Wave #'
            ReadOnly = True
            TagString = 'wave'
            WordWrap = False
          end
          item
            Caption = 'Division'
            ReadOnly = True
            TagString = 'division'
            WordWrap = False
          end
          item
            Caption = 'Expedited SO'
            ReadOnly = True
            TagString = 'expedite_axe'
            WordWrap = False
          end
          item
            Caption = 'EPlant'
            ReadOnly = True
            TagString = 'eplant'
            WordWrap = False
          end
          item
            Caption = 'Customer'
            ReadOnly = True
            TagString = 'customer'
            WordWrap = False
          end
          item
            Caption = 'Customer Group ID'
            ReadOnly = True
            TagString = 'cust_group'
            WordWrap = False
          end
          item
            Caption = 'Ship To'
            ReadOnly = True
            TagString = 'ship_to'
            WordWrap = False
          end
          item
            Caption = 'Ship Via'
            ReadOnly = True
            TagString = 'freight'
            WordWrap = False
          end
          item
            Caption = 'From Ship Date'
            ReadOnly = True
            TagString = 'from_ship_date'
            WordWrap = False
          end
          item
            Caption = 'To Ship Date'
            ReadOnly = True
            TagString = 'to_ship_date'
            WordWrap = False
          end
          item
            Caption = 'Salesperson'
            ReadOnly = True
            TagString = 'salesperson'
            WordWrap = False
          end
          item
            Caption = 'CSR Rep'
            ReadOnly = True
            TagString = 'employee'
            WordWrap = False
          end
          item
            Caption = 'Evaluate Requested Date'
            ReadOnly = True
            PickList.Items.Strings = (
              'Y'
              'N')
            PickList.DisplayAsCheckbox = True
            TagString = 'eval_req_date'
            WordWrap = False
          end
          item
            Caption = 'RAN From'
            ReadOnly = True
            TagString = 'ran_from'
            WordWrap = False
          end
          item
            Caption = 'RAN To'
            ReadOnly = True
            TagString = 'ran_to'
            WordWrap = False
          end>
        DefaultRowHeight = 19
        CaptionWidth = 150
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
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 418
    Width = 1010
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel4: TUniPanel
      Left = 788
      Top = 1
      Width = 222
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
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 111
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 2
        OnClick = btnCancelClick
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 1010
    Height = 28
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object Panel5: TUniPanel
      Left = 911
      Top = 1
      Width = 99
      Height = 26
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Shape3: TUniPanel
        Left = 3
        Top = 7
        Width = 11
        Height = 11
        Hint = 'Ready for Shipping'
        ShowHint = True
        TabOrder = 1
        Caption = ''
      end
      object Shape4: TUniPanel
        Left = 17
        Top = 7
        Width = 11
        Height = 11
        Hint = 'Not Ready for Shipping'
        ShowHint = True
        TabOrder = 2
        Caption = ''
      end
      object Shape6: TUniPanel
        Left = 32
        Top = 7
        Width = 11
        Height = 11
        Hint = 'Possibly Available'
        ShowHint = True
        TabOrder = 3
        Caption = ''
      end
      object Shape9: TUniPanel
        Left = 62
        Top = 7
        Width = 11
        Height = 11
        Hint = 'Belongs To Selected Wave'
        ShowHint = True
        TabOrder = 4
        Caption = ''
      end
      object Shape1: TUniPanel
        Left = 77
        Top = 7
        Width = 11
        Height = 11
        Hint = 'Item is on Hold'
        ShowHint = True
        TabOrder = 5
        Caption = ''
      end
      object Shape2: TUniPanel
        Left = 47
        Top = 7
        Width = 11
        Height = 11
        Hint = 'Belongs To Another Wave'
        ShowHint = True
        TabOrder = 6
        Caption = ''
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 420
    Top = 108
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
    ModuleName = 'FrmWavePickDlg'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 191674 $'
    BuildVersion = '176554'
    Left = 452
    Top = 108
  end
  object SrcReleases: TDataSource
    DataSet = QryReleases
    Left = 372
    Top = 108
  end
  object QryReleases: TFDQuery
    Tag = 1
    BeforeOpen = AssignParams
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select gtt.id,  /* this is releases_id */'
      '       gtt.inv_avail,'
      '       d.arinvt_id,'
      '       d.orders_id,'
      '       r.ord_detail_id,'
      '       r.id as release_id,'
      '       nvl(r.quan,0) - nvl(r.shipped_quan,0) as ship_quan,'
      '       r.must_ship_date as ship_date,'
      '       decode( a.id, null, '#39'Misc Item'#39',  a.itemno ) as itemno,'
      '       decode( a.id, null, d.misc_item, a.descrip ) as descrip,'
      '       a.descrip2,'
      '       a.rev,'
      '       a.eplant_id,'
      '       o.orderno,'
      '       o.pono,'
      '       r.ran,'
      '       d.onhold,'
      '       d.shiphold,'
      '       d.kbtrigger,'
      '       nvl(r.freight_id, o.freight_id) as freight_id,'
      
        '       (nvl(r.quan,0) - nvl(r.shipped_quan,0)) * NVL(d.uom_facto' +
        'r,1) as ship_quan_native,'
      '       d.unit as oe_unit,'
      '       a.unit as arinvt_unit,'
      
        '       (select descrip from freight where id = nvl(r.freight_id,' +
        ' o.freight_id)) as ship_via,'
      '       d.in_transit_partno_id,'
      '       a.onhand,'
      '       a.phantom,'
      '       a.phantom_components_on_so,'
      
        '       wave_misc.find_assigned_wave_pick_id( r.id, :wave_pick_id' +
        ' ) as wave_pick_id,'
      '       a.standard_id,'
      '       r.expedite,'
      '       arcusto.company,'
      '       s.attn as ship_to_attn,'
      '       r.request_date'
      '  from '
      '       gtt_wave_pick_releases gtt,'
      '       releases r,'
      '       arinvt a,'
      '       ship_to s,'
      '       ord_detail d,'
      '       orders o,'
      '       arcusto'
      ' where '
      '       gtt.id = r.id'
      '   and r.ord_detail_id = d.id'
      '   and d.arinvt_id = a.id(+)'
      '   and d.orders_id = o.id'
      '   and nvl(r.ship_to_id, o.ship_to_id) = s.id'
      '   and o.arcusto_id = arcusto.id(+)'
      ''
      '')
    Left = 372
    Top = 140
    ParamData = <
      item
        Name = 'wave_pick_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryReleasesARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Size = 0
    end
    object QryReleasesRELEASE_ID: TBCDField
      FieldName = 'RELEASE_ID'
      Size = 0
    end
    object QryReleasesSHIP_QUAN: TFMTBCDField
      DisplayLabel = 'Backlog Qty'
      FieldName = 'SHIP_QUAN'
      Origin = 'nvl(r.quan,0) - nvl(r.shipped_quan,0)'
      Size = 38
    end
    object QryReleasesSHIP_DATE: TDateTimeField
      DisplayLabel = 'Ship Date'
      FieldName = 'SHIP_DATE'
      Origin = 'r.must_ship_date'
    end
    object QryReleasesITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Origin = 'decode( a.id, null, '#39'Misc Item'#39',  a.itemno )'
      Size = 50
    end
    object QryReleasesDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 100
      FieldName = 'DESCRIP'
      Origin = 'decode( a.id, null, d.misc_item, a.descrip )'
      Size = 250
    end
    object QryReleasesDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 60
      FieldName = 'DESCRIP2'
      Origin = 'a.descrip2'
      Size = 100
    end
    object QryReleasesREV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      Origin = 'a.rev'
      FixedChar = True
      Size = 15
    end
    object QryReleasesEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'a.eplant_id'
      Size = 0
    end
    object QryReleasesORDERNO: TStringField
      DisplayLabel = 'Order #'
      FieldName = 'ORDERNO'
      Origin = 'o.orderno'
      Size = 15
    end
    object QryReleasesPONO: TStringField
      DisplayLabel = 'PO #'
      FieldName = 'PONO'
      Origin = 'o.pono'
      Size = 35
    end
    object QryReleasesRAN: TStringField
      DisplayLabel = 'RAN #'
      FieldName = 'RAN'
      Origin = 'r.ran'
      Size = 30
    end
    object QryReleasesONHOLD: TStringField
      DisplayLabel = 'On Hold'
      FieldName = 'ONHOLD'
      Origin = 'd.onhold'
      FixedChar = True
      Size = 1
    end
    object QryReleasesSHIPHOLD: TStringField
      FieldName = 'SHIPHOLD'
      Origin = ' d.shiphold'
      Size = 1
    end
    object QryReleasesKBTRIGGER: TStringField
      DisplayLabel = 'KB Trigger'
      FieldName = 'KBTRIGGER'
      Origin = 'd.kbtrigger'
      Size = 30
    end
    object QryReleasesFREIGHT_ID: TFMTBCDField
      FieldName = 'FREIGHT_ID'
      Size = 38
    end
    object QryReleasesSHIP_VIA: TStringField
      DisplayLabel = 'Ship Via'
      FieldName = 'SHIP_VIA'
      Origin = 
        '(select descrip from freight where id = nvl(r.freight_id, o.frei' +
        'ght_id))'
      Size = 60
    end
    object QryReleasesSHIP_QUAN_NATIVE: TFMTBCDField
      DisplayLabel = 'Backlog Native Qty'
      FieldName = 'SHIP_QUAN_NATIVE'
      Origin = '(nvl(r.quan,0) - nvl(r.shipped_quan,0)) * NVL(d.uom_factor,1)'
      Size = 38
    end
    object QryReleasesOE_UNIT: TStringField
      DisplayLabel = 'OE UOM'
      FieldName = 'OE_UNIT'
      Origin = 'd.unit '
      Size = 10
    end
    object QryReleasesARINVT_UNIT: TStringField
      DisplayLabel = 'Native UOM'
      FieldName = 'ARINVT_UNIT'
      Origin = 'a.unit'
      Size = 10
    end
    object QryReleasesIN_TRANSIT_PARTNO_ID: TBCDField
      FieldName = 'IN_TRANSIT_PARTNO_ID'
      Size = 0
    end
    object QryReleasesONHAND: TBCDField
      DisplayLabel = 'On Hand'
      FieldName = 'ONHAND'
      Origin = 'a.onhand'
    end
    object QryReleasesPHANTOM: TStringField
      FieldName = 'PHANTOM'
      Origin = 'a.phantom'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryReleasesPHANTOM_COMPONENTS_ON_SO: TStringField
      FieldName = 'PHANTOM_COMPONENTS_ON_SO'
      Origin = 'a.phantom_components_on_so'
      Visible = False
      Size = 1
    end
    object QryReleasesWAVE_PICK_ID: TFMTBCDField
      DisplayLabel = 'Wave #'
      FieldName = 'WAVE_PICK_ID'
      Origin = 'wave_misc.find_assigned_wave_pick_id( r.id, :wave_pick_id )'
      Size = 38
    end
    object QryReleasesSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QryReleasesEXPEDITE: TStringField
      DisplayLabel = 'Expedite'
      FieldName = 'EXPEDITE'
      Origin = 'r.expedite'
      Size = 1
    end
    object QryReleasesINV_AVAIL: TBCDField
      FieldName = 'INV_AVAIL'
      Visible = False
      Size = 0
    end
    object QryReleasesID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryReleasesORDERS_ID: TBCDField
      FieldName = 'ORDERS_ID'
      Visible = False
      Size = 0
    end
    object QryReleasesORD_DETAIL_ID: TBCDField
      FieldName = 'ORD_DETAIL_ID'
      Size = 0
    end
    object QryReleasesCOMPANY: TStringField
      DisplayLabel = 'Customer'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Origin = 'arcusto.company'
      Size = 60
    end
    object QryReleasesSHIP_TO_ATTN: TStringField
      DisplayLabel = 'Ship to'
      DisplayWidth = 30
      FieldName = 'SHIP_TO_ATTN'
      Origin = 's.attn'
      Size = 60
    end
    object QryReleasesREQUEST_DATE: TDateTimeField
      DisplayLabel = 'Request Date'
      FieldName = 'REQUEST_DATE'
      Origin = ' r.request_date'
    end
  end
  object PopupMenu3: TUniPopupMenu
    Left = 372
    Top = 176
    object MenuItem4: TUniMenuItem
      Caption = 'Jump To Inventory'
      OnClick = MenuItem4Click
    end
    object MenuItem5: TUniMenuItem
      Caption = 'Jump To Sales Order'
      OnClick = MenuItem5Click
    end
    object MenuItem6: TUniMenuItem
      Caption = 'Jump To BOM'
      OnClick = MenuItem6Click
    end
  end
  object IQJumpInv3: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = SrcReleases
    JumpTo = jtInventory
    Left = 372
    Top = 204
  end
  object IQJumpOe3: TIQWebJump
    DataField = 'ORD_DETAIL_ID'
    DataSource = SrcReleases
    JumpTo = jtSalesOrderDetail
    Left = 372
    Top = 232
  end
  object IQJumpBom3: TIQWebJump
    DataField = 'STANDARD_ID'
    DataSource = SrcReleases
    JumpTo = jtBom
    Left = 372
    Top = 260
  end
end
