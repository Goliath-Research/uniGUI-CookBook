object FrmTAPrepostPayTypeSummary: TFrmTAPrepostPayTypeSummary
  Left = 222
  Top = 229
  ClientHeight = 233
  ClientWidth = 299
  Caption = 'Prepost Pay Type Summary'
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grid: TUniDBGrid
    Left = 0
    Top = 27
    Width = 299
    Height = 206
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    DataSource = Src
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Columns = <
      item
        FieldName = 'DESCRIPTION'
        Title.Caption = 'Pay Type'
        Width = 124
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TOTAL'
        Title.Caption = 'Total Hours'
        Width = 81
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 299
    Height = 27
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object Nav: TUniDBNavigator
      Left = 199
      Top = 1
      Width = 100
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      ParentShowHint = False
      DataSource = Src
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Src: TDataSource
    DataSet = Qry
    Left = 48
    Top = 88
  end
  object Qry: TFDQuery
    MasterFields = 'PR_EMP_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select p.description,'
      '       Sum(t.tot_hours) as total'
      ' from ta_prepost_paytype t,'
      '      pr_paytype p,'
      '      ta_prepost_log l'
      ' where t.pr_paytype_id = p.id'
      '   and t.ta_prepost_log_id = l.id'
      '   and l.pr_emp_id = :PR_EMP_ID'
      ' group by p.description'
      ''
      ' ')
    Left = 144
    Top = 96
    ParamData = <
      item
        Name = 'PR_EMP_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryDESCRIPTION: TStringField
      DisplayWidth = 20
      FieldName = 'DESCRIPTION'
      Origin = 'PR_PAYTYPE.DESCRIPTION'
      Size = 50
    end
    object QryTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TA_PREPOST_PAYTYPE.TOT_HOURS'
      Size = 38
    end
  end
end
