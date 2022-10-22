inherited FrmNegativeOnHandTransException: TFrmNegativeOnHandTransException
  Left = 112
  Top = 193
  ClientWidth = 388
  ExplicitWidth = 394
  ExplicitHeight = 192
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 388
    ExplicitWidth = 388
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 380
      ExplicitHeight = 92
      inherited Label1: TUniLabel
        Width = 33
        Caption = 'Item #'
        ExplicitWidth = 33
      end
      inherited Label3: TUniLabel
        Width = 82
        Caption = 'Location OnHand'
        ExplicitWidth = 82
      end
      inherited DBEdit1: TUniDBEdit
        Left = 121
        Width = 252
        DataField = 'ITEMNO'
        ExplicitLeft = 121
        ExplicitWidth = 252
      end
      inherited DBEdit2: TUniDBEdit
        Left = 121
        Width = 252
        DataField = 'ONHAND'
        ExplicitLeft = 121
        ExplicitWidth = 252
      end
      inherited DBEdit3: TUniDBEdit
        Left = 121
        Width = 252
        ExplicitLeft = 121
        ExplicitWidth = 252
      end
    end
  end
  inherited Panel1: TUniPanel
    Width = 388
    ExplicitWidth = 388
    inherited Panel2: TUniPanel
      Left = 181
      ExplicitLeft = 181
    end
  end
  inherited Query1: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.itemno,'
      '       f.onhand,'
      
        '       '#39'Transaction drives inventory location negative'#39' as statu' +
        's_id'
      '  from fgmulti f, arinvt a'
      ' where f.id = :id'
      '   and f.arinvt_id = a.id')
    Left = 231
    Top = 1
  end
  inherited DataSource1: TDataSource
    Left = 288
    Top = 8
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMNEGATIVEONHANDTRANSEXCEPTION')
    SecurityCode = 'FRMNEGATIVEONHANDTRANSEXCEPTION'
  end
end
