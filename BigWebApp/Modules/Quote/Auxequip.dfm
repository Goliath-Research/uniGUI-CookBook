object FrmAuxEquip: TFrmAuxEquip
  Left = 263
  Top = 171
  HelpContext = 1166317
  ClientHeight = 163
  ClientWidth = 386
  Caption = 'Auxiliary Equipment'
  OnShow = UniFormShow
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
    Width = 386
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 30
    Width = 386
    Height = 133
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object DBGrid1: TUniDBGrid
      Left = 1
      Top = 1
      Width = 384
      Height = 131
      Hint = ''
      DataSource = SrcAux2
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Columns = <
        item
          FieldName = 'AUX_DESC'
          Title.Caption = 'Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'AUX_RATE'
          Title.Caption = 'Rate'
          Width = 80
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'HOW_MANY'
          Title.Caption = 'How Many'
          Width = 91
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 386
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object DBNavigator1: TUniDBNavigator
      Left = 136
      Top = 1
      Width = 250
      Height = 25
      Hint = ''
      DataSource = SrcAux2
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object SrcAux2: TDataSource
    DataSet = TblAux2
    Left = 40
    Top = 64
  end
  object TblAux2: TFDTable
    BeforeOpen = TblAux2BeforeOpen
    BeforePost = TblAux2BeforePost
    Filtered = True
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'AUX'
    TableName = 'AUX'
    Left = 56
    Top = 72
    object TblAux2ID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object TblAux2AUX_DESC: TStringField
      FieldName = 'AUX_DESC'
      Required = True
      Size = 50
    end
    object TblAux2AUX_RATE: TBCDField
      FieldName = 'AUX_RATE'
      Size = 2
    end
    object TblAux2HOW_MANY: TBCDField
      FieldName = 'HOW_MANY'
      Size = 0
    end
    object TblAux2EPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
end
