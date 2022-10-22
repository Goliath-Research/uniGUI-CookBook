object FrmScanIDConfig: TFrmScanIDConfig
  Left = 495
  Top = 177
  ClientHeight = 364
  ClientWidth = 364
  Caption = 'Configure'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 0
    Width = 364
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
  end
  object pcMain: TUniPageControl
    Left = 0
    Top = 3
    Width = 364
    Height = 326
    Hint = ''
    ActivePage = TabGeneral
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabGeneral: TUniTabSheet
      Hint = ''
      ImageIndex = 2
      Caption = 'General'
      object Bevel2: TUniPanel
        Left = 0
        Top = 0
        Width = 356
        Height = 3
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        Caption = ''
      end
      object gbAlarms: TUniGroupBox
        Left = 0
        Top = 142
        Width = 356
        Height = 105
        Hint = ''
        Caption = ' Error Alarm '
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          356
          105)
        object lblUseWav: TUniLabel
          Left = 8
          Top = 16
          Width = 46
          Height = 13
          Hint = ''
          Caption = 'Halt Error'
          TabOrder = 3
        end
        object sbtnBrowse_FatalAlarm: TUniSpeedButton
          Left = 282
          Top = 32
          Width = 23
          Height = 22
          Hint = 'Browse for Sound File'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D44444444444
            444DD77777777777777D4DDDDDDDDDDDDDD47FDDDDDDDDDDDDD74DDDDDDDDDDD
            DDD47FDDDDDDDDDDDDD74DDDDDDDDDDDDDD47FDDDDDDDDDDDDD74DDDDDDDDDDD
            DDD47FDDDFFDFFDFFDD74DDD00D00D00DDD47FDD77F77F77FDD74DDD00D00D00
            DDD47FDD77D77D77DDD74DDDDDDDDDDDDDD47FDDDDDDDDDDDDD74DDDDDDDDDDD
            DDD47FDDDDDDDDDDDDD74DDDDDDDDDDDDDD47FDDDDDDDDDDDDD74DDDDDDDDDDD
            DDD47FDDDDDDDDDDDDD74DDDDDDDDDDDDDD47FDDDDDDDDDDDDD74DDDDDDDDDDD
            DDD47FDDDDDDDDDDDDD74DDDDDDDDDDDDDD47FDDDDDDDDDDDDD74DDDDDDDDDDD
            DDD47FFFFFFFFFFFFFF7D44444444444444DD77777777777777D}
          Caption = ''
          Anchors = [akTop, akRight]
          ParentColor = False
          Color = clWindow
          OnClick = sbtnBrowse_FatalAlarmClick
        end
        object sbtnPlay_FatalAlarm: TUniSpeedButton
          Left = 305
          Top = 32
          Width = 22
          Height = 22
          Hint = 'Test Sound'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD77DDDDDD
            DDDDDDDDDDDDDDDDDDDDDDDD747DDDDDDDDDDDDDD7FDDDDDDDDDDDDD7447DDDD
            DDDDDDDDD77FDDDDDDDDDDDD74C47DDDDDDDDDDDD7F7FDDDDDDDDDDD74CC47DD
            DDDDDDDDD7FD7FDDDDDDDDDD74CCC47DDDDDDDDDD7FDD7FDDDDDDDDD74CCCC4D
            DDDDDDDDD7FDDD7FDDDDDDDD74CCC4DDDDDDDDDDD7FDD7DDDDDDDDDD74CC4DDD
            DDDDDDDDD7FD7DDDDDDDDDDD74C4DDDDDDDDDDDDD7F7DDDDDDDDDDDD744DDDDD
            DDDDDDDDD77DDDDDDDDDDDDDD4DDDDDDDDDDDDDDD7DDDDDDDDDDDDDDDDDDDDDD
            DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
          Caption = ''
          Anchors = [akTop, akRight]
          ParentColor = False
          Color = clWindow
          OnClick = sbtnPlay_FatalAlarmClick
        end
        object sbtnClear_FatalAlarm: TUniSpeedButton
          Left = 327
          Top = 32
          Width = 23
          Height = 22
          Hint = 'Clear'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
            555557777F777555F55500000000555055557777777755F75555005500055055
            555577F5777F57555555005550055555555577FF577F5FF55555500550050055
            5555577FF77577FF555555005050110555555577F757777FF555555505099910
            555555FF75777777FF555005550999910555577F5F77777775F5500505509990
            3055577F75F77777575F55005055090B030555775755777575755555555550B0
            B03055555F555757575755550555550B0B335555755555757555555555555550
            BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
            50BB555555555555575F555555555555550B5555555555555575}
          Caption = ''
          Anchors = [akTop, akRight]
          ParentColor = False
          Color = clWindow
          OnClick = sbtnClear_FatalAlarmClick
        end
        object Label11: TUniLabel
          Left = 8
          Top = 56
          Width = 64
          Height = 13
          Hint = ''
          Caption = 'General Error'
          TabOrder = 7
        end
        object sbtnBrowse_GeneralAlarm: TUniSpeedButton
          Left = 285
          Top = 77
          Width = 23
          Height = 22
          Hint = 'Browse for Sound File'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D44444444444
            444DD77777777777777D4DDDDDDDDDDDDDD47FDDDDDDDDDDDDD74DDDDDDDDDDD
            DDD47FDDDDDDDDDDDDD74DDDDDDDDDDDDDD47FDDDDDDDDDDDDD74DDDDDDDDDDD
            DDD47FDDDFFDFFDFFDD74DDD00D00D00DDD47FDD77F77F77FDD74DDD00D00D00
            DDD47FDD77D77D77DDD74DDDDDDDDDDDDDD47FDDDDDDDDDDDDD74DDDDDDDDDDD
            DDD47FDDDDDDDDDDDDD74DDDDDDDDDDDDDD47FDDDDDDDDDDDDD74DDDDDDDDDDD
            DDD47FDDDDDDDDDDDDD74DDDDDDDDDDDDDD47FDDDDDDDDDDDDD74DDDDDDDDDDD
            DDD47FDDDDDDDDDDDDD74DDDDDDDDDDDDDD47FDDDDDDDDDDDDD74DDDDDDDDDDD
            DDD47FFFFFFFFFFFFFF7D44444444444444DD77777777777777D}
          Caption = ''
          Anchors = [akTop, akRight]
          ParentColor = False
          Color = clWindow
          OnClick = sbtnBrowse_GeneralAlarmClick
        end
        object sbtnPlay_GeneralAlarm: TUniSpeedButton
          Left = 305
          Top = 72
          Width = 22
          Height = 22
          Hint = 'Test Sound'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD77DDDDDD
            DDDDDDDDDDDDDDDDDDDDDDDD747DDDDDDDDDDDDDD7FDDDDDDDDDDDDD7447DDDD
            DDDDDDDDD77FDDDDDDDDDDDD74C47DDDDDDDDDDDD7F7FDDDDDDDDDDD74CC47DD
            DDDDDDDDD7FD7FDDDDDDDDDD74CCC47DDDDDDDDDD7FDD7FDDDDDDDDD74CCCC4D
            DDDDDDDDD7FDDD7FDDDDDDDD74CCC4DDDDDDDDDDD7FDD7DDDDDDDDDD74CC4DDD
            DDDDDDDDD7FD7DDDDDDDDDDD74C4DDDDDDDDDDDDD7F7DDDDDDDDDDDD744DDDDD
            DDDDDDDDD77DDDDDDDDDDDDDD4DDDDDDDDDDDDDDD7DDDDDDDDDDDDDDDDDDDDDD
            DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
          Caption = ''
          Anchors = [akTop, akRight]
          ParentColor = False
          Color = clWindow
          OnClick = sbtnPlay_GeneralAlarmClick
        end
        object sbtnClear_GeneralAlarm: TUniSpeedButton
          Left = 327
          Top = 72
          Width = 23
          Height = 22
          Hint = 'Clear'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
            555557777F777555F55500000000555055557777777755F75555005500055055
            555577F5777F57555555005550055555555577FF577F5FF55555500550050055
            5555577FF77577FF555555005050110555555577F757777FF555555505099910
            555555FF75777777FF555005550999910555577F5F77777775F5500505509990
            3055577F75F77777575F55005055090B030555775755777575755555555550B0
            B03055555F555757575755550555550B0B335555755555757555555555555550
            BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
            50BB555555555555575F555555555555550B5555555555555575}
          Caption = ''
          Anchors = [akTop, akRight]
          ParentColor = False
          Color = clWindow
          OnClick = sbtnClear_GeneralAlarmClick
        end
        object edtWaveFile: TUniEdit
          Left = 8
          Top = 32
          Width = 271
          Height = 21
          Hint = ''
          Text = '<Default>'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ReadOnly = True
        end
        object edtGeneralErrorAlarmFile: TUniEdit
          Left = 8
          Top = 72
          Width = 271
          Height = 21
          Hint = ''
          Text = '<Default>'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ReadOnly = True
        end
      end
      object GroupBox1: TUniGroupBox
        Left = 0
        Top = 59
        Width = 356
        Height = 83
        Hint = ''
        Caption = ' Log File '
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        DesignSize = (
          356
          83)
        object lblLogFileName: TUniLabel
          Left = 8
          Top = 36
          Width = 66
          Height = 13
          Hint = ''
          Caption = 'Log File Name'
          TabOrder = 4
        end
        object sbtnBrowseLog: TUniSpeedButton
          Left = 300
          Top = 31
          Width = 22
          Height = 22
          Hint = 'Browse'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D44444444444
            444DD77777777777777D4DDDDDDDDDDDDDD47FDDDDDDDDDDDDD74DDDDDDDDDDD
            DDD47FDDDDDDDDDDDDD74DDDDDDDDDDDDDD47FDDDDDDDDDDDDD74DDDDDDDDDDD
            DDD47FDDDFFDFFDFFDD74DDD00D00D00DDD47FDD77F77F77FDD74DDD00D00D00
            DDD47FDD77D77D77DDD74DDDDDDDDDDDDDD47FDDDDDDDDDDDDD74DDDDDDDDDDD
            DDD47FDDDDDDDDDDDDD74DDDDDDDDDDDDDD47FDDDDDDDDDDDDD74DDDDDDDDDDD
            DDD47FDDDDDDDDDDDDD74DDDDDDDDDDDDDD47FDDDDDDDDDDDDD74DDDDDDDDDDD
            DDD47FDDDDDDDDDDDDD74DDDDDDDDDDDDDD47FDDDDDDDDDDDDD74DDDDDDDDDDD
            DDD47FFFFFFFFFFFFFF7D44444444444444DD77777777777777D}
          Caption = ''
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Style = [fsBold]
          ParentColor = False
          Color = clWindow
          OnClick = sbtnBrowseLogClick
        end
        object sbtnOpenLog: TUniSpeedButton
          Left = 324
          Top = 31
          Width = 22
          Height = 22
          Hint = 'Open Log File'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000C40E0000C40E00001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDDDDDDDDDDDDDDDD00000000000DDDDD003333333330DDDD0B0333333333
            0DDD0FB03333333330DD0BFB03333333330D0FBFB000000000000BFBFBFBFB0D
            DDDD0FBFBFBFBF0DDDDD0BFB0000000DDDDDD000DDDDDDDD000DDDDDDDDDDDDD
            D00DDDDDDDDD0DDD0D0DDDDDDDDDD000DDDDDDDDDDDDDDDDDDDD}
          Caption = ''
          Anchors = [akTop, akRight]
          ParentColor = False
          Color = clWindow
          OnClick = sbtnOpenLogClick
        end
        object chkLogMode: TUniCheckBox
          Left = 8
          Top = 16
          Width = 97
          Height = 17
          Hint = ''
          Caption = 'Log Activity'
          TabOrder = 0
          OnClick = chkLogModeClick
        end
        object edtLogFileName: TUniEdit
          Left = 104
          Top = 32
          Width = 193
          Height = 21
          Hint = ''
          Text = ''
          ParentFont = False
          Font.Color = clBlack
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          OnChange = edtLogFileNameChange
        end
        object chkLogAll: TUniCheckBox
          Left = 104
          Top = 56
          Width = 97
          Height = 17
          Hint = ''
          Caption = 'Log all activity'
          TabOrder = 2
        end
      end
      object gbPrint: TUniGroupBox
        Left = 0
        Top = 247
        Width = 356
        Height = 50
        Hint = ''
        Visible = False
        Caption = ' Printing '
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        object Label5: TUniLabel
          Left = 8
          Top = 20
          Width = 32
          Height = 13
          Hint = ''
          Caption = 'Copies'
          TabOrder = 2
        end
        object edtPrintCopies: TUniEdit
          Left = 80
          Top = 16
          Width = 38
          Height = 21
          Hint = ''
          Text = '1'
          TabOrder = 0
        end
        object udPrintCopies: TUpDown
          Left = 118
          Top = 16
          Width = 16
          Height = 21
          Associate = edtPrintCopies
          Min = 1
          Position = 1
          TabOrder = 3
        end
      end
      object grpLabels: TUniGroupBox
        Left = 0
        Top = 3
        Width = 356
        Height = 56
        Hint = ''
        Caption = 'Labels'
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        object chkUseLblH: TUniCheckBox
          Left = 8
          Top = 20
          Width = 193
          Height = 17
          Hint = ''
          Caption = 'Use Label Hierarchy'
          TabOrder = 0
        end
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 329
    Width = 364
    Height = 35
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel1: TUniPanel
      Left = 149
      Top = 1
      Width = 214
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 6
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
        OnClick = btnOkClick
      end
      object btnCancel: TUniBitBtn
        Left = 109
        Top = 4
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
  object OpenDialog1: TOpenDialog
    DefaultExt = '.RPT'
    Filter = 'Crystal Reports (*.rpt)|*.rpt'
    Left = 289
    Top = 44
  end
  object OpenDialog2: TOpenDialog
    DefaultExt = '.WAV'
    Filter = 'Wave Files (*.wav)|*.wav'
    Left = 317
    Top = 45
  end
  object OpenDialog3: TOpenDialog
    DefaultExt = '.TXT'
    Filter = 'Text Files (*.txt)|*.txt|All Files (*.*)|*.*'
    Left = 261
    Top = 44
  end
end
