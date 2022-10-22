object FrmPREmpMatch: TFrmPREmpMatch
  Left = 36
  Top = 264
  HelpContext = 13985
  ClientHeight = 173
  ClientWidth = 290
  Caption = 'Employers deduction matchings'
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 120
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 290
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object nav: TUniDBNavigator
      Left = 65
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object grid: TUniDBGrid
    Left = 0
    Top = 27
    Width = 290
    Height = 146
    Hint = ''
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Columns = <
      item
        FieldName = 'MATCH_PRECENT'
        Title.Caption = 'Matching percentage'
        Title.Font.Height = -13
        Width = 134
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CEILING'
        Title.Caption = 'Ceiling'
        Title.Font.Height = -13
        Width = 138
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PERCENT_CEILING'
        Title.Caption = 'Percentage Ceiling'
        Title.Font.Height = -13
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmPREmpMatch'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 152
    Top = 48
  end
  object PopupMenu1: TUniPopupMenu
    Left = 196
    Top = 50
    object Trace1: TUniMenuItem
      Caption = '&Trace'
      OnClick = Trace1Click
    end
  end
end
