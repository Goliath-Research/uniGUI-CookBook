object QuickAddBase: TQuickAddBase
  Left = 200
  Top = 106
  ClientHeight = 254
  ClientWidth = 306
  Caption = 'Quick Append'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 215
    Width = 306
    Height = 39
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 99
      Top = 1
      Width = 206
      Height = 37
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
        Caption = '&OK'
        TabOrder = 1
        Default = True
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        TabOrder = 2
        OnClick = btnCancelClick
      end
    end
  end
  object PageControl1: TUniPageControl
    Left = 0
    Top = 0
    Width = 306
    Height = 215
    Hint = ''
    ActivePage = TabSheet1
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object TabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'New'
    end
  end
  object Table1: TFDTable
    BeforePost = Table1BeforePost
    OnNewRecord = Table1NewRecord
    ConnectionName = 'IQFD'
    Left = 188
    Top = 48
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 252
    Top = 72
  end
end
