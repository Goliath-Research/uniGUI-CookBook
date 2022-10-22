inherited FrmDispoReverseProduction: TFrmDispoReverseProduction
  Left = 116
  Top = 206
  Caption = 'Reverse Production Disposition'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TUniPanel
    inherited Panel2: TUniPanel
      inherited Panel3: TUniPanel
        Left = 654
        Width = 244
        ExplicitLeft = 654
        ExplicitWidth = 244
        inherited btnDisposition: TUniButton
          Width = 110
          Caption = 'Reverse Disposition'
          ExplicitWidth = 110
        end
        inherited Button2: TUniButton
          Left = 123
          Width = 110
          ExplicitLeft = 123
          ExplicitWidth = 110
        end
      end
    end
    inherited PnlCarrier: TUniPanel
      inherited ScrollBoxCarrierLeft01: TUniScrollBox
        inherited pnlCarrierLeft01: TUniPanel
          inherited DBEdit2: TUniDBEdit
            ExplicitWidth = 198
          end
          inherited DBEdit4: TUniDBEdit
            ExplicitWidth = 198
          end
          inherited dbeExtDescription: TUniDBEdit
            ExplicitWidth = 198
          end
        end
      end
      inherited pnlCarrierClient01: TUniPanel
        inherited PageControl1: TUniPageControl
          inherited TabSheet1: TUniTabSheet
            inherited Panel1: TUniPanel
              inherited gridTargetLoc: TUniDBGrid
                Columns = <
                  item
                    FieldName = 'Location'
                    Title.Caption = 'Location'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'LotNo'
                    Title.Caption = 'Lot'
                    Width = 91
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'QUAN'
                    Title.Caption = 'Quantity'
                    Width = 82
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'In_Date'
                    Title.Caption = 'In Date'
                    Width = 97
                    ReadOnly = True
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'EPlant_Name'
                    Title.Caption = 'EPlant'
                    Width = 70
                    ReadOnly = True
                    CheckBoxField.FieldValues = 'true;false'
                  end>
              end
              inherited PnlAddToCaption: TUniPanel
                inherited Label5: TUniLabel
                  Width = 42
                  Caption = 'Relieve'
                  ExplicitWidth = 42
                end
              end
            end
          end
        end
        inherited Panel4: TUniPanel
          inherited Panel7: TUniPanel
            inherited gridMatReq: TUniDBGrid
              Columns = <
                item
                  FieldName = 'CLASS'
                  Title.Caption = 'Class'
                  Width = 64
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'ITEMNO'
                  Title.Caption = 'Item #'
                  Width = 67
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'DESCRIP'
                  Title.Caption = 'Description'
                  Width = 87
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'TOT_MAT_QTY'
                  Title.Caption = 'Quantity'
                  Width = 62
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'TOT_RG_QTY'
                  Title.Caption = 'RG Quantity'
                  Width = 68
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'REV'
                  Title.Caption = 'Revision'
                  Width = 24
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'EPlant_Name'
                  Title.Caption = 'EPlant'
                  Width = 88
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'FLOOR_DISPO_QTY'
                  Title.Caption = 'Floor Disposition'
                  Width = 74
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'DESCRIP2'
                  Title.Caption = 'Ext Description'
                  Width = 208
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'UNIT'
                  Title.Caption = 'UOM'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'OnHand'
                  Title.Caption = 'On Hand'
                  Width = 93
                  CheckBoxField.FieldValues = 'true;false'
                end>
            end
          end
          inherited Panel9: TUniPanel
            inherited gridMatLoc: TUniDBGrid
              Columns = <
                item
                  FieldName = 'Location'
                  Title.Caption = 'Location'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'LotNo'
                  Title.Caption = 'Lot'
                  Width = 35
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'QUAN'
                  Title.Caption = 'Quantity'
                  Width = 40
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'RG_QUAN'
                  Title.Caption = 'RG Quantity'
                  Width = 40
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'EPlant_Name'
                  Title.Caption = 'EPlant '
                  Width = 73
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end>
            end
            inherited PnlRelieveCaption: TUniPanel
              inherited Label8: TUniLabel
                Width = 39
                Caption = 'Add To'
                ExplicitWidth = 39
              end
            end
          end
          inherited Panel8: TUniPanel
            inherited sbtnRight: TUniSpeedButton
              Hint = 'Add selected material'
            end
            inherited sbtnRightAll: TUniSpeedButton
              Hint = 'Add all material'
            end
          end
        end
      end
    end
  end
  inherited TblMasterLoc: TFDTable
    Left = 88
  end
end
