object FrmForeQuickDataEntry: TFrmForeQuickDataEntry
  Left = 186
  Top = 153
  ClientHeight = 638
  ClientWidth = 786
  Caption = 'Forecast Quick Data Entry'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  KeyPreview = True
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 476
    Top = 0
    Width = 6
    Height = 619
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object pnlLeft01: TUniPanel
    Left = 0
    Top = 0
    Width = 476
    Height = 619
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 0
      Top = 322
      Width = 476
      Height = 8
      Cursor = crVSplit
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      ParentColor = False
      Color = clBtnFace
    end
    object Bevel2: TUniPanel
      Left = 1
      Top = 330
      Width = 474
      Height = 2
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      Caption = ''
    end
    object pnlItems: TUniPanel
      Left = 1
      Top = 1
      Width = 474
      Height = 322
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object IQSearchItem: TIQUniGridControl
        Left = 1
        Top = 25
        Width = 472
        Height = 297
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 255
        IQComponents.Grid.Height = 211
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
        IQComponents.HiddenPanel.Left = 255
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 211
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
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CODE'
            Title.Caption = 'Group Code'
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
            FieldName = 'REV'
            Title.Caption = 'Rev'
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
            FieldName = 'DESCRIP2'
            Title.Caption = 'Ext Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object Panel8: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 472
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 1
        Caption = ''
        Color = clBtnShadow
        object Label5: TUniLabel
          Left = 1
          Top = 1
          Width = 34
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Items'
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
    end
    object pnlCustomers: TUniPanel
      Left = 1
      Top = 332
      Width = 474
      Height = 287
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Panel5: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 472
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 0
        Caption = ''
        Color = clBtnShadow
        object Label1: TUniLabel
          Left = 1
          Top = 1
          Width = 55
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Customer'
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object IQSearchCustomer: TIQUniGridControl
        Left = 1
        Top = 25
        Width = 472
        Height = 262
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 255
        IQComponents.Grid.Height = 176
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcCustomer
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
        IQComponents.Navigator.DataSource = SrcCustomer
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 255
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 176
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcCustomer
        Columns = <
          item
            FieldName = 'CUSTNO'
            Title.Caption = 'Cust #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'COMPANY'
            Title.Caption = 'Company'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ATTN'
            Title.Caption = 'Ship To'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ADDR1'
            Title.Caption = 'Address'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CITY'
            Title.Caption = 'City'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'STATE'
            Title.Caption = 'State'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'COUNTRY'
            Title.Caption = 'Country'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ZIP'
            Title.Caption = 'Zip'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
    end
  end
  object pnlForecast: TUniPanel
    Left = 482
    Top = 0
    Width = 304
    Height = 619
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object pnlForecastGrid: TUniPanel
      Left = 1
      Top = 25
      Width = 302
      Height = 594
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = 'pnlForecastGrid'
      object Panel9: TUniPanel
        Left = 1
        Top = 1
        Width = 300
        Height = 32
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object NavForecast: TUniDBNavigator
          Left = 59
          Top = 1
          Width = 241
          Height = 30
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          DataSource = SrcForecast
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel, nbRefresh]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
      object gridForecast: TIQUniGridControl
        Left = 1
        Top = 32
        Width = 300
        Height = 562
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 83
        IQComponents.Grid.Height = 476
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcForecast
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
        IQComponents.Navigator.DataSource = SrcForecast
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 83
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 476
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcForecast
        Columns = <
          item
            FieldName = 'Month_Disp'
            Title.Caption = 'Month'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'WEEK'
            Title.Caption = 'Week'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'REQ_DATE'
            Title.Caption = 'Required Date'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'QTY'
            Title.Caption = 'Qty'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
    end
    object Panel6: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 302
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clWhite
      TabOrder = 1
      Caption = ''
      Color = clBtnShadow
      object Label2: TUniLabel
        Left = 1
        Top = 1
        Width = 49
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Forecast'
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object pnlForecastInstructions: TUniPanel
      Tag = 1999
      Left = 1
      Top = 25
      Width = 306
      Height = 594
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      Color = clWhite
      object Label6: TUniLabel
        Left = 1
        Top = 1
        Width = 94
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Quick Data Entry'
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Style = [fsBold]
        TabOrder = 3
      end
      object Bevel4: TUniPanel
        Left = 1
        Top = 13
        Width = 304
        Height = 7
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        Caption = ''
      end
      object Bevel9: TUniPanel
        Left = 1
        Top = 133
        Width = 304
        Height = 15
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        Caption = ''
      end
      object Panel2: TUniPanel
        Left = 1
        Top = 148
        Width = 304
        Height = 45
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        ParentColor = True
        object Panel1: TUniPanel
          Tag = 1999
          Left = 201
          Top = 1
          Width = 103
          Height = 43
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          ParentColor = True
          object btnApply: TUniButton
            Left = 2
            Top = 9
            Width = 97
            Height = 25
            Hint = 'Apply selection criteria'
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ShowHint = True
            ParentShowHint = False
            Caption = 'Apply'
            TabOrder = 1
            OnClick = btnApplyClick
          end
        end
      end
      object Panel3: TUniPanel
        Tag = 1999
        Left = 1
        Top = 20
        Width = 304
        Height = 113
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        ParentColor = True
        object Bevel5: TUniPanel
          Left = 1
          Top = 1
          Width = 14
          Height = 111
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 2
          Caption = ''
        end
        object Panel4: TUniPanel
          Tag = 1999
          Left = 14
          Top = 1
          Width = 290
          Height = 111
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          ParentColor = True
          object Label7: TUniLabel
            Left = 1
            Top = 74
            Width = 64
            Height = 13
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '3. Click Apply'
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object Bevel7: TUniPanel
            Left = 1
            Top = 1
            Width = 288
            Height = 16
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            Caption = ''
          end
          object Label8: TUniLabel
            Left = 1
            Top = 16
            Width = 105
            Height = 13
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '1. Find inventory item'
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
          end
          object Bevel8: TUniPanel
            Left = 1
            Top = 29
            Width = 288
            Height = 16
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
            Caption = ''
          end
          object Label9: TUniLabel
            Left = 1
            Top = 45
            Width = 233
            Height = 13
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = '2. Find customer and optionally shipping address'
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
          end
          object Bevel10: TUniPanel
            Left = 1
            Top = 58
            Width = 288
            Height = 16
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 6
            Caption = ''
          end
        end
      end
    end
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 619
    Width = 786
    Height = 19
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Panels = <>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object MainMenu1: TUniMainMenu
    Left = 42
    Top = 75
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
    ModuleName = 'FrmForeQuickDataEntry'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 191057 $'
    BuildVersion = '176554'
    Left = 76
    Top = 75
  end
  object SrcArinvt: TDataSource
    DataSet = QryArinvt
    Left = 44
    Top = 117
  end
  object QryArinvt: TFDQuery
    BeforeOpen = QryArinvtBeforeOpen
    AfterScroll = QryArinvtAfterScroll
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.id,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.descrip2,'
      '       g.code,'
      '       a.eplant_id,'
      '       a.rev,'
      '       a.class'
      '  from'
      '       arinvt a,'
      '       fr_group g'
      ' where'
      
        '       (a.standard_id is not NULL or NVL(a.fr_include, '#39'N'#39') = '#39'Y' +
        #39')'
      '   and a.fr_group_id = g.id(+)'
      '   and (:group_id = 0 '
      '        or '
      '        :group_id > 0 and g.id = :group_id)'
      '   and Misc.EPlant_Filter ( a.eplant_id ) = 1'
      '   and NVL(a.pk_hide, '#39'N'#39') <> '#39'Y'#39
      '       ')
    Left = 44
    Top = 139
    ParamData = <
      item
        Name = 'group_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryArinvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 16
      FieldName = 'ITEMNO'
      Origin = 'a.itemno'
      FixedChar = True
      Size = 50
    end
    object QryArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 21
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      Size = 100
    end
    object QryArinvtCODE: TStringField
      DisplayLabel = 'Group Code'
      DisplayWidth = 12
      FieldName = 'CODE'
      Origin = 'g.code'
      Size = 10
    end
    object QryArinvtEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 12
      FieldName = 'EPLANT_ID'
      Origin = 'a.eplant_id'
      Size = 0
    end
    object QryArinvtREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 11
      FieldName = 'REV'
      Origin = 'a.rev'
      FixedChar = True
      Size = 15
    end
    object QryArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      Origin = 'a.class'
      FixedChar = True
      Size = 2
    end
    object QryArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Origin = 'a.descrip2'
      Size = 100
    end
    object QryArinvtID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'a.id'
      Visible = False
      Size = 0
    end
  end
  object SrcCustomer: TDataSource
    DataSet = QryCustomer
    Left = 63
    Top = 349
  end
  object QryCustomer: TFDQuery
    BeforeOpen = QryCustomerBeforeOpen
    AfterScroll = QryArinvtAfterScroll
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select null as id, '
      '       '#39'1'#39' as sort_criteria,'
      '       '#39'N/A'#39' as custno, '
      '       '#39'Non specific (blanket forecast)'#39' as company,'
      '       null as ship_to_id,'
      '       null as attn,'
      '       null as addr1,'
      '       null as city,'
      '       null as state,'
      '       null as country,'
      '       null as zip,'
      '       '#39'N/A'#39' as origin'
      '  from '
      '       dual'
      ' '
      'UNION ALL'
      ''
      'select a.id, '
      '       '#39'2'#39' as sort_criteria,'
      '       a.custno,            '
      '       a.company,'
      '       null as ship_to_id,'
      '       null as attn,'
      '       null as addr1,'
      '       null as city,'
      '       null as state,'
      '       null as country,'
      '       null as zip,'
      '       '#39'ARCUSTO'#39' as origin'
      '  from '
      '       v_arcusto a'
      ' where (:arcusto_id = 0'
      '        or'
      '        :arcusto_id = a.id )'
      ''
      'UNION ALL        '
      ''
      'select a.id, '
      '       '#39'2'#39' as sort_criteria,'
      '       a.custno, '
      '       a.company,'
      '       s.id as ship_to_id,'
      '       s.attn,'
      '       s.addr1,'
      '       s.city,'
      '       s.state,'
      '       s.country,'
      '       s.zip,'
      '       '#39'SHIP_TO'#39' as origin'
      '  from '
      '       v_arcusto a, ship_to s'
      ' where (:arcusto_id = 0'
      '        or'
      '        :arcusto_id = a.id )'
      '   and a.id = s.arcusto_id        '
      '   and misc.eplant_filter( s.eplant_id ) = 1'
      '   and NVL(s.pk_hide, '#39'N'#39') = '#39'N'#39
      '                          '
      '')
    Left = 63
    Top = 368
    ParamData = <
      item
        Name = 'arcusto_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryCustomerID: TFMTBCDField
      FieldName = 'ID'
      Visible = False
      Size = 38
    end
    object QryCustomerCUSTNO: TStringField
      DisplayLabel = 'Cust #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = '2, 3, 12'
      FixedChar = True
      Size = 10
    end
    object QryCustomerCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 18
      FieldName = 'COMPANY'
      Origin = '2, 4, 12'
      Size = 60
    end
    object QryCustomerSHIP_TO_ID: TFMTBCDField
      FieldName = 'SHIP_TO_ID'
      Visible = False
      Size = 38
    end
    object QryCustomerATTN: TStringField
      DisplayLabel = 'Ship To'
      DisplayWidth = 15
      FieldName = 'ATTN'
      Size = 60
    end
    object QryCustomerADDR1: TStringField
      DisplayLabel = 'Ship To Address'
      DisplayWidth = 30
      FieldName = 'ADDR1'
      Size = 60
    end
    object QryCustomerCITY: TStringField
      DisplayLabel = 'Ship To City'
      DisplayWidth = 30
      FieldName = 'CITY'
      FixedChar = True
      Size = 30
    end
    object QryCustomerSTATE: TStringField
      DisplayLabel = 'Ship To State or Region'
      DisplayWidth = 10
      FieldName = 'STATE'
    end
    object QryCustomerCOUNTRY: TStringField
      DisplayLabel = 'Ship To Country'
      DisplayWidth = 12
      FieldName = 'COUNTRY'
      FixedChar = True
      Size = 30
    end
    object QryCustomerZIP: TStringField
      DisplayLabel = 'Ship To Postal Code'
      DisplayWidth = 10
      FieldName = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object QryCustomerORIGIN: TStringField
      FieldName = 'ORIGIN'
      Visible = False
      FixedChar = True
      Size = 7
    end
    object QryCustomerSORT_CRITERIA: TStringField
      FieldName = 'SORT_CRITERIA'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object SrcForecast: TDataSource
    DataSet = QryForecast
    Left = 414
    Top = 243
  end
  object QryForecast: TFDQuery
    Tag = 1
    BeforeEdit = QryForecastBeforeEdit
    BeforePost = QryForecastBeforePost
    AfterPost = ApplyUpdates
    OnCalcFields = QryForecastCalcFields
    CachedUpdates = True
    OnUpdateRecord = QryForecastUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       fore_dtl_id,'
      '       req_date,'
      '       year,'
      '       month,'
      '       week,'
      '       sunday_of_week,'
      '       qty,'
      '       price'
      '  from GTT_fore_quick_entry'
      ' order by req_date')
    Left = 414
    Top = 260
    object QryForecastID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryForecastFORE_DTL_ID: TBCDField
      FieldName = 'FORE_DTL_ID'
      Visible = False
      Size = 0
    end
    object QryForecastREQ_DATE: TDateTimeField
      FieldName = 'REQ_DATE'
    end
    object QryForecastYEAR: TBCDField
      FieldName = 'YEAR'
      Visible = False
      Size = 0
    end
    object QryForecastMONTH: TBCDField
      FieldName = 'MONTH'
      Size = 0
    end
    object QryForecastWEEK: TBCDField
      FieldName = 'WEEK'
      Size = 0
    end
    object QryForecastQTY: TFMTBCDField
      FieldName = 'QTY'
      OnChange = QryForecastQTYChange
      Size = 6
    end
    object QryForecastMonth_Disp: TStringField
      FieldKind = fkCalculated
      FieldName = 'Month_Disp'
      Calculated = True
    end
    object QryForecastSUNDAY_OF_WEEK: TDateTimeField
      FieldName = 'SUNDAY_OF_WEEK'
      Visible = False
    end
    object QryForecastPRICE: TFMTBCDField
      FieldName = 'PRICE'
      Visible = False
      Size = 6
    end
  end
end
