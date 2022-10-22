object ViewMfgType: TViewMfgType
  Left = 425
  Top = 158
  ClientHeight = 217
  ClientWidth = 284
  Caption = 'View Manufacturing Types'
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  ActiveControl = Panel1
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 27
    Width = 284
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
    Width = 284
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object DBNavigator: TUniDBNavigator
      Left = 159
      Top = 1
      Width = 125
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = DataSource1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 30
    Width = 284
    Height = 187
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = 'Panel2'
    object DBGrid1: TUniDBGrid
      Left = 1
      Top = 1
      Width = 282
      Height = 185
      Hint = ''
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgTabs, dgCancelOnExit]
      LoadMask.Message = 'Loading data...'
      BorderStyle = ubsNone
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Color = clBlack
      ParentFont = False
      TabOrder = 0
      ParentColor = False
      Color = clBtnFace
      Columns = <
        item
          FieldName = 'MFGTYPE'
          Title.Caption = 'Manufacturing Type'
          Width = 114
          Font.Color = clBlack
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 162
          Font.Color = clBlack
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
  end
  object DataSource1: TDataSource
    Left = 54
    Top = 104
  end
end
