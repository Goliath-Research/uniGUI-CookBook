object FrmM_ViewerSetup: TFrmM_ViewerSetup
  Left = 80
  Top = 218
  ClientHeight = 394
  ClientWidth = 683
  Caption = 'Viewer Setup'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 186
    Width = 683
    Height = 4
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
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 683
    Height = 27
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object NavMain: TUniDBNavigator
      Left = 457
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcM_View
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 27
    Width = 683
    Height = 159
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object wwDBGridHeader: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 681
      Height = 157
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
      IQComponents.Grid.Width = 464
      IQComponents.Grid.Height = 71
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcM_View
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
      IQComponents.Navigator.DataSource = SrcM_View
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 464
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 71
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcM_View
      Columns = <
        item
          FieldName = 'NAME'
          Title.Caption = 'Plant Efficiency View Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'View Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      Marker = 0
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 190
    Width = 683
    Height = 204
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    ExplicitWidth = 649
    object Splitter2: TUniSplitter
      Left = 300
      Top = 28
      Width = 4
      Height = 175
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 28
      Width = 299
      Height = 175
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object wwDBGridDetail: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 297
        Height = 173
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
        IQComponents.Grid.Width = 80
        IQComponents.Grid.Height = 87
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcM_View_Detail
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
        IQComponents.Navigator.DataSource = SrcM_View_Detail
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 80
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 87
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcM_View_Detail
        Columns = <
          item
            FieldName = 'SEQ'
            Title.Caption = '#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Monitor Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
      end
    end
    object Panel6: TUniPanel
      Left = 304
      Top = 28
      Width = 378
      Height = 175
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Panel8: TUniPanel
        Left = 1
        Top = 1
        Width = 376
        Height = 38
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        DesignSize = (
          376
          38)
        object Label1: TUniLabel
          Left = 9
          Top = 14
          Width = 24
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Filter'
          ParentFont = False
          TabOrder = 2
        end
        object wwDBComboBoxFilter_By: TUniDBComboBox
          Left = 118
          Top = 9
          Width = 246
          Height = 21
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          DataField = 'FILTER_BY'
          DataSource = SrcM_View_Detail
          Style = csDropDownList
          Items.Strings = (
            'Overall'#9'O'
            'EPlant'#9'E'
            'MfgCell'#9'C')
          TabOrder = 0
        end
      end
      object pnlPgCtrlFilter: TUniPanel
        Left = 1
        Top = 39
        Width = 376
        Height = 68
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        ExplicitLeft = 0
        ExplicitTop = 38
        ExplicitWidth = 346
        object pgctrlFilter: TUniPageControl
          Left = -1
          Top = -5
          Width = 393
          Height = 75
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ActivePage = TabOverall
          Align = alCustom
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          object TabOverall: TUniTabSheet
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            TabVisible = False
            Caption = 'TabOverall'
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 256
            ExplicitHeight = 128
            object PnlOverallOption: TUniPanel
              Tag = 1999
              Left = 0
              Top = 0
              Width = 385
              Height = 47
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              ShowCaption = False
              Caption = ''
              DesignSize = (
                385
                47)
              object lblMFGType: TUniLabel
                Left = 27
                Top = 5
                Width = 45
                Height = 13
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Mfg Type'
                TabOrder = 2
              end
              object lookupMfgTypeOverAll: TUniDBLookupComboBox
                Left = 118
                Top = 0
                Width = 248
                Height = 21
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ListFieldIndex = 0
                DataField = 'MFGTYPE'
                DataSource = SrcM_View_Detail
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                Color = clWindow
                ExplicitWidth = 214
              end
            end
          end
          object TabEPlant: TUniTabSheet
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            TabVisible = False
            ImageIndex = 1
            Caption = 'TabEPlant'
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 256
            ExplicitHeight = 128
            object PnlEPlantOption: TUniPanel
              Tag = 1999
              Left = 0
              Top = 0
              Width = 385
              Height = 47
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              ShowCaption = False
              Caption = ''
              DesignSize = (
                385
                47)
              object lblEPlant: TUniLabel
                Left = 27
                Top = 5
                Width = 30
                Height = 13
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'EPlant'
                TabOrder = 3
              end
              object lblMFTTypeEplant: TUniLabel
                Left = 27
                Top = 37
                Width = 45
                Height = 13
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Mfg Type'
                TabOrder = 4
              end
              object lookupMfgTypeEPlant: TUniDBLookupComboBox
                Left = 118
                Top = 32
                Width = 248
                Height = 21
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ListFieldIndex = 0
                DataField = 'MFGTYPE'
                DataSource = SrcM_View_Detail
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                Color = clWindow
                ExplicitWidth = 214
              end
              object lookupEPlant: TUniDBLookupComboBox
                Left = 118
                Top = 0
                Width = 248
                Height = 21
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ListFieldIndex = 0
                DataField = 'EPLANT_ID'
                DataSource = SrcM_View_Detail
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                Color = clWindow
                ExplicitWidth = 214
              end
            end
          end
          object TabMfgCell: TUniTabSheet
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            TabVisible = False
            ImageIndex = 2
            Caption = 'TabMfgCell'
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 256
            ExplicitHeight = 128
            object PnlMfgCellOption: TUniPanel
              Tag = 1999
              Left = 0
              Top = 0
              Width = 385
              Height = 47
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              ShowCaption = False
              Caption = ''
              DesignSize = (
                385
                47)
              object lblMfgCell: TUniLabel
                Left = 27
                Top = 5
                Width = 38
                Height = 13
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Mfg Cell'
                TabOrder = 2
              end
              object lookupMfgCell: TUniDBLookupComboBox
                Left = 118
                Top = 0
                Width = 248
                Height = 21
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ListFieldIndex = 0
                DataField = 'MFGCELL_ID'
                DataSource = SrcM_View_Detail
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                Color = clWindow
                ExplicitWidth = 214
              end
            end
          end
        end
      end
    end
    object Panel5: TUniPanel
      Left = 1
      Top = 1
      Width = 681
      Height = 27
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = ' Plant Efficiency Monitors'
      object NavDetail: TUniDBNavigator
        Left = 455
        Top = 1
        Width = 225
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ShowHint = True
        ParentShowHint = False
        DataSource = SrcM_View_Detail
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
  end
  object SrcM_View: TDataSource
    DataSet = QryM_View
    Left = 25
    Top = 63
  end
  object QryM_View: TFDQuery
    BeforePost = QryM_ViewBeforePost
    OnNewRecord = QryM_ViewNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'M_VIEW'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL_M_View
    SQL.Strings = (
      'select ID, '
      '       name, '
      '       descrip'
      '  from m_view'
      ' order by id')
    Left = 25
    Top = 76
    object QryM_ViewNAME: TStringField
      DisplayLabel = 'Plant Efficiency View Name'
      DisplayWidth = 25
      FieldName = 'NAME'
      Origin = 'IQ.M_VIEW.NAME'
      Size = 30
    end
    object QryM_ViewDESCRIP: TStringField
      DisplayLabel = 'View Description'
      DisplayWidth = 57
      FieldName = 'DESCRIP'
      Origin = 'IQ.M_VIEW.DESCRIP'
      Size = 250
    end
    object QryM_ViewID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.M_VIEW.ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL_M_View: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into m_view'
      '  (ID, NAME, DESCRIP)'
      'values'
      '  (:ID, :NAME, :DESCRIP)')
    ModifySQL.Strings = (
      'update m_view'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME,'
      '  DESCRIP = :DESCRIP'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from m_view'
      'where'
      '  ID = :OLD_ID')
    Left = 25
    Top = 90
  end
  object SrcM_View_Detail: TDataSource
    DataSet = QryM_View_Detail
    OnDataChange = SrcM_View_DetailDataChange
    Left = 87
    Top = 65
  end
  object QryM_View_Detail: TFDQuery
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = QryM_View_DetailBeforePost
    OnNewRecord = QryM_View_DetailNewRecord
    MasterSource = SrcM_View
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'M_VIEW_DETAIL'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL_M_View_Detail
    SQL.Strings = (
      'select id,'
      '       m_view_id,'
      '       seq,'
      '       descrip,'
      '       filter_by,'
      '       eplant_id,'
      '       mfgtype,'
      '       mfgcell_id'
      '  from m_view_detail'
      ' where m_view_id = :id'
      ' order by seq')
    Left = 88
    Top = 77
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryM_View_DetailSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 3
      FieldName = 'SEQ'
      Origin = 'IQ.M_VIEW_DETAIL.SEQ'
      Size = 0
    end
    object QryM_View_DetailDESCRIP: TStringField
      DisplayLabel = 'Monitor Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'IQ.M_VIEW_DETAIL.DESCRIP'
      Size = 250
    end
    object QryM_View_DetailID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.M_VIEW_DETAIL.ID'
      Visible = False
      Size = 0
    end
    object QryM_View_DetailM_VIEW_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'M_VIEW_ID'
      Origin = 'IQ.M_VIEW_DETAIL.M_VIEW_ID'
      Visible = False
      Size = 0
    end
    object QryM_View_DetailEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.M_VIEW_DETAIL.EPLANT_ID'
      Visible = False
      Size = 0
    end
    object QryM_View_DetailMFGTYPE: TStringField
      DisplayWidth = 10
      FieldName = 'MFGTYPE'
      Origin = 'IQ.M_VIEW_DETAIL.MFGTYPE'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object QryM_View_DetailMFGCELL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'MFGCELL_ID'
      Origin = 'IQ.M_VIEW_DETAIL.MFGCELL_ID'
      Visible = False
      Size = 0
    end
    object QryM_View_DetailFILTER_BY: TStringField
      FieldName = 'FILTER_BY'
      Origin = 'IQ.M_VIEW_DETAIL.FILTER_BY'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object UpdateSQL_M_View_Detail: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into m_view_detail'
      
        '  (ID, M_VIEW_ID, SEQ, DESCRIP, FILTER_BY, EPLANT_ID, MFGTYPE, M' +
        'FGCELL_ID)'
      'values'
      
        '  (:ID, :M_VIEW_ID, :SEQ, :DESCRIP, :FILTER_BY, :EPLANT_ID, :MFG' +
        'TYPE, :MFGCELL_ID)')
    ModifySQL.Strings = (
      'update m_view_detail'
      'set'
      '  ID = :ID,'
      '  M_VIEW_ID = :M_VIEW_ID,'
      '  SEQ = :SEQ,'
      '  DESCRIP = :DESCRIP,'
      '  FILTER_BY = :FILTER_BY,'
      '  EPLANT_ID = :EPLANT_ID,'
      '  MFGTYPE = :MFGTYPE,'
      '  MFGCELL_ID = :MFGCELL_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from m_view_detail'
      'where'
      '  ID = :OLD_ID')
    Left = 87
    Top = 91
  end
  object QryMfgType: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select mfgtype, '
      '       descrip'
      '  from mfgtype'
      'where mfg.is_mfgtype_pm( mfgtype ) = 0'
      ' order by mfgtype')
    Left = 137
    Top = 66
    object QryMfgTypeMFGTYPE: TStringField
      DisplayLabel = 'MfgType'
      DisplayWidth = 10
      FieldName = 'MFGTYPE'
      Origin = 'IQ.MFGTYPE.MFGTYPE'
      FixedChar = True
      Size = 10
    end
    object QryMfgTypeDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'IQ.MFGTYPE.DESCRIP'
      FixedChar = True
    end
  end
  object QryMfgCell: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select mfgcell,'
      '       descrip,'
      '       mfgtype, '
      '       eplant_id,'
      '       id'
      '  from v_mfgcell'
      ' order by mfgcell'
      ' ')
    Left = 167
    Top = 67
    object QryMfgCellMFGCELL: TStringField
      DisplayLabel = 'MfgCell'
      DisplayWidth = 15
      FieldName = 'MFGCELL'
      Origin = 'IQ.MFGCELL.MFGCELL'
      FixedChar = True
      Size = 15
    end
    object QryMfgCellDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'IQ.MFGCELL.DESCRIP'
      FixedChar = True
      Size = 25
    end
    object QryMfgCellMFGTYPE: TStringField
      DisplayLabel = 'MfgType'
      DisplayWidth = 10
      FieldName = 'MFGTYPE'
      Origin = 'IQ.MFGCELL.MFGTYPE'
      FixedChar = True
      Size = 10
    end
    object QryMfgCellEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.MFGCELL.EPLANT_ID'
      Size = 0
    end
    object QryMfgCellID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.MFGCELL.ID'
      Visible = False
      Size = 0
    end
  end
  object QryEPlant: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, name from eplant'
      'order by name')
    Left = 198
    Top = 67
    object QryEPlantNAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 30
      FieldName = 'NAME'
      Origin = 'IQ.EPLANT.NAME'
      Size = 30
    end
    object QryEPlantID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.EPLANT.ID'
      Size = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 231
    Top = 67
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
    ModuleName = 'FrmM_ViewerSetup'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 334
    Top = 28
  end
end
