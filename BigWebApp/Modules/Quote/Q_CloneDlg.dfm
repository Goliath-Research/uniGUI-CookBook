object FrmQ_CloneDlg: TFrmQ_CloneDlg
  Left = 250
  Top = 193
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  ClientHeight = 205
  ClientWidth = 387
  Caption = 'Clone RFQ'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 164
    Width = 387
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 167
      Top = 1
      Width = 219
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnCancel: TUniButton
        Left = 112
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 1
      end
      object btnOK: TUniButton
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 2
        OnClick = btnOKClick
      end
    end
  end
  object PnlClient01: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 387
    Height = 164
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 122
      Top = 1
      Width = 6
      Height = 162
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 121
      Height = 162
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 8
        Top = 16
        Width = 85
        Height = 13
        Hint = ''
        Caption = 'Enter New RFQ #'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 8
        Top = 40
        Width = 93
        Height = 13
        Hint = ''
        Caption = 'Enter New Revision'
        TabOrder = 2
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 128
      Top = 1
      Width = 258
      Height = 162
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        258
        162)
      object edRFQ: TUniEdit
        Left = 0
        Top = 8
        Width = 241
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object edRev: TUniEdit
        Left = 0
        Top = 32
        Width = 241
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object chkIncludeUDForm: TUniCheckBox
        Left = 0
        Top = 56
        Width = 250
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Include User-Defined Form Information'
        TabOrder = 2
      end
      object chkIncludeInternalDocs: TUniCheckBox
        Left = 0
        Top = 72
        Width = 250
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Include Internal Documents'
        TabOrder = 3
      end
      object chkIncludeExternalDocs: TUniCheckBox
        Left = 0
        Top = 88
        Width = 250
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Include External Documents'
        TabOrder = 4
      end
      object chkIncludeNotes: TUniCheckBox
        Left = 0
        Top = 104
        Width = 250
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Include Notes'
        TabOrder = 5
      end
      object chkIncludeAdditionalNotes: TUniCheckBox
        Left = 0
        Top = 120
        Width = 250
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Include Additional Notes'
        TabOrder = 6
      end
    end
  end
end
