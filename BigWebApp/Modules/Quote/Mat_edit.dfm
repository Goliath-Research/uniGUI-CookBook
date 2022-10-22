inherited MatEdit: TMatEdit
  ClientHeight = 270
  ClientWidth = 484
  Caption = 'Edit Attached Material'
  ExplicitWidth = 500
  ExplicitHeight = 309
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    Width = 484
    Height = 270
    ExplicitWidth = 484
    ExplicitHeight = 239
    inherited Splitter1: TUniSplitter
      Left = 128
      Height = 270
      ExplicitLeft = 128
      ExplicitHeight = 270
    end
    inherited PnlLeft: TUniPanel
      Width = 128
      Height = 268
      ExplicitWidth = 128
      ExplicitHeight = 268
      object Label6: TUniLabel [5]
        Left = 4
        Top = 188
        Width = 86
        Height = 13
        Hint = ''
        Caption = 'Quantity per Item'
        TabOrder = 9
      end
      inherited lblSPG: TUniLabel
        Top = 212
        ExplicitTop = 212
      end
      inherited lblGauge: TUniLabel
        Top = 232
        ExplicitTop = 232
      end
    end
    inherited PnlClient: TUniPanel
      Left = 134
      Width = 246
      Height = 268
      ExplicitLeft = 134
      ExplicitWidth = 246
      ExplicitHeight = 268
      DesignSize = (
        246
        268)
      inherited LookupClass: TUniDBLookupComboBox
        Enabled = False
        Color = clBtnFace
      end
      inherited EditITEMNO: TUniDBEdit
        Width = 226
        Enabled = False
        Color = clBtnFace
        ExplicitWidth = 226
      end
      inherited EditREV: TUniDBEdit
        Width = 226
        Enabled = False
        Color = clBtnFace
        ExplicitWidth = 226
      end
      inherited EditDESCRIP: TUniDBEdit
        Width = 226
        Enabled = False
        Color = clBtnFace
        ExplicitWidth = 226
      end
      inherited dbeDescrip2: TUniDBEdit
        Width = 226
        Enabled = False
        Color = clBtnFace
        ExplicitWidth = 226
      end
      inherited dbcUNIT: TUniDBComboBox
        Enabled = False
        Color = clBtnFace
      end
      object dbePtsPer: TUniDBEdit [6]
        Left = 1
        Top = 185
        Width = 89
        Height = 21
        Hint = ''
        DataField = 'PTSPER_DISP'
        DataSource = DataSource1
        TabOrder = 8
      end
      inherited dbeSPG: TUniDBEdit
        Top = 209
        TabOrder = 10
        ExplicitTop = 209
      end
      inherited chkRFQRequired: TUniCheckBox
        Width = 238
        ExplicitWidth = 238
      end
      inherited dbeGauge: TUniDBEdit
        Top = 233
        ExplicitTop = 233
      end
    end
    inherited PnlButtons: TUniPanel
      Left = 380
      Width = 104
      Height = 268
      ExplicitLeft = 380
      ExplicitWidth = 104
      ExplicitHeight = 268
    end
  end
end
