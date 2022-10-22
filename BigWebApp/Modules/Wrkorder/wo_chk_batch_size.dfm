inherited FrmWorkorderBatchSizeException: TFrmWorkorderBatchSizeException
  BorderStyle = bsSizeToolWin
  ClientHeight = 201
  ClientWidth = 408
  ExplicitWidth = 424
  ExplicitHeight = 235
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 408
    Height = 158
    ExplicitWidth = 408
    ExplicitHeight = 158
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      inherited Label1: TUniLabel
        Width = 67
        Caption = 'Work Order #'
        ExplicitWidth = 67
      end
      inherited Label3: TUniLabel
        Top = 32
        Width = 33
        Caption = 'BOM #'
        ExplicitTop = 32
        ExplicitWidth = 33
      end
      inherited Label2: TUniLabel
        Top = 101
        ExplicitTop = 101
      end
      object Label4: TUniLabel [3]
        Left = 4
        Top = 55
        Width = 77
        Height = 13
        Caption = 'Work Order Qty'
      end
      object Label5: TUniLabel [4]
        Left = 4
        Top = 78
        Width = 93
        Height = 13
        Caption = 'Max WO Batch Size'
      end
      inherited DBEdit1: TUniDBEdit
        Left = 114
        Top = 7
        Width = 275
        DataField = 'ID'
        ExplicitLeft = 114
        ExplicitTop = 7
        ExplicitWidth = 275
      end
      inherited DBEdit2: TUniDBEdit
        Left = 114
        Top = 30
        Width = 275
        DataField = 'MFGNO'
        ExplicitLeft = 114
        ExplicitTop = 30
        ExplicitWidth = 275
      end
      inherited DBEdit3: TUniDBEdit
        Left = 114
        Top = 99
        Width = 275
        ExplicitLeft = 114
        ExplicitTop = 99
        ExplicitWidth = 275
      end
      object DBEdit4: TUniDBEdit
        Left = 114
        Top = 53
        Width = 275
        Height = 19
        DataField = 'QUAN'
        DataSource = DataSource1
        TabOrder = 3
      end
      object DBEdit5: TUniDBEdit
        Left = 114
        Top = 76
        Width = 275
        Height = 19
        DataField = 'BATCH_SIZE'
        DataSource = DataSource1
        TabOrder = 4
      end
    end
  end
  inherited Panel1: TUniPanel
    Top = 158
    Width = 408
    ExplicitTop = 158
    ExplicitWidth = 408
    inherited Panel2: TUniPanel
      Left = 201
      ExplicitLeft = 201
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select w.id, '
      '       s.mfgno,'
      '       s.batch_size,'
      '       :quan as quan,'
      '       '#39'Max WO Batch Size Exceeded'#39' as status_id'
      '  from workorder w, standard s'
      ' where w.id = :id'
      '   and w.standard_id = s.id(+)'
      '')
    ParamData = <
      item
        Name = 'quan'
        DataType = ftFloat
      end
      item
        Name = 'id'
        DataType = ftFloat
      end>
  end
  inherited SR: TIQWebSecurityRegister
    SecurityCode = 'FRMWORKORDERBATCHSIZEEXCEPTION'
  end
end
