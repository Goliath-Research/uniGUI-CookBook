object FrmCAR_ECO_Exist: TFrmCAR_ECO_Exist
  Left = 276
  Top = 131
  ClientHeight = 663
  ClientWidth = 472
  Caption = 'Open Quality Modules'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 118
    Width = 472
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Splitter2: TUniSplitter
    Left = 0
    Top = 246
    Width = 472
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Splitter3: TUniSplitter
    Left = 0
    Top = 374
    Width = 472
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Splitter4: TUniSplitter
    Left = 0
    Top = 507
    Width = 472
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object pnlCAR: TUniPanel
    Left = 0
    Top = 0
    Width = 472
    Height = 118
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 20
      Width = 470
      Height = 98
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 253
      IQComponents.Grid.Height = 12
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcCAR
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
      IQComponents.Navigator.DataSource = SrcCAR
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 253
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 12
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcCAR
      Columns = <
        item
          FieldName = 'CARNO'
          Title.Caption = 'CAR #/CAPA #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CAR_TYPE_NAME'
          Title.Caption = 'Type'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'INITIATOR'
          Title.Caption = 'Initiator'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ISSUE_DATE'
          Title.Caption = 'Issue Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_ID'
          Title.Caption = 'EPlant ID'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
    object Panel11: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 470
      Height = 20
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clWhite
      TabOrder = 1
      Caption = ''
      Color = clBtnShadow
      object Label4: TUniLabel
        Left = 1
        Top = 1
        Width = 91
        Height = 13
        Hint = ''
        Caption = 'Open CAR/CAPA'
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 141
    Width = 472
    Height = 105
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object IQSearch2: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 470
      Height = 103
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 253
      IQComponents.Grid.Height = 17
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcECO
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
      IQComponents.Navigator.DataSource = SrcECO
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 253
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 17
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcECO
      Columns = <
        item
          FieldName = 'ECONO'
          Title.Caption = 'ECO #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ECO_TYPE_NAME'
          Title.Caption = 'Type'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ORIGINATOR'
          Title.Caption = 'Originator'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'OPEN_DATE'
          Title.Caption = 'Open Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_ID'
          Title.Caption = 'EPlant ID'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object IQSearch3: TIQUniGridControl
    Left = 0
    Top = 269
    Width = 472
    Height = 105
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 255
    IQComponents.Grid.Height = 19
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = srcMRB
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
    IQComponents.Navigator.DataSource = srcMRB
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 255
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 19
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = srcMRB
    Columns = <
      item
        FieldName = 'WORKFLOWNO'
        Title.Caption = 'MRB #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'OPEN_DATE'
        Title.Caption = 'Open Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'INITIATOR'
        Title.Caption = 'Initiator'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPLANT_ID'
        Title.Caption = 'EPlant ID'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object Panel2: TUniPanel
    Tag = 1999
    Left = 0
    Top = 121
    Width = 472
    Height = 20
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    ParentFont = False
    Font.Color = clWhite
    TabOrder = 3
    Caption = ''
    Color = clBtnShadow
    object Label5: TUniLabel
      Left = 1
      Top = 1
      Width = 53
      Height = 13
      Hint = ''
      Caption = 'Open ECO'
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentFont = False
      Font.Color = clWhite
      Font.Style = [fsBold]
      TabOrder = 1
    end
  end
  object Panel3: TUniPanel
    Tag = 1999
    Left = 0
    Top = 249
    Width = 472
    Height = 20
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    ParentFont = False
    Font.Color = clWhite
    TabOrder = 4
    Caption = ''
    Color = clBtnShadow
    object Label6: TUniLabel
      Left = 1
      Top = 1
      Width = 57
      Height = 13
      Hint = ''
      Caption = 'Open MRB'
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentFont = False
      Font.Color = clWhite
      Font.Style = [fsBold]
      TabOrder = 1
    end
  end
  object pnlDev: TUniPanel
    Left = 0
    Top = 377
    Width = 472
    Height = 130
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 5
    Caption = ''
    object Panel4: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 470
      Height = 20
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clWhite
      TabOrder = 0
      Caption = ''
      Color = clBtnShadow
      object Label1: TUniLabel
        Left = 1
        Top = 1
        Width = 86
        Height = 13
        Hint = ''
        Caption = 'Open Deviation'
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object IQSearch4: TIQUniGridControl
      Left = 1
      Top = 20
      Width = 470
      Height = 110
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 253
      IQComponents.Grid.Height = 24
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcDev
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
      IQComponents.Navigator.DataSource = SrcDev
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 253
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 24
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcDev
      Columns = <
        item
          FieldName = 'WORKFLOWNO'
          Title.Caption = 'Deviation #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'OPEN_DATE'
          Title.Caption = 'Open Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'INITIATOR'
          Title.Caption = 'Initiator'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_ID'
          Title.Caption = 'EPlant ID'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object pnlPPap: TUniPanel
    Left = 0
    Top = 510
    Width = 472
    Height = 153
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 6
    Caption = ''
    object IQSearchPPAP: TIQUniGridControl
      Left = 1
      Top = 20
      Width = 470
      Height = 133
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 253
      IQComponents.Grid.Height = 47
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcPPap
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
      IQComponents.Navigator.DataSource = SrcPPap
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 253
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 47
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcPPap
      Columns = <
        item
          FieldName = 'PPAPNO'
          Title.Caption = 'PPAP #/Product PQ #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PPAP_TYPE_NAME'
          Title.Caption = 'Type'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ORIGINATOR'
          Title.Caption = 'Initiator'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PPAP_DATE'
          Title.Caption = 'Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_ID'
          Title.Caption = 'EPlant ID'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
    object Panel6: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 470
      Height = 20
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clWhite
      TabOrder = 1
      Caption = ''
      Color = clBtnShadow
      object Label2: TUniLabel
        Left = 1
        Top = 1
        Width = 129
        Height = 13
        Hint = ''
        Caption = 'Open PPAP/Product PQ'
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
  end
  object SrcCAR: TDataSource
    DataSet = QryCAR
    Left = 16
    Top = 67
  end
  object QryCAR: TFDQuery
    BeforeOpen = QryCARBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select car.id, '
      '       car.carno, '
      '       car.initiator, '
      '       car.issue_date,'
      '       car.close_date,'
      '       car.car_type_name,'
      '       car.eplant_id, '
      '       car.kind'
      '  from car, car_item item'
      ' where '
      '       car.id = item.car_id'
      '   and'
      '       (:criteria = '#39'ARINVT_ID'#39' and :arinvt_id = item.arinvt_id'
      '        or'
      '        :criteria = '#39'PMEQMT_ID'#39' and :arinvt_id = item.pmeqmt_id)'
      '   and car.close_date is NULL'
      '   and misc.eplant_filter( car.eplant_id ) = 1   '
      '   ')
    Left = 15
    Top = 78
    ParamData = <
      item
        Name = 'criteria'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryCARCARNO: TStringField
      DisplayLabel = 'CAR #/CAPA #'
      DisplayWidth = 15
      FieldName = 'CARNO'
      Origin = 'carno'
      Size = 15
    end
    object QryCARCAR_TYPE_NAME: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 10
      FieldName = 'CAR_TYPE_NAME'
      Origin = 'car_type_name'
      Size = 10
    end
    object QryCARINITIATOR: TStringField
      DisplayLabel = 'Initiator'
      DisplayWidth = 20
      FieldName = 'INITIATOR'
      Origin = 'INITIATOR'
      Size = 30
    end
    object QryCARISSUE_DATE: TDateTimeField
      DisplayLabel = 'Issue Date'
      DisplayWidth = 14
      FieldName = 'ISSUE_DATE'
      Origin = 'ISSUE_DATE'
    end
    object QryCAREPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Size = 0
    end
    object QryCARCLOSE_DATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'CLOSE_DATE'
      Origin = 'CLOSE_DATE'
      Visible = False
    end
    object QryCARID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'id'
      Visible = False
      Size = 0
    end
    object QryCARKIND: TStringField
      FieldName = 'KIND'
      Visible = False
      Size = 10
    end
  end
  object SrcECO: TDataSource
    DataSet = QryECO
    Left = 23
    Top = 190
  end
  object QryECO: TFDQuery
    BeforeOpen = QryCARBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select eco.id, '
      '       eco.econo,'
      '       eco.originator,'
      '       eco.open_date,'
      '       eco.eco_type_name, '
      '       eco.eplant_id'
      '  from eco'
      ' where '
      
        '       (:criteria = '#39'ARINVT_ID'#39' and exists (select 1 from eco_it' +
        'em item where item.eco_id = eco.id and item.arinvt_id = :arinvt_' +
        'id)'
      '        or'
      '        :criteria = '#39'PMEQMT_ID'#39' and pmeqmt_id = :arinvt_id )'
      '   and close_date is NULL'
      '   and misc.eplant_filter( eplant_id ) = 1   '
      ''
      ' '
      ' '
      ' ')
    Left = 24
    Top = 202
    ParamData = <
      item
        Name = 'criteria'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryECOECONO: TStringField
      DisplayLabel = 'ECO #'
      DisplayWidth = 15
      FieldName = 'ECONO'
      Origin = 'ECO.ECONO'
      Size = 15
    end
    object QryECOECO_TYPE_NAME: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 10
      FieldName = 'ECO_TYPE_NAME'
      Origin = 'ECO.ECO_TYPE_NAME'
      Size = 10
    end
    object QryECOORIGINATOR: TStringField
      DisplayLabel = 'Originator'
      DisplayWidth = 20
      FieldName = 'ORIGINATOR'
      Origin = 'ECO.ORIGINATOR'
      Size = 30
    end
    object QryECOOPEN_DATE: TDateTimeField
      DisplayLabel = 'Open Date'
      DisplayWidth = 14
      FieldName = 'OPEN_DATE'
      Origin = 'ECO.OPEN_DATE'
    end
    object QryECOEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'ECO.EPLANT_ID'
      Size = 0
    end
    object QryECOID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ECO.ID'
      Visible = False
      Size = 0
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 51
    Top = 79
    object JumpToCAR1: TUniMenuItem
      Caption = 'Jump To CAR'
      OnClick = JumpToCAR1Click
    end
  end
  object PopupMenu2: TUniPopupMenu
    Left = 60
    Top = 189
    object JumpToECO1: TUniMenuItem
      Caption = 'Jump To ECO'
      OnClick = JumpToECO1Click
    end
  end
  object srcMRB: TDataSource
    DataSet = QryMRB
    Left = 25
    Top = 312
  end
  object QryMRB: TFDQuery
    BeforeOpen = QryCARBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct '
      '       h.id, '
      '       h.workflowno,'
      '       h.initiator, '
      '       h.open_date,'
      '       h.eplant_id'
      '  from wf_header h, wf_deviation_item i'
      ' where '
      '       (    :criteria = '#39'ARINVT_ID'#39' '
      '        and i.arinvt_id = :arinvt_id '
      '        and i.wf_header_id = h.id '
      '       ) '
      '       '
      '   and h.close_date is NULL'
      '   and h.kind = '#39'MRB'#39
      '   and misc.eplant_filter( h.eplant_id ) = 1   '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 27
    Top = 324
    ParamData = <
      item
        Name = 'criteria'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryMRBWORKFLOWNO: TStringField
      DisplayLabel = 'MRB #'
      DisplayWidth = 15
      FieldName = 'WORKFLOWNO'
      Origin = 'h.WORKFLOWNO'
      Size = 15
    end
    object QryMRBOPEN_DATE: TDateTimeField
      DisplayLabel = 'Open Date'
      DisplayWidth = 14
      FieldName = 'OPEN_DATE'
      Origin = 'h.OPEN_DATE'
    end
    object QryMRBINITIATOR: TStringField
      DisplayLabel = 'Initiator'
      DisplayWidth = 30
      FieldName = 'INITIATOR'
      Origin = 'h.INITIATOR'
      Size = 30
    end
    object QryMRBEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'h.eplant_id'
      Size = 0
    end
    object QryMRBID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'h.id'
      Visible = False
      Size = 0
    end
  end
  object PopupMenu3: TUniPopupMenu
    Left = 70
    Top = 321
    object JumpToMRB1: TUniMenuItem
      Caption = 'Jump To MRB'
      OnClick = JumpToMRB1Click
    end
  end
  object SrcDev: TDataSource
    DataSet = QryDev
    Left = 41
    Top = 443
  end
  object QryDev: TFDQuery
    BeforeOpen = QryCARBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct '
      '       h.id, '
      '       h.workflowno,'
      '       h.initiator, '
      '       h.open_date,'
      '       h.eplant_id'
      '  from wf_header h, wf_deviation_item i'
      ' where '
      '       (    :criteria = '#39'ARINVT_ID'#39' '
      '        and i.arinvt_id = :arinvt_id '
      '        and i.wf_header_id = h.id '
      '       ) '
      '       '
      '   and h.complete_date is NULL'
      '   and h.kind = '#39'DEV'#39
      '   and misc.eplant_filter( h.eplant_id ) = 1   ')
    Left = 42
    Top = 458
    ParamData = <
      item
        Name = 'criteria'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryDevWORKFLOWNO: TStringField
      DisplayLabel = 'Deviation #'
      DisplayWidth = 15
      FieldName = 'WORKFLOWNO'
      Origin = 'h.WORKFLOWNO'
      Size = 15
    end
    object QryDevOPEN_DATE: TDateTimeField
      DisplayLabel = 'Open Date'
      DisplayWidth = 15
      FieldName = 'OPEN_DATE'
      Origin = 'h.OPEN_DATE'
    end
    object QryDevINITIATOR: TStringField
      DisplayLabel = 'Initiator'
      DisplayWidth = 29
      FieldName = 'INITIATOR'
      Origin = 'h.INITIATOR'
      Size = 30
    end
    object QryDevEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'h.eplant_id'
      Size = 0
    end
    object QryDevID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object PopupMenu4: TUniPopupMenu
    Left = 82
    Top = 457
    object JumpToDeviation1: TUniMenuItem
      Caption = 'Jump To Deviation'
      OnClick = JumpToDeviation1Click
    end
  end
  object SrcPPap: TDataSource
    DataSet = QryPPap
    Left = 41
    Top = 583
  end
  object QryPPap: TFDQuery
    BeforeOpen = QryCARBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, '
      '       ppapno, '
      '       originator, '
      '       ppap_date,'
      '       ppap_type_name,'
      '       eplant_id'
      '  from ppap'
      ' where '
      '       (:criteria = '#39'ARINVT_ID'#39' and :arinvt_id = arinvt_id)'
      '   and approval_date is NULL'
      '   and misc.eplant_filter( eplant_id ) = 1   '
      ' '
      ' '
      ' '
      ' '
      ' '
      '')
    Left = 42
    Top = 602
    ParamData = <
      item
        Name = 'criteria'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryPPapPPAPNO: TStringField
      DisplayLabel = 'PPAP #/Product PQ #'
      DisplayWidth = 15
      FieldName = 'PPAPNO'
      Origin = 'ppapno'
      Size = 15
    end
    object QryPPapPPAP_TYPE_NAME: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 10
      FieldName = 'PPAP_TYPE_NAME'
      Origin = 'PPAP_TYPE_NAME'
      Size = 10
    end
    object QryPPapORIGINATOR: TStringField
      DisplayLabel = 'Initiator'
      DisplayWidth = 18
      FieldName = 'ORIGINATOR'
      Origin = 'ORIGINATOR'
      Size = 30
    end
    object QryPPapPPAP_DATE: TDateTimeField
      DisplayLabel = 'Date'
      DisplayWidth = 18
      FieldName = 'PPAP_DATE'
      Origin = 'PPAP_DATE'
    end
    object QryPPapEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 8
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Size = 0
    end
    object QryPPapID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object popmPPAP: TUniPopupMenu
    Left = 79
    Top = 602
    object JumpToPPAP1: TUniMenuItem
      Caption = 'Jump To PPAP'
      OnClick = JumpToPPAP1Click
    end
  end
end
