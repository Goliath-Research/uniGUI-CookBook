object FrmCRMWordSQLPreview: TFrmCRMWordSQLPreview
  Left = 200
  Top = 194
  ClientHeight = 291
  ClientWidth = 399
  Caption = 'Preview Resultset'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 399
    Height = 291
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel1: TUniPanel
      Left = 0
      Top = 27
      Width = 399
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Caption = ''
      ExplicitWidth = 407
    end
    object PnlToolbar: TUniPanel
      Left = 0
      Top = 0
      Width = 399
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object sbtnCount: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Count Records'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000130B0000130B00000001000000000000000000005555
          550022963B0023953D0023963D0016A72E0016A62F0016A72F0014B72E0012B9
          2D0018C3350018C2360019C236002E9A47002F9B4800309B4900329D4B00379D
          4F0038A2510041A859005EA96F0023CB440022CE44002FD455002FD456002FD9
          56003DDE67003DDE68003EE26A004BE478004BE578004DE97A00FF00FF0078B2
          860068D9880068D9890059EA850059EA86005CEF89006BEE92006BEE93007FE3
          9B006FF3980086B6910089B7940090B99A009FBDA600B4B4B40095EBAD0095EC
          AC0082F5A50082F6A50083F6A5009FEAB30095F7B200A6F8BE00CBCCCB000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000002020202C0F2C
          2020202020202020202020202B1335132B202020000000000000202D12303731
          122D20200100000101012E102936363629102E202001000020200E2233333432
          32230E382020010000202E140D282A270D142E20202020000001202011242625
          112020200000000000002020111E1F1D11202020202F000001202020111A1C1B
          1120202020202020202020201117191811202020202000000020202011151615
          112020202020000001202020110B0A0C11202020202000000120202011080908
          1120202020200000012020201106050711202020000000000120202011040203
          11202020010000000120202021110D1121202020202F01000120}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnCountClick
      end
      object NavMain: TUniDBNavigator
        Left = 298
        Top = 1
        Width = 100
        Height = 25
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object Panel2: TUniPanel
      Left = 0
      Top = 30
      Width = 399
      Height = 261
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Grid: TIQUniGridControl
        Left = 0
        Top = 0
        Width = 399
        Height = 261
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 434
        IQComponents.Grid.Height = 434
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.LoadMask.Message = 'Loading data...'
        IQComponents.Grid.Align = alClient
        IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
        IQComponents.Grid.TabOrder = 0
        IQComponents.Navigator.Left = 410
        IQComponents.Navigator.Top = 0
        IQComponents.Navigator.Width = 241
        IQComponents.Navigator.Height = 25
        IQComponents.Navigator.Hint = ''
        IQComponents.Navigator.ShowHint = True
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 434
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 434
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        IQComponents.FormTab.ExplicitLeft = 0
        IQComponents.FormTab.ExplicitTop = 0
        IQComponents.FormTab.ExplicitWidth = 256
        IQComponents.FormTab.ExplicitHeight = 128
        Marker = 0
      end
    end
  end
end
