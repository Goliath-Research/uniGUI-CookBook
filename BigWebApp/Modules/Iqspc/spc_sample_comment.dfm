object FrmSPCSampleComment: TFrmSPCSampleComment
  Left = 0
  Top = 0
  ClientHeight = 132
  ClientWidth = 409
  Caption = 'Sample Comment Required'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 91
    Width = 409
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 299
      Top = 1
      Width = 109
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 0
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 1
        Default = True
        OnClick = btnOkClick
      end
    end
  end
  object PnlClient01: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 409
    Height = 91
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 114
      Top = 1
      Width = 6
      Height = 89
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 113
      Height = 89
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object lblComment: TUniLabel
        Left = 8
        Top = 19
        Width = 82
        Height = 13
        Hint = ''
        Caption = 'Sample Comment'
        TabOrder = 1
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 120
      Top = 1
      Width = 288
      Height = 89
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        288
        89)
      object cmbGridSampleComment: TIQWebUDComboBox
        Left = 0
        Top = 16
        Width = 282
        Height = 21
        Hint = 'Right click to edit the list'
        ShowHint = True
        ParentShowHint = False
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnChange = DoSetButtons
        KeyTableName = 'SPC_SAMPLE'
        KeyFieldName = 'NOTE'
      end
      object PnlEditComment: TUniPanel
        Tag = 1999
        Left = 244
        Top = 17
        Width = 19
        Height = 19
        Hint = ''
        Anchors = [akTop, akRight]
        TabOrder = 1
        Caption = ''
        object sbtnEditComment: TUniSpeedButton
          Left = 0
          Top = 0
          Width = 17
          Height = 17
          Cursor = crArrow
          Hint = 'Edit'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            5A000000424D5A000000000000003E000000280000000A000000070000000100
            0100000000001C0000000000000000000000020000000200000000000000FFFF
            FF00FFC000009240000092400000FFC00000FFC00000FFC00000FFC00000}
          Caption = ''
          ParentFont = False
          Font.Style = [fsBold]
          ParentColor = False
          Color = clWindow
          OnClick = sbtnEditCommentClick
        end
      end
    end
  end
end
