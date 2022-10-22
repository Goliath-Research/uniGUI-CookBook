object Shop_Holiday: TShop_Holiday
  Left = 202
  Top = 215
  HelpContext = 1225551
  ClientHeight = 474
  ClientWidth = 405
  Caption = 'Holiday / Downtime Period'
  OnShow = FormShow
  BorderStyle = bsSizeToolWin
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 455
    Width = 405
    Height = 19
    Hint = ''
    Panels = <
      item
        Width = 400
      end>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
    ExplicitTop = 372
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 416
    Width = 405
    Height = 39
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitTop = 333
    object Panel2: TUniPanel
      Left = 188
      Top = 1
      Width = 217
      Height = 37
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 1
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 112
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 405
    Height = 416
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    ExplicitHeight = 333
    DesignSize = (
      405
      416)
    object GroupBox1: TUniGroupBox
      Left = 7
      Top = 8
      Width = 391
      Height = 59
      Hint = ''
      Caption = '  Period    '
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      object Label4: TUniLabel
        Left = 6
        Top = 26
        Width = 24
        Height = 13
        Hint = ''
        Caption = 'From'
        TabOrder = 3
      end
      object Label5: TUniLabel
        Left = 206
        Top = 26
        Width = 12
        Height = 13
        Hint = ''
        Caption = 'To'
        TabOrder = 4
      end
      object dateFrom: TUniDBDateTimePicker
        Left = 35
        Top = 22
        Width = 158
        Height = 21
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        DateTime = 42663.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 0
      end
      object dateTo: TUniDBDateTimePicker
        Left = 225
        Top = 22
        Width = 158
        Height = 21
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        DateTime = 42663.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 1
      end
    end
    object GroupBox2: TUniGroupBox
      Left = 7
      Top = 74
      Width = 391
      Height = 343
      Hint = ''
      Caption = '  Apply To  '
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      object Panel4: TUniPanel
        Left = 2
        Top = 15
        Width = 387
        Height = 70
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object chkAllCenters: TUniCheckBox
          Left = 7
          Top = 24
          Width = 121
          Height = 17
          Hint = ''
          Checked = True
          Caption = 'All Work Centers'
          TabOrder = 0
          OnClick = chkAllCentersClick
        end
        object chkDefault: TUniCheckBox
          Left = 7
          Top = 4
          Width = 121
          Height = 17
          Hint = ''
          Checked = True
          Caption = 'Default Calendar'
          TabOrder = 1
        end
      end
      object Panel5: TUniPanel
        Left = 2
        Top = 70
        Width = 387
        Height = 273
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = 'Panel5'
        ExplicitTop = 41
        ExplicitHeight = 214
        object IQSearch1: TIQUniGridControl
          Left = 1
          Top = 1
          Width = 385
          Height = 271
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 168
          IQComponents.Grid.Height = 185
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
          IQComponents.HiddenPanel.Left = 168
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 185
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.HiddenPanel.ExplicitHeight = 126
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          IQComponents.FormTab.ExplicitHeight = 155
          DataSource = DataSource1
          Columns = <
            item
              FieldName = 'EQNO'
              Title.Caption = 'Work Center #'
              Width = 84
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CNTR_DESC'
              Title.Caption = 'Description'
              Width = 203
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CNTR_TYPE'
              Title.Caption = 'Type'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EPLANT_ID'
              Title.Caption = 'EPlant ID'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PK_HIDE'
              Title.Caption = 'Inactive'
              Width = 49
              CheckBoxField.FieldValues = 'true;false'
            end>
          ExplicitLeft = -1
          ExplicitTop = 49
          ExplicitHeight = 249
          Marker = 0
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = QryCenters
    Left = 246
    Top = 19
  end
  object QryCenters: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       eqno,'
      '       cntr_desc,'
      '       cntr_type,'
      '       eplant_id,'
      '       nvl(pk_hide, '#39'N'#39') as pk_hide'
      '  from work_center'
      ' order by eqno')
    Left = 246
    Top = 50
    object QryCentersEQNO: TStringField
      DisplayLabel = 'Work Center #'
      DisplayWidth = 12
      FieldName = 'EQNO'
      Origin = 'eqno'
      Size = 60
    end
    object QryCentersCNTR_DESC: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 29
      FieldName = 'CNTR_DESC'
      Origin = 'CNTR_DESC'
      Size = 250
    end
    object QryCentersCNTR_TYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 10
      FieldName = 'CNTR_TYPE'
      Origin = 'CNTR_TYPE'
    end
    object QryCentersEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Size = 0
    end
    object QryCentersPK_HIDE: TStringField
      DisplayLabel = 'Inactive'
      DisplayWidth = 7
      FieldName = 'PK_HIDE'
      Origin = 'PK_HIDE'
      FixedChar = True
      Size = 1
    end
    object QryCentersID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object procSaveToWorkCenter: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    PackageName = 'SHOP'
    StoredProcName = 'SAVE_TO_WORKCENTER_CALENDAR'
    Left = 278
    Top = 19
    ParamData = <
      item
        Position = 1
        Name = 'V_WORK_CNTR_ID'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'V_START_TIME'
        DataType = ftDateTime
        FDDataType = dtDateTime
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'V_END_TIME'
        DataType = ftDateTime
        FDDataType = dtDateTime
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'V_DAY_OFF_TYPE'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInput
      end>
  end
  object procSaveToDefault: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    PackageName = 'SHOP'
    StoredProcName = 'SAVE_TO_DEFAULT_CALENDAR'
    Left = 310
    Top = 19
    ParamData = <
      item
        Position = 1
        Name = 'V_GENERIC'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'V_START_TIME'
        DataType = ftDateTime
        FDDataType = dtDateTime
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'V_END_TIME'
        DataType = ftDateTime
        FDDataType = dtDateTime
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'V_DAY_OFF_TYPE'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'V_MFGCELL_ID'
        DataType = ftFMTBcd
        FDDataType = dtFmtBCD
        Precision = 38
        NumericScale = 38
        ParamType = ptInput
      end>
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnOK'
      'chkDefault'
      'chkAllCenters'
      'comboCenter')
    SecurityCode = 'SHOP_HOLIDAY'
    Left = 338
    Top = 19
  end
end
