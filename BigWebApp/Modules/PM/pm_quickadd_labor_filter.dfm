object FrmPMQuickAddLaborFilter: TFrmPMQuickAddLaborFilter
  Left = 457
  Top = 145
  ClientHeight = 244
  ClientWidth = 311
  Caption = 'Filter'
  OnShow = UniFormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 311
    Height = 211
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object gbFilter: TUniGroupBox
      Tag = 1999
      Left = 1
      Top = 1
      Width = 309
      Height = 209
      Hint = ''
      Caption = ' Select Filter Criteria '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object Panel3: TUniPanel
        Tag = 1999
        Left = 2
        Top = 15
        Width = 305
        Height = 192
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        ExplicitWidth = 301
        ExplicitHeight = 188
        object PnlClient01: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 303
          Height = 159
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter1: TUniSplitter
            Left = 116
            Top = 0
            Width = 6
            Height = 159
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlLeft01: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 116
            Height = 157
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object lblWorkOrderNo: TUniLabel
              Left = 8
              Top = 4
              Width = 67
              Height = 13
              Hint = ''
              Caption = 'Work Order #'
              TabOrder = 1
            end
            object lblToolingTaskNo: TUniLabel
              Left = 8
              Top = 28
              Width = 33
              Height = 13
              Hint = ''
              Caption = 'Task #'
              TabOrder = 2
            end
            object lblEmployeeNo: TUniLabel
              Left = 8
              Top = 52
              Width = 57
              Height = 13
              Hint = ''
              Caption = 'Employee #'
              TabOrder = 3
            end
            object lblDetail: TUniLabel
              Left = 8
              Top = 76
              Width = 38
              Height = 13
              Hint = ''
              Caption = 'Detail #'
              TabOrder = 4
            end
            object lblHours: TUniLabel
              Left = 8
              Top = 100
              Width = 28
              Height = 13
              Hint = ''
              Caption = 'Hours'
              TabOrder = 5
            end
            object lblChargeRate: TUniLabel
              Left = 8
              Top = 124
              Width = 61
              Height = 13
              Hint = ''
              Caption = 'Charge Rate'
              TabOrder = 6
            end
          end
          object PnlClient02: TUniPanel
            Tag = 1999
            Left = 122
            Top = 1
            Width = 181
            Height = 157
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            ExplicitLeft = 119
            ExplicitWidth = 182
            ExplicitHeight = 153
            DesignSize = (
              181
              157)
            object cmbWorkOrder: TUniDBLookupComboBox
              Left = 1
              Top = 1
              Width = 174
              Height = 21
              Hint = ''
              ListField = 'ID'
              ListSource = SrcWorkOrder
              KeyField = 'WORKORDERNO'
              ListFieldIndex = 0
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              Color = clWindow
            end
            object cmbTask: TUniDBLookupComboBox
              Left = 1
              Top = 24
              Width = 174
              Height = 21
              Hint = ''
              ListField = 'PMWO_DTL_ID'
              ListSource = SrcTask
              KeyField = 'TASKNO'
              ListFieldIndex = 0
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              Color = clWindow
            end
            object cmbEmployee: TUniDBLookupComboBox
              Left = 1
              Top = 48
              Width = 174
              Height = 21
              Hint = ''
              ListField = 'ID'
              ListSource = SrcEmployee
              KeyField = 'EMPNO'
              ListFieldIndex = 0
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              Color = clWindow
              OnChange = cmbEmployeeChange
            end
            object edtDetailNo: TUniEdit
              Left = 1
              Top = 72
              Width = 174
              Height = 21
              Hint = ''
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
            end
            object edtHours: TUniEdit
              Left = 1
              Top = 96
              Width = 57
              Height = 21
              Hint = ''
              Text = '0'
              TabOrder = 4
              OnChange = edtHoursChange
            end
            object edtChargeRate: TUniEdit
              Left = 1
              Top = 120
              Width = 56
              Height = 21
              Hint = ''
              Text = '0'
              TabOrder = 5
              OnChange = edtChargeRateChange
            end
          end
        end
        object PnlResetButton: TUniPanel
          Tag = 1999
          Left = 1
          Top = 159
          Width = 303
          Height = 33
          Hint = ''
          Align = alBottom
          Anchors = [akLeft, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object Panel5: TUniPanel
            Left = 199
            Top = 1
            Width = 104
            Height = 31
            Hint = ''
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object btnReset: TUniBitBtn
              Left = 1
              Top = 2
              Width = 97
              Height = 25
              Hint = 'Remove filter'
              ShowHint = True
              ParentShowHint = False
              Caption = 'Reset'
              TabOrder = 0
              OnClick = btnResetClick
            end
          end
        end
      end
    end
  end
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 211
    Width = 311
    Height = 33
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 106
      Top = 1
      Width = 205
      Height = 31
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniBitBtn
        Left = 1
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
      end
      object btnCancel: TUniBitBtn
        Left = 102
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object SrcWorkOrder: TDataSource
    DataSet = QryWorkOrder
    Left = 27
    Top = 19
  end
  object SrcEmployee: TDataSource
    DataSet = QryEmployee
    Left = 195
    Top = 19
  end
  object SrcTask: TDataSource
    DataSet = QryTask
    Left = 80
    Top = 28
  end
  object QryWorkOrder: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT id, TO_CHAR(id) AS workorderno, wo_date, class'
      '  FROM pmwo'
      'UNION'
      'SELECT 0, '#39'<Not Filtered>'#39', NULL, NULL FROM DUAL'
      'ORDER BY id')
    Left = 24
    Top = 75
    object QryWorkOrderWORKORDERNO: TStringField
      DisplayLabel = 'Work Order #'
      DisplayWidth = 40
      FieldName = 'WORKORDERNO'
      Size = 40
    end
    object QryWorkOrderWO_DATE: TDateTimeField
      DisplayLabel = 'Date'
      DisplayWidth = 18
      FieldName = 'WO_DATE'
    end
    object QryWorkOrderCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 12
      FieldName = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object QryWorkOrderID: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ID'
      ProviderFlags = []
      Precision = 38
      Size = 38
    end
  end
  object QryEmployee: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT id, empno,'
      
        '       SUBSTRB(misc.format_name(first_name, nickname, middle_nam' +
        'e, last_name),'
      '       1, 255) AS name, charge_rate'
      '  FROM pr_emp'
      'UNION'
      'SELECT 0, '#39'<Not Filtered>'#39', NULL, NULL FROM DUAL'
      'ORDER BY id')
    Left = 200
    Top = 27
    object QryEmployeeEMPNO: TStringField
      DisplayLabel = 'Employee #'
      DisplayWidth = 25
      FieldName = 'EMPNO'
      Size = 25
    end
    object QryEmployeeNAME: TStringField
      DisplayLabel = 'Employee Name'
      DisplayWidth = 92
      FieldName = 'NAME'
      Size = 255
    end
    object QryEmployeeID: TFMTBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 38
      Size = 38
    end
    object QryEmployeeCHARGE_RATE: TFMTBCDField
      FieldName = 'CHARGE_RATE'
      Origin = 'CHARGE_RATE'
      Precision = 38
      Size = 38
    end
  end
  object QryTask: TFDQuery
    BeforeOpen = QryTaskBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT pmwo_dtl_id, taskno, descrip'
      '  FROM v_pmjob'
      ' WHERE pmwo_id = :ID'
      'UNION'
      'SELECT 0, '#39'<Not Filtered>'#39', NULL FROM DUAL'
      'ORDER BY 1')
    Left = 73
    Top = 77
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryTaskTASKNO: TStringField
      DisplayLabel = 'Task #'
      DisplayWidth = 25
      FieldName = 'TASKNO'
      Size = 50
    end
    object QryTaskDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Size = 250
    end
    object QryTaskPMWO_DTL_ID: TFMTBCDField
      Tag = 1
      FieldName = 'PMWO_DTL_ID'
      Origin = 'PMWO_DTL_ID'
      Precision = 38
      Size = 38
    end
  end
end
