object FrmShipTrailer: TFrmShipTrailer
  Left = 475
  Top = 208
  HelpContext = 1147662
  ClientHeight = 271
  ClientWidth = 963
  Caption = 'Shipment Trailers / Containers'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 963
    Height = 271
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 746
    IQComponents.Grid.Height = 185
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcTrailer
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
    IQComponents.Navigator.DataSource = SrcTrailer
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 746
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 185
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcTrailer
    Columns = <
      item
        FieldName = 'SEQ'
        Title.Caption = '#'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'WIDTH'
        Title.Caption = 'Width'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'HEIGHT'
        Title.Caption = 'Height'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LENGTH'
        Title.Caption = 'Length'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DIM_UOM'
        Title.Caption = 'Dimension UOM'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'WEIGHT_UOM'
        Title.Caption = 'Weight UOM'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MAX_WEIGHT'
        Title.Caption = 'Max Weight'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Volume'
        Title.Caption = 'Volume'
        Width = 64
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'GAP_PERCENT'
        Title.Caption = 'Gap %'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPlant'
        Title.Caption = 'EPlant'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object wwDBComboDlgEPlant: TUniEdit
    Left = 144
    Top = 88
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 1
  end
  object comboDimensionUOM: TUniDBComboBox
    Left = 144
    Top = 125
    Width = 121
    Height = 21
    Hint = ''
    ShowHint = True
    ParentShowHint = False
    Style = csDropDownList
    Items.Strings = (
      'FT'
      'IN'
      'M'
      'CM')
    TabOrder = 2
  end
  object wwDBComboBoxWeightUOM: TUniDBComboBox
    Left = 144
    Top = 160
    Width = 121
    Height = 21
    Hint = ''
    Style = csDropDownList
    Items.Strings = (
      'LBS'
      'OZ'
      'KG'
      'GR')
    TabOrder = 3
  end
  object SrcTrailer: TDataSource
    DataSet = QryTrailer
    Left = 52
    Top = 84
  end
  object QryTrailer: TFDQuery
    BeforePost = QryTrailerBeforePost
    OnCalcFields = QryTrailerCalcFields
    OnNewRecord = QryTrailerNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'TRAILER'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLTrailer
    SQL.Strings = (
      'select id,'
      '       seq,'
      '       descrip,'
      '       width,'
      '       height,'
      '       length,'
      '       max_weight,'
      '       gap_percent,'
      '       eplant_id,'
      '       dim_uom,'
      '       weight_uom'
      '  from trailer'
      ' where misc.eplant_filter_include_nulls( eplant_id ) = 1'
      ' order by seq')
    Left = 52
    Top = 101
    object QryTrailerSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 4
      FieldName = 'SEQ'
      Required = True
      Size = 0
    end
    object QryTrailerDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 24
      FieldName = 'DESCRIP'
      Required = True
      Size = 35
    end
    object QryTrailerWIDTH: TFMTBCDField
      DisplayLabel = 'Width'
      DisplayWidth = 10
      FieldName = 'WIDTH'
      Required = True
      Size = 6
    end
    object QryTrailerHEIGHT: TFMTBCDField
      DisplayLabel = 'Height'
      DisplayWidth = 10
      FieldName = 'HEIGHT'
      Required = True
      Size = 6
    end
    object QryTrailerLENGTH: TFMTBCDField
      DisplayLabel = 'Length'
      DisplayWidth = 10
      FieldName = 'LENGTH'
      Required = True
      Size = 6
    end
    object QryTrailerDIM_UOM: TStringField
      DisplayLabel = 'Dimension UOM'
      DisplayWidth = 15
      FieldName = 'DIM_UOM'
      Size = 10
    end
    object QryTrailerWEIGHT_UOM: TStringField
      DisplayLabel = 'Weight UOM'
      DisplayWidth = 15
      FieldName = 'WEIGHT_UOM'
      Size = 10
    end
    object QryTrailerMAX_WEIGHT: TFMTBCDField
      DisplayLabel = 'Max Weight'
      DisplayWidth = 10
      FieldName = 'MAX_WEIGHT'
      Size = 6
    end
    object QryTrailerVolume: TFloatField
      DisplayWidth = 17
      FieldKind = fkCalculated
      FieldName = 'Volume'
      ReadOnly = True
      Calculated = True
    end
    object QryTrailerGAP_PERCENT: TBCDField
      DisplayLabel = 'Gap %'
      DisplayWidth = 10
      FieldName = 'GAP_PERCENT'
      Size = 2
    end
    object QryTrailerEPlant: TStringField
      DisplayWidth = 24
      FieldKind = fkLookup
      FieldName = 'EPlant'
      LookupDataSet = QryEPlant
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'EPLANT_ID'
      Size = 50
      Lookup = True
    end
    object QryTrailerEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object QryTrailerID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
  end
  object UpdateSQLTrailer: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into trailer'
      
        '  (ID, SEQ, DESCRIP, WIDTH, HEIGHT, LENGTH, MAX_WEIGHT, GAP_PERC' +
        'ENT, EPLANT_ID, '
      '   DIM_UOM, WEIGHT_UOM)'
      'values'
      
        '  (:ID, :SEQ, :DESCRIP, :WIDTH, :HEIGHT, :LENGTH, :MAX_WEIGHT, :' +
        'GAP_PERCENT, '
      '   :EPLANT_ID, :DIM_UOM, :WEIGHT_UOM)')
    ModifySQL.Strings = (
      'update trailer'
      'set'
      '  ID = :ID,'
      '  SEQ = :SEQ,'
      '  DESCRIP = :DESCRIP,'
      '  WIDTH = :WIDTH,'
      '  HEIGHT = :HEIGHT,'
      '  LENGTH = :LENGTH,'
      '  MAX_WEIGHT = :MAX_WEIGHT,'
      '  GAP_PERCENT = :GAP_PERCENT,'
      '  EPLANT_ID = :EPLANT_ID,'
      '  DIM_UOM = :DIM_UOM,'
      '  WEIGHT_UOM = :WEIGHT_UOM'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from trailer'
      'where'
      '  ID = :OLD_ID')
    Left = 52
    Top = 118
  end
  object MainMenu1: TUniMainMenu
    Left = 57
    Top = 187
    object File1: TUniMenuItem
      Caption = 'File'
      object Close1: TUniMenuItem
        Caption = 'Close'
        OnClick = Close1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmShipTrailer'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 188990 $'
    BuildVersion = '176554'
    Left = 91
    Top = 187
  end
  object QryEPlant: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       '#39'['#39' || ID || '#39']  '#39' || name as descrip'
      '  from eplant')
    Left = 88
    Top = 118
    object QryEPlantID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryEPlantDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 74
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'NavMain'
      'TblTypes')
    SecurityCode = 'FRMCUST_TYPE'
    Left = 424
    Top = 160
  end
end
