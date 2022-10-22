object FrmQuoteThroughputMap: TFrmQuoteThroughputMap
  Left = 128
  Top = 201
  ClientHeight = 303
  ClientWidth = 627
  Caption = 'Process Throughput Map'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 627
    Height = 303
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object pnlLeft01: TUniPanel
      Left = 1
      Top = 29
      Width = 625
      Height = 273
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Panel4: TUniPanel
        Left = 1
        Top = 84
        Width = 623
        Height = 188
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object wwDBGrid1: TIQUniGridControl
          Left = 1
          Top = 1
          Width = 621
          Height = 186
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 404
          IQComponents.Grid.Height = 100
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcProcess
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
          IQComponents.Navigator.DataSource = SrcProcess
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 404
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 100
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.HiddenPanel.ExplicitHeight = 72
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          IQComponents.FormTab.ExplicitHeight = 101
          DataSource = SrcProcess
          Columns = <
            item
              FieldName = 'OPSEQ'
              Title.Caption = '#'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'OPNO'
              Title.Caption = 'Process #'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'MOVE_SIZE'
              Title.Caption = 'Move Qty'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'MOVE_TIME'
              Title.Caption = 'Move Time'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'UOM'
              Title.Caption = 'Cycle UOM'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CYCLETM_DISP'
              Title.Caption = 'Cycle Time'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SETUPHRS'
              Title.Caption = 'Setup Hours'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'OPDESC'
              Title.Caption = 'Process Description'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ParentOpNo'
              Title.Caption = 'Depend On'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          TabsVisible = True
          ExplicitTop = 29
          ExplicitHeight = 158
          Marker = 0
        end
        object wwDBComboBoxUOM: TUniDBComboBox
          Left = 84
          Top = 56
          Width = 121
          Height = 21
          Hint = ''
          Style = csDropDownList
          Items.Strings = (
            'SEC'
            'MIN'
            'HOUR'
            'DAY')
          TabOrder = 1
        end
        object wwDBComboDlgDependentOn: TUniEdit
          Left = 83
          Top = 79
          Width = 121
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 2
          ReadOnly = True
        end
      end
      object GroupBox1: TUniGroupBox
        Left = 1
        Top = 1
        Width = 623
        Height = 83
        Hint = ''
        Caption = ' Standard Processing Time '
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        object Splitter2: TUniSplitter
          Left = 96
          Top = 15
          Width = 6
          Height = 66
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object Panel5: TUniPanel
          Left = 2
          Top = 15
          Width = 94
          Height = 66
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label1: TUniLabel
            Left = 4
            Top = 8
            Width = 61
            Height = 13
            Hint = ''
            Caption = 'Std Quantity'
            TabOrder = 1
          end
          object Label14: TUniLabel
            Left = 4
            Top = 32
            Width = 76
            Height = 13
            Hint = ''
            Caption = 'Processing Time'
            TabOrder = 2
          end
        end
        object Panel6: TUniPanel
          Left = 102
          Top = 15
          Width = 519
          Height = 66
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object DBEdit1: TUniDBEdit
            Left = 0
            Top = 6
            Width = 180
            Height = 21
            Hint = ''
            DataField = 'ASSY1_STD_QUAN'
            DataSource = SrcQuote
            TabOrder = 0
          end
          object DBEdit2: TUniDBEdit
            Left = 0
            Top = 31
            Width = 180
            Height = 19
            Hint = ''
            DataField = 'ASSY1_STD_PROCESSING_TIME'
            DataSource = SrcQuote
            TabOrder = 1
            Color = clBtnFace
            ReadOnly = True
          end
        end
      end
    end
    object Panel10: TUniPanel
      Left = 1
      Top = 1
      Width = 625
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object sbtnRecalc: TUniSpeedButton
        Left = 37
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Apply Selection Criteria'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C21E0000C21E00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF034464034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4A4A4A4A4A4AFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF0344640ED1FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4A4A4AD6D6D64A4A4AFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF00669A14D3FF034464FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070D7D7D74A
          4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF0099CC1BD5FF1BD5FF034464FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1A1A1D9D9D9D9
          D9D94A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF00669A22D7FF22D7FF034464FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070DA
          DADADADADA4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF00669A00669A00669A29DAFF034464034464034464FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070707070707070DC
          DCDC4A4A4A4A4A4A4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF00669A30DCFF30DCFF034464FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070DEDEDEDE
          DEDE4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF00669A37DEFF37DEFF034464FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070DF
          DFDFDFDFDF4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF00669A3DE0FF3DE0FF3DE0FF034464FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070E1
          E1E1E1E1E1E1E1E14A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF00669A00669A00669A00669A44E3FF034464034464034464034464FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070707070707070707070E3
          E3E34A4A4A4A4A4A4A4A4A4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF00669A4BE5FF4BE5FF4BE5FF4BE5FF034464FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070E5E5E5E5E5E5E5
          E5E5E5E5E54A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF00669A5CEBFE5CEBFE5CEBFE5CEBFE034464FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070E9E9E9E9
          E9E9E9E9E9E9E9E94A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF0099CC00669A70F1FE70F1FE70F1FE70F1FE034464FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1A1A1707070EE
          EEEEEEEEEEEEEEEEEEEEEE4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF0099CC0344640344640344640344640344640344
          64FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1A1A14A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnRecalcClick
      end
      object Bevel1: TUniPanel
        Left = 29
        Top = 1
        Width = 4
        Height = 24
        Hint = ''
        TabOrder = 2
        Caption = ''
      end
      object sbtnProcessDependencies1: TUniSpeedButton
        Left = -1
        Top = 1
        Width = 27
        Height = 25
        Hint = 'Processes Dependencies'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000C40E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDD000000000000000078888888888888807FFF8FFFFF8FFF807FFF8CCCCCCC
          CC807FFF8CCCCCCCCC807FF77CCCCCCCCC807FF77777778FFF8078877777778F
          FF807888888FFF8FFF807888888FFF8FFF807FFF8FFFFF8FFF80777777777777
          7770788878888878887078887888887888707777777777777770}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnProcessDependencies1Click
      end
    end
  end
  object SecurityRegister1: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'QryStandard'
      'QryProcess')
    SecurityCode = 'FRMBOMTHROUGHPUTMAP'
    Left = 31
    Top = 193
  end
  object SrcQuote: TDataSource
    DataSet = QryQuote
    Left = 31
    Top = 228
  end
  object QryQuote: TFDQuery
    BeforeOpen = QryQuoteBeforeOpen
    AfterPost = ApplyUpdates
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQLStandard
    SQL.Strings = (
      'select id,'
      '       assy1_std_quan,'
      '       assy1_std_processing_time   '
      ''
      '  from quote'
      ''
      ' where id = :quote_id'
      '')
    Left = 31
    Top = 251
    ParamData = <
      item
        Name = 'quote_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryQuoteID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.STANDARD.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object QryQuoteASSY1_STD_QUAN: TFMTBCDField
      FieldName = 'ASSY1_STD_QUAN'
      Origin = 'IQ.STANDARD.ASSY1_STD_QUAN'
      Size = 6
    end
    object QryQuoteASSY1_STD_PROCESSING_TIME: TFMTBCDField
      FieldName = 'ASSY1_STD_PROCESSING_TIME'
      Origin = 'IQ.STANDARD.ASSY1_STD_PROCESSING_TIME'
      DisplayFormat = '#########.######'
      Size = 6
    end
  end
  object UpdateSQLStandard: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into quote'
      '  (ID, ASSY1_STD_QUAN, ASSY1_STD_PROCESSING_TIME)'
      'values'
      '  (:ID, :ASSY1_STD_QUAN, :ASSY1_STD_PROCESSING_TIME)')
    ModifySQL.Strings = (
      'update quote'
      'set'
      '  ID = :ID,'
      '  ASSY1_STD_QUAN = :ASSY1_STD_QUAN,'
      '  ASSY1_STD_PROCESSING_TIME = :ASSY1_STD_PROCESSING_TIME'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from quote'
      'where'
      '  ID = :OLD_ID')
    Left = 31
    Top = 270
  end
  object SrcProcess: TDataSource
    DataSet = QryProcess
    Left = 71
    Top = 230
  end
  object QryProcess: TFDQuery
    BeforeOpen = QryProcessBeforeOpen
    AfterPost = ApplyUpdates
    OnCalcFields = QryProcessCalcFields
    CachedUpdates = True
    OnUpdateRecord = QryProcessUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select qptoper.opseq,'
      '       qsndop.id,'
      '       qsndop.opno,'
      '       qsndop.opdesc,'
      '       qptoper.uom,'
      '       qptoper.cycletm_disp,'
      '       qptoper.move_size,'
      '       qptoper.move_time,'
      '       qsndop.setuphrs,'
      '       qptoper.rowid as ptoper_rowid,'
      '       qptoper.id as ptoper_id'
      '  from qptoper, qsndop'
      ' where qptoper.qinvt_id = :qinvt_id'
      '   and qptoper.qsndop_id = qsndop.id '
      '   and qsndop.op_class = '#39'AS'#39
      ' order by qptoper.opseq'
      '   ')
    Left = 71
    Top = 251
    ParamData = <
      item
        Name = 'qinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryProcessOPSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 10
      FieldName = 'OPSEQ'
      ReadOnly = True
      Size = 0
    end
    object QryProcessOPNO: TStringField
      DisplayLabel = 'Process #'
      DisplayWidth = 15
      FieldName = 'OPNO'
      ReadOnly = True
      Size = 15
    end
    object QryProcessOPDESC: TStringField
      DisplayLabel = 'Process Description'
      DisplayWidth = 60
      FieldName = 'OPDESC'
      ReadOnly = True
      Size = 60
    end
    object QryProcessUOM: TStringField
      DisplayWidth = 10
      FieldName = 'UOM'
      Size = 10
    end
    object QryProcessCYCLETM_DISP: TBCDField
      DisplayLabel = 'Cycle Time'
      DisplayWidth = 10
      FieldName = 'CYCLETM_DISP'
    end
    object QryProcessMOVE_SIZE: TFMTBCDField
      DisplayLabel = 'Move Quantity'
      DisplayWidth = 10
      FieldName = 'MOVE_SIZE'
      Size = 6
    end
    object QryProcessMOVE_TIME: TFMTBCDField
      DisplayLabel = 'Move Time'
      DisplayWidth = 10
      FieldName = 'MOVE_TIME'
      Size = 6
    end
    object QryProcessSETUPHRS: TBCDField
      DisplayLabel = 'Setup Hours'
      DisplayWidth = 10
      FieldName = 'SETUPHRS'
      Size = 2
    end
    object QryProcessPTOPER_ROWID: TStringField
      DisplayWidth = 18
      FieldName = 'PTOPER_ROWID'
      ReadOnly = True
      Size = 23
    end
    object QryProcessID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryProcessParentOpNo: TStringField
      DisplayLabel = 'Depend On'
      FieldKind = fkCalculated
      FieldName = 'ParentOpNo'
      Calculated = True
    end
    object QryProcessPTOPER_ID: TBCDField
      FieldName = 'PTOPER_ID'
      Visible = False
      Size = 0
    end
  end
  object DataSource1: TDataSource
    Left = 111
    Top = 231
  end
  object QryMap: TFDQuery
    BeforeOpen = QryMapBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       opno,'
      '       opseq,'
      '       start_time,'
      '       end_time,'
      '       duration,'
      '       qty,'
      '       prodhrs,'
      '       setuphrs,'
      '       Y_Value,'
      '       rownum as recno'
      '  from '
      '      ( select c.id,'
      '               s.opno,'
      '               b.opseq,'
      '               c.start_time,'
      '               c.end_time,'
      
        '               round( (c.end_time - c.start_time) * 24, 2) as du' +
        'ration,'
      '               c.qty,'
      '               c.prodhrs,'
      '               c.setuphrs,'
      '               - b.opseq as Y_Value'
      ''
      
        '          from assy1_tote_part a, assy1_tote_process b, assy1_to' +
        'te_data c, qsndop s'
      '         where '
      '               a.batch = :batch'
      '           and a.id = b.assy1_tote_part_id'
      '           and b.id = c.assy1_tote_process_id'
      '           '
      '           and b.sndop_id = s.id'
      '         order by b.opseq,'
      '                  c.id )'
      '         '
      '')
    Left = 111
    Top = 252
    ParamData = <
      item
        Name = 'batch'
        DataType = ftBCD
        ParamType = ptInput
        Value = '23'
      end>
    object QryMapOPNO: TStringField
      FieldName = 'OPNO'
      Size = 15
    end
    object QryMapOPSEQ: TBCDField
      FieldName = 'OPSEQ'
      Size = 0
    end
    object QryMapSTART_TIME: TDateTimeField
      FieldName = 'START_TIME'
    end
    object QryMapEND_TIME: TDateTimeField
      FieldName = 'END_TIME'
    end
    object QryMapDURATION: TFMTBCDField
      FieldName = 'DURATION'
      Size = 38
    end
    object QryMapQTY: TFMTBCDField
      FieldName = 'QTY'
      Size = 6
    end
    object QryMapPRODHRS: TFMTBCDField
      FieldName = 'PRODHRS'
      Size = 6
    end
    object QryMapSETUPHRS: TFMTBCDField
      FieldName = 'SETUPHRS'
      Size = 6
    end
    object QryMapY_VALUE: TFMTBCDField
      FieldName = 'Y_VALUE'
      Size = 38
    end
    object QryMapID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryMapRECNO: TFMTBCDField
      FieldName = 'RECNO'
      Size = 38
    end
    object QryMapColor: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Color'
      Calculated = True
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 189
    Top = 232
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmQuoteThroughputMap'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195785 $'
    BuildVersion = '176554'
    Left = 224
    Top = 231
  end
end
