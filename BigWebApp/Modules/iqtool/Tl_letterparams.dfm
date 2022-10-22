object FrmTLLetterParams: TFrmTLLetterParams
  Left = 195
  Top = 148
  ClientHeight = 139
  ClientWidth = 413
  Caption = 'Parameters'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlControls: TUniPanel
    Left = 0
    Top = 104
    Width = 413
    Height = 35
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel1: TUniPanel
      Left = 205
      Top = 1
      Width = 208
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 1
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 1
      end
      object btnCancel: TUniButton
        Left = 103
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object PnlFields: TUniPanel
    Left = 0
    Top = 0
    Width = 413
    Height = 104
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      413
      104)
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 411
      Height = 102
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 4
      Caption = ''
    end
    object Label1: TUniLabel
      Left = 12
      Top = 18
      Width = 107
      Height = 13
      Hint = ''
      Caption = 'Project Crystal Report'
      TabOrder = 5
    end
    object sbtnToolingReport: TUniSpeedButton
      Left = 382
      Top = 14
      Width = 22
      Height = 22
      Hint = ''
      Glyph.Data = {
        A6000000424DA600000000000000760000002800000014000000040000000100
        0400000000003000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888880000800800800887F87F87F800008008008008877877877800008888
        88888888888888880000}
      Caption = ''
      Anchors = [akTop, akRight]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnToolingReportClick
    end
    object Label3: TUniLabel
      Left = 12
      Top = 42
      Width = 128
      Height = 13
      Hint = ''
      Caption = 'BOM Quote Crystal Report'
      TabOrder = 7
    end
    object sbtnQuoteReport: TUniSpeedButton
      Left = 382
      Top = 38
      Width = 22
      Height = 22
      Hint = ''
      Glyph.Data = {
        A6000000424DA600000000000000760000002800000014000000040000000100
        0400000000003000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888880000800800800887F87F87F800008008008008877877877800008888
        88888888888888880000}
      Caption = ''
      Anchors = [akTop, akRight]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnQuoteReportClick
    end
    object Label2: TUniLabel
      Left = 12
      Top = 66
      Width = 127
      Height = 13
      Hint = ''
      Caption = 'MS Word Project Template'
      TabOrder = 9
    end
    object sbtnTemplate: TUniSpeedButton
      Left = 382
      Top = 62
      Width = 22
      Height = 22
      Hint = ''
      Glyph.Data = {
        A6000000424DA600000000000000760000002800000014000000040000000100
        0400000000003000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888880000800800800887F87F87F800008008008008877877877800008888
        88888888888888880000}
      Caption = ''
      Anchors = [akTop, akRight]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnTemplateClick
    end
    object edtToolingReport: TUniEdit
      Left = 188
      Top = 14
      Width = 190
      Height = 21
      Hint = ''
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object edtQuoteReport: TUniEdit
      Left = 188
      Top = 38
      Width = 190
      Height = 21
      Hint = ''
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object edtTemplate: TUniEdit
      Left = 188
      Top = 62
      Width = 190
      Height = 21
      Hint = ''
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = '*.rpt|*.rpt|*.*|*.*'
    Title = 'Select Crystal Report '
    Left = 8
    Top = 104
  end
  object OpenDialog2: TOpenDialog
    Filter = '*.dot|*.dot|*.*|*.*'
    Title = 'Select MS Word Template'
    Left = 40
    Top = 104
  end
end
