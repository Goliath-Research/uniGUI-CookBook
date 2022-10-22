object FrmWorkCenterConfirmCenterTypeChange: TFrmWorkCenterConfirmCenterTypeChange
  Left = 318
  Top = 248
  ClientHeight = 124
  ClientWidth = 404
  Caption = 'Confirm Center Type change'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 297
    Height = 124
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 1
      Width = 295
      Height = 122
      Hint = ''
      Caption = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 2
      object Label1: TUniLabel
        Left = 13
        Top = 21
        Width = 72
        Height = 13
        Hint = ''
        Caption = 'Affected BOMs'
        TabOrder = 4
      end
      object Label2: TUniLabel
        Left = 13
        Top = 47
        Width = 93
        Height = 13
        Hint = ''
        Caption = 'Affected Processes'
        TabOrder = 5
      end
      object edBOMsCount: TUniEdit
        Left = 127
        Top = 17
        Width = 121
        Height = 21
        Hint = ''
        Text = '0'
        TabOrder = 0
        ReadOnly = True
      end
      object edProcCount: TUniEdit
        Left = 127
        Top = 43
        Width = 121
        Height = 21
        Hint = ''
        Text = '0'
        TabOrder = 1
        ReadOnly = True
      end
      object chkUpdateAffected: TUniCheckBox
        Left = 13
        Top = 80
        Width = 228
        Height = 17
        Hint = ''
        Caption = 'Update all affected BOMs and Processes'
        TabOrder = 2
      end
    end
  end
  object Panel2: TUniPanel
    Left = 297
    Top = 0
    Width = 107
    Height = 124
    Hint = ''
    Align = alRight
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object btnOK: TUniButton
      Left = 4
      Top = 10
      Width = 97
      Height = 25
      Hint = ''
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 1
    end
    object btnAbort: TUniButton
      Left = 4
      Top = 43
      Width = 97
      Height = 25
      Hint = ''
      Caption = 'Abort'
      ModalResult = 3
      TabOrder = 2
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmWorkCenterConfirmCenterTypeChange')
    SecurityItems.Strings = (
      'btnOK'
      'chkUpdateAffected')
    SecurityCode = 'FRM_WC_CONF_CNTR_TYPE_CHANGE'
    Left = 317
    Top = 85
  end
end
