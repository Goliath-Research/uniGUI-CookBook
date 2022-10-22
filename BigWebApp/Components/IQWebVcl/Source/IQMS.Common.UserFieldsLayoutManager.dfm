object FrmUserFieldsLayoutManager: TFrmUserFieldsLayoutManager
  Left = 0
  Top = 0
  ClientHeight = 561
  ClientWidth = 730
  Caption = 'Layout Manager'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 317
    Top = 0
    Width = 4
    Height = 561
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object pnlLeft01: TUniPanel
    Left = 0
    Top = 0
    Width = 317
    Height = 561
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 0
      Top = 346
      Width = 317
      Height = 4
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
    end
    object Splitter3: TUniSplitter
      Left = 0
      Top = 173
      Width = 317
      Height = 4
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
    end
    object pnlTop01: TUniPanel
      Left = 1
      Top = 1
      Width = 315
      Height = 173
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object gridTabs: TIQUniGridControl
        Left = 1
        Top = 47
        Width = 313
        Height = 126
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 96
        IQComponents.Grid.Height = 40
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcUDTabSheet
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
        IQComponents.Navigator.DataSource = SrcUDTabSheet
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 96
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 40
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcUDTabSheet
        Columns = <
          item
            FieldName = 'SEQ'
            Title.Caption = '#'
            Width = 14
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NAME'
            Title.Caption = 'Name'
            Width = 133
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CAPTION'
            Title.Caption = 'Caption'
            Width = 210
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object PnlToolbarTabs: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 313
        Height = 47
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object PnlToolbarCaption: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 311
          Height = 20
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          TabOrder = 0
          Caption = ''
          Color = clBtnShadow
          object lblCaptionLabel: TUniLabel
            Left = 1
            Top = 1
            Width = 27
            Height = 13
            Hint = ''
            Caption = 'Tabs'
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            ParentFont = False
            Font.Color = clWhite
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object PnlToolbarInner: TUniPanel
          Tag = 1999
          Left = 1
          Top = 20
          Width = 311
          Height = 27
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object navUDTabSheet: TUniDBNavigator
            Left = 191
            Top = 1
            Width = 120
            Height = 25
            Hint = ''
            DataSource = SrcUDTabSheet
            VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
      end
    end
    object pnlTop02: TUniPanel
      Left = 1
      Top = 177
      Width = 315
      Height = 169
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object gridGroups: TIQUniGridControl
        Left = 1
        Top = 47
        Width = 313
        Height = 122
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 96
        IQComponents.Grid.Height = 36
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcUDGroupBox
        IQComponents.Grid.LoadMask.Message = 'Loading data...'
        IQComponents.Grid.Align = alClient
        IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
        IQComponents.Grid.TabOrder = 0
        IQComponents.Grid.OnDrawColumnCell = gridGroupsDBGridDrawColumnCell
        IQComponents.Navigator.Left = 410
        IQComponents.Navigator.Top = 0
        IQComponents.Navigator.Width = 241
        IQComponents.Navigator.Height = 25
        IQComponents.Navigator.Hint = ''
        IQComponents.Navigator.ShowHint = True
        IQComponents.Navigator.DataSource = SrcUDGroupBox
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 96
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 36
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcUDGroupBox
        Columns = <
          item
            FieldName = 'NAME'
            Title.Caption = 'Name'
            Width = 154
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CAPTION'
            Title.Caption = 'Caption'
            Width = 210
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object PnlToolbarGroups: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 313
        Height = 47
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object Panel1: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 311
          Height = 20
          Hint = ''
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
            Width = 40
            Height = 13
            Hint = ''
            Caption = 'Groups'
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            ParentFont = False
            Font.Color = clWhite
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object Panel3: TUniPanel
          Tag = 1999
          Left = 1
          Top = 20
          Width = 311
          Height = 27
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object navUDGroupBox: TUniDBNavigator
            Left = 191
            Top = 1
            Width = 120
            Height = 25
            Hint = ''
            DataSource = SrcUDGroupBox
            VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
      end
    end
    object Panel5: TUniPanel
      Left = 1
      Top = 350
      Width = 315
      Height = 211
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      object gridFields: TIQUniGridControl
        Left = 1
        Top = 47
        Width = 313
        Height = 164
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 96
        IQComponents.Grid.Height = 78
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcUDCols
        IQComponents.Grid.LoadMask.Message = 'Loading data...'
        IQComponents.Grid.OnMouseDown = gridFieldsDBGridMouseDown
        IQComponents.Grid.Align = alClient
        IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
        IQComponents.Grid.TabOrder = 0
        IQComponents.Navigator.Left = 410
        IQComponents.Navigator.Top = 0
        IQComponents.Navigator.Width = 241
        IQComponents.Navigator.Height = 25
        IQComponents.Navigator.Hint = ''
        IQComponents.Navigator.ShowHint = True
        IQComponents.Navigator.DataSource = SrcUDCols
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 96
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 78
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcUDCols
        Columns = <
          item
            FieldName = 'GROUPBOX_SEQ'
            Title.Caption = '#'
            Width = 14
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'COL_NAME'
            Title.Caption = 'Name'
            Width = 133
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'COL_LABEL'
            Title.Caption = 'Caption'
            Width = 231
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object PnlToolbarFields: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 313
        Height = 47
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object Panel4: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 311
          Height = 20
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          TabOrder = 0
          Caption = ''
          Color = clBtnShadow
          object Label2: TUniLabel
            Left = 1
            Top = 1
            Width = 32
            Height = 13
            Hint = ''
            Caption = 'Fields'
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            ParentFont = False
            Font.Color = clWhite
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object Panel13: TUniPanel
          Tag = 1999
          Left = 1
          Top = 20
          Width = 311
          Height = 27
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object navUDCols: TUniDBNavigator
            Left = 191
            Top = 1
            Width = 120
            Height = 25
            Hint = ''
            DataSource = SrcUDCols
            VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
      end
    end
  end
  object Panel2: TUniPanel
    Left = 321
    Top = 0
    Width = 409
    Height = 561
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object pgctrlLayout: TUniPageControl
      Left = 1
      Top = 20
      Width = 407
      Height = 541
      Hint = ''
      ActivePage = tabLayout
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object tabLayout: TUniTabSheet
        Hint = ''
        Caption = 'General'
        object Bevel1: TUniPanel
          Left = 0
          Top = 0
          Width = 399
          Height = 4
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
        end
        object SG: TUniStringGrid
          Left = 0
          Top = 4
          Width = 399
          Height = 509
          Hint = ''
          RowCount = 3
          ColCount = 3
          DefaultColWidth = 150
          DefaultRowHeight = 80
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
          Columns = <>
          OnDrawCell = SGDrawCell
          OnSelectCell = SGSelectCell
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          TabStop = False
        end
      end
    end
    object PnlCaption: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 407
      Height = 20
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clWhite
      TabOrder = 1
      Caption = ''
      Color = clBtnShadow
      object lblCaptionLayout: TUniLabel
        Left = 1
        Top = 1
        Width = 39
        Height = 13
        Hint = ''
        Caption = 'Layout'
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 104
    Top = 72
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
    ModuleName = 'FrmUserFieldsLayoutManager'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 191292 $'
    BuildVersion = '176554'
    Left = 140
    Top = 72
  end
  object SrcUDGroupBox: TDataSource
    DataSet = QryUDGroupBox
    OnDataChange = SrcUDGroupBoxDataChange
    Left = 48
    Top = 248
  end
  object SrcUDCols: TDataSource
    DataSet = QryUDCols
    Left = 52
    Top = 428
  end
  object SrcUDTabSheet: TDataSource
    DataSet = QryUDTabSheet
    Left = 52
    Top = 72
  end
  object QryUDTabSheet: TFDQuery
    BeforeOpen = QryUDTabSheetBeforeOpen
    AfterInsert = AutoPost
    BeforePost = QryUDTabSheetBeforePost
    AfterDelete = ApplyUpdates
    BeforeRefresh = QryUDTabSheetBeforeRefresh
    OnNewRecord = QryUDTabSheetNewRecord
    CachedUpdates = True
    ConnectionName = 'IQFD'
    UpdateObject = UpdateUDTabSheet
    SQL.Strings = (
      'select id,'
      '       ud_tables_id,'
      '       name,'
      '       caption,'
      '       seq'
      '  from ud_tabsheet'
      ' where ud_tables_id = :ud_tables_id'
      ' order by seq ')
    Left = 52
    Top = 88
    ParamData = <
      item
        Name = 'ud_tables_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryUDTabSheetSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 2
      FieldName = 'SEQ'
      Origin = 'IQ.UD_TABSHEET.SEQ'
      Size = 0
    end
    object QryUDTabSheetNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 19
      FieldName = 'NAME'
      Origin = 'IQ.UD_TABSHEET.NAME'
      Required = True
      Size = 50
    end
    object QryUDTabSheetCAPTION: TStringField
      DisplayLabel = 'Caption'
      DisplayWidth = 33
      FieldName = 'CAPTION'
      Origin = 'IQ.UD_TABSHEET.CAPTION'
      Size = 50
    end
    object QryUDTabSheetID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.UD_TABSHEET.ID'
      Visible = False
      Size = 0
    end
    object QryUDTabSheetUD_TABLES_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'UD_TABLES_ID'
      Origin = 'IQ.UD_TABSHEET.UD_TABLES_ID'
      Visible = False
      Size = 0
    end
  end
  object QryUDGroupBox: TFDQuery
    BeforeInsert = QryUDGroupBoxBeforeEdit
    BeforeEdit = QryUDGroupBoxBeforeEdit
    BeforePost = QryUDGroupBoxBeforePost
    BeforeDelete = RequestRebuildGrid
    AfterDelete = ApplyUpdates
    BeforeRefresh = QryUDGroupBoxBeforeRefresh
    OnNewRecord = QryUDGroupBoxNewRecord
    MasterSource = SrcUDTabSheet
    MasterFields = 'ID'
    ConnectionName = 'IQFD'
    UpdateObject = UpdateUDGroupBox
    SQL.Strings = (
      'select id,'
      '       ud_tabsheet_id,'
      '       name,'
      '       caption,'
      '       row_num,'
      '       col_num'
      '  from ud_groupbox'
      ' where ud_tabsheet_id = :id'
      ' order by id'
      '')
    Left = 48
    Top = 268
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryUDGroupBoxID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.UD_GROUPBOX.ID'
      Size = 0
    end
    object QryUDGroupBoxUD_TABSHEET_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'UD_TABSHEET_ID'
      Origin = 'IQ.UD_GROUPBOX.UD_TABSHEET_ID'
      Size = 0
    end
    object QryUDGroupBoxNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 50
      FieldName = 'NAME'
      Origin = 'IQ.UD_GROUPBOX.NAME'
      Required = True
      Size = 50
    end
    object QryUDGroupBoxCAPTION: TStringField
      DisplayLabel = 'Caption'
      DisplayWidth = 50
      FieldName = 'CAPTION'
      Origin = 'IQ.UD_GROUPBOX.CAPTION'
      Size = 50
    end
    object QryUDGroupBoxROW_NUM: TBCDField
      DisplayLabel = 'Row #'
      DisplayWidth = 10
      FieldName = 'ROW_NUM'
      Origin = 'IQ.UD_GROUPBOX.ROW_NUM'
      Size = 0
    end
    object QryUDGroupBoxCOL_NUM: TBCDField
      DisplayLabel = 'Col #'
      DisplayWidth = 10
      FieldName = 'COL_NUM'
      Origin = 'IQ.UD_GROUPBOX.COL_NUM'
      Size = 0
    end
  end
  object QryUDCols: TFDQuery
    BeforeInsert = QryUDColsBeforeInsert
    BeforeEdit = QryUDColsBeforeEdit
    BeforePost = RequestUpdateUDPanelText
    AfterPost = ApplyUpdates
    BeforeDelete = RequestUpdateUDPanelText
    AfterDelete = ApplyUpdates
    BeforeRefresh = QryUDColsBeforeRefresh
    OnNewRecord = QryUDColsNewRecord
    CachedUpdates = True
    MasterSource = SrcUDGroupBox
    MasterFields = 'ID'
    OnUpdateRecord = QryUDColsUpdateRecord
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select id,'
      '       ud_tables_id,'
      '       col_name,'
      '       col_label,'
      '       ud_groupbox_id,'
      '       groupbox_seq'
      '  from ud_cols'
      ' where ud_groupbox_id = :id'
      ' order by groupbox_seq')
    Left = 52
    Top = 448
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryUDColsID: TBCDField
      FieldName = 'ID'
      Origin = 'id'
      Size = 0
    end
    object QryUDColsUD_TABLES_ID: TBCDField
      FieldName = 'UD_TABLES_ID'
      Origin = 'UD_TABLES_ID'
      Size = 0
    end
    object QryUDColsCOL_NAME: TStringField
      FieldName = 'COL_NAME'
      Origin = 'COL_NAME'
      Size = 50
    end
    object QryUDColsCOL_LABEL: TStringField
      FieldName = 'COL_LABEL'
      Origin = 'IQ.UD_COLS.COL_LABEL'
      Size = 50
    end
    object QryUDColsUD_GROUPBOX_ID: TBCDField
      FieldName = 'UD_GROUPBOX_ID'
      Origin = 'IQ.UD_COLS.UD_GROUPBOX_ID'
      Size = 0
    end
    object QryUDColsGROUPBOX_SEQ: TBCDField
      FieldName = 'GROUPBOX_SEQ'
      Origin = 'IQ.UD_COLS.GROUPBOX_SEQ'
      Size = 0
    end
  end
  object UpdateUDTabSheet: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into ud_tabsheet'
      '  (ID, UD_TABLES_ID, NAME, CAPTION, SEQ)'
      'values'
      '  (:ID, :UD_TABLES_ID, :NAME, :CAPTION, :SEQ)')
    ModifySQL.Strings = (
      'update ud_tabsheet'
      'set'
      '  ID = :ID,'
      '  UD_TABLES_ID = :UD_TABLES_ID,'
      '  NAME = :NAME,'
      '  CAPTION = :CAPTION,'
      '  SEQ = :SEQ'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from ud_tabsheet'
      'where'
      '  ID = :OLD_ID')
    Left = 52
    Top = 116
  end
  object UpdateUDGroupBox: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into ud_groupbox'
      '  (ID, UD_TABSHEET_ID, NAME, CAPTION, ROW_NUM, COL_NUM)'
      'values'
      '  (:ID, :UD_TABSHEET_ID, :NAME, :CAPTION, :ROW_NUM, :COL_NUM)')
    ModifySQL.Strings = (
      'update ud_groupbox'
      'set'
      '  ID = :ID,'
      '  UD_TABSHEET_ID = :UD_TABSHEET_ID,'
      '  NAME = :NAME,'
      '  CAPTION = :CAPTION,'
      '  ROW_NUM = :ROW_NUM,'
      '  COL_NUM = :COL_NUM'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from ud_groupbox'
      'where'
      '  ID = :OLD_ID')
    Left = 48
    Top = 296
  end
  object ImageList1: TUniImageList
    Width = 32
    Left = 112
    Top = 108
    Bitmap = {
      494C010101000500040020001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000001000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0A0A0008040400080404000804040008040
      4000804040008040400080404000804040000000000000000000000000000000
      0000000000000000000000000000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0A000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00804040000000000000000000000000000000
      000000000000000000000000000080808000FFFFFF0000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0A000FFFFFF00C0C0C000F0CAA600FFFF
      FF00C0C0A000C0C0C000FFFFFF00804040000000000000000000000000000000
      000000000000000000000000000080808000FFFFFF0080808000808080000000
      0000808080008080800000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0A000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00804040000000000000000000000000000000
      000000000000000000000000000080808000FFFFFF0000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0A000FFFFFF00C0C0C000C0C0C000FFFF
      FF00C0C0C000C0C0C000FFFFFF00804040000000000000000000000000000000
      000000000000000000000000000080808000FFFFFF0080808000808080000000
      0000808080008080800000000000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0C0A000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00804040000000000000000000000000000000
      000000000000000000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F0CAA600F0CAA600F0CAA600C0A08000C0A0
      8000C0806000C0806000C0804000C06040000000000000000000000000000000
      0000000000000000000000000000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F0CAA600F0CAA600F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600C0604000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F0CAA600F0CAA600F0CAA600F0CAA600C0A0
      8000C0A08000C0A06000C0806000C08040000000000000000000808080008080
      80008080800080808000FFFFFF00808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF000000000080808000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000808080008080800080808000FFFF
      FF0000000000808080008080800080808000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00000000000000
      000000000000000000000000000080808000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000080808000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000808080008080800080808000FFFF
      FF0000000000808080008080800080808000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF0080808000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      80008080800080808000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000100000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FE00FE00000000000000000000000000
      FE00FE7E000000000000000000000000FE00FE12000000000000000000000000
      FE00FE7E000000000000000000000000FE00FE12000000000000000000000000
      FE00FE00000000000000000000000000FE00FE00000000000000000000000000
      FE00E000000000000000000000000000C200C000000000000000000000000000
      C3FFC87F00000000000000000000000000FF087F000000000000000000000000
      00FF3E7F00000000000000000000000000FF0E7F000000000000000000000000
      00FF087F000000000000000000000000C3FFC1FF000000000000000000000000
      C3FFC1FF00000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
