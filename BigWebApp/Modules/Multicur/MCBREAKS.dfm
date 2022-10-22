inherited FrmMCBreaks: TFrmMCBreaks
  ClientHeight = 203
  ClientWidth = 343
  Caption = 'Quantity Price Breaks'
  BorderStyle = bsSizeable
  ExplicitWidth = 359
  ExplicitHeight = 262
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    Width = 343
    ExplicitWidth = 343
    object nav: TUniDBNavigator
      Left = 242
      Top = 1
      Width = 100
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = Src
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
    end
  end
  object grid: TUniDBGrid [1]
    Left = 0
    Top = 27
    Width = 343
    Height = 176
    Hint = ''
    DataSource = Src
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
        Width = 165
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  inherited MainMenu1: TUniMainMenu
    Left = 40
    Top = 128
  end
  inherited tblCurrency: TFDTable
    Left = 100
    Top = 66
  end
  object Src: TDataSource
    DataSet = Qry
    Left = 24
    Top = 80
  end
  object Qry: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select quan,'
      '         Round(qprice * :nFactor, 6) as qprice'
      '  from ARINVT_BREAKS'
      ' where 1 = 1'
      ' ')
    Left = 40
    Top = 80
    ParamData = <
      item
        Name = 'nFactor'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryQUAN: TBCDField
      FieldName = 'QUAN'
      Size = 2
    end
    object QryQPRICE: TFMTBCDField
      FieldName = 'QPRICE'
      DisplayFormat = '###,##0.000000;;'
      Size = 38
    end
  end
end
