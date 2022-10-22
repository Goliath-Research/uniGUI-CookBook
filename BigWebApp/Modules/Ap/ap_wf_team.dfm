inherited FrmAPWorkflowTeam: TFrmAPWorkflowTeam
  HelpContext = 22566
  Caption = 'AP Invoice Workflow Approvers Team'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TIQUniGridControl
    Columns = <
      item
        FieldName = 'NAME'
        Title.Caption = 'Name'
        Title.Font.Height = -13
        Width = 64
        Font.Height = -13
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TITLE'
        Title.Caption = 'Title'
        Title.Font.Height = -13
        Width = 64
        Font.Height = -13
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EMAIL'
        Title.Caption = 'Email'
        Title.Font.Height = -13
        Width = 64
        Font.Height = -13
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'USERID'
        Title.Caption = 'User ID'
        Title.Font.Height = -13
        Width = 64
        Font.Height = -13
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPLANT_ID'
        Title.Caption = 'EPlant ID'
        Title.Font.Height = -13
        Width = 64
        Font.Height = -13
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  inherited TblTeam: TFDTable
    object TblTeamUSED_AP: TStringField
      FieldName = 'USED_AP'
      Visible = False
      Size = 1
    end
  end
  inherited PkSearch: TIQWebHpick
    SQL.Strings = (
      'select id as id,  '
      '       name as name,'
      '       title as title,'
      '       email as email'
      '  from team_member'
      ' where used_ap = '#39'Y'#39
      '   and misc.eplant_filter_include_nulls( eplant_id ) = 1')
  end
end
