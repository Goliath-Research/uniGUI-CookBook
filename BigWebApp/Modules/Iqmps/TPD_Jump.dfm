object FrmTPD_JumpBase: TFrmTPD_JumpBase
  Left = 101
  Top = 164
  ClientHeight = 143
  ClientWidth = 346
  Caption = 'FrmSelectForJump'
  OnShow = UniFormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 346
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Alignment = taLeftJustify
    Caption = ''
    object DBNavigator1: TUniDBNavigator
      Left = 246
      Top = 1
      Width = 100
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = DataSource1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object DBGrid1: TUniDBGrid
    Left = 0
    Top = 27
    Width = 346
    Height = 116
    Hint = ''
    DataSource = DataSource1
    LoadMask.Message = 'Loading data...'
    OnDblClick = DBGrid1DblClick
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
  end
  object PopupMenu1: TUniPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 40
    Top = 72
    object JumpTo1: TUniMenuItem
      Caption = 'Jump To'
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 88
    Top = 72
  end
  object Query1: TFDQuery
    BeforeOpen = Query1BeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 88
    Top = 92
  end
end
