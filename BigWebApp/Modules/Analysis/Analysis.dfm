object FrmAnalysis: TFrmAnalysis
  Left = 200
  Top = 108
  ClientHeight = 263
  ClientWidth = 472
  Caption = 'Performance Analysis Setup'
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 225
    Top = 26
    Width = 6
    Height = 237
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object Panel2: TUniPanel
    Left = 231
    Top = 26
    Width = 241
    Height = 237
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 0
      Top = 104
      Width = 241
      Height = 3
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
    end
    object gridRates: TUniDBGrid
      Left = 1
      Top = 107
      Width = 239
      Height = 130
      Hint = ''
      DataSource = SrcAnalysis_Rate
      LoadMask.Message = 'Loading data...'
      OnEnter = SetNavDataSource
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Columns = <
        item
          FieldName = 'FROM_VAL'
          Title.Caption = 'From'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TO_VAL'
          Title.Caption = 'To'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'RATE'
          Title.Caption = 'Rate'
          Width = 77
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
    object pnlElements: TUniPanel
      Left = 1
      Top = 1
      Width = 239
      Height = 104
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object gridElements: TUniDBGrid
        Left = 1
        Top = 1
        Width = 237
        Height = 102
        Hint = ''
        DataSource = SrcAnalysis_Dtl
        LoadMask.Message = 'Loading data...'
        OnEnter = SetNavDataSource
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Columns = <
          item
            FieldName = 'ELEMENT'
            Title.Caption = 'Element Name'
            Width = 136
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'WEIGHT'
            Title.Caption = 'Weight'
            Width = 74
            CheckBoxField.FieldValues = 'true;false'
          end>
      end
    end
  end
  object pnlModules: TUniPanel
    Left = 0
    Top = 26
    Width = 225
    Height = 237
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 1
    Caption = ''
    object gridModules: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 223
      Height = 120
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 6
      IQComponents.Grid.Height = 34
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcAnalysis
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
      IQComponents.Navigator.DataSource = SrcAnalysis
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 6
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 34
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcAnalysis
      Columns = <
        item
          FieldName = 'MODULE'
          Title.Caption = 'Module'
          Width = 31
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 472
    Height = 26
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object NavMain: TUniDBNavigator
      Left = 247
      Top = 1
      Width = 225
      Height = 24
      Hint = ''
      DataSource = SrcAnalysis
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object SrcAnalysis: TDataSource
    DataSet = TblAnalysis
    Left = 130
    Top = 70
  end
  object SrcAnalysis_Dtl: TDataSource
    DataSet = TblAnalysis_Dtl
    Left = 164
    Top = 70
  end
  object SrcAnalysis_Rate: TDataSource
    DataSet = TblAnalysis_Rate
    Left = 199
    Top = 70
  end
  object TblAnalysis: TFDTable
    BeforePost = TblAnalysisBeforePost
    BeforeDelete = TblAnalysisBeforeDelete
    AfterDelete = TblAnalysisAfterDelete
    BeforeScroll = TblAnalysisBeforeScroll
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'ANALYSIS'
    TableName = 'ANALYSIS'
    Left = 131
    Top = 80
    object TblAnalysisMODULE: TStringField
      DisplayLabel = 'Module'
      DisplayWidth = 31
      FieldName = 'MODULE'
      Required = True
      OnSetText = TblAnalysisMODULESetText
      Size = 50
    end
    object TblAnalysisID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object TblAnalysis_Dtl: TFDTable
    BeforeInsert = TblAnalysis_DtlBeforeInsert
    BeforeEdit = TblAnalysis_DtlBeforeInsert
    BeforePost = TblAnalysisBeforePost
    IndexFieldNames = 'ANALYSIS_ID'
    MasterSource = SrcAnalysis
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'ANALYSIS_DTL'
    TableName = 'ANALYSIS_DTL'
    Left = 165
    Top = 80
    object TblAnalysis_DtlID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object TblAnalysis_DtlANALYSIS_ID: TBCDField
      DisplayLabel = 'Module ID'
      FieldName = 'ANALYSIS_ID'
      Required = True
      Size = 0
    end
    object TblAnalysis_DtlELEMENT: TStringField
      DisplayLabel = 'Element Name'
      FieldName = 'ELEMENT'
      Required = True
      OnSetText = TblAnalysisMODULESetText
      Size = 30
    end
    object TblAnalysis_DtlWEIGHT: TBCDField
      DisplayLabel = 'Weight'
      FieldName = 'WEIGHT'
      Required = True
      MaxValue = 100.000000000000000000
      Size = 2
    end
  end
  object TblAnalysis_Rate: TFDTable
    BeforeInsert = TblAnalysis_DtlBeforeInsert
    BeforeEdit = TblAnalysis_DtlBeforeInsert
    BeforePost = TblAnalysis_RateBeforePost
    IndexFieldNames = 'ANALYSIS_DTL_ID'
    MasterSource = SrcAnalysis_Dtl
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'ANALYSIS_RATE'
    TableName = 'ANALYSIS_RATE'
    Left = 200
    Top = 80
    object TblAnalysis_RateANALYSIS_DTL_ID: TBCDField
      FieldName = 'ANALYSIS_DTL_ID'
      Required = True
      Size = 0
    end
    object TblAnalysis_RateFROM_VAL: TBCDField
      DisplayLabel = 'From'
      FieldName = 'FROM_VAL'
      Size = 2
    end
    object TblAnalysis_RateTO_VAL: TBCDField
      DisplayLabel = 'To'
      FieldName = 'TO_VAL'
      Size = 2
    end
    object TblAnalysis_RateRATE: TBCDField
      DisplayLabel = 'Rate'
      FieldName = 'RATE'
      Required = True
      MaxValue = 100.000000000000000000
      Size = 2
    end
    object TblAnalysis_RateID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 236
    Top = 70
    object File1: TUniMenuItem
      Caption = '&File'
      object Defaults1: TUniMenuItem
        Caption = '&Default Modules'
        object VendorModule1: TUniMenuItem
          Caption = '&Vendor'
          OnClick = VendorModule1Click
        end
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Performance Analysis Setup'
    Version = 'Feature unsupported'
    ChangeListNumber = '$Change: 184319 $'
    Left = 268
    Top = 70
  end
end
