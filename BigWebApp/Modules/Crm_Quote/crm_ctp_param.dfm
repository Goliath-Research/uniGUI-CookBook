inherited FrmCRM_CTP_Params: TFrmCRM_CTP_Params
  ClientHeight = 133
  ExplicitHeight = 162
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TUniPanel
    Height = 86
    TabOrder = 5
    ExplicitHeight = 86
  end
  inherited Label1: TUniLabel
    TabOrder = 6
  end
  inherited btnOK: TUniButton
    Left = 115
    Top = 101
    TabOrder = 3
    ExplicitLeft = 115
    ExplicitTop = 101
  end
  inherited btnCancel: TUniButton
    Left = 203
    Top = 101
    TabOrder = 4
    ExplicitLeft = 203
    ExplicitTop = 101
  end
  inherited DBEdit1: TUniDBEdit
    TabOrder = 0
  end
  inherited DBCheckBox1: TUniDBCheckBox
    Top = 68
    TabOrder = 2
    ExplicitTop = 68
  end
  object dbchkIncludeShipTime: TUniDBCheckBox [6]
    Left = 24
    Top = 47
    Width = 209
    Height = 17
    Hint = ''
    DataField = 'CTP_INCLUDE_SHIP_TIME'
    DataSource = DataSource1
    ValueChecked = 'Y'
    ValueUnchecked = 'N'
    Caption = 'Include ship time in CTP calculation'
    TabOrder = 1
  end
  inherited DataSource1: TDataSource
    Left = 8
    Top = 100
  end
  inherited Table1: TFDTable
    Left = 40
    Top = 100
  end
end
