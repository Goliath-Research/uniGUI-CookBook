object FrmQCDocFileOpenDialogMulti: TFrmQCDocFileOpenDialogMulti
  Left = 148
  Top = 197
  ClientHeight = 256
  ClientWidth = 520
  Caption = 'Assign Multiple Files'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 520
    Height = 69
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      520
      69)
    object Shape4: TUniPanel
      Left = 200
      Top = 15
      Width = 12
      Height = 13
      Hint = 'File does not exist'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      ParentShowHint = False
      Anchors = [akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object Label13: TUniLabel
      Left = 6
      Top = 12
      Width = 58
      Height = 13
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Library Path'
      TabOrder = 3
    end
    object Panel2: TUniPanel
      Left = 1
      Top = 39
      Width = 518
      Height = 30
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      DesignSize = (
        518
        30)
      object edLibPath: TUniEdit
        Left = 4
        Top = 2
        Width = 510
        Height = 19
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
    end
  end
  object wwDBGridFiles: TIQUniGridControl
    Left = 0
    Top = 69
    Width = 520
    Height = 136
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 303
    IQComponents.Grid.Height = 50
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcFiles
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
    IQComponents.Navigator.DataSource = SrcFiles
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 303
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 50
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcFiles
    Columns = <
      item
        FieldName = 'SRC_FILENAME'
        Title.Caption = 'Source File Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TRG_FILENAME'
        Title.Caption = 'Target File Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'USE_METHOD'
        Title.Caption = 'Use Method'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REVISION'
        Title.Caption = 'Revision'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object wwDBComboBoxMethod: TUniDBComboBox
    Left = 203
    Top = 176
    Width = 149
    Height = 21
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Style = csDropDownList
    Items.Strings = (
      'Direct'#9'D'
      'Copy'#9'C'
      'Move'#9'M')
    TabOrder = 2
    OnDropDown = wwDBComboBoxMethodDropDown
  end
  object wwDBComboDlgSrcFileName: TUniEdit
    Left = 204
    Top = 209
    Width = 147
    Height = 21
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Text = ''
    TabOrder = 3
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 205
    Width = 520
    Height = 51
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 4
    Caption = ''
    DesignSize = (
      520
      51)
    object btnOK: TUniButton
      Left = 388
      Top = 10
      Width = 119
      Height = 31
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'OK'
      Anchors = [akTop, akRight]
      TabOrder = 1
      OnClick = btnOKClick
    end
    object btnCancel: TUniButton
      Left = 519
      Top = 10
      Width = 120
      Height = 31
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Cancel'
      Cancel = True
      ModalResult = 2
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
  end
  object SrcFiles: TDataSource
    DataSet = QryFiles
    Left = 43
    Top = 138
  end
  object QryFiles: TFDQuery
    BeforePost = QryFilesBeforePost
    OnNewRecord = QryFilesNewRecord
    CachedUpdates = True
    OnUpdateRecord = QryFilesUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select '
      
        '       '#39'12345678901234567890123456789012345678901234567890123456' +
        '78901234567890123456789012345678901234567890'#39' ||'
      
        '       '#39'12345678901234567890123456789012345678901234567890123456' +
        '78901234567890123456789012345678901234567890'#39' as Src_FileName,'
      ''
      
        '       '#39'12345678901234567890123456789012345678901234567890123456' +
        '78901234567890123456789012345678901234567890'#39' ||'
      
        '       '#39'12345678901234567890123456789012345678901234567890123456' +
        '78901234567890123456789012345678901234567890'#39' as Trg_FileName,'
      '       '
      '       '#39'C'#39' as Use_Method,'
      ''
      '       '#39'0.9                 '#39' as Revision'
      '  from dual       '
      '')
    Left = 43
    Top = 151
    object QryFilesSRC_FILENAME: TStringField
      DisplayLabel = 'Source File Name'
      DisplayWidth = 34
      FieldName = 'SRC_FILENAME'
      Required = True
      FixedChar = True
      Size = 200
    end
    object QryFilesTRG_FILENAME: TStringField
      DisplayLabel = 'Target File Name'
      DisplayWidth = 34
      FieldName = 'TRG_FILENAME'
      Required = True
      FixedChar = True
      Size = 200
    end
    object QryFilesUSE_METHOD: TStringField
      DisplayLabel = 'Use Method'
      DisplayWidth = 12
      FieldName = 'USE_METHOD'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QryFilesREVISION: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 3
      FieldName = 'REVISION'
      Required = True
      FixedChar = True
    end
  end
  object OpenDialog1: TOpenDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofFileMustExist, ofEnableSizing]
    Left = 82
    Top = 151
  end
  object PopupMenu1: TUniPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 342
    Top = 136
    object AssignUseMethodToCopy1: TUniMenuItem
      Caption = 'Set All To '#39'Copy'#39
      OnClick = AssignUseMethod
    end
    object AssignUseMethodToMove1: TUniMenuItem
      Caption = 'Set All To '#39'Move'#39
      OnClick = AssignUseMethod
    end
    object AssignUseMethodToDirect1: TUniMenuItem
      Caption = 'Set All To '#39'Direct'#39
      OnClick = AssignUseMethod
    end
  end
end
