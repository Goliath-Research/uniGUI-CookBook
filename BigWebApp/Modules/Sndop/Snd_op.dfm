inherited SndOp: TSndOp
  Caption = 'Processes / Operations'
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
          DesignSize = (
            938
            111)
          inherited dbeOpDesc: TUniDBEdit
            Width = 942
            ExplicitWidth = 942
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
    ActivePage = TabSheetOpInfo
    inherited TabSheetOpInfo: TUniTabSheet
      object PnlOp01: TUniPanel
        Left = 0
        Top = 0
        Width = 1025
        Height = 286
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        ExplicitWidth = 602
        ExplicitHeight = 213
        object Splitter3: TUniSplitter
          Left = 95
          Top = 0
          Width = 6
          Height = 286
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlOpLeft01: TUniPanel
          Left = 1
          Top = 1
          Width = 95
          Height = 284
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label5: TUniLabel
            Left = 8
            Top = 12
            Width = 70
            Height = 13
            Hint = ''
            Caption = 'Standard Rate'
            TabOrder = 1
          end
          object lblCostElement: TUniLabel
            Left = 8
            Top = 36
            Width = 63
            Height = 13
            Hint = ''
            Caption = 'Cost Element'
            TabOrder = 2
          end
        end
        object PnlOpClient01: TUniPanel
          Left = 101
          Top = 1
          Width = 924
          Height = 284
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object dbeCenterRate: TUniDBEdit
            Left = 1
            Top = 8
            Width = 100
            Height = 21
            Hint = ''
            DataField = 'CNTR_RATE'
            DataSource = SndDM.SrcSndOp
            ParentFont = False
            Font.Color = clBlack
            TabOrder = 0
          end
          object wwDBLookupCombo1: TUniDBLookupComboBox
            Left = 1
            Top = 32
            Width = 217
            Height = 21
            Hint = 'Cost Element of Labor'
            ShowHint = True
            ParentShowHint = False
            ListFieldIndex = 0
            DataField = 'ELEMENTS_ID'
            DataSource = SndDM.SrcSndOp
            TabOrder = 1
            Color = clWindow
          end
        end
      end
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
              Title.Caption = 'Parts Per'
              Width = 60
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Class'
              Title.Caption = 'Class'
              Width = 30
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Descrip'
              Title.Caption = 'Description'
              Width = 96
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
              ReadOnly = True
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
              Width = 42
              ReadOnly = True
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
    ModuleName = 'Process Operations'
  end
  inherited SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'NavMain'
      'New1'
      'Edit1'
      'Delete1'
      'ToggleTableForm1'
      'Reports1'
      'sbtnTableForm'
      'dbeOpDesc'
      'navMaterials'
      'navMatQPB'
      'dbeOpNo'
      'dbeCenterRate'
      'dbchkPkHide'
      'IQExtDoc1'
      'IQDocs1'
      'TblSndOpELEMENTS_ID'
      'TblArinvt_Breaks'
      'TblOpmat'
      'bbtnRouteNote'
      'TblSndOp')
  end
end
