inherited QuickAddPlasticExA: TQuickAddPlasticExA
  Caption = 'Quick Add'
  ClientHeight = 414
  ExplicitHeight = 452
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Top = 375
    ExplicitTop = 375
  end
  inherited PageControl1: TUniPageControl
    Height = 375
    ExplicitHeight = 375
    inherited TabSheet1: TUniTabSheet
      ExplicitHeight = 347
      inherited Panel3: TUniPanel
        Top = 295
        Height = 52
        TabOrder = 1
        ExplicitTop = 295
        ExplicitHeight = 52
        inherited chkNonMaterial: TUniDBCheckBox
          Height = 19
          ExplicitHeight = 19
        end
        object chkConvFactor: TUniCheckBox
          Left = 8
          Top = 32
          Width = 271
          Height = 17
          Caption = 'Create Conversion Factor'
          Checked = True
          TabOrder = 1
        end
      end
      inherited PnlClient01: TUniPanel
        Height = 295
        TabOrder = 0
        ExplicitHeight = 295
        inherited Splitter1: TUniSplitter
          Height = 295
          ExplicitHeight = 290
        end
        inherited PnlLeft01: TUniPanel
          Height = 295
          ExplicitHeight = 295
          object lblLength: TUniLabel [8]
            Left = 8
            Top = 239
            Width = 33
            Height = 13
            Caption = 'Length'
          end
          object lblWidth: TUniLabel [9]
            Left = 8
            Top = 263
            Width = 28
            Height = 13
            Caption = 'Width'
          end
        end
        inherited PnlClient02: TUniPanel
          Height = 295
          ExplicitHeight = 295
          DesignSize = (
            283
            295)
          object dbeLength: TUniDBEdit [9]
            Left = 0
            Top = 240
            Width = 279
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'LENGTH'
            DataSource = DataSource1
            ParentShowHint = False
            ShowHint = True
            TabOrder = 10
          end
          object dbeWidth: TUniDBEdit [10]
            Left = 0
            Top = 264
            Width = 279
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'WIDTH'
            DataSource = DataSource1
            ParentShowHint = False
            ShowHint = True
            TabOrder = 11
          end
        end
      end
    end
    inherited TabVendor: TUniTabSheet
      ExplicitHeight = 347
      inherited wwDBGrid1: TIQUniGridControl
        Height = 347
        ExplicitHeight = 347
      end
    end
    inherited TabCostElem: TUniTabSheet
      ExplicitHeight = 347
      inherited pnlStdCostGrid: TUniPanel
        Height = 347
        ExplicitHeight = 347
        inherited Panel9: TUniPanel
          inherited NavCost: TUniDBNavigator
          end
        end
        inherited wwDBGridCostElem: TIQUniGridControl
          Height = 320
          ExplicitHeight = 320
        end
      end
    end
  end
  inherited Table1: TFDTable
    object Table1LENGTH: TFMTBCDField
      FieldName = 'LENGTH'
    end
    object Table1WIDTH: TFMTBCDField
      FieldName = 'WIDTH'
    end
  end
  inherited FDUpdateSQLArinvt: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO ARINVT'
      '(ID, CLASS, ITEMNO, REV, DESCRIP, DESCRIP2, '
      '  UNIT, LEAD_DAYS, LEAD_TIME, SPG, NON_MATERIAL, '
      '  LENGTH, WIDTH, GAUGE)'
      
        'VALUES (:NEW_ID, :NEW_CLASS, :NEW_ITEMNO, nvl(:NEW_REV,'#39' '#39'), :NE' +
        'W_DESCRIP, :NEW_DESCRIP2, '
      
        '  :NEW_UNIT, :NEW_LEAD_DAYS, :NEW_LEAD_TIME, :NEW_SPG, :NEW_NON_' +
        'MATERIAL, '
      '  :NEW_LENGTH, :NEW_WIDTH, :NEW_GAUGE)')
    ModifySQL.Strings = (
      'UPDATE ARINVT'
      
        'SET ID = :NEW_ID, CLASS = :NEW_CLASS, ITEMNO = :NEW_ITEMNO, REV ' +
        '= :NEW_REV, '
      
        '  DESCRIP = :NEW_DESCRIP, DESCRIP2 = :NEW_DESCRIP2, UNIT = :NEW_' +
        'UNIT, '
      '  LEAD_DAYS = :NEW_LEAD_DAYS, LEAD_TIME = :NEW_LEAD_TIME, '
      
        '  SPG = :NEW_SPG, NON_MATERIAL = :NEW_NON_MATERIAL, LENGTH = :NE' +
        'W_LENGTH, '
      '  WIDTH = :NEW_WIDTH, GAUGE = :NEW_GAUGE'
      'WHERE ID = :OLD_ID')
  end
end
