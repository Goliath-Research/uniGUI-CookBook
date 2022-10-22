object LabRates: TLabRates
  Left = 257
  Top = 157
  ClientHeight = 243
  ClientWidth = 287
  Caption = ''
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  ActiveControl = Panel1
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 27
    Width = 287
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 287
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object NavMain: TUniDBNavigator
      Left = 62
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
    Width = 287
    Height = 213
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = 'Panel2'
    object DBGrid1: TUniDBGrid
      Left = 1
      Top = 1
      Width = 285
      Height = 211
      Hint = ''
      DataSource = DataSource1
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Columns = <
        item
          FieldName = 'LABOR_RATE'
          Title.Caption = 'Rate'
          Width = 89
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
  end
  object DataSource1: TDataSource
    Left = 123
    Top = 69
  end
end
