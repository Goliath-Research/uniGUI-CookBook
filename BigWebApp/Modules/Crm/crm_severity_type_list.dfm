inherited FrmCRMSeverityTypeList: TFrmCRMSeverityTypeList
  ClientHeight = 273
  ClientWidth = 458
  Caption = 'Severity Types'
  ExplicitWidth = 474
  ExplicitHeight = 312
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TUniPanel
    Width = 458
    ExplicitWidth = 458
  end
  inherited Panel1: TUniPanel
    Width = 458
    ExplicitWidth = 458
    inherited NavMain: TUniDBNavigator
      Left = 232
      DataSource = SrcSeverityType
      ExplicitLeft = 232
    end
  end
  inherited Panel2: TUniPanel
    Width = 458
    Height = 243
    ExplicitWidth = 458
    ExplicitHeight = 243
    inherited Grid: TIQUniGridControl
      Width = 456
      Height = 241
      IQComponents.Grid.Width = 239
      IQComponents.Grid.Height = 155
      IQComponents.Grid.DataSource = SrcSeverityType
      IQComponents.Grid.OnDrawColumnCell = GridDBGridDrawColumnCell
      IQComponents.Navigator.DataSource = SrcSeverityType
      IQComponents.HiddenPanel.Left = 239
      IQComponents.HiddenPanel.Height = 155
      IQComponents.HiddenPanel.ExplicitLeft = 239
      IQComponents.HiddenPanel.ExplicitHeight = 155
      IQComponents.FormTab.ExplicitLeft = 4
      IQComponents.FormTab.ExplicitTop = 24
      IQComponents.FormTab.ExplicitWidth = 448
      IQComponents.FormTab.ExplicitHeight = 184
      DataSource = SrcSeverityType
      ExplicitWidth = 456
      ExplicitHeight = 241
      Marker = 0
    end
    object cmbLabelColor: TUniEdit
      Left = 112
      Top = 56
      Width = 81
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 1
    end
  end
  object SrcSeverityType: TDataSource
    DataSet = QrySeverityType
    Left = 168
    Top = 112
  end
  object QrySeverityType: TFDQuery
    OnNewRecord = QrySeverityTypeNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'CRM_ACTIVITY_SEVERITY'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = FDUpdateSQL1
    SQL.Strings = (
      'SELECT id,'
      '       name,'
      '       description,'
      '       label_color,'
      '       label_color_g,'
      '       label_color_r,'
      '       label_color_b'
      '  FROM crm_activity_severity')
    Left = 176
    Top = 120
    object QrySeverityTypeID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QrySeverityTypeNAME: TStringField
      DisplayLabel = 'Severity Type'
      DisplayWidth = 18
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 35
    end
    object QrySeverityTypeDESCRIPTION: TStringField
      DisplayLabel = 'Severity Type Description'
      DisplayWidth = 25
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      Size = 255
    end
    object QrySeverityTypeLabelColor: TWideStringField
      DisplayLabel = 'Label Color'
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'LabelColor'
      Origin = 'label_color'
      Size = 12
      Calculated = True
    end
    object QrySeverityTypeLABEL_COLOR: TBCDField
      DisplayLabel = 'Label Color'
      FieldName = 'LABEL_COLOR'
      Origin = 'LABEL_COLOR'
      Visible = False
      Precision = 10
      Size = 0
    end
    object QrySeverityTypeLABEL_COLOR_G: TBCDField
      FieldName = 'LABEL_COLOR_G'
      Origin = 'LABEL_COLOR_G'
      Visible = False
      Precision = 10
      Size = 0
    end
    object QrySeverityTypeLABEL_COLOR_R: TBCDField
      FieldName = 'LABEL_COLOR_R'
      Origin = 'LABEL_COLOR_R'
      Visible = False
      Precision = 10
      Size = 0
    end
    object QrySeverityTypeLABEL_COLOR_B: TBCDField
      FieldName = 'LABEL_COLOR_B'
      Origin = 'LABEL_COLOR_B'
      Visible = False
      Precision = 10
      Size = 0
    end
  end
  object PMain: TUniPopupMenu
    Left = 248
    Top = 107
    object EditColor1: TUniMenuItem
      Caption = 'Edit Color'
      OnClick = EditColor1Click
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      ShortCut = 112
      OnClick = Help1Click
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'NavMain'
      'EditColor1')
    SecurityCode = 'FRMCRMSEVERITYTYPELIST'
    AfterApply = SRAfterApply
    Left = 276
    Top = 107
  end
  object FDUpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'INSERT INTO CRM_ACTIVITY_SEVERITY'
      '(ID, NAME, DESCRIPTION, LABEL_COLOR, LABEL_COLOR_G, '
      '  LABEL_COLOR_R, LABEL_COLOR_B)'
      
        'VALUES (:NEW_ID, :NEW_NAME, :NEW_DESCRIPTION, :NEW_LABEL_COLOR, ' +
        ':NEW_LABEL_COLOR_G, '
      '  :NEW_LABEL_COLOR_R, :NEW_LABEL_COLOR_B)')
    ModifySQL.Strings = (
      'UPDATE CRM_ACTIVITY_SEVERITY'
      
        'SET ID = :NEW_ID, NAME = :NEW_NAME, DESCRIPTION = :NEW_DESCRIPTI' +
        'ON, '
      
        '  LABEL_COLOR = :NEW_LABEL_COLOR, LABEL_COLOR_G = :NEW_LABEL_COL' +
        'OR_G, '
      
        '  LABEL_COLOR_R = :NEW_LABEL_COLOR_R, LABEL_COLOR_B = :NEW_LABEL' +
        '_COLOR_B'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM CRM_ACTIVITY_SEVERITY'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, NAME, DESCRIPTION, LABEL_COLOR, LABEL_COLOR_G, LABEL_' +
        'COLOR_R, '
      '  LABEL_COLOR_B'
      'FROM CRM_ACTIVITY_SEVERITY'
      'WHERE ID = :ID')
    Left = 184
    Top = 128
  end
  object ColorDialog1: TColorDialog
    CustomColors.Strings = (
      'ColorA=8494FF'
      'ColorB=DE8F6F'
      'ColorC=63DEA5'
      'ColorD=D6E7E7'
      'ColorE=73B5FF'
      'ColorF=F7EF84'
      'ColorG=84CED6'
      'ColorH=F7A5C6'
      'ColorI=C6CEA5'
      'ColorJ=73E7FF')
    Left = 344
    Top = 179
  end
end
