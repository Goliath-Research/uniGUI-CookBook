object FrmJSFilter: TFrmJSFilter
  Left = 72
  Top = 155
  ClientHeight = 212
  ClientWidth = 334
  Caption = 'Filter'
  OnShow = UniFormShow
  Constraints.MinHeight = 250
  Constraints.MinWidth = 350
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TUniPanel
    Left = 0
    Top = 173
    Width = 334
    Height = 39
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel1: TUniPanel
      Left = 67
      Top = 1
      Width = 266
      Height = 37
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnCancel: TUniBitBtn
        Left = 185
        Top = 7
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 0
      end
      object btnOK: TUniBitBtn
        Left = 95
        Top = 7
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 1
      end
      object btnReset: TUniBitBtn
        Left = 5
        Top = 7
        Width = 75
        Height = 25
        Hint = 'Remove filter'
        ShowHint = True
        ParentShowHint = False
        Caption = 'Reset'
        TabOrder = 2
        OnClick = btnResetClick
      end
    end
  end
  object gbFilter: TUniGroupBox
    Left = 0
    Top = 0
    Width = 334
    Height = 173
    Hint = ''
    Caption = ' Select Filter Criteria '
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    DesignSize = (
      334
      173)
    object lblWorkOrderNo: TUniLabel
      Left = 8
      Top = 20
      Width = 42
      Height = 13
      Hint = ''
      Caption = 'Project#'
      TabOrder = 6
    end
    object lblToolingTaskNo: TUniLabel
      Left = 8
      Top = 44
      Width = 22
      Height = 13
      Hint = ''
      Caption = 'Task'
      TabOrder = 7
    end
    object lblEmployeeNo: TUniLabel
      Left = 8
      Top = 68
      Width = 57
      Height = 13
      Hint = ''
      Caption = 'Employee #'
      TabOrder = 8
    end
    object Label1: TUniLabel
      Left = 8
      Top = 92
      Width = 38
      Height = 13
      Hint = ''
      Caption = 'Detail #'
      TabOrder = 9
    end
    object Label2: TUniLabel
      Left = 8
      Top = 116
      Width = 28
      Height = 13
      Hint = ''
      Caption = 'Hours'
      TabOrder = 10
    end
    object Label3: TUniLabel
      Left = 8
      Top = 140
      Width = 61
      Height = 13
      Hint = ''
      Caption = 'Charge Rate'
      TabOrder = 11
    end
    object sbtnTask: TUniSpeedButton
      Left = 307
      Top = 40
      Width = 22
      Height = 22
      Hint = 'Search Tasks for the selected Work Order'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
        90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
        40905030773818FF00FF8B8B8B7777775F5F5F5A5A5A5A5A5A4A4A4AFF00FFFF
        00FFFF00FF8484847474746F6F6F5A5A5A5151513B3B3BFF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0E0C8C0D0A8
        90B07850804820FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7C9C9C9A7A7A7777777484848FF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC09880FFFFFF
        F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF979797FFFFFFE7E7E7C9C9C99E9E9E424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC3A494B08870
        A068509050308048308048208038108F4C26B08870A068509058309048308040
        20703810905830FF00FFA4A4A48787876969695151514A4A4A4848483B3B3B4E
        4E4E8787876969695757574C4C4C424242393939575757FF00FFDEC4B4B08870
        FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
        50803820CFA98AFF00FFC3C3C3878787FFFFFFCECECEA1A1A16F6F6F414141B5
        B5B58D8D8DD7D7D7D9D9D9A1A1A17777773D3D3DA7A7A7FF00FFFF00FFC09080
        F0F0F0FFF8F0F0D8C0B08060804820965732B09070FFFFFFFFF8F0F0D0C0B078
        50804820FF00FFFF00FFFF00FFFF00FFF0F0F0F7F7F7D5D5D57F7F7F48484857
        57578D8D8DFFFFFFF7F7F7D0D0D0777777484848FF00FFFF00FFFF00FFF8E2D2
        C09880B08060A068509050309058409D6842B07860B08870A070508048308048
        20ECC4A7FF00FFFF00FFFF00FFE1E1E19797977F7F7F6969695151515A5A5A67
        67677979798787876F6F6F4A4A4A484848C2C2C2FF00FFFF00FFFF00FFFF00FF
        C09880FFF8FFE0C0B0C09070804820FF00FFC09880FFF8FFE0C8B0D0A0808048
        20FF00FFFF00FFFF00FFFF00FFFF00FF979797FAFAFAC0C0C08E8E8E484848FF
        00FF979797FAFAFAC5C5C59E9E9E484848FF00FFFF00FFFF00FFFF00FFFF00FF
        CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
        37FF00FFFF00FFFF00FFFF00FFFF00FFB0B0B08F8F8F696969515151525252FF
        00FFA5A5A58F8F8F696969515151505050FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFB1836DFFF8F0814527FF00FFFF00FFFF00FFB08068FFF8F0804324FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF838383F7F7F7464646FF00FFFF
        00FFFF00FF808080F7F7F7444444FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A78C8C8C676767FF00FFFF
        00FFFF00FFADADAD8B8B8B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      Anchors = [akTop, akRight]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnTaskClick
    end
    object cmbJobShopRfq: TUniDBLookupComboBox
      Left = 120
      Top = 16
      Width = 212
      Height = 21
      Hint = ''
      ListField = 'PROJECTNO'
      ListSource = ds_JobShopRfq
      KeyField = 'ID'
      ListFieldIndex = 0
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Color = clWindow
    end
    object cmbEmployee: TUniDBLookupComboBox
      Left = 120
      Top = 64
      Width = 212
      Height = 21
      Hint = ''
      ListField = 'NAME'
      ListSource = ds_Employee
      KeyField = 'EMPNO'
      ListFieldIndex = 0
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Color = clWindow
      OnChange = cmbEmployeeChange
    end
    object edtDetailNo: TUniEdit
      Left = 120
      Top = 88
      Width = 121
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 2
    end
    object edtChargeRate: TUniEdit
      Left = 120
      Top = 136
      Width = 56
      Height = 21
      Hint = ''
      Text = '0'
      TabOrder = 3
      OnChange = edtChargeRateChange
    end
    object edTask: TUniEdit
      Left = 120
      Top = 42
      Width = 183
      Height = 19
      Hint = ''
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      Color = clBtnFace
      ReadOnly = True
    end
    object edtHours: TUniSpinEdit
      Left = 120
      Top = 111
      Width = 56
      Height = 22
      Hint = ''
      MaxValue = 100
      TabOrder = 13
    end
  end
  object QryEmployee: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    SQL.Strings = (
      'select'
      '     id,'
      '     empno,'
      '     first_name,'
      '     last_name,'
      
        '     LTrim( RTrim( LTrim( first_name )) || '#39' '#39' || RTrim( LTrim( ' +
        'last_name ))) as name,'
      '     charge_rate'
      'from'
      '     pr_emp'
      ''
      'union'
      ''
      'select '
      '     0,'
      '     '#39'"Not Filtered"'#39','
      '     '#39#39','
      '     '#39#39','
      '     '#39#39','
      '     0'
      'from'
      '     dual'
      ''
      'order by'
      '    empno'
      ' '
      ' '
      ' ')
    Left = 252
    Top = 61
    object QryEmployeeEMPNO: TStringField
      DisplayLabel = 'Employee #'
      DisplayWidth = 10
      FieldName = 'EMPNO'
      Size = 25
    end
    object QryEmployeeNAME: TStringField
      DisplayLabel = 'Employee Name'
      DisplayWidth = 20
      FieldName = 'NAME'
      Size = 61
    end
    object QryEmployeeID: TFMTBCDField
      FieldName = 'ID'
      Visible = False
      Size = 38
    end
    object QryEmployeeFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 15
      FieldName = 'FIRST_NAME'
      Visible = False
      Size = 30
    end
    object QryEmployeeLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 15
      FieldName = 'LAST_NAME'
      Visible = False
      Size = 30
    end
    object QryEmployeeCHARGE_RATE: TFMTBCDField
      FieldName = 'CHARGE_RATE'
      currency = True
      Size = 38
    end
  end
  object QtyJobShopRfq: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    SQL.Strings = (
      'select id,'
      '       projectno,'
      '       descrip'
      '  from JOBSHOP_RFQ'
      'union'
      'select 0, '#39'"Not Filtered"'#39', '#39#39' from JOBSHOP_RFQ'
      'order by projectno'
      '')
    Left = 248
    Top = 65533
    object QtyJobShopRfqPROJECTNO: TStringField
      DisplayLabel = 'Project#'
      DisplayWidth = 25
      FieldName = 'PROJECTNO'
      Origin = 'IQ.JOBSHOP_RFQ.PROJECTNO'
      Size = 25
    end
    object QtyJobShopRfqDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Origin = 'IQ.JOBSHOP_RFQ.DESCRIP'
      Size = 255
    end
    object QtyJobShopRfqID: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.JOBSHOP_RFQ.ID'
      Visible = False
      Size = 38
    end
  end
  object PkJobShopTask: TIQWebHpick
    BeforeOpen = PkJobShopTaskBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select t.id as id,'
      '       q.projectno as projectno,'
      '       q.descrip as project_descrip,'
      '       c.custno as custno,'
      '       c.company as company,'
      '       a.itemno as itemno,'
      '       a.descrip as descrip,'
      '       a.rev as rev,'
      '       s.mfgno as mfgno,'
      '       s.cntr_type as cntr_type,'
      '       s.mfg_type as mfg_type,'
      '       q.arinvt_id as main_arinvt_id,'
      '       q.standard_id as main_standard_id,'
      '       t.arinvt_id as task_arinvt_id,'
      '       t.standard_id as task_standard_id'
      '  from jobshop_rfq q,'
      '       jobshop_task t,'
      '       arinvt a,'
      '       arcusto c,'
      '       standard s'
      ' where q.id = t.jobshop_rfq_id'
      '   and t.arinvt_id = a.id(+)'
      '   and t.standard_id = s.id(+)'
      '   and q.arcusto_id = c.id(+)'
      '   and q.id = :ID'
      '   '
      ' '
      ' '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 256
    Top = 125
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkJobShopTaskID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkJobShopTaskPROJECTNO: TStringField
      DisplayLabel = 'Project #'
      DisplayWidth = 10
      FieldName = 'PROJECTNO'
      Size = 25
    end
    object PkJobShopTaskPROJECT_DESCRIP: TStringField
      DisplayLabel = 'Project Description'
      DisplayWidth = 35
      FieldName = 'PROJECT_DESCRIP'
      Size = 255
    end
    object PkJobShopTaskCUSTNO: TStringField
      DisplayLabel = 'Cust #'
      FieldName = 'CUSTNO'
      FixedChar = True
      Size = 10
    end
    object PkJobShopTaskCOMPANY: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      FixedChar = True
      Size = 60
    end
    object PkJobShopTaskITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 15
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object PkJobShopTaskDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkJobShopTaskREV: TStringField
      DisplayLabel = 'Item Rev'
      DisplayWidth = 10
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
    object PkJobShopTaskMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 15
      FieldName = 'MFGNO'
      Size = 50
    end
    object PkJobShopTaskCNTR_TYPE: TStringField
      DisplayLabel = 'Center Type'
      DisplayWidth = 15
      FieldName = 'CNTR_TYPE'
      FixedChar = True
    end
    object PkJobShopTaskMFG_TYPE: TStringField
      DisplayLabel = 'Mfg Type'
      FieldName = 'MFG_TYPE'
      FixedChar = True
      Size = 10
    end
    object PkJobShopTaskMAIN_ARINVT_ID: TBCDField
      FieldName = 'MAIN_ARINVT_ID'
      Size = 0
    end
    object PkJobShopTaskMAIN_STANDARD_ID: TBCDField
      FieldName = 'MAIN_STANDARD_ID'
      Size = 0
    end
    object PkJobShopTaskTASK_ARINVT_ID: TBCDField
      FieldName = 'TASK_ARINVT_ID'
      Size = 0
    end
    object PkJobShopTaskTASK_STANDARD_ID: TBCDField
      FieldName = 'TASK_STANDARD_ID'
      Size = 0
    end
  end
  object ds_JobShopRfq: TDataSource
    DataSet = QtyJobShopRfq
    Left = 160
  end
  object ds_Employee: TDataSource
    DataSet = QryEmployee
    Left = 160
    Top = 64
  end
end
