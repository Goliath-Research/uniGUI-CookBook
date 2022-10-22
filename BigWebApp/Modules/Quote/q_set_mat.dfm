object FrmQSetMatInfo: TFrmQSetMatInfo
  Left = 0
  Top = 0
  HelpContext = 22757
  ClientHeight = 392
  ClientWidth = 713
  Caption = 'Component Quantity Information'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 264
    Width = 713
    Height = 4
    Cursor = crVSplit
    Hint = ''
    Align = alBottom
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 713
    Height = 37
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Label1: TUniLabel
      Left = 8
      Top = 12
      Width = 51
      Height = 13
      Hint = ''
      Caption = 'Quote Qty'
      TabOrder = 2
    end
    object wwDBLookupComboQuoteQty: TUniDBLookupComboBox
      Left = 77
      Top = 8
      Width = 181
      Height = 21
      Hint = ''
      ListFieldIndex = 0
      TabOrder = 0
      Color = clWindow
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 37
    Width = 713
    Height = 227
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 711
      Height = 225
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 494
      IQComponents.Grid.Height = 139
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcQSetMat
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
      IQComponents.Navigator.DataSource = SrcQSetMat
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 494
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 139
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcQSetMat
      Columns = <
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
          FieldName = 'QUAN'
          Title.Caption = 'Qty Required'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MIN_ORDER_QTY'
          Title.Caption = 'Min Order Qty'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EXCESS'
          Title.Caption = 'Excess'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      Marker = 0
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 268
    Width = 713
    Height = 124
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object wwDataInspector1: TwwDataInspector
      Left = 1
      Top = 1
      Width = 711
      Height = 122
      DisableThemes = False
      Align = alClient
      PopupMenu = PopupMenu1
      TabOrder = 1
      DataSource = SrcQSetMat
      Items = <
        item
          DataSource = SrcQSetMat
          DataField = 'DESCRIP2'
          Caption = 'Ext Description'
          WordWrap = False
        end
        item
          DataSource = SrcQSetMat
          DataField = 'CLASS'
          Caption = 'Class'
          WordWrap = False
        end
        item
          DataSource = SrcQSetMat
          DataField = 'REV'
          Caption = 'Rev'
          WordWrap = False
        end
        item
          DataSource = SrcQSetMat
          DataField = 'ONHAND'
          Caption = 'On Hand Qty'
          WordWrap = False
        end
        item
          DataSource = SrcQSetMat
          DataField = 'NON_COMMITTED'
          Caption = 'Non Commited Qty'
          WordWrap = False
        end>
      DefaultRowHeight = 20
      CaptionWidth = 118
      Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      LineStyleCaption = ovDottedLine
      LineStyleData = ovDottedLine
      ReadOnly = True
      ExplicitLeft = 2
      ExplicitTop = 2
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 224
    Top = 93
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
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmQSetMatInfo'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195758 $'
    BuildVersion = '176554'
    Left = 224
    Top = 125
  end
  object QryQSetPrice: TFDQuery
    BeforeOpen = QryQSetPriceBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, quan '
      '  from qset_price'
      ' where quote_id = :quote_id'
      ' order by quan ')
    Left = 44
    Top = 109
    ParamData = <
      item
        Name = 'QUOTE_ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryQSetPriceQUAN: TBCDField
      DisplayLabel = 'Quantity'
      DisplayWidth = 11
      FieldName = 'QUAN'
      Origin = 'QUAN'
      Precision = 10
      Size = 0
    end
    object QryQSetPriceID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object SrcQSetPrice: TDataSource
    DataSet = QryQSetPrice
    Left = 46
    Top = 80
  end
  object QryQSetMat: TFDQuery
    MasterSource = SrcQSetPrice
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select m.id,'
      '       m.qset_price_id,'
      '       m.qinvt_id,'
      '       m.quan, '
      '       q.itemno, '
      '       q.descrip,'
      '       q.descrip2,'
      '       q.class,'
      '       q.rev,'
      '       a.onhand,'
      
        '       round(inv_misc.GetNonCommited( a.id ), 2) as non_committe' +
        'd,'
      '       a.min_order_qty,'
      
        '       decode( a.min_order_qty, null, to_number(null), greatest(' +
        ' 0, nvl(m.quan,0) - a.min_order_qty)) as excess,'
      '       q.arinvt_id'
      '  from qset_mat m, '
      '       qinvt q,'
      '       arinvt a'
      ' where m.qset_price_id = :id'
      '   and m.qinvt_id = q.id'
      '   and q.arinvt_id = a.id(+)')
    Left = 76
    Top = 110
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryQSetMatITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'ITEMNO'
      Required = True
      FixedChar = True
      Size = 50
    end
    object QryQSetMatDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 100
    end
    object QryQSetMatQUAN: TStringField
      DisplayLabel = 'Qty Required'
      DisplayWidth = 20
      FieldName = 'QUAN'
      Origin = 'QUAN'
    end
    object QryQSetMatMIN_ORDER_QTY: TBCDField
      DisplayLabel = 'Min Order Qty'
      DisplayWidth = 15
      FieldName = 'MIN_ORDER_QTY'
      Origin = 'MIN_ORDER_QTY'
      Precision = 14
    end
    object QryQSetMatEXCESS: TFMTBCDField
      DisplayLabel = 'Excess'
      FieldName = 'EXCESS'
      Origin = 'EXCESS'
      Precision = 38
      Size = 38
    end
    object QryQSetMatID: TBCDField
      DisplayWidth = 16
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryQSetMatQSET_PRICE_ID: TBCDField
      DisplayWidth = 16
      FieldName = 'QSET_PRICE_ID'
      Origin = 'QSET_PRICE_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryQSetMatQINVT_ID: TBCDField
      DisplayWidth = 16
      FieldName = 'QINVT_ID'
      Origin = 'QINVT_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryQSetMatDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'DESCRIP2'
      Visible = False
      Size = 100
    end
    object QryQSetMatCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'CLASS'
      Required = True
      Visible = False
      FixedChar = True
      Size = 2
    end
    object QryQSetMatREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'REV'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object QryQSetMatONHAND: TBCDField
      DisplayLabel = 'On Hand'
      DisplayWidth = 15
      FieldName = 'ONHAND'
      Origin = 'ONHAND'
      Visible = False
      Precision = 14
    end
    object QryQSetMatNON_COMMITTED: TFMTBCDField
      DisplayLabel = 'Non Commited'
      DisplayWidth = 39
      FieldName = 'NON_COMMITTED'
      Origin = 'NON_COMMITTED'
      Visible = False
      Precision = 38
      Size = 38
    end
    object QryQSetMatARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'ARINVT_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object SrcQSetMat: TDataSource
    DataSet = QryQSetMat
    Left = 76
    Top = 80
  end
  object PopupMenu1: TUniPopupMenu
    Left = 208
    Top = 324
    object JumpToInventory1: TUniMenuItem
      Caption = 'Jump To Inventory'
      OnClick = JumpToInventory1Click
    end
  end
  object IQJumpInv: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = SrcQSetMat
    JumpTo = jtInventory
    Left = 240
    Top = 326
  end
end
