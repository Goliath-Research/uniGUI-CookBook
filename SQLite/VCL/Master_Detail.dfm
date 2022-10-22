object Master_DetailForm: TMaster_DetailForm
  Left = 0
  Top = 0
  Caption = 'Orders / Items -> Simple Master / Detail using FireDAC'
  ClientHeight = 386
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 185
    Width = 505
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitTop = 169
    ExplicitWidth = 217
  end
  object pnlOrders: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 185
    Align = alTop
    TabOrder = 0
    object dbgOrders: TDBGrid
      Left = 1
      Top = 27
      Width = 503
      Height = 157
      Align = alClient
      DataSource = DM.dsOrders
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object pnlMasterGrid: TPanel
      Left = 1
      Top = 1
      Width = 503
      Height = 26
      Align = alTop
      TabOrder = 1
      object dbnOrders: TDBNavigator
        Left = 262
        Top = 1
        Width = 240
        Height = 24
        DataSource = DM.dsOrders
        Align = alRight
        TabOrder = 0
      end
    end
  end
  object pnlItems: TPanel
    Left = 0
    Top = 188
    Width = 505
    Height = 198
    Align = alClient
    TabOrder = 1
    object pnlDetailGrid: TPanel
      Left = 1
      Top = 1
      Width = 503
      Height = 26
      Align = alTop
      TabOrder = 0
      object dbnItems: TDBNavigator
        Left = 262
        Top = 1
        Width = 240
        Height = 24
        DataSource = DM.dsItems
        Align = alRight
        TabOrder = 0
      end
    end
    object dbgItems: TDBGrid
      Left = 1
      Top = 27
      Width = 503
      Height = 170
      Align = alClient
      DataSource = DM.dsItems
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
end
