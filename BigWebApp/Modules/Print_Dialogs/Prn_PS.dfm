inherited FrmPrintDocsPS: TFrmPrintDocsPS
  ClientWidth = 387
  Caption = 'Print Packing Slips'
  Constraints.MinHeight = 276
  Constraints.MinWidth = 401
  ExplicitWidth = 403
  ExplicitHeight = 407
  PixelsPerInch = 96
  TextHeight = 13
  inherited Splitter1: TUniSplitter
    Width = 387
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitWidth = 387
  end
  inherited PageControl1: TUniPageControl
    Width = 387
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitWidth = 387
    inherited tabSelectionCriteria: TUniTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 379
      ExplicitHeight = 302
      inherited pnlCriteriaBottom: TUniPanel
        Top = 195
        Width = 379
        Height = 107
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitTop = 195
        ExplicitWidth = 379
        ExplicitHeight = 107
        inherited lblPrinting: TUniLabel
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 5
        end
        inherited edStatus: TUniEdit
          Width = 362
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitWidth = 362
        end
        object cbAutoEmail: TUniCheckBox
          Left = 16
          Top = 42
          Width = 313
          Height = 17
          Hint = ''
          Caption = 'Send Auto Email Only. Do not Print Report'
          TabOrder = 1
          OnClick = cbAutoEmailClick
        end
        object cbPrintOnly: TUniCheckBox
          Left = 16
          Top = 84
          Width = 313
          Height = 17
          Hint = ''
          Caption = 'Print Only.  Do not Auto Email'
          TabOrder = 2
          OnClick = cbPrintOnlyClick
        end
        object chkSilentPrintAutoEmail: TUniCheckBox
          Left = 33
          Top = 63
          Width = 97
          Height = 17
          Hint = ''
          Caption = 'Silent Print'
          TabOrder = 3
          OnClick = chkSilentPrintAutoEmailClick
        end
      end
      inherited pnlCriteriaTop: TUniPanel
        Width = 379
        Height = 195
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitWidth = 379
        ExplicitHeight = 195
        object sbtnPickPS1: TUniSpeedButton [0]
          Left = 161
          Top = 11
          Width = 22
          Height = 22
          Hint = 'Select PS # from Picklist'
          ShowHint = True
          ParentShowHint = False
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
          OnClick = DoPSPickList
        end
        object lblEplant: TUniLabel [1]
          Left = 10
          Top = 40
          Width = 30
          Height = 13
          Hint = ''
          Caption = 'EPlant'
          TabOrder = 8
        end
        inherited Label1: TUniLabel
          Left = 10
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 6
          ExplicitLeft = 10
        end
        inherited wwcombFrom: TUniDBLookupComboBox
          Width = 107
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitWidth = 107
        end
        object wwDBComboDlgEPlant: TUniEdit [4]
          Left = 51
          Top = 36
          Width = 107
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 2
          ReadOnly = True
        end
        inherited pnlCriteriaRight: TUniPanel
          Left = 218
          Height = 193
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitLeft = 218
          ExplicitHeight = 193
          object sbtnPickPS2: TUniSpeedButton [0]
            Left = 139
            Top = 12
            Width = 22
            Height = 22
            Hint = 'Select PS # from Picklist'
            ShowHint = True
            ParentShowHint = False
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
            Anchors = [akTop, akRight]
            ParentColor = False
            Color = clWindow
            OnClick = DoPSPickList
          end
          inherited Label2: TUniLabel
            Left = 9
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitLeft = 9
          end
          inherited wwcombTo: TUniDBLookupComboBox
            Left = 29
            Width = 107
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitLeft = 29
            ExplicitWidth = 107
          end
        end
        inherited chkExcludeAttachedDocs: TUniCheckBox
          Top = 67
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 3
          ExplicitTop = 67
        end
        object chkIncludeAttachedRecords: TUniCheckBox
          Left = 14
          Top = 90
          Width = 171
          Height = 17
          Hint = ''
          Caption = 'Include archived records'
          TabOrder = 4
          OnClick = chkIncludeAttachedRecordsClick
        end
      end
    end
    inherited tabDestination: TUniTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 379
      ExplicitHeight = 302
      inherited PnlDestinationPCCarrier: TUniPanel
        Width = 379
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitWidth = 379
        inherited pgctrDestination: TUniPageControl
          Width = 377
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitWidth = 377
          inherited tabPrinter: TUniTabSheet
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitLeft = 4
            ExplicitTop = 24
            ExplicitWidth = 369
            ExplicitHeight = 245
            inherited Label3: TUniLabel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
            end
          end
          inherited tabScreen: TUniTabSheet
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitLeft = 4
            ExplicitTop = 24
            ExplicitWidth = 369
            ExplicitHeight = 245
            inherited Label4: TUniLabel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
            end
          end
          inherited tabFile: TUniTabSheet
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitLeft = 4
            ExplicitTop = 24
            ExplicitWidth = 369
            ExplicitHeight = 245
            inherited Splitter2: TUniSplitter
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
            end
            inherited pnlFileRight: TUniPanel
              Left = 345
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              ExplicitLeft = 345
              inherited btnSaveFile: TUniSpeedButton
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
            end
            inherited pnlFileClient: TUniPanel
              Width = 258
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              ExplicitWidth = 258
              inherited edSaveFile: TUniEdit
                Width = 267
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitWidth = 267
              end
              inherited cboxFileType: TUniComboBox
                Width = 267
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitWidth = 267
              end
            end
            inherited PnlDestFileLeft01: TUniPanel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              inherited Label6: TUniLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited Label5: TUniLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
            end
          end
          inherited tabEmail: TUniTabSheet
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitLeft = 4
            ExplicitTop = 24
            ExplicitWidth = 369
            ExplicitHeight = 245
            inherited Splitter3: TUniSplitter
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
            end
            inherited pnlEmailRight: TUniPanel
              Left = 345
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              ExplicitLeft = 345
              inherited sbtnAssignEmail: TUniSpeedButton
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited sbtnBoilerPlates: TUniSpeedButton
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited sbtnOtherAttachments: TUniSpeedButton
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
            end
            inherited pnlEMailClient: TUniPanel
              Width = 210
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              ExplicitWidth = 210
              inherited edEmailTo: TUniEdit
                Width = 217
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitWidth = 217
              end
              inherited edSubject: TUniEdit
                Width = 217
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitWidth = 217
              end
              inherited memoEmail: TUniMemo
                Width = 217
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitWidth = 217
              end
              inherited cboxEMailFileType: TUniComboBox
                Width = 217
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitWidth = 217
              end
              inherited EdAttachmentName: TUniEdit
                Width = 217
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitWidth = 217
              end
              inherited edOtherAttachments: TUniEdit
                Width = 217
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitWidth = 217
              end
            end
            inherited PnlDestEMailLeft01: TUniPanel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              inherited Label7: TUniLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited Label8: TUniLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited Label9: TUniLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited Label11: TUniLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited lblOtherAttachments: TUniLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
            end
          end
          inherited tabFax: TUniTabSheet
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitLeft = 4
            ExplicitTop = 24
            ExplicitWidth = 369
            ExplicitHeight = 245
            inherited pnlFaxRight: TUniPanel
              Left = 345
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              ExplicitLeft = 345
              inherited sbtnFax: TUniSpeedButton
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited sbtnFaxSetup: TUniSpeedButton
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
            end
            inherited pnlFaxClient: TUniPanel
              Width = 345
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              ExplicitWidth = 345
              inherited bvTopBuffer: TUniPanel
                Width = 343
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitWidth = 343
              end
              inherited bvLeftBuffer: TUniPanel
                Top = 3
                Height = 238
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitTop = 3
                ExplicitHeight = 238
              end
              inherited bvRightBuffer: TUniPanel
                Left = 341
                Top = 3
                Height = 238
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitLeft = 341
                ExplicitTop = 3
                ExplicitHeight = 238
              end
              inherited bvBottomBuffer: TUniPanel
                Top = 241
                Width = 343
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitTop = 241
                ExplicitWidth = 343
              end
              inherited lviewFaxRecipients: TListView
                Left = 3
                Top = 3
                Width = 338
                Height = 238
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Columns = <
                  item
                    Caption = 'To'
                    Width = 98
                  end
                  item
                    Caption = 'Organization'
                    Width = 117
                  end
                  item
                    Caption = 'Fax #'
                    Width = 145
                  end>
                ExplicitLeft = 3
                ExplicitTop = 3
                ExplicitWidth = 338
                ExplicitHeight = 238
              end
            end
          end
        end
      end
      inherited Panel1: TUniPanel
        Width = 379
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitWidth = 379
        inherited TabControl1: TUniTabControl
          Width = 377
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitWidth = 377
        end
      end
    end
  end
  inherited pnlButtons: TUniPanel
    Width = 387
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Constraints.MinHeight = 35
    ExplicitWidth = 387
    inherited pnlButtonsRight: TUniPanel
      Left = 73
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 73
      inherited btnOK: TUniButton
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
      end
      inherited btnCancel: TUniButton
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
      end
      inherited BtnProp: TUniButton
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
      end
    end
  end
  inherited wwQryLookup: TFDQuery
    SQL.Strings = (
      'select packslipno,'
      '       class,'
      '       itemno,'
      '       rev,'
      '       descrip'
      '  from c_ship_hist'
      'where packslipno > '#39' '#39
      '    and misc.eplant_filter(eplant_id) = 1'
      ' order by packslipno')
  end
  inherited QryMain: TFDQuery
    SQL.Strings = (
      'select id,'
      '       '#39' '#39' as mfg_type,'
      '       packslipno,'
      '       print_count,'
      '       print_last_user,'
      '       print_last_date,'
      '       arcusto_id,'
      '       ship_to_id,'
      
        '       NVL( rtrim(ship_to_prime_contact), arcusto_prime_contact)' +
        ' as attn,'
      '       NVL( rtrim(ship_to_attn), arcusto_company) as company,'
      
        '       NVL( rtrim(ship_to_fax), arcusto_fax_number ) as fax_numb' +
        'er'
      '  from '
      '       shipments'
      ' where '
      '       RTrim(packslipno) between :param1 and :param2'
      '   and misc.eplant_filter(eplant_id) = 1'
      
        '   and ((:ADummy = 1) or (:ADummy = 0 and NVL(archived, '#39'N'#39') = '#39 +
        'N'#39'))'
      ' order by packslipno'
      ' ')
    ParamData = <
      item
        Name = 'PARAM1'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'PARAM2'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'ADUMMY'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  inherited QryDocs: TFDQuery
    SQL.Strings = (
      'select d.doc_blob,'
      '       d.descrip,'
      '       a.docseq,'
      '       '#39'ARINVT'#39' as attached_to'
      '  from arinvt_docs a,'
      '       iq_docs d,'
      '       ( select distinct v.arinvt_id'
      '           from v_shipments v'
      '          where v.shipments_id = :ID'
      '            and v.arinvt_id is not NULL ) x'
      ' where a.arinvt_id = x.arinvt_id'
      '   and a.iq_docs_id = d.id'
      '   and NVL( RTrim(a.type), '#39'ALL'#39' ) in ( '#39'ALL'#39', '#39'PACKING SLIP'#39' )'
      ''
      'UNION ALL'
      ''
      'select d.doc_blob,'
      '       d.descrip,'
      '       a.docseq,'
      '       '#39'ARCUSTO'#39' as attached_to'
      '  from arcusto_docs a,        '
      '       iq_docs d,'
      '       ( select distinct v.arcusto_id'
      '           from v_shipments v'
      '          where v.shipments_id = :ID'
      '            and v.arcusto_id is not NULL ) x'
      ' where a.arcusto_id = x.arcusto_id'
      '   and a.iq_docs_id = d.id'
      '   and NVL( RTrim(a.type), '#39'ALL'#39' ) in ( '#39'ALL'#39', '#39'PACKING SLIP'#39' )'
      ''
      'UNION ALL'
      ''
      'select d.doc_blob,'
      '       d.descrip,'
      '       a.docseq,'
      '       '#39'SHIP_TO'#39' as attached_to'
      '  from ship_to_docs a,        '
      '       iq_docs d,'
      '       ( select distinct v.ship_to_id'
      '           from v_shipments v'
      '          where v.shipments_id = :ID'
      '            and v.ship_to_id is not NULL ) x'
      ' where a.ship_to_id = x.ship_to_id'
      '   and a.iq_docs_id = d.id'
      '   and NVL( RTrim(a.type), '#39'ALL'#39' ) in ( '#39'ALL'#39', '#39'PACKING SLIP'#39' )'
      '   '
      '   '
      'UNION ALL'
      ''
      'select d.doc_blob,'
      '       d.descrip,'
      '       a.docseq,'
      '       '#39'ORD_DETAIL'#39' as attached_to'
      '  from ord_detail_docs a,'
      '       iq_docs d,'
      '       ( select distinct ord_detail_id'
      '           from v_shipments v'
      '          where v.shipments_id = :ID'
      '            and ord_detail_id is not NULL ) x'
      ' where '
      '       x.ord_detail_id = a.ord_detail_id'
      '   and a.iq_docs_id = d.id'
      '   and NVL( RTrim(a.type), '#39'ALL'#39' ) in ( '#39'ALL'#39', '#39'PACKING SLIP'#39' )'
      ''
      ''
      'UNION ALL'
      ''
      'select d.doc_blob,'
      '       d.descrip,'
      '       a.docseq,'
      '       '#39'SHIPMENTS'#39' as attached_to'
      '  from shipments_docs a,'
      '       iq_docs d'
      ' where'
      '       a.shipments_id = :ID'
      '   and a.iq_docs_id = d.id'
      '   and NVL( RTrim(a.type), '#39'ALL'#39' ) in ( '#39'ALL'#39', '#39'PACKING SLIP'#39' )'
      ''
      'order by 4,3')
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
  end
  inherited QryDocsExt: TFDQuery
    SQL.Strings = (
      'select a.lib_path,'
      '       a.filename,'
      '       a.seq,'
      '       a.doc_used_id'
      '  from v_external_docs a,'
      '       ( select distinct v.arinvt_id'
      '           from v_shipments v'
      '          where v.shipments_id = :ID'
      '            and v.arinvt_id is not NULL ) x'
      ' where '
      '       source = '#39'ARINVT'#39
      '   and source_id = x.arinvt_id'
      '   and NVL(RTrim(print_with), '#39'ALL'#39') in ('#39'ALL'#39', '#39'PACKING SLIP'#39')'
      '   '
      'UNION'
      ''
      'select a.lib_path,'
      '       a.filename,'
      '       a.seq,'
      '       a.doc_used_id'
      '  from v_external_docs a,'
      '       ( select distinct v.arcusto_id'
      '           from v_shipments v'
      '          where v.shipments_id = :ID'
      '            and v.arcusto_id is not NULL ) x'
      ' where '
      '       source = '#39'ARCUSTO'#39
      '   and source_id = x.arcusto_id'
      '   and NVL(RTrim(print_with), '#39'ALL'#39') in ('#39'ALL'#39', '#39'PACKING SLIP'#39')'
      ''
      'UNION'
      ''
      'select a.lib_path,'
      '       a.filename,'
      '       a.seq,'
      '       a.doc_used_id'
      '  from v_external_docs a,'
      '       ( select distinct v.orders_id'
      '           from v_shipments v'
      '          where v.shipments_id = :ID'
      '            and v.orders_id is not NULL ) x'
      ' where '
      '       source = '#39'ORDERS'#39
      '   and source_id = x.orders_id'
      '   and NVL(RTrim(print_with), '#39'ALL'#39') in ('#39'ALL'#39', '#39'PACKING SLIP'#39')'
      ''
      'UNION'
      '   '
      'select a.lib_path,'
      '       a.filename,'
      '       a.seq,'
      '       a.doc_used_id'
      '  from v_external_docs a,'
      '       ( select distinct v.ord_detail_id'
      '           from v_shipments v'
      '          where v.shipments_id = :ID'
      '            and v.ord_detail_id is not NULL ) x'
      ' where '
      '       a.source = '#39'ORD_DETAIL'#39
      '   and a.source_id = x.ord_detail_id'
      '   and NVL(RTrim(print_with), '#39'ALL'#39') in ('#39'ALL'#39', '#39'PACKING SLIP'#39')'
      '   '
      'UNION'
      '  '
      'select a.lib_path,'
      '       a.filename,'
      '       a.seq,'
      '       a.doc_used_id'
      '  from v_external_docs a,'
      '       ( select distinct docs.id as arinvt_lot_docs_id'
      '          from c_ship_hist d, '
      '               shipment_releases r,'
      '               arinvt_lot_docs docs'
      '         where d.shipments_id = :ID'
      '           and d.shipment_dtl_id = r.shipment_dtl_id'
      '           and d.arinvt_id = docs.arinvt_id'
      '           and rtrim(r.lotno) = rtrim(docs.lotno)) x'
      ' where a.source = '#39'ARINVT_LOT_DOCS'#39
      '   and a.source_id = x.arinvt_lot_docs_id'
      
        '   and NVL( RTrim(a.print_with), '#39'ALL'#39' ) in ( '#39'ALL'#39', '#39'PACKING SL' +
        'IP'#39' )'
      ''
      'UNION'
      ''
      'select a.lib_path,'
      '       a.filename,'
      '       a.seq,'
      '       a.doc_used_id'
      '  from v_external_docs a,'
      '       shipments x'
      ' where x.id = :ID'
      '   and a.source_id = x.ship_to_id'
      '   and a.source = '#39'SHIP_TO'#39
      
        '   and NVL(RTrim(a.print_with), '#39'ALL'#39') in ('#39'ALL'#39', '#39'PACKING SLIP'#39 +
        ')'
      ''
      'UNION'
      ''
      'select a.lib_path,'
      '       a.filename,'
      '       a.seq,'
      '       a.doc_used_id'
      '  from v_external_docs a,'
      '       shipments x'
      ' where x.id = :ID'
      '   and a.source_id = x.id'
      '   and a.source = '#39'SHIPMENTS'#39
      
        '   and NVL(RTrim(a.print_with), '#39'ALL'#39') in ('#39'ALL'#39', '#39'PACKING SLIP'#39 +
        ')'
      ''
      'order by 1,3'
      ' ')
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        Size = 8
      end
      item
        Name = 'ID'
        DataType = ftFloat
      end
      item
        Name = 'ID'
        DataType = ftFloat
      end
      item
        Name = 'ID'
        DataType = ftFloat
      end
      item
        Name = 'ID'
        DataType = ftFloat
      end
      item
        Name = 'ID'
        DataType = ftFloat
      end
      item
        Name = 'ID'
        DataType = ftFloat
      end>
  end
  inherited PkEmailVendor: TIQWebHpick
    Top = 83
  end
  inherited PkEMailCustomer: TIQWebHpick
    Top = 83
  end
  inherited PkEmployee: TIQWebHpick
    Top = 82
  end
  object PkPackSlip: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select packslipno,'
      '       class,'
      '       itemno,'
      '       rev,'
      '       descrip'
      '  from c_ship_hist'
      'where packslipno > '#39' '#39
      '    and misc.eplant_filter(eplant_id) = 1'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 171
    Top = 86
    object PkPackSlipCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object PkPackSlipITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 15
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object PkPackSlipREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 5
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
    object PkPackSlipDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkPackSlipPACKSLIPNO: TStringField
      DisplayLabel = 'PS #'
      FieldName = 'PACKSLIPNO'
      Size = 15
    end
  end
end
