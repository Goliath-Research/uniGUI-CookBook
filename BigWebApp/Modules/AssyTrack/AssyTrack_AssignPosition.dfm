object FrmAssyTrackAssignPosition: TFrmAssyTrackAssignPosition
  Left = 438
  Top = 364
  ClientHeight = 262
  ClientWidth = 395
  Caption = 'Assign Position'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 153
    Width = 395
    Height = 8
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    Caption = ''
  end
  object pnlTop01: TUniPanel
    Left = 0
    Top = 0
    Width = 395
    Height = 153
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    ExplicitTop = 2
    object Panel3: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 393
      Height = 20
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clWhite
      Font.Style = [fsBold]
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = ' Process'
      Color = clAppWorkSpace
    end
    object wwDataInspector1: TwwDataInspector
      Left = 0
      Top = 20
      Width = 395
      Height = 133
      DisableThemes = False
      Align = alClient
      BorderStyle = bsNone
      TabOrder = 2
      DataSource = SrcProcess
      Items = <
        item
          DataSource = SrcProcess
          DataField = 'OPNO'
          Caption = 'Process #'
          Expanded = True
          WordWrap = False
        end
        item
          DataSource = SrcProcess
          DataField = 'OPDESC'
          Caption = 'Process Description'
          WordWrap = False
        end
        item
          DataSource = SrcProcess
          Caption = 'Current'
          ReadOnly = True
          Expanded = True
          Items = <
            item
              DataSource = SrcProcess
              DataField = 'EQNO'
              Caption = 'Work Center #'
              WordWrap = False
            end
            item
              DataSource = SrcProcess
              DataField = 'SEQ'
              Caption = 'Position'
              WordWrap = False
            end>
          WordWrap = False
        end
        item
          DataSource = SrcProcess
          Caption = 'Dispatching To'
          ReadOnly = True
          Expanded = True
          Items = <
            item
              DataSource = SrcProcess
              DataField = 'Dispatch_To_Eqno'
              Caption = 'Work Center #'
              WordWrap = False
            end>
          WordWrap = False
        end>
      DefaultRowHeight = 19
      CaptionWidth = 121
      Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      LineStyleCaption = ovDottedLine
      LineStyleData = ovDottedLine
      ExplicitTop = 22
    end
  end
  object Panel2: TUniPanel
    Tag = 1999
    Left = 0
    Top = 161
    Width = 395
    Height = 20
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    ParentFont = False
    Font.Color = clWhite
    Font.Style = [fsBold]
    TabOrder = 1
    Alignment = taLeftJustify
    Caption = ' Position'
    Color = clAppWorkSpace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 181
    Width = 395
    Height = 40
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object rbAddBottom: TUniRadioButton
      Left = 9
      Top = 17
      Width = 90
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Add to bottom'
      TabOrder = 0
    end
    object rbInsert: TUniRadioButton
      Left = 105
      Top = 19
      Width = 113
      Height = 15
      Hint = ''
      Caption = 'Insert into position'
      TabOrder = 1
    end
    object ePos: TUniEdit
      Left = 224
      Top = 16
      Width = 25
      Height = 21
      Hint = ''
      MaxLength = 3
      Text = '1  '
      TabOrder = 2
    end
  end
  object Panel4: TUniPanel
    Left = 0
    Top = 221
    Width = 395
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 3
    Caption = ''
    object Bevel2: TUniPanel
      Left = 1
      Top = 1
      Width = 393
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object Panel5: TUniPanel
      Left = 209
      Top = 3
      Width = 186
      Height = 38
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
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
      object Cancel: TUniButton
        Left = 99
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
  object UpDown1: TUpDown
    Left = 255
    Top = 197
    Width = 16
    Height = 21
    Min = 1
    Max = 999
    Position = 1
    TabOrder = 5
  end
  object SrcProcess: TDataSource
    DataSet = QryProcess
    Left = 197
    Top = 39
  end
  object QryProcess: TFDQuery
    BeforeOpen = QryProcessBeforeOpen
    OnCalcFields = QryProcessCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select d.id,'
      '       d.sndop_id,'
      '       d.seq,'
      '       d.workorder_id,'
      '       d.partno_id,'
      '       d.work_center_id,'
      '       s.opno,'
      '       s.opdesc,'
      '       w.eqno'
      '  from sndop_dispatch d,'
      '       sndop s,'
      '       work_center w'
      ' where '
      '       d.id = :sndop_dispatch_id'
      '   and d.sndop_id = s.id'
      '   and d.work_center_id = w.id(+)'
      '')
    Left = 197
    Top = 54
    ParamData = <
      item
        Name = 'sndop_dispatch_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryProcessID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryProcessSNDOP_ID: TBCDField
      FieldName = 'SNDOP_ID'
      Size = 0
    end
    object QryProcessSEQ: TBCDField
      FieldName = 'SEQ'
      Size = 0
    end
    object QryProcessWORKORDER_ID: TBCDField
      FieldName = 'WORKORDER_ID'
      Size = 0
    end
    object QryProcessPARTNO_ID: TBCDField
      FieldName = 'PARTNO_ID'
      Size = 0
    end
    object QryProcessWORK_CENTER_ID: TBCDField
      FieldName = 'WORK_CENTER_ID'
      Size = 0
    end
    object QryProcessOPNO: TStringField
      FieldName = 'OPNO'
      Size = 15
    end
    object QryProcessOPDESC: TStringField
      FieldName = 'OPDESC'
      Size = 60
    end
    object QryProcessEQNO: TStringField
      FieldName = 'EQNO'
      FixedChar = True
      Size = 60
    end
    object QryProcessDispatch_To_Eqno: TStringField
      FieldKind = fkCalculated
      FieldName = 'Dispatch_To_Eqno'
      Calculated = True
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnOK')
    SecurityCode = 'FRMASSYTRACKASSIGNPOSITION'
    Left = 236
    Top = 40
  end
end
