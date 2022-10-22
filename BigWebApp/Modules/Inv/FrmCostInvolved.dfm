object FrmCostInvolvedCalcCopy: TFrmCostInvolvedCalcCopy
  Left = 162
  Top = 164
  ClientHeight = 420
  ClientWidth = 565
  Caption = 'Confirmation'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 565
    Height = 107
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 1
      Width = 563
      Height = 105
      Hint = ''
      Caption = ' Processing '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object Panel3: TUniPanel
        Left = 2
        Top = 15
        Width = 559
        Height = 85
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Splitter2: TUniSplitter
          Left = 411
          Top = 0
          Width = 6
          Height = 85
          Hint = ''
          Align = alRight
          ParentColor = False
          Color = clBtnFace
        end
        object PnRight01: TUniPanel
          Left = 417
          Top = 1
          Width = 142
          Height = 83
          Hint = ''
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter1: TUniSplitter
            Left = 63
            Top = 0
            Width = 6
            Height = 83
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlLeft02: TUniPanel
            Left = 1
            Top = 1
            Width = 63
            Height = 81
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label5: TUniLabel
              Left = 8
              Top = 3
              Width = 25
              Height = 13
              Hint = ''
              Caption = 'Class'
              TabOrder = 1
            end
            object Label7: TUniLabel
              Left = 8
              Top = 23
              Width = 40
              Height = 13
              Hint = ''
              Caption = 'Revision'
              TabOrder = 2
            end
            object Label9: TUniLabel
              Left = 8
              Top = 43
              Width = 44
              Height = 13
              Hint = ''
              Caption = 'EPlant ID'
              TabOrder = 3
            end
          end
          object PnlClient03: TUniPanel
            Left = 69
            Top = 1
            Width = 73
            Height = 81
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            DesignSize = (
              73
              81)
            object edClass: TUniDBEdit
              Left = 1
              Top = 1
              Width = 68
              Height = 19
              Hint = ''
              DataField = 'CLASS'
              DataSource = SrcArinv
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              TabStop = False
              Color = clSilver
              ReadOnly = True
            end
            object edRev: TUniDBEdit
              Left = 1
              Top = 20
              Width = 68
              Height = 19
              Hint = ''
              DataField = 'REV'
              DataSource = SrcArinv
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              TabStop = False
              Color = clSilver
              ReadOnly = True
            end
            object edEplant: TUniDBEdit
              Left = 1
              Top = 40
              Width = 68
              Height = 19
              Hint = ''
              DataField = 'EPLANT_ID'
              DataSource = SrcArinv
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              TabStop = False
              Color = clSilver
              ReadOnly = True
            end
          end
        end
        object PnlClient01: TUniPanel
          Left = 1
          Top = 1
          Width = 411
          Height = 83
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object Splitter3: TUniSplitter
            Left = 118
            Top = 0
            Width = 6
            Height = 83
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlLeft01: TUniPanel
            Left = 1
            Top = 1
            Width = 118
            Height = 81
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label4: TUniLabel
              Left = 10
              Top = 3
              Width = 33
              Height = 13
              Hint = ''
              Caption = 'Item #'
              TabOrder = 1
            end
            object Label6: TUniLabel
              Left = 10
              Top = 23
              Width = 53
              Height = 13
              Hint = ''
              Caption = 'Description'
              TabOrder = 2
            end
            object Label8: TUniLabel
              Left = 10
              Top = 43
              Width = 102
              Height = 13
              Hint = ''
              Caption = 'Extended Description'
              TabOrder = 3
            end
          end
          object PnlClient02: TUniPanel
            Left = 124
            Top = 1
            Width = 287
            Height = 81
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            DesignSize = (
              287
              81)
            object edItem: TUniDBEdit
              Left = 1
              Top = 1
              Width = 292
              Height = 19
              Hint = ''
              DataField = 'ITEMNO'
              DataSource = SrcArinv
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              TabStop = False
              Color = clSilver
              ReadOnly = True
            end
            object edDesc: TUniDBEdit
              Left = 1
              Top = 20
              Width = 292
              Height = 19
              Hint = ''
              DataField = 'DESCRIP'
              DataSource = SrcArinv
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              TabStop = False
              Color = clSilver
              ReadOnly = True
            end
            object edExtDesc: TUniDBEdit
              Left = 1
              Top = 40
              Width = 292
              Height = 19
              Hint = ''
              DataField = 'DESCRIP2'
              DataSource = SrcArinv
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              TabStop = False
              Color = clSilver
              ReadOnly = True
            end
          end
        end
      end
      object Panel5: TUniPanel
        Left = 2
        Top = 85
        Width = 559
        Height = 20
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object chkNetChange: TUniCheckBox
          Left = 8
          Top = 1
          Width = 129
          Height = 17
          Hint = ''
          Caption = 'Roll net change only'
          TabOrder = 0
          OnClick = chkNetChangeClick
        end
        object ChkDisablePIT: TUniCheckBox
          Left = 168
          Top = 1
          Width = 209
          Height = 17
          Hint = ''
          Caption = 'Disable adjustment for Unposted PIT'
          TabOrder = 1
          OnClick = ChkDisablePITClick
        end
      end
    end
  end
  object Panel4: TUniPanel
    Left = 0
    Top = 368
    Width = 565
    Height = 33
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      565
      33)
    object btnOK: TUniButton
      Left = 364
      Top = 5
      Width = 97
      Height = 25
      Hint = 'Recalculate and roll over all involved items'
      ShowHint = True
      ParentShowHint = False
      Caption = 'Apply'
      Anchors = [akTop, akRight]
      TabOrder = 1
      OnClick = btnOKClick
    end
    object btnCancel: TUniButton
      Left = 468
      Top = 5
      Width = 97
      Height = 25
      Hint = 'Cancel'
      ShowHint = True
      ParentShowHint = False
      Caption = 'Cancel'
      Cancel = True
      ModalResult = 2
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
    object btnRecalc: TUniButton
      Left = 260
      Top = 5
      Width = 97
      Height = 25
      Hint = 'Recalculate all involved items'
      ShowHint = True
      ParentShowHint = False
      Caption = 'Recalculate'
      Anchors = [akTop, akRight]
      TabOrder = 3
      OnClick = btnRecalcClick
    end
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 401
    Width = 565
    Height = 19
    Hint = ''
    Panels = <>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object Panel6: TUniPanel
    Left = 0
    Top = 107
    Width = 565
    Height = 261
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    Caption = ''
    object gboxInvolved: TUniGroupBox
      Left = 1
      Top = 1
      Width = 563
      Height = 259
      Hint = ''
      Caption = ' Items Involved  '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object Panel2: TUniPanel
        Left = 2
        Top = 15
        Width = 559
        Height = 242
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = 'Panel2'
        object wwDBGrid: TIQUniGridControl
          Left = 1
          Top = 1
          Width = 557
          Height = 240
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 340
          IQComponents.Grid.Height = 154
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcInvolved
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
          IQComponents.Navigator.DataSource = SrcInvolved
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 340
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 154
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcInvolved
          Columns = <
            item
              FieldName = 'ITEMNO'
              Title.Caption = 'Item #'
              Width = 133
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'Description'
              Width = 238
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CLASS'
              Title.Caption = 'Class'
              Width = 28
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'REV'
              Title.Caption = 'Rev'
              Width = 105
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EPLANT_ID'
              Title.Caption = 'EPlant ID'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end>
          TabsVisible = True
          Marker = 0
        end
      end
    end
  end
  object SrcArinv: TDataSource
    DataSet = QryArinvt
    Left = 114
    Top = 181
  end
  object QryArinvt: TFDQuery
    BeforeOpen = QryArinvtBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select itemno,'
      '       rev,'
      '       descrip,'
      '       descrip2,'
      '       class,'
      '       eplant_id'
      '  from arinvt'
      ' where id = :id'
      '         ')
    Left = 114
    Top = 195
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryArinvtITEMNO: TStringField
      FieldName = 'ITEMNO'
      Origin = 'IQ.ARINVT.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryArinvtREV: TStringField
      FieldName = 'REV'
      Origin = 'IQ.ARINVT.REV'
      FixedChar = True
      Size = 15
    end
    object QryArinvtDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'IQ.ARINVT.DESCRIP'
      Size = 100
    end
    object QryArinvtDESCRIP2: TStringField
      FieldName = 'DESCRIP2'
      Origin = 'IQ.ARINVT.DESCRIP2'
      Size = 100
    end
    object QryArinvtCLASS: TStringField
      FieldName = 'CLASS'
      Origin = 'IQ.ARINVT.CLASS'
      FixedChar = True
      Size = 2
    end
    object QryArinvtEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.ARINVT.EPLANT_ID'
      Size = 0
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmCostInvolvedCalcCopy'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196223 $'
    BuildVersion = '176554'
    Left = 162
    Top = 225
  end
  object SrcInvolved: TDataSource
    DataSet = QryInvolved
    Left = 208
    Top = 184
  end
  object QryInvolved: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.arinvt_id,'
      '       c.itemno,'
      '       c.descrip,'
      '       c.class,'
      '       c.rev,'
      '       c.eplant_id,'
      '       a.max_level'
      '  from gtt_calc_cost_items_involved a,'
      '       arinvt c'
      ' where a.arinvt_id = c.id'
      ' order by c.itemno'
      '')
    Left = 208
    Top = 232
    object QryInvolvedITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 19
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryInvolvedDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 34
      FieldName = 'DESCRIP'
      Size = 100
    end
    object QryInvolvedCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object QryInvolvedREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
    object QryInvolvedEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryInvolvedMAX_LEVEL: TBCDField
      DisplayLabel = 'Max Level'
      DisplayWidth = 10
      FieldName = 'MAX_LEVEL'
      Origin = 'IQ.GTT_CALC_COST_ITEMS_INVOLVED.MAX_LEVEL'
      Visible = False
      Size = 0
    end
    object QryInvolvedARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 252
    Top = 200
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'chkNetChange'
      'btnRecalc'
      'btnOK')
    SecurityCode = 'FRMCOSTINVOLVEDCALCCOPY'
    Left = 284
    Top = 200
  end
end
