inherited FrmSecuredConfirmRevertNewDocNotApproved: TFrmSecuredConfirmRevertNewDocNotApproved
  OnCreate = FormCreate
  ExplicitWidth = 426
  ExplicitHeight = 140
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    inherited btnYes: TUniButton
      Left = 202
      Top = 10
      ExplicitLeft = 202
      ExplicitTop = 10
    end
    inherited btnNo: TUniButton
      Left = 312
      Top = 10
      ExplicitLeft = 312
      ExplicitTop = 10
    end
    inherited btnCancel: TUniButton
      Left = 416
      Top = 10
      Visible = False
      ExplicitLeft = 416
      ExplicitTop = 10
    end
  end
  inherited Panel2: TUniPanel
    inherited Panel4: TUniPanel
      inherited lblConfirmationText: TUniLabel
        Width = 329
        Caption = 
          'This document has not yet been approved, do you wish to continue' +
          '?'
        ExplicitWidth = 329
      end
    end
  end
end
