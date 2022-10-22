inherited FrmSecuredConfirmReleaseDatesPast: TFrmSecuredConfirmReleaseDatesPast
  ClientHeight = 121
  OnCreate = FormCreate
  ExplicitHeight = 150
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Top = 77
    ExplicitTop = 77
    inherited btnYes: TUniButton
      Left = 203
      Top = 10
      ExplicitLeft = 203
      ExplicitTop = 10
    end
    inherited btnNo: TUniButton
      Left = 307
      Top = 10
      ExplicitLeft = 307
      ExplicitTop = 10
    end
    inherited btnCancel: TUniButton
      Left = 411
      Top = 10
      Visible = False
      ExplicitLeft = 411
      ExplicitTop = 10
    end
  end
  inherited Panel2: TUniPanel
    Height = 77
    ExplicitHeight = 77
    inherited Panel3: TUniPanel
      Height = 75
      ExplicitHeight = 75
    end
    inherited Panel4: TUniPanel
      Height = 75
      ExplicitHeight = 75
      inherited lblConfirmationText: TUniLabel
        Width = 293
        Height = 39
        Caption = 
          'The requested date and/or promised date occurs in the past.'#13#13' Ar' +
          'e you sure you want to continue?'
        ExplicitWidth = 293
        ExplicitHeight = 39
      end
      inherited Bevel3: TUniPanel
        Top = 60
        ExplicitTop = 60
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    SecurityCode = 'FRMSECUREDCONFIRMRELEASEDATESPAST'
    Left = 16
    Top = 86
  end
end
