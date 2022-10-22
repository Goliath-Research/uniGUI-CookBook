inherited FrmConvertProspectDlg: TFrmConvertProspectDlg
  Left = 356
  Top = 236
  ClientHeight = 131
  ClientWidth = 428
  OldCreateOrder = True
  ExplicitWidth = 444
  ExplicitHeight = 170
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 428
    Height = 91
    ExplicitWidth = 428
    ExplicitHeight = 91
    object lblPrompt: TUniLabel
      Left = 8
      Top = 8
      Width = 422
      Height = 41
      Hint = ''
      AutoSize = False
      Caption = 
        'This Customer is a CRM Prospect, and is currently inaccessible i' +
        'n EnterpriseIQ.  Before a Sales Order can be created, this Prosp' +
        'ect must be converted to a standard Customer.'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object Label1: TUniLabel
      Left = 8
      Top = 56
      Width = 326
      Height = 13
      Hint = ''
      Caption = 'Do you want to convert this CRM Prospect to a standard Customer?'
      TabOrder = 3
    end
  end
  inherited Panel2: TUniPanel
    Top = 91
    Width = 428
    Height = 40
    ExplicitTop = 91
    ExplicitWidth = 428
    ExplicitHeight = 40
    inherited Bevel1: TUniPanel
      Width = 426
      ExplicitWidth = 426
    end
    object Panel3: TUniPanel
      Left = 228
      Top = 6
      Width = 199
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object btnYes: TUniBitBtn
        Left = 4
        Top = 3
        Width = 91
        Height = 25
        Hint = ''
        Caption = 'Yes'
        ModalResult = 1
        TabOrder = 0
      end
      object btnNo: TUniBitBtn
        Left = 100
        Top = 3
        Width = 91
        Height = 25
        Hint = ''
        Caption = 'No'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmConvertProspectDlg'
      'btnNo')
    SecurityItems.Strings = (
      'CheckBox'
      'btnYes'
      'btnNo')
    SecurityCode = 'FRMCONVERTPROSPECTDLG'
    Left = 141
    Top = 59
  end
end
