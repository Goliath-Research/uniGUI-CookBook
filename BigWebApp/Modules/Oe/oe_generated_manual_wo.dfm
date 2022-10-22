object FrmOEGeneratedManualWorkorders: TFrmOEGeneratedManualWorkorders
  Left = 0
  Top = 0
  ClientHeight = 313
  ClientWidth = 398
  Caption = 'Manually Generated Firm Work Orders'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 398
    Height = 81
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object CaptionPanel1: TIQWebCaptionPanel
      Left = 0
      Top = 0
      Width = 398
      Height = 81
      Caption = 'Associated Firm Work Orders'
      Text = 
        'The following is the list of manually generated firm work orders' +
        ' for the sales order line. Right click to jump and edit selected' +
        ' work order.'
      PictureLayout = plImageRight
      LayoutStyle = lsWindowsXP
      Align = alClient
      DesignSize = (
        398
        81)
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 81
    Width = 398
    Height = 232
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 396
      Height = 230
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 179
      IQComponents.Grid.Height = 144
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
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 179
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 144
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
          FieldName = 'ID'
          Title.Caption = 'Work Order #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_ID'
          Title.Caption = 'EPlant ID'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CYCLES_REQ'
          Title.Caption = 'Required'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object Query1: TFDQuery
    BeforeOpen = Query1BeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select  w.id as id,'
      '        w.eplant_id as eplant_id,'
      '        w.cycles_req as cycles_req'
      '   from workorder w'
      '  where w.manual_source_ord_detail_id = :ord_detail_id')
    Left = 88
    Top = 176
    ParamData = <
      item
        Name = 'ord_detail_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object Query1ID: TBCDField
      DisplayLabel = 'Work Order #'
      DisplayWidth = 20
      FieldName = 'ID'
      Origin = 'w.id'
      Size = 0
    end
    object Query1EPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 12
      FieldName = 'EPLANT_ID'
      Origin = 'w.eplant_id'
      Size = 0
    end
    object Query1CYCLES_REQ: TBCDField
      DisplayLabel = 'Required'
      DisplayWidth = 21
      FieldName = 'CYCLES_REQ'
      Origin = 'w.CYCLES_REQ'
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 88
    Top = 192
  end
  object PopupMenu1: TUniPopupMenu
    Left = 136
    Top = 176
    object JumpToWorkOrder1: TUniMenuItem
      Caption = 'Jump To Work Order'
      OnClick = JumpToWorkOrder1Click
    end
  end
  object IQJump1: TIQWebJump
    DataField = 'ID'
    DataSource = DataSource1
    JumpTo = jtWorkOrder
    Left = 176
    Top = 176
  end
end
