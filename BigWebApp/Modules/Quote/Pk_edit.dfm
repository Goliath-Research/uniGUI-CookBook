inherited PackEdit: TPackEdit
  ClientHeight = 292
  Caption = 'Edit Attached Packaging'
  ExplicitHeight = 331
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    Height = 292
    ExplicitHeight = 292
    inherited Splitter1: TUniSplitter
      Left = 132
      Height = 290
      ExplicitLeft = 132
      ExplicitHeight = 290
    end
    inherited PnlLeft: TUniPanel
      Width = 131
      Height = 290
      ExplicitWidth = 131
      ExplicitHeight = 290
      inherited Label6: TUniLabel
        Width = 94
        Caption = 'Items per Packages'
        ExplicitWidth = 94
      end
      inherited lblSPG: TUniLabel
        Top = 236
        ExplicitTop = 236
      end
      inherited lblGauge: TUniLabel
        Top = 260
        ExplicitTop = 260
      end
      object Label8: TUniLabel
        Left = 4
        Top = 212
        Width = 34
        Height = 13
        Hint = ''
        Caption = 'Weight'
        TabOrder = 10
      end
    end
    inherited PnlClient: TUniPanel
      Left = 138
      Width = 229
      Height = 290
      ExplicitLeft = 138
      ExplicitWidth = 229
      ExplicitHeight = 290
      DesignSize = (
        229
        290)
      inherited EditITEMNO: TUniDBEdit
        Width = 209
        ExplicitWidth = 209
      end
      inherited EditREV: TUniDBEdit
        Width = 209
        ExplicitWidth = 209
      end
      inherited EditDESCRIP: TUniDBEdit
        Width = 209
        ExplicitWidth = 209
      end
      inherited dbeDescrip2: TUniDBEdit
        Width = 209
        ExplicitWidth = 209
      end
      inherited dbeSPG: TUniDBEdit
        Top = 235
        ExplicitTop = 235
      end
      inherited chkRFQRequired: TUniCheckBox
        Width = 208
        ExplicitWidth = 208
      end
      inherited dbeGauge: TUniDBEdit
        Top = 259
        TabOrder = 11
        ExplicitTop = 259
      end
      object dbePacLbs: TUniDBEdit
        Left = 0
        Top = 210
        Width = 88
        Height = 21
        Hint = ''
        DataField = 'PACLBS'
        DataSource = DataSource1
        TabOrder = 9
      end
    end
    inherited PnlButtons: TUniPanel
      Left = 367
      Width = 116
      Height = 290
      ExplicitLeft = 367
      ExplicitWidth = 116
      ExplicitHeight = 290
      inherited BitBtnOK: TUniBitBtn
        Left = 10
        ExplicitLeft = 10
      end
      inherited BitBtn3: TUniBitBtn
        Left = 10
        ExplicitLeft = 10
      end
    end
  end
end
