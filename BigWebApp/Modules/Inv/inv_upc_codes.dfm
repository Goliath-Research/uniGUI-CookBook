object FrmInvUPCCodes: TFrmInvUPCCodes
  Left = 205
  Top = 184
  HelpContext = 1537824
  ClientHeight = 250
  ClientWidth = 575
  Caption = 'UPC Codes'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 288
    Top = 0
    Width = 5
    Height = 250
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object pnlLeft01: TUniPanel
    Left = 0
    Top = 0
    Width = 288
    Height = 250
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    Caption = ''
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 22
      Width = 286
      Height = 228
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 69
      IQComponents.Grid.Height = 142
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcArinvt
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
      IQComponents.Navigator.DataSource = SrcArinvt
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 69
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 142
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcArinvt
      Columns = <
        item
          FieldName = 'ITEMNO'
          Title.Caption = 'Item #'
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
          FieldName = 'REV'
          Title.Caption = 'Revision'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CLASS'
          Title.Caption = 'Class'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP2'
          Title.Caption = 'Ext Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_ID'
          Title.Caption = 'EPlant ID'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
    object Panel3: TUniPanel
      Left = 1
      Top = 1
      Width = 286
      Height = 22
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = '  Inventory Items'
    end
  end
  object Panel2: TUniPanel
    Left = 293
    Top = 0
    Width = 282
    Height = 250
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object wwDBGridUPC: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 280
      Height = 248
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 63
      IQComponents.Grid.Height = 162
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcArinvt_UPC
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
      IQComponents.Navigator.DataSource = SrcArinvt_UPC
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 63
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 162
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitHeight = 137
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitHeight = 166
      DataSource = SrcArinvt_UPC
      Columns = <
        item
          FieldName = 'SEQ'
          Title.Caption = 'Sequence #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'UPC_CODE'
          Title.Caption = 'UPC Code'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'QTY'
          Title.Caption = 'Quantity'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      ExplicitTop = 27
      ExplicitHeight = 223
      Marker = 0
    end
  end
  object SrcArinvt: TDataSource
    DataSet = QryArinvt
    Left = 20
    Top = 134
  end
  object QryArinvt: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, class, itemno, rev, descrip, descrip2, eplant_id'
      '  from arinvt'
      ' where misc.eplant_filter( eplant_id ) = 1')
    Left = 20
    Top = 152
    object QryArinvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 23
      FieldName = 'ITEMNO'
      Origin = 'ARINVT.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 28
      FieldName = 'DESCRIP'
      Origin = 'ARINVT.DESCRIP'
      Size = 100
    end
    object QryArinvtREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 11
      FieldName = 'REV'
      Origin = 'ARINVT.REV'
      FixedChar = True
      Size = 15
    end
    object QryArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      Origin = 'ARINVT.CLASS'
      FixedChar = True
      Size = 2
    end
    object QryArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Origin = 'ARINVT.DESCRIP2'
      Size = 100
    end
    object QryArinvtEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'ARINVT.EPLANT_ID'
      Size = 0
    end
    object QryArinvtID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ARINVT.ID'
      Visible = False
      Size = 0
    end
  end
  object SrcArinvt_UPC: TDataSource
    DataSet = QryArinvt_UPC
    Left = 56
    Top = 135
  end
  object QryArinvt_UPC: TFDQuery
    BeforePost = QryArinvt_UPCBeforePost
    AfterPost = ApplyUpdatesToTable
    AfterDelete = ApplyUpdatesToTable
    OnNewRecord = QryArinvt_UPCNewRecord
    MasterSource = SrcArinvt
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.UpdateTableName = 'arinvt_upc'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLArinvt_UPC
    SQL.Strings = (
      'select id,'
      '       arinvt_id, '
      '       seq,'
      '       upc_code,'
      '       qty'
      '  from arinvt_upc'
      ' where arinvt_id = :id'
      ' order by seq')
    Left = 56
    Top = 151
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 1472030000c
      end>
    object QryArinvt_UPCSEQ: TBCDField
      DisplayLabel = 'Sequence #'
      DisplayWidth = 10
      FieldName = 'SEQ'
      Origin = 'ARINVT_UPC.SEQ'
      Size = 0
    end
    object QryArinvt_UPCUPC_CODE: TStringField
      DisplayLabel = 'UPC Code'
      DisplayWidth = 20
      FieldName = 'UPC_CODE'
      Origin = 'IQ.ARINVT_UPC.UPC_CODE'
      Required = True
    end
    object QryArinvt_UPCQTY: TFMTBCDField
      DisplayLabel = 'Quantity'
      DisplayWidth = 10
      FieldName = 'QTY'
      Origin = 'IQ.ARINVT_UPC.QTY'
      Size = 6
    end
    object QryArinvt_UPCID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ARINVT_UPC.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryArinvt_UPCARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.ARINVT_UPC.ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQLArinvt_UPC: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into arinvt_upc'
      '  (ID, ARINVT_ID, SEQ, UPC_CODE, QTY)'
      'values'
      '  (:ID, :ARINVT_ID, :SEQ, :UPC_CODE, :QTY)')
    ModifySQL.Strings = (
      'update arinvt_upc'
      'set'
      '  ID = :ID,'
      '  ARINVT_ID = :ARINVT_ID,'
      '  SEQ = :SEQ,'
      '  UPC_CODE = :UPC_CODE,'
      '  QTY = :QTY'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from arinvt_upc'
      'where'
      '  ID = :OLD_ID')
    Left = 56
    Top = 165
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'QryArinvt_UPC'
      'NavUpcCodes')
    SecurityCode = 'FRMINVUPCCODES'
    Left = 22
    Top = 93
  end
  object MainMenu1: TUniMainMenu
    Left = 57
    Top = 93
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        ShortCut = 112
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Inventory UPC Codes'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 92
    Top = 95
  end
end
