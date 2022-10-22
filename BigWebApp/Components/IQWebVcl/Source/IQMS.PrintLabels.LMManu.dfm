inherited FrmLM_Manu: TFrmLM_Manu
  Left = 271
  Top = 218
  ClientHeight = 508
  Caption = 'Print Label (Manufactured)'
  ExplicitHeight = 567
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TUniLabel [0]
    Left = 12
    Top = 144
    Width = 43
    Height = 13
    Hint = ''
    Caption = 'Order #:'
    TabOrder = 3
  end
  inherited Panel1: TUniPanel
    Top = 475
    ExplicitTop = 475
    inherited Panel2: TUniPanel
      inherited BtnOk: TUniButton
        Left = 7
        ExplicitLeft = 7
      end
    end
  end
  inherited PageControl1: TUniPageControl
    Height = 470
    ExplicitHeight = 470
    inherited TabSheet1: TUniTabSheet
      ExplicitHeight = 442
      inherited Panel8: TUniPanel
        Height = 442
        ExplicitHeight = 442
        object Label6: TUniLabel [0]
          Left = 8
          Top = 28
          Width = 46
          Height = 13
          Hint = ''
          Caption = 'Customer'
          TabOrder = 29
        end
        object Label7: TUniLabel [1]
          Left = 8
          Top = 247
          Width = 85
          Height = 13
          Hint = ''
          Caption = 'Package Quantity'
          TabOrder = 30
        end
        object Label9: TUniLabel [2]
          Left = 8
          Top = 175
          Width = 80
          Height = 13
          Hint = ''
          Caption = 'Manufacturing #'
          TabOrder = 31
        end
        object Label10: TUniLabel [3]
          Left = 8
          Top = 223
          Width = 40
          Height = 13
          Hint = ''
          Caption = 'Package'
          TabOrder = 32
        end
        object Label11: TUniLabel [4]
          Left = 8
          Top = 102
          Width = 27
          Height = 13
          Hint = ''
          Caption = 'Bill To'
          TabOrder = 33
        end
        object Label13: TUniLabel [5]
          Left = 8
          Top = 295
          Width = 53
          Height = 13
          Hint = ''
          Caption = 'First Box #'
          TabOrder = 34
        end
        object Label14: TUniLabel [6]
          Left = 8
          Top = 318
          Width = 34
          Height = 13
          Hint = ''
          Caption = 'Volume'
          TabOrder = 35
        end
        object Label15: TUniLabel [7]
          Left = 8
          Top = 343
          Width = 34
          Height = 13
          Hint = ''
          Caption = 'Weight'
          TabOrder = 36
        end
        object Label16: TUniLabel [8]
          Left = 230
          Top = 342
          Width = 12
          Height = 13
          Hint = ''
          Caption = '...'
          TabOrder = 37
        end
        object Label17: TUniLabel [9]
          Left = 230
          Top = 317
          Width = 27
          Height = 13
          Hint = ''
          Caption = '(cu.f)'
          TabOrder = 38
        end
        object sbEditBoxNum: TUniSpeedButton [10]
          Left = 229
          Top = 290
          Width = 22
          Height = 22
          Hint = ''
          ShowHint = True
          ParentShowHint = False
          GroupIndex = 1
          AllowAllUp = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDDDDDDDDDDDDDDDDDDDD0000000000DDDDDD0FFFFFFFF0DDDDDD0FFFFFFF
            F0DDDDDD0FF80FFFF0DDDDDD0F800FFFF0DDDDDD080B0FFFF0DDDDDD00B0FFFF
            F0DDDDDD0B0FFFFFF0DDDDD0B0FFFFFFF0DDDD0B0FFFFFFFF0DDD0B07FFFFFFF
            F0DDD90D0000000000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = sbEditBoxNumClick
        end
        object sbtnPopulateLabelsQty: TUniSpeedButton [11]
          Left = 229
          Top = 266
          Width = 22
          Height = 22
          Hint = 'Calculate Labels Quantity'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            1800000000000006000000000000000000000000000000000000FF00FFFF00FF
            CDB6A88068608060507058407058407050407050406050406050306050307050
            40B89A83FF00FFFF00FFFF00FFFF00FFB5B5B568686860606056565656565650
            50505050504E4E4E4C4C4C4C4C4C505050989898FF00FFFF00FFFF00FFFF00FF
            877766D0C0B0D0B8B0D0B0A0C0B0A0C0A8A0C0A8A0C0A090C0A090B0A090B098
            90775E46FF00FFFF00FFFF00FFFF00FF757575BEBEBEB8B8B8AFAFAFAEAEAEA8
            A8A8A8A8A8A0A0A0A0A0A09E9E9E9999995C5C5CFF00FFFF00FFFF00FFFF00FF
            967E66F0E0D0D0C0B0D0B8B0D0B0B0C0B0A0C0A8A0C0A8A0C0A090C0A090B0A0
            90775E46FF00FFFF00FFFF00FFFF00FF7B7B7BDEDEDEBEBEBEB8B8B8B3B3B3AE
            AEAEA8A8A8A8A8A8A0A0A0A0A0A09E9E9E5C5C5CFF00FFFF00FFFF00FFFF00FF
            967E75F0E0D0C08870B07050D0B8B0C08870B07050C0B0A0C08870B07050C0A0
            90775E46FF00FFFF00FFFF00FFFF00FF7E7E7EDEDEDE898989717171B8B8B889
            8989717171AEAEAE898989717171A0A0A05C5C5CFF00FFFF00FFFF00FFFF00FF
            968675F0E0E0FFC8B0C08870D0C0B0F0C8B0C08870C0B0A0F0C8B0C08070C0A8
            90775E46FF00FFFF00FFFF00FFFF00FF848484E2E2E2C8C8C8898989BEBEBEC7
            C7C7898989AEAEAEC7C7C7838383A5A5A55C5C5CFF00FFFF00FFFF00FFFF00FF
            968D85F0E8E0E0D0C0D0C8C0D0C0C0D0C0B0D0B8B0D0B8B0C0B0A0C0B0A0C0A8
            A0776655FF00FFFF00FFFF00FFFF00FF8C8C8CE7E7E7CECECEC7C7C7C2C2C2BE
            BEBEB8B8B8B8B8B8AEAEAEAEAEAEA8A8A8646464FF00FFFF00FFFF00FFFF00FF
            A58D85FFE8E0C09070B07050E0C8C0C09080B07050D0B8B0C09070B07050C0B0
            A0866655FF00FFFF00FFFF00FFFF00FF8D8D8DE9E9E98E8E8E717171C9C9C991
            9191717171B8B8B88E8E8E717171AEAEAE666666FF00FFFF00FFFF00FFFF00FF
            A59585FFF0F0FFC8B0C08870E0D0C0F0C8B0C08870D0C0B0F0C8B0C08870D0B0
            A0866D55FF00FFFF00FFFF00FFFF00FF939393F2F2F2C8C8C8898989CECECEC7
            C7C7898989BEBEBEC7C7C7898989AFAFAF6B6B6BFF00FFFF00FFFF00FFFF00FF
            A59C94FFF0F0E0E0E0E0D8D0E0D0D0E0D0D0E0C8C0D0C8C0D0C0B0D0C0B0D0B8
            B0866D55FF00FFFF00FFFF00FFFF00FF9B9B9BF2F2F2E0E0E0D7D7D7D2D2D2D2
            D2D2C9C9C9C7C7C7BEBEBEBEBEBEB8B8B86B6B6BFF00FFFF00FFFF00FFFF00FF
            B4A494FFF8F09080D04030A0E0D8D09080D04030A0E0C8C09080D04030A0D0C0
            B0867564FF00FFFF00FFFF00FFFF00FFA2A2A2F7F7F7979797595959D7D7D797
            9797595959C9C9C9979797595959BEBEBE737373FF00FFFF00FFFF00FFFF00FF
            B4A4A3FFF8F0C0C0E09080D0E0E0E0C0C0E09080D0E0D0D0C0C0E09080D0D0C0
            C0957564FF00FFFF00FFFF00FFFF00FFA6A6A6F7F7F7C8C8C8979797E0E0E0C8
            C8C8979797D2D2D2C8C8C8979797C2C2C2757575FF00FFFF00FFFF00FFFF00FF
            B4ABA3FFF8FFFFE0D0FFD0B0FFD0B0FFC090F0B890D0A080D0A080D0B0A0D0C8
            C0957C73FF00FFFF00FFFF00FFFF00FFAAAAAAFAFAFAE0E0E0CECECECECECEBD
            BDBDB6B6B69E9E9E9E9E9EAFAFAFC7C7C77C7C7CFF00FFFF00FFFF00FFFF00FF
            B4ABA3FFFFFFFF9860FFA060FFA060FFA060FFA060FFA060FFA060B06850C0A8
            90958473FF00FFFF00FFFF00FFFF00FFAAAAAAFFFFFF9A9A9A9F9F9F9F9F9F9F
            9F9F9F9F9F9F9F9F9F9F9F6B6B6BA5A5A5828282FF00FFFF00FFFF00FFFF00FF
            B4B3A3FFFFFFE07840F0D8D0F0D8D0F0C8B0E0B0A0E0A080E08050A05830D0A0
            90958473FF00FFFF00FFFF00FFFF00FFB0B0B0FFFFFF7B7B7BD9D9D9D9D9D9C7
            C7C7B1B1B1A0A0A08282825A5A5AA1A1A1828282FF00FFFF00FFFF00FFFF00FF
            DAC7C0BEB3A9F0B8A0D09070D08860D08050D07040D06830C06030D08060A088
            80C6A891FF00FFFF00FFFF00FFFF00FFC7C7C7B2B2B2B8B8B890909088888880
            80807373736C6C6C646464838383888888A6A6A6FF00FFFF00FFFF00FFFF00FF
            FF00FFCCC4B3B0A8A0B0A8A0B0A090B09890B09890A09890A09080A08880C9AE
            98FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1C1C1A7A7A7A7A7A79E9E9E99
            99999999999797978E8E8E888888ACACACFF00FFFF00FFFF00FF}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = sbtnPopulateLabelsQtyClick
        end
        inherited Location: TUniLabel
          Top = 199
          TabOrder = 20
          ExplicitTop = 199
        end
        inherited Label3: TUniLabel
          Top = 4
          TabOrder = 21
          ExplicitTop = 4
        end
        inherited Label1: TUniLabel
          Top = 77
          TabOrder = 22
          ExplicitTop = 77
        end
        object lblShipTo: TUniLabel [15]
          Left = 8
          Top = 125
          Width = 35
          Height = 13
          Hint = ''
          Caption = 'Ship To'
          TabOrder = 41
        end
        object Shape9: TUniPanel [16]
          Left = 354
          Top = 176
          Width = 11
          Height = 11
          Hint = 'The associated BOM is marked inactive'
          ShowHint = True
          ParentShowHint = False
          TabOrder = 42
          Caption = ''
        end
        inherited Label5: TUniLabel
          Top = 151
          TabOrder = 23
          ExplicitTop = 151
        end
        inherited SBNewLabel: TUniSpeedButton
          Left = 349
          Top = 146
          ExplicitLeft = 349
          ExplicitTop = 146
        end
        inherited Label12: TUniLabel
          Top = 271
          TabOrder = 25
          ExplicitTop = 271
        end
        object EditBox: TUniEdit [20]
          Left = 153
          Top = 242
          Width = 70
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 9
          OnExit = EditBoxExit
        end
        object wwMfgNo: TUniDBLookupComboBox [21]
          Left = 153
          Top = 170
          Width = 190
          Height = 21
          Hint = ''
          ListFieldIndex = 0
          TabOrder = 6
          Color = clWindow
          OnChange = wwMfgNoChange
        end
        object wwPackage: TUniDBLookupComboBox [22]
          Left = 153
          Top = 218
          Width = 190
          Height = 21
          Hint = ''
          ListFieldIndex = 0
          TabOrder = 8
          Color = clWindow
        end
        object wwBillTo: TUniDBLookupComboBox [23]
          Left = 153
          Top = 97
          Width = 190
          Height = 21
          Hint = ''
          ListFieldIndex = 0
          TabOrder = 3
          Color = clWindow
        end
        inherited lblCountryOfOrigin: TUniLabel
          Top = 367
          TabOrder = 26
          ExplicitTop = 367
        end
        object EditBoxNum: TUniEdit [25]
          Left = 155
          Top = 290
          Width = 70
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 11
        end
        inherited lblPrinter: TUniLabel
          Top = 391
          TabOrder = 27
          ExplicitTop = 391
        end
        object editVolume: TUniEdit [27]
          Left = 155
          Top = 314
          Width = 70
          Height = 19
          Hint = ''
          Text = '0'
          TabOrder = 12
          Color = clBtnFace
          ReadOnly = True
        end
        object editWeight: TUniEdit [28]
          Left = 155
          Top = 338
          Width = 70
          Height = 21
          Hint = ''
          Text = '0'
          TabOrder = 13
        end
        object wwDBLookupComboCustomer: TUniDBLookupComboBox [29]
          Left = 153
          Top = 24
          Width = 190
          Height = 21
          Hint = ''
          ListFieldIndex = 0
          TabOrder = 1
          Color = clWindow
          OnChange = wwDBLookupComboCustomerChange
          OnDropDown = wwDBLookupComboCustomerDropDown
        end
        inherited lblLabelDispositionSetting: TUniLabel
          Top = 417
          TabOrder = 28
          ExplicitTop = 417
        end
        inherited LblAkaItemno: TUniLabel
          Top = 53
          ExplicitTop = 53
        end
        inherited EditQty: TUniEdit
          Left = 153
          Top = 73
          Height = 19
          TabOrder = 2
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          ExplicitLeft = 153
          ExplicitTop = 73
          ExplicitHeight = 19
        end
        inherited wwLabels: TUniDBLookupComboBox
          Left = 153
          Top = 146
          TabOrder = 5
          ExplicitLeft = 153
          ExplicitTop = 146
        end
        object cmbShipTo: TUniDBLookupComboBox [34]
          Left = 153
          Top = 122
          Width = 190
          Height = 21
          Hint = ''
          ListFieldIndex = 0
          TabOrder = 4
          Color = clWindow
          OnChange = cmbShipToChange
        end
        inherited EditLblQty: TUniEdit
          Left = 153
          Top = 266
          TabOrder = 10
          ExplicitLeft = 153
          ExplicitTop = 266
        end
        inherited edLotNo: TUniEdit
          Left = 153
          Top = 194
          TabOrder = 15
          ExplicitLeft = 153
          ExplicitTop = 194
        end
        inherited wwDBDateTimePickDate: TUniDBDateTimePicker
          Left = 153
          Top = 1
          ExplicitLeft = 153
          ExplicitTop = 1
        end
        inherited IQUDComboBoxCountryOfOrigin: TIQWebUDComboBox
          Left = 153
          Top = 362
          TabOrder = 14
          ExplicitLeft = 153
          ExplicitTop = 362
        end
        inherited wwDBComboPrinter: TUniDBComboBox
          Left = 153
          Top = 386
          TabOrder = 7
          ExplicitLeft = 153
          ExplicitTop = 386
        end
        inherited cmbLabelDispositionSetting: TUniComboBox
          Left = 153
          Top = 413
          TabOrder = 16
          ExplicitLeft = 153
          ExplicitTop = 413
        end
        inherited EdAkaItemno: TUniEdit
          Left = 153
          Top = 50
          TabOrder = 17
          ExplicitLeft = 153
          ExplicitTop = 50
        end
      end
    end
    inherited TabDimInv: TUniTabSheet
      ExplicitHeight = 442
      inherited gridDimInv: TIQUniGridControl
        Height = 415
        IQComponents.Grid.Height = 329
        IQComponents.HiddenPanel.Height = 329
        IQComponents.HiddenPanel.ExplicitHeight = 329
        IQComponents.FormTab.ExplicitHeight = 358
        Columns = <
          item
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        ExplicitHeight = 415
        Marker = 0
      end
    end
    inherited TabSheet2: TUniTabSheet
      ExplicitHeight = 442
      inherited sbUserDefined: TUniScrollBox
        Height = 442
        ExplicitHeight = 442
        ScrollHeight = 252
        inherited PnlUserDefined: TUniPanel
          inherited PnlClient01: TUniPanel
            inherited PnlClient02: TUniPanel
              inherited dbeCUSER1: TUniEdit
                Width = 68
                ExplicitWidth = 68
              end
              inherited dbeCUSER2: TUniEdit
                Width = 68
                ExplicitWidth = 68
              end
              inherited dbeCUSER3: TUniEdit
                Width = 68
                ExplicitWidth = 68
              end
              inherited dbeCUSER4: TUniEdit
                Width = 68
                ExplicitWidth = 68
              end
              inherited dbeCUSER5: TUniEdit
                Width = 68
                ExplicitWidth = 68
              end
              inherited dbeCUSER6: TUniEdit
                Width = 68
                ExplicitWidth = 68
              end
              inherited dbeCUSER7: TUniEdit
                Width = 68
                ExplicitWidth = 68
              end
              inherited dbeCUSER8: TUniEdit
                Width = 68
                ExplicitWidth = 68
              end
              inherited dbeCUSER9: TUniEdit
                Width = 68
                ExplicitWidth = 68
              end
              inherited dbeCUSER10: TUniEdit
                Width = 68
                ExplicitWidth = 68
              end
            end
          end
        end
      end
    end
  end
  inherited MainMenu1: TUniMainMenu
    Left = 8
    Top = 496
  end
  inherited SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'BtnOk'
      'cmbLabelDispositionSetting'
      'dbeCUSER1'
      'dbeCUSER10'
      'dbeCUSER2'
      'dbeCUSER3'
      'dbeCUSER4'
      'dbeCUSER5'
      'dbeCUSER6'
      'dbeCUSER7'
      'dbeCUSER8'
      'dbeCUSER9'
      'dbeNUSER1'
      'dbeNUSER10'
      'dbeNUSER2'
      'dbeNUSER3'
      'dbeNUSER4'
      'dbeNUSER5'
      'dbeNUSER6'
      'dbeNUSER7'
      'dbeNUSER8'
      'dbeNUSER9'
      'DefineLabelText1'
      'EditBox'
      'EditDate'
      'EditLblQty'
      'EditQty'
      'edLotNo'
      'NewLabel1'
      'sbEditBoxNum'
      'SBNewLabel'
      'wwBillTo'
      'wwDBComboPrinter'
      'wwLabels'
      'wwLocation'
      'wwMfgNo'
      'wwPackage')
    SecurityCode = 'FRMLM_MANU'
    Left = 78
    Top = 496
  end
  inherited PopupUserDefLabel: TUniPopupMenu
    Left = 116
    Top = 496
  end
  object StoredProc1: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.CRW_V_EDI_RECORDED_LM'
    Left = 44
    Top = 493
    ParamData = <
      item
        Position = 1
        Name = 'CRW_CURSOR'
        DataType = ftCursor
        FDDataType = dtCursorRef
        ParamType = ptInputOutput
      end
      item
        Name = 'V_ID'
        DataType = ftFMTBcd
        ParamType = ptInput
      end>
    object StoredProc1ID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object StoredProc1ISA_RECEIVER_CODE: TStringField
      FieldName = 'ISA_RECEIVER_CODE'
      Size = 255
    end
    object StoredProc1SU_SUPPLIER_CODE: TStringField
      FieldName = 'SU_SUPPLIER_CODE'
      Size = 255
    end
    object StoredProc1SF_N1_CODE: TStringField
      FieldName = 'SF_N1_CODE'
      Size = 255
    end
    object StoredProc1PCI_11Z: TStringField
      FieldName = 'PCI_11Z'
      Size = 255
    end
    object StoredProc1PCI_12Z: TStringField
      FieldName = 'PCI_12Z'
      Size = 255
    end
    object StoredProc1PCI_13Z: TStringField
      FieldName = 'PCI_13Z'
      Size = 255
    end
    object StoredProc1PCI_14Z: TStringField
      FieldName = 'PCI_14Z'
      Size = 255
    end
    object StoredProc1PCI_15Z: TStringField
      FieldName = 'PCI_15Z'
      Size = 255
    end
    object StoredProc1PCI_16Z: TStringField
      FieldName = 'PCI_16Z'
      Size = 255
    end
    object StoredProc1PCI_17Z: TStringField
      FieldName = 'PCI_17Z'
      Size = 255
    end
    object StoredProc1SHIP_TO_CUSER5: TStringField
      FieldName = 'SHIP_TO_CUSER5'
      Size = 60
    end
    object StoredProc1EDI_SHIP_TO_CODE: TStringField
      FieldName = 'EDI_SHIP_TO_CODE'
    end
    object StoredProc1CUST_REF: TStringField
      FieldName = 'CUST_REF'
      Size = 8
    end
    object StoredProc1EDIUSER1: TStringField
      FieldName = 'EDIUSER1'
      Size = 60
    end
    object StoredProc1EDIUSER2: TStringField
      FieldName = 'EDIUSER2'
      Size = 60
    end
    object StoredProc1EDIUSER3: TStringField
      FieldName = 'EDIUSER3'
      Size = 60
    end
    object StoredProc1EDIUSER4: TStringField
      FieldName = 'EDIUSER4'
      Size = 60
    end
    object StoredProc1EDIUSER5: TStringField
      FieldName = 'EDIUSER5'
      Size = 60
    end
    object StoredProc1EDIUSER6: TStringField
      FieldName = 'EDIUSER6'
      Size = 60
    end
    object StoredProc1EDIUSER7: TStringField
      FieldName = 'EDIUSER7'
      Size = 60
    end
    object StoredProc1EDIUSER8: TStringField
      FieldName = 'EDIUSER8'
      Size = 60
    end
    object StoredProc1EDIUSER9: TStringField
      FieldName = 'EDIUSER9'
      Size = 60
    end
    object StoredProc1EDIUSER10: TStringField
      FieldName = 'EDIUSER10'
      Size = 60
    end
    object StoredProc1EDIUSER11: TStringField
      FieldName = 'EDIUSER11'
      Size = 60
    end
    object StoredProc1EDIUSER12: TStringField
      FieldName = 'EDIUSER12'
      Size = 60
    end
    object StoredProc1EDIUSER13: TStringField
      FieldName = 'EDIUSER13'
      Size = 60
    end
    object StoredProc1EDIUSER14: TStringField
      FieldName = 'EDIUSER14'
      Size = 60
    end
    object StoredProc1EDIUSER15: TStringField
      FieldName = 'EDIUSER15'
      Size = 60
    end
  end
end
