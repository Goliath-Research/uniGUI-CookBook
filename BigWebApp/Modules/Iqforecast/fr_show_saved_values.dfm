object FrmForecastShowSavedValues: TFrmForecastShowSavedValues
  Left = 322
  Top = 251
  ClientHeight = 378
  ClientWidth = 434
  Caption = 'Compare Saved Forecasts'
  OnShow = UniFormShow
  BorderStyle = bsSizeToolWin
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 71
    Width = 434
    Height = 4
    Cursor = crVSplit
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 75
    Width = 434
    Height = 303
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 432
      Height = 301
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 215
      IQComponents.Grid.Height = 215
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcForeHist
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
      IQComponents.Navigator.DataSource = SrcForeHist
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 215
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 215
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcForeHist
      Columns = <
        item
          FieldName = 'NAME'
          Title.Caption = 'Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'QTY'
          Title.Caption = 'Qty'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'KIND'
          Title.Caption = 'Forecast Type'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 434
    Height = 71
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object wwDataInspector1: TwwDataInspector
      Left = 0
      Top = 0
      Width = 434
      Height = 71
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DisableThemes = False
      Align = alClient
      TabOrder = 1
      DataSource = SrcHeader
      Items = <
        item
          DataSource = SrcHeader
          DataField = 'ITEMNO'
          Caption = 'Item #'
          Items = <
            item
              DataSource = SrcHeader
              DataField = 'DESCRIP'
              Caption = 'Description'
              WordWrap = False
            end>
          WordWrap = False
        end
        item
          DataSource = SrcHeader
          DataField = 'MM_YY'
          Caption = 'Month'
          WordWrap = False
        end>
      DefaultRowHeight = 18
      CaptionWidth = 100
      Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      LineStyleCaption = ovDottedLine
      LineStyleData = ovDottedLine
      CaptionIndent = 18
    end
  end
  object SrcForeHist: TDataSource
    DataSet = QryForeHist
    Left = 80
    Top = 104
  end
  object QryForeHist: TFDQuery
    Active = True
    BeforeOpen = QryForeHistBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select h.id,'
      '       h.name,'
      '       h.kind,'
      '       sum( d.qty ) as qty'
      '  from'
      '       fore_head h,'
      '       fore_item i,'
      '       fore_cust c,'
      '       fore_dtl d'
      ' where'
      '       h.id = i.fore_head_id'
      '   and i.id = c.fore_item_id'
      '   and c.id = d.fore_cust_id    '
      ' '
      '   and i.arinvt_id = :arinvt_id'
      '   and to_number(to_char( d.req_date, '#39'MM'#39')) = :MM'
      '   and to_number(to_char( d.req_date, '#39'RRRR'#39')) = :YY'
      ' group by'
      '       h.id,'
      '       h.name,'
      '       h.kind'
      '')
    Left = 80
    Top = 136
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'MM'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'YY'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryForeHistNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 14
      FieldName = 'NAME'
      Origin = 'h.name'
      Size = 30
    end
    object QryForeHistQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 12
      FieldName = 'QTY'
      Origin = 'sum( d.qty )'
      Size = 38
    end
    object QryForeHistKIND: TStringField
      DisplayLabel = 'Forecast Type'
      DisplayWidth = 24
      FieldName = 'KIND'
      Origin = 'h.kind'
      Size = 1
    end
    object QryForeHistID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'h.id'
      Visible = False
      Size = 0
    end
  end
  object SrcHeader: TDataSource
    DataSet = QryHeader
    Left = 24
    Top = 112
  end
  object QryHeader: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select itemno,'
      '       descrip,'
      '       :mm_yy as mm_yy'
      '  from arinvt'
      ' where id = :arinvt_id')
    Left = 24
    Top = 136
    ParamData = <
      item
        Name = 'mm_yy'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryHeaderITEMNO: TStringField
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryHeaderDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 100
    end
    object QryHeaderMM_YY: TStringField
      FieldName = 'MM_YY'
      Size = 4000
    end
  end
end
