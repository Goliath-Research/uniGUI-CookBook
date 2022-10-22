inherited FrmCRMDistListCustomer: TFrmCRMDistListCustomer
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
    object QryMasterCUSTNO: TStringField
      FieldName = 'CUSTNO'
      FixedChar = True
      Size = 10
    end
    object QryMasterCOMPANY: TStringField
      FieldName = 'COMPANY'
      Size = 60
    end
    object QryMasterDISTLIST: TStringField
      FieldName = 'DISTLIST'
      Size = 1
    end
    object QryMasterID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  inherited QryDistList: TFDQuery
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    SQL.Strings = (
      'select'
      '      id as id,'
      '      arcusto_id as arcusto_id, '
      '      name as name,'
      '      email as email'
      'from arcusto_dist'
      'where arcusto_id = :id')
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryDistListNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 21
      FieldName = 'NAME'
      Origin = 'ARCUSTO_DIST.NAME'
      Size = 100
    end
    object QryDistListEMAIL: TStringField
      DisplayLabel = 'Email'
      DisplayWidth = 25
      FieldName = 'EMAIL'
      Origin = 'ARCUSTO_DIST.EMAIL'
      Size = 255
    end
    object QryDistListID: TBCDField
      FieldName = 'ID'
      Origin = 'ARCUSTO_DIST.ID'
      Visible = False
      Size = 0
    end
    object QryDistListARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Origin = 'ARCUSTO_DIST.ARCUSTO_ID'
      Visible = False
      Size = 0
    end
  end
end
