object FrmQcDocWhereUsed: TFrmQcDocWhereUsed
  Left = 369
  Top = 233
  HelpContext = 10777
  ClientHeight = 464
  ClientWidth = 707
  Caption = 'Where Document Used'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 0
    Width = 707
    Height = 4
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object pcMain: TUniPageControl
    Left = 0
    Top = 4
    Width = 707
    Height = 460
    Hint = ''
    ActivePage = TabBOM
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabGeneral: TUniTabSheet
      Hint = ''
      Caption = 'General'
      object pnlGrid: TUniPanel
        Left = 0
        Top = 0
        Width = 699
        Height = 237
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object GridWhereUsed: TIQUniGridControl
          Left = 1
          Top = 1
          Width = 697
          Height = 235
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 480
          IQComponents.Grid.Height = 149
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcWhereUsed
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
          IQComponents.Navigator.DataSource = SrcWhereUsed
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 480
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 149
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcWhereUsed
          Columns = <
            item
              FieldName = 'ID'
              Title.Caption = 'ID'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'MODULE'
              Title.Caption = 'Module'
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
              FieldName = 'PRINT_WITH'
              Title.Caption = 'Print With'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'INACTIVE'
              Title.Caption = 'Inactive~Source'
              Width = 64
              CheckBoxField.FieldValues = 'Y;N'
            end>
          Marker = 0
        end
      end
      object Panel1: TUniPanel
        Left = 0
        Top = 237
        Width = 699
        Height = 195
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object pnlPgCtrl: TUniPanel
          Left = 1
          Top = 20
          Width = 697
          Height = 175
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object pgctrlDetails: TUniPageControl
            Left = 1
            Top = 1
            Width = 695
            Height = 173
            Hint = ''
            ActivePage = tabMfg
            TabBarVisible = True
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            object tabEmpty: TUniTabSheet
              Hint = ''
              ImageIndex = 1
              Caption = 'tabEmpty'
            end
            object tabMfg: TUniTabSheet
              Hint = ''
              Caption = 'tabMfg'
              object srchMfg: TIQUniGridControl
                Left = 0
                Top = 0
                Width = 687
                Height = 145
                Layout = 'border'
                ParentAlignmentControl = False
                AlignmentControl = uniAlignmentClient
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
                IQComponents.Grid.Left = 0
                IQComponents.Grid.Top = 29
                IQComponents.Grid.Width = 470
                IQComponents.Grid.Height = 59
                IQComponents.Grid.Hint = ''
                IQComponents.Grid.DataSource = SrcDetails
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
                IQComponents.Navigator.DataSource = SrcDetails
                IQComponents.Navigator.LayoutConfig.Region = 'east'
                IQComponents.Navigator.TabOrder = 3
                IQComponents.HiddenPanel.Left = 470
                IQComponents.HiddenPanel.Top = 29
                IQComponents.HiddenPanel.Width = 209
                IQComponents.HiddenPanel.Height = 59
                IQComponents.HiddenPanel.Hint = ''
                IQComponents.HiddenPanel.Visible = True
                IQComponents.HiddenPanel.Align = alRight
                IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
                IQComponents.FormTab.Hint = ''
                IQComponents.FormTab.ImageIndex = 1
                IQComponents.FormTab.Caption = 'Form'
                IQComponents.FormTab.Layout = 'border'
                DataSource = SrcDetails
                Columns = <
                  item
                    FieldName = 'MFGNO'
                    Title.Caption = 'Mfg #'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end>
                Marker = 0
              end
            end
          end
        end
        object PnlCaption: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 697
          Height = 20
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -12
          TabOrder = 1
          Caption = ''
          Color = clBtnShadow
          object lblCaption: TUniLabel
            Left = 1
            Top = 1
            Width = 116
            Height = 14
            Hint = ''
            Caption = '  Additional Details'
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
      end
    end
    object TabBOM: TUniTabSheet
      Hint = ''
      ImageIndex = 1
      Caption = 'MFG #'
      object GridFlat: TIQUniGridControl
        Left = 0
        Top = 0
        Width = 699
        Height = 432
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 482
        IQComponents.Grid.Height = 346
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcWhereUsedFlat
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
        IQComponents.Navigator.DataSource = SrcWhereUsedFlat
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 482
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 346
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcWhereUsedFlat
        Columns = <
          item
            FieldName = 'ID'
            Title.Caption = 'ID'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'MODULE'
            Title.Caption = 'Module'
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
            FieldName = 'PRINT_WITH'
            Title.Caption = 'Print With'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'MFGNO'
            Title.Caption = 'MFG #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'INACTIVE'
            Title.Caption = 'Inactive~Source'
            Width = 64
            CheckBoxField.FieldValues = 'Y;N'
          end>
        Marker = 0
      end
    end
  end
  object SrcWhereUsed: TDataSource
    DataSet = QryWhereUsed
    OnDataChange = SrcWhereUsedDataChange
    Left = 97
    Top = 88
  end
  object QryWhereUsed: TFDQuery
    BeforeOpen = QryWhereUsedBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select u.id,'
      
        '       substr(qc_doc_misc.get_where_used_module( u.source, u.sou' +
        'rce_id ),1,60) as module,'
      
        '       substr(qc_doc_misc.get_where_used_descrip( u.source, u.so' +
        'urce_id, '#39'DESCRIP'#39' ),1,60) as descrip,'
      
        '       substr(qc_doc_misc.get_where_used_descrip( u.source, u.so' +
        'urce_id, '#39'PK_HIDE'#39' ),1,20) as inactive,'
      '       u.print_with,'
      
        '       u.source_id,                                             ' +
        '                              '
      '       u.source'
      '  from doc_used u'
      ' where external_doc_id = :external_doc_id')
    Left = 96
    Top = 116
    ParamData = <
      item
        Name = 'external_doc_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryWhereUsedID: TBCDField
      DisplayWidth = 6
      FieldName = 'ID'
      Origin = 'u.id'
      Size = 0
    end
    object QryWhereUsedMODULE: TStringField
      DisplayLabel = 'Module'
      DisplayWidth = 18
      FieldName = 'MODULE'
      Origin = 
        'substr(qc_doc_misc.get_where_used_module( u.source, u.source_id ' +
        '),1,60)'
      Size = 60
    end
    object QryWhereUsedDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Origin = 
        ' substr(qc_doc_misc.get_where_used_descrip( u.source, u.source_i' +
        'd ),1,60)'
      Size = 60
    end
    object QryWhereUsedPRINT_WITH: TStringField
      DisplayLabel = 'Print With'
      DisplayWidth = 18
      FieldName = 'PRINT_WITH'
      Origin = 'u.print_with'
      Size = 25
    end
    object QryWhereUsedINACTIVE: TStringField
      DisplayLabel = 'Inactive~Source'
      DisplayWidth = 12
      FieldName = 'INACTIVE'
      Origin = 
        'substr(qc_doc_misc.get_where_used_descrip( u.source, u.source_id' +
        ', '#39'PK_HIDE'#39' ),1,20) '
    end
    object QryWhereUsedSOURCE_ID: TBCDField
      FieldName = 'SOURCE_ID'
      Visible = False
      Size = 0
    end
    object QryWhereUsedSOURCE: TStringField
      FieldName = 'SOURCE'
      Visible = False
      Size = 50
    end
  end
  object PWhereUsed: TUniPopupMenu
    OnPopup = PWhereUsedPopup
    Left = 136
    Top = 88
    object JumpTo1: TUniMenuItem
      Caption = 'Jump To'
      OnClick = JumpTo1Click
    end
  end
  object SrcDetails: TDataSource
    DataSet = QryMfg_Arinvt
    Left = 184
    Top = 88
  end
  object QryMfg_Arinvt: TFDQuery
    Tag = 1
    BeforeOpen = BeforeOpenQryMfg
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select s.mfgno,'
      '       s.id as standard_id'
      '  from arinvt a, standard s'
      ' where a.id = :source_id '
      '   and a.standard_id = s.id')
    Left = 184
    Top = 120
    ParamData = <
      item
        Name = 'source_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryMfg_ArinvtMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 29
      FieldName = 'MFGNO'
      Origin = 's.MFGNO'
      Size = 50
    end
    object QryMfg_ArinvtSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Origin = 'IQ.STANDARD.ID'
      Visible = False
      Size = 0
    end
  end
  object QryMfg_Sndop: TFDQuery
    Tag = 1
    BeforeOpen = BeforeOpenQryMfg
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select standard.mfgno,'
      '       standard.id as standard_id'
      '  from ptoper,'
      '       partno,'
      '       standard'
      ' where ptoper.sndop_id = :source_id'
      '   and ptoper.partno_id = partno.id'
      '   and partno.standard_id = standard.id  '
      ' ')
    Left = 184
    Top = 176
    ParamData = <
      item
        Name = 'source_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryMfg_SndopMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      FieldName = 'MFGNO'
      Origin = 'standard.MFGNO'
      Size = 50
    end
    object QryMfg_SndopSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Origin = 'IQ.STANDARD.ID'
      Visible = False
      Size = 0
    end
  end
  object PWhereUsedDetail: TUniPopupMenu
    OnPopup = PWhereUsedDetailPopup
    Left = 220
    Top = 84
    object JumpToBOM1: TUniMenuItem
      Caption = 'Jump To BOM'
      OnClick = JumpToBOM1Click
    end
  end
  object QryMfg_Standard: TFDQuery
    Tag = 1
    BeforeOpen = BeforeOpenQryMfg
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select s.mfgno,'
      '       s.id as standard_id'
      '  from standard s'
      ' where s.id = :source_id '
      '')
    Left = 184
    Top = 148
    ParamData = <
      item
        Name = 'source_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object StringField1: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 29
      FieldName = 'MFGNO'
      Origin = 's.MFGNO'
      Size = 50
    end
    object FloatField1: TBCDField
      FieldName = 'STANDARD_ID'
      Origin = 'IQ.STANDARD.ID'
      Visible = False
      Size = 0
    end
  end
  object SrcWhereUsedFlat: TDataSource
    DataSet = QryWhereUsedFlat
    Left = 96
    Top = 200
  end
  object QryWhereUsedFlat: TFDQuery
    BeforeOpen = QryWhereUsedBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT u.id,'
      
        '       SUBSTR(qc_doc_misc.get_where_used_module(u.source, u.sour' +
        'ce_id), 1, 60) AS module,'
      
        '       SUBSTR(qc_doc_misc.get_where_used_descrip(u.source, u.sou' +
        'rce_id, '#39'DESCRIP'#39'), 1, 60) AS descrip,'
      
        '       SUBSTR(qc_doc_misc.get_where_used_descrip(u.source, u.sou' +
        'rce_id, '#39'PK_HIDE'#39'), 1, 20) AS inactive,'
      '       u.print_with AS print_with,'
      '       u.source_id AS source_id,'
      '       u.source AS source,'
      '       TO_CHAR(NULL) AS mfgno,'
      '       TO_NUMBER(NULL) AS standard_id'
      '  FROM doc_used u'
      ' WHERE u.external_doc_id = :EXTERNAL_DOC_ID AND'
      '       (u.source NOT IN ('#39'STANDARD'#39', '#39'ARINVT'#39', '#39'SNDOP'#39'))'
      'UNION ALL'
      'SELECT u.id,'
      
        '       SUBSTR(qc_doc_misc.get_where_used_module(u.source, u.sour' +
        'ce_id), 1, 60) AS module,'
      
        '       SUBSTR(qc_doc_misc.get_where_used_descrip(u.source, u.sou' +
        'rce_id, '#39'DESCRIP'#39'), 1, 60) AS descrip,'
      
        '       SUBSTR(qc_doc_misc.get_where_used_descrip(u.source, u.sou' +
        'rce_id, '#39'PK_HIDE'#39'), 1, 20) AS inactive,'
      '       u.print_with AS print_with,'
      '       u.source_id AS source_id,'
      '       u.source AS source,'
      '       standard.mfgno AS mfgno,'
      '       standard.id AS standard_id'
      '  FROM doc_used u, standard'
      ' WHERE u.external_doc_id = :EXTERNAL_DOC_ID AND'
      '       u.source = '#39'STANDARD'#39' AND'
      '       u.source_id = standard.id'
      'UNION ALL'
      'SELECT u.id,'
      
        '       SUBSTR(qc_doc_misc.get_where_used_module(u.source, u.sour' +
        'ce_id), 1, 60) AS module,'
      
        '       SUBSTR(qc_doc_misc.get_where_used_descrip(u.source, u.sou' +
        'rce_id, '#39'DESCRIP'#39'), 1, 60) AS descrip,'
      
        '       SUBSTR(qc_doc_misc.get_where_used_descrip(u.source, u.sou' +
        'rce_id, '#39'PK_HIDE'#39'), 1, 20) AS inactive,'
      '       u.print_with AS print_with,'
      '       u.source_id AS source_id,'
      '       u.source AS source,'
      '       standard.mfgno AS mfgno,'
      '       standard.id AS standard_id'
      '  FROM doc_used u, arinvt, standard'
      ' WHERE u.external_doc_id = :EXTERNAL_DOC_ID AND'
      '       u.source = '#39'ARINVT'#39' AND'
      '       u.source_id = arinvt.id AND'
      '       arinvt.standard_id = standard.id(+)'
      'UNION ALL'
      'SELECT u.id,'
      
        '       SUBSTR(qc_doc_misc.get_where_used_module(u.source, u.sour' +
        'ce_id), 1, 60) AS module,'
      
        '       SUBSTR(qc_doc_misc.get_where_used_descrip(u.source, u.sou' +
        'rce_id, '#39'DESCRIP'#39'), 1, 60) AS descrip,'
      
        '       SUBSTR(qc_doc_misc.get_where_used_descrip(u.source, u.sou' +
        'rce_id, '#39'PK_HIDE'#39'), 1, 20) AS inactive,'
      '       u.print_with AS print_with,'
      '       u.source_id AS source_id,'
      '       u.source AS source,'
      '       standard.mfgno AS mfgno,'
      '       standard.id AS standard_id'
      '  FROM doc_used u, sndop, ptoper, partno, standard'
      ' WHERE u.external_doc_id = :EXTERNAL_DOC_ID AND'
      '       u.source = '#39'SNDOP'#39' AND'
      '       u.source_id = sndop.id AND'
      '       partno.standard_id(+) = standard.id AND'
      '       ptoper.partno_id(+) = partno.id AND'
      '       sndop.id(+) = ptoper.sndop_id')
    Left = 104
    Top = 208
    ParamData = <
      item
        Name = 'EXTERNAL_DOC_ID'
        DataType = ftLargeint
        ParamType = ptInput
      end>
    object QryWhereUsedFlatID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 15
      Size = 0
    end
    object QryWhereUsedFlatMODULE: TStringField
      FieldName = 'MODULE'
      Origin = 'MODULE'
      Size = 60
    end
    object QryWhereUsedFlatDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 60
    end
    object QryWhereUsedFlatINACTIVE: TStringField
      FieldName = 'INACTIVE'
      Origin = 'INACTIVE'
    end
    object QryWhereUsedFlatPRINT_WITH: TStringField
      FieldName = 'PRINT_WITH'
      Origin = 'PRINT_WITH'
      Size = 25
    end
    object QryWhereUsedFlatSOURCE_ID: TBCDField
      FieldName = 'SOURCE_ID'
      Origin = 'SOURCE_ID'
      Precision = 15
      Size = 0
    end
    object QryWhereUsedFlatSOURCE: TStringField
      FieldName = 'SOURCE'
      Origin = 'SOURCE'
      Size = 50
    end
    object QryWhereUsedFlatMFGNO: TStringField
      FieldName = 'MFGNO'
      Origin = 'MFGNO'
      Size = 50
    end
    object QryWhereUsedFlatSTANDARD_ID: TFMTBCDField
      FieldName = 'STANDARD_ID'
      Origin = 'STANDARD_ID'
      Precision = 38
      Size = 38
    end
  end
  object PWhereUsedFlat: TUniPopupMenu
    OnPopup = PWhereUsedFlatPopup
    Left = 288
    Top = 88
    object JumpTo2: TUniMenuItem
      Caption = 'Jump To'
      OnClick = JumpTo2Click
    end
    object JumpToBOM2: TUniMenuItem
      Caption = 'Jump To BOM'
      OnClick = JumpToBOM2Click
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'JumpTo1'
      'JumpTo2'
      'JumpToBOM1'
      'JumpToBOM2')
    SecurityCode = 'FRMQCDOCWHEREUSED'
    Left = 96
    Top = 264
  end
end
