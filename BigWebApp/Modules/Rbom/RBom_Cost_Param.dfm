object FrmRBomCostParam: TFrmRBomCostParam
  Left = 212
  Top = 141
  ClientHeight = 188
  ClientWidth = 267
  Caption = 'Cost / Quote Parameters'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TUniPageControl
    Left = 6
    Top = 6
    Width = 256
    Height = 130
    Hint = ''
    ActivePage = tabGeneral
    TabOrder = 0
    object tabGeneral: TUniTabSheet
      Hint = ''
      Caption = 'General'
      object Label1: TUniLabel
        Left = 4
        Top = 67
        Width = 81
        Height = 13
        Hint = ''
        Caption = 'Decimal Precision'
        TabOrder = 1
      end
      object DBEdit1: TUniDBEdit
        Left = 97
        Top = 63
        Width = 33
        Height = 21
        Hint = ''
        DataField = 'QUOTE_DECIMAL'
        DataSource = SrcQParams
        TabOrder = 0
      end
      object UniRadioGroup1: TUniRadioGroup
        Left = 2
        Top = 2
        Width = 244
        Height = 47
        Hint = ''
        Items.Strings = (
          'Percentage'
          'Points')
        Caption = ' Markup By '
        TabOrder = 2
        Columns = 2
        OnClick = UniRadioGroup1Click
      end
    end
  end
  object btnOK: TUniButton
    Left = 58
    Top = 144
    Width = 97
    Height = 25
    Hint = ''
    Caption = '&OK'
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnCancel: TUniButton
    Left = 161
    Top = 144
    Width = 97
    Height = 25
    Hint = ''
    Caption = '&Cancel'
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object TblQParams: TFDTable
    AfterOpen = TblQParamsAfterOpen
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'QPARAMS'
    TableName = 'QPARAMS'
    Left = 32
    Top = 120
    object TblQParamsMARKUP_IS_POINTS: TStringField
      FieldName = 'MARKUP_IS_POINTS'
      FixedChar = True
      Size = 1
    end
    object TblQParamsQUOTE_DECIMAL: TBCDField
      DisplayLabel = 'Decimal Precision'
      FieldName = 'QUOTE_DECIMAL'
      MaxValue = 6.000000000000000000
      Size = 0
    end
  end
  object SrcQParams: TDataSource
    DataSet = TblQParams
    Left = 107
    Top = 123
  end
end
