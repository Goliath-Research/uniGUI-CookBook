inherited SndOV: TSndOV
  Caption = 'Outside Vendor Operations'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Splitter1: TUniSplitter
    Top = 126
    ExplicitTop = 126
  end
  inherited PageControlHeader: TUniPageControl
    Height = 99
    ExplicitHeight = 99
    inherited TabSheetForm: TUniTabSheet
      ExplicitHeight = 71
      inherited PnlHeader01: TUniPanel
        Width = 479
        Height = 89
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        ExplicitWidth = 479
        ExplicitHeight = 89
        inherited SplitterHeader01: TUniSplitter
          Height = 89
          ExplicitHeight = 89
        end
        inherited PnlHeaderLeft01: TUniPanel
          Height = 87
          ExplicitHeight = 87
        end
        inherited PnlHeaderClient01: TUniPanel
          Width = 395
          Height = 87
          ExplicitWidth = 395
          ExplicitHeight = 87
          inherited dbeOpDesc: TUniDBEdit
            Width = 394
            ExplicitWidth = 394
          end
        end
      end
    end
    inherited TabSheetTable: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 602
      ExplicitHeight = 71
      inherited dbgOperHeader: TIQUniGridControl
        Height = 41
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
        ExplicitHeight = 41
        Marker = 0
      end
    end
  end
  inherited PageControlDetails: TUniPageControl
    Top = 129
    Height = 256
    ExplicitTop = 129
    ExplicitHeight = 157
    inherited TabSheetOpInfo: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 602
      ExplicitHeight = 129
      object PnlOp01: TUniPanel
        Left = 0
        Top = 0
        Width = 479
        Height = 129
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Splitter3: TUniSplitter
          Left = 81
          Top = 0
          Width = 6
          Height = 129
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlOpLeft01: TUniPanel
          Left = 1
          Top = 1
          Width = 81
          Height = 127
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label10: TUniLabel
            Left = 8
            Top = 12
            Width = 34
            Height = 13
            Hint = ''
            Caption = 'Vendor'
            TabOrder = 1
          end
          object Label11: TUniLabel
            Left = 8
            Top = 36
            Width = 48
            Height = 13
            Hint = ''
            Caption = 'Lead Time'
            TabOrder = 2
          end
        end
        object PnlOpClient01: TUniPanel
          Left = 84
          Top = 1
          Width = 395
          Height = 127
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            515
            226)
          object sbtnGetVendor: TUniSpeedButton
            Left = 352
            Top = 8
            Width = 22
            Height = 22
            Hint = ''
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              1800000000000006000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
              90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
              40905030773818FF00FF8B8B8B7777775F5F5F5A5A5A5A5A5A4A4A4AFF00FFFF
              00FFFF00FF8484847474746F6F6F5A5A5A5151513B3B3BFF00FFB09080FFF8FF
              E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0E0C8C0D0A8
              90B07850804820FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
              00FFFF00FF7F7F7FE7E7E7C9C9C9A7A7A7777777484848FF00FFB09080FFF8FF
              E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
              B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
              00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFB09080FFF8FF
              E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
              B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
              00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC09880FFFFFF
              F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
              B0C08870804830FF00FF979797FFFFFFE7E7E7C9C9C99E9E9E424242FF00FFFF
              00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC3A494B08870
              A068509050308048308048208038108F4C26B08870A068509058309048308040
              20703810905830FF00FFA4A4A48787876969695151514A4A4A4848483B3B3B4E
              4E4E8787876969695757574C4C4C424242393939575757FF00FFDEC4B4B08870
              FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
              50803820CFA98AFF00FFC3C3C3878787FFFFFFCECECEA1A1A16F6F6F414141B5
              B5B58D8D8DD7D7D7D9D9D9A1A1A17777773D3D3DA7A7A7FF00FFFF00FFC09080
              F0F0F0FFF8F0F0D8C0B08060804820965732B09070FFFFFFFFF8F0F0D0C0B078
              50804820FF00FFFF00FFFF00FFFF00FFF0F0F0F7F7F7D5D5D57F7F7F48484857
              57578D8D8DFFFFFFF7F7F7D0D0D0777777484848FF00FFFF00FFFF00FFF8E2D2
              C09880B08060A068509050309058409D6842B07860B08870A070508048308048
              20ECC4A7FF00FFFF00FFFF00FFE1E1E19797977F7F7F6969695151515A5A5A67
              67677979798787876F6F6F4A4A4A484848C2C2C2FF00FFFF00FFFF00FFFF00FF
              C09880FFF8FFE0C0B0C09070804820FF00FFC09880FFF8FFE0C8B0D0A0808048
              20FF00FFFF00FFFF00FFFF00FFFF00FF979797FAFAFAC0C0C08E8E8E484848FF
              00FF979797FAFAFAC5C5C59E9E9E484848FF00FFFF00FFFF00FFFF00FFFF00FF
              CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
              37FF00FFFF00FFFF00FFFF00FFFF00FFB0B0B08F8F8F696969515151525252FF
              00FFA5A5A58F8F8F696969515151505050FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFB1836DFFF8F0814527FF00FFFF00FFFF00FFB08068FFF8F0804324FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF838383F7F7F7464646FF00FFFF
              00FFFF00FF808080F7F7F7444444FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A78C8C8C676767FF00FFFF
              00FFFF00FFADADAD8B8B8B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Caption = ''
            ParentColor = False
            Color = clWindow
            OnClick = sbtnGetVendorClick
          end
          object dbeVendor: TUniDBEdit
            Left = 1
            Top = 8
            Width = 465
            Height = 21
            Hint = ''
            DataField = 'VendorName'
            DataSource = SndDM.SrcSndOp
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            ReadOnly = True
            ExplicitWidth = 345
          end
          object dbeLeadTime: TUniDBEdit
            Left = 1
            Top = 32
            Width = 50
            Height = 21
            Hint = ''
            DataField = 'VEN_LEAD'
            DataSource = SndDM.SrcSndOp
            TabOrder = 1
          end
        end
      end
    end
    inherited TabSheetMaterials: TUniTabSheet
      TabVisible = False
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 602
      ExplicitHeight = 129
      inherited Splitter2: TUniSplitter
        Height = 129
        ExplicitHeight = 129
      end
      inherited pnlMaterials: TUniPanel
        Height = 129
        ExplicitHeight = 129
        inherited GridMaterials: TUniDBGrid
          Height = 102
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
              Width = 72
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
        Height = 129
        ExplicitHeight = 129
        inherited GridQtyBreaks: TUniDBGrid
          Height = 102
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
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 602
      ExplicitHeight = 129
      inherited PageControl1: TUniPageControl
        Height = 228
        ExplicitHeight = 129
        inherited tabDocInternal: TUniTabSheet
          inherited IQDocs1: TIQWebDocs
            Height = 101
            ExplicitHeight = 101
          end
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
    ModuleName = 'Vendor Operations'
  end
end
