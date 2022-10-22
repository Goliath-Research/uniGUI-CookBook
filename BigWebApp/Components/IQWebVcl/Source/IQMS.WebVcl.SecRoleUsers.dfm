inherited FrmSecRoleUsers: TFrmSecRoleUsers
  ClientHeight = 374
  ClientWidth = 283
  Caption = 'Assigned Users'
  FormStyle = fsStayOnTop
  ExplicitWidth = 299
  ExplicitHeight = 413
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TUniPanel
    Width = 283
    ExplicitWidth = 283
  end
  inherited Panel1: TUniPanel
    Width = 283
    ExplicitWidth = 283
    inherited DBNavigator1: TUniDBNavigator
      Left = 121
      Width = 162
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      ExplicitLeft = 121
      ExplicitWidth = 162
    end
  end
  inherited wwDBGrid1: TIQUniGridControl
    Width = 283
    Height = 344
    IQComponents.Grid.Width = 66
    IQComponents.Grid.Height = 258
    IQComponents.HiddenPanel.Left = 66
    IQComponents.HiddenPanel.Height = 258
    IQComponents.HiddenPanel.ExplicitLeft = 66
    IQComponents.HiddenPanel.ExplicitHeight = 258
    IQComponents.FormTab.ExplicitLeft = 4
    IQComponents.FormTab.ExplicitTop = 24
    IQComponents.FormTab.ExplicitWidth = 275
    IQComponents.FormTab.ExplicitHeight = 287
    Columns = <
      item
        FieldName = 'USER_NAME'
        Title.Caption = 'User Name'
        Width = 280
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitWidth = 283
    ExplicitHeight = 344
    Marker = 0
  end
  inherited DataSource1: TDataSource
    Left = 168
    Top = 264
  end
  inherited Query1: TFDQuery
    BeforeOpen = Query1BeforeOpen
    CachedUpdates = True
    SQL.Strings = (
      'select user_name'
      '  from s_users'
      ' where role_name = :role_name'
      '    or '
      '       s_group_id in'
      '       ( select granted_s_group_id  '
      '           from s_group_roles x'
      '           start with granted_role_name = :role_name'
      '         connect by prior s_group_id = granted_s_group_id )'
      'order by user_name'
      ''
      ''
      '      ')
    Left = 128
    Top = 224
    ParamData = <
      item
        Name = 'role_name'
        DataType = ftString
        ParamType = ptInput
      end>
    object Query1USER_NAME: TStringField
      FieldName = 'USER_NAME'
      Size = 35
    end
  end
  inherited PopupMenu1: TUniPopupMenu
    Left = 72
    Top = 128
  end
  inherited IQJump1: TIQWebJump
    Left = 96
    Top = 176
  end
end
