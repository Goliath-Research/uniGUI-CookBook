inherited FrmSchedWorkCenterRunsBestException: TFrmSchedWorkCenterRunsBestException
  Left = 367
  Top = 209
  ClientHeight = 166
  ClientWidth = 387
  ExplicitWidth = 393
  ExplicitHeight = 195
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 387
    Height = 123
    ExplicitWidth = 387
    ExplicitHeight = 123
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 379
      ExplicitHeight = 95
      inherited Label1: TUniLabel
        Width = 67
        Caption = 'Work Order #'
        TabOrder = 6
        ExplicitWidth = 67
      end
      inherited Label3: TUniLabel
        Top = 58
        Width = 61
        Caption = 'Work Center'
        ExplicitTop = 58
        ExplicitWidth = 61
      end
      inherited Label2: TUniLabel
        Top = 83
        Width = 47
        Caption = 'Exception'
        ExplicitTop = 83
        ExplicitWidth = 47
      end
      object Label4: TUniLabel [3]
        Left = 4
        Top = 33
        Width = 80
        Height = 13
        Hint = ''
        Caption = 'Manufacturing #'
        TabOrder = 7
      end
      inherited DBEdit1: TUniDBEdit
        Left = 109
        Width = 258
        DataField = 'ID'
        ExplicitLeft = 109
        ExplicitWidth = 258
      end
      inherited DBEdit2: TUniDBEdit
        Left = 109
        Top = 55
        Width = 258
        DataField = 'EQNO'
        ExplicitLeft = 109
        ExplicitTop = 55
        ExplicitWidth = 258
      end
      inherited DBEdit3: TUniDBEdit
        Left = 109
        Top = 80
        Width = 258
        ExplicitLeft = 109
        ExplicitTop = 80
        ExplicitWidth = 258
      end
      object DBEdit4: TUniDBEdit
        Left = 109
        Top = 30
        Width = 258
        Height = 19
        Hint = ''
        DataField = 'MFGNO'
        DataSource = DataSource1
        TabOrder = 3
      end
    end
  end
  inherited Panel1: TUniPanel
    Top = 123
    Width = 387
    ExplicitTop = 123
    ExplicitWidth = 387
    inherited Panel2: TUniPanel
      Left = 175
      Width = 211
      ExplicitLeft = 175
      ExplicitWidth = 211
      inherited btnCancel: TUniButton
        Left = 107
        ExplicitLeft = 107
      end
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select wo.id,'
      '       s.mfgno,'
      '       wc.eqno,'
      
        '       '#39'Work center is not in the Runs-The-Best list'#39' as status_' +
        'id'
      '  from workorder wo,'
      '       work_center wc,'
      '       standard s'
      ' where '
      '       wo.id = :workorder_id'
      '   and wo.standard_id = s.id'
      '   '
      '   and wc.id = :work_center_id'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ParamData = <
      item
        Name = 'workorder_id'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'work_center_id'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmSchedWorkCenterRunsBestException')
    SecurityCode = 'FRMSCHEDWORKCENTERRUNSBESTEXCEPTION'
  end
end
