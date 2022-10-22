inherited FrmVMINotAssociatedLocationException: TFrmVMINotAssociatedLocationException
  Left = 211
  Top = 259
  ExplicitWidth = 413
  ExplicitHeight = 192
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 399
      ExplicitHeight = 92
      inherited Label1: TUniLabel
        Width = 40
        Caption = 'Location'
        ExplicitWidth = 40
      end
      inherited Label3: TUniLabel
        Width = 26
        Caption = 'Lot #'
        ExplicitWidth = 26
      end
      inherited DBEdit1: TUniDBEdit
        DataField = 'LOC_DESC'
      end
      inherited DBEdit2: TUniDBEdit
        DataField = 'LOTNO'
      end
    end
  end
  inherited Panel1: TUniPanel
    inherited Panel2: TUniPanel
      Left = 199
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select v.loc_desc,'
      '       v.lotno,'
      '       '#39'Not shipment associated VMI location'#39' as status_id'
      '  from v_fgmulti_locations v'
      ' where v.id = :id'
      ''
      ' '
      ' '
      ' '
      '')
  end
  inherited DataSource1: TDataSource
    Left = 272
  end
  inherited SR: TIQWebSecurityRegister
    SecurityCode = 'FRMVMINOTASSOCIATEDLOCATIONEXCEPT'
  end
end
