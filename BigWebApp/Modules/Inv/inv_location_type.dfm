object FrmInvLocationType: TFrmInvLocationType
  Left = 0
  Top = 0
  HelpContext = 19699
  ClientHeight = 535
  ClientWidth = 663
  Caption = 'Location Type'
  OnShow = UniFormShow
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
    Top = 189
    Width = 663
    Height = 4
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 28
    Width = 663
    Height = 161
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    Color = clWindow
    object Splitter2: TUniSplitter
      Left = 321
      Top = 0
      Width = 4
      Height = 161
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel3: TUniPanel
      Left = 1
      Top = 1
      Width = 321
      Height = 159
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Splitter3: TUniSplitter
        Left = 125
        Top = 0
        Width = 6
        Height = 159
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object Panel4: TUniPanel
        Left = 1
        Top = 1
        Width = 125
        Height = 157
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Label1: TUniLabel
          Left = 8
          Top = 8
          Width = 53
          Height = 13
          Hint = ''
          Caption = 'Description'
          TabOrder = 1
        end
        object lblLength: TUniLabel
          Left = 8
          Top = 56
          Width = 33
          Height = 13
          Hint = ''
          Caption = 'Length'
          TabOrder = 2
        end
        object lblWidth: TUniLabel
          Left = 8
          Top = 80
          Width = 28
          Height = 13
          Hint = ''
          Caption = 'Width'
          TabOrder = 3
        end
        object lblHeight: TUniLabel
          Left = 8
          Top = 104
          Width = 31
          Height = 13
          Hint = ''
          Caption = 'Height'
          TabOrder = 4
        end
        object Label5: TUniLabel
          Left = 8
          Top = 128
          Width = 34
          Height = 13
          Hint = ''
          Caption = 'Weight'
          TabOrder = 5
        end
        object Label2: TUniLabel
          Left = 8
          Top = 32
          Width = 45
          Height = 13
          Hint = ''
          Caption = 'Sub Type'
          TabOrder = 6
        end
      end
      object Panel5: TUniPanel
        Left = 131
        Top = 1
        Width = 190
        Height = 157
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          190
          157)
        object DBEdit1: TUniDBEdit
          Left = 1
          Top = 5
          Width = 189
          Height = 21
          Hint = ''
          DataField = 'DESCRIP'
          DataSource = SrcLocationType
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object DBEdit2: TUniDBEdit
          Left = 1
          Top = 53
          Width = 104
          Height = 21
          Hint = ''
          DataField = 'LENGTH'
          DataSource = SrcLocationType
          TabOrder = 2
        end
        object DBEdit3: TUniDBEdit
          Left = 1
          Top = 77
          Width = 104
          Height = 21
          Hint = ''
          DataField = 'WIDTH'
          DataSource = SrcLocationType
          TabOrder = 3
        end
        object DBEdit4: TUniDBEdit
          Left = 1
          Top = 101
          Width = 104
          Height = 21
          Hint = ''
          DataField = 'HEIGHT'
          DataSource = SrcLocationType
          TabOrder = 4
        end
        object DBEdit5: TUniDBEdit
          Left = 1
          Top = 125
          Width = 104
          Height = 21
          Hint = ''
          DataField = 'WEIGHT'
          DataSource = SrcLocationType
          TabOrder = 5
        end
        object wwDBComboBoxSubType: TUniDBComboBox
          Left = 1
          Top = 29
          Width = 189
          Height = 21
          Hint = ''
          Anchors = [akLeft, akTop, akRight]
          DataField = 'SUB_TYPE'
          DataSource = SrcLocationType
          Style = csDropDownList
          Items.Strings = (
            'Default'#9'D'
            'Raw Material Staging'#9'S'
            'Milk Run'#9'M'
            'Shuttle Trailer'#9'T')
          TabOrder = 1
        end
      end
    end
    object Panel6: TUniPanel
      Left = 325
      Top = 1
      Width = 338
      Height = 159
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Panel9: TUniPanel
        Left = 1
        Top = 1
        Width = 336
        Height = 157
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Splitter4: TUniSplitter
          Left = 125
          Top = 0
          Width = 6
          Height = 157
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object Panel10: TUniPanel
          Left = 1
          Top = 1
          Width = 125
          Height = 155
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label6: TUniLabel
            Left = 8
            Top = 8
            Width = 89
            Height = 13
            Hint = ''
            Caption = 'Items per Location'
            TabOrder = 1
          end
          object Label7: TUniLabel
            Left = 8
            Top = 32
            Width = 79
            Height = 13
            Hint = ''
            Caption = 'Allow Mixed Lots'
            TabOrder = 2
          end
          object Label8: TUniLabel
            Left = 8
            Top = 56
            Width = 76
            Height = 13
            Hint = ''
            Caption = 'Max Case Stack'
            TabOrder = 3
          end
          object Label9: TUniLabel
            Left = 8
            Top = 80
            Width = 78
            Height = 13
            Hint = ''
            Caption = 'Max Pallet Stack'
            TabOrder = 4
          end
          object Label10: TUniLabel
            Left = 8
            Top = 104
            Width = 88
            Height = 13
            Hint = ''
            Caption = 'Allocate Sequence'
            TabOrder = 5
          end
        end
        object Panel11: TUniPanel
          Left = 131
          Top = 1
          Width = 205
          Height = 155
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object DBEdit8: TUniDBEdit
            Left = 1
            Top = 53
            Width = 104
            Height = 21
            Hint = ''
            DataField = 'MAX_CASE_STACK'
            DataSource = SrcLocationType
            TabOrder = 0
          end
          object DBEdit9: TUniDBEdit
            Left = 1
            Top = 77
            Width = 104
            Height = 21
            Hint = ''
            DataField = 'MAX_PALLET_STACK'
            DataSource = SrcLocationType
            TabOrder = 1
          end
          object wwDBComboBox2: TUniDBComboBox
            Left = 1
            Top = 101
            Width = 104
            Height = 21
            Hint = ''
            DataField = 'ALLOCATE_SEQ'
            DataSource = SrcLocationType
            Style = csDropDownList
            Items.Strings = (
              'FIFO'#9'F'
              'LIFO'#9'L')
            TabOrder = 2
          end
          object wwDBComboBox1: TUniDBComboBox
            Left = 1
            Top = 5
            Width = 104
            Height = 21
            Hint = ''
            DataField = 'ITEMS_PER_LOC'
            DataSource = SrcLocationType
            Style = csDropDownList
            Items.Strings = (
              '1'#9'1'
              '2'#9'2'
              '3'#9'3'
              '4'#9'4'
              '5'#9'5'
              '6'#9'6'
              '7'#9'7'
              '8'#9'8'
              '9'#9'9'
              'Multiple'#9'M')
            TabOrder = 3
          end
          object dbchkAlloMixedLots: TUniDBCheckBox
            Left = 1
            Top = 31
            Width = 21
            Height = 17
            Hint = ''
            DataField = 'ALLOW_MIXED_LOTS'
            DataSource = SrcLocationType
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = ''
            TabOrder = 4
          end
        end
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 193
    Width = 663
    Height = 342
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object pgctrlDetails: TUniPageControl
      Left = 1
      Top = 1
      Width = 661
      Height = 340
      Hint = ''
      ActivePage = tabLocations
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object tabLocations: TUniTabSheet
        Hint = ''
        Caption = 'Locations'
        object gridLocations: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 653
          Height = 312
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 436
          IQComponents.Grid.Height = 226
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcLocations
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
          IQComponents.Navigator.DataSource = SrcLocations
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 436
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 226
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcLocations
          Columns = <
            item
              FieldName = 'ID'
              Title.Caption = 'Location ID'
              Width = 64
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'LOCATION'
              Title.Caption = 'Location Name'
              Width = 64
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIPTION'
              Title.Caption = 'Description'
              Width = 64
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EPLANT_NAME'
              Title.Caption = 'EPlant'
              Width = 64
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DIVISION'
              Title.Caption = 'Division'
              Width = 64
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ACTIVE_TYPE'
              Title.Caption = 'Active'
              Width = 64
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'LO_ZONE_CODE'
              Title.Caption = 'Locating Zone'
              Width = 64
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'AL_ZONE_CODE'
              Title.Caption = 'Allocating Zone'
              Width = 64
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DZ_ZONE_CODE'
              Title.Caption = 'Drop Zone'
              Width = 64
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'WK_ZONE_CODE'
              Title.Caption = 'Work Zone'
              Width = 64
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
      end
      object tabItemCapacity: TUniTabSheet
        Hint = ''
        ImageIndex = 3
        Caption = 'Item Capacity'
        object Panel12: TUniPanel
          Left = 0
          Top = 0
          Width = 653
          Height = 28
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object NavItemCap: TUniDBNavigator
            Left = 413
            Top = 1
            Width = 240
            Height = 26
            Hint = ''
            DataSource = SrcItemCap
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
        object gridItemCap: TIQUniGridControl
          Left = 0
          Top = 28
          Width = 653
          Height = 284
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 436
          IQComponents.Grid.Height = 198
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcItemCap
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
          IQComponents.Navigator.DataSource = SrcItemCap
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 436
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 198
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcItemCap
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
              FieldName = 'PK_UNIT_TYPE'
              Title.Caption = 'Pk Unit Type'
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
        object wwDBComboBoxItemCapUnitType: TUniDBComboBox
          Left = 317
          Top = 132
          Width = 121
          Height = 21
          Hint = ''
          Style = csDropDownList
          Items.Strings = (
            'Loose'#9'E'
            'Case'#9'C'
            'Pallet'#9'P')
          TabOrder = 2
        end
        object wwDBComboDlgItemCap: TUniEdit
          Left = 317
          Top = 159
          Width = 121
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 3
          ReadOnly = True
        end
      end
      object tabInvGroupCapacity: TUniTabSheet
        Hint = ''
        ImageIndex = 2
        Caption = 'Inv Group Capacity'
        object Panel13: TUniPanel
          Left = 0
          Top = 0
          Width = 653
          Height = 28
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object NavGroupCap: TUniDBNavigator
            Left = 413
            Top = 1
            Width = 240
            Height = 26
            Hint = ''
            DataSource = SrcGroupCap
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
        object gridGroupCap: TIQUniGridControl
          Left = 0
          Top = 28
          Width = 653
          Height = 284
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 436
          IQComponents.Grid.Height = 198
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcGroupCap
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
          IQComponents.Navigator.DataSource = SrcGroupCap
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 436
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 198
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcGroupCap
          Columns = <
            item
              FieldName = 'CODE'
              Title.Caption = 'Code'
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
              FieldName = 'PK_UNIT_TYPE'
              Title.Caption = 'Pk Unit Type'
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
        object wwDBComboBoxGroupCapUnitType: TUniDBComboBox
          Left = 321
          Top = 136
          Width = 121
          Height = 21
          Hint = ''
          Style = csDropDownList
          Items.Strings = (
            'Loose'#9'E'
            'Case'#9'C'
            'Pallet'#9'P')
          TabOrder = 2
        end
        object wwDBComboDlgGroupCap: TUniEdit
          Left = 321
          Top = 171
          Width = 121
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 3
          ReadOnly = True
        end
      end
      object tabClassCapacity: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'Class Capacity'
        object Panel14: TUniPanel
          Left = 0
          Top = 0
          Width = 653
          Height = 28
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object NavClassCap: TUniDBNavigator
            Left = 413
            Top = 1
            Width = 240
            Height = 26
            Hint = ''
            DataSource = SrcClassCap
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
        object gridClassCap: TIQUniGridControl
          Left = 0
          Top = 28
          Width = 653
          Height = 284
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 436
          IQComponents.Grid.Height = 198
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcClassCap
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
          IQComponents.Navigator.DataSource = SrcClassCap
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 436
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 198
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcClassCap
          Columns = <
            item
              FieldName = 'CLASS'
              Title.Caption = 'Class'
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
              FieldName = 'PK_UNIT_TYPE'
              Title.Caption = 'Pk Unit Type'
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
        object wwDBComboBoxClassCapUnitType: TUniDBComboBox
          Left = 317
          Top = 132
          Width = 121
          Height = 21
          Hint = ''
          Style = csDropDownList
          Items.Strings = (
            'Loose'#9'E'
            'Case'#9'C'
            'Pallet'#9'P')
          TabOrder = 2
        end
        object wwDBComboDlgClassCap: TUniEdit
          Left = 317
          Top = 167
          Width = 121
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 3
          ReadOnly = True
        end
      end
    end
  end
  object Panel7: TUniPanel
    Left = 0
    Top = 0
    Width = 663
    Height = 28
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object sbtnSearch: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Search ...'
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
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
        90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
        40905030773818FF00FF8B8B8B7777775F5F5F5A5A5A5A5A5A4A4A4AFF00FFFF
        00FFFF00FF8484847474746F6F6F5A5A5A5151513B3B3BFF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0E0C8C0D0A8
        90B07850804820FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7C9C9C9A7A7A7777777484848FF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC09880FFFFFF
        F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF979797FFFFFFE7E7E7C9C9C99E9E9E424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC3A494B08870
        A068509050308048308048208038108F4C26B08870A068509058309048308040
        20703810905830FF00FFA4A4A48787876969695151514A4A4A4848483B3B3B4E
        4E4E8787876969695757574C4C4C424242393939575757FF00FFDEC4B4B08870
        FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
        50803820CFA98AFF00FFC3C3C3878787FFFFFFCECECEA1A1A16F6F6F414141B5
        B5B58D8D8DD7D7D7D9D9D9A1A1A17777773D3D3DA7A7A7FF00FFFF00FFC09080
        F0F0F0FFF8F0F0D8C0B08060804820965732B09070FFFFFFFFF8F0F0D0C0B078
        50804820FF00FFFF00FFFF00FFFF00FFF0F0F0F7F7F7D5D5D57F7F7F48484857
        57578D8D8DFFFFFFF7F7F7D0D0D0777777484848FF00FFFF00FFFF00FFF8E2D2
        C09880B08060A068509050309058409D6842B07860B08870A070508048308048
        20ECC4A7FF00FFFF00FFFF00FFE1E1E19797977F7F7F6969695151515A5A5A67
        67677979798787876F6F6F4A4A4A484848C2C2C2FF00FFFF00FFFF00FFFF00FF
        C09880FFF8FFE0C0B0C09070804820FF00FFC09880FFF8FFE0C8B0D0A0808048
        20FF00FFFF00FFFF00FFFF00FFFF00FF979797FAFAFAC0C0C08E8E8E484848FF
        00FF979797FAFAFAC5C5C59E9E9E484848FF00FFFF00FFFF00FFFF00FFFF00FF
        CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
        37FF00FFFF00FFFF00FFFF00FFFF00FFB0B0B08F8F8F696969515151525252FF
        00FFA5A5A58F8F8F696969515151505050FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFB1836DFFF8F0814527FF00FFFF00FFFF00FFB08068FFF8F0804324FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF838383F7F7F7464646FF00FFFF
        00FFFF00FF808080F7F7F7444444FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A78C8C8C676767FF00FFFF
        00FFFF00FFADADAD8B8B8B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnSearchClick
    end
    object sbtnLocationGenerator: TUniSpeedButton
      Left = 25
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Aisle Location Generator'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C21E0000C21E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF993300
        0099CC0099CC00669A00669A00669A00669A00669A00669A00669A00669A0066
        9A993300FF00FFFF00FFFF00FF993300CACACAB0B0B09595957B7B7B60606099
        3300CACACAB0B0B09595957B7B7B606060993300FF00FFFF00FFFF00FF993300
        E4E4E4CACACAB0B0B09595957B7B7B993300E4E4E4CACACAB0B0B09595957B7B
        7B993300FF00FFFF00FFFF00FF993300FFFFFFE4E4E4CACACAB0B0B095959599
        3300FFFFFFE4E4E4CACACAB0B0B0959595993300FF00FFFF00FFFF00FF993300
        0099CC0099CC00669A00669A00669A9933000099CC00669A00669A00669A0066
        9A993300FF00FFFF00FFFF00FF993300CACACAB0B0B09595957B7B7B60606099
        3300CACACAB0B0B09595957B7B7B606060993300FF00FFFF00FFFF00FF993300
        E4E4E4CACACAB0B0B09595957B7B7B993300E4E4E4CACACAB0B0B09595957B7B
        7B993300FF00FFFF00FFFF00FF993300FFFFFFE4E4E4CACACAB0B0B095959599
        3300FFFFFFE4E4E4CACACAB0B0B0959595993300FF00FFFF00FFFF00FF993300
        0099CC0099CC00669A00669A00669A9933000099CC00669A00669A00669A0066
        9A993300FF00FFFF00FFFF00FF993300CACACAB0B0B09595957B7B7B60606099
        3300CACACAB0B0B09595957B7B7B606060993300FF00FFFF00FFFF00FF993300
        E4E4E4CACACAB0B0B09595957B7B7B993300E4E4E4CACACAB0B0B09595957B7B
        7B993300FF00FFFF00FFFF00FF993300FFFFFFE4E4E4CACACAB0B0B095959599
        3300FFFFFFE4E4E4CACACAB0B0B0959595993300FF00FFFF00FFFF00FF993300
        0099CC0099CC00669A00669A00669A9933000099CC00669A00669A00669A0066
        9A993300FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnLocationGeneratorClick
    end
    object NavMain: TUniDBNavigator
      Left = 423
      Top = 1
      Width = 240
      Height = 26
      Hint = ''
      DataSource = SrcLocationType
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 16
    Top = 448
    object File1: TUniMenuItem
      Caption = 'File'
      object LocationPackageUOMs1: TUniMenuItem
        Caption = 'Location / Package UOMs'
        OnClick = LocationPackageUOMs1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = 'Options'
      object Parameters1: TUniMenuItem
        Caption = 'Parameters'
        OnClick = Parameters1Click
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
    ModuleName = 'FrmLocationType'
    Version = 'Feature unsupported'
    ChangeListNumber = '$Change: 188978 $'
    Left = 48
    Top = 448
  end
  object SrcLocationType: TDataSource
    DataSet = QryLocationType
    Left = 16
    Top = 348
  end
  object QryLocationType: TFDQuery
    BeforePost = QryLocationTypeBeforePost
    AfterPost = ApplyUpdates
    AfterDelete = ApplyUpdates
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'location_type'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLLocationType
    SQL.Strings = (
      'select lt.id,'
      '       lt.descrip,'
      '       lt.length,'
      '       lt.width,'
      '       lt.height,'
      '       lt.weight,'
      '       lt.items_per_loc,'
      '       lt.allow_mixed_lots,'
      '       lt.max_case_stack,'
      '       lt.max_pallet_stack,'
      '       lt.allocate_seq,'
      '       lt.verify_location_check_digit,'
      '       lt.sub_type'
      '  from location_type lt'
      ' order by lt.descrip')
    Left = 16
    Top = 376
    object QryLocationTypeID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object QryLocationTypeDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Required = True
      Size = 50
    end
    object QryLocationTypeLENGTH: TBCDField
      FieldName = 'LENGTH'
      Size = 2
    end
    object QryLocationTypeWIDTH: TBCDField
      FieldName = 'WIDTH'
      Size = 2
    end
    object QryLocationTypeHEIGHT: TBCDField
      FieldName = 'HEIGHT'
      Size = 2
    end
    object QryLocationTypeWEIGHT: TBCDField
      FieldName = 'WEIGHT'
      Size = 2
    end
    object QryLocationTypeITEMS_PER_LOC: TStringField
      FieldName = 'ITEMS_PER_LOC'
      Size = 1
    end
    object QryLocationTypeALLOW_MIXED_LOTS: TStringField
      FieldName = 'ALLOW_MIXED_LOTS'
      Size = 1
    end
    object QryLocationTypeMAX_CASE_STACK: TBCDField
      FieldName = 'MAX_CASE_STACK'
      Size = 0
    end
    object QryLocationTypeMAX_PALLET_STACK: TBCDField
      FieldName = 'MAX_PALLET_STACK'
      Size = 0
    end
    object QryLocationTypeALLOCATE_SEQ: TStringField
      FieldName = 'ALLOCATE_SEQ'
      Size = 1
    end
    object QryLocationTypeVERIFY_LOCATION_CHECK_DIGIT: TStringField
      FieldName = 'VERIFY_LOCATION_CHECK_DIGIT'
      Size = 1
    end
    object QryLocationTypeSUB_TYPE: TStringField
      FieldName = 'SUB_TYPE'
      Size = 1
    end
  end
  object UpdateSQLLocationType: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into location_type'
      
        '  (ID, DESCRIP, LENGTH, WIDTH, HEIGHT, WEIGHT, ITEMS_PER_LOC, AL' +
        'LOW_MIXED_LOTS, '
      
        '   MAX_CASE_STACK, MAX_PALLET_STACK, ALLOCATE_SEQ, VERIFY_LOCATI' +
        'ON_CHECK_DIGIT, '
      '   SUB_TYPE)'
      'values'
      
        '  (:ID, :DESCRIP, :LENGTH, :WIDTH, :HEIGHT, :WEIGHT, :ITEMS_PER_' +
        'LOC, :ALLOW_MIXED_LOTS, '
      
        '   :MAX_CASE_STACK, :MAX_PALLET_STACK, :ALLOCATE_SEQ, :VERIFY_LO' +
        'CATION_CHECK_DIGIT, '
      '   :SUB_TYPE)')
    ModifySQL.Strings = (
      'update location_type'
      'set'
      '  ID = :ID,'
      '  DESCRIP = :DESCRIP,'
      '  LENGTH = :LENGTH,'
      '  WIDTH = :WIDTH,'
      '  HEIGHT = :HEIGHT,'
      '  WEIGHT = :WEIGHT,'
      '  ITEMS_PER_LOC = :ITEMS_PER_LOC,'
      '  ALLOW_MIXED_LOTS = :ALLOW_MIXED_LOTS,'
      '  MAX_CASE_STACK = :MAX_CASE_STACK,'
      '  MAX_PALLET_STACK = :MAX_PALLET_STACK,'
      '  ALLOCATE_SEQ = :ALLOCATE_SEQ,'
      '  VERIFY_LOCATION_CHECK_DIGIT = :VERIFY_LOCATION_CHECK_DIGIT,'
      '  SUB_TYPE = :SUB_TYPE'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from location_type'
      'where'
      '  ID = :OLD_ID')
    Left = 16
    Top = 404
  end
  object PkLocationType: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       descrip,'
      '       length,'
      '       width,'
      '       height,'
      '       weight'
      '  from location_type       '
      '')
    OnIQModify = PkLocationTypeIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 60
    Top = 348
    object PkLocationTypeID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkLocationTypeDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkLocationTypeLENGTH: TBCDField
      DisplayLabel = 'Length'
      FieldName = 'LENGTH'
      Size = 2
    end
    object PkLocationTypeWIDTH: TBCDField
      DisplayLabel = 'Width'
      FieldName = 'WIDTH'
      Size = 2
    end
    object PkLocationTypeHEIGHT: TBCDField
      DisplayLabel = 'Height'
      FieldName = 'HEIGHT'
      Size = 2
    end
    object PkLocationTypeWEIGHT: TBCDField
      DisplayLabel = 'Weight'
      FieldName = 'WEIGHT'
      Size = 2
    end
  end
  object SrcLocations: TDataSource
    DataSet = QryLocations
    Left = 100
    Top = 348
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'QryLocationType'
      'NavMain'
      'sbtnLocationGenerator')
    SecurityCode = 'FRMINVLOCATIONTYPE'
    Left = 80
    Top = 448
  end
  object QryLocations: TFDQuery
    BeforeInsert = PostParent
    BeforeEdit = PostParent
    AfterPost = ApplyUpdates
    AfterDelete = ApplyUpdates
    MasterSource = SrcLocationType
    MasterFields = 'ID'
    OnUpdateRecord = QryLocationsUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select l.id as id,'
      '       l.location_type_id,'
      '       l.loc_desc as location,'
      '       l.descrip as description,'
      
        '       decode( e.id, null, null, '#39'['#39' || e.ID || '#39']  '#39' || e.name)' +
        ' as eplant_name,'
      '       d.name as division,'
      
        '       decode(NVL(l.pk_hide, '#39'N'#39'), '#39'N'#39', '#39'Active'#39', '#39'InActive'#39') as' +
        ' active_type,'
      
        '       (select code from inv_zone where id = l.inv_zone_id )    ' +
        'as lo_zone_code,'
      
        '       (select code from inv_zone where id = l.al_inv_zone_id ) ' +
        'as al_zone_code,'
      
        '       (select code from inv_zone where id = l.dz_inv_zone_id ) ' +
        'as dz_zone_code,'
      
        '       (select code from inv_zone where id = l.wk_inv_zone_id ) ' +
        'as wk_zone_code,'
      '       l.inv_zone_id,'
      '       l.al_inv_zone_id,'
      '       l.dz_inv_zone_id, '
      '       l.wk_inv_zone_id'
      '  from locations l,'
      '       eplant e,'
      '       division d'
      ' where location_type_id = :id'
      '   and l.eplant_id = e.id(+)'
      '   and l.division_id = d.id(+)'
      '   and misc.eplant_filter(l.eplant_id) = 1'
      ' order by   '
      '       l.loc_desc'
      ''
      ''
      ''
      ''
      ' ')
    Left = 100
    Top = 376
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryLocationsID: TBCDField
      DisplayLabel = 'Location ID'
      DisplayWidth = 10
      FieldName = 'ID'
      ReadOnly = True
      Size = 0
    end
    object QryLocationsLOCATION: TStringField
      DisplayLabel = 'Location Name'
      DisplayWidth = 27
      FieldName = 'LOCATION'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object QryLocationsDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIPTION'
      ReadOnly = True
      Size = 50
    end
    object QryLocationsEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 13
      FieldName = 'EPLANT_NAME'
      ReadOnly = True
      Size = 74
    end
    object QryLocationsDIVISION: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 14
      FieldName = 'DIVISION'
      ReadOnly = True
      Size = 25
    end
    object QryLocationsACTIVE_TYPE: TStringField
      DisplayLabel = 'Active'
      DisplayWidth = 11
      FieldName = 'ACTIVE_TYPE'
      ReadOnly = True
      Size = 8
    end
    object QryLocationsLO_ZONE_CODE: TStringField
      DisplayLabel = 'Locating Zone'
      DisplayWidth = 25
      FieldName = 'LO_ZONE_CODE'
      ReadOnly = True
      Size = 25
    end
    object QryLocationsAL_ZONE_CODE: TStringField
      DisplayLabel = 'Allocating Zone'
      DisplayWidth = 25
      FieldName = 'AL_ZONE_CODE'
      ReadOnly = True
      Size = 25
    end
    object QryLocationsDZ_ZONE_CODE: TStringField
      DisplayLabel = 'Drop Zone'
      DisplayWidth = 25
      FieldName = 'DZ_ZONE_CODE'
      ReadOnly = True
      Size = 25
    end
    object QryLocationsWK_ZONE_CODE: TStringField
      DisplayLabel = 'Work Zone'
      DisplayWidth = 25
      FieldName = 'WK_ZONE_CODE'
      ReadOnly = True
      Size = 25
    end
    object QryLocationsLOCATION_TYPE_ID: TBCDField
      FieldName = 'LOCATION_TYPE_ID'
      Visible = False
      Size = 0
    end
    object QryLocationsINV_ZONE_ID: TBCDField
      FieldName = 'INV_ZONE_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryLocationsAL_INV_ZONE_ID: TBCDField
      FieldName = 'AL_INV_ZONE_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryLocationsDZ_INV_ZONE_ID: TBCDField
      FieldName = 'DZ_INV_ZONE_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryLocationsWK_INV_ZONE_ID: TBCDField
      FieldName = 'WK_INV_ZONE_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
  end
  object PopupMenu1: TUniPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 20
    Top = 284
    object JumpToLocation1: TUniMenuItem
      Caption = 'Jump To Location'
      OnClick = JumpToLocation1Click
    end
    object JumpToLocatingZone1: TUniMenuItem
      Caption = 'Jump To Locating Zone'
      OnClick = JumpToLocatingZone1Click
    end
    object JumpToAllocatingZone1: TUniMenuItem
      Caption = 'Jump To Allocating Zone'
      OnClick = JumpToAllocatingZone1Click
    end
    object JumpToDropZone1: TUniMenuItem
      Caption = 'Jump To Drop Zone'
      OnClick = JumpToDropZone1Click
    end
    object JumpToWorkZone1: TUniMenuItem
      Caption = 'Jump To Work Zone'
      OnClick = JumpToWorkZone1Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object DisassociateSelectedLocations1: TUniMenuItem
      Caption = 'Disassociate Selected Locations'
      OnClick = DisassociateSelectedLocations1Click
    end
  end
  object QryItemCap: TFDQuery
    BeforeInsert = PostParent
    BeforeEdit = PostParent
    BeforePost = AssignIDLocationCapacity
    AfterPost = ApplyUpdates
    AfterDelete = ApplyUpdates
    OnCalcFields = QryItemCapCalcFields
    OnNewRecord = QryItemCapNewRecord
    MasterSource = SrcLocationType
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'location_capacity'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLArinvtItem
    SQL.Strings = (
      'select c.id,'
      '       c.location_type_id,'
      '       c.qty,'
      '       c.pk_unit_type,'
      '       c.source,'
      '       c.source_id'
      '  from location_capacity c'
      ' where location_type_id = :id'
      '   and source = '#39'ARINVT'#39
      
        ' order by (select itemno from arinvt where id = c.source_id), id' +
        '  '
      ''
      '')
    Left = 176
    Top = 348
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryItemCapCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldKind = fkCalculated
      FieldName = 'CLASS'
      Origin = 'IQ.ARINVT.CLASS'
      ReadOnly = True
      FixedChar = True
      Size = 2
      Calculated = True
    end
    object QryItemCapITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'ITEMNO'
      Origin = 'IQ.ARINVT.ITEMNO'
      ReadOnly = True
      FixedChar = True
      Size = 50
      Calculated = True
    end
    object QryItemCapDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'DESCRIP'
      Origin = 'IQ.ARINVT.DESCRIP'
      ReadOnly = True
      Size = 100
      Calculated = True
    end
    object QryItemCapDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'DESCRIP2'
      Origin = 'IQ.ARINVT.DESCRIP2'
      ReadOnly = True
      Size = 100
      Calculated = True
    end
    object QryItemCapREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'REV'
      Origin = 'IQ.ARINVT.REV'
      ReadOnly = True
      FixedChar = True
      Size = 15
      Calculated = True
    end
    object QryItemCapPK_UNIT_TYPE: TStringField
      DisplayLabel = 'Unit Type'
      DisplayWidth = 1
      FieldName = 'PK_UNIT_TYPE'
      Origin = 'IQ.LOCATION_CAPACITY.PK_UNIT_TYPE'
      Required = True
      Size = 1
    end
    object QryItemCapQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 10
      FieldName = 'QTY'
      Origin = 'IQ.LOCATION_CAPACITY.QTY'
      Size = 6
    end
    object QryItemCapID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.LOCATION_CAPACITY.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryItemCapLOCATION_TYPE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'LOCATION_TYPE_ID'
      Origin = 'IQ.LOCATION_CAPACITY.LOCATION_TYPE_ID'
      Visible = False
      Size = 0
    end
    object QryItemCapSOURCE: TStringField
      DisplayWidth = 30
      FieldName = 'SOURCE'
      Origin = 'IQ.LOCATION_CAPACITY.SOURCE'
      Visible = False
      Size = 30
    end
    object QryItemCapSOURCE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SOURCE_ID'
      Origin = 'IQ.LOCATION_CAPACITY.SOURCE_ID'
      Visible = False
      Size = 0
    end
  end
  object QryGroupCap: TFDQuery
    BeforeInsert = PostParent
    BeforeEdit = PostParent
    BeforePost = AssignIDLocationCapacity
    AfterPost = ApplyUpdates
    AfterDelete = ApplyUpdates
    OnCalcFields = QryGroupCapCalcFields
    OnNewRecord = QryGroupCapNewRecord
    MasterSource = SrcLocationType
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'location_capacity'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLArinvtGroup
    SQL.Strings = (
      'select c.id,'
      '       c.location_type_id,'
      '       c.qty,'
      '       c.pk_unit_type,'
      '       c.source,'
      '       c.source_id'
      '  from location_capacity c'
      ' where location_type_id = :id'
      '   and source = '#39'ARINVT_GROUP'#39
      'order by (select code from arinvt_group where id = c.source_id),'
      '       id   '
      '')
    Left = 216
    Top = 348
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryGroupCapCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'CODE'
      Origin = 'IQ.ARINVT_GROUP.CODE'
      ReadOnly = True
      Size = 25
      Calculated = True
    end
    object QryGroupCapDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 49
      FieldKind = fkCalculated
      FieldName = 'DESCRIP'
      Origin = 'IQ.ARINVT_GROUP.DESCRIP'
      ReadOnly = True
      Size = 60
      Calculated = True
    end
    object QryGroupCapQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 13
      FieldName = 'QTY'
      Origin = 'IQ.LOCATION_CAPACITY.QTY'
      Size = 6
    end
    object QryGroupCapPK_UNIT_TYPE: TStringField
      DisplayLabel = 'Unit Type'
      DisplayWidth = 11
      FieldName = 'PK_UNIT_TYPE'
      Origin = 'IQ.LOCATION_CAPACITY.PK_UNIT_TYPE'
      Required = True
      Size = 1
    end
    object QryGroupCapID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.LOCATION_CAPACITY.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryGroupCapLOCATION_TYPE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'LOCATION_TYPE_ID'
      Origin = 'IQ.LOCATION_CAPACITY.LOCATION_TYPE_ID'
      Visible = False
      Size = 0
    end
    object QryGroupCapSOURCE: TStringField
      DisplayWidth = 30
      FieldName = 'SOURCE'
      Origin = 'IQ.LOCATION_CAPACITY.SOURCE'
      Visible = False
      Size = 30
    end
    object QryGroupCapSOURCE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SOURCE_ID'
      Origin = 'IQ.LOCATION_CAPACITY.SOURCE_ID'
      Visible = False
      Size = 0
    end
  end
  object QryClassCap: TFDQuery
    BeforeInsert = PostParent
    BeforeEdit = PostParent
    BeforePost = AssignIDLocationCapacity
    AfterPost = ApplyUpdates
    AfterDelete = ApplyUpdates
    OnCalcFields = QryClassCapCalcFields
    OnNewRecord = QryClassCapNewRecord
    MasterSource = SrcLocationType
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'location_capacity'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLArinvtClass
    SQL.Strings = (
      'select c.id,'
      '       c.location_type_id,'
      '       c.qty,'
      '       c.pk_unit_type,'
      '       c.source,'
      '       c.source_id'
      '  from location_capacity c'
      ' where location_type_id = :id'
      '   and source = '#39'ARINVT_CLASS'#39
      
        'order by (select class from arinvt_class where id = c.source_id)' +
        ','
      '       id   '
      '')
    Left = 256
    Top = 348
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryClassCapCLASS: TStringField
      DisplayLabel = 'Class'
      FieldKind = fkCalculated
      FieldName = 'CLASS'
      Origin = 'IQ.ARINVT_CLASS.CLASS'
      ReadOnly = True
      FixedChar = True
      Size = 2
      Calculated = True
    end
    object QryClassCapDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldKind = fkCalculated
      FieldName = 'DESCRIP'
      Origin = 'IQ.ARINVT_CLASS.DESCRIP'
      ReadOnly = True
      Size = 50
      Calculated = True
    end
    object QryClassCapPK_UNIT_TYPE: TStringField
      DisplayLabel = 'Unit Type'
      FieldName = 'PK_UNIT_TYPE'
      Origin = 'IQ.LOCATION_CAPACITY.PK_UNIT_TYPE'
      Required = True
      Size = 1
    end
    object QryClassCapQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      FieldName = 'QTY'
      Origin = 'IQ.LOCATION_CAPACITY.QTY'
      Size = 6
    end
    object QryClassCapID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.LOCATION_CAPACITY.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryClassCapLOCATION_TYPE_ID: TBCDField
      FieldName = 'LOCATION_TYPE_ID'
      Origin = 'IQ.LOCATION_CAPACITY.LOCATION_TYPE_ID'
      Visible = False
      Size = 0
    end
    object QryClassCapSOURCE: TStringField
      FieldName = 'SOURCE'
      Origin = 'IQ.LOCATION_CAPACITY.SOURCE'
      Visible = False
      Size = 30
    end
    object QryClassCapSOURCE_ID: TBCDField
      FieldName = 'SOURCE_ID'
      Origin = 'IQ.LOCATION_CAPACITY.SOURCE_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcItemCap: TDataSource
    DataSet = QryItemCap
    Left = 176
    Top = 376
  end
  object SrcClassCap: TDataSource
    DataSet = QryClassCap
    Left = 256
    Top = 376
  end
  object SrcGroupCap: TDataSource
    DataSet = QryGroupCap
    Left = 216
    Top = 376
  end
  object PkArinvt_Group: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select g.id as id,'
      '       g.code as code,'
      '       g.descrip as descrip,'
      '       g.eplant_id as eplant_id'
      '  from arinvt_group g'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 216
    Top = 434
    object PkArinvt_GroupID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkArinvt_GroupCODE: TStringField
      DisplayLabel = 'Group Code'
      FieldName = 'CODE'
      Size = 25
    end
    object PkArinvt_GroupDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 60
    end
    object PkArinvt_GroupEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.ARINVT_GROUP.EPLANT_ID'
      Size = 0
    end
  end
  object PkArinvt_Class: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       class,'
      '       descrip'
      '  from arinvt_class'
      '         '
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 256
    Top = 434
    object PkArinvt_ClassID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ARINVT_CLASS.ID'
      Visible = False
      Size = 0
    end
    object PkArinvt_ClassCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Origin = 'IQ.ARINVT_CLASS.CLASS'
      FixedChar = True
      Size = 2
    end
    object PkArinvt_ClassDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.ARINVT_CLASS.DESCRIP'
      Size = 50
    end
  end
  object PkArinvt: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.itemno    as itemno,'
      '       a.class     as class,'
      '       a.rev       as rev,  '
      '       a.descrip   as descrip,'
      '       a.descrip2  as descrip2,'
      '       a.unit      as unit, '
      '       c.custno    as custno,'
      '       c.company   as company,'
      '       a.id        as id,'
      '       a.eplant_id as eplant_id,'
      '       a.pk_hide   as pk_hide,'
      '       a.non_material as non_material'
      ' from arinvt a, v_arcusto c'
      'where a.arcusto_id = c.id(+)'
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 176
    Top = 434
    object StringField1: TStringField
      DisplayLabel = 'Item#'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Size = 2
    end
    object StringField2: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 3
      FieldName = 'REV'
      Size = 15
    end
    object StringField3: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object StringField4: TStringField
      DisplayLabel = 'Unit'
      FieldName = 'UNIT'
      Size = 10
    end
    object PkArinvtCUSTNO: TStringField
      DisplayLabel = 'Cust#'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkArinvtCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      FieldName = 'COMPANY'
      Size = 60
    end
    object FloatField1: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkArinvtEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkArinvtPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkArinvtNON_MATERIAL: TStringField
      DisplayLabel = 'Non Material'
      FieldName = 'NON_MATERIAL'
      FixedChar = True
      Size = 1
    end
  end
  object UpdateSQLArinvtItem: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into location_capacity'
      '  (ID, LOCATION_TYPE_ID, QTY, PK_UNIT_TYPE, SOURCE, SOURCE_ID)'
      'values'
      
        '  (:ID, :LOCATION_TYPE_ID, :QTY, :PK_UNIT_TYPE, :SOURCE, :SOURCE' +
        '_ID)')
    ModifySQL.Strings = (
      'update location_capacity'
      'set'
      '  ID = :ID,'
      '  LOCATION_TYPE_ID = :LOCATION_TYPE_ID,'
      '  QTY = :QTY,'
      '  PK_UNIT_TYPE = :PK_UNIT_TYPE,'
      '  SOURCE = :SOURCE,'
      '  SOURCE_ID = :SOURCE_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from location_capacity'
      'where'
      '  ID = :OLD_ID')
    Left = 176
    Top = 404
  end
  object UpdateSQLArinvtGroup: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into location_capacity'
      '  (ID, LOCATION_TYPE_ID, QTY, PK_UNIT_TYPE, SOURCE, SOURCE_ID)'
      'values'
      
        '  (:ID, :LOCATION_TYPE_ID, :QTY, :PK_UNIT_TYPE, :SOURCE, :SOURCE' +
        '_ID)')
    ModifySQL.Strings = (
      'update location_capacity'
      'set'
      '  ID = :ID,'
      '  LOCATION_TYPE_ID = :LOCATION_TYPE_ID,'
      '  QTY = :QTY,'
      '  PK_UNIT_TYPE = :PK_UNIT_TYPE,'
      '  SOURCE = :SOURCE,'
      '  SOURCE_ID = :SOURCE_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from location_capacity'
      'where'
      '  ID = :OLD_ID')
    Left = 216
    Top = 404
  end
  object UpdateSQLArinvtClass: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into location_capacity'
      '  (ID, LOCATION_TYPE_ID, QTY, PK_UNIT_TYPE, SOURCE, SOURCE_ID)'
      'values'
      
        '  (:ID, :LOCATION_TYPE_ID, :QTY, :PK_UNIT_TYPE, :SOURCE, :SOURCE' +
        '_ID)')
    ModifySQL.Strings = (
      'update location_capacity'
      'set'
      '  ID = :ID,'
      '  LOCATION_TYPE_ID = :LOCATION_TYPE_ID,'
      '  QTY = :QTY,'
      '  PK_UNIT_TYPE = :PK_UNIT_TYPE,'
      '  SOURCE = :SOURCE,'
      '  SOURCE_ID = :SOURCE_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from location_capacity'
      'where'
      '  ID = :OLD_ID')
    Left = 256
    Top = 404
  end
  object PkLoc: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select l.id as id,'
      '       l.loc_desc as location,'
      '       l.start_row as path,'
      '       l.descrip as description,'
      '       '#39'['#39' || e.ID || '#39']  '#39' || e.name as eplant_name,'
      '       d.name as division,'
      '       a.name as loc_aisle ,'
      '       l.loc_bay as loc_bay,'
      '       l.loc_level as loc_level,'
      
        '       decode(NVL(l.pk_hide, '#39'N'#39'), '#39'N'#39', '#39'Active'#39', '#39'InActive'#39') as' +
        ' active_type,'
      '       l.pk_hide as pk_hide'
      '  from locations l,'
      '       eplant e,'
      '       division d,'
      '       inv_aisles a'
      ' where l.eplant_id = e.id(+)'
      '   and l.division_id = d.id(+)'
      '   and misc.eplant_filter(l.eplant_id) = 1'
      '   and l.inv_aisles_id = a.id(+)'
      '   and l.location_type_id is null'
      ''
      ''
      ''
      ''
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 100
    Top = 404
    object PkLocID: TBCDField
      FieldName = 'ID'
      Origin = 'l.id'
      Visible = False
      Size = 0
    end
    object PkLocLOCATION: TStringField
      DisplayLabel = 'Location'
      FieldName = 'LOCATION'
      Origin = 'l.loc_desc'
      FixedChar = True
      Size = 30
    end
    object PkLocDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIPTION'
      Origin = 'l.descrip'
      Size = 50
    end
    object PkLocEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant Name'
      FieldName = 'EPLANT_NAME'
      Origin = #39'['#39' || e.ID || '#39']  '#39' || e.name'
      Size = 74
    end
    object PkLocDIVISION: TStringField
      DisplayLabel = 'Division'
      FieldName = 'DIVISION'
      Origin = 'd.name'
      Size = 25
    end
    object PkLocLOC_AISLE: TStringField
      DisplayLabel = 'Aisle'
      FieldName = 'LOC_AISLE'
      Origin = 'a.name'
      Size = 9
    end
    object PkLocLOC_BAY: TStringField
      DisplayLabel = 'Bay'
      FieldName = 'LOC_BAY'
      Origin = 'l.loc_bay'
      Size = 9
    end
    object PkLocLOC_LEVEL: TStringField
      DisplayLabel = 'Level'
      FieldName = 'LOC_LEVEL'
      Origin = 'l.loc_level'
      Size = 9
    end
    object PkLocPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      Size = 1
    end
  end
end
