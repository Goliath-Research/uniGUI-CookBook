object FrmLbsK_Dlg: TFrmLbsK_Dlg
  Left = 405
  Top = 199
  ClientHeight = 161
  ClientWidth = 376
  Caption = 'Percentage of Runner and Sprue'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 142
    Width = 376
    Height = 19
    Hint = ''
    Panels = <>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 101
    Width = 376
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 166
      Top = 1
      Width = 210
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object PnlMain: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 376
    Height = 101
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 145
      Top = 0
      Width = 6
      Height = 101
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 145
      Height = 99
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 9
        Top = 20
        Width = 89
        Height = 13
        Hint = ''
        Caption = 'Enter new percent'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 9
        Top = 44
        Width = 80
        Height = 13
        Hint = ''
        Caption = 'Recalculate BOM'
        TabOrder = 2
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 151
      Top = 1
      Width = 225
      Height = 99
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Edit1: TUniEdit
        Left = 1
        Top = 16
        Width = 133
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 0
      end
      object chkRecalcBOM: TUniCheckBox
        Left = 1
        Top = 42
        Width = 17
        Height = 17
        Hint = 'Recalculate all INJECTION like BOMs'
        ShowHint = True
        ParentShowHint = False
        Caption = ''
        TabOrder = 1
      end
    end
  end
  object AppDef1: TIQWebAppDef
    AppCode = 'BOM'
    Left = 176
    Top = 40
  end
end
