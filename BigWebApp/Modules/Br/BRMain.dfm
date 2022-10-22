object FfrmBR_Main: TFfrmBR_Main
  Left = 189
  Top = 109
  ClientHeight = 73
  ClientWidth = 453
  Caption = 'Bank Reconciliation'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  DesignSize = (
    453
    73)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 8
    Top = 7
    Width = 139
    Height = 13
    Hint = ''
    Caption = 'Bank Reconciliation Input File'
    TabOrder = 0
  end
  object Label2: TUniLabel
    Left = 8
    Top = 32
    Width = 71
    Height = 13
    Hint = ''
    Caption = 'Exceptions File'
    TabOrder = 1
  end
  object sbFind: TUniSpeedButton
    Left = 417
    Top = 2
    Width = 22
    Height = 22
    Hint = 'Find Bank Reconciliation Input File'
    ShowHint = True
    ParentShowHint = False
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
      300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
      330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
      333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
      339977FF777777773377000BFB03333333337773FF733333333F333000333333
      3300333777333333337733333333333333003333333333333377333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    Caption = ''
    Anchors = [akTop, akRight]
    ParentColor = False
    Color = clWindow
    OnClick = sbFindClick
  end
  object sbExc: TUniSpeedButton
    Left = 417
    Top = 28
    Width = 22
    Height = 22
    Hint = 'Set Exceptions File'
    ShowHint = True
    ParentShowHint = False
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
      300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
      330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
      333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
      339977FF777777773377000BFB03333333337773FF733333333F333000333333
      3300333777333333337733333333333333003333333333333377333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    Caption = ''
    Anchors = [akTop, akRight]
    ParentColor = False
    Color = clWindow
    OnClick = sbExcClick
  end
  object Label3: TUniLabel
    Left = 11
    Top = 5
    Width = 31
    Height = 13
    Hint = ''
    Caption = 'Label3'
    Anchors = [akLeft, akBottom]
    TabOrder = 6
  end
  object btnProc: TUniButton
    Left = 243
    Top = -1
    Width = 94
    Height = 25
    Hint = ''
    Caption = 'Process'
    Anchors = [akRight, akBottom]
    TabOrder = 7
    OnClick = btnProcClick
  end
  object btnCancel: TUniButton
    Left = 346
    Top = -1
    Width = 94
    Height = 25
    Hint = ''
    Caption = '&Cancel'
    Anchors = [akRight, akBottom]
    TabOrder = 8
    OnClick = Exit1Click
  end
  object btnExceptions: TUniButton
    Left = 139
    Top = -1
    Width = 94
    Height = 25
    Hint = ''
    Caption = 'View Exceptions'
    Anchors = [akRight, akBottom]
    TabOrder = 9
    OnClick = btnExceptionsClick
  end
  object edFile: TUniEdit
    Left = 160
    Top = 3
    Width = 253
    Height = 21
    Hint = ''
    Text = ''
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
  end
  object edExc: TUniEdit
    Left = 160
    Top = 28
    Width = 253
    Height = 21
    Hint = ''
    Text = ''
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
  end
  object MainMenu1: TUniMainMenu
    Left = 176
    Top = 56
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = '&Options'
      object Checkforseparateaccounts1: TUniMenuItem
        Caption = '&Check for separate accounts'
        OnClick = Checkforseparateaccounts1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Text Files (*.txt)|*.txt|All Files (*.*)|*.*'
    Left = 208
    Top = 56
  end
  object OpenDialog2: TOpenDialog
    Filter = 'Text Files (*.txt)|*.txt'
    Left = 240
    Top = 56
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Bank Reconciliation'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 272
    Top = 56
  end
end
