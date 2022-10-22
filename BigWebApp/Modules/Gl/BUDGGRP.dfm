object FrmGroups: TFrmGroups
  Left = 414
  Top = 236
  ClientHeight = 182
  ClientWidth = 274
  Caption = 'Budget Groups'
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 27
    Width = 274
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
    Width = 274
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = 'Panel1'
    object DBNavigator1: TUniDBNavigator
      Left = 99
      Top = 1
      Width = 175
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 30
    Width = 274
    Height = 152
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = 'Panel2'
    object DBGrid1: TUniDBGrid
      Left = 1
      Top = 1
      Width = 272
      Height = 150
      Hint = ''
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Columns = <
        item
          Title.Caption = 'Code'
          Width = 65
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          Title.Caption = 'Description'
          Width = 172
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
  end
end
