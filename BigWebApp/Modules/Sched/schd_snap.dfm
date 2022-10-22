object FrmSched_Snap: TFrmSched_Snap
  Left = 158
  Top = 174
  HelpContext = 1093183
  ClientHeight = 229
  ClientWidth = 337
  Caption = 'Snap to Last Job'
  OnShow = FormShow
  Constraints.MinHeight = 245
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  DesignSize = (
    337
    229)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 8
    Top = 72
    Width = 117
    Height = 13
    Hint = ''
    Caption = 'Work Center Specific'
    ParentFont = False
    Font.Style = [fsBold]
    TabOrder = 7
  end
  object Label2: TUniLabel
    Left = 26
    Top = 92
    Width = 72
    Height = 13
    Hint = ''
    Caption = 'Work Center #'
    TabOrder = 8
  end
  object Label3: TUniLabel
    Left = 26
    Top = 116
    Width = 53
    Height = 13
    Hint = ''
    Caption = 'Description'
    TabOrder = 9
  end
  object Label4: TUniLabel
    Left = 26
    Top = 140
    Width = 80
    Height = 13
    Hint = ''
    Caption = 'Snap to Last Job'
    TabOrder = 10
  end
  object Label5: TUniLabel
    Left = 8
    Top = 8
    Width = 87
    Height = 13
    Hint = ''
    Caption = 'System Default'
    ParentFont = False
    Font.Style = [fsBold]
    TabOrder = 11
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 189
    Width = 337
    Height = 40
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 335
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object pnlButtons: TUniPanel
      Left = 115
      Top = 4
      Width = 221
      Height = 35
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 5
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 114
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        TabOrder = 2
        OnClick = btnCancelClick
      end
    end
  end
  object chkSysDefault: TUniDBCheckBox
    Left = 24
    Top = 24
    Width = 104
    Height = 17
    Hint = ''
    DataField = 'SCHED_SNAP_TO_LAST'
    DataSource = SrcParams
    ValueChecked = 'Y'
    ValueUnchecked = 'N'
    Caption = 'Snap to Last Job'
    TabOrder = 1
    OnClick = chkSysDefaultClick
  end
  object DBEdit1: TUniDBEdit
    Left = 128
    Top = 88
    Width = 199
    Height = 21
    Hint = ''
    DataField = 'EQNO'
    DataSource = SchdDM.SrcWork_Center
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Color = clBtnFace
  end
  object DBEdit2: TUniDBEdit
    Left = 128
    Top = 112
    Width = 199
    Height = 21
    Hint = ''
    DataField = 'CNTR_DESC'
    DataSource = SchdDM.SrcWork_Center
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Color = clBtnFace
  end
  object wwDBComboBoxSnap: TUniDBComboBox
    Left = 128
    Top = 136
    Width = 199
    Height = 21
    Hint = ''
    Anchors = [akLeft, akTop, akRight]
    DataField = 'SNAP_TO_LAST'
    DataSource = SchdDM.SrcWork_Center
    Style = csDropDownList
    Items.Strings = (
      'System Default'#9'0'
      'No'#9'1'
      'Yes'#9'2')
    TabOrder = 4
    OnCloseUp = wwDBComboBoxSnapCloseUp
  end
  object dbchkSystemJIT: TUniDBCheckBox
    Left = 24
    Top = 40
    Width = 104
    Height = 17
    Hint = 
      'Just in Time Scheduling: force start date = must start date minu' +
      's safety lead time'
    ShowHint = True
    ParentShowHint = False
    DataField = 'SCHED_JIT'
    DataSource = SrcParams
    ValueChecked = 'Y'
    ValueUnchecked = 'N'
    Caption = 'JIT Scheduling'
    TabOrder = 5
    OnClick = dbchkSystemJITClick
  end
  object dbchkWorCenterJIT: TUniDBCheckBox
    Left = 128
    Top = 162
    Width = 102
    Height = 17
    Hint = 
      'Just in Time Scheduling: force start date = must start date minu' +
      's safety lead time'
    ShowHint = True
    ParentShowHint = False
    DataField = 'SCHED_JIT'
    DataSource = SchdDM.SrcWork_Center
    ValueChecked = 'Y'
    ValueUnchecked = 'N'
    Caption = 'JIT Scheduling'
    TabOrder = 6
  end
  object SrcParams: TDataSource
    DataSet = TblParams
    Left = 238
    Top = 14
  end
  object TblParams: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PARAMS'
    TableName = 'PARAMS'
    Left = 238
    Top = 34
    object TblParamsSCHED_JIT: TStringField
      FieldName = 'SCHED_JIT'
      FixedChar = True
      Size = 1
    end
    object TblParamsSCHED_SNAP_TO_LAST: TStringField
      FieldName = 'SCHED_SNAP_TO_LAST'
      FixedChar = True
      Size = 1
    end
    object TblParamsASSY1_SNAP_TO_LAST: TStringField
      FieldName = 'ASSY1_SNAP_TO_LAST'
      Visible = False
      Size = 1
    end
    object TblParamsID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
  end
end
