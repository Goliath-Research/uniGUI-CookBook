inherited FrmCRMQuoteServiceLabor: TFrmCRMQuoteServiceLabor
  ClientHeight = 154
  Caption = 'Service Labor'
  OldCreateOrder = True
  ExplicitHeight = 193
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlClient: TUniPanel
    Height = 113
    ExplicitHeight = 113
    inherited Splitter1: TUniSplitter
      Height = 113
      ExplicitHeight = 113
    end
    inherited PnlLeft: TUniPanel
      Height = 111
      ExplicitHeight = 111
      object lblUOM: TUniLabel
        Left = 16
        Top = 84
        Width = 23
        Height = 13
        Hint = ''
        Caption = 'UOM'
        TabOrder = 4
      end
    end
    inherited Panel2: TUniPanel
      Height = 111
      ExplicitHeight = 111
      inherited edtQty: TIQWebFloatSpinner
        TabOrder = 1
      end
      inherited edtUnitPrice: TIQWebFloatSpinner
        TabOrder = 2
      end
      inherited cmbDescrip: TUniDBLookupComboBox
        TabOrder = 0
      end
      object cmbUOM: TUniDBComboBox
        Left = 1
        Top = 80
        Width = 121
        Height = 21
        Hint = ''
        Style = csDropDownList
        Items.Strings = (
          'HOURS'
          'DAYS')
        ItemIndex = 0
        TabOrder = 3
      end
    end
  end
  inherited PnlBottom: TUniPanel
    Top = 113
    ExplicitTop = 113
  end
  inherited QryMisc: TFDQuery
    SQL.Strings = (
      'select distinct'
      '  trim(source_display) as source_display from crm_quote_detail'
      'where'
      '   source_id is null'
      '   and source = '#39'SERVICE_LABOR'#39
      '   and trim(source_display) > '#39' '#39
      'order by upper(trim(source_display))')
  end
end
