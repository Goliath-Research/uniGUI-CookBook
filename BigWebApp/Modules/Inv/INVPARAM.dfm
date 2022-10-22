object FrmInvParams: TFrmInvParams
  Left = 242
  Top = 193
  HelpContext = 1308301
  ClientHeight = 270
  ClientWidth = 318
  Caption = 'Inventory Parameters'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  Font.Height = -13
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 318
    Height = 229
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object pcMain: TUniPageControl
      Left = 1
      Top = 1
      Width = 316
      Height = 227
      Hint = ''
      ActivePage = TabSheet1
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabSheet1: TUniTabSheet
        Hint = ''
        Caption = 'General'
        object PnlClient02: TUniPanel
          Left = 0
          Top = 0
          Width = 308
          Height = 102
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object Splitter1: TUniSplitter
            Left = 109
            Top = 0
            Width = 6
            Height = 102
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlLeft01: TUniPanel
            Left = 1
            Top = 1
            Width = 109
            Height = 100
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label20: TUniLabel
              Left = 8
              Top = 4
              Width = 56
              Height = 16
              Hint = ''
              ParentShowHint = False
              Caption = 'PO Safety'
              TabOrder = 1
            end
            object Label21: TUniLabel
              Left = 8
              Top = 28
              Width = 55
              Height = 16
              Hint = ''
              Caption = 'PO Scope'
              TabOrder = 2
            end
            object Label1: TUniLabel
              Left = 8
              Top = 52
              Width = 56
              Height = 16
              Hint = ''
              Caption = 'PO Range'
              TabOrder = 3
            end
            object Label2: TUniLabel
              Left = 8
              Top = 76
              Width = 88
              Height = 16
              Hint = ''
              Caption = 'FIFO Threshold'
              TabOrder = 4
            end
          end
          object PnlClient01: TUniPanel
            Left = 115
            Top = 1
            Width = 193
            Height = 100
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object dbePO_Safety: TUniDBEdit
              Left = 1
              Top = 1
              Width = 100
              Height = 21
              Hint = 'Global PO Safety time in days'
              ShowHint = True
              ParentShowHint = False
              DataField = 'PO_SAFETY'
              DataSource = SrcParams
              TabOrder = 0
            end
            object dbePO_Scope: TUniDBEdit
              Left = 1
              Top = 24
              Width = 100
              Height = 21
              Hint = 
                'Global production days worth of required material below reorder ' +
                'point to be included in single PO'
              ShowHint = True
              ParentShowHint = False
              DataField = 'PO_SCOPE'
              DataSource = SrcParams
              TabOrder = 1
            end
            object dbePO_Range: TUniDBEdit
              Left = 1
              Top = 48
              Width = 100
              Height = 21
              Hint = 
                'Global PO move range in days to consider when evaluating Ideal v' +
                's Exsiting POs'
              ShowHint = True
              ParentShowHint = False
              DataField = 'PO_MOVE_RANGE'
              DataSource = SrcParams
              TabOrder = 2
            end
            object dbeFifo: TUniDBEdit
              Left = 1
              Top = 72
              Width = 100
              Height = 21
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              DataField = 'FIFO_THRESHOLD'
              DataSource = SrcArinvt
              TabOrder = 3
            end
          end
        end
        object PnlCheckboxes: TUniPanel
          Left = 0
          Top = 102
          Width = 308
          Height = 73
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            308
            73)
          object sbtnTranCodes: TUniSpeedButton
            Left = 282
            Top = 16
            Width = 19
            Height = 19
            Hint = 'Edit Master Trans Codes List'
            ShowHint = True
            ParentShowHint = False
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333333333333333333333333333333333333300000003333333330FFFFF
              03333333330FFFFF03333333330F00FF033333333300B0FF03333333330B0FFF
              0333333330B0FFFF033333330B0FF00F03333330B00FFFFF0333330B03000000
              0333339033333333333333333333333333333333333333333333}
            Caption = ''
            Anchors = [akTop, akRight]
            ParentColor = False
            Color = clWindow
            OnClick = sbtnTranCodesClick
          end
          object dbchkDeleteEmptyLoc: TUniDBCheckBox
            Left = 8
            Top = 1
            Width = 137
            Height = 17
            Hint = 'Deletes locations when a transaction brings the quantity to zero'
            ShowHint = True
            ParentShowHint = False
            DataField = 'DEL_EMPTY_FGMULTI'
            DataSource = SrcParams
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Delete Empty Location'
            TabOrder = 0
          end
          object DBCheckBox1: TUniDBCheckBox
            Left = 8
            Top = 18
            Width = 145
            Height = 17
            Hint = 'Transaction Code is Mandatory for Add/Remove Transactions'
            ShowHint = True
            ParentShowHint = False
            DataField = 'USE_TRANS_CODE'
            DataSource = SrcParams
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Trans Code is Mandatory'
            TabOrder = 1
          end
          object DBCheckBox2: TUniDBCheckBox
            Left = 8
            Top = 36
            Width = 232
            Height = 17
            Hint = 
              'MRB Elements Approval Required to Move from Non-Conform Location' +
              's'
            ShowHint = True
            ParentShowHint = False
            DataField = 'CHECK_MRB_ON_NON_CONFORM_MOVE'
            DataSource = SrcParams
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Non Conform move requires MRB completed'
            TabOrder = 2
          end
          object DBCheckBox3: TUniDBCheckBox
            Left = 8
            Top = 54
            Width = 232
            Height = 17
            Hint = ''
            ShowHint = True
            ParentShowHint = False
            DataField = 'ALLOW_IN_TRANSIT_NEGATIVE'
            DataSource = SrcParams
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Allow To Drive In Transit Location Negative'
            TabOrder = 3
          end
        end
      end
      object TabSheet2: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'Location / Package UOMs'
        object Panel1: TUniPanel
          Left = 0
          Top = 0
          Width = 308
          Height = 126
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object Splitter2: TUniSplitter
            Left = 109
            Top = 0
            Width = 6
            Height = 126
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object Panel2: TUniPanel
            Left = 1
            Top = 1
            Width = 109
            Height = 124
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label3: TUniLabel
              Left = 8
              Top = 4
              Width = 104
              Height = 16
              Hint = ''
              ParentShowHint = False
              Caption = 'Location Dim UOM'
              TabOrder = 1
            end
            object Label4: TUniLabel
              Left = 8
              Top = 52
              Width = 85
              Height = 16
              Hint = ''
              Caption = 'Case Dim UOM'
              TabOrder = 2
            end
            object Label5: TUniLabel
              Left = 8
              Top = 76
              Width = 88
              Height = 16
              Hint = ''
              Caption = 'Pallet Dim UOM'
              TabOrder = 3
            end
            object Label6: TUniLabel
              Left = 8
              Top = 100
              Width = 75
              Height = 16
              Hint = ''
              Caption = 'Weight UOM '
              TabOrder = 4
            end
            object Label7: TUniLabel
              Left = 8
              Top = 28
              Width = 90
              Height = 16
              Hint = ''
              ParentShowHint = False
              Caption = 'Loose Dim UOM'
              TabOrder = 5
            end
          end
          object Panel3: TUniPanel
            Left = 115
            Top = 1
            Width = 193
            Height = 124
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object comboLocationUOM: TUniDBComboBox
              Left = 1
              Top = 1
              Width = 100
              Height = 24
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              DataField = 'LOCATION_DIM_UOM'
              DataSource = SrcParams
              Style = csDropDownList
              Items.Strings = (
                'FT'
                'IN'
                'M'
                'CM'
                'YD')
              TabOrder = 0
            end
            object wwDBComboBox1: TUniDBComboBox
              Left = 1
              Top = 49
              Width = 100
              Height = 24
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              DataField = 'CASE_DIM_UOM'
              DataSource = SrcParams
              Style = csDropDownList
              Items.Strings = (
                'FT'
                'IN'
                'M'
                'CM'
                'YD')
              TabOrder = 2
            end
            object wwDBComboBox2: TUniDBComboBox
              Left = 1
              Top = 73
              Width = 100
              Height = 24
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              DataField = 'PALLET_DIM_UOM'
              DataSource = SrcParams
              Style = csDropDownList
              Items.Strings = (
                'FT'
                'IN'
                'M'
                'CM'
                'YD')
              TabOrder = 3
            end
            object wwDBComboBoxWeightUOM: TUniDBComboBox
              Left = 1
              Top = 97
              Width = 100
              Height = 24
              Hint = ''
              DataField = 'WEIGHT_UOM'
              DataSource = SrcParams
              Style = csDropDownList
              Items.Strings = (
                'LBS'
                'OZ'
                'KG'
                'GR')
              TabOrder = 4
            end
            object wwDBComboBox3: TUniDBComboBox
              Left = 1
              Top = 25
              Width = 100
              Height = 24
              Hint = ''
              ShowHint = True
              ParentShowHint = False
              DataField = 'LOOSE_DIM_UOM'
              DataSource = SrcParams
              Style = csDropDownList
              Items.Strings = (
                'FT'
                'IN'
                'M'
                'CM'
                'YD')
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  object PnlToolbar: TUniPanel
    Left = 0
    Top = 229
    Width = 318
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      318
      41)
    object btnOK: TUniButton
      Left = 110
      Top = 6
      Width = 97
      Height = 25
      Hint = ''
      Caption = 'OK'
      Anchors = [akRight, akBottom]
      TabOrder = 1
      OnClick = btnOKClick
    end
    object btnCancel: TUniButton
      Left = 214
      Top = 6
      Width = 97
      Height = 25
      Hint = ''
      Caption = 'Cancel'
      Cancel = True
      Anchors = [akRight, akBottom]
      TabOrder = 2
      OnClick = btnCancelClick
    end
  end
  object SrcParams: TDataSource
    DataSet = TblParams
    Left = 272
    Top = 25
  end
  object TblParams: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PARAMS'
    TableName = 'PARAMS'
    Left = 272
    Top = 39
  end
  object SrcArinvt: TDataSource
    DataSet = QryArinvt
    Left = 240
    Top = 24
  end
  object QryArinvt: TFDQuery
    BeforeOpen = QryArinvtBeforeOpen
    AfterPost = ApplyUpdates
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'ARINVT'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id, fifo_threshold from arinvt where id = :arinvt_id')
    Left = 240
    Top = 40
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryArinvtID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ARINVT.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object QryArinvtFIFO_THRESHOLD: TBCDField
      FieldName = 'FIFO_THRESHOLD'
      Origin = 'IQ.ARINVT.FIFO_THRESHOLD'
      Size = 2
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into arinvt'
      '  (FIFO_THRESHOLD)'
      'values'
      '  (:FIFO_THRESHOLD)')
    ModifySQL.Strings = (
      'update arinvt'
      'set'
      '  FIFO_THRESHOLD = :FIFO_THRESHOLD'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from arinvt'
      'where'
      '  ID = :OLD_ID')
    Left = 239
    Top = 66
  end
end
