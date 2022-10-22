object FrmItemInfo: TFrmItemInfo
  Left = 326
  Top = 170
  HelpContext = 1327363
  ClientHeight = 382
  ClientWidth = 441
  Caption = 'Item Information'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 176
    Width = 441
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 441
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnFilter: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Filter'
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
      OnClick = sbtnFilterClick
    end
    object Panel4: TUniPanel
      Left = 415
      Top = 1
      Width = 25
      Height = 25
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object sbtnRefresh1: TUniSpeedButton
        Left = 0
        Top = 0
        Width = 25
        Height = 25
        Hint = 'Refresh'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          46010000424D460100000000000076000000280000001C0000000D0000000100
          040000000000D000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333FFFFF3333000033333707333333333FF3337733330000333700733333
          3333733337333333000033300733333333337333733333330000337073333333
          3337333F3333333300003300333333333337333F3FFFFFF30000330033300000
          3337333F733333F300003300733370003337333F373333F30000337007370000
          33373333F33333F3000033300000007033337333333373F30000333370007330
          33333733333773F3000033333333333333333377777337330000333333333333
          33333333333333330000}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = DoRefresh
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 27
    Width = 441
    Height = 149
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = 'pnlArinvt'
    object srchArinvt: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 439
      Height = 147
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 222
      IQComponents.Grid.Height = 61
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = wwSrcArinvt
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
      IQComponents.Navigator.DataSource = wwSrcArinvt
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 222
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 61
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = wwSrcArinvt
      Columns = <
        item
          FieldName = 'CLASS'
          Title.Caption = 'Class'
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
          FieldName = 'REV'
          Title.Caption = 'Revision'
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
          FieldName = 'UNIT'
          Title.Caption = 'UOM'
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
          FieldName = 'DESCRIP2'
          Title.Caption = 'Extended Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MFGNO'
          Title.Caption = 'Manufacturing #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      Marker = 0
    end
  end
  object pgctrlDetails: TUniPageControl
    Left = 0
    Top = 206
    Width = 441
    Height = 176
    Hint = ''
    ActivePage = shPurchased
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    TabStop = False
    OnChange = pgctrlDetailsChange
    object shPurchased: TUniTabSheet
      Hint = ''
      Caption = 'Purchase Orders'
      object srchPO: TIQUniGridControl
        Left = 0
        Top = 0
        Width = 433
        Height = 148
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 216
        IQComponents.Grid.Height = 62
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = wwSrcPO
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
        IQComponents.Navigator.DataSource = wwSrcPO
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 216
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
        DataSource = wwSrcPO
        Columns = <
          item
            FieldName = 'PONO'
            Title.Caption = 'PO #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TOTAL_QTY_ORD'
            Title.Caption = 'Quantity Ordered'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'QTY_RECEIVED'
            Title.Caption = 'Quantity Received'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'UNIT_PRICE'
            Title.Caption = 'Unit Price'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PRICE_PER_1000'
            Title.Caption = 'Price/1000'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PO_DATE'
            Title.Caption = 'PO Date'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'VENDORNO'
            Title.Caption = 'Vendor #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'VENDOR_NAME'
            Title.Caption = 'Vendor Name'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CONFIRM_TO'
            Title.Caption = 'Confirm To'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'STATUS'
            Title.Caption = 'Status'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SOURCE'
            Title.Caption = 'Source'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ArcRec'
            Title.Caption = 'Archived Received Quantity'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
      end
    end
    object shManufactured: TUniTabSheet
      Hint = ''
      ImageIndex = 1
      Caption = 'Sales Orders'
      object srchSO: TIQUniGridControl
        Left = 0
        Top = 0
        Width = 433
        Height = 148
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 216
        IQComponents.Grid.Height = 62
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = wwSrcMfg
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
        IQComponents.Navigator.DataSource = wwSrcMfg
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 216
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
        DataSource = wwSrcMfg
        Columns = <
          item
            FieldName = 'ORDERNO'
            Title.Caption = 'Order #'
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
            FieldName = 'CUMM_SHIPPED'
            Title.Caption = 'Shipped'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'UNIT_PRICE'
            Title.Caption = 'Unit Price'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DATE_TAKEN'
            Title.Caption = 'Order Date'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSTNO'
            Title.Caption = 'Customer #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'COMPANY'
            Title.Caption = 'Customer Name'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SOURCE'
            Title.Caption = 'Source'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PRICE_PER_1000'
            Title.Caption = 'Price/1000'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TOTAL_QTY_ORD'
            Title.Caption = 'Blanket Quantity'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
      end
    end
    object TabRMA: TUniTabSheet
      Hint = ''
      ImageIndex = 2
      Caption = 'RMA'
      object srchRMA: TIQUniGridControl
        Left = 0
        Top = 0
        Width = 433
        Height = 148
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 216
        IQComponents.Grid.Height = 62
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcRMA
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
        IQComponents.Navigator.DataSource = SrcRMA
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 216
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
        DataSource = SrcRMA
        Columns = <
          item
            FieldName = 'RMANO'
            Title.Caption = 'RMA #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'RMA_DATE'
            Title.Caption = 'RMA Date'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CLOSED'
            Title.Caption = 'Closed'
            Width = 64
            CheckBoxField.FieldValues = 'Y;N'
          end
          item
            FieldName = 'QTYRETURNED'
            Title.Caption = 'Qty. Returned'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSTNO'
            Title.Caption = 'Customer #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'COMPANY'
            Title.Caption = 'Customer Name'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'QTY_RECEIVED'
            Title.Caption = 'Qty. Returned'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
      end
    end
    object TabVendRMA: TUniTabSheet
      Hint = ''
      ImageIndex = 3
      Caption = 'Vendor RMA'
      object srchVendRMA: TIQUniGridControl
        Left = 0
        Top = 0
        Width = 433
        Height = 148
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 216
        IQComponents.Grid.Height = 62
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcVendRMA
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
        IQComponents.Navigator.DataSource = SrcVendRMA
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 216
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
        DataSource = SrcVendRMA
        Columns = <
          item
            FieldName = 'RMANO'
            Title.Caption = 'RMA #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'RMA_DATE'
            Title.Caption = 'RMA Date'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CLOSED'
            Title.Caption = 'Closed'
            Width = 64
            CheckBoxField.FieldValues = 'Y;N'
          end
          item
            FieldName = 'QTY_TO_RETURN'
            Title.Caption = 'Qty. To Return'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'VENDORNO'
            Title.Caption = 'Vendor #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'COMPANY'
            Title.Caption = 'Vendor Name'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'QTY_RETURNED'
            Title.Caption = 'Qty. Returned'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 179
    Width = 441
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
    object Panel5: TUniPanel
      Left = 415
      Top = 1
      Width = 25
      Height = 25
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object sbtnRefresh2: TUniSpeedButton
        Left = 0
        Top = 0
        Width = 25
        Height = 25
        Hint = 'Refresh'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          46010000424D460100000000000076000000280000001C0000000D0000000100
          040000000000D000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333FFFFF3333000033333707333333333FF3337733330000333700733333
          3333733337333333000033300733333333337333733333330000337073333333
          3337333F3333333300003300333333333337333F3FFFFFF30000330033300000
          3337333F733333F300003300733370003337333F373333F30000337007370000
          33373333F33333F3000033300000007033337333333373F30000333370007330
          33333733333773F3000033333333333333333377777337330000333333333333
          33333333333333330000}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = DoRefresh
      end
    end
  end
  object wwSrcArinvt: TDataSource
    DataSet = wwQryArinvt
    OnDataChange = wwSrcArinvtDataChange
    Left = 32
    Top = 100
  end
  object wwQryArinvt: TFDQuery
    BeforeOpen = wwQryArinvtBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select arinvt.id as arinvt_id,'
      '       arinvt.class,'
      '       arinvt.itemno,'
      '       arinvt.rev,'
      '       arinvt.descrip,'
      '       arinvt.descrip2,'
      '       arinvt.unit,'
      '       arinvt.eplant_id,'
      '       arinvt.standard_id,'
      '       standard.mfgno'
      '  from arinvt,'
      '       standard'
      ' where arinvt.standard_id = standard.id(+)'
      '   and'
      '       (:type = 0'
      '        or'
      '        :type = 1 and arinvt.standard_id is NULL'
      '        or'
      '        :type = 2 and arinvt.standard_id is not NULL)'
      ''
      ' '
      ' '
      ' ')
    Left = 32
    Top = 120
    ParamData = <
      item
        Name = 'type'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQryArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 5
      FieldName = 'CLASS'
      Origin = 'ARINVT.CLASS'
      Size = 2
    end
    object wwQryArinvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 18
      FieldName = 'ITEMNO'
      Origin = 'ARINVT.ITEMNO'
      Size = 50
    end
    object wwQryArinvtREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 11
      FieldName = 'REV'
      Origin = 'ARINVT.REV'
      Size = 15
    end
    object wwQryArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 18
      FieldName = 'DESCRIP'
      Origin = 'ARINVT.DESCRIP'
      Size = 100
    end
    object wwQryArinvtUNIT: TStringField
      DisplayLabel = 'UOM'
      DisplayWidth = 6
      FieldName = 'UNIT'
      Origin = 'ARINVT.UNIT'
      Size = 10
    end
    object wwQryArinvtEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 8
      FieldName = 'EPLANT_ID'
      Origin = 'ARINVT.EPLANT_ID'
      Size = 0
    end
    object wwQryArinvtDESCRIP2: TStringField
      DisplayLabel = 'Extended Description'
      DisplayWidth = 19
      FieldName = 'DESCRIP2'
      Origin = 'ARINVT.DESCRIP2'
      Size = 100
    end
    object wwQryArinvtMFGNO: TStringField
      DisplayLabel = 'Manufacturing #'
      DisplayWidth = 15
      FieldName = 'MFGNO'
      Origin = 'standard.mfgno'
      Size = 50
    end
    object wwQryArinvtARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'ARINVT.ID'
      Visible = False
      Size = 0
    end
    object wwQryArinvtSTANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'STANDARD_ID'
      Origin = 'arinvt.standard_id'
      Visible = False
      Size = 0
    end
  end
  object wwSrcPO: TDataSource
    DataSet = wwQryPO
    Left = 20
    Top = 264
  end
  object wwQryPO: TFDQuery
    BeforeOpen = wwQryPOBeforeOpen
    OnCalcFields = wwQryPOCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.pono,'
      '       v.po_id,'
      '       v.po_detail_id,'
      '       v.arinvt_id,'
      '       v.total_qty_ord,'
      '       r.qty_received,'
      '       v.unit_price,'
      '       v.price_per_1000,'
      '       v.po_date,'
      '       v.vendor_id,'
      '       ven.vendorno,'
      '       ven.company as vendor_name,'
      '       v.confirm_to,'
      '       decode(v.closed, '#39'Y'#39', '#39'Closed'#39', '#39'Open'#39') as status,'
      '       v.source'
      '  from v_po_comb v,'
      '       c_po_receipts_total r,'
      '       vendor ven'
      ' where v.po_detail_id = r.po_detail_id(+)'
      '   and v.vendor_id = ven.id(+)'
      '   and v.arinvt_id = :arinvt_id'
      '   and'
      '       (:source = 0'
      '        or'
      '        :source = 1 and v.source = '#39'CURRENT'#39
      '        or'
      '        :source = 2 and v.source = '#39'ARCHIVED'#39')'
      '   and'
      '       v.po_date between :date1 and :date2'
      '   and'
      '       (:status = 0'
      '        or'
      '        :status = 1 and NVL(v.closed, '#39'N'#39') = '#39'N'#39
      '        or'
      '        :status = 2 and NVL(v.closed, '#39'N'#39') = '#39'Y'#39')'
      '   and'
      '       (:vendor_id = 0'
      '        or'
      '        :vendor_id = v.vendor_id)'
      '')
    Left = 20
    Top = 280
    ParamData = <
      item
        Name = 'ARINVT_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'source'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'date1'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'date2'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'status'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'vendor_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQryPOPONO: TStringField
      DisplayLabel = 'PO #'
      DisplayWidth = 7
      FieldName = 'PONO'
      Origin = 'v.pono'
      Size = 35
    end
    object wwQryPOTOTAL_QTY_ORD: TBCDField
      DisplayLabel = 'Quantity Ordered'
      DisplayWidth = 11
      FieldName = 'TOTAL_QTY_ORD'
      Origin = 'v.total_qty_ord'
    end
    object wwQryPOQTY_RECEIVED: TBCDField
      DisplayLabel = 'Quantity Received'
      DisplayWidth = 11
      FieldName = 'QTY_RECEIVED'
      Origin = 'r.qty_received'
    end
    object wwQryPOUNIT_PRICE: TFMTBCDField
      DisplayLabel = 'Unit Price'
      DisplayWidth = 10
      FieldName = 'UNIT_PRICE'
      Origin = 'v.unit_price'
      DisplayFormat = '########0.000000'
      Size = 6
    end
    object wwQryPOPRICE_PER_1000: TFMTBCDField
      DisplayLabel = 'Price/1000'
      DisplayWidth = 13
      FieldName = 'PRICE_PER_1000'
      Origin = 'v.price_per_1000'
      DisplayFormat = '########0.000000'
      Size = 6
    end
    object wwQryPOPO_DATE: TDateTimeField
      DisplayLabel = 'PO Date'
      DisplayWidth = 11
      FieldName = 'PO_DATE'
      Origin = 'v.po_date'
    end
    object wwQryPOVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      DisplayWidth = 8
      FieldName = 'VENDORNO'
      Origin = 'ven.vendorno'
      Size = 10
    end
    object wwQryPOVENDOR_NAME: TStringField
      DisplayLabel = 'Vendor Name'
      DisplayWidth = 18
      FieldName = 'VENDOR_NAME'
      Origin = 'ven.company'
      Size = 60
    end
    object wwQryPOCONFIRM_TO: TStringField
      DisplayLabel = 'Confirm To'
      DisplayWidth = 14
      FieldName = 'CONFIRM_TO'
      Origin = 'v.confirm_to'
      Size = 50
    end
    object wwQryPOSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 7
      FieldName = 'STATUS'
      Origin = 'decode(v.closed, '#39'Y'#39', '#39'Closed'#39', '#39'Open'#39')'
      Size = 6
    end
    object wwQryPOSOURCE: TStringField
      DisplayLabel = 'Source'
      DisplayWidth = 11
      FieldName = 'SOURCE'
      Origin = 'v.source'
      Size = 8
    end
    object wwQryPOArcRec: TFloatField
      DisplayLabel = 'Archived Received Quantity'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'ArcRec'
      Calculated = True
    end
    object wwQryPOPO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PO_ID'
      Origin = 'V.PO_ID'
      Visible = False
      Size = 0
    end
    object wwQryPOPO_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PO_DETAIL_ID'
      Origin = 'v.po_detail_id'
      Visible = False
      Size = 0
    end
    object wwQryPOARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'v.arinvt_id'
      Visible = False
      Size = 0
    end
    object wwQryPOVENDOR_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'VENDOR_ID'
      Origin = 'v.vendor_id'
      Visible = False
      Size = 0
    end
  end
  object wwSrcMfg: TDataSource
    DataSet = wwQrySO
    Left = 68
    Top = 264
  end
  object wwQrySO: TFDQuery
    BeforeOpen = wwQryPOBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.orders_id,'
      '       v.ord_detail_id,'
      '       v.ORDERNO,'
      '       v.PONO,'
      '       v.CUMM_SHIPPED,'
      '       v.UNIT_PRICE,'
      '       v.DATE_TAKEN,'
      '       v.arcusto_id,'
      '       v.custno,'
      '       v.company,'
      
        '       decode(v.status, '#39'HISTORY'#39', '#39'ARCHIVED'#39', '#39'CURRENT'#39') as sou' +
        'rce,'
      '       v.total_qty_ord,'
      '       v.unit_price * 1000 as price_per_1000'
      '  from v_ord_comb v'
      ' where v.arinvt_id = :arinvt_id'
      '   and'
      '       (:source = 0'
      '        or'
      '        :source = 1 and v.status = '#39'ORDERS'#39
      '        or'
      '        :source = 2 and v.status = '#39'HISTORY'#39')'
      '   and'
      '       v.date_taken between :date1 and :date2'
      '   and'
      '       (:arcusto_id = 0'
      '        or'
      '        :arcusto_id = v.arcusto_id)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 68
    Top = 280
    ParamData = <
      item
        Name = 'ARINVT_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'source'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'date1'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'date2'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'arcusto_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQrySOORDERNO: TStringField
      DisplayLabel = 'Order #'
      DisplayWidth = 8
      FieldName = 'ORDERNO'
      Origin = 'V.ORDERNO'
      Size = 15
    end
    object wwQrySOPONO: TStringField
      DisplayLabel = 'PO #'
      DisplayWidth = 11
      FieldName = 'PONO'
      Origin = 'V.PONO'
      Size = 35
    end
    object wwQrySOCUMM_SHIPPED: TBCDField
      DisplayLabel = 'Shipped'
      DisplayWidth = 10
      FieldName = 'CUMM_SHIPPED'
      Origin = 'V.CUMM_SHIPPED'
    end
    object wwQrySOUNIT_PRICE: TFMTBCDField
      DisplayLabel = 'Unit Price'
      DisplayWidth = 10
      FieldName = 'UNIT_PRICE'
      Origin = 'V.UNIT_PRICE'
      DisplayFormat = '########0.000000'
      Size = 6
    end
    object wwQrySODATE_TAKEN: TDateTimeField
      DisplayLabel = 'Order Date'
      DisplayWidth = 10
      FieldName = 'DATE_TAKEN'
      Origin = 'V.DATE_TAKEN'
    end
    object wwQrySOCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'V.CUSTNO'
      Size = 10
    end
    object wwQrySOCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      DisplayWidth = 16
      FieldName = 'COMPANY'
      Origin = 'V.COMPANY'
      Size = 60
    end
    object wwQrySOSOURCE: TStringField
      DisplayLabel = 'Source'
      DisplayWidth = 10
      FieldName = 'SOURCE'
      Origin = 'decode(v.status, '#39'HISTORY'#39', '#39'ARCHIVED'#39', '#39'CURRENT'#39')'
      Size = 8
    end
    object wwQrySOPRICE_PER_1000: TFMTBCDField
      DisplayLabel = 'Price/1000'
      DisplayWidth = 14
      FieldName = 'PRICE_PER_1000'
      Origin = 'v.unit_price * 1000'
      DisplayFormat = '########0.000000'
      Size = 38
    end
    object wwQrySOTOTAL_QTY_ORD: TBCDField
      DisplayLabel = 'Blanket Quantity'
      DisplayWidth = 13
      FieldName = 'TOTAL_QTY_ORD'
      Origin = 'v.TOTAL_QTY_ORD'
    end
    object wwQrySOORDERS_ID: TBCDField
      FieldName = 'ORDERS_ID'
      Origin = 'v.ORDERS_ID'
      Visible = False
      Size = 0
    end
    object wwQrySOORD_DETAIL_ID: TBCDField
      FieldName = 'ORD_DETAIL_ID'
      Origin = 'v.ORD_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object wwQrySOARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Origin = 'V.ARCUSTO_ID'
      Visible = False
      Size = 0
    end
  end
  object popmPO: TUniPopupMenu
    Left = 20
    Top = 312
    object JumptoPO1: TUniMenuItem
      Caption = 'Jump to PO'
      OnClick = JumptoPO1Click
    end
    object JumptoVendor1: TUniMenuItem
      Caption = 'Jump to Vendor'
      OnClick = JumptoVendor1Click
    end
  end
  object IQJumpPO: TIQWebJump
    DataField = 'PO_DETAIL_ID'
    DataSource = wwSrcPO
    JumpTo = jtPO
    Left = 20
    Top = 336
  end
  object IQJumpVendor: TIQWebJump
    DataField = 'VENDOR_ID'
    DataSource = wwSrcPO
    JumpTo = jtVendor
    Left = 20
    Top = 352
  end
  object popmSO: TUniPopupMenu
    Left = 72
    Top = 312
    object JumptoOrder1: TUniMenuItem
      Caption = 'Jump to Sales Order'
      OnClick = JumptoOrder1Click
    end
    object JumptoCustomer1: TUniMenuItem
      Caption = 'Jump to Customer'
      OnClick = JumptoCustomer1Click
    end
  end
  object IQJumpOrdDetail: TIQWebJump
    DataField = 'ORD_DETAIL_ID'
    DataSource = wwSrcMfg
    JumpTo = jtSalesOrderDetail
    Left = 72
    Top = 336
  end
  object IQJumpCustomer: TIQWebJump
    DataField = 'ARCUSTO_ID'
    DataSource = wwSrcMfg
    JumpTo = jtCustomer
    Left = 72
    Top = 352
  end
  object SrcRMA: TDataSource
    DataSet = wwQryRMA
    Left = 116
    Top = 264
  end
  object wwQryRMA: TFDQuery
    BeforeOpen = wwQryRMABeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select r.id as rma_id,'
      '       r.rmano,'
      '       r.arcusto_id,'
      '       r.rma_date,'
      '       r.userid,'
      '       r.closed,'
      '       d.id as rma_detail_id,'
      '       d.arinvt_id,'
      '       d.qtyreturned,'
      '       t.qty_received,'
      '       a.custno,'
      '       a.company'
      '  from rma r,'
      '       rma_detail d,'
      '       arcusto a,'
      '       v_rma_receipts_total t,'
      '       shipment_dtl s,'
      '       (select id, arinvt_id'
      '          from ord_detail'
      '         where arinvt_id = :arinvt_id'
      '         union all'
      '        select id, arinvt_id'
      '          from hist_ord_detail'
      '         where arinvt_id = :arinvt_id) v'
      ' where d.rma_id = r.id'
      '   and d.shipment_dtl_id = s.id(+)'
      '   and d.id = t.rma_detail_id(+)'
      '   and s.order_dtl_id = v.id(+)'
      '   and r.rma_date between :date1 and :date2'
      '   and NVL(d.arinvt_id, v.arinvt_id) = :arinvt_id'
      '   and r.arcusto_id = a.id(+)'
      '   and'
      '       (:status = 0'
      '        or'
      '        :status = 1 and NVL(r.closed, '#39'N'#39') = '#39'N'#39
      '        or'
      '        :status = 2 and NVL(r.closed, '#39'N'#39') = '#39'Y'#39')'
      '       and (:arcusto_id = 0'
      '             or'
      '        :arcusto_id = r.arcusto_id)')
    Left = 124
    Top = 280
    ParamData = <
      item
        Name = 'date1'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'date2'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'status'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'arcusto_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQryRMARMANO: TStringField
      DisplayLabel = 'RMA #'
      DisplayWidth = 15
      FieldName = 'RMANO'
      Origin = 'r.RMANO'
      Size = 15
    end
    object wwQryRMARMA_DATE: TDateTimeField
      DisplayLabel = 'RMA Date'
      DisplayWidth = 18
      FieldName = 'RMA_DATE'
      Origin = 'r.RMA_DATE'
    end
    object wwQryRMACLOSED: TStringField
      DisplayLabel = 'Closed'
      DisplayWidth = 1
      FieldName = 'CLOSED'
      Origin = 'r.CLOSED'
      FixedChar = True
      Size = 1
    end
    object wwQryRMAQTYRETURNED: TFMTBCDField
      DisplayLabel = 'Qty. Returned'
      DisplayWidth = 10
      FieldName = 'QTYRETURNED'
      Origin = 'd.QTYRETURNED'
      Size = 6
    end
    object wwQryRMACUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'a.custno'
      FixedChar = True
      Size = 10
    end
    object wwQryRMACOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      DisplayWidth = 20
      FieldName = 'COMPANY'
      Origin = 'a.COMPANY'
      Size = 60
    end
    object wwQryRMAQTY_RECEIVED: TFMTBCDField
      DisplayLabel = 'Qty. Returned'
      DisplayWidth = 10
      FieldName = 'QTY_RECEIVED'
      Origin = 't.qty_received'
      Size = 38
    end
    object wwQryRMARMA_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'RMA_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object wwQryRMAARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object wwQryRMAUSERID: TStringField
      DisplayWidth = 35
      FieldName = 'USERID'
      Visible = False
      Size = 35
    end
    object wwQryRMAARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object wwQryRMARMA_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'RMA_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcVendRMA: TDataSource
    DataSet = wwQryVendRMA
    Left = 155
    Top = 264
  end
  object wwQryVendRMA: TFDQuery
    BeforeOpen = wwQryVendRMABeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select r.id as vendor_rma_id,'
      '       r.rmano,'
      '       r.vendor_id,'
      '       r.rma_date,'
      '       r.userid,'
      '       r.closed,'
      '       d.id as vendor_rma_detail_id,'
      '       d.arinvt_id,'
      '       d.qty_to_return,'
      '       a.vendorno,'
      '       a.company,'
      '       t.qty_returned'
      '  from vendor_rma r,'
      '       vendor_rma_detail d,'
      '       vendor a,'
      '       V_VEN_RMA_RETURNED_TOTAL t'
      ' where d.vendor_rma_id = r.id'
      '   and d.id = t.vendor_rma_detail_id(+)'
      '   and r.rma_date between :date1 and :date2'
      '   and d.arinvt_id = :arinvt_id'
      '   and r.vendor_id = a.id(+)   and'
      '       (:status = 0'
      '        or'
      '        :status = 1 and NVL(r.closed, '#39'N'#39') = '#39'N'#39
      '        or'
      '        :status = 2 and NVL(r.closed, '#39'N'#39') = '#39'Y'#39')'
      '       and (:vendor_id = 0'
      '             or'
      '        :vendor_id = r.vendor_id)')
    Left = 155
    Top = 280
    ParamData = <
      item
        Name = 'date1'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'date2'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'status'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'vendor_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQryVendRMARMANO: TStringField
      DisplayLabel = 'RMA #'
      DisplayWidth = 25
      FieldName = 'RMANO'
      Origin = 'r.RMANO'
      Size = 25
    end
    object wwQryVendRMARMA_DATE: TDateTimeField
      DisplayLabel = 'RMA Date'
      DisplayWidth = 18
      FieldName = 'RMA_DATE'
      Origin = 'r.RMA_DATE'
    end
    object wwQryVendRMACLOSED: TStringField
      DisplayLabel = 'Closed'
      DisplayWidth = 1
      FieldName = 'CLOSED'
      Origin = 'r.CLOSED'
      FixedChar = True
      Size = 1
    end
    object wwQryVendRMAQTY_TO_RETURN: TBCDField
      DisplayLabel = 'Qty. To Return'
      DisplayWidth = 10
      FieldName = 'QTY_TO_RETURN'
      Origin = 'd.QTY_TO_RETURN'
    end
    object wwQryVendRMAVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      DisplayWidth = 10
      FieldName = 'VENDORNO'
      Origin = 'a.VENDORNO'
      FixedChar = True
      Size = 10
    end
    object wwQryVendRMACOMPANY: TStringField
      DisplayLabel = 'Vendor Name'
      DisplayWidth = 20
      FieldName = 'COMPANY'
      Origin = 'a.COMPANY'
      Size = 60
    end
    object wwQryVendRMAQTY_RETURNED: TFMTBCDField
      DisplayLabel = 'Qty. Returned'
      DisplayWidth = 10
      FieldName = 'QTY_RETURNED'
      Origin = 't.qty_returned'
      Size = 38
    end
    object wwQryVendRMAUSERID: TStringField
      DisplayWidth = 35
      FieldName = 'USERID'
      Visible = False
      Size = 35
    end
    object wwQryVendRMAVENDOR_RMA_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'VENDOR_RMA_ID'
      Visible = False
      Size = 0
    end
    object wwQryVendRMAVENDOR_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'VENDOR_ID'
      Visible = False
      Size = 0
    end
    object wwQryVendRMAVENDOR_RMA_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'VENDOR_RMA_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object wwQryVendRMAARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object popmRMA: TUniPopupMenu
    Left = 120
    Top = 312
    object JumpToRMA: TUniMenuItem
      Caption = 'Jump to RMA'
      OnClick = JumpToRMAClick
    end
    object JumpToCustomerRMA: TUniMenuItem
      Caption = 'Jump to Customer'
      OnClick = JumpToCustomerRMAClick
    end
  end
  object IQJumpCustomerRMA: TIQWebJump
    DataField = 'ARCUSTO_ID'
    DataSource = SrcRMA
    JumpTo = jtCustomer
    Left = 120
    Top = 344
  end
  object popmVendRMA: TUniPopupMenu
    Left = 152
    Top = 312
    object JumptoVendorRMA: TUniMenuItem
      Caption = 'Jump to Vendor RMA'
      OnClick = JumptoVendorRMAClick
    end
    object JumptoVendor: TUniMenuItem
      Caption = 'Jump to Vendor'
      OnClick = JumptoVendorClick
    end
  end
  object IQJumpVendorRma: TIQWebJump
    DataField = 'VENDOR_ID'
    DataSource = SrcVendRMA
    JumpTo = jtVendor
    Left = 156
    Top = 344
  end
end
