inherited FrmWorkorderInJobshopException: TFrmWorkorderInJobshopException
  ClientHeight = 156
  ClientWidth = 372
  ExplicitWidth = 378
  ExplicitHeight = 184
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 372
    Height = 113
    ExplicitWidth = 372
    ExplicitHeight = 113
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 364
      ExplicitHeight = 85
      inherited Label1: TUniLabel
        Width = 67
        Caption = 'Work Order #'
        ExplicitWidth = 67
      end
      inherited Label3: TUniLabel
        Width = 88
        Caption = 'Jobshop Project #'
        ExplicitWidth = 88
      end
      inherited DBEdit1: TUniDBEdit
        Left = 105
        Width = 249
        DataField = 'WORKORDER_ID'
        ExplicitLeft = 105
        ExplicitWidth = 249
      end
      inherited DBEdit2: TUniDBEdit
        Left = 105
        Width = 249
        DataField = 'PROJECTNO'
        ExplicitLeft = 105
        ExplicitWidth = 249
      end
      inherited DBEdit3: TUniDBEdit
        Left = 105
        Width = 249
        ExplicitLeft = 105
        ExplicitWidth = 249
      end
    end
  end
  inherited Panel1: TUniPanel
    Top = 113
    Width = 372
    ExplicitTop = 113
    ExplicitWidth = 372
    inherited Panel2: TUniPanel
      Left = 165
      ExplicitLeft = 165
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select j.workorder_id, '
      '       j.projectno,'
      '       '#39'WO is attached to a Jobshop Project'#39' as status_id'
      '  from jobshop_rfq j'
      ' where j.workorder_id = :id'
      '')
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmWorkorderInJobshopException')
    SecurityCode = 'FRMWORKORDERINJOBSHOPEXCEPTION'
  end
end
