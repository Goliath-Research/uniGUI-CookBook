object FrmCRMActivitiesFrame: TFrmCRMActivitiesFrame
  Left = 0
  Top = 0
  Width = 896
  Height = 426
  TabOrder = 0
  object PnlActivitiesCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 896
    Height = 426
    Hint = ''
    Visible = False
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitLeft = 360
    ExplicitTop = 192
    ExplicitWidth = 185
    ExplicitHeight = 41
    object PnlToolbarActivities: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 894
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      DesignSize = (
        894
        27)
      object sbtnActivityFilter: TUniSpeedButton
        Left = 26
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Filter'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD0000DDDDDDDDDDDD0660DD
          DDDDDDDDDD0660DDDDDDDDDDDD0F80DDDDDDDDDDDD0F80DDDDDDDDDDD088860D
          DDDDDDDD06888660DDDDDDD068F888660DDDDD068F88888660DDD068FFF88886
          660DD00000000000000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnActivityFilterClick
      end
      object sbtnJumpToActivity: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Jump to Activity'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          9E050000424D9E05000000000000360400002800000012000000120000000100
          0800000000006801000000000000000000000001000000010000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFD0000FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          0000FDFDFDFDFD000000FDFDFDFDFDFDFDFDFDFD0000FDFDFDFD002A00FDFDFD
          FDFDFDFDFDFDFDFD0000FDFDFD1AB200FDFDFDFDFDFDFDFDFDFDFDFD0000FDFD
          FD1ABA00FDFDFDFDFDFDFDFDFDFDFDFD0000FDFDFD1ABA00FDFDFDFD00FDFDFD
          FDFDFDFD0000FDFDFD1ABE00FDFDFDFD0000FDFDFDFDFDFD0000FDFDFD1AF6B2
          00FDFDFD002A00FDFDFDFDFD0000FDFDFDFD1ABEB200000000B22A00FDFDFDFD
          0000FDFDFDFD1AF6BEBA2A2AB2B2B22A00FDFDFD0000FDFDFDFDFD1AF6F6BEBA
          BABABAB22A00FDFD0000FDFDFDFDFDFD1A1AF6F6F6BEBABA00FDFDFD0000FDFD
          FDFDFDFDFDFD1A1A1AF6BE00FDFDFDFD0000FDFDFDFDFDFDFDFDFDFD1AF600FD
          FDFDFDFD0000FDFDFDFDFDFDFDFDFDFD1A00FDFDFDFDFDFD0000FDFDFDFDFDFD
          FDFDFDFD1AFDFDFDFDFDFDFD0000FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          0000}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = JumptoActivity1Click
      end
      object NavActivities: TUniDBNavigator
        Left = 743
        Top = 1
        Width = 150
        Height = 25
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        DataSource = SrcActivities
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
      object PnlLegend: TUniPanel
        Left = 718
        Top = 1
        Width = 25
        Height = 25
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object shpHistory: TUniPanel
          Left = 6
          Top = 7
          Width = 12
          Height = 12
          Hint = 'The Activity is Closed'
          ShowHint = True
          ParentShowHint = False
          TabOrder = 1
          Caption = ''
        end
      end
      object cmbAssignedTo: TUniDBLookupComboBox
        Left = 57
        Top = 3
        Width = 248
        Height = 21
        Hint = 'Assignment filter'
        ShowHint = True
        ParentShowHint = False
        Constraints.MaxWidth = 320
        Constraints.MinWidth = 178
        ListFieldIndex = 0
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clWindow
        OnChange = cmbAssignedToChange
      end
    end
    object PnlActivitiesGrid: TUniPanel
      Left = 1
      Top = 28
      Width = 894
      Height = 397
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object PnlActivitiesDisplay: TUniPanel
        Left = 1
        Top = 1
        Width = 892
        Height = 395
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = 'There are no activities linked to this customer.'
        Color = clWindow
      end
      object GridActivities: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 892
        Height = 395
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 675
        IQComponents.Grid.Height = 309
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcActivities
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
        IQComponents.Navigator.DataSource = SrcActivities
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 675
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 309
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcActivities
        Columns = <
          item
            FieldName = 'ImageIndex'
            Title.Caption = ' '
            Width = 35
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ID'
            Title.Caption = 'Activity #'
            Width = 70
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PRIORITY_STRING'
            Title.Caption = 'Priority'
            Width = 49
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'STARTDATE'
            Title.Caption = 'Start Date'
            Width = 126
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'FINISHDATE'
            Title.Caption = 'Finish Date'
            Width = 126
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SUBJECT'
            Title.Caption = 'Subject'
            Width = 140
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CONTACT'
            Title.Caption = 'Contact'
            Width = 112
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'COMPANY'
            Title.Caption = 'Company'
            Width = 210
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TYPE_STRING'
            Title.Caption = 'Type'
            Width = 49
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ARCHIVED'
            Title.Caption = 'Closed?'
            Width = 42
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ASSIGNEDTO'
            Title.Caption = 'Assigned To'
            Width = 84
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'QUEUE_NAME'
            Title.Caption = 'Queue'
            Width = 140
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SUBQUEUE_NAME'
            Title.Caption = 'Subqueue'
            Width = 140
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PUBLISH'
            Title.Caption = 'Published'
            Width = 84
            CheckBoxField.FieldValues = 'Y;N'
          end>
        Marker = 0
      end
    end
  end
  object QryActivities: TFDQuery
    Tag = 1
    BeforeOpen = QryActivitiesBeforeOpen
    AfterOpen = QryActivitiesAfterOpen
    BeforeClose = QryActivitiesBeforeClose
    OnCalcFields = QryActivitiesCalcFields
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evRowsetSize, evCache, evCursorKind]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.Cache = []
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereChanged
    SQL.Strings = (
      'SELECT v.id,'
      '       v.startdate,'
      '       v.finishdate,'
      '       v.principle_source_id,'
      '       v.contact_id,'
      '       v.principle_companyno AS custno,'
      '       v.principle_company AS company,'
      '       v.principle_company_phone,'
      '       v.principle_company_ext,'
      '       v.principle_company_fax,'
      '       v.principle_company_url,'
      '       SUBSTRB(misc.format_name(v.principle_first_name,'
      '                                v.principle_nickname,'
      '                                v.principle_middle_name,'
      '                                v.principle_last_name),'
      '               1,'
      '               255)'
      '          AS contact,'
      '       v.principle_first_name,'
      '       v.principle_nickname,'
      '       principle_middle_name,'
      '       v.principle_last_name,'
      '       v.principle_contact_phone,'
      '       v.principle_contact_ext,'
      '       v.principle_contact_cell,'
      '       v.principle_contact_fax,'
      '       v.principle_contact_email,'
      '       v.subject,'
      '       v.TYPE,'
      '       v.setalarm,'
      '       v.priority,'
      '       SUBSTRB(iqeval.substrw63max(v.regarding,'
      '                                   1,'
      '                                   2000),'
      '               1,'
      '               2000)'
      '          AS regarding,'
      '       SUBSTRB(iqeval.substrw63max(iqcrm.type_string(v.TYPE),'
      '                                   1,'
      '                                   20),'
      '               1,'
      '               20)'
      '          AS type_string,'
      
        '       SUBSTRB(iqeval.substrw63max(iqcrm.priority_string(NVL(v.p' +
        'riority, 2)),'
      '                                   1,'
      '                                   20),'
      '               1,'
      '               20)'
      '          AS priority_string,'
      '       v.assignedto,'
      '       u.display_name AS assignedto_display,'
      '       v.eplant_id,'
      '       NVL(v.archived, '#39'N'#39') AS archived,'
      '       DECODE(v.TYPE, 4, v.id, NULL) AS issue_number,'
      '       v.id AS activity_number,'
      '       v.principle_source_id,'
      '       v.principle_source,'
      '       NVL(v.personal, '#39'N'#39') AS personal,'
      '       v.queue_type_id,'
      '       q.name AS queue_name,'
      '       v.queue_id,'
      '       q.description AS queue_description,'
      '       sq.name AS subqueue_name,'
      '       sq.description AS subqueue_description,'
      '       v.publish AS publish,'
      '       v.source AS source,'
      '       v.source_id AS source_id,'
      '       v.source_display AS source_display'
      
        '  FROM crm_activity v, v_empuser u, crm_queue_types q, crm_queue' +
        ' sq'
      ' WHERE v.principle_source = :SOURCE AND'
      '       v.principle_source_id = :SOURCE_ID AND'
      '       u.user_name(+) = v.assignedto AND'
      '       q.id(+) = v.queue_type_id AND'
      '       sq.id(+) = v.queue_id AND'
      '       (NVL(v.personal, '#39'N'#39') <> '#39'Y'#39' AND'
      '        v.assignedto <> misc.getusername OR'
      '        v.assignedto = misc.getusername) AND'
      '       iqms.iqcrm.eplant_filter(v.eplant_id) = 1 AND'
      '       (INSTR(:TYPE, v.type) > 0) AND'
      '       (:SHOW_ALL_USERS = 1 OR'
      '        :SHOW_ALL_USERS = 0 AND v.assignedto = :ASSIGNEDTO) AND'
      '       (:INCLUDE_ARCHIVED = 1 OR'
      '        :INCLUDE_ARCHIVED = 0 AND NVL(v.archived, '#39'N'#39') <> '#39'Y'#39')'
      '')
    Left = 176
    Top = 128
    ParamData = <
      item
        Name = 'SOURCE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'SOURCE_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'TYPE'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'SHOW_ALL_USERS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'ASSIGNEDTO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'INCLUDE_ARCHIVED'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryActivitiesImageIndex: TIntegerField
      DisplayLabel = ' '
      FieldKind = fkCalculated
      FieldName = 'ImageIndex'
      Calculated = True
    end
    object QryActivitiesTYPE: TBCDField
      DisplayLabel = ' '
      DisplayWidth = 4
      FieldName = 'TYPE'
      Origin = 'v.type'
      Size = 0
    end
    object QryActivitiesID: TBCDField
      DisplayLabel = 'Activity #'
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'v.crm_activity_id'
      Size = 0
    end
    object QryActivitiesPRIORITY_STRING: TStringField
      DisplayLabel = 'Priority'
      DisplayWidth = 7
      FieldName = 'PRIORITY_STRING'
      Origin = 'v.priority'
    end
    object QryActivitiesSTARTDATE: TDateTimeField
      DisplayLabel = 'Start Date'
      DisplayWidth = 18
      FieldName = 'STARTDATE'
      Origin = 'v.startdate'
    end
    object QryActivitiesFINISHDATE: TDateTimeField
      DisplayLabel = 'Finish Date'
      DisplayWidth = 18
      FieldName = 'FINISHDATE'
      Origin = 'v.finishdate'
    end
    object QryActivitiesSUBJECT: TStringField
      DisplayLabel = 'Subject'
      DisplayWidth = 20
      FieldName = 'SUBJECT'
      Origin = 'v.subject'
      Size = 250
    end
    object QryActivitiesCONTACT: TStringField
      DisplayLabel = 'Contact'
      DisplayWidth = 16
      FieldName = 'CONTACT'
      Origin = 'v.contact'
      Size = 255
    end
    object QryActivitiesCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Origin = 'v.company'
      Size = 60
    end
    object QryActivitiesTYPE_STRING: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 7
      FieldName = 'TYPE_STRING'
      Origin = 'v.type_string'
    end
    object QryActivitiesARCHIVED: TStringField
      DisplayLabel = 'Closed?'
      DisplayWidth = 6
      FieldName = 'ARCHIVED'
      Origin = 'v.archived'
      Size = 1
    end
    object QryActivitiesASSIGNEDTO: TStringField
      DisplayLabel = 'Assigned To'
      DisplayWidth = 12
      FieldName = 'ASSIGNEDTO'
      Origin = 'v.assignedto_display'
      Size = 35
    end
    object QryActivitiesQUEUE_NAME: TStringField
      DisplayLabel = 'Queue'
      DisplayWidth = 20
      FieldName = 'QUEUE_NAME'
      Origin = 'v.queue_name'
      FixedChar = True
      Size = 35
    end
    object QryActivitiesSUBQUEUE_NAME: TStringField
      DisplayLabel = 'Subqueue'
      DisplayWidth = 20
      FieldName = 'SUBQUEUE_NAME'
      Origin = 'v.subqueue_name'
      Size = 255
    end
    object QryActivitiesPUBLISH: TStringField
      DisplayLabel = 'Published'
      DisplayWidth = 12
      FieldName = 'PUBLISH'
      Origin = 'v.publish'
      Size = 1
    end
    object QryActivitiesISSUE_NUMBER: TFMTBCDField
      DisplayLabel = 'Support Issue #'
      DisplayWidth = 12
      FieldName = 'ISSUE_NUMBER'
      Origin = 'v.issue_number'
      Visible = False
      Size = 38
    end
    object QryActivitiesSETALARM: TStringField
      DisplayLabel = 'Alarm Set?'
      DisplayWidth = 8
      FieldName = 'SETALARM'
      Origin = 'v.setalarm'
      Visible = False
      Size = 1
    end
    object QryActivitiesPRIORITY: TBCDField
      DisplayWidth = 10
      FieldName = 'PRIORITY'
      Origin = 'v.priority'
      Visible = False
      Size = 0
    end
    object QryActivitiesEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'v.eplant_id'
      Visible = False
      Size = 0
    end
    object QryActivitiesMASTER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'MASTER_ID'
      Origin = 'v.master_id'
      Visible = False
      Size = 0
    end
    object QryActivitiesCHILD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'CHILD_ID'
      Origin = 'v.child_id'
      Visible = False
      Size = 0
    end
    object QryActivitiesPRINCIPLE_CONTACT_PHONE: TStringField
      DisplayWidth = 25
      FieldName = 'PRINCIPLE_CONTACT_PHONE'
      Origin = 'v.principle_contact_phone'
      Visible = False
      Size = 25
    end
    object QryActivitiesPRINCIPLE_CONTACT_EXT: TStringField
      DisplayWidth = 25
      FieldName = 'PRINCIPLE_CONTACT_EXT'
      Origin = 'v.principle_contact_ext'
      Visible = False
      Size = 25
    end
    object QryActivitiesPRINCIPLE_CONTACT_EMAIL: TStringField
      DisplayWidth = 150
      FieldName = 'PRINCIPLE_CONTACT_EMAIL'
      Origin = 'v.principle_contact_email'
      Visible = False
      Size = 250
    end
    object QryActivitiesSOURCE: TStringField
      FieldName = 'SOURCE'
      Visible = False
      Size = 250
    end
    object QryActivitiesSOURCE_ID: TBCDField
      FieldName = 'SOURCE_ID'
      Visible = False
      Size = 0
    end
    object QryActivitiesSOURCE_DISPLAY: TStringField
      FieldName = 'SOURCE_DISPLAY'
      Visible = False
      Size = 250
    end
  end
  object SrcActivities: TDataSource
    DataSet = QryActivities
    Left = 168
    Top = 120
  end
  object IQOptionDialog1: TIQWebOptionDialog
    Items.Strings = (
      'Calls'
      'Tasks'
      'Meetings'
      'Support Issues'
      'Notes'
      'Show Closed Items'
      'Show Sales Stage Items'
      'Show Historical Events')
    SaveToRegKey = 'ACTIVITY_FILTER'
    Title = 'Filter'
    Left = 219
    Top = 118
  end
  object PActivity: TUniPopupMenu
    OnPopup = PActivityPopup
    Left = 267
    Top = 118
    object JumptoActivity1: TUniMenuItem
      Caption = 'Jump to Activity'
      OnClick = JumptoActivity1Click
    end
    object ViewSummary1: TUniMenuItem
      Caption = 'View Summary'
      OnClick = ViewSummary1Click
    end
  end
end
