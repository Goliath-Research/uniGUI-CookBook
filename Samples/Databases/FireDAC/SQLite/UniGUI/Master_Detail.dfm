object Master_DetailForm: TMaster_DetailForm
  Left = 0
  Top = 0
  ClientHeight = 407
  ClientWidth = 548
  Caption = 'Orders / Items -> Simple Master / Detail using FireDAC'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 185
    Width = 548
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
    ExplicitWidth = 505
  end
  object pnlOrders: TUniPanel
    Left = 0
    Top = 0
    Width = 548
    Height = 185
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 505
    object dbgOrders: TUniDBGrid
      Left = 1
      Top = 27
      Width = 546
      Height = 157
      Hint = ''
      DataSource = UniMainModule.dsOrders
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
    end
    object pnlMasterGrid: TUniPanel
      Left = 1
      Top = 1
      Width = 546
      Height = 26
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      ExplicitWidth = 503
      object dbnOrders: TUniDBNavigator
        Left = 305
        Top = 1
        Width = 240
        Height = 24
        Hint = ''
        DataSource = UniMainModule.dsOrders
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitLeft = 262
      end
    end
  end
  object pnlItems: TUniPanel
    Left = 0
    Top = 188
    Width = 548
    Height = 219
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 505
    ExplicitHeight = 198
    object pnlDetailGrid: TUniPanel
      Left = 1
      Top = 1
      Width = 546
      Height = 26
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      ExplicitWidth = 503
      object dbnItems: TUniDBNavigator
        Left = 305
        Top = 1
        Width = 240
        Height = 24
        Hint = ''
        DataSource = UniMainModule.dsItems
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitLeft = 262
      end
    end
    object dbgItems: TUniDBGrid
      Left = 1
      Top = 27
      Width = 546
      Height = 191
      Hint = ''
      DataSource = UniMainModule.dsItems
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
    end
  end
end
