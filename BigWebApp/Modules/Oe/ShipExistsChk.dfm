inherited FrmShipExistsException: TFrmShipExistsException
  ClientHeight = 179
  ClientWidth = 432
  Caption = '"Ship To" Change Authorization Required'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 432
    Height = 141
    ExplicitWidth = 432
    ExplicitHeight = 141
    inherited TabSheet1: TUniTabSheet
      ExplicitWidth = 424
      ExplicitHeight = 113
      object Label4: TUniLabel [3]
        Left = 81
        Top = 83
        Width = 297
        Height = 13
        Hint = ''
        Caption = 'Note: it is strongly advised to Cancel for EDI controlled orders'
        TabOrder = 6
      end
      inherited DBEdit1: TUniDBEdit
        Left = 80
        Width = 339
        Anchors = [akLeft, akTop, akRight]
        ExplicitLeft = 80
        ExplicitWidth = 339
      end
      inherited DBEdit2: TUniDBEdit
        Left = 80
        Width = 339
        Anchors = [akLeft, akTop, akRight]
        ExplicitLeft = 80
        ExplicitWidth = 339
      end
      inherited DBEdit3: TUniDBEdit
        Left = 80
        Width = 339
        Anchors = [akLeft, akTop, akRight]
        ExplicitLeft = 80
        ExplicitWidth = 339
      end
    end
  end
  inherited Panel1: TUniPanel
    Top = 141
    Width = 432
    Height = 38
    ExplicitTop = 141
    ExplicitWidth = 432
    ExplicitHeight = 38
    inherited Panel2: TUniPanel
      Left = 223
      Width = 209
      Height = 36
      ExplicitLeft = 223
      ExplicitWidth = 209
      ExplicitHeight = 36
      inherited btnCancel: TUniButton
        Left = 107
        ExplicitLeft = 107
      end
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select a.custno, '
      '       a.company,'
      
        '       '#39'SO '#39' || o.orderno || '#39' has shipments against it'#39' as stat' +
        'us_id'
      '  from orders o, arcusto a'
      ' where o.id = :id'
      '   and o.arcusto_id = a.id(+)'
      '')
  end
  inherited SR: TIQWebSecurityRegister
    SecurityCode = 'FRMSHIPEXISTSEXCEPTION'
  end
end
