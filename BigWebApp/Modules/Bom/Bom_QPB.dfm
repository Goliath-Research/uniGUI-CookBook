object FrmBOM_QPB: TFrmBOM_QPB
  Left = 144
  Top = 148
  ClientHeight = 181
  ClientWidth = 349
  Caption = 'Price Breaks'
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 349
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object DBNavigator1: TUniDBNavigator
      Left = 124
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcPartNo_Qty_Breaks
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object DBGrid1: TUniDBGrid
    Left = 0
    Top = 27
    Width = 349
    Height = 154
    Hint = ''
    DataSource = SrcPartNo_Qty_Breaks
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Columns = <
      item
        FieldName = 'QUAN'
        Title.Caption = 'Quantity'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'QPRICE'
        Title.Caption = 'Price'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PRICE_DATE'
        Title.Caption = 'Date'
        Width = 112
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EFFECT_DATE'
        Title.Caption = 'Effective Date'
        Width = 112
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DEACTIVE_DATE'
        Title.Caption = 'Expiration Date'
        Width = 112
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  object SrcPartNo_Qty_Breaks: TDataSource
    DataSet = TblPartNo_Qty_Breaks
    OnDataChange = SrcPartNo_Qty_BreaksDataChange
    Left = 288
    Top = 80
  end
  object TblPartNo_Qty_Breaks: TFDTable
    IndexName = 'PK_PARTNO_QTY_BREAKS'
    MasterSource = SrcPartNo
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PARTNO_QTY_BREAKS'
    TableName = 'PARTNO_QTY_BREAKS'
    Left = 288
    Top = 64
    object TblPartNo_Qty_BreaksPARTNO_ID: TBCDField
      DisplayLabel = 'Item #'
      FieldName = 'PARTNO_ID'
      Required = True
      Size = 0
    end
    object TblPartNo_Qty_BreaksQUAN: TBCDField
      DisplayLabel = 'Qty'
      FieldName = 'QUAN'
      Required = True
      Size = 0
    end
    object TblPartNo_Qty_BreaksQPRICE: TFMTBCDField
      DisplayLabel = 'Price'
      FieldName = 'QPRICE'
      DisplayFormat = '########0.0000'
      Size = 6
    end
    object TblPartNo_Qty_BreaksPRICE_DATE: TDateTimeField
      DisplayLabel = 'Date'
      FieldName = 'PRICE_DATE'
    end
    object TblPartNo_Qty_BreaksEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Eff Date'
      FieldName = 'EFFECT_DATE'
    end
    object TblPartNo_Qty_BreaksDEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Exp Date'
      FieldName = 'DEACTIVE_DATE'
    end
  end
  object SrcPartNo: TDataSource
    Left = 250
    Top = 65
  end
end
