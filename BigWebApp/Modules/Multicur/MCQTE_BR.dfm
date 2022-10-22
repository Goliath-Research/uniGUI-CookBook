inherited FrmMCGridBasic: TFrmMCGridBasic
  ClientHeight = 241
  ClientWidth = 314
  Caption = 'Grid basic'
  ExplicitWidth = 330
  ExplicitHeight = 300
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    Width = 314
    ExplicitLeft = -8
    ExplicitWidth = 314
    inherited cbCurrency: TUniDBLookupComboBox
      Width = 119
      ExplicitWidth = 119
    end
    object nav: TUniDBNavigator
      Left = 214
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
    Width = 314
    Height = 214
    Hint = ''
    DataSource = Src
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
  end
  inherited MainMenu1: TUniMainMenu
    Left = 104
  end
  inherited tblCurrency: TFDTable
    Left = 60
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
    Left = 40
    Top = 80
  end
end
