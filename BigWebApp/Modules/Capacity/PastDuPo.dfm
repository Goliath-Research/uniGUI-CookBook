object FrmPastDuePOs: TFrmPastDuePOs
  Left = 380
  Top = 205
  ClientHeight = 251
  ClientWidth = 403
  Caption = 'Past-Due Purchase Orders'
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 119
    Width = 403
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object DBGrid1: TUniDBGrid
    Left = 0
    Top = 27
    Width = 403
    Height = 92
    Hint = ''
    DataSource = DataSource1
    LoadMask.Message = 'Loading data...'
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Columns = <
      item
        FieldName = 'PONO'
        Title.Caption = 'PO #'
        Width = 214
      end
      item
        FieldName = 'VENDORNO'
        Title.Caption = 'Vendor #'
        Width = 93
      end
      item
        FieldName = 'TOTAL_QTY_ORD'
        Title.Caption = 'Total Ordered'
        Width = 90
      end
      item
        FieldName = 'QTY_RECEIVED'
        Title.Caption = 'Quantity Received'
        Width = 101
      end>
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 403
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object DBNavigator1: TUniDBNavigator
      Left = 303
      Top = 1
      Width = 100
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = DataSource1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object PnlDetail: TUniPanel
    Tag = 1999
    Left = 0
    Top = 122
    Width = 403
    Height = 129
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object PnlDetailCaption: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 401
      Height = 20
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clWhite
      TabOrder = 0
      Caption = ''
      Color = clBtnShadow
      object Label4: TUniLabel
        Left = 1
        Top = 1
        Width = 51
        Height = 13
        Hint = ''
        Caption = 'Releases'
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object PnlDetailGrid: TUniPanel
      Tag = 1999
      Left = 1
      Top = 20
      Width = 401
      Height = 109
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object DBGrid2: TUniDBGrid
        Left = 1
        Top = 1
        Width = 399
        Height = 107
        Hint = ''
        DataSource = SrcPOReleases
        LoadMask.Message = 'Loading data...'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Columns = <
          item
            FieldName = 'SEQ'
            Title.Caption = '#'
            Width = 64
          end
          item
            FieldName = 'QUAN'
            Title.Caption = 'Quantity'
            Width = 73
          end
          item
            FieldName = 'REQUEST_DATE'
            Title.Caption = 'Request Date'
            Width = 95
          end
          item
            FieldName = 'PROMISE_DATE'
            Title.Caption = 'Promise Date'
            Width = 91
          end>
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 24
    Top = 72
  end
  object Query1: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select p.pono,'
      '       v.vendorno,'
      '       p.id as po_id,'
      '       d.id as detail_id, '
      '       rel_total.quan as total_qty_ord,'
      '       r.qty_received'
      '  from po_detail d,'
      '       c_po_receipts_total r,'
      '       c_po_releases_total rel_total,'
      '       po p,'
      '       vendor v'
      ' where d.id in( select d2.id '
      '                  from po_detail d2, po_releases r2'
      '                 where d2.arinvt_id = :Arinvt_id'
      '                   and d2.id = r2.po_detail_id(+)'
      '                   and NVL(r2.promise_date, SYSDATE) <= :ADate'
      '                   and NVL(d2.closed, '#39'N'#39') = '#39'N'#39' )'
      '   and d.id = r.po_detail_id(+)'
      '   and d.id = rel_total.po_detail_id(+)'
      '   and NVL(r.qty_received,0) <> NVL(rel_total.quan,0)'
      '   and p.id = d.po_id'
      '   and p.vendor_id = v.id'
      '')
    Left = 80
    Top = 72
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ADate'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object Query1PONO: TStringField
      FieldName = 'PONO'
      Size = 35
    end
    object Query1VENDORNO: TStringField
      FieldName = 'VENDORNO'
      Size = 10
    end
    object Query1PO_ID: TBCDField
      FieldName = 'PO_ID'
      Size = 0
    end
    object Query1DETAIL_ID: TBCDField
      FieldName = 'DETAIL_ID'
      Size = 0
    end
    object Query1TOTAL_QTY_ORD: TBCDField
      FieldName = 'TOTAL_QTY_ORD'
    end
    object Query1QTY_RECEIVED: TBCDField
      FieldName = 'QTY_RECEIVED'
    end
  end
  object popPO: TUniPopupMenu
    Left = 112
    Top = 80
    object JumptoInventory1: TUniMenuItem
      Caption = 'Jump to PO'
      OnClick = JumptoInventory1Click
    end
  end
  object SrcPOReleases: TDataSource
    DataSet = QryPOReleases
    Left = 168
    Top = 72
  end
  object QryPOReleases: TFDQuery
    MasterSource = DataSource1
    MasterFields = 'DETAIL_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       seq,'
      '       request_date,'
      '       promise_date,'
      '       quan'
      '  from po_releases'
      ' where po_detail_id = :detail_id'
      ' order by seq'
      ' ')
    Left = 216
    Top = 72
    ParamData = <
      item
        Name = 'DETAIL_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryPOReleasesID: TBCDField
      FieldName = 'ID'
      Origin = 'PO_RELEASES.ID'
      Visible = False
      Size = 0
    end
    object QryPOReleasesSEQ: TBCDField
      DisplayLabel = '#'
      FieldName = 'SEQ'
      Origin = 'PO_RELEASES.SEQ'
      Size = 0
    end
    object QryPOReleasesQUAN: TBCDField
      DisplayLabel = 'Qty'
      FieldName = 'QUAN'
      Origin = 'PO_RELEASES.QUAN'
    end
    object QryPOReleasesREQUEST_DATE: TDateTimeField
      DisplayLabel = 'Request Date'
      FieldName = 'REQUEST_DATE'
      Origin = 'PO_RELEASES.REQUEST_DATE'
    end
    object QryPOReleasesPROMISE_DATE: TDateTimeField
      DisplayLabel = 'Promise Date'
      FieldName = 'PROMISE_DATE'
      Origin = 'PO_RELEASES.PROMISE_DATE'
    end
  end
end
