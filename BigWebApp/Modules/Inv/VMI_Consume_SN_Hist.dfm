object FrmConsumeVMI_SN_Hist: TFrmConsumeVMI_SN_Hist
  Left = 255
  Top = 189
  ClientHeight = 180
  ClientWidth = 389
  Caption = 'Consumed VMI Serial #'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 0
    Width = 389
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    ExplicitTop = 27
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 3
    Width = 389
    Height = 177
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 172
    IQComponents.Grid.Height = 91
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
    IQComponents.HiddenPanel.Left = 172
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 91
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 64
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitHeight = 93
    DataSource = wwDataSource1
    Columns = <
      item
        FieldName = 'SERIAL'
        Title.Caption = 'Serial #'
        Width = 70
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'QTY'
        Title.Caption = 'Quantity'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SCAN_DATE'
        Title.Caption = 'Scan Date'
        Width = 119
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'USERID'
        Title.Caption = 'User Name'
        Width = 84
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = False
    ExplicitTop = 30
    ExplicitHeight = 150
    Marker = 0
  end
  object wwDataSource1: TDataSource
    DataSet = wwQuery1
    Left = 248
    Top = 42
  end
  object wwQuery1: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    SQL.Strings = (
      'select id,'
      '       scan_date,'
      '       serial,'
      '       userid,'
      '       qty,'
      '       master_label_id,'
      '       arinvt_id,'
      '       translog_id'
      '  from hist_vmi_sn_consume'
      ' where translog_id = :translog_id'
      ' order by'
      '       scan_date'
      '         '
      ' '
      ' ')
    Left = 167
    Top = 40
    ParamData = <
      item
        Name = 'translog_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQuery1SERIAL: TStringField
      DisplayLabel = 'Serial #'
      DisplayWidth = 10
      FieldName = 'SERIAL'
      Origin = 'IQ.VMI_SN_CONSUME.SERIAL'
      ReadOnly = True
      Size = 50
    end
    object wwQuery1QTY: TFMTBCDField
      DisplayLabel = 'Quantity'
      DisplayWidth = 10
      FieldName = 'QTY'
      Origin = 'IQ.VMI_SN_CONSUME.QTY'
      Size = 6
    end
    object wwQuery1SCAN_DATE: TDateTimeField
      DisplayLabel = 'Scan Date'
      DisplayWidth = 17
      FieldName = 'SCAN_DATE'
      Origin = 'IQ.VMI_SN_CONSUME.SCAN_DATE'
      ReadOnly = True
    end
    object wwQuery1USERID: TStringField
      DisplayLabel = 'User Name'
      DisplayWidth = 12
      FieldName = 'USERID'
      Origin = 'IQ.VMI_SN_CONSUME.USERID'
      ReadOnly = True
      Size = 35
    end
    object wwQuery1ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.VMI_SN_CONSUME.ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object wwQuery1MASTER_LABEL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'MASTER_LABEL_ID'
      Origin = 'IQ.VMI_SN_CONSUME.MASTER_LABEL_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object wwQuery1ARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.VMI_SN_CONSUME.ARINVT_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object wwQuery1TRANSLOG_ID: TBCDField
      FieldName = 'TRANSLOG_ID'
      Origin = 'IQ.HIST_VMI_SN_CONSUME.TRANSLOG_ID'
      Visible = False
      Size = 0
    end
  end
end
