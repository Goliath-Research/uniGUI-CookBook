inherited FrmCRMDistListPartner: TFrmCRMDistListPartner
  OldCreateOrder = True
  ExplicitWidth = 610
  ExplicitHeight = 415
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
      IQComponents.FormTab.ExplicitLeft = 4
      IQComponents.FormTab.ExplicitTop = 24
      IQComponents.FormTab.ExplicitWidth = 584
      IQComponents.FormTab.ExplicitHeight = 204
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
    SQL.Strings = (
      'select id, partnerno, company, NVL( distlist, '#39'N'#39' ) as distlist'
      'from partner'
      'where id = :id')
    object QryMasterID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryMasterPARTNERNO: TStringField
      FieldName = 'PARTNERNO'
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
  end
  inherited QryDistList: TFDQuery
    MasterFields = 'ID'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    SQL.Strings = (
      'select'
      '      id as id,'
      '      partner_id as partner_id, '
      '      name as name,'
      '      email as email'
      'from partner_dist'
      'where partner_id = :id'
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
      DisplayWidth = 21
      FieldName = 'NAME'
      Origin = 'PARTNER_DIST.NAME'
      Size = 100
    end
    object QryDistListEMAIL: TStringField
      DisplayLabel = 'Email'
      DisplayWidth = 25
      FieldName = 'EMAIL'
      Origin = 'PARTNER_DIST.EMAIL'
      Size = 255
    end
    object QryDistListID: TBCDField
      FieldName = 'ID'
      Origin = 'PARTNER_DIST.ID'
      Visible = False
      Size = 0
    end
    object QryDistListPARTNER_ID: TBCDField
      FieldName = 'PARTNER_ID'
      Origin = 'PARTNER_DIST.PARTNER_ID'
      Visible = False
      Size = 0
    end
  end
end
