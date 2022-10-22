object FrmMfg_Add: TFrmMfg_Add
  Left = 326
  Top = 260
  ClientHeight = 169
  ClientWidth = 331
  Caption = 'Select Mfg Type'
  OnShow = UniFormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 0
    Width = 331
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 128
    Width = 331
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 149
      Top = 1
      Width = 182
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 5
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 96
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object PageControl1: TUniPageControl
    Left = 0
    Top = 3
    Width = 331
    Height = 125
    Hint = ''
    ActivePage = TabSheet2
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object TabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'Predefined'
      object Label2: TUniLabel
        Left = 7
        Top = 13
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'Mfg Type'
        TabOrder = 1
      end
      object wwDBComboBoxPredefined: TUniComboBox
        Left = 72
        Top = 9
        Width = 239
        Height = 21
        Hint = ''
        Style = csDropDownList
        Text = ''
        TabOrder = 0
      end
    end
    object TabSheet2: TUniTabSheet
      Hint = ''
      ImageIndex = 1
      Caption = 'User Defined'
      object Label1: TUniLabel
        Left = 7
        Top = 13
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'Mfg Type'
        TabOrder = 2
      end
      object Label13: TUniLabel
        Left = 7
        Top = 39
        Width = 50
        Height = 13
        Hint = ''
        Caption = 'Default To'
        TabOrder = 3
      end
      object edUDMfgType: TUniEdit
        Left = 72
        Top = 9
        Width = 239
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 0
      end
      object wwDBComboBoxDefaultTo: TUniComboBox
        Left = 72
        Top = 35
        Width = 239
        Height = 21
        Hint = ''
        Style = csDropDownList
        Text = ''
        TabOrder = 1
      end
    end
  end
end
