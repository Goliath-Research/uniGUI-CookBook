object FrmChangeItemNo: TFrmChangeItemNo
  Left = 364
  Top = 307
  ClientHeight = 95
  ClientWidth = 349
  Caption = 'Change Inventory Item '
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 349
    Height = 60
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 82
      Top = 1
      Width = 6
      Height = 58
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Left = 1
      Top = 1
      Width = 81
      Height = 58
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label5: TUniLabel
        Left = 8
        Top = 12
        Width = 33
        Height = 13
        Hint = ''
        Caption = 'Item #'
        TabOrder = 1
      end
      object Label4: TUniLabel
        Left = 8
        Top = 36
        Width = 40
        Height = 13
        Hint = ''
        Caption = 'Revision'
        TabOrder = 2
      end
    end
    object PnlClient01: TUniPanel
      Left = 88
      Top = 1
      Width = 260
      Height = 58
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        260
        58)
      object dbeItemNo: TUniDBEdit
        Left = 0
        Top = 8
        Width = 262
        Height = 21
        Hint = ''
        DataField = 'ITEMNO'
        DataSource = DataSource1
        CharCase = ecUpperCase
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        TabStop = False
      end
      object IQUDComboBox1: TIQWebUDComboBox
        Left = 0
        Top = 32
        Width = 267
        Height = 21
        Hint = 'Right click to edit the list'
        ShowHint = True
        ParentShowHint = False
        Anchors = [akLeft, akTop, akRight]
        DataField = 'REV'
        DataSource = DataSource1
        TabOrder = 1
        OnCloseUp = IQUDComboBox1CloseUp
        KeyTableName = 'ARINVT'
        KeyFieldName = 'REV'
      end
    end
  end
  object PnlButtons: TUniPanel
    Left = 0
    Top = 60
    Width = 349
    Height = 35
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel1: TUniPanel
      Left = 133
      Top = 1
      Width = 215
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 5
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 1
      end
      object btnCancel: TUniButton
        Left = 111
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        TabOrder = 2
        OnClick = btnCancelClick
      end
    end
  end
  object DataSource1: TDataSource
    Left = 157
    Top = 14
  end
  object SecurityRegister1: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'dbeItemNo'
      'IQUDComboBox1')
    SecurityCode = 'FRMCHANGEITEMNO'
    Left = 52
    Top = 50
  end
end
