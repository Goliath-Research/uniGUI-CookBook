object frmMasterDetail: TfrmMasterDetail
  Left = 0
  Top = 0
  Width = 669
  Height = 483
  TabOrder = 0
  object Splitter1: TSplitter
    Left = 0
    Top = 225
    Width = 669
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object pnlMaster: TPanel
    Left = 0
    Top = 0
    Width = 669
    Height = 225
    Align = alTop
    TabOrder = 0
    object tbMaster: TToolBar
      Left = 1
      Top = 1
      Width = 667
      Height = 29
      TabOrder = 0
      object navMaster: TDBNavigator
        Left = 0
        Top = 0
        Width = 240
        Height = 22
        DataSource = dsMaster
        TabOrder = 0
      end
    end
    object dbgMaster: TDBGrid
      Left = 1
      Top = 30
      Width = 667
      Height = 194
      Align = alClient
      DataSource = dsMaster
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object pnlDetail: TPanel
    Left = 0
    Top = 228
    Width = 669
    Height = 255
    Align = alClient
    TabOrder = 1
    object tbDetail: TToolBar
      Left = 1
      Top = 1
      Width = 667
      Height = 29
      TabOrder = 0
      object navDetail: TDBNavigator
        Left = 0
        Top = 0
        Width = 240
        Height = 22
        DataSource = dsDetail
        TabOrder = 0
      end
    end
    object dbgDetail: TDBGrid
      Left = 1
      Top = 30
      Width = 667
      Height = 224
      Align = alClient
      DataSource = dsDetail
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object dsMaster: TDataSource
    Left = 296
    Top = 80
  end
  object dsDetail: TDataSource
    Left = 296
    Top = 280
  end
end
