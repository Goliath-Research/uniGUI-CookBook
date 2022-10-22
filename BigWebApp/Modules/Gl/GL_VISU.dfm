object FrmGLVisual: TFrmGLVisual
  Left = 104
  Top = 94
  ClientHeight = 307
  ClientWidth = 446
  Caption = 'Visual G/L'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 225
    Top = 27
    Width = 7
    Height = 261
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 27
    Width = 225
    Height = 261
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    Caption = ''
    object TreeView1: TUniTreeView
      Left = 1
      Top = 1
      Width = 223
      Height = 259
      Hint = ''
      Items.FontData = {0100000000}
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Color = clWindow
      OnChange = TreeView1Change
      OnMouseDown = TreeView1MouseDown
    end
  end
  object Panel3: TUniPanel
    Left = 232
    Top = 27
    Width = 214
    Height = 261
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = 'Panel3'
    object Edit1: TUniEdit
      Left = 6
      Top = 8
      Width = 161
      Height = 21
      Hint = ''
      Text = 'Edit1'
      TabOrder = 0
    end
    object ListBox1: TUniListBox
      Left = 1
      Top = 54
      Width = 212
      Height = 206
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 1
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 446
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
    object sbtnOpenDoc: TUniSpeedButton
      Left = 2
      Top = 1
      Width = 25
      Height = 25
      Hint = ''
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333330000003333333333333333330000003333333333333333330000003800
        000000000003330000003007B7B7B7B7B7B03300000030F07B7B7B7B7B703300
        000030B0B7B7B7B7B7B70300000030FB0B7B7B7B7B7B0300000030BF07B7B7B7
        B7B7B000000030FBF000007B7B7B7000000030BFBFBFBF0000000300000030FB
        FBFBFBFBFB033300000030BFBFBFBFBFBF033300000030FBFBF0000000333300
        0000330000033333333333000000333333333333333333000000333333333333
        333333000000333333333333333333000000}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnOpenDocClick
    end
    object sbtnSave: TUniSpeedButton
      Left = 27
      Top = 1
      Width = 25
      Height = 25
      Hint = ''
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777770080000000800770330888887703077033088888770307703308888877
        0307703300000000030770333333333333077030000000003307703077777777
        0307703077777777030770307777777703077030777777770307703077777777
        0007703077777777070770000000000000077777777777777777}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnSaveClick
    end
    object sbtnNewFile: TUniSpeedButton
      Left = 52
      Top = 1
      Width = 25
      Height = 25
      Hint = ''
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF88888888
        88FFFF000000000008FFFF0FFFFFFFFF08FFFF0FFFFFFFFF08FFFF0FFFFFFFFF
        08FFFF0FFFFFFFFF08FFFF0FFFFFFFFF08FFFF0FFFFFFFFF08FFFF0FFFFFFFFF
        08FFFF0FFFFFF7770FFFFF0FFFFF00000FFFFF0FFFFF0FF0FFFFFF0FFFFF0F0F
        FFFFFF0FFFFF00FFFFFFFF0000000FFFFFFFFFFFFFFFFFFFFFFF}
      Caption = ''
      ParentColor = False
      Color = clWindow
    end
    object sbtnPromote: TUniSpeedButton
      Left = 85
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Promote'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFFFFFFFFFFFFF08FFFFF
        FFFFFFFF008888888888FFF0000000000008FF00000000000008F00000000000
        0008FF0000000000000FFFF000000000000FFFFF00FFFFFFFFFFFFFFF0FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnPromoteClick
    end
    object sbtnDemote: TUniSpeedButton
      Left = 109
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Demote'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFFFFFFFFFFFFFF80F
        FFFF888888888800FFFF8000000000000FFF80000000000000FF800000000000
        000FF0000000000000FFF000000000000FFFFFFFFFFFFF00FFFFFFFFFFFFFF0F
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = ''
      ParentColor = False
      Color = clWindow
    end
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 288
    Width = 446
    Height = 19
    Hint = ''
    Panels = <
      item
        Text = 'Level:'
        Width = 64
      end
      item
        Text = 'Index:'
        Width = 64
      end
      item
        Text = 'AbsIndex:'
        Width = 80
      end
      item
        Text = 'ItemID:'
        Width = 190
      end>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object PopupMenu1: TUniPopupMenu
    Left = 344
    object AddtoBottom1: TUniMenuItem
      Caption = 'Add to Bottom'
      OnClick = AddtoBottom1Click
    end
    object AddFirst1: TUniMenuItem
      Caption = 'Add First'
      OnClick = AddFirst1Click
    end
    object AddChild1: TUniMenuItem
      Caption = 'Add Child'
      OnClick = AddChild1Click
    end
    object AddChildFirst1: TUniMenuItem
      Caption = 'Add Child First'
      OnClick = AddChildFirst1Click
    end
    object Insert1: TUniMenuItem
      Caption = 'Insert'
      OnClick = Insert1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object RemoveNode1: TUniMenuItem
      Caption = 'Remove Node'
      OnClick = RemoveNode1Click
    end
    object Clear1: TUniMenuItem
      Caption = 'Clear'
      OnClick = Clear1Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object Expand1: TUniMenuItem
      Caption = 'Expand'
      OnClick = Expand1Click
    end
    object ExpandAll1: TUniMenuItem
      Caption = 'Expand All'
      OnClick = ExpandAll1Click
    end
    object Shrink1: TUniMenuItem
      Caption = 'Collapse'
      OnClick = Shrink1Click
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 304
    object File1: TUniMenuItem
      Caption = '&File'
      object New1: TUniMenuItem
        Caption = '&New'
      end
      object Open1: TUniMenuItem
        Caption = '&Open...'
        OnClick = Open1Click
      end
      object Save1: TUniMenuItem
        Caption = '&Save'
        OnClick = Save1Click
      end
      object SaveAs1: TUniMenuItem
        Caption = 'Save &As...'
        OnClick = SaveAs1Click
      end
      object N3: TUniMenuItem
        Caption = '-'
      end
      object LoadDefault1: TUniMenuItem
        Caption = 'Load Default'
        OnClick = LoadDefault1Click
      end
      object N4: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = 'Options'
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 408
  end
  object UniFileUpload1: TUniFileUpload
    Title = 'Upload'
    Messages.Uploading = 'Uploading...'
    Messages.PleaseWait = 'Please Wait'
    Messages.Cancel = 'Cancel'
    Messages.Processing = 'Processing...'
    Messages.UploadError = 'Upload Error'
    Messages.Upload = 'Upload'
    Messages.NoFileError = 'Please Select a File'
    Messages.BrowseText = 'Browse...'
    Left = 72
    Top = 107
  end
end
