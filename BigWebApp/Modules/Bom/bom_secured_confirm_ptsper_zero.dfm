inherited FrmBOMSecuredConfirmPtsPerZero: TFrmBOMSecuredConfirmPtsPerZero
  ClientWidth = 423
  OnCreate = FormCreate
  ExplicitWidth = 429
  ExplicitHeight = 139
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 423
    ExplicitWidth = 423
    inherited Bevel1: TUniPanel
      Width = 421
      ExplicitWidth = 421
    end
    inherited btnYes: TUniButton
      Left = 204
      Top = 10
      ExplicitLeft = 201
      ExplicitTop = 10
    end
    inherited btnNo: TUniButton
      Left = 312
      Top = 10
      ExplicitLeft = 309
      ExplicitTop = 10
    end
    inherited btnCancel: TUniButton
      Left = 416
      Top = 10
      Visible = False
      ExplicitLeft = 413
      ExplicitTop = 10
    end
  end
  inherited Panel2: TUniPanel
    Width = 423
    ExplicitWidth = 423
    inherited Panel4: TUniPanel
      Width = 369
      ExplicitWidth = 369
      inherited lblConfirmationText: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 20
        Width = 37
        Margins.Right = 15
        Caption = 'Confirm'
        ExplicitLeft = 3
        ExplicitTop = 20
        ExplicitWidth = 37
      end
      inherited Bevel2: TUniPanel
        Width = 367
        ExplicitWidth = 367
      end
      inherited Bevel3: TUniPanel
        Width = 367
        ExplicitWidth = 367
      end
    end
  end
end
