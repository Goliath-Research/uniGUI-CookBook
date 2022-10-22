object BudgetSelectCriteria: TBudgetSelectCriteria
  Left = 344
  Top = 130
  ClientHeight = 399
  ClientWidth = 474
  Caption = 'Budget Selection Criteria '
  Position = poDefault
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 358
    Width = 474
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 138
      Top = 1
      Width = 336
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 128
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 1
      end
      object btnCancel: TUniButton
        Left = 232
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
      object btnClear: TUniButton
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Clear'
        TabOrder = 3
        OnClick = btnClearClick
      end
    end
  end
  object PnlClient01: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 474
    Height = 358
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 112
      Top = 0
      Width = 6
      Height = 358
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 112
      Height = 356
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label6: TUniLabel
        Left = 8
        Top = 20
        Width = 75
        Height = 13
        Hint = ''
        Caption = 'For the GL Year'
        TabOrder = 1
      end
      object Label9: TUniLabel
        Left = 8
        Top = 44
        Width = 66
        Height = 13
        Hint = ''
        Caption = 'Account Type'
        TabOrder = 2
      end
      object Label10: TUniLabel
        Left = 8
        Top = 92
        Width = 57
        Height = 13
        Hint = ''
        Caption = 'Department'
        TabOrder = 3
      end
      object Label11: TUniLabel
        Left = 8
        Top = 116
        Width = 36
        Height = 13
        Hint = ''
        Caption = 'Division'
        TabOrder = 4
      end
      object Label1: TUniLabel
        Left = 8
        Top = 68
        Width = 39
        Height = 13
        Hint = ''
        Caption = 'Account'
        TabOrder = 5
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 118
      Top = 1
      Width = 356
      Height = 356
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Panel1: TUniPanel
        Left = 1
        Top = 1
        Width = 354
        Height = 139
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        ExplicitWidth = 357
        DesignSize = (
          354
          139)
        object lcbDiv: TUniDBLookupComboBox
          Left = 3
          Top = 112
          Width = 346
          Height = 21
          Hint = ''
          ListField = 'DIVISION'
          ListSource = SrcDiv
          KeyField = 'DIVISION'
          ListFieldIndex = 0
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Color = clWindow
          OnKeyDown = lcboxSubAcctKeyDown
        end
        object lcboxDep: TUniDBLookupComboBox
          Left = 3
          Top = 88
          Width = 346
          Height = 21
          Hint = ''
          ListField = 'DEPARTMENT'
          ListSource = SrcDep
          KeyField = 'DEPARTMENT'
          ListFieldIndex = 0
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Color = clWindow
          OnKeyDown = lcboxSubAcctKeyDown
        end
        object lcboxAccount: TUniDBLookupComboBox
          Left = 3
          Top = 64
          Width = 346
          Height = 21
          Hint = ''
          ListField = 'ACCOUNT'
          ListSource = SrcAccount
          KeyField = 'ACCOUNT'
          ListFieldIndex = 0
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Color = clWindow
          OnKeyDown = lcboxSubAcctKeyDown
        end
        object lcboxSubAcct: TUniDBLookupComboBox
          Left = 3
          Top = 40
          Width = 346
          Height = 21
          Hint = ''
          ListField = 'DESCRIP'
          ListSource = SrcAcctType
          KeyField = 'ID'
          ListFieldIndex = 0
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          Color = clWindow
          OnKeyDown = lcboxSubAcctKeyDown
        end
        object lcboxGLYear: TUniDBLookupComboBox
          Left = 3
          Top = 13
          Width = 346
          Height = 21
          Hint = ''
          ListField = 'DESCRIP'
          ListSource = SrcGlYear
          KeyField = 'ID'
          ListFieldIndex = 0
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          Color = clWindow
        end
      end
      object Panel2: TUniPanel
        Left = 1
        Top = 139
        Width = 354
        Height = 217
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        ExplicitWidth = 357
        ExplicitHeight = 219
        object GroupBox1: TUniGroupBox
          Left = 1
          Top = 1
          Width = 352
          Height = 215
          Hint = ''
          Caption = '  Additional Values  '
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          object Panel10: TUniPanel
            Left = 2
            Top = 15
            Width = 348
            Height = 198
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object Panel13: TUniPanel
              Left = 1
              Top = 1
              Width = 346
              Height = 25
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              Caption = ''
              object SbClearFilter: TUniSpeedButton
                Left = 4
                Top = 3
                Width = 23
                Height = 22
                Hint = 'Clear Filter'
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFACA8DA1020E0CABACFFF00FFFF00FFFF00FFFF00
                  FFA490BDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0028FF10
                  28F04050D0FF00FFFF00FFFF00FF3B49D30010B0FF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF2C50FB1030FF0028FFFF00FFFF00FF7976D80018
                  C06867CFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF70707040404010102030
                  50FF2040FF8B8BDEADA1CE0028F04058F0FF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF707070505050100810DBCAD44A67FB3050FF2040FF3050FFE3C0
                  B1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070707070404040FF
                  00FFCEC0D24068FF4060FFC2B0C5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FF707070909890504850BBB6D25078FF5078FF647BF64A6EFADABB
                  B6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3C7B8909090D0C8C05068A050
                  78FF5078FFB8B3D6FF00FF6382F55975FAC7ACBCFF00FFFF00FFFF00FFFF00FF
                  DACBBD808880F0F0F08098F05078FF5078FFB9B0BCFF00FFFF00FFFF00FFAAA5
                  D0778AE9FF00FFFF00FFFF00FFE5D3C7707070F0E8F0FFF8FF8098FF6080FF70
                  7890404840D7BDA9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDFCEC6707070
                  C0C8C0FFFFFFF0F8F0F0F0F0D0D8D0B0A8B0606060404840CBB19DFF00FFFF00
                  FFFF00FFFF00FFFF00FFC0B8C0C0C0C0D0C8D0C0C0C0B0B8B0B0B0B0B0B0B0A0
                  A0A0808080606060404840FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = SbClearFilterClick
              end
              object DBNavigator1: TUniDBNavigator
                Left = 246
                Top = 1
                Width = 100
                Height = 23
                Hint = ''
                DataSource = SrcFilter
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
                Align = alRight
                Anchors = [akTop, akRight, akBottom]
                TabOrder = 0
              end
            end
            object GridFilter: TIQUniGridControl
              Left = 1
              Top = 25
              Width = 346
              Height = 173
              Layout = 'border'
              ParentAlignmentControl = False
              AlignmentControl = uniAlignmentClient
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              IQComponents.Grid.Left = 0
              IQComponents.Grid.Top = 29
              IQComponents.Grid.Width = 129
              IQComponents.Grid.Height = 87
              IQComponents.Grid.Hint = ''
              IQComponents.Grid.DataSource = SrcFilter
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
              IQComponents.Navigator.DataSource = SrcFilter
              IQComponents.Navigator.LayoutConfig.Region = 'east'
              IQComponents.Navigator.TabOrder = 3
              IQComponents.HiddenPanel.Left = 129
              IQComponents.HiddenPanel.Top = 29
              IQComponents.HiddenPanel.Width = 209
              IQComponents.HiddenPanel.Height = 87
              IQComponents.HiddenPanel.Hint = ''
              IQComponents.HiddenPanel.Visible = True
              IQComponents.HiddenPanel.Align = alRight
              IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
              IQComponents.FormTab.Hint = ''
              IQComponents.FormTab.ImageIndex = 1
              IQComponents.FormTab.Caption = 'Form'
              IQComponents.FormTab.Layout = 'border'
              DataSource = SrcFilter
              Columns = <
                item
                  FieldName = 'COLUMN_NAME'
                  Title.Caption = 'Field'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'VALUE'
                  Title.Caption = 'Value'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end>
              Marker = 0
            end
            object wwValue: TUniEdit
              Left = 144
              Top = 64
              Width = 121
              Height = 21
              Hint = ''
              Text = ''
              TabOrder = 2
            end
          end
        end
      end
    end
  end
  object SrcGlYear: TDataSource
    DataSet = QryGLYear
    Left = 6
    Top = 247
  end
  object SrcAcctType: TDataSource
    DataSet = QryAcctType
    Left = 35
    Top = 247
  end
  object SrcDep: TDataSource
    DataSet = QryDep
    Left = 93
    Top = 247
  end
  object SrcDiv: TDataSource
    DataSet = QryDiv
    Left = 122
    Top = 247
  end
  object QryGLYear: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select ID,'
      '          Descrip'
      'from GLYear'
      'order by Descrip')
    Left = 6
    Top = 263
  end
  object QryAcctType: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select ID, '
      '          DESCRIP'
      'from GLSUB_ACCT_TYPE'
      'order by Descrip')
    Left = 35
    Top = 263
    object QryAcctTypeID: TBCDField
      FieldName = 'ID'
      Origin = 'GLSUB_ACCT_TYPE.ID'
      Size = 0
    end
    object QryAcctTypeDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'GLSUB_ACCT_TYPE.DESCRIP'
      Size = 35
    end
  end
  object QryDep: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select Distinct department'
      '   from v_glacct'
      ' order by department')
    Left = 93
    Top = 263
  end
  object QryDiv: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select Distinct Division'
      '   from v_glacct'
      ' order by Division'
      '')
    Left = 122
    Top = 263
  end
  object SrcAccount: TDataSource
    DataSet = QryAccount
    Left = 64
    Top = 247
  end
  object QryAccount: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select Distinct Account'
      '   from v_glacct'
      ' order by Account')
    Left = 64
    Top = 263
  end
  object SrcFilter: TDataSource
    DataSet = QryFilter
    Left = 184
    Top = 232
  end
  object QryFilter: TFDQuery
    Filtered = True
    CachedUpdates = True
    OnUpdateRecord = QryFilterUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select column_name, '#39'          '#39' as value   '
      ' from all_tab_columns where table_name = '#39'V_GLACCT'#39
      
        '  and InStr('#39'ID___EPLANT_ID___ACCT___DESCRIP___GL_SUBACCT_TYPE_I' +
        'D___MAJORTYPE__TYPE__ACCOUNT__DEPARTMENT__DIVISION'#39', column_name' +
        ') = 0 '
      'order by column_name'
      '       '
      ' '
      ' ')
    Left = 200
    Top = 248
    object QryFilterCOLUMN_NAME: TStringField
      FieldName = 'COLUMN_NAME'
      Size = 30
    end
    object QryFilterVALUE: TStringField
      FieldName = 'VALUE'
      FixedChar = True
      Size = 10
    end
  end
  object Pk: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select Distinct currency as value'
      '   from v_glacct'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 16
    Top = 320
    object PkVALUE: TStringField
      FieldName = 'VALUE'
      Size = 2
    end
  end
end
