inherited FrmRebateStatusException: TFrmRebateStatusException
  ClientWidth = 361
  ExplicitWidth = 367
  ExplicitHeight = 192
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 361
    ExplicitWidth = 361
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 353
      ExplicitHeight = 92
      inherited Label1: TUniLabel
        Left = 3
        Top = 8
        Caption = 'Rebate #'
        ExplicitLeft = 3
        ExplicitTop = 8
      end
      inherited Label3: TUniLabel
        Left = 3
        Top = 33
        Width = 36
        Caption = 'User ID'
        ExplicitLeft = 3
        ExplicitTop = 33
        ExplicitWidth = 36
      end
      inherited DBEdit1: TUniDBEdit
        Width = 262
        DataField = 'REBATENO'
        ExplicitWidth = 262
      end
      inherited DBEdit2: TUniDBEdit
        Width = 262
        DataField = 'USERID'
        ExplicitWidth = 262
      end
      inherited DBEdit3: TUniDBEdit
        Width = 262
        DataField = 'STATUS'
        ExplicitWidth = 262
      end
    end
  end
  inherited Panel1: TUniPanel
    Width = 361
    ExplicitWidth = 361
    inherited Panel2: TUniPanel
      Left = 153
      ExplicitLeft = 153
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select rebateno, '
      '       misc.getusername as userid, '
      '       id,'
      '       '#39'Not Approved. Unable to create Credit Memo.'#39' as status'
      '  from  rebate_hdr'
      ' where id = :id')
    object Query1REBATENO: TStringField
      FieldName = 'REBATENO'
      Origin = 'REBATENO'
      Size = 15
    end
    object Query1USERID: TStringField
      FieldName = 'USERID'
      Origin = 'USERID'
      Size = 4000
    end
    object Query1ID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object Query1STATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 43
    end
  end
end
