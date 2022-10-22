object FrmExtFileBas: TFrmExtFileBas
  Left = 144
  Top = 185
  ClientHeight = 236
  ClientWidth = 374
  Caption = 'Process External File'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object s: TUniPanel
    Left = 0
    Top = 200
    Width = 374
    Height = 36
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 214
      Top = 1
      Width = 160
      Height = 34
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitHeight = 26
      object BtnProcess: TUniButton
        Left = 3
        Top = 2
        Width = 76
        Height = 25
        Hint = ''
        Caption = '&Process'
        TabOrder = 1
        OnClick = BtnProcessClick
      end
      object BntCancel: TUniButton
        Left = 83
        Top = 2
        Width = 76
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        TabOrder = 2
        OnClick = Exit1Click
      end
    end
    object ProgressBar1: TUniProgressBar
      Left = 1
      Top = 1
      Width = 214
      Height = 34
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      ExplicitHeight = 26
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 374
    Height = 41
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object Label1: TUniLabel
      Left = 6
      Top = 16
      Width = 59
      Height = 13
      Hint = ''
      Caption = 'External File'
      TabOrder = 2
    end
    object sbPO: TUniSpeedButton
      Left = 337
      Top = 10
      Width = 27
      Height = 25
      Hint = 'Find Remitance report'
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
      ParentColor = False
      Color = clWindow
      OnClick = sbPOClick
    end
    object edFile: TUniEdit
      Left = 69
      Top = 13
      Width = 262
      Height = 19
      Hint = ''
      Text = ''
      TabOrder = 0
      Color = clBtnFace
      ReadOnly = True
    end
  end
  object Panel4: TUniPanel
    Left = 0
    Top = 41
    Width = 374
    Height = 30
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Alignment = taLeftJustify
    Caption = ''
    object DBNavigator1: TUniDBNavigator
      Left = 274
      Top = 1
      Width = 100
      Height = 28
      Hint = ''
      DataSource = SrcTxt
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object DBGrid1: TUniDBGrid
    Left = 0
    Top = 71
    Width = 374
    Height = 129
    Hint = ''
    DataSource = SrcTxt
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
  end
  object MainMenu1: TUniMainMenu
    Left = 240
    Top = 8
    object File1: TUniMenuItem
      Caption = '&File'
      object Abortprocessing1: TUniMenuItem
        Caption = '&Abort processing'
        OnClick = Abortprocessing1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object About1: TUniMenuItem
        Caption = '&About'
      end
    end
  end
  object IQStrings1: TIQWebStrings
    Items.Strings = (
      ''
      ''
      ''
      ' '
      ' ')
    Left = 328
    Top = 81
  end
  object SrcTxt: TDataSource
    DataSet = TblTxt
    Left = 264
    Top = 89
  end
  object TblTxtold: TFDTable
    ConnectionName = 'IQFD'
    Left = 16
    Top = 41
  end
  object FDDataMove1: TFDDataMove
    TextDataDef.Fields = <>
    TextDataDef.Delimiter = '"'
    TextDataDef.Separator = ';'
    TextDataDef.RecordFormat = rfCustom
    TextFileName = 'Data.txt'
    TextAnalyze = [taDelimSep, taHeader, taFields]
    Mappings = <>
    LogFileName = 'Data.log'
    SourceKind = skText
    Destination = TblTxt
    Left = 24
    Top = 88
  end
  object TblTxt: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 232
    Top = 120
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 128
    Top = 88
  end
  object odFile: TUniFileUpload
    OnCompleted = odFileCompleted
    Title = 'Upload'
    Messages.Uploading = 'Uploading...'
    Messages.PleaseWait = 'Please Wait'
    Messages.Cancel = 'Cancel'
    Messages.Processing = 'Processing...'
    Messages.UploadError = 'Upload Error'
    Messages.Upload = 'Upload'
    Messages.NoFileError = 'Please Select a File'
    Messages.BrowseText = 'Browse...'
    Left = 184
    Top = 128
  end
end
