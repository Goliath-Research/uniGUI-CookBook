object FrmEmpHours: TFrmEmpHours
  Left = 134
  Top = 291
  ClientHeight = 305
  ClientWidth = 479
  Caption = 'FrmEmpHours'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  ActiveControl = gridEmp
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 275
    Width = 479
    Height = 30
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitTop = 121
    ExplicitWidth = 326
    object Panel2: TUniPanel
      Left = 293
      Top = 1
      Width = 185
      Height = 28
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitLeft = 140
      object btnClose: TUniButton
        Left = 109
        Top = 4
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&Close'
        TabOrder = 1
        OnClick = btnCloseClick
      end
    end
  end
  object gridEmp: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 479
    Height = 275
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 262
    IQComponents.Grid.Height = 189
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = srcRtEmpHrs
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
    IQComponents.Navigator.DataSource = srcRtEmpHrs
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 262
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 189
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitLeft = 109
    IQComponents.HiddenPanel.ExplicitHeight = 8
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitWidth = 318
    IQComponents.FormTab.ExplicitHeight = 37
    DataSource = srcRtEmpHrs
    Columns = <
      item
        FieldName = 'EmpNo'
        Title.Caption = 'Emp#'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PROD_HRS'
        Title.Caption = 'Prod.Hours'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'First'
        Title.Caption = 'First Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Last'
        Title.Caption = 'Last Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitLeft = 8
    ExplicitTop = 29
    Marker = 0
  end
  object wwDBLookupCombo1: TUniDBLookupComboBox
    Left = 8
    Top = 64
    Width = 65
    Height = 21
    Hint = ''
    ListField = 'ID'
    ListSource = SrcTblPR_EMP
    KeyField = 'EMPNO'
    ListFieldIndex = 0
    TabOrder = 2
    Color = clWindow
    OnDropDown = wwDBLookupCombo1DropDown
  end
  object srcRtEmpHrs: TDataSource
    DataSet = tblRtEmpHrs
    Left = 136
    Top = 160
  end
  object tblRtEmpHrs: TwwTable
    BeforePost = tblRtEmpHrsBeforePost
    DatabaseName = 'IQ'
    TableName = 'RT_EMP_HOURS'
    ControlType.Strings = (
      'EmpNo;CustomEdit;wwDBLookupCombo1')
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 88
    Top = 200
    object tblRtEmpHrsEmpNo: TStringField
      DisplayLabel = 'Emp#'
      DisplayWidth = 12
      FieldKind = fkLookup
      FieldName = 'EmpNo'
      LookupDataSet = tblPrEmp
      LookupKeyFields = 'ID'
      LookupResultField = 'EMPNO'
      KeyFields = 'PR_EMP_ID'
      Size = 25
      Lookup = True
    end
    object tblRtEmpHrsPROD_HRS: TFloatField
      DisplayLabel = 'Prod.Hours'
      DisplayWidth = 10
      FieldName = 'PROD_HRS'
      Required = True
    end
    object tblRtEmpHrsFirst: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 9
      FieldKind = fkLookup
      FieldName = 'First'
      LookupDataSet = tblPrEmp
      LookupKeyFields = 'ID'
      LookupResultField = 'FIRST_NAME'
      KeyFields = 'PR_EMP_ID'
      Lookup = True
    end
    object tblRtEmpHrsLast: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 16
      FieldKind = fkLookup
      FieldName = 'Last'
      LookupDataSet = tblPrEmp
      LookupKeyFields = 'ID'
      LookupResultField = 'LAST_NAME'
      KeyFields = 'PR_EMP_ID'
      Lookup = True
    end
    object tblRtEmpHrsMiddle: TStringField
      DisplayLabel = 'Middle Name'
      DisplayWidth = 12
      FieldKind = fkLookup
      FieldName = 'Middle'
      LookupDataSet = tblPrEmp
      LookupKeyFields = 'ID'
      LookupResultField = 'MIDDLE_NAME'
      KeyFields = 'PR_EMP_ID'
      Visible = False
      Lookup = True
    end
    object tblRtEmpHrsPR_EMP_ID: TFloatField
      DisplayLabel = 'Emp#'
      DisplayWidth = 11
      FieldName = 'PR_EMP_ID'
      Required = True
      Visible = False
    end
  end
  object tblPrEmp: TwwTable
    DatabaseName = 'IQ'
    IndexName = 'PK_PR_EMP'
    TableName = 'PR_EMP'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 32
    Top = 144
    object tblPrEmpEMPNO: TStringField
      DisplayLabel = 'Emp#'
      DisplayWidth = 10
      FieldName = 'EMPNO'
      Size = 25
    end
    object tblPrEmpFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 15
      FieldName = 'FIRST_NAME'
      Size = 30
    end
    object tblPrEmpMIDDLE_NAME: TStringField
      DisplayLabel = 'Midd. Name'
      DisplayWidth = 10
      FieldName = 'MIDDLE_NAME'
      Size = 30
    end
    object tblPrEmpLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 15
      FieldName = 'LAST_NAME'
      Size = 30
    end
    object tblPrEmpID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
  end
  object SrcTblPR_EMP: TDataSource
    DataSet = tblPrEmp
    Left = 232
    Top = 160
  end
end
