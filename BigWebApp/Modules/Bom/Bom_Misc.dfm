object FrmBomMiscParam: TFrmBomMiscParam
  Left = 278
  Top = 182
  HelpContext = 1215494
  ClientHeight = 297
  ClientWidth = 450
  Caption = 'Miscellaneous Parameters'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object btnOK: TUniButton
    Left = 238
    Top = 264
    Width = 97
    Height = 25
    Hint = ''
    Caption = '&OK'
    TabOrder = 0
    OnClick = btnOKClick
  end
  object btnCancel: TUniButton
    Left = 341
    Top = 264
    Width = 97
    Height = 25
    Hint = ''
    Caption = '&Cancel'
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object PageControl1: TUniPageControl
    Left = 7
    Top = 7
    Width = 434
    Height = 250
    Hint = ''
    ActivePage = TabSheet1
    TabBarVisible = True
    TabOrder = 2
    object TabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'General'
      DesignSize = (
        426
        222)
      object wwDataInspector1: TwwDataInspector
        Left = 1
        Top = 2
        Width = 424
        Height = 220
        DisableThemes = False
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        DataSource = DataSource1
        Items = <
          item
            DataSource = DataSource1
            Caption = 'Default'
            ReadOnly = True
            Expanded = True
            Items = <
              item
                DataSource = SrcParams
                DataField = 'EFF_FACTOR'
                Caption = 'Efficiency Factor '
                WordWrap = False
              end>
            WordWrap = False
          end
          item
            DataSource = DataSource1
            Caption = 'Mfg'
            ReadOnly = True
            Expanded = True
            Items = <
              item
                DataSource = DataSource1
                DataField = 'EFFECT_DATE'
                Caption = 'Effective Date'
                WordWrap = False
              end
              item
                DataSource = DataSource1
                DataField = 'DEACTIVE_DATE'
                Caption = 'Inactive Date'
                WordWrap = False
              end>
            WordWrap = False
          end
          item
            DataSource = DataSource1
            Caption = 'Switches'
            ReadOnly = True
            Expanded = True
            Items = <
              item
                DataSource = DataSource1
                DataField = 'CHK_AVAIL_RG_PRCNT'
                Caption = 'Check Available Regrind % in lbs/k Calculation'
                PickList.Items.Strings = (
                  'Y'
                  'N')
                PickList.Style = csDropDownList
                PickList.DisplayAsCheckbox = True
                TagString = 'Check_Available_Regrind'
                WordWrap = False
              end>
            TagString = 'Switches'
            WordWrap = False
          end>
        DefaultRowHeight = 18
        CaptionWidth = 262
        Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        LineStyleCaption = ovDottedLine
        LineStyleData = ovDottedLine
      end
    end
    object TabSheet2: TUniTabSheet
      Hint = ''
      Caption = 'Scheduling'
      DesignSize = (
        426
        222)
      object wwDataInspector2: TwwDataInspector
        Left = 3
        Top = 3
        Width = 423
        Height = 219
        DisableThemes = False
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        DataSource = SrcParams
        Items = <
          item
            DataSource = SrcParams
            Caption = 'Planning Fence (in days)'
            ReadOnly = True
            Expanded = True
            Items = <
              item
                DataSource = SrcParams
                DataField = 'PLANNING_FENCE'
                Caption = 'Default Planning Fence'
                WordWrap = False
              end
              item
                DataSource = DataSource1
                DataField = 'PLANNING_FENCE'
                Caption = 'Manufacturing Planning Fence'
                WordWrap = False
              end>
            WordWrap = False
          end
          item
            DataSource = SrcParams
            Caption = 'Scopes (in days)  '
            ReadOnly = True
            Expanded = True
            Items = <
              item
                DataSource = SrcParams
                Caption = 'Default'
                ReadOnly = True
                Expanded = True
                Items = <
                  item
                    DataSource = SrcParams
                    DataField = 'SCHED_SCOPE'
                    Caption = 'Scheduling Scope'
                    WordWrap = False
                  end
                  item
                    DataSource = SrcParams
                    DataField = 'MFG_SCOPE'
                    Caption = 'Manufacturing Run Size'
                    WordWrap = False
                  end>
                WordWrap = False
              end
              item
                DataSource = SrcParams
                Caption = 'Manufacturing'
                ReadOnly = True
                Expanded = True
                Items = <
                  item
                    DataSource = DataSource1
                    DataField = 'RUNSCOPE'
                    Caption = 'Manufacturing Run Size'
                    TagString = 'MFG_RUNSCOPE'
                    WordWrap = False
                  end>
                WordWrap = False
              end>
            WordWrap = False
          end
          item
            DataSource = DataSource1
            DataField = 'START_MAT_QTY'
            Caption = 'Start-up Primary Material'
            Items = <
              item
                DataSource = DataSource1
                DataField = 'INCLUDE_START_MAT_IN_STD_COST'
                Caption = 'Include in Std Cost'
                PickList.Items.Strings = (
                  'Y'
                  'N')
                PickList.Style = csDropDownList
                PickList.DisplayAsCheckbox = True
                WordWrap = False
              end>
            WordWrap = False
          end
          item
            DataSource = DataSource1
            DataField = 'AlternateItemCode'
            Caption = 'Alternate Item Code'
            ReadOnly = True
            CustomControl = wwDBComboDlgAlternateItemCode
            TagString = 'AlternateItemCode'
            WordWrap = False
          end>
        DefaultRowHeight = 18
        CaptionWidth = 212
        Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
        CaptionFont.Charset = DEFAULT_CHARSET
        CaptionFont.Color = clWindowText
        CaptionFont.Height = -11
        CaptionFont.Name = 'Tahoma'
        CaptionFont.Style = []
        LineStyleCaption = ovDottedLine
        LineStyleData = ovDottedLine
        object wwDBComboDlgAlternateItemCode: TUniEdit
          Left = 216
          Top = 176
          Width = 205
          Height = 17
          Hint = ''
          Visible = False
          BorderStyle = ubsNone
          Text = ''
          TabOrder = 0
          TabStop = False
          ReadOnly = True
          OnKeyDown = wwDBComboDlgAlternateItemCodeKeyDown
        end
      end
    end
    object TabSheet3: TUniTabSheet
      Hint = ''
      Caption = 'Labor Rate'
      object PnlLaborRate: TUniPanel
        Tag = 1999
        Left = 0
        Top = 0
        Width = 426
        Height = 222
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Splitter1: TUniSplitter
          Left = 102
          Top = 0
          Width = 6
          Height = 222
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlLaborRateLeft: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 102
          Height = 220
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label1: TUniLabel
            Left = 8
            Top = 12
            Width = 63
            Height = 13
            Hint = ''
            Caption = 'Current Rate'
            TabOrder = 1
          end
          object Label2: TUniLabel
            Left = 8
            Top = 36
            Width = 58
            Height = 13
            Hint = ''
            Caption = 'Future Rate'
            TabOrder = 2
          end
          object Label3: TUniLabel
            Left = 8
            Top = 60
            Width = 60
            Height = 13
            Hint = ''
            Caption = 'Budget Rate'
            TabOrder = 3
          end
          object Label4: TUniLabel
            Left = 8
            Top = 84
            Width = 68
            Height = 13
            Hint = ''
            Caption = 'Forecast Rate'
            TabOrder = 4
          end
        end
        object PnlLaborRateClient: TUniPanel
          Tag = 1999
          Left = 108
          Top = 1
          Width = 318
          Height = 220
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object dbeLaborRate: TUniDBEdit
            Left = 1
            Top = 8
            Width = 68
            Height = 21
            Hint = ''
            DataField = 'LABOR_RATE'
            DataSource = DataSource1
            TabOrder = 0
          end
          object btnDefaultLabor: TUniButton
            Left = 80
            Top = 8
            Width = 132
            Height = 25
            Hint = 'Set default labor rate as associated with the MfgType'
            ShowHint = True
            ParentShowHint = False
            Caption = '&Set to Default'
            TabOrder = 5
            OnClick = btnDefaultLaborClick
          end
          object dbeFutureRate: TUniDBEdit
            Left = 1
            Top = 33
            Width = 68
            Height = 21
            Hint = ''
            DataField = 'FUTURE_LABOR_RATE'
            DataSource = DataSource1
            TabOrder = 2
          end
          object dbeBudgetRate: TUniDBEdit
            Left = 1
            Top = 57
            Width = 68
            Height = 21
            Hint = ''
            DataField = 'BUDGET_LABOR_RATE'
            DataSource = DataSource1
            TabOrder = 3
          end
          object dbeForecastRate: TUniDBEdit
            Left = 1
            Top = 81
            Width = 68
            Height = 21
            Hint = ''
            DataField = 'FORECAST_LABOR_RATE'
            DataSource = DataSource1
            TabOrder = 4
          end
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = PkAlternateItemCode
    Left = 254
    Top = 92
  end
  object SrcParams: TDataSource
    DataSet = TblParams
    Left = 56
    Top = 156
  end
  object TblParams: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'PARAMS'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'PARAMS'
    Left = 56
    Top = 88
    object TblParamsSCHED_SCOPE: TBCDField
      FieldName = 'SCHED_SCOPE'
      Size = 0
    end
    object TblParamsMFG_SCOPE: TBCDField
      FieldName = 'MFG_SCOPE'
      Size = 0
    end
    object TblParamsEFF_FACTOR: TBCDField
      FieldName = 'EFF_FACTOR'
      Size = 2
    end
    object TblParamsPLANNING_FENCE: TBCDField
      FieldName = 'PLANNING_FENCE'
      Size = 0
    end
    object TblParamsID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object PkAlternateItemCode: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       code,'
      '       descrip'
      '  from alternate_item_code'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 256
    Top = 156
    object PkAlternateItemCodeID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ALTERNATE_ITEM_CODE.ID'
      Visible = False
      Size = 0
    end
    object PkAlternateItemCodeCODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'CODE'
      Origin = 'IQ.ALTERNATE_ITEM_CODE.CODE'
      Size = 25
    end
    object PkAlternateItemCodeDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.ALTERNATE_ITEM_CODE.DESCRIP'
      Size = 50
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMBOMMISCPARAM')
    SecurityItems.Strings = (
      'TblParams'
      'btnOK'
      'dbeLaborRate'
      'btnDefaultLabor'
      'TblStandardPLANNING_FENCE'
      'TblStandardRUNSCOPE'
      'TblStandardSTART_MAT_QTY'
      'TblStandardINCLUDE_START_MAT_IN_STD_COST'
      'TblParamsSCHED_SCOPE'
      'TblParamsMFG_SCOPE'
      'TblParamsEFF_FACTOR'
      'TblParamsPLANNING_FENCE'
      'TblStandardALTERNATE_ITEM_CODE_ID')
    SecurityCode = 'FRMBOMMISCPARAM'
    Left = 140
    Top = 164
  end
end
