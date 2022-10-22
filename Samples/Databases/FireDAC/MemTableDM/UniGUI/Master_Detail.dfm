object Master_DetailForm: TMaster_DetailForm
  Left = 0
  Top = 0
  ClientHeight = 386
  ClientWidth = 505
  Caption = 'Orders / Items -> Simple Master / Detail using FireDAC'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 185
    Width = 505
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object pnlOrders: TUniPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 185
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object dbgOrders: TUniDBGrid
      Left = 1
      Top = 27
      Width = 503
      Height = 157
      Hint = ''
      DataSource = DM.dsOrders
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
    end
    object pnlMasterGrid: TUniPanel
      Left = 1
      Top = 1
      Width = 503
      Height = 26
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object dbnOrders: TUniDBNavigator
        Left = 262
        Top = 1
        Width = 240
        Height = 24
        Hint = ''
        DataSource = DM.dsOrders
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
  end
  object pnlItems: TUniPanel
    Left = 0
    Top = 188
    Width = 505
    Height = 198
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object pnlDetailGrid: TUniPanel
      Left = 1
      Top = 1
      Width = 503
      Height = 26
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object dbnItems: TUniDBNavigator
        Left = 262
        Top = 1
        Width = 240
        Height = 24
        Hint = ''
        DataSource = DM.dsItems
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object dbgItems: TUniDBGrid
      Left = 1
      Top = 27
      Width = 503
      Height = 170
      Hint = ''
      DataSource = DM.dsItems
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
    end
  end
end
