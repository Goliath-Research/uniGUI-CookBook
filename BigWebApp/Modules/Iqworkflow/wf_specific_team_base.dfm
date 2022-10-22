object FrmWorkflowSpecificTeamBase: TFrmWorkflowSpecificTeamBase
  Left = 307
  Top = 247
  ClientHeight = 269
  ClientWidth = 566
  Caption = 'Approvers Team'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 566
    Height = 269
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 349
    IQComponents.Grid.Height = 183
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcTeam
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
    IQComponents.Navigator.DataSource = SrcTeam
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 349
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 183
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcTeam
    Columns = <
      item
        FieldName = 'NAME'
        Title.Caption = 'Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TITLE'
        Title.Caption = 'Title'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EMAIL'
        Title.Caption = 'Email'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'USERID'
        Title.Caption = 'User ID'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPLANT_ID'
        Title.Caption = 'EPlant ID'
        Width = 64
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object wwemail: TUniEdit
    Left = 78
    Top = 142
    Width = 120
    Height = 21
    Hint = ''
    Text = ''
    ParentFont = False
    TabOrder = 1
    OnDblClick = wwemailDblClick
  end
  object wwUsers: TUniEdit
    Left = 78
    Top = 174
    Width = 120
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 2
  end
  object MainMenu1: TUniMainMenu
    Left = 300
    Top = 124
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        ShortCut = 112
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object SrcTeam: TDataSource
    DataSet = TblTeam
    Left = 24
    Top = 80
  end
  object TblTeam: TFDTable
    BeforeOpen = TblTeamBeforeOpen
    BeforePost = TblTeamBeforePost
    BeforeDelete = TblTeamBeforeDelete
    OnNewRecord = TblTeamNewRecord
    Filtered = True
    IndexFieldNames = 'ID;NAME'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'TEAM_MEMBER'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'TEAM_MEMBER'
    Left = 16
    Top = 143
    object TblTeamNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 20
      FieldName = 'NAME'
      Required = True
      Size = 50
    end
    object TblTeamTITLE: TStringField
      DisplayLabel = 'Title'
      DisplayWidth = 20
      FieldName = 'TITLE'
      Size = 40
    end
    object TblTeamEMAIL: TStringField
      DisplayLabel = 'Email'
      DisplayWidth = 20
      FieldName = 'EMAIL'
      Size = 250
    end
    object TblTeamUSERID: TStringField
      DisplayLabel = 'User ID'
      DisplayWidth = 17
      FieldName = 'USERID'
      Required = True
      OnChange = TblTeamUSERIDChange
      Size = 35
    end
    object TblTeamEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      ReadOnly = True
      Size = 0
    end
    object TblTeamID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object TblTeamUSED_PO: TStringField
      FieldName = 'USED_PO'
      Visible = False
      Size = 1
    end
    object TblTeamUSED_DOC: TStringField
      FieldName = 'USED_DOC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object TblTeamUSED_CAR: TStringField
      FieldName = 'USED_CAR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object TblTeamUSED_APQP: TStringField
      FieldName = 'USED_APQP'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object TblTeamUSED_ECO: TStringField
      FieldName = 'USED_ECO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object TblTeamUSED_PPAP: TStringField
      FieldName = 'USED_PPAP'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object TblTeamUSED_CAPA: TStringField
      FieldName = 'USED_CAPA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object TblTeamUSED_DEV: TStringField
      FieldName = 'USED_DEV'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object TblTeamUSED_PROD_PQ: TStringField
      FieldName = 'USED_PROD_PQ'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object TblTeamUSED_PROC_PQ: TStringField
      FieldName = 'USED_PROC_PQ'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object TblTeamUSED_MRB: TStringField
      FieldName = 'USED_MRB'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object TblTeamUSED_CRM: TStringField
      FieldName = 'USED_CRM'
      Visible = False
      Size = 1
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 270
    Top = 124
    object EditeMailAddress1: TUniMenuItem
      Caption = 'Edit Email Address'
      OnClick = EditeMailAddress1Click
    end
  end
  object PkSearch: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as id,  '
      '       name as name,'
      '       title as title,'
      '       email as email'
      '  from team_member'
      ' where used_po = '#39'Y'#39
      '   and misc.eplant_filter_include_nulls( eplant_id ) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 64
    Top = 208
    object PkSearchID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.TEAM_MEMBER.ID'
      Visible = False
      Size = 0
    end
    object PkSearchNAME: TStringField
      DisplayLabel = 'Name'
      FieldName = 'NAME'
      Origin = 'IQ.TEAM_MEMBER.NAME'
      Size = 50
    end
    object PkSearchTITLE: TStringField
      DisplayLabel = 'Title'
      FieldName = 'TITLE'
      Origin = 'IQ.TEAM_MEMBER.TITLE'
      Size = 40
    end
    object PkSearchEMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Origin = 'IQ.TEAM_MEMBER.EMAIL'
      Size = 250
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'SpecificWorkflowTeam'
    Version = 'Feature unsupported'
    ChangeListNumber = '$Change: 191386 $'
    Left = 136
    Top = 32
  end
  object PkUsers: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select username'
      'from v_iqusers_ex')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 240
    Top = 124
    object PkUsersUSERNAME: TStringField
      DisplayLabel = 'User name'
      FieldName = 'USERNAME'
      Size = 30
    end
  end
end
