object Frm941DetailTaxes: TFrm941DetailTaxes
  Left = 49
  Top = 274
  ClientHeight = 161
  ClientWidth = 318
  Caption = 'Frm941DetailTaxes'
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 318
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 270
    object Nav: TUniDBNavigator
      Left = 217
      Top = 1
      Width = 100
      Height = 25
      Hint = ''
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitLeft = 169
    end
  end
  object grid: TUniDBGrid
    Left = 0
    Top = 27
    Width = 318
    Height = 134
    Hint = ''
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Columns = <
      item
        FieldName = 'CHECK_DATE'
        Title.Caption = 'Check Date'
        Width = 93
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TOTAL'
        Title.Caption = 'Tot. (FWT-EIC+2*MCARE+2*FICA)'
        Width = 200
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
end
