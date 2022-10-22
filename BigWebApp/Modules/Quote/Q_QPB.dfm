object FrmQ_QPB: TFrmQ_QPB
  Left = 221
  Top = 100
  ClientHeight = 209
  ClientWidth = 376
  Caption = ''
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 376
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 368
    object DBNavigator1: TUniDBNavigator
      Left = 150
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcQinvt_Qty_Breaks
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitLeft = 142
    end
  end
  object DBGrid1: TUniDBGrid
    Left = 0
    Top = 27
    Width = 376
    Height = 182
    Hint = ''
    DataSource = SrcQinvt_Qty_Breaks
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
        Title.Caption = 'Date Effective'
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
  object SrcQinvt: TDataSource
    Left = 154
    Top = 65
  end
  object TblQinvt_Qty_Breaks: TFDTable
    IndexName = 'PK_OUTSRC_QTY_BREAKS'
    MasterSource = SrcQinvt
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'OUTSRC_QTY_BREAKS'
    TableName = 'OUTSRC_QTY_BREAKS'
    Left = 288
    Top = 64
    object TblQinvt_Qty_BreaksQUAN: TBCDField
      DisplayLabel = 'Qty'
      FieldName = 'QUAN'
      Required = True
      Size = 0
    end
    object TblQinvt_Qty_BreaksQPRICE: TFMTBCDField
      DisplayLabel = 'Price'
      FieldName = 'QPRICE'
      DisplayFormat = '########0.0000'
      Size = 6
    end
    object TblQinvt_Qty_BreaksPRICE_DATE: TDateTimeField
      DisplayLabel = 'Date'
      FieldName = 'PRICE_DATE'
    end
    object TblQinvt_Qty_BreaksEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Eff Date'
      FieldName = 'EFFECT_DATE'
    end
    object TblQinvt_Qty_BreaksDEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Exp Date'
      FieldName = 'DEACTIVE_DATE'
    end
    object TblQinvt_Qty_BreaksQINVT_ID: TBCDField
      FieldName = 'QINVT_ID'
      Required = True
      Size = 0
    end
  end
  object SrcQinvt_Qty_Breaks: TDataSource
    DataSet = TblQinvt_Qty_Breaks
    OnDataChange = SrcQinvt_Qty_BreaksDataChange
    Left = 288
    Top = 132
  end
end
