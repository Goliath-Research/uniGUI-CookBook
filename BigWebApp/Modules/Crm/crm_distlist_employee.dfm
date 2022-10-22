inherited FrmCRMDistListEmployee: TFrmCRMDistListEmployee
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel2: TUniPanel
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
  end
  inherited Bevel1: TUniPanel
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
  end
  inherited Panel5: TUniPanel
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    inherited NavMain: TUniDBNavigator
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited chkDistList: TUniCheckBox
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
  end
  inherited PnlGrid: TUniPanel
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    inherited PnlGridDisplay: TUniPanel
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
    end
    inherited Grid: TIQUniGridControl
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Columns = <
        item
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      OnMouseDown = GridMouseDown
      Marker = 0
      inherited cmbGridEMail: TUniEdit
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
      end
    end
  end
  inherited CaptionPanel1: TIQWebCaptionPanel
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
  end
  inherited QryMaster: TFDQuery
    SQL.Strings = (
      'SELECT id, empno,'
      '       SUBSTRB(iqeval.substrw63max(TRIM(DECODE(nickname,'
      
        '                                               NULL, TRIM(first_' +
        'name),'
      
        '                                               TRIM(nickname)) |' +
        '|'
      '                                        '#39' '#39' ||'
      
        '                                        TRIM(last_name)), 1, 61)' +
        ', 1, 61)'
      '          AS name, NVL(distlist, '#39'N'#39') AS distlist'
      '  FROM pr_emp'
      ' WHERE id = :ID')
    object QryMasterID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryMasterEMPNO: TStringField
      FieldName = 'EMPNO'
      Size = 25
    end
    object QryMasterNAME: TStringField
      FieldName = 'NAME'
      Size = 61
    end
    object QryMasterDISTLIST: TStringField
      FieldName = 'DISTLIST'
      Size = 1
    end
  end
  inherited QryDistList: TFDQuery
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    SQL.Strings = (
      'select'
      '      id as id,'
      '      pr_emp_id as pr_emp_id, '
      '      name as name,'
      '      email as email'
      'from pr_emp_dist'
      'where pr_emp_id = :id'
      '')
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryDistListNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 22
      FieldName = 'NAME'
      Origin = 'PR_EMP_DIST.NAME'
      Size = 100
    end
    object QryDistListEMAIL: TStringField
      DisplayLabel = 'Email'
      DisplayWidth = 25
      FieldName = 'EMAIL'
      Origin = 'PR_EMP_DIST.EMAIL'
      Size = 255
    end
    object QryDistListID: TBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'PR_EMP_DIST.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryDistListPR_EMP_ID: TBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'PR_EMP_ID'
      Origin = 'PR_EMP_DIST.PR_EMP_ID'
      Visible = False
      Size = 0
    end
  end
end
