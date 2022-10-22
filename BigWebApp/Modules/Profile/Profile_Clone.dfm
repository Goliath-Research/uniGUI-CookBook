object FrmCloneList: TFrmCloneList
  Left = 672
  Top = 266
  ClientHeight = 342
  ClientWidth = 386
  Caption = 'Clone Profile of '
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 308
    Width = 386
    Height = 34
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      386
      34)
    object Panel3: TUniPanel
      Left = 168
      Top = 0
      Width = 226
      Height = 34
      Hint = ''
      Anchors = [akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnCancel: TUniButton
        Left = 112
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
      object btnOK: TUniButton
        Left = 9
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 2
        OnClick = btnOKClick
      end
    end
  end
  object GroupBox1: TUniGroupBox
    Left = 0
    Top = 0
    Width = 386
    Height = 308
    Hint = ''
    Caption = ' Select Target User(s)  '
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object Panel2: TUniPanel
      Left = 2
      Top = 15
      Width = 382
      Height = 291
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object IQSearch1: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 380
        Height = 289
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 163
        IQComponents.Grid.Height = 203
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = wwSrcAllUsers
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
        IQComponents.Navigator.DataSource = wwSrcAllUsers
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 163
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 203
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = wwSrcAllUsers
        Columns = <
          item
            FieldName = 'USERNAME'
            Title.Caption = 'User Name'
            Width = 210
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EPLANT_NAME'
            Title.Caption = 'Eplant Name'
            Width = 210
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
    end
  end
  object wwSrcAllUsers: TDataSource
    DataSet = wwQryAllUsers
    Left = 54
    Top = 286
  end
  object wwQryAllUsers: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.username, e.name as eplant_name'
      '  from v_iqusers_ex  a,'
      '       s_user_general s,'
      '       eplant e,'
      '       dba_users u,      '
      '       (select distinct grantee'
      '          from dba_role_privs '
      '         where granted_role = '#39'DBA'#39' ) x'
      'where RTrim(a.username) = RTrim(s.user_name(+))'
      '   and a.username = u.username'
      '   and u.username = x.grantee(+)'
      '   and not a.username in ( '#39'SYS'#39', '#39'SYSTEM'#39' )'
      '   and s.eplant_id = e.id(+)')
    Left = 21
    Top = 286
    object wwQryAllUsersUSERNAME: TStringField
      DisplayLabel = 'User Name'
      DisplayWidth = 30
      FieldName = 'USERNAME'
      Origin = 'username'
      Size = 30
    end
    object wwQryAllUsersEPLANT_NAME: TStringField
      DisplayLabel = 'Eplant Name'
      DisplayWidth = 30
      FieldName = 'EPLANT_NAME'
      Origin = 'e.name'
      Size = 30
    end
  end
end
