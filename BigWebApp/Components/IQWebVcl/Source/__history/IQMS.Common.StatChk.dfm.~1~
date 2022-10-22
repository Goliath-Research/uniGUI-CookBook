object FrmStatusException: TFrmStatusException
  Left = 107
  Top = 172
  ClientHeight = 163
  ClientWidth = 407
  Caption = 'Authorization Required'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TUniPageControl
    Left = 0
    Top = 0
    Width = 407
    Height = 120
    Hint = ''
    ActivePage = TabSheet1
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'Status Exception'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object Label1: TUniLabel
        Left = 4
        Top = 9
        Width = 46
        Height = 13
        Hint = ''
        Caption = 'Customer'
        TabOrder = 3
      end
      object Label3: TUniLabel
        Left = 4
        Top = 34
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'Company'
        TabOrder = 4
      end
      object Label2: TUniLabel
        Left = 4
        Top = 59
        Width = 31
        Height = 13
        Hint = ''
        Caption = 'Status'
        TabOrder = 5
      end
      object DBEdit1: TUniDBEdit
        Left = 57
        Top = 6
        Width = 232
        Height = 19
        Hint = ''
        DataField = 'CUSTNO'
        DataSource = DataSource1
        TabOrder = 0
      end
      object DBEdit2: TUniDBEdit
        Left = 57
        Top = 31
        Width = 232
        Height = 19
        Hint = ''
        DataField = 'COMPANY'
        DataSource = DataSource1
        TabOrder = 1
      end
      object DBEdit3: TUniDBEdit
        Left = 57
        Top = 56
        Width = 232
        Height = 19
        Hint = ''
        DataField = 'STATUS_ID'
        DataSource = DataSource1
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 2
        Color = clRed
      end
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 120
    Width = 407
    Height = 43
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object CheckBox: TUniCheckBox
      Left = 6
      Top = 12
      Width = 129
      Height = 17
      Hint = ''
      Visible = False
      Caption = 'Do not show next time'
      TabOrder = 1
    end
    object Panel2: TUniPanel
      Left = 200
      Top = 1
      Width = 207
      Height = 41
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 1
        Default = True
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Query1: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select custno, company, status_id'
      '  from arcusto'
      ' where id = :id')
    Left = 224
    ParamData = <
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 256
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMSTATUSEXCEPTION')
    SecurityItems.Strings = (
      'btnOK')
    SecurityCode = 'FRMSTATUSEXCEPTION'
    Left = 192
  end
  object QueryBillTo: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.custno, '
      '       a.company, '
      '       b.status_id'
      '  from arcusto a,'
      '       bill_to b '
      ' where b.id = :id'
      '   and b.arcusto_id = a.id')
    Left = 144
    ParamData = <
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
end
