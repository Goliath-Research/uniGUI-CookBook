object FrmCust_Type: TFrmCust_Type
  Left = 312
  Top = 190
  HelpContext = 1463912
  ClientHeight = 217
  ClientWidth = 292
  Caption = 'Customer Tier Types'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 27
    Width = 292
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
  end
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 292
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object NavMain: TUniDBNavigator
      Left = 67
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = DataSource1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object DBGrid1: TUniDBGrid
    Left = 0
    Top = 30
    Width = 292
    Height = 187
    Hint = ''
    DataSource = DataSource1
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Columns = <
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  object DataSource1: TDataSource
    DataSet = TblTypes
    Left = 32
    Top = 64
  end
  object TblTypes: TFDTable
    BeforePost = TblTypesBeforePost
    IndexFieldNames = 'DESCRIP'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'CUST_TYPE'
    TableName = 'CUST_TYPE'
    Left = 32
    Top = 80
    object TblTypesID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object TblTypesDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 50
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'NavMain'
      'TblTypes')
    SecurityCode = 'FRMCUST_TYPE'
    Left = 72
    Top = 64
  end
end
