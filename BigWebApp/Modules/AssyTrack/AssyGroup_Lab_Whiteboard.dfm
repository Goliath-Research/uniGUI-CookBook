object FrmAssyGroupLabWhiteboard: TFrmAssyGroupLabWhiteboard
  Left = 0
  Top = 0
  HelpContext = 24971
  ClientHeight = 640
  ClientWidth = 1235
  Caption = 'Labor Whiteboard Capacity By Group'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TUniPanel
    Left = 282
    Top = 0
    Width = 953
    Height = 640
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 0
      Top = 0
      Width = 5
      Height = 640
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel4: TUniPanel
      Left = 5
      Top = 1
      Width = 948
      Height = 638
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Splitter5: TUniSplitter
        Left = 0
        Top = 497
        Width = 948
        Height = 3
        Cursor = crVSplit
        Hint = ''
        Align = alBottom
        ParentColor = False
        Color = clBtnFace
      end
      object Panel1: TUniPanel
        Left = 1
        Top = 1
        Width = 946
        Height = 28
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object sbtnBack: TUniSpeedButton
          Left = 1
          Top = 1
          Width = 26
          Height = 26
          Hint = 'Move Back'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD5
            C1AD303830FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFD5C2AF304030304030FF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD8C8B760786050
            8060304030FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFD8C9B850605060987070A8804048403040303038302028202020
            20FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCDC2AE50685070A88090D8A070
            C09060A880609870509060408050303830FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF90B8A0C0F0D0B0F0C090E0B090D8A080C89070B88060B0705088603040
            30FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDFDAC3A0D0B0C0F8D0B0E8C090
            E0B0A0E0C0A0D8B090C8A090C090404840FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFDFD8C1A0C8B0C0F8D0B0E8C040584090A89080A09080A0908098
            80FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDFD8C0A0C8B0C0
            F0D0505850FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFDFD7BEA0C0A0507060FF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDF
            D6BCA0C0A0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = sbtnBackClick
        end
        object sbtnForward: TUniSpeedButton
          Left = 27
          Top = 1
          Width = 26
          Height = 26
          Hint = 'Move Forward'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80
            9080D5C1ADFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF809080202020B4A690FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80
            9080407850202020B8A791FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF809880202820303830304030404840509060407850202020B7A48DFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80A090B0E8C070B08070A88060
            A07060987060A870407850202020B5A189FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF90A890B0F0C090E0B090D8A080D0A070C09070B88060A8705090606078
            60FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90B8A0B0F0D0B0F0C0B0E8C0A0
            E8C0A0E0B070C09070B080809880CDC2ABFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF90C0A090B8A090A89080A090809880B0E8C080C890809880CEC5AEFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80
            A090A0E0C0809880D0C8B2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF90A890809880D1CBB6FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90
            B8A0DFD6BDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = sbtnForwardClick
        end
      end
      object wwDBGridPlan: TIQUniGridControl
        Left = 1
        Top = 28
        Width = 946
        Height = 469
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 729
        IQComponents.Grid.Height = 383
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcDaily
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
        IQComponents.Navigator.DataSource = SrcDaily
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 729
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 383
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcDaily
        Columns = <
          item
            FieldName = 'CNTR_TYPE'
            Title.Caption = 'Center Type~Mfg Type, Mfg Cell'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Period1'
            Title.Caption = 'Period1'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Period2'
            Title.Caption = 'Period2'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Period3'
            Title.Caption = 'Period3'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Period4'
            Title.Caption = 'Period4'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Period5'
            Title.Caption = 'Period5'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object Panel17: TUniPanel
        Left = 1
        Top = 500
        Width = 946
        Height = 138
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 2
        Caption = ''
        object wwDBGridTotals: TIQUniGridControl
          Left = 1
          Top = 1
          Width = 944
          Height = 136
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 727
          IQComponents.Grid.Height = 50
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcTotals
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
          IQComponents.Navigator.DataSource = SrcTotals
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 727
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
          DataSource = SrcTotals
          Columns = <
            item
              FieldName = 'TITLE'
              Title.Caption = 'TITLE'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Period1'
              Title.Caption = 'Period1'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Period2'
              Title.Caption = 'Period2'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Period3'
              Title.Caption = 'Period3'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Period4'
              Title.Caption = 'Period4'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Period5'
              Title.Caption = 'Period5'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 282
    Height = 640
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 0
      Top = 273
      Width = 282
      Height = 4
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
    end
    object Splitter4: TUniSplitter
      Left = 0
      Top = 413
      Width = 282
      Height = 4
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
    end
    object Panel5: TUniPanel
      Left = 1
      Top = 28
      Width = 280
      Height = 109
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object Splitter3: TUniSplitter
        Left = 105
        Top = 0
        Width = 4
        Height = 109
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object Panel10: TUniPanel
        Left = 1
        Top = 1
        Width = 105
        Height = 107
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        DesignSize = (
          105
          107)
        object Label1: TUniLabel
          Left = 8
          Top = 8
          Width = 50
          Height = 13
          Hint = ''
          Caption = 'Start Date'
          TabOrder = 1
        end
        object Label2: TUniLabel
          Left = 8
          Top = 32
          Width = 61
          Height = 13
          Hint = ''
          Caption = 'Actual Hours'
          TabOrder = 2
        end
        object Bevel1: TUniPanel
          Left = 1
          Top = 56
          Width = 103
          Height = 5
          Hint = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          Caption = ''
        end
        object Label3: TUniLabel
          Left = 8
          Top = 68
          Width = 85
          Height = 13
          Hint = ''
          Caption = 'Delta From Actual'
          TabOrder = 4
        end
      end
      object Panel11: TUniPanel
        Left = 109
        Top = 1
        Width = 171
        Height = 107
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          171
          107)
        object Bevel2: TUniPanel
          Left = 1
          Top = 56
          Width = 169
          Height = 5
          Hint = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          Caption = ''
        end
        object wwDBDateTimePickerStartDate: TUniDBDateTimePicker
          Left = 1
          Top = 5
          Width = 168
          Height = 21
          Hint = ''
          DateTime = 42671.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object edActualHours: TUniEdit
          Left = 1
          Top = 29
          Width = 168
          Height = 21
          Hint = ''
          Text = '0'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          OnChange = edActualHoursChange
        end
        object edDeltaFromActual: TUniEdit
          Left = 1
          Top = 65
          Width = 168
          Height = 21
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
      end
    end
    object Panel6: TUniPanel
      Left = 1
      Top = 137
      Width = 280
      Height = 136
      Hint = ''
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object Panel7: TUniPanel
        Left = 1
        Top = 1
        Width = 278
        Height = 28
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = '  Mfg Type'
      end
      object gridMfgtype: TIQUniGridControl
        Left = 1
        Top = 28
        Width = 278
        Height = 108
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 61
        IQComponents.Grid.Height = 22
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcMfgtype
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
        IQComponents.Navigator.DataSource = SrcMfgtype
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 61
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 22
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcMfgtype
        Columns = <
          item
            FieldName = 'MFGTYPE'
            Title.Caption = 'Mfg Type'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
    end
    object Panel8: TUniPanel
      Left = 1
      Top = 417
      Width = 280
      Height = 181
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      object gridEmpLevel: TIQUniGridControl
        Left = 1
        Top = 28
        Width = 278
        Height = 153
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 61
        IQComponents.Grid.Height = 67
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcEmpLevel
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
        IQComponents.Navigator.DataSource = SrcEmpLevel
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 61
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 67
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcEmpLevel
        Columns = <
          item
            FieldName = 'CODE'
            Title.Caption = 'Code'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object Panel9: TUniPanel
        Left = 1
        Top = 1
        Width = 278
        Height = 28
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = ' Employee Level'
      end
    end
    object Panel12: TUniPanel
      Left = 1
      Top = 1
      Width = 280
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Caption = '  Selection Criteria'
    end
    object Panel13: TUniPanel
      Left = 1
      Top = 277
      Width = 280
      Height = 136
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      Caption = ''
      object Panel14: TUniPanel
        Left = 1
        Top = 1
        Width = 278
        Height = 28
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = '  Mfg Cell'
      end
      object gridMfgCell: TIQUniGridControl
        Left = 1
        Top = 28
        Width = 278
        Height = 108
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 61
        IQComponents.Grid.Height = 22
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcMfgCell
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
        IQComponents.Navigator.DataSource = SrcMfgCell
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 61
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 22
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcMfgCell
        Columns = <
          item
            FieldName = 'MFGCELL'
            Title.Caption = 'Mfg Cell'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
    end
    object Panel15: TUniPanel
      Left = 1
      Top = 598
      Width = 280
      Height = 42
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 5
      Caption = ''
      object Panel16: TUniPanel
        Left = 172
        Top = 1
        Width = 108
        Height = 40
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object sbtnApply: TUniSpeedButton
          Tag = 1999
          Left = 4
          Top = 7
          Width = 97
          Height = 25
          Hint = ''
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000C21E0000C21E00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF034464034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4A4A4A4A4A4AFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF0344640ED1FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4A4A4AD6D6D64A4A4AFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FF00669A14D3FF034464FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070D7D7D74A
            4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FF0099CC1BD5FF1BD5FF034464FF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1A1A1D9D9D9D9
            D9D94A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF00669A22D7FF22D7FF034464FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070DA
            DADADADADA4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF00669A00669A00669A29DAFF034464034464034464FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070707070707070DC
            DCDC4A4A4A4A4A4A4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FF00669A30DCFF30DCFF034464FF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070DEDEDEDE
            DEDE4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF00669A37DEFF37DEFF034464FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070DF
            DFDFDFDFDF4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF00669A3DE0FF3DE0FF3DE0FF034464FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070E1
            E1E1E1E1E1E1E1E14A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF00669A00669A00669A00669A44E3FF034464034464034464034464FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070707070707070707070E3
            E3E34A4A4A4A4A4A4A4A4A4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF00669A4BE5FF4BE5FF4BE5FF4BE5FF034464FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070E5E5E5E5E5E5E5
            E5E5E5E5E54A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FF00669A5CEBFE5CEBFE5CEBFE5CEBFE034464FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070E9E9E9E9
            E9E9E9E9E9E9E9E94A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FF0099CC00669A70F1FE70F1FE70F1FE70F1FE034464FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1A1A1707070EE
            EEEEEEEEEEEEEEEEEEEEEE4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FF0099CC0344640344640344640344640344640344
            64FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1A1A14A
            4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Caption = 'Apply'
          ParentColor = False
          Color = clWindow
          OnClick = sbtnApplyClick
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 341
    Top = 132
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
    ModuleName = 'FrmAssyGroupLabWhiteboard'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 373
    Top = 132
  end
  object SrcMfgtype: TDataSource
    DataSet = QryMfgtype
    Left = 48
    Top = 205
  end
  object SrcMfgCell: TDataSource
    DataSet = QryMfgCell
    Left = 48
    Top = 341
  end
  object SrcEmpLevel: TDataSource
    DataSet = QryEmpLevel
    Left = 48
    Top = 481
  end
  object QryMfgtype: TFDQuery
    Active = True
    BeforeOpen = QryMfgtypeBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select gtt.id, '
      '       gtt.batch,'
      '       gtt.source,'
      '       gtt.csource_id as mfgtype,'
      '       m.descrip'
      '  from gtt_criteria gtt,'
      '       mfgtype m'
      ' where gtt.batch = :batch'
      '   and gtt.source = '#39'MFGTYPE'#39'        '
      '   and rtrim(gtt.csource_id) = rtrim(m.mfgtype)'
      ' order by gtt.id')
    Left = 48
    Top = 233
    ParamData = <
      item
        Name = 'BATCH'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryMfgtypeMFGTYPE: TStringField
      DisplayLabel = 'Mfg Type'
      DisplayWidth = 20
      FieldName = 'MFGTYPE'
      Origin = 'MFGTYPE'
    end
    object QryMfgtypeDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 19
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      FixedChar = True
    end
    object QryMfgtypeID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryMfgtypeBATCH: TBCDField
      FieldName = 'BATCH'
      Origin = 'BATCH'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryMfgtypeSOURCE: TStringField
      FieldName = 'SOURCE'
      Origin = 'SOURCE'
      Visible = False
      Size = 30
    end
  end
  object QryMfgCell: TFDQuery
    Active = True
    BeforeOpen = QryMfgtypeBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select gtt.id, '
      '       gtt.batch,'
      '       gtt.source,'
      '       gtt.nsource_id as mfgcell_id,'
      '       m.mfgcell,'
      '       m.descrip'
      '  from gtt_criteria gtt,'
      '       mfgcell m'
      ' where gtt.batch = :batch'
      '   and gtt.source = '#39'MFGCELL'#39'        '
      '   and gtt.nsource_id = m.id'
      ' order by gtt.id')
    Left = 48
    Top = 369
    ParamData = <
      item
        Name = 'BATCH'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryMfgCellMFGCELL: TStringField
      DisplayLabel = 'Mfg Cell'
      DisplayWidth = 15
      FieldName = 'MFGCELL'
      Origin = 'MFGCELL'
      Required = True
      FixedChar = True
      Size = 15
    end
    object QryMfgCellDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 24
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      FixedChar = True
      Size = 25
    end
    object QryMfgCellID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryMfgCellBATCH: TBCDField
      FieldName = 'BATCH'
      Origin = 'BATCH'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryMfgCellSOURCE: TStringField
      FieldName = 'SOURCE'
      Origin = 'SOURCE'
      Visible = False
      Size = 30
    end
    object QryMfgCellMFGCELL_ID: TBCDField
      FieldName = 'MFGCELL_ID'
      Origin = 'MFGCELL_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object QryEmpLevel: TFDQuery
    Active = True
    BeforeOpen = QryMfgtypeBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select gtt.id, '
      '       gtt.batch,'
      '       gtt.source,'
      '       gtt.nsource_id as emp_level_id,'
      '       e.code,'
      '       e.descrip'
      '  from gtt_criteria gtt,'
      '       emp_level e'
      ' where gtt.batch = :batch'
      '   and gtt.source = '#39'EMP_LEVEL'#39'        '
      '   and gtt.nsource_id = e.id'
      ' order by gtt.id')
    Left = 48
    Top = 509
    ParamData = <
      item
        Name = 'BATCH'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryEmpLevelCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'CODE'
      Origin = 'CODE'
      Required = True
      Size = 10
    end
    object QryEmpLevelDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 29
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 30
    end
    object QryEmpLevelID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryEmpLevelBATCH: TBCDField
      FieldName = 'BATCH'
      Origin = 'BATCH'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryEmpLevelSOURCE: TStringField
      FieldName = 'SOURCE'
      Origin = 'SOURCE'
      Visible = False
      Size = 30
    end
    object QryEmpLevelEMP_LEVEL_ID: TBCDField
      FieldName = 'EMP_LEVEL_ID'
      Origin = 'EMP_LEVEL_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object PkMfgType: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select mfgtype,'
      '       descrip'
      '  from mfgtype'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 77
    Top = 205
    object PkMfgTypeMFGTYPE: TStringField
      DisplayLabel = 'Mfg Type'
      FieldName = 'MFGTYPE'
      Origin = 'MFGTYPE'
      FixedChar = True
      Size = 10
    end
    object PkMfgTypeDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      FixedChar = True
    end
  end
  object PkMfgCell: TIQWebHpick
    BeforeOpen = PkMfgCellBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select m.mfgcell as mfgcell, '
      '       m.mfgtype as mfgtype, '
      '       m.eplant_id as eplant_id,'
      '       m.id as id'
      ''
      '-- HPICK_FROM_START'
      '       '
      '  from mfgcell m,'
      
        '       (select count(*) the_count from gtt_criteria where batch ' +
        '= :batch and source = '#39'MFGTYPE'#39')  x'
      ''
      '-- HPICK_WHERE_START'
      '       '
      ' where '
      '       ( x.the_count = 0'
      '         or '
      
        '         rtrim(m.mfgtype) in ( select csource_id from gtt_criter' +
        'ia where batch = :batch and source = '#39'MFGTYPE'#39' ))'
      '   and misc.eplant_filter(eplant_id) = 1'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 77
    Top = 341
    ParamData = <
      item
        Name = 'batch'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object PkMfgCellMFGCELL: TStringField
      DisplayLabel = 'Mfg Cell'
      FieldName = 'MFGCELL'
      Origin = 'm.mfgcell'
      FixedChar = True
      Size = 15
    end
    object PkMfgCellID: TBCDField
      FieldName = 'ID'
      Origin = 'm.id'
      Visible = False
      Size = 0
    end
    object PkMfgCellMFGTYPE: TStringField
      DisplayLabel = 'MfgType'
      FieldName = 'MFGTYPE'
      Origin = 'm.mfgtype'
      FixedChar = True
      Size = 10
    end
    object PkMfgCellEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'm.eplant_id'
      Size = 0
    end
  end
  object PkEmpLevel: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as id,'
      '       code as code,'
      '       descrip as descrip'
      '  from emp_level')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 77
    Top = 482
    object PkEmpLevelID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      Visible = False
      Size = 0
    end
    object PkEmpLevelCODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'CODE'
      Origin = 'CODE'
      Size = 10
    end
    object PkEmpLevelDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 30
    end
  end
  object SrcDaily: TDataSource
    DataSet = QryDaily
    Left = 359
    Top = 204
  end
  object QryDaily: TFDQuery
    Tag = 1
    BeforeOpen = QryDailyBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '
      '       v.mfgtype,'
      '       v.mfgcell,'
      '       v.mfgcell_id,'
      '       v.cntr_type,'
      '       v.eplant_id,'
      '       '
      '       -- period 1'
      '       sum( decode( trunc(r.prod_date) - trunc(:start_date) + 1,'
      '                    1, r.labor_hrs_initiated,'
      '                    0 )) as hrs_initiated_1,'
      '       sum( decode( trunc(r.prod_date) - trunc(:start_date) + 1,'
      '                    1, r.labor_hrs_planned,'
      '                    0 )) as hrs_planned_1,'
      '       sum( decode( trunc(r.prod_date) - trunc(:start_date) + 1,'
      '                    1, r.labor_hrs_unsched,'
      '                    0 )) as hrs_unsched_1,'
      '                                    '
      '       -- period 2'
      '       sum( decode( trunc(r.prod_date) - trunc(:start_date) + 1,'
      '                    2, r.labor_hrs_initiated,'
      '                    0 )) as hrs_initiated_2,'
      '       sum( decode( trunc(r.prod_date) - trunc(:start_date) + 1,'
      '                    2, r.labor_hrs_planned,'
      '                    0 )) as hrs_planned_2,'
      '       sum( decode( trunc(r.prod_date) - trunc(:start_date) + 1,'
      '                    2, r.labor_hrs_unsched,'
      '                    0 )) as hrs_unsched_2,'
      '                                           '
      '       -- period 3'
      '       sum( decode( trunc(r.prod_date) - trunc(:start_date) + 1,'
      '                    3, r.labor_hrs_initiated,'
      '                    0 )) as hrs_initiated_3,'
      '       sum( decode( trunc(r.prod_date) - trunc(:start_date) + 1,'
      '                    3, r.labor_hrs_planned,'
      '                    0 )) as hrs_planned_3,'
      '       sum( decode( trunc(r.prod_date) - trunc(:start_date) + 1,'
      '                    3, r.labor_hrs_unsched,'
      '                    0 )) as hrs_unsched_3,'
      '                                           '
      '       -- period 4'
      '       sum( decode( trunc(r.prod_date) - trunc(:start_date) + 1,'
      '                    4, r.labor_hrs_initiated,'
      '                    0 )) as hrs_initiated_4,'
      '       sum( decode( trunc(r.prod_date) - trunc(:start_date) + 1,'
      '                    4, r.labor_hrs_planned,'
      '                    0 )) as hrs_planned_4,'
      '       sum( decode( trunc(r.prod_date) - trunc(:start_date) + 1,'
      '                    4, r.labor_hrs_unsched,'
      '                    0 )) as hrs_unsched_4,'
      '                                           '
      '       -- period 5'
      '       sum( decode( trunc(r.prod_date) - trunc(:start_date) + 1,'
      '                    5, r.labor_hrs_initiated,'
      '                    0 )) as hrs_initiated_5,'
      '       sum( decode( trunc(r.prod_date) - trunc(:start_date) + 1,'
      '                    5, r.labor_hrs_planned,'
      '                    0 )) as hrs_planned_5,'
      '       sum( decode( trunc(r.prod_date) - trunc(:start_date) + 1,'
      '                    5, r.labor_hrs_unsched,'
      '                    0 )) as hrs_unsched_5'
      '                                          '
      '  from '
      '       v_mfgtype_emp_level_assy_group v,'
      '       v_day_labor_day_assy_group r'
      '       -- v_labor_day_avail a'
      '       '
      ' where '
      '       v.batch = :batch'
      '   and v.mfgtype = r.mfgtype(+)'
      '   and NVL(v.mfgcell_id, 0) = NVL( r.mfgcell_id(+), 0)'
      '   and v.cntr_type = r.cntr_type(+)'
      '   and nvl(v.eplant_id,0) = nvl(r.eplant_id(+), 0)'
      '   and misc.eplant_filter( v.eplant_id ) = 1'
      
        '   and trunc(r.prod_date) + 1 - trunc(:start_date) between 1 and' +
        ' 5'
      '   '
      'group by '
      '       v.mfgtype,'
      '       v.mfgcell_id,'
      '       v.mfgcell,'
      '       v.cntr_type,'
      '       v.eplant_id'
      ''
      'order by v.cntr_type,'
      '         v.eplant_id,'
      '         v.mfgtype,'
      '         v.mfgcell_id,'
      '         v.mfgcell'
      '                '
      '')
    Left = 359
    Top = 232
    ParamData = <
      item
        Name = 'START_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'BATCH'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryDailyMFGTYPE: TStringField
      FieldName = 'MFGTYPE'
      Origin = 'MFGTYPE'
      Size = 10
    end
    object QryDailyMFGCELL: TStringField
      FieldName = 'MFGCELL'
      Origin = 'MFGCELL'
      Size = 15
    end
    object QryDailyMFGCELL_ID: TBCDField
      FieldName = 'MFGCELL_ID'
      Origin = 'MFGCELL_ID'
      Precision = 15
      Size = 0
    end
    object QryDailyPeriod1: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Period1'
      Calculated = True
    end
    object QryDailyPeriod2: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Period2'
      Calculated = True
    end
    object QryDailyPeriod3: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Period3'
      Calculated = True
    end
    object QryDailyPeriod4: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Period4'
      Calculated = True
    end
    object QryDailyPeriod5: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Period5'
      Calculated = True
    end
    object QryDailyCNTR_TYPE: TStringField
      FieldName = 'CNTR_TYPE'
      Origin = 'CNTR_TYPE'
    end
    object QryDailyEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Precision = 15
      Size = 0
    end
    object QryDailyHRS_INITIATED_1: TFMTBCDField
      FieldName = 'HRS_INITIATED_1'
      Origin = 'HRS_INITIATED_1'
      Precision = 38
      Size = 38
    end
    object QryDailyHRS_PLANNED_1: TFMTBCDField
      FieldName = 'HRS_PLANNED_1'
      Origin = 'HRS_PLANNED_1'
      Precision = 38
      Size = 38
    end
    object QryDailyHRS_UNSCHED_1: TFMTBCDField
      FieldName = 'HRS_UNSCHED_1'
      Origin = 'HRS_UNSCHED_1'
      Precision = 38
      Size = 38
    end
    object QryDailyHRS_INITIATED_2: TFMTBCDField
      FieldName = 'HRS_INITIATED_2'
      Origin = 'HRS_INITIATED_2'
      Precision = 38
      Size = 38
    end
    object QryDailyHRS_PLANNED_2: TFMTBCDField
      FieldName = 'HRS_PLANNED_2'
      Origin = 'HRS_PLANNED_2'
      Precision = 38
      Size = 38
    end
    object QryDailyHRS_UNSCHED_2: TFMTBCDField
      FieldName = 'HRS_UNSCHED_2'
      Origin = 'HRS_UNSCHED_2'
      Precision = 38
      Size = 38
    end
    object QryDailyHRS_INITIATED_3: TFMTBCDField
      FieldName = 'HRS_INITIATED_3'
      Origin = 'HRS_INITIATED_3'
      Precision = 38
      Size = 38
    end
    object QryDailyHRS_PLANNED_3: TFMTBCDField
      FieldName = 'HRS_PLANNED_3'
      Origin = 'HRS_PLANNED_3'
      Precision = 38
      Size = 38
    end
    object QryDailyHRS_UNSCHED_3: TFMTBCDField
      FieldName = 'HRS_UNSCHED_3'
      Origin = 'HRS_UNSCHED_3'
      Precision = 38
      Size = 38
    end
    object QryDailyHRS_INITIATED_4: TFMTBCDField
      FieldName = 'HRS_INITIATED_4'
      Origin = 'HRS_INITIATED_4'
      Precision = 38
      Size = 38
    end
    object QryDailyHRS_PLANNED_4: TFMTBCDField
      FieldName = 'HRS_PLANNED_4'
      Origin = 'HRS_PLANNED_4'
      Precision = 38
      Size = 38
    end
    object QryDailyHRS_UNSCHED_4: TFMTBCDField
      FieldName = 'HRS_UNSCHED_4'
      Origin = 'HRS_UNSCHED_4'
      Precision = 38
      Size = 38
    end
    object QryDailyHRS_INITIATED_5: TFMTBCDField
      FieldName = 'HRS_INITIATED_5'
      Origin = 'HRS_INITIATED_5'
      Precision = 38
      Size = 38
    end
    object QryDailyHRS_PLANNED_5: TFMTBCDField
      FieldName = 'HRS_PLANNED_5'
      Origin = 'HRS_PLANNED_5'
      Precision = 38
      Size = 38
    end
    object QryDailyHRS_UNSCHED_5: TFMTBCDField
      FieldName = 'HRS_UNSCHED_5'
      Origin = 'HRS_UNSCHED_5'
      Precision = 38
      Size = 38
    end
  end
  object QryTotals: TFDQuery
    Tag = 1
    OnCalcFields = QryTotalsCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '#39'Totals'#39' as title'
      '  from dual')
    Left = 407
    Top = 232
    object QryTotalsTITLE: TStringField
      FieldName = 'TITLE'
      Origin = 'TITLE'
      FixedChar = True
      Size = 6
    end
    object QryTotalsPeriod1: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Period1'
      Calculated = True
    end
    object QryTotalsPeriod2: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Period2'
      Calculated = True
    end
    object QryTotalsPeriod3: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Period3'
      Calculated = True
    end
    object QryTotalsPeriod4: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Period4'
      Calculated = True
    end
    object QryTotalsPeriod5: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Period5'
      Calculated = True
    end
    object QryTotalsHrs_Initiated_1: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Hrs_Initiated_1'
      Calculated = True
    end
    object QryTotalsHrs_Initiated_2: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Hrs_Initiated_2'
      Calculated = True
    end
    object QryTotalsHrs_Initiated_3: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Hrs_Initiated_3'
      Calculated = True
    end
    object QryTotalsHrs_Initiated_4: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Hrs_Initiated_4'
      Calculated = True
    end
    object QryTotalsHrs_Initiated_5: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Hrs_Initiated_5'
      Calculated = True
    end
    object QryTotalsHrs_Planned_1: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Hrs_Planned_1'
      Calculated = True
    end
    object QryTotalsHrs_Planned_2: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Hrs_Planned_2'
      Calculated = True
    end
    object QryTotalsHrs_Planned_3: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Hrs_Planned_3'
      Calculated = True
    end
    object QryTotalsHrs_Planned_4: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Hrs_Planned_4'
      Calculated = True
    end
    object QryTotalsHrs_Planned_5: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Hrs_Planned_5'
      Calculated = True
    end
    object QryTotalsHrs_Unsched_1: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Hrs_Unsched_1'
      Calculated = True
    end
    object QryTotalsHrs_Unsched_2: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Hrs_Unsched_2'
      Calculated = True
    end
    object QryTotalsHrs_Unsched_3: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Hrs_Unsched_3'
      Calculated = True
    end
    object QryTotalsHrs_Unsched_4: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Hrs_Unsched_4'
      Calculated = True
    end
    object QryTotalsHrs_Unsched_5: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Hrs_Unsched_5'
      Calculated = True
    end
    object QryTotalsTotal_1: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Total_1'
      Calculated = True
    end
    object QryTotalsTotal_2: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Total_2'
      Calculated = True
    end
    object QryTotalsTotal_3: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Total_3'
      Calculated = True
    end
    object QryTotalsTotal_4: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Total_4'
      Calculated = True
    end
    object QryTotalsTotal_5: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Total_5'
      Calculated = True
    end
    object QryTotalsStandard_1: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Standard_1'
      Calculated = True
    end
    object QryTotalsStandard_2: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Standard_2'
      Calculated = True
    end
    object QryTotalsStandard_3: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Standard_3'
      Calculated = True
    end
    object QryTotalsStandard_4: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Standard_4'
      Calculated = True
    end
    object QryTotalsStandard_5: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Standard_5'
      Calculated = True
    end
    object QryTotalsDelta_1: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Delta_1'
      Calculated = True
    end
    object QryTotalsDelta_2: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Delta_2'
      Calculated = True
    end
    object QryTotalsDelta_3: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Delta_3'
      Calculated = True
    end
    object QryTotalsDelta_4: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Delta_4'
      Calculated = True
    end
    object QryTotalsDelta_5: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Delta_5'
      Calculated = True
    end
  end
  object SrcTotals: TDataSource
    DataSet = QryTotals
    Left = 407
    Top = 204
  end
  object QryStandardTotalHrs: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select sum(hrs_avail) as hrs_avail'
      '  from '
      '       v_labor_day_avail v,'
      
        '       (select count(*) the_count from gtt_criteria where batch ' +
        '= :batch and source = '#39'MFGTYPE'#39')   mfgtype_filter,'
      
        '       (select count(*) the_count from gtt_criteria where batch ' +
        '= :batch and source = '#39'MFGCELL'#39')   mfgcell_filter,'
      
        '       (select count(*) the_count from gtt_criteria where batch ' +
        '= :batch and source = '#39'EMP_LEVEL'#39') emp_level_filter'
      ' where '
      '       ( mfgtype_filter.the_count = 0'
      '        or'
      
        '        rtrim(v.mfgtype) in (select csource_id from gtt_criteria' +
        ' where batch = :batch and source = '#39'MFGTYPE'#39'))'
      '   and ( mfgcell_filter.the_count = 0'
      '         or'
      
        '         v.mfgcell_id in (select nsource_id from gtt_criteria wh' +
        'ere batch = :batch and source = '#39'MFGCELL'#39'))'
      ''
      '   and ( emp_level_filter.the_count = 0'
      '         or'
      
        '         v.emp_level_id in (select nsource_id from gtt_criteria ' +
        'where batch = :batch and source = '#39'EMP_LEVEL'#39'))'
      ''
      '   and v.week_day = :day'
      '   and v.hrs_avail > 0')
    Left = 439
    Top = 232
    ParamData = <
      item
        Name = 'BATCH'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'DAY'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryStandardTotalHrsHRS_AVAIL: TFMTBCDField
      FieldName = 'HRS_AVAIL'
      Origin = 'HRS_AVAIL'
      Precision = 38
      Size = 38
    end
  end
end
