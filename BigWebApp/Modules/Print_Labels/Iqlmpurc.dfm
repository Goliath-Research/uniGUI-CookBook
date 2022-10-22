inherited FrmLM_Purch: TFrmLM_Purch
  ClientHeight = 370
  ExplicitWidth = 417
  ExplicitHeight = 429
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Top = 337
    ExplicitTop = 337
  end
  inherited PageControl1: TUniPageControl
    Height = 332
    ExplicitHeight = 332
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 393
      ExplicitHeight = 304
      inherited Panel8: TUniPanel
        Height = 304
        ExplicitHeight = 304
        inherited LblAkaItemno: TUniLabel
          Top = 269
          ExplicitTop = 269
        end
        inherited EditQty: TUniEdit
          OnExit = nil
        end
        inherited EdAkaItemno: TUniEdit
          Top = 267
          ExplicitTop = 267
        end
      end
    end
    inherited TabDimInv: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 393
      ExplicitHeight = 304
      inherited gridDimInv: TIQUniGridControl
        Height = 277
        IQComponents.Grid.Height = 191
        IQComponents.HiddenPanel.Height = 191
        IQComponents.HiddenPanel.ExplicitHeight = 191
        IQComponents.FormTab.ExplicitLeft = 4
        IQComponents.FormTab.ExplicitTop = 24
        IQComponents.FormTab.ExplicitWidth = 385
        IQComponents.FormTab.ExplicitHeight = 220
        Columns = <
          item
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        ExplicitHeight = 277
        Marker = 0
      end
    end
    inherited TabSheet2: TUniTabSheet
      ExplicitHeight = 304
      inherited sbUserDefined: TUniScrollBox
        Height = 304
        ExplicitHeight = 304
        ScrollHeight = 252
      end
    end
  end
  inherited MainMenu1: TUniMainMenu
    Left = 304
    Top = 8
  end
  inherited SR: TIQWebSecurityRegister
    SecurityCode = 'FRMLM_PURCH'
    Left = 360
    Top = 8
  end
  inherited PopupUserDefLabel: TUniPopupMenu
    Left = 332
    Top = 8
  end
end
