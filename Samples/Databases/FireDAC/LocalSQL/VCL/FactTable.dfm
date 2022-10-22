object FactTableForm: TFactTableForm
  Left = 0
  Top = 0
  Caption = 'Sales Fact Table (for OLAP or HyperCube analysis)'
  ClientHeight = 477
  ClientWidth = 718
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
  object pnlSales: TPanel
    Left = 0
    Top = 0
    Width = 718
    Height = 477
    Align = alClient
    TabOrder = 0
    object dbgSales: TDBGrid
      Left = 1
      Top = 28
      Width = 716
      Height = 448
      Align = alClient
      DataSource = DM.dsSales
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object pnlToolBar: TPanel
      Left = 1
      Top = 1
      Width = 716
      Height = 27
      Align = alTop
      TabOrder = 1
      object dbnSales: TDBNavigator
        Left = 475
        Top = 1
        Width = 240
        Height = 25
        DataSource = DM.dsSales
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Align = alRight
        TabOrder = 0
        ExplicitHeight = 24
      end
      object btnShowSQLcode: TButton
        Left = 1
        Top = 1
        Width = 88
        Height = 25
        Align = alLeft
        Caption = 'Show SQL code'
        TabOrder = 1
        OnClick = btnShowSQLcodeClick
      end
    end
  end
end
