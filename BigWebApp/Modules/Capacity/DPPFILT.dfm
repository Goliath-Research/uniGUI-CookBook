object FrmDppFilter: TFrmDppFilter
  Left = 220
  Top = 106
  ClientHeight = 159
  ClientWidth = 297
  Caption = ''
  BorderStyle = bsDialog
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 297
    Height = 124
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 1
      Width = 295
      Height = 122
      Hint = ''
      Caption = ' Filter '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object cbCust: TUniCheckBox
        Left = 32
        Top = 47
        Width = 145
        Height = 17
        Hint = ''
        Caption = 'Filter One Customer'
        TabOrder = 0
        OnClick = cbCustClick
      end
      object cbWO: TUniCheckBox
        Left = 12
        Top = 24
        Width = 213
        Height = 17
        Hint = ''
        Caption = 'Filter Items on Work Orders '
        TabOrder = 1
        OnClick = cbWOClick
      end
      object wwCustomer: TUniDBLookupComboBox
        Left = 51
        Top = 69
        Width = 201
        Height = 21
        Hint = ''
        ListField = 'COMPANY'
        ListSource = DataSource1
        KeyField = 'COMPANY'
        ListFieldIndex = 0
        TabOrder = 2
        Color = clWindow
      end
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 124
    Width = 297
    Height = 35
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 90
      Top = 1
      Width = 207
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 1
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 104
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        TabOrder = 2
        OnClick = BtnCancelClick
      end
    end
  end
  object QryArCusto: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select custno,'
      '          company,'
      '          addr1,'
      '          addr2,'
      '          city,'
      '          state'
      '          zip,'
      '          id'
      'from arcusto')
    Left = 30
    Top = 91
  end
  object DataSource1: TDataSource
    DataSet = QryArCusto
    Left = 136
    Top = 80
  end
end
