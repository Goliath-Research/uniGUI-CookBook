object FrmAssignPayTypes: TFrmAssignPayTypes
  Left = 0
  Top = 0
  ClientHeight = 366
  ClientWidth = 830
  Caption = 'Assign Pay Types'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 830
    Height = 27
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Alignment = taLeftJustify
    Caption = ''
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object SBSearchPurch: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 23
        Height = 23
        Hint = 'Search'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
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
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentColor = False
        Color = clWindow
        OnClick = SBSearchPurchClick
      end
    end
    object Panel5: TUniPanel
      Left = 25
      Top = 1
      Width = 246
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = ''
      object lblPayGroup: TUniLabel
        Left = 5
        Top = 6
        Width = 50
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Pay Group'
        TabOrder = 2
      end
      object dbPayGroup: TUniDBLookupComboBox
        Left = 64
        Top = 2
        Width = 159
        Height = 21
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ListField = 'DESCRIPTION'
        ListSource = srcPayGroup
        KeyField = 'ID'
        ListFieldIndex = 0
        TabStop = False
        TabOrder = 0
        Color = clWindow
        OnCloseUp = dbPayGroupCloseUp
      end
    end
    object Panel2: TUniPanel
      Left = 271
      Top = 1
      Width = 559
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Caption = ''
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 293
    Width = 830
    Height = 73
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel6: TUniPanel
      Left = 685
      Top = 1
      Width = 145
      Height = 71
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnApply: TUniButton
        Left = 42
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&Apply'
        TabOrder = 1
        OnClick = btnApplyClick
      end
    end
    object PnlClient02: TUniPanel
      Left = 1
      Top = 1
      Width = 685
      Height = 71
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Splitter1: TUniSplitter
        Left = 193
        Top = 0
        Width = 6
        Height = 71
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object PnlLeft01: TUniPanel
        Left = 1
        Top = 1
        Width = 193
        Height = 69
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Label1: TUniLabel
          Left = 10
          Top = 8
          Width = 118
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Pay Type to be assigned'
          TabOrder = 1
        end
        object Label2: TUniLabel
          Left = 10
          Top = 32
          Width = 156
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Default Pay Type to be assigned'
          TabOrder = 2
        end
      end
      object PnlClient01: TUniPanel
        Left = 199
        Top = 1
        Width = 486
        Height = 69
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        ExplicitLeft = 196
        ExplicitWidth = 489
        ExplicitHeight = 73
        DesignSize = (
          486
          69)
        object dbPaytype2: TUniComboBox
          Left = 1
          Top = 5
          Width = 481
          Height = 21
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            'Holiday Pay Type'#9'PR_HOLIDAY_PAYTYPE_ID'
            'OT1 Pay Type'#9'OT1_PR_PAYTYPE_ID'
            'OT2 Pay Type'#9'OT2_PR_PAYTYPE_ID'
            'OT3 Pay Type'#9'OT3_PR_PAYTYPE_ID'
            'Regular Pay Type'#9'PR_PAYTYPE_ID')
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Sorted = True
        end
        object dbPaytype: TUniDBLookupComboBox
          Left = 1
          Top = 29
          Width = 481
          Height = 21
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ListField = 'DESCRIPTION'
          ListSource = dsPayType
          KeyField = 'ID'
          ListFieldIndex = 0
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Color = clWindow
        end
      end
    end
  end
  object gridEmp: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 830
    Height = 266
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 613
    IQComponents.Grid.Height = 180
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcEmp
    IQComponents.Grid.Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgMultiSelect]
    IQComponents.Grid.ReadOnly = True
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
    IQComponents.Navigator.DataSource = SrcEmp
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 613
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 180
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcEmp
    Columns = <
      item
        FieldName = 'EMPNO'
        Title.Caption = 'Employee #'
        Width = 98
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'NAME'
        Title.Caption = 'Name'
        Width = 116
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DEPARTMENT'
        Title.Caption = 'Department'
        Width = 115
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TA_SETTING'
        Title.Caption = 'TA setting'
        Width = 95
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SHIFT'
        Title.Caption = 'Shift'
        Width = 58
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PAYGROUP'
        Title.Caption = 'Pay Group'
        Width = 93
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PAYTYPE'
        Title.Caption = 'Pay Type'
        Width = 76
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'OT1_PAYTYPE'
        Title.Caption = 'OT1 Pay Type'
        Width = 89
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'OT2_PAYTYPE'
        Title.Caption = 'OT2 Pay Type'
        Width = 81
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'OT3_PAYTYPE'
        Title.Caption = 'OT3 Pay Type'
        Width = 80
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'HOL_PAYTYPE'
        Title.Caption = 'Holiday Pay Type'
        Width = 101
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = False
    Marker = 0
  end
  object MainMenu1: TUniMainMenu
    Left = 192
    Top = 72
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Orderby1: TUniMenuItem
      Caption = '&Order By'
      object SortbyEmp2: TUniMenuItem
        Caption = 'Sort by &Emp.#'
        GroupIndex = 1
        RadioItem = True
        OnClick = SortbyEmp2Click
      end
      object SortbyEmpFirstName1: TUniMenuItem
        Caption = 'Sort by Emp &First Name'
        GroupIndex = 1
        RadioItem = True
        OnClick = SortbyEmp2Click
      end
      object SortbyLastName2: TUniMenuItem
        Caption = 'Sort by &Last Name'
        GroupIndex = 1
        RadioItem = True
        OnClick = SortbyEmp2Click
      end
      object SortbyDepartment2: TUniMenuItem
        Caption = 'Sort by &Department'
        GroupIndex = 1
        RadioItem = True
        OnClick = SortbyEmp2Click
      end
      object SortbyTimeAttendancesetting1: TUniMenuItem
        Caption = 'Sort by &Time &Attendance setting'
        GroupIndex = 1
        RadioItem = True
        OnClick = SortbyEmp2Click
      end
      object SortbyShift2: TUniMenuItem
        Caption = 'Sort &by Shift'
        GroupIndex = 1
        RadioItem = True
        OnClick = SortbyEmp2Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object SrcEmp: TDataSource
    DataSet = QryEmp
    Left = 208
    Top = 187
  end
  object QryEmp: TFDQuery
    AfterOpen = QryEmpAfterOpen
    BeforeClose = QryEmpBeforeClose
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select e.id,'
      '       e.empno,'
      '       e.pr_paygroup_id,'
      '       e.pr_paytype_id,'
      '       e.first_name,'
      '       e.last_name,'
      '       e.middle_name,'
      '       e.ssnmbr,'
      '       e.addr1,'
      '       e.addr2,'
      '       e.state,'
      '       e.zip,'
      '       e.country,'
      '       e.phone_number,'
      '       e.basis,'
      '       e.pr_department_id,'
      '       e.ta_settings_id,'
      '       t.descrip as ta_setting,'
      '       s.descrip as shift,'
      '       p.description as paytype,'
      '       ot1.description as ot1_paytype,'
      '       ot2.description as ot2_paytype,'
      '       ot3.description as ot3_paytype,'
      '       hol.description as hol_paytype,'
      '       g.description as paygroup,   '
      '       NVL(d.description, '#39' '#39') as department,'
      
        '       RTrim(LTrim(RTrim(LTrim(RTrim(LTrim(Nvl(e.first_name, '#39' '#39 +
        '))) || '#39' '#39' ||'
      
        '                   RTrim(LTrim(NVL(e.middle_name, '#39' '#39'))))) || '#39' ' +
        #39' ||'
      
        '                   RTrim(LTrim(NVL(e.last_name, '#39' '#39'))))) as name' +
        ','
      
        '       decode(LTrim(RTrim(NVL(country, '#39'USA'#39'))), '#39'USA'#39', substr(s' +
        'snmbr, 1, 3) || '#39'-'#39' || substr(ssnmbr, 4, 2) || '#39'-'#39' ||'
      '       substr(ssnmbr, 6, 4),'
      
        '       decode(LTrim(RTrim(NVL(country, '#39'USA'#39'))), '#39'CANADA'#39', subst' +
        'r(ssnmbr, 1, 3) || '#39'-'#39' || substr(ssnmbr, 4, 3) || '#39'-'#39' ||'
      '       substr(ssnmbr, 7, 3), ssnmbr)) as SSN'
      '  from pr_emp e,'
      '       ta_settings t,'
      '       pr_department d,'
      '       ta_shift s,'
      '       pr_paytype p,'
      '       pr_paytype ot1,'
      '       pr_paytype ot2,'
      '       pr_paytype ot3,'
      '       pr_paytype hol,'
      '       pr_paygroup g     '
      ' where e.pr_department_id = d.id(+)'
      '   and e.ta_settings_id = t.id(+)'
      '   and e.ta_shift_id = s.id(+)'
      '   and e.pr_paytype_id = p.id(+)'
      '   and e.ot1_pr_paytype_id = ot1.id(+)'
      '   and e.ot2_pr_paytype_id = ot2.id(+)'
      '   and e.ot3_pr_paytype_id = ot3.id(+)'
      '   and e.pr_holiday_paytype_id = hol.id(+)'
      '   and e.pr_paygroup_id = g.id(+)'
      '   and NVL(e.PK_HIDE, '#39'N'#39') = '#39'N'#39
      '   and misc.eplant_filter_include_nulls(g.eplant_id) = 1'
      '   and (e.emp_status_id is null or e.emp_status_id in (select id'
      
        '                                                         from em' +
        'p_status'
      
        '                                                        where NV' +
        'L(INCL_IN_PREPOST_PAYROLL, '#39'Y'#39') = '#39'Y'#39'))'
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 208
    Top = 131
    object QryEmpEMPNO: TStringField
      DisplayLabel = 'Employee #'
      DisplayWidth = 25
      FieldName = 'EMPNO'
      Size = 25
    end
    object QryEmpNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 92
      FieldName = 'NAME'
      Size = 92
    end
    object QryEmpDEPARTMENT: TStringField
      DisplayLabel = 'Department'
      DisplayWidth = 20
      FieldName = 'DEPARTMENT'
      Size = 100
    end
    object QryEmpTA_SETTING: TStringField
      DisplayLabel = 'TA setting'
      DisplayWidth = 20
      FieldName = 'TA_SETTING'
      Size = 50
    end
    object QryEmpSHIFT: TStringField
      DisplayLabel = 'Shift'
      DisplayWidth = 20
      FieldName = 'SHIFT'
      Size = 100
    end
    object QryEmpPAYGROUP: TStringField
      DisplayLabel = 'Pay Group'
      DisplayWidth = 20
      FieldName = 'PAYGROUP'
      Size = 50
    end
    object QryEmpPAYTYPE: TStringField
      DisplayLabel = 'Pay Type'
      DisplayWidth = 20
      FieldName = 'PAYTYPE'
      Size = 50
    end
    object QryEmpOT1_PAYTYPE: TStringField
      DisplayLabel = 'OT1 Pay Type'
      DisplayWidth = 50
      FieldName = 'OT1_PAYTYPE'
      Size = 50
    end
    object QryEmpOT2_PAYTYPE: TStringField
      DisplayLabel = 'OT2 Pay Type'
      DisplayWidth = 50
      FieldName = 'OT2_PAYTYPE'
      Size = 50
    end
    object QryEmpOT3_PAYTYPE: TStringField
      DisplayLabel = 'OT3 Pay Type'
      DisplayWidth = 50
      FieldName = 'OT3_PAYTYPE'
      Size = 50
    end
    object QryEmpHOL_PAYTYPE: TStringField
      DisplayLabel = 'Holiday Pay Type'
      DisplayWidth = 50
      FieldName = 'HOL_PAYTYPE'
      Size = 50
    end
    object QryEmpSSNMBR: TStringField
      DisplayLabel = 'SSN'
      DisplayWidth = 11
      FieldName = 'SSNMBR'
      Visible = False
      Size = 11
    end
    object QryEmpFIRST_NAME: TStringField
      DisplayWidth = 30
      FieldName = 'FIRST_NAME'
      Visible = False
      Size = 30
    end
    object QryEmpLAST_NAME: TStringField
      DisplayWidth = 30
      FieldName = 'LAST_NAME'
      Visible = False
      Size = 30
    end
    object QryEmpMIDDLE_NAME: TStringField
      DisplayWidth = 30
      FieldName = 'MIDDLE_NAME'
      Visible = False
      Size = 30
    end
    object QryEmpADDR1: TStringField
      DisplayWidth = 30
      FieldName = 'ADDR1'
      Visible = False
      Size = 60
    end
    object QryEmpADDR2: TStringField
      DisplayWidth = 30
      FieldName = 'ADDR2'
      Visible = False
      Size = 60
    end
    object QryEmpSTATE: TStringField
      DisplayWidth = 2
      FieldName = 'STATE'
      Visible = False
    end
    object QryEmpZIP: TStringField
      DisplayWidth = 10
      FieldName = 'ZIP'
      Visible = False
      Size = 10
    end
    object QryEmpCOUNTRY: TStringField
      DisplayWidth = 30
      FieldName = 'COUNTRY'
      Visible = False
      Size = 30
    end
    object QryEmpPHONE_NUMBER: TStringField
      DisplayWidth = 25
      FieldName = 'PHONE_NUMBER'
      Visible = False
      Size = 25
    end
    object QryEmpBASIS: TStringField
      DisplayWidth = 1
      FieldName = 'BASIS'
      Visible = False
      Size = 1
    end
    object QryEmpPR_PAYGROUP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_PAYGROUP_ID'
      Visible = False
      Size = 0
    end
    object QryEmpPR_PAYTYPE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_PAYTYPE_ID'
      Visible = False
      Size = 0
    end
    object QryEmpPR_DEPARTMENT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_DEPARTMENT_ID'
      Visible = False
      Size = 0
    end
    object QryEmpID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryEmpTA_SETTINGS_ID: TBCDField
      FieldName = 'TA_SETTINGS_ID'
      Visible = False
      Size = 0
    end
  end
  object srcPayGroup: TDataSource
    DataSet = QryPayGroup
    Left = 48
    Top = 187
  end
  object QryPayGroup: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select 0 as id,'
      '          '#39'All'#39' as description'
      '  from dual'
      'union'
      'select id,'
      '          description'
      '  from pr_paygroup'
      'where misc.eplant_filter(eplant_id) = 1'
      '  and NVL(pk_hide, '#39'N'#39') = '#39'N'#39)
    Left = 48
    Top = 131
    object QryPayGroupID: TFMTBCDField
      FieldName = 'ID'
      Origin = 'ID'
      Precision = 38
      Size = 38
    end
    object QryPayGroupDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      Size = 50
    end
  end
  object PkEmp: TIQWebHpick
    BeforeOpen = PkEmpBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select p.id as id,'
      '       p.badgeno as badgeno,'
      '       p.empno as empno,'
      '       p.first_name           as first_name,'
      '       p.middle_name          as middle_name,'
      '       p.last_name            as last_name,'
      '       p.ssnmbr               as ssnmbr,'
      '       p.addr1                as addr1,'
      '       p.addr2                as addr2,'
      '       p.city                 as city,'
      '       p.state                as state,'
      '       p.zip                  as zip,'
      '       p.country              as country,'
      '       p.phone_number         as phone_number,'
      '       p.charge_rate          as charge_rate,'
      '       p.status_code          as status_code,'
      '       p.date_hired           as date_hired,'
      '       p.termination_date     as termination_date,'
      '       p.last_review_date     as last_review_date,'
      '       p.next_review_date     as next_review_date,'
      '       p.PK_HIDE              as PK_HIDE'
      '  from pr_emp p,'
      '       pr_paygroup g'
      ' where ((p.pr_paygroup_id = :nId) or (:nNum = 1))'
      '   and misc.eplant_filter_include_nulls(g.eplant_id) = 1'
      '   and p.pr_paygroup_id = g.id(+)'
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 292
    Top = 129
    ParamData = <
      item
        Name = 'nId'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'nNum'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkEmpID: TBCDField
      FieldName = 'ID'
      Origin = 'PR_EMP.ID'
      Visible = False
      Size = 0
    end
    object PkEmpEMPNO: TStringField
      DisplayLabel = 'Emp#'
      FieldName = 'EMPNO'
      Origin = 'PR_EMP.EMPNO'
      Size = 25
    end
    object PkEmpFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      FieldName = 'FIRST_NAME'
      Origin = 'PR_EMP.FIRST_NAME'
      Size = 30
    end
    object PkEmpMIDDLE_NAME: TStringField
      DisplayLabel = 'Middle Name'
      FieldName = 'MIDDLE_NAME'
      Origin = 'PR_EMP.MIDDLE_NAME'
      Size = 30
    end
    object PkEmpLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      FieldName = 'LAST_NAME'
      Origin = 'PR_EMP.LAST_NAME'
      Size = 30
    end
    object PkEmpSSNMBR: TStringField
      DisplayLabel = 'SSN'
      FieldName = 'SSNMBR'
      Origin = 'PR_EMP.SSNMBR'
      Visible = False
      Size = 11
    end
    object PkEmpADDR1: TStringField
      DisplayLabel = 'Address1'
      FieldName = 'ADDR1'
      Origin = 'PR_EMP.ADDR1'
      Visible = False
      Size = 60
    end
    object PkEmpADDR2: TStringField
      DisplayLabel = 'Address2'
      FieldName = 'ADDR2'
      Origin = 'PR_EMP.ADDR2'
      Visible = False
      Size = 60
    end
    object PkEmpSTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
      Origin = 'PR_EMP.STATE'
      Visible = False
    end
    object PkEmpCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Origin = 'PR_EMP.COUNTRY'
      Visible = False
      Size = 30
    end
    object PkEmpZIP: TStringField
      FieldName = 'ZIP'
      Origin = 'PR_EMP.ZIP'
      Visible = False
      Size = 10
    end
    object PkEmpPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone#'
      FieldName = 'PHONE_NUMBER'
      Origin = 'PR_EMP.PHONE_NUMBER'
      Visible = False
      Size = 25
    end
    object PkEmpCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Origin = 'PR_EMP.CITY'
      Visible = False
      Size = 30
    end
    object PkEmpCHARGE_RATE: TBCDField
      DisplayLabel = 'Charge Rate'
      FieldName = 'CHARGE_RATE'
      Origin = 'PR_EMP.CHARGE_RATE'
      Visible = False
      Size = 2
    end
    object PkEmpSTATUS_CODE: TStringField
      DisplayLabel = 'Status Code'
      FieldName = 'STATUS_CODE'
      Origin = 'PR_EMP.STATUS_CODE'
      Visible = False
      Size = 10
    end
    object PkEmpDATE_HIRED: TDateTimeField
      DisplayLabel = 'Date Hired'
      FieldName = 'DATE_HIRED'
      Origin = 'PR_EMP.DATE_HIRED'
      Visible = False
    end
    object PkEmpTERMINATION_DATE: TDateTimeField
      DisplayLabel = 'Date Terminated'
      FieldName = 'TERMINATION_DATE'
      Origin = 'PR_EMP.TERMINATION_DATE'
      Visible = False
    end
    object PkEmpLAST_REVIEW_DATE: TDateTimeField
      DisplayLabel = 'Last review date'
      FieldName = 'LAST_REVIEW_DATE'
      Origin = 'PR_EMP.LAST_REVIEW_DATE'
      Visible = False
    end
    object PkEmpNEXT_REVIEW_DATE: TDateTimeField
      DisplayLabel = 'Next review date'
      FieldName = 'NEXT_REVIEW_DATE'
      Origin = 'PR_EMP.NEXT_REVIEW_DATE'
      Visible = False
    end
    object PkEmpPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.PR_EMP.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkEmpBADGENO: TStringField
      DisplayLabel = 'Badge#'
      FieldName = 'BADGENO'
      Size = 25
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Assign Pay Types'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192480 $'
    BuildVersion = '176554'
    Left = 240
    Top = 72
  end
  object QryPayType: TFDQuery
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, '
      '       description '
      '  from pr_paytype '
      ' where NVL(pk_hide, '#39'N'#39') = '#39'N'#39
      'order by description')
    Left = 124
    Top = 131
  end
  object dsPayType: TDataSource
    DataSet = QryPayType
    Left = 124
    Top = 187
  end
end
