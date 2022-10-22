object FrmRepDefParamPkListCols: TFrmRepDefParamPkListCols
  Left = 342
  Top = 214
  ClientHeight = 308
  ClientWidth = 697
  Caption = 'Parameter Picklist Optional Columns'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inline wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 697
    Height = 308
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    ExplicitTop = 28
    ExplicitWidth = 697
    ExplicitHeight = 280
    inherited PageControl: TUniPageControl
      Width = 697
      Height = 279
    end
    inherited TopToolBar: TUniToolBar
      Width = 697
      TabOrder = 2
    end
  end
  object SrcCols: TDataSource
    DataSet = QryCols
    Left = 48
    Top = 112
  end
  object QryCols: TFDQuery
    BeforeOpen = QryColsBeforeOpen
    BeforeRefresh = QryColsBeforeRefresh
    OnNewRecord = QryColsNewRecord
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'REPDEF_CRITERIA_PICKLIST'
    UpdateOptions.KeyFields = 'APP_ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select app_id,'
      '       repname,'
      '       crw_col_name,'
      '       column_name,'
      '       caption,'
      '       width,'
      '       seq'
      '  from'
      '       repdef_criteria_picklist'
      ' where'
      '       app_id = :app_id'
      '   and repname = :repname'
      '   and crw_col_name = :crw_col_name'
      ' order by seq     ')
    Left = 136
    Top = 184
    ParamData = <
      item
        Name = 'app_id'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'repname'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'crw_col_name'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryColsSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 3
      FieldName = 'SEQ'
      Origin = 'IQ.REPDEF_CRITERIA_PICKLIST.SEQ'
      Size = 0
    end
    object QryColsCOLUMN_NAME: TStringField
      DisplayLabel = 'Column Name'
      DisplayWidth = 25
      FieldName = 'COLUMN_NAME'
      Origin = 'IQ.REPDEF_CRITERIA_PICKLIST.COLUMN_NAME'
      Required = True
      Size = 30
    end
    object QryColsCAPTION: TStringField
      DisplayLabel = 'Caption'
      DisplayWidth = 25
      FieldName = 'CAPTION'
      Origin = 'IQ.REPDEF_CRITERIA_PICKLIST.CAPTION'
      Required = True
      Size = 60
    end
    object QryColsWIDTH: TBCDField
      DisplayLabel = 'Width'
      DisplayWidth = 10
      FieldName = 'WIDTH'
      Origin = 'IQ.REPDEF_CRITERIA_PICKLIST.WIDTH'
      Size = 0
    end
    object QryColsAPP_ID: TStringField
      FieldName = 'APP_ID'
      Origin = 'IQ.REPDEF_CRITERIA_PICKLIST.APP_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 30
    end
    object QryColsREPNAME: TStringField
      FieldName = 'REPNAME'
      Origin = 'IQ.REPDEF_CRITERIA_PICKLIST.REPNAME'
      Required = True
      Visible = False
      Size = 50
    end
    object QryColsCRW_COL_NAME: TStringField
      FieldName = 'CRW_COL_NAME'
      Origin = 'IQ.REPDEF_CRITERIA_PICKLIST.CRW_COL_NAME'
      Required = True
      Visible = False
      Size = 60
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into repdef_criteria_picklist'
      
        '  (APP_ID, REPNAME, CRW_COL_NAME, COLUMN_NAME, CAPTION, WIDTH, S' +
        'EQ)'
      'values'
      
        '  (:APP_ID, :REPNAME, :CRW_COL_NAME, :COLUMN_NAME, :CAPTION, :WI' +
        'DTH, :SEQ)')
    ModifySQL.Strings = (
      'update repdef_criteria_picklist'
      'set'
      '  APP_ID = :APP_ID,'
      '  REPNAME = :REPNAME,'
      '  CRW_COL_NAME = :CRW_COL_NAME,'
      '  COLUMN_NAME = :COLUMN_NAME,'
      '  CAPTION = :CAPTION,'
      '  WIDTH = :WIDTH,'
      '  SEQ = :SEQ'
      'where'
      '  APP_ID = :OLD_APP_ID and'
      '  REPNAME = :OLD_REPNAME and'
      '  CRW_COL_NAME = :OLD_CRW_COL_NAME and'
      '  COLUMN_NAME = :OLD_COLUMN_NAME')
    DeleteSQL.Strings = (
      'delete from repdef_criteria_picklist'
      'where'
      '  APP_ID = :OLD_APP_ID and'
      '  REPNAME = :OLD_REPNAME and'
      '  CRW_COL_NAME = :OLD_CRW_COL_NAME and'
      '  COLUMN_NAME = :OLD_COLUMN_NAME')
    Left = 48
    Top = 156
  end
end
