object FrmAssyTrackLaborSchedParam: TFrmAssyTrackLaborSchedParam
  Left = 312
  Top = 220
  ClientHeight = 148
  ClientWidth = 369
  Caption = 'Task Message Parameters'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 107
    Width = 369
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 188
      Top = 1
      Width = 180
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 6
        Top = 9
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 95
        Top = 9
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 369
    Height = 107
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object wwDataInspector1: TwwDataInspector
      Left = 1
      Top = 1
      Width = 367
      Height = 105
      DisableThemes = False
      Align = alClient
      TabOrder = 0
      DataSource = wwDataSource1
      Items = <
        item
          DataSource = wwDataSource1
          DataField = 'ASSY1_TA_MESG_DISP_TIME'
          Caption = 'Message Display Time (sec)'
          WordWrap = False
        end
        item
          DataSource = wwDataSource1
          DataField = 'ASSY1_PRINT_SCHED_ON_LOGIN'
          Caption = 'Print Scheduled Task Message'
          PickList.Items.Strings = (
            'Y'
            'N')
          PickList.Style = csDropDownList
          PickList.DisplayAsCheckbox = True
          WordWrap = False
        end>
      DefaultRowHeight = 18
      CaptionWidth = 175
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
  object wwDataSource1: TDataSource
    DataSet = wwTable1
    Left = 17
    Top = 49
  end
  object wwTable1: TFDTable
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    UpdateOptions.UpdateTableName = 'IQSYS2'
    TableName = 'IQSYS2'
    Left = 16
    Top = 67
    object wwTable1ASSY1_TA_MESG_DISP_TIME: TBCDField
      FieldName = 'ASSY1_TA_MESG_DISP_TIME'
      Size = 0
    end
    object wwTable1ASSY1_PRINT_SCHED_ON_LOGIN: TStringField
      FieldName = 'ASSY1_PRINT_SCHED_ON_LOGIN'
      Size = 1
    end
  end
end
