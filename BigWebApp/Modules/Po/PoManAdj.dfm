object FrmManRecAdj: TFrmManRecAdj
  Left = 80
  Top = 153
  HelpContext = 1034178
  ClientHeight = 333
  ClientWidth = 399
  Caption = 'Manual Received Quantity Adjustment'
  OnShow = UniFormShow
  Constraints.MinHeight = 370
  Constraints.MinWidth = 370
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  DesignSize = (
    399
    333)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 13
    Top = 61
    Width = 96
    Height = 13
    Hint = ''
    Caption = 'Total Qty. Received'
    TabOrder = 5
  end
  object Label2: TUniLabel
    Left = 13
    Top = 85
    Width = 68
    Height = 13
    Hint = ''
    Caption = 'Adjusted Qty.'
    TabOrder = 6
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 292
    Width = 399
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitTop = 271
    ExplicitWidth = 354
    object Panel2: TUniPanel
      Left = 188
      Top = 1
      Width = 210
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitLeft = 143
      object btnOk: TUniButton
        Left = 0
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOkClick
      end
      object BtnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 2
        OnClick = Exit1Click
      end
    end
  end
  object edTotalQty: TUniEdit
    Left = 124
    Top = 58
    Width = 273
    Height = 19
    Hint = ''
    Text = 'edTotalQty'
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Color = clBtnFace
    ExplicitWidth = 228
  end
  object EdAdjQty: TUniEdit
    Left = 124
    Top = 83
    Width = 273
    Height = 21
    Hint = ''
    Text = 'EdAdjQty'
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    ExplicitWidth = 228
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 399
    Height = 48
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
    ExplicitWidth = 354
    object Label3: TUniLabel
      Left = 11
      Top = 7
      Width = 31
      Height = 13
      Hint = ''
      Caption = 'Label3'
      TabOrder = 1
    end
    object Label4: TUniLabel
      Left = 11
      Top = 28
      Width = 31
      Height = 13
      Hint = ''
      Caption = 'Label4'
      TabOrder = 2
    end
  end
  object Panel4: TUniPanel
    Left = 0
    Top = 117
    Width = 399
    Height = 175
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 4
    Caption = ''
    ExplicitTop = 288
    ExplicitWidth = 354
    object Panel5: TUniPanel
      Left = 1
      Top = 1
      Width = 152
      Height = 173
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label5: TUniLabel
        Left = 13
        Top = 4
        Width = 81
        Height = 13
        Hint = ''
        Caption = 'Adjustment Date'
        TabOrder = 1
      end
    end
    object Panel6: TUniPanel
      Left = 153
      Top = 1
      Width = 245
      Height = 173
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitLeft = 125
      ExplicitWidth = 228
      ExplicitHeight = 163
      object edDate: TUniCalendar
        Left = 1
        Top = 1
        Width = 243
        Height = 171
        Hint = ''
        Date = 42678.000000000000000000
        FirstDayOfWeek = dowMonday
        TabStop = False
        TabOrder = 1
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        ExplicitLeft = 14
        ExplicitTop = 3
        ExplicitWidth = 211
        ExplicitHeight = 173
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 48
    Top = 112
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Manual Received Quantity Adjustment'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195314 $'
    BuildVersion = '176554'
    Left = 48
    Top = 168
  end
end
