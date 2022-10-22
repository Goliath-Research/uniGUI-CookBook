inherited FrmLM_Pack_Multi: TFrmLM_Pack_Multi
  ClientHeight = 548
  Caption = 'FrmLM_Pack_Multi'
  ExplicitHeight = 607
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Top = 515
    ExplicitTop = 515
  end
  inherited PageControl1: TUniPageControl
    Height = 510
    ActivePage = TabSheet1
    ExplicitHeight = 510
    inherited TabSheet1: TUniTabSheet
      ExplicitHeight = 482
      inherited Panel8: TUniPanel
        Height = 482
        ExplicitHeight = 482
        inherited lblShipTo: TUniLabel
          TabOrder = 40
        end
        inherited spSearchLots: TUniSpeedButton
          Width = 22
          Height = 22
          ExplicitWidth = 22
          ExplicitHeight = 22
        end
        inherited EditBox: TUniEdit
          Left = 138
          ExplicitLeft = 138
        end
        inherited wwMfgNo: TUniDBLookupComboBox
          Left = 138
          Width = 205
          ExplicitLeft = 138
          ExplicitWidth = 205
        end
        inherited wwPackage: TUniDBLookupComboBox
          Left = 138
          Width = 205
          ExplicitLeft = 138
          ExplicitWidth = 205
        end
        inherited wwBillTo: TUniDBLookupComboBox
          Left = 138
          Width = 205
          ExplicitLeft = 138
          ExplicitWidth = 205
        end
        inherited EditOrder: TUniEdit
          Left = 138
          Width = 204
          ExplicitLeft = 138
          ExplicitWidth = 204
        end
        inherited EditPoNo: TUniEdit
          Left = 138
          Width = 204
          ExplicitLeft = 138
          ExplicitWidth = 204
        end
        inherited EditBoxNum: TUniEdit
          Left = 138
          ExplicitLeft = 138
        end
        inherited editVolume: TUniEdit
          Left = 138
          ExplicitLeft = 138
        end
        inherited editWeight: TUniEdit
          Left = 138
          ExplicitLeft = 138
        end
        inherited wwDBLookupComboCustomer: TUniDBLookupComboBox
          Left = 138
          Width = 205
          ExplicitLeft = 138
          ExplicitWidth = 205
        end
        inherited lblLabelDispositionSetting: TUniLabel
          Top = 461
          ExplicitTop = 461
        end
        inherited EditQty: TUniEdit
          Left = 138
          ExplicitLeft = 138
        end
        inherited wwLabels: TUniDBLookupComboBox
          Left = 138
          Width = 205
          ExplicitLeft = 138
          ExplicitWidth = 205
        end
        inherited cmbShipTo: TUniDBLookupComboBox
          Left = 138
          Width = 205
          ExplicitLeft = 138
          ExplicitWidth = 205
        end
        inherited EditLblQty: TUniEdit
          Left = 138
          ExplicitLeft = 138
        end
        inherited edLotNo: TUniEdit
          Left = 138
          Width = 205
          ExplicitLeft = 138
          ExplicitWidth = 205
        end
        inherited wwDBDateTimePickDate: TUniDBDateTimePicker
          Left = 138
          Width = 205
          ExplicitLeft = 138
          ExplicitWidth = 205
        end
        inherited IQUDComboBoxCountryOfOrigin: TIQWebUDComboBox
          Left = 138
          Width = 205
          ExplicitLeft = 138
          ExplicitWidth = 205
        end
        inherited wwDBComboPrinter: TUniDBComboBox
          Left = 138
          Width = 205
          ExplicitLeft = 138
          ExplicitWidth = 205
        end
        inherited cmbLabelDispositionSetting: TUniComboBox
          Left = 138
          Top = 459
          Width = 205
          ExplicitLeft = 138
          ExplicitTop = 459
          ExplicitWidth = 205
        end
        inherited EdAkaItemno: TUniEdit
          Left = 138
          Top = 95
          Width = 204
          ExplicitLeft = 138
          ExplicitTop = 95
          ExplicitWidth = 204
        end
      end
    end
    inherited TabDimInv: TUniTabSheet
      ExplicitHeight = 482
      inherited gridDimInv: TIQUniGridControl
        Height = 455
        IQComponents.Grid.Height = 369
        IQComponents.HiddenPanel.Height = 369
        IQComponents.HiddenPanel.ExplicitHeight = 369
        IQComponents.FormTab.ExplicitHeight = 398
        ExplicitHeight = 455
        Marker = 0
      end
    end
    inherited TabSheet2: TUniTabSheet
      ExplicitHeight = 482
      inherited sbUserDefined: TUniScrollBox
        Height = 482
        ExplicitHeight = 482
        ScrollHeight = 252
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmLM_Pack_Multi')
  end
  inherited StoredProc1: TFDStoredProc
    Top = 517
  end
end
