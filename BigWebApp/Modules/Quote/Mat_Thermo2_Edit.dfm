inherited MatThermo2Edit: TMatThermo2Edit
  ClientHeight = 327
  Caption = 'MatThermo2Edit'
  ExplicitHeight = 366
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    Height = 327
    ExplicitHeight = 327
    inherited Splitter1: TUniSplitter
      Left = 128
      Height = 327
      ExplicitLeft = 128
      ExplicitHeight = 327
    end
    inherited PnlLeft: TUniPanel
      Width = 128
      Height = 325
      ExplicitWidth = 128
      ExplicitHeight = 325
      object lblSheet_Length: TUniLabel
        Left = 4
        Top = 262
        Width = 33
        Height = 13
        Hint = ''
        Caption = 'Length'
        TabOrder = 9
      end
      object lblSheet_Width: TUniLabel
        Left = 4
        Top = 238
        Width = 28
        Height = 13
        Hint = ''
        Caption = 'Width'
        TabOrder = 10
      end
    end
    inherited PnlClient: TUniPanel
      Left = 134
      Width = 213
      Height = 325
      ExplicitLeft = 134
      ExplicitWidth = 213
      ExplicitHeight = 325
      inherited EditITEMNO: TUniDBEdit
        Width = 208
        ExplicitWidth = 208
      end
      inherited EditREV: TUniDBEdit
        Width = 208
        ExplicitWidth = 208
      end
      inherited EditDESCRIP: TUniDBEdit
        Width = 208
        ExplicitWidth = 208
      end
      inherited dbeDescrip2: TUniDBEdit
        Width = 208
        ExplicitWidth = 208
      end
      inherited dbeSPG: TUniDBEdit
        TabOrder = 7
      end
      inherited chkRFQRequired: TUniCheckBox
        Width = 205
        ExplicitWidth = 205
      end
      inherited dbeGauge: TUniDBEdit
        TabOrder = 10
      end
      inherited dbchkPkHide: TUniDBCheckBox
        TabOrder = 11
      end
      object dbeWidth: TUniDBEdit
        Left = 1
        Top = 235
        Width = 88
        Height = 21
        Hint = ''
        DataField = 'WIDTH'
        DataSource = DataSource1
        TabOrder = 8
      end
      object dbeLength: TUniDBEdit
        Left = 1
        Top = 259
        Width = 88
        Height = 21
        Hint = ''
        DataField = 'LENGTH'
        DataSource = DataSource1
        TabOrder = 9
      end
    end
    inherited PnlButtons: TUniPanel
      Height = 325
      ExplicitHeight = 325
    end
  end
end
