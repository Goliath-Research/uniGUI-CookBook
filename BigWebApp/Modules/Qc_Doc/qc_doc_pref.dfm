object FrmQCDocPreferences: TFrmQCDocPreferences
  Left = 226
  Top = 159
  HelpContext = 10792
  ClientHeight = 333
  ClientWidth = 394
  Caption = 'Preferences'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object btnOK: TUniButton
    Left = 185
    Top = 297
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'OK'
    TabOrder = 0
    OnClick = btnOKClick
  end
  object btnCancel: TUniButton
    Left = 288
    Top = 297
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    Cancel = True
    ModalResult = 2
    TabOrder = 1
  end
  object GroupBox1: TUniGroupBox
    Left = 6
    Top = 2
    Width = 381
    Height = 120
    Hint = ''
    Caption = '  Show  '
    TabOrder = 2
    object rbtnMyDocs: TUniRadioButton
      Left = 18
      Top = 20
      Width = 113
      Height = 17
      Hint = ''
      Caption = 'Only my documents'
      TabOrder = 0
    end
    object rbtnAllDocs: TUniRadioButton
      Left = 18
      Top = 44
      Width = 113
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'All documents'
      TabOrder = 1
    end
    object rbtnUserDocs: TUniRadioButton
      Left = 18
      Top = 67
      Width = 196
      Height = 17
      Hint = ''
      Caption = 'Other team member documents'
      TabOrder = 2
    end
    object wwcomboMember: TUniDBLookupComboBox
      Left = 37
      Top = 87
      Width = 221
      Height = 21
      Hint = ''
      ListFieldIndex = 0
      TabOrder = 3
      Color = clWindow
    end
  end
  object gboxWorkPath: TUniGroupBox
    Left = 6
    Top = 125
    Width = 381
    Height = 58
    Hint = ''
    Caption = '  My working directory  '
    TabOrder = 3
    DesignSize = (
      381
      58)
    object sbtnBrowse: TUniSpeedButton
      Left = 350
      Top = 21
      Width = 22
      Height = 22
      Hint = 'Browse'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDFFFFFFFFFFDDDDD00000000
        00DDDDDD7777777777FDDDDD0FFFFFFFF0DDDDDD7FDDDDDDD7FDDDDD0FFFFFFF
        F0DDDDDD7FDDDDDDD7FDDDDD0FF80FFFF0DDDDDD7FD87FDDD7FDDDDD0F800FFF
        F0DDDDDD7F877FDDD7FDDDDD080B0FFFF0DDDDDD787F7DDDD7FDDDDD00B0FFFF
        F0DDDDDD77F7DDDDD7FDDDDD0B0FFFFFF0DDDDDD7F7DDDDDD7FDDDD0B0FFFFFF
        F0DDDDD7F7DDDDDDD7FDDD0B0FFFFFFFF0DDDD7F7FDDDDDDD7FDD0B07FFFFFFF
        F0DDD7F77FFFFFFFF7FDD90D0000000000DDD77D7777777777DDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      Caption = ''
      Anchors = [akTop, akRight]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnBrowseClick
    end
    object dbeWorkPath: TUniDBEdit
      Left = 15
      Top = 21
      Width = 331
      Height = 21
      Hint = ''
      DataField = 'WORK_PATH'
      DataSource = SrcTeam_Member
      TabOrder = 0
    end
  end
  object gboxGeneral: TUniGroupBox
    Left = 7
    Top = 186
    Width = 381
    Height = 100
    Hint = ''
    Caption = ' General '
    TabOrder = 4
    DesignSize = (
      381
      100)
    object dbchkManadatoryChangeDesc: TUniDBCheckBox
      Left = 15
      Top = 21
      Width = 356
      Height = 17
      Hint = ''
      DataField = 'DOC_CHANGE_DESC_MANDATORY'
      DataSource = SrcParams
      ValueChecked = 'Y'
      ValueUnchecked = 'N'
      Caption = 'Mandatory "What'#39's Changed" Description'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object dbchkHideUNCPath: TUniDBCheckBox
      Left = 15
      Top = 40
      Width = 290
      Height = 17
      Hint = ''
      DataField = 'DOC_HIDE_UNC_PATH'
      DataSource = SrcParams
      ValueChecked = 'Y'
      ValueUnchecked = 'N'
      Caption = 'Do Not Show Document UNC Path in Module Ext Docs'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object dbchkShow6UserFields: TUniDBCheckBox
      Left = 15
      Top = 59
      Width = 298
      Height = 17
      Hint = ''
      DataField = 'EXT_DOC_SHOW_6USER_FIELDS'
      DataSource = SrcParams
      ValueChecked = 'Y'
      ValueUnchecked = 'N'
      Caption = 'Show First Six User Fields in Module External Documents'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object chkSortDocNum: TUniCheckBox
      Left = 15
      Top = 78
      Width = 158
      Height = 17
      Hint = ''
      Caption = 'Sort Doc # Numerically'
      TabOrder = 3
    end
  end
  object wwQryTeamMember: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, name from team_member order by name')
    Left = 277
    Top = 76
    object wwQryTeamMemberNAME: TStringField
      DisplayLabel = 'Member Name'
      DisplayWidth = 30
      FieldName = 'NAME'
      Origin = 'IQ.TEAM_MEMBER.NAME'
      Size = 50
    end
    object wwQryTeamMemberID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.TEAM_MEMBER.ID'
      Visible = False
      Size = 0
    end
  end
  object SrcTeam_Member: TDataSource
    DataSet = TblTeam_Member
    Left = 325
    Top = 12
  end
  object TblTeam_Member: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'TEAM_MEMBER'
    TableName = 'TEAM_MEMBER'
    Left = 338
    Top = 12
  end
  object SrcParams: TDataSource
    DataSet = TblParams
    Left = 345
    Top = 200
  end
  object TblParams: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PARAMS'
    TableName = 'PARAMS'
    Left = 345
    Top = 211
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnOK'
      'dbchkManadatoryChangeDesc')
    SecurityCode = 'FRMQCDOCPREFERENCES'
    Left = 20
    Top = 296
  end
end
