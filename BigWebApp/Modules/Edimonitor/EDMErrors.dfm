object FrmEdiMErrors: TFrmEdiMErrors
  Left = 69
  Top = 168
  Width = 448
  Height = 307
  Caption = 'Errors'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 440
    Height = 25
    Align = alTop
    TabOrder = 0
    object DBNavigator1: TUniDBNavigator
      Left = 339
      Top = 1
      Width = 100
      Height = 23
      DataSource = FrmEDIManager.SrcErr
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      TabOrder = 0
    end
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 25
    Width = 440
    Height = 255
              Columns = <
                item
                  FieldName = 'EDI_ERROR'
                  Title.Caption = 'Error'
                  Width = 350
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end>
    Align = alClient
    DataSource = FrmEDIManager.SrcErr
    TabOrder = 1
    IndicatorColor = icBlack
  end
end
