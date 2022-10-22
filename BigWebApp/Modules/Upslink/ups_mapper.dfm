object FrmUPSFieldMap: TFrmUPSFieldMap
  Left = 399
  Top = 263
  ClientHeight = 258
  ClientWidth = 428
  Caption = 'Field Map'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Left = 0
    Top = 217
    Width = 428
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Left = 211
      Top = 1
      Width = 217
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
        Default = True
      end
      object btnCancel: TUniBitBtn
        Left = 112
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 428
    Height = 217
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlGrid: TUniPanel
      Left = 1
      Top = 58
      Width = 426
      Height = 159
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Grid: TUniStringGrid
        Left = 1
        Top = 1
        Width = 424
        Height = 157
        Hint = ''
        ColCount = 2
        DefaultColWidth = 120
        DefaultRowHeight = 18
        Options = [goVertLine, goHorzLine]
        Columns = <>
        OnSelectCell = GridSelectCell
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
      end
      object cmbFieldList: TUniComboBox
        Left = 280
        Top = 48
        Width = 145
        Height = 21
        Hint = ''
        Visible = False
        Style = csDropDownList
        Text = ''
        TabOrder = 2
        OnCloseUp = cmbFieldListCloseUp
        OnKeyDown = cmbFieldListKeyDown
        OnClick = cmbFieldListClick
      end
    end
    object Panel1: TUniPanel
      Left = 1
      Top = 1
      Width = 426
      Height = 58
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object Label1: TUniLabel
        Left = 24
        Top = 12
        Width = 40
        Height = 13
        Hint = ''
        Caption = 'Data file'
        TabOrder = 3
      end
      object SpeedButton1: TUniSpeedButton
        Left = 392
        Top = 8
        Width = 23
        Height = 22
        Hint = ''
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = SpeedButton1Click
      end
      object Label2: TUniLabel
        Left = 24
        Top = 40
        Width = 56
        Height = 13
        Hint = ''
        Caption = 'Table Name'
        TabOrder = 5
      end
      object edtDataFile: TUniEdit
        Left = 152
        Top = 8
        Width = 225
        Height = 21
        Hint = ''
        Text = '<No file selected>'
        ParentFont = False
        Font.Color = clGray
        TabOrder = 0
        OnExit = edtDataFileExit
        OnEnter = edtDataFileEnter
      end
      object edtTableName: TUniEdit
        Left = 152
        Top = 32
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 1
      end
    end
  end
  object Table1: TFDTable
    Left = 240
    Top = 122
  end
end
