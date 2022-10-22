inherited FrmInactiveInventoryItemException: TFrmInactiveInventoryItemException
  Left = 175
  Top = 184
  ClientWidth = 372
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 372
    Height = 125
    ExplicitWidth = 372
    ExplicitHeight = 125
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 364
      ExplicitHeight = 97
      inherited Label1: TUniLabel
        Width = 33
        Caption = 'Item #'
        ExplicitWidth = 33
      end
      inherited Label3: TUniLabel
        Width = 53
        Caption = 'Description'
        ExplicitWidth = 53
      end
      inherited DBEdit1: TUniDBEdit
        Left = 67
        Width = 291
        DataField = 'ITEMNO'
        Anchors = [akLeft, akTop, akRight]
        ExplicitLeft = 67
        ExplicitWidth = 291
      end
      inherited DBEdit2: TUniDBEdit
        Left = 67
        Width = 291
        DataField = 'DESCRIP'
        Anchors = [akLeft, akTop, akRight]
        ExplicitLeft = 67
        ExplicitWidth = 291
      end
      inherited DBEdit3: TUniDBEdit
        Left = 67
        Width = 291
        Anchors = [akLeft, akTop, akRight]
        ExplicitLeft = 67
        ExplicitWidth = 291
      end
    end
  end
  inherited Panel1: TUniPanel
    Top = 125
    Width = 372
    Height = 38
    ExplicitTop = 125
    ExplicitWidth = 372
    ExplicitHeight = 38
    inherited Panel2: TUniPanel
      Left = 165
      Height = 36
      ExplicitLeft = 165
      ExplicitHeight = 36
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select itemno,'
      '       descrip,'
      '       '#39'Inactive'#39' as status_id'
      '  from arinvt'
      ' where id = :id')
  end
  inherited SR: TIQWebSecurityRegister
    SecurityCode = 'FRMINACTIVEINVENTORYITEMEXCEPTION'
  end
end
