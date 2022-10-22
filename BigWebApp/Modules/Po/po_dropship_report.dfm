object FrmPODropShipReport: TFrmPODropShipReport
  Left = 388
  Top = 215
  ClientHeight = 201
  ClientWidth = 322
  Caption = 'Drop Ship Reporting'
  OnShow = UniFormShow
  Constraints.MinHeight = 155
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 160
    Width = 322
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 320
      Height = 2
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object Panel2: TUniPanel
      Tag = 1999
      Left = 114
      Top = 3
      Width = 207
      Height = 37
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 0
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
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
  object PnlClient01: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 322
    Height = 160
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 114
      Top = 1
      Width = 6
      Height = 158
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 113
      Height = 158
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 8
        Top = 12
        Width = 42
        Height = 13
        Hint = ''
        Caption = 'Quantity'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 8
        Top = 36
        Width = 70
        Height = 13
        Hint = ''
        Caption = 'Shipment Date'
        TabOrder = 2
      end
      object Label6: TUniLabel
        Left = 8
        Top = 60
        Width = 55
        Height = 13
        Hint = ''
        Caption = 'Trans Code'
        TabOrder = 3
      end
      object Label3: TUniLabel
        Left = 8
        Top = 84
        Width = 26
        Height = 13
        Hint = ''
        Caption = 'Lot #'
        TabOrder = 4
      end
      object lblRecvcDate: TUniLabel
        Left = 8
        Top = 108
        Width = 62
        Height = 13
        Hint = ''
        Caption = 'Receipt Date'
        TabOrder = 5
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 120
      Top = 1
      Width = 201
      Height = 158
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object edQty: TUniEdit
        Left = 0
        Top = 8
        Width = 143
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 0
      end
      object tpShipmentDate: TUniDBDateTimePicker
        Left = 0
        Top = 32
        Width = 143
        Height = 21
        Hint = ''
        DateTime = 42689.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 1
      end
      object wwComboTransCode: TUniDBLookupComboBox
        Left = 0
        Top = 56
        Width = 143
        Height = 21
        Hint = ''
        ListFieldIndex = 0
        TabOrder = 2
        Color = clWindow
      end
      object edLot: TUniEdit
        Left = 0
        Top = 80
        Width = 143
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 3
      end
      object tpRecvDate: TUniDBDateTimePicker
        Left = 0
        Top = 104
        Width = 143
        Height = 21
        Hint = ''
        DateTime = 42689.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 4
      end
      object chkBackflush: TUniCheckBox
        Left = 0
        Top = 127
        Width = 155
        Height = 17
        Hint = 'Include Backflush of Materials'
        ShowHint = True
        ParentShowHint = False
        Caption = 'Include Materials Backflush'
        TabOrder = 5
      end
    end
  end
  object wwQryTransCode: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, code, descrip '
      '  from trans_code'
      ' order by code')
    Left = 225
    Top = 30
    object wwQryTransCodeCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'CODE'
      Origin = 'TRANS_CODE.CODE'
      Size = 10
    end
    object wwQryTransCodeDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'TRANS_CODE.DESCRIP'
      Size = 25
    end
    object wwQryTransCodeID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'TRANS_CODE.ID'
      Visible = False
      Size = 0
    end
  end
end
