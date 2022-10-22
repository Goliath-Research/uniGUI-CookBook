object Frm_Frl: TFrm_Frl
  Left = 62
  Top = 182
  ClientHeight = 262
  ClientWidth = 493
  Caption = 'FRx Control Form'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PC: TUniPageControl
    Left = 0
    Top = 0
    Width = 493
    Height = 262
    Hint = ''
    ActivePage = TabEntity
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabEntity: TUniTabSheet
      Hint = ''
      ImageIndex = 1
      Caption = 'Entity Table'
      object PCEntity: TUniPageControl
        Left = 0
        Top = 27
        Width = 485
        Height = 207
        Hint = ''
        ActivePage = TabForm
        TabBarVisible = True
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object TabForm: TUniTabSheet
          Hint = ''
          Caption = 'TabForm'
          object Label5: TUniLabel
            Left = 5
            Top = 16
            Width = 95
            Height = 13
            Hint = ''
            Caption = 'FRx Company Code'
            TabOrder = 11
          end
          object Label6: TUniLabel
            Left = 5
            Top = 46
            Width = 53
            Height = 13
            Hint = ''
            Caption = 'Description'
            TabOrder = 12
          end
          object Label7: TUniLabel
            Left = 265
            Top = 16
            Width = 72
            Height = 13
            Hint = ''
            Caption = 'Account length'
            TabOrder = 13
          end
          object Label8: TUniLabel
            Left = 265
            Top = 46
            Width = 57
            Height = 13
            Hint = ''
            Caption = 'Mask length'
            TabOrder = 14
          end
          object Label9: TUniLabel
            Left = 265
            Top = 78
            Width = 66
            Height = 13
            Hint = ''
            Caption = 'Account mask'
            TabOrder = 15
          end
          object Label10: TUniLabel
            Left = 265
            Top = 108
            Width = 73
            Height = 13
            Hint = ''
            Caption = 'Max. segments'
            TabOrder = 16
          end
          object Label11: TUniLabel
            Left = 265
            Top = 138
            Width = 65
            Height = 13
            Hint = ''
            Caption = 'Nat. segment'
            TabOrder = 17
          end
          object Label12: TUniLabel
            Left = 5
            Top = 161
            Width = 122
            Height = 13
            Hint = ''
            Caption = 'Reporting Currency Code'
            TabOrder = 18
          end
          object DBUseProj: TUniDBCheckBox
            Left = 5
            Top = 76
            Width = 153
            Height = 17
            Hint = ''
            DataField = 'USE_PROJECTS'
            DataSource = SrcEntity
            ValueChecked = '1'
            ValueUnchecked = '0'
            Caption = 'Use Projects (Ref_Codes)'
            TabOrder = 2
          end
          object DBUseMc: TUniDBCheckBox
            Left = 5
            Top = 106
            Width = 153
            Height = 17
            Hint = ''
            DataField = 'USE_MULTI_CURR'
            DataSource = SrcEntity
            ValueChecked = '1'
            ValueUnchecked = '0'
            Caption = 'Use Multi-Currency'
            TabOrder = 3
          end
          object DBDetTrack: TUniDBCheckBox
            Left = 5
            Top = 136
            Width = 153
            Height = 17
            Hint = ''
            DataField = 'USE_TRANS_DETL'
            DataSource = SrcEntity
            ValueChecked = '1'
            ValueUnchecked = '0'
            Caption = 'Detail Transaction Tracking'
            TabOrder = 4
          end
          object dbEntityCode: TUniDBEdit
            Left = 133
            Top = 12
            Width = 121
            Height = 21
            Hint = ''
            DataField = 'ENTITY_CODE'
            DataSource = SrcEntity
            TabOrder = 0
          end
          object dbEntityDescrio: TUniDBEdit
            Left = 133
            Top = 42
            Width = 121
            Height = 21
            Hint = ''
            DataField = 'ENTITY_DESC'
            DataSource = SrcEntity
            TabOrder = 1
          end
          object DBAcctLen: TUniDBEdit
            Left = 345
            Top = 12
            Width = 131
            Height = 19
            Hint = ''
            DataField = 'ACCT_LENGTH'
            DataSource = SrcEntity
            TabOrder = 5
            Color = clBtnFace
            ReadOnly = True
          end
          object DBMaskLen: TUniDBEdit
            Left = 345
            Top = 42
            Width = 131
            Height = 19
            Hint = ''
            DataField = 'MASK_LENGTH'
            DataSource = SrcEntity
            TabOrder = 6
            Color = clBtnFace
            ReadOnly = True
          end
          object DBAcctMask: TUniDBEdit
            Left = 345
            Top = 74
            Width = 131
            Height = 19
            Hint = ''
            DataField = 'ACCT_MASK'
            DataSource = SrcEntity
            TabOrder = 7
            Color = clBtnFace
            ReadOnly = True
          end
          object DBMaxseg: TUniDBEdit
            Left = 345
            Top = 104
            Width = 131
            Height = 19
            Hint = ''
            DataField = 'MAX_SEGS'
            DataSource = SrcEntity
            TabOrder = 8
            Color = clBtnFace
            ReadOnly = True
          end
          object DBNatSeg: TUniDBEdit
            Left = 345
            Top = 134
            Width = 131
            Height = 19
            Hint = ''
            DataField = 'NATURAL_SEG'
            DataSource = SrcEntity
            TabOrder = 9
            Color = clBtnFace
            ReadOnly = True
          end
          object wwDBLookupCombo1: TUniDBLookupComboBox
            Left = 133
            Top = 157
            Width = 121
            Height = 21
            Hint = ''
            ListFieldIndex = 0
            DataField = 'RPTNG_CURR_CODE'
            DataSource = SrcEntity
            TabOrder = 10
            Color = clWindow
          end
        end
        object TabGrid: TUniTabSheet
          Hint = ''
          ImageIndex = 1
          Caption = 'TabGrid'
          object gridEntity: TIQUniGridControl
            Left = 0
            Top = 0
            Width = 477
            Height = 179
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 260
            IQComponents.Grid.Height = 93
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = SrcEntity
            IQComponents.Grid.LoadMask.Message = 'Loading data...'
            IQComponents.Grid.Align = alClient
            IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
            IQComponents.Grid.TabOrder = 0
            IQComponents.Navigator.Left = 410
            IQComponents.Navigator.Top = 0
            IQComponents.Navigator.Width = 241
            IQComponents.Navigator.Height = 25
            IQComponents.Navigator.Hint = ''
            IQComponents.Navigator.ShowHint = True
            IQComponents.Navigator.DataSource = SrcEntity
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 260
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 93
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = SrcEntity
            Columns = <
              item
                FieldName = 'ENTITY_CODE'
                Title.Caption = 'FRx Company Code'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'ENTITY_DESC'
                Title.Caption = 'Description'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'USE_PROJECTS'
                Title.Caption = 'Use Projects (Ref_Codes)'
                Width = 64
                CheckBoxField.FieldValues = '1;0'
              end
              item
                FieldName = 'USE_MULTI_CURR'
                Title.Caption = 'Use Multi-Currency'
                Width = 64
                CheckBoxField.FieldValues = '1;0'
              end
              item
                FieldName = 'USE_TRANS_DETL'
                Title.Caption = 'Detail Transaction Tracking'
                Width = 64
                CheckBoxField.FieldValues = '1;0'
              end
              item
                FieldName = 'ACCT_LENGTH'
                Title.Caption = 'Account length'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'MASK_LENGTH'
                Title.Caption = 'Mask length'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'ACCT_MASK'
                Title.Caption = 'Account mask'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'MAX_SEGS'
                Title.Caption = 'Max. segments'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'NATURAL_SEG'
                Title.Caption = 'Nat. segment'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'curr_code'
                Title.Caption = 'Reporting Currency Code'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end>
            Marker = 0
          end
          object wwDBLookupCombo2: TUniDBLookupComboBox
            Left = 29
            Top = 85
            Width = 121
            Height = 21
            Hint = ''
            ListFieldIndex = 0
            TabOrder = 1
            Color = clWindow
          end
        end
      end
      object Panel3: TUniPanel
        Left = 0
        Top = 0
        Width = 485
        Height = 27
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object SBGridView: TUniSpeedButton
          Left = 2
          Top = 1
          Width = 25
          Height = 25
          Hint = 'Toggle Table/Form View'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36060000424D3606000000000000360400002800000020000000100000000100
            08000000000000020000A0860100A08601000001000000000000000000001212
            1200282828003E3E3E006A6A6A006F6F6F00800000008B09020097130300A21C
            0500AA230600AD250700B52C0800B92F0900C0340A00C4380A00CA3D0B00CF41
            0C00D5460D00D8511900DA5A2400DD663100E06E3A00E37C4900E5825000F08C
            6800E9916100EA966700EFAB7E00FF00FF00808080008A8A8A008F8F8F009494
            9400999999009F9F9F00A4A4A400A9A9A900ADADAD00AEAEAE00B0B0B000B3B3
            B300B4B4B400B7B7B700B8B8B800BABABA00BDBDBD00F4BF9400FAD3AA00C0C0
            C000C2C2C200C3C3C300C6C6C600C8C8C800C9C9C900CDCDCD00E0E0E000F9F9
            FB00FFFFFF000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000001D1D1D1D0505
            050505050505050505051D1D1D1D0505050505050505050505051D1D1D1D1E2C
            29272524232221201F051D1D1D1D1E2C29272524232221201F051D1D1D1D1E2E
            2C2927250302010020051D1D1D1D1E2E2C2927250302010020051D1D1D1D1E32
            2E2C29271E3A3A0021051D1D1D1D1E322E2C29271E3A3A0021051D1D1D1D1E35
            2A2004291E1E1E1E22051D1D1D1D1E352A2004291E1E1E1E22051D1D1D1D1E37
            35322E2C2927252423051D1D1D1D1E3735322E2C2927252423051E1E1E1E1A17
            1513110F0D0B090807061E1E1E1E211E050403030303030202021E3838381A19
            191919191919191919061E3838382120202020202020202020021E3939391A17
            1513110F0D0B090807061E393939211E050403030303030202021E393331392D
            2B392826391E1D1D1D1D1E393331392D2B392826391E1D1D1D1D1E3939393939
            39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D1E3936343931
            2E392B2A391E1D1D1D1D1E39363439312E392B2A391E1D1D1D1D1E3939393939
            39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D302F1C1B1816
            1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D301919191919
            19191919190A1D1D1D1D3720202020202020202020031D1D1D1D302F1C1B1816
            1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = SBGridViewClick
        end
        object NavEntity: TUniDBNavigator
          Left = 310
          Top = 1
          Width = 175
          Height = 25
          Hint = ''
          DataSource = SrcEntity
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel, nbRefresh]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
    end
    object TabOptions: TUniTabSheet
      Hint = ''
      ImageIndex = 3
      Caption = 'Options'
      object Label1: TUniLabel
        Left = 4
        Top = 40
        Width = 49
        Height = 13
        Hint = ''
        Caption = 'System ID'
        TabOrder = 4
      end
      object Label2: TUniLabel
        Left = 4
        Top = 68
        Width = 67
        Height = 13
        Hint = ''
        Caption = 'FRL Release#'
        TabOrder = 5
      end
      object Label3: TUniLabel
        Left = 4
        Top = 98
        Width = 70
        Height = 13
        Hint = ''
        Caption = 'Base Currency'
        TabOrder = 6
      end
      object cbUseEplants: TUniCheckBox
        Left = 5
        Top = 12
        Width = 198
        Height = 17
        Hint = ''
        Caption = 'Use Separate Entities per Eplant'
        TabOrder = 0
        OnClick = cbUseEplantsClick
      end
      object dbSystemID: TUniDBEdit
        Left = 88
        Top = 36
        Width = 115
        Height = 19
        Hint = ''
        DataField = 'SYSTEM_ID'
        DataSource = SrcSysCtrl
        TabOrder = 1
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object DbReleaseNum: TUniDBEdit
        Left = 88
        Top = 64
        Width = 115
        Height = 19
        Hint = ''
        DataField = 'FRL_RELEASE_NUM'
        DataSource = SrcSysCtrl
        TabOrder = 2
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object dbBasCurr: TUniDBEdit
        Left = 88
        Top = 94
        Width = 115
        Height = 19
        Hint = ''
        DataField = 'curr_code'
        DataSource = SrcSysCtrl
        TabOrder = 3
        Color = clBtnFace
        ReadOnly = True
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 436
    Top = 216
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = '&Options'
      object ShowupostedGLBatches1: TUniMenuItem
        Caption = '&Show unposted GL Batches'
        OnClick = ShowupostedGLBatches1Click
      end
      object N3: TUniMenuItem
        Caption = '-'
      end
      object PopulateFRLdatabase1: TUniMenuItem
        Caption = '&Populate FRL database'
        OnClick = PopulateFRLdatabase1Click
      end
      object PopulateIndividualtables1: TUniMenuItem
        Caption = 'Populate &Individual tables'
        Visible = False
        object PopulateFrlentity1: TUniMenuItem
          Caption = 'Populate frl_entity'
          Hint = 'populate_frl_entity'
          OnClick = Populatefrlentity1Click
        end
        object N2: TUniMenuItem
          Caption = '-'
          Visible = False
        end
        object Populatefrlyearctrl1: TUniMenuItem
          Caption = 'Populate frl_year_ctrl'
          Hint = 'populate_frl_year_ctrl'
          Visible = False
          OnClick = Populatefrlentity1Click
        end
        object Populatefrlperiodctrl1: TUniMenuItem
          Caption = 'Populate frl_period_ctrl'
          Hint = 'populate_frl_period_ctrl'
          Visible = False
          OnClick = Populatefrlentity1Click
        end
        object Populatefrlaccttypectrl1: TUniMenuItem
          Caption = 'Populate frl_acct_type_ctrl'
          Hint = 'populate_frl_acct_type_ctrl'
          Visible = False
          OnClick = Populatefrlentity1Click
        end
        object Populatefrlacctcode1: TUniMenuItem
          Caption = 'Populate frl_acct_code'
          Hint = 'populate_frl_acct_code'
          Visible = False
          OnClick = Populatefrlentity1Click
        end
        object Populatefrlsegctrl1: TUniMenuItem
          Caption = 'Populate frl_seg_ctrl'
          Hint = 'populate_frl_seg_ctrl'
          Visible = False
          OnClick = Populatefrlentity1Click
        end
        object Populatefrlsegdesc1: TUniMenuItem
          Caption = 'Populate frl_seg_desc'
          Hint = 'populate_frl_seg_desc'
          Visible = False
          OnClick = Populatefrlentity1Click
        end
        object Populatefrlbookctrl1: TUniMenuItem
          Caption = 'Populate frl_book_ctrl'
          Hint = 'populate_frl_book_ctrl'
          Visible = False
          OnClick = Populatefrlbookctrl1Click
        end
        object Populatefrlperiodbal1: TUniMenuItem
          Caption = 'Populate frl_period_bal'
          Hint = 'populate_frl_period_bal'
          Visible = False
          OnClick = Populatefrlentity1Click
        end
        object Populatefrlcurrencyctrl1: TUniMenuItem
          Caption = 'Populate frl_currency_ctrl'
          Hint = 'populate_frl_currency_ctrl'
          Visible = False
          OnClick = Populatefrlbookctrl1Click
        end
        object Populatefrlbatchctrl1: TUniMenuItem
          Caption = 'Populate frl_batch_ctrl'
          Hint = 'populate_frl_batch_ctrl'
          Visible = False
          OnClick = Populatefrlentity1Click
        end
        object Populatefrltrandetail1: TUniMenuItem
          Caption = 'Populate frl_tran_detail'
          Hint = 'populate_frl_tran_detail'
          Visible = False
          OnClick = Populatefrlentity1Click
        end
      end
      object PopulateFRLbudgets1: TUniMenuItem
        Caption = 'Populate FRL &budgets'
        OnClick = PopulateFRLbudgets1Click
      end
      object PopulateFRLDepreciationBooks1: TUniMenuItem
        Caption = 'Populate FRL Depreciation Books'
        OnClick = PopulateFRLDepreciationBooks1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object DeleteAlldata1: TUniMenuItem
        Caption = '&Clear FRL Tables'
        OnClick = DeleteAlldata1Click
      end
    end
    object Reports1: TUniMenuItem
      Caption = '&Reports'
      object Print1: TUniMenuItem
        Caption = '&Print'
        OnClick = Print1Click
      end
      object PrinterSetup1: TUniMenuItem
        Caption = '&Printer Setup'
        OnClick = PrinterSetup1Click
      end
    end
    object help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
    object Debug1: TUniMenuItem
      Caption = '&Debug'
      Visible = False
      object Clear1: TUniMenuItem
        Caption = '&Clear'
        OnClick = Clear1Click
      end
      object Show1: TUniMenuItem
        Caption = '&Show'
        OnClick = Show1Click
      end
    end
  end
  object SrcSysCtrl: TDataSource
    DataSet = TblSysCtrl
    Left = 140
    Top = 216
  end
  object TblSysCtrl: TFDTable
    AfterInsert = TblSysCtrlAfterInsert
    IndexFieldNames = 'SYSTEM_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'FRL_SYSTEM_OPTIONS'
    TableName = 'FRL_SYSTEM_OPTIONS'
    Left = 161
    Top = 217
    object TblSysCtrlSYSTEM_ID: TBCDField
      FieldName = 'SYSTEM_ID'
      Required = True
      Size = 0
    end
    object TblSysCtrlBASE_CURRENCY: TStringField
      FieldName = 'BASE_CURRENCY'
      Size = 16
    end
    object TblSysCtrlFRL_RELEASE_NUM: TStringField
      FieldName = 'FRL_RELEASE_NUM'
      Size = 16
    end
    object TblSysCtrlUSE_SEP_UNPOSTED: TBCDField
      FieldName = 'USE_SEP_UNPOSTED'
      Required = True
      Size = 0
    end
    object TblSysCtrlcurr_code: TStringField
      FieldKind = fkLookup
      FieldName = 'curr_code'
      LookupDataSet = QryCurrency
      LookupKeyFields = 'ID'
      LookupResultField = 'CURR_CODE'
      KeyFields = 'BASE_CURRENCY'
      Lookup = True
    end
  end
  object QryCurrency: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from currency')
    Left = 403
    Top = 216
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Frm Control Form'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 372
    Top = 216
  end
  object SrcEntity: TDataSource
    DataSet = TblEntity
    Left = 208
    Top = 216
  end
  object TblEntity: TFDTable
    BeforeInsert = TblEntityBeforeInsert
    AfterPost = TblEntityAfterPost
    IndexFieldNames = 'ENTITY_NUM'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'FRL_ENTITY'
    UpdateOptions.KeyFields = 'ENTITY_NUM'
    TableName = 'FRL_ENTITY'
    Left = 224
    Top = 216
    object TblEntityENTITY_CODE: TStringField
      DisplayLabel = 'FRx Company Code'
      DisplayWidth = 16
      FieldName = 'ENTITY_CODE'
      Required = True
      Size = 16
    end
    object TblEntityENTITY_DESC: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 24
      FieldName = 'ENTITY_DESC'
      Required = True
      Size = 60
    end
    object TblEntityUSE_PROJECTS: TBCDField
      DisplayLabel = 'Use Projects (Ref_Codes)'
      DisplayWidth = 10
      FieldName = 'USE_PROJECTS'
      Required = True
      Size = 0
    end
    object TblEntityUSE_MULTI_CURR: TBCDField
      DisplayLabel = 'Use Multi-Currency'
      DisplayWidth = 10
      FieldName = 'USE_MULTI_CURR'
      Required = True
      Size = 0
    end
    object TblEntityUSE_TRANS_DETL: TBCDField
      DisplayLabel = 'Detail Transaction Tracking'
      DisplayWidth = 10
      FieldName = 'USE_TRANS_DETL'
      Required = True
      Size = 0
    end
    object TblEntityACCT_LENGTH: TBCDField
      DisplayLabel = 'Account length'
      DisplayWidth = 10
      FieldName = 'ACCT_LENGTH'
      ReadOnly = True
      Required = True
      Size = 0
    end
    object TblEntityMASK_LENGTH: TBCDField
      DisplayLabel = 'Mask length'
      DisplayWidth = 10
      FieldName = 'MASK_LENGTH'
      ReadOnly = True
      Required = True
      Size = 0
    end
    object TblEntityACCT_MASK: TStringField
      DisplayLabel = 'Account mask'
      DisplayWidth = 35
      FieldName = 'ACCT_MASK'
      ReadOnly = True
      Required = True
      Size = 128
    end
    object TblEntityMAX_SEGS: TBCDField
      DisplayLabel = 'Max. segments'
      DisplayWidth = 10
      FieldName = 'MAX_SEGS'
      ReadOnly = True
      Required = True
      Size = 0
    end
    object TblEntityNATURAL_SEG: TBCDField
      DisplayLabel = 'Nat. segment'
      DisplayWidth = 10
      FieldName = 'NATURAL_SEG'
      ReadOnly = True
      Required = True
      Size = 0
    end
    object TblEntitycurr_code: TStringField
      DisplayLabel = 'Reporting Currency Code'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'curr_code'
      LookupDataSet = QryCurr1
      LookupKeyFields = 'ID'
      LookupResultField = 'CURR_CODE'
      KeyFields = 'RPTNG_CURR_CODE'
      Lookup = True
    end
    object TblEntityRPTNG_CURR_CODE: TStringField
      DisplayWidth = 16
      FieldName = 'RPTNG_CURR_CODE'
      Required = True
      Visible = False
      Size = 16
    end
    object TblEntityENTITY_NUM: TBCDField
      FieldName = 'ENTITY_NUM'
      Origin = 'ENTITY_NUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 4
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'dbSystemID'
      'DbReleaseNum'
      'NavSys'
      'dbBasCurr'
      'dbUseSepUn'
      'DBUseProj'
      'DBUseMc'
      'DBDetTrack'
      'dbEntityCode'
      'dbEntityDescrio'
      'DBAcctLen'
      'DBMaskLen'
      'DBAcctMask'
      'DBMaxseg'
      'DBNatSeg'
      'SBGridView'
      'cbUseEplants'
      'Options1'
      'PopulateFRLdatabase1'
      'PopulateIndividualtables1'
      'PopulateFrlentity1'
      'DeleteAlldata1'
      'PopulateFRLDepreciationBooks1')
    SecurityCode = 'FRM_FRL'
    Left = 328
    Top = 216
  end
  object QryCurr2: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select curr_code, descrip, id from currency'
      'order by curr_code')
    Left = 296
    Top = 216
  end
  object QryCurr1: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select curr_code, descrip, id from currency'
      'order by curr_code')
    Left = 264
    Top = 216
  end
  object ProcPDatabase: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.FRX_MISC.POPULATE_FRL_TABLES_NO_ENTITY'
    Left = 12
    Top = 232
  end
  object ProcPopulate: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    Left = 60
    Top = 232
    ParamData = <
      item
        Name = 'V_INCL_EPLANTS'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object ProcPopulateNoParams: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    Left = 100
    Top = 232
  end
  object IQTiming1: TIQWebTiming
    Left = 252
    Top = 80
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'Frm_Frl'
    WebUse = False
    TouchScreen = False
    Left = 208
    Top = 162
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 208
    Top = 130
  end
end
