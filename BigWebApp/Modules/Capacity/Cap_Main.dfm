object UniCap_Main: TUniCap_Main
  Left = 0
  Top = 0
  Width = 1108
  Height = 750
  OnCreate = UniFrameCreate
  OnDestroy = UniFrameDestroy
  Layout = 'border'
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  object pnlLeft: TUniPanel
    Left = 0
    Top = 0
    Width = 331
    Height = 750
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    Caption = ''
    Collapsible = True
    Layout = 'border'
    LayoutConfig.Split = True
    LayoutConfig.Region = 'west'
    object grdWorkCenterType: TUniDBGrid
      Left = 1
      Top = 29
      Width = 329
      Height = 721
      Hint = ''
      DataSource = Cap_Main_DM.SrcWorkCenterType
      LoadMask.Message = 'Loading data...'
      LayoutConfig.Region = 'center'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
    end
    object UniToolBar1: TUniToolBar
      Left = 1
      Top = 1
      Width = 329
      Height = 29
      Hint = ''
      LayoutConfig.Region = 'north'
      Anchors = [akLeft, akTop, akRight]
      Align = alTop
      TabOrder = 2
      ParentColor = False
      Color = clBtnFace
      object UniDBNavigator1: TUniDBNavigator
        Left = 88
        Top = 0
        Width = 241
        Height = 29
        Hint = ''
        DataSource = Cap_Main_DM.SrcWorkCenterType
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 1
      end
    end
  end
  object pnlRight: TUniPanel
    Left = 331
    Top = 0
    Width = 777
    Height = 750
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    Layout = 'border'
    LayoutConfig.Region = 'center'
    object pnlTop: TUniPanel
      Left = 1
      Top = 1
      Width = 775
      Height = 240
      Hint = ''
      CreateOrder = 1
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      Layout = 'border'
      LayoutConfig.Split = True
      LayoutConfig.Region = 'north'
      object grdV_Hrs_Week_Tot: TUniDBGrid
        Left = 1
        Top = 29
        Width = 773
        Height = 211
        Hint = ''
        DataSource = Cap_Main_DM.SrcV_Hrs_Week_Tot
        LoadMask.Message = 'Loading data...'
        LayoutConfig.Region = 'center'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
      end
      object UniToolBar2: TUniToolBar
        Left = 1
        Top = 1
        Width = 773
        Height = 29
        Hint = ''
        LayoutConfig.Region = 'north'
        Anchors = [akLeft, akTop, akRight]
        Align = alTop
        TabOrder = 2
        ParentColor = False
        Color = clBtnFace
        object UniDBNavigator2: TUniDBNavigator
          Left = 532
          Top = 0
          Width = 241
          Height = 29
          Hint = ''
          DataSource = Cap_Main_DM.SrcV_Hrs_Week_Tot
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 1
        end
      end
    end
    object pnlCenter: TUniPanel
      Left = 1
      Top = 240
      Width = 775
      Height = 240
      Hint = ''
      CreateOrder = 2
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
      Layout = 'border'
      LayoutConfig.Split = True
      LayoutConfig.Region = 'north'
      object grdV_Hrs_Day_Tot: TUniDBGrid
        Left = 1
        Top = 29
        Width = 773
        Height = 211
        Hint = ''
        DataSource = Cap_Main_DM.SrcV_Hrs_Day_Tot
        LoadMask.Message = 'Loading data...'
        LayoutConfig.Region = 'center'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
      end
      object UniToolBar3: TUniToolBar
        Left = 1
        Top = 1
        Width = 773
        Height = 29
        Hint = ''
        LayoutConfig.Region = 'north'
        Anchors = [akLeft, akTop, akRight]
        Align = alTop
        TabOrder = 2
        ParentColor = False
        Color = clBtnFace
        object UniDBNavigator3: TUniDBNavigator
          Left = 532
          Top = 0
          Width = 241
          Height = 29
          Hint = ''
          DataSource = Cap_Main_DM.SrcV_Hrs_Day_Tot
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 1
        end
      end
    end
    object pnlBottom: TUniPanel
      Left = 1
      Top = 480
      Width = 775
      Height = 270
      Hint = ''
      CreateOrder = 3
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 3
      Caption = ''
      Layout = 'border'
      LayoutConfig.Split = True
      LayoutConfig.Region = 'center'
      ExplicitLeft = -623
      ExplicitTop = 120
      object grdV_Hrs_Day: TUniDBGrid
        Left = 1
        Top = 29
        Width = 773
        Height = 241
        Hint = ''
        DataSource = Cap_Main_DM.SrcV_Hrs_Day
        LoadMask.Message = 'Loading data...'
        LayoutConfig.Region = 'center'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
      end
      object UniToolBar4: TUniToolBar
        Left = 1
        Top = 1
        Width = 773
        Height = 29
        Hint = ''
        LayoutConfig.Region = 'north'
        Anchors = [akLeft, akTop, akRight]
        Align = alTop
        TabOrder = 2
        ParentColor = False
        Color = clBtnFace
        object UniDBNavigator4: TUniDBNavigator
          Left = 532
          Top = 0
          Width = 241
          Height = 29
          Hint = ''
          DataSource = Cap_Main_DM.SrcV_Hrs_Day
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 1
        end
      end
    end
  end
end
