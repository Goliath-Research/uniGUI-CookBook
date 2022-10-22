object FrmScanImageDialog: TFrmScanImageDialog
  Left = 299
  Top = 140
  ClientHeight = 446
  ClientWidth = 680
  Caption = 'Scan Document'
  OnShow = FormShow
  Constraints.MaxHeight = 596
  Constraints.MinHeight = 484
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  DesignSize = (
    680
    446)
  PixelsPerInch = 96
  TextHeight = 13
  object ilStatus: TUniStatusBar
    Left = 0
    Top = 426
    Width = 680
    Height = 20
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Panels = <
      item
        Text = ' Progress'
        Width = 180
      end
      item
        Width = 140
      end>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
    object ilProgress: TUniProgressBar
      Left = 95
      Top = 2
      Width = 124
      Height = 23
      Hint = 'Current status of the image handling'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Visible = False
      ShowHint = True
      ParentShowHint = False
      TabOrder = 0
    end
  end
  object GroupBox1: TUniGroupBox
    Left = 10
    Top = 5
    Width = 668
    Height = 100
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = ' General '
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    ExplicitWidth = 594
    DesignSize = (
      668
      100)
    object Label10: TUniLabel
      Left = 8
      Top = 67
      Width = 38
      Height = 13
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Scan As'
      TabOrder = 3
    end
    object Label1: TUniLabel
      Left = 8
      Top = 43
      Width = 58
      Height = 13
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Save To File'
      TabOrder = 4
    end
    object Label2: TUniLabel
      Left = 8
      Top = 19
      Width = 33
      Height = 13
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Library'
      TabOrder = 5
    end
    object cboxScanAs: TUniComboBox
      Left = 104
      Top = 64
      Width = 116
      Height = 21
      Hint = 'Color depth to aquire from the scanner'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      ParentShowHint = False
      Style = csDropDownList
      Text = ''
      Items.Strings = (
        'BW'
        'GRAY'
        'COLOR8'
        'COLOR24')
      TabOrder = 6
    end
    object wwDBComboDlgFileName: TUniEdit
      Left = 104
      Top = 40
      Width = 547
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object wwDBLookupComboLibrary: TUniDBLookupComboBox
      Left = 104
      Top = 16
      Width = 547
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ListOnlyMode = lmFollowSource
      ListField = 'DESCRIP;DESCRIP2;PATH;TYPE'
      ListSource = srcDocLibrary
      KeyField = 'ID'
      ListFieldIndex = 0
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Color = clWindow
    end
  end
  object GroupBox2: TUniGroupBox
    Left = 9
    Top = 113
    Width = 668
    Height = 232
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = ' Scan Source '
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    object Bevel1: TUniPanel
      Left = 40
      Top = 96
      Width = 233
      Height = 5
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 8
      Caption = ''
    end
    object Label3: TUniLabel
      Left = 40
      Top = 80
      Width = 82
      Height = 13
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Track Completion'
      ParentFont = False
      ParentColor = False
      Color = clBtnFace
      TabOrder = 9
    end
    object Bevel2: TUniPanel
      Left = 40
      Top = 176
      Width = 233
      Height = 4
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 10
      Caption = ''
    end
    object Label4: TUniLabel
      Left = 40
      Top = 160
      Width = 52
      Height = 13
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Scan Mode'
      ParentFont = False
      ParentColor = False
      Color = clBtnFace
      TabOrder = 11
    end
    object rbtnSingle: TUniRadioButton
      Left = 16
      Top = 24
      Width = 98
      Height = 21
      Hint = 'Scan single doc off the glass'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      ParentShowHint = False
      Checked = True
      Caption = 'Single Scan'
      TabOrder = 0
      OnClick = ChangeScanSource
    end
    object rbtnMulti: TUniRadioButton
      Left = 16
      Top = 48
      Width = 129
      Height = 21
      Hint = 'Scan multiple pages using ADF (Automatic Doc Feeder)'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      ParentShowHint = False
      Caption = 'Multiple Pages'
      TabOrder = 1
      OnClick = ChangeScanSource
    end
    object edPages: TUniEdit
      Left = 192
      Top = 104
      Width = 73
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Text = '1'
      TabOrder = 2
      OnClick = edPagesEnter
      OnEnter = edPagesEnter
    end
    object chkUsePageCount: TUniCheckBox
      Left = 40
      Top = 104
      Width = 119
      Height = 20
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Checked = True
      Caption = 'Use Page Count'
      TabOrder = 3
      OnClick = ChangeHowToFinishScan
    end
    object chkUseTimeOut: TUniCheckBox
      Left = 40
      Top = 128
      Width = 149
      Height = 20
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Use Time Out (sec)'
      TabOrder = 4
      OnClick = ChangeHowToFinishScan
    end
    object edTimeOut: TUniEdit
      Left = 192
      Top = 128
      Width = 73
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Text = '0'
      TabOrder = 5
      OnClick = edPagesEnter
      OnEnter = edPagesEnter
    end
    object chkScanBothSides: TUniCheckBox
      Left = 40
      Top = 184
      Width = 119
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Scan Both Sides'
      TabOrder = 6
    end
  end
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 389
    Width = 680
    Height = 37
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 3
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 473
      Top = 1
      Width = 206
      Height = 35
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnCancel: TUniButton
        Left = 100
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
      object btnOK: TUniButton
        Left = -1
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'OK'
        TabOrder = 2
        OnClick = btnOKClick
      end
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'TIFF'
    Filter = 'TIFF|*.tiff|All files|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 335
    Top = 143
  end
  object QryDoc_Library: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id               as id,'
      '       descrip          as descrip,'
      '       descrip2        as descrip2,'
      '       path             as path,'
      '       type             as type'
      '  from doc_library'
      ' ')
    Left = 367
    Top = 143
    object QryDoc_LibraryDESCRIP: TStringField
      DisplayLabel = 'Library'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'IQ.DOC_LIBRARY.DESCRIP'
      Size = 60
    end
    object QryDoc_LibraryDESCRIP2: TStringField
      DisplayLabel = 'Library Description'
      DisplayWidth = 45
      FieldName = 'DESCRIP2'
      Origin = 'IQ.DOC_LIBRARY.DESCRIP2'
      Size = 100
    end
    object QryDoc_LibraryPATH: TStringField
      DisplayLabel = 'Path'
      DisplayWidth = 45
      FieldName = 'PATH'
      Origin = 'IQ.DOC_LIBRARY.PATH'
      Size = 150
    end
    object QryDoc_LibraryTYPE: TStringField
      DisplayWidth = 15
      FieldName = 'TYPE'
      Origin = 'IQ.DOC_LIBRARY.TYPE'
      Size = 15
    end
    object QryDoc_LibraryID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.DOC_LIBRARY.ID'
      Visible = False
      Size = 0
    end
  end
  object srcDocLibrary: TDataSource
    DataSet = QryDoc_Library
    Left = 336
    Top = 232
  end
end
