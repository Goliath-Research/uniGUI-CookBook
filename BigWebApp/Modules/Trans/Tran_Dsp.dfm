object FrmTransDispoDesignator: TFrmTransDispoDesignator
  Left = 301
  Top = 223
  ClientHeight = 276
  ClientWidth = 393
  Caption = 'Assign Auto-Disposition Designator'
  BorderStyle = bsDialog
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 393
    Height = 242
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel4: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 391
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object NavMfg: TUniDBNavigator
        Left = 270
        Top = 1
        Width = 120
        Height = 25
        Hint = ''
        DataSource = SrcFGMultiDispoBom
        VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object PnlCarrier: TUniPanel
      Tag = 1999
      Left = 1
      Top = 28
      Width = 391
      Height = 213
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object chkDefault: TUniCheckBox
        Left = 16
        Top = 164
        Width = 200
        Height = 17
        Hint = ''
        Caption = 'Set as default designated location'
        TabOrder = 0
        OnClick = chkMfgClick
      end
      object chkClear: TUniCheckBox
        Left = 16
        Top = 185
        Width = 200
        Height = 17
        Hint = ''
        Caption = 'Clear designation for this location'
        TabOrder = 1
        OnClick = chkMfgClick
      end
      object grdMfg: TIQUniGridControl
        Left = 34
        Top = 29
        Width = 351
        Height = 129
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        TabOrder = 2
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 134
        IQComponents.Grid.Height = 43
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcFGMultiDispoBom
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
        IQComponents.Navigator.DataSource = SrcFGMultiDispoBom
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 134
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 43
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcFGMultiDispoBom
        Columns = <
          item
            FieldName = 'MfgNo'
            Title.Caption = 'Manufacturing #'
            Width = 231
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
      end
      object wwDBComboBoxMfgNo: TUniDBComboBox
        Left = 88
        Top = 80
        Width = 121
        Height = 21
        Hint = ''
        TabOrder = 3
        OnDropDown = wwDBComboBoxMfgNoDropDown
      end
      object chkMfg: TUniCheckBox
        Left = 16
        Top = 7
        Width = 185
        Height = 17
        Hint = ''
        Caption = 'Associate with Manufacturing #'
        TabOrder = 4
        OnClick = chkMfgClick
      end
    end
  end
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 242
    Width = 393
    Height = 34
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Tag = 1999
      Left = 171
      Top = 1
      Width = 221
      Height = 32
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 9
        Top = 2
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 113
        Top = 2
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object PkMfg: TIQWebHpick
    BeforeOpen = QryFGMultiDispoBomBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select STANDARD.MFGNO  as MfgNo,'
      '       STANDARD.MFG_TYPE  as Mfg_TYPE,'
      '       ARINVT.ITEMNO   as ITEMNO,'
      '       ARINVT.REV      as REV,'
      '       ARINVT.DESCRIP  as DESCRIP,'
      '       ARINVT.DESCRIP2  as DESCRIP2,'
      '       ARCUSTO.COMPANY as COMPANY,'
      '       STANDARD.ID     as ID'
      'from   IQMS.STANDARD, IQMS.PARTNO, IQMS.ARINVT, IQMS.ARCUSTO'
      'where  IQMS.STANDARD.ID = IQMS.PARTNO.STANDARD_ID(+)'
      '  and   IQMS.PARTNO.ARINVT_ID = IQMS.ARINVT.ID(+)'
      '  and   IQMS.ARCUSTO.ID(+) = IQMS.STANDARD.ARCUSTO_ID '
      '  and   misc.Eplant_Filter_Include_nulls(standard.eplant_id) = 1'
      
        '  and  not exists (select 1 from fgmulti_dispo_bom where fgmulti' +
        '_id = :fgmulti_id and standard_id = IQMS.STANDARD.ID)'
      '  '
      ' '
      ' '
      '    '
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 7
    Top = 205
    ParamData = <
      item
        Name = 'fgmulti_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkMfgMFGNO: TStringField
      DisplayLabel = 'MFG#'
      FieldName = 'MFGNO'
      Size = 50
    end
    object PkMfgITEMNO: TStringField
      DisplayLabel = 'Item#'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkMfgREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 3
      FieldName = 'REV'
      Size = 15
    end
    object PkMfgDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 18
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkMfgCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      DisplayWidth = 15
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkMfgID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkMfgMFG_TYPE: TStringField
      DisplayLabel = 'Mfg Type'
      FieldName = 'MFG_TYPE'
      Size = 10
    end
    object PkMfgDESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      FieldName = 'DESCRIP2'
      Size = 100
    end
  end
  object SrcFGMultiDispoBom: TDataSource
    DataSet = QryFGMultiDispoBom
    Left = 206
    Top = 21
  end
  object QryFGMultiDispoBom: TFDQuery
    BeforeOpen = QryFGMultiDispoBomBeforeOpen
    BeforePost = QryFGMultiDispoBomBeforePost
    OnCalcFields = QryFGMultiDispoBomCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'FGMULTI_DISPO_BOM'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLFGMultiDispoBom
    SQL.Strings = (
      'select id, '
      '       standard_id,'
      '       fgmulti_id'
      '  from fgmulti_dispo_bom '
      ' where fgmulti_id = :fgmulti_id'
      '  '
      ' '
      ' '
      ' ')
    Left = 222
    Top = 57
    ParamData = <
      item
        Name = 'fgmulti_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryFGMultiDispoBomMfgNo: TStringField
      DisplayLabel = 'Manufacturing #'
      DisplayWidth = 33
      FieldKind = fkCalculated
      FieldName = 'MfgNo'
      Size = 25
      Calculated = True
    end
    object QryFGMultiDispoBomID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.FGMULTI_DISPO_BOM.ID'
      Visible = False
      Size = 0
    end
    object QryFGMultiDispoBomSTANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'STANDARD_ID'
      Origin = 'IQ.FGMULTI_DISPO_BOM.STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QryFGMultiDispoBomFGMULTI_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'FGMULTI_ID'
      Origin = 'IQ.FGMULTI_DISPO_BOM.FGMULTI_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQLFGMultiDispoBom: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into fgmulti_dispo_bom'
      '  (ID, STANDARD_ID, FGMULTI_ID)'
      'values'
      '  (:ID, :STANDARD_ID, :FGMULTI_ID)')
    ModifySQL.Strings = (
      'update fgmulti_dispo_bom'
      'set'
      '  ID = :ID,'
      '  STANDARD_ID = :STANDARD_ID,'
      '  FGMULTI_ID = :FGMULTI_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from fgmulti_dispo_bom'
      'where'
      '  ID = :OLD_ID')
    Left = 246
    Top = 86
  end
end
