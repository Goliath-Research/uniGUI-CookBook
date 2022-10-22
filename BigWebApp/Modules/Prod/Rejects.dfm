object FrmRejects: TFrmRejects
  Left = 308
  Top = 206
  HelpContext = 1064107
  ClientHeight = 313
  ClientWidth = 564
  Caption = 'Rejects'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 564
    Height = 313
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 347
    IQComponents.Grid.Height = 227
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcRejects
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
    IQComponents.Navigator.DataSource = SrcRejects
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 347
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 227
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 200
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitHeight = 229
    DataSource = SrcRejects
    Columns = <
      item
        FieldName = 'Code'
        Title.Caption = 'Code'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Attribute'
        Title.Caption = 'Reason'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REJECTS'
        Title.Caption = 'Rejects'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CAVITY_NO'
        Title.Caption = 'Cavity #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PMEQMT_EQNO'
        Title.Caption = 'Tool #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'COMMENT1'
        Title.Caption = 'Comment'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitTop = 27
    ExplicitHeight = 286
    Marker = 0
  end
  object wwDBLookupComboReason: TUniDBLookupComboBox
    Left = 98
    Top = 148
    Width = 149
    Height = 21
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ListOnlyMode = lmFollowSource
    ListField = 'ATTRIBUTE'
    ListSource = SrcDescripLookUp
    KeyField = 'ATTRIBUTE'
    ListFieldIndex = 0
    TabOrder = 0
    Color = clWindow
  end
  object wwDBComboDlgRejects: TUniEdit
    Left = 98
    Top = 118
    Width = 149
    Height = 21
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Text = ''
    TabOrder = 1
  end
  object wwDBLookupComboCode: TUniDBLookupComboBox
    Left = 98
    Top = 177
    Width = 149
    Height = 21
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ListOnlyMode = lmFollowSource
    ListField = 'ATTRIBUTE:EPLANT_ID;REJECT_CODE'
    ListSource = SrcCodeLookUp
    KeyField = 'REJECT_CODE'
    ListFieldIndex = 0
    TabOrder = 2
    Color = clWindow
  end
  object SrcRejects: TDataSource
    DataSet = TblRejects
    Left = 24
    Top = 128
  end
  object TblRejects: TFDQuery
    BeforeOpen = TblRejectsBeforeOpen
    BeforeClose = TblRejectsBeforeClose
    BeforePost = TblRejectsBeforePost
    AfterPost = TblRejectsAfterPost
    BeforeDelete = TblRejectsBeforeDelete
    OnNewRecord = TblRejectsNewRecord
    CachedUpdates = True
    OnUpdateRecord = TblRejectsUpdateRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    SQL.Strings = (
      'select'
      '   a.id as id,'
      '   a.hist_illum_part_id as hist_illum_part_id,'
      '   a.prod_date as prod_date,'
      '   a.shift as shift,'
      '   a.rejects as rejects,'
      '   a.reject_code as reject_code,'
      '   a.opno as opno,'
      '   a.source as source,'
      '   a.dart as dart,'
      '   a.attribute as attribute,'
      '   a.fg_lotno as fg_lotno,'
      '   a.arinvt_id as arinvt_id,'
      '   a.class as class,'
      '   a.itemno as itemno,'
      '   a.rev as rev,'
      '   a.descrip as descrip,'
      '   a.descrip2 as descrip2,'
      '   a.day_part_id as day_part_id,'
      '   a.internal_updating as internal_updating,'
      '   a.cavity_no as cavity_no,'
      '   a.pmeqmt_eqno as pmeqmt_eqno,'
      '   a.comment1'
      'from'
      '   /*v_rejects_force_use_ix_daypart a*/'
      '   rejects a'
      'where'
      '   a.day_part_id = :DAY_PART_ID '
      ' and parent_id is null  /* exclude rejects backflush */'
      '')
    Left = 27
    Top = 164
    ParamData = <
      item
        Name = 'DAY_PART_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object TblRejectsCode: TStringField
      DisplayWidth = 9
      FieldKind = fkLookup
      FieldName = 'Code'
      LookupDataSet = QryDescripLookUp
      LookupKeyFields = 'REJECT_CODE'
      LookupResultField = 'REJECT_CODE'
      KeyFields = 'REJECT_CODE'
      Origin = 'a.reject_code'
      Size = 5
      Lookup = True
    end
    object TblRejectsAttribute: TStringField
      DisplayLabel = 'Reason'
      DisplayWidth = 100
      FieldKind = fkLookup
      FieldName = 'Attribute'
      LookupDataSet = QryDescripLookUp
      LookupKeyFields = 'REJECT_CODE'
      LookupResultField = 'ATTRIBUTE'
      KeyFields = 'REJECT_CODE'
      Origin = 'a.attribute'
      Size = 100
      Lookup = True
    end
    object TblRejectsREJECTS: TBCDField
      DisplayLabel = 'Rejects'
      DisplayWidth = 10
      FieldName = 'REJECTS'
      Origin = 'a.rejects'
      Required = True
    end
    object TblRejectsCAVITY_NO: TStringField
      DisplayLabel = 'Cavity #'
      DisplayWidth = 10
      FieldName = 'CAVITY_NO'
      Origin = 'a.cavity_no'
      Size = 10
    end
    object TblRejectsPMEQMT_EQNO: TStringField
      DisplayLabel = 'Tool #'
      DisplayWidth = 25
      FieldName = 'PMEQMT_EQNO'
      Origin = 'a.pmeqmt_eqno'
      ReadOnly = True
      Size = 25
    end
    object TblRejectsCOMMENT1: TStringField
      DisplayLabel = 'Comment'
      DisplayWidth = 30
      FieldName = 'COMMENT1'
      Origin = 'a.COMMENT1'
      Size = 250
    end
    object TblRejectsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'a.id'
      Visible = False
      Size = 0
    end
    object TblRejectsHIST_ILLUM_PART_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'HIST_ILLUM_PART_ID'
      Origin = 'a.hist_illum_part_id'
      Visible = False
      Size = 0
    end
    object TblRejectsPROD_DATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'PROD_DATE'
      Origin = 'a.prod_date'
      Visible = False
    end
    object TblRejectsSHIFT: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIFT'
      Origin = 'a.shift'
      Visible = False
      Size = 0
    end
    object TblRejectsREJECT_CODE: TStringField
      DisplayWidth = 5
      FieldName = 'REJECT_CODE'
      Origin = 'a.reject_code'
      Visible = False
      Size = 5
    end
    object TblRejectsOPNO: TStringField
      DisplayWidth = 10
      FieldName = 'OPNO'
      Origin = 'a.opno'
      Visible = False
      Size = 15
    end
    object TblRejectsSOURCE: TStringField
      DisplayWidth = 2
      FieldName = 'SOURCE'
      Origin = 'a.source'
      Visible = False
      Size = 2
    end
    object TblRejectsFG_LOTNO: TStringField
      DisplayLabel = 'FG Lot #'
      DisplayWidth = 13
      FieldName = 'FG_LOTNO'
      Origin = 'a.fg_lotno'
      Visible = False
      FixedChar = True
      Size = 25
    end
    object TblRejectsDAY_PART_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'DAY_PART_ID'
      Origin = 'a.day_part_id'
      Visible = False
      Size = 0
    end
  end
  object QryDescripLookUp: TFDQuery
    Active = True
    BeforeOpen = AssignParams
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select RTrim(reject_code) as reject_code, '
      '       attribute,'
      '       eplant_id'
      '  from reject_code'
      ' where ( :mfgcell_id = 0 '
      '         or mfgcell_id = :mfgcell_id'
      '         or mfgcell_id is null )'
      '   and misc.eplant_filter_include_nulls( eplant_id ) = 1'
      '   and nvl(pk_hide, '#39'N'#39') <> '#39'Y'#39
      ' order by '
      '       attribute')
    Left = 88
    Top = 224
    ParamData = <
      item
        Name = 'mfgcell_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryDescripLookUpATTRIBUTE: TStringField
      DisplayLabel = 'Reason'
      DisplayWidth = 100
      FieldName = 'ATTRIBUTE'
      FixedChar = True
      Size = 100
    end
    object QryDescripLookUpREJECT_CODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'REJECT_CODE'
      Size = 5
    end
    object QryDescripLookUpEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object wwCodeLookUp: TFDQuery
    BeforeOpen = AssignParams
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select reject_code, '
      '       attribute,'
      '       eplant_id'
      '  from REJECT_CODE'
      ' where (:mfgcell_id = 0 '
      '        or mfgcell_id = :mfgcell_id'
      '        or mfgcell_id is null)'
      '   and misc.eplant_filter_include_nulls( eplant_id ) = 1'
      '   and nvl(pk_hide, '#39'N'#39') <> '#39'Y'#39
      ' order by reject_code '
      ' ')
    Left = 129
    Top = 169
    ParamData = <
      item
        Name = 'mfgcell_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwCodeLookUpREJECT_CODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'REJECT_CODE'
      Origin = 'REJECT_CODE.REJECT_CODE'
      Size = 5
    end
    object wwCodeLookUpATTRIBUTE: TStringField
      DisplayLabel = 'Reason'
      DisplayWidth = 100
      FieldName = 'ATTRIBUTE'
      Origin = 'REJECT_CODE.ATTRIBUTE'
      Size = 100
    end
    object wwCodeLookUpEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.REJECT_CODE.EPLANT_ID'
      Size = 0
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Rejects'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 193147 $'
    BuildVersion = '176554'
    Left = 165
    Top = 168
  end
  object PMain: TUniPopupMenu
    Left = 195
    Top = 168
    object About1: TUniMenuItem
      Caption = 'About'
      OnClick = About1Click
    end
  end
  object SrcDescripLookUp: TDataSource
    DataSet = QryDescripLookUp
    Left = 280
    Top = 160
  end
  object SrcCodeLookUp: TDataSource
    DataSet = wwCodeLookUp
    Left = 232
    Top = 240
  end
end
