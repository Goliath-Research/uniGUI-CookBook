inherited QuickAddFGArinvt: TQuickAddFGArinvt
  Caption = 'Quick Add'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Top = 262
    Height = 40
    ExplicitTop = 262
    ExplicitHeight = 40
    inherited Panel2: TUniPanel
      Left = 181
      Width = 214
      Height = 38
      ExplicitLeft = 181
      ExplicitWidth = 214
      ExplicitHeight = 38
      inherited btnCancel: TUniButton
        Left = 110
        ExplicitLeft = 110
      end
    end
  end
  inherited PageControl1: TUniPageControl
    Height = 262
    ExplicitHeight = 262
    inherited TabSheet1: TUniTabSheet
      Caption = 'New Item'
      ExplicitHeight = 234
      inherited Panel3: TUniPanel
        Top = 203
        ExplicitTop = 203
        inherited chkNonMaterial: TUniDBCheckBox
          Visible = False
        end
      end
      inherited PnlClient01: TUniPanel
        Height = 203
        ExplicitHeight = 203
        inherited Splitter1: TUniSplitter
          Height = 201
          ExplicitHeight = 201
        end
        inherited PnlLeft01: TUniPanel
          Height = 201
          ExplicitHeight = 201
          inherited Label1: TUniLabel
            Width = 25
            AutoSize = True
            ExplicitWidth = 25
          end
          inherited Label2: TUniLabel
            Width = 33
            AutoSize = True
            ExplicitWidth = 33
          end
          inherited Label3: TUniLabel
            Width = 40
            AutoSize = True
            ExplicitWidth = 40
          end
          inherited Label4: TUniLabel
            Width = 53
            AutoSize = True
            ExplicitWidth = 53
          end
          inherited Label5: TUniLabel
            Width = 19
            AutoSize = True
            ExplicitWidth = 19
          end
          inherited Label9: TUniLabel
            Visible = False
          end
        end
        inherited PnlClient02: TUniPanel
          Height = 201
          ExplicitHeight = 201
          inherited dbcUNIT: TUniDBComboBox
            TabOrder = 4
          end
          inherited dbeLeadTime: TUniDBEdit
            Visible = False
            TabOrder = 5
          end
          inherited chkBlend: TUniCheckBox
            TabOrder = 6
          end
          inherited dbeExtDescription: TUniDBEdit
            TabOrder = 7
          end
        end
      end
    end
    inherited TabVendor: TUniTabSheet
      ExplicitHeight = 234
      inherited wwDBGrid1: TIQUniGridControl
        Height = 234
        IQComponents.Grid.Height = 148
        IQComponents.HiddenPanel.Height = 148
        IQComponents.FormTab.ExplicitHeight = 177
        Columns = <
          item
            FieldName = 'VendorNo'
            Title.Caption = 'Vendor #'
            Width = 58
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'VendorCompany'
            Title.Caption = 'Vendor Name'
            Width = 94
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'VEND_ITEMNO'
            Title.Caption = 'AKA Item #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'VEND_DESCRIP'
            Title.Caption = 'AKA Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        ExplicitHeight = 234
        Marker = 0
      end
    end
    inherited TabCostElem: TUniTabSheet
      ExplicitHeight = 234
      inherited pnlStdCostGrid: TUniPanel
        Height = 234
        ExplicitHeight = 234
        inherited wwDBGridCostElem: TIQUniGridControl
          Height = 205
          IQComponents.Grid.Height = 119
          IQComponents.HiddenPanel.Height = 119
          IQComponents.FormTab.ExplicitHeight = 148
          Columns = <
            item
              FieldName = 'Description'
              Title.Caption = 'Description'
              Width = 88
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'STD_COST'
              Title.Caption = 'Cost'
              Width = 52
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DEFAULT_COST_ELEMENT'
              Title.Caption = 'Default'
              Width = 64
              CheckBoxField.FieldValues = 'Y;N'
            end
            item
              FieldName = 'ADD_TO_ROLLUP'
              Title.Caption = 'Add To Roll Up'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          ExplicitHeight = 205
          Marker = 0
        end
      end
    end
  end
end
