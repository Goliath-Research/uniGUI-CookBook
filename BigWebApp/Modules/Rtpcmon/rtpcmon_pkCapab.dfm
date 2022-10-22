object FrmPkCapabilities: TFrmPkCapabilities
  Left = 699
  Top = 347
  ClientHeight = 346
  ClientWidth = 508
  Caption = 'Pick Capabilites From Template'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  DesignSize = (
    508
    346)
  PixelsPerInch = 96
  TextHeight = 13
  object btnOK: TUniButton
    Left = 299
    Top = 313
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'OK'
    Anchors = []
    TabOrder = 0
    OnClick = btnOKClick
    ExplicitLeft = 297
    ExplicitTop = 318
  end
  object btnCancel: TUniButton
    Left = 403
    Top = 313
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    ModalResult = 2
    Anchors = []
    TabOrder = 1
    ExplicitLeft = 400
    ExplicitTop = 318
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 508
    Height = 300
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    ExplicitWidth = 505
    ExplicitHeight = 305
    object iqsrchCapabilities: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 506
      Height = 298
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 289
      IQComponents.Grid.Height = 212
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = srcSelectCapabilities
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
      IQComponents.Navigator.DataSource = srcSelectCapabilities
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 289
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 212
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitLeft = 279
      IQComponents.HiddenPanel.ExplicitHeight = 227
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitWidth = 488
      IQComponents.FormTab.ExplicitHeight = 256
      DataSource = srcSelectCapabilities
      ExplicitWidth = 496
      ExplicitHeight = 313
      Marker = 0
    end
  end
  object srcSelectCapabilities: TDataSource
    DataSet = qrySelectCapabilites
    Left = 160
    Top = 120
  end
  object qrySelectCapabilites: TFDQuery
    BeforeOpen = qrySelectCapabilitesBeforeOpen
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select t.id as capab_template_id,'
      '       ct.name as capab_type,'
      '       ct.descrip as capab_descrip,       '
      '       t.command as capab_command,'
      '       t.start_pos as capab_start_pos,'
      '       t.name as capab_name,'
      '       t.uom as uom       '
      '  from pcmon_device d,'
      '       pcmon_dev_capab_tmpl t,'
      '       pcmon_capab_type ct'
      '       '
      ' where d.template_id = t.pcmon_device_template_id'
      '   and t.pcmon_capab_type_id = ct.id '
      '   and d.id = :DEVICE_ID'
      '   and not exists (select 1 '
      '                     from pcmon_device_capab dc'
      
        '                    where dc.pcmon_capab_type_id = t.pcmon_capab' +
        '_type_id '
      '                      and dc.pcmon_device_id = :DEVICE_ID)')
    Left = 160
    Top = 168
    ParamData = <
      item
        Name = 'DEVICE_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object qrySelectCapabilitesCAPAB_TEMPLATE_ID: TBCDField
      FieldName = 'CAPAB_TEMPLATE_ID'
      Visible = False
      Size = 0
    end
    object qrySelectCapabilitesCAPAB_TYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 25
      FieldName = 'CAPAB_TYPE'
      Size = 50
    end
    object qrySelectCapabilitesCAPAB_DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'CAPAB_DESCRIP'
      Size = 50
    end
    object qrySelectCapabilitesCAPAB_COMMAND: TStringField
      DisplayLabel = 'Command'
      DisplayWidth = 50
      FieldName = 'CAPAB_COMMAND'
      Size = 50
    end
    object qrySelectCapabilitesCAPAB_START_POS: TBCDField
      DisplayLabel = 'Start Position'
      DisplayWidth = 10
      FieldName = 'CAPAB_START_POS'
      Size = 0
    end
    object qrySelectCapabilitesCAPAB_NAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 50
      FieldName = 'CAPAB_NAME'
      Size = 50
    end
    object qrySelectCapabilitesUOM: TStringField
      FieldName = 'UOM'
      Size = 10
    end
  end
end
