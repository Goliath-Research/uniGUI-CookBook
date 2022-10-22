object FrmAssyTrackPickToDispatch: TFrmAssyTrackPickToDispatch
  Left = 357
  Top = 342
  ClientHeight = 414
  ClientWidth = 705
  Caption = 'Select Process'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 321
    Width = 705
    Height = 52
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitTop = 269
    ExplicitWidth = 503
    object Label1: TUniLabel
      Left = 6
      Top = 7
      Width = 45
      Height = 13
      Hint = ''
      Caption = 'Position'
      ParentFont = False
      Font.Style = [fsBold]
      TabOrder = 3
    end
    object rbAddBottom: TUniRadioButton
      Left = 18
      Top = 25
      Width = 90
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Add to bottom'
      TabOrder = 0
    end
    object rbInsert: TUniRadioButton
      Left = 129
      Top = 26
      Width = 108
      Height = 15
      Hint = ''
      Caption = 'Insert into position'
      TabOrder = 1
    end
    object ePos: TUniSpinEdit
      Left = 246
      Top = 24
      Width = 62
      Height = 22
      Hint = ''
      Value = 1
      MaxValue = 999
      MinValue = 1
      TabOrder = 4
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 373
    Width = 705
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitTop = 321
    ExplicitWidth = 503
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 703
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
      ExplicitWidth = 501
    end
    object Panel4: TUniPanel
      Left = 522
      Top = 4
      Width = 182
      Height = 36
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitLeft = 320
      object btnOK: TUniButton
        Left = 8
        Top = 7
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 96
        Top = 7
        Width = 75
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
    Width = 705
    Height = 321
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    ExplicitWidth = 503
    ExplicitHeight = 269
    object Bevel2: TUniPanel
      Left = 1
      Top = 24
      Width = 18
      Height = 296
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 3
      Caption = ''
      ExplicitHeight = 244
    end
    object IQSearch1: TIQUniGridControl
      Left = 19
      Top = 24
      Width = 685
      Height = 296
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 468
      IQComponents.Grid.Height = 210
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcSndopDispatch
      IQComponents.Grid.Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgMultiSelect]
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
      IQComponents.Navigator.DataSource = SrcSndopDispatch
      IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 468
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 210
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitLeft = 266
      IQComponents.HiddenPanel.ExplicitHeight = 158
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitWidth = 475
      IQComponents.FormTab.ExplicitHeight = 187
      DataSource = SrcSndopDispatch
      Columns = <
        item
          FieldName = 'OPNO'
          Title.Caption = 'Process #'
          Width = 105
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'OPDESC'
          Title.Caption = 'Process Description'
          Width = 259
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'WORKORDER_ID'
          Title.Caption = 'WO #'
          Width = 98
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MFGNO'
          Title.Caption = 'Mfg #'
          Width = 133
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'STANDARD_DESCRIP'
          Title.Caption = 'Mfg Description'
          Width = 196
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ITEMNO'
          Title.Caption = 'Item #'
          Width = 175
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Item Description'
          Width = 196
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP2'
          Title.Caption = 'Ext Description'
          Width = 210
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REV'
          Title.Caption = 'Rev'
          Width = 35
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CLASS'
          Title.Caption = 'Class'
          Width = 35
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'HRS_TO_GO'
          Title.Caption = 'Hours To Go'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PARTS_TO_GO'
          Title.Caption = 'Parts To Go'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'START_TIME'
          Title.Caption = 'Must Start'
          Width = 126
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PROD_START_TIME'
          Title.Caption = 'Projected Start Time'
          Width = 126
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REL_DATE'
          Title.Caption = 'Release Date'
          Width = 126
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'JOB_SEQ'
          Title.Caption = 'Job Sequence'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end>
      ExplicitWidth = 483
      ExplicitHeight = 244
      Marker = 0
    end
    object Panel5: TUniPanel
      Left = 1
      Top = 1
      Width = 703
      Height = 23
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = ''
      ExplicitWidth = 501
      object Label2: TUniLabel
        Left = 0
        Top = 6
        Width = 135
        Height = 13
        Hint = ''
        Caption = ' Unscheduled Processes'
        ParentFont = False
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
  end
  object SrcSndopDispatch: TDataSource
    DataSet = QrySndopDispatch
    Left = 64
    Top = 144
  end
  object QrySndopDispatch: TFDQuery
    BeforeOpen = QrySndopDispatchBeforeOpen
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select /*+ ORDERED */'
      '       d.id,'
      '       s.opno,'
      '       s.opdesc,'
      '       d.sndop_id,'
      '       d.workorder_id,'
      '       p.standard_id,'
      '       bom.mfgno,  '
      '       bom.descrip as standard_descrip,'
      '       p.arinvt_id,'
      '       a.itemno,'
      '       a.descrip, '
      '       a.descrip2, '
      '       a.rev,'
      '       a.class,'
      
        '       assy1_sched.get_process_data( d.id, '#39'HRS_TO_GO'#39' ) as hrs_' +
        'to_go,'
      
        '       assy1_sched.get_process_data( d.id, '#39'PARTS_TO_GO'#39' ) as pa' +
        'rts_to_go,'
      ''
      
        '       (select min(r.rel_date) from ptorder pt, ptorder_rel r wh' +
        'ere pt.workorder_id = d.workorder_id and pt.id = r.ptorder_id(+)' +
        ') as rel_date,'
      '       d.prod_start_time,'
      '       d.start_time,'
      
        '       (select min(r.job_seq) from ptorder pt, ptorder_rel r whe' +
        're pt.workorder_id = d.workorder_id and pt.id = r.ptorder_id(+))' +
        ' as job_seq'
      '       '
      '  from'
      '       sndop_dispatch d,'
      '       sndop s,'
      '       partno p,'
      '       standard bom,'
      '       arinvt a'
      '       '
      ' where'
      '       -- not scheduled'
      '       d.work_center_id is null'
      '   and d.sndop_id = s.id'
      
        '   and (select id from cntr_sched where sndop_dispatch_id = d.id' +
        ') is null'
      ''
      
        '   and assy1_misc.sndop_work_center_associated( s.id, :work_cent' +
        'er_id ) = 1'
      ''
      '       -- get standard and arinvt'
      '   and d.partno_id = p.id'
      '   and p.standard_id = bom.id'
      '   and p.arinvt_id = a.id'
      '   ')
    Left = 63
    Top = 186
    ParamData = <
      item
        Name = 'work_center_id'
        DataType = ftBCD
        ParamType = ptInput
        Value = Null
      end>
    object QrySndopDispatchOPNO: TStringField
      DisplayLabel = 'Process #'
      DisplayWidth = 15
      FieldName = 'OPNO'
      Origin = 's.opno'
      Size = 15
    end
    object QrySndopDispatchOPDESC: TStringField
      DisplayLabel = 'Process Description'
      DisplayWidth = 37
      FieldName = 'OPDESC'
      Origin = 's.opdesc'
      Size = 60
    end
    object QrySndopDispatchWORKORDER_ID: TBCDField
      DisplayLabel = 'WO #'
      DisplayWidth = 14
      FieldName = 'WORKORDER_ID'
      Origin = 'd.workorder_id'
      Size = 0
    end
    object QrySndopDispatchMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 19
      FieldName = 'MFGNO'
      Origin = 'bom.mfgno'
      Size = 50
    end
    object QrySndopDispatchSTANDARD_DESCRIP: TStringField
      DisplayLabel = 'Mfg Description'
      DisplayWidth = 28
      FieldName = 'STANDARD_DESCRIP'
      Origin = 'bom.descrip'
      Size = 50
    end
    object QrySndopDispatchITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'a.itemno'
      FixedChar = True
      Size = 50
    end
    object QrySndopDispatchDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 28
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      Size = 100
    end
    object QrySndopDispatchDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Origin = 'a.descrip2'
      Size = 100
    end
    object QrySndopDispatchCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 5
      FieldName = 'CLASS'
      Origin = 'a.class'
      FixedChar = True
      Size = 2
    end
    object QrySndopDispatchREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 5
      FieldName = 'REV'
      Origin = 'a.rev'
      FixedChar = True
      Size = 15
    end
    object QrySndopDispatchHRS_TO_GO: TFMTBCDField
      DisplayLabel = 'Hours To Go'
      DisplayWidth = 10
      FieldName = 'HRS_TO_GO'
      Origin = 'assy1_sched.get_process_data( d.id, '#39'HRS_TO_GO'#39' )'
      DisplayFormat = '########0.000000'
      Size = 38
    end
    object QrySndopDispatchPARTS_TO_GO: TFMTBCDField
      DisplayLabel = 'Parts To Go'
      DisplayWidth = 10
      FieldName = 'PARTS_TO_GO'
      Origin = 'assy1_sched.get_process_data( d.id, '#39'PARTS_TO_GO'#39' ) '
      Size = 38
    end
    object QrySndopDispatchSNDOP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SNDOP_ID'
      Origin = 'd.sndop_id'
      Visible = False
      Size = 0
    end
    object QrySndopDispatchID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'd.id'
      Visible = False
      Size = 0
    end
    object QrySndopDispatchSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QrySndopDispatchARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QrySndopDispatchREL_DATE: TDateTimeField
      DisplayLabel = 'Release Date'
      FieldName = 'REL_DATE'
      Origin = 
        '(select min(r.rel_date) from ptorder pt, ptorder_rel r where pt.' +
        'workorder_id = d.workorder_id and pt.id = r.ptorder_id(+))'
    end
    object QrySndopDispatchPROD_START_TIME: TDateTimeField
      DisplayLabel = 'Projected Start Time'
      FieldName = 'PROD_START_TIME'
      Origin = 'd.prod_start_time'
    end
    object QrySndopDispatchSTART_TIME: TDateTimeField
      DisplayLabel = 'Must Start'
      FieldName = 'START_TIME'
      Origin = 'd.start_time'
    end
    object QrySndopDispatchJOB_SEQ: TFMTBCDField
      DisplayLabel = 'Job Sequence'
      FieldName = 'JOB_SEQ'
      Origin = 
        '(select min(r.job_seq) from ptorder pt, ptorder_rel r where pt.w' +
        'orkorder_id = d.workorder_id and pt.id = r.ptorder_id(+)) '
      Size = 38
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 171
    Top = 160
    object JumpToWorkOrder1: TUniMenuItem
      Caption = 'Jump To Work Order'
      OnClick = JumpToWorkOrder1Click
    end
    object JumpToBOM1: TUniMenuItem
      Caption = 'Jump To BOM'
      OnClick = JumpToBOM1Click
    end
    object JumpToInventory1: TUniMenuItem
      Caption = 'Jump To Inventory'
      OnClick = JumpToInventory1Click
    end
  end
  object IQJumpInv: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = SrcSndopDispatch
    JumpTo = jtInventory
    Left = 171
    Top = 184
  end
  object IQJumpBOM: TIQWebJump
    DataField = 'STANDARD_ID'
    DataSource = SrcSndopDispatch
    JumpTo = jtBom
    Left = 201
    Top = 184
  end
  object IQJumpWO: TIQWebJump
    DataField = 'WORKORDER_ID'
    DataSource = SrcSndopDispatch
    JumpTo = jtWorkOrder
    Left = 230
    Top = 184
  end
  object MainMenu1: TUniMainMenu
    Left = 128
    Top = 120
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
    ModuleName = 'FrmAssyTrackPickToDispatch'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195470 $'
    BuildVersion = '176554'
    Left = 164
    Top = 122
  end
end
