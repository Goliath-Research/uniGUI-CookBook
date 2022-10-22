object FrmBomInputQry: TFrmBomInputQry
  Left = 324
  Top = 229
  ClientHeight = 162
  ClientWidth = 404
  Caption = 'Convert BOM to Quote'
  Position = poOwnerFormCenter
  Constraints.MaxHeight = 200
  Constraints.MinHeight = 200
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 121
    Width = 404
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 400
    object Bevel1: TUniPanel
      Left = 0
      Top = 0
      Width = 404
      Height = 4
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
      ExplicitWidth = 400
    end
    object Panel2: TUniPanel
      Left = 197
      Top = 4
      Width = 207
      Height = 37
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitLeft = 193
      object Button1: TUniButton
        Left = 0
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TUniButton
        Left = 104
        Top = 5
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
    Width = 404
    Height = 121
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 400
    object Splitter1: TUniSplitter
      Left = 118
      Top = 1
      Width = 6
      Height = 119
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
      ExplicitLeft = 117
      ExplicitTop = 0
      ExplicitHeight = 121
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 117
      Height = 119
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitHeight = 121
      object Label1: TUniLabel
        Left = 8
        Top = 12
        Width = 85
        Height = 13
        Hint = ''
        Caption = 'Enter New RFQ #'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 8
        Top = 36
        Width = 93
        Height = 13
        Hint = ''
        Caption = 'Enter New Revision'
        TabOrder = 2
      end
      object Label3: TUniLabel
        Left = 8
        Top = 97
        Width = 78
        Height = 13
        Hint = ''
        Caption = 'Quote Due Date'
        TabOrder = 3
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 124
      Top = 1
      Width = 279
      Height = 119
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitLeft = 120
      ExplicitTop = 0
      ExplicitWidth = 280
      ExplicitHeight = 121
      DesignSize = (
        279
        119)
      object CheckBox1: TUniCheckBox
        Left = 0
        Top = 55
        Width = 151
        Height = 17
        Hint = ''
        Caption = 'Update Component Pricing'
        TabOrder = 2
      end
      object Edit1: TUniEdit
        Left = 0
        Top = 8
        Width = 263
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitWidth = 259
      end
      object Edit2: TUniEdit
        Left = 0
        Top = 32
        Width = 263
        Height = 21
        Hint = ''
        Text = '1'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ExplicitWidth = 259
      end
      object wwDBDateTimePicker1: TUniDBDateTimePicker
        Left = 0
        Top = 94
        Width = 161
        Height = 21
        Hint = ''
        DateTime = 42687.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 4
      end
      object CheckBox2: TUniCheckBox
        Left = 0
        Top = 73
        Width = 151
        Height = 17
        Hint = ''
        Caption = 'Update Standard Cost'
        TabOrder = 3
      end
    end
  end
end
