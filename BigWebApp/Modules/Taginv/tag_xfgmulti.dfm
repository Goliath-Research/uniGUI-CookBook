object FrmTagXFgMulti: TFrmTagXFgMulti
  Left = 0
  Top = 0
  ClientHeight = 550
  ClientWidth = 672
  Caption = 'XFGMulti'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 226
    Width = 672
    Height = 4
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
    ExplicitTop = 253
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 672
    Height = 226
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    ExplicitTop = 27
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 670
      Height = 224
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 453
      IQComponents.Grid.Height = 138
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = DataSource1
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
      IQComponents.Navigator.DataSource = DataSource1
      IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 453
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 138
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = DataSource1
      Columns = <
        item
          FieldName = 'TAGHEAD_ID'
          Title.Caption = 'TAGHEAD_ID'
          Width = 112
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FGMULTI_ID'
          Title.Caption = 'FGMULTI_ID'
          Width = 112
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NEWREC'
          Title.Caption = 'NEWREC'
          Width = 7
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ARINVT_ID'
          Title.Caption = 'ARINVT_ID'
          Width = 112
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NON_CONFORM_ID'
          Title.Caption = 'NON_CONFORM_ID'
          Width = 112
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LOC_DESC'
          Title.Caption = 'LOC_DESC'
          Width = 210
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LOTNO'
          Title.Caption = 'LOTNO'
          Width = 175
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'QUAN'
          Title.Caption = 'QUAN'
          Width = 105
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'RG_QUAN'
          Title.Caption = 'RG_QUAN'
          Width = 105
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NEW_QUAN'
          Title.Caption = 'NEW_QUAN'
          Width = 105
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NEW_RG_QUAN'
          Title.Caption = 'NEW_RG_QUAN'
          Width = 105
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_ID'
          Title.Caption = 'EPLANT_ID'
          Width = 112
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PROCESSED'
          Title.Caption = 'PROCESSED'
          Width = 7
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ORIGIN'
          Title.Caption = 'ORIGIN'
          Width = 140
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NOT_COUNTED'
          Title.Caption = 'NOT_COUNTED'
          Width = 7
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      Marker = 0
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 230
    Width = 672
    Height = 320
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitTop = 257
    ExplicitHeight = 293
    object wwDBGrid2: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 670
      Height = 318
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 453
      IQComponents.Grid.Height = 232
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = DataSource2
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
      IQComponents.Navigator.DataSource = DataSource2
      IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 453
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 232
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitHeight = 178
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitHeight = 207
      DataSource = DataSource2
      Columns = <
        item
          FieldName = 'ID'
          Title.Caption = 'ID'
          Width = 112
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TAGHEAD_ID'
          Title.Caption = 'TAGHEAD_ID'
          Width = 112
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FGMULTI_ID'
          Title.Caption = 'FGMULTI_ID'
          Width = 112
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MASTER_LABEL_ID'
          Title.Caption = 'MASTER_LABEL_ID'
          Width = 112
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NEWREC'
          Title.Caption = 'NEWREC'
          Width = 7
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'QUAN'
          Title.Caption = 'QUAN'
          Width = 105
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NEW_QUAN'
          Title.Caption = 'NEW_QUAN'
          Width = 91
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PROCESSED'
          Title.Caption = 'PROCESSED'
          Width = 7
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'OFFSET_MISSING_BY'
          Title.Caption = 'OFFSET_MISSING_BY'
          Width = 112
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      ExplicitTop = 28
      ExplicitHeight = 264
      Marker = 0
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 132
    Top = 71
  end
  object DataSource2: TDataSource
    DataSet = FDQuery2
    Left = 324
    Top = 415
  end
  object FDQuery1: TFDQuery
    BeforeOpen = FDQuery1BeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select taghead_id,'
      '       fgmulti_id,'
      '       newrec,'
      '       arinvt_id,'
      '       non_conform_id,'
      '       loc_desc,'
      '       lotno,'
      '       quan,'
      '       rg_quan,'
      '       new_quan,'
      '       new_rg_quan,'
      '       eplant_id,'
      '       processed,'
      '       origin,'
      '       not_counted'
      '  from xfgmulti'
      ' where taghead_id = :taghead_id'
      ' order by '
      '       fgmulti_id'
      '       ')
    Left = 132
    Top = 103
    ParamData = <
      item
        Name = 'TAGHEAD_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object FDQuery1TAGHEAD_ID: TBCDField
      DisplayWidth = 16
      FieldName = 'TAGHEAD_ID'
      Origin = 'TAGHEAD_ID'
      Precision = 15
      Size = 0
    end
    object FDQuery1FGMULTI_ID: TBCDField
      DisplayWidth = 16
      FieldName = 'FGMULTI_ID'
      Origin = 'FGMULTI_ID'
      Precision = 15
      Size = 0
    end
    object FDQuery1NEWREC: TStringField
      DisplayWidth = 1
      FieldName = 'NEWREC'
      Origin = 'NEWREC'
      FixedChar = True
      Size = 1
    end
    object FDQuery1ARINVT_ID: TBCDField
      DisplayWidth = 16
      FieldName = 'ARINVT_ID'
      Origin = 'ARINVT_ID'
      Precision = 15
      Size = 0
    end
    object FDQuery1NON_CONFORM_ID: TBCDField
      DisplayWidth = 16
      FieldName = 'NON_CONFORM_ID'
      Origin = 'NON_CONFORM_ID'
      Precision = 15
      Size = 0
    end
    object FDQuery1LOC_DESC: TStringField
      DisplayWidth = 30
      FieldName = 'LOC_DESC'
      Origin = 'LOC_DESC'
      FixedChar = True
      Size = 30
    end
    object FDQuery1LOTNO: TStringField
      DisplayWidth = 25
      FieldName = 'LOTNO'
      Origin = 'LOTNO'
      Size = 25
    end
    object FDQuery1QUAN: TBCDField
      DisplayWidth = 15
      FieldName = 'QUAN'
      Origin = 'QUAN'
      Precision = 14
    end
    object FDQuery1RG_QUAN: TBCDField
      DisplayWidth = 15
      FieldName = 'RG_QUAN'
      Origin = 'RG_QUAN'
      Precision = 14
    end
    object FDQuery1NEW_QUAN: TBCDField
      DisplayWidth = 15
      FieldName = 'NEW_QUAN'
      Origin = 'NEW_QUAN'
      Precision = 14
    end
    object FDQuery1NEW_RG_QUAN: TBCDField
      DisplayWidth = 15
      FieldName = 'NEW_RG_QUAN'
      Origin = 'NEW_RG_QUAN'
      Precision = 14
    end
    object FDQuery1EPLANT_ID: TBCDField
      DisplayWidth = 16
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Precision = 15
      Size = 0
    end
    object FDQuery1PROCESSED: TStringField
      DisplayWidth = 1
      FieldName = 'PROCESSED'
      Origin = 'PROCESSED'
      FixedChar = True
      Size = 1
    end
    object FDQuery1ORIGIN: TStringField
      DisplayWidth = 20
      FieldName = 'ORIGIN'
      Origin = 'ORIGIN'
    end
    object FDQuery1NOT_COUNTED: TStringField
      DisplayWidth = 1
      FieldName = 'NOT_COUNTED'
      Origin = 'NOT_COUNTED'
      Size = 1
    end
  end
  object FDQuery2: TFDQuery
    MasterSource = DataSource1
    MasterFields = 'TAGHEAD_ID;FGMULTI_ID'
    DetailFields = 'TAGHEAD_ID;FGMULTI_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       taghead_id,'
      '       fgmulti_id,'
      '       master_label_id,'
      '       newrec,'
      '       quan,'
      '       new_quan,'
      '       processed,'
      '       offset_missing_by'
      '  from xfgmulti_serial'
      ' where taghead_id = :taghead_id'
      '   and fgmulti_id = :fgmulti_id'
      ' order by id   ')
    Left = 252
    Top = 415
    ParamData = <
      item
        Name = 'TAGHEAD_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end
      item
        Name = 'FGMULTI_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
  end
end
