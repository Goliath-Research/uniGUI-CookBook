object IQWebExtDoc: TIQWebExtDoc
  Left = 0
  Top = 0
  Width = 553
  Height = 408
  TabOrder = 0
  object pnlTop: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 553
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object PnlToolbarStandardBtns: TUniPanel
      Left = 1
      Top = 1
      Width = 152
      Height = 25
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
      Caption = ''
      object SearchBtn: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 25
        Height = 23
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Caption = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentColor = False
        Color = clWindow
        TabOrder = 1
        OnClick = SearchClick
      end
      object FilterBtn: TUniSpeedButton
        Left = 26
        Top = 1
        Width = 25
        Height = 23
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Caption = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentColor = False
        Color = clWindow
        TabOrder = 2
        OnClick = FilterClick
      end
      object FilterClearBtn: TUniSpeedButton
        Left = 51
        Top = 1
        Width = 25
        Height = 23
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Caption = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentColor = False
        Color = clWindow
        TabOrder = 3
        OnClick = FilterClearClick
      end
      object LaunchDocumentControl: TUniSpeedButton
        Left = 76
        Top = 1
        Width = 25
        Height = 23
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Caption = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentColor = False
        Color = clWindow
        TabOrder = 4
        OnClick = LaunchDocumentControlClick
      end
      object PrintDocument: TUniSpeedButton
        Left = 101
        Top = 1
        Width = 25
        Height = 23
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Caption = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentColor = False
        Color = clWindow
        TabOrder = 5
        OnClick = ExecuteOLEPrint
      end
      object BtnScanDocument: TUniSpeedButton
        Left = 126
        Top = 1
        Width = 25
        Height = 23
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Caption = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentColor = False
        Color = clWindow
        TabOrder = 6
        OnClick = ScanDocument
      end
    end
    object ExtDocNav: TUniDBNavigator
      Left = 327
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = FSrcExtDocs
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 2
    end
    object pnlShape: TUniPanel
      Left = 253
      Top = 1
      Width = 74
      Height = 25
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 3
      Caption = ''
      object FShape2: TUniPanel
        Left = 1
        Top = 1
        Width = 10
        Height = 23
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
        Caption = ''
        Color = clYellow
      end
      object FShape3: TUniPanel
        Left = 11
        Top = 1
        Width = 10
        Height = 23
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 2
        Caption = ''
        Color = clAqua
      end
      object FShape4: TUniPanel
        Left = 21
        Top = 1
        Width = 10
        Height = 23
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 3
        Caption = ''
        Color = clGreen
      end
      object FShape5: TUniPanel
        Left = 31
        Top = 1
        Width = 10
        Height = 23
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 4
        Caption = ''
        Color = clOlive
      end
      object FShape6: TUniPanel
        Left = 41
        Top = 1
        Width = 10
        Height = 23
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 5
        Caption = ''
        Color = clRed
      end
      object FShape7: TUniPanel
        Left = 51
        Top = 1
        Width = 10
        Height = 23
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 6
        Caption = ''
        Color = clSilver
      end
    end
    object pnlFill: TUniPanel
      Left = 153
      Top = 1
      Width = 100
      Height = 25
      Hint = ''
      Constraints.MinWidth = 100
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 4
      Caption = ''
    end
  end
  object ExtDocsGrid: TUniDBGrid
    Left = 0
    Top = 27
    Width = 553
    Height = 362
    Hint = ''
    DataSource = FSrcExtDocs
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgMultiSelect, dgTitleClick, dgTabs, dgCancelOnExit]
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    OnMouseDown = ExtDocsGridMouseDown
    OnDblClick = DoubleClick
    OnTitleClick = DoOnTitleClick
    OnDrawColumnCell = GridDrawColumnCell
  end
  object FStatusBar1: TUniStatusBar
    Left = 0
    Top = 389
    Width = 553
    Height = 19
    Hint = ''
    Panels = <
      item
        Width = 553
      end>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
    ExplicitTop = 141
  end
  object FQryExtDocs: TFDQuery
    Left = 168
    Top = 80
  end
  object FSrcExtDocs: TDataSource
    DataSet = FQryExtDocs
    OnDataChange = DataChangeExtDocs
    Left = 104
    Top = 88
  end
  object ExtPopUpMenu: TUniPopupMenu
    OnPopup = ExecOnPopupMenu
    Left = 368
    Top = 64
    object Execute1: TUniMenuItem
      Caption = ''
      OnClick = DoubleClick
    end
    object Print1: TUniMenuItem
      Caption = ''
      OnClick = ExecuteOLEPrint
    end
    object ShowReleases1: TUniMenuItem
      Caption = ''
      OnClick = ShowReleasesClick
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object pfilter: TUniMenuItem
      Caption = ''
      OnClick = FilterClick
    end
    object AssignPrintWithToSelectedRecsClick1: TUniMenuItem
      Caption = ''
      OnClick = AssignPrintWithToSelectedRecordsClick
    end
  end
end
