object FrmAssyTrack_BomDetails: TFrmAssyTrack_BomDetails
  Left = 436
  Top = 299
  ClientHeight = 299
  ClientWidth = 393
  Caption = 'Edit Process Details'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 393
    Height = 258
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object wwDataInspector1: TwwDataInspector
      Left = 0
      Top = 0
      Width = 393
      Height = 258
      DisableThemes = False
      Align = alClient
      TabOrder = 1
      DataSource = SrcProcessInfo
      Items = <
        item
          DataSource = SrcProcessInfo
          DataField = 'WORKORDER_ID'
          Caption = 'WO #'
          ReadOnly = True
          WordWrap = False
        end
        item
          DataSource = SrcProcessInfo
          DataField = 'ITEMNO'
          Caption = 'Item #'
          ReadOnly = True
          Items = <
            item
              DataSource = SrcProcessInfo
              DataField = 'DESCRIP'
              Caption = 'Description'
              ReadOnly = True
              WordWrap = False
            end
            item
              DataSource = SrcProcessInfo
              DataField = 'DESCRIP2'
              Caption = 'Ext Description'
              ReadOnly = True
              WordWrap = False
            end
            item
              DataSource = SrcProcessInfo
              DataField = 'CLASS'
              Caption = 'Class'
              ReadOnly = True
              WordWrap = False
            end
            item
              DataSource = SrcProcessInfo
              DataField = 'REV'
              Caption = 'Rev'
              ReadOnly = True
              WordWrap = False
            end>
          WordWrap = False
        end
        item
          DataSource = SrcProcessInfo
          DataField = 'OPNO'
          Caption = 'Process #'
          ReadOnly = True
          Items = <
            item
              DataSource = SrcProcessInfo
              DataField = 'OPDESC'
              Caption = 'Process Description'
              ReadOnly = True
              WordWrap = False
            end>
          WordWrap = False
        end
        item
          DataSource = SrcProcessInfo
          Caption = 'Process Details'
          ReadOnly = True
          Expanded = True
          Items = <
            item
              DataSource = SrcProcessInfo
              DataField = 'MULTIPLES'
              Caption = 'Multiples'
              WordWrap = False
            end
            item
              DataSource = SrcProcessInfo
              DataField = 'UOM'
              Caption = 'UOM'
              PickList.Items.Strings = (
                'SEC'
                'MIN'
                'HOUR'
                'DAY')
              PickList.Style = csDropDownList
              WordWrap = False
            end
            item
              DataSource = SrcProcessInfo
              DataField = 'CYCLETM_DISP'
              Caption = 'Cycle Time'
              WordWrap = False
            end
            item
              DataSource = SrcProcessInfo
              DataField = 'SCRAP_DISP'
              Caption = 'Yield'
              WordWrap = False
            end
            item
              DataSource = SrcProcessInfo
              DataField = 'MOVE_SIZE'
              Caption = 'Move Qty'
              WordWrap = False
            end
            item
              DataSource = SrcProcessInfo
              DataField = 'MOVE_TIME'
              Caption = 'Move Time Hrs'
              WordWrap = False
            end
            item
              DataSource = SrcProcessInfo
              DataField = 'SETUPHRS'
              Caption = 'Setup Hrs'
              Expanded = True
              WordWrap = False
            end
            item
              DataSource = SrcProcessInfo
              DataField = 'SETUPHRS2'
              Caption = 'Take Down Hrs'
              WordWrap = False
            end>
          WordWrap = False
        end>
      CaptionWidth = 128
      Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      LineStyleCaption = ovDottedLine
      LineStyleData = ovDottedLine
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 258
    Width = 393
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Left = 213
      Top = 1
      Width = 180
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 7
        Top = 9
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 97
        Top = 9
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 2
        OnClick = btnCancelClick
      end
    end
  end
  object SrcProcessInfo: TDataSource
    DataSet = QryProcessInfo
    Left = 159
    Top = 6
  end
  object QryProcessInfo: TFDQuery
    BeforeOpen = QryProcessInfoBeforeOpen
    OnUpdateRecord = QryProcessInfoUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select s.opno,'
      '       s.opdesc,'
      '       ptoper.opseq, '
      '       :workorder_id as workorder_id, '
      '       a.itemno,'
      '       a.descrip,'
      '       a.descrip2,'
      '       a.class,'
      '       a.rev,'
      '       ptoper.rowid,'
      '       ptoper.overlap_process,'
      '       ptoper.multiples,'
      '       ptoper.uom,'
      '       ptoper.cycletm_disp,'
      '       ptoper.scrap_disp,'
      '       ptoper.move_size,'
      '       ptoper.move_time,'
      '       s.setuphrs,'
      '       s.setuphrs2,'
      '       s.id'
      '  from partno p,'
      '       ptoper,'
      '       sndop s,'
      '       arinvt a '
      ' where p.id = :partno_id'
      '   and p.id = ptoper.partno_id'
      '   and ptoper.sndop_id = s.id'
      '   and s.id = :sndop_id'
      '   and ptoper.id = :ptoper_id'
      '   and p.arinvt_id = a.id'
      '')
    Left = 159
    Top = 23
    ParamData = <
      item
        Name = 'workorder_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'partno_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'sndop_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ptoper_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryProcessInfoOPNO: TStringField
      FieldName = 'OPNO'
      Size = 15
    end
    object QryProcessInfoOPDESC: TStringField
      FieldName = 'OPDESC'
      Size = 60
    end
    object QryProcessInfoOPSEQ: TBCDField
      FieldName = 'OPSEQ'
      Size = 0
    end
    object QryProcessInfoWORKORDER_ID: TFMTBCDField
      FieldName = 'WORKORDER_ID'
      Size = 38
    end
    object QryProcessInfoITEMNO: TStringField
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryProcessInfoDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 100
    end
    object QryProcessInfoCLASS: TStringField
      FieldName = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object QryProcessInfoREV: TStringField
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
    object QryProcessInfoDESCRIP2: TStringField
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object QryProcessInfoOVERLAP_PROCESS: TStringField
      DisplayLabel = 'Overlap'
      FieldName = 'OVERLAP_PROCESS'
      Size = 1
    end
    object QryProcessInfoMULTIPLES: TBCDField
      DisplayLabel = 'Multiples'
      FieldName = 'MULTIPLES'
      Size = 0
    end
    object QryProcessInfoUOM: TStringField
      FieldName = 'UOM'
      Size = 10
    end
    object QryProcessInfoCYCLETM_DISP: TBCDField
      DisplayLabel = 'Cycle Time'
      FieldName = 'CYCLETM_DISP'
    end
    object QryProcessInfoSCRAP_DISP: TBCDField
      DisplayLabel = 'Yield'
      FieldName = 'SCRAP_DISP'
    end
    object QryProcessInfoROWID: TStringField
      FieldName = 'ROWID'
      ReadOnly = True
      Size = 23
    end
    object QryProcessInfoMOVE_SIZE: TFMTBCDField
      FieldName = 'MOVE_SIZE'
      Size = 6
    end
    object QryProcessInfoMOVE_TIME: TFMTBCDField
      FieldName = 'MOVE_TIME'
      Size = 6
    end
    object QryProcessInfoSETUPHRS: TBCDField
      FieldName = 'SETUPHRS'
      Size = 2
    end
    object QryProcessInfoSETUPHRS2: TBCDField
      FieldName = 'SETUPHRS2'
      Size = 2
    end
    object QryProcessInfoID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
  end
  object UpdateSQLPtOper: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into ptoper'
      
        '  (MULTIPLES, UOM, CYCLETM_DISP, SCRAP_DISP, MOVE_SIZE, MOVE_TIM' +
        'E)'
      'values'
      
        '  (:MULTIPLES, :UOM, :CYCLETM_DISP, :SCRAP_DISP, :MOVE_SIZE, :MO' +
        'VE_TIME)')
    ModifySQL.Strings = (
      'update ptoper'
      'set'
      '  MULTIPLES = :MULTIPLES,'
      '  UOM = :UOM,'
      '  CYCLETM_DISP = :CYCLETM_DISP,'
      '  SCRAP_DISP = :SCRAP_DISP,'
      '  MOVE_SIZE = :MOVE_SIZE,'
      '  MOVE_TIME = :MOVE_TIME'
      'where'
      '  ROWID = :OLD_ROWID')
    DeleteSQL.Strings = (
      'delete from ptoper'
      'where'
      '  ROWID = :OLD_ROWID')
    Left = 143
    Top = 53
  end
  object UpdateSQLSndOp: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into sndop'
      '  (SETUPHRS, SETUPHRS2)'
      'values'
      '  (:SETUPHRS, :SETUPHRS2)')
    ModifySQL.Strings = (
      'update sndop'
      'set'
      '  SETUPHRS = :SETUPHRS,'
      '  SETUPHRS2 = :SETUPHRS2'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from sndop'
      'where'
      '  ID = :OLD_ID')
    Left = 176
    Top = 53
  end
end
