object FrmCostHist: TFrmCostHist
  Left = 170
  Top = 163
  HelpContext = 1326640
  ClientHeight = 416
  ClientWidth = 737
  Caption = 'Archived cost elements'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 217
    Width = 737
    Height = 5
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
    ExplicitWidth = 542
  end
  object Bevel1: TUniPanel
    Left = 0
    Top = 0
    Width = 737
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    Caption = ''
    ExplicitWidth = 465
  end
  object DBGrid2: TUniDBGrid
    Left = 0
    Top = 222
    Width = 737
    Height = 194
    Hint = ''
    DataSource = SrcHist_Elements
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Columns = <
      item
        FieldName = 'ELEM_DESCRIP'
        Title.Caption = 'Cost Element'
        Width = 153
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ELEM_TYPE'
        Title.Caption = 'Element Type'
        Width = 103
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'STD_COST'
        Title.Caption = 'Cost'
        Width = 103
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  object DBGrid1: TIQUniGridControl
    Left = 0
    Top = 3
    Width = 737
    Height = 214
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 520
    IQComponents.Grid.Height = 128
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcHist_Elements_Distinct
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
    IQComponents.Navigator.DataSource = SrcHist_Elements_Distinct
    IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.Navigator.BeforeAction = CheckRefresh
    IQComponents.HiddenPanel.Left = 520
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 128
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitLeft = 248
    IQComponents.HiddenPanel.ExplicitHeight = 61
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitWidth = 457
    IQComponents.FormTab.ExplicitHeight = 90
    DataSource = SrcHist_Elements_Distinct
    Columns = <
      item
        FieldName = 'ARCHIVE_DATE'
        Title.Caption = 'Archive Date'
        Width = 77
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CALC_DATE'
        Title.Caption = 'Calculate Date'
        Width = 146
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 107
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MFGNO'
        Title.Caption = 'Manufacturing #'
        Width = 92
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TYPE'
        Title.Caption = 'Type'
        Width = 101
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TotalCost'
        Title.Caption = 'Total Cost'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitWidth = 542
    Marker = 0
  end
  object IQUDComboBoxType: TIQWebUDComboBox
    Left = 226
    Top = 68
    Width = 121
    Height = 21
    Hint = 'Right click to edit the list'
    ShowHint = True
    ParentShowHint = False
    TabOrder = 1
    KeyTableName = 'HIST_ARINVT_ELEM_CALC'
    KeyFieldName = 'TYPE'
  end
  object SrcHist_Elements_Distinct: TDataSource
    DataSet = QryHist_Elements_Distinct
    Left = 36
    Top = 143
  end
  object QryHist_Elements_Distinct: TFDQuery
    BeforeOpen = QryHist_Elements_DistinctBeforeOpen
    AfterInsert = AbortOnInsert
    AfterPost = ApplyUpdatesToTable
    OnCalcFields = QryHist_Elements_DistinctCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'hist_arinvt_elem_calc'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLHist_Arinvt_Elem_Calc
    SQL.Strings = (
      'select id,'
      '       archive_date,'
      '       calc_date,'
      '       mfgno,'
      '       descrip,'
      '       type'
      '  from hist_arinvt_elem_calc'
      ' where arinvt_id = :arinvt_id'
      ' order by archive_date desc'
      '')
    Left = 84
    Top = 284
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryHist_Elements_DistinctARCHIVE_DATE: TDateTimeField
      DisplayLabel = 'Archive Date'
      DisplayWidth = 11
      FieldName = 'ARCHIVE_DATE'
      Origin = 'IQ.HIST_ARINVT_ELEMENTS.ARCHIVE_DATE'
      ReadOnly = True
      DisplayFormat = 'mm/dd/yyyy hh:nn:ss'
    end
    object QryHist_Elements_DistinctCALC_DATE: TDateTimeField
      DisplayLabel = 'Calculate Date'
      DisplayWidth = 12
      FieldName = 'CALC_DATE'
      Origin = 'IQ.HIST_ARINVT_ELEM_CALC.CALC_DATE'
      ReadOnly = True
    end
    object QryHist_Elements_DistinctDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 18
      FieldName = 'DESCRIP'
      Origin = 'IQ.HIST_ARINVT_ELEM_CALC.DESCRIP'
      ReadOnly = True
      Size = 50
    end
    object QryHist_Elements_DistinctMFGNO: TStringField
      DisplayLabel = 'Manufacturing #'
      DisplayWidth = 15
      FieldName = 'MFGNO'
      Origin = 'IQ.HIST_ARINVT_ELEM_CALC.MFGNO'
      ReadOnly = True
      Size = 50
    end
    object QryHist_Elements_DistinctTYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 24
      FieldName = 'TYPE'
      Origin = 'IQ.HIST_ARINVT_ELEM_CALC.TYPE'
      Size = 50
    end
    object QryHist_Elements_DistinctTotalCost: TFloatField
      DisplayLabel = 'Total Cost'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'TotalCost'
      Calculated = True
    end
    object QryHist_Elements_DistinctID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.HIST_ARINVT_ELEM_CALC.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
      Size = 0
    end
  end
  object SrcHist_Elements: TDataSource
    DataSet = QryHist_Elements
    Left = 112
    Top = 141
  end
  object QryHist_Elements: TFDQuery
    MasterSource = SrcHist_Elements_Distinct
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select elem_descrip,'
      '       elem_type,'
      '       std_cost'
      '  from hist_arinvt_elements'
      ' where '
      '       hist_arinvt_elem_calc_id = :id')
    Left = 120
    Top = 211
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryHist_ElementsELEM_DESCRIP: TStringField
      FieldName = 'ELEM_DESCRIP'
      Origin = 'IQ.HIST_ARINVT_ELEMENTS.ELEM_DESCRIP'
      FixedChar = True
      Size = 30
    end
    object QryHist_ElementsELEM_TYPE: TStringField
      DisplayWidth = 10
      FieldName = 'ELEM_TYPE'
      Origin = 'IQ.HIST_ARINVT_ELEMENTS.ELEM_DESCRIP'
      FixedChar = True
      Size = 10
    end
    object QryHist_ElementsSTD_COST: TFMTBCDField
      FieldName = 'STD_COST'
      Origin = 'IQ.HIST_ARINVT_ELEMENTS.STD_COST'
      DisplayFormat = '########0.000000'
      Size = 6
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 160
    Top = 152
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Reports1: TUniMenuItem
      Caption = 'Reports'
      object Print1: TUniMenuItem
        Caption = 'Print'
        OnClick = Print1Click
      end
      object PrinterSetup1: TUniMenuItem
        Caption = 'Printer Setup'
        OnClick = PrinterSetup1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object Content1: TUniMenuItem
        Caption = 'Content'
        OnClick = Content1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmCostHist'
    WebUse = False
    TouchScreen = False
    Left = 193
    Top = 153
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmCostHist'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195396 $'
    BuildVersion = '176554'
    Left = 225
    Top = 154
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 291
    Top = 171
  end
  object UpdateSQLHist_Arinvt_Elem_Calc: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into hist_arinvt_elem_calc'
      '  (TYPE)'
      'values'
      '  (:TYPE)')
    ModifySQL.Strings = (
      'update hist_arinvt_elem_calc'
      'set'
      '  TYPE = :TYPE'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from hist_arinvt_elem_calc'
      'where'
      '  ID = :OLD_ID')
    Left = 268
    Top = 306
  end
  object SR: TIQWebSecurityRegister
    SecurityCode = 'FRMCOSTHIST'
    Left = 152
    Top = 64
  end
end
