inherited FrmForeGraph: TFrmForeGraph
  ClientWidth = 770
  OldCreateOrder = True
  ExplicitWidth = 786
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlCarrier: TUniPanel
    Width = 770
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ExplicitWidth = 770
    inherited splitForeGraph1: TUniSplitter
      Left = 613
      Top = 40
      Width = 9
      Height = 405
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ExplicitLeft = 614
      ExplicitTop = 39
      ExplicitWidth = 9
      ExplicitHeight = 407
    end
    inherited Chart1: TUniChart
      Top = 40
      Width = 612
      Height = 405
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ExplicitTop = 39
      ExplicitWidth = 614
      ExplicitHeight = 407
    end
    inherited Panel2: TUniPanel
      Left = 622
      Top = 40
      Width = 147
      Height = 405
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ExplicitLeft = 623
      ExplicitTop = 39
      ExplicitWidth = 147
      ExplicitHeight = 407
      inherited Label1: TUniLabel
        Top = 359
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ExplicitTop = 359
      end
      inherited Label2: TUniLabel
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
      end
      inherited Label3: TUniLabel
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
      end
      inherited sbtnUp: TUniSpeedButton
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
      end
      inherited sbtnDwn: TUniSpeedButton
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
      end
      inherited sbtnCheckAllMonths: TUniSpeedButton
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
      end
      inherited sbtnUnCheckAllMonths: TUniSpeedButton
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
      end
      inherited ed3D: TUniEdit
        Top = 378
        Width = 124
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ExplicitTop = 378
        ExplicitWidth = 124
      end
      inherited UpDown1: TUpDown
        Left = 128
        Top = 378
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ExplicitLeft = 128
        ExplicitTop = 378
      end
      inherited lboxLegend: TUniListBox
        Width = 143
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ExplicitWidth = 143
      end
      inherited chkbMonths: TCheckListBox
        Width = 143
        Height = 223
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ExplicitWidth = 143
        ExplicitHeight = 223
      end
    end
    inherited Panel1: TUniPanel
      Width = 768
      Height = 39
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ExplicitWidth = 768
      ExplicitHeight = 39
      object NavMain: TUniDBNavigator [0]
        Left = 615
        Top = 1
        Width = 153
        Height = 37
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ShowHint = True
        ParentShowHint = False
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
      object pnlItemDescrip: TUniPanel [1]
        Left = 66
        Top = 1
        Width = 549
        Height = 37
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          547
          35)
        object Label4: TUniLabel
          Left = 6
          Top = 11
          Width = 33
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Item #'
          TabOrder = 2
        end
        object DBEdit1: TUniDBEdit
          Left = 63
          Top = 7
          Width = 473
          Height = 22
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          DataField = 'ITEMNO'
          DataSource = wwSrcForecast
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          TabStop = False
          Color = clBtnFace
          ExplicitWidth = 475
        end
      end
      inherited Bevel2: TUniPanel
        Top = 36
        Width = 766
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        TabOrder = 4
        ExplicitTop = 37
        ExplicitWidth = 766
      end
      inherited pnlToolBtns: TUniPanel
        Height = 35
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        TabOrder = 2
        ExplicitHeight = 37
        inherited sbtnPrint: TUniSpeedButton
          Height = 35
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ExplicitHeight = 35
        end
        inherited sbtnSaveToFile: TUniSpeedButton
          Height = 35
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ExplicitHeight = 35
        end
        inherited Bevel1: TUniPanel
          Height = 35
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ExplicitHeight = 35
        end
      end
    end
  end
  inherited wwQryOnOrder: TFDQuery
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 193
    Top = 97
  end
  inherited wwQryShipped: TFDQuery
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 241
    Top = 97
  end
  inherited wwSrcForecast: TDataSource
    Left = 153
    Top = 98
  end
  inherited wwQryForecast: TFDQuery
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 153
    Top = 113
  end
end
