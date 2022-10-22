object FrmFedExDD: TFrmFedExDD
  Left = 266
  Top = 204
  ClientHeight = 332
  ClientWidth = 587
  Caption = 'FedEx Database'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 185
    Top = 6
    Width = 6
    Height = 326
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object Bevel3: TUniPanel
    Left = 0
    Top = 0
    Width = 587
    Height = 6
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
  end
  object Panel6: TUniPanel
    Left = 0
    Top = 6
    Width = 185
    Height = 326
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel7: TUniPanel
      Left = 1
      Top = 1
      Width = 183
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object Label2: TUniLabel
        Left = 3
        Top = 5
        Width = 46
        Height = 13
        Hint = ''
        Caption = 'Database'
        TabOrder = 1
      end
      object cmbDatabase: TUniComboBox
        Left = 64
        Top = 2
        Width = 119
        Height = 21
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'Shipnet2000'
          'HistoricalDB')
        TabOrder = 2
        OnChange = cmbDatabaseChange
      end
    end
    object Panel1: TUniPanel
      Left = 1
      Top = 27
      Width = 183
      Height = 299
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
      Caption = ''
      object lstObject: TUniListBox
        Left = 1
        Top = 20
        Width = 181
        Height = 279
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        OnClick = lstObjectClick
      end
      object Panel5: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 181
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 1
        Caption = ''
        Color = clBtnShadow
        object Label1: TUniLabel
          Left = 1
          Top = 1
          Width = 43
          Height = 13
          Hint = ''
          Caption = 'Objects'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
    end
  end
  object Panel8: TUniPanel
    Left = 191
    Top = 6
    Width = 396
    Height = 326
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object pcMain: TUniPageControl
      Left = 1
      Top = 1
      Width = 394
      Height = 324
      Hint = ''
      ActivePage = TabSQL
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabData: TUniTabSheet
        Hint = ''
        Caption = 'Data'
        object Panel2: TUniPanel
          Left = 0
          Top = 0
          Width = 386
          Height = 296
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Bevel1: TUniPanel
            Left = 1
            Top = 27
            Width = 384
            Height = 3
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            Caption = ''
          end
          object Panel3: TUniPanel
            Left = 1
            Top = 1
            Width = 384
            Height = 27
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Caption = ''
            object NavMain: TUniDBNavigator
              Left = 259
              Top = 1
              Width = 125
              Height = 25
              Hint = ''
              DataSource = SrcData
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 0
            end
          end
          object Panel4: TUniPanel
            Left = 1
            Top = 30
            Width = 384
            Height = 266
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object Grid: TUniDBGrid
              Left = 1
              Top = 1
              Width = 382
              Height = 264
              Hint = ''
              DataSource = SrcData
              ReadOnly = True
              LoadMask.Message = 'Loading data...'
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
            end
          end
        end
      end
      object TabSQL: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'SQL'
        object Splitter2: TUniSplitter
          Left = 0
          Top = 157
          Width = 386
          Height = 3
          Cursor = crVSplit
          Hint = ''
          Align = alTop
          ParentColor = False
          Color = clBtnFace
        end
        object Panel9: TUniPanel
          Left = 0
          Top = 0
          Width = 386
          Height = 157
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object Bevel2: TUniPanel
            Left = 1
            Top = 27
            Width = 384
            Height = 3
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            Caption = ''
          end
          object Panel11: TUniPanel
            Left = 1
            Top = 1
            Width = 384
            Height = 27
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Caption = ''
            object sbtnRunSQL: TUniSpeedButton
              Left = 1
              Top = 1
              Width = 25
              Height = 25
              Hint = 'Run SQL'
              ShowHint = True
              ParentShowHint = False
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333333333333333333333333333333333333333
                33333333333FF33333333333337173333333333333373F333333333333111333
                3333333333777F33333333333371733333333333333733333333333333333333
                33333333333FF3333333333333313333333333333337FF333333333333717333
                3333333333377F3333333333331113333333333333777F333333333333111333
                3333333333777F3333333333331113333333333333777F333333333333111333
                3333333333777F333333333333717333333333333337F3333333333333333333
                3333333333333333333333333333333333333333333333333333}
              Caption = ''
              ParentColor = False
              Color = clWindow
              OnClick = RunSQL1Click
            end
          end
          object memSQL: TUniMemo
            Left = 1
            Top = 30
            Width = 384
            Height = 127
            Hint = ''
            ScrollBars = ssBoth
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 3
          end
        end
        object Panel10: TUniPanel
          Left = 0
          Top = 160
          Width = 386
          Height = 136
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object GridSQL: TUniDBGrid
            Left = 1
            Top = 1
            Width = 384
            Height = 134
            Hint = ''
            DataSource = SrcSQL
            ReadOnly = True
            LoadMask.Message = 'Loading data...'
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
      end
    end
  end
  object SrcData: TDataSource
    DataSet = TblData
    Left = 424
    Top = 24
  end
  object TblData: TFDTable
    Connection = DB
    UpdateOptions.UpdateTableName = 'DomPackageRateInfo'
    TableName = 'DomPackageRateInfo'
    Left = 456
    Top = 24
  end
  object QrySQL: TFDQuery
    Connection = DB
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 272
    Top = 64
  end
  object SrcSQL: TDataSource
    DataSet = QrySQL
    Left = 272
    Top = 120
  end
  object PopupMenu1: TUniPopupMenu
    Left = 368
    Top = 104
    object RunSQL1: TUniMenuItem
      Caption = 'Run SQL'
      ShortCut = 120
      OnClick = RunSQL1Click
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 432
    Top = 96
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
  end
  object DB: TFDConnection
    Left = 288
    Top = 184
  end
end
