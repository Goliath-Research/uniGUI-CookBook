object FrmSchedSameToolJobs: TFrmSchedSameToolJobs
  Left = 153
  Top = 159
  ClientHeight = 189
  ClientWidth = 387
  Caption = 'Back to back workorders [ Tool # 1234,  Work Center 01 ]'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 0
    Width = 387
    Height = 29
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
  end
  object Label1: TUniLabel
    Left = 2
    Top = 6
    Width = 330
    Height = 13
    Hint = ''
    Caption = ' About to move WO # 123456. Move same tool adjoining jobs along?'
    ParentFont = False
    Font.Color = clBlack
    ParentColor = False
    Color = clBtnFace
    TabOrder = 3
  end
  object ListView1: TUniListView
    Left = 0
    Top = 29
    Width = 387
    Height = 120
    Hint = ''
    RowCount = 1
    ColCount = 4
    Options = [goVertLine, goHorzLine, goRowSelect]
    Columns = <
      item
        Title.Caption = 'Work Order #'
        Caption = 'Work Order #'
        AutoSize = False
        Width = 90
      end
      item
        Title.Caption = 'MFG #'
        Caption = 'MFG #'
        AutoSize = False
        Width = 80
      end
      item
        Title.Caption = 'Position #'
        Caption = 'Position #'
        AutoSize = False
        Width = 60
      end
      item
        Title.Caption = 'Start'
        Caption = 'Start'
        AutoSize = False
        Width = 90
      end
      item
        Title.Caption = 'End'
        Caption = 'End'
        AutoSize = False
        Width = 90
      end
      item
        Title.Caption = 'Must Start'
        Caption = 'Must Start'
        AutoSize = False
        Width = 90
      end
      item
        Title.Caption = 'Production Hours'
        Caption = 'Production Hours'
        AutoSize = False
        Width = 100
      end
      item
        Title.Caption = 'Setup Hours'
        Caption = 'Setup Hours'
        AutoSize = False
        Width = 80
      end>
    Items = <>
    isRowSelect = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 149
    Width = 387
    Height = 40
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel2: TUniPanel
      Tag = 1999
      Left = 69
      Top = 1
      Width = 317
      Height = 38
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnMoveAll: TUniButton
        Left = 5
        Top = 8
        Width = 98
        Height = 25
        Hint = ''
        Caption = 'Move All'
        TabOrder = 1
        OnClick = btnMoveAllClick
      end
      object btnMoveTop: TUniButton
        Left = 109
        Top = 8
        Width = 98
        Height = 25
        Hint = ''
        Caption = 'Move Top'
        TabOrder = 2
        OnClick = btnMoveTopClick
      end
      object btnCancel: TUniButton
        Left = 213
        Top = 8
        Width = 98
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        TabOrder = 3
        OnClick = btnCancelClick
      end
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmSchedSameToolJobs')
    SecurityItems.Strings = (
      'btnMoveAll'
      'btnMoveTop')
    SecurityCode = 'FRMSCHEDSAMETOOLJOBS'
    Left = 152
    Top = 72
  end
end
