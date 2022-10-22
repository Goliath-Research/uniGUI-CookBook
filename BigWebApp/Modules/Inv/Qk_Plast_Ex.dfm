inherited QuickAddPlasticEx: TQuickAddPlasticEx
  ClientHeight = 366
  Caption = 'Quick Add '
  ExplicitHeight = 405
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Top = 327
    ExplicitTop = 327
  end
  inherited PageControl1: TUniPageControl
    Height = 327
    ExplicitHeight = 327
    inherited TabSheet1: TUniTabSheet
      ExplicitHeight = 299
      inherited Panel3: TUniPanel
        Top = 268
        ExplicitTop = 268
      end
      inherited PnlClient01: TUniPanel
        Height = 268
        ExplicitHeight = 268
        inherited Splitter1: TUniSplitter
          Height = 266
          ExplicitHeight = 266
        end
        inherited PnlLeft01: TUniPanel
          Height = 266
          ExplicitHeight = 266
          object Label6: TUniLabel
            Left = 8
            Top = 195
            Width = 19
            Height = 13
            Hint = ''
            Caption = 'SPG'
            TabOrder = 8
          end
          object Label7: TUniLabel
            Left = 8
            Top = 219
            Width = 31
            Height = 13
            Hint = ''
            Caption = 'Gauge'
            TabOrder = 9
          end
        end
        inherited PnlClient02: TUniPanel
          Height = 266
          ExplicitHeight = 266
          DesignSize = (
            278
            266)
          inherited dbcCLASS: TUniDBComboBox
            TabOrder = 1
          end
          inherited EditITEMNO: TUniDBEdit
            TabOrder = 2
          end
          inherited EditREV: TUniDBEdit
            TabOrder = 3
          end
          inherited EditDESCRIP: TUniDBEdit
            TabOrder = 4
          end
          inherited dbcUNIT: TUniDBComboBox
            TabOrder = 6
          end
          inherited dbeLeadTime: TUniDBEdit
            TabOrder = 7
          end
          inherited chkBlend: TUniCheckBox
            Width = 295
            TabOrder = 0
            ExplicitWidth = 295
          end
          inherited dbeExtDescription: TUniDBEdit
            TabOrder = 5
          end
          object dbeSPG: TUniDBEdit
            Left = 0
            Top = 192
            Width = 279
            Height = 21
            Hint = ''
            ShowHint = True
            ParentShowHint = False
            DataField = 'SPG'
            DataSource = DataSource1
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 8
          end
          object dbeGauge: TUniDBEdit
            Left = 0
            Top = 216
            Width = 279
            Height = 21
            Hint = ''
            ShowHint = True
            ParentShowHint = False
            DataField = 'GAUGE'
            DataSource = DataSource1
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 9
          end
        end
      end
    end
    inherited TabVendor: TUniTabSheet
      ExplicitHeight = 299
      inherited wwDBGrid1: TIQUniGridControl
        Height = 299
        IQComponents.Grid.Height = 213
        IQComponents.HiddenPanel.Height = 213
        IQComponents.HiddenPanel.ExplicitHeight = 213
        IQComponents.FormTab.ExplicitHeight = 242
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
            Width = 112
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'VEND_DESCRIP'
            Title.Caption = 'AKA Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        ExplicitHeight = 299
        Marker = 0
      end
    end
    inherited TabCostElem: TUniTabSheet
      ExplicitHeight = 299
      inherited pnlStdCostGrid: TUniPanel
        Height = 299
        ExplicitHeight = 299
        inherited wwDBGridCostElem: TIQUniGridControl
          Height = 270
          IQComponents.Grid.Height = 184
          IQComponents.HiddenPanel.Height = 184
          IQComponents.HiddenPanel.ExplicitHeight = 184
          IQComponents.FormTab.ExplicitHeight = 213
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
              Width = 40
              CheckBoxField.FieldValues = 'Y;N'
            end
            item
              FieldName = 'ADD_TO_ROLLUP'
              Title.Caption = 'Add To Roll Up'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          ExplicitHeight = 270
          Marker = 0
        end
      end
    end
  end
  inherited Table1: TFDTable
    object Table1SPG: TFMTBCDField
      FieldName = 'SPG'
    end
    object Table1GAUGE: TFMTBCDField
      FieldName = 'GAUGE'
    end
  end
  inherited DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
  end
  inherited SrcArinvt_Elements: TDataSource
    Left = 121
    Top = 228
  end
  inherited FDUpdateSQL_Arinvt_Vendors: TFDUpdateSQL
    Left = 176
    Top = 208
  end
end
