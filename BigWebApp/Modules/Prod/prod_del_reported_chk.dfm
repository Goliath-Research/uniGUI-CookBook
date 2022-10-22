inherited FrmDeleteReportedProdDispoException: TFrmDeleteReportedProdDispoException
  Left = 117
  ClientHeight = 234
  ClientWidth = 391
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 391
    Height = 191
    ExplicitWidth = 391
    ExplicitHeight = 191
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 383
      ExplicitHeight = 163
      inherited Label1: TUniLabel
        Width = 48
        Caption = 'Prod Date'
        TabOrder = 7
        ExplicitWidth = 48
      end
      inherited Label3: TUniLabel
        Top = 31
        Width = 22
        Caption = 'Shift'
        TabOrder = 8
        ExplicitTop = 31
        ExplicitWidth = 22
      end
      inherited Label2: TUniLabel
        Top = 141
        TabOrder = 9
        ExplicitTop = 141
      end
      object Label4: TUniLabel [3]
        Left = 4
        Top = 53
        Width = 61
        Height = 13
        Hint = ''
        Caption = 'Work Center'
        TabOrder = 10
      end
      object Label5: TUniLabel [4]
        Left = 4
        Top = 75
        Width = 53
        Height = 13
        Hint = ''
        Caption = 'Description'
        TabOrder = 11
      end
      object Label6: TUniLabel [5]
        Left = 4
        Top = 97
        Width = 29
        Height = 13
        Hint = ''
        Caption = 'Mfg #'
        TabOrder = 12
      end
      object Label7: TUniLabel [6]
        Left = 4
        Top = 119
        Width = 29
        Height = 13
        Hint = ''
        Caption = 'WO #'
        TabOrder = 13
      end
      inherited DBEdit1: TUniDBEdit
        Left = 83
        Width = 291
        DataField = 'PROD_DATE'
        ExplicitLeft = 83
        ExplicitWidth = 291
      end
      inherited DBEdit2: TUniDBEdit
        Left = 83
        Top = 28
        Width = 291
        DataField = 'SHIFT'
        ExplicitLeft = 83
        ExplicitTop = 28
        ExplicitWidth = 291
      end
      inherited DBEdit3: TUniDBEdit
        Left = 83
        Top = 138
        Width = 291
        ExplicitLeft = 83
        ExplicitTop = 138
        ExplicitWidth = 291
      end
      object DBEdit4: TUniDBEdit
        Left = 83
        Top = 50
        Width = 291
        Height = 19
        Hint = ''
        DataField = 'EQNO'
        DataSource = DataSource1
        TabOrder = 3
      end
      object DBEdit5: TUniDBEdit
        Left = 83
        Top = 72
        Width = 291
        Height = 19
        Hint = ''
        DataField = 'CNTR_DESC'
        DataSource = DataSource1
        TabOrder = 4
      end
      object DBEdit6: TUniDBEdit
        Left = 83
        Top = 94
        Width = 291
        Height = 19
        Hint = ''
        DataField = 'MFGNO'
        DataSource = DataSource1
        TabOrder = 5
      end
      object DBEdit7: TUniDBEdit
        Left = 83
        Top = 116
        Width = 291
        Height = 19
        Hint = ''
        DataField = 'WORKORDER_ID'
        DataSource = DataSource1
        TabOrder = 6
      end
    end
  end
  inherited Panel1: TUniPanel
    Top = 191
    Width = 391
    ExplicitTop = 191
    ExplicitWidth = 391
    inherited Panel2: TUniPanel
      Left = 184
      ExplicitLeft = 184
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select v.id,'
      '       v.prod_date,'
      '       v.shift,'
      '       v.eqno,'
      '       w.cntr_desc,'
      '       v.mfgno,'
      '       v.workorder_id,'
      
        '       '#39'Production report line has been dispositioned'#39' as status' +
        '_id'
      '  from v_dayprod v,'
      '       work_center w'
      'where v.id = :id'
      '   and v.work_center_id = w.id'
      '         '
      ' '
      ' '
      ' '
      '')
  end
  inherited SR: TIQWebSecurityRegister
    SecurityCode = 'FRMDELETEREPORTEDPRODDISPOEXCEPTION'
  end
end
