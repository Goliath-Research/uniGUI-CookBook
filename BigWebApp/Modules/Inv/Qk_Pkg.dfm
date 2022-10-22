inherited QuickAddPackaging: TQuickAddPackaging
  HelpContext = 1126775
  Caption = 'Quick Add'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    ExplicitTop = 262
  end
  inherited PageControl1: TUniPageControl
    ExplicitHeight = 262
    inherited TabSheet1: TUniTabSheet
      Caption = 'New Packaging Item'
      ExplicitWidth = 0
      ExplicitHeight = 234
      inherited Panel3: TUniPanel
        Top = 200
        Height = 35
        ExplicitTop = 199
        ExplicitHeight = 35
        DesignSize = (
          388
          35)
        inherited chkNonMaterial: TUniDBCheckBox
          Top = 18
          ExplicitTop = 18
        end
        object chkIsPallet: TUniDBCheckBox
          Left = 8
          Top = 0
          Width = 97
          Height = 17
          Hint = 
            'Used to determine pallet count in conjunction with parts per on ' +
            'the BOM'
          Caption = 'Is Pallet'
          DataField = 'IS_PALLET'
          DataSource = DataSource1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          ValueChecked = 'Y'
          ValueUnchecked = 'N'
        end
      end
      inherited PnlClient01: TUniPanel
        Height = 200
        ExplicitHeight = 199
        inherited Splitter1: TUniSplitter
          Height = 200
          ExplicitLeft = 85
          ExplicitHeight = 198
        end
        inherited PnlLeft01: TUniPanel
          Height = 200
          ExplicitHeight = 200
        end
        inherited PnlClient02: TUniPanel
          Height = 200
          ExplicitLeft = 88
          ExplicitWidth = 300
          ExplicitHeight = 199
          DesignSize = (
            283
            200)
          inherited dbcCLASS: TUniDBComboBox
            Color = clBtnFace
            Items.Strings = (
              'PK')
            ReadOnly = True
          end
          inherited chkBlend: TUniCheckBox
            Width = 172
            ExplicitWidth = 189
          end
        end
      end
    end
    inherited TabCostElem: TUniTabSheet
      inherited pnlStdCostGrid: TUniPanel
        inherited Panel9: TUniPanel
          inherited NavCost: TUniDBNavigator
          end
        end
      end
    end
  end
  inherited Table1: TFDTable
    object Table1IS_PALLET: TStringField
      FieldName = 'IS_PALLET'
      Size = 1
    end
  end
end
