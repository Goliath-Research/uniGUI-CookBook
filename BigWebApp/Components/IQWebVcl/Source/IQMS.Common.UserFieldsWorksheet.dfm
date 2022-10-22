inherited FrmUsrFldsWS: TFrmUsrFldsWS
  ExplicitWidth = 409
  ExplicitHeight = 499
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCarrier: TUniPanel
    inherited ScrollBox1: TUniScrollBox
      ScrollHeight = 41
      inherited pgctrlMain: TUniPageControl
        Height = 371
        ExplicitHeight = 371
        inherited TabSheet1: TUniTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 383
          ExplicitHeight = 343
        end
      end
      object pnlBottomButtons: TUniPanel
        Left = 0
        Top = 371
        Width = 391
        Height = 41
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object Panel1: TUniPanel
          Left = 166
          Top = 1
          Width = 225
          Height = 39
          Hint = ''
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object btnOK: TUniButton
            Left = 4
            Top = 7
            Width = 97
            Height = 25
            Hint = ''
            Caption = 'OK'
            TabOrder = 1
            OnClick = btnOKClick
          end
          object btnCancel: TUniButton
            Left = 114
            Top = 7
            Width = 97
            Height = 25
            Hint = ''
            Caption = 'Cancel'
            ModalResult = 2
            TabOrder = 2
          end
        end
      end
    end
  end
end
