object FrmBomAuxTool: TFrmBomAuxTool
  Left = 436
  Top = 226
  ClientHeight = 303
  ClientWidth = 486
  Caption = 'Auxiliary Tooling Info'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object wwDBGrid: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 486
    Height = 303
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 269
    IQComponents.Grid.Height = 217
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = wwDataSource1
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
    IQComponents.Navigator.DataSource = wwDataSource1
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 269
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 217
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = wwDataSource1
    Columns = <
      item
        FieldName = 'Eqno'
        Title.Caption = 'Tool #'
        Width = 154
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Descrip'
        Title.Caption = 'Description'
        Width = 298
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object wwDBComboDlg1: TUniEdit
    Left = 41
    Top = 150
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 1
  end
  object wwDataSource1: TDataSource
    DataSet = wwQuery1
    Left = 95
    Top = 63
  end
  object wwQuery1: TFDQuery
    BeforeOpen = wwQuery1BeforeOpen
    BeforePost = wwQuery1BeforePost
    OnCalcFields = wwQuery1CalcFields
    OnNewRecord = wwQuery1NewRecord
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select a.id,'
      '       a.pmeqmt_id,'
      '       a.aux_id'
      '  from aux_pmeqmt a'
      ' where a.aux_id = :aux_id'
      ' order by a.id')
    Left = 95
    Top = 90
    ParamData = <
      item
        Name = 'aux_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQuery1Eqno: TStringField
      DisplayLabel = 'Tool #'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'Eqno'
      Size = 25
      Calculated = True
    end
    object wwQuery1Descrip: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 49
      FieldKind = fkCalculated
      FieldName = 'Descrip'
      Size = 50
      Calculated = True
    end
    object wwQuery1ID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.AUX_PMEQMT.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object wwQuery1PMEQMT_ID: TBCDField
      DisplayLabel = 'Auxiliary Tool #'
      FieldName = 'PMEQMT_ID'
      Origin = 'IQ.AUX_PMEQMT.PMEQMT_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object wwQuery1AUX_ID: TBCDField
      FieldName = 'AUX_ID'
      Origin = 'IQ.AUX_PMEQMT.AUX_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into aux_pmeqmt'
      '  (ID, PMEQMT_ID, AUX_ID)'
      'values'
      '  (:ID, :PMEQMT_ID, :AUX_ID)')
    ModifySQL.Strings = (
      'update aux_pmeqmt'
      'set'
      '  ID = :ID,'
      '  PMEQMT_ID = :PMEQMT_ID,'
      '  AUX_ID = :AUX_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from aux_pmeqmt'
      'where'
      '  ID = :OLD_ID')
    Left = 95
    Top = 121
  end
  object PkEQMT: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id, '
      '       eqno,'
      '       descrip,'
      '       class,'
      '       location,'
      '       eplant_id,'
      '       pk_hide'
      '  from pmeqmt'
      ' where misc.eplant_filter( eplant_id ) = 1'
      '   and nvl(pk_hide, '#39'N'#39') <> '#39'Y'#39
      ''
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 152
    Top = 179
    object PkEQMTID: TBCDField
      FieldName = 'ID'
      Origin = 'id'
      Visible = False
      Size = 0
    end
    object PkEQMTEQNO: TStringField
      DisplayLabel = 'Equipment#'
      FieldName = 'EQNO'
      Origin = 'eqno'
      Size = 25
    end
    object PkEQMTDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'descrip'
      Size = 50
    end
    object PkEQMTCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Origin = 'class'
      Size = 2
    end
    object PkEQMTLOCATION: TStringField
      DisplayLabel = 'Location'
      FieldName = 'LOCATION'
      Origin = 'location'
      Size = 30
    end
    object PkEQMTEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'eplant_id'
      Size = 0
    end
    object PkEQMTPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'pk_hide'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'wwQuery1'
      'NavMain')
    SecurityCode = 'FRMBOMAUXTOOL'
    Left = 136
    Top = 79
  end
end
