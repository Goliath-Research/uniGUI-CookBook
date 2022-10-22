inherited FrmDispoArchived: TFrmDispoArchived
  Left = 134
  Top = 148
  ClientWidth = 727
  Caption = 'Archived Production Disposition'
  ActiveControl = nil
  ExplicitWidth = 743
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TUniPanel
    Width = 727
    ExplicitWidth = 727
    inherited Panel2: TUniPanel
      Width = 725
      ExplicitWidth = 727
      inherited lblStatus: TUniLabel
        Visible = False
      end
      inherited Panel3: TUniPanel
        Left = 518
        ExplicitLeft = 518
        inherited btnDisposition: TUniButton
          Visible = False
        end
      end
    end
    inherited PnlCarrier: TUniPanel
      Width = 725
      ExplicitWidth = 727
      inherited ScrollBoxCarrierLeft01: TUniScrollBox
        inherited pnlCarrierLeft01: TUniPanel
          Width = 247
          ExplicitWidth = 247
          inherited DBEdit1: TUniDBEdit
            Anchors = [akLeft, akTop, akRight]
          end
          inherited DBEdit3: TUniDBEdit
            Anchors = [akLeft, akTop, akRight]
          end
          inherited dbeUNIT: TUniDBEdit
            Anchors = [akLeft, akTop, akRight]
          end
          inherited DBEdit8: TUniDBEdit
            Anchors = [akLeft, akTop, akRight]
          end
          inherited DBEdit6: TUniDBEdit
            Anchors = [akLeft, akTop, akRight]
          end
          inherited DBEdit5: TUniDBEdit
            Anchors = [akLeft, akTop, akRight]
          end
          inherited DBEdit7: TUniDBEdit
            Anchors = [akLeft, akTop, akRight]
          end
        end
      end
      inherited pnlCarrierClient01: TUniPanel
        Width = 452
        ExplicitWidth = 456
        inherited Splitter1: TUniSplitter
          Width = 450
          ExplicitWidth = 464
        end
        inherited PageControl1: TUniPageControl
          Width = 450
          Visible = False
          ExplicitWidth = 456
          inherited TabSheet1: TUniTabSheet
            ExplicitTop = 6
            ExplicitWidth = 448
            inherited Panel1: TUniPanel
              Left = 444
              Width = 4
              Visible = False
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              ExplicitLeft = 444
              ExplicitWidth = 4
              inherited bvAddTo: TUniPanel
                Width = 4
                ExplicitWidth = 4
              end
              inherited Panel5: TUniPanel
                Width = 4
                ExplicitWidth = 4
                inherited DBNavigator1: TUniDBNavigator
                  Left = -122
                  ExplicitLeft = -122
                end
              end
              inherited gridTargetLoc: TUniDBGrid
                Width = 4
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
                Width = 4
                ExplicitWidth = 4
              end
            end
          end
        end
        inherited Panel4: TUniPanel
          Width = 450
          ExplicitWidth = 456
          inherited Splitter2: TUniSplitter
            Left = 0
            ExplicitLeft = 0
          end
          inherited Panel7: TUniPanel
            Left = 3
            Width = 452
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            ExplicitLeft = 3
            ExplicitWidth = 452
            inherited bvMaterialsInvolved: TUniPanel
              Width = 452
              ExplicitWidth = 460
            end
            inherited gridMatReq: TUniDBGrid
              Width = 452
              Columns = <
                item
                  FieldName = 'CLASS'
                  Title.Caption = 'Class'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'ITEMNO'
                  Title.Caption = 'Item #'
                  Width = 67
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'DESCRIP'
                  Title.Caption = 'Description'
                  Width = 61
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'TOT_MAT_QTY'
                  Title.Caption = 'Quantity'
                  Width = 50
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
                end>
            end
            inherited Panel11: TUniPanel
              Width = 452
              ExplicitWidth = 452
              inherited DBNavigator3: TUniDBNavigator
                Left = 326
                Visible = False
                ExplicitLeft = 326
              end
              inherited ddbtnAlternateItem: TIQWebDropDownButton
                Left = 289
                ExplicitLeft = 289
              end
            end
            inherited PnlMaterialsInvolvedCaption: TUniPanel
              Width = 452
              ExplicitWidth = 452
            end
          end
          inherited Panel9: TUniPanel
            Left = 455
            Width = 0
            Visible = False
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            ExplicitLeft = 455
            ExplicitWidth = 0
            inherited bvRelieve: TUniPanel
              Width = 0
              ExplicitWidth = 0
            end
            inherited Panel10: TUniPanel
              Width = 0
              ExplicitWidth = 0
              inherited DBNavigator2: TUniDBNavigator
                Left = -151
                ExplicitLeft = -151
              end
              inherited pnlLegendRelieve: TUniPanel
                Left = -26
                ExplicitLeft = -26
                inherited Shape2: TUniPanel
                  Left = 153
                  ExplicitLeft = 153
                end
              end
            end
            inherited gridMatLoc: TUniDBGrid
              Width = 0
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
              Width = 0
              ExplicitWidth = 0
            end
          end
          inherited Panel8: TUniPanel
            Left = 455
            Width = 1
            Visible = False
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            ExplicitLeft = 455
            ExplicitWidth = 1
          end
        end
      end
    end
  end
  inherited TblMaster: TFDTable
    UpdateOptions.UpdateTableName = 'PDAY_PART'
    TableName = 'PDAY_PART'
  end
  inherited TblDetail: TFDTable
    UpdateOptions.UpdateTableName = 'PMATPROD'
    TableName = 'PMATPROD'
  end
  inherited TblDetailLoc: TFDTable
    Tag = 1
  end
  inherited TblMasterLoc: TFDTable
    Tag = 1
  end
end
