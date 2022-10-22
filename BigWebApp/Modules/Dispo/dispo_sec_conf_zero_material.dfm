inherited FrmDispoSecConfZeroMaterial: TFrmDispoSecConfZeroMaterial
  ClientHeight = 148
  OnCreate = FormCreate
  ExplicitHeight = 177
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Top = 104
    ExplicitTop = 104
    inherited btnYes: TUniButton
      Left = 206
      Top = 9
      ExplicitLeft = 206
      ExplicitTop = 9
    end
    inherited btnNo: TUniButton
      Left = 310
      Top = 9
      ExplicitLeft = 310
      ExplicitTop = 9
    end
    inherited btnCancel: TUniButton
      Left = 414
      Top = 9
      Visible = False
      ExplicitLeft = 414
      ExplicitTop = 9
    end
  end
  inherited Panel2: TUniPanel
    Height = 104
    ExplicitHeight = 104
    inherited Panel3: TUniPanel
      Height = 102
      ExplicitHeight = 102
    end
    inherited Panel4: TUniPanel
      Height = 102
      ExplicitHeight = 102
      inherited lblConfirmationText: TUniLabel
        Width = 755
        Height = 39
        Caption = 
          'Disposition of zero quantity will not affect inventory. PIT will' +
          ' credit at Standard. Delete item entirely from Materials Involve' +
          'd in order for PIT to post variance.'#13#13'Are you sure you want to c' +
          'ontinue?'
        ExplicitWidth = 755
        ExplicitHeight = 39
      end
      inherited Bevel3: TUniPanel
        Top = 87
        ExplicitTop = 87
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmDispoSecConfZeroMaterial')
    SecurityCode = 'FRMDISPOSECCONFZEROMATERIAL'
  end
end
