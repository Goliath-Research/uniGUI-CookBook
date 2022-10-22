inherited FrmCar_Eco_ExistsException: TFrmCar_Eco_ExistsException
  ClientHeight = 273
  ClientWidth = 489
  ExplicitWidth = 495
  ExplicitHeight = 302
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 489
    Height = 236
    ExplicitWidth = 489
    ExplicitHeight = 236
    inherited TabSheet1: TUniTabSheet
      ExplicitWidth = 481
      ExplicitHeight = 208
      DesignSize = (
        481
        208)
      inherited Label1: TUniLabel
        Left = 8
        Top = 59
        Width = 81
        Caption = 'Open CAR/CAPA'
        TabOrder = 8
        ExplicitLeft = 8
        ExplicitTop = 59
        ExplicitWidth = 81
      end
      inherited Label3: TUniLabel
        Left = 8
        Top = 83
        Width = 50
        Caption = 'Open ECO'
        TabOrder = 9
        ExplicitLeft = 8
        ExplicitTop = 83
        ExplicitWidth = 50
      end
      inherited Label2: TUniLabel
        Left = 8
        Top = 179
        TabOrder = 10
        ExplicitLeft = 8
        ExplicitTop = 179
      end
      object Label4: TUniLabel [3]
        Left = 8
        Top = 107
        Width = 50
        Height = 13
        Hint = ''
        Caption = 'Open MRB'
        TabOrder = 11
      end
      object Label5: TUniLabel [4]
        Left = 8
        Top = 131
        Width = 74
        Height = 13
        Hint = ''
        Caption = 'Open Deviation'
        TabOrder = 12
      end
      object Label6: TUniLabel [5]
        Left = 8
        Top = 155
        Width = 112
        Height = 13
        Hint = ''
        Caption = 'Open PPAP/Product PQ'
        TabOrder = 13
      end
      object lblItemNo: TUniLabel [6]
        Left = 8
        Top = 11
        Width = 33
        Height = 13
        Hint = ''
        Caption = 'Item #'
        TabOrder = 14
      end
      object Label7: TUniLabel [7]
        Left = 8
        Top = 35
        Width = 78
        Height = 13
        Hint = ''
        Caption = 'Item Description'
        TabOrder = 15
      end
      inherited DBEdit1: TUniDBEdit
        Left = 160
        Top = 56
        Width = 90
        DataField = 'CAR_Count'
        TabStop = False
        ExplicitLeft = 160
        ExplicitTop = 56
        ExplicitWidth = 90
      end
      inherited DBEdit2: TUniDBEdit
        Left = 160
        Top = 80
        Width = 90
        DataField = 'ECO_Count'
        TabStop = False
        ExplicitLeft = 160
        ExplicitTop = 80
        ExplicitWidth = 90
      end
      inherited DBEdit3: TUniDBEdit
        Left = 160
        Top = 176
        Width = 305
        Anchors = [akLeft, akTop, akRight]
        TabStop = False
        ExplicitLeft = 160
        ExplicitTop = 176
        ExplicitWidth = 305
      end
      object DBEdit4: TUniDBEdit
        Left = 160
        Top = 104
        Width = 90
        Height = 19
        Hint = ''
        DataField = 'MRB_Count'
        DataSource = DataSource1
        TabOrder = 3
        TabStop = False
      end
      object DBEdit5: TUniDBEdit
        Left = 160
        Top = 128
        Width = 90
        Height = 19
        Hint = ''
        DataField = 'DEV_Count'
        DataSource = DataSource1
        TabOrder = 4
        TabStop = False
      end
      object DBEdit6: TUniDBEdit
        Left = 160
        Top = 152
        Width = 90
        Height = 19
        Hint = ''
        DataField = 'PPAP_Count'
        DataSource = DataSource1
        TabOrder = 5
        TabStop = False
      end
      object dbeItemDescrip: TUniDBEdit
        Left = 160
        Top = 31
        Width = 305
        Height = 19
        Hint = ''
        DataField = 'ArinvtDescrip'
        DataSource = DataSource1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
        TabStop = False
      end
      object dbeItemno: TUniDBEdit
        Left = 160
        Top = 8
        Width = 305
        Height = 19
        Hint = ''
        DataField = 'ArinvtItemno'
        DataSource = DataSource1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 7
        TabStop = False
      end
    end
  end
  inherited Panel1: TUniPanel
    Top = 236
    Width = 489
    Height = 37
    ExplicitTop = 236
    ExplicitWidth = 489
    ExplicitHeight = 37
    inherited CheckBox: TUniCheckBox
      Visible = True
    end
    inherited Panel2: TUniPanel
      Left = 183
      Width = 306
      Height = 35
      ExplicitLeft = 183
      ExplicitWidth = 306
      ExplicitHeight = 35
      inherited btnOK: TUniButton
        Left = 102
        ExplicitLeft = 102
      end
      inherited btnCancel: TUniButton
        Left = 204
        ExplicitLeft = 204
      end
      object btnDetails: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'View Details'
        TabOrder = 3
        OnClick = btnDetailsClick
      end
    end
  end
  inherited Query1: TFDQuery
    OnCalcFields = Query1CalcFields
    SQL.Strings = (
      'select '#39'Open Quality Modules Found'#39' as status_id'
      '  from dual'
      ' where :id = 1'
      ' '
      ' '
      ''
      ' ')
    Left = 319
    Top = 113
    object Query1STATUS_ID: TStringField
      FieldName = 'STATUS_ID'
      FixedChar = True
      Size = 26
    end
    object Query1CAR_Count: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CAR_Count'
      Calculated = True
    end
    object Query1ECO_Count: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ECO_Count'
      Calculated = True
    end
    object Query1MRB_Count: TFloatField
      FieldKind = fkCalculated
      FieldName = 'MRB_Count'
      Calculated = True
    end
    object Query1DEV_Count: TFloatField
      FieldKind = fkCalculated
      FieldName = 'DEV_Count'
      Calculated = True
    end
    object Query1PPAP_Count: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PPAP_Count'
      Calculated = True
    end
    object Query1ArinvtItemno: TStringField
      FieldKind = fkCalculated
      FieldName = 'ArinvtItemno'
      Size = 50
      Calculated = True
    end
    object Query1ArinvtDescrip: TStringField
      FieldKind = fkCalculated
      FieldName = 'ArinvtDescrip'
      Size = 100
      Calculated = True
    end
  end
  inherited SR: TIQWebSecurityRegister
    Left = 376
    Top = 104
  end
end
