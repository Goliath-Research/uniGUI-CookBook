object FrmInventoryByLocations: TFrmInventoryByLocations
  Left = 125
  Top = 229
  HelpContext = 1548083
  ClientHeight = 455
  ClientWidth = 946
  Caption = 'Inventory By Location'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 377
    Top = 0
    Width = 5
    Height = 438
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object pnlLocations: TUniPanel
    Left = 0
    Top = 0
    Width = 377
    Height = 438
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel11: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 375
      Height = 20
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clWhite
      TabOrder = 0
      Caption = ''
      Color = clAppWorkSpace
      object Label4: TUniLabel
        Left = 1
        Top = 1
        Width = 54
        Height = 13
        Hint = ''
        Caption = 'Locations'
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object Panel1: TUniPanel
      Left = 1
      Top = 21
      Width = 375
      Height = 416
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object IQSearchLoc: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 373
        Height = 414
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 156
        IQComponents.Grid.Height = 328
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcLoc
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
        IQComponents.Navigator.DataSource = SrcLoc
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 156
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 328
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcLoc
        Columns = <
          item
            FieldName = 'LOC_DESC'
            Title.Caption = 'Location'
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
            FieldName = 'DIVISION_NAME'
            Title.Caption = 'Division'
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
            FieldName = 'ID'
            Title.Caption = 'Location ID'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
        object pnlLocLegend: TUniPanel
          Left = 53
          Top = 1
          Width = 50
          Height = 25
          Hint = ''
          ShowHint = True
          ParentShowHint = False
          TabOrder = 2
          Caption = ''
          DesignSize = (
            50
            25)
          object Shape3: TUniPanel
            Left = 7
            Top = 8
            Width = 10
            Height = 11
            Hint = 'In Transit Location'
            ShowHint = True
            ParentShowHint = False
            Anchors = [akTop, akRight]
            TabOrder = 1
            Caption = ''
          end
          object Shape2: TUniPanel
            Left = 20
            Top = 8
            Width = 10
            Height = 11
            Hint = 'Non-Conform'
            ShowHint = True
            ParentShowHint = False
            Anchors = [akTop, akRight]
            TabOrder = 2
            Caption = ''
          end
          object Shape1: TUniPanel
            Left = 33
            Top = 8
            Width = 10
            Height = 11
            Hint = 'VMI Location'
            ShowHint = True
            ParentShowHint = False
            Anchors = [akTop, akRight]
            TabOrder = 3
            Caption = ''
          end
        end
      end
    end
  end
  object pnlRightClient01: TUniPanel
    Left = 382
    Top = 0
    Width = 564
    Height = 438
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 1
      Top = 265
      Width = 562
      Height = 5
      Cursor = crVSplit
      Hint = ''
      Align = alBottom
      ParentColor = False
      Color = clBtnFace
    end
    object pnlInventory: TUniPanel
      Left = 1
      Top = 1
      Width = 562
      Height = 264
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Panel4: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 560
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 0
        Caption = ''
        Color = clAppWorkSpace
        object Label1: TUniLabel
          Left = 1
          Top = 1
          Width = 57
          Height = 13
          Hint = ''
          Caption = 'Inventory'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object Panel6: TUniPanel
        Left = 1
        Top = 21
        Width = 560
        Height = 242
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object Bevel2: TUniPanel
          Left = 554
          Top = 1
          Width = 5
          Height = 240
          Hint = ''
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 2
          Caption = ''
        end
        object IQSearchFGMulti: TIQUniGridControl
          Left = 1
          Top = 1
          Width = 553
          Height = 240
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 336
          IQComponents.Grid.Height = 154
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcFGMulti
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
          IQComponents.Navigator.DataSource = SrcFGMulti
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 336
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 154
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcFGMulti
          Columns = <
            item
              FieldName = 'ID'
              Title.Caption = 'Location ID'
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
              FieldName = 'LOTNO'
              Title.Caption = 'Lot #'
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
              FieldName = 'ACT_COST'
              Title.Caption = 'Cost'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'IN_DATE'
              Title.Caption = 'In Date'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'LOT_DATE'
              Title.Caption = 'Lot Date'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'HardAllocLot'
              Title.Caption = 'Hard Allocated To'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'In_Transit_Origin_Disp'
              Title.Caption = 'In Transit Origin'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Outsource_VendorNo'
              Title.Caption = 'Outsource Vendor #'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'MakeToOrderOrderNo'
              Title.Caption = 'MakeToOrder (SO/Line#)'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CLASS'
              Title.Caption = 'Class'
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
              FieldName = 'DESCRIP2'
              Title.Caption = 'Ext Description'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CONTAINERNO'
              Title.Caption = 'Container #'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          TabsVisible = True
          OnMouseDown = IQSearchFGMultiMouseDown
          Marker = 0
          object pnlLegendFGMulti: TUniPanel
            Left = 250
            Top = 1
            Width = 120
            Height = 25
            Hint = ''
            TabOrder = 2
            Caption = ''
            object Shape4: TUniPanel
              Left = 75
              Top = 7
              Width = 11
              Height = 11
              Hint = 'Belongs to a skid'
              ShowHint = True
              ParentShowHint = False
              TabOrder = 1
              Caption = ''
            end
            object Shape5: TUniPanel
              Left = 61
              Top = 7
              Width = 11
              Height = 11
              Hint = 'Non-Conform'
              ShowHint = True
              ParentShowHint = False
              TabOrder = 2
              Caption = ''
            end
            object Shape6: TUniPanel
              Left = 89
              Top = 7
              Width = 11
              Height = 11
              Hint = 'VMI Location'
              ShowHint = True
              ParentShowHint = False
              TabOrder = 3
              Caption = ''
            end
            object Shape7: TUniPanel
              Left = 47
              Top = 7
              Width = 11
              Height = 11
              Hint = 'Non-Allocate'
              ShowHint = True
              ParentShowHint = False
              TabOrder = 4
              Caption = ''
            end
            object Shape8: TUniPanel
              Left = 33
              Top = 7
              Width = 11
              Height = 11
              Hint = 'Expired'
              ShowHint = True
              ParentShowHint = False
              TabOrder = 5
              Caption = ''
            end
            object Shape9: TUniPanel
              Left = 7
              Top = 7
              Width = 11
              Height = 11
              Hint = 'In Transit'
              ShowHint = True
              ParentShowHint = False
              TabOrder = 6
              Caption = ''
            end
            object Shape10: TUniPanel
              Left = 20
              Top = 7
              Width = 11
              Height = 11
              Hint = 'Hard Allocated'
              ShowHint = True
              ParentShowHint = False
              TabOrder = 7
              Caption = ''
            end
            object Shape11: TUniPanel
              Left = 103
              Top = 7
              Width = 11
              Height = 11
              Hint = 'Make To Order'
              ShowHint = True
              ParentShowHint = False
              TabOrder = 8
              Caption = ''
            end
          end
        end
      end
    end
    object pnlBottom01: TUniPanel
      Left = 1
      Top = 270
      Width = 562
      Height = 167
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Splitter4: TUniSplitter
        Left = 198
        Top = 1
        Width = 5
        Height = 165
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object pnlLabels: TUniPanel
        Left = 203
        Top = 1
        Width = 358
        Height = 165
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Bevel1: TUniPanel
          Left = 1
          Top = 159
          Width = 356
          Height = 5
          Hint = ''
          Align = alBottom
          Anchors = [akLeft, akRight, akBottom]
          TabOrder = 3
          Caption = ''
        end
        object Panel5: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 356
          Height = 20
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          TabOrder = 0
          Caption = ''
          Color = clAppWorkSpace
          object Label2: TUniLabel
            Left = 1
            Top = 1
            Width = 76
            Height = 13
            Hint = ''
            Caption = 'Linked Labels'
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            ParentFont = False
            Font.Color = clWhite
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object Panel3: TUniPanel
          Left = 1
          Top = 21
          Width = 356
          Height = 138
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object Bevel3: TUniPanel
            Left = 350
            Top = 1
            Width = 5
            Height = 136
            Hint = ''
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 2
            Caption = ''
          end
          object IQSearchLabel: TIQUniGridControl
            Left = 1
            Top = 1
            Width = 349
            Height = 136
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 132
            IQComponents.Grid.Height = 50
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = SrcMaster_Label
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
            IQComponents.Navigator.DataSource = SrcMaster_Label
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 132
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 50
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = SrcMaster_Label
            Columns = <
              item
                FieldName = 'SERIAL'
                Title.Caption = 'Serial #'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'QTY'
                Title.Caption = 'Qty'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DISPO_DATE'
                Title.Caption = 'Dispo Date'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'PARENT_SERIAL'
                Title.Caption = 'Pallet Serial #'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'PRINT_DATE'
                Title.Caption = 'Print Date'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end>
            TabsVisible = True
            Marker = 0
          end
        end
      end
      object pnlDetails: TUniPanel
        Left = 1
        Top = 1
        Width = 197
        Height = 165
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
        Caption = ''
        object PnlBottomLeftClient01: TUniPanel
          Left = 1
          Top = 21
          Width = 195
          Height = 143
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter6: TUniSplitter
            Left = 104
            Top = 1
            Width = 6
            Height = 141
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlLeft03: TUniPanel
            Left = 1
            Top = 1
            Width = 103
            Height = 141
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label5: TUniLabel
              Left = 3
              Top = 7
              Width = 76
              Height = 13
              Hint = ''
              Caption = 'Non-Conformed'
              TabOrder = 1
            end
            object Label6: TUniLabel
              Left = 3
              Top = 31
              Width = 75
              Height = 13
              Hint = ''
              Caption = 'Non-Allocatable'
              TabOrder = 2
            end
            object Label3: TUniLabel
              Left = 3
              Top = 55
              Width = 81
              Height = 13
              Hint = ''
              Caption = 'Dispo Designator'
              TabOrder = 3
            end
            object Label7: TUniLabel
              Left = 3
              Top = 79
              Width = 75
              Height = 13
              Hint = ''
              Caption = 'Ship Designator'
              TabOrder = 4
            end
            object lblDivision: TUniLabel
              Left = 3
              Top = 127
              Width = 66
              Height = 13
              Hint = ''
              Caption = 'Division Name'
              TabOrder = 5
            end
            object lblRecvDesignator: TUniLabel
              Left = 3
              Top = 103
              Width = 93
              Height = 13
              Hint = ''
              Caption = 'Receive Designator'
              TabOrder = 6
            end
          end
          object PnlClient03: TUniPanel
            Left = 110
            Top = 1
            Width = 84
            Height = 141
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            DesignSize = (
              84
              141)
            object dbeNonConf: TUniDBEdit
              Tag = 1
              Left = 0
              Top = 3
              Width = 83
              Height = 19
              Hint = ''
              DataField = 'NON_CONF_DESCRIP'
              DataSource = SrcFGMulti
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              Color = clBtnFace
            end
            object dbeNonAlloc: TUniDBEdit
              Tag = 1
              Left = 0
              Top = 27
              Width = 83
              Height = 19
              Hint = ''
              DataField = 'NON_ALLOCATE_DESCRIP'
              DataSource = SrcFGMulti
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              Color = clBtnFace
            end
            object dbeDispo: TUniDBEdit
              Tag = 1
              Left = 0
              Top = 51
              Width = 83
              Height = 19
              Hint = ''
              DataField = 'Auto_Dispo'
              DataSource = SrcFGMulti
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              Color = clBtnFace
            end
            object dbeShip: TUniDBEdit
              Tag = 1
              Left = 0
              Top = 75
              Width = 83
              Height = 19
              Hint = ''
              DataField = 'Auto_Ship'
              DataSource = SrcFGMulti
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
              Color = clBtnFace
            end
            object dbeDivision: TUniDBEdit
              Tag = 1
              Left = 0
              Top = 123
              Width = 83
              Height = 19
              Hint = ''
              DataField = 'Division_Name'
              DataSource = SrcFGMulti
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 5
              Color = clBtnFace
            end
            object dbeRecv: TUniDBEdit
              Tag = 1
              Left = 0
              Top = 99
              Width = 83
              Height = 19
              Hint = ''
              DataField = 'Auto_Recv'
              DataSource = SrcFGMulti
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 4
              Color = clBtnFace
            end
          end
        end
        object Panel7: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 195
          Height = 20
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          TabOrder = 1
          Caption = ''
          Color = clAppWorkSpace
          object Label8: TUniLabel
            Left = 1
            Top = 1
            Width = 39
            Height = 13
            Hint = ''
            Caption = 'Details'
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            ParentFont = False
            Font.Color = clWhite
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
      end
    end
  end
  object pnlBottom: TUniPanel
    Left = 0
    Top = 438
    Width = 946
    Height = 17
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
  end
  object MainMenu1: TUniMainMenu
    Left = 37
    Top = 264
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
        ShortCut = 112
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmInventoryByLocations'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 197398 $'
    BuildVersion = '176554'
    Left = 37
    Top = 292
  end
  object SrcLoc: TDataSource
    DataSet = QryLoc
    Left = 77
    Top = 87
  end
  object QryLoc: TFDQuery
    BeforeOpen = QryLocBeforeOpen
    BeforeInsert = AbortEdit
    BeforeEdit = AbortEdit
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select loc.id,'
      '       loc.loc_desc,'
      '       loc.descrip,'
      '       div.name as division_name,'
      '       loc.eplant_id,'
      '       loc.vmi,'
      '       loc.non_conform,'
      '       loc.transit'
      '  from locations loc,'
      '       division div '
      ' where misc.eplant_filter( loc.eplant_id ) = 1'
      '   and loc.division_id = div.id(+)'
      '   and nvl(loc.pk_hide, '#39'N'#39') = :pk_hide'
      '')
    Left = 78
    Top = 101
    ParamData = <
      item
        Name = 'pk_hide'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryLocLOC_DESC: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 14
      FieldName = 'LOC_DESC'
      Origin = 'loc.loc_desc'
      FixedChar = True
      Size = 30
    end
    object QryLocDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 21
      FieldName = 'DESCRIP'
      Origin = 'loc.descrip'
      Size = 50
    end
    object QryLocDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 15
      FieldName = 'DIVISION_NAME'
      Origin = 'div.name'
      Size = 25
    end
    object QryLocEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 9
      FieldName = 'EPLANT_ID'
      Origin = 'loc.eplant_id'
      Size = 0
    end
    object QryLocID: TBCDField
      DisplayLabel = 'Location ID'
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'loc.id'
      Size = 0
    end
    object QryLocVMI: TStringField
      FieldName = 'VMI'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryLocNON_CONFORM: TStringField
      FieldName = 'NON_CONFORM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryLocTRANSIT: TStringField
      FieldName = 'TRANSIT'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object SrcFGMulti: TDataSource
    DataSet = QryFGMulti
    Left = 78
    Top = 134
  end
  object QryFGMulti: TFDQuery
    BeforeInsert = AbortEdit
    BeforeEdit = AbortEdit
    OnCalcFields = QryFGMultiCalcFields
    CachedUpdates = True
    MasterSource = SrcLoc
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.class,'
      '       a.itemno,'
      '       a.rev,'
      '       a.descrip,'
      '       a.descrip2,'
      '       f.id,'
      '       f.lotno,'
      '       f.onhand,'
      '       f.act_cost,'
      '       f.in_date,'
      '       f.lot_date,'
      '       nc.descrip as non_conf_descrip,'
      '       na.descrip as non_allocate_descrip,'
      '       f.auto_dispo_standard_id,'
      '       s.mfgno as auto_dispo_mfgno,'
      '       f.auto_dispo_default_loc,'
      '       f.ship_default,'
      '       f.recv_default,'
      '       d.name as division_name,'
      
        '       (select source from v_fgmulti_allocated where fgmulti_id ' +
        '= f.id) as fgmulti_allocated_source,'
      '       f.in_transit_origin,'
      '       f.shipment_dtl_id_in_transit,'
      '       f.make_to_order_detail_id,'
      '       f.loc_vmi as vmi,'
      '       f.non_conform_id,'
      '       f.non_allocate_id,'
      '       f.master_label_id,'
      '       a.shelf_life,'
      '       f.arinvt_id,'
      '       f.containerno,'
      '       a.is_linked_to_serial'
      '  from v_fgmulti_locations f,'
      '       arinvt a,'
      '       non_conform nc,'
      '       non_allocate na,'
      '       standard s,'
      '       division d'
      ' where f.loc_id = :id'
      '   and f.arinvt_id = a.id'
      '   and f.non_conform_id = nc.id(+)'
      '   and f.non_allocate_id = na.id(+)'
      '   and f.auto_dispo_standard_id = s.id(+)'
      '   and f.division_id = d.id(+)'
      '   '
      '')
    Left = 79
    Top = 148
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryFGMultiID: TBCDField
      DisplayLabel = 'Location ID'
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'f.id'
      Size = 0
    end
    object QryFGMultiITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 17
      FieldName = 'ITEMNO'
      Origin = 'a.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryFGMultiDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 21
      FieldName = 'DESCRIP'
      Origin = 'a.DESCRIP'
      Size = 100
    end
    object QryFGMultiLOTNO: TStringField
      DisplayLabel = 'Lot #'
      DisplayWidth = 14
      FieldName = 'LOTNO'
      Origin = 'f.LOTNO'
      FixedChar = True
      Size = 25
    end
    object QryFGMultiONHAND: TBCDField
      DisplayLabel = 'On Hand'
      DisplayWidth = 10
      FieldName = 'ONHAND'
      Origin = 'f.ONHAND'
    end
    object QryFGMultiACT_COST: TFMTBCDField
      DisplayLabel = 'Cost'
      DisplayWidth = 10
      FieldName = 'ACT_COST'
      Origin = 'f.ACT_COST'
      Size = 6
    end
    object QryFGMultiIN_DATE: TDateTimeField
      DisplayLabel = 'In Date'
      DisplayWidth = 18
      FieldName = 'IN_DATE'
      Origin = 'f.IN_DATE'
    end
    object QryFGMultiLOT_DATE: TDateTimeField
      DisplayLabel = 'Lot Date'
      DisplayWidth = 18
      FieldName = 'LOT_DATE'
      Origin = 'f.LOT_DATE'
    end
    object QryFGMultiHardAllocLot: TStringField
      DisplayLabel = 'Hard Allocated To'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'HardAllocLot'
      Size = 25
      Calculated = True
    end
    object QryFGMultiIn_Transit_Origin_Disp: TStringField
      DisplayLabel = 'In Transit Origin'
      DisplayWidth = 27
      FieldKind = fkCalculated
      FieldName = 'In_Transit_Origin_Disp'
      Size = 50
      Calculated = True
    end
    object QryFGMultiOutsource_VendorNo: TStringField
      DisplayLabel = 'Outsource Vendor #'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Outsource_VendorNo'
      Calculated = True
    end
    object QryFGMultiMakeToOrderOrderNo: TStringField
      DisplayLabel = 'MakeToOrder (SO/Line#)'
      DisplayWidth = 26
      FieldKind = fkCalculated
      FieldName = 'MakeToOrderOrderNo'
      Size = 30
      Calculated = True
    end
    object QryFGMultiCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      Origin = 'a.CLASS'
      FixedChar = True
      Size = 2
    end
    object QryFGMultiREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 8
      FieldName = 'REV'
      Origin = 'a.REV'
      FixedChar = True
      Size = 15
    end
    object QryFGMultiDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Origin = 'a.DESCRIP2'
      Size = 100
    end
    object QryFGMultiCONTAINERNO: TStringField
      DisplayLabel = 'Container #'
      DisplayWidth = 30
      FieldName = 'CONTAINERNO'
      Origin = 'f.containerno'
      Size = 60
    end
    object QryFGMultiNON_CONF_DESCRIP: TStringField
      DisplayLabel = 'Non Conform Descripiton'
      DisplayWidth = 30
      FieldName = 'NON_CONF_DESCRIP'
      Visible = False
      Size = 30
    end
    object QryFGMultiNON_ALLOCATE_DESCRIP: TStringField
      DisplayLabel = 'Non Allocate Description'
      DisplayWidth = 30
      FieldName = 'NON_ALLOCATE_DESCRIP'
      Visible = False
      Size = 30
    end
    object QryFGMultiAUTO_DISPO_STANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'AUTO_DISPO_STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QryFGMultiAUTO_DISPO_MFGNO: TStringField
      DisplayWidth = 25
      FieldName = 'AUTO_DISPO_MFGNO'
      Visible = False
      Size = 50
    end
    object QryFGMultiAUTO_DISPO_DEFAULT_LOC: TStringField
      DisplayWidth = 1
      FieldName = 'AUTO_DISPO_DEFAULT_LOC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFGMultiAuto_Dispo: TStringField
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'Auto_Dispo'
      Visible = False
      Size = 50
      Calculated = True
    end
    object QryFGMultiSHIP_DEFAULT: TStringField
      DisplayWidth = 1
      FieldName = 'SHIP_DEFAULT'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFGMultiAuto_Ship: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Auto_Ship'
      Visible = False
      Calculated = True
    end
    object QryFGMultiRECV_DEFAULT: TStringField
      DisplayWidth = 1
      FieldName = 'RECV_DEFAULT'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFGMultiAuto_Recv: TStringField
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'Auto_Recv'
      Visible = False
      Size = 50
      Calculated = True
    end
    object QryFGMultiDIVISION_NAME: TStringField
      DisplayLabel = 'Division Name'
      DisplayWidth = 25
      FieldName = 'DIVISION_NAME'
      Visible = False
      Size = 25
    end
    object QryFGMultiFGMULTI_ALLOCATED_SOURCE: TStringField
      DisplayWidth = 21
      FieldName = 'FGMULTI_ALLOCATED_SOURCE'
      Visible = False
      Size = 21
    end
    object QryFGMultiIs_Hard_Alloc: TStringField
      DisplayWidth = 1
      FieldKind = fkCalculated
      FieldName = 'Is_Hard_Alloc'
      Visible = False
      Size = 1
      Calculated = True
    end
    object QryFGMultiIN_TRANSIT_ORIGIN: TBCDField
      DisplayWidth = 10
      FieldName = 'IN_TRANSIT_ORIGIN'
      Visible = False
      Size = 0
    end
    object QryFGMultiSHIPMENT_DTL_ID_IN_TRANSIT: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIPMENT_DTL_ID_IN_TRANSIT'
      Visible = False
      Size = 0
    end
    object QryFGMultiMAKE_TO_ORDER_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'MAKE_TO_ORDER_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object QryFGMultiVMI: TStringField
      DisplayWidth = 1
      FieldName = 'VMI'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFGMultiNON_CONFORM_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'NON_CONFORM_ID'
      Visible = False
      Size = 0
    end
    object QryFGMultiNON_ALLOCATE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'NON_ALLOCATE_ID'
      Visible = False
      Size = 0
    end
    object QryFGMultiMASTER_LABEL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'MASTER_LABEL_ID'
      Visible = False
      Size = 0
    end
    object QryFGMultiSHELF_LIFE: TBCDField
      DisplayWidth = 10
      FieldName = 'SHELF_LIFE'
      Visible = False
      Size = 0
    end
    object QryFGMultiARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryFGMultiIS_LINKED_TO_SERIAL: TStringField
      FieldName = 'IS_LINKED_TO_SERIAL'
      Origin = 'IS_LINKED_TO_SERIAL'
      FixedChar = True
      Size = 1
    end
  end
  object QryFab_Lot_Mat: TFDQuery
    BeforeOpen = AssignFGMulti_IDBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '#39'Y'#39' as is_allocated, '
      '       d.lotno '
      '  from fab_lot_mat_loc l,'
      '       fab_lot_mat a,'
      '       fab_lot_process b,'
      '       fab_lot_wo c,'
      '       fab_lot d'
      ' where l.fgmulti_id = :fgmulti_id'
      '   and l.fab_lot_mat_id = a.id'
      '   and a.fab_lot_process_id = b.id'
      '   and b.fab_lot_wo_id = c.id'
      '   and c.fab_lot_id = d.id'
      ' '
      ' ')
    Left = 111
    Top = 148
    ParamData = <
      item
        Name = 'fgmulti_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryFab_Lot_MatIS_ALLOCATED: TStringField
      FieldName = 'IS_ALLOCATED'
      FixedChar = True
      Size = 1
    end
    object QryFab_Lot_MatLOTNO: TStringField
      FieldName = 'LOTNO'
      Size = 25
    end
  end
  object QryWO_BOM_Mat_Loc: TFDQuery
    BeforeOpen = AssignFGMulti_IDBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select b.workorder_id'
      '  from workorder_bom_mat_loc m, workorder_bom b'
      ' where m.fgmulti_id = :fgmulti_id'
      '   and m.workorder_bom_id = b.id'
      '   ')
    Left = 143
    Top = 148
    ParamData = <
      item
        Name = 'fgmulti_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryWO_BOM_Mat_LocWORKORDER_ID: TBCDField
      FieldName = 'WORKORDER_ID'
      Origin = 'IQ.WORKORDER_BOM.WORKORDER_ID'
      Size = 0
    end
  end
  object SrcMaster_Label: TDataSource
    DataSet = QryMaster_Label
    Left = 78
    Top = 185
  end
  object QryMaster_Label: TFDQuery
    BeforeInsert = AbortEdit
    BeforeEdit = AbortEdit
    CachedUpdates = True
    MasterSource = SrcFGMulti
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select child.id,'
      '       child.serial,'
      '       child.qty,'
      '       child.dispo_date,'
      '       child.parent_id,'
      '       parent.serial as parent_serial,'
      '       child.print_date'
      '  from '
      '       master_label child,'
      '       master_label parent,'
      '       arinvt a'
      ' where '
      '       child.fgmulti_id = :id'
      '   and child.parent_id = parent.id(+)'
      '       -- show only serialized'
      '   and child.arinvt_id = a.id(+)'
      '   and a.is_linked_to_serial = '#39'Y'#39
      
        '   -- and child.shipment_dtl_id is NULL removed on 10-19-2007 to' +
        ' show in transit labels'
      '   ')
    Left = 78
    Top = 198
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryMaster_LabelSERIAL: TStringField
      DisplayLabel = 'Serial #'
      DisplayWidth = 11
      FieldName = 'SERIAL'
      Origin = 'child.serial'
      Size = 13
    end
    object QryMaster_LabelQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 13
      FieldName = 'QTY'
      Origin = 'child.qty'
      Size = 6
    end
    object QryMaster_LabelDISPO_DATE: TDateTimeField
      DisplayLabel = 'Dispo Date'
      DisplayWidth = 18
      FieldName = 'DISPO_DATE'
      Origin = 'child.dispo_date'
    end
    object QryMaster_LabelPARENT_SERIAL: TStringField
      DisplayLabel = 'Pallet Serial #'
      DisplayWidth = 12
      FieldName = 'PARENT_SERIAL'
      Origin = 'parent.serial'
      Size = 13
    end
    object QryMaster_LabelPRINT_DATE: TDateTimeField
      DisplayLabel = 'Print Date'
      DisplayWidth = 18
      FieldName = 'PRINT_DATE'
      Origin = 'child.print_date'
    end
    object QryMaster_LabelID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'child.id'
      Visible = False
      Size = 0
    end
    object QryMaster_LabelPARENT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PARENT_ID'
      Origin = 'child.parent_id'
      Visible = False
      Size = 0
    end
  end
  object popFGMulti: TUniPopupMenu
    OnPopup = popFGMultiPopup
    Left = 352
    Top = 109
    object JumpToLocationsandTransactions1: TUniMenuItem
      Caption = 'Jump To Locations and Transactions'
      OnClick = JumpToLocationsandTransactions1Click
    end
    object JumpToInventory1: TUniMenuItem
      Caption = 'Jump To Inventory'
      OnClick = JumpToInventory1Click
    end
    object ChangeInDate1: TUniMenuItem
      Caption = 'Change In-Date'
      OnClick = ChangeInDate1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object ToggleToConform1: TUniMenuItem
      Caption = 'Toggle To Conform'
      OnClick = ToggleToConform1Click
    end
    object ToggleToNonConform1: TUniMenuItem
      Caption = 'Toggle To Non Conform'
      OnClick = ToggleToNonConform1Click
    end
    object ToggleToAllocate1: TUniMenuItem
      Caption = 'Toggle To Allocate'
      OnClick = ToggleToAllocate1Click
    end
    object ToggleToNonAllocate1: TUniMenuItem
      Caption = 'Toggle To Non Allocate'
      OnClick = ToggleToNonAllocate1Click
    end
    object ToggletoShip1: TUniMenuItem
      Caption = 'Toggle to Ship'
      OnClick = ToggletoShip1Click
    end
    object ToggletoNonShip1: TUniMenuItem
      Caption = 'Toggle to Non Ship'
      OnClick = ToggletoNonShip1Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object ReleaseWOHardAllocation1: TUniMenuItem
      Caption = 'Release Workorder Hard Allocation'
      OnClick = ReleaseWOHardAllocation1Click
    end
    object ReleaseMakeToOrderAllocation1: TUniMenuItem
      Caption = 'Release MakeToOrder Allocation'
      OnClick = ReleaseMakeToOrderAllocation1Click
    end
    object N3: TUniMenuItem
      Caption = '-'
    end
    object PrintLabels1: TUniMenuItem
      Caption = 'Print Labels'
      OnClick = PrintLabels1Click
    end
  end
  object IQJumpInv: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = SrcFGMulti
    JumpTo = jtInventory
    Left = 353
    Top = 138
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'QryFGMultiACT_COST'
      'IQSearchLoc'
      'IQSearchFGMulti'
      'IQSearchLabel'
      'dbeNonConf'
      'dbeNonAlloc'
      'dbeDispo'
      'dbeShip'
      'dbeRecv'
      'dbeDivision'
      'ChangeInDate1'
      'ToggleToConform1'
      'ToggleToNonConform1'
      'ToggleToAllocate1'
      'ToggleToNonAllocate1'
      'ToggletoShip1'
      'ToggletoNonShip1'
      'ReleaseWOHardAllocation1'
      'ReleaseMakeToOrderAllocation1'
      'PrintLabels1')
    SecurityCode = 'FRMINVENTORYBYLOCATIONS'
    Left = 390
    Top = 111
  end
  object Timer1: TUniTimer
    Interval = 200
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = Timer1Timer
    Left = 76
    Top = 264
  end
end
