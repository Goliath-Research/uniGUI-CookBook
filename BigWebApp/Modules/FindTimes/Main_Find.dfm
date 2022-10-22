object FrmFindTimes: TFrmFindTimes
  Left = 134
  Top = 146
  ClientHeight = 524
  ClientWidth = 1072
  Caption = 'Find Times'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 1072
    Height = 113
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Label1: TUniLabel
      Left = 136
      Top = 26
      Width = 99
      Height = 13
      Hint = ''
      Caption = 'Minimum time include'
      TabOrder = 1
    end
    object Label2: TUniLabel
      Left = 136
      Top = 75
      Width = 65
      Height = 13
      Hint = ''
      Caption = 'Lookup String'
      TabOrder = 4
    end
    object BtnLoad: TUniButton
      Left = 18
      Top = 20
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'Load File'
      TabOrder = 5
      OnClick = BtnLoadClick
    end
    object BtnProcess: TUniButton
      Left = 18
      Top = 69
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'Process File'
      TabOrder = 6
      OnClick = BtnProcessClick
    end
    object EdMin: TUniEdit
      Left = 246
      Top = 22
      Width = 121
      Height = 21
      Hint = ''
      Text = '0'
      TabOrder = 2
    end
    object EditStr: TUniEdit
      Left = 246
      Top = 71
      Width = 121
      Height = 21
      Hint = ''
      Text = '-- OK.  ['
      TabOrder = 3
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 113
    Width = 1072
    Height = 411
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 337
      Top = 0
      Width = 6
      Height = 411
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 337
      Height = 409
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Panel5: TUniPanel
        Left = 1
        Top = 1
        Width = 335
        Height = 25
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = 'Times (sec)'
      end
      object ListView: TUniStringGrid
        Left = 1
        Top = 25
        Width = 335
        Height = 384
        Hint = ''
        FixedCols = 0
        FixedRows = 0
        RowCount = 1
        ColCount = 2
        Options = [goVertLine, goHorzLine]
        Columns = <
          item
            Title.Caption = 'Key'
            Width = 200
          end
          item
            Title.Caption = 'Time (in seconds)'
            Width = 100
          end>
        OnMouseDown = ListViewMouseDown
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 2
      end
    end
    object Panel6: TUniPanel
      Left = 343
      Top = 1
      Width = 729
      Height = 409
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Panel7: TUniPanel
        Left = 1
        Top = 1
        Width = 727
        Height = 25
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = 'File'
      end
      object RichEdit1: TUniHTMLMemo
        Left = 1
        Top = 25
        Width = 727
        Height = 384
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clWindow
        TabOrder = 2
      end
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 96
    Top = 209
    object FindinFile1: TUniMenuItem
      Caption = 'Find in File'
      OnClick = FindinFile1Click
    end
  end
  object UniFileUpload1: TUniFileUpload
    OnCompleted = UniFileUpload1Completed
    Title = 'Upload'
    Messages.Uploading = 'Uploading...'
    Messages.PleaseWait = 'Please Wait'
    Messages.Cancel = 'Cancel'
    Messages.Processing = 'Processing...'
    Messages.UploadError = 'Upload Error'
    Messages.Upload = 'Upload'
    Messages.NoFileError = 'Please Select a File'
    Messages.BrowseText = 'Browse...'
    Left = 232
    Top = 240
  end
end
