object FrmAffectSO: TFrmAffectSO
  Left = 372
  Top = 220
  ClientHeight = 119
  ClientWidth = 288
  Caption = 'Confirm'
  OnShow = FormShow
  BorderStyle = bsDialog
  FormStyle = fsStayOnTop
  Position = poDesktopCenter
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 32
    Top = 32
    Width = 164
    Height = 13
    Hint = ''
    Caption = 'Affect Sales order based on RMA?'
    TabOrder = 1
  end
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 78
    Width = 288
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Tag = 1999
      Left = 77
      Top = 1
      Width = 211
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnYes: TUniButton
        Left = 5
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Yes'
        ModalResult = 6
        TabOrder = 1
      end
      object BtnNo: TUniButton
        Left = 109
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'No'
        ModalResult = 7
        TabOrder = 2
      end
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMAFFECTSO')
    SecurityItems.Strings = (
      'BtnYes')
    SecurityCode = 'FRMAFFECTSO'
    Left = 16
  end
end
