inherited FrmLM_Reject: TFrmLM_Reject
  ClientHeight = 373
  ClientWidth = 463
  Caption = 'Print Label (Rejects)'
  ExplicitWidth = 479
  ExplicitHeight = 432
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TUniPanel
    Width = 463
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitWidth = 463
  end
  inherited Panel1: TUniPanel
    Top = 340
    Width = 463
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitTop = 340
    ExplicitWidth = 463
    inherited Panel2: TUniPanel
      Left = 253
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 253
      inherited BtnOk: TUniButton
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
      end
      inherited BtnCancel: TUniButton
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
      end
    end
  end
  inherited PageControl1: TUniPageControl
    Width = 463
    Height = 335
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitWidth = 463
    ExplicitHeight = 335
    inherited TabSheet1: TUniTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 455
      ExplicitHeight = 307
      inherited Panel8: TUniPanel
        Width = 455
        Height = 307
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitWidth = 457
        ExplicitHeight = 312
        inherited Location: TUniLabel
          Top = 131
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 20
          ExplicitTop = 131
        end
        inherited Label3: TUniLabel
          Top = 11
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 21
          ExplicitTop = 11
        end
        inherited Label1: TUniLabel
          Top = 203
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 22
          ExplicitTop = 203
        end
        inherited Label5: TUniLabel
          Top = 83
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 23
          ExplicitTop = 83
        end
        inherited SBNewLabel: TUniSpeedButton
          Left = 414
          Top = 80
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitLeft = 414
          ExplicitTop = 80
        end
        inherited Label12: TUniLabel
          Top = 227
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitTop = 227
        end
        inherited lblCountryOfOrigin: TUniLabel
          Top = 423
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Visible = False
          ExplicitTop = 423
        end
        inherited lblPrinter: TUniLabel
          Top = 251
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitTop = 251
        end
        inherited lblLabelDispositionSetting: TUniLabel
          Left = 7
          Top = 450
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Visible = False
          ExplicitLeft = 7
          ExplicitTop = 450
        end
        object lblArinvtItemno: TUniLabel [9]
          Left = 8
          Top = 34
          Width = 84
          Height = 13
          Hint = ''
          Caption = 'Inventory Item #'
          TabOrder = 25
        end
        object lblArinvtDescrip: TUniLabel [10]
          Left = 8
          Top = 58
          Width = 129
          Height = 13
          Hint = ''
          Caption = 'Inventory Item Description'
          TabOrder = 26
        end
        object Label9: TUniLabel [11]
          Left = 7
          Top = 107
          Width = 80
          Height = 13
          Hint = ''
          Caption = 'Manufacturing #'
          TabOrder = 27
        end
        object Shape9: TUniPanel [12]
          Left = 420
          Top = 108
          Width = 11
          Height = 11
          Hint = 'The associated BOM is marked inactive'
          ShowHint = True
          ParentShowHint = False
          TabOrder = 28
          Caption = ''
        end
        object lblRejectCode: TUniLabel [13]
          Left = 7
          Top = 155
          Width = 59
          Height = 13
          Hint = ''
          Caption = 'Reject Code'
          TabOrder = 29
        end
        object Label2: TUniLabel [14]
          Left = 8
          Top = 178
          Width = 79
          Height = 13
          Hint = ''
          Caption = 'Reject Comment'
          TabOrder = 30
        end
        inherited LblAkaItemno: TUniLabel
          Top = 397
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Visible = False
          ExplicitTop = 397
        end
        inherited EditQty: TUniEdit
          Top = 200
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 8
          ExplicitTop = 200
        end
        inherited wwLabels: TUniDBLookupComboBox
          Top = 80
          Width = 256
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 3
          ExplicitTop = 80
          ExplicitWidth = 256
        end
        inherited EditLblQty: TUniEdit
          Top = 224
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 9
          ExplicitTop = 224
        end
        inherited edLotNo: TUniEdit
          Top = 128
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 5
          ExplicitTop = 128
        end
        inherited wwDBDateTimePickDate: TUniDBDateTimePicker
          Top = 8
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitTop = 8
        end
        inherited IQUDComboBoxCountryOfOrigin: TIQWebUDComboBox
          Top = 420
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Visible = False
          TabOrder = 12
          ExplicitTop = 420
        end
        inherited wwDBComboPrinter: TUniDBComboBox
          Top = 248
          Width = 256
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabOrder = 10
          ExplicitTop = 248
          ExplicitWidth = 256
        end
        inherited cmbLabelDispositionSetting: TUniComboBox
          Top = 447
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Visible = False
          TabOrder = 13
          ExplicitTop = 447
        end
        inherited EdAkaItemno: TUniEdit
          Top = 395
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Visible = False
          TabOrder = 11
          ExplicitTop = 395
        end
        object edtArinvtItemno: TUniEdit
          Left = 152
          Top = 32
          Width = 256
          Height = 19
          Hint = ''
          Text = ''
          TabOrder = 1
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object edtArinvtDescrip: TUniEdit
          Left = 152
          Top = 56
          Width = 256
          Height = 19
          Hint = ''
          Text = ''
          TabOrder = 2
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object wwMfgNo: TUniDBLookupComboBox
          Left = 152
          Top = 104
          Width = 256
          Height = 21
          Hint = ''
          ListFieldIndex = 0
          TabOrder = 4
          Color = clWindow
        end
        object cmbRejectCode: TUniDBLookupComboBox
          Left = 152
          Top = 152
          Width = 190
          Height = 21
          Hint = ''
          ListFieldIndex = 0
          TabOrder = 6
          ReadOnly = True
          Color = clBtnFace
        end
        object edtRejectComment: TUniEdit
          Left = 152
          Top = 176
          Width = 256
          Height = 19
          Hint = ''
          Text = ''
          TabOrder = 7
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
      end
    end
    inherited TabDimInv: TUniTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 455
      ExplicitHeight = 307
      inherited pnlDimInvTop: TUniPanel
        Width = 455
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitWidth = 455
        inherited navDimInv: TUniDBNavigator
          Left = 373
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitLeft = 373
        end
        inherited PnlLegend: TUniPanel
          Left = 341
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          ExplicitLeft = 341
          inherited shpCalculated: TUniPanel
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
          end
        end
      end
      inherited gridDimInv: TIQUniGridControl
        Width = 455
        Height = 280
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        IQComponents.Grid.Width = 238
        IQComponents.Grid.Height = 194
        IQComponents.HiddenPanel.Left = 238
        IQComponents.HiddenPanel.Height = 194
        IQComponents.HiddenPanel.ExplicitLeft = 238
        IQComponents.HiddenPanel.ExplicitHeight = 194
        IQComponents.FormTab.ExplicitLeft = 4
        IQComponents.FormTab.ExplicitTop = 24
        IQComponents.FormTab.ExplicitWidth = 447
        IQComponents.FormTab.ExplicitHeight = 223
        Columns = <
          item
            FieldName = 'NAME'
            Title.Caption = 'Dim/Characteristic'
            Width = 210
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NVALUE'
            Title.Caption = 'Value'
            Width = 91
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        ExplicitWidth = 455
        ExplicitHeight = 280
        Marker = 0
      end
    end
    inherited TabSheet2: TUniTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitWidth = 455
      ExplicitHeight = 307
      inherited sbUserDefined: TUniScrollBox
        Width = 455
        Height = 307
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitWidth = 455
        ExplicitHeight = 307
        ScrollHeight = 252
        inherited PnlUserDefined: TUniPanel
          Width = 453
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitWidth = 453
          inherited Splitter3: TUniSplitter
            Left = 263
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitLeft = 263
          end
          inherited PnlClient01: TUniPanel
            Width = 262
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitWidth = 262
            inherited Splitter1: TUniSplitter
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
            end
            inherited PnlUDLeft01: TUniPanel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              inherited IQUserDefLabel1: TIQWebUserDefLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited IQUserDefLabel2: TIQWebUserDefLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited IQUserDefLabel3: TIQWebUserDefLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited IQUserDefLabel7: TIQWebUserDefLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited IQUserDefLabel8: TIQWebUserDefLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited IQUserDefLabel9: TIQWebUserDefLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited IQUserDefLabel13: TIQWebUserDefLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited IQUserDefLabel14: TIQWebUserDefLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited IQUserDefLabel15: TIQWebUserDefLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited IQUserDefLabel19: TIQWebUserDefLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
            end
            inherited PnlClient02: TUniPanel
              Width = 173
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              ExplicitWidth = 173
              DesignSize = (
                173
                248)
              inherited dbeCUSER1: TUniEdit
                Width = 122
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitWidth = 122
                ExplicitHeight = 25
              end
              inherited dbeCUSER2: TUniEdit
                Width = 122
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitWidth = 122
                ExplicitHeight = 25
              end
              inherited dbeCUSER3: TUniEdit
                Width = 122
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitWidth = 122
                ExplicitHeight = 25
              end
              inherited dbeCUSER4: TUniEdit
                Width = 122
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitWidth = 122
                ExplicitHeight = 25
              end
              inherited dbeCUSER5: TUniEdit
                Width = 122
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitWidth = 122
                ExplicitHeight = 25
              end
              inherited dbeCUSER6: TUniEdit
                Width = 122
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitWidth = 122
                ExplicitHeight = 25
              end
              inherited dbeCUSER7: TUniEdit
                Width = 122
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitWidth = 122
                ExplicitHeight = 25
              end
              inherited dbeCUSER8: TUniEdit
                Width = 122
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitWidth = 122
                ExplicitHeight = 25
              end
              inherited dbeCUSER9: TUniEdit
                Width = 122
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitWidth = 122
                ExplicitHeight = 25
              end
              inherited dbeCUSER10: TUniEdit
                Width = 122
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitWidth = 122
                ExplicitHeight = 25
              end
            end
          end
          inherited PnlUDRight01: TUniPanel
            Left = 267
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitLeft = 267
            inherited Splitter2: TUniSplitter
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
            end
            inherited PnlUDLeft02: TUniPanel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              inherited IQUserDefLabel4: TIQWebUserDefLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited IQUserDefLabel5: TIQWebUserDefLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited IQUserDefLabel6: TIQWebUserDefLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited IQUserDefLabel10: TIQWebUserDefLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited IQUserDefLabel11: TIQWebUserDefLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited IQUserDefLabel12: TIQWebUserDefLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited IQUserDefLabel16: TIQWebUserDefLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited IQUserDefLabel17: TIQWebUserDefLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited IQUserDefLabel18: TIQWebUserDefLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited IQUserDefLabel20: TIQWebUserDefLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
            end
            inherited PnlClient03: TUniPanel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              inherited dbeNUSER1: TUniEdit
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitHeight = 25
              end
              inherited dbeNUSER2: TUniEdit
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitHeight = 25
              end
              inherited dbeNUSER3: TUniEdit
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitHeight = 25
              end
              inherited dbeNUSER4: TUniEdit
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitHeight = 25
              end
              inherited dbeNUSER5: TUniEdit
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitHeight = 25
              end
              inherited dbeNUSER6: TUniEdit
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitHeight = 25
              end
              inherited dbeNUSER7: TUniEdit
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitHeight = 25
              end
              inherited dbeNUSER8: TUniEdit
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitHeight = 25
              end
              inherited dbeNUSER9: TUniEdit
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitHeight = 25
              end
              inherited dbeNUSER10: TUniEdit
                Height = 25
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitHeight = 25
              end
            end
          end
        end
      end
    end
  end
  object SrcRejects: TDataSource
    Left = 252
  end
  object QryRejectCode: TFDQuery
    BeforeOpen = QryRejectCodeBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select reject_code as reject_code,'
      '       attribute as attribute,'
      '       eplant_id as eplant_id,'
      
        '       substr(rt_misc.reject_code_source( id, :standard_id, :wor' +
        'k_center_id ), 1, 20) as source,'
      '       mfgcell_id, id,'
      
        '      (select seq from standard_reject_code where standard_id = ' +
        ':standard_id and reject_code_id = reject_code.id) as seq'
      '  from reject_code'
      ' where NVL(pk_hide,'#39'N'#39') <> '#39'Y'#39' and'
      
        '       ( rt_misc.filter_reject_code( id, :standard_id, :work_cen' +
        'ter_id ) = 3    /* nothing is setup in bom or work center*/'
      '         and'
      '         misc.eplant_filter_include_nulls( eplant_id ) = 1'
      '         and'
      
        '         rt_misc.filter_mfgcell( :bom_mfgcell_id, mfgcell_id ) =' +
        ' 1 )'
      ''
      '       OR'
      ''
      
        '         rt_misc.filter_reject_code( id, :standard_id, :work_cen' +
        'ter_id ) in (1,2)'
      
        'ORDER BY (select seq from standard_reject_code where standard_id' +
        ' = :standard_id and reject_code_id = reject_code.id),'
      '         reject_code')
    Left = 256
    Top = 16
    ParamData = <
      item
        Name = 'BOM_MFGCELL_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'work_center_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'standard_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryRejectCodeREJECT_CODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 14
      FieldName = 'REJECT_CODE'
      Origin = 'REJECT_CODE.REJECT_CODE'
      Size = 5
    end
    object QryRejectCodeATTRIBUTE: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 100
      FieldName = 'ATTRIBUTE'
      Origin = 'REJECT_CODE.ATTRIBUTE'
      Size = 100
    end
    object QryRejectCodeEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.REJECT_CODE.EPLANT_ID'
      Visible = False
      Size = 0
    end
    object QryRejectCodeSEQ: TFMTBCDField
      FieldName = 'SEQ'
      Visible = False
      Size = 38
    end
    object QryRejectCodeSOURCE: TStringField
      FieldName = 'SOURCE'
      Visible = False
    end
    object QryRejectCodeMFGCELL_ID: TBCDField
      FieldName = 'MFGCELL_ID'
      Visible = False
      Size = 0
    end
    object QryRejectCodeID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object DataSource1: TDataSource
    Left = 56
    Top = 205
  end
end
