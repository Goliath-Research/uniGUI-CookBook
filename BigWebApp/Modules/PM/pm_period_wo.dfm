object FrmPMPeriodWorkorders: TFrmPMPeriodWorkorders
  Left = 479
  Top = 253
  HelpContext = 1024283
  ClientHeight = 390
  ClientWidth = 485
  Caption = 'MRO Workorders Capacity Schedule'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 287
    Width = 485
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object pnlWO: TUniPanel
    Left = 0
    Top = 55
    Width = 485
    Height = 232
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object IQSearchWO: TIQUniGridControl
      Left = 1
      Top = 27
      Width = 483
      Height = 205
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 266
      IQComponents.Grid.Height = 119
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcWO
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
      IQComponents.Navigator.DataSource = SrcWO
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 266
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 119
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcWO
      Columns = <
        item
          FieldName = 'ID'
          Title.Caption = 'Work Order #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'WO_DATE'
          Title.Caption = 'Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DEPARTMENT'
          Title.Caption = 'Department'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Start_Date'
          Title.Caption = 'Start Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'END_DATE'
          Title.Caption = 'End Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'WO_CLASS'
          Title.Caption = 'Class'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REQUESTED_BY'
          Title.Caption = 'Requested By'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'STATUS'
          Title.Caption = 'Status'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PRIORITY'
          Title.Caption = 'Priority'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'WO_TYPE'
          Title.Caption = 'Type'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EQNO'
          Title.Caption = 'Equipment #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EQUIP_DESCRIP'
          Title.Caption = 'Equipment Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EQUIP_CLASS'
          Title.Caption = 'Equipment Class'
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
      Left = 1
      Top = 1
      Width = 483
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object sbtnRemove: TUniSpeedButton
        Tag = 1
        Left = 1
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Remove Workorder from Capacity Schedule'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          0800000000000002000000000000000000000001000000000000000000000000
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
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDAF5FFDFDFDFDFDFDFDFDFDFDFDFDFDFDA4FFFDFD5FAFFDFD
          FDFDFDFDFDFDFD670F5FFDFDA4FFFDFDFDFDFDFDFDFDFDA4A4FFFD5F0F0F67FD
          FDFDFDFDFDFD5F0F5FFDFDA4A4A4FFFDFDFDFDFDFDFDA4A4FFFDFDFD170F0F67
          FDFDFDFDFD5F0F67FDFDFDFDA4A4A4FFFDFDFDFDFDA4A4FFFDFDFDFDFD5F0F0F
          5FFDFDFD170F67FDFDFDFDFDFDA4A4A4FFFDFDFDA4A4FFFDFDFDFDFDFDFDA70F
          0F5FAF170F67FDFDFDFDFDFDFDFDA4A4A4FFFFA4A4FFFDFDFDFDFDFDFDFDFDFD
          170F0F0F67FDFDFDFDFDFDFDFDFDFDFDA4A4A4A4FFFDFDFDFDFDFDFDFDFDFDFD
          67171717FDFDFDFDFDFDFDFDFDFDFDFDA4A4A4A4FFFDFDFDFDFDFDFDFDFDFD5F
          1717671717FDFDFDFDFDFDFDFDFDFDA4A4A4FFA4A4FFFDFDFDFDFDFDFDFD1717
          17AFFDFD5F17FDFDFDFDFDFDFDFDA4A4A4FFFDFDA4A4FFFDFDFDFDFDFD171717
          AFFDFDFDFD6717FDFDFDFDFDFDA4A4A4FFFDFDFDFDA4A4FFFDFDFDFD171717AF
          FDFDFDFDFDFDAF5FFDFDFDFDA4A4A4FFFDFDFDFDFDFDA4A4FFFDFD171717FDFD
          FDFDFDFDFDFDFDFDFDFDFDA4A4A4FDFDFDFDFDFDFDFDFDFDFDFDFDAF5FFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDA4A4FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnRemoveClick
      end
    end
  end
  object pnlDetails: TUniPanel
    Left = 0
    Top = 290
    Width = 485
    Height = 100
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 483
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = ' Workorder Details'
    end
    object wwDBGridPMDayHrs: TIQUniGridControl
      Left = 1
      Top = 27
      Width = 483
      Height = 73
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 266
      IQComponents.Grid.Height = 434
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcPMDayHrs
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
      IQComponents.Navigator.DataSource = SrcPMDayHrs
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 266
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 434
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcPMDayHrs
      Columns = <
        item
          FieldName = 'PROD_DATE'
          Title.Caption = 'Prod Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PROD_HRS'
          Title.Caption = 'Prod Hours'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LATE'
          Title.Caption = 'Late'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 485
    Height = 55
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 65
      Top = 0
      Width = 6
      Height = 55
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object pnlClient01: TUniPanel
      Left = 71
      Top = 1
      Width = 414
      Height = 53
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      DesignSize = (
        414
        53)
      object edPMCell: TUniEdit
        Left = 4
        Top = 6
        Width = 404
        Height = 19
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Color = clBtnFace
        ReadOnly = True
      end
      object edPeriod: TUniEdit
        Left = 4
        Top = 29
        Width = 404
        Height = 19
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Color = clBtnFace
        ReadOnly = True
      end
    end
    object pnlLeft01: TUniPanel
      Left = 1
      Top = 1
      Width = 65
      Height = 53
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
      Caption = ''
      object Label1: TUniLabel
        Left = 6
        Top = 9
        Width = 43
        Height = 13
        Hint = ''
        Caption = 'MRO Cell'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 6
        Top = 32
        Width = 30
        Height = 13
        Hint = ''
        Caption = 'Period'
        TabOrder = 2
      end
      object Bevel1: TUniPanel
        Left = 63
        Top = 1
        Width = 2
        Height = 51
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 3
        Caption = ''
      end
    end
  end
  object SrcWO: TDataSource
    DataSet = QryWO
    Left = 104
    Top = 109
  end
  object QryWO: TFDQuery
    BeforeOpen = QryWOBeforeOpen
    OnCalcFields = QryWOCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '
      '       w.id,'
      '       w.wo_date, '
      '       w.class as wo_class, '
      '       w.start_date as wo_start_date,'
      '       w.end_date as wo_end_date,'
      '       w.requested_by, '
      '       w.department, '
      '       w.status, '
      '       w.priority, '
      '       w.wo_type, '
      '       p.eqno, '
      '       p.descrip as equip_descrip, '
      '       p.class as equip_class, '
      '       w.eplant_id'
      '  from '
      '       pmwo w, '
      '       pmeqmt p'
      ' where '
      '       iqpm.get_pmwo_pmeqmt_id( w.id ) = p.id(+)'
      '   and misc.eplant_filter( w.eplant_id ) = 1'
      ''
      '   and EXISTS'
      '       ( select 1 '
      '           from pm_day_hrs'
      '          where '
      '                pmwo_id = w.id'
      '                '
      '            and pm_day_hrs.mfgcell_id = :mfgcell_id'
      '            '
      '            and'
      
        '                 -- filter out records past due only based on th' +
        'e view (monthly, weekly, daily) '
      '               ((:period = 0 and '
      '                               -- monthly'
      
        '                             ((:capacity_view = 0 and week_start' +
        ' between :start_date and :start_date + 140 and trunc(prod_date) ' +
        '< trunc(sysdate))'
      '                              or'
      '                               -- weekly'
      
        '                              (:capacity_view = 1 and week_start' +
        ' between :start_date and :start_date + 35 and late = '#39'Y'#39')'
      '                              or'
      '                               -- daily'
      
        '                              (:capacity_view = 2 and trunc(prod' +
        '_date) between trunc(:start_date) and trunc(:start_date) + 5 - 1' +
        ' and late = '#39'Y'#39')))'
      '                              '
      '                 or '
      ''
      
        '                 -- filter out records for given period based on' +
        ' the capacity view (monthly, weekly, daily) '
      '                 (:period > 0 and '
      '                              decode(:capacity_view,'
      '                                        -- monthly'
      
        '                                     0, iqcalendar.belongs_to_we' +
        'ek_period( :start_date, week_start, 4 ),'
      '                                        -- weekly'
      
        '                                     1, iqcalendar.belongs_to_we' +
        'ek_period( :start_date, week_start, 1 ),'
      '                                        -- daily'
      
        '                                     2, trunc(prod_date) - trunc' +
        '(:start_date) + 1,'
      '                                        -- s/n happen'
      '                                     -1 ) = :period )))'
      '                                ')
    Left = 104
    Top = 125
    ParamData = <
      item
        Name = 'MFGCELL_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'PERIOD'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CAPACITY_VIEW'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'START_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object QryWOID: TBCDField
      DisplayLabel = 'Work Order #'
      DisplayWidth = 14
      FieldName = 'ID'
      Origin = 'w.id'
      Size = 0
    end
    object QryWOWO_DATE: TDateTimeField
      DisplayLabel = 'Date'
      DisplayWidth = 18
      FieldName = 'WO_DATE'
      Origin = 'w.wo_date'
    end
    object QryWODEPARTMENT: TStringField
      DisplayLabel = 'Department'
      DisplayWidth = 20
      FieldName = 'DEPARTMENT'
      Origin = 'w.department'
    end
    object QryWOStart_Date: TDateTimeField
      DisplayLabel = 'Start Date'
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'Start_Date'
      Calculated = True
    end
    object QryWOWO_START_DATE: TDateTimeField
      DisplayLabel = 'Start Date'
      FieldName = 'WO_START_DATE'
      Origin = 'w.start_date'
      Visible = False
    end
    object QryWOWO_CLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'WO_CLASS'
      Origin = 'w.class'
      FixedChar = True
      Size = 2
    end
    object QryWOREQUESTED_BY: TStringField
      DisplayLabel = 'Requested By'
      DisplayWidth = 35
      FieldName = 'REQUESTED_BY'
      Origin = 'w.requested_by'
      Size = 35
    end
    object QryWOSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 20
      FieldName = 'STATUS'
      Origin = 'w.status'
    end
    object QryWOPRIORITY: TStringField
      DisplayLabel = 'Priority'
      DisplayWidth = 20
      FieldName = 'PRIORITY'
      Origin = 'w.priority'
    end
    object QryWOWO_TYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 19
      FieldName = 'WO_TYPE'
      Origin = 'w.wo_type'
      Size = 35
    end
    object QryWOEQNO: TStringField
      DisplayLabel = 'Equipment #'
      DisplayWidth = 25
      FieldName = 'EQNO'
      Origin = 'p.eqno'
      Size = 25
    end
    object QryWOEQUIP_DESCRIP: TStringField
      DisplayLabel = 'Equipment Description'
      DisplayWidth = 30
      FieldName = 'EQUIP_DESCRIP'
      Origin = 'p.descrip'
      Size = 50
    end
    object QryWOEQUIP_CLASS: TStringField
      DisplayLabel = 'Equipment Class'
      DisplayWidth = 13
      FieldName = 'EQUIP_CLASS'
      Origin = 'p.class'
      FixedChar = True
      Size = 2
    end
    object QryWOEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'w.eplant_id'
      Size = 0
    end
    object QryWOWO_END_DATE: TDateTimeField
      DisplayLabel = 'End Date'
      FieldName = 'WO_END_DATE'
      Origin = 'w.end_date'
      Visible = False
    end
    object QryWOMfgcell_ID: TBCDField
      FieldKind = fkCalculated
      FieldName = 'Mfgcell_ID'
      Visible = False
      Size = 0
      Calculated = True
    end
    object QryWOPeriod: TBCDField
      FieldKind = fkCalculated
      FieldName = 'Period'
      Visible = False
      Size = 0
      Calculated = True
    end
    object QryWOCapacity_View: TBCDField
      FieldKind = fkCalculated
      FieldName = 'Capacity_View'
      Visible = False
      Size = 0
      Calculated = True
    end
  end
  object SrcPMDayHrs: TDataSource
    DataSet = QryPMDayHrs
    Left = 148
    Top = 109
  end
  object QryPMDayHrs: TFDQuery
    BeforeOpen = QryWOBeforeOpen
    MasterSource = SrcWO
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       pmwo_id,'
      '       prod_date,'
      '       prod_hrs,'
      '       late'
      '  from'
      '       pm_day_hrs'
      ' where '
      '       pmwo_id = :id'
      '   and'
      
        '        -- filter out records past due only based on the view (m' +
        'onthly, weekly, daily) '
      '       ((:period = 0 and '
      '                      -- monthly'
      
        '                    ((:capacity_view = 0 and week_start between ' +
        ':start_date and :start_date + 140 and trunc(prod_date) < trunc(s' +
        'ysdate))'
      '                     or'
      '                      -- weekly'
      
        '                     (:capacity_view = 1 and week_start between ' +
        ':start_date and :start_date + 35 and late = '#39'Y'#39')'
      '                     or'
      '                      -- daily'
      
        '                     (:capacity_view = 2 and trunc(prod_date) be' +
        'tween trunc(:start_date) and trunc(:start_date) + 5 - 1 and late' +
        ' = '#39'Y'#39')))'
      '                      '
      '        or '
      ''
      
        '        -- filter out records for given period based on the capa' +
        'city view (monthly, weekly, daily) '
      '        (:period > 0 and '
      '                     decode(:capacity_view,'
      '                               -- monthly'
      
        '                            0, iqcalendar.belongs_to_week_period' +
        '( :start_date, week_start, 4 ),'
      '                               -- weekly'
      
        '                            1, iqcalendar.belongs_to_week_period' +
        '( :start_date, week_start, 1 ),'
      '                               -- daily'
      
        '                            2, trunc(prod_date) - trunc(:start_d' +
        'ate) + 1,'
      '                               -- s/n happen'
      '                            -1 ) = :period ))'
      'order by prod_date                                 ')
    Left = 148
    Top = 125
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end
      item
        Name = 'PERIOD'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CAPACITY_VIEW'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'START_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object QryPMDayHrsPROD_DATE: TDateTimeField
      DisplayLabel = 'Prod Date'
      DisplayWidth = 23
      FieldName = 'PROD_DATE'
    end
    object QryPMDayHrsPROD_HRS: TFMTBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Prod Hours'
      DisplayWidth = 16
      FieldName = 'PROD_HRS'
      ProviderFlags = []
      Precision = 15
      Size = 6
    end
    object QryPMDayHrsLATE: TStringField
      DisplayLabel = 'Late'
      DisplayWidth = 5
      FieldName = 'LATE'
      Size = 1
    end
    object QryPMDayHrsID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryPMDayHrsPMWO_ID: TBCDField
      FieldName = 'PMWO_ID'
      Visible = False
      Size = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 193
    Top = 113
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        ShortCut = 112
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmPMPeriodWorkorders'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192916 $'
    BuildVersion = '176554'
    Left = 228
    Top = 113
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'sbtnRemove')
    SecurityCode = 'FRMPMPERIODWORKORDERS'
    Left = 261
    Top = 114
  end
end
