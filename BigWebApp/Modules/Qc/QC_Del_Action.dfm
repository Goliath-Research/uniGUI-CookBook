object FrmQCDelAction: TFrmQCDelAction
  Left = 379
  Top = 364
  ClientHeight = 197
  ClientWidth = 420
  Caption = 'Select Action'
  OnShow = UniFormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 9
    Top = 135
    Width = 389
    Height = 8
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 3
    Caption = ''
  end
  object rbtnDelete: TUniRadioButton
    Left = 12
    Top = 12
    Width = 139
    Height = 21
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Delete'
    TabOrder = 0
  end
  object rbtnReplace: TUniRadioButton
    Left = 12
    Top = 42
    Width = 139
    Height = 21
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Replace with'
    TabOrder = 1
  end
  object wwDBLookupComboTeamMember: TUniDBLookupComboBox
    Left = 43
    Top = 71
    Width = 368
    Height = 24
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ListOnlyMode = lmFollowSource
    ListField = 'NAME'
    ListSource = SrcTeamMembers
    KeyField = 'NAME'
    ListFieldIndex = 0
    TabOrder = 2
    Color = clWindow
  end
  object btnOK: TUniButton
    Left = 199
    Top = 151
    Width = 93
    Height = 31
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'OK'
    TabOrder = 4
    OnClick = btnOKClick
  end
  object btnCancel: TUniButton
    Left = 310
    Top = 151
    Width = 92
    Height = 31
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Cancel'
    Cancel = True
    ModalResult = 2
    TabOrder = 6
  end
  object rbtnNoAction: TUniRadioButton
    Left = 12
    Top = 106
    Width = 139
    Height = 21
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'No Action'
    TabOrder = 5
  end
  object QryTeamMembers: TFDQuery
    BeforeOpen = QryTeamMembersBeforeOpen
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       name'
      '  from team_member'
      ' where misc.eplant_filter( eplant_id ) = 1'
      '   and id <> :this_team_member_id'
      '   and decode( :module_name,'
      '              '#39'APQP'#39', used_apqp,'
      '              '#39'PPAP'#39', used_ppap,'
      '              '#39'ECO'#39',  used_eco,'
      '              '#39'CAR'#39',  used_car,'
      '              '#39'DOC'#39',  used_doc,'
      '              '#39'Y'#39') = '#39'Y'#39'  '
      ''
      '              ')
    Left = 42
    Top = 148
    ParamData = <
      item
        Name = 'this_team_member_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'module_name'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryTeamMembersNAME: TStringField
      DisplayLabel = 'Team Member'
      DisplayWidth = 50
      FieldName = 'NAME'
      Size = 50
    end
    object QryTeamMembersID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object SrcTeamMembers: TDataSource
    DataSet = QryTeamMembers
    Left = 112
    Top = 152
  end
end
