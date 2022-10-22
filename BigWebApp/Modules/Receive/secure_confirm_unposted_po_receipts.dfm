inherited FrmSecuredConfirmUnPostedPOReceipt: TFrmSecuredConfirmUnPostedPOReceipt
  ClientHeight = 201
  OnCreate = FormCreate
  ExplicitHeight = 230
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Top = 157
    ExplicitTop = 157
    inherited btnYes: TUniButton
      Left = 207
      ExplicitLeft = 207
    end
    inherited btnNo: TUniButton
      Left = 311
      ExplicitLeft = 311
    end
    inherited btnCancel: TUniButton
      Left = 415
      Visible = False
      ExplicitLeft = 415
    end
  end
  inherited Panel2: TUniPanel
    Height = 157
    ExplicitHeight = 157
    inherited Panel3: TUniPanel
      Height = 155
      ExplicitHeight = 155
      object Bevel4: TUniPanel
        Left = 1
        Top = 74
        Width = 52
        Height = 81
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 2
        Caption = ''
      end
    end
    inherited Panel4: TUniPanel
      Height = 155
      ExplicitHeight = 155
      inherited Bevel3: TUniPanel
        Top = 140
        ExplicitTop = 140
      end
    end
  end
end
