object FrmFGAvailBase: TFrmFGAvailBase
  Left = 87
  Top = 161
  ClientHeight = 362
  ClientWidth = 784
  Caption = 'FrmFGAvailBase'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TUniDBGrid
    Left = 0
    Top = 0
    Width = 784
    Height = 302
    Hint = ''
    DataSource = DataSource1
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
  end
  object PnlTouchScreenButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 302
    Width = 784
    Height = 60
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlTouchScreenButtonsInner: TUniPanel
      Tag = 1999
      Left = 641
      Top = 1
      Width = 143
      Height = 58
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnTouchScreenClose: TUniButton
        Left = 1
        Top = 9
        Width = 120
        Height = 40
        Hint = ''
        Caption = 'Close'
        TabOrder = 1
        OnClick = btnTouchScreenCloseClick
      end
    end
  end
  object Query1: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 60
    Top = 37
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 60
    Top = 65
  end
  object PopupMenu1: TUniPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 152
    Top = 38
  end
end
