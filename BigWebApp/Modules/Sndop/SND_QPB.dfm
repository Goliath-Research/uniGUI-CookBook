object SndQPB: TSndQPB
  Left = 201
  Top = 118
  ClientHeight = 233
  ClientWidth = 355
  Caption = 'Operation Price Breaks'
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  ActiveControl = PnlToolbar
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 27
    Width = 355
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
  end
  object PnlToolbar: TUniPanel
    Left = 0
    Top = 0
    Width = 355
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object NavMain: TUniDBNavigator
      Left = 130
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
  object Panel2: TUniPanel
    Left = 0
    Top = 30
    Width = 355
    Height = 203
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = 'Panel2'
    object DBGrid1: TUniDBGrid
      Left = 1
      Top = 1
      Width = 353
      Height = 201
      Hint = ''
      DataSource = DataSource1
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Columns = <
        item
          FieldName = 'QUAN'
          Title.Caption = 'Quantity'
          Width = 59
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'QPRICE'
          Title.Caption = 'Price Break'
          Width = 75
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PRICE_DATE'
          Title.Caption = 'Price Date'
          Width = 99
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EFFECT_DATE'
          Title.Caption = 'Date Effective'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
  end
  object DataSource1: TDataSource
    Left = 257
    Top = 93
  end
end
