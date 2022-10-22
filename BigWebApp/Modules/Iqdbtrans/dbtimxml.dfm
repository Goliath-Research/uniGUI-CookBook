inherited FrmDBTransImportXML: TFrmDBTransImportXML
  Left = 333
  Top = 229
  ClientHeight = 223
  ClientWidth = 347
  Caption = 'Import XML'
  OnShow = UniFormShow
  BorderStyle = bsDialog
  OldCreateOrder = True
  ExplicitWidth = 353
  ExplicitHeight = 272
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel4: TUniPanel
    Width = 347
    TabOrder = 2
    ExplicitWidth = 347
  end
  inherited PnlMain: TUniPanel
    Width = 347
    Height = 188
    ExplicitWidth = 347
    ExplicitHeight = 188
    object tvSchema: TUniTreeView
      Left = 8
      Top = 8
      Width = 327
      Height = 163
      Hint = ''
      Items.FontData = {0100000000}
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Color = clWindow
    end
  end
  object PnlButtons: TUniPanel [2]
    Left = 0
    Top = 191
    Width = 347
    Height = 32
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ParentColor = True
    object PnlButtonsInner: TUniPanel
      Left = 140
      Top = 1
      Width = 206
      Height = 30
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ParentColor = True
      object btnFinish: TUniBitBtn
        Left = 1
        Top = 1
        Width = 97
        Height = 25
        Hint = ''
        Enabled = False
        Caption = 'OK'
        TabOrder = 0
        OnClick = DoFinishClick
      end
      object btnCancel: TUniBitBtn
        Left = 102
        Top = 1
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Close'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  inherited MainMenu1: TUniMainMenu
    Left = 72
    Top = 40
  end
  object SrcSource: TDataSource
    DataSet = QrySource
    Left = 247
    Top = 80
  end
  object QrySource: TIQWebDbxQuery
    Aggregates = <>
    ParamCheck = True
    Left = 247
    Top = 115
  end
end
