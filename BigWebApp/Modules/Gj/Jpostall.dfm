object FrmGJPostAll: TFrmGJPostAll
  Left = 364
  Top = 229
  ClientHeight = 148
  ClientWidth = 292
  Caption = 'GJ Post All'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 107
    Width = 292
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 82
      Top = 1
      Width = 209
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 4
        Top = 10
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 106
        Top = 10
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object PnlClient01: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 292
    Height = 107
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 82
      Top = 1
      Width = 6
      Height = 105
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 81
      Height = 105
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 8
        Top = 12
        Width = 56
        Height = 13
        Hint = ''
        Caption = 'Group Type'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 8
        Top = 36
        Width = 53
        Height = 13
        Hint = ''
        Caption = 'Batch Date'
        TabOrder = 2
      end
      object Label3: TUniLabel
        Left = 8
        Top = 60
        Width = 30
        Height = 13
        Hint = ''
        Caption = 'Period'
        TabOrder = 3
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 88
      Top = 1
      Width = 203
      Height = 105
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Panel3: TUniPanel
        Tag = 1999
        Left = 176
        Top = 1
        Width = 26
        Height = 103
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object SBPeriod: TUniSpeedButton
          Left = 2
          Top = 56
          Width = 22
          Height = 22
          Hint = 'Find period'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDDDDDDDDDDDDDDDDDDDD0000000000DDDDDD0FFFFFFFF0DDDDDD0FFFFFFF
            F0DDDDDD0FF80FFFF0DDDDDD0F800FFFF0DDDDDD080B0FFFF0DDDDDD00B0FFFF
            F0DDDDDD0B0FFFFFF0DDDDD0B0FFFFFFF0DDDD0B0FFFFFFFF0DDD0B07FFFFFFF
            F0DDD90D0000000000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = SBPeriodClick
        end
      end
      object PnlCtrls: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 175
        Height = 103
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          175
          103)
        object ComboBox1: TUniComboBox
          Left = 2
          Top = 7
          Width = 168
          Height = 21
          Hint = ''
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            'RECURRING'
            'REVERSING'
            'FREE FORM'
            'STATISTICAL')
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
        end
        object DateTimePicker1: TUniDateTimePicker
          Left = 2
          Top = 32
          Width = 168
          Height = 21
          Hint = ''
          DateTime = 42682.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object EdPeriod: TUniEdit
          Left = 2
          Top = 56
          Width = 168
          Height = 21
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Color = clBtnFace
          ReadOnly = True
        end
      end
    end
  end
end
