object FrmInvUserTeam: TFrmInvUserTeam
  Left = 0
  Top = 0
  ClientHeight = 441
  ClientWidth = 852
  Caption = 'Work Team Users'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 540
    Top = 0
    Width = 4
    Height = 441
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 540
    Height = 441
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    Caption = ''
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 538
      Height = 439
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 321
      IQComponents.Grid.Height = 353
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcUsers
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
      IQComponents.Navigator.DataSource = SrcUsers
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 321
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 353
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcUsers
      Columns = <
        item
          FieldName = 'USER_NAME'
          Title.Caption = 'User Name'
          Width = 154
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CODE'
          Title.Caption = 'Team Code'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Team Description'
          Width = 210
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TYPE'
          Title.Caption = 'Team Type'
          Width = 119
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_NAME'
          Title.Caption = 'EPlant'
          Width = 308
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DIVISION_NAME'
          Title.Caption = 'Division'
          Width = 175
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'RF_TEAM_ID'
          Title.Caption = 'RF_TEAM_ID'
          Width = 112
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_ID'
          Title.Caption = 'EPLANT_ID'
          Width = 112
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
      object wwDBComboDlgTeamCode: TUniEdit
        Left = 72
        Top = 64
        Width = 121
        Height = 21
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 2
        ReadOnly = True
      end
    end
  end
  object Panel2: TUniPanel
    Left = 544
    Top = 0
    Width = 308
    Height = 441
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object wwDBGridZone: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 306
      Height = 439
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 89
      IQComponents.Grid.Height = 353
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcTeamZone
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
      IQComponents.Navigator.DataSource = SrcTeamZone
      IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 89
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 353
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitHeight = 325
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitHeight = 354
      DataSource = SrcTeamZone
      Columns = <
        item
          FieldName = 'ZONE_CODE'
          Title.Caption = 'Zone Code'
          Width = 119
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ZONE_DESCRIP'
          Title.Caption = 'Zone Description'
          Width = 189
          CheckBoxField.FieldValues = 'true;false'
        end>
      ExplicitTop = 29
      ExplicitHeight = 411
      Marker = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 32
    Top = 192
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
    ModuleName = 'FrmInvUserTeam'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 194060 $'
    BuildVersion = '176554'
    Left = 64
    Top = 192
  end
  object SrcUsers: TDataSource
    DataSet = QryUsers
    Left = 28
    Top = 64
  end
  object QryUsers: TFDQuery
    CachedUpdates = True
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select s.user_name, '
      
        '       decode( e.id, null, null, '#39'['#39' ||e.id || '#39'] '#39' || e.name) a' +
        's eplant_name,'
      '       s.rf_team_id,'
      '       t.code,'
      '       t.descrip,'
      '       decode( t.type,'
      '               '#39'CC'#39', '#39'Cycle Counting'#39','
      '               '#39'DR'#39', '#39'RF Directed'#39','
      '               '#39'TI'#39', '#39'Task Interleaving'#39','
      '               '#39'PK'#39', '#39'Picking'#39','
      '               '#39'RC'#39', '#39'Receiving'#39','
      '               '#39'ST'#39', '#39'Material Staging'#39','
      '               null ) as type,'
      '       s.eplant_id,'
      '       d.name as division_name'
      '  from '
      '       s_user_general s,'
      '       eplant e,'
      '       rf_team t,'
      '       division d'
      ' where '
      '       s.eplant_id = e.id(+)'
      '   and s.rf_team_id = t.id(+)'
      '   and t.division_id = d.id(+)'
      '')
    Left = 28
    Top = 92
    object QryUsersUSER_NAME: TStringField
      DisplayLabel = 'User Name'
      DisplayWidth = 22
      FieldName = 'USER_NAME'
      Origin = 's.user_name'
      Size = 35
    end
    object QryUsersCODE: TStringField
      DisplayLabel = 'Team Code'
      DisplayWidth = 12
      FieldName = 'CODE'
      Origin = 't.code'
      Size = 10
    end
    object QryUsersDESCRIP: TStringField
      DisplayLabel = 'Team Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 't.descrip'
      Size = 50
    end
    object QryUsersTYPE: TStringField
      DisplayLabel = 'Team Type'
      DisplayWidth = 17
      FieldName = 'TYPE'
      Origin = 
        'decode( t.type,'#39'CC'#39', '#39'Cycle Counting'#39','#39'DR'#39', '#39'RF Directed'#39','#39'TI'#39', ' +
        #39'Task Interleaving'#39','#39'PK'#39', '#39'Picking'#39','#39'RC'#39', '#39'Receiving'#39','#39'ST'#39', '#39'Mat' +
        'erial Staging'#39',null )'
      Size = 17
    end
    object QryUsersEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 44
      FieldName = 'EPLANT_NAME'
      Origin = 'e.name'
      Size = 73
    end
    object QryUsersDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 25
      FieldName = 'DIVISION_NAME'
      Origin = 'd.name'
      Size = 25
    end
    object QryUsersRF_TEAM_ID: TBCDField
      AutoGenerateValue = arDefault
      DisplayWidth = 16
      FieldName = 'RF_TEAM_ID'
      ProviderFlags = []
      Precision = 15
      Size = 0
    end
    object QryUsersEPLANT_ID: TBCDField
      AutoGenerateValue = arDefault
      DisplayWidth = 16
      FieldName = 'EPLANT_ID'
      ProviderFlags = []
      Precision = 15
      Size = 0
    end
  end
  object SrcTeamZone: TDataSource
    DataSet = QryTeamZone
    Left = 604
    Top = 248
  end
  object QryTeamZone: TFDQuery
    CachedUpdates = True
    MasterSource = SrcUsers
    MasterFields = 'RF_TEAM_ID'
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select a.id as id,'
      '       a.rf_team_id as rf_team_id,'
      '       a.inv_zone_id as inv_zone_id,'
      '       b.code as zone_code,'
      '       b.descrip as zone_descrip'
      '  from rf_team_zone a,'
      '       inv_zone b'
      ' where a.rf_team_id = :rf_team_id'
      '   and a.inv_zone_id = b.id'
      ' order by  b.code ')
    Left = 604
    Top = 180
    ParamData = <
      item
        Name = 'RF_TEAM_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryTeamZoneZONE_CODE: TStringField
      DisplayLabel = 'Zone Code'
      DisplayWidth = 17
      FieldName = 'ZONE_CODE'
      Origin = 'b.code'
      Size = 25
    end
    object QryTeamZoneZONE_DESCRIP: TStringField
      DisplayLabel = 'Zone Description'
      DisplayWidth = 27
      FieldName = 'ZONE_DESCRIP'
      Origin = 'b.descrip'
      Size = 100
    end
    object QryTeamZoneID: TBCDField
      FieldName = 'ID'
      Origin = 'USER_NAME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryTeamZoneRF_TEAM_ID: TBCDField
      FieldName = 'RF_TEAM_ID'
      Origin = 'CODE'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryTeamZoneINV_ZONE_ID: TBCDField
      FieldName = 'INV_ZONE_ID'
      Origin = 'EPLANT_NAME'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object PkRFTeam: TIQWebHpick
    BeforeOpen = PkRFTeamBeforeOpen
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select t.id as id, '
      '       t.code as code,'
      '       t.descrip as descrip,'
      '       case t.type '
      '         when '#39'CC'#39' then '#39'Cycle Counting'#39
      '         when '#39'DR'#39' then '#39'RF Directed'#39
      '         when '#39'TI'#39' then '#39'Task Interleaving'#39
      '         when '#39'PK'#39' then '#39'Picking'#39
      '         when '#39'RC'#39' then '#39'Receiving'#39
      '         when '#39'ST'#39' then '#39'Material Staging'#39
      '       end as type,'
      '       eplant.name as eplant_name,'
      '       div.name as division_name'
      '  from rf_team t,'
      '       eplant,'
      '       division div'
      ' where t.eplant_id = eplant.id(+)'
      '   and t.division_id = div.id(+)   '
      '   and nvl(t.eplant_id,0) = nvl(:eplant_id,0)'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 164
    Top = 96
    ParamData = <
      item
        Name = 'eplant_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkRFTeamID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
    object PkRFTeamCODE: TStringField
      DisplayLabel = 'Team Code'
      FieldName = 'CODE'
      Size = 10
    end
    object PkRFTeamDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkRFTeamTYPE: TStringField
      DisplayLabel = 'Team Type'
      FieldName = 'TYPE'
      Size = 17
    end
    object PkRFTeamEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 20
      FieldName = 'EPLANT_NAME'
      Size = 30
    end
    object PkRFTeamDIVISION_NAME: TStringField
      DisplayLabel = 'Division Name'
      FieldName = 'DIVISION_NAME'
      Size = 25
    end
  end
end
