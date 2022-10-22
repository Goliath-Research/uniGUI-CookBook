object FrmVendorRFQTemplate: TFrmVendorRFQTemplate
  Left = 315
  Top = 244
  ClientHeight = 343
  ClientWidth = 501
  Caption = 'Vendor RFQ Templates'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 168
    Width = 501
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object pnlTop1: TUniPanel
    Left = 0
    Top = 0
    Width = 501
    Height = 168
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 499
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object NavMain: TUniDBNavigator
        Left = 259
        Top = 1
        Width = 240
        Height = 26
        Hint = ''
        DataSource = SrcMain
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 28
      Width = 499
      Height = 140
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 282
      IQComponents.Grid.Height = 54
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcMain
      IQComponents.Grid.LoadMask.Message = 'Loading data...'
      IQComponents.Grid.Align = alClient
      IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
      IQComponents.Grid.TabOrder = 0
      IQComponents.Navigator.Left = 410
      IQComponents.Navigator.Top = 0
      IQComponents.Navigator.Width = 241
      IQComponents.Navigator.Height = 25
      IQComponents.Navigator.Hint = ''
      IQComponents.Navigator.Visible = False
      IQComponents.Navigator.ShowHint = True
      IQComponents.Navigator.DataSource = SrcMain
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 282
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 54
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcMain
      Columns = <
        item
          FieldName = 'CODE'
          Title.Caption = 'Name'
          Width = 72
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 98
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_ID'
          Title.Caption = 'EPlant ID'
          Width = 80
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 171
    Width = 501
    Height = 172
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel4: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 499
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object NavDet: TUniDBNavigator
        Left = 259
        Top = 1
        Width = 240
        Height = 26
        Hint = ''
        DataSource = SrcDetail
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object wwDBGrid2: TIQUniGridControl
      Left = 1
      Top = 28
      Width = 499
      Height = 144
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 282
      IQComponents.Grid.Height = 58
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcDetail
      IQComponents.Grid.LoadMask.Message = 'Loading data...'
      IQComponents.Grid.Align = alClient
      IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
      IQComponents.Grid.TabOrder = 0
      IQComponents.Navigator.Left = 410
      IQComponents.Navigator.Top = 0
      IQComponents.Navigator.Width = 241
      IQComponents.Navigator.Height = 25
      IQComponents.Navigator.Hint = ''
      IQComponents.Navigator.Visible = False
      IQComponents.Navigator.ShowHint = True
      IQComponents.Navigator.DataSource = SrcDetail
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 282
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 58
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcDetail
      Columns = <
        item
          FieldName = 'QUAN'
          Title.Caption = 'Qty Break'
          Width = 153
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PRICE'
          Title.Caption = 'Price'
          Width = 91
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object SrcMain: TDataSource
    DataSet = QryMain
    Left = 157
    Top = 172
  end
  object QryMain: TFDQuery
    BeforeInsert = PostParentBeforeEdit
    BeforeEdit = PostParentBeforeEdit
    BeforePost = QryMainBeforePost
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'vendor_rfq_templ'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLTemplate
    SQL.Strings = (
      'select id,'
      '       code,'
      '       descrip,'
      '       eplant_id'
      '  from vendor_rfq_templ'
      ' where misc.eplant_filter_include_nulls( eplant_id ) = 1'
      ' order by code'
      '')
    Left = 157
    Top = 143
    object QryMainCODE: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 23
      FieldName = 'CODE'
      Size = 30
    end
    object QryMainDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 29
      FieldName = 'DESCRIP'
      Size = 60
    end
    object QryMainEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      ReadOnly = True
      Precision = 15
      Size = 0
    end
    object QryMainID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object UpdateSQLTemplate: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into vendor_rfq_templ'
      '  (ID, CODE, DESCRIP)'
      'values'
      '  (:ID, :CODE, :DESCRIP)')
    ModifySQL.Strings = (
      'update vendor_rfq_templ'
      'set'
      '  ID = :ID,'
      '  CODE = :CODE,'
      '  DESCRIP = :DESCRIP'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from vendor_rfq_templ'
      'where'
      '  ID = :OLD_ID')
    Left = 158
    Top = 5
  end
  object SrcDetail: TDataSource
    DataSet = QryDetail
    Left = 163
    Top = 102
  end
  object QryDetail: TFDQuery
    BeforePost = QryDetailBeforePost
    OnNewRecord = QryDetailNewRecord
    MasterSource = SrcMain
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'vendor_rfq_templ_quan'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLDetail
    SQL.Strings = (
      'select id,'
      '       vendor_rfq_templ_id,'
      '       quan,'
      '       price'
      '  from vendor_rfq_templ_quan'
      ' where vendor_rfq_templ_id = :id'
      ' order by quan'
      '')
    Left = 163
    Top = 78
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryDetailQUAN: TBCDField
      DisplayLabel = 'Qty Break'
      DisplayWidth = 17
      FieldName = 'QUAN'
      Origin = 'QUAN'
      Precision = 10
      Size = 0
    end
    object QryDetailPRICE: TFMTBCDField
      DisplayLabel = 'Price'
      DisplayWidth = 10
      FieldName = 'PRICE'
      Origin = 'IQ.VENDOR_RFQ_TEMPL_QUAN.PRICE'
      Size = 6
    end
    object QryDetailID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.VENDOR_RFQ_TEMPL_QUAN.ID'
      Visible = False
      Size = 0
    end
    object QryDetailVENDOR_RFQ_TEMPL_ID: TBCDField
      FieldName = 'VENDOR_RFQ_TEMPL_ID'
      Origin = 'IQ.VENDOR_RFQ_TEMPL_QUAN.VENDOR_RFQ_TEMPL_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQLDetail: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into vendor_rfq_templ_quan'
      '  (ID, VENDOR_RFQ_TEMPL_ID, QUAN, PRICE)'
      'values'
      '  (:ID, :VENDOR_RFQ_TEMPL_ID, :QUAN, :PRICE)')
    ModifySQL.Strings = (
      'update vendor_rfq_templ_quan'
      'set'
      '  ID = :ID,'
      '  VENDOR_RFQ_TEMPL_ID = :VENDOR_RFQ_TEMPL_ID,'
      '  QUAN = :QUAN,'
      '  PRICE = :PRICE'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from vendor_rfq_templ_quan'
      'where'
      '  ID = :OLD_ID')
    Left = 161
    Top = 47
  end
  object MainMenu1: TUniMainMenu
    Left = 227
    Top = 34
    object File1: TUniMenuItem
      Caption = 'File'
      object Close1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Close1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = 'About ...'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmVendorRFQTemplate'
    Version = 'Feature unsupported'
    ChangeListNumber = '$Change: 186748 $'
    Left = 294
    Top = 42
  end
end
