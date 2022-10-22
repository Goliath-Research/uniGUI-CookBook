object Frm941year: TFrm941year
  Left = 41
  Top = 158
  ClientHeight = 108
  ClientWidth = 224
  Caption = 'Select year and quarter'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 7
    Top = 20
    Width = 22
    Height = 13
    Hint = ''
    Caption = 'Year'
    TabOrder = 4
  end
  object Label2: TUniLabel
    Left = 138
    Top = 20
    Width = 38
    Height = 13
    Hint = ''
    Caption = 'Quarter'
    TabOrder = 5
  end
  object Label3: TUniLabel
    Left = 10
    Top = 49
    Width = 53
    Height = 13
    Hint = ''
    Caption = 'Fed Tax ID'
    TabOrder = 6
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 78
    Width = 224
    Height = 30
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 60
      Top = 1
      Width = 164
      Height = 28
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 2
        Top = 3
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&Ok'
        TabOrder = 1
        OnClick = btnOkClick
      end
      object BtnCancel: TUniButton
        Left = 82
        Top = 3
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object dbYear: TUniDBNumberEdit
    Left = 35
    Top = 16
    Width = 83
    Height = 21
    Hint = ''
    MaxLength = 4
    TabOrder = 1
    MaxValue = 2100.000000000000000000
    MinValue = 1990.000000000000000000
    DecimalSeparator = '.'
  end
  object dbQtr: TUniDBNumberEdit
    Left = 180
    Top = 16
    Width = 33
    Height = 21
    Hint = ''
    MaxLength = 1
    TabOrder = 2
    MaxValue = 4.000000000000000000
    MinValue = 1.000000000000000000
    DecimalSeparator = '.'
  end
  object dbFed: TUniDBLookupComboBox
    Left = 71
    Top = 45
    Width = 141
    Height = 21
    Hint = ''
    ListOnlyMode = lmFollowSource
    ListField = 'DESCRIP'
    ListSource = SrcEin
    KeyField = 'ID'
    ListFieldIndex = 0
    TabOrder = 3
    Color = clWindow
  end
  object QryEin: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, descrip from ein'
      'order by descrip')
    Left = 8
    Top = 78
    object QryEinDESCRIP: TStringField
      DisplayLabel = 'Fed tax ID'
      DisplayWidth = 10
      FieldName = 'DESCRIP'
      Origin = 'IQ.EIN.DESCRIP'
      Size = 15
    end
    object QryEinID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.EIN.ID'
      Visible = False
      Size = 0
    end
  end
  object SrcEin: TDataSource
    DataSet = QryEin
    Left = 32
    Top = 80
  end
end
