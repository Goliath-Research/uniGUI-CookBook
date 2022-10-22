object FrmTransLotExpDateDlg: TFrmTransLotExpDateDlg
  Left = 0
  Top = 0
  ClientHeight = 195
  ClientWidth = 486
  Caption = 'Lot Expiration Date'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 151
    Width = 486
    Height = 44
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 261
      Top = 1
      Width = 225
      Height = 42
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 4
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 115
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 486
    Height = 151
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 114
      Top = 51
      Width = 6
      Height = 99
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
      ExplicitLeft = 113
      ExplicitTop = 50
      ExplicitHeight = 101
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 51
      Width = 113
      Height = 99
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitTop = 50
      ExplicitHeight = 101
      object Label1: TUniLabel
        Left = 13
        Top = 8
        Width = 33
        Height = 13
        Hint = ''
        Caption = 'Item #'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 13
        Top = 32
        Width = 26
        Height = 13
        Hint = ''
        Caption = 'Lot #'
        TabOrder = 2
      end
      object Label3: TUniLabel
        Left = 13
        Top = 56
        Width = 66
        Height = 13
        Hint = ''
        Caption = 'Lot Exp. Date'
        TabOrder = 3
      end
    end
    object Panel5: TUniPanel
      Left = 120
      Top = 51
      Width = 365
      Height = 99
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitLeft = 119
      ExplicitTop = 50
      ExplicitWidth = 367
      ExplicitHeight = 101
      DesignSize = (
        365
        99)
      object edItemNo: TUniEdit
        Left = 1
        Top = 5
        Width = 356
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Color = clBtnFace
        ReadOnly = True
      end
      object edLotNo: TUniEdit
        Left = 1
        Top = 29
        Width = 197
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 1
        Color = clBtnFace
        ReadOnly = True
      end
      object wwDBDateTimePickerExpDate: TUniDBDateTimePicker
        Left = 1
        Top = 53
        Width = 197
        Height = 21
        Hint = ''
        DateTime = 42632.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 2
      end
    end
    object CaptionPanel1: TIQWebCaptionPanel
      Left = 1
      Top = 1
      Width = 484
      Height = 50
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      Caption = 'Missing Mandatory Lot Expiration Date'
      ParentColor = True
      Text = 'Enter lot expiration date to continue'
      Picture.Data = {
        07544269746D617036030000424D360300000000000036000000280000001000
        000010000000010018000000000000030000130B0000130B0000000000000000
        0000FFFFFFADAEAD632C316330316330316330315A30315A30315A3031633031
        633031633031633031632C296B1C18D6E3E763D3EF00B2DE00B2DE00B2DE00B2
        DE00B2DE00BAE700CBFF00B6E700B2DE00B2DE00B2DE00B6E700C3EF524552A5
        92945AD7F700C3EF00DBFF00D7FF00D7FF00DBFF18384A6304104A9EBD00D7FF
        00D7FF00D7FF08E3FF00CBF74A4D5AFFFFFFFFFFFF00C3E710E3FF00D7FF00D7
        FF00DBFF101821180000215D7B00D7FF00D7FF00D7FF18EFFF00E3FF843431FF
        FFFFFFFFFF00C7EF00D3F708E3FF00DBFF00DBFF00EFFF00F7FF00EBFF00DBFF
        00DBFF18F3FF00D7FF298A9CD6E7EFFFFFFFFFFFFFFFFFFF00CBEF10EFFF00DF
        FF00DFFF00E7FF42101800EBFF00DFFF00DFFF18FBFF00EBFF843431FFFFFFFF
        FFFFFFFFFFFFFFFF08D7EF00D7F708EBFF00E3FF00FFFF6B000000FBFF00E3FF
        10F7FF00D7FF298A94D6E7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00CFE710F7
        FF00E7FF00EBFFBD596B00F7FF00E7FF18FFFF00EFFF842C21FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF00D7EF00E7FF00F3FF00A2B56B203100CFE708F7FF
        00E7FF29969CD6E3E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00DB
        EF10FFFF00081039001021556B21FFFF00F7FF842018FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF00DFEF00F3FF000000310008294D5A00F3FF
        21AAB5CEDBDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6EB
        EF00E3EF10FFFF00BAC621FFFF00FFFF7B1810FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00E3EF00F7FF08FFFF00FBFF18BABD
        CED3D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFCEEBEF00EBEF6BFFFF00FFFF7B1010FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00F3F700FFFF21CBCEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF9CF3F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF}
      PictureLayout = plImageRight
      LayoutStyle = lsWizard
      DesignSize = (
        484
        50)
    end
  end
end
