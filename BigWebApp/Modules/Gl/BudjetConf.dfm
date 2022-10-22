object FrmBudgetConfirm: TFrmBudgetConfirm
  Left = 113
  Top = 194
  ClientHeight = 177
  ClientWidth = 477
  Caption = 'Recalculate Budget'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 136
    Width = 477
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 228
      Top = 1
      Width = 249
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnYes: TUniButton
        Left = 72
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Yes'
        TabOrder = 1
        OnClick = BtnYesClick
      end
      object BtnNo: TUniButton
        Left = 160
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'No'
        TabOrder = 2
        OnClick = BtnNoClick
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 477
    Height = 136
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 475
      Height = 69
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 24
        Top = 24
        Width = 399
        Height = 13
        Hint = ''
        Caption = 
          'This option recalculates the budget based on current Sales Order' +
          's and forecasting.'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 27
        Top = 46
        Width = 123
        Height = 13
        Hint = ''
        Caption = 'Do you want to continue?'
        TabOrder = 2
      end
    end
    object Panel5: TUniPanel
      Left = 1
      Top = 69
      Width = 475
      Height = 67
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object CheckBox1: TUniCheckBox
        Left = 26
        Top = 16
        Width = 265
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Calculate forecast based on Sales Analysis'
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object CheckBox2: TUniCheckBox
        Left = 26
        Top = 40
        Width = 297
        Height = 17
        Hint = ''
        Caption = 'Calculate forecast based on Production'
        TabOrder = 1
        OnClick = CheckBox2Click
      end
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'CheckBox1'
      'CheckBox2'
      'BtnYes'
      'BtnNo')
    SecurityCode = 'FRMBUDGETCONFIRM'
    Left = 24
    Top = 144
  end
end
