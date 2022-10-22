inherited SndPK: TSndPK
  Left = 279
  Top = 155
  Caption = 'Attached Packaging Operations'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControlHeader: TUniPageControl
    inherited TabSheetForm: TUniTabSheet
      inherited PnlHeader01: TUniPanel
        Width = 1025
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        ExplicitWidth = 1025
        inherited PnlHeaderClient01: TUniPanel
          Width = 938
          ExplicitWidth = 938
          inherited dbeOpDesc: TUniDBEdit
            Width = 937
            ExplicitWidth = 937
          end
        end
      end
    end
    inherited TabSheetTable: TUniTabSheet
      inherited dbgOperHeader: TIQUniGridControl
        Columns = <
          item
            FieldName = 'OP_CLASS'
            Title.Caption = 'Class'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'OPNO'
            Title.Caption = 'Oper #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'OPDESC'
            Title.Caption = 'Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER1'
            Title.Caption = 'CUSER1'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER2'
            Title.Caption = 'CUSER2'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER3'
            Title.Caption = 'CUSER3'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER4'
            Title.Caption = 'CUSER4'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER5'
            Title.Caption = 'CUSER5'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER6'
            Title.Caption = 'CUSER6'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER7'
            Title.Caption = 'CUSER7'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER8'
            Title.Caption = 'CUSER8'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER9'
            Title.Caption = 'CUSER9'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER10'
            Title.Caption = 'CUSER10'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER1'
            Title.Caption = 'NUSER1'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER2'
            Title.Caption = 'NUSER2'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER3'
            Title.Caption = 'NUSER3'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER4'
            Title.Caption = 'NUSER4'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER5'
            Title.Caption = 'NUSER5'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER6'
            Title.Caption = 'NUSER6'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER7'
            Title.Caption = 'NUSER7'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER8'
            Title.Caption = 'NUSER8'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER9'
            Title.Caption = 'NUSER9'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER10'
            Title.Caption = 'NUSER10'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'IS_SUPERMARKET'
            Title.Caption = 'Supermarket'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
    end
  end
  inherited PageControlDetails: TUniPageControl
    inherited TabSheetOpInfo: TUniTabSheet
      TabVisible = False
    end
    inherited TabSheetMaterials: TUniTabSheet
      inherited pnlMaterials: TUniPanel
        object Bevel1: TUniPanel [0]
          Left = 1
          Top = 27
          Width = 857
          Height = 3
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          Caption = ''
        end
        inherited GridMaterials: TUniDBGrid
          Top = 30
          Height = 256
          Columns = <
            item
              FieldName = 'ItemNo'
              Title.Caption = 'Item #'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PTSPER_DISP'
              Title.Caption = 'Items/Pk'
              Width = 57
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Class'
              Title.Caption = 'Class'
              Width = 31
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Descrip'
              Title.Caption = 'Description'
              Width = 72
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'UNIT'
              Title.Caption = 'UOM'
              Width = 64
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Descrip2'
              Title.Caption = 'Ext Description'
              Width = 214
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Rev'
              Title.Caption = 'Rev'
              Width = 94
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Uom'
              Title.Caption = 'Native UOM'
              Width = 124
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'STARTUP_QTY'
              Title.Caption = 'Startup Qty'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'INCLUDE_STARTUP_QTY_STD_COST'
              Title.Caption = 'Include Startup Qty in Std Cost'
              Width = 154
              PickList.Strings = (
                'Y'
                'N')
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
      end
      inherited pnlMatQPB: TUniPanel
        object Bevel2: TUniPanel [0]
          Left = 1
          Top = 27
          Width = 160
          Height = 3
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          Caption = ''
        end
        inherited GridQtyBreaks: TUniDBGrid
          Top = 30
          Height = 256
          Columns = <
            item
              FieldName = 'QUAN'
              Title.Caption = 'Quantity'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'QPRICE'
              Title.Caption = 'Price Break'
              Width = 72
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
      end
    end
  end
  inherited MainMenu1: TUniMainMenu
    inherited View1: TUniMenuItem
      inherited Generic1: TUniMenuItem
        Caption = 'Process / Standard Operation'
      end
    end
  end
  inherited IQAbout1: TIQWebAbout
    ModuleName = 'Packaging Operations'
  end
end
